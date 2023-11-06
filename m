Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467877E2CE9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 20:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628269.979518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05MJ-000465-3p; Mon, 06 Nov 2023 19:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628269.979518; Mon, 06 Nov 2023 19:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05MI-00043y-Vb; Mon, 06 Nov 2023 19:34:02 +0000
Received: by outflank-mailman (input) for mailman id 628269;
 Mon, 06 Nov 2023 19:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3DI=GT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r05MH-00043s-Vc
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:34:01 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9f74df-7cdb-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:34:00 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so9703209a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 11:34:00 -0800 (PST)
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
X-Inumbo-ID: 6f9f74df-7cdb-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699299240; x=1699904040; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wU0DABnWXR+b7H1Q7egghnKD5yBKkBHjShRejw6yjM=;
        b=mmW0VvhvNP+M3QBXjQZ0Nskx+q2kqU9sEFM0ttUWqs0aEqJdfoDGCBU51ShgkznHsS
         5aMDnpcUk7QiWFm0AleXMuMgocwes1t5ebbvzkpWtvheTyE6PVHLCxuz4iayw/I7lOj+
         XLKBq8FV+7QvybxHCLpT7kizIdt1hACkmJE3duRsjmCrG15uwpuilBsGKUCi75gSytjh
         QHwforrvePyii78u7q/tqkSv7E2BTNE8xVPRqFwOZrSKUQvVHKoLTby9JHNe6CI66M/H
         58RAkPu5PtlVcLpv3gOhOoq7LmrT7+qClR0b6rU1iNhjz9Sd9k9bOyDp4juyGAiy/cFd
         TS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699299240; x=1699904040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wU0DABnWXR+b7H1Q7egghnKD5yBKkBHjShRejw6yjM=;
        b=YoC9RIYvE6KbEEKOhCQBaWHNWFJgRbL5/NCtYcPi/S8x9g7xjex7xEgaKGGFI+jN3z
         SeI3GkhTuI5YC9LyOq2oRGfomtY115SoGu628NVjH//UOPr0yBWKLGDb7eAKu7JdrFMZ
         ME3L8a0SKpymEMd/PcwwUYAcMObSghj5oUtCqfMLrQxODjb6t4ftVW6is3dlV8K9obt3
         UyQvG4KWMcvKvkjTTTwNJPHEpBa8QXLqDfiOwt9TeuZgv0inneB+DNVQg2cFuvxemE1c
         Hq/ZjLScoPt4/te+Na2UJ3lSYGIoCQ8VkHj9oWHcS16kR8TDUNjlOE+s8ZkU/vWlXzWk
         6sqg==
X-Gm-Message-State: AOJu0YxCQMIO9bDpPCCwraV6nuXiT2NoMppm3eOfhUfOaqagX+cMS7sX
	eF4OmG29egrKw5+q8zxBKvITj5HFW0LOm7UDL/E=
X-Google-Smtp-Source: AGHT+IEQ7KmihvZrEodUruNY6mDJZtm4gUK77oG0+bN3ZTRf/9oKJYAQVgMfNsQG/etzvjPXmWh2lQd+uge6R5/Uwq8=
X-Received: by 2002:a50:d6d5:0:b0:543:57dd:503 with SMTP id
 l21-20020a50d6d5000000b0054357dd0503mr471202edj.3.1699299240208; Mon, 06 Nov
 2023 11:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-10-jgross@suse.com>
In-Reply-To: <20231101093325.30302-10-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 6 Nov 2023 14:33:48 -0500
Message-ID: <CAKf6xpt44k5zVjeeYR3vaAxXXc0oMn=r0m+eKpa6KMB6idK-qw@mail.gmail.com>
Subject: Re: [PATCH 09/29] tools/xenlogd: add 9pfs open request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:13=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the open request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c      | 130 ++++++++++++++++++++++++++++++++++++++++
>  tools/xenlogd/xenlogd.h |   4 ++
>  2 files changed, 134 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 778e1dc2c9..c2b259f42e 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> @@ -734,6 +745,121 @@ static void p9_walk(device *device, struct p9_heade=
r *hdr)
>      free(names);
>  }
>
> +static int open_flags_from_mode(uint8_t mode)
> +{
> +    int flags;
> +
> +    switch ( mode & P9_OMODEMASK )
> +    {
> +    case P9_OREAD:
> +        flags =3D O_RDONLY;
> +        break;
> +
> +    case P9_OWRITE:
> +        flags =3D O_WRONLY;
> +        break;
> +
> +    case P9_ORDWR:
> +        flags =3D O_RDWR;
> +        break;
> +
> +    default:
> +        return -1;
> +    }
> +
> +    if ( mode & P9_OTRUNC )
> +        flags |=3D O_TRUNC;

"""
In addition, if mode has the OTRUNC (0x10) bit set, the file is to be
truncated, which requires write permission (if the file is
append-only, and permission is granted, the open succeeds but the file
will not be trun- cated);
"""

This relies on libc O_TRUNC handling - I think that is probably better
than something custom so you get the libc semantics.

> +
> +    return flags;
> +}
> +
> +static unsigned int get_iounit(device *device, struct stat *st)
> +{
> +    return (device->max_size - st->st_blksize) & ~(st->st_blksize - 1);
> +}
> +
> +static void p9_open(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    uint8_t mode;
> +    struct p9_fid *fidp;
> +    struct stat st;
> +    struct p9_qid qid;
> +    uint32_t iounit;
> +    int flags;
> +    int ret;
> +
> +    ret =3D fill_data(device, "Ub", &fid, &mode);
> +    if ( ret !=3D 2 )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +    if ( mode & ~(P9_OMODEMASK | P9_OTRUNC | P9_OREMOVE) )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    fidp =3D find_fid(device, fid);
> +    if ( !fidp )
> +    {
> +        p9_error(device, hdr->tag, ENOENT);

If the host_path points at a populated directory, there is nothing
that populates the fids for pre-existing files and directories?  So
those files cannot be opened?  I guess that's not needed for
Xenstore-stubdom?

Thanks,
Jason

