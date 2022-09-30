Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB05F1198
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 20:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414380.658626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeKjQ-0003F5-VX; Fri, 30 Sep 2022 18:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414380.658626; Fri, 30 Sep 2022 18:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeKjQ-0003CH-Rk; Fri, 30 Sep 2022 18:27:28 +0000
Received: by outflank-mailman (input) for mailman id 414380;
 Fri, 30 Sep 2022 18:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeKjO-0003CB-Rn
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 18:27:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8836e81a-40ed-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 20:27:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E33CFB82991
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 18:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EF7C43140
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 18:27:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id bu25so8117637lfb.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 11:27:22 -0700 (PDT)
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
X-Inumbo-ID: 8836e81a-40ed-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664562443;
	bh=Tx1IcPFyiS0Zrex2PgsIGkAL7OtkU2ITCcqG7KbiFro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NWucGDDPih9u95p/yPzaHce/aZIKQL5Kc2Y0NxMqlv6R0CJgAVyAPrFaVMcpbiHqz
	 9N4akp4bUp0IlBoXmMVvCUjs21l2+T8V/osOVgZK0xWes/D2P8ulcmxEzFSQ4Oghmg
	 0KRrGrXskganSE3ZcqMCFjuW36Svi0mYkYOLKiETzqbXWllH7RnYzVAXZ6gXp4U7HH
	 shQoMl30l0bmimcGlVB7iEsqkTtAInCzqyOzTSKbW3ne4BuwA2KhGI0IfmJ4452/hx
	 dbStiUYPSrFD0N6KuEeP6jzzXMdY/S44PSPoopOn2w07t0qKx3TRNoI2CzDCMVpl1a
	 alZERQnM5KOqQ==
X-Gm-Message-State: ACrzQf2kuwFpNwSi3WI2jgi+L4Q+PiFHVlpP5nVNHIYjSqs5NHedh5Jj
	BfrFQt6XjoyesB5i1pK+dIAe70K2Sq3yRlbamrc=
X-Google-Smtp-Source: AMsMyM7h3P9nOYUCPle0jRTt0XlCF6hd235OqFbcs7iHdktBvXYS0LEMSwqmhcZaPeZNIcnz0sB/fObE53n24tKpFtw=
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr3559636lfb.583.1664562440957; Fri, 30
 Sep 2022 11:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
 <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com> <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
 <YzcjeiOW8+i2Zxsd@itl-email>
In-Reply-To: <YzcjeiOW8+i2Zxsd@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 20:27:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>
Message-ID: <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Sept 2022 at 19:12, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Fri, Sep 30, 2022 at 06:30:57PM +0200, Ard Biesheuvel wrote:
> > On Fri, 30 Sept 2022 at 08:44, Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > On 30.09.2022 01:02, Demi Marie Obenour wrote:
> > > > Memory of type EFI_CONVENTIONAL_MEMORY, EFI_LOADER_CODE, EFI_LOADER_DATA,
> > > > EFI_BOOT_SERVICES_CODE, and EFI_BOOT_SERVICES_DATA may be clobbered by
> > > > Xen before Linux gets to start using it.  Therefore, Linux under Xen
> > > > must not use EFI tables from such memory.  Most of the remaining EFI
> > > > memory types are not suitable for EFI tables, leaving only
> > > > EFI_ACPI_RECLAIM_MEMORY, EFI_RUNTIME_SERVICES_DATA, and
> > > > EFI_RUNTIME_SERVICES_CODE.  When running under Xen, Linux should only
> > > > use tables that are located in one of these types of memory.
> > > >
> > > > This patch ensures this, and also adds a function
> > > > (xen_config_table_memory_region_max()) that will be used later to
> > > > replace the usage of the EFI memory map in esrt.c when running under
> > > > Xen.  This function can also be used in mokvar-table.c and efi-bgrt.c,
> > > > but I have not implemented this.
> > > >
> > > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > >
> > > In Xen we don't clobber EfiBootServices{Code,Data} when xen.efi was passed
> > > "-mapbs". Should we perhaps extend the interface such that Dom0 can then
> > > also use tables located in such regions, perhaps by faking
> > > EFI_MEMORY_RUNTIME in the attributes returned by XEN_FW_EFI_MEM_INFO?
> > >
> >
> > I know this ship has sailed for x86, but for the sake of other
> > architectures, I'd strongly recommend leaving the EFI_MEMORY_RUNTIME
> > bits alone, for the same reasons I gave earlier. (Runtime mappings for
> > the firmware code itself, page table fragmentation etc etc)
>
> Why do you say that it has sailed for x86?
>

The x86 EFI code in Linux makes changes to the EFI memory map in many
different places in the code. On other architectures, we have managed
to avoid this, so that the EFI memory map is always identical to the
one provided by the firmware at boot.

> > I know very little about Xen, but based on the context you provided in
> > this thread, I'd say that the best approach from the Xen side is to
> > convert all EfiBootServicesData regions that have configuration tables
> > pointing into them into EfiAcpiReclaimMemory.
>
> Should Xen convert the entire region, or should it try to reserve only
> the memory it needs?  The latter would require it to parse the
> configuration tables.  Is there a list of configuration tables that can
> legitimately be in EfiBootServicesData regions?
>

Not really, no. So you would have to convert the entire region
/unless/ Xen knows the GUID, and therefore knows how to derive the
size of the table, allowing it to reserve memory more conservatively.
However, I doubt whether this is worth it: splitting entries implies
rewriting the memory map, which is a thing I'd rather avoid if I were
in your shoes.

> > I take it XEN_FW_EFI_MEM_INFO is an existing interface? If so, you
> > might do the same for the returned type - EfiBootServicesData ->
> > EfiAcpiReclaimMemory, and not muck about with the EFI_MEMORY_RUNTIME
> > attribute.
>
> It is indeed an existing interface, and this is a much better idea than
> what you proposed.

Right.

