Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC17E0556
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627208.978125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvrc-0006rR-JQ; Fri, 03 Nov 2023 15:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627208.978125; Fri, 03 Nov 2023 15:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyvrc-0006oE-Ge; Fri, 03 Nov 2023 15:13:36 +0000
Received: by outflank-mailman (input) for mailman id 627208;
 Fri, 03 Nov 2023 15:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyvrb-0006o8-CO
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:13:35 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dae3429-7a5b-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 16:13:33 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so3647174a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:13:33 -0700 (PDT)
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
X-Inumbo-ID: 8dae3429-7a5b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699024413; x=1699629213; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjC1EiTM5mmUDJ0CTRFxFLf4Utwun6btGt4CiPlS7f8=;
        b=B225BN6V7MczYAQy2vWPUMv111hLYLqlEgq1rq/03mVqhmhq6t5INxRcXXCEaL4Fct
         0wECZ67RBUf4W2Q8+UzURl1rHfAu+tY3P9P0z6fbnposBbbF/eZHqMjNScIZXb8frlhV
         3ylGiHSHA575ojO0jcPmJ8Tghoa88hh5+7t8L2DkGaS0dIVtYBD3SnRqLbDXDP+JPIeL
         SAWLN9FEsVSw84ar+R+0YRk4Bvu4rdyu269Y8i4TAVgBM+vj4q10ZOnJSYb0lly3t4Ld
         9BAPh2QsMIPsRTJYORTJdKb8saag+yhiM0dATSz2ZW8GfsgpTffonZ/pmuF6Y2dRuYV2
         qHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699024413; x=1699629213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjC1EiTM5mmUDJ0CTRFxFLf4Utwun6btGt4CiPlS7f8=;
        b=haMtg7ye76qT2AN84azzBvYXOlEdhWKmV1jOpjH8zo/+npsXJkztU1w+teMj/Phaxi
         JVtkonfIY3kwO3XbudQ0mMVzlfkPcWo1cOTv8EFyUF6X6/BHIzO+3Yx7T9Gmw51cW1Po
         CFcj1VL12VAdSQZC0FyLGa87m+EUpuue+lIfBYKKOrsbzY3RLUl+oOicMi0vCbCuaGxi
         Q/VBVRh8+vAI/4lTjxCP3pnvtKuybgLD+l6UWknT59V2KKxslHosD/INj8e89po00m5w
         DUvKBrHqoX8rSPPIOQK4wnTcoSx+0BNDndxs0tu4Dl/IldJIKaKVy9g5QtX327A1UxOP
         s74w==
X-Gm-Message-State: AOJu0YwQNuqYyUlGXycilJYJuLBorFahuOt/Mq+qFOfwq6oO/XfJ3AZE
	HbsMnbUvxxrHSC+KkvDDKcASxVRYzrtETPwTJ3M=
X-Google-Smtp-Source: AGHT+IHjnyvdA5GbxMPI8eLuRWrSAUxPlzFPpotTBUVT1/BpY2EvW5qG4arPyi4lgZNcuZPUzosVm3tgj92qNdAztBs=
X-Received: by 2002:a50:9b41:0:b0:543:50cd:3f3d with SMTP id
 a1-20020a509b41000000b0054350cd3f3dmr11041759edj.16.1699024412492; Fri, 03
 Nov 2023 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-8-jgross@suse.com>
In-Reply-To: <20231101093325.30302-8-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 3 Nov 2023 11:13:20 -0400
Message-ID: <CAKf6xptypy5bnkwofJ_e7qHickAaR-qhMsHtwM-r7Pt2jBvvBQ@mail.gmail.com>
Subject: Re: [PATCH 07/29] tools/xenlogd: add 9pfs attach request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:54=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the attach request of the 9pfs protocol. This introduces the "fid"
> scheme of the 9pfs protocol.
>
> As this will be needed later, use a dedicated memory allocation
> function in alloc_fid().
>
> For filling the qid data take the approach from the qemu 9pfs backend
> implementation.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c      | 128 ++++++++++++++++++++++++++++++++++++++++
>  tools/xenlogd/xenlogd.c |   1 +
>  tools/xenlogd/xenlogd.h |  11 ++++
>  3 files changed, 140 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index f35520018f..fa825c9f39 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> +static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
> +                                    const char *path)
> +{
> +    struct p9_fid *fidp;
> +    size_t pathlen;
> +
> +    pathlen =3D strlen(device->host_path) + strlen(path) + 1;
> +    fidp =3D calloc(sizeof(*fidp) + pathlen, 1);
> +    if ( !fidp )
> +        return NULL;
> +
> +    fidp->fid =3D fid;
> +    snprintf(fidp->path, pathlen, "%s%s", device->host_path, path);

check_host_path() should be enhanced to ensure host_path has a
trailing '/', or switch this to "%s/%s" to ensure it's always present?

> +
> +    return fidp;
> +}
> +


> +static void free_fid(device *device, struct p9_fid *fidp)
> +{
> +    if ( !fidp )
> +        return;
> +
> +    device->n_fids--;
> +    XEN_TAILQ_REMOVE(&device->fids, fidp, list);
> +    free(fidp);
> +}
> +
> +static int fill_qid(const char *path, struct p9_qid *qid, struct stat *s=
tbuf)

Nit: ordering is input, output, optional input, so you might want to re-ord=
er?

stbuf can be const?

> +{
> +    struct stat st;
> +
> +    if ( !stbuf )
> +    {
> +        if ( stat(path, &st) )
> +            return errno;
> +
> +        stbuf =3D &st;
> +    }
> +
> +    qid->type =3D S_ISDIR(stbuf->st_mode) ? QID_TYPE_DIR : 0;
> +    qid->version =3D stbuf->st_mtime ^ (stbuf->st_size << 8);
> +    qid->path =3D stbuf->st_ino;
> +
> +    return 0;
> +}
> +
>  static void p9_error(device *device, uint16_t tag, uint32_t err)
>  {
>      unsigned int erroff;
> @@ -476,6 +565,41 @@ static void p9_version(device *device, struct p9_hea=
der *hdr)
>                  version);
>  }
>
> +static void p9_attach(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    uint32_t dummy_u32;
> +    unsigned int dummy_uint;
> +    struct p9_qid qid;
> +    int ret;
> +
> +    ret =3D fill_data(device, "UUSSU", &fid, &dummy_u32, &dummy_uint, &d=
ummy_uint,
> +                    &dummy_u32);
> +    if ( ret !=3D 5 )
> +    {
> +        p9_error(device, hdr->tag, errno);
> +        return;
> +    }

We might want to check the first dummy_u32 (afid) to ensure it's NOFID?
"""
If the client does not wish to authenticate the connection, or knows
that authentication is not required, the afid field in the attach mes-
sage should be set to NOFID, defined as (u32int)~0 in fcall.h. If the
client does wish to authenticate, it must acquire and validate an afid
using an auth message before doing the attach.
"""

Since auth isn't implemented, it's probably not necessary to check afid?

I've been looking at these as reference:
https://ericvh.github.io/9p-rfc/rfc9p2000.html
https://ericvh.github.io/9p-rfc/rfc9p2000.u.html

> +
> +    device->root_fid =3D alloc_fid(device, fid, "");
> +    if ( !device->root_fid )
> +    {
> +        p9_error(device, hdr->tag, errno);
> +        return;
> +    }
> +
> +    ret =3D fill_qid(device->host_path, &qid, NULL);
> +    if ( ret )
> +    {
> +        free_fid(device, device->root_fid);

root_fid is only freed in this error path.  Maybe free_device() should
free all the fids?

Regards,
Jason

