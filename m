Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FC2AA2B2
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 06:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21262.47570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbGto-0001E2-Dh; Sat, 07 Nov 2020 05:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21262.47570; Sat, 07 Nov 2020 05:36:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbGto-0001De-AF; Sat, 07 Nov 2020 05:36:28 +0000
Received: by outflank-mailman (input) for mailman id 21262;
 Sat, 07 Nov 2020 04:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4UT=EN=gmail.com=xjtuwjp@srs-us1.protection.inumbo.net>)
 id 1kbG4W-00055N-AF
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 04:43:28 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e7b8f5-e718-4d47-b4be-ffe546381447;
 Sat, 07 Nov 2020 04:43:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 126so4803694lfi.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 20:43:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=s4UT=EN=gmail.com=xjtuwjp@srs-us1.protection.inumbo.net>)
	id 1kbG4W-00055N-AF
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 04:43:28 +0000
X-Inumbo-ID: 28e7b8f5-e718-4d47-b4be-ffe546381447
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28e7b8f5-e718-4d47-b4be-ffe546381447;
	Sat, 07 Nov 2020 04:43:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 126so4803694lfi.8
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 20:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jS9MbGtA3iifbgEcp45wxTOB4OKIZiUtDbS0BnZQ1E=;
        b=uyNTKiRfvsRl7dzkGQkHAdLGXciwNho3GRdQsHy5Sedv+AKGKhYus+bv9h8LXZQq6s
         wwu1nXip45DNnsBIC7dhPaWubGFLm0Gz/fDVyC7b6rkfgRe9QuBpVP/b4vbvyLKHOnWW
         uC1pKsPvhLda4Ffft3XcaG2vAdNhOOksanngAicA0csNFGEGuWvUhPj23BPqcTOwLl38
         DAkAPbMKlIYsr/1dbsR3CuGzzrtu21qpJ+8kuAB33j32phjXczoC3C6B84JWBG4dGfRu
         YL3D+i9k0nMtn1MouB79TjBRkFwf118fz3PSNulmZZubZi3Qf3wK+3GiX8TMC5KqNj4u
         C/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jS9MbGtA3iifbgEcp45wxTOB4OKIZiUtDbS0BnZQ1E=;
        b=N3PF4lmgOkp0HQ2s+Xg/rNcTBEk14obbCpj1fQZaYeBbnNvHm9BoDXM8EOY1dtMOTM
         /tl9O+iBHbND3WTKXX33LlcKsW5hEovq+h6qERiNU6cSt0AbqxnXLSRmJDmC7eariv09
         MW3yberGF8RyP9nrSO9E9FGh1gDUtARIx13OHKWoIN0IGdcLCmS5uefrvyY94urQHGex
         Ko2El/VaORl8tz3gYyMcBztUS8FtVwoD8kf10MiUvlgfcGLMr66jYA1lMBJEmKhIBm7p
         /Ej2r8J0WvdbXPKzUQzjA6IbDpYj3u193z1XrBUhMxh18yCX0+p7oabMkeh3ru6GkjV9
         9Q8A==
X-Gm-Message-State: AOAM533X1LM79mekiWPiRJHYkDNuIdniwPMDTSMYq92j1piC74roBkwV
	UhM0/J1a6attaLD/msLJuE0a7WtGwXJb61twlpo=
X-Google-Smtp-Source: ABdhPJzn/pNC05U4kPURn4luKn+squhbFoU/xCSDcnlGrkwpRVWPCp6PcYhGp25nUSiML9AX1uojvU9jJs5PJTDaJxo=
X-Received: by 2002:ac2:5209:: with SMTP id a9mr1446563lfl.86.1604724205658;
 Fri, 06 Nov 2020 20:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-25-hch@lst.de>
In-Reply-To: <20201106190337.1973127-25-hch@lst.de>
From: Jack Wang <xjtuwjp@gmail.com>
Date: Sat, 7 Nov 2020 05:43:14 +0100
Message-ID: <CAD+HZHUaPLB0T2A3vAPq6gSr5gEGK3XLMSAmO0FLhkWaLzPBpg@mail.gmail.com>
Subject: Re: [PATCH 24/24] block: unexport revalidate_disk_size
To: Christoph Hellwig <hch@lst.de>
Cc: Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, 
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Josef Bacik <josef@toxicpanda.com>, Justin Sanders <justin@coraid.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Minchan Kim <minchan@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Song Liu <song@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, ceph-devel@vger.kernel.org, 
	dm-devel@redhat.com, drbd-dev@lists.linbit.com, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, nbd@other.debian.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003da75005b37cf8d6"

--0000000000003da75005b37cf8d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christoph Hellwig <hch@lst.de>=E4=BA=8E2020=E5=B9=B411=E6=9C=886=E6=97=A5 =
=E5=91=A8=E4=BA=9420:15=E5=86=99=E9=81=93=EF=BC=9A

> revalidate_disk_size is not only called from set_capacity_and_notify,
> so drop the export.

s/not/now

>
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks!
Jack Wang

>
> ---
>  fs/block_dev.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 66ebf594c97f47..d8664f5c1ff669 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1362,7 +1362,6 @@ void revalidate_disk_size(struct gendisk *disk, boo=
l
> verbose)
>                 bdput(bdev);
>         }
>  }
> -EXPORT_SYMBOL(revalidate_disk_size);
>
>  void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors)
>  {
> --
> 2.28.0
>
>
> _______________________________________________
> Linux-nvme mailing list
> Linux-nvme@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-nvme
>

--0000000000003da75005b37cf8d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de">hch@lst=
.de</a>&gt;=E4=BA=8E2020=E5=B9=B411=E6=9C=886=E6=97=A5 =E5=91=A8=E4=BA=9420=
:15=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">revalidate_disk_si=
ze is not only called from set_capacity_and_notify,<br>
so drop the export.</blockquote><div dir=3D"auto">s/not/now</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de" target=
=3D"_blank">hch@lst.de</a>&gt;</blockquote><div dir=3D"auto">Thanks!</div><=
div dir=3D"auto">Jack Wang</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
---<br>
=C2=A0fs/block_dev.c | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/fs/block_dev.c b/fs/block_dev.c<br>
index 66ebf594c97f47..d8664f5c1ff669 100644<br>
--- a/fs/block_dev.c<br>
+++ b/fs/block_dev.c<br>
@@ -1362,7 +1362,6 @@ void revalidate_disk_size(struct gendisk *disk, bool =
verbose)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdput(bdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
-EXPORT_SYMBOL(revalidate_disk_size);<br>
<br>
=C2=A0void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors)<b=
r>
=C2=A0{<br>
-- <br>
2.28.0<br>
<br>
<br>
_______________________________________________<br>
Linux-nvme mailing list<br>
<a href=3D"mailto:Linux-nvme@lists.infradead.org" target=3D"_blank">Linux-n=
vme@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-nvme" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/li=
nux-nvme</a><br>
</blockquote></div></div>

--0000000000003da75005b37cf8d6--

