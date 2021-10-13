Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A633B42CA05
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 21:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208823.365071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1majuW-0003La-Ce; Wed, 13 Oct 2021 19:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208823.365071; Wed, 13 Oct 2021 19:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1majuW-0003Jn-9i; Wed, 13 Oct 2021 19:27:32 +0000
Received: by outflank-mailman (input) for mailman id 208823;
 Wed, 13 Oct 2021 19:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1majuV-0003Jh-G2
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 19:27:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 844925be-f2ed-4ee5-a332-b8fcd1ff0c48;
 Wed, 13 Oct 2021 19:27:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23FBB61152;
 Wed, 13 Oct 2021 19:27:29 +0000 (UTC)
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
X-Inumbo-ID: 844925be-f2ed-4ee5-a332-b8fcd1ff0c48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634153249;
	bh=ZurS1cYABhJbXnEz3J5+JCyzwtXpx6moM7PtHgEHXgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hbfm3R7KGYCvzLuFsc5XREdtPNmxbfis6ajusXmMR6z3Z3h24F3WBHGj/l692tj+z
	 C47wraXgwVwRxZ2LaxLtCLA7rcZgHH8TiRUHWQrck3Tdr9Hw+/KPNolIGExczOHk2W
	 BKTpktRy+Xxts38wge3IfXOGULmyoXn8FjvXejpDq+jJjqsFLrU25OYo8Ii9LjOHB0
	 2ahMjV3DVrfDAgRf8K6ZL/eSpwlHt4Msug12R70pPG5f0aPuO00Ljo3bPbi+nI2LJ3
	 W4DBmUuGRefeXaE/bvCAbkeqSfdcGnbN3E1LEa3cw7k67bZD9+1U+Eabg8/ZCK6mBp
	 o1sN9+6+Yk3gQ==
Date: Wed, 13 Oct 2021 12:27:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Andre.Przywara@arm.com" <Andre.Przywara@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
Message-ID: <alpine.DEB.2.21.2110131223210.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com> <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local> <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com> <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
 <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1563365647-1634153249=:9408"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1563365647-1634153249=:9408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Oct 2021, Jan Beulich wrote:
> On 13.10.2021 16:51, Oleksandr Andrushchenko wrote:
> > On 13.10.21 16:00, Jan Beulich wrote:
> >> On 13.10.2021 10:45, Roger Pau Monné wrote:
> >>> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> >>>> --- /dev/null
> >>>> +++ b/xen/arch/arm/vpci.c
> >>>> @@ -0,0 +1,102 @@
> >>>> +/*
> >>>> + * xen/arch/arm/vpci.c
> >>>> + *
> >>>> + * This program is free software; you can redistribute it and/or modify
> >>>> + * it under the terms of the GNU General Public License as published by
> >>>> + * the Free Software Foundation; either version 2 of the License, or
> >>>> + * (at your option) any later version.
> >>>> + *
> >>>> + * This program is distributed in the hope that it will be useful,
> >>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>> + * GNU General Public License for more details.
> >>>> + */
> >>>> +#include <xen/sched.h>
> >>>> +
> >>>> +#include <asm/mmio.h>
> >>>> +
> >>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> >>>> +
> >>>> +/* Do some sanity checks. */
> >>>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> >>>> +{
> >>>> +    /* Check access size. */
> >>>> +    if ( len > 8 )
> >>>> +        return false;
> >>>> +
> >>>> +    /* Check that access is size aligned. */
> >>>> +    if ( (reg & (len - 1)) )
> >>>> +        return false;
> >>>> +
> >>>> +    return true;
> >>>> +}
> >>>> +
> >>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> >>>> +                          register_t *r, void *p)
> >>>> +{
> >>>> +    unsigned int reg;
> >>>> +    pci_sbdf_t sbdf;
> >>>> +    unsigned long data = ~0UL;
> >>>> +    unsigned int size = 1U << info->dabt.size;
> >>>> +
> >>>> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> >>>> +    reg = REGISTER_OFFSET(info->gpa);
> >>>> +
> >>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
> >>>> +        return 0;
> >>>> +
> >>>> +    data = vpci_read(sbdf, reg, min(4u, size));
> >>>> +    if ( size == 8 )
> >>>> +        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> >>>> +
> >>>> +    *r = data;
> >>>> +
> >>>> +    return 1;
> >>>> +}
> >>>> +
> >>>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> >>>> +                           register_t r, void *p)
> >>>> +{
> >>>> +    unsigned int reg;
> >>>> +    pci_sbdf_t sbdf;
> >>>> +    unsigned long data = r;
> >>>> +    unsigned int size = 1U << info->dabt.size;
> >>>> +
> >>>> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> >>>> +    reg = REGISTER_OFFSET(info->gpa);
> >>>> +
> >>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
> >>>> +        return 0;
> >>>> +
> >>>> +    vpci_write(sbdf, reg, min(4u, size), data);
> >>>> +    if ( size == 8 )
> >>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> >>> I think those two helpers (and vpci_mmio_access_allowed) are very
> >>> similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
> >>> the point where I would consider moving the shared code to vpci.c as
> >>> vpci_ecam_{read,write} and call them from the arch specific trap
> >>> handlers.
> >> Except that please can we stick to mcfg or mmcfg instead of ecam
> >> in names, as that's how the thing has been named in Xen from its
> >> introduction? I've just grep-ed the code base (case insensitively)
> >> and found no mention of ECAM. There are only a few "became".
> > I do understand that this is historically that we do not have ECAM in Xen,
> > but PCI is not about Xen. Thus, I think it is also acceptable to use
> > a commonly known ECAM for the code that works with ECAM.
> 
> ACPI, afaik, also doesn't call this ECAM. That's where MCFG / MMCFG
> actually come from, I believe.

My understanding is that "MCFG" is the name of the ACPI table that
describes the PCI config space [1]. The underlying PCI standard for the
memory mapped layout of the PCI config space is called ECAM. Here, it
makes sense to call it ECAM as it is firmware independent.

[1] https://wiki.osdev.org/PCI_Express
--8323329-1563365647-1634153249=:9408--

