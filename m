Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vwunH42HImr7ZgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:23:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C86465C4
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:23:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WXZ+EhFK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329194.1593400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPq0-0004Qv-4I; Fri, 05 Jun 2026 08:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329194.1593400; Fri, 05 Jun 2026 08:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPq0-0004Ov-1P; Fri, 05 Jun 2026 08:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1329194;
 Fri, 05 Jun 2026 08:23:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVPpy-0004Op-LH
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:23:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPpy-003zIc-1e
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:23:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a22877e-e002-0a2a0a5209dd-0a2a4507a53a-16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:23:29 +0200
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a228781-229c-0a2a45070019-d155d0ade454-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:23:29 +0200
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-396770cdcfdso16808521fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:23:29 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780647809; cv=none;
        d=google.com; s=arc-20240605;
        b=gFYJsy/vWxt3K7J0q48JGLvkf9D0hfDWx6eRGDESQcijqp9k8XKKs7zEjXCmJd065h
         ZN9fDS4Nz/3Sot61Isn8lYEES31+XrZI1+85oRy0BamwaxcRCm8hvivGjy0Qph2SdgYh
         EJ5Ou7k6tCQzWelCfwm1g5OHz9SU+ieoy6yyqDxQbHtYxzHyXvlThSGHHJv4iWZcyjTf
         YF2eArTuIrusuhqoQfGhTAjHdfNt3Z++Wxa4/zA5sfV3rigpTH8eZ7v/bgx0Pp4fgl3o
         igaTGPXZF00wxTwR0JVQEVzjbsIVO8t7X5MvTd4WTdOtMUVm9WkHUbBy6egJJ1dXFRFW
         zpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMDJNO+H26meIgoJlkClBW7xpC2Ar2hog1WpEgzBnsg=;
        fh=Y5QS2FhfJ5DVfRnDS0fbDMy8TA07saVqHmV0gu+ovF0=;
        b=bg2Bwyhspz0uzx1Qnx0utIf+sP7q8bCZVgwbM8ap4p5LCLJfz9da0S60cLKEFqjhiz
         ggaQZvQtMt0BTQ608kHFl+TyhJEj4cE0GXk3F89+xYTdOyYdTjA7wC8dtHpbNQJbCFbv
         rxE47O2XHnbnzm7yfr96a0bOjFXECyrXTXHhjxRVmMxE/HEqg+wyCr7RejagqWZia20v
         GrIwYoyOrcqUZnELFt611Rhv6EEDEfcKy2ctYH5H+uBXsKL9lDdgEIaK181NM7DXOnl2
         t9F8OIi8lIDKXrwYXmqPL4dFyCsqAmFsVS4NZDjZu7k058KmpL32nlgVNn6MQp5/BsNY
         eNLw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780647809; x=1781252609; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMDJNO+H26meIgoJlkClBW7xpC2Ar2hog1WpEgzBnsg=;
        b=WXZ+EhFKd2KTxRo70Y/zhGMlDkCOW07HrKqm3JY8ms0VUrFpeYecP//VUMc9fowIRe
         qveLNpiLqGjz/kd9qccqrUED58ZMWPkS02C0+sYELElT+vFFyXHnWZ5SZ7J+rihIk6CW
         VWW7wl4vJzaA/at4MJH+vzVBYa7b2GCaO0Qj4rTP0U9SrkoZK2tZ4IVGmfMvxqRBPIw4
         k+KTxnEm5H3248yke2jvKOx9jdvo3YVO1dPDEpj6B/nyvz3fBqIPQ22ZhNXxvBK0GhSu
         tIh40oQrV46g3C07i2TKBkDETvRYTFLDUvzLZ/4DOElnrEibi/+nFw0var1AyNt13zN0
         GkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647809; x=1781252609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMDJNO+H26meIgoJlkClBW7xpC2Ar2hog1WpEgzBnsg=;
        b=EWHK37wwFtKXJNXTf+JG5N4LUL0didUtcyKSh3vVII45CHXx06EYoQwMmyu6cR/Con
         As+PFINrkAVYBCBhBNCV3SlQ/mScC+7zhYZ9xCdPZ5TrlQusZDm22e9c1m/V59FboX9u
         Kp3XroSIaRczCVR3OQzY/rQsWh3XFVD0bLGQhVpFMAr/RjlW6pub6n84r8kmlJf+INzm
         2c5ASKv9MoAN8xIBDjWM7BSEzSwHIqgO//xrc7fv0+ehUjiIQGZhSKNPwMxFFDtbbhf6
         viQjNBhOa5tPJq5TV9wDekxNJstjFX/oZhB0bo/dZdCYZhqlWM5UXdOs2B+/TrqyxHCl
         wgEw==
