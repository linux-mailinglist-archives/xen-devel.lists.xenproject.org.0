Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111849E1B1F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 12:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847977.1263002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIRDt-0005Qb-9M; Tue, 03 Dec 2024 11:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847977.1263002; Tue, 03 Dec 2024 11:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIRDt-0005Nz-5m; Tue, 03 Dec 2024 11:37:45 +0000
Received: by outflank-mailman (input) for mailman id 847977;
 Tue, 03 Dec 2024 11:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6RU2=S4=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tIRDr-0005Nt-JE
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 11:37:43 +0000
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [2607:f8b0:4864:20::d34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00e530d4-b16b-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 12:37:41 +0100 (CET)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-84194e90c0fso345336939f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 03:37:41 -0800 (PST)
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
X-Inumbo-ID: 00e530d4-b16b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733225860; x=1733830660; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIRpuvz3RljS/vyayA+DDMGZzyz0+4eCbKMkqB6SKK8=;
        b=gwS9H+Us5/gKWOVZD61KuMtiR3Ruk1bAf/8IsNnmSTse+qAiiDGGFG38wqaNCtxx1D
         fg4BalIsltYKdvgDMIPSmjqwSyBNxaNtyLO+Lcg047CDnQ8D48NV9E2ZMppaxcSsP2xn
         YoqbEtQtxKkh7QRPpuihVRbvhabLvF1sm0nNqckMK63sHJuUxhA8g5zeK4iU9PO3AWze
         0FF6AWmBoFvgASqgvYpSsjLyYOqI83cCecTqeBze5RoWmvs1ZtDqi+EHwi7x7DKc8e3k
         ZCBCndYsvrmAB95NiuSsXnR3xeNRyVFDhM3QK10gelOUQ/j+vZHEtPnfaUfY8tRzNfZm
         paig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733225860; x=1733830660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIRpuvz3RljS/vyayA+DDMGZzyz0+4eCbKMkqB6SKK8=;
        b=qpxET5JLY8HOuMwDyreWXl0t6qGa0qq7SEwA81unIaN16Y2vuf3QN5Ha7TRQptneg2
         fu5AgldzqQRBH89wOqpvZmEDZVWWWp3EkeMpibQQmf4pGOFX4LnqxsFVdbbHZuT8RIA6
         EElB2MH1EdGC2eQgxZIOl4RN/lNw5YUmxMUlUv4SeyErDwSJtdKasG0QdL9+k4aiMcF8
         hr+nywa0N67FrGVnS/IkT7HD0hKrivCpzdUjke53uoUlb1WYh3Hx1YkTLn2loiJdkYsX
         +RA6blGSzvY15HN099GyHl/EVV7Q0sGZcMThCT7meyqLBdpx9XB3BSma1EfLbObvhDeU
         4VHA==
X-Gm-Message-State: AOJu0YzPtV2rt698UL50ITK5OgqKylntP7aSMsCmM+SCKlQNgeuqGhhZ
	6tx/eGkpOe9jCazy/7FQaQH3jKovDGxACOmhpPnMP3EyoxPVdNVI9LmWBmKFx7FcAC6DGkMItt5
	i21PRGzLd1ZXL9+oFiGOc3t5tfbOkTGbdOs1+lg==
X-Gm-Gg: ASbGncu5hTuOoGAq4SJH6eYI9jtFNPJ4NumKLKp5BaWLsLIyxIkQH9tF7EixY1vEkOJ
	OzXncBI9aimGGXITtfDMHlVgf44ahLxNj
X-Google-Smtp-Source: AGHT+IH3K5wKzJpLJGqLBXjUYu58KD2ERsrMrEEleRbv+TVCTEyU1PsRtF1D+yBo102Nwpizc84aPFUd7G+J8s/TVWg=
X-Received: by 2002:a05:6602:1513:b0:843:c87e:ec24 with SMTP id
 ca18e2360f4ac-8445b55330dmr215165039f.4.1733225859774; Tue, 03 Dec 2024
 03:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-13-carlo.nonato@minervasys.tech> <800b0b49-e6c5-4a83-8ee6-d89d51613b0c@xen.org>
 <CAG+AhRXM=u33jq2yY4F4tJHUXBzDJ8jOHcM53ejmPtfPweQLQg@mail.gmail.com> <5580b3fc-66d7-4193-9c54-2733fb628418@xen.org>
In-Reply-To: <5580b3fc-66d7-4193-9c54-2733fb628418@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 3 Dec 2024 12:37:29 +0100
Message-ID: <CAG+AhRWSpjOcaabWGpCDh6zqUfMpUVGe3eM2zbWz759=Fv+Kfg@mail.gmail.com>
Subject: Re: [PATCH v11 12/12] xen/arm: add cache coloring support for Xen image
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Tue, Dec 3, 2024 at 11:36=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> On 03/12/2024 10:08, Carlo Nonato wrote:
> > Hi Julien,
> >
> > On Mon, Dec 2, 2024 at 10:44=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi Carlo,
> >
> > [...]
> >
> >>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.=
c
> >>> index 671eaadbc1..3732d5897e 100644
> >>> --- a/xen/arch/arm/arm64/mmu/mm.c
> >>> +++ b/xen/arch/arm/arm64/mmu/mm.c
> >>> @@ -1,6 +1,7 @@
> >>>    /* SPDX-License-Identifier: GPL-2.0-only */
> >>>
> >>>    #include <xen/init.h>
> >>> +#include <xen/llc-coloring.h>
> >>>    #include <xen/mm.h>
> >>>    #include <xen/pfn.h>
> >>>
> >>> @@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
> >>>    }
> >>>
> >>>    extern void switch_ttbr_id(uint64_t ttbr);
> >>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t=
 len);
