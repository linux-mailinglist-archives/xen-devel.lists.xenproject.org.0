Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4D30717E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 09:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76792.138680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52hZ-00080h-6l; Thu, 28 Jan 2021 08:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76792.138680; Thu, 28 Jan 2021 08:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l52hZ-00080L-3o; Thu, 28 Jan 2021 08:30:53 +0000
Received: by outflank-mailman (input) for mailman id 76792;
 Thu, 28 Jan 2021 08:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTx=G7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l52hY-00080G-1l
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 08:30:52 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2fe3801-fbd8-4b48-8292-a5da9c7ddfed;
 Thu, 28 Jan 2021 08:30:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y187so3861351wmd.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 00:30:50 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id z8sm5117039wmi.44.2021.01.28.00.30.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:30:49 -0800 (PST)
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
X-Inumbo-ID: e2fe3801-fbd8-4b48-8292-a5da9c7ddfed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=H8WoKx+nSfhoPodRKXREvqGtXU4BW2MHhgMwXifC4wM=;
        b=rLc9k9RMU1WVOq8sNKZ/5ut4I5yCV8PQzbp95t3Ttj/6pShlxr73mBOXUQhzwiVv4S
         MZwgx3iN6I8P3FONK3yEOlJofYojyoU+K+B+zWWwAcmFHPwMH4vPFjzdVcFu54KPQ1q8
         u540Sp/Q36zOpY/dVGT5c9sow2Iku7PddwA+aYdXugyLp7u9CUwNEjbb0UGHG9ssuT/I
         e+xkzudB4MdKygMk6MysW8WRR+fNnXm4J3cwTBHBlI7wJNZc2y+X06gUPtnjV5XDIcye
         RAb7NvxVMc6JTGgKD7Ic0xoPeDJw7/r9H/2489ZS2EBtIS+iVosCw9w5xioer3/3MFNQ
         LkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=H8WoKx+nSfhoPodRKXREvqGtXU4BW2MHhgMwXifC4wM=;
        b=Osd+cVh097gFo3OOpX3oWNX2AsBwjjOdr0y5wlvxx+EYE5T7AvMkyndqYHnY6o1zZ3
         qYv/wcrRCUJK8h2nd2ZW2vXzcWErsqc2jyCdYeK5LLzL/eGpSXekjfW/5C9fY1Che303
         UB2LsAn9lXew4qxWOktGqgMLBcbDCSMG+mp6Xna9aJ+udcZPANGsFJKs+/YcV6inkNwb
         Vl8W9k4gElF3U+3irbhlD/oKuc7o5ooyIn2FJfvPhzbXRrfYjh6IRG7sHKasH0Cy81V/
         AULxrZL07s5nkXSnc1NHR1ntNICyq59oD60qUooeUwWHjv32HWxgo/Y7TBpa8wM5af5f
         5Lig==
X-Gm-Message-State: AOAM531ndCiRGDgt7Q/VUBSzRsSqjYLeUKfwNSu4oSzpjCXNXm5huyu6
	gLUn8LPP7CFpTClMe7Kvz/Y=
X-Google-Smtp-Source: ABdhPJzPYCwg+J5CvqY2nxpXnp6tjmw1gSi+TgYY7Kv1KFq+k91l3/rqQl/t9heR2hclXXCDgdY3EA==
X-Received: by 2002:a1c:4e:: with SMTP id 75mr7683830wma.150.1611822650069;
        Thu, 28 Jan 2021 00:30:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Dongli Zhang'" <dongli.zhang@oracle.com>,
	<xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jens Axboe'" <axboe@kernel.dk>
