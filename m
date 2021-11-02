Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018244397B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 00:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220504.381802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi32M-0000X4-0P; Tue, 02 Nov 2021 23:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220504.381802; Tue, 02 Nov 2021 23:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mi32L-0000TX-SP; Tue, 02 Nov 2021 23:17:49 +0000
Received: by outflank-mailman (input) for mailman id 220504;
 Tue, 02 Nov 2021 23:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8t6=PV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mi32K-0000Ry-3J
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 23:17:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2079852-2d17-4da6-89f8-70e2b4538a2f;
 Tue, 02 Nov 2021 23:17:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30A656109D;
 Tue,  2 Nov 2021 23:17:46 +0000 (UTC)
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
X-Inumbo-ID: f2079852-2d17-4da6-89f8-70e2b4538a2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635895066;
	bh=wSc4z3tjtUxUopFnH2Hov7h54Lh+zRs3KC+jBurocGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UG2RC4CWPO+fVzY20303YVhVNVUs7HXlcA/o4XZmbnwv0NmZ6C5YLCrMkzsG/la86
	 KFpYMmrVVVd7gDqm9EDM4TTgqYfQ0SuYPsJfclRxAuqnyFqxvV3hi4/ZlsLpyOAp5V
	 DhAo/aN5MG9dUCukICqvDXN7v1rfYhwmRmLYGRhB0SdyAOHb4kub3T1OXK75CPKnX4
	 TieoWcXtUDldfTY/rmEmCLbdvv12JSsWlgFNl9trkeB/NqF3ffVKC0YRvFgbjiI1Rx
	 sydDbt3lInBKmov+CyxGuFN748+a/y9VmhNGfJKlMesQR9mqboYWkix/NAQe32UeoD
	 SW9AtPA4SPV7Q==
Date: Tue, 2 Nov 2021 16:17:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
Message-ID: <alpine.DEB.2.21.2111021615220.18170@sstabellini-ThinkPad-T480s>
References: <20211102140511.5542-1-luca.fancellu@arm.com> <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com> <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-361158706-1635895044=:18170"
Content-ID: <alpine.DEB.2.21.2111021617390.18170@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-361158706-1635895044=:18170
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2111021617391.18170@sstabellini-ThinkPad-T480s>

On Tue, 2 Nov 2021, Luca Fancellu wrote:
> + Ian Jackson for 4.16 release
> 
> > On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 02.11.2021 15:05, Luca Fancellu wrote:
> >> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
> >> ("arm/efi: Use dom0less configuration when using EFI boot") is
> >> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
> >> 
> >> The problem comes from the function get_parent_handle(...) that inside
> >> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
> >> is NULL, making Xen stop the UEFI boot.
> > 
> > According to my reading the UEFI spec doesn't (explicitly) allow for
> > this to be NULL. Could you clarify why this is the case? What other
> > information may end up being invalid / absent? Is e.g. read_section()
> > safe to use?
> 
> My test on an arm machine running Grub2 on top of EDK2 showed that
> when Xen is started, the get_parent_handle(…) call was failing and stopping
> the boot because the efi_bs->HandleProtocol(…) was called with the
> loaded_image->DeviceHandle argument NULL and the call was returning
> a EFI_INVALID_PARAMETER.
> So the parent handle can’t be requested and the filesystem can’t be used,
> but any other code that doesn’t use the handle provided by get_parent_handle(…)
> can be used without problem like read_section(...).

It could be the case that Grub2 is doing something not entirely
compliant to the spec.


> > 
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> >>     CHAR16 *pathend, *ptr;
> >>     EFI_STATUS ret;
> >> 
> >> +    /*
> >> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
> >> +     * to have access to the filesystem.
> >> +     */
> >> +    if ( !loaded_image->DeviceHandle )
> >> +        return NULL;
> > 
> > I couldn't find anything in the spec saying that NULL (a pointer with
> > the numeric value zero) could actually not be a valid handle. Could
> > you point me to text saying so?
> 
> I am reading UEFI spec 2.8 A, section 7.3 Protocol Handler Services, when it talks about
> EFI_BOOT_SERVICES.HandleProtocol() there is a table of “Status Code Returned” listing
> the EFI_INVALID_PARAMETER when the Handle is NULL.
> 
> > 
> >> @@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> >>     EFI_STATUS ret;
> >>     const CHAR16 *what = NULL;
> >> 
> >> +    if ( !dir_handle )
> >> +        blexit(L"Error: No access to the filesystem");
> > 
> > dir_handle also gets passed to efi_arch_cfg_file_{early,late}() -
> > those don't need any adjustment only because they merely pass the
> > parameter on to read_file()?
> 
> Yes, the handling is done in read_file(...)

But it is not super obvious, that's one I suggested an additional
explicit check in my other email
--8323329-361158706-1635895044=:18170--

