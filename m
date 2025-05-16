Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F8AB98E2
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986618.1372160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPv-0008BM-Tg; Fri, 16 May 2025 09:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986618.1372160; Fri, 16 May 2025 09:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPv-00088z-QI; Fri, 16 May 2025 09:31:47 +0000
Received: by outflank-mailman (input) for mailman id 986618;
 Fri, 16 May 2025 09:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiQ4=YA=bounce.vates.tech=bounce-md_30504962.682705f9.v1-765e177ef22b48fc8d7dcece54076855@srs-se1.protection.inumbo.net>)
 id 1uFrPu-0007iv-C5
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:46 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955402fb-3238-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:31:45 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKQ0MMFzMQxdjF
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 765e177ef22b48fc8d7dcece54076855; Fri, 16 May 2025 09:31:37 +0000
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
X-Inumbo-ID: 955402fb-3238-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387898; x=1747657898;
	bh=yEIj4vYbaqS4Y1WKd4I6vOFuJvvhA1ynFIt3vpuTIg0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uypxcY/kQP2Oej6nzc4EhhNRyNzUNO31XCilUP9I2f3Vew0ZJe1lPDrIIJMjfn4sv
	 WfLw4mypDQ1KMK6CJ8jgWXFD5sr67Ww3ZaaCfyCG15fMvZL9UJvvoMmz+TBHJfv5D9
	 kO+X/1HkZCkXQ5RnNqJAxyBpLge9iZUpoVgkGh6DooOSg23TpLRXBLDoURXYhsKNXO
	 DjzCP42l2zYin81l75ofZFG7h0zGUbh8fS3e9ThjVr2OaUEAEQiLHHYLfCDSDsicQ9
	 Iom79SpSXl128fdLuSlPBZkI52RWLzho2zgImsSfjT2mouHORo2H6GUGgJqWPrZsFt
	 1akqZMw5mYYvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387898; x=1747648398; i=teddy.astie@vates.tech;
	bh=yEIj4vYbaqS4Y1WKd4I6vOFuJvvhA1ynFIt3vpuTIg0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vH7sVi9DcWiyQXD5rAK1LnKqQKB53q+nzchgrgzTpZpR+GEUhR0tSg8Kggko6MSGU
	 ayuqNYQ6WoZv3AVek9oVBu8L8Ch11AUY0MRXW5ZQKLm5tyVLVObZd1V/UyOux3DL8W
	 C+310DuIIKQ1xnOnPwtzD32lFmV//zXm8B1Si7RmTSqBeqGS7WzbUVWOq1WH1YYWLW
	 gJox0eyqhDfJd8dLJRl/lW0R5gKG+C4sngKrvQ5lslAln+p2WIeLeyYXC0v9gWMXft
	 7HRNP5vAi/4S+dRcgBTS461bUZpjmBz/SF7M4YnV8RiVefYlcDLyk40AujHO3dZQMF
	 Tl+zqdua+2uSQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2004/16]=20x86/public:=20Expose=20physaddr=5Fabi=20through=20Xen=20HVM=20CPUID=20leaf?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387897112
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <c62a09813efbc7416c7ac48b10c6e3003b8a95fa.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.765e177ef22b48fc8d7dcece54076855?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpuid.c                | 2 ++
 xen/include/public/arch-x86/cpuid.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8dc68945f7..e2d94619c2 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -153,6 +153,8 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          */
         res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
 
+        /* Indicate that guest can the physical addresses hypercall ABI. */
+        res->a |= XEN_HVM_CPUID_PHYS_ADDR_ABI;
         break;
 
     case 5: /* PV-specific parameters */
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249f..5405bf6fbd 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -106,6 +106,8 @@
  * bound to event channels.
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
+/* Hypercalls can use physical addresses instead of linear ones. */
+#define XEN_HVM_CPUID_PHYS_ADDR_ABI    (1u << 7)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