References: <20210127103034.2559-1-paul@xen.org> <18c3efc4-57b6-5a5d-cfa3-7820b7f5080c@oracle.com>
In-Reply-To: <18c3efc4-57b6-5a5d-cfa3-7820b7f5080c@oracle.com>
Subject: RE: [PATCH] xen-blkback: fix compatibility bug with single page rings
Date: Thu, 28 Jan 2021 08:30:48 -0000
Message-ID: <028b01d6f54f$e1e52280$a5af6780$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8tEXaaRm8hTZRIcgVeZub79k21gI2QQrMqd+EqUA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Dongli Zhang
> Sent: 27 January 2021 19:57
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; =
linux-block@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>
> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single =
page rings
>=20
>=20
>=20
> On 1/27/21 2:30 AM, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to =
avoid
> > inconsistent xenstore 'ring-page-order' set by malicious blkfront"), =
the
> > behaviour of xen-blkback when connecting to a frontend was:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring specified by =
'ring-ref'
> > - else expect a ring specified by 'ring-refX' where X is between 0 =
and
> >   1 << ring-page-order
> >
> > This was correct behaviour, but was broken by the afforementioned =
commit to
> > become:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring
> > - expect a ring specified by 'ring-refX' where X is between 0 and
> >   1 << ring-page-order
> > - if that didn't work then see if there's a single page ring =
specified by
> >   'ring-ref'
> >
> > This incorrect behaviour works most of the time but fails when a =
frontend
> > that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> > because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> > 'ring-ref0' left around by the previous frontend will try to map the =
wrong
> > grant reference.
> >
> > This patch restores the original behaviour.
> >
> > Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid =
inconsistent xenstore 'ring-page-
> order' set by malicious blkfront")
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Dongli Zhang <dongli.zhang@oracle.com>
> > ---
> >  drivers/block/xen-blkback/common.h |  1 +
> >  drivers/block/xen-blkback/xenbus.c | 36 =
+++++++++++++-----------------
> >  2 files changed, 17 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/block/xen-blkback/common.h =
b/drivers/block/xen-blkback/common.h
> > index b0c71d3a81a0..524a79f10de6 100644
> > --- a/drivers/block/xen-blkback/common.h
> > +++ b/drivers/block/xen-blkback/common.h
> > @@ -313,6 +313,7 @@ struct xen_blkif {
> >
> >  	struct work_struct	free_work;
> >  	unsigned int 		nr_ring_pages;
> > +	bool                    multi_ref;
> >  	/* All rings for this device. */
> >  	struct xen_blkif_ring	*rings;
> >  	unsigned int		nr_rings;
> > diff --git a/drivers/block/xen-blkback/xenbus.c =
b/drivers/block/xen-blkback/xenbus.c
> > index 9860d4842f36..4c1541cde68c 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -998,10 +998,15 @@ static int read_per_ring_refs(struct =
xen_blkif_ring *ring, const char *dir)
> >  	for (i =3D 0; i < nr_grefs; i++) {
> >  		char ring_ref_name[RINGREF_NAME_LEN];
> >
> > -		snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> > +		if (blkif->multi_ref)
> > +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> > +		else {
> > +			WARN_ON(i !=3D 0);
> > +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref");
> > +		}
> > +
> >  		err =3D xenbus_scanf(XBT_NIL, dir, ring_ref_name,
> >  				   "%u", &ring_ref[i]);
> > -
> >  		if (err !=3D 1) {
> >  			if (nr_grefs =3D=3D 1)
> >  				break;
>=20
> I think we should not simply break here because the failure can be due =
to when
> (nr_grefs =3D=3D 1) and reading from legacy "ring-ref".
>=20

Yes, you're quite right. This special case is no longer correct.

> Should we do something as below?
>=20
> err =3D -EINVAL;
> xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
> return err;
>=20

I think simply removing the 'if (nr_grefs =3D=3D 1)' will be sufficient.

  Paul

> Dongli Zhang
>=20
>=20
> > @@ -1013,18 +1018,6 @@ static int read_per_ring_refs(struct =
xen_blkif_ring *ring, const char *dir)
> >  		}
> >  	}
> >
> > -	if (err !=3D 1) {
> > -		WARN_ON(nr_grefs !=3D 1);
> > -
> > -		err =3D xenbus_scanf(XBT_NIL, dir, "ring-ref", "%u",
> > -				   &ring_ref[0]);
> > -		if (err !=3D 1) {
> > -			err =3D -EINVAL;
> > -			xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
> > -			return err;
> > -		}
> > -	}
> > -
> >  	err =3D -ENOMEM;
> >  	for (i =3D 0; i < nr_grefs * XEN_BLKIF_REQS_PER_PAGE; i++) {
> >  		req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> > @@ -1129,10 +1122,15 @@ static int connect_ring(struct backend_info =
*be)
> >  		 blkif->nr_rings, blkif->blk_protocol, protocol,
> >  		 blkif->vbd.feature_gnt_persistent ? "persistent grants" : "");
> >
> > -	ring_page_order =3D xenbus_read_unsigned(dev->otherend,
> > -					       "ring-page-order", 0);
> > -
> > -	if (ring_page_order > xen_blkif_max_ring_order) {
> > +	err =3D xenbus_scanf(XBT_NIL, dev->otherend, "ring-page-order", =
"%u",
> > +			   &ring_page_order);
> > +	if (err !=3D 1) {
> > +		blkif->nr_ring_pages =3D 1;
> > +		blkif->multi_ref =3D false;
> > +	} else if (ring_page_order <=3D xen_blkif_max_ring_order) {
> > +		blkif->nr_ring_pages =3D 1 << ring_page_order;
> > +		blkif->multi_ref =3D true;
> > +	} else {
> >  		err =3D -EINVAL;
> >  		xenbus_dev_fatal(dev, err,
> >  				 "requested ring page order %d exceed max:%d",
> > @@ -1141,8 +1139,6 @@ static int connect_ring(struct backend_info =
*be)
> >  		return err;
> >  	}
> >
> > -	blkif->nr_ring_pages =3D 1 << ring_page_order;
> > -
> >  	if (blkif->nr_rings =3D=3D 1)
> >  		return read_per_ring_refs(&blkif->rings[0], dev->otherend);
> >  	else {
> >



