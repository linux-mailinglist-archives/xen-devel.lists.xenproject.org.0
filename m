Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB7624E5B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 00:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442265.696337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGnd-0007jS-Ln; Thu, 10 Nov 2022 23:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442265.696337; Thu, 10 Nov 2022 23:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGnd-0007h2-Id; Thu, 10 Nov 2022 23:17:33 +0000
Received: by outflank-mailman (input) for mailman id 442265;
 Thu, 10 Nov 2022 23:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otGnc-0007gu-JJ
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 23:17:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d925ee24-614d-11ed-91b5-6bf2151ebd3b;
 Fri, 11 Nov 2022 00:17:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A72C161B97;
 Thu, 10 Nov 2022 23:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F359C433D6;
 Thu, 10 Nov 2022 23:17:27 +0000 (UTC)
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
X-Inumbo-ID: d925ee24-614d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668122249;
	bh=gZ6l0O/lCjUNbu1K+43xFwYYz+6DXABKrxCMwJLaWZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V1cYjlIiJX28ACqmiEP3XhZLFMEQqGwk7naFkrWBXyLun66hDPMecANgh3aj/J5wb
	 7G89BwIFGlq8H3U/E7e5LJVXBYj7cXBdHAGCu0okbGDq+6xxPUbebLQBaaU4spv8Mj
	 sH/iJXUf5aDXRjdoTIfdXw1RCe6UQPIs9qFOjIkXI9yeNFjn+9xs8ryvNCLMti1T05
	 bbsDDzuCdWU99iRcPG060VlQgiXVjnkpC+nKDc52nEedQnRpeg/ecQmNipoQBUR5MR
	 Ojq3U7z8I/AfSOZqKNT8N+cBQ6gqGqlkp/egYhD4XL0qfMH+930O9YxTotk2vXRfea
	 CyAkvDPYefQ0w==
Date: Thu, 10 Nov 2022 15:17:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2211101513070.50442@ubuntu-linux-20-04-desktop>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Anthony,

Thank you for doing this, it was much needed!


Hi all,

I think if we are going to commit this series for 4.17 then I would
suggest to also commit patches 1-3 of my "introduce SPDX" series:

https://marc.info/?l=xen-devel&m=166562222522996

They are already acked/reviewed and are zero risk as they don't actually
change any of the headers.


For clarify, I don't mean to cause any trouble to this series. I am also
happy to have this series committed in 4.17 without "introduce SPDX".

Cheers,

Stefano



