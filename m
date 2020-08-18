Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A5248CDC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 19:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k85Ia-0004wd-1m; Tue, 18 Aug 2020 17:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k85IY-0004wY-TU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 17:21:22 +0000
X-Inumbo-ID: c7f9c239-aa6a-4e44-9ad4-f4eb0c013b4d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7f9c239-aa6a-4e44-9ad4-f4eb0c013b4d;
 Tue, 18 Aug 2020 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597771281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VfmAjtjrR5Ynd62bslgEeAhZ8za/6MtFXClJnwwT3/4=;
 b=YJ81wXtt+Mh6h7UcxDJ8/qXmnGuxaPgQgPezdubCmSVtBZKxRwQI6HG+
 CXL3WVUyrbNIGE6UCB2wpw7YOYGA2enObEkS+Z6Apsq1mJUUqf/M3MRRZ
 DA/AwFlclbwcoFqHOUS8kYRb3r0qfIuB9a+SuSMNIVerWfRlLp6a8L2nv k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zO7pjpdgDyALpNUdQNwaOEZc3lL4eELU/ihYg2Dk/WSBgXSI53yydL07x0s+fGosQacUtfHAO8
 hLVsdsQZE2mHA24h0GXBO69J1XZe/Oz6Ye4QGx0Lxo6XqAVJ3F2h+F2XeKZ1wimMH1ljzlA2XE
 xzihH7RPDcurRln5vKCsLGDyZXQFM1BGUc7syThAvoLDyPKXJYf++tXXehMMeu/176XJOi5pI9
 JaSPzAwyimhC+h8vrg7Zsi3ir4u44HwtUTBeNlEDZiclQ+FOpCld0CaDW8nLJKSBP8uLaS6tS2
 dOM=
X-SBRS: 2.7
X-MesageID: 24808311
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,328,1592884800"; d="scan'208";a="24808311"
Date: Tue, 18 Aug 2020 19:21:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
CC: Ard Biesheuvel <ardb@kernel.org>, <linux-efi@vger.kernel.org>,
 <norbert.kaminski@3mdeb.com>, <xen-devel@lists.xenproject.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200818172114.GO828@Air-de-Roger>
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
 <20200817090013.GN975@Air-de-Roger>
 <20200818120135.GK1679@mail-itl>
 <20200818124710.GK828@Air-de-Roger>
 <20200818150020.GL1679@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200818150020.GL1679@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Tue, Aug 18, 2020 at 05:00:20PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 18, 2020 at 02:47:10PM +0200, Roger Pau Monné wrote:
