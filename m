Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362DF2FD290
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71443.127934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EOj-0005QE-Tw; Wed, 20 Jan 2021 14:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71443.127934; Wed, 20 Jan 2021 14:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EOj-0005Pp-Qm; Wed, 20 Jan 2021 14:23:49 +0000
Received: by outflank-mailman (input) for mailman id 71443;
 Wed, 20 Jan 2021 14:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQjw=GX=gmail.com=arthurborsboom@srs-us1.protection.inumbo.net>)
 id 1l2EOi-0005Pk-2Y
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:23:48 +0000
Received: from mail-yb1-xb2c.google.com (unknown [2607:f8b0:4864:20::b2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 057f4de4-23dd-40d5-aed2-ec12d2189477;
 Wed, 20 Jan 2021 14:23:46 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e67so11026344ybc.12
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 06:23:46 -0800 (PST)
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
X-Inumbo-ID: 057f4de4-23dd-40d5-aed2-ec12d2189477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BvC3iJfQJi0dywgAZ4MTpCiRnZfcg7mTX0eXoTwYqpQ=;
        b=UrhM9TT37ZoB1yPJxwAJeRVQceFwv5bi+wOMkAEzlQTDxsqcLA0x9LE9PM2E8DKyOY
         QNOI4657/xjxM4uS+Rv1upYrUJuTOHm7e8xFnAc2bJPaiqRnA4xS6bIBPFz3O3qibjx+
         qhWmXhSzguMFijFbMmw/RhIMKeNLTGA3np1CS8wViC5F3FkjIAhMQORX7jU6Db0MoHOT
         gbKFL5zz/too9GEse/RCgDnRb4J3Vc3OiG1OHwUGAXTGBfY6bcM8OeS/YRcTR3DLNe5P
         yFT9wOyVv8CRGxUX3tLq7v1UkkSeOPJo0kN+GG9wplGPMFF1EGkpoMoPQaQ9DgdcFMLV
         fjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BvC3iJfQJi0dywgAZ4MTpCiRnZfcg7mTX0eXoTwYqpQ=;
        b=buRwwnuG6nOdi7HABVwDe8Zttj+whIDfBCjWJ2JVlDgL+Zp7de3H6Mr7hGRUg8w21t
         xGGawGl7e1c5cBD96qEnmqGV5RdfFXygp/j+kT/66k9/xbf5i/mQTMGYzbU1sYTjLjEI
         D3/PJ8NNEJS3/djV03HcHCCDdx6wtkh43xmbCnk0Fvxibw3ICclY8mAcqzgrrTMNNGu2
         GnnRnCg4wqXHuszTtdsrkeoW4VT0OUL7dsn3HmCiVye668TsH2NIni8l157pKZt3G5L1
         RxRwYiObwEjtZRmW4sUv3lD16ticMNy9lUBvYJtei69AmhcRNrkYuxJoCWK8eqLcFHWS
         qxgg==
X-Gm-Message-State: AOAM531LyllK+A7i0iURwcXnRPHW/emLjXXCMsLaOPsqkRH2JM7qcltD
	EQvgJ9t/vUnv7avyzLApL4xNAmHYWPdSE7iC5+Y=
X-Google-Smtp-Source: ABdhPJzxNv7uRDrnKpXdkG1M41pIUaMinwNzxUlO3eKKX6oE9q1m6wd0XfR6NmQ4eQJkrn5vlyKH6Fan5kd46VUJUtw=
X-Received: by 2002:a25:c04f:: with SMTP id c76mr12839489ybf.443.1611152626074;
 Wed, 20 Jan 2021 06:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20210119105727.95173-1-roger.pau@citrix.com>
In-Reply-To: <20210119105727.95173-1-roger.pau@citrix.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Wed, 20 Jan 2021 15:23:30 +0100
Message-ID: <CALUcmUkd9Eeau6tC9ZWHbLdvHTYfY34LvK6KKpOOxreYF67Myg@mail.gmail.com>
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org, 
	linux-block@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000f4c86b05b955b3e0"

--000000000000f4c86b05b955b3e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

I have set up a test environment based on Linux 5.11.0-rc4.
The patch did not apply clean, so I copied/pasted the patch manually.

Without the patch the call trace (as reported) is visible in dmesg.
With the patch the call trace in dmesg is gone, but ... (there is always a
but) ...

Now the discard action returns the following.

[arthur@test-arch ~]$ sudo fstrim -v /
fstrim: /: the discard operation is not supported

It might be correct, but of course I was hoping the Xen VM guest would pass
on the discard request to the block device in the Xen VM host, which is a
disk partition.
Any suggestions?

On Tue, 19 Jan 2021 at 11:57, Roger Pau Monne <roger.pau@citrix.com> wrote:

> This is inline with the specification described in blkif.h:
>
>  * discard-granularity: should be set to the physical block size if
>    node is not present.
>  * discard-alignment, discard-secure: should be set to 0 if node not
>    present.
>
> This was detected as QEMU would only create the discard-granularity
> node but not discard-alignment, and thus the setup done in
> blkfront_setup_discard would fail.
>
> Fix blkfront_setup_discard to not fail on missing nodes, and also fix
> blkif_set_queue_limits to set the discard granularity to the physical
> block size if none is specified in xenbus.
>
> Fixes: ed30bf317c5ce ('xen-blkfront: Handle discard requests.')
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-block@vger.kernel.org
> Cc: Arthur Borsboom <arthurborsboom@gmail.com>
> ---
> Changes since v2:
>  - Allow all discard-* nodes to be optional.
> ---
>  drivers/block/xen-blkfront.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 5265975b3fba..e1c6798889f4 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -945,7 +945,8 @@ static void blkif_set_queue_limits(struct
> blkfront_info *info)
>         if (info->feature_discard) {
>                 blk_queue_flag_set(QUEUE_FLAG_DISCARD, rq);
>                 blk_queue_max_discard_sectors(rq, get_capacity(gd));
> -               rq->limits.discard_granularity =3D info->discard_granular=
ity;
> +               rq->limits.discard_granularity =3D info->discard_granular=
ity
> ?:
> +
> info->physical_sector_size;
>                 rq->limits.discard_alignment =3D info->discard_alignment;
>                 if (info->feature_secdiscard)
>                         blk_queue_flag_set(QUEUE_FLAG_SECERASE, rq);
> @@ -2179,19 +2180,12 @@ static void blkfront_closing(struct blkfront_info
> *info)
>
>  static void blkfront_setup_discard(struct blkfront_info *info)
>  {
> -       int err;
> -       unsigned int discard_granularity;
> -       unsigned int discard_alignment;
> -
>         info->feature_discard =3D 1;
> -       err =3D xenbus_gather(XBT_NIL, info->xbdev->otherend,
> -               "discard-granularity", "%u", &discard_granularity,
> -               "discard-alignment", "%u", &discard_alignment,
> -               NULL);
> -       if (!err) {
> -               info->discard_granularity =3D discard_granularity;
> -               info->discard_alignment =3D discard_alignment;
> -       }
> +       info->discard_granularity =3D
> xenbus_read_unsigned(info->xbdev->otherend,
> +
> "discard-granularity",
> +                                                        0);
> +       info->discard_alignment =3D
> xenbus_read_unsigned(info->xbdev->otherend,
> +
> "discard-alignment", 0);
>         info->feature_secdiscard =3D
>                 !!xenbus_read_unsigned(info->xbdev->otherend,
> "discard-secure",
>                                        0);
> --
> 2.29.2
>
>

--=20
Arthur Borsboom

--000000000000f4c86b05b955b3e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Roger,<div><br></div><div>I have set up a test environm=
ent based on Linux 5.11.0-rc4.</div><div>The patch did not apply clean, so =
I copied/pasted the patch manually.</div><div><br></div><div>Without the pa=
tch the call trace (as reported) is visible in dmesg.</div><div>With the pa=
tch the call trace in dmesg is gone, but ... (there is always a but) ...</d=
iv><div><br></div><div>Now the discard action returns the following.</div><=
div><br></div>[arthur@test-arch ~]$ sudo fstrim -v /<br><div>fstrim: /: the=
 discard operation is not supported<br></div><div><br></div><div>It might b=
e correct, but of course I was hoping the Xen VM guest would pass on the di=
scard request to the block device in the Xen VM host, which is a disk parti=
tion.</div><div>Any suggestions?</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 19 Jan 2021 at 11:57, Roger P=
au Monne &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
is is inline with the specification described in blkif.h:<br>
<br>
=C2=A0* discard-granularity: should be set to the physical block size if<br=
>
=C2=A0 =C2=A0node is not present.<br>
=C2=A0* discard-alignment, discard-secure: should be set to 0 if node not<b=
r>
=C2=A0 =C2=A0present.<br>
<br>
This was detected as QEMU would only create the discard-granularity<br>
node but not discard-alignment, and thus the setup done in<br>
blkfront_setup_discard would fail.<br>
<br>
Fix blkfront_setup_discard to not fail on missing nodes, and also fix<br>
blkif_set_queue_limits to set the discard granularity to the physical<br>
block size if none is specified in xenbus.<br>
<br>
Fixes: ed30bf317c5ce (&#39;xen-blkfront: Handle discard requests.&#39;)<br>
Reported-by: Arthur Borsboom &lt;<a href=3D"mailto:arthurborsboom@gmail.com=
" target=3D"_blank">arthurborsboom@gmail.com</a>&gt;<br>
Signed-off-by: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.=
com" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
---<br>
Cc: Boris Ostrovsky &lt;<a href=3D"mailto:boris.ostrovsky@oracle.com" targe=
t=3D"_blank">boris.ostrovsky@oracle.com</a>&gt;<br>
Cc: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_blank">=
jgross@suse.com</a>&gt;<br>
Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
Cc: Konrad Rzeszutek Wilk &lt;<a href=3D"mailto:konrad.wilk@oracle.com" tar=
get=3D"_blank">konrad.wilk@oracle.com</a>&gt;<br>
Cc: &quot;Roger Pau Monn=C3=A9&quot; &lt;<a href=3D"mailto:roger.pau@citrix=
.com" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
Cc: Jens Axboe &lt;<a href=3D"mailto:axboe@kernel.dk" target=3D"_blank">axb=
oe@kernel.dk</a>&gt;<br>
Cc: <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank">xen=
-devel@lists.xenproject.org</a><br>
Cc: <a href=3D"mailto:linux-block@vger.kernel.org" target=3D"_blank">linux-=
block@vger.kernel.org</a><br>
Cc: Arthur Borsboom &lt;<a href=3D"mailto:arthurborsboom@gmail.com" target=
=3D"_blank">arthurborsboom@gmail.com</a>&gt;<br>
---<br>
Changes since v2:<br>
=C2=A0- Allow all discard-* nodes to be optional.<br>
---<br>
=C2=A0drivers/block/xen-blkfront.c | 20 +++++++-------------<br>
=C2=A01 file changed, 7 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c<br=
>
index 5265975b3fba..e1c6798889f4 100644<br>
--- a/drivers/block/xen-blkfront.c<br>
+++ b/drivers/block/xen-blkfront.c<br>
@@ -945,7 +945,8 @@ static void blkif_set_queue_limits(struct blkfront_info=
 *info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;feature_discard) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_queue_flag_set(=
QUEUE_FLAG_DISCARD, rq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_queue_max_disca=
rd_sectors(rq, get_capacity(gd));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rq-&gt;limits.disca=
rd_granularity =3D info-&gt;discard_granularity;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rq-&gt;limits.disca=
rd_granularity =3D info-&gt;discard_granularity ?:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 info-&gt;physical_sector_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rq-&gt;limits.disca=
rd_alignment =3D info-&gt;discard_alignment;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;featur=
e_secdiscard)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 blk_queue_flag_set(QUEUE_FLAG_SECERASE, rq);<br>
@@ -2179,19 +2180,12 @@ static void blkfront_closing(struct blkfront_info *=
info)<br>
<br>
=C2=A0static void blkfront_setup_discard(struct blkfront_info *info)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int discard_granularity;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int discard_alignment;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;feature_discard =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xenbus_gather(XBT_NIL, info-&gt;xbdev-&=
gt;otherend,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;discard-granu=
larity&quot;, &quot;%u&quot;, &amp;discard_granularity,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;discard-align=
ment&quot;, &quot;%u&quot;, &amp;discard_alignment,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;discard_gr=
anularity =3D discard_granularity;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;discard_al=
ignment =3D discard_alignment;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;discard_granularity =3D xenbus_read_un=
signed(info-&gt;xbdev-&gt;otherend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;discard-granularity&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;discard_alignment =3D xenbus_read_unsi=
gned(info-&gt;xbdev-&gt;otherend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;discard-alignment&quot;, 0)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;feature_secdiscard =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!xenbus_read_unsig=
ned(info-&gt;xbdev-&gt;otherend, &quot;discard-secure&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div style=3D"color:rgb(136,136,136)"><font face=3D"tah=
oma, sans-serif" size=3D"2">Arthur Borsboom</font></div><span style=3D"colo=
r:rgb(136,136,136);font-family:Tahoma"></span></div></div></div></div></div=
>

--000000000000f4c86b05b955b3e0--

