Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8820A17C09
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875371.1285824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBhc-0004eu-40; Tue, 21 Jan 2025 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875371.1285824; Tue, 21 Jan 2025 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBhc-0004cm-1E; Tue, 21 Jan 2025 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 875371;
 Tue, 21 Jan 2025 10:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abyW=UN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1taBha-00044I-46
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:41:46 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e594aa3-d7e4-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:41:44 +0100 (CET)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-29fcbf3d709so1794524fac.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:41:44 -0800 (PST)
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
X-Inumbo-ID: 4e594aa3-d7e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737456103; x=1738060903; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLo5nkHbVjFQWG7SU2GZfAG4NVdknbQu66jBuqWlEBE=;
        b=lOJWvMxB51eQ+THr65u07/55Xnc9s3ZDPaYOsPfy4YdjP7xDdHaX88c2otqF8gw1Oa
         rT1etZtUtieMx6uKDrvvJPk9RCcARMTyNd9ZLKPD/LwSJZuNHXQcNwFpl5eXw1iGKRl5
         4A9usHLy6geXKMet7odLALtSIduOCSfUdV/+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456103; x=1738060903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLo5nkHbVjFQWG7SU2GZfAG4NVdknbQu66jBuqWlEBE=;
        b=iWRzNsFhRAiW/CrsRj3e8HzkZrXC77PcVloJQthWuN8+JHGOR9HjLMfhqa/GFof/ZE
         bp4UKlwjxzK0I/BBoonEtR/+fMnXZ+NI0XEbLg3eiQAPTrLb+9BltP01ys7RuyHL0iFm
         4yQ427Fqnqyl0B6PFxsBDkkqjGbj64lsGXV0NFFkc5NQbmrwMsQIxh41dp3Vx/n3vpP6
         zBIaR0sArX9YKWNI49rApVH+rmhspmgrs3MpBRHheytsphWQa1cgV4/K2/lPihmLeNNC
         4b9mf19cvYsRU82LgRweR6kNnl5xtnw6x7+eNOF1UnrgRNoGtZ/OPHKCq1z6XY6A/mn/
         AcjA==
X-Gm-Message-State: AOJu0YwyeOk9EW7lam3BZpd7cv331X+O+HQX7Fve2WDF3lnGWx8KZ1cb
	oWHZFEN4Fj/K43/61Ta8xqgAv0BPaHl2VC18h2x1J9k9nK720zzEDwdhZHOxZ6M+7uvQngm7iZF
	+JpQIdWBzckQOZ/EM03t8QgsIxaBxqA/Y9q0H
X-Gm-Gg: ASbGncvlUvin9esmZNkpmQnEp42/PTfH4xl3cTL+oiSN4k9CJCsR3f1GpTtMfL6zEYn
	cyfWIj22yBxXGKxy8xhtwbq+XR8Kf7TUGSWBaMS/IgQ7yF7N9mA==
X-Google-Smtp-Source: AGHT+IG/mxAUyoXNSINHiPN+Mg2JH9PbaFAd9/SZQ3skGOKzC9evh8TgHbkIwOzcPwJ+v2zHhqoxEEqHk+Jb4MK20y0=
X-Received: by 2002:a05:6870:6981:b0:29f:f1cc:12a5 with SMTP id
 586e51a60fabf-2b1c0c025c8mr10156762fac.31.1737456103234; Tue, 21 Jan 2025
 02:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20241107151509.73621-1-roger.pau@citrix.com> <20241107151509.73621-5-roger.pau@citrix.com>
In-Reply-To: <20241107151509.73621-5-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 21 Jan 2025 10:41:32 +0000
X-Gm-Features: AbW1kvZNKOw-wF9VqtF2H7WYu6tLCWVGnyH0wTPOiWVWFncY6gAgLGwdq1Qbgmc
Message-ID: <CAG7k0EqVdZK4Pe73k_1PiUg0RoCxkekC7a6yn4MceZUvO81EXg@mail.gmail.com>
Subject: Re: [PATCH 4/4] create-diff-object: also include relas that point to
 changed sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:15=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> create-diff-object has a special handling for some specific sections, lik=
e
> .altinstructions or .livepatch.hooks.*.  The contents of those sections a=
re in
> the form of array elements, where each element can be processed independe=
ntly
> of the rest.  For example an element in .altinstructions is a set of
> replacement coordinates, with the layout specified by the alt_instr struc=
t.  In
> the case of .livepatch.hooks.* each element is a pointer to a hook functi=
on to
> call.
>
> The contents of this array is processed element wise, so that
> create-diff-object can decide whether the element relates to the content =
in the
> livepatch and thus needs keeping.  Such relation is driven based on the
> contents of the relocations for the special sections.  If a relocation to=
 be
> applied to a special section element depends on any symbol to be included=
 in
> the livepatch then the special element is also considered required and th=
us
> added to the livepatch contents.
>
> However relocations don't always reference function type symbols, they ca=
n also
> reference sections type symbols, and that's usually the case with hook sy=
mbols
> that have relocations based on section symbols, as an example:
>
> RELOCATION RECORDS FOR [.livepatch.hooks.load]:
> OFFSET           TYPE              VALUE
> 0000000000000000 R_X86_64_64       .text.foobar
>
> Symbol information for .text.foobar:
>
> 0000000000000000 l    d  .text.foobar      0000000000000000 .text.foobar
>
> As seen above, the .livepatch.hooks.load relocation uses a non-function s=
ymbol,
> which given the current code in should_keep_rela_group() would mean it's =
not
> considered for inclusion in the livepatch.
>
> Fix this by allowing should_keep_rela_group() to also keep relocations if=
 they
> either point to function or section symbols.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  create-diff-object.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/create-diff-object.c b/create-diff-object.c
> index 924059a1842b..c21cc576052a 100644
> --- a/create-diff-object.c
> +++ b/create-diff-object.c
> @@ -1158,11 +1158,17 @@ static int should_keep_rela_group(struct section =
*sec, int start, int size)
>         struct rela *rela;
>         int found =3D 0;
>
> -       /* check if any relas in the group reference any changed function=
s */
> +       /*
> +        * Check if any relas in the group reference any changed function=
s or
> +        * sections.  As seen by hook related relocations (.livepatch.hoo=
ks.*),
> +        * it's possible they use the section symbol as a reference rathe=
r than
> +        * the function symbol.
> +        */
>         list_for_each_entry(rela, &sec->relas, list) {
>                 if (rela->offset >=3D start &&
>                     rela->offset < start + size &&
> -                   rela->sym->type =3D=3D STT_FUNC &&
> +                   (rela->sym->type =3D=3D STT_FUNC ||
> +                    rela->sym->type =3D=3D STT_SECTION) &&
>                     rela->sym->sec->include) {
>                         found =3D 1;
>                         log_debug("new/changed symbol %s found in special=
 section %s\n",
> --
> 2.46.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

