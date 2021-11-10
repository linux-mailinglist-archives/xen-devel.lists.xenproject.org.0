Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BE44CAE6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 21:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224461.387742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkudX-0004SV-3c; Wed, 10 Nov 2021 20:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224461.387742; Wed, 10 Nov 2021 20:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkudX-0004QW-03; Wed, 10 Nov 2021 20:56:03 +0000
Received: by outflank-mailman (input) for mailman id 224461;
 Wed, 10 Nov 2021 20:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3iD=P5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkudV-0004QQ-J3
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 20:56:01 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9abed4ea-4268-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 21:55:59 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7722660F9E;
 Wed, 10 Nov 2021 20:55:57 +0000 (UTC)
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
X-Inumbo-ID: 9abed4ea-4268-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636577757;
	bh=QG21js8um63uDNzMq78czGQSSHxcpPkPxozWL0pwq90=;
	h=From:To:Cc:Subject:Date:From;
	b=TnHG4meTexFAOJHdh86b/sUsOz2BF863LPizP6RLwgQ4I8EAcLWv9jh02UTQOPvR9
	 eURfL92JfpRp8sjqV9bEMDGrUxlKZSUL7sS9BuCGk0V2OWOeJagBqOh7DpamhjJNiT
	 UGjqoWAnmLGJXh1QeCKS/xYNVxzi1pv4LheNUv56UILFivQPoxMwRPu5+2Z6BGqJrs
	 7NIsOiUJgXZCwv2ZqZv9n57vtoEC67bcF/e0MHTzABEzGzkz5QnNpe9yrCkRpgqIih
	 cLnuSoXUJR3AG9iifwjWGeAXrjSensElStK3O3jjX8lAo+C35kfmhG/eMVZhR/mf3b
	 5G8/RrapmWOMg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	oleksandr_tyshchenko@epam.com,
	iwj@xenproject.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 for-4.16] xen/arm: allocate_bank_memory: don't create memory banks of size zero
Date: Wed, 10 Nov 2021 12:55:55 -0800
Message-Id: <20211110205555.945026-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

allocate_bank_memory can be called with a tot_size of zero, as an
example see the implementation of allocate_memory which can call
allocate_bank_memory with a tot_size of zero for the second memory bank.

If tot_size == 0, don't create an empty memory bank, just return
immediately without error. Otherwise a zero-size memory bank will be
added to the domain device tree.

Note that Linux is known to be able to cope with zero-size memory banks,
and Xen more recently gained the ability to do so as well (5a37207df520
"xen/arm: bootfdt: Ignore empty memory bank"). However, there might be
other non-Linux OSes that are not able to cope with empty memory banks
as well as Linux (and now Xen). It would be more robust to avoid
zero-size memory banks unless required.

Moreover, the code to find empty address regions in make_hypervisor_node
in Xen is not able to cope with empty memory banks today and would
result in a Xen crash. This is only a latent bug because
make_hypervisor_node is only called for Dom0 at present and
allocate_memory is only called for DomU at the moment. (But if
make_hypervisor_node was to be called for a DomU, then the Xen crash
would become manifest.)

Fixes: f2931b4233ec ("xen/arm: introduce allocate_memory")
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- improve commit message
- add in-code comment

In regards to inclusion in 4.16.

If we don't fix this issue in 4.16, default usage of Xen+Linux won't be
affected.

However:
- Non-Linux OSes that cannot cope with zero-size memory banks could
  error out. I am not aware of any but there are so many out there in
  embedded it is impossible to tell.
- downstream Xen calling make_hypervisor_node for DomUs will crash
- future Xen calling make_hypervisor_node for DomUs will have to make
  sure to fix this anyway

If we commit the patch in 4.16, we fix these issue. This patch is only 2
lines of code and very easy to review. The risk is extremely low.

Difficult to say what mistakes could have been made in analysis and
preparation because it is a trivial if-zero-return patch, which is
likely to fix latent bugs rather than introducing instability.

---
 xen/arch/arm/domain_build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9e92b640cd..fe38a7c73c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -395,6 +395,14 @@ static bool __init allocate_bank_memory(struct domain *d,
     struct membank *bank;
     unsigned int max_order = ~0;
 
+    /*
+     * allocate_bank_memory can be called with a tot_size of zero for
+     * the second memory bank. It is not an error and we can safely
+     * avoid creating a zero-size memory bank.
+     */
+    if ( tot_size == 0 )
+        return true;
+
     bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
     bank->start = gfn_to_gaddr(sgfn);
     bank->size = tot_size;
-- 
2.25.1