On Thu, 3 Nov 2022, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.licences-fix-public-headers-v2
> 
> Hi,
> 
> Andrew pointed out some licences issue:
> 
> https://lore.kernel.org/xen-devel/b58f5340-d4fa-df9d-89de-6137005add77@citrix.com/T/#u
> tracked here: https://gitlab.com/xen-project/xen/-/issues/35
> 
> So I attempt to fix them with this series.
> 
> For 4.17:
>     This mostly change "documentation" so little risk for those patch, except
>     "xen-foreign: Capture licences from the input headers" which changes
>     "mkheader.py" which could generate broken headers.
> 
> Anthony PERARD (6):
>   xen: Add licence information to public/errno.h
>   xen: Used SPDX identifier in some public headers
>   tools/include/xen-foreign: Add SPDX identifier to generated headers
>   xen: Add licence header to device_tree_defs.h
>   Rework COPYING installed in /usr/include/xen/, due to several licences
>   xen: Used SPDX identifier in public headers
> 
>  tools/include/Makefile                       |  1 -
>  xen/include/public/arch-arm.h                | 19 +-------------
>  xen/include/public/arch-arm/hvm/save.h       | 19 +-------------
>  xen/include/public/arch-arm/smccc.h          | 19 +-------------
>  xen/include/public/arch-x86/cpufeatureset.h  | 19 +-------------
>  xen/include/public/arch-x86/cpuid.h          | 19 +-------------
>  xen/include/public/arch-x86/guest-acpi.h     | 19 +-------------
>  xen/include/public/arch-x86/hvm/save.h       | 19 +-------------
>  xen/include/public/arch-x86/hvm/start_info.h | 19 +-------------
>  xen/include/public/arch-x86/pmu.h            | 19 +-------------
>  xen/include/public/arch-x86/xen-mca.h        | 19 +-------------
>  xen/include/public/arch-x86/xen-x86_32.h     | 19 +-------------
>  xen/include/public/arch-x86/xen-x86_64.h     | 19 +-------------
>  xen/include/public/arch-x86/xen.h            | 19 +-------------
>  xen/include/public/arch-x86_32.h             | 19 +-------------
>  xen/include/public/arch-x86_64.h             | 19 +-------------
>  xen/include/public/argo.h                    | 19 +-------------
>  xen/include/public/callback.h                | 19 +-------------
>  xen/include/public/device_tree_defs.h        |  6 +++++
>  xen/include/public/dom0_ops.h                | 19 +-------------
>  xen/include/public/domctl.h                  | 19 +-------------
>  xen/include/public/elfnote.h                 | 19 +-------------
>  xen/include/public/errno.h                   |  2 ++
>  xen/include/public/event_channel.h           | 19 +-------------
>  xen/include/public/features.h                | 19 +-------------
>  xen/include/public/grant_table.h             | 19 +-------------
>  xen/include/public/hvm/dm_op.h               | 19 +-------------
>  xen/include/public/hvm/e820.h                | 19 +-------------
>  xen/include/public/hvm/hvm_info_table.h      | 19 +-------------
>  xen/include/public/hvm/hvm_op.h              | 19 +-------------
>  xen/include/public/hvm/hvm_vcpu.h            | 19 +-------------
>  xen/include/public/hvm/hvm_xs_strings.h      | 19 +-------------
>  xen/include/public/hvm/ioreq.h               | 19 +-------------
>  xen/include/public/hvm/params.h              | 19 +-------------
>  xen/include/public/hvm/pvdrivers.h           | 19 +-------------
>  xen/include/public/hvm/save.h                | 19 +-------------
>  xen/include/public/hypfs.h                   | 19 +-------------
>  xen/include/public/io/9pfs.h                 | 19 +-------------
>  xen/include/public/io/blkif.h                | 19 +-------------
>  xen/include/public/io/cameraif.h             | 19 +-------------
>  xen/include/public/io/console.h              | 19 +-------------
>  xen/include/public/io/displif.h              | 19 +-------------
>  xen/include/public/io/fbif.h                 | 19 +-------------
>  xen/include/public/io/fsif.h                 | 19 +-------------
>  xen/include/public/io/kbdif.h                | 19 +-------------
>  xen/include/public/io/libxenvchan.h          | 19 +-------------
>  xen/include/public/io/netif.h                | 19 +-------------
>  xen/include/public/io/pciif.h                | 19 +-------------
>  xen/include/public/io/protocols.h            | 19 +-------------
>  xen/include/public/io/pvcalls.h              | 19 +-------------
>  xen/include/public/io/ring.h                 | 19 +-------------
>  xen/include/public/io/sndif.h                | 19 +-------------
>  xen/include/public/io/tpmif.h                | 19 +-------------
>  xen/include/public/io/usbif.h                | 19 +-------------
>  xen/include/public/io/vscsiif.h              | 19 +-------------
>  xen/include/public/io/xenbus.h               | 19 +-------------
>  xen/include/public/io/xs_wire.h              | 19 +-------------
>  xen/include/public/kexec.h                   | 19 +-------------
>  xen/include/public/memory.h                  | 19 +-------------
>  xen/include/public/nmi.h                     | 19 +-------------
>  xen/include/public/physdev.h                 | 19 +-------------
>  xen/include/public/platform.h                | 19 +-------------
>  xen/include/public/pmu.h                     | 19 +-------------
>  xen/include/public/sched.h                   | 19 +-------------
>  xen/include/public/sysctl.h                  | 19 +-------------
>  xen/include/public/tmem.h                    | 19 +-------------
>  xen/include/public/trace.h                   | 19 +-------------
>  xen/include/public/vcpu.h                    | 19 +-------------
>  xen/include/public/version.h                 | 19 +-------------
>  xen/include/public/vm_event.h                | 19 +-------------
>  xen/include/public/xen-compat.h              | 19 +-------------
>  xen/include/public/xen.h                     | 19 +-------------
>  xen/include/public/xencomm.h                 | 19 +-------------
>  xen/include/public/xenoprof.h                | 19 +-------------
>  xen/include/public/xsm/flask_op.h            | 19 +-------------
>  tools/include/xen-foreign/mkheader.py        | 23 ++++++++++++++---
>  tools/include/xen/COPYING                    | 26 ++++++++++++++++++++
>  77 files changed, 125 insertions(+), 1301 deletions(-)
>  create mode 100644 tools/include/xen/COPYING
> 
> -- 
> Anthony PERARD
> 

