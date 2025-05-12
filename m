Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867DAB46D3
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 23:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982202.1368752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEb6y-0000fF-7P; Mon, 12 May 2025 21:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982202.1368752; Mon, 12 May 2025 21:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEb6y-0000d7-4G; Mon, 12 May 2025 21:55:00 +0000
Received: by outflank-mailman (input) for mailman id 982202;
 Mon, 12 May 2025 21:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEb6w-0000d1-Bu
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 21:54:58 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd937136-2f7b-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 23:54:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E26A61149;
 Mon, 12 May 2025 21:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F55C4CEE7;
 Mon, 12 May 2025 21:54:53 +0000 (UTC)
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
X-Inumbo-ID: bd937136-2f7b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086894;
	bh=4x5B7a6fKHJMZ6PV1sqoeNUXHRhVpSMgwJruLge+DnE=;
	h=Date:From:To:cc:Subject:From;
	b=cjowzAc1Bm9WvC1MWYxn1GIzVoJp+m9oyobRRF320RFUBrrjFHP8WRpdhPwVBJwZA
	 FKgC6cYHcI9ADKhSsfPDoW91bPrC6XaJVW8xDQ2Y1ivcINO6yLGZpyikJx33h2/IlW
	 UGZZF3suvOx3LgRqevAXylKs4FVuRwmaBoze7Fkfe30h6nCOd1Aupuk6w6Wzi3y4CV
	 Dv/aUlaXrFzPf/drEwwyjtQKdFeSyr/j0wP3K0YKyMlwceAcLTPj6BbdJIMbCDFSOM
	 Ddbgqpayyw4QNij8YeJh5oo4i3jCnVv/6cRmrcYINGbVIW3GVXxcck02s17H4RF2G9
	 D89Bzt4LKr+nA==
Date: Mon, 12 May 2025 14:54:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    linux-kernel@vger.kernel.org, stable@kernel.org
Subject: [PATCH] xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
Message-ID: <alpine.DEB.2.22.394.2505121446370.8380@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Stefano Stabellini <stefano.stabellini@amd.com>

dm_op hypercalls might come from userspace and pass memory addresses as
parameters. The memory addresses typically correspond to buffers
allocated in userspace to hold extra hypercall parameters.

On ARM, when CONFIG_ARM64_SW_TTBR0_PAN is enabled, they might not be
accessible by Xen, as a result ioreq hypercalls might fail. See the
existing comment in arch/arm64/xen/hypercall.S regarding privcmd_call
for reference.

For privcmd_call, Linux calls uaccess_ttbr0_enable before issuing the
hypercall thanks to commit 9cf09d68b89a. We need to do the same for
dm_op. This resolves the problem.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Fixes: 9cf09d68b89a ("arm64: xen: Enable user access before a privcmd
hvc call")
Cc: stable@kernel.org
---
 arch/arm64/xen/hypercall.S | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/xen/hypercall.S b/arch/arm64/xen/hypercall.S
index 9d01361696a14..691ca70407c57 100644
--- a/arch/arm64/xen/hypercall.S
+++ b/arch/arm64/xen/hypercall.S
@@ -83,7 +83,26 @@ HYPERCALL3(vcpu_op);
 HYPERCALL1(platform_op_raw);
 HYPERCALL2(multicall);
 HYPERCALL2(vm_assist);
-HYPERCALL3(dm_op);
+
+SYM_FUNC_START(HYPERVISOR_dm_op)
+	mov x16, #__HYPERVISOR_dm_op;	\
+	/*
+	 * dm_op hypercalls are issued by the userspace. The kernel needs to
+	 * enable access to TTBR0_EL1 as the hypervisor would issue stage 1
+	 * translations to user memory via AT instructions. Since AT
+	 * instructions are not affected by the PAN bit (ARMv8.1), we only
+	 * need the explicit uaccess_enable/disable if the TTBR0 PAN emulation
+	 * is enabled (it implies that hardware UAO and PAN disabled).
+	 */
+	uaccess_ttbr0_enable x6, x7, x8
+	hvc XEN_IMM
+
+	/*
+	 * Disable userspace access from kernel once the hyp call completed.
+	 */
+	uaccess_ttbr0_disable x6, x7
+	ret
+SYM_FUNC_END(HYPERVISOR_dm_op);
 
 SYM_FUNC_START(privcmd_call)
 	mov x16, x0
-- 
2.25.1


