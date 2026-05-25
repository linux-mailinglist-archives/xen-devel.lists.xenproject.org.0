Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM/IGrd5FGokNgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 18:32:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B698B5CCE9B
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 18:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319362.1587007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRYDV-0001Jj-9H; Mon, 25 May 2026 16:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319362.1587007; Mon, 25 May 2026 16:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRYDV-0001Gu-3p; Mon, 25 May 2026 16:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1319362;
 Mon, 25 May 2026 16:31:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wRYDT-0001Go-GJ
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 16:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRYDS-00FFFO-Pu
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 18:31:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a147953-e002-0a2a0a5209dd-0a2a4508da4c-34
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 18:31:46 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a147972-63b5-0a2a45080019-d155a735ddca-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 18:31:46 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5a8cb92f26aso10419033e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 09:31:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779726706; cv=none;
        d=google.com; s=arc-20240605;
        b=TW74qCTXuNcoEDs+JwjELR+Rmu+P+pjMdnxYa05fTiWEIDCBK5Pjn7kJ/rDltv3jRG
         JBxjZ/twu3Jyvo3gNtDpVE9PfVLPDw3wAt0yLNMdBaSV8VWV5wFHFMWqS+6yEaGn8xuK
         +lQAAn92Idk68FfggzFiaDE75NlQ6bfhGSBDwARZ7qj1ZsOthJqrqKO5IH0fz4zOEDAm
         VD3d/YsXXxlV1HcHHy/Y+UocmbIiKzuzS1O/jclu+LyFB8Jbn/Iq6zte/2xBxC8jlnMU
         fTQkA94r9cyg/A9+1vSydtEe2VAN22IOsyakloHx91IiTETf/qAgkeHCSh5xtNhRgRzJ
         cF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bdjHvJti1PFGKhzoVezSMAeyJZDGbVl6BB/kPZLIlDY=;
        fh=9JZxiMpSfuLqiQWy+/Qm7fbwQ+MYsT4GTch2ySqG6FU=;
        b=RDg8EY3RqMTzqcCNj529l6Nq0K8Q0/+NNRkq8S0X8GvVzgHjhENRd4dj2Le1Ye2gz8
         x9haK7DQds0t8M0Ks48cZCIQgII788RgeCR7jj3Z2mSHE6epgsN4b++M7TxurikRuViW
         XTsiYP9nXW9yarYjKvw3t9NAxa81TSqcUJmfOp0pYiR23wDzWsKu7wQSi/GhyIDT2Vtp
         N/H3FCT3h5eELk8/UZgPx/O/9M4R7LMBLmC6RXZNjlG2qjs5xk51A0/Q0VtIZNhE2W2n
         tTUIodRTRHS2QieB4OOQExLHkUfH5kOOjj2bCZcFvXG4mYRw1BXNKhRYW37+a11jKztN
         hr+A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779726706; x=1780331506; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdjHvJti1PFGKhzoVezSMAeyJZDGbVl6BB/kPZLIlDY=;
        b=rH6y+YZMTI0WxeSl7vVgcMx265xN/fqMrZ8poD0M5sSVyhtpRnKqu1Om2vTm2UqZdF
         Pf/DTs8CS6GisVXx2r1hjWAAbBFVPJhvVGkRQk4Jbi8XYMDtYTwuJxE3xGX07HHri+pd
         D2e7Uw+1GRMWn4RmxQqZ18kiCsUFmg6jNfJ//DqJe1CZq5vUojNOimJR/CXmYuGvj5lq
         9wYB+qbgOViNZr+B/7rTAIew+KsaHIkslqTDrgNyZnMA5Doe4Vk43Tmu6jMBPk9LXtO5
         LK0MI/RgfnEnk3B5HBP51cMtlaQWL8bQcxUJMpdxGqZMITI5R3eBawlpg7koiFC1TeQ3
         gwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779726706; x=1780331506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdjHvJti1PFGKhzoVezSMAeyJZDGbVl6BB/kPZLIlDY=;
        b=YF4mhSznY6h5YrKnY3h1mFvqz0DzYeutH8gYkiAUCPQpnsEEwzBq5NFy8hHs26sWv8
         oBLxaVvjLK2XoNLIRXm3VNSJ0GVys/wQZYtSsM5WOIRNH+cp/g4pD25hmvD+QFo0DGgx
         IHbHC7/LDyvHbXVTfX6A2Mfe+fJ3RYZebYdasiolAJsgCKUi/vOMzclnlqnbLVWxoYEO
         BZ3D63Z7oBekEKasrCmBmk+tyRFSE1FxSmYbtnbwIfDAOLDWKYWf3LqwRRvCtdD8Vdnk
         R5MTY0VaECnjffJjElyxpL2OGGMwZnUf9CHMoss05rzl7rKwlHMEo9DaZZGLMpOTjWTG
         caZA==
