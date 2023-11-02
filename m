Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F67DFA45
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 19:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626953.977708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyckg-0001hv-ED; Thu, 02 Nov 2023 18:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626953.977708; Thu, 02 Nov 2023 18:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyckg-0001gG-Bb; Thu, 02 Nov 2023 18:49:10 +0000
Received: by outflank-mailman (input) for mailman id 626953;
 Thu, 02 Nov 2023 18:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Af+B=GP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qycke-0001gA-Mn
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 18:49:08 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f9880ad-79b0-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 19:49:05 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5440f25dcc7so182023a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 11:49:05 -0700 (PDT)
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
X-Inumbo-ID: 7f9880ad-79b0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698950945; x=1699555745; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUnouD3i9m5FUwdGk7oTZpsyo6P6hX1HRPdljs4EnPY=;
        b=he3HnzcQZ8pfYmvziJiQ0hNUoZfJNgvWfie8RaBtza0Mz/9dqoUVXAaUZUYzQkIZtX
         fJcV0aVX7YyPAsFOo9AJfwHgzR+J1LnXn0GfM70yvnpbfpYo/xsQG8b4HqgAaJfsthLE
         rHSSOXBl7notADKKeSydUO0bOzTiaMqhwM69I0WjKrwgCS7jXk1ASAE6bSOYf0t4wCDV
         9SG7hJ/YhHkbYVCYLRIkDBU30VMnrJFmEdy7OHf8ffyLQ2QZ8eiapejK40WwuRjCYvJK
         8oLZh75798GNc52EJpY8Y8uy0tQggP8BQQVlcfm5i4D/5OJBCukLiHU2t4MiAzhidTgV
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698950945; x=1699555745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUnouD3i9m5FUwdGk7oTZpsyo6P6hX1HRPdljs4EnPY=;
        b=fhxnJuUIulgtlZ81dRI+wS4s5DTOmsqyvRqpXdJG4YYPFAOgtLF0ji9QlmUfcKH8Nb
         Ik44kMmjTQGvFxsysoyDHl6OWjwo/bfakxVgW8+BK/AhomlplJw8PSOJjk8Z1V9tlG87
         nXJoBHuZMkD9cnyS/iudXFzF4N04ju5re3IDJOkoNK61zN6jJn9ZqT2y9VmCjHSPj1c8
         /TNCKPSOowxBPdvFuC+As7lnpAuQ1DcWk2W2zwwpSbm5qAzdjAzsVzbh4Occ//8RKXKL
         6V8RrD+WBp5J+a8qGxfqF8vw1ST5ikYVpjYyRL1WpjHo+1Zbgf4BveDcHsWjbQBeLzL9
         YcDQ==
X-Gm-Message-State: AOJu0YwzworEtuAAeuLmkHksNu+xzRteRFEmSglX96/BQuwlH7OTXUVY
	YiPaAFI6Vjd2gLotq4CX5G6bAen3DUg+a0naBpsMHcAk
X-Google-Smtp-Source: AGHT+IGMaYeyWE4un6peZaffeb8+B69IUw4SzhUKyNp41jGrccwPGm51uUByWthyty1EJGu7ttOAZxsikwQ/V8UgYMA=
X-Received: by 2002:a50:d7dc:0:b0:543:7a41:4858 with SMTP id
 m28-20020a50d7dc000000b005437a414858mr6579445edj.22.1698950945135; Thu, 02
 Nov 2023 11:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-6-jgross@suse.com>
