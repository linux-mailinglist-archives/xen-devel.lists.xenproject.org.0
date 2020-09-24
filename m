Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26203276F40
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLP38-0000nd-Q6; Thu, 24 Sep 2020 11:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLP37-0000nT-BG
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:04:29 +0000
X-Inumbo-ID: 1705f34f-0bc3-4eea-9dfa-3b86862aadc3
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1705f34f-0bc3-4eea-9dfa-3b86862aadc3;
 Thu, 24 Sep 2020 11:04:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a17so3329746wrn.6
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=JjpxFR7In+s73PRPp0akUSMzVw8/NlGqPmNict1znlE=;
 b=qXdN688XsTy8NLloUIY5vCP6zGyLpbO2q8j9u6RxF6KSOI4aT/VOnCb8eT1o9m3U1y
 LGMtEYFf/nTvlw2fZzuz2Q3ISF1++wBsxn/Mv3bs8DSGy5tmihGQ118TIl9hspxpPgS2
 BATjkzhzpYG1k0E4R5RwgkkJnpcbTvYGli8mjyI0d4B2oXnvTZ2srovrY0Vm5z3Z9FcZ
 pEVCdSg5dmy/wvV6y5E6jSFfFx75chIGdYSvLVT4NelVqskCyBQN6ERXmiTtfk93puIE
 /hsYgoFyAruTXOugupktl2+esCRUkxCnawOZgNH/cgwJvhckXLa5b/vEDHLTIWd3VWBa
 IObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=JjpxFR7In+s73PRPp0akUSMzVw8/NlGqPmNict1znlE=;
 b=eo/bXqUoHgLf0RpV0PwoPzuOuMB5p1PRuP6GCWLh/ooJE7RPGaFwRhL5k+BpCykMsS
 cKs1Y5wYnQyQhRnoQjy+CxAB1bP5pNTw96zshWwKoSWem3XwZohnD3uRUQ4qSzPEBsQ4
 DQ5KO67nTsJkQd0Z58D7iw8aFK0Rct7s9d0bafd/V0IgZq/t+3QX2fNfzBhF1zxtaBU4
 tgdzsXShpJ/23CQlGzsWpTWdM3EPmGNXry6BzjmZUHHRY5I+JE7Ob2e83f3KF8jUCtm4
 tFMHI2S8N9KwugU0rd6g8D73uGkfR/IK1SyVfjDimyazaV/eU7ge4/cIYomRLfhYr1KM
 bQBQ==
X-Gm-Message-State: AOAM533sa5OisbofsvMACZGJ4pp/sWZ7fjSWT5RH9dRZOksiPG0q7JqR
 52QXZy5YauxbSnNBylFWmuw=
X-Google-Smtp-Source: ABdhPJxdXDOrzHODf5Or/bcvrG5FN7aZdhboNpVg9Y4pht3PlWvlD5YbnDgw0fyFeql8K69fIkyMnA==
X-Received: by 2002:adf:f082:: with SMTP id n2mr4430379wro.35.1600945467630;
 Thu, 24 Sep 2020 04:04:27 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id l126sm3078729wmf.39.2020.09.24.04.04.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 04:04:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <George.Dunlap@eu.citrix.com>,
 "'Ian Jackson'" <iwj@xenproject.org>, "'Jan Beulich'" <JBeulich@suse.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 "'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
 "'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-5-andrew.cooper3@citrix.com>
 <003b01d6925a$67f9e2b0$37eda810$@xen.org>
 <336c1114-2ffb-312c-0990-d2fa389a3b23@citrix.com>
In-Reply-To: <336c1114-2ffb-312c-0990-d2fa389a3b23@citrix.com>
Subject: RE: [PATCH v2 04/11] xen/memory: Fix acquire_resource size semantics
Date: Thu, 24 Sep 2020 12:04:26 +0100
Message-ID: <00b301d69262$77f14840$67d3d8c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyAFQUlblAxTNIzEBpCuayajpah3Q
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
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 24 September 2020 11:58
> To: paul@xen.org; 'Xen-devel' <xen-devel@lists.xenproject.org>
> Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>; 'Ian Jackson' =
<iwj@xenproject.org>; 'Jan Beulich'
> <JBeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Wei Liu' <wl@xen.org>; 'Julien
> Grall' <julien@xen.org>; 'Micha=C5=82 Leszczy=C5=84ski' =
<michal.leszczynski@cert.pl>; 'Hubert Jasudowicz'
> <hubert.jasudowicz@cert.pl>; 'Tamas K Lengyel' <tamas@tklengyel.com>
> Subject: Re: [PATCH v2 04/11] xen/memory: Fix acquire_resource size =
semantics
>=20
> On 24/09/2020 11:06, Paul Durrant wrote:
> >> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> >> index d1cfc8fb4a..e82307bdae 100644
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -4591,6 +4591,26 @@ int xenmem_add_to_physmap_one(
> >>      return rc;
> >>  }
> >>
> >> +unsigned int arch_resource_max_frames(
> >> +    struct domain *d, unsigned int type, unsigned int id)
> >> +{
> >> +    unsigned int nr =3D 0;
> >> +
> >> +    switch ( type )
> >> +    {
> >> +#ifdef CONFIG_HVM
> >> +    case XENMEM_resource_ioreq_server:
> >> +        if ( !is_hvm_domain(d) )
> >> +            break;
> >> +        /* One frame for the buf-ioreq ring, and one frame per 128 =
vcpus. */
> >> +        nr =3D 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct =
ioreq), PAGE_SIZE);
> > The buf-ioreq ring is optional
>=20
> Yes, but it's position within the resource, and effect on the position
> of the ioreq page(s), is not.

Oh yes, I was forgetting that this is fixed so...

Reviewed-by: Paul Durrant <paul@xen.org>

>=20
> >  so a caller using this value may still get a resource acquisition =
failure unless the id is used to
> actually look up and check the ioreq server in question for the actual =
maximum.
>=20
> Yes, but that is potentially true of *any* acquisition attempt, even =
if
> the id matches, because maybe someone else has destroyed the ioreq
> server, or the domain, in the meantime.
>=20
>=20
> What we have is an mmap() where the caller needs to know to not try =
and
> map page 0 for an ioreq server where buf-ioreq doesn't exist.
>=20
> This is a direct consequence of:
>=20
> #define XENMEM_resource_ioreq_server_frame_bufioreq 0
> #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
>=20
> and in practice, what a qemu/demu/other needs to do to map just the
> ioreq frames (in a manner compatible with >127 vcpu HVM domains) is to
> query the resource size and map size-1 pages from offset 1.

Yes.

  Paul

>=20
> ~Andrew