> >>>
> >>>    typedef void (switch_ttbr_fn)(uint64_t ttbr);
> >>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, =
size_t len);
> >>>
> >>>    void __init switch_ttbr(uint64_t ttbr)
> >>
> >> Given the change below, I think this function needs to be renamed.
> >> Possibly to relocate_and_jump() with a comment explaning that the
> >> relocation only happen for cache-coloring.
> >
> > Changing the name of switch_ttbr() to relocate_and_jump() seems a bit
> > misleading to me. First I need to change the name also for arm32 where =
there's
> > no relocation at all. Second, relocation is something that happens
> > conditionally so I don't think it's a good name for the function.
>
> Feel free to propose a new name. The main thing is the current name
> can't stay "switch_ttbr()" because you are doing more than switching the
> TTBR.
>
> The other solution is to have a separate call for relocating xen (which
> will fall-through to switch_ttbr) and another one for those that only to
> switch TTBR.

What about a function like this one, defined in xen/arch/arm/arm64/mmu/mm.c=
:

typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t =
len);

void __init relocate_and_switch_ttbr(uint64_t ttbr) {
    vaddr_t id_addr =3D virt_to_maddr(relocate_xen);
    relocate_xen_fn *fn =3D (relocate_xen_fn *)id_addr;
    lpae_t pte;

    /* Enable the identity mapping in the boot page tables */
    update_identity_mapping(true);

    /* Enable the identity mapping in the runtime page tables */
    pte =3D pte_of_xenaddr((vaddr_t)relocate_xen);
    pte.pt.table =3D 1;
    pte.pt.xn =3D 0;
    pte.pt.ro =3D 1;
    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);

    /* Relocate Xen and switch TTBR */
    fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);

    /*
     * Disable the identity mapping in the runtime page tables.
     * Note it is not necessary to disable it in the boot page tables
     * because they are not going to be used by this CPU anymore.
     */
    update_identity_mapping(false);
}

which is actually a clone of switch_ttbr() but it does relocation. I would
then call it in case of coloring in setup_pagetables(). This should go in t=
he
direction you suggested, but it would duplicate a bit of code. What do you
think about it?

> Cheers,
>
> --
> Julien Grall
>

Thanks,
- Carlo

