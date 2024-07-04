Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545269274AB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 13:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753704.1161905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKN2-00030I-54; Thu, 04 Jul 2024 11:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753704.1161905; Thu, 04 Jul 2024 11:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKN2-0002yi-1w; Thu, 04 Jul 2024 11:11:24 +0000
Received: by outflank-mailman (input) for mailman id 753704;
 Thu, 04 Jul 2024 11:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coJv=OE=gmail.com=fernandez.simon@srs-se1.protection.inumbo.net>)
 id 1sPKN0-0002yc-7a
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 11:11:22 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23f72d23-39f6-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 13:11:20 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-36796d2e5a9so358758f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 04:11:20 -0700 (PDT)
Received: from [10.14.0.2] ([139.28.176.164]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36787db4d12sm6821051f8f.110.2024.07.04.04.11.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2024 04:11:18 -0700 (PDT)
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
X-Inumbo-ID: 23f72d23-39f6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091479; x=1720696279; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=gpvtI8uVysg2Uy06tFQBomNURfRtiSv/GnY73veCDgub0iX/OsrfWYi/25cKYq0T77
         pTH5zCWjOirzcU0jXclvaKG6INPn1YB98y0f9sLfzAAoznxFOdo+T2XeIhGL4jZd2T4A
         AkpU1OjF5WFj/c/Bp4TxFfNyhuKNtZzasSjXOiynE+Tk5pVpHEJMg4ZAAVzDVPdzsXuI
         eCd35cRoLFxn3qlNDEPv3BDuKhfX7PR1alN10QsvN7khzX8QvhoCxxcAUlGiX0Vu0rom
         EFDjl3+ZXhXky42xIA0crpuPbu0C8PUi37wtvNqmxBo7epBuoGghBPN55Y//LNCXrDxG
         iKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091479; x=1720696279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=cCbVB2p0VGUhL87f6U8RZ7j9E3gdEbJmD57/4If2/lcRMtRFbrgdqbgPatYip/ccL9
         eEk0S6t/h8LGp7nvkXr7I89JqhnaprD8Mlk2j3x8rIpft5X4fz+MmGUowWIRRiQzAGeM
         p9zOFNp9gMiBO4dgDQw7uI/4YOqJ7Rf07ESf7ReY69YoPL5ZXs3nqlOgYepVK00Yokfp
         93muvBQvK2MDr3U6nopDgBFO+R6F2DiAps9Ej7XP8S2yt8G6GNCj6pH0O5wdrk9/kOu5
         Xde6mA04myW/n2PIKDYZInh3cTUgjosq+dwjcY0tPLa22mA5Rzk2Gv75iCwwFon1IafI
         4OlA==
X-Forwarded-Encrypted: i=1; AJvYcCX8icR4bJfUJCk91CVjOCiqBU1xRMQTBEOMuhw1VOfXyihvBpaNNcl1RODGqmCrai01wra+vWoT8SIdwPmRRV+jrG9i3JizPMIO8N/S9As=
X-Gm-Message-State: AOJu0YzqZtS1u0hq/gRdPDyszo6lC/f2V27FeoCxl13NGikqOmxMzIBd
	03x8Op+9WKShUgm9IEBheD6cHUp+QqCE8LjFlx1YSbhTHT+NE7fD
X-Google-Smtp-Source: AGHT+IFEzvL2jC2faLe/uaMvaq/UCJ26KrH1XFm9Ol6h8w0Rebt6hjx4X+gdY7pIVUfbtqQYexMuPw==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id ffacd0b85a97d-3679dd17ec1mr1153338f8f.6.1720091479417;
        Thu, 04 Jul 2024 04:11:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
From: Simon Fernandez <fernandez.simon@gmail.com>
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 4 Jul 2024 12:11:16 +0100
Cc: Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?utf-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com,
 nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
 <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

Hi folks, how can I unsubscribe from this group.?
Thanks in advance.
S

> On 24 Jun 2024, at 18:08, Keith Busch <kbusch@kernel.org> wrote:
>=20
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
>> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, =
&(q)->queue_flags)
>> +#define blk_queue_nonrot(q)	((q)->limits.features & =
BLK_FEAT_ROTATIONAL)
>=20
> This is inverted. Should be:
>=20
> #define blk_queue_nonrot(q)	(!((q)->limits.features & =
BLK_FEAT_ROTATIONAL))
>=20


