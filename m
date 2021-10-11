Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E139D42959C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206406.361966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZz6T-0007TI-Pg; Mon, 11 Oct 2021 17:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206406.361966; Mon, 11 Oct 2021 17:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZz6T-0007Q1-LH; Mon, 11 Oct 2021 17:28:45 +0000
Received: by outflank-mailman (input) for mailman id 206406;
 Mon, 11 Oct 2021 17:28:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mZz6S-0007Ps-0h
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:28:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 735cb9ed-2ea4-48ac-990c-2295ab3066d4;
 Mon, 11 Oct 2021 17:28:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF6560E74;
 Mon, 11 Oct 2021 17:28:41 +0000 (UTC)
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
X-Inumbo-ID: 735cb9ed-2ea4-48ac-990c-2295ab3066d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633973322;
	bh=Cah+iOgRJ3+IJpmZPQz4AydeW78R31RwlS60HcfXfdA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AXzWmOVv28jzGY4LD3yeoz7nRzfxYiHB8xqi/QrgrT3G3EiCH7wcr4/cuF9828rMC
	 VEu1wYMaWB7YgjV55d1OMtqVjXZglrhD2+9vjM5YanFUdMZtDW46bGA4eHPrqrpnxE
	 4nrOPL7xZvdwaVjMnePxkeK0ZtW6dRFSXBKVZh6uy6GBAi+KOk+CDHIgcJOfrjHPvG
	 92L2MO02YYljVOOXQQRC4kLkNg5zBMxthzpybLvNZ0/awD+GqAbaByLM6kHQRi2YvE
	 5RBWMkZ+EaRTOwKxMcAUInkKj/Wmce4FfCXTa+pL4PLPPZiPpNxOYxj1WD+cRL2Fju
	 WtNFdytRSo2+g==
Date: Mon, 11 Oct 2021 10:28:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>, 
    Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using
 EFI boot
In-Reply-To: <C1176381-C6D5-46BD-A13D-7F3E7528B655@arm.com>
Message-ID: <alpine.DEB.2.21.2110111022300.25528@sstabellini-ThinkPad-T480s>
References: <20211011080302.24203-1-luca.fancellu@arm.com> <20211011080302.24203-2-luca.fancellu@arm.com> <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com> <9D5D9F7A-F399-4C8C-80A6-C3B8452729D0@arm.com> <b235bb9b-d9c5-5e70-fbe7-9683e5979075@suse.com>
 <C1176381-C6D5-46BD-A13D-7F3E7528B655@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 11 Oct 2021, at 09:52, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 11.10.2021 10:50, Luca Fancellu wrote:
> >>> On 11 Oct 2021, at 09:11, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 11.10.2021 10:03, Luca Fancellu wrote:
> >>>> This patch introduces the support for dom0less configuration
> >>>> when using UEFI boot on ARM, it permits the EFI boot to
> >>>> continue if no dom0 kernel is specified but at least one domU
> >>>> is found.
> >>>> 
> >>>> Introduce the new property "xen,uefi-binary" for device tree boot
> >>>> module nodes that are subnode of "xen,domain" compatible nodes.
> >>>> The property holds a string containing the file name of the
> >>>> binary that shall be loaded by the uefi loader from the filesystem.
> >>>> 
> >>>> Introduce a new call efi_check_dt_boot(...) called during EFI boot
> >>>> that checks for module to be loaded using device tree.
> >>>> Architectures that don't support device tree don't have to
> >>>> provide this function.
> >>>> 
> >>>> Update efi documentation about how to start a dom0less
> >>>> setup using UEFI
> >>>> 
> >>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>> 
> >>> Did you get indication that these are fine to retain with ...
> >>> 
> >>>> ---
> >>>> Changes in v5:
> >>>> - Removed unneeded variable initialization
> >>>> - Fixed comment
> >>>> - Fixed error message for the absence of an initial domain kernel
> >>>> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
> >>>> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
> >>>> message about the call introduction in the EFI boot flow.
> >>> 
> >>> ... all of these changes? Every individual change may be minor enough,
> >>> but their sum makes me wonder. If so (or if at least one of the two
> >>> gets re-offered)
> >>> Acked-by: Jan Beulich <jbeulich@suse.com>
> >>> albeit preferably with ...
> >>> 
> >>>> --- a/xen/common/efi/boot.c
> >>>> +++ b/xen/common/efi/boot.c
> >>>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
> >>>>    StdErr->OutputString(StdErr, (CHAR16 *)s );
> >>>> }
> >>>> 
> >>>> +#ifndef CONFIG_HAS_DEVICE_TREE
> >>>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> >>> 
> >>> ... the "inline" here dropped. We don't normally add this outside of
> >>> headers, leaving it to the compiler to decide. In headers it's wanted
> >>> to avoid "defined by never used" style warnings.
> >> 
> >> Ok I can drop it in a next serie and retain your Ack, or is it something that
> >> can be done on commit? 
> > 
> > I guess that's easy enough to do while committing. Provided of course
> > the two R-b get confirmed.
> 
> I confirm my R-b.

I also confirm my reviewed-by. Also, I am aware of the change suggested
by Julien about using multiboot,module for the is_boot_module check and
I am fine with it too.

