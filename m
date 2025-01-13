Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB238A0C058
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 19:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870835.1281904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXPOk-0006qi-6Z; Mon, 13 Jan 2025 18:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870835.1281904; Mon, 13 Jan 2025 18:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXPOk-0006p5-3L; Mon, 13 Jan 2025 18:42:50 +0000
Received: by outflank-mailman (input) for mailman id 870835;
 Mon, 13 Jan 2025 18:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=van2=UF=bounce.vates.tech=bounce-md_30504962.67855ea4.v1-90261c6b92024aab9ae729686576b553@srs-se1.protection.inumbo.net>)
 id 1tXPOi-0006oz-Kq
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 18:42:48 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc106be-d1de-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 19:42:46 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YX1N45FqpzGlsp1y
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 18:42:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 90261c6b92024aab9ae729686576b553; Mon, 13 Jan 2025 18:42:44 +0000
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
X-Inumbo-ID: 2dc106be-d1de-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736793764; x=1737054264;
	bh=wg+x7oaTzShFDXw6vWNN7FZ7vOdFvBqAnQZMBsAgMMc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=WbmG/egTqkRPEeiavbuDYgKp2RTQQBAvZt9xS3hP3dXQVacRO8LVNCzYwjeC37WjV
	 ryQnFlfKe2UM9rrz2e8lGsTFAQyZ2yfFgyUcuWs+raY9ERp6o2PWavtEJ2CPu/lclT
	 X8NRFnFbmCVm+LsZ3Z0kFAO01uX0DISnE/JBAur7pm/kL4+prPxsWnIuQFACZbFRwf
	 M6THGHfxbpZhWQmBgxUGFFIA9NDCncnuF83sSH3yDI3gzsz7bsh2OFJ4rjLQGedqfk
	 YqPCxokQ7c9Rwr1vq316a3/8bWDVQcWbpeVzojgdJtoEFuuUPTd5QmJiam+ukvNq5i
	 Y19PQb+i055ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736793764; x=1737054264; i=teddy.astie@vates.tech;
	bh=wg+x7oaTzShFDXw6vWNN7FZ7vOdFvBqAnQZMBsAgMMc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=X2ZP00huqKE4HYHIQErcoTn1XH0/lD8de53+0JJ5T827vkYF4NWRk3+Xspd2kZepG
	 yUHIQDAUGnZHREbwq70zo45i6MKxVQSvuzBJNoISFYC49J0VHAaS2MF9Ec1oEYxAEx
	 CeWwBiY5IxW1G/chciQDGR2TJSNY1iUlOiYGwaaXIgXo7TYOFvqjP9oPglUiC8EK6M
	 eb5sjIW3fBpQHbv6Q77LYz31qEcOwTGS6xB7AxMxMs1isD8ma+niAyy92Y8zEkwCBE
	 8Y7f6KTIv/2+r4cmTzclE+rf9ypF/YpKnx6PcDA68Sx+OAdGLV0psANg71ymEsFmVP
	 uXFq+ykEY2mfQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20intel/msr:=20Fix=20handling=20of=20MSR=5FRAPL=5FPOWER=5FUNIT?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736793763637
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.90261c6b92024aab9ae729686576b553?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250113:md
Date: Mon, 13 Jan 2025 18:42:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Solaris 11.4 tries to access this MSR on some Intel platforms without properly
setting up a proper #GP handler, which leads to a immediate crash.

Emulate the access of this MSR by giving it a legal value (all values set to
default, as defined by Intel SDM "RAPL Interfaces").

Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Does it have a risk of negatively affecting other operating systems expecting
this MSR read to fail ?
---
 xen/arch/x86/include/asm/msr-index.h |  2 ++
 xen/arch/x86/msr.c                   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b2625..2adcdf344f 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -144,6 +144,8 @@
 #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
 #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
 
+#define MSR_RAPL_POWER_UNIT                 0x00000606
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 289cf10b78..b14d42dacf 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,6 +169,22 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
             break;
         goto gp_fault;
+    
+        /*
+         * Solaris 11.4 DomU tries to use read this MSR without setting up a
+         * proper #GP handler leading to a crash. Emulate this MSR by giving a
+         * legal value.
+         */
+    case MSR_RAPL_POWER_UNIT:
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+            goto gp_fault;
+
+        /*
+         * Return a legal register content with all default values defined in
+         * Intel Architecture Software Developer Manual 16.10.1 RAPL Interfaces
+         */
+        *val = 0x0000A1003;
+        break;
 
     case MSR_IA32_THERM_STATUS:
         if ( cp->x86_vendor != X86_VENDOR_INTEL )
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

