Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C14D8FEC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 23:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290496.492670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtat-0005LS-AA; Mon, 14 Mar 2022 22:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290496.492670; Mon, 14 Mar 2022 22:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtat-0005JL-72; Mon, 14 Mar 2022 22:55:15 +0000
Received: by outflank-mailman (input) for mailman id 290496;
 Mon, 14 Mar 2022 22:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxqh=TZ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nTtas-0005JA-4K
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 22:55:14 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda81d26-a3e9-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 23:55:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id yy13so37429686ejb.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 15:55:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090631c700b006b293ddbca1sm7314593ejf.35.2022.03.14.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:55:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47A0E1FFB7;
 Mon, 14 Mar 2022 22:55:09 +0000 (GMT)
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
X-Inumbo-ID: cda81d26-a3e9-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=y2Q/inabtnNQGMD1STwoVXN1cYBrHr5EEIPdNdUQA8M=;
        b=B3Ph160SYsccuR00NVF/PocSGd5KiKeGpNJQ+RhhnFCFJnM/0IodWWwadeJcwcmY+1
         p7mK/8zR77h4sFn6DIJS4jdi8ycIdBa6GBZQ6BXKTb3vVVmexiMZjgQShP38GekQRhLR
         OFFa1yqM6ceyWSEt+cqGDYutIRVgD92f7oipq5Mg9BeeGJDwvUB0CNZczv+2oAKHL7RU
         XtPyTH4G288CVUiVrITqt6JutYE0Qb0TgEX3xgugz+3QvZ9/Wgx/vbThbekaqzBLCdmr
         djWEZim/YuTV6z1bWLbTLYuLWSD1hi3Ql3isNXnEieORmw90FONvnt5WSh0jULarEWnD
         mY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=y2Q/inabtnNQGMD1STwoVXN1cYBrHr5EEIPdNdUQA8M=;
        b=nt4RsFw7IJKzMgIm9J9k3tHQtwxZkyM5XT5FmMcCNunOWFvq5vYddC+8A+OY7MJy+/
         lO/Yx6McR2v/nq471hopV9VjRvdSAgsOIzAgpORr+rwbwLVJj6ScysCZIK/cj5oySZ0O
         xqSwAVj/OD92Gie2Gsb7ZE8TC1DfrF8AV5+L5aptNzltx0p3XP65CmdC5FMPX4qYLqFr
         3hZAwQxhEniXE70R2ccJWUYpiGGb52ijpVE0zA3uNFCPJoQFyn1yIuHIkOBcL9W5BP/o
         N35BErJ3S/fK4nhbpEcDsPdLwAgr2e8Kw/6DsEIRDQP8HYrOAD1F1hYKroHgKb+bqaQp
         Ugpw==
X-Gm-Message-State: AOAM530wYltHrbiQJE3cJz/YpZSsSpf5Ef+6Z1W5hTKCWe8FCNHUhHfY
	JjJTJgn1fRO2eM3UznOUnJQ+FQ==
X-Google-Smtp-Source: ABdhPJwH8+Emwxdug9WRaA5Pn7fnzwuIyGSHomy+CWFwvXssMscVFR/0TRAwIvo8vB6/HLdlnvsYkw==
X-Received: by 2002:a17:907:3f9c:b0:6d8:116d:476b with SMTP id hr28-20020a1709073f9c00b006d8116d476bmr20220654ejc.432.1647298511045;
        Mon, 14 Mar 2022 15:55:11 -0700 (PDT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Jean-Christophe
 Dubois
 <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu
 <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk
 <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Mon, 14 Mar 2022 22:52:52 +0000
In-reply-to: <20220314160108.1440470-4-armbru@redhat.com>
Message-ID: <87y21c401e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Markus Armbruster <armbru@redhat.com> writes:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
<snip>
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 137171b717..6d48ec9566 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>      if (strcmp(name, "arg") =3D=3D 0) {
>          s->argc++;
>          /* one extra element as g_strjoinv() expects NULL-terminated arr=
ay */
> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);

This did indeed break CI because s->argv is an array of *char:

../semihosting/config.c:101:17: error: assignment to =E2=80=98const char **=
=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-Werror=
=3Dincompatible-pointer-types]
  101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
      |                 ^
cc1: all warnings being treated as errors

So it did the job of type checking but failed to build ;-)


--=20
Alex Benn=C3=A9e

