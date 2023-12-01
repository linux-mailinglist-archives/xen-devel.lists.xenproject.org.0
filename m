Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9C801397
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 20:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645672.1007919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99Dv-0002ZP-5U; Fri, 01 Dec 2023 19:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645672.1007919; Fri, 01 Dec 2023 19:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99Dv-0002WS-21; Fri, 01 Dec 2023 19:30:51 +0000
Received: by outflank-mailman (input) for mailman id 645672;
 Fri, 01 Dec 2023 19:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KM1I=HM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r99Dt-0002WL-Ns
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 19:30:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212ca62f-9080-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 20:30:48 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c54a3b789so1934924a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 11:30:48 -0800 (PST)
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
X-Inumbo-ID: 212ca62f-9080-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701459048; x=1702063848; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zq3qF0bJORuzz1CPuy38Zi6NHYRSFf5H+Oqx88Hvgs=;
        b=SSmr6JUjJTzdZfV6mXzLKyI4ek+dQBNWlGrapAdu1LGwjZ/LdiHoyV78qLMca+J9gK
         sExMEoQikNGMEA+zIm8SQl1EyqIDywagH72CzXIuYgGI4CrgJHXNHks2zwclhrmQThCu
         t2tAtPnIXq1s/HiVOMt8aNQ6bT3AxLriifsMG2J1RLGiK224pkg6ubL92SMmEAoZ9T+w
         gHF+bQPg5F+E4p+p+A1EmRwASGd/2gxGdqYz401IxZyufd3Vz8WBobJzhJox9+QIRqdI
         lfpoVvBQvDM0tAdfWdl9AVQn1B4+W/u4qmInhJkeRKNheP3KUlw9Ej1X6MhFOkj443XS
         OmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701459048; x=1702063848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zq3qF0bJORuzz1CPuy38Zi6NHYRSFf5H+Oqx88Hvgs=;
        b=d6zY7kMN1SHGM0eHx48UUzA8SDqFXC80A71e8tY/+5zLWXQW9TCtu/rGweFC5l4VVn
         L/yeZwMKDe7+8rg963EYzWyrvi3dY88PJxxKIZG5DQ08zGVSKcu4LFuLJuOCOyFLjhwC
         G6lQZzNME/QGC1uUhkkdCIktR0FQE+V8rhdhzQX8LEOeDlpFlawP4T0QToG7w02mz4F+
         ScXiE/onOa4bTUyN7RIACGdC/EeEj8eWbEe+Q2YBGfo4vvrQQDrJlRrQ7ZFp7OYdjiAO
         WlD+bOA+XcWTL01PQoafmRcxhjI+Gf8Kv9ZgXhCgI1siO2kcYMKiMW54DJ0z/YH5VIR3
         TF9w==
X-Gm-Message-State: AOJu0YxxyteT/R2XepDh3/J2nhLuIemFlxX7jH46zcfhkaKqZQDB/JkC
	f+Z6C3h1DqI9mYaFfvJzATbvH8bzqNJOQG50wEXD4a/LICA=
X-Google-Smtp-Source: AGHT+IHVbrY3sWW7VFp6IS6kxDOZFzgWMgvBKJzHmUWBPzfEeH7MEGgGlORkIphAbsI169U8JzlO2Vjo+ldI81VPtOs=
X-Received: by 2002:aa7:dd01:0:b0:54c:14d3:b3c3 with SMTP id
 i1-20020aa7dd01000000b0054c14d3b3c3mr2140351edv.11.1701459047570; Fri, 01 Dec
 2023 11:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-6-jgross@suse.com>
In-Reply-To: <20231110160804.29021-6-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 1 Dec 2023 14:30:35 -0500
Message-ID: <CAKf6xpvHdBsWn9z5Yu9MY18Q2CzT-YKVqEa1fYnptwTxve31cQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/29] tools/xenlogd: add 9pfs response generation support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:41=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
> +static void fill_buffer(struct ring *ring, uint8_t cmd, uint16_t tag,
> +                        const char *fmt, ...)
> +{
> +    struct p9_header *hdr =3D ring->buffer;
> +    void *data =3D hdr + 1;
> +    const char *f;
> +    const void *par;
> +    const char *str_val;
> +    const struct p9_qid *qid;
> +    unsigned int len;
> +    va_list ap;
> +    unsigned int array_sz =3D 0;
> +    unsigned int elem_sz =3D 0;
> +
> +    hdr->cmd =3D cmd;
> +    hdr->tag =3D tag;
> +
> +    va_start(ap, fmt);
> +
> +    for ( f =3D fmt; *f; f++ )
> +    {
> +        if ( !array_sz )
> +            par =3D va_arg(ap, const void *);
> +        else
> +        {
> +            par +=3D elem_sz;
> +            array_sz--;
> +        }
> +
> +        switch ( *f )
> +        {
> +        case 'a':
> +            f++;
> +            if ( !*f || array_sz )
> +                fmt_err(fmt);
> +            array_sz =3D *(const unsigned int *)par;
> +            if ( array_sz > 0xffff )
> +            {
> +                syslog(LOG_CRIT, "array size %u in fill_buffer()", array=
_sz);
> +                exit(1);
> +            }
> +            *(__packed uint16_t *)data =3D array_sz;

Compiling on Fedora 39, gcc 13.2.1:

io.c: In function =E2=80=98fill_buffer=E2=80=99:
io.c:233:13: error: =E2=80=98packed=E2=80=99 attribute ignored for type =E2=
=80=98uint16_t *=E2=80=99
{aka =E2=80=98short unsigned int *=E2=80=99} [-Werror=3Dattributes]
  233 |             *(__packed uint16_t *)data =3D array_sz;
      |             ^

For all these uses of __packed.

Regards,
Jason

