Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F6728535
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 18:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545374.851775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Ieb-0006qu-D3; Thu, 08 Jun 2023 16:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545374.851775; Thu, 08 Jun 2023 16:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Ieb-0006nc-AI; Thu, 08 Jun 2023 16:38:29 +0000
Received: by outflank-mailman (input) for mailman id 545374;
 Thu, 08 Jun 2023 16:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SM50=B4=gmail.com=konrad.r.wilk@srs-se1.protection.inumbo.net>)
 id 1q7IeZ-0006nW-7X
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 16:38:27 +0000
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e313b5cb-061a-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 18:38:25 +0200 (CEST)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-784f7f7deddso307485241.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jun 2023 09:38:25 -0700 (PDT)
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
X-Inumbo-ID: e313b5cb-061a-11ee-b232-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242304; x=1688834304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=maYgySw253aQp+1qS+G3fizKuN5LyFWhl5CeH3Pd1Rc=;
        b=XzexsevLKj/uqZSFU8Fg6TWwxyWizkP8dGkBBdWlJZaOwscmYT/dcDO5yJC7FuSqXQ
         CUYEl4IoQboStGZmxjmUPgf/EkYWMaMRY0T+WUSWxOYPNNmTVYws1HnRR32KUExwijcf
         khHEqsXpC9n6Q+Oj+WxBsqD4F1TGYn1wLWJxqBG6YsEC+TfLGYK3IrhcbpuD1DQZI9MA
         bnPr7751MCUQYOjKIdKrow5eqcW7/8ddd3M0GZnZuCvleKsbZ6SqjdEXrh4LbDRtZ74o
         dK9PKGTct7uaBKHK8uD28YJa4kAe/EN6FDJtuhJuhw3hssseJZtLfJckghYFSUF93k0y
         RxJQ==
X-Gm-Message-State: AC+VfDyzU8wR3cOOFQDmtPUTPYh3aNs+f+DEOdDJgw7hrF1oxokrItdl
	zzHYDL/4l8/uTYEdYR/kEVjoye8Sgij7Mcum4Sk=
X-Google-Smtp-Source: ACHHUZ5OuS4967TKEwaba2HW4aCd+g3iM/cEQnhv0qE6rpTWD8+Kx3Y4nbhBskp4M2bmvvjQskRJR9egBehwEfbyMAY=
X-Received: by 2002:a67:fb11:0:b0:437:e49d:634a with SMTP id
 d17-20020a67fb11000000b00437e49d634amr1996709vsr.35.1686242302273; Thu, 08
 Jun 2023 09:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230605102840.1521549-1-ross.lagerwall@citrix.com>
In-Reply-To: <20230605102840.1521549-1-ross.lagerwall@citrix.com>
Reply-To: konrad@darnok.org
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Date: Thu, 8 Jun 2023 12:38:11 -0400
Message-ID: <CAPbh3rsnBgeZJCvzg3Bh_VRxiYEOe0vgQkpyeyDeCBirBLhLiQ@mail.gmail.com>
Subject: Re: [PATCH v3] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Peter Jones <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks fine to me, but could I ask you to triple check that on
non-Xen it still detects the iBFT?

Thx!

