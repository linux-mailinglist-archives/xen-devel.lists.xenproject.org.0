Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E192AC31
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 00:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755641.1164055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQx2D-000143-U9; Mon, 08 Jul 2024 22:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755641.1164055; Mon, 08 Jul 2024 22:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQx2D-00012T-R6; Mon, 08 Jul 2024 22:40:37 +0000
Received: by outflank-mailman (input) for mailman id 755641;
 Mon, 08 Jul 2024 22:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgpN=OI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sQx2C-00012N-Ve
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 22:40:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167d659d-3d7b-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 00:40:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EE26611D9;
 Mon,  8 Jul 2024 22:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AD9C4AF0B;
 Mon,  8 Jul 2024 22:40:31 +0000 (UTC)
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
X-Inumbo-ID: 167d659d-3d7b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720478433;
	bh=4ls6Hf63iWX5WfFe6DkUcMHrn5wRaVTX9QAYAS/BBlk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aES30YoX30ntTKIIzwmvLtPV3c13dJjt+p9+U+uWlqP5Pl81llgeJywYSDnlvUBWI
	 vk1bZSkvW0cmxEKHj6S8wVc+U9YjWWDCBoDS4KaOaMEqVQ2jRqfmdRUqTpjkpp/aUN
	 CvsGdfQewshpJs/ZHfwcvGGKN8FpchhxjGil6UuLAxmZrARJqCfQ4RezkIQqUP85M5
	 +rmy4BxTe4/2+JlUijTv3GA+zPj5F2IpnLxmHL/wimIfTCMUKhyBYxRk6bhPpcd/v6
	 P9SZrutKY57xblO2CAfNK2T3TWC1rATyLlb2JDTIRcIlH0wq5Bp8RtZTkDD+OgHVya
	 qke2I6jzTjVZg==
Date: Mon, 8 Jul 2024 15:40:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@nxp.com>
cc: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, 
    Viresh Kumar <viresh.kumar@linaro.org>, Julien Grall <julien@xen.org>, 
    "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, edgar.iglesias@amd.com, 
    sstabellini@kernel.org
Subject: Re: Question: xen + vhost user
In-Reply-To: <AM6PR04MB59412237BA10A23EB79D5C0E88D22@AM6PR04MB5941.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2407081539380.3635@ubuntu-linux-20-04-desktop>
References: <AM6PR04MB59412237BA10A23EB79D5C0E88D22@AM6PR04MB5941.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Edgar

I don't think we are using vhost-user so I am unable to help, but adding
Edgar just in case

On Sun, 30 Jun 2024, Peng Fan wrote:
> Hi All,
> 
> I am trying to enable vhost user input with xen hypervisor on i.MX95, using qemu
> vhost-user-input. But meet " Invalid vring_addr message ". My xen domu cfg:
> 
> '-chardev', 'socket,path=/tmp/input.sock,id=mouse0',
> '-device', 'vhost-user-input-pci,chardev=mouse0',
> 
> Anyone knows what missing?
> 
> Partial error log:
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_ADDR (9)
> Flags:   0x1
> Size:    40
> vhost_vring_addr:
>     index:  0
>     flags:  0
>     desc_user_addr:   0x0000ffff889b0000
>     used_user_addr:   0x0000ffff889b04c0
>     avail_user_addr:  0x0000ffff889b0400
>     log_guest_addr:   0x00000000444714c0
> Setting virtq addresses:
>     vring_desc  at (nil)
>     vring_used  at (nil)
>     vring_avail at (nil)
> 
> ** (vhost-user-input:1816): CRITICAL **: 07:20:46.077: Invalid vring_addr message
> 
> Thanks,
> Peng.
> 
> The full vhost user debug log:
> ./vhost-user-input --socket-path=/tmp/input.sock --evdev-path=/d
> -path=/dev/input/event1 ./vhost-user-input --socket-path=/tmp/input.sock --evdev-
> ================ Vhost user message ================
> Request: VHOST_USER_GET_FEATURES (1)
> Flags:   0x1
> Size:    0
> Sending back to guest u64: 0x0000000175000000
> ================ Vhost user message ================
> Request: VHOST_USER_GET_PROTOCOL_FEATURES (15)
> Flags:   0x1
> Size:    0
> ================ Vhost user message ================
> Request: VHOST_USER_SET_PROTOCOL_FEATURES (16)
> Flags:   0x1
> Size:    8
> u64: 0x0000000000008e2b
> ================ Vhost user message ================
> Request: VHOST_USER_GET_QUEUE_NUM (17)
> Flags:   0x1
> Size:    0
> ================ Vhost user message ================
> Request: VHOST_USER_GET_MAX_MEM_SLOTS (36)
> Flags:   0x1
> Size:    0
> u64: 0x0000000000000020
> ================ Vhost user message ================
> Request: VHOST_USER_SET_BACKEND_REQ_FD (21)
> Flags:   0x9
> Size:    0
> Fds: 6
> Got backend_fd: 6
> ================ Vhost user message ================
> Request: VHOST_USER_SET_OWNER (3)
> Flags:   0x1
> Size:    0
> ================ Vhost user message ================
> Request: VHOST_USER_GET_FEATURES (1)
> Flags:   0x1
> Size:    0
> Sending back to guest u64: 0x0000000175000000
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_CALL (13)
> Flags:   0x1
> Size:    8
> Fds: 7
> u64: 0x0000000000000000
> Got call_fd: 7 for vq: 0
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_ERR (14)
> Flags:   0x1
> Size:    8
> Fds: 8
> u64: 0x0000000000000000
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_CALL (13)
> Flags:   0x1
> Size:    8
> Fds: 9
> u64: 0x0000000000000001
> Got call_fd: 9 for vq: 1
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_ERR (14)
> Flags:   0x1
> Size:    8
> Fds: 10
> u64: 0x0000000000000001
> (XEN) d2v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d2v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d2v0: vGICD: RAZ on reserved register offset 0x00000c
> (XEN) d2v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d2v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_CONFIG (25)
> Flags:   0x9
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_GET_CONFIG (24)
> Flags:   0x1
> Size:    148
> ================ Vhost user message ================
> Request: VHOST_USER_SET_FEATURES (2)
> Flags:   0x1
> Size:    8
> u64: 0x0000010170000000
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_NUM (8)
> Flags:   0x1
> Size:    8
> State.index: 0
> State.num:   64
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_BASE (10)
> Flags:   0x1
> Size:    8
> State.index: 0
> State.num:   0
> ================ Vhost user message ================
> Request: VHOST_USER_SET_VRING_ADDR (9)
> Flags:   0x1
> Size:    40
> vhost_vring_addr:
>     index:  0
>     flags:  0
>     desc_user_addr:   0x0000ffff889b0000
>     used_user_addr:   0x0000ffff889b04c0
>     avail_user_addr:  0x0000ffff889b0400
>     log_guest_addr:   0x00000000444714c0
> Setting virtq addresses:
>     vring_desc  at (nil)
>     vring_used  at (nil)
>     vring_avail at (nil)
> 
> ** (vhost-user-input:1816): CRITICAL **: 07:20:46.077: Invalid vring_addr message
> 
> root@imx95evk:~#
> 

