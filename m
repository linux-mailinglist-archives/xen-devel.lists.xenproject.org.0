Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6B7E2D3E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 20:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628278.979538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05f3-0008QT-Q5; Mon, 06 Nov 2023 19:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628278.979538; Mon, 06 Nov 2023 19:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05f3-0008Oi-N8; Mon, 06 Nov 2023 19:53:25 +0000
Received: by outflank-mailman (input) for mailman id 628278;
 Mon, 06 Nov 2023 19:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3DI=GT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r05f1-0008OT-Ui
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:53:23 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2431229d-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:53:22 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507bd64814fso6595435e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 11:53:22 -0800 (PST)
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
X-Inumbo-ID: 2431229d-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699300402; x=1699905202; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dypKsM/okWu/oQXIO+rsol5GgpxF+vS+NW0YmoY6b7k=;
        b=K4sMz3Q+obsD1EbGtJppjgn4lKg5cF5Ab+l+ChxeUX8GW8uX9Z0nflNyJl2r/OXJ9L
         PLPf0PjH+PPKXb3SqjxMAsHhbWqvEWZKK0XKe5MEE1aw5U7VZrLkVu+9ccfbG6u7UpSV
         iwRbisXSRJip/xKaxf4jnNUKzff4Ce+5OkDT4LM0/Ntri8DLH4KjJKLy6qRZrXUxKYWN
         l/4HjKgl6Yk8s7i2iRrUec9GjlKIZGF9WMT80D56BOa02onUwtWb5lR2lJbD/YWHUKGr
         JDZHlMKXyvppkjyHH1FhiSJGunZRxMLYRrApVxGOkgIIZgePKj/Q62plBcNg7/OfhcF8
         NiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699300402; x=1699905202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dypKsM/okWu/oQXIO+rsol5GgpxF+vS+NW0YmoY6b7k=;
        b=H47dqBYHvsXYpWetVWJPGFeQ7P8i+1U3n78lqVQT44fESExa/0V8hNcLp5wFcloU9Z
         J+7fSevrhEak7W43rN0xrUkjekheziLxe2x9knZBE/BYOdM1dtg+H6ned8mF4OUP3Sgv
         2rUG+tbyBPDc5DeSOyZMKiXnpsOPeo9F9z0pq8TGKhLOB+xZMJuVCRdWewMcxUJwJKK3
         R48k19dq9JjVSNhoULrQ94a3/P7AG3Djly/exEdzJlrmKVXt6+Qx2ajaHK21jbDFMQb8
         l4YNDxsX/q53m0qvDgcV5tnF4V/s11wNxeAik8Jjk+FSDYKfawWvk8N8Ec4XMhlL2KrC
         7+jg==
X-Gm-Message-State: AOJu0YwELlBeyGj8KpVWnhU1hNHmZbIt3lgFE2VGm/gU9amG6hWACOLy
	651+59Wn0lMalOB1DREqFMr6AeiPYG0IjJ4YCqriUZVQvmI=
X-Google-Smtp-Source: AGHT+IGgViUJvrdZSfSKFyD+DiUWJWlCPaOWgrhC9F5rRBPOiZZwCI/SKo+BESiYRqY5BUqDBQnlzANKaL9MX2RxAjk=
X-Received: by 2002:ac2:5467:0:b0:4fe:8c1d:9e81 with SMTP id
 e7-20020ac25467000000b004fe8c1d9e81mr21027134lfn.36.1699300401936; Mon, 06
 Nov 2023 11:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-12-jgross@suse.com>
