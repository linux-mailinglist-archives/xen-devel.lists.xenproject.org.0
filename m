Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764A7E41E1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628836.980706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0N7R-0004Hw-Cm; Tue, 07 Nov 2023 14:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628836.980706; Tue, 07 Nov 2023 14:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0N7R-0004FS-9G; Tue, 07 Nov 2023 14:31:53 +0000
Received: by outflank-mailman (input) for mailman id 628836;
 Tue, 07 Nov 2023 14:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0N7Q-0004FL-7P
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:31:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63f9363a-7d7a-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 15:31:51 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so9633951a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 06:31:51 -0800 (PST)
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
X-Inumbo-ID: 63f9363a-7d7a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699367511; x=1699972311; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNa+9vA7SGDPrY+6jXvFjHdpMobBBaNlgx7pxxLyU3Q=;
        b=L4OWJB4G+CtCLxYRVCoZOWGnGYWpK9yVsF3paaZI3AU+CpWJdcreKEQJxUirYGSEaa
         EC+24OLa7gKjfyPG/9ae4PBkyJrANdyCoQ17W4LnoKOY8adNk0hQvbzCq8yRa+gaLUK4
         gC654cvs83efjHDbaE19dQVPrb/QhBIocCzlaX9eyiIlKzqdoGXdZWD8rwNhSZs8l5v5
         8So4oFttvoA41dOUThZNoYvzO/HKkuPmVaOo53m2Ac+ARQjQajUDT4DiO4RJ/FE48SNv
         6cVZ7Uh3tQ3Z58qTZt9NbBaenGdBZCf2WUoHjo++CHZMJd704Jc46lKfOZnX1vSx16ZN
         /QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699367511; x=1699972311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNa+9vA7SGDPrY+6jXvFjHdpMobBBaNlgx7pxxLyU3Q=;
        b=ExAwN9aXDaUS/kPu7NOEpbM4ZxkGVWvVNjFl0EluIIm5ig3c8js+dwhu+kdgQCyt0o
         iBQqcmhqqxfuzJkutP6AcI2oStHss6Em0FxASUJbAAABX31OPGXgQRjhxXXl3exu5hfR
         G2NCLiHhCr556MqXb8W8VsrRf8hUteQDU0lxakA257Sg7d9ar0mux0fDwDe8RUsVoGwM
         exAd/sdr8zjAskK0yDnOXslJCKP9kQZo5bimFoJHem8IBJJcVcXzf7Dq5QzFNPN2Lt6r
         dKSU7s/+x76Ht0Yy427eEyU9cy8srueFceeMGRmvBEMfH6+z/7krxUQtQBCzAMnRjpCV
         iI1g==
X-Gm-Message-State: AOJu0YywRA2po9+2no4t4w5A021CnGJboPgIWTXYcIF+xwaOD5nTVC4b
	61cOu/kQv20u/4AcCaGtHOE868AAELi4KuAUyRs=
X-Google-Smtp-Source: AGHT+IFDPsEiNYYJEhyuz8KRO1jedBmKV6fNaJ4AbI4ZC8VJYZEkbCLtcq8pobMGQ9fA9k5CxTP051iP7C7C+NwPsgc=
X-Received: by 2002:a50:cddc:0:b0:543:5a71:85be with SMTP id
 h28-20020a50cddc000000b005435a7185bemr19036302edj.23.1699367510593; Tue, 07
 Nov 2023 06:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-15-jgross@suse.com>
In-Reply-To: <20231101093325.30302-15-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 09:31:38 -0500
Message-ID: <CAKf6xpv7kLgRx=-zeX+249aEkKTXVJMaNiMTHbxK4-8kj1g+xA@mail.gmail.com>
Subject: Re: [PATCH 14/29] tools/xenlogd: add 9pfs read request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:35=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the read request of the 9pfs protocol.
>
> For now support only reading plain files (no directories).
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 6b4692ca67..b3f9f96bcc 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> @@ -1011,6 +1012,61 @@ static void p9_create(device *device, struct p9_he=
ader *hdr)
>      fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
>  }
>
> +static void p9_read(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    uint64_t off;
> +    unsigned int len;
> +    uint32_t count;
> +    void *buf;
> +    struct p9_fid *fidp;
> +    int ret;
> +
> +    ret =3D fill_data(device, "ULU", &fid, &off, &count);
> +    if ( ret !=3D 3 )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    fidp =3D find_fid(device, fid);
> +    if ( !fidp || !fidp->opened )
> +    {
> +        p9_error(device, hdr->tag, EBADF);
> +        return;
> +    }
> +

I think you want to mode check here for readability.

> +    if ( fidp->isdir )
> +    {
> +        p9_error(device, hdr->tag, EOPNOTSUPP);
> +        return;

Hmmm, 9P2000.u supports read on a dir.
https://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor30
"""
For directories, read returns an integral number of direc- tory
entries exactly as in stat (see stat(5)), one for each member of the
directory. The read request message must have offset equal to zero or
the value of offset in the previous read on the directory, plus the
number of bytes returned in the previous read. In other words, seeking
other than to the beginning is illegal in a directory (see seek(2)).
"""

> +    }
> +    else

Since the above is a return, maybe remove the else and un-indent?
Though maybe you don't want to do that if you want to implement read
on a dir.

> +    {
> +        len =3D count;
> +        buf =3D device->buffer + sizeof(*hdr) + sizeof(uint32_t);
> +
> +        while ( len !=3D 0 )
> +        {
> +            ret =3D pread(fidp->fd, buf, len, off);
> +            if ( ret <=3D 0 )
> +                break;
> +            len -=3D ret;
> +            buf +=3D ret;
> +            off +=3D ret;
> +        }
> +        if ( ret && len =3D=3D count )

This seems wrong to me - should this be ( ret < 0 && len =3D=3D count ) to
indicate an error on the first pread?  Any partial reads would still
return their data?

Regards,
Jason

> +        {
> +            p9_error(device, hdr->tag, errno);
> +            return;
> +        }
> +
> +        buf =3D device->buffer + sizeof(*hdr) + sizeof(uint32_t);
> +        len =3D count - len;
> +        fill_buffer(device, hdr->cmd + 1, hdr->tag, "D", &len, buf);
> +    }
> +}
> +
>  static void p9_write(device *device, struct p9_header *hdr)
>  {
>      uint32_t fid;

