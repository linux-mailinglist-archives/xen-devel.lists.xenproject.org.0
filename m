Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7F7E4211
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628855.980746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NNm-0001lV-F9; Tue, 07 Nov 2023 14:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628855.980746; Tue, 07 Nov 2023 14:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NNm-0001j8-Ca; Tue, 07 Nov 2023 14:48:46 +0000
Received: by outflank-mailman (input) for mailman id 628855;
 Tue, 07 Nov 2023 14:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0NNl-0001j2-9y
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:48:45 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf39278c-7d7c-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 15:48:43 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso9815223a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 06:48:43 -0800 (PST)
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
X-Inumbo-ID: bf39278c-7d7c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699368523; x=1699973323; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbcEPGy8Ub0cnu4yBg840ocKinXpLSFwpgYoVCVslXI=;
        b=jiii4IFUMMcAZAVojXy/5Ks2zSoTa8UXBfAzcWxhE9Uf/dICdLww4ArCcybv9s9FaL
         4aWy0J94J1e852WiPANXOyu9uP2vlGGHDSrIY7pm0zVBzkJ/iOk0q42nXzyf62i8FXvV
         m34f1DV/5pfto71/ttm0julcfZ84SkNifv0j/5Gpoix3pDTRfABfOa+LqQzsXR36NW08
         3eh+wdUvSUaNiMK7CkL11YVwom5mwf6Wv737eHrAMlKBfixvc4dfsCfXTdaq2B85GzBK
         x1I1mhjJ/27st7s93X+6iBLguo+jJ4UIW/QKc9uTDiNt6qw/j4oyD5gVoysDreGaQfSU
         r8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368523; x=1699973323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbcEPGy8Ub0cnu4yBg840ocKinXpLSFwpgYoVCVslXI=;
        b=ABHlFApmR8FUMbWZOfU82KsfRTDV82s8qYA7Kkg4ORODdGFVKSpbFN7IBZNvNdBTG0
         rGxgvbl6sqIArIfy+KIk96uAD31CqK9VmbMukGWt5vHmFUl2tYm/2nEuKLp5fBqXXIbG
         PAJKGK6OLL7ySXOelAeO+GMPNtxDhb3NWtZfiQ7e1o8nHw4RWx55PzA7TIQoWl2PWB+k
         Iq7YSJkKdbHIV/PGKlx0A8QkNUMdovX9MTXmkvhT5K0iQnAWFOepA1ad8QoPrMk2wPox
         bTTrD6Ee/+mw5e5HyOJeqoCVyRXcK7pxLZI10sew4mNbuamkY9+qeYo04f209+XqPX++
         hdCw==
X-Gm-Message-State: AOJu0YxFRXqySLJIdGDSwqJvKiu1Ta1aZ/MEquxnV8tdaPOA9LBDBP+S
	cTjUhjO62B50uIJGmblrVrp8paORO1zKx0a4g10=
X-Google-Smtp-Source: AGHT+IEshT7r1FxOYvGFqcyRsY2vg2xoEi7DB5SEYr8fvd/Ogx8U/t3NJodLI3kaMBHodniWJXB5bO7bd7JEWTTHOg8=
X-Received: by 2002:a50:f69c:0:b0:543:4fdb:de84 with SMTP id
 d28-20020a50f69c000000b005434fdbde84mr4150391edn.7.1699368522549; Tue, 07 Nov
 2023 06:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-13-jgross@suse.com>
 <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com> <e931f9bd-cbeb-43c3-98a6-7b3dff3af8d3@suse.com>
In-Reply-To: <e931f9bd-cbeb-43c3-98a6-7b3dff3af8d3@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 09:48:30 -0500
Message-ID: <CAKf6xpsMBkeg4bZBGnur15C5+h3FPYZv9EGvc2xwPj_2qvVKyQ@mail.gmail.com>
Subject: Re: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 9:42=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 07.11.23 15:04, Jason Andryuk wrote:
> > On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com> =
wrote:
> >>
> >> Add the stat request of the 9pfs protocol.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   tools/xenlogd/io.c | 89 ++++++++++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 89 insertions(+)
> >>
> >> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> >> index 34f137be1b..6e92667fab 100644
> >> --- a/tools/xenlogd/io.c
> >> +++ b/tools/xenlogd/io.c
> >> @@ -33,6 +33,7 @@
> >
> >> +static void fill_p9_stat(struct p9_stat *p9s, struct stat *st, const =
char *name)
> >> +{
> >> +    memset(p9s, 0, sizeof(*p9s));
> >> +    fill_qid(NULL, &p9s->qid, st);
> >> +    p9s->mode =3D st->st_mode & 0777;
> >> +    if ( S_ISDIR(st->st_mode) )
> >> +        p9s->mode |=3D P9_CREATE_PERM_DIR;
> >> +    p9s->atime =3D st->st_atime;
> >> +    p9s->mtime =3D st->st_mtime;
> >> +    p9s->length =3D st->st_size;
> >> +    p9s->name =3D name;
> >> +    p9s->uid =3D "";
> >> +    p9s->gid =3D "";
> >> +    p9s->muid =3D "";
> >> +    p9s->extension =3D "";
> >> +    p9s->n_uid =3D 0;
> >> +    p9s->n_gid =3D 0;
> >
> > If the daemon is running as root and managing the directories, these
> > probably match.  Still, do we want uid & gid to be populated from the
> > stat struct?
>
> I wouldn't want to do that. In the end the permissions of the daemon are
> relevant for being able to access the files. There is no need to leak any
> uids and gids from the host to the guests.

Ok.

> >
> >> +    p9s->n_muid =3D 0;
> >> +
> >> +    /*
> >> +     * Size of individual fields without the size field, including 5 =
2-byte
> >> +     * string length fields.
> >> +     */
> >> +    p9s->size =3D 71 + strlen(p9s->name);
> >> +}
> >> +
> >> +static void p9_stat(device *device, struct p9_header *hdr)
> >> +{
> >> +    uint32_t fid;
> >> +    struct p9_fid *fidp;
> >> +    struct p9_stat p9s;
> >> +    struct stat st;
> >> +    uint16_t total_length;
> >
> > total_length =3D 0;
> >
> > Otherwise it is used uninitialized.
>
> I don't think so. There is a single user just after setting the variable.

Whoops - you are right.  Sorry for the noise.

Regards,
Jason

