Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835F32E546
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 10:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93552.176519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI76n-00018Y-Iz; Fri, 05 Mar 2021 09:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93552.176519; Fri, 05 Mar 2021 09:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI76n-00017y-FH; Fri, 05 Mar 2021 09:50:57 +0000
Received: by outflank-mailman (input) for mailman id 93552;
 Fri, 05 Mar 2021 09:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI76m-00017n-EE
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 09:50:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64d0340a-96d8-40c6-ad1f-325e59c9d747;
 Fri, 05 Mar 2021 09:50:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFC80AC54;
 Fri,  5 Mar 2021 09:50:54 +0000 (UTC)
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
X-Inumbo-ID: 64d0340a-96d8-40c6-ad1f-325e59c9d747
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614937854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVKZh3/uSm8Vy987gAiUz/PvmulFvmzd8DFcMeXDKGs=;
	b=e21orVpX69D7jTX+qIfU6PX6lNvENMOiZFA7ZoLY9XmkYAjL7yCfFbFCVKU5PdAgpnTv0C
	dreT/pwo4nSEK2beUWLl5SDmW3n1vpgZmygumBC25+kqw1S8alzHZGSHp0luEls4IaQDzz
	9fRy+baDOQCn5G/a3hV4giGXMduaCGY=
Subject: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
Message-ID: <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
Date: Fri, 5 Mar 2021 10:50:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Linux has been warning ("firmware bug") about this bit being clear for a
long time. While writable in older hardware it has been readonly on more
than just most recent hardware. For simplicitly report it always set (if
anything we may want to log the issue ourselves if it turns out to be
clear on older hardware).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
There are likely more bits worthwhile to expose, but for about every one
of them there would be the risk of a lengthy discussion, as there are
clear downsides to exposing such information, the more that it would be
tbd whether the hardware values should be surfaced, and if so what
should happen when the guest gets migrated.

The main risk with making the read not fault here is that guests might
imply they can also write this MSR then.

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -315,6 +315,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_K8_HWCR:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        *val = K8_HWCR_TSC_FREQ_SEL;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -287,6 +287,8 @@
 
 #define MSR_K7_HWCR			0xc0010015
 #define MSR_K8_HWCR			0xc0010015
+#define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
+
 #define MSR_K7_FID_VID_CTL		0xc0010041
 #define MSR_K7_FID_VID_STATUS		0xc0010042
 #define MSR_K8_PSTATE_LIMIT		0xc0010061