On Mon, Jun 5, 2023 at 6:28=E2=80=AFAM Ross Lagerwall <ross.lagerwall@citri=
x.com> wrote:
>
> To facilitate diskless iSCSI boot, the firmware can place a table of
> configuration details in memory called the iBFT. The presence of this
> table is not specified, nor is the precise location (and it's not in the
> E820) so the kernel has to search for a magic marker to find it.
>
> When running under Xen, Dom 0 does not have access to the entire host's
> memory, only certain regions which are identity-mapped which means that
> the pseudo-physical address in Dom0 =3D=3D real host physical address.
> Add the iBFT search bounds as a reserved region which causes it to be
> identity-mapped in xen_set_identity_and_remap_chunk() which allows Dom0
> access to the specific physical memory to correctly search for the iBFT
> magic marker (and later access the full table).
>
> This necessitates moving the call to reserve_ibft_region() somewhat
> later so that it is called after e820__memory_setup() which is when the
> Xen identity mapping adjustments are applied. The precise location of
> the call is not too important so I've put it alongside dmi_setup() which
> does similar scanning of memory for configuration tables.
>
> Finally in the iBFT find code, instead of using isa_bus_to_virt() which
> doesn't do the right thing under Xen, use early_memremap() like the
> dmi_setup() code does.
>
> The result of these changes is that it is possible to boot a diskless
> Xen + Dom0 running off an iSCSI disk whereas previously it would fail to
> find the iBFT and consequently, the iSCSI root disk.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>
> In v3:
> * Expanded commit message.
> * Used IBFT_ constants.
>
>  arch/x86/kernel/setup.c            |  2 +-
>  arch/x86/xen/setup.c               | 28 +++++++++++++++++++---------
>  drivers/firmware/iscsi_ibft_find.c | 26 +++++++++++++++++---------
>  include/linux/iscsi_ibft.h         | 10 +++++++++-
>  4 files changed, 46 insertions(+), 20 deletions(-)
>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 16babff771bd..616b80507abd 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -796,7 +796,6 @@ static void __init early_reserve_memory(void)
>
>         memblock_x86_reserve_range_setup_data();
>
> -       reserve_ibft_region();
>         reserve_bios_regions();
>         trim_snb_memory();
>  }
> @@ -1032,6 +1031,7 @@ void __init setup_arch(char **cmdline_p)
>         if (efi_enabled(EFI_BOOT))
>                 efi_init();
>
> +       reserve_ibft_region();
>         dmi_setup();
>
>         /*
> diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
> index c2be3efb2ba0..8b5cf7bb1f47 100644
> --- a/arch/x86/xen/setup.c
> +++ b/arch/x86/xen/setup.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/init.h>
> +#include <linux/iscsi_ibft.h>
>  #include <linux/sched.h>
>  #include <linux/kstrtox.h>
>  #include <linux/mm.h>
> @@ -764,17 +765,26 @@ char * __init xen_memory_setup(void)
>         BUG_ON(memmap.nr_entries =3D=3D 0);
>         xen_e820_table.nr_entries =3D memmap.nr_entries;
>
> -       /*
> -        * Xen won't allow a 1:1 mapping to be created to UNUSABLE
> -        * regions, so if we're using the machine memory map leave the
> -        * region as RAM as it is in the pseudo-physical map.
> -        *
> -        * UNUSABLE regions in domUs are not handled and will need
> -        * a patch in the future.
> -        */
> -       if (xen_initial_domain())
> +       if (xen_initial_domain()) {
> +               /*
> +                * Xen won't allow a 1:1 mapping to be created to UNUSABL=
E
> +                * regions, so if we're using the machine memory map leav=
e the
> +                * region as RAM as it is in the pseudo-physical map.
> +                *
> +                * UNUSABLE regions in domUs are not handled and will nee=
d
> +                * a patch in the future.
> +                */
>                 xen_ignore_unusable();
>
> +#ifdef CONFIG_ISCSI_IBFT_FIND
> +               /* Reserve 0.5 MiB to 1 MiB region so iBFT can be found *=
/
> +               xen_e820_table.entries[xen_e820_table.nr_entries].addr =
=3D IBFT_START;
> +               xen_e820_table.entries[xen_e820_table.nr_entries].size =
=3D IBFT_END - IBFT_START;
> +               xen_e820_table.entries[xen_e820_table.nr_entries].type =
=3D E820_TYPE_RESERVED;
> +               xen_e820_table.nr_entries++;
> +#endif
> +       }
> +
>         /* Make sure the Xen-supplied memory map is well-ordered. */
>         e820__update_table(&xen_e820_table);
>
> diff --git a/drivers/firmware/iscsi_ibft_find.c b/drivers/firmware/iscsi_=
ibft_find.c
> index 94b49ccd23ac..71f51303c2ba 100644
> --- a/drivers/firmware/iscsi_ibft_find.c
> +++ b/drivers/firmware/iscsi_ibft_find.c
> @@ -42,8 +42,6 @@ static const struct {
>  };
>
>  #define IBFT_SIGN_LEN 4
> -#define IBFT_START 0x80000 /* 512kB */
> -#define IBFT_END 0x100000 /* 1MB */
>  #define VGA_MEM 0xA0000 /* VGA buffer */
>  #define VGA_SIZE 0x20000 /* 128kB */
>
> @@ -52,9 +50,9 @@ static const struct {
>   */
>  void __init reserve_ibft_region(void)
>  {
> -       unsigned long pos;
> +       unsigned long pos, virt_pos =3D 0;
>         unsigned int len =3D 0;
> -       void *virt;
> +       void *virt =3D NULL;
>         int i;
>
>         ibft_phys_addr =3D 0;
> @@ -70,13 +68,20 @@ void __init reserve_ibft_region(void)
>                  * so skip that area */
>                 if (pos =3D=3D VGA_MEM)
>                         pos +=3D VGA_SIZE;
> -               virt =3D isa_bus_to_virt(pos);
> +
> +               /* Map page by page */
> +               if (offset_in_page(pos) =3D=3D 0) {
> +                       if (virt)
> +                               early_memunmap(virt, PAGE_SIZE);
> +                       virt =3D early_memremap_ro(pos, PAGE_SIZE);
> +                       virt_pos =3D pos;
> +               }
>
>                 for (i =3D 0; i < ARRAY_SIZE(ibft_signs); i++) {
> -                       if (memcmp(virt, ibft_signs[i].sign, IBFT_SIGN_LE=
N) =3D=3D
> -                           0) {
> +                       if (memcmp(virt + (pos - virt_pos), ibft_signs[i]=
.sign,
> +                                  IBFT_SIGN_LEN) =3D=3D 0) {
>                                 unsigned long *addr =3D
> -                                   (unsigned long *)isa_bus_to_virt(pos =
+ 4);
> +                                   (unsigned long *)(virt + pos - virt_p=
os + 4);
>                                 len =3D *addr;
>                                 /* if the length of the table extends pas=
t 1M,
>                                  * the table cannot be valid. */
> @@ -84,9 +89,12 @@ void __init reserve_ibft_region(void)
>                                         ibft_phys_addr =3D pos;
>                                         memblock_reserve(ibft_phys_addr, =
PAGE_ALIGN(len));
>                                         pr_info("iBFT found at %pa.\n", &=
ibft_phys_addr);
> -                                       return;
> +                                       goto out;
>                                 }
>                         }
>                 }
>         }
> +
> +out:
> +       early_memunmap(virt, PAGE_SIZE);
>  }
> diff --git a/include/linux/iscsi_ibft.h b/include/linux/iscsi_ibft.h
> index 790e7fcfc1a6..e2742748104d 100644
> --- a/include/linux/iscsi_ibft.h
> +++ b/include/linux/iscsi_ibft.h
> @@ -21,12 +21,20 @@
>   */
>  extern phys_addr_t ibft_phys_addr;
>
> +#ifdef CONFIG_ISCSI_IBFT_FIND
> +
>  /*
>   * Routine used to find and reserve the iSCSI Boot Format Table. The
>   * physical address is set in the ibft_phys_addr variable.
>   */
> -#ifdef CONFIG_ISCSI_IBFT_FIND
>  void reserve_ibft_region(void);
> +
> +/*
> + * Physical bounds to search for the iSCSI Boot Format Table.
> + */
> +#define IBFT_START 0x80000 /* 512kB */
> +#define IBFT_END 0x100000 /* 1MB */
> +
>  #else
>  static inline void reserve_ibft_region(void) {}
>  #endif
> --
> 2.31.1
>