In-Reply-To: <20231101093325.30302-12-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 6 Nov 2023 14:53:09 -0500
Message-ID: <CAKf6xpu1-tQCY-DRtr2A7fo5=koKR4SjdKEw5J3EsUcY-8iO9Q@mail.gmail.com>
Subject: Re: [PATCH 11/29] tools/xenlogd: add 9pfs create request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the create request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c | 133 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 2607095e51..34f137be1b 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c
> @@ -31,6 +31,7 @@
>  #define P9_CMD_ERROR      107
>  #define P9_CMD_WALK       110
>  #define P9_CMD_OPEN       112
> +#define P9_CMD_CREATE     114
>  #define P9_CMD_CLUNK      120
>
>  /* P9 protocol open flags. */
> @@ -41,6 +42,12 @@
>  #define P9_OTRUNC        0x10   /* or'ed in, truncate file first */
>  #define P9_OREMOVE       0x40   /* or'ed in, remove file after clunk */
>
> +/* P9 protocol create permission masks. */
> +#define P9_CREATE_PERM_DIR        0x80000000
> +#define P9_CREATE_PERM_NOTSUPP    0x03b00000   /* link, symlink, ... */
> +#define P9_CREATE_PERM_DIR_MASK   0777
> +#define P9_CREATE_PERM_FILE_MASK  0666
> +
>  #define P9_MIN_MSIZE      2048
>  #define P9_VERSION        "9P2000.u"
>  #define P9_WALK_MAXELEM   16
> @@ -861,6 +868,128 @@ static void p9_open(device *device, struct p9_heade=
r *hdr)
>      fill_buffer(device, hdr->cmd + 1, hdr->tag, "QU", &qid, &iounit);
>  }
>
> +static void p9_create(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    unsigned int name_off;
> +    uint32_t perm;
> +    uint8_t mode;
> +    unsigned int ext_off;
> +    struct p9_fid *fidp;
> +    struct p9_fid *new_fidp;
> +    char *path;
> +    struct stat st;
> +    struct p9_qid qid;
> +    uint32_t iounit;
> +    int flags;
> +    int ret;
> +
> +    ret =3D fill_data(device, "USUbS", &fid, &name_off, &perm, &mode, &e=
xt_off);
> +    if ( ret !=3D 5 )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    if ( !name_ok(device->str + name_off) )
> +    {
> +        p9_error(device, hdr->tag, ENOENT);
> +        return;
> +    }
> +
> +    if ( perm & P9_CREATE_PERM_NOTSUPP )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    fidp =3D find_fid(device, fid);
> +    if ( !fidp || fidp->opened )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        return;
> +    }
> +
> +    path =3D malloc(strlen(fidp->path) + strlen(device->str + name_off) =
+ 2 -
> +                  strlen(device->host_path));
> +    if ( !path )
> +    {
> +        p9_error(device, hdr->tag, ENOMEM);
> +        return;
> +    }
> +    sprintf(path, "%s/%s", fidp->path + strlen(device->host_path),
> +            device->str + name_off);
> +    new_fidp =3D alloc_fid_mem(device, fid, path);
> +    free(path);
> +    if ( !new_fidp )
> +    {
> +        p9_error(device, hdr->tag, ENOMEM);
> +        return;
> +    }
> +
> +    if ( perm & P9_CREATE_PERM_DIR )
> +    {
> +        if ( mode !=3D P9_OREAD )
> +        {
> +            p9_error(device, hdr->tag, EINVAL);
> +            free(new_fidp);
> +            return;
> +        }
> +        if ( mkdir(new_fidp->path, perm & P9_CREATE_PERM_DIR_MASK) < 0 )
> +        {
> +            p9_error(device, hdr->tag, errno);
> +            free(new_fidp);
> +            return;
> +        }
> +
> +        XEN_TAILQ_REMOVE(&device->fids, fidp, list);
> +        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
> +        free(fidp);
> +        fidp =3D new_fidp;
> +
> +        fidp->data =3D opendir(fidp->path);
> +        if ( !fidp->data )
> +        {
> +            p9_error(device, hdr->tag, errno);
> +            return;
> +        }
> +        fidp->fd =3D dirfd(fidp->data);
> +    }
> +    else
> +    {
> +        flags =3D open_flags_from_mode(mode);
> +        if ( flags < 0 )
> +        {
> +            p9_error(device, hdr->tag, EINVAL);
> +            free(new_fidp);
> +            return;
> +        }
> +
> +        XEN_TAILQ_REMOVE(&device->fids, """fidp, list);
> +        XEN_TAILQ_INSERT_HEAD(&device->fids, new_fidp, list);
> +        free(fidp);
> +        fidp =3D new_fidp;
> +
> +        fidp->fd =3D creat(fidp->path, flags);

https://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor29
"""
The create request asks the file server to create a new file with the
name supplied, in the directory (dir) represented by fid, and requires
write permission in the directory. The owner of the file is the
implied user id of the request, the group of the file is the same as
dir, and the permissions are the value of

perm & (~0666 | (dir.perm & 0666))

if a regular file is being created and

perm & (~0777 | (dir.perm & 0777))

if a directory is being created. This means, for example, that if the
create allows read permission to others, but the containing directory
does not, then the created file will not allow others to read the
file.
"""

So P9_CREATE_PERM_FILE_MASK (which is otherwise unused) should be
incorporated.  Also the mode and the permissions are handled
independently:
"""
Finally, the newly created file is opened according to mode, and fid
will represent the newly opened file. Mode is not checked against the
permissions in perm.
"""

I think fidp->mode should be set in here somewhere based on mode.  And
`flags` for creat should be derived from the incoming perms.

Regards,
Jason