In-Reply-To: <20231101093325.30302-6-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 2 Nov 2023 14:48:54 -0400
Message-ID: <CAKf6xpvfVfDWmQnGxtDyxQ_6d0zWmb6FeXJKJfw+jk5-UcqO9A@mail.gmail.com>
Subject: Re: [PATCH 05/29] tools/xenlogd: add 9pfs response generation support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:56=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for generation a 9pfs protocol response via a format based
> approach.
>
> Strings are stored in a per device string buffer and they are
> referenced via their offset in this buffer. This allows to avoid
> having to dynamically allocate memory for each single string.
>
> As a first user of the response handling add a generic p9_error()
> function which will be used to return any error to the client.
>
> Add all format parsing variants in order to avoid additional code churn
> later when adding the users of those variants. Prepare a special case
> for the "read" case already (format character 'D'): in order to avoid
> adding another buffer for read data support doing the read I/O directly
> into the response buffer.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 590d06e906..5a06f72338 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> @@ -101,6 +112,172 @@ static bool io_work_pending(device *device)
>                                     : ring_out_data(device);
>  }
>
> +static void fmt_err(const char *fmt)
> +{
> +    syslog(LOG_CRIT, "illegal format %s passed to fill_buffer()", fmt);
> +    exit(1);
> +}
> +
> +/*
> + * Fill buffer with response data.
> + * fmt is a sequence of format characters. Supported characters are:
> + * a: an array (2 bytes number of elements + the following format as ele=
ments)
> + *    The number of elements is passed in the first unsigned int paramet=
er, the
> + *    next parameter is a pointer to an array of elements as denoted by =
the next
> + *    format character.
> + * b: 2 byte unsigned integer
> + *    The parameter is a pointer to a uint16_t value
> + * D: Data blob (4 byte length + <length> bytes)
> + *    2 parameters are consumed, first an unsigned int for the length, t=
hen a
> + *    pointer to the first uint8_t value.
> + *    No array support.
> + * L: 8 byte unsigned integer
> + *    The parameter is a pointer to a uint64_t value
> + * Q: Qid (struct p9_qid)
> + * S: String (2 byte length + <length> characters)
> + *    The length is obtained via strlen() of the parameter, being a poin=
ter
> + *    to the first character of the string
> + * U: 4 byte unsigned integer
> + *    The parameter is a pointer to a uint32_t value
> + */
> +static void fill_buffer(device *device, uint8_t cmd, uint16_t tag,
> +                        const char *fmt, ...)
> +{
> +    struct p9_header *hdr =3D device->buffer;
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
> +            *(__packed uint16_t *)data =3D array_sz;

Is it worth checking that array_sz doesn't exceed 0xffff?

> +            data +=3D sizeof(uint16_t);
> +            par =3D va_arg(ap, const void *);
> +            elem_sz =3D 0;
> +            break;
> +
> +        case 'u':
> +            *(__packed uint16_t *)data =3D *(const uint16_t *)par;
> +            elem_sz =3D sizeof(uint16_t);
> +            data +=3D sizeof(uint16_t);
> +            break;
> +
> +        case 'D':
> +            if ( array_sz )
> +                fmt_err(fmt);
> +            len =3D *(const unsigned int *)par;
> +            *(__packed uint32_t *)data =3D len;
> +            data +=3D sizeof(uint32_t);
> +            par =3D va_arg(ap, const void *);
> +            if ( data !=3D par )
> +                memcpy(data, par, len);
> +            data +=3D len;
> +            break;
> +
> +        case 'L':
> +            *(__packed uint64_t *)data =3D *(const uint64_t *)par;
> +            elem_sz =3D sizeof(uint64_t);
> +            data +=3D sizeof(uint64_t);
> +            break;
> +
> +        case 'Q':
> +            qid =3D par;
> +            elem_sz =3D sizeof(*qid);
> +            *(uint8_t *)data =3D qid->type;
> +            data +=3D sizeof(uint8_t);
> +            *(__packed uint32_t *)data =3D qid->version;
> +            data +=3D sizeof(uint32_t);
> +            *(__packed uint64_t *)data =3D qid->path;
> +            data +=3D sizeof(uint64_t);
> +            break;
> +
> +        case 'S':
> +            str_val =3D par;
> +            elem_sz =3D sizeof(str_val);
> +            len =3D strlen(str_val);

Should len be checked to ensure it doesn't exceed 0xffff?

Regards,
Jason

