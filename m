Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FC86FFAC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688273.1072317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh63S-00080A-6K; Mon, 04 Mar 2024 11:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688273.1072317; Mon, 04 Mar 2024 11:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh63S-0007xc-2z; Mon, 04 Mar 2024 11:00:22 +0000
Received: by outflank-mailman (input) for mailman id 688273;
 Mon, 04 Mar 2024 11:00:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7cd=KK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rh63Q-0007xW-AE
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:00:20 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62fd1fb1-da16-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 12:00:18 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d28387db09so49699151fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:00:18 -0800 (PST)
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
X-Inumbo-ID: 62fd1fb1-da16-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709550017; x=1710154817; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW8f1ig8LJ5KhgDQRBWPrrIsz8lm95H9Qtwv8BedyZw=;
        b=er3janwkj9KW9hROGLZrcxD+HuxVdcWB9Dbu2+mQ+SQj97S+sflAKW/oC4DN7fin2z
         f/uTanpUJMOHqCpo1g79skqUdCHMZvoJzS5QDLxRAjuT3VwBmV/KMBLFui4CV5amFnNo
         j4BRZhse/SWKC3tLVOhmSk8srMJhZJka91/RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550017; x=1710154817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW8f1ig8LJ5KhgDQRBWPrrIsz8lm95H9Qtwv8BedyZw=;
        b=qkb7aGrM2mxYObT1jADPY12wZrxbyYDWilkLuVf9eUDNLV/ss4RgO3Xlxg8NQqigPo
         1+4GiX5m+ZfqNiFEyq5O65tIK17blCWg8YB3eHEMmLTshXwAqQi6UnJ+myAgUsKafIdF
         ewZEuIUcMBCYIZeLhBmUaO/AB/By6n642qKYxjW+1i+nOam18EVBUbgDXhVJ0rX3c6LI
         sP37291/YSXOVpjfMhi3Mme/MIpsUd2/IfVC65ksdfMG9oloBGzkXw4cP/REDt8ONfl1
         B2AZPsamTFCE6wuFfUeHVCguecrSdSNW00Il84+8a4HudP4jU4olMI+SXyfbHuZEqK5p
         iQPA==
X-Gm-Message-State: AOJu0YxziOlkS43tXjcE8shx2noz2qEzpfKRXXnT5n1ardOAIlJMSYY4
	li3l4WK3h4bfjQ4KiFjKnH23X+cWQXOQ6lGG/kMeZUdlZU5nMIDtpNKCNiXKi23lPvzidXke8rx
	zt6+XN1tlQ8l6LrZGR5VB5fLXy1j0zLjVVidrxQ60XYy2RThBNos=
X-Google-Smtp-Source: AGHT+IFOfwcbiN6B2Rgc6sybM38TESFTjevAUbsVia3F69hOBgO8Jbh5y7I+6AlHo7lApJZZKmgQXLiV1tTS6iLjBfY=
X-Received: by 2002:a2e:8788:0:b0:2d3:1964:73d7 with SMTP id
 n8-20020a2e8788000000b002d3196473d7mr6037839lji.8.1709550017445; Mon, 04 Mar
 2024 03:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20240227132628.2157031-1-fouad.hilly@cloud.com> <fc59e215-2aef-4e07-83df-b27a5cb79313@perard>
In-Reply-To: <fc59e215-2aef-4e07-83df-b27a5cb79313@perard>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Mon, 4 Mar 2024 11:00:06 +0000
Message-ID: <CAJKAvHbB+d2PT-HHS5dvGaxCJWgC1gObU3VU9yG7e6oDOx=P1g@mail.gmail.com>
Subject: Re: [PATCH v2] tools/xentop: Add VBD3 support to xentop
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 6:32=E2=80=AFPM Anthony PERARD <anthony.perard@clou=
d.com> wrote:
>
> On Tue, Feb 27, 2024 at 01:26:28PM +0000, Fouad Hilly wrote:
> > diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_=
linux.c
> > index cbba54aa83ee..6d82e204aad4 100644
> > --- a/tools/libs/stat/xenstat_linux.c
> > +++ b/tools/libs/stat/xenstat_linux.c
> > @@ -390,6 +390,38 @@ void xenstat_uninit_networks(xenstat_handle * hand=
le)
> >               fclose(priv->procnetdev);
> >  }
> >
> > +static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)
>
> "const char *vbd3_path"?
>
>
> >  static int read_attributes_vbd(const char *vbd_directory, const char *=
what, char *ret, int cap)
> >  {
> >       static char file_name[80];
> > @@ -438,7 +470,7 @@ int xenstat_collect_vbds(xenstat_node * node)
> >               int ret;
> >               char buf[256];
> >
> > -             ret =3D sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd=
.dev);
> > +             ret =3D sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid,=
 &vbd.dev);
