Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F72F7F52
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68287.122257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qs5-0000LZ-Gg; Fri, 15 Jan 2021 15:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68287.122257; Fri, 15 Jan 2021 15:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qs5-0000L8-D1; Fri, 15 Jan 2021 15:18:41 +0000
Received: by outflank-mailman (input) for mailman id 68287;
 Fri, 15 Jan 2021 15:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCtl=GS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l0Qs3-0000Ks-AG
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:18:39 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26781aae-f464-4c65-af00-19de85e747bf;
 Fri, 15 Jan 2021 15:18:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l12so4425379wry.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 07:18:38 -0800 (PST)
Received: from CBGR90WXYV0 (host86-165-42-133.range86-165.btcentralplus.com.
 [86.165.42.133])
 by smtp.gmail.com with ESMTPSA id w8sm15218998wrl.91.2021.01.15.07.18.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Jan 2021 07:18:37 -0800 (PST)
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
X-Inumbo-ID: 26781aae-f464-4c65-af00-19de85e747bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=zQjwAjBcKu5XxflOnyHl/9EUkXyZRh9HecwJ+Jx/LH4=;
        b=Jr+8M6yE7DGs4KMi54+1dBLAiQ8Laev4XCTIAWerPq0qqsJCMfjfQQ/wh/jLaCc2gW
         R5DmHEsxciCpQJyuNWxE6eP6Et0oYHkWWzDnWITumdzhslq98g/KgUuTiPZ8hx7xLZAe
         hU8HpbTS/SpDnkG6X6V0qcSJp3dwtJ2LBCA17ZRGAsOwJe0COoKN6oFlCnjqrKZBscQb
         MIvMob82BpBTDmOoHnSeKujUE5bWkutI5hPPxbqpY7ZrZ2HldPmiN838Hx5KRFLt+sik
         AXtFLPo4s7UeYbZk/K6ug5cLF3dlA8PcEMKR5T3mPrg6QqPBN8W/z2xqAFLq+y2r4GpY
         PXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=zQjwAjBcKu5XxflOnyHl/9EUkXyZRh9HecwJ+Jx/LH4=;
        b=BS93wXtYVBbireQL+ucQs+MolaKaiSLs7w+xHWWC4Lvvk+5oo/6fAlkpabqLov3sMT
         4Ih1XZB4FEsfakl5uuPQFE7Gv2ucXOwLd/LGLOviigIRHL9kkV6NdL8m6anukEAwbikZ
         ET9/rEWQwbVQzpryUpJv8KMslH2Bij322l5AjgCPwSxcUdcm4sc+kqIy4ULn8StWqc3A
         rOdcKW+7M5oZI/ZalVjiBuh3g4/gqSZ4kxQRMDKFgwI4B/QLzq52Za1teMwqbTFf6Ezy
         l7/RiTSNVWtmsWTouMaI7goX+0b1ExrfY7oAOLklfJh9wzFmjjpsKKTrTejGKW3bdaa1
         BkrA==
X-Gm-Message-State: AOAM530wmWy0zkfXZBekMqlTDizBXLj/W0wJz1WAzGo+ShLnS+Dnkd1H
	X+YXwnnO2Dpv6OqXJb2pbHk=
X-Google-Smtp-Source: ABdhPJy35q3f7CAomH0QmqKnwthQw4/VhPp0yJv/qKkkAB5x0nXEoKrBrAJ0yFZ+G2rVzfEgEiXmMg==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr13734842wrg.328.1610723917620;
        Fri, 15 Jan 2021 07:18:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>
Cc: <hongyxia@amazon.co.uk>,
	"'Julien Grall'" <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20201222154338.9459-1-julien@xen.org> <20201222154338.9459-3-julien@xen.org> <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com> <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org> <cb39419b-1e5b-74ee-8566-f548e435b490@xen.org> <f21f1f61-5213-55a8-320c-43e5fe80100f@suse.com>
