Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495A7E09A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 20:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627337.978331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz09z-0004So-5c; Fri, 03 Nov 2023 19:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627337.978331; Fri, 03 Nov 2023 19:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz09z-0004R8-1q; Fri, 03 Nov 2023 19:48:51 +0000
Received: by outflank-mailman (input) for mailman id 627337;
 Fri, 03 Nov 2023 19:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qz09x-0004Qy-L7
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 19:48:49 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019c7857-7a82-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 20:48:48 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-542d654d03cso3945956a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 12:48:48 -0700 (PDT)
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
X-Inumbo-ID: 019c7857-7a82-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699040928; x=1699645728; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZQCaLuQc2CvuSffKn1ajRC9RT5dWlLDAI6PwcajCHw=;
        b=QqtXS6Mgqm4SiiqzoZJsOpJgczgkKg2xC1K1wV9zto9X/3LSZsTNci91f3E1WqzPmi
         e51IhdKzF0X5hqZVJKPH9Ik1ERaLXfRVWajb9aiAs2AQIVhOF/ZoZnq6RROrLxrE3Ynu
         VkKd7HIlaveJLoI7CgG934mwKRxAJmBHC2+yHybkJSlRbHB4vbDOkSsquqfOSp8TwAq3
         0jDzrd7qiYDQRFef9rXS/eV5MGEQp/sK0JeDqQ7L2iB4xBEhp2iBk3DjRLZhQaaV3dk6
         N/sTxY94p4RNImYZWXCf3t53U2M5hPZGVqxyj90p8DZRpUgdzoRAOaMg3ciAbexXh6Ka
         mYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699040928; x=1699645728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZQCaLuQc2CvuSffKn1ajRC9RT5dWlLDAI6PwcajCHw=;
        b=OyZE2k7gyqPMoE6V0zkv0VC9gYEBkrrryosg4FI5O7kjl60zD8EK+qfzCSwq+11hui
         5X8Z9Efyvsl7rPxs50OeJGSgzhBMbMdP5nHLNze8YcTdlwHcRV9rTh7H7wNTy2TMgOgP
         e/eGFnPWj2F0UfTNPNHXde3APQsKxLLtSfEKPqNPJTpMs+xy9fQNYiqCt33C+18+zpBN
         rJtN7hFAnb22xzJsFk8bQ55+4SW+BYDBZNZKqFD6+2cEoAwhgNkELFijbFhPUjdPCpbB
         OLGVWvwR4CVST+yR86+fLJtmSECrbSxqMxA54ouXTDKifhzJ65RvpYslnxytyL408eCD
         JtGg==
X-Gm-Message-State: AOJu0YyvLLLREukF+S9oeHhQN358PkymtJzyv//DRWuB64xlS3WfuVdj
	YQWH1AwUHQudAFxREw5CC0W4Mq1H29oBM5yNbGieKsWK+hU=
X-Google-Smtp-Source: AGHT+IFyXOf3cCQGY239oLHAgDAQ322v9xv1Ta7EsCeYQ2QLrFqRPniOMEb8ZTZrkiu6xjY6QnCmXOhhVsREahpHUnw=
X-Received: by 2002:a50:bac8:0:b0:543:7f7d:4a3f with SMTP id
 x66-20020a50bac8000000b005437f7d4a3fmr9991006ede.30.1699040927986; Fri, 03
 Nov 2023 12:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-9-jgross@suse.com>
In-Reply-To: <20231101093325.30302-9-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 3 Nov 2023 15:48:35 -0400
Message-ID: <CAKf6xptRA6N8ymdgqPS_c+LjBFgN9NmmJAuJx3+vCV8GGkaw6Q@mail.gmail.com>
Subject: Re: [PATCH 08/29] tools/xenlogd: add 9pfs walk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:09=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the walk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c      | 138 ++++++++++++++++++++++++++++++++++++++++
>  tools/xenlogd/xenlogd.h |   1 +
>  2 files changed, 139 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index fa825c9f39..778e1dc2c9 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> @@ -600,6 +616,124 @@ static void p9_attach(device *device, struct p9_hea=
der *hdr)
>      fill_buffer(device, hdr->cmd + 1, hdr->tag, "Q", &qid);
>  }
>
> +static void p9_walk(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    uint32_t newfid;
> +    struct p9_fid *fidp;
> +    struct p9_qid *qids =3D NULL;
> +    unsigned int n_names =3D 0;
> +    unsigned int *names =3D NULL;
> +    unsigned int walked =3D 0;
> +    unsigned int i;
> +    char *path =3D NULL;
> +    unsigned int path_len;
> +    int ret;
> +
> +    ret =3D fill_data(device, "UUaS", &fid, &newfid, &n_names, &names);
> +    if ( n_names > P9_WALK_MAXELEM )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        goto out;
> +    }
> +    if ( ret !=3D 3 + n_names )
> +    {
> +        p9_error(device, hdr->tag, errno);
> +        goto out;
> +    }
> +
> +    fidp =3D find_fid(device, fid);
> +    if ( !fidp )
> +    {
> +        p9_error(device, hdr->tag, ENOENT);
> +        goto out;
> +    }
> +    if ( fidp->opened )
> +    {
> +        p9_error(device, hdr->tag, EINVAL);
> +        goto out;
> +    }

https://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
"""
The fid must represent a directory unless zero path name elements are speci=
fied.
"""
and
"""
For the first elementwise walk to succeed, the file identified by fid
must be a directory, and the implied user of the request must have
permission to search the directory (see intro(5)). Subsequent
elementwise walks have equivalent restrictions applied to the implicit
fid that results from the preceding elementwise walk.
"""

Maybe a dir check should be added?  However, it doesn't look like QEMU
does this check.  Seems like it is implicitly checked by the path
concatenation, so it may be fine as-is.

If you think it's ok as-is:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

