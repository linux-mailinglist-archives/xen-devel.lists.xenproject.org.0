Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F47F17CD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 16:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637062.992753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56Wy-00013w-TM; Mon, 20 Nov 2023 15:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637062.992753; Mon, 20 Nov 2023 15:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56Wy-00010j-PK; Mon, 20 Nov 2023 15:49:48 +0000
Received: by outflank-mailman (input) for mailman id 637062;
 Mon, 20 Nov 2023 15:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKU3=HB=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r56Wx-00010b-Kr
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 15:49:47 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c392da7-87bc-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 16:49:43 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54553e4888bso6275714a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 07:49:43 -0800 (PST)
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
X-Inumbo-ID: 6c392da7-87bc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700495383; x=1701100183; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJCeHYF2Uzczd8KumTZgdj4yK5tz2hxjsQizCJwXMhY=;
        b=DMMi5R4AFtLXYdCvDJ7C8F6E0W4KPdLZYQnYQidaV5Tnr35w2xmMxU2alYU35Eiv0s
         ASX1kLQlLWYVUapYqDuVwQdZAtOnbKXnJfwUyBZHsSSnl8fRUdwTxoG9+oxwPPwAiWMC
         1zLACa7vzetvmFANEsPIx90q24MMB8X+sNuviMS+x1dibz7eFRXqx/R3zFnMNJUKYC0z
         MHYjUKIxlZkeeHN8JXDZLVy+lgtFIOac/CMl7WDYzTXJe7C8pJu2yDmtDJUkKubLocMh
         +6e046coTqwfA2hgi4Yb8ThS93p7fzvTiTq3Dsa++M1GxQtRyPYIKbtn+i9XMTSa6NDW
         QgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700495383; x=1701100183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJCeHYF2Uzczd8KumTZgdj4yK5tz2hxjsQizCJwXMhY=;
        b=VE16NClLj5YtDtZpMFeFDbwGeDy39LA+j/qwYulbLD0liGbvlpw0ikgTTW0CuiOXBi
         aD/A3q/J8/IwVvfx7MA0t87ezUp48essHe46bEYGVCvnIqbNoSpFGSJL/I8toLCySbXg
         Neze8H8tl3ECwCv98T826mjSAekWK2W+arEdZ9ejtSy5FCbDbixrxNLXCkLlv1DWWLpO
         dnQPGXK9oUFFdKM6Y814MvAx/t29gtAlMIp8Tr+XrqF8otGa3i1iDqK60O6/jrzr2LG5
         8SWqrAXSlG3U+cNv8ypBahjUIsA6rutu7meJ2Y4OmfEXUV5nh5UUYukfRsxy7AfWvxzA
         ENWQ==
X-Gm-Message-State: AOJu0YyYOdpk0BsfsL1evX32evWo4ca0RJ4zZgFL3NvmUzKE5celmSLr
	mn/RP1owjueDNOfWCVNdflzJTUNyMNKcqYLWYV8=
X-Google-Smtp-Source: AGHT+IHXeRMerO0akX9519U+wBVy3YIZ5ebWXrHI8l38/RXZW5uHW2ioqCrkYCu3iT1D0Q3dQOG7dAokY73QHCCvNnU=
X-Received: by 2002:a05:6402:26d4:b0:548:7a3a:ef39 with SMTP id
 x20-20020a05640226d400b005487a3aef39mr5538906edd.35.1700495382820; Mon, 20
 Nov 2023 07:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-4-jgross@suse.com>
In-Reply-To: <20231110160804.29021-4-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Nov 2023 10:49:30 -0500
Message-ID: <CAKf6xpvb33Om8pQp-iv92r3LFU50Rn1yBiMbJ4R1eufVyx=Tag@mail.gmail.com>
Subject: Re: [PATCH v2 03/29] tools/xenlogd: connect to frontend
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:04=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add the code for connecting to frontends to xenlogd.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/tools/xen-9pfsd/xen-9pfsd.c b/tools/xen-9pfsd/xen-9pfsd.c
> index c365b35fe5..cc5734402d 100644
> --- a/tools/xen-9pfsd/xen-9pfsd.c
> +++ b/tools/xen-9pfsd/xen-9pfsd.c

