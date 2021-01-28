Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD733076A9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 14:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77014.139262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56yL-0004ui-Ql; Thu, 28 Jan 2021 13:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77014.139262; Thu, 28 Jan 2021 13:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56yL-0004u5-NW; Thu, 28 Jan 2021 13:04:29 +0000
Received: by outflank-mailman (input) for mailman id 77014;
 Thu, 28 Jan 2021 13:04:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTx=G7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l56yK-0004u0-9J
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 13:04:28 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e18bc520-35ef-40f8-9d9e-3fcc59c83997;
 Thu, 28 Jan 2021 13:04:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a1so5334381wrq.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 05:04:27 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id y11sm6824526wrh.16.2021.01.28.05.04.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:04:25 -0800 (PST)
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
X-Inumbo-ID: e18bc520-35ef-40f8-9d9e-3fcc59c83997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=r07cOqUlvYp1WHsrzj44Yu4OUpOcguYfeeuIVj/qDbw=;
        b=Rk9fe53K5VTpfm2U8PBdHv3XLLce2P9oCisRF5Yq7u5xWCiQyya+mRjVqICGiDpQzF
         OfHsObhL4vEt7jysO8HGdoWfXAHeenYbbT5LR/bAe5aB8a6XVOcZq9YLrbVNQeC57vSU
         dWTA91gao9LuVDiPnm7avh/sVwUllBd384L100cMvUJltceSmqK7ksV0071SEMXbOzXX
         BEgd1EX5FYHv/Qt7nUoY66us3qr/uAwS55F/AUFs+nw/htdc9UvcDkDitC6m8OtiRn/I
         YieryB2eMAdTorQ3EpxnO2Vq9pjE4eh3ZlzjXW99YXDe6uEil16KlnwRAGoS9Yug3tcd
         HUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=r07cOqUlvYp1WHsrzj44Yu4OUpOcguYfeeuIVj/qDbw=;
        b=QNr23jTL2HLkRrD9dQUdZ24kqMzPx3TI11hfmpaPaHoLUPu+0D3keqoy/cwJMb4yo+
         TEU+8oP6GkbSKNYMxhFu4fYEUnHw8dMIAKgaEUSRWPsOrANvlkHOLJnG577xfcV0xjtR
         1PE3lQIDFoIjGQ9wBIdRbRpGDGY3LWP2fSY706hokHQOblSwTJ3CQRry29PCyoY0Rjj0
         bYlhHtYCTqY0YK5ZhL/Hl31WlbMLd/2fbnmdHp1jbctn0Krd1UDfGXQCsQoWATLdUvJm
         8Yhmbjzee0VhRf3dD08fkXYBzt2L9SQt9JXR8gHrsekyzLaZV0nNOJJCBn5dROefDG0d
         sV+g==
X-Gm-Message-State: AOAM530WK4QP8WZXSASrVpja+stWfOX/8r5OZQGUKV3c59APHLL6HbLq
	7EVVAcOyD9KLMDr5kpr/0BatBPpyOIA=
X-Google-Smtp-Source: ABdhPJwQUxiX6zGyLrranHuj0NewclnhDgNhAQ2BzZAthx/6h3zL1Z4gkQzviuIoYLbADwPTmKs0og==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr14857238wre.403.1611839066350;
        Thu, 28 Jan 2021 05:04:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jens Axboe'" <axboe@kernel.dk>,
	"'Dongli Zhang'" <dongli.zhang@oracle.com>
References: <20210128125528.11695-1-paul@xen.org>
In-Reply-To: <20210128125528.11695-1-paul@xen.org>
Subject: RE: [PATCH] xen-blkback: fix compatibility bug with single page rings
Date: Thu, 28 Jan 2021 13:04:24 -0000
Message-ID: <029401d6f576$1ab25850$501708f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEx9UUKjS8MZ31yL9XSzmIYX+yNXKuHAXpA
Content-Language: en-gb

