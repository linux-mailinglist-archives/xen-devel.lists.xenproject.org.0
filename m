Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02C889D80
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 12:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697718.1088778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roil7-0005TY-Ii; Mon, 25 Mar 2024 11:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697718.1088778; Mon, 25 Mar 2024 11:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roil7-0005QL-FZ; Mon, 25 Mar 2024 11:44:57 +0000
Received: by outflank-mailman (input) for mailman id 697718;
 Mon, 25 Mar 2024 11:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oAH=K7=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1roil5-0005QF-UQ
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 11:44:56 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18543bc8-ea9d-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 12:44:53 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4715991c32so499466966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 04:44:53 -0700 (PDT)
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
X-Inumbo-ID: 18543bc8-ea9d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711367093; x=1711971893; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE5XB28Iczv3N/UcJQCK/MEXMasyR2c3aHyOGGrlwow=;
        b=VjSkQsIpqtg3lXlnPop6rr43g22CLWNdDXiAOlbDSU8uySMo3Ecsi0OHvmcR20c+HQ
         exwWzi/wG7N2o3mVjb05KsCTKkSCSb0YMJbfFJwEhlYxKighxNbdzj4Fude9gzRaTrcE
         epZmi5QzGdtJs+g4eU6e3mOr8ar7EJEI7KZHNBh2VkQLmRv98tUFE0KAveqHqQJ1cBX1
         9EK4UQEGAKcJnK3aIxg0UNTlJ7fytJ44lWkdanqAEnUIprQUta3eruKy5RQbsgBbTt9F
         VxTsmUVTAUaig7eZP2qu7V7wE4NfN6bdmy7Yh6hKgxcs09rwBJB8WwJYv7F+dueISzIY
         vr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711367093; x=1711971893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LE5XB28Iczv3N/UcJQCK/MEXMasyR2c3aHyOGGrlwow=;
        b=IhlX4NXEDp4auToExbpxlCfhynekpP17hMlNlB3LiTUyXui10csl9h3kn/c4hvr9oI
         ldcB8tJqDk4xNhfhMX7+KmQsGxRdE7KlFDViYMfjrqxxTDOdTiqVg0Ag+jSpXQ3CKxoB
         Y95DkCFfYe5w/dwiquIwh/RwzpTa9Za01+7N5FW2DgApUI8EYe0ZjI/94dHSVt+KOAWM
         8/1l5pzkb77nFVFViNXVhGFnve4G0j1B7Ps0HvPEdWDJOELUfetIpmfADkkA0hBRl64P
         f3iFfg7EMLNVIpClYrJm0KCfeTOZ3Sild3rtt8Qky5vl2ZzmaAPEJ68bEi+g3Bcbc9y5
         U3KA==
X-Gm-Message-State: AOJu0YwmnPwdngh3woFTS7tcw0DVqR2G2Fr+FJQW1XTQdybVmNdb5u2m
	DUarl+OXB/kpENWxBCe/8uNOxS2H1WIOAjLIqxf+pfZrmRTR7ziLEU4cP9J66nhn7qL1KPVHcES
	vAExGbYChNLLhsxF78dvw/fL2EMzsesJhRsenjQ==
X-Google-Smtp-Source: AGHT+IHegjAsgruA0BqeGIAU7seMgiVtbzBR285e6jnfyK2qSEhptEXOZ5HImQgwQdzMtXmtmfaosF0oQLoclzafGLM=
X-Received: by 2002:a17:906:7709:b0:a47:3953:f8e4 with SMTP id
 q9-20020a170906770900b00a473953f8e4mr4370726ejm.6.1711367093039; Mon, 25 Mar
 2024 04:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-7-carlo.nonato@minervasys.tech> <9784c247-592b-460a-b6d4-3ab4cdf87b77@perard>
In-Reply-To: <9784c247-592b-460a-b6d4-3ab4cdf87b77@perard>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 25 Mar 2024 12:44:42 +0100
Message-ID: <CAG+AhRUeCB+HpBcX7W7rKvS-SG468t5BHbHnnK1MtHAob_wfqw@mail.gmail.com>
Subject: Re: [PATCH v7 06/14] tools: add support for cache coloring configuration
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anthony,

On Mon, Mar 25, 2024 at 11:55=E2=80=AFAM Anthony PERARD
<anthony.perard@cloud.com> wrote:
>
> On Fri, Mar 15, 2024 at 11:58:54AM +0100, Carlo Nonato wrote:
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_c=
reate.c
> > index 5546335973..79f206f616 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -726,6 +726,15 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain=
_config *d_config,
> >              /* A new domain now exists */
> >              *domid =3D local_domid;
> >
> > +            ret =3D xc_domain_set_llc_colors(ctx->xch, local_domid,
> > +                                           b_info->llc_colors,
> > +                                           b_info->num_llc_colors);
> > +            if (ret < 0 && errno !=3D EOPNOTSUPP) {
>
> Wait, this additional check on EOPNOTSUPP, does that mean we ignore
> "llc_colors" configure by the admin of the VM if the system doesn't
> support it? Shouldn't we also report an error in this case? At least if
> `num_llc_colors > 0`.

You're right. The problem was that I didn't want to log because coloring is=
 a
very niche feature and I need to indiscriminately try to color a domain. Do=
ing
that only when `num_llc_colors > 0` is fine though.

Thanks.

> Thanks,
>
> --
> Anthony PERARD

