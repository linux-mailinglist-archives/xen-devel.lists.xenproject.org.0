Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825942B11B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 02:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207793.363713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSE-0006Ot-Jw; Wed, 13 Oct 2021 00:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207793.363713; Wed, 13 Oct 2021 00:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maSSE-0006MU-Gk; Wed, 13 Oct 2021 00:49:10 +0000
Received: by outflank-mailman (input) for mailman id 207793;
 Wed, 13 Oct 2021 00:49:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maSSD-0006MN-0K
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 00:49:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c613319-ad0b-4b98-829b-fada0986ea40;
 Wed, 13 Oct 2021 00:49:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0D3F60EB4;
 Wed, 13 Oct 2021 00:49:06 +0000 (UTC)
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
X-Inumbo-ID: 1c613319-ad0b-4b98-829b-fada0986ea40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634086147;
	bh=TZ/GUui+f3ggfKlva+yhsLjnNF7QP+vt/8AOsUzlM5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A6bn4nc8M7stCNtD5UXjiy9HwUOg7OMISXQ4hLsqsJ/BuNHS02ADg1lhHd1FnbrDL
	 T00jqvKrhPJZzivd42JcaWKYLPuSpBnL0y7QDLCh+yuGNg55O9Nr2k/HuvE0aHw6Jh
	 eet/DfIB204C6ShY4TB/H3G9AE9v9EhO9jFPAZSs654O+eaATvzfONXLiXAgnGr+tD
	 lfZZ0R9TXprPmKL7ExzcqMYCpjmwQz5FKTEfz3mNq+kZTiy77sehTHvlz2h8dcvDSY
	 1Hc64+7CIBkFsIK4562arOFjpZzEwzKdQ7E3VvV97EgKic9V/SIXkGBKASI5TAmyIG
	 dbWK2xVOioNbA==
Date: Tue, 12 Oct 2021 17:49:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
In-Reply-To: <81EA782B-762E-4B8A-8D33-EC79203439BC@arm.com>
Message-ID: <alpine.DEB.2.21.2110121309560.9408@sstabellini-ThinkPad-T480s>
References: <20211011181528.17367-1-luca.fancellu@arm.com> <20211011181528.17367-3-luca.fancellu@arm.com> <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s> <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com> <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110111423310.25528@sstabellini-ThinkPad-T480s> <29cc47f2-4727-0397-db0c-a6c1f5a52bf7@xen.org> <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s> <81EA782B-762E-4B8A-8D33-EC79203439BC@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1765897762-1634069519=:9408"
Content-ID: <alpine.DEB.2.21.2110121312380.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1765897762-1634069519=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110121312381.9408@sstabellini-ThinkPad-T480s>

On Tue, 12 Oct 2021, Luca Fancellu wrote:
> > On 12 Oct 2021, at 02:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 11 Oct 2021, Julien Grall wrote:
> >> Hi Stefano,
> >> 
> >> On 11/10/2021 22:24, Stefano Stabellini wrote:
> >>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> >>>> index 840728d6c0..076b827bdd 100644
> >>>> --- a/xen/arch/arm/efi/efi-boot.h
> >>>> +++ b/xen/arch/arm/efi/efi-boot.h
> >>>> @@ -713,10 +713,12 @@ static int __init handle_module_node(EFI_FILE_HANDLE
> >>>> dir_handle,
> >>>>      char mod_string[24]; /* Placeholder for module@ + a 64-bit number +
> >>>> \0 */
> >>>>      int uefi_name_len, file_idx, module_compat;
> >>>>      module_name *file;
> >>>> +    const char *compat_string = is_domu_module ? "multiboot,module" :
> >>>> +                                "xen,multiboot-module";
> >>>>        /* Check if the node is a multiboot,module otherwise return */
> >>>>      module_compat = fdt_node_check_compatible(fdt, module_node_offset,
> >>>> -                                              "multiboot,module");
> >>>> +                                              compat_string);
> >>>>      if ( module_compat < 0 )
> >>>>          /* Error while checking the compatible string */
> >>>>          return ERROR_CHECK_MODULE_COMPAT;
> >>> 
> >>> 
> >>> Well... not exactly like this because this would stop a normal
> >>> "multiboot,module" dom0 kernel from being recognized.
> >>> 
> >>> So we need for domU: only "multiboot,module"
> >>> For Dom0, either "multiboot,module" or "xen,multiboot-module"
> >> 
> >> Looking at the history, xen,multiboot-module has been considered as a legacy
> >> binding since before UEFI was introduced. In fact, without this series, I
> >> believe, there is limited reasons for the compatible to be present in the DT
> >> as you would either use grub (which use the new compatible) or xen.cfg (the
> >> stub will create the node).
> >> 
> >> So I would argue that this compatible should not be used in combination with
> >> UEFI and therefore we should not handle it. This would make the code simpler
> >> :).
> > 
> 
> Hi Stefano,
> 
> > What you suggested is a viable option, however ImageBuilder is still
> > using the "xen,multiboot-module" format somehow today (no idea why) and
> > we have the following written in docs/misc/arm/device-tree/booting.txt:
> > 
> > 	Xen 4.4 supported a different set of legacy compatible strings
> > 	which remain supported such that systems supporting both 4.4
> > 	and later can use a single DTB.
> > 
> > 	- "xen,multiboot-module" equivalent to "multiboot,module"
> > 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
> > 	- "xen,linux-initrd"     equivalent to "multiboot,ramdisk"
> > 
> > 	For compatibility with Xen 4.4 the more specific "xen,linux-*"
> > 	names are non-optional and must be included.
> > 
> > My preference is to avoid breaking compatibility (even with UEFI
> > booting). The way I suggested above is one way to do it.
> > 
> > But I don't feel strongly about this at all, I am fine with ignoring
> > "xen,multiboot-module" in the EFI stub. I can get ImageBuilder fixed
> > very quickly (I should do that in any case). If we are going to ignore
> > "xen,multiboot-module" then we probably want to update the text in
> > docs/misc/arm/device-tree/booting.txt also.
> 
> The changes to support legacy compatible strings can be done but it will result in
> complex code, I would go for Julien suggestion to just drop it for UEFI.
> 
> I can add a note on docs/misc/arm/device-tree/booting.txt saying that for UEFI boot
> the legacy strings are not supported.
> 
> Something like:
> 
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -51,6 +51,8 @@ Each node contains the following properties:
>         Xen 4.4 supported a different set of legacy compatible strings
>         which remain supported such that systems supporting both 4.4
>         and later can use a single DTB.
> +       However when booting Xen using UEFI and Device Tree, the legacy compatible
> +       strings are not supported.
>  
>         - "xen,multiboot-module" equivalent to "multiboot,module"
>         - "xen,linux-zimage"     equivalent to "multiboot,kernel”
> 
> 
> What do you think about that?

Also reading Julien's reply, I am fine with a doc-only change in a
separate patch.

Yes, something along those lines is OK.

So for this patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1765897762-1634069519=:9408--

