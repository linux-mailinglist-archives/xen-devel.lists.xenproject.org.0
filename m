Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6101635D4D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 13:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447548.703909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp5v-0005Zz-W0; Wed, 23 Nov 2022 12:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447548.703909; Wed, 23 Nov 2022 12:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxp5v-0005Xn-Ss; Wed, 23 Nov 2022 12:43:15 +0000
Received: by outflank-mailman (input) for mailman id 447548;
 Wed, 23 Nov 2022 12:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZVx=3X=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1oxp5u-0005Hq-7y
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 12:43:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 632d6ccc-6b2c-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 13:43:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3741861CAE;
 Wed, 23 Nov 2022 12:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094C4C433C1;
 Wed, 23 Nov 2022 12:43:08 +0000 (UTC)
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
X-Inumbo-ID: 632d6ccc-6b2c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669207389;
	bh=RW4HlKrC8HJ1IjGXRBDcvUafv7RxhxgfYV7vWL5KbOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QK2zB+gHR4+h9XhfKkMLLNszNfc15wiSUlVRPPvnVU54dtWOPTeS91lrVPgCWLeYe
	 LvtlVSfWgDCG/MLDYu0mmwkV0NE22KenT4qVUx0aLkamRWY8f8u5TPNqagOdeKUh6f
	 +xe47da3M9R+1xbAYs23vsb3BxHsaspyxAkYnbEPUnzvCcHhskvycRNff1rQ7rx8df
	 RGLc6X3YY82wsnEF2GShhLRjQ+MaLSClmrQStP0zQKEBwHw2mlGZ3zEo14bblSPyj/
	 iqBnKE4pE6WLkZrK/2UoaPUj/jLjFAIXlPxqYWQx/hPAwJayjXQWZA0s+vbJJ9GBWB
	 kcgr0tKJ2Zh+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.15 13/31] xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL too
Date: Wed, 23 Nov 2022 07:42:14 -0500
Message-Id: <20221123124234.265396-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124234.265396-1-sashal@kernel.org>
References: <20221123124234.265396-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

[ Upstream commit 5e29500eba2aa19e1323df46f64dafcd4a327092 ]

When Xen domain configures MSI-X, the usual approach is to enable MSI-X
together with masking all of them via the config space, then fill the
table and only then clear PCI_MSIX_FLAGS_MASKALL. Allow doing this via
QEMU running in a stub domain.

Previously, when changing PCI_MSIX_FLAGS_MASKALL was not allowed, the
whole write was aborted, preventing change to the PCI_MSIX_FLAGS_ENABLE
bit too.

Note the Xen hypervisor intercepts this write anyway, and may keep the
PCI_MSIX_FLAGS_MASKALL bit set if it wishes to. It will store the
guest-requested state and will apply it eventually.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Link: https://lore.kernel.org/r/20221114103110.1519413-1-marmarek@invisiblethingslab.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/xen-pciback/conf_space_capability.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
index 5e53b4817f16..097316a74126 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -190,13 +190,16 @@ static const struct config_field caplist_pm[] = {
 };
 
 static struct msi_msix_field_config {
-	u16          enable_bit; /* bit for enabling MSI/MSI-X */
-	unsigned int int_type;   /* interrupt type for exclusiveness check */
+	u16          enable_bit;   /* bit for enabling MSI/MSI-X */
+	u16          allowed_bits; /* bits allowed to be changed */
+	unsigned int int_type;     /* interrupt type for exclusiveness check */
 } msi_field_config = {
 	.enable_bit	= PCI_MSI_FLAGS_ENABLE,
+	.allowed_bits	= PCI_MSI_FLAGS_ENABLE,
 	.int_type	= INTERRUPT_TYPE_MSI,
 }, msix_field_config = {
 	.enable_bit	= PCI_MSIX_FLAGS_ENABLE,
+	.allowed_bits	= PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL,
 	.int_type	= INTERRUPT_TYPE_MSIX,
 };
 
@@ -229,7 +232,7 @@ static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 new_value,
 		return 0;
 
 	if (!dev_data->allow_interrupt_control ||
-	    (new_value ^ old_value) & ~field_config->enable_bit)
+	    (new_value ^ old_value) & ~field_config->allowed_bits)
 		return PCIBIOS_SET_FAILED;
 
 	if (new_value & field_config->enable_bit) {
-- 
2.35.1


