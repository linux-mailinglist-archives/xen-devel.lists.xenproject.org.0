Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1533086E9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77765.141046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oul-000630-9l; Fri, 29 Jan 2021 08:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77765.141046; Fri, 29 Jan 2021 08:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oul-00062e-6s; Fri, 29 Jan 2021 08:13:59 +0000
Received: by outflank-mailman (input) for mailman id 77765;
 Fri, 29 Jan 2021 08:13:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFjR=HA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l5Ouk-00062Z-2f
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:13:58 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98659c8f-d337-494c-9cd8-a92239ec8d53;
 Fri, 29 Jan 2021 08:13:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 190so6138506wmz.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 00:13:57 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id n5sm7682024wmq.7.2021.01.29.00.13.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 00:13:55 -0800 (PST)
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
X-Inumbo-ID: 98659c8f-d337-494c-9cd8-a92239ec8d53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=ap7wbNqjVosqq+BvvhMDlkF+QfPcogCuAP+EWe9p3wQ=;
        b=Gwcb7o1LK/nN/KxcT3rZXGOzEyxp6t41adhXLxTCnZpZiHOPrfSabv1uCJlswZXT3/
         J/LcmMQbei+ZPtrzqRkf/ZglS5miyrN5QVqdFMdJpdQu4N0c/HOxsJBL3Asn66LeR6fa
         tp1Q5+m4fTrQ9CSUZB1CzKsLbqJqD+ypFqQ4Y2wZjbp7zbVEtWLk9NngfnvZwjwv3jzP
         5cBREXGD2y1iI5zJPeC6Sg77Wu0e0EcDolQ4ev0Qo4sMZweX7565fnZfOgG64Io5bpbD
         Q81qJnCFyWNZ/YqkiyCh6gVgOkkrxv4YFWY9BlWDFeOd2ETe0XOgRa/iJpFuwygu4pkO
         uNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=ap7wbNqjVosqq+BvvhMDlkF+QfPcogCuAP+EWe9p3wQ=;
        b=EANup9gggzuPDOuB05ahEhg4Td8RVzl7qMY5nYA+4E43ayrDpJsvezuQuNYrQVHpGU
         IJT0vLyYHwGIbh090W+zCP/7qEG7OrFWg7kAgFU9LEXEsWNGN7i5jZ7j7Ic2prdh7k7R
         TQGkQfos74PL7PlvSV4EGvVZPYe24VXgEXWG7OMg6L6UwM/YalI+/VFeXxzcs+qmDrnF
         zizWP+5VrVLsZHy1FcKaZH7LsKHW5JF3XJSu2ELJzUuDNt5lCTHpJ0r36B0YnlGlaDcs
         fRzBtSbaw1KoEmFplf+0MCdrrrboTrXSBopzB3GOtGcZq9t8c36v64pKcCbV1ezlqNP8
         GrIg==
X-Gm-Message-State: AOAM532swRArXFF7kXd3ODwScRoQ3UW49lP7/uWFN8NEpb6hn6wKTAjZ
	XvKz4SCoRiBFSIjHGxB9GS0=
X-Google-Smtp-Source: ABdhPJxAlwg2Jl1OSocAkzyfXiK+OmNVCzkpzmKB90q6W2bDkZsnVpDXy831cIjCmntOiaR3xvP7Aw==
X-Received: by 2002:a1c:9850:: with SMTP id a77mr2584383wme.163.1611908036281;
        Fri, 29 Jan 2021 00:13:56 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
	"'Dongli Zhang'" <dongli.zhang@oracle.com>,
	<xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jens Axboe'" <axboe@kernel.dk>
