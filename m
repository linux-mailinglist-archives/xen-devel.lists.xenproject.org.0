Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82E6AA5FA
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 00:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506259.779398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFH4-0002Fy-N4; Fri, 03 Mar 2023 23:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506259.779398; Fri, 03 Mar 2023 23:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFH4-0002DB-Jj; Fri, 03 Mar 2023 23:57:18 +0000
Received: by outflank-mailman (input) for mailman id 506259;
 Fri, 03 Mar 2023 23:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYFH3-0002D5-4D
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 23:57:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e998c46-ba1f-11ed-a550-8520e6686977;
 Sat, 04 Mar 2023 00:57:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BCDB61984;
 Fri,  3 Mar 2023 23:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0691CC433D2;
 Fri,  3 Mar 2023 23:57:11 +0000 (UTC)
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
X-Inumbo-ID: 1e998c46-ba1f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677887832;
	bh=3kCHul096AnixOzy6e3aMMZqVmUKsKICgEw5epe/Bjg=;
	h=Date:From:To:cc:Subject:From;
	b=SERJeFtXuMwBZ6/IxMGtqC6EakGcIwN1YXfF9jZTmPBgNg35RH8Ar7nTrxwsLXDUE
	 VcVFFDtAIaG+rW7CLvaEX0jpJPjwbIuCGhSe7kPf9ibdgcaK8N9Bvq0iHxSO4aFStL
	 BVgaAAxOltl0rG83h9GfTrr1igCO9q9fBt0/3t4bO3El+awpjjPDTUspiiIl3oh3Bq
	 0HRAQ/99U/QpduXWaAxoMgUnz3ExY/4DjY9ONujOey5TBAPhkIepZ4gsSIxki1741t
	 uYWijBQpUICYQC4tOKybFnP9KGP2Frbs7pIp2gAECii/oW7yKg56MTkyaShHQfYAcf
	 TcZee2UIcmruQ==
Date: Fri, 3 Mar 2023 15:57:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH v2 0/2] automation: introduce a Xilinx hardware test
Message-ID: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short patch series introduces the first Xen gitlab-ci test run on
real hardware: a physical Xilinx ZCU102 board.

The gitlab container is run on a workstation physically connected to a
ZCU102 board. The test script looks very similar to a regular QEMU test
script, except that at the end it reboots the physical board and
connects to the serial instead of launching QEMU.

The gitlab runner is currently restricted to
https://gitlab.com/xen-project/xen. A CI/CD variable called
"XILINX_JOBS" is set to true for https://gitlab.com/xen-project/xen, so
that we can signal the pipeline to create a xilinx job, otherwise the
job is skipped as the runner is not available.

Cheers,

Stefano

