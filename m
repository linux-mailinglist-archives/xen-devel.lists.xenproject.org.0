Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FE193B080
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 13:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764134.1174469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaMA-0001Lr-4o; Wed, 24 Jul 2024 11:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764134.1174469; Wed, 24 Jul 2024 11:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaMA-0001JY-23; Wed, 24 Jul 2024 11:40:30 +0000
Received: by outflank-mailman (input) for mailman id 764134;
 Wed, 24 Jul 2024 11:40:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9X1=OY=actia.se=jonas.blixt@srs-se1.protection.inumbo.net>)
 id 1sWaM8-0001JS-Sx
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 11:40:28 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8544efd4-49b1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 13:40:26 +0200 (CEST)
Received: from W388ANL (10.12.12.26) by S035ANL.actianordic.se (10.12.31.116)
 with Microsoft SMTP Server id 15.1.2507.39;
 Wed, 24 Jul 2024 13:40:25 +0200
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
X-Inumbo-ID: 8544efd4-49b1-11ef-8776-851b0ebba9a2
Date: Wed, 24 Jul 2024 13:40:21 +0200
From: Jonas Blixt <jonas.blixt@actia.se>
To: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
CC: <john.ernberg@actia.se>
Subject: xen: arm64: Poor block device performance
Message-ID: <ZqDoJQ+HTfjc0SZO@W388ANL>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.12.12.26]
X-EsetResult: clean, is OK
X-EsetId: 37303A2956B14454677361

Hello,

I'm investigating a block device performance issue on our system.

Our setup is as follows:
SoC: NXP IMX8DXP (arm64), Dual core Cortex A35
Flash: eMMC, HS400
Xen 4.18.1
Dom0 kernel: 6.1.55
DomU kernel: 6.1.14

Dom0 has two vcpu's and domU has one. We're using the xen-blkfront/back drivers to expose block devices to domU.

We measure the following using a simple 'dd' -test (echo 3 > /proc/sys/vm/drop_caches && time dd if=/dev/XXX  of=/dev/null bs=1M count=64):

Directly on the eMMC block device in dom 0: 160 MByte/s
On xvd device in domU: 9.5 MByte/s

Ram block device in dom0: 460 MByte/s
On xvd device in domU: 246 MByte/s

The difference between the ram block device and the eMMC might suggest that there is some interaction between the xenblk driver and the mmc driver that causes this performance degradation. I'm not sure what to expect with the ram device but it at least does not have the same penalty.

I would appreciate any help or suggestions on how to debug this. Is 'blktrace' the right tool for this job and what should I look for?

Best Regards
Jonas