X-Gm-Message-State: AOJu0Ywp6B572Xile1dEbMdVqM12in7OXG9UalHXZKdrzHszKwP7OzDX
	C65cuTvZFFq57ue5F3z7dw/N2ukf1x8nM3/fuJsXesbnm1dfL/VvwhmJItzokBUHcJqnL+GJD/E
	PduAxZiVKLb2RGscqG4wxvUIfIcAMBpo=
X-Gm-Gg: Acq92OFBk6yF+JC1g5f7qmbQ2KH9LEWk/xi7x+zfQ6lKeDG7c8dHDKIR9XEcwNeYGET
	IiCavuQg9lEZed18cvh8vdVAc9dAv4ECDZ1nzDsFhHcl0VPudoQYqdAvJO8NuROJ/PLEddyCW23
	DV+CnwkTXx5jgemahE5CM97WkvsDazdnj0avhSDwmc3Nw7nhAVo2jxPEs3Oyd5Sj0fmyjaAGvCt
	WuRGNHEYFJjXJZxBu03nrjQ+LJBHfb8JhqSdOj21dmgFJGFU+hKXts1Lk8KSKaESqAqeIprwQil
	g23DJB7yG0rz98ez
X-Received: by 2002:a05:6512:3347:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa87b88f32mr737887e87.34.1780647808680; Fri, 05 Jun 2026
 01:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780602987.git.mykola_kvach@epam.com> <11537d2b05a6c36d4ba0d852efadeba91d9f6225.1780602987.git.mykola_kvach@epam.com>
 <a026d572-f0f7-4797-819a-ff3490ba14c8@amd.com>
In-Reply-To: <a026d572-f0f7-4797-819a-ff3490ba14c8@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Jun 2026 11:23:17 +0300
X-Gm-Features: AVHnY4KEUDUVtnkdurNARgnu0aRXt7TBlFVmL0kJYtvvJtgIAWDc80WW-3-r35M
Message-ID: <CAGeoDV_oHtY9VPN13UHwRtPd36LruAv740=op6iYXgPah8DBeA@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v2 1/2] xen/arm: split DTB/initrd placement helpers
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1780647809-20F66C48-891C9F1E/0/0
X-purgate-type: clean
X-purgate-size: 6640
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD8C86465C4

Hi Michal,

Thanks for the review.

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
> We are in the RC phase, so please CC Oleksii (release manager) as we need=
 his
> tags for fixes. Adding him now.

Ack, I will keep Oleksii Cc'ed for this series.

