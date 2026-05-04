Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL95CsUx+GlBrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:42:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CA4B89C7
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299484.1574020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm4R-00022n-VN; Mon, 04 May 2026 05:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299484.1574020; Mon, 04 May 2026 05:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm4R-00020G-S7; Mon, 04 May 2026 05:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1299484;
 Mon, 04 May 2026 05:42:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wJm4Q-000208-Ab
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:42:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJm4P-008Zbp-Mq
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:42:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f831b3-5cb7-0a2a0a5109dd-0a2a4502a092-16
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:42:17 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f831b9-af86-0a2a45020019-d155d0b5f13d-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:42:17 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-38be5e86918so46007351fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:42:17 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777873337; cv=none;
        d=google.com; s=arc-20240605;
        b=NSJRtmcVucXmUo77Fj2FJ6jfbnuXynPNG/3SD6x5plcnuj3gT+8lXM2+oridY7HvkQ
         N83ZMvFege4aB9KAleDbL6oEVa8ShPC/lnQsbbuXKkG6AMlQcqWHVnTvBs/6yJm5vh7w
         b5Bw+x5xpe8g07eA71a3ArNTkyu5LrpOpXs50Gl0E403IAx5zXvqerrjweCbc5N9AqBc
         OT8Vkn99ywo3jZz2rIq+jNLeuKNQ4ZAGQbvNNoOUNVVcC7p+w0xY3f7oYI8ApVEtcHnI
         SKjRlTDtBDcOAWw/3wN2DnaGll4s5u9PPlWA2fKCtq44oKJbvR2fSwAKCNu00oX/eczI
         cGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Ql+HNFX+IDACIwSmBhpGWBF5IWTFNIkIC+9GIsGyqs=;
        fh=EIGH5a1h9+gxzNGHDCq59FJvzGr+rE6xe+v8ON7OIfQ=;
        b=V3hidyR1y1blqpTA4VE+BW5RdY8kCDN7581I4oTOvZHwFwwAkSi+3Hsg1uNN65zBaA
         EBRbD1FMJ92SIUDHV8Pw+jB7Jv0cZJ71YkI90IFoKNk3YjCymrDcXiaujGZKDmrI4rLq
         El4uwqjhQAg87p+LcuXFba8w/3kXr4ErTs1yK2Og/D/73G4PT+jheRb95qMdPyX1EqNL
         hdtEPA8G39wL1Nt0aTe53u86x+ApFTPyOoKCehunxXDPItdG3eyyAHJMkaVdLcUbsdC7
         K2xkxizo5AcmaEFDHIxxrxkHVUBXhN6lw0JdjEgbyrddhTOP2fpKxbZJv4f3IcmtTERq
         713g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777873337; x=1778478137; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ql+HNFX+IDACIwSmBhpGWBF5IWTFNIkIC+9GIsGyqs=;
        b=mXlmMsaUNoacaC5N3r/w85QStV4ARdBzyb74d9wvm2IHraVULpJEKq8jOzsUTJkFMS
         W5gzBNlhSZHwcuP6bp8iMcZLFW/CetaAvYm1b+67+oMVZmdPuRjUQB0kukb/sbctZNAG
         952OXsmezOCthClNUxZLmqPbkNXzwo3SLq3qZI9ECSjNllY9fOh+91Xd7JJcxHaipFow
         YHew9S/2BAq+F9C9MImYB3h117jmFxI1OP5dFPikZYJA9YivDivXBcdOlos7A55k056/
         fLP/LTK9JrjSzEN0HzTbBZW5pDqjQ5Tgtd/FntrTZczGr1IUWgFE9PQYrMFEHmlQs9K5
         s/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873337; x=1778478137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ql+HNFX+IDACIwSmBhpGWBF5IWTFNIkIC+9GIsGyqs=;
        b=ZiIgYwWpPeLC85i03iEUJfazCsl10GNaEyIZeZCo7lVhqpDRff03OXpUcAHyq0tlI4
         Oc4mE0yx5RfgIjU/lmTHiaKGXaPWhYrTqpaldtQ307FRFAhzP017i/XT7ttBFZ0iD+Lc
         VKcdWXgVYftRSqp9A1Dr5uYFdJj014sbykXFQFjX6kaPyQUZcshepsnQX7Vf0m++baWI
         I1tGR7dZ+C/EG+4fe1694MCqHXYFV+2uI4WhEbtTTEFjAHnpTaO2pra8eJTTbqt/KkXK
         6Cfq4rvqohfAbt+BZzH426aMMlG7bfTEgV311hDHGjOLpuSV1MLXLf6fCgDt7B6AAsJE
         uMVA==
X-Forwarded-Encrypted: i=1; AFNElJ9N0E4VcAyaVoSdH0UJLfqA033l3/er1LFumulToMGKz/aNFYAbJnDECLIprP9jxk1Zxo4jgA1wtnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXC6UuLXj0wMWuEmNRbO2zG5orQRizm3ZaRGsPW/YjUv7l6wgo
	rZxHvt+uyY2f7eLpUcMoAesirZwqJftuNPmvHltDCD+/wBNZxmJHbTEDAPZ/cKA/DWnsUyBD1n6
	yew1kyWoF0ltDa1l2f0ZS4R+gjoTKBkw=
X-Gm-Gg: AeBDiet7GAiaAHtZpxhV/IwrYfwb7E2Xnt0LhX4va4RQXCqnzDK/hXMZMcPjIieFLbq
	zF3pXH1ZuH2HUehWapmgwTpeITGeo74G1S98KaDkw1q1TPOTPSL79ZHcADUUlCgEw57HXW7vxkF
	bnbrm1HdXVZA+MM74QWvctJBMDH9o7N+q9ywrYjFAn0K0X8CHwQLMi0F/9nW+/Rf5Gb8RZkoCq8
	zWGHw/QHWcGZ/wE7YwWdSRaWxxk2TQKvEZlG4dOttskEiULjfts6yfFLXqd9+AT7zQgLD2HIO5N
	NlXAqPNzqjYIAKPu
X-Received: by 2002:a2e:bcc7:0:b0:38c:c36b:8221 with SMTP id
 38308e7fff4ca-3937823d9c4mr25437281fa.0.1777873336511; Sun, 03 May 2026
 22:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com> <5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
 <87bjgcvul6.fsf@epam.com> <CAGeoDV87irnVf8k+Z2L6=k41p87N9O6DpLCFdkMwErzDpXB9KA@mail.gmail.com>
 <20eaa31d-a105-440e-9add-968fc9786180@gmail.com>
In-Reply-To: <20eaa31d-a105-440e-9add-968fc9786180@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 4 May 2026 08:42:05 +0300
X-Gm-Features: AVHnY4LxpGmCNxUVBBFWVnmhQTmaKrIGVIqNzprrjOoi1MwdIOk9eBgmUwzsiAc
Message-ID: <CAGeoDV9r7-nXrOhZx3KB1jASFXv9cCaPXiu29KrMpediATgqnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: its: collect quirk flags and honor dma-noncoherent
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1777873337-AB961161-11339ADA/0/0
X-purgate-type: clean
X-purgate-size: 8439
X-Rspamd-Queue-Id: 831CA4B89C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Oleksandr,

Thank you for the review.

On Tue, Apr 28, 2026 at 9:42=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 3/25/26 17:47, Mykola Kvach wrote:
> > Hi Volodymyr,
>
> Hello Mykola and Volodymyr
>
>
> >
> > Thank you for the review.
> >
> > On Wed, Mar 25, 2026 at 4:42=E2=80=AFPM Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com> wrote:
> >>
> >> Hi Mykola,
> >>
> >> Mykola Kvach <xakep.amatop@gmail.com> writes:
> >>
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> Replace the per-quirk init callback with declarative flags in
> >>> struct its_quirk, and introduce gicv3_its_collect_quirks() to gather
> >>> the effective workaround flags from both the IIDR-matched quirk entry
> >>> and the "dma-noncoherent" device-tree property.
> >>>
> >>> This lets non-coherent platforms force non-cacheable ITS table
> >>> attributes even when no IIDR quirk entry matches.
> >>>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> >>>   xen/arch/arm/gic-v3-its.c | 70 ++++++++++++++++++++++++------------=
---
> >>>   1 file changed, 43 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> >>> index 9ba068c46f..00524b43a3 100644
> >>> --- a/xen/arch/arm/gic-v3-its.c
> >>> +++ b/xen/arch/arm/gic-v3-its.c
> >>> @@ -57,71 +57,87 @@ struct its_device {
> >>>    */
> >>>   struct its_quirk {
> >>>       const char *desc;
> >>> -    bool (*init)(struct host_its *hw_its);
> >>>       uint32_t iidr;
> >>>       uint32_t mask;
> >>> +    uint32_t flags;
> >>>   };
> >>>
> >>>   static uint32_t __ro_after_init its_quirk_flags;
> >>>
> >>> -static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
> >>> -{
> >>> -    its_quirk_flags |=3D HOST_ITS_WORKAROUND_NC_NS |
> >>> -        HOST_ITS_WORKAROUND_32BIT_ADDR;
> >>> -
> >>> -    return true;
> >>> -}
> >>> -
> >>>   static const struct its_quirk its_quirks[] =3D {
> >>>       {
> >>> -        .desc        =3D "R-Car Gen4",
> >>> -        .iidr        =3D 0x0201743b,
> >>> -        .mask        =3D 0xffffffffU,
> >>> -        .init        =3D gicv3_its_enable_quirk_gen4,
> >>> +        .desc  =3D "R-Car Gen4",
> >>> +        .iidr  =3D 0x0201743b,
> >>> +        .mask  =3D 0xffffffffU,
> >>> +        .flags =3D HOST_ITS_WORKAROUND_NC_NS |
> >>> +                 HOST_ITS_WORKAROUND_32BIT_ADDR,
> >>>       },
> >>>       {
> >>>           /* Sentinel. */
> >>>       }
> >>>   };
> >>>
> >>> -static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
> >>> +static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> >>>   {
> >>> -    const struct its_quirk *quirks =3D its_quirks;
> >>> +    const struct its_quirk *quirk =3D its_quirks;
> >>>
> >>> -    for ( ; quirks->desc; quirks++ )
> >>> +    for ( ; quirk->desc; quirk++ )
> >>>       {
> >>> -        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> >>> -            return (struct its_quirk *)quirks;
> >>> +        if ( quirk->iidr !=3D (quirk->mask & iidr) )
> >>> +            continue;
> >>> +
> >>> +        return quirk;
> >>>       }
> >>>
> >>>       return NULL;
> >>>   }
> >>>
> >>> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> >>> +static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_i=
ts,
> >>> +                                         const struct its_quirk **ma=
tched_quirk)
> >>>   {
> >>> +    const struct its_quirk *quirk;
> >>> +    uint32_t flags =3D 0;
> >>>       uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> >>> -    const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> >>>
> >>> -    if ( quirk && quirk->init(hw_its) )
> >>> +    quirk =3D gicv3_its_find_quirk(iidr);
> >>> +    if ( quirk )
> >>> +        flags |=3D quirk->flags;
> >>> +
> >>> +    if ( hw_its->dt_node &&
> >>> +         dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> >>> +        flags |=3D HOST_ITS_WORKAROUND_NC_NS;
> >>> +
> >>> +    if ( matched_quirk )
> >>> +        *matched_quirk =3D quirk;
> >>> +
> >>> +    return flags;
> >>> +}
> >>> +
> >>> +static void gicv3_its_enable_quirks(struct host_its *hw_its)
> >>> +{
> >>> +    const struct its_quirk *quirk;
> >>> +
> >>> +    its_quirk_flags =3D gicv3_its_collect_quirks(hw_its, &quirk);
> >>> +
> >>> +    if ( quirk )
> >>>           printk("GICv3: enabling workaround for ITS: %s\n", quirk->d=
esc);
> >>>   }
> >>>
> >>>   static void gicv3_its_validate_quirks(void)
> >>>   {
> >>> -    const struct its_quirk *quirk =3D NULL, *prev =3D NULL;
> >>> +    uint32_t quirks, prev_quirks;
> >>>       const struct host_its *hw_its;
> >>>
> >>>       if ( list_empty(&host_its_list) )
> >>>           return;
> >>>
> >>>       hw_its =3D list_first_entry(&host_its_list, struct host_its, en=
try);
> >>> -    prev =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + G=
ITS_IIDR));
> >>> +    prev_quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> >>>
> >>> -    list_for_each_entry(hw_its, &host_its_list, entry)
> >>> +    list_for_each_entry_continue(hw_its, &host_its_list, entry)
> >>>       {
> >>> -        quirk =3D gicv3_its_find_quirk(readl_relaxed(hw_its->its_bas=
e + GITS_IIDR));
> >>> -        BUG_ON(quirk !=3D prev);
> >>> -        prev =3D quirk;
> >>> +        quirks =3D gicv3_its_collect_quirks(hw_its, NULL);
> >>> +        BUG_ON(quirks !=3D prev_quirks);
> >>
> >> I know it was in the previous version, but as you are already touching
> >> this... This is not Xen BUG(). This is a platform problem. So you need
> >> to panic here. Something like
> >>
> >>   if (quirks !=3D prev_quirks)
> >>          panic("Different ITS instances has different quirks")
> >
> > Ack.
> >
> >
>
> I agree that a quirk mismatch is a platform problem. Yes, the current
> design uses global flags, making it unable to handle mixed quirks,
> leading to the failure on mismatch.
>
> Please note, I am not saying a panic() is wrong here and I am not
> requesting any changes here; I was just wondering why this is handled
> differently than the SMMUv3 driver. I am just thinking out loud.
>
> SMMUv3 driver handles feature mismatches by gracefully degrading. When
> it finds an SMMU device that does not support ARM_SMMU_FEAT_COHERENCY,
> it disables that feature for the entire platform (so the P2M code has to
> clean the cache when updating ptes). It does not panic. How the ITS and
> SMMUv3 drivers are different in that regard? Why could not we apply the
> same "worst-case" logic here?
> For example:
> - if any ITS device requires non-cacheable memory, then all ITS memory
> allocations should use non-cacheable memory.
> - if any ITS device requires 32-bit addresses, then all ITS memory
> allocations should be constrained to 32-bits.
>
> This would be consistent with the SMMU precedent and would allow the
> system to boot and function correctly, but with the performance
> characteristics of the worst ITS device in the system.
>
> Or I really missed something?

Yes, I think this makes sense.

The current series still treats the ITS workaround state as global.
Patch 4 only moves the quirk setup earlier, before the LPI tables are
allocated. However, the effective flags are still taken from a single
ITS instance, and the validation logic still requires all ITS instances
to report the same flag set.

For the currently supported quirks this is probably too strict. Both
HOST_ITS_WORKAROUND_NC_NS and HOST_ITS_WORKAROUND_32BIT_ADDR are
conservative restrictions on memory attributes/allocation. Using
non-cacheable attributes for all ITS-related allocations, or constraining
them to 32-bit addresses, should also be safe for ITS instances that do
not require these restrictions.

So I agree that the SMMUv3-style worst-case policy is a better fit here.
I will rework this in v2 so that Xen aggregates the effective flags from
all host ITS instances instead of requiring exact equality.

I will also document that this aggregation is only valid for conservative
workaround flags. A future non-composable quirk should either remain
per-ITS or get explicit validation logic.

Thanks for pointing out the SMMUv3 precedent.

Best regards,
Mykola

>
>
>
>
>
>
>
>
>
>
>
> [snip]

