Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F179B8C6375
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722054.1125879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AgU-0005A2-OK; Wed, 15 May 2024 09:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722054.1125879; Wed, 15 May 2024 09:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AgU-00057i-Kq; Wed, 15 May 2024 09:12:26 +0000
Received: by outflank-mailman (input) for mailman id 722054;
 Wed, 15 May 2024 09:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AgT-00057a-5M
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:12:25 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5b5cf2-129b-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:12:24 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8EBC035323;
 Wed, 15 May 2024 05:12:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 85A2E35322;
 Wed, 15 May 2024 05:12:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id BACBF35321;
 Wed, 15 May 2024 05:12:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 3d5b5cf2-129b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=qFhah2+IM6y4Lo8xEY359yzvT
	fmohoeQSwTfFz6nmRk=; b=eu/PFh/nU5wjH8/eyMA4htpoRljgr5TLhrPQZvP/J
	G+88V7JjokqbK2sBCJp2dJzEH2hY3ds/9POLMCcYD02J77U0idpYupFqgT1krSr4
	BTcHzpRthJVXAJrj7Mmo/8KXZuhrFC01iCkFk8FvDBD8mrbbu/rGPLOjgh7UwSSt
	Ag=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with CONFIG_{SVM/VMX}
Date: Wed, 15 May 2024 12:12:19 +0300
Message-Id: <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3C9B4828-129B-11EF-89AB-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

As we now have SVM/VMX config options for enabling/disabling these featur=
es
completely in the build, it may be feasible to add build-time checks to
cpu_has_{svm,vmx} macros. These are used extensively thoughout HVM code, =
so
we won't have to add extra #ifdef-s to check whether svm/vmx has been ena=
bled,
while DCE cleans up calls to vmx/svm functions, if their code not being b=
uilt.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/cpufeature.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include=
/asm/cpufeature.h
index 9bc553681f..17f5aed000 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
 #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
 #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
-#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
+#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
+                                  boot_cpu_has(X86_FEATURE_VMX))
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
 #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
 #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
@@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
=20
 /* CPUID level 0x80000001.ecx */
 #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
-#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
+#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
+                                  boot_cpu_has(X86_FEATURE_SVM))
 #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
--=20
2.25.1


