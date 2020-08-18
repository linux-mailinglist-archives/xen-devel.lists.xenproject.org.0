Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A2248516
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 14:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k811M-0002Mn-7j; Tue, 18 Aug 2020 12:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k811K-0002Mi-S8
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 12:47:18 +0000
X-Inumbo-ID: f5bd4836-7adf-4790-b466-9e3f52d2d35f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5bd4836-7adf-4790-b466-9e3f52d2d35f;
 Tue, 18 Aug 2020 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597754837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=30nedNabKIl2ONo0gOi3dKQIA20CDBWllkqmCPSHJQE=;
 b=R48whlrltZfBDwFdCF+zUhppsHO8xdLMnlOj0lazS8DwBCdQkRQkveps
 el1ytNrwrqb1nk3A9mR0/sM3mj8okBSEUAsZuzkmrBax1rM/UM9y+C7cg
 hbvw7+jK/FVGaUZHhTeHXX5PdEJ80h4jCajK3VRYEwCBQ1DaryeGCCHM4 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dSa65gImyo2iPr/x4jx1ac6nBLkXBjB+3bhzo7yCsGsutshy6SyHRC1/mvirRj8xwTSf8HyP28
 RrcpF4aWlO5hBNwDOqVsxTTYwSAKprYd2wAksJgMSqhsWMx3PqigSW3AQZE6DyfLEkT30Tc7MS
 FbaT5U2wEV32R2uVGjyUq9Afv2n63ehmFsFawimfJ08+6N14gHlT//+oDkhM4wS7tglHHTTlsr
 ES+04Ng9m5JFNjSS09sCzsjRu7eNejVzZ5z20jceaWbqZBPmINdZh63qh8jv5o3dPdRuVgBzud
 HdM=
X-SBRS: 2.7
X-MesageID: 24920909
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24920909"
Date: Tue, 18 Aug 2020 14:47:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: Ard Biesheuvel <ardb@kernel.org>, <linux-efi@vger.kernel.org>,
 <norbert.kaminski@3mdeb.com>, <xen-devel@lists.xenproject.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200818124710.GK828@Air-de-Roger>
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
 <20200817090013.GN975@Air-de-Roger>
 <20200818120135.GK1679@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200818120135.GK1679@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 18, 2020 at 02:01:35PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Aug 17, 2020 at 11:00:13AM +0200, Roger Pau Monné wrote:
> > On Sun, Aug 16, 2020 at 02:19:49AM +0200, Marek Marczykowski-Górecki wrote:
> > > In case of Xen PV dom0, Xen passes along info about system tables (see
> > > arch/x86/xen/efi.c), but not the memory map from EFI.
> > 
> > I think that's because the memory map returned by
> > XENMEM_machine_memory_map is in e820 form, and doesn't contain the
> > required information about the EFI regions due to the translation done
> > by efi_arch_process_memory_map in Xen?
> 
> Yes, I think so.
> 
> > > This makes sense
> > > as it is Xen responsible for managing physical memory address space.
> > > In this case, it doesn't make sense to condition using ESRT table on
> > > availability of EFI memory map, as it isn't Linux kernel responsible for
> > > it.
> > 
> > PV dom0 is kind of special in that regard as it can create mappings to
> > (almost) any MMIO regions, and hence can change it's memory map
> > substantially.
> 
> Do you mean PV dom0 should receive full EFI memory map? Jan already
> objected this as it would be a layering violation.

dom0 is already capable of getting the native e820 memory map using
XENMEM_machine_memory_map, I'm not sure why allowing to return the
memory map in EFI form would be any different (or a layering
violation in the PV dom0 case).

Do you have a reference to that thread? I certainly missed it.

For PVH dom0 we could consider something different, since in that case
there's a guest memory map which could likely be returned in EFI
format and with the EFI regions if required.

> > > Skip this part on Xen PV (let Xen do the right thing if it deems
> > > necessary) and use ESRT table normally.
> > 
> > Maybe it would be better to introduce a new hypercall (or add a
> > parameter to XENMEM_machine_memory_map) in order to be able to fetch
> > the EFI memory map?
> >
> > That should allow a PV dom0 to check the ESRT is correct and thus not
> > diverge from bate metal.
> 
> Note the EFI memory map there is used not just to check things, but to
> actually modify it to reserve the region. I think that's rather Xen
> responsibility, not dom0. See the comment from Ard.

But that would modify Linux copy of the memory map, which is fine? My
understanding of EFI is limited, but I don't think such changes are
feed back into EFI, so Linux is completely free to do whatever it
wants with it's copy of the EFI memory map.

> > > 
> > > This is a requirement for using fwupd in PV dom0 to update UEFI using
> > > capsules.
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > >  drivers/firmware/efi/esrt.c | 47 ++++++++++++++++++++-----------------
> > >  1 file changed, 25 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
> > > index d5915272141f..5c49f2aaa4b1 100644
> > > --- a/drivers/firmware/efi/esrt.c
> > > +++ b/drivers/firmware/efi/esrt.c
> > > @@ -245,36 +245,38 @@ void __init efi_esrt_init(void)
> > >  	int rc;
> > >  	phys_addr_t end;
> > >  
> > > -	if (!efi_enabled(EFI_MEMMAP))
> > > +	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
> > >  		return;
> > >  
> > >  	pr_debug("esrt-init: loading.\n");
> > >  	if (!esrt_table_exists())
> > >  		return;
> > >  
> > > -	rc = efi_mem_desc_lookup(efi.esrt, &md);
> > > -	if (rc < 0 ||
> > > -	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> > > -	     md.type != EFI_BOOT_SERVICES_DATA &&
> > > -	     md.type != EFI_RUNTIME_SERVICES_DATA)) {
> > > -		pr_warn("ESRT header is not in the memory map.\n");
> > > -		return;
> > > -	}
> > > +	if (efi_enabled(EFI_MEMMAP)) {
> > > +		rc = efi_mem_desc_lookup(efi.esrt, &md);
> > > +		if (rc < 0 ||
> > > +		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> > > +		     md.type != EFI_BOOT_SERVICES_DATA &&
> > > +		     md.type != EFI_RUNTIME_SERVICES_DATA)) {
> > > +			pr_warn("ESRT header is not in the memory map.\n");
> > > +			return;
> > > +		}
> > 
> > Here you blindly trust the data in the ESRT in the PV case, without
> > checking it matches the regions on the memory map, which could lead to
> > errors if ESRT turns to be wrong.
> 
> I don't think checking merely if ESRT lives somewhere in
> EFI_{BOOT,RUNTIME}_SERVICES_DATA area guarantees its correctness.
> 
> On the other hand, this seems to be done to prevent overwriting that
> memory with something else (see that in case of EFI_BOOT_SERVICES_DATA
> it is later marked as reserved. I think it should be rather done by Xen,
> not dom0.

Forcing Xen to do all those checks seems quite a tedious work, and in
fact the memory map that dom0 has might be more complete than the one
Xen is able to construct, as Xen doesn't have an AML parser so it's
not able to get all the possible info from ACPI.

Thanks, Roger.

