Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCBRIk3E8GloYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:29:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B37486F9F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296317.1572736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjRD-0003fZ-Pt; Tue, 28 Apr 2026 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296317.1572736; Tue, 28 Apr 2026 14:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjRD-0003dk-N9; Tue, 28 Apr 2026 14:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1296317;
 Tue, 28 Apr 2026 14:29:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefanha@gmail.com>) id 1wHjRB-0003dY-M8
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:29:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjRB-005ICZ-1u
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:29:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefanha@gmail.com>)
 id 69f0c43e-bab6-0a2a0a5309dd-0a2a4506e3b8-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:29:20 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <stefanha@gmail.com>)
 id 69f0c440-7371-0a2a45060019-d155d034d5f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:29:20 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-65c0891f4e9so18916159a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:29:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1777386560; cv=none;
        d=google.com; s=arc-20240605;
        b=K1IJivccxKULjJ/w/GF3Mk8TDhYejSGnnXK/ETjr499P2aQMgFrC5Qdk0ApWx5u709
         /QdvcvGGKzWkBk7fFy4CRgRY0haLqikfesnq2IBv87nmp3kEEOwW7yUBbgstzymNdE9j
         Yyb1sUDo0fFy4ojs2/GMf/+PF9O17WgDbinFahl5Hz924gGn/Ev6c/XPydeJOkftXgTk
         3+JXl+2MjOk5F8nDTb4EnpWGJfwaw/gkmnOrKUttlj6bghOzv/3BJ1DYSWZ0plWhN44E
         Uq3kzP1MzkRl8NjUba+hrt9lYnGsUiHy8e9OF0wcbnz3dv+8b+WWDMLGErFTvuystHuX
         jj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YcyG/1F3nXUVyq31n88lbs9OsX49y2JqeErrMkFMYi8=;
        fh=QcczVRU8FeHZ0xZPa5W4qYL/gA8ra38ED8BZxPhC7DQ=;
        b=NR/3L9ZTAg2xyIBXpctgyjl+2h/uDugrHy8pEYXNKySPNF1N+/a52DGWZ325suY8V9
         j5GMsFXU+lOI2hAm5yrhSgX0YTqZIjb4wJFjQglL5cG3oPFKZVfG7M6swSkIYh+1DqsH
         K7A6oSlF1IA36GApgUvM80LxD165m5RSkzCIYWfvULOuIWxAfCVxFKZ5iNI5rwYAG5a7
         SpfFX6UGBtmS01MD/VBFV+wIdlVDt1CCxhJCgZC44eKw07EMv11rZtu4YU9TzSxBlgFi
         68+v6wCF/7eL3RGX/JOYJR15T5aQXgPXWAmECX22k38tiQDSvZlfFEIzMASouUgVJH3B
         A3Ng==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386560; x=1777991360; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcyG/1F3nXUVyq31n88lbs9OsX49y2JqeErrMkFMYi8=;
        b=N7S17MKyeBh8dosUyGpJsNL3F5Zsl18sgUtHaaU/SL4meqPygzSAU+47UofPgwtYae
         Z6upFVtePW4JTAGoUL7eENCmnHT7fA95mcLhqqNOFhao9qH6pFFvk1V0/IEMwjpVrBQR
         W4+5oYongxQwP2e3cTLDJLlWbCNf+JruzOcWbTGoAFvsYP4KY//aGGsrETo4ko8DPGT1
         6AP9yy8FAoT8hSjUWUxHF4Isljb3C4kU28TrRiD9HHQbBfDVFFfyhdaJ29LdIb5VZuBI
         /xjWP4NMJnzPxUd8N2tvKx6ZH3Q7pA31c/ES9vrcfXdw4x7WwaS/XnhV6bYbaumcGPqe
         EwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386560; x=1777991360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcyG/1F3nXUVyq31n88lbs9OsX49y2JqeErrMkFMYi8=;
        b=mru0qFq0M3QrH+AUTnO7hiQlyWYO1lTE+u17uHgpP5KhZ7bmHbRAgMHKriu5hxbmAb
         aW5J6z2PaEE0c9W/RlW3zmLxscNKFlB6WwUuLSQKoLXlygMo0vQ9n1pMxsivfEMtOVgG
         s+EVMDp+QuTEyqoyWxHOti8jl7SVnsyhzLkF2YjlaLvSyIGvGhAPXXYkJOHPDDdXPTWg
         YcEcSNKLzKwP1Cm+9pMS6+XDsTOtoW4nBaj+CWV77c9ECccDz9QQS2C+nG9Is3ynJdm2
         IL7RnpKZSEtGK1A2lk9FdUPP8JOYy1Z1Fd7vmw7haYNQ9p1kB3XekI1dUCIMtYIO5zk2
         2ztw==
X-Forwarded-Encrypted: i=1; AFNElJ8o6HFP5pBxSVdPQLP6kBzkj3cH9iga9gNjJ9JfOo/tr8tesmHDXOIZna+89CNniNP2x4bTbiuNBC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy22shlL2GXvdiAArEP4UIukET5wJMYA5rDDgWCPxKIovqomdCW
	hzoY2cWY+q9gHnWuJlqgfmwNjWIt97F8BdtKvEFVKth8rOzIzCHOLZV5O0xuXzvQkzl3rxlKsTB
	kQ/ecl3ww1V1l9vFHUoh0AjXdOOLqaoM=
