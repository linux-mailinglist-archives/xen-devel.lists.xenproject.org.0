Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B028E331
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6774.17831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSici-0006AV-Ff; Wed, 14 Oct 2020 15:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6774.17831; Wed, 14 Oct 2020 15:23:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSici-0006A6-CE; Wed, 14 Oct 2020 15:23:28 +0000
Received: by outflank-mailman (input) for mailman id 6774;
 Wed, 14 Oct 2020 15:23:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSicg-0006A1-Bq
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:23:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7cfe2a5-c932-4c91-a1d3-da4d79ee6b05;
 Wed, 14 Oct 2020 15:23:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F2CCB1D1;
 Wed, 14 Oct 2020 15:23:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSicg-0006A1-Bq
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:23:26 +0000
X-Inumbo-ID: a7cfe2a5-c932-4c91-a1d3-da4d79ee6b05
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7cfe2a5-c932-4c91-a1d3-da4d79ee6b05;
	Wed, 14 Oct 2020 15:23:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602689004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YIC64efaetAnRxiHi3KIsJ9+2l2bUj2C43B0/zIIpvo=;
	b=LaWa2AFeHws5Gzpw4+0a8X0VqDGUIFkyHlDYSNd4/lgq5EQ+KHTZB157Ivq9P0+gJNgIgN
	oPxasxtP2z0UdhAce6ZDwpOhcm0srYckBkcvJyEu1OwysCufD7gSdicogKg2ELGFK7BNUu
	7ilnsfxJkzNQDbVJevT2NB10XGLvyWw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3F2CCB1D1;
	Wed, 14 Oct 2020 15:23:24 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen-detect: make CPUID fallback CPUID-faulting aware
Message-ID: <6b594869-1c64-93a3-7f19-f7374b62eeee@suse.com>
Date: Wed, 14 Oct 2020 17:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Relying on presence / absence of hypervisor leaves in raw / escaped
CPUID output cannot be used to tell apart PV and HVM on CPUID faulting
capable hardware. Utilize a PV-only feature flag to avoid false positive
HVM detection.

While at it also short circuit the main detection loop: For PV, only
the base group of leaves can possibly hold hypervisor information.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xen-detect.c
+++ b/tools/misc/xen-detect.c
@@ -83,11 +83,31 @@ static int check_for_xen(int pv_context)
 
         if ( !strcmp("XenVMMXenVMM", signature) && (regs[0] >= (base + 2)) )
             goto found;
+
+        /* Higher base addresses are possible only with HVM. */
+        if ( pv_context )
+            break;
     }
 
     return 0;
 
  found:
+    /*
+     * On CPUID faulting capable hardware even un-escaped CPUID will return
+     * the hypervisor leaves. Need to further distinguish modes.
+     */
+    if ( !pv_context )
+    {
+        /*
+         * XEN_CPUID_FEAT1_MMU_PT_UPDATE_PRESERVE_AD is a PV-only feature
+         * pre-dating CPUID faulting support in Xen. Hence we can use it to
+         * tell whether we shouldn't report "success" to our caller here.
+         */
+        cpuid(base + 2, regs, 0);
+        if ( regs[2] & (1u << 0) )
+            return 0;
+    }
+
     cpuid(base + 1, regs, pv_context);
     if ( regs[0] )
     {