Apologies; I missed the v2 from the subject line. I'll re-send.

  Paul

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Paul Durrant
> Sent: 28 January 2021 12:55
> To: xen-devel@lists.xenproject.org; linux-block@vger.kernel.org; =
linux-kernel@vger.kernel.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; =
Dongli Zhang <dongli.zhang@oracle.com>
> Subject: [PATCH] xen-blkback: fix compatibility bug with single page =
rings
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to =
avoid
> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), =
the
> behaviour of xen-blkback when connecting to a frontend was:
>=20
> - read 'ring-page-order'
> - if not present then expect a single page ring specified by =
'ring-ref'
> - else expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
>=20
> This was correct behaviour, but was broken by the afforementioned =
commit to
> become:
>=20
> - read 'ring-page-order'
> - if not present then expect a single page ring (i.e. ring-page-order =
=3D 0)
> - expect a ring specified by 'ring-refX' where X is between 0 and
>   1 << ring-page-order
> - if that didn't work then see if there's a single page ring specified =
by
>   'ring-ref'
>=20
> This incorrect behaviour works most of the time but fails when a =
frontend
> that sets 'ring-page-order' is unloaded and replaced by one that does =
not
> because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> 'ring-ref0' left around by the previous frontend will try to map the =
wrong
> grant reference.
>=20
> This patch restores the original behaviour.
>=20
> Fixes: 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid =
inconsistent xenstore 'ring-page-
> order' set by malicious blkfront")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
>=20
> v2:
>  - Remove now-spurious error path special-case when nr_grefs =3D=3D 1
> ---
>  drivers/block/xen-blkback/common.h |  1 +
>  drivers/block/xen-blkback/xenbus.c | 38 =
+++++++++++++-----------------
>  2 files changed, 17 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/block/xen-blkback/common.h =
b/drivers/block/xen-blkback/common.h
> index b0c71d3a81a0..524a79f10de6 100644
> --- a/drivers/block/xen-blkback/common.h
> +++ b/drivers/block/xen-blkback/common.h
> @@ -313,6 +313,7 @@ struct xen_blkif {
>=20
>  	struct work_struct	free_work;
>  	unsigned int 		nr_ring_pages;
> +	bool                    multi_ref;
>  	/* All rings for this device. */
>  	struct xen_blkif_ring	*rings;
>  	unsigned int		nr_rings;
> diff --git a/drivers/block/xen-blkback/xenbus.c =
b/drivers/block/xen-blkback/xenbus.c
> index 9860d4842f36..6c5e9373e91c 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -998,14 +998,17 @@ static int read_per_ring_refs(struct =
xen_blkif_ring *ring, const char *dir)
>  	for (i =3D 0; i < nr_grefs; i++) {
>  		char ring_ref_name[RINGREF_NAME_LEN];
>=20
> -		snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> +		if (blkif->multi_ref)
> +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref%u", i);
> +		else {
> +			WARN_ON(i !=3D 0);
> +			snprintf(ring_ref_name, RINGREF_NAME_LEN, "ring-ref");
> +		}
> +
>  		err =3D xenbus_scanf(XBT_NIL, dir, ring_ref_name,
>  				   "%u", &ring_ref[i]);
>=20
>  		if (err !=3D 1) {
> -			if (nr_grefs =3D=3D 1)
> -				break;
> -
>  			err =3D -EINVAL;
>  			xenbus_dev_fatal(dev, err, "reading %s/%s",
>  					 dir, ring_ref_name);
> @@ -1013,18 +1016,6 @@ static int read_per_ring_refs(struct =
xen_blkif_ring *ring, const char *dir)
>  		}
>  	}
>=20
> -	if (err !=3D 1) {
> -		WARN_ON(nr_grefs !=3D 1);
> -
> -		err =3D xenbus_scanf(XBT_NIL, dir, "ring-ref", "%u",
> -				   &ring_ref[0]);
> -		if (err !=3D 1) {
> -			err =3D -EINVAL;
> -			xenbus_dev_fatal(dev, err, "reading %s/ring-ref", dir);
> -			return err;
> -		}
> -	}
> -
>  	err =3D -ENOMEM;
>  	for (i =3D 0; i < nr_grefs * XEN_BLKIF_REQS_PER_PAGE; i++) {
>  		req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> @@ -1129,10 +1120,15 @@ static int connect_ring(struct backend_info =
*be)
>  		 blkif->nr_rings, blkif->blk_protocol, protocol,
>  		 blkif->vbd.feature_gnt_persistent ? "persistent grants" : "");
>=20
> -	ring_page_order =3D xenbus_read_unsigned(dev->otherend,
> -					       "ring-page-order", 0);
> -
> -	if (ring_page_order > xen_blkif_max_ring_order) {
> +	err =3D xenbus_scanf(XBT_NIL, dev->otherend, "ring-page-order", =
"%u",
> +			   &ring_page_order);
> +	if (err !=3D 1) {
> +		blkif->nr_ring_pages =3D 1;
> +		blkif->multi_ref =3D false;
> +	} else if (ring_page_order <=3D xen_blkif_max_ring_order) {
> +		blkif->nr_ring_pages =3D 1 << ring_page_order;
> +		blkif->multi_ref =3D true;
> +	} else {
>  		err =3D -EINVAL;
>  		xenbus_dev_fatal(dev, err,
>  				 "requested ring page order %d exceed max:%d",
> @@ -1141,8 +1137,6 @@ static int connect_ring(struct backend_info *be)
>  		return err;
>  	}
>=20
> -	blkif->nr_ring_pages =3D 1 << ring_page_order;
> -
>  	if (blkif->nr_rings =3D=3D 1)
>  		return read_per_ring_refs(&blkif->rings[0], dev->otherend);
>  	else {
> --
> 2.17.1
>=20



