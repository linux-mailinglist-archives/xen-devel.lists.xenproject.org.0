Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB8A93882
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959031.1351551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYO-00040b-H7; Fri, 18 Apr 2025 14:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959031.1351551; Fri, 18 Apr 2025 14:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYO-0003yq-E5; Fri, 18 Apr 2025 14:18:52 +0000
Received: by outflank-mailman (input) for mailman id 959031;
 Fri, 18 Apr 2025 14:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQT4=XE=bounce.vates.tech=bounce-md_30504962.68025f43.v1-ff9ec6e26c4a44eeab59541f89468aeb@srs-se1.protection.inumbo.net>)
 id 1u5mYM-00030w-Uc
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 14:18:50 +0000
Received: from mail179-46.suw41.mandrillapp.com
 (mail179-46.suw41.mandrillapp.com [198.2.179.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091c0524-1c60-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 16:18:45 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-46.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZfH1b46MXz8XTnbZ
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 14:18:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ff9ec6e26c4a44eeab59541f89468aeb; Fri, 18 Apr 2025 14:18:43 +0000
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
X-Inumbo-ID: 091c0524-1c60-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744985923; x=1745255923;
	bh=nRdWZ+OFAVb8KuCLWbIcI+HAU9u6nYsrEhlOp/952Hw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E161meyqfFty47uDXe+SO1LHAXDvAU+2b1xybJBwXFD/SE+1vEfb603om+Vaqr8wn
	 SL10daLpe5QDbvmIlIUYqyJXi32LXNXJjlPd/IQkZvwf04K1NPXe2LxRx03kGrRNbX
	 iQUKsndj6d20NMa327yf856UXndutlyK50t3iTRO/L+1LpPEHQS6zYHyUGV+5unuNc
	 Y36kKTvny/1FIX0Hv8H4tHkWlgwG1zRaSkoIFqCOqTP0yNKjHxgOp5/1fLOu+plSoR
	 c4rD97iZMHhk7kTtNjty2pjAc45cJBmGWzshE7gh2vQ9LA1s51MK48ZVFcFfODO0aN
	 PzWRY2eQBQaiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744985923; x=1745246423; i=teddy.astie@vates.tech;
	bh=nRdWZ+OFAVb8KuCLWbIcI+HAU9u6nYsrEhlOp/952Hw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BCgFd2ADwTKUM4FimC+vXvp0W4IyyO2C0ocEcahMGw1PJaUfUnFNMi2ZzOl++atoI
	 MSvtnv81NCsYaNBFPV0evCoz/1HCX2kvO9zkZ6mbUyPWMuVomh1Rnjrd4I/RgqWDPk
	 WVtPxyKiaFd5DVSyehH4Sjg0ngafpDRgJyQ57h3Q7wKAjWxlycxSNwT6pfItq7yUve
	 eJKMet/f6QPl02kiG2LAH9vUsFNar0cJqAuykCqwezSDNTWRtbGQMeMew3elkZXm53
	 FHUhH/GyJpdnHJf8r8tvm7q99tmP0F4dZU9dYW/u6kOLH+6TS59Qrg814j5lY9WZuu
	 +RupvBZWsZDTQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=203/4]=20x86/public:=20Expose=20physaddr=5Fabi=20through=20Xen=20HVM=20CPUID=20leaf?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744985922659
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <35adbbb83d59ee0beb7247e9adcdddd133b1dbd8.1744981654.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1744981654.git.teddy.astie@vates.tech>
References: <cover.1744981654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ff9ec6e26c4a44eeab59541f89468aeb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250418:md
Date: Fri, 18 Apr 2025 14:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The guest needs to know this information before attempting to make a hypercall
(especially ones to fetch XENFEAT_*).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpuid.c                | 3 +++
 xen/include/public/arch-x86/cpuid.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8dc68945f7..a721499920 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -153,6 +153,9 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          */
         res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
 
+        /* Indicate if the guest uses the physical addresses hypercall ABI. */
+        if ( is_hvm_physaddr_abi(v->domain) )
+            res->a |= XEN_HVM_CPUID_PHYS_ADDR_ABI;
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249f..b8ceb833d7 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -106,6 +106,8 @@
  * bound to event channels.
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
+/* Hypercalls are using physical addresses instead of linear ones. */
+#define XEN_HVM_CPUID_PHYS_ADDR_ABI    (1u << 7)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


