Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327A89CF40
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 02:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702096.1096900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtzB3-0001uy-Ml; Tue, 09 Apr 2024 00:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702096.1096900; Tue, 09 Apr 2024 00:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtzB3-0001tH-K6; Tue, 09 Apr 2024 00:17:29 +0000
Received: by outflank-mailman (input) for mailman id 702096;
 Tue, 09 Apr 2024 00:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rtzB2-0001tB-41
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 00:17:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89e4311d-f606-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 02:17:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1A438CE1BB5;
 Tue,  9 Apr 2024 00:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D3CC433C7;
 Tue,  9 Apr 2024 00:17:21 +0000 (UTC)
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
X-Inumbo-ID: 89e4311d-f606-11ee-843a-3f19d20e7db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712621842;
	bh=gkDOZNvQIyOacI5mkUkw4VkqIq0yxmzigsvM9ZNKjgo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BFu1d99rOj8puBnTr0sXMpxzidNrZOo4wqKhu557I8YIOhr6mQVW/WA/l+9HbI0g4
	 +V+Y/FbHwOFUmcUMwEpoUgMuqCVq8uCYUse6W9xejZ5KZGfvqFp2KqFGkSDj7wLHfQ
	 6Szv2XrVw97xvVpA9UVwiYAE/d2Et5fVKRPn4hjFJjSiVFqJDDnA1APMSUTCevFHE+
	 SrTOEECW+J3ICLAnmVaR1N/g0lIBqGnx16pk1iAD+8Cv4Uxg5rJM26eRg0TlCxOQrU
	 twlkx2chF5Z+TpxSdvWn+8L4Kfne6wQg/qJOtzxI6CeVnlx30zjw/IFfvQMsUPN8ux
	 ry4y+slluUuag==
Date: Mon, 8 Apr 2024 17:17:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 4/9] x86/efi: tidy switch statement and address
 MISRA violation
In-Reply-To: <48caee9c-ef6d-4109-a6aa-f18d57cefb81@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404081716250.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com> <acbf40ba94a5ef7a8a429498765932b801e42a0a.1712305581.git.nicola.vetrini@bugseng.com> <48caee9c-ef6d-4109-a6aa-f18d57cefb81@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Apr 2024, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -169,20 +169,22 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
> >  
> >          switch ( desc->Type )
> >          {
> > +        default:
> > +            type = E820_RESERVED;
> > +            break;
> 
> This one I guess is tolerable duplication-wise, and I might guess others would
> even have preferred it like that from the beginning. A blank line below here
> would be nice, though (and at some point ahead of and between the two ACPI-
> related case labels blank lines would want adding, too).
> 
> However, ...
> 
> >          case EfiBootServicesCode:
> >          case EfiBootServicesData:
> >              if ( map_bs )
> >              {
> > -        default:
> >                  type = E820_RESERVED;
> >                  break;
> >              }
> > -            /* fall through */
> > +            fallthrough;
> >          case EfiConventionalMemory:
> >              if ( !trampoline_phys && desc->PhysicalStart + len <= 0x100000 &&
> >                   len >= cfg.size && desc->PhysicalStart + len > cfg.addr )
> >                  cfg.addr = (desc->PhysicalStart + len - cfg.size) & PAGE_MASK;
> > -            /* fall through */
> > +            fallthrough;
> >          case EfiLoaderCode:
> >          case EfiLoaderData:
> >              if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> 
> ... below here there is
> 
>             else
>         case EfiUnusableMemory:
>                 type = E820_UNUSABLE;
>             break;
> 
> I understand there are no figure braces here, and hence be the letter this
> isn't an issue with the Misra rule. But (a) some (e.g. Andrew, I guess)
> would likely argue for there wanting to be braces and (b) we don't want to
> be leaving this as is, when the spirit of the rule still suggests it should
> be done differently.

I agree. For clarity I would go with the following because it is easier
to read:

        case EfiLoaderData:
            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
                type = E820_RESERVED;
            else if ( desc->Attribute & EFI_MEMORY_WB )
                type = E820_RAM;
            else
                type = E820_UNUSABLE;
            break;
        case EfiUnusableMemory:
            type = E820_UNUSABLE;
            break;