X-Gm-Message-State: AOJu0YymPq8+CRj+3NNNMdeZTmd7CwcjJuVqLhXkEBkZn7qtY8kNOxaV
	TPh/zaYfT8kuM1OPOe0/rRWeBCQ21jykSf83U8Yc2DPXqzDHoqEdnn1g54LoL/resQ9M3kTEqpj
	nO+9fdVYwzvLRD0JU+bqONxl7fZHDlh0=
X-Gm-Gg: Acq92OEL4Fp84pQ+rZL0P+qZsoveKXKc4GBeoGXUxt+wEEBCYL9oUrcSKBGJS0AyXqi
	V1twyaZ7Ov+9UlTYzKJo4XcDaP7M/q+K0CjKCVIhcrHD897ouj8L0cqQBafWct+gFDDURxutWSr
	XnJEgNpH0H56AwDP16Aqm54S1nnp0LeB+T3ExjrSL1brR9kwOQonDF2dXCOEqtruHJdY9iiN49R
	UQm1tSAMi3ACb/uV6CqBDxd+shiZJLLaox+XQDEcmDR4IH4SvNrSYLQ4s3RUAu70elk8pswr3fc
	J2K0
X-Received: by 2002:ac2:54bc:0:b0:5a8:6b89:5e5b with SMTP id
 2adb3069b0e04-5aa323cf6admr3635114e87.36.1779726705738; Mon, 25 May 2026
 09:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola_kvach@epam.com>
 <ag+C21L9WoH3ngg8@kraken>
In-Reply-To: <ag+C21L9WoH3ngg8@kraken>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 25 May 2026 19:31:33 +0300
X-Gm-Features: AVHnY4K5F0OU4tmh7fdxYvq7UIAaTrEP1RX1L81qx53F7Ov3mquqO3EjVwIDgJI
Message-ID: <CAGeoDV-Tpt4Qa2fdWCwFdAfvcOSyssnyBn3w_fEvArJxf7eiww@mail.gmail.com>
Subject: Re: [RFC PATCH] device-tree: size first hwdom bank for boot modules
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1779726706-BE577DB1-01B0C2FC/0/0
X-purgate-type: clean
X-purgate-size: 8052
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B698B5CCE9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 1:10=E2=80=AFAM <dmukhin@ford.com> wrote:
>
> Hi Mykola,
>
> The patch looks good!
>
> I would try to add a CI coverage for QEMU aarch64 tests, since QEMU
> supports multiple RAM banks topology.
>
> What do you think?
>
> Also, few remarks below.
>
> On Sun, May 17, 2026 at 11:57:56PM +0300, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > With LLC coloring enabled, the hardware domain memory comes from
> > allocate_hwdom_memory(), not from the fixed direct-map banks used when
> > coloring is off.
> >
> > Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> > DMA") made that allocator sort free host regions by ascending address s=
o
> > Dom0 gets DMA-capable low memory first. The first bank filter still onl=
y
> > required 128MB. That can select a low region which is large enough for
> > the heuristic, but not large enough for place_modules() to put the Dom0
> > kernel, generated DTB and initrd contiguously in bank 0.
> >
> > Ask arch code for any additional first-bank size requirement. On Arm,
> > compute it from the actual Dom0 kernel placement, rounded initrd size a=
nd
> > generated DTB size hint. For 64-bit Image kernels, include the text off=
set
> > from the candidate bank start, because the returned requirement is comp=
ared
> > with a bank size measured from that start. The hint covers both the nor=
mal
> > Device Tree path and the minimal DTB created for ACPI boot.
> >
> > Check the first-bank threshold against the size which will actually be
> > assigned to Dom0, after capping the host region by the remaining unassi=
gned
> > Dom0 memory. Otherwise a large host region could pass the test but stil=
l
> > produce a first guest bank too small for place_modules().
> >
> > Use the typed min()/max() helpers for this normal allocation arithmetic=
;
> > MIN()/MAX() are intended for preprocessor-style contexts and skip the t=
ype
> > checking provided by the lowercase helpers.
> >
> > This keeps the DMA-oriented allocation policy from de99f3263555 while
> > preventing a too-small bank 0 from reaching place_modules().
> >
> > Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for =
DMA")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Test/setup notes:
> >
> > The failure was reproduced on a Renesas H3ULCB/R-Car H3 (r8a7795)
> > arm64 board booted through U-Boot/TFTP and using huge initrd.
> >
> > Relevant Xen command line excerpt:
> >   dom0_mem=3D2048M llc-coloring=3Don
> >
> > Boot module layout from Xen:
> >   MODULE[2]: 0x0000000084000040-0x000000008e75d92f Ramdisk
> >   MODULE[3]: 0x00000000a0000000-0x00000000a3ffffff Kernel
> >   MODULE[4]: 0x00000000a4000000-0x00000000a400ffff XSM Policy
> >
> > The initrd is about 168MB. With LLC coloring enabled and the low-addres=
s
> > allocation policy from de99f3263555, Dom0 can receive a 192MB first ban=
k:
> >   d0 BANK[0] 0x00000048000000-0x00000054000000 (192MB)
> >
> > That bank satisfies the old 128MB minimum but is too small for the
> > rounded Dom0 kernel, generated DTB and initrd placement. The observed
> > failure before this patch was:
> >   Panic on CPU 0:
> >   Not enough memory in the first bank for the kernel+dtb+initrd
> >
> > With this patch, the same boot skips the too-small low region for bank =
0
> > and reaches Dom0:
> >   d0 BANK[0] 0x00000057000000-0x00000084000000 (720MB)
> >   d0 BANK[1] 0x0000008e800000-0x000000c0000000 (792MB)
> >   d0 BANK[2] 0x00000500000000-0x00000521800000 (536MB)
> >   d0: extended region 0: 0x48000000->0x54000000
> >   Loading zImage from 0x00000000a0000000 to 0x57000000-0x5b000000
> >   Loading d0 initrd from 0x0000000084000040 to 0x5f200000-0x6995d8f0
> >   Loading d0 DTB to 0x5f000000-0x5f011c80
> >   Linux version 5.10.194-yocto-standard
> > ---
> >  xen/arch/arm/acpi/domain_build.c        |  2 --
> >  xen/arch/arm/domain_build.c             |  8 ++++++
> >  xen/arch/arm/include/asm/domain_build.h |  4 +++
> >  xen/arch/arm/include/asm/kernel.h       |  8 ++++++
> >  xen/arch/arm/kernel.c                   | 35 +++++++++++++++++++++++++
> >  xen/common/device-tree/domain-build.c   | 27 ++++++++++++++-----
> >  xen/include/xen/fdt-kernel.h            |  8 ++++++
> >  7 files changed, 83 insertions(+), 9 deletions(-)
> >
> > diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domai=
n_build.c
> > index 249d899c33..db16f7fa94 100644
> > --- a/xen/arch/arm/acpi/domain_build.c
> > +++ b/xen/arch/arm/acpi/domain_build.c
> > @@ -26,8 +26,6 @@
> >  #undef virt_to_mfn
> >  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >
> > -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> > -
> >  static int __init acpi_iomem_deny_access(struct domain *d)
> >  {
> >      acpi_status status;
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 1efddc60ef..226e053c68 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, co=
nst char *e)
> >                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         =
\
> >                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
> >
> > +paddr_t __init dom0_get_fdt_size_hint(void)
> > +{
> > +    if ( !acpi_disabled )
> > +        return ACPI_DOM0_FDT_MIN_SIZE;
> > +
> > +    return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
>
> I would invert the condition so it is read more straightforward:
>
>     if ( acpi_disabled )
>         return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE=
;
>
>     return ACPI_DOM0_FDT_MIN_SIZE;
>
> [..]
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index b72585b7fe..3644663e2f 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -128,6 +128,41 @@ static paddr_t __init kernel_zimage_place(struct k=
ernel_info *info)
> >      return load_addr;
> >  }
> >
> > +static paddr_t __init kernel_placement_size(paddr_t load_addr, paddr_t=
 len)
