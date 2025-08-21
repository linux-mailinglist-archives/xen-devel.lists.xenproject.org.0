Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E5BB2EA62
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 03:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087723.1445603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uotvk-0002Qj-TX; Thu, 21 Aug 2025 01:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087723.1445603; Thu, 21 Aug 2025 01:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uotvk-0002OK-PX; Thu, 21 Aug 2025 01:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1087723;
 Thu, 21 Aug 2025 01:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTf3=3B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uotvj-0002OE-3s
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 01:17:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97dc34a8-7e2c-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 03:17:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 752EE5C58BF;
 Thu, 21 Aug 2025 01:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2858C4AF09;
 Thu, 21 Aug 2025 01:17:21 +0000 (UTC)
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
X-Inumbo-ID: 97dc34a8-7e2c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755739043;
	bh=eeyCW/r+jSIHSfaXKe3oB8UsMEutwARYYbedfbO3cjE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ik89ng2pyiSq1zqGp0FtX9D1NdLWITbZnopY0goBDX7sUNnNHSTH7qNK3ek/xVedS
	 bNsupCrdNsfNO3LO9HIVo1vgTq1UygZc8+EoW234OMWZd239PnBN3uknE77jiygC33
	 jceI+nLjbmAYHrPTSFzOUZSRD3m5KQ/76827VmVYZWiowjw52dzmWgwcjO8JaNKvsn
	 rL/hiSNtJ68qpb11x5M4JbQVpU05RVJVURz38KoeqtarRuNVLPoxR0mO7Qha6bQBvJ
	 gtNu90X3/TPS8kpyK+IMQmMWKN63zTVNxwtxyr6e26ULbPfieHEXunEF29H0rhp2WM
	 Ukam6gM9svwAg==
Date: Wed, 20 Aug 2025 18:17:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] xen/pci: modify pci_add_device to handle device
 add by Xen
In-Reply-To: <e0da037322b978d427d23a1af50406598a08b378.1755683961.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508201817130.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1755683961.git.mykyta_poturai@epam.com> <e0da037322b978d427d23a1af50406598a08b378.1755683961.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Mykyta Poturai wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Currently pci_add_device is called from hypercalls requested by Dom0
> to add pci devices and when the device has no domain associated with
> it, it is assumed that hardware_domain is the owner.
> 
> On the dom0less scenario, the enumeration is performed by the
> firmware and Xen at boot time might want to assign some pci devices
> to guests, so it has to firstly add the device and then assign it to
> the final guest.
> 
> Modify pci_add_device to have the owner domain passed as a parameter
> to the function, so that when it is called from the hypercall the
> owner would be the caller domain, otherwise when Xen is calling it,
> it would be another domain since hw domain could not be there
> (dom0less guests without Dom0 use case).
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