>
> 255 is overly ambitious, but it match the size of buf, so I guess it's
> kind of ok, even if unnecessary.
>
> >               if (ret !=3D 3)
> >                       continue;
> >               if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
> > @@ -448,6 +480,8 @@ int xenstat_collect_vbds(xenstat_node * node)
> >                       vbd.back_type =3D 1;
> >               else if (strcmp(buf,"tap") =3D=3D 0)
> >                       vbd.back_type =3D 2;
> > +             else if (strcmp(buf,"vbd3") =3D=3D 0)
> > +                     vbd.back_type =3D 3;
>
> Yay for magic number... Do you think you could introduce an enum or
> define to replace this "3" by a meaningful? Maybe something like
> XENSTAT_VBD_TYPE_VBD3, (name derived from the existing function
> xenstat_vbd_type()).
>
> I'd like at least to replace the "3". But if you feel like having
> another patch to replace the "2" and "1", that would be a plus.
>
> >               else
> >                       vbd.back_type =3D 0;
> >
> > @@ -479,6 +513,35 @@ int xenstat_collect_vbds(xenstat_node * node)
> >                               vbd.error =3D 1;
> >                       }
> >               }
> > +             else if (vbd.back_type =3D=3D 3)
> > +             {
> > +                     char *td3_pid;
> > +                     char *path;
> > +
> > +                     vbd.back_type =3D 3;
>
> `back_type` should already be 3 ;-).
>
> > +                     vbd.error =3D 0;
> > +
> > +                     if (asprintf(&path, "/local/domain/0/backend/vbd3=
/%u/%u/kthread-pid", domid, vbd.dev) < 0)
> > +                             continue;
> > +
> > +                     td3_pid =3D xs_read(node->handle->xshandle, XBT_N=
ULL, path, NULL);
> > +
> > +                     free(path);
> > +
> > +                     if (td3_pid =3D=3D NULL)
> > +                             continue;
> > +
> > +                     if (asprintf(&path, "/dev/shm/td3-%s/vbd-%u-%u", =
td3_pid, domid, vbd.dev) < 0) {
> > +                             free(td3_pid);
> > +                             continue;
> > +                     }
> > +
> > +                     if (read_attributes_vbd3(path, &vbd) < 0)
> > +                             vbd.error =3D 1;
>
> Why sometime we do "continue" and sometime we do "vbd.error=3D1"?
continue is used when path to domain statistics is checked, which is
"dynamic"; However, if the path existed but failed to read statistics,
that is when we set the error.

>
> > +
> > +                     free(td3_pid);
> > +                     free(path);
> > +             }
> >               else
> >               {
> >                       vbd.error =3D 1;
> > diff --git a/tools/libs/stat/xenstat_priv.h b/tools/libs/stat/xenstat_p=
riv.h
> > index 4eb44a8ebb84..c3a9635240e9 100644
> > --- a/tools/libs/stat/xenstat_priv.h
> > +++ b/tools/libs/stat/xenstat_priv.h
> > @@ -98,6 +98,22 @@ struct xenstat_vbd {
> >       unsigned long long wr_sects;
> >  };
> >
> > +struct vbd3_stats {
> > +     uint32_t version;
> > +     uint32_t __pad;
> > +     uint64_t oo_reqs;
> > +     uint64_t read_reqs_submitted;
> > +     uint64_t read_reqs_completed;
> > +     uint64_t read_sectors;
> > +     uint64_t read_total_ticks;
> > +     uint64_t write_reqs_submitted;
> > +     uint64_t write_reqs_completed;
> > +     uint64_t write_sectors;
> > +     uint64_t write_total_ticks;
> > +     uint64_t io_errors;
> > +     uint64_t flags;
> > +};
>
> Is that a binary interface for an external project? I'm asking because
> `__pad` would seems useless otherwise.
> If it is part of an interface, please add a comment about it, add a link
> to the project/source where this interface is described, and where is
> the canonical location? Also, is there an header we could maybe just
> use if it's in the system or an header we could import into the
> repository?
>
> Thanks,
>
> --
> Anthony PERARD

