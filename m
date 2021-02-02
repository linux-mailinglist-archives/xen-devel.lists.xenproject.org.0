Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75A30BB15
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 10:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80428.147161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6s7A-0007pJ-Jo; Tue, 02 Feb 2021 09:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80428.147161; Tue, 02 Feb 2021 09:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6s7A-0007ox-Gf; Tue, 02 Feb 2021 09:36:52 +0000
Received: by outflank-mailman (input) for mailman id 80428;
 Tue, 02 Feb 2021 09:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l6s79-0007os-Gw
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 09:36:51 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87c542bf-64f7-41a9-b0d9-67533f15158d;
 Tue, 02 Feb 2021 09:36:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 7so19690214wrz.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 01:36:49 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id d16sm30262030wrr.59.2021.02.02.01.36.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 01:36:48 -0800 (PST)
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
X-Inumbo-ID: 87c542bf-64f7-41a9-b0d9-67533f15158d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Zz8FFykTcux2eAHU4qruCPE/CaDgws9rPlVFrgLBmDE=;
        b=n0na40lt2YrJjOE1hvFtNiO/wlcvGHgllxcJfOb+wkGhd8mAeV4zcdMNFuVWvf5bxm
         blPJ61MgpDxWvC8snrZbeUJTpzZhBCBI7ILLW+J/fEcA+xEEKDeGtq7MBMZEivS4Hr6E
         /sv427EwM7KRx7YOKAWVOKpatV3A5cxBS77ubD0H5jiPQWp7fJWwjmwtA2IlSV/2SEXb
         mHuve3Y0Vp9+WrzkydbX35K1NEBzrDN8GcICCqavgLmVPucYDQ5qUzZlfq96HmrrHIu+
         fupr60uAveOSPbzlF7fGoY3gggQCDNXsU2+nG2dAMw9TiRzBwg9M5E+g2HwP9BiVlA5y
         XwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=Zz8FFykTcux2eAHU4qruCPE/CaDgws9rPlVFrgLBmDE=;
        b=NoVfx3V3Q6FaGEmZMe4gMp60NvQvghuZioNT6luXx4Qh6KAusa2YBbp5Rzi02Rryil
         vXv6QWhh1XWySIyzOxmW8Qy5zifoI3McJ8zb/tet5pN0tcPa9hyStlSt+W916SWeAopr
         w7sIOp+nebNVO1uvQTo6O3Y0dHYqbDCt9AEs1BhKua8zFWXnwHooMoWSPkv1R+AoB8XK
         0ntTdpL8ZXTfEss40jwhmR39dNygQA1zML0DiaPYczZHQgZQ2SwSdFLzPUg8IgJ/728b
         64qVaObmx87FrbXBrGmZ5hRHO9MI63SoCNBfpuJ87QsoOQjkEePI22cG6OTl1LT9ap6/
         F8XQ==
X-Gm-Message-State: AOAM530WPRSzyFddt5O40PRUj5xW8C3WF8mQbHVbC0NPzxLM/r68MC1N
	09UHM7AmptQ4IcN//VDIRfk=
X-Google-Smtp-Source: ABdhPJz4fEifub8TGwz6LNU29pnusFYU5k+lNNiZwnGQJkpMxAQLzpZDkwPWXtgHYaCpE0U2sOL2/A==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr22541568wrb.205.1612258609190;
        Tue, 02 Feb 2021 01:36:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Dongli Zhang'" <dongli.zhang@oracle.com>,
	=?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	"'Jens Axboe'" <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20210128130441.11744-1-paul@xen.org> <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com> <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com> <02d901d6f616$b0004750$1000d5f0$@xen.org> <c10b539b-0f86-ac60-d289-4e3b7ded25fb@oracle.com>
