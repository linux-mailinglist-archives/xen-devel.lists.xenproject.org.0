Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B4823EC7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661430.1031154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKAC-0000Va-Ah; Thu, 04 Jan 2024 09:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661430.1031154; Thu, 04 Jan 2024 09:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKAC-0000Sh-7e; Thu, 04 Jan 2024 09:37:20 +0000
Received: by outflank-mailman (input) for mailman id 661430;
 Thu, 04 Jan 2024 09:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJxY=IO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rLKAA-0000Sb-Am
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:37:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d89df275-aae4-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 10:37:16 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a27e323fdd3so28987966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 01:37:15 -0800 (PST)
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
X-Inumbo-ID: d89df275-aae4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704361035; x=1704965835; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCOqmmciQjPCCpGOFfXlM0dgp1VyfSrjS3uCZxuDKoQ=;
        b=y/D2ikuuK3Wxxi0Jhd9JUQrufuei05tSUUBQFfspV0EVxC50ELf22GFMF9c26MQjyC
         Cmm3UMYnfRC2crbV49MltgJQ8jr/hqrUEO1f6ID32WxQUtO5wU1F5mNo2cVFFEqudalV
         P5qdUqqEWX2/7Vl2A/Zhd0EsOvIKc288jSo7er06ZnU5Ky3srny+Oc6XP535bEpWp5MO
         8aAp/sb0gMJ9sEiHn+2wHB9Z/XMsBEp4BaBSovwqril+loG8fg4NopI1IFkhRE6Z7Z1o
         pPhLutlZL8cQVon1PJNEYI1LYOZO2Dv47umgsaqcmnlwPGJCI8S2s0p/36WLEKJjjChr
         2org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704361035; x=1704965835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCOqmmciQjPCCpGOFfXlM0dgp1VyfSrjS3uCZxuDKoQ=;
        b=OZ1oruY4mOaSY8DtVA3eLKSfL5RZAkFthVvRqn+NGnznX5tOlpBK61lbfTcIyWtkx7
         IrhKrUcOtxn3UwfFVhJuYXbsoSDerAHrVRXiKbtP5lzu8+ZpQwY9vlNoLfNtlhfC/GDN
         fNKK//XKW4dvKriOg/pwYRMTVC/zJEG9QAW2lIqldLob2tInRCTRdXiNNfbIpmye5Klm
         isZBExMaFTH4W2C1rlhwepzkg7o+xPPStYNlB26iAX/JiFDI6TRcja4WJedKtyw2sTAO
         qRTLHwhFiJJIXuD7qm7M65bk8Xs0jEHSeMMt+Q9y/6T2zllLqKvNwZQaICUjYqVptwY3
         YVyA==
X-Gm-Message-State: AOJu0YxVbZoq9dkyyhEGedZEKNS0NpRqT7AJDvvpnIFJqARj3+/5yjXb
	YbzwDYzOvMi+wuQgP2Kro8zivk80K/rAeCMyPQzWjkEmjyWf4Q==
X-Google-Smtp-Source: AGHT+IErNAGVDRNS+GyL6w9fWLF6JVVSFMrk1NrLFzCzfEZXFVZTBRAiMw72JOy5eNCnV1nBidlyyQ7i6focAs4FoQM=
X-Received: by 2002:a17:906:529a:b0:a23:5753:7ba5 with SMTP id
 c26-20020a170906529a00b00a2357537ba5mr146202ejm.47.1704361035457; Thu, 04 Jan
 2024 01:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <6d652309-50e1-4850-ac52-d086a3a32726@amd.com> <alpine.DEB.2.22.394.2401031601180.1322202@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2401031748040.1322202@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2401031748040.1322202@ubuntu-linux-20-04-desktop>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 4 Jan 2024 10:37:04 +0100
Message-ID: <CAG+AhRUAOcT9HTj+v4vfz6nqBG4FumYc1of9XcmyTYKtW-66yA@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Arm cache coloring
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Thu, Jan 4, 2024 at 2:55=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 3 Jan 2024, Stefano Stabellini wrote:
> > Also I tried this patch series on the "staging" branch and Xen failed t=
o
> > boot, no messages at all from Xen so it must be an early boot failure. =
I
> > am passing this command line options to Xen and running it on QEMU:
> >
> > dom0_mem=3D1024M dom0_max_vcpus=3D1 xen-llc-colors=3D0 dom0-llc-colors=
=3D1-5 llc-way-size=3D65535 llc-coloring=3Dtrue
>
> I managed to make it to work successfully with the following command
> line:
>
> xen-llc-colors=3D0 dom0-llc-colors=3D1-5 llc-way-size=3D64K llc-coloring=
=3Don
>
> I think the problem was llc-way-size that needs to be rounded up (64K
> instead of 65535).
>
> Also I found a few build issues when building for other architectures or
> different kconfig options. This patch addresses those issues (however it
> is not to be taken as is as the build issues should not be introduced in
> the first place and there are probably better way to fix them, but I
> hope it can help).
>
> Cheers,
>
> Stefano
>
>
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index f434efc45b..efe5cf3c23 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -39,7 +39,7 @@ static unsigned int __ro_after_init xen_num_colors;
>
>  #define mfn_color_mask              (nr_colors - 1)
>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> -#define mfn_set_color(mfn, color)   ((mfn_x(mfn) & ~mfn_color_mask) | (c=
olor))
> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask)=
 | (color)))

Thanks for spotting this.

>  /*
>   * Parse the coloring configuration given in the buf string, following t=
he
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 3bb0c9221f..bf16703e24 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -610,10 +610,10 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset, paddr_t xen_paddr)
>      pte.pt.table =3D 1;
>      xen_second[second_table_offset(FIXMAP_ADDR(0))] =3D pte;
>
> +#ifdef CONFIG_ARM_64
>      if ( llc_coloring_enabled )
>          ttbr =3D virt_to_maddr(virt_to_reloc_virt(xen_pgtable));
>      else
> -#ifdef CONFIG_ARM_64
>          ttbr =3D (uintptr_t) xen_pgtable + phys_offset;
>  #else
>          ttbr =3D (uintptr_t) cpu0_pgtable + phys_offset;
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-colorin=
g.h
> index 7cd481e955..516139c4ff 100644
> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -21,7 +21,27 @@
>  extern bool llc_coloring_enabled;
>  #define llc_coloring_enabled (llc_coloring_enabled)
>  #endif
> -
> +#else
> +static inline void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size)
> +{
> +    return NULL;
> +}
> +static inline int domain_set_llc_colors_from_str(struct domain *d, const=
 char *str)
> +{
> +    return -ENOSYS;
> +}
> +static inline int dom0_set_llc_colors(struct domain *d)
> +{
> +    return 0;
> +}
> +static inline bool llc_coloring_init(void)
> +{
> +    return false;
> +}
> +static inline paddr_t xen_colored_map_size(paddr_t size)
> +{
> +    return 0;
> +}
>  #endif
>
>  #ifndef llc_coloring_enabled

Sorry for the compilation mess.

This is definitely a solution, but I wonder if the best thing to do would b=
e
to move all signatures in the common header, without the stubs, relying aga=
in
on DCE. This seems a little strange to me because users of some of those
functions are only in arm code, and they always have to be protected with
llc_coloring_enabled global variable/macro if, but it works (now I'm
compiling also for arm32 and x86).

Thanks.

