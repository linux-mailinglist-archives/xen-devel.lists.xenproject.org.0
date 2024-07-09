Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792F92AFD7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755813.1164300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR44X-0001qM-S4; Tue, 09 Jul 2024 06:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755813.1164300; Tue, 09 Jul 2024 06:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR44X-0001ni-Pb; Tue, 09 Jul 2024 06:11:29 +0000
Received: by outflank-mailman (input) for mailman id 755813;
 Tue, 09 Jul 2024 06:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR44W-0001nZ-DL
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:11:28 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12cb4bbf-3dba-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:11:26 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id B7D0427215;
 Tue,  9 Jul 2024 02:11:25 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id AF39527214;
 Tue,  9 Jul 2024 02:11:25 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id CFCA727213;
 Tue,  9 Jul 2024 02:11:24 -0400 (EDT)
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
X-Inumbo-ID: 12cb4bbf-3dba-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=J28BmUC9XkwRwgOIlqfahU9nc
	wSpzZpKk8zf3xzLqjA=; b=iGFicwm/Q1Wh+dUhWeptMpNgGF+1/z8v9wTBS1seV
	TZNrt+HcJRbVKqH+GrzZBuP6xmEqUfY5WVOtsbzzB8JrVG1y1hgJN/chOpcl4MZJ
	SkSqTvHS8ZKL9G1SQ+2e1zqDv1ASWlsHa49sdEI669OO0QtkUf0BlotnkLzF48fL
	tQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v4 13/14] x86/vmx: replace CONFIG_HVM with CONFIG_VMX in vmx.h
Date: Tue,  9 Jul 2024 09:11:20 +0300
Message-Id: <75c4f38c1d598fa751a75b7c5b11ce2e5b08df6d.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 121A3254-3DBA-11EF-B89C-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

As now we got a separate config option for VMX which itself depends on
CONFIG_HVM, we need to use it to provide vmx_pi_hooks_{assign,deassign}
stubs for case when VMX is disabled while HVM is enabled.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - added tag
changes in v3:
 - use CONFIG_VMX instead of CONFIG_HVM to provide stubs, instead of guar=
ding
   calls to vmx_pi_hooks_{assign,deassign} in iommu/vt-d code
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/includ=
e/asm/hvm/vmx/vmx.h
index 1489dd05c2..025bec2321 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -599,7 +599,7 @@ void vmx_pi_desc_fixup(unsigned int cpu);
=20
 void vmx_sync_exit_bitmap(struct vcpu *v);
=20
-#ifdef CONFIG_HVM
+#ifdef CONFIG_VMX
 void vmx_pi_hooks_assign(struct domain *d);
 void vmx_pi_hooks_deassign(struct domain *d);
 #else
--=20
2.25.1