In-Reply-To: <c10b539b-0f86-ac60-d289-4e3b7ded25fb@oracle.com>
Subject: RE: [PATCH v2] xen-blkback: fix compatibility bug with single page rings
Date: Tue, 2 Feb 2021 09:36:47 -0000
Message-ID: <035701d6f946$edb90180$c92b0480$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQESWKuFsxkk/iz7Hd1VT64wNwq0EAGAqAtPAflt50QCuTnTiQKN7zH0q4fRvEA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Dongli Zhang
> Sent: 30 January 2021 05:09
> To: paul@xen.org; 'J=C3=BCrgen Gro=C3=9F' <jgross@suse.com>; =
xen-devel@lists.xenproject.org; linux-
> block@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Konrad Rzeszutek Wilk' =
<konrad.wilk@oracle.com>; 'Roger Pau
> Monn=C3=A9' <roger.pau@citrix.com>; 'Jens Axboe' <axboe@kernel.dk>
> Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single =
page rings
>=20
>=20
>=20
> On 1/29/21 12:13 AM, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> >> Sent: 29 January 2021 07:35
> >> To: Dongli Zhang <dongli.zhang@oracle.com>; Paul Durrant =
<paul@xen.org>; xen-
> >> devel@lists.xenproject.org; linux-block@vger.kernel.org; =
linux-kernel@vger.kernel.org
> >> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> >> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>
> >> Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with =
single page rings
> >>
> >> On 29.01.21 07:20, Dongli Zhang wrote:
> >>>
> >>>
> >>> On 1/28/21 5:04 AM, Paul Durrant wrote:
> >>>> From: Paul Durrant <pdurrant@amazon.com>
> >>>>
> >>>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() =
to avoid
> >>>> inconsistent xenstore 'ring-page-order' set by malicious =
blkfront"), the
> >>>> behaviour of xen-blkback when connecting to a frontend was:
> >>>>
> >>>> - read 'ring-page-order'
> >>>> - if not present then expect a single page ring specified by =
'ring-ref'
> >>>> - else expect a ring specified by 'ring-refX' where X is between =
0 and
> >>>>    1 << ring-page-order
> >>>>
> >>>> This was correct behaviour, but was broken by the afforementioned =
commit to
> >>>> become:
> >>>>
> >>>> - read 'ring-page-order'
> >>>> - if not present then expect a single page ring (i.e. =
ring-page-order =3D 0)
> >>>> - expect a ring specified by 'ring-refX' where X is between 0 and
> >>>>    1 << ring-page-order
> >>>> - if that didn't work then see if there's a single page ring =
specified by
> >>>>    'ring-ref'
> >>>>
> >>>> This incorrect behaviour works most of the time but fails when a =
frontend
> >>>> that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> >>>> because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> >>>> 'ring-ref0' left around by the previous frontend will try to map =
the wrong
> >>>> grant reference.
> >>>>
> >>>> This patch restores the original behaviour.
> >>>>
> >>>> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid =
inconsistent xenstore 'ring-
> page-
> >> order' set by malicious blkfront")
> >>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >>>> ---
> >>>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> >>>> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> >>>> Cc: Jens Axboe <axboe@kernel.dk>
> >>>> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> >>>>
> >>>> v2:
> >>>>   - Remove now-spurious error path special-case when nr_grefs =
=3D=3D 1
> >>>> ---
> >>>>   drivers/block/xen-blkback/common.h |  1 +
> >>>>   drivers/block/xen-blkback/xenbus.c | 38 =
+++++++++++++-----------------
> >>>>   2 files changed, 17 insertions(+), 22 deletions(-)
> >>>>
> >>>> diff --git a/drivers/block/xen-blkback/common.h =
b/drivers/block/xen-blkback/common.h
> >>>> index b0c71d3a81a0..524a79f10de6 100644
> >>>> --- a/drivers/block/xen-blkback/common.h
> >>>> +++ b/drivers/block/xen-blkback/common.h
> >>>> @@ -313,6 +313,7 @@ struct xen_blkif {
> >>>>
> >>>>   	struct work_struct	free_work;
> >>>>   	unsigned int 		nr_ring_pages;
> >>>> +	bool                    multi_ref;
> >>>
> >>> Is it really necessary to introduce 'multi_ref' here or we may =
just re-use
> >>> 'nr_ring_pages'?
> >>>
> >>> According to blkfront code, 'ring-page-order' is set only when it =
is not zero,
> >>> that is, only when (info->nr_ring_pages > 1).
> >>
> >
> > That's how it is *supposed* to be. Windows certainly behaves that =
way too.
> >
> >> Did you look into all other OS's (Windows, OpenBSD, FreebSD, =
NetBSD,
> >> Solaris, Netware, other proprietary systems) implementations to =
verify
> >> that claim?
> >>
> >> I don't think so. So better safe than sorry.
> >>
> >
> > Indeed. It was unfortunate that the commit to blkif.h documenting =
multi-page (829f2a9c6dfae) was not
> crystal clear and (possibly as a consequence) blkback was implemented =
to read ring-ref0 rather than
> ring-ref if ring-page-order was present and 0. Hence the only safe =
thing to do is to restore that
> behaviour.
> >
>=20
> Thank you very much for the explanation!
>=20
> Reviewed-by: Dongli Zhang <dongli.zhang@oracle.com>
>=20

Thanks.

Roger, Konrad, can I get a maintainer ack or otherwise, please?

  Paul