References: <20210128130441.11744-1-paul@xen.org> <c3a476c5-c671-4429-73d5-0bf7ced1a06b@oracle.com> <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com>
In-Reply-To: <7fb64e2f-141a-c848-0f8a-2313d2e821b6@suse.com>
Subject: RE: [PATCH v2] xen-blkback: fix compatibility bug with single page rings
Date: Fri, 29 Jan 2021 08:13:54 -0000
Message-ID: <02d901d6f616$b0004750$1000d5f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQESWKuFsxkk/iz7Hd1VT64wNwq0EAGAqAtPAflt50Srq6kdsA==
Content-Language: en-gb

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 29 January 2021 07:35
> To: Dongli Zhang <dongli.zhang@oracle.com>; Paul Durrant =
<paul@xen.org>; xen-
> devel@lists.xenproject.org; linux-block@vger.kernel.org; =
linux-kernel@vger.kernel.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>
> Subject: Re: [PATCH v2] xen-blkback: fix compatibility bug with single =
page rings
>=20
> On 29.01.21 07:20, Dongli Zhang wrote:
> >
> >
> > On 1/28/21 5:04 AM, Paul Durrant wrote:
> >> From: Paul Durrant <pdurrant@amazon.com>
> >>
> >> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() =
to avoid
> >> inconsistent xenstore 'ring-page-order' set by malicious =
blkfront"), the
> >> behaviour of xen-blkback when connecting to a frontend was:
> >>
> >> - read 'ring-page-order'
> >> - if not present then expect a single page ring specified by =
'ring-ref'
> >> - else expect a ring specified by 'ring-refX' where X is between 0 =
and
> >>    1 << ring-page-order
> >>
> >> This was correct behaviour, but was broken by the afforementioned =
commit to
> >> become:
> >>
> >> - read 'ring-page-order'
> >> - if not present then expect a single page ring (i.e. =
ring-page-order =3D 0)
> >> - expect a ring specified by 'ring-refX' where X is between 0 and
> >>    1 << ring-page-order
> >> - if that didn't work then see if there's a single page ring =
specified by
> >>    'ring-ref'
> >>
> >> This incorrect behaviour works most of the time but fails when a =
frontend
> >> that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> >> because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> >> 'ring-ref0' left around by the previous frontend will try to map =
the wrong
> >> grant reference.
> >>
> >> This patch restores the original behaviour.
> >>
> >> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid =
inconsistent xenstore 'ring-page-
> order' set by malicious blkfront")
> >> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >> ---
> >> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> >> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> >> Cc: Jens Axboe <axboe@kernel.dk>
> >> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> >>
> >> v2:
> >>   - Remove now-spurious error path special-case when nr_grefs =
=3D=3D 1
> >> ---
> >>   drivers/block/xen-blkback/common.h |  1 +
> >>   drivers/block/xen-blkback/xenbus.c | 38 =
+++++++++++++-----------------
> >>   2 files changed, 17 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/drivers/block/xen-blkback/common.h =
b/drivers/block/xen-blkback/common.h
> >> index b0c71d3a81a0..524a79f10de6 100644
> >> --- a/drivers/block/xen-blkback/common.h
> >> +++ b/drivers/block/xen-blkback/common.h
> >> @@ -313,6 +313,7 @@ struct xen_blkif {
> >>
> >>   	struct work_struct	free_work;
> >>   	unsigned int 		nr_ring_pages;
> >> +	bool                    multi_ref;
> >
> > Is it really necessary to introduce 'multi_ref' here or we may just =
re-use
> > 'nr_ring_pages'?
> >
> > According to blkfront code, 'ring-page-order' is set only when it is =
not zero,
> > that is, only when (info->nr_ring_pages > 1).
>=20

That's how it is *supposed* to be. Windows certainly behaves that way =
too.

> Did you look into all other OS's (Windows, OpenBSD, FreebSD, NetBSD,
> Solaris, Netware, other proprietary systems) implementations to verify
> that claim?
>=20
> I don't think so. So better safe than sorry.
>=20

Indeed. It was unfortunate that the commit to blkif.h documenting =
multi-page (829f2a9c6dfae) was not crystal clear and (possibly as a =
consequence) blkback was implemented to read ring-ref0 rather than =
ring-ref if ring-page-order was present and 0. Hence the only safe thing =
to do is to restore that behaviour.

  Paul

>=20
> Juergen


