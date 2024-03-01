Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3286D9E4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 03:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687485.1071027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rft0H-0007VI-G8; Fri, 01 Mar 2024 02:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687485.1071027; Fri, 01 Mar 2024 02:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rft0H-0007SM-BK; Fri, 01 Mar 2024 02:52:05 +0000
Received: by outflank-mailman (input) for mailman id 687485;
 Fri, 01 Mar 2024 02:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8uw=KH=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rft0F-0007SG-8r
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 02:52:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada90dc9-d776-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 03:52:01 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso2431501a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 18:52:01 -0800 (PST)
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
X-Inumbo-ID: ada90dc9-d776-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709261521; x=1709866321; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8c7DzusyVw+Znt9CrR5f39iJoZ0yzhRReE6XVLz+Is=;
        b=GHv56Rsmd2Fk6YyxcE8aRFMZg4Ar52sYAIGO7cQLCFbu2/8jGTbIbcs305OCkxa48X
         ONIozZHRR7BAxNmwX6npBOV6HTccE+HfFWAZYWUL2xQHNcE9Mbq/HErq9L45s5+LczOF
         RkgkyaC8mxxjV+DkEBnH31QtYuCjwilVS+0hMVbnAznU8dClJP6+zqcVm6oIW0hpcOTe
         ZwQ2qZd4LnOjw2O3auoaJSYBamhsYuTbRxhs+VqFJjsrq3FTzNukUc5MseMmO76PNiQH
         gq1ab3YfWEyzy3WUMn12+4HxeK9sSH1IbW32aDuAM4WzzmXp9ORCIOtf31YYlrUmqD9f
         9maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709261521; x=1709866321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8c7DzusyVw+Znt9CrR5f39iJoZ0yzhRReE6XVLz+Is=;
        b=nnmOQGDyGlm2sROmeEv25TfGINb/Gjy/V5TLzxvo/6upUH+mdho08DYsLsWrTQ8UaJ
         6GpqG1G8l7wWdwk2XTpfq0bX+ZMMw7PNZu67MuzfTLXN+yuQ+KkCBhOb4uaRYpN7HZwD
         yjQA0Qb6CVzA2uWtiDBBHGvnyl8uIRC+d858CC5lRL47M3tY60buVSPlTYClm4DWDD4R
         tQJKP/RTOvx52e6en074qSGuBZbqf8e3Ckg6b/KamdP45umuU2ktfwCF0Niwmc0bXgg4
         74C5EEZj6sU0wx6P1h+fI7Op9KHS7Jj7t9H6syunmSYfnkro2qBej0o2MKy/5cxZ47cb
         h6bQ==
X-Gm-Message-State: AOJu0Yzyoir0erdLxaz+XDQqrvaK/d4S2SS45eP1bAP9YkY/lZKwKWEd
	OJyQfC4YIbSWrLfFmF+k2xDpt9GNH8x8GuQPVI7Vh/H4XxPJ1XiAhpVFYfO4LcQ7QTLyGMC5LmM
	01tm+ImMizl7PuF2JmOhP5Jgbcuw=
X-Google-Smtp-Source: AGHT+IHg+77c+rgwdZnPxqMc4Q/2a/ydQNP00ZLb0dA9Tee3YY2BVCWupf/QAHQ9rb7K34esVTUArhvwWhoaqrCJp/4=
X-Received: by 2002:a05:6402:d73:b0:566:1683:6370 with SMTP id
 ec51-20020a0564020d7300b0056616836370mr285242edb.19.1709261520829; Thu, 29
 Feb 2024 18:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20240109170540.38239-1-jandryuk@gmail.com> <20240109170540.38239-3-jandryuk@gmail.com>
 <3d849b15-cfad-4d85-b2b8-11cd19027720@perard>
In-Reply-To: <3d849b15-cfad-4d85-b2b8-11cd19027720@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 29 Feb 2024 21:51:49 -0500
Message-ID: <CAKf6xps3dam-ACKq0XhRrsyeU4xvTpDMgkn0tedzzsQyiHwo8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] libxl: devd: Spawn QEMU for 9pfs
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 11:01=E2=80=AFAM Anthony PERARD
<anthony.perard@cloud.com> wrote:
>
> On Tue, Jan 09, 2024 at 12:05:40PM -0500, Jason Andryuk wrote:
> > @@ -3430,7 +3431,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, =
libxl__dm_spawn_state *dmss)
> >       * because we will call this from unprivileged driver domains,
> >       * so save it in the current domain libxl private dir.
> >       */
> > -    dmss->spawn.pidpath =3D GCSPRINTF("libxl/%u/qdisk-backend-pid", do=
mid);
> > +    dmss->spawn.pidpath =3D GCSPRINTF("libxl/%u/qemu-xenpv-backend-pid=
", domid);
>
> This path is documented in "docs/misc/xenstore-paths.pandoc", I'm not
> sure it's such a good idea to change it.
>
> But maybe it's ok to change the path because xl devd is expected add
> then remove this path? And that pid isn't going to be useful to anything
> else?
>
> I'd rather not change the path, but if you still think it's ok, we can
> go for it. Thought?

I changed the path to keep it consistent with the internal libxl
names.  The node is for libxl's internal use, so it seemed okay to
change.  But it is externally visible, so there could be other
software looking at it.  I'm fine with leaving the xenstore name
unchanged.

(I didn't want to rename all the qdisk stuff, but it seemed like it
should be renamed since it would also handle 9pfs.)

Thanks,
Jason