In-Reply-To: <f21f1f61-5213-55a8-320c-43e5fe80100f@suse.com>
Subject: RE: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables with the pgtables.lock held
Date: Fri, 15 Jan 2021 15:18:36 -0000
Message-ID: <009901d6eb51$b2540f20$16fc2d60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH2TO5SqTDQ1dUiy31gxFMl+4NKXAGzkL+9AV1ljfwCN14m8wGcaZJoApbvtPepnisOgA==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 January 2021 11:07
> To: Julien Grall <julien@xen.org>; Paul Durrant <paul@xen.org>
> Cc: hongyxia@amazon.co.uk; Julien Grall <jgrall@amazon.com>; =
xen-devel@lists.xenproject.org; Andrew
> Cooper <andrew.cooper3@citrix.com>
> Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU =
page-tables with the pgtables.lock
> held
>=20
> On 14.01.2021 20:19, Julien Grall wrote:
> >
> >
> > On 23/12/2020 14:01, Julien Grall wrote:
> >> Hi Jan,
> >>
> >> On 23/12/2020 13:48, Jan Beulich wrote:
> >>> On 22.12.2020 16:43, Julien Grall wrote:
> >>>> From: Julien Grall <jgrall@amazon.com>
> >>>>
> >>>> The pgtables.lock is protecting access to the page list =
pgtables.list.
> >>>> However, iommu_free_pgtables() will not held it. I guess it was =
assumed
> >>>> that page-tables cannot be allocated while the domain is dying.
> >>>>
> >>>> Unfortunately, there is no guarantee that iommu_map() will not be
> >>>> called while a domain is dying (it looks like to be possible from
> >>>> XEN_DOMCTL_memory_mapping).
> >>>
> >>> I'd rather disallow any new allocations for a dying domain, not
> >>> the least because ...
> >>
> >> Patch #4 will disallow such allocation. However...
> >
> > It turns out that I can't disallow it because there is at least one =
call
> > of iommu_map() while an HVM domain is destroyed:
> >
> >      (XEN)    [<ffff82d04026e399>] R iommu_map+0xf2/0x171
> >      (XEN)    [<ffff82d04026e43e>] F iommu_legacy_map+0x26/0x63
> >      (XEN)    [<ffff82d040302a42>] F
> > arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
> >      (XEN)    [<ffff82d0402f761d>] F p2m_set_entry+0x91/0x128
> >      (XEN)    [<ffff82d0402f8643>] F =
guest_physmap_add_entry+0x3d7/0x4e0
> >      (XEN)    [<ffff82d0402f87cb>] F =
guest_physmap_add_page+0x7f/0xfe
> >      (XEN)    [<ffff82d0402ba0a2>] F
> > arch/x86/hvm/ioreq.c#hvm_add_ioreq_gfn+0x6f/0x8d
> >      (XEN)    [<ffff82d0402ba0f9>] F
> > arch/x86/hvm/ioreq.c#hvm_ioreq_server_disable+0x39/0x4f
> >      (XEN)    [<ffff82d0402bb50e>] F =
hvm_destroy_all_ioreq_servers+0x6f/0x9b
> >      (XEN)    [<ffff82d0402afc15>] F
> > hvm_domain_relinquish_resources+0x3e/0x92
> >      (XEN)    [<ffff82d04031f278>] F =
domain_relinquish_resources+0x355/0x372
> >      (XEN)    [<ffff82d040205dd4>] F domain_kill+0xc7/0x150
> >      (XEN)    [<ffff82d04023baf0>] F do_domctl+0xba7/0x1a09
> >      (XEN)    [<ffff82d040312c8f>] F pv_hypercall+0x2f0/0x55f
> >      (XEN)    [<ffff82d040391432>] F lstar_enter+0x112/0x120
> >
> > This one resulted to a domain crash rather than a clean destruction.
>=20
> A domain crash despite the domain already getting cleaned up is
> something we may at least want to consider doing better: There
> already is a !d->is_shutting_down conditional printk() there.
> What would people think about avoiding the domain_crash() call
> in similar ways? (It could even be considered to make
> domain_crash() itself behave like this, but such a step may make
> it necessary to first audit all use sites.)
>=20
> > I would still like to disallow page-table allocation, so I am think =
to
> > ignore any request in iommu_map() if the domain is dying.
>=20
> Ignoring requests there seems fragile to me. Paul - what are your
> thoughts about bailing early from hvm_add_ioreq_gfn() when the
> domain is dying?
>=20

I think that's ok. Really, the only reason for putting the pages back in =
the P2M is to allow migration to work so if the domain is dying then we =
don't really care do we?

  Paul

> Jan


