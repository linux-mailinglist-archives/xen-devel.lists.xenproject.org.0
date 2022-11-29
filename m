Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62D63B816
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 03:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449213.705864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozqY3-0007b4-Eh; Tue, 29 Nov 2022 02:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449213.705864; Tue, 29 Nov 2022 02:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozqY3-0007YO-BY; Tue, 29 Nov 2022 02:40:39 +0000
Received: by outflank-mailman (input) for mailman id 449213;
 Tue, 29 Nov 2022 02:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSa6=35=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1ozqY2-0007YF-8U
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 02:40:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 33ba0003-6f8f-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 03:40:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0ABD6E;
 Mon, 28 Nov 2022 18:40:41 -0800 (PST)
Received: from a015971.shanghai.arm.com (unknown [10.169.188.104])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E93C73F73B;
 Mon, 28 Nov 2022 18:40:32 -0800 (PST)
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
X-Inumbo-ID: 33ba0003-6f8f-11ed-91b6-6bf2151ebd3b
From: Jiamei Xie <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/2] xen/arm: refine vpl011
Date: Tue, 29 Nov 2022 10:39:33 +0800
Message-Id: <20221129023935.1576133-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch is the version 3 for "xen/arm: vpl011: Make access to DMACR
write-ignore" [1]. 

[1] https://patchwork.kernel.org/project/xen-devel/patch/20221122054644.1092173-1-jiamei.xie@arm.com/

Thanks,
Jiamei Xie

v2 -> v3
- emulate non-SBSA registers as WI/RAZ in default case
- update commit message
- add a patch to drop redundancy in mmio_write/read
v1 -> v2
- print a message using XENLOG_G_DEBUG when it's write-ignore

Jiamei Xie (2):
  xen/arm: vpl011: emulate non-SBSA registers as WI/RAZ
  xen/arm: vpl011: drop redundancy in mmio_write/read

 xen/arch/arm/vpl011.c | 59 +++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

-- 
2.25.1


