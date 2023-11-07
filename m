Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9A7E416B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628822.980675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Mhc-0004x4-SD; Tue, 07 Nov 2023 14:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628822.980675; Tue, 07 Nov 2023 14:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Mhc-0004uR-PN; Tue, 07 Nov 2023 14:05:12 +0000
Received: by outflank-mailman (input) for mailman id 628822;
 Tue, 07 Nov 2023 14:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Mhb-0004uJ-H0
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:05:11 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a97d6c5e-7d76-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 15:05:09 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso9823802a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 06:05:09 -0800 (PST)
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
X-Inumbo-ID: a97d6c5e-7d76-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699365909; x=1699970709; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9Uxv/R+RDTANHUJksRulkMWJ9k7SN5FVQ4S2Ux1+w0=;
        b=aPkhVapIAZR4/9PMBJbWS29eJbbCin7uvmqoqMbxMcJT4Mi3UQmgrFi7eH1wGXzFw9
         YzL7MPsjkFsFg4lnBXWclm/wcPkab+dDk610y+w9VqGge9wD+z3JMz8FP4z0dHHiFlsh
         1yxkSbDuoVIn5pVVzjUA6cOeylJNqx9VpXEJHb6fI7LsWTt5mfQGmJ97hzR5c9ng/QaF
         PC4Nzg7g+6+3LCXc0j8SbUgCm8oRkn/cWJeApWMTOEpc0VfXhFb0E0MNpCsZLK5xu4ND
         OcSvgxo8kMvTPdwQcYznGnhyUdgN00nY12/UBYl/YpsWKYz++8jJziRTf7ADuUk63hFT
         7Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699365909; x=1699970709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9Uxv/R+RDTANHUJksRulkMWJ9k7SN5FVQ4S2Ux1+w0=;
        b=bt6xWF9m25Tj1OCHtqXMljERUjrLPt0U51kiXr/skxCeklRhwheBllTSv2E8Fd0XjY
         TDm1oEfSQ+pB1wDy8vYr9L9AeCLD3psdtHkejW/nDzTTucCJ9krdjdqDzzGXBDJexUpc
         nzlrno+W+AlklHNdvY5/J3LT4z049Z0nsukeWXGKbc6ZnlmcSYyaNDx6S9JtTcqUTyQe
         re7Qdp+GDk6EQJh8NtMjf/dkCfotAHpbPgE7WsqnzDWlElM4VU/b3V/PwoJQ1nlfYfJe
         JAnRyyx0aAUCe3nICVfO8wZ5HJUXBXxGhB8ezuAhMKId6IclTFfV6VJOIu3trVuO3wGM
         9GRw==
X-Gm-Message-State: AOJu0Yyw15HZA9NaK2StO/PmDsb9OnAEboa1wCO+0OaFayn4B0tKMahI
	J5f/P+XrMdDb/n93KTt1+iAYDY+0szQIB673h94=
X-Google-Smtp-Source: AGHT+IEzq/gF1jn0EdgXnFdHQmv4ZWkFHFoYAogZmPQOMWl7W97GrA+6TIipNokI9ftBaaY28A9qX/pPjK2AEtk3OiA=
X-Received: by 2002:aa7:c2cb:0:b0:53d:fe98:fd48 with SMTP id
 m11-20020aa7c2cb000000b0053dfe98fd48mr25832573edp.3.1699365909177; Tue, 07
 Nov 2023 06:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-13-jgross@suse.com>
In-Reply-To: <20231101093325.30302-13-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 09:04:57 -0500
Message-ID: <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>
Subject: Re: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the stat request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xenlogd/io.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index 34f137be1b..6e92667fab 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c
> @@ -33,6 +33,7 @@

> +static void fill_p9_stat(struct p9_stat *p9s, struct stat *st, const cha=
r *name)
> +{
> +    memset(p9s, 0, sizeof(*p9s));
> +    fill_qid(NULL, &p9s->qid, st);
> +    p9s->mode =3D st->st_mode & 0777;
> +    if ( S_ISDIR(st->st_mode) )
> +        p9s->mode |=3D P9_CREATE_PERM_DIR;
> +    p9s->atime =3D st->st_atime;
> +    p9s->mtime =3D st->st_mtime;
> +    p9s->length =3D st->st_size;
> +    p9s->name =3D name;
> +    p9s->uid =3D "";
> +    p9s->gid =3D "";
> +    p9s->muid =3D "";
> +    p9s->extension =3D "";
> +    p9s->n_uid =3D 0;
> +    p9s->n_gid =3D 0;

If the daemon is running as root and managing the directories, these
probably match.  Still, do we want uid & gid to be populated from the
stat struct?

> +    p9s->n_muid =3D 0;
> +
> +    /*
> +     * Size of individual fields without the size field, including 5 2-b=
yte
> +     * string length fields.
> +     */
> +    p9s->size =3D 71 + strlen(p9s->name);
> +}
> +
> +static void p9_stat(device *device, struct p9_header *hdr)
> +{
> +    uint32_t fid;
> +    struct p9_fid *fidp;
> +    struct p9_stat p9s;
> +    struct stat st;
> +    uint16_t total_length;

total_length =3D 0;

Otherwise it is used uninitialized.

Regards,
Jason

