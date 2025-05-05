Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE421AA9A4A
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 19:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976180.1363394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBzTw-0006WE-22; Mon, 05 May 2025 17:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976180.1363394; Mon, 05 May 2025 17:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBzTv-0006U4-Uj; Mon, 05 May 2025 17:19:55 +0000
Received: by outflank-mailman (input) for mailman id 976180;
 Mon, 05 May 2025 17:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uBzTu-0006Ty-IF
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 17:19:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26dda250-29d5-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 19:19:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B76E5C4624;
 Mon,  5 May 2025 17:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA192C4CEE4;
 Mon,  5 May 2025 17:19:47 +0000 (UTC)
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
X-Inumbo-ID: 26dda250-29d5-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746465589;
	bh=tKyAZaSY4McK3YCahgeUO7ZbO9yDo3+bLojf3JFda50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vMarw99m2Omwn8crTX3hmU1e63RRKqee5hNXLgprEh8wAdP5bm6VHyOSFH7k0jad7
	 3UkJV+BBSeDb19hBfpUE3zvSLSnwW5ziUYzXo4/Gi58H5jmF/wdUxTyXKrS/4ZIRcS
	 lrFaOcuQBAISPVP/Gg4sQUsC7WvmHActL918UtuV1pdZv9YQADFNYclXM7tEaNO2Jq
	 tY4ZR+3nZVTOeKT7bsDEcI7xv2TJsmhp1ZCoZedD+Y73anvR3zg6CpCb7hNuukUp00
	 zebecKLY3NE4zJXErJFzt+XQEgKJQ7Nhta0WQQyvYZxvCcdFpnw8x7t49x82pt9Wxt
	 U4R/kaSpFNnkw==
Date: Mon, 5 May 2025 10:19:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
In-Reply-To: <ac04dd06-1e7d-4013-8e1b-ab5f8ab39ce3@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051019270.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com> <82f0c1d4fe25b4a52d76f3c8004e107b183af56c.1746199009.git.oleksii.kurochko@gmail.com> <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>
 <ac04dd06-1e7d-4013-8e1b-ab5f8ab39ce3@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Oleksii Kurochko wrote:
> On 5/2/25 7:55 PM, Stefano Stabellini wrote:
> 
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
> Move some parts of Arm's Dom0Less code to be reused by other architectures.
> At the moment, RISC-V is going to reuse these parts.
> 
> Move dom0less-build.h from the Arm-specific directory to asm-generic
> as these header is expected to be the same across acrhictectures with
> some updates: add the following declaration of construct_domU(),
> and arch_create_domUs() as there are some parts which are still
> architecture-specific.
> 
> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
> code for an architecture.
> 
> Relocate the CONFIG_DOM0LESS configuration to the common with adding
> "depends on HAS_DOM0LESS" to not break builds for architectures which
> don't support CONFIG_DOM0LESS config, especically it would be useful
> to not provide stubs for  construct_domU(), arch_create_domUs()
> in case of *-randconfig which may set CONFIG_DOM0LESS=y.
> 
> Move is_dom0less_mode() function to the common code, as it depends on
> boot modules that are already part of the common code.
> 
> Move create_domUs() function to the common code with some updates:
> - Add arch_create_domUs() to cover parsing of arch-specific features,
>   for example, SVE (Scalar Vector Extension ) exists only in Arm.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> It was suggested to change dom0less to predefined domus or similar
> (https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0):
> 
> I decided to go with dom0less name for now as it will require a lot of places to change,
> including CI's test, and IMO we could do in a separate patch.
> If it is necessry to do now, I'll be happy to do that in next version of the current
> patch series.
> I think it is fine to use dom0less for now, it will make the code easier
> to review and it is not necessary to change the name at this point.
> 
> The patch looks good to me, except for a couple of minor suggestions I
> have below. I could make them on commit. With those:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> During the randconfig testing the following issue occurs:
>   
> common/device-tree/dom0less-build.c: In function 'create_domUs':
> common/device-tree/dom0less-build.c:156:42: error: implicit declaration of function 'gnttab_dom0_frames'; did you mean 'gnttab_map_frame'? 
> [-Werror=implicit-function-declaration]
>   156 |                 d_cfg.max_grant_frames = gnttab_dom0_frames();
>       |                                          ^~~~~~~~~~~~~~~~~~
>       |                                          gnttab_map_frame
> common/device-tree/dom0less-build.c:156:42: error: nested extern declaration of 'gnttab_dom0_frames' [-Werror=nested-externs]
> 
> I fixed that by the following #ifdef-ing:
> ...
>         d_cfg.max_grant_frames = -1;
> ...
> 
>         if ( dt_property_read_u32(node, "capabilities", &val) )
>         {
> ...
> 
> #ifdef CONFIG_GRANT_TABLE
>                 d_cfg.max_grant_frames = gnttab_dom0_frames();
> #endif
>                 d_cfg.max_evtchn_port = -1;
>                 flags |= CDF_hardware;
>                 iommu = true;
>             }
> 
> Do you agree with such fix?
> 
> If the CONFIG_GRANT_TABLE=n then the init value (d_cfg.max_grant_frames = -1;) will be used.

Yes, OK