> > +{
> > +    return ROUNDUP(load_addr + len, MB(2)) - load_addr;
> > +}
> > +
> > +paddr_t __init arch_get_min_first_bank_size(struct kernel_info *info,
> > +                                            paddr_t bank_start)
> > +{
> > +    const struct boot_module *mod =3D info->bd.initrd;
> > +    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> > +    const paddr_t dtb_len =3D ROUNDUP(dom0_get_fdt_size_hint(), MB(2))=
;
> > +    paddr_t kernsize;
> > +
> > +#ifdef CONFIG_HAS_DOMAIN_TYPE
>
> Perhaps use `IS_ENABLED(CONFIG_HAS_DOMAIN_TYPE)` to reduce ifdefery?
> My impression that IS_ENABLED() is preferred.
>
> > +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > +    {
> > +        paddr_t load_addr =3D bank_start + info->image.text_offset;
> > +
> > +        /*
> > +         * The caller compares this value with a size measured from
> > +         * bank_start, so include the text offset before the kernel.
> > +         */
> > +        kernsize =3D ROUNDUP(load_addr + info->image.len, MB(2)) - ban=
k_start;
> > +        return kernsize + initrd_len + dtb_len;
> > +    }
> > +#endif
> > +
> > +    if ( info->image.start =3D=3D 0 )
>
> Here too: invert the condition?
>
>        if ( info->image.start )
>            kernsize =3D kernel_placement_size(info->image.start, info->im=
age.len);
>        else
>            ...

I think I will keep the explicit info->image.start =3D=3D 0 check here.

In this code, start =3D=3D 0 is an established special case rather than jus=
t
a numeric input to the helper. kernel_zimage_place() handles it
explicitly as the position-independent image case where Xen chooses the
load address. Keeping the branch in the same form matches the surrounding
code and keeps that special case visible.

Best regards,
Mykola

