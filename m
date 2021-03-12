Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AA3386DC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 08:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96873.183733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcds-0007JQ-UI; Fri, 12 Mar 2021 07:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96873.183733; Fri, 12 Mar 2021 07:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcds-0007J5-Qk; Fri, 12 Mar 2021 07:55:28 +0000
Received: by outflank-mailman (input) for mailman id 96873;
 Fri, 12 Mar 2021 07:55:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKcdr-0007Iw-QL
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 07:55:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a0919ba-7553-4536-bdf4-56da87783299;
 Fri, 12 Mar 2021 07:55:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77D18AEBD;
 Fri, 12 Mar 2021 07:55:26 +0000 (UTC)
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
X-Inumbo-ID: 0a0919ba-7553-4536-bdf4-56da87783299
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615535726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFrMh+sBcKyoQb7P1wDYHd/74ZilGORQiERspE6maW0=;
	b=KtRStRZOrHCb5Rt5wy5ejseMiiAj5FHplLDzGS073uFJHjNfYG35dR0ItdR1XSDeeAfg4D
	SrEhhS7/lar4n3MPM+bPdS2SQrYX+WW5atT61RjslCXNi0w5Nn+m24Abvt2sHjocRbEGrP
	SO14KwmWzHMIRYoo/cNfUl7oGqAUpdU=
Subject: [PATCH v3 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
Message-ID: <414cceb7-003b-527d-7472-447be325dc14@suse.com>
Date: Fri, 12 Mar 2021 08:55:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Linux has been warning ("firmware bug") about this bit being clear for a
long time. While writable in older hardware it has been readonly on more
than just most recent hardware. For simplicitly report it always set (if
anything we may want to log the issue ourselves if it turns out to be
clear on older hardware) on CPU families 10h and up (in family 0fh the
bit is part of a larger field of different purpose).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Report 0 for Fam0F.
v2: New.
---
There are likely more bits worthwhile to expose, but for about every one
of them there would be the risk of a lengthy discussion, as there are
clear downsides to exposing such information. The more that it would be
tbd whether the hardware values should be surfaced, and if so what
should happen when the guest gets migrated.

The main risk with making the read not fault here is that guests might
imply they can also write this MSR then.

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -315,6 +315,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_K8_HWCR:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
+               ? K8_HWCR_TSC_FREQ_SEL : 0;
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