> > On Tue, Aug 18, 2020 at 02:01:35PM +0200, Marek Marczykowski-Górecki wrote:
> > > Do you mean PV dom0 should receive full EFI memory map? Jan already
> > > objected this as it would be a layering violation.
> > 
> > dom0 is already capable of getting the native e820 memory map using
> > XENMEM_machine_memory_map, I'm not sure why allowing to return the
> > memory map in EFI form would be any different (or a layering
> > violation in the PV dom0 case).
> >
> > Do you have a reference to that thread? I certainly missed it.
> 
> See this thread: http://markmail.org/message/nrrvuau5whebksy2
> 
> > For PVH dom0 we could consider something different, since in that case
> > there's a guest memory map which could likely be returned in EFI
> > format and with the EFI regions if required.
> > 
> > > > > Skip this part on Xen PV (let Xen do the right thing if it deems
> > > > > necessary) and use ESRT table normally.
> > > > 
> > > > Maybe it would be better to introduce a new hypercall (or add a
> > > > parameter to XENMEM_machine_memory_map) in order to be able to fetch
> > > > the EFI memory map?
> > > >
> > > > That should allow a PV dom0 to check the ESRT is correct and thus not
> > > > diverge from bate metal.
> > > 
> > > Note the EFI memory map there is used not just to check things, but to
> > > actually modify it to reserve the region. I think that's rather Xen
> > > responsibility, not dom0. See the comment from Ard.
> > 
> > But that would modify Linux copy of the memory map, which is fine? My
> > understanding of EFI is limited, but I don't think such changes are
> > feed back into EFI, so Linux is completely free to do whatever it
> > wants with it's copy of the EFI memory map.
> 
> Yes, but the thing is to make sure Xen doesn't use that memory, not only
> dom0. See below.
> 
> > > > > +	if (efi_enabled(EFI_MEMMAP)) {
> > > > > +		rc = efi_mem_desc_lookup(efi.esrt, &md);
> > > > > +		if (rc < 0 ||
> > > > > +		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> > > > > +		     md.type != EFI_BOOT_SERVICES_DATA &&
> > > > > +		     md.type != EFI_RUNTIME_SERVICES_DATA)) {
> > > > > +			pr_warn("ESRT header is not in the memory map.\n");
> > > > > +			return;
> > > > > +		}
> > > > 
> > > > Here you blindly trust the data in the ESRT in the PV case, without
> > > > checking it matches the regions on the memory map, which could lead to
> > > > errors if ESRT turns to be wrong.
> > > 
> > > I don't think checking merely if ESRT lives somewhere in
> > > EFI_{BOOT,RUNTIME}_SERVICES_DATA area guarantees its correctness.
> > > 
> > > On the other hand, this seems to be done to prevent overwriting that
> > > memory with something else (see that in case of EFI_BOOT_SERVICES_DATA
> > > it is later marked as reserved. I think it should be rather done by Xen,
> > > not dom0.
> > 
> > Forcing Xen to do all those checks seems quite a tedious work, and in
> > fact the memory map that dom0 has might be more complete than the one
> > Xen is able to construct, as Xen doesn't have an AML parser so it's
> > not able to get all the possible info from ACPI.
> 
> Let me draw the picture from the beginning.

Thanks, greatly appreciated.

> EFI memory map contains various memory regions. Some of them are marked
> as not needed after ExitBootServices() call (done in Xen before
> launching dom0). This includes EFI_BOOT_SERVICES_DATA and
> EFI_BOOT_SERVICES_CODE.
> 
> EFI SystemTable contains pointers to various ConfigurationTables -
> physical addresses (at least in this case). Xen does interpret some of
> them, but not ESRT. Xen pass the whole (address of) SystemTable to Linux
> dom0 (at least in PV case). Xen doesn't do anything about tables it
> doesn't understand.
> 
> Now, the code in Linux takes the (ESRT) table address early and checks
> the memory map for it. We have 3 cases:
>  - it points at area marked as neither EFI_*_SERVICES_DATA, nor with
>    EFI_MEMORY_RUNTIME attribute -> Linux refuse to use it
>  - it points to EFI_RUNTIME_SERVICES_DATA or with EFI_MEMORY_RUNTIME
>    attribute - Linux uses the table; memory map already says the area
>    belongs to EFI and the OS should not use it for something else
>  - it points to EFI_BOOT_SERVICES_DATA - Linux mark the area as reserved
>    to not release it after calling ExitBootServices()
> 
> The problematic is the third case - at the time when Linux dom0 is run,
> ExitBootServices() was already called and EFI_BOOT_SERVICES_* memory was
> already released. It could be already used for something else (for
> example Xen could overwrite it while loading dom0).
> 
> Note the problematic case should be the most common - UEFI specification
> says "The ESRT shall be stored in memory of type EfiBootServicesData"
> (chapter 22.3 of UEFI Spec v2.6).
> 
> For this reason, to use ESRT in dom0, Xen should do something about it
> before ExitBootServices() call. While analyzing all the EFI tables is
> probably not a viable option, it can do some simple action:
>  - retains all the EFI_BOOT_SERVICES_* areas - there is already code
>    for that, controlled with /mapbs boot switch (to xen.efi, would need
>    another option for multiboot2+efi)
>  - have a list of tables to retain - since Xen already do analyze some
>    of the ConfigurationTables, it can also have a list of those to
>    preserve even if they live in EFI_BOOT_SERVICES_DATA. In this case,
>    while Xen doesn't need to parse the whole table, it need to parse it's
>    header to get the table size - to reserve that memory and not reuse
>    it after ExitBootServices().

Xen seems to already contain skeleton
XEN_EFI_query_capsule_capabilities and XEN_EFI_update_capsule
hypercalls which is what should be used in order to perform the
updates?

So yes, I agree Xen should make sure the region of the table is not
freed when exiting boot services, and that dom0 can access it. I
guess we should move the checks done by Linux to Xen, and then only
provide the ESRT table to dom0 if the checks (now done by Xen) pass.

It might be helpful to see the whole picture here with the hooks to
perform the updates also implemented, as those are missing in Xen (and
Linux?). That would give a clearer view of what you are trying to
achieve IMO.

Thanks, Roger.