>
> On 05-Jun-26 07:19, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The Arm zImage loader currently computes the kernel load address and
> > places the DTB/initrd in one local flow. The hardware-domain memory
> > allocator needs to reuse those placement rules before it chooses bank 0=
,
> > but open-coding the same calculations there would make the fix harder t=
o
> > audit.
> >
> > Split the existing logic into small helpers:
> > - kernel_zimage_place_in_bank() computes the zImage load address for a
> >   given bank.
> > - first_bank_can_fit_modules() checks the aggregate first-bank
> >   footprint.
> > - find_dtb_initrd_placement() chooses the DTB/initrd location within a
> >   known bank and kernel range.
> >
> > Rename place_modules() to place_dtb_initrd() so the code distinguishes
> > the kernel image from the DTB/initrd placement area. Also update the
> > stale xg_dom_arm.c path in the placement comment.
> >
> > The caller still panics in the same cases as before, so this is intende=
d
> > to be behavior preserving.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - New patch split out from the hardware-domain first-bank fix.
> > - Rename the DTB/initrd placement helpers to avoid treating the kernel
> >   and DTB/initrd as the same kind of module.
> > - Pass the RAM end address to find_dtb_initrd_placement() instead of
> >   recomputing it from the RAM size.
> > - Update the stale xg_dom_arm.c reference in the placement comment.
> > ---
> >  xen/arch/arm/kernel.c                 | 147 ++++++++++++++++----------
> >  xen/common/device-tree/domain-build.c |   6 +-
> >  2 files changed, 97 insertions(+), 56 deletions(-)
> >
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index b72585b7fe..d1be4d8074 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -40,27 +40,59 @@ struct minimal_dtb_header {
> >      /* There are other fields but we don't use them yet. */
> >  };
> >
> > -static void __init place_modules(struct kernel_info *info,
> > -                                 paddr_t kernbase, paddr_t kernend)
> > +static paddr_t __init
> > +kernel_zimage_place_in_bank(const struct kernel_info *info,
> > +                            paddr_t bank_start, paddr_t bank_size)
> >  {
> > -    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte al=
ignment */
> > -    const struct boot_module *mod =3D info->bd.initrd;
> > -    const struct membanks *mem =3D kernel_info_get_mem(info);
> > -    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> > -    const paddr_t dtb_len =3D ROUNDUP(fdt_totalsize(info->fdt), MB(2))=
;
> > -    const paddr_t modsize =3D initrd_len + dtb_len;
> > +    paddr_t load_addr;
> >
> > -    /* Convenient */
> > -    const paddr_t rambase =3D mem->bank[0].start;
> > -    const paddr_t ramsize =3D mem->bank[0].size;
> > -    const paddr_t ramend =3D rambase + ramsize;
> > +#ifdef CONFIG_HAS_DOMAIN_TYPE
> > +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > +        return bank_start + info->image.text_offset;
> > +#endif
> > +
> > +    /*
> > +     * If start is zero, the zImage is position independent, in this
> > +     * case Documentation/arm/Booting recommends loading below 128MiB
> > +     * and above 32MiB. Load it as high as possible within these
> > +     * constraints, while also avoiding the DTB.
> > +     */
> > +    if ( info->image.start =3D=3D 0 )
> > +    {
> > +        paddr_t load_end;
> > +
> > +        load_end =3D bank_start + bank_size;
> > +        load_end =3D MIN(bank_start + MB(128), load_end);
> > +
> > +        load_addr =3D load_end - info->image.len;
> > +        /* Align to 2MB */
> > +        load_addr &=3D ~(MB(2) - 1);
> For the future mechanical changes, you should not be making even such tin=
y
> changes like s/(2 << 20)/MB(2) without mentioning them in commit msg. For=
 today,
> it's ok.

Got it.

>
> > +    }
> > +    else
> > +        load_addr =3D info->image.start;
> > +
> > +    return load_addr;
> > +}
> > +
> > +static bool __init first_bank_can_fit_modules(paddr_t ramsize,
> > +                                              paddr_t kernbase, paddr_=
t kernend,
> > +                                              paddr_t dtb_initrd_size)
> > +{
> >      const paddr_t kernsize =3D ROUNDUP(kernend, MB(2)) - kernbase;
> > -    const paddr_t ram128mb =3D rambase + MB(128);
> >
> > -    paddr_t modbase;
> > +    /*
> > +     * Check only the aggregate kernel + DTB/initrd footprint. The act=
ual
> > +     * DTB/initrd location is selected by find_dtb_initrd_placement().
> > +     */
> > +    return dtb_initrd_size + kernsize <=3D ramsize;
> > +}
> >
> > -    if ( modsize + kernsize > ramsize )
> > -        panic("Not enough memory in the first bank for the kernel+dtb+=
initrd\n");
> > +static bool __init find_dtb_initrd_placement(paddr_t rambase, paddr_t =
ramend,
> > +                                             paddr_t kernbase, paddr_t=
 kernend,
> > +                                             paddr_t dtb_initrd_size,
> > +                                             paddr_t *dtb_base)
> > +{
> > +    const paddr_t ram128mb =3D rambase + MB(128);
> >
> >      /*
> >       * DTB must be loaded such that it does not conflict with the
> > @@ -77,55 +109,64 @@ static void __init place_modules(struct kernel_inf=
o *info,
> >       * just before the kernel.
> >       *
> >       * If changing this then consider
> > -     * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
> > +     * tools/libs/guest/xg_dom_arm.c:meminit as well.
> This fixes the kernel.c -> tools pointer, but the reverse comment in
> xg_dom_arm.c:meminit still points at place_modules. This needs to be fixe=
d.
>
> I think this can be done on commit, therefore:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Ack on the reverse pointer in xg_dom_arm.c. It should point at
place_dtb_initrd() now. I am fine with this being fixed on commit, but
since I will send a new revision for the comments on patch 2, I will
fold this update into patch 1 as well.

Best regards,
Mykola

