Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F277EE9FA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 00:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634710.990186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3lmn-0003rp-NC; Thu, 16 Nov 2023 23:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634710.990186; Thu, 16 Nov 2023 23:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3lmn-0003pH-JU; Thu, 16 Nov 2023 23:28:37 +0000
Received: by outflank-mailman (input) for mailman id 634710;
 Thu, 16 Nov 2023 23:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3lml-0003os-Ri
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 23:28:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf4cc85-84d7-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 00:28:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81BD461BA0;
 Thu, 16 Nov 2023 23:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FF4C433C7;
 Thu, 16 Nov 2023 23:28:29 +0000 (UTC)
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
X-Inumbo-ID: daf4cc85-84d7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700177311;
	bh=XjzKHAeto16ebMw7jxHjTa2WXkm7hU8t5jWEZ5Kuq5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HvRL5ir8nF62euaEj+1QAHorkgxo9+/oh/f43Brb8v2BHVg+CJ0Stg96lFBFmUh2Y
	 bZaB+R6skldakD2EkoLQnMg5nCHVaTBFfROZv4JvVnMX5HzMJG8pI3AeF+ebniw90t
	 mmOH4pWixdct4fRuE9Hdh6wFG3oVZ9aXeLlN5pWBngGHG3k0dJhXOnepGtbaf0umNZ
	 BmO9qLbTjc294au345Kt/RXoSc0z1Ds1zIC2X5sF/Xx0PJscD6WJXH9SstCt5aEW70
	 6ia/qjmq5HYupF2Og1LLcJu1kpmwRbSnBiVZVPWnBuQois4SUgAkskj6FcJ/yDqCsn
	 QvqsPJ+72f4NA==
Date: Thu, 16 Nov 2023 15:28:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com> <20231012220854.2736994-14-volodymyr_babchuk@epam.com> <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Nov 2023, Julien Grall wrote:
> IIUC, this means that Xen will allocate the BDF. I think this will become a
> problem quite quickly as some of the PCI may need to be assigned at a specific
> vBDF (I have the intel graphic card in mind).
> 
> Also, xl allows you to specificy the slot (e.g. <bdf>@<vslot>) which would not
> work with this approach.
> 
> For dom0less passthrough, I feel the virtual BDF should always be specified in
> device-tree. When a domain is created after boot, then I think you want to
> support <bdf>@<vslot> where <vslot> is optional.

Hi Julien,

I also think there should be a way to specify the virtual BDF, but if
possible (meaning: it is not super difficult to implement) I think it
would be very convenient if we could let Xen pick whatever virtual BDF
Xen wants when the user doesn't specify the virtual BDF. That's
because it would make it easier to specify the configuration for the
user. Typically the user doesn't care about the virtual BDF, only to
expose a specific host device to the VM. There are exceptions of course
and that's why I think we should also have a way for the user to
request a specific virtual BDF. One of these exceptions are integrated
GPUs: the OS drivers used to have hardcoded BDFs. So it wouldn't work if
the device shows up at a different virtual BDF compared to the host.

Thinking more about this, one way to simplify the problem would be if we
always reuse the physical BDF as virtual BDF for passthrough devices. I
think that would solve the problem and makes it much more unlikely to
run into drivers bugs.

And we allocate a "special" virtual BDF space for emulated devices, with
the Root Complex still emulated in Xen. For instance, we could reserve
ff:xx:xx and in case of clashes we could refuse to continue. Or we could
allocate the first free virtual BDF, after all the pasthrough devices.

Example:
- the user wants to assign physical 00:11.5 and b3:00.1 to the guest
- Xen create virtual BDFs 00:11.5 and b3:00.1 for the passthrough devices
- Xen allocates the next virtual BDF for emulated devices: b4:xx.x
- If more virtual BDFs are needed for emulated devices, Xen allocates
  b5:xx.x

I still think, no matter the BDF allocation scheme, that we should try
to avoid as much as possible to have two different PCI Root Complex
emulators. Ideally we would have only one PCI Root Complex emulated by
Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
tolerable but not ideal. The worst case I would like to avoid is to have
two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.

