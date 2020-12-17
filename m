Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED82DD0ED
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 12:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55879.97491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpru4-0006He-Hx; Thu, 17 Dec 2020 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55879.97491; Thu, 17 Dec 2020 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpru4-0006HF-Ei; Thu, 17 Dec 2020 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 55879;
 Thu, 17 Dec 2020 11:57:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpru3-0006HA-0g
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 11:57:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 049d03ae-6f80-4855-a93f-520094822715;
 Thu, 17 Dec 2020 11:57:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C064AC7F;
 Thu, 17 Dec 2020 11:57:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 049d03ae-6f80-4855-a93f-520094822715
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608206221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JZRIRuR7hZ2IMcHzjNWlwLpR2F1Sh0DoTu8N940Vr6E=;
	b=l0i+HfEOZP5q7C6UBm2c1CiQNlQiZYo0xTfeJMLTe2PZH4PcvmOACCvkoT85uZ2s8BElnI
	Kg+Syizm3b73YaK7hdJG3JcYDbdAko7pXx6K/1UcaC0w5H6dF9yj4s5r272y4YO9mjA/60
	mE6HrLpr0dZWygpJZBWi+T2n/USgRFA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xsm/dummy: harden against speculative abuse
Message-ID: <34833712-93d9-1b4e-1ebf-9df5ea93d19f@suse.com>
Date: Thu, 17 Dec 2020 12:57:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

First of all don't open-code is_control_domain(), which is already
suitably using evaluate_nospec(). Then also apply this construct to the
other paths of xsm_default_action(). Also guard two paths not using this
function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the functions are always_inline I'm not entirely certain we can
get away with doing this inside of them, rather than in the callers. It
will certainly take more to also guard builds with non-dummy XSM.

--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -76,20 +76,20 @@ static always_inline int xsm_default_act
     case XSM_HOOK:
         return 0;
     case XSM_TARGET:
-        if ( src == target )
+        if ( evaluate_nospec(src == target) )
         {
             return 0;
     case XSM_XS_PRIV:
-            if ( is_xenstore_domain(src) )
+            if ( evaluate_nospec(is_xenstore_domain(src)) )
                 return 0;
         }
         /* fall through */
     case XSM_DM_PRIV:
-        if ( target && src->target == target )
+        if ( target && evaluate_nospec(src->target == target) )
             return 0;
         /* fall through */
     case XSM_PRIV:
-        if ( src->is_privileged )
+        if ( !is_control_domain(src) )
             return 0;
         return -EPERM;
     default:
@@ -656,7 +656,7 @@ static XSM_INLINE int xsm_mmu_update(XSM
     XSM_ASSERT_ACTION(XSM_TARGET);
     if ( f != dom_io )
         rc = xsm_default_action(action, d, f);
-    if ( t && !rc )
+    if ( evaluate_nospec(t) && !rc )
         rc = xsm_default_action(action, d, t);
     return rc;
 }
@@ -750,6 +750,7 @@ static XSM_INLINE int xsm_xen_version (X
     case XENVER_platform_parameters:
     case XENVER_get_features:
         /* These sub-ops ignore the permission checks and return data. */
+        block_speculation();
         return 0;
     case XENVER_extraversion:
     case XENVER_compile_info:

