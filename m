Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB84242A92
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 15:47:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5r63-000427-EG; Wed, 12 Aug 2020 13:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTRk=BW=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k5r62-000422-4A
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 13:47:14 +0000
X-Inumbo-ID: 02c8e610-c318-4d52-a2b6-c4928df6c583
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02c8e610-c318-4d52-a2b6-c4928df6c583;
 Wed, 12 Aug 2020 13:47:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y3so2106455wrl.4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Vtyk3D7InXpBJ/6vfrCo+x2Vl1lx2LfXZf2sJc4/r+g=;
 b=kJc5RDFSfXtaz7aBn9oKEdYpnZ5/WEWMD+4MWk3GKZerjhG/pzqnfZKVN2rOd4dXSP
 s4Mw8lMH60phEEVUFN6kFcq7o4g38jYdAjDyteXUZ89tAcRXENAa+TeHwtSpZjbrYYXK
 7NCQG51SdsXmKNf/PbBwBu2t+mJ0VuNC/6k9zE3K7JcE+N4HOiY55Y7x3eHdX1Untd/z
 3DYj9khTZ0s3gpNZrcNix14ajvD7J6KdvINSDSxyoddN2ugOaVSih50TF2+qgOrGtQKp
 MMJs2G3UVgYNE0oCRRHLv8u5GRqnkUKjV1xz8a3YCDYOvhWp2hm9nEC4p8me4maVl12i
 VN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Vtyk3D7InXpBJ/6vfrCo+x2Vl1lx2LfXZf2sJc4/r+g=;
 b=r9fg0WRAde29/Ra1M38RdTJ3U7kmbLE+HwMR+aD5DZYdyctNh5kW01vErQ6yBFf1HA
 qkC4uw7Ba3riKslZUqKwW3EJGCLA5GjVlKmmoahRnbArhm5CArnDYXJDZ2hSo9x25yzJ
 5CpmVhNvIgN0o1JTuTe9kMuqpOeNG4By28MK/9EqhDBi3JD0sWA5XVpTseaakvvO3l4W
 js8wBlz6A5xSMgZoWAcg2msksZ6BoivcKjmTq96uhEh4GEXv5j1wHcujOeSFbH4e+4MM
 Gg/gm9ifY4GOK5aq6Ku9DsmMq4sbA35FxjOpDvvVQC3xBcMr5f1V6XAiAvwsBdr2RZsA
 RyyA==
X-Gm-Message-State: AOAM532MSUoQyOwA76FSzMI4W47haFj460tjHfUjuLvwFb/U03GYr7ic
 r1ozD27LLZ+zXJg28ymPXEA=
X-Google-Smtp-Source: ABdhPJypuBG0ogJHeL3ii+IUYyD/6QrH/2YD8WlxlJEMCcYGsKa3yybUM5fas+j2P7c9EaAWt/ZLEw==
X-Received: by 2002:adf:a112:: with SMTP id o18mr5643841wro.73.1597240032282; 
 Wed, 12 Aug 2020 06:47:12 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-143-223-30.range86-143.btcentralplus.com.
 [86.143.223.30])
 by smtp.gmail.com with ESMTPSA id m20sm13161689wmc.1.2020.08.12.06.47.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 06:47:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-14-paul@xen.org>
 <6de24196-019c-f91c-5cca-0971676a9b38@suse.com>
In-Reply-To: <6de24196-019c-f91c-5cca-0971676a9b38@suse.com>
Subject: RE: [PATCH v4 13/14] vtd: use a bit field for context_entry
Date: Wed, 12 Aug 2020 14:47:10 +0100
Message-ID: <000801d670af$14046b70$3c0d4250$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wJqlKGkAnHLE1OpXuXhoA==
Content-Language: en-gb
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 06 August 2020 13:47
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: Re: [PATCH v4 13/14] vtd: use a bit field for context_entry
>=20
> On 04.08.2020 15:42, Paul Durrant wrote:
> > @@ -208,35 +209,53 @@ struct root_entry {
> >      do { (r).ctp =3D ((val) >> PAGE_SHIFT_4K); } while (0)
> >
> >  struct context_entry {
> > -    u64 lo;
> > -    u64 hi;
> > +    union {
> > +        __uint128_t val;
> > +        struct { uint64_t lo, hi; };
> > +        struct {
> > +            /* 0 - 63 */
> > +            uint64_t p:1;
> > +            uint64_t fpd:1;
> > +            uint64_t tt:2;
> > +            uint64_t reserved0:8;
> > +            uint64_t slptp:52;
> > +
> > +            /* 64 - 127 */
> > +            uint64_t aw:3;
> > +            uint64_t ignored:4;
> > +            uint64_t reserved1:1;
> > +            uint64_t did:16;
> > +            uint64_t reserved2:40;
> > +        };
> > +    };
> >  };
> > -#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
> > -#define context_present(c) ((c).lo & 1)
> > -#define context_fault_disable(c) (((c).lo >> 1) & 1)
> > -#define context_translation_type(c) (((c).lo >> 2) & 3)
> > -#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
> > -#define context_address_width(c) ((c).hi &  7)
> > -#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
> > -
> > -#define context_set_present(c) do {(c).lo |=3D 1;} while(0)
> > -#define context_clear_present(c) do {(c).lo &=3D ~1;} while(0)
> > -#define context_set_fault_enable(c) \
> > -    do {(c).lo &=3D (((u64)-1) << 2) | 1;} while(0)
> > -
> > -#define context_set_translation_type(c, val) do { \
> > -        (c).lo &=3D (((u64)-1) << 4) | 3; \
> > -        (c).lo |=3D (val & 3) << 2; \
> > -    } while(0)
> > +
> > +#define context_present(c) (c).p
> > +#define context_set_present(c) do { (c).p =3D 1; } while (0)
> > +#define context_clear_present(c) do { (c).p =3D 0; } while (0)
> > +
> > +#define context_fault_disable(c) (c).fpd
> > +#define context_set_fault_enable(c) do { (c).fpd =3D 1; } while (0)
> > +
> > +#define context_translation_type(c) (c).tt
> > +#define context_set_translation_type(c, val) do { (c).tt =3D val; } =
while (0)
> >  #define CONTEXT_TT_MULTI_LEVEL 0
> >  #define CONTEXT_TT_DEV_IOTLB   1
> >  #define CONTEXT_TT_PASS_THRU   2
> >
> > -#define context_set_address_root(c, val) \
> > -    do {(c).lo &=3D 0xfff; (c).lo |=3D (val) & PAGE_MASK_4K ;} =
while(0)
> > +#define context_slptp(c) ((c).slptp << PAGE_SHIFT_4K)
> > +#define context_set_slptp(c, val) \
> > +    do { (c).slptp =3D (val) >> PAGE_SHIFT_4K; } while (0)
>=20
> Presumably "slptp" is in line with the doc, but "address_root" is
> quite a bit more readable. I wonder if I could talk you into
> restoring the old (or some similar) names.

The problem with 'root' in the VT-d code is that it is ambiguous between =
this case and manipulations of 'root entries', which is why I moved away =
from it. The spec refers to 'slptptr' but I shortened it to 'slptp' for =
consistency with the root 'ctp'... I should really use the name from the =
spec. though.
I will add a comment above the macro stating what the 'slptptr' is too.=20

>=20
> More generally, and more so here than perhaps already on the previous
> patch - are these helper macros useful to have anymore?
>=20

Less useful. I was worried about ditching them causing the patches to =
balloon in size but maybe they won't... I'll see.

> > +#define context_address_width(c) (c).aw
> >  #define context_set_address_width(c, val) \
> > -    do {(c).hi &=3D 0xfffffff8; (c).hi |=3D (val) & 7;} while(0)
> > -#define context_clear_entry(c) do {(c).lo =3D 0; (c).hi =3D 0;} =
while(0)
> > +    do { (c).aw =3D (val); } while (0)
> > +
> > +#define context_did(c) (c).did
> > +#define context_set_did(c, val) \
> > +    do { (c).did =3D (val); } while (0)
> > +
> > +#define context_clear_entry(c) do { (c).val =3D 0; } while (0)
>=20
> While this is in line with previous code, I'm concerned:
> domain_context_unmap_one() has
>=20
>     context_clear_present(*context);
>     context_clear_entry(*context);
>=20
> No barrier means no guarantee of ordering. I'd drop clear_present()
> here and make clear_entry() properly ordered. This, I think, will at
> the same time render the __uint128_t field unused and hence
> unnecessary again.

I'd prefer to keep both with a barrier, particularly if I get rid of the =
macros.

  Paul

>=20
> Also comments given on the previous patch apply respectively here.
>=20
> Jan


