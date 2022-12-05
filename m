Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54264238F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 08:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453196.710861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25st-0002W9-Ai; Mon, 05 Dec 2022 07:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453196.710861; Mon, 05 Dec 2022 07:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p25st-0002UN-81; Mon, 05 Dec 2022 07:27:27 +0000
Received: by outflank-mailman (input) for mailman id 453196;
 Mon, 05 Dec 2022 07:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFyF=4D=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1p25ss-0002UH-AY
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 07:27:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 41cc5edc-746e-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 08:27:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 038F623A;
 Sun,  4 Dec 2022 23:27:28 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5DC03F73D;
 Sun,  4 Dec 2022 23:27:18 -0800 (PST)
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
X-Inumbo-ID: 41cc5edc-746e-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/2] xen/arm: refine vpl011
Date: Mon,  5 Dec 2022 15:26:38 +0800
Message-Id: <20221205072640.2092473-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is the version 5 for "xen/arm: vpl011: Make access to DMACR
write-ignore" [1]. 

[1] https://patchwork.kernel.org/project/xen-devel/patch/20221122054644.1092173-1-jiamei.xie@arm.com/

Thanks,
Jiamei Xie

v4 -> v5
- don't remove "return 1" and add ASSERT_UNREACHABLE
v3 -> v4
- remove the size check for unknown registers in the SBSA UART
- remove lock in read_as_zero
- Don't consolidate check registers access
- Don't remove label read_as_zero
v2 -> v3
- emulate non-SBSA registers as WI/RAZ in default case
- update commit message
v1 -> v2
- print a message using XENLOG_G_DEBUG when it's write-ignore

Jiamei Xie (2):
  xen/arm: vpl011: emulate non-SBSA registers as WI/RAZ
  xen/arm: vpl011: add ASSERT_UNREACHABLE in vpl011_mmio_read

 xen/arch/arm/vpl011.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1