X-Gm-Gg: AeBDies4RUw/CZ2hMKaaL5nCcOtFx5mIIZuA5z9mwRN0MdYhyumj227fcQoFremXjdp
	o1IKWCudI+z0w7zgtnNqqElQDiQ6WdW/iwI7NG+mK6H1v9D8ptRv74EA+b2hYM35XtTdiFLu1wa
	v2M5rgU75iIUgxkQJPdm9bMjBxakKg9CNTI0S5Z30UUmzaAe11uq8rUvzI7OPfjieWH7evsfUhX
	Rbc0kIXq73ImJyxsaCx/eBeAEzVTNbQFHK0P7fzSped2vT6SfEQzeUXVs4/qdnXwAU6O69smJbG
	4gWgtzt3EMnJV00lmQbMF1pMuEV4Ei7CYkHdwk+X7uz24oyaYrjJQ4uMg6o=
X-Received: by 2002:a17:907:c783:b0:ba7:a94d:af83 with SMTP id
 a640c23a62f3a-bb803873d27mr206683366b.31.1777386560049; Tue, 28 Apr 2026
 07:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260428081303.990973-1-marcandre.lureau@redhat.com>
 <20260428081303.990973-9-marcandre.lureau@redhat.com> <CAJSP0QUjFupVz1uXuxgxbvTrmf_gqzV6tSg1tmuq_Lp7qGVyjw@mail.gmail.com>
In-Reply-To: <CAJSP0QUjFupVz1uXuxgxbvTrmf_gqzV6tSg1tmuq_Lp7qGVyjw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 28 Apr 2026 10:29:06 -0400
X-Gm-Features: AVHnY4JxfR5X49sh3f0xQOBGO5skCikVufW4qo03US3ycxLQlGj8SojUzT_-PqQ
Message-ID: <CAJSP0QUvg38ga-JeXVxRHxYFTyPjo7QZV2bOBAd7iosrqFJKYQ@mail.gmail.com>
Subject: Re: [PULL 08/15] ui/console: return completion status from gfx_update callback
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, 
	Jan Kiszka <jan.kiszka@web.de>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Samuel Tardieu <sam@rfc1149.net>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
	Thomas Huth <th.huth+qemu@posteo.eu>, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Alex Williamson <alex@shazbot.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
	"open list:Musicpal" <qemu-arm@nongnu.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1777386560-5377FD75-5B3FC1A3/0/0
X-purgate-type: clean
X-purgate-size: 962
X-Rspamd-Queue-Id: 15B37486F9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcandre.lureau@redhat.com,m:qemu-devel@nongnu.org,m:peter.maydell@linaro.org,m:jan.kiszka@web.de,m:phil@philjordan.eu,m:richard.henderson@linaro.org,m:deller@gmx.de,m:philmd@linaro.org,m:kraxel@redhat.com,m:mark.cave-ayland@ilande.co.uk,m:sam@rfc1149.net,m:hpoussin@reactos.org,m:arikalo@gmail.com,m:laurent@vivier.eu,m:th.huth+qemu@posteo.eu,m:balaton@eik.bme.hu,m:alex.bennee@linaro.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:dmitry.osipenko@collabora.com,m:mst@redhat.com,m:dmitry.fleytman@gmail.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:alistair@alistair23.me,m:alex@shazbot.org,m:clg@redhat.com,m:qemu-arm@nongnu.org,m:qemu-ppc@nongnu.org,m:xen-devel@lists.xenproject.org,m:th.huth@posteo.eu,m:dmitryfleytman@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefanha@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nongnu.org,linaro.org,web.de,philjordan.eu,gmx.de,redhat.com,ilande.co.uk,rfc1149.net,reactos.org,gmail.com,vivier.eu,posteo.eu,eik.bme.hu,rsg.ci.i.u-tokyo.ac.jp,collabora.com,kernel.org,xenproject.org,alistair23.me,shazbot.org,lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,qq.com:email,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[stefanha@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.862];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel,qemu];
	RCVD_COUNT_SEVEN(0.00)[9]

On Tue, Apr 28, 2026 at 10:28=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.co=
m> wrote:
>
> Hi Marc-Andr=C3=A9,
> This patch changes the .gfx_update callback prototype and fails to
> compile due to the following recently-merged commit:
>
> commit 5ef60a3787e8e0dccf30dae3704d4f5249160e7d
> Author: Yucai Liu <1486344514@qq.com>
> Date:   Sun Apr 12 19:02:39 2026 +0800
>
>     hw/display: Add i.MX6UL LCDIF device model

For reference, here is the CI build failure:

../hw/display/imx6ul_lcdif.c:221:19: error: initialization of =E2=80=98_Boo=
l
(*)(void *)=E2=80=99 from incompatible pointer type =E2=80=98void (*)(void =
*)=E2=80=99
[-Wincompatible-pointer-types]
221 | .gfx_update =3D imx6ul_lcdif_update_display,
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/display/imx6ul_lcdif.c:221:19: note: (near initialization for
=E2=80=98imx6ul_lcdif_graphic_ops.gfx_update=E2=80=99)

https://gitlab.com/qemu-project/qemu/-/jobs/14124076225

Stefan

