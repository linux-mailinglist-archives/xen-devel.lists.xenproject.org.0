Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1E8D8161
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734889.1141019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5zw-00032l-Tc; Mon, 03 Jun 2024 11:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734889.1141019; Mon, 03 Jun 2024 11:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5zw-00030t-Q0; Mon, 03 Jun 2024 11:37:08 +0000
Received: by outflank-mailman (input) for mailman id 734889;
 Mon, 03 Jun 2024 11:37:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5zv-00030l-Mv
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:37:07 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d37f8a-219d-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:37:05 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 17FD02757B;
 Mon,  3 Jun 2024 07:37:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id F09AD2757A;
 Mon,  3 Jun 2024 07:37:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 44D8E27575;
 Mon,  3 Jun 2024 07:36:59 -0400 (EDT)
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
X-Inumbo-ID: 99d37f8a-219d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=7Gq+t0OokvjjzhsPQkQvhI7mb
	2EvEEH35F6GhZjfg/Q=; b=Z6WeutNbTMOXpf6MofM8KMl6ERm9hr1ZeKo1TPN5E
	rzk2K8HuLoSmf1yFjs4qaKhpp4XbHSBhnZseVu40dRX3foipQPm1BhyJtKRfaIlG
	9vDwEMGAhQ57JZdo/ZEHm/1wjBSnB/ikyqNFJCSMCHm0t6wa87dO3iZ+qRDYGo/q
	xo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v3 15/16] x86/vmx: replace CONFIG_HVM with CONFIG_VMX in vmx.h
Date: Mon,  3 Jun 2024 14:36:56 +0300
Message-Id: <9a1d4a9af373ff7164c20b9774eea5249af60b01.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9740F190-219D-11EF-B366-ACC938F0AE34-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

As now we got a separate config option for VMX which itself depends on
CONFIG_HVM, we need to use it to provide vmx_pi_hooks_{assign,deassign}
stubs for case when VMX is disabled while HVM is enabled.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
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


