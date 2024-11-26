Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFE9D9F9C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844073.1259728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tv-0003Q4-ON; Tue, 26 Nov 2024 23:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844073.1259728; Tue, 26 Nov 2024 23:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tu-0002ym-TK; Tue, 26 Nov 2024 23:23:22 +0000
Received: by outflank-mailman (input) for mailman id 844073;
 Tue, 26 Nov 2024 23:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sj-0000At-DP
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cffca5d-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D57035C5CAB;
 Tue, 26 Nov 2024 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 105EDC4CEDB;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0622ED66B94;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 3cffca5d-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNjZmZjYTVkLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzIxLjgwNDA1LCJzZW5kZXIiOiJkZXZudWxsK2RtdWtoaW4uZm9yZC5jb21Aa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=uX6eDC7J8gnEJzkAK+vFayV4YOh384qGm0SB3/a+eoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BsEhuq5RfoZD+6Kjkcdh+1UmQjETVdTMJ1Y9U2a0BhxSmGuQt3As7TUinDnmaYyM0
	 a/EDKlaWVcGHIPALZNARRp16k+Bpka1H7eVoensrfFmkSbJIRpw8n820Azr+rO/XX8
	 f1ZBp0/a8/OrQ3jlqhuaLMdZXZ0RH9JIpGl18X1stfMdpeAx1JCVRGBS35IG+vMprV
	 jfaF++CEmnMSeRgydRq/zIyjkeCac/v19J4Mmar06ksRwNPiCvMJk46mMQGOmHNS76
	 nQi637/zapqi1Gr/BJstnf0UoyCJYBGv2wEzz1ItMaIB61TnS9z+PbBHSqigwVYi7t
	 vwn9B3n1hM2rA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:01 -0800
Subject: [PATCH 11/36] x86/domain: introduce domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-11-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=889;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=d8+eK1EX7G4dAD9MTJCuZscRKOX31WZGg59AsNpMxsU=;
 b=uKI8dZysavD1G91oDNk8dSTzasbyQi26nDseOFCosloHlC7ztmtSLUYzwhVsG90ns5k9SkWZh
 VllqUfZyW8DC8F6KDfz9apA7MC8TS7TbnCzh9IG3aeseGrwOtJPD6PM
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce domain_has_vuart() for x86 port to be used in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/domain.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c4d96279555df62fad75fe817a2b6..c1d0d1f47324e8cc678a4c76c43f86820a89e7b3 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -506,6 +506,9 @@ struct arch_domain
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
+/* NB: same symbol as in Arm port */
+#define domain_has_vuart(d) false
+
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
 #define pv_gdt_ptes(v) \

-- 
2.34.1



