Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1F597028
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 15:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388938.625720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJQd-0008Ce-OT; Wed, 17 Aug 2022 13:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388938.625720; Wed, 17 Aug 2022 13:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJQd-0008AC-KW; Wed, 17 Aug 2022 13:49:51 +0000
Received: by outflank-mailman (input) for mailman id 388938;
 Wed, 17 Aug 2022 13:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T5zD=YV=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oOJQc-0008A6-1P
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 13:49:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f09043-1e33-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 15:49:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B549361448
 for <xen-devel@lists.xenproject.org>; Wed, 17 Aug 2022 13:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86345C43470
 for <xen-devel@lists.xenproject.org>; Wed, 17 Aug 2022 13:49:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso971225wmr.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Aug 2022 06:49:45 -0700 (PDT)
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
X-Inumbo-ID: 74f09043-1e33-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660744185;
	bh=NBpAGwshp25WWJ/Jy3bgIzkTJAlvuKaWrA1JRyD7ixA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f9+/8d61Se9BXkXVb1xTb1R4a1kkqbMk5PUv6ZrbTtW05H6VlprSsUvw37qv9HCYE
	 utgK/2jRxQzxLaeXDBPnRoyxYNd119MeO8lgU24gi9SJx4OL9q+ROwXSJx+/jqeBeL
	 DsBzQr3WsWag5Wx+e5DmrQ8l25dunFUkMxOAYMNoi3w1VIAdNpUpXjuUVhmDGT1tvs
	 NsLQwSpSzKo6M9idRbxzLcL5Uv3FdLWWpgjS4irxhvyngJ5j+onB8myVh/mNOwyExd
	 eNWxh+0R4eezePOh/n+OPwKZ6uCnNKdseEcoRCh07qeRiaivk8ltnHYWpNrCfzyXjR
	 xTC3zibta6ldg==
X-Gm-Message-State: ACgBeo0Vx3QArDS2HEQW7Ya3isF4QdieUCDYm0+5cV0tO6JN3mnVk5YC
	GVbHuB/x45a//XWR47yAipX2CMCoyvnT6Mv/lDM=
X-Google-Smtp-Source: AA6agR69uo3EvUIxUNHcqjVYZAIeUF6ANYE+pJcdTYNrUH2ITFwk0e7t0UpGb71W6gGq1pXLp83RfIw90TfMnrbnCU4=
X-Received: by 2002:a1c:a3c4:0:b0:3a5:512f:717a with SMTP id
 m187-20020a1ca3c4000000b003a5512f717amr2238189wme.192.1660744183686; Wed, 17
 Aug 2022 06:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220817105720.111618-1-leo.yan@linaro.org> <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
