Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40071A17C06
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875364.1285814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBgy-00045t-SE; Tue, 21 Jan 2025 10:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875364.1285814; Tue, 21 Jan 2025 10:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBgy-00044O-PB; Tue, 21 Jan 2025 10:41:08 +0000
Received: by outflank-mailman (input) for mailman id 875364;
 Tue, 21 Jan 2025 10:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abyW=UN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1taBgx-00044I-ED
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:41:07 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37166250-d7e4-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:41:05 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3eb9a0a2089so3458511b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:41:05 -0800 (PST)
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
X-Inumbo-ID: 37166250-d7e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737456064; x=1738060864; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN5S+dtoU4QAnEngV7PhQV+IPW4js7xThkeyUCCuQ4c=;
        b=V3q5PdDqwFHKyx8FsSZr7E32LpTkloqIWgFsGKngbVCvuNW1+/kFHab393fHojteG+
         mOrFsN9EB2x3aEYr1QPyXmHe0XJ7a7miugSkXthtkHCaTAZis7/HvmqPR6N9+0QNp2XO
         MZOs5E6L3RcofrL/c4l+i/CFxbBjKUXvzseLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456064; x=1738060864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN5S+dtoU4QAnEngV7PhQV+IPW4js7xThkeyUCCuQ4c=;
        b=CTnepkkX4H2wGXejGxilRIJbMx+R9vTHsRc+WoSiN5iKRQDbScrctOBzQwYF3/bwU2
         Cx52W9la2OkqbUI7B+AgVl/NBn4Dr453aC9ebVl4rqBjMCCt5HXMHuTkn/U8I8bTj6Tl
         DDlhcG2KBDlZ4c8j35sNy8caZeeQLEJJRvpf+m4TPFnT2tU8n1VA5+DqFMgYUJfY+fv+
         KNmluS7krgoppt9I9vLj+yX1h5k+xmoeuaYCAsh5aAMYDKNgl7pSMLEQdmxyGXwn7h/j
         1tx5dFUiXNkYh2ATRIF4xQzh4AS7moRTdEq+EWMWqnQI3DzICNlPvZgSPOKvDWTYKg2M
         y2tw==
X-Gm-Message-State: AOJu0YyDMNcpZ3qGnkhy2QjqqdXzF7yEtiIRzBhSQeFe2njOHXebgWI7
	dJcbA70qN+f98EsDgItf7YBCukggmwN1NyEEHDmQrDbWMJqQ7vWLgE7nrxdZqDDkg0kqlbYCVwx
	LILxXJmH7m9RCmFtcRaiSynnsxixfTDXp5nFE
X-Gm-Gg: ASbGnctQVlz58HZYyaNssjII+Tqh00YL77fQtGkoPdpZofEP086P2Yd9nLuUhC1Lmwa
	TOi2t0KnwnWzEQl3/FSHIU0l0KFntSBDdbcYmL49H9CzThIG56w==
X-Google-Smtp-Source: AGHT+IHqS/wo2mBbTCedt8iB+VHN+ntqRQqanojZ1LwZUrPfIbNjigsFmu4EPD/Re7JU95bh8hzNNzi27yI9nVF4jG8=
X-Received: by 2002:a05:6871:5e07:b0:29e:4d0e:a2b6 with SMTP id
 586e51a60fabf-2b1c08c9884mr10092665fac.10.1737456064233; Tue, 21 Jan 2025
 02:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20241107151509.73621-1-roger.pau@citrix.com> <20241107151509.73621-4-roger.pau@citrix.com>
In-Reply-To: <20241107151509.73621-4-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 21 Jan 2025 10:40:53 +0000
X-Gm-Features: AbW1kvaAvU0anQ9Lp5l5BRcrMFkqvTdyCSIonIDOFkLGYeR_jcYkIKl4sb-9SS4
Message-ID: <CAG7k0EoV-hOonu0qZLOHoeSoQJmVb+1pn7g9MFff_tQfou_rKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] create-diff-object: don't include symbols for
 .livepatch.hooks.* sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:15=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> Not all toolchains generate symbols for the .livepatch.hooks.* sections,
> neither those symbols are required by the livepatch loading logic in Xen =
to
> find and process the hooks.  Hooks in livepatch payloads are found and
> processed based exclusively on section data.
>
> The unconditional attempt to expect each hook serction to have a matching
> symbol leads to a segmentation fault in create-diff-object when such symb=
ol is
> not present, as the code references a NULL pointer.
>
> Fix this by not attempting to include symbols associated with hook sectio=
ns.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  create-diff-object.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/create-diff-object.c b/create-diff-object.c
> index d8a2afbf2774..924059a1842b 100644
> --- a/create-diff-object.c
> +++ b/create-diff-object.c
> @@ -1555,8 +1555,6 @@ static int kpatch_include_hook_elements(struct kpat=
ch_elf *kelf)
>                                 sym->sec->sym =3D NULL;
>                                 /* use section symbol instead */
>                                 rela->sym =3D sym->sec->secsym;
> -                       } else {
> -                               sec->secsym->include =3D 1;
>                         }
>                 }
>         }
> --
> 2.46.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

