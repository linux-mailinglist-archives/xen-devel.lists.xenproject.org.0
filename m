Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F3A8AB5C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 00:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954667.1348664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ox7-00072r-3g; Tue, 15 Apr 2025 22:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954667.1348664; Tue, 15 Apr 2025 22:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ox7-00071G-0f; Tue, 15 Apr 2025 22:40:25 +0000
Received: by outflank-mailman (input) for mailman id 954667;
 Tue, 15 Apr 2025 22:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZ1T=XB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4ox5-00071A-1V
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 22:40:23 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ba1cc40-1a4a-11f0-9eae-5ba50f476ded;
 Wed, 16 Apr 2025 00:40:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46C3C6115F;
 Tue, 15 Apr 2025 22:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5CAC4CEE7;
 Tue, 15 Apr 2025 22:40:16 +0000 (UTC)
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
X-Inumbo-ID: 9ba1cc40-1a4a-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744756818;
	bh=azKy7Of8j02Wui/5ECtU0oU4BJp7g2vh2iJORCVUWsA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lcouqrGu1gLy7uEMFOpWVDStB88NHT6uZJ5G7v2oSQZEzwVPOr+Sf7Iv8PM39fMSk
	 XYIW+ZoR1I7uks9YDD2DV9TQqKDEGQH8UwpU//iUGWt+fvb2tcYEjRAqRHXAPS3yEE
	 7nIcENS9oq2Bl/+fnQ/VM2REXzq6kKZA8qupsF87BxwpDSeuTGpTiRJKpxpbb7bq1m
	 L8fuGzlChblCNYeDSru4QpCuj0o8xwGGOTuNJTh3oclSADG6vuRJDy2qgAMt0WLULa
	 MMkGqC0T7rEJaUYmmMzwLw0mHGZVgmX97pINdViTQctYsD/CEfa5VxfU42dQioMkKs
	 pC64faU4PrMLA==
Date: Tue, 15 Apr 2025 15:40:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/2] Add support for MSI injection on Arm
In-Reply-To: <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org>
Message-ID: <alpine.DEB.2.22.394.2504151536240.8008@ubuntu-linux-20-04-desktop>
References: <cover.1744621166.git.mykyta_poturai@epam.com> <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Julien Grall wrote:
> Hi Mykyta,
> 
> On 14/04/2025 18:51, Mykyta Poturai wrote:
> > This series adds the base support for MSI injection on Arm. This is
> > needed to streamline virtio-pci interrupt triggering.
> > 
> > With this patches, MSIs can be triggered in guests by issuing the new
> > DM op, inject_msi2. This op is similar to inject_msi, but it allows
> > to specify the source id of the MSI.
> > 
> > We chose the approach of adding a new DM op instead of using the pad
> > field of inject_msi because we have no clear way of distinguishing
> > between set and unset pad fields. New implementations also adds flags
> > field to clearly specify if the SBDF is set.
> > 
> > Patches were tested on QEMU with
> 
> [...]
> 
> > patches for ITS support for DomUs applied.
> 
> This means this series is unusable without external patches. Given this is
> adding a new DM operations, I think it would be more sensible to have the vITS
> support merged first. Then we can look at merging this series.

Hi Mykyta, just checking explicitly with you whether this series
requires vgic-v3-its.c for DomUs?

If yes, how far are you from sending the relevant patches to xen-devel?
How many are they?

