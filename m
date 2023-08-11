Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0530778526
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 03:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582227.911866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHNF-0008FD-WB; Fri, 11 Aug 2023 01:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582227.911866; Fri, 11 Aug 2023 01:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHNF-0008DI-Sv; Fri, 11 Aug 2023 01:55:33 +0000
Received: by outflank-mailman (input) for mailman id 582227;
 Fri, 11 Aug 2023 01:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUHNE-0008D8-LD
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 01:55:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f243fc-37ea-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 03:55:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7923860EAD;
 Fri, 11 Aug 2023 01:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E6AC433C8;
 Fri, 11 Aug 2023 01:55:27 +0000 (UTC)
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
X-Inumbo-ID: 25f243fc-37ea-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691718928;
	bh=sXJr4lVOJAdZnyi1KV+v/DU3uqu1sSSHS1WOYnDS/7Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lxj8MtsGOqBODsPmOo8aXpzc4eVnO1d2q3Ba5EmLilZL5flGexZxZSqU0+wrJAWwM
	 jqxhNotbdh+dKs4L1jl6lKYR9pNnMvpCSMWDTkUdlVGdwpzSR+Z+LkADSgQDyFMSX9
	 Cqbq5DrK6ujPz8ilhEjjmBqM7UvcqfmY2X1kQ//aPbuwhw6JXaW+2VU97C43gPDUmT
	 ruRv6Sy+zjlihscLnjfF0t7eaYUvnoaMo/4mW7e2c8Abb9K3oyCaNlvdDR8od8ftyj
	 RHq7DFt0Ho2ZbMgUPIJ7QIpJmxjlmc7Z9CRkAZTKIs8POQXWWNCIVGGPDJHGpORw8j
	 sBgPTkVszzOTA==
Date: Thu, 10 Aug 2023 18:55:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Fix initrd placeholders generation in
 make_chosen_node()
In-Reply-To: <C64B8D3B-24CD-4312-97B4-1B1621EDBDDD@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308101855190.2127516@ubuntu-linux-20-04-desktop>
References: <20230810112544.17365-1-michal.orzel@amd.com> <20230810112544.17365-2-michal.orzel@amd.com> <C64B8D3B-24CD-4312-97B4-1B1621EDBDDD@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Aug 2023, Luca Fancellu wrote:
> > On 10 Aug 2023, at 12:25, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > When booting a dom0less domU without initial ramdisk, it was observed
> > that Xen still creates empty linux,initrd-{start,end} properties under
> > /chosen node. This is because in make_chosen_node(), generation of initrd
> > placeholders (later on filled with the real values) is protected with
> > a check for presence of kernel bootmodule (always present) instead of
> > initrd bootmodule. Fix it along with renaming the variable from "mod" to
> > "initrd" to prevent similar mistakes in the future.
> > 
> > Fixes: 48f4bf6bdeb4 ("arm/acpi: Create min DT stub for Dom0")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Hi Michal, good catch!
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

