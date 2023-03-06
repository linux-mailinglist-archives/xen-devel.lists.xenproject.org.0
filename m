Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065016AD2DC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 00:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507154.780382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKI-0005cY-Ll; Mon, 06 Mar 2023 23:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507154.780382; Mon, 06 Mar 2023 23:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKI-0005al-IX; Mon, 06 Mar 2023 23:33:06 +0000
Received: by outflank-mailman (input) for mailman id 507154;
 Mon, 06 Mar 2023 23:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xk/k=66=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZKKH-0005af-Ah
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 23:33:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d045101-bc77-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 00:33:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F789B811CF;
 Mon,  6 Mar 2023 23:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F5BC433EF;
 Mon,  6 Mar 2023 23:33:00 +0000 (UTC)
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
X-Inumbo-ID: 3d045101-bc77-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678145581;
	bh=3kCHul096AnixOzy6e3aMMZqVmUKsKICgEw5epe/Bjg=;
	h=Date:From:To:cc:Subject:From;
	b=nbhnouVwN9+er8jy+RkSs6juuNACfWwaZqdkt9hsU5Wmf+l9ygACUlSqtvBtx2c/c
	 +mju2mm3axoFXMs5S2PG4fQLOa8yVNGZpYfDQrFhxJVFsjlDLbTJTw9kil9gOCJHiv
	 XEormtSGmddbltEBOTSaDb2fWah6Ud+BzPzYeS0jzxT6EW/xRU6Og77wNjN+X5Y9k/
	 SJJqf/MrIXcegvI4IDXF6mqh280E91GjHn0zzd7X1qED9cPznj4tdRU5xfQ4rvptQ6
	 gd4cmU9yinCttROXwEhvmul5ByWAEOwNR/MShlgP45soo0vDyXWxZx8fRGt3r+ktjo
	 VlcNtL/AmTfHg==
Date: Mon, 6 Mar 2023 15:32:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH v3 0/2] automation: introduce a Xilinx hardware test
Message-ID: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
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

