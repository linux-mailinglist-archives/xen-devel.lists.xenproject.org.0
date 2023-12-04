Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FFA804100
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 22:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647319.1010333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGXR-0003Oj-Nv; Mon, 04 Dec 2023 21:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647319.1010333; Mon, 04 Dec 2023 21:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGXR-0003N4-Kn; Mon, 04 Dec 2023 21:31:37 +0000
Received: by outflank-mailman (input) for mailman id 647319;
 Mon, 04 Dec 2023 21:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAGXP-0003MB-NU
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 21:31:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df85136-92ec-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 22:31:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E94A61346;
 Mon,  4 Dec 2023 21:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87769C433C8;
 Mon,  4 Dec 2023 21:31:28 +0000 (UTC)
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
X-Inumbo-ID: 7df85136-92ec-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701725491;
	bh=jZE8WhQFFk5OHFb1w+ll7JB5KoaZRmBWaeDlAuQbU04=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Yu51sE3vS37G/VqsMHOxqKss2H9lLc4fVXXc5Sswc7TWVZjCgeKTO9ir8aGro4AeS
	 K+Mdx7AbXDvIaTiNM7EJLY6Kz13WkF/5sEcmT2/1rFAokfwoKLWJKZstos9WHut7bE
	 JUZ8TcEAGE9K+XFxplS2TnChfCNABEy0P3SsvlGMr6qu5da3hWCuc9PiDaees+tkhp
	 7dV2Ee3diB7OkvxVY3U043mJCUsBP7aejaGnpmqJ7SAF4M0ZuZgbdwi/xNEgdLu73w
	 cgXGTviVpjT7CtDCU3eeWQ1JePKAjfPB5FI2JU+ySDBuAobRBAcQ46WkQzOwDXXi8q
	 g5naLxareX1NQ==
Date: Mon, 4 Dec 2023 13:31:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
    "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
    "Koenig, Christian" <Christian.Koenig@amd.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    "Huang, Honglei1" <Honglei1.Huang@amd.com>, 
    "Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 1/3] xen/pci: Add xen_reset_device_state
 function
In-Reply-To: <BL1PR12MB5849F2E24E00BF7B20A0B4A6E786A@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2312041331210.110490@ubuntu-linux-20-04-desktop>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com> <20231124103123.3263471-2-Jiqian.Chen@amd.com> <87edg2xuu9.ffs@tglx> <BL1PR12MB5849F2E24E00BF7B20A0B4A6E786A@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Dec 2023, Chen, Jiqian wrote:
> >> vpci device state when device is reset on dom0 side.
> >>
> >> And call that function in pcistub_init_device. Because when
> >> we use "pci-assignable-add" to assign a passthrough device in
> >> Xen, it will reset passthrough device and the vpci state will
> >> out of date, and then device will fail to restore bar state.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> > 
> > This Signed-off-by chain is incorrect.
> > 
> > Documentation/process/submitting-patches.rst has a full chapter about
> > S-O-B and the correct usage.
> I am the author of this series of patches, and Huang Rui transported the v1 to upstream. And now I transport v2. I am not aware that the SOB chain is incorrect.
> Do you have any suggestions?

I think he means that your Signed-off-by should be the second one of the
two as you are the one submitting the patch to the LKML

