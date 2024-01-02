Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E38222D6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 22:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660849.1030492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlsP-0003YU-LA; Tue, 02 Jan 2024 21:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660849.1030492; Tue, 02 Jan 2024 21:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlsP-0003Wc-Go; Tue, 02 Jan 2024 21:00:41 +0000
Received: by outflank-mailman (input) for mailman id 660849;
 Tue, 02 Jan 2024 21:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnqv=IM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rKlsO-0003WW-GX
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 21:00:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9e903e5-a9b1-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 22:00:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02657CE09E3;
 Tue,  2 Jan 2024 21:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A965C433C8;
 Tue,  2 Jan 2024 21:00:31 +0000 (UTC)
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
X-Inumbo-ID: f9e903e5-a9b1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704229232;
	bh=NGph2zjxj+3ZgIZZyXjHEjd+fsObZ5b1FkXBVLE8Vnk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CwTE4nLeHrZ9kb7uFijEQk6zTs3TbqWCViSNFR8zXP+FLNI8ZEa5RKqx3AXNKyFsE
	 C2/i/0/mDQAiXzhWTdVd3SjeVijGfnoKeFIlOCkAoFLy/XSkeoXRH+xexfsq8StQ0N
	 e1ITIT3MN278Exj5bS2iwJ+IIw8xyYKxXnRo2hF7jLArRBUWWinkrT1le0NczcEQ7a
	 k29q8SDOC20ukybTy1gqkU4YnHP6cMiUx8isR8thsrRiF//PTd9qA5DzMBjwnFTy5d
	 HMy8DxyPhGgmLJ7YYLEZBZojsHKF8+hVxj04iDmFYDYuiOrBZC9Z61BvWOD/3OyB9K
	 FsSiOMhstZ/SA==
Date: Tue, 2 Jan 2024 13:00:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Peng Fan <peng.fan@nxp.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, 
    Oleksii Moisieiev <oleksii_moisieiev@epam.com>, vikram.garhwal@amd.com
Subject: Re: XEN virtio question
In-Reply-To: <DU0PR04MB941725CE43965686FD8B9A948861A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2401021259560.1322202@ubuntu-linux-20-04-desktop>
References: <DU0PR04MB941725CE43965686FD8B9A948861A@DU0PR04MB9417.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Peng,

Let me CC Vikram who might have seen this.


On Tue, 2 Jan 2024, Peng Fan wrote:
> All,
> 
> I am trying to setup xen virtio on NXP i.MX9, but when build xen tools,
> I always met qemu build error, such as:
> 
> In file included from ../qemu-xen-dir-remote/hw/xen/xen-operations.c:16:
> /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/
> include/hw/xen/xen_native.h:5:2: error: #error In Xen native files, 
> include xen_native.h before other Xen headers
>     5 | #error In Xen native files, include xen_native.h before other Xen headers
>       |  ^~~~~
> 
> Anyone met this?
> 
> BTW, do u build qemu together with xen or build standalone qemu out of
> xen repo? Does the default qemu-system-i386 built out works well
> for virtio trying?
> 
> Thanks,
> Peng.
> 

