Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1E84D78C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 02:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677970.1054933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXtDU-0003D7-8d; Thu, 08 Feb 2024 01:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677970.1054933; Thu, 08 Feb 2024 01:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXtDU-0003Bd-5n; Thu, 08 Feb 2024 01:28:40 +0000
Received: by outflank-mailman (input) for mailman id 677970;
 Thu, 08 Feb 2024 01:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXtDS-0003BX-P8
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 01:28:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61ecfe66-c621-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 02:28:37 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-560e9c7a094so1130576a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 17:28:37 -0800 (PST)
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
X-Inumbo-ID: 61ecfe66-c621-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707355717; x=1707960517; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0l3fpPtOu4vPs3n5vwWMAqgu+7u7L7cruddr+XftSA=;
        b=Nbu4Fa4NfSihUveNWiem2BvGPyG8B5c55t1GgnsrnK5pn0ZU2eF2zeV9rBduZZKM8r
         s52zKPH1RulQsiR2wbHtvguDbtS9FnTJTWV7SzgLl44Iykz7KKNXnyHoCSQrsvhLBUE5
         PeUOdgm6MMMOJ+HQ2UcMsgkU100qTbyX2yJ7XUH7JOMK8hWSOBYEEjM5EsHgAhH980Q0
         W2yQ5H55sqtLWkGmUIrA62ayk8seufgKvs7oKXA/ci1i/ajskMabFoEW2+wvmngE4LiZ
         LkGaHeRQYdgiiWuqLMG9Htw2kRIGMKwCyof3AGhaw/FlBPfRbbnEw6wBXrLuGjxSgQlT
         5vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707355717; x=1707960517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0l3fpPtOu4vPs3n5vwWMAqgu+7u7L7cruddr+XftSA=;
        b=MFs9kGmDO5n+NlTY5lrbY+HtPA715FZbB7pnD1mmx5m9xCRdftz23AocmvoA1A1fEl
         zdbO4VZqbRRtkN+MjemFgUtfP68suPdPILL2JwCOehVWkKM5Ya4kZMWur4Divh48BfSD
         /dZoV7dqyThC/jMRsWBOLSjr3I8fFioBe37zFphvef43/TZm0kBBrxOIAQ8njU2VDF7z
         jcVH5zz62WGM4bV9unkr0OY6Yu3pJCYTH1ZmGAdADS5uyg8Jh3xLz1dQJg9fAQz6RG26
         fToAmBgoHI0jKWnBi7NNoZ0pmfn2AIU9s7OJEs2Dd6JfMxu/3vvdE+6msZt2YDZDKVoJ
         sgsA==
X-Gm-Message-State: AOJu0YyFtYCt3wR7Ap2cOYJc1ZkJq77Yluj88l9zBFVpNywyyxZzXrcH
	6sEm+uV/Qr2cyESvrmuufrUdMwmwiSFCLbTxHPb2G2gjf0nUcAnfRP+sVfBqKXPR7eA0zjWE1HZ
	FU4xbZ9xp7VzufAXmkJjiCvFBIbU=
X-Google-Smtp-Source: AGHT+IF/FeEd7XrwAVCegx7mogK3i0Frooxf/vOgxw+BF076t1SLJ4ZhEwFqoKuAinu13SEkmpZKuztgHeoLyEE2/Pc=
X-Received: by 2002:aa7:d885:0:b0:55f:f1f5:1a41 with SMTP id
 u5-20020aa7d885000000b0055ff1f51a41mr3007154edq.15.1707355716854; Wed, 07 Feb
 2024 17:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-15-jgross@suse.com>
In-Reply-To: <20240205105001.24171-15-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 20:28:24 -0500
Message-ID: <CAKf6xpvZP-kGpPMvbVm-e=f-RQ3Czb24VnmwMzTc915O9hQJcg@mail.gmail.com>
Subject: Re: [PATCH v4 14/32] tools/xen-9pfsd: add 9pfs read request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:51=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the read request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> V2:
> - make error check more readable (Jason Andryuk)
> V4:
> - add directory read support
> ---
>  tools/xen-9pfsd/io.c | 90 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/tools/xen-9pfsd/io.c b/tools/xen-9pfsd/io.c
> index b763e3d8d9..cfbf3bef59 100644
> --- a/tools/xen-9pfsd/io.c
> +++ b/tools/xen-9pfsd/io.c

> +
> +    len =3D count;
> +    buf =3D ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
> +
> +    if ( fidp->isdir )
> +    {
> +        struct dirent *dirent;
> +        struct stat st;
> +        struct p9_stat p9s;
> +

"""
For directories, read returns an integral number of direc- tory
entries exactly as in stat (see stat(5)), one for each member of the
directory. The read request message must have offset equal to zero or
the value of offset in the previous read on the directory, plus the
number of bytes returned in the previous read. In other words, seeking
other than to the beginning is illegal in a directory (see seek(2)).
"""

I think you need to check `off`.  Looks like QEMU only checks for off
=3D=3D 0 and rewinds in that case.  QEMU ignores other values.

Regards,
Jason

> +        while ( len !=3D 0 )
> +        {
> +            errno =3D 0;
> +            dirent =3D readdir(fidp->data);
> +            if ( !dirent )
> +            {
> +                if ( errno )
> +                    goto err;
> +                break;
> +            }
> +            if ( fstatat(fidp->fd, dirent->d_name, &st, 0) < 0 )
> +                goto err;
> +            fill_p9_stat(device, &p9s, &st, dirent->d_name);
> +            if ( p9s.size + sizeof(p9s.size) > len )
> +            {
> +                seekdir(fidp->data, dirent->d_off);
> +                break;
> +            }
> +            fill_buffer_at(&buf, "s", &p9s);
> +            len -=3D p9s.size + sizeof(p9s.size);
> +        }
> +    }
> +    else
> +    {
> +        while ( len !=3D 0 )
> +        {
> +            ret =3D pread(fidp->fd, buf, len, off);
> +            if ( ret <=3D 0 )
> +                break;
> +            len -=3D ret;
> +            buf +=3D ret;
> +            off +=3D ret;
> +        }
> +        if ( ret < 0 && len =3D=3D count )
> +            goto err;
> +    }
> +
> +    buf =3D ring->buffer + sizeof(*hdr) + sizeof(uint32_t);
> +    len =3D count - len;
> +    fill_buffer(ring, hdr->cmd + 1, hdr->tag, "D", &len, buf);
> +
> + out:
> +    free_fid(device, fidp);
> +
> +    return;
> +
> + err:
> +    p9_error(ring, hdr->tag, errno);
> +    goto out;
> +}
> +

