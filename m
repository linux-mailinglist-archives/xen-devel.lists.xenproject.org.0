Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DA70722C
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 21:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536007.834133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMpX-0003pO-7f; Wed, 17 May 2023 19:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536007.834133; Wed, 17 May 2023 19:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMpX-0003nT-4U; Wed, 17 May 2023 19:28:59 +0000
Received: by outflank-mailman (input) for mailman id 536007;
 Wed, 17 May 2023 19:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrYZ=BG=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pzMpW-0003nN-Ad
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 19:28:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10786f62-f4e9-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 21:28:56 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-965ab8ed1c0so183162266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 May 2023 12:28:56 -0700 (PDT)
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
X-Inumbo-ID: 10786f62-f4e9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684351735; x=1686943735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09axWUAu7hMSOcfm7NJQZY/JdptKb9Ru1nm1aT0b6uU=;
        b=lnBzNV2+n7/yBxyor14bcPPauELJvTQxJcVUUhwi2eiYFdIfWhQwAjzOkz//b0ZZHC
         smpjNANRklgztHTqHeOSkXtprhgWtu4oNacB2LomxTAjve2UBXxiVCHwTTqSkTQiloXV
         3HF4XAsiGVRkuYIH8BB9d+QZkAiJz11c+G6wHYkT8CwVgarsDoQXdLe0f6apRCbhx3PQ
         RWuLC/fv8cW4rNbaD48JavXSPk6x8irbPniJPLRCf13VeheXdU5yUHN31pkJ9zf35lLq
         So8jbEvuSgPcndw0tvWw6H+m3/1x01JmptzlF9BkkC1DXaGvIPUXvGFTs5DoHcE4YR3n
         cc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684351735; x=1686943735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09axWUAu7hMSOcfm7NJQZY/JdptKb9Ru1nm1aT0b6uU=;
        b=cMNbyAfSIOVPjEeC45JFG1zJkFieS/UMr8JPkKRNS7Kkh8cmk17QV9T4JMDy8vumsa
         SI7hqjYteXqxu49YGiMLo2dqinU+3YyE/XDC7o5q3EiB2FqbiGnMDjTg3QiHgtY+blyh
         G1DsVlKyXsm+7Jbq+Utap2j2i0ui+x5ce7vLjQDsjHkB6B2vqtxSQtIj6FmHxdAYmoKM
         JsoeiahKymzkLFtwxHc5LDkfPl7NCH36+IH0DqkyQtdJSrmFM6u5oPy427e/H1cQ3svf
         TF12h18XhT6NAxYuAlXBMwckBB3pL2gdX7UC66ylGK8zuhuRZ5TXtcl8hkMWkw6p6pzp
         bswA==
X-Gm-Message-State: AC+VfDyWswtbL8ejUfSQEeGF/wZfPYu/nz5OFbLf1qY/itFDSCSQSPet
	DQ0fhF1uqabfVfe6ku2SVZLGQeDPNTKcNBtOrEadaW5O
X-Google-Smtp-Source: ACHHUZ56cD5Zzj2+JNa4rMz97JF+2l1nIbcNmzc1tXD+5Z41FVdagBv5FfxWAcLV87jmhfvbW3J1J2U/S24X9Dlc+Qk=
X-Received: by 2002:a17:907:948e:b0:96a:ec5c:685b with SMTP id
 dm14-20020a170907948e00b0096aec5c685bmr13701204ejc.29.1684351735305; Wed, 17
 May 2023 12:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 17 May 2023 15:28:42 -0400
Message-ID: <CAKf6xpuSg9vdxNejKYNix237ScPmo2WmF1np275f=czjT3jqAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 5:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> In some cases, only few registers on a page needs to be write-protected.

Maybe "In some cases, only part of a page needs to be write-protected"?

> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either), although
> in the latter case the spec forbids placing other registers on the same
> page. Current API allows only marking whole pages pages read-only,
> which sometimes may cover other registers that guest may need to
> write into.
>
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
>
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables (they are in EPT,
> but not granular enough), do this via emulation (or simply page fault
> handler for PV) that handles writes that are supposed to be allowed.
> The new subpage_mmio_ro_add() takes a start physical address and the
> region size in bytes. Both start address and the size need to be 8-byte
> aligned, as a practical simplification (allows using smaller bitmask,
> and a smaller granularity isn't really necessary right now).
> It will internally add relevant pages to mmio_ro_ranges, but if either
> start or end address is not page-aligned, it additionally adds that page
> to a list for sub-page R/O handling. The list holds a bitmask which
> dwords are supposed to be read-only and an address where page is mapped
> for write emulation - this mapping is done only on the first access. A
> plain list is used instead of more efficient structure, because there
> isn't supposed to be many pages needing this precise r/o control.
>
> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash().
> To reach mmio_ro_emulated_write(), change how write violations for
> p2m_mmio_direct are handled - specifically, check if they relate to such
> partially protected page via subpage_mmio_write_accept() and if so, call
> hvm_emulate_one_mmio() for them too. This decodes what guest is trying
> write and finally calls mmio_ro_emulated_write(). Note that hitting EPT
> write violation for p2m_mmio_direct page can only happen if the page was
> on mmio_ro_ranges (see ept_p2m_type_to_flags()), so there is no need for
> checking that again.
> Both of those paths need an MFN to which guest tried to write (to check
> which part of the page is supposed to be read-only, and where
> the page is mapped for writes). This information currently isn't
> available directly in mmio_ro_emulated_write(), but in both cases it is
> already resolved somewhere higher in the call tree. Pass it down to
> mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,24 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>
> +/*
> + * Add more precise r/o marking for a MMIO page. Bytes range specified h=
ere
> + * will still be R/O, but the rest of the page (nor marked as R/O via an=
other

s/nor/not/

> + * call) will have writes passed through.
> + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALI=
GN.
> + *

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c

> +            /*
> +             * We don't know the write seize at this point yet, so it co=
uld be

s/seize/size/

> +             * an unalligned write, but accept it here anyway and deal w=
ith it

s/unalligned/unaligned/

> +             * later.
> +             */

Thanks,
Jason