>
> +static int check_host_path(device *device)
> +{
> +    struct stat statbuf;
> +    char *path, *p;
> +    int ret =3D 1;
> +
> +    if ( !device->host_path )
> +        return 1;
> +
> +    if ( device->host_path[0] !=3D '/' )
> +        return 1;
> +

From v1, you stated for alloc_fid_mem(device, fid, path):
> No, "path" is always starting with a "/" if it is not empty.

And then
snprintf(fidp->path, pathlen, "%s%s", device->host_path, path);

While alloc_fid_mem() uses "%s%s"

And p9_create() uses "%s/%s"

p9_walk does:
const char *rel_path =3D path + strlen(device->host_path)
...
alloc_fid_mem(device, fid, rel_path);

So host_path is expected not to have a tailing '/' to ensure that
rel_path starts with a '/'.  So you want to error out for a trailing
'/' (or overwrite with '\0')?

It seems like alloc_fid_mem() should also check to ensure path is "'/'
if it is not empty".

This is all subtle and security relevant, so it's important to get
this right.  A code comment explaining the expectation of paths for
host_path vs. fids would be good.

Also, maybe using openat() would be a better approach?  Create the
dirfd pointing at the 9pfs export and then use relative paths for the
paths inside.  This would cut down on the manual path manipulations.

> +    path =3D strdup(device->host_path);
> +    if ( !path )
> +    {
> +        syslog(LOG_CRIT, "memory allocation failure!");
> +        return 1;
> +    }
> +
> +    for ( p =3D path; p; )
> +    {
> +        p =3D strchr(p + 1, '/');
> +        if ( p )
> +            *p =3D 0;
> +        if ( !stat(path, &statbuf) )
> +        {
> +            if ( !(statbuf.st_mode & S_IFDIR) )
> +                break;
> +            if ( !p )
> +            {
> +                ret =3D 0;
> +                break;
> +            }
> +            *p =3D '/';
> +            continue;
> +        }
> +        if ( mkdir(path, 0777) )
> +            break;
> +        if ( p )
> +            *p =3D '/';
> +    }
> +
> +    free(path);
> +    return ret;
> +}
> +

> +
> +static int write_backend_node(device *device, const char *node, const ch=
ar *val)
> +{
> +    struct path p;
> +    struct xs_permissions perms[2] =3D {
> +        { .id =3D 0, .perms =3D XS_PERM_NONE },

This hard codes dom0.  If xs_permissions supported DOMID_SELF, it
wouldn't need to be looked up.

> +        { .id =3D device->domid, .perms =3D XS_PERM_READ }
> +    };
> +
> +    construct_backend_path(device, node, &p);
> +    if ( !xs_write(xs, XBT_NULL, p.path, val, strlen(val)) )
> +    {
> +        syslog(LOG_ERR, "error writing bac=E1=B8=B1end node \"%s\" for d=
evice %u/%u",
> +               node, device->domid, device->devid);
> +        return 1;
> +    }
> +
> +    if ( !xs_set_permissions(xs, XBT_NULL, p.path, perms, 2) )
> +    {
> +        syslog(LOG_ERR, "error setting permissions for \"%s\"", p.path);
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +

> +
> +static void connect_device(device *device)
> +{
> +    unsigned int val;
> +    unsigned int ring_idx;
> +    char node[20];
> +    struct ring *ring;
> +    xenevtchn_port_or_error_t evtchn;
> +
> +    val =3D read_frontend_node_uint(device, "version", 0);
> +    if ( val !=3D 1 )
> +        return connect_err(device, "frontend specifies illegal version")=
;
> +    device->num_rings =3D read_frontend_node_uint(device, "num-rings", 0=
);
> +    if ( device->num_rings < 1 || device->num_rings > MAX_RINGS )
> +        return connect_err(device, "frontend specifies illegal ring numb=
er");
> +
> +    for ( ring_idx =3D 0; ring_idx < device->num_rings; ring_idx++ )
> +    {
> +        ring =3D calloc(1, sizeof(*ring));
> +        if ( !ring )
> +            return connect_err(device, "could not allocate ring memory")=
;
> +        device->ring[ring_idx] =3D ring;
> +        ring->device =3D device;
> +        pthread_cond_init(&ring->cond, NULL);
> +        pthread_mutex_init(&ring->mutex, NULL);
> +
> +

extra blank line.

Regards,
Jason