In-Reply-To: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Aug 2022 15:49:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
Message-ID: <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Jan Beulich <jbeulich@suse.com>
Cc: Leo Yan <leo.yan@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Peter Griffin <peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Aug 2022 at 15:18, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.08.2022 12:57, Leo Yan wrote:
> > On Arm64, when boot Dom0 with the Linux kernel, it reports the warning:
> >
> > [    0.403737] ------------[ cut here ]------------
> > [    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its.c:3074 its_cpu_init+0x814/0xae0
> > [    0.403745] Modules linked in:
> > [    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W         5.15.23-ampere-lts-standard #1
> > [    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    0.403755] pc : its_cpu_init+0x814/0xae0
> > [    0.403758] lr : its_cpu_init+0x810/0xae0
> > [    0.403761] sp : ffff800009c03ce0
> > [    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff880711f43000
> > [    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff80000a3c0000
> > [    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff800009850cb0
> > [    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: ffffffffffffffff
> > [    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a30206e6f6967
> > [    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 3130303130303030
> > [    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff80000870e710
> > [    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 0000000000000000
> > [    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 0000000000000010
> > [    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000ffffffed
> > [    0.403798] Call trace:
> > [    0.403799]  its_cpu_init+0x814/0xae0
> > [    0.403802]  gic_starting_cpu+0x48/0x90
> > [    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
> > [    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
> > [    0.403811]  notify_cpu_starting+0xbc/0xdc
> > [    0.403814]  secondary_start_kernel+0xe0/0x170
> > [    0.403817]  __secondary_switched+0x94/0x98
> > [    0.403821] ---[ end trace f68728a0d3053b70 ]---
> >
> > In the Linux kernel, the GIC driver tries to reserve ITS interrupt
> > table, and the reserved pages can survive for kexec/kdump and will be
> > used for secondary kernel.  Linux kernel relies on MEMRESERVE EFI
> > configuration table for memory page , but this table is not supported
> > by Xen.
> >
> > This patch adds a MEMRESERVE configuration table into the system table,
> > it points to a dummy data structure acpi_table_memreserve, this
> > structure has the consistent definition with the Linux kernel.
> > Following the method in Xen, it creates a table entry for the structure
> > acpi_table_memreserve.
> >
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Cc: Rahul Singh <Rahul.Singh@arm.com>
> > Cc: Peter Griffin <peter.griffin@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  xen/arch/arm/acpi/domain_build.c | 24 ++++++++++++++++++++++++
> >  xen/arch/arm/efi/efi-dom0.c      | 19 ++++++++++++++++---
> >  xen/arch/arm/include/asm/acpi.h  |  1 +
> >  xen/include/acpi/actbl.h         | 17 +++++++++++++++++
> >  xen/include/efi/efiapi.h         |  2 ++
> >  5 files changed, 60 insertions(+), 3 deletions(-)
>
...
> > --- a/xen/include/acpi/actbl.h
> > +++ b/xen/include/acpi/actbl.h
> > @@ -302,6 +302,23 @@ struct acpi_table_fadt {
> >  #define ACPI_FADT_HW_REDUCED        (1<<20)  /* 20: [V5] ACPI hardware is not implemented (ACPI 5.0) */
> >  #define ACPI_FADT_LOW_POWER_S0      (1<<21)  /* 21: [V5] S0 power savings are equal or better than S3 (ACPI 5.0) */
> >
> > +/*******************************************************************************
> > + *
> > + * MEMRESERVE - Dummy entry for memory reserve configuration table
> > + *
> > + ******************************************************************************/
> > +
> > +struct acpi_table_memreserve {
> > +     int size;               /* allocated size of the array */
> > +     int count;              /* number of entries used */
> > +     u64 next;               /* pa of next struct instance */
> > +     struct {
> > +             u64 base;
> > +             u64 size;
> > +     } entry[];
> > +};
>
> This header holds ACPI spec defined data structures. This one looks
> to be a Linux one, and hence shouldn't be defined here. You use it
> in a single CU only, so I see no reason to define it there.
>
> Furthermore - what if Linux decided to change their structure? Or
> is there a guarantee that they won't?

No, there is not. The memreserve table is an internal interface
between the EFI stub loader and the Linux kernel proper.

As I have argued many times before, booting the arm64 kernel in
EFI/ACPI mode without going through the EFI stub violates the ACPI
spec, and relies on interfaces that were not intended for public
consumption.

> Generally such structures
> belong in the public interface, guaranteeing forward compatibility
> even if Linux decided to change / extend theirs (at which point
> consuming code there would need to do translation, but maybe using
> a Xen-defined struct [plus translation in Linux] right away would
> be best).
>

> > --- a/xen/include/efi/efiapi.h
> > +++ b/xen/include/efi/efiapi.h
> > @@ -882,6 +882,8 @@ typedef struct _EFI_BOOT_SERVICES {
> >  #define SAL_SYSTEM_TABLE_GUID    \
> >      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> >
> > +#define LINUX_EFI_MEMRESERVE_TABLE_GUID    \
> > +    { 0x888eb0c6, 0x8ede, 0x4ff5, {0xa8, 0xf0, 0x9a, 0xee, 0x5c, 0xb9, 0x77, 0xc2} }
>
> This header holds EFI spec mandated definitions (generally taken
> from the gnu-efi project), when this one again looks to be a Linux
> one (and again looks to be used in only a single CU).
>

Same point as above.

