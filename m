Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC319E3CCF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 15:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848587.1263454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIqQz-00073g-Bk; Wed, 04 Dec 2024 14:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848587.1263454; Wed, 04 Dec 2024 14:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIqQz-00071s-8y; Wed, 04 Dec 2024 14:32:57 +0000
Received: by outflank-mailman (input) for mailman id 848587;
 Wed, 04 Dec 2024 14:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vacz=S5=gmail.com=alchark@srs-se1.protection.inumbo.net>)
 id 1tIqOM-0005sF-4T
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 14:30:14 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452237c3-b24c-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 15:30:13 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4668486dec2so50520481cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 06:30:13 -0800 (PST)
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
X-Inumbo-ID: 452237c3-b24c-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733322611; x=1733927411; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ORUpe0pVZmQmvkw1nu+aTOjOaP1O5zfh0k3pgSPzo=;
        b=GVgvQ+3+LKHEMDfnYXBcetqITur8s8TnO1CafJymu78jNYMmR414HYkWAMCOWJjJ4M
         pNUP1AELaTPhYwT5uKJCVA7rH7AhrZGoIjz+AyINEP6IOdtk2qUwvZUMLA1xqwFW5h2b
         0sIsN6g4j9GQsLlCqn9+MxggRO8TpoWQxezJbZfXSZ3+ra6DdShwx7P7dPV8jURV9Vqm
         h+oERGOiUVZlJbnBpxomAoWPnJgTRQVvTfouxHttxLqrISytPGzu3wyiP2RtRQsa+yiS
         o+zeIJ8q8nPlRDUPnzbqTL6IF4zoIY4vdOYNnBkTHcbouwm2A8bTWSVOlwj+jXjCk8Ge
         k5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733322611; x=1733927411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ORUpe0pVZmQmvkw1nu+aTOjOaP1O5zfh0k3pgSPzo=;
        b=Z/dgYmxH4kYDBqB5P3aJWBrRQBdamizYSxdK+6RPjkVPYVQD8aPWnZoJCzVnWuvNMS
         yDsYxu6VUmgdRtmE5Db7ARGRj7lJbn5lNlK07daPqpuXbxliIWCvNbbu50AayqySOVQC
         MXJksLXUfjuOzmxWFTALuKMJrKNJA2D41erIxbwsxSnKAiBjOV+JBYAVQZlBpMFlO0wH
         ywIcXjZjUiqPEacFLNTCcUT2SAesgk71hRZC/0q99DBw59q9NX36Fg6yZfCpC29vVuhr
         x1ekZAkuJ5mYT6ZylwC3PMQXaJeg3CSm71zhnIPwSILiuoLoGh2KzF1V35HqQH4d+NrB
         qQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWibUoZh2QAkDIHenCX6NSyJmKTIrj+CEf40hwo2FPjMRGcGAwpnV/dnNmIeORBXC+CzvJYudICSz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWuyCLvhpbGAd4M2erLgW4TtnOl1F7XJzt3OtsMiC0sWiGmpMK
	eYO50KCWguLt2quXDei9Jb9+pLK6kTHihCRsSYz0gW0Bh4uHOtF/TyET3USJkKrgDoEmGCOOMOP
	45o/y/4d3dlNdt12xzHRgV+AmTQc=
X-Gm-Gg: ASbGnct0d8IPMoa0RZprcsAvMUv5KoSzlpqWnQiA6gaablCprrLl85L/g87Y4tCjgd6
	/17wId8MJUnqKzfGxGDJD+POBsVmJEWQ=
X-Google-Smtp-Source: AGHT+IFz9AqjuEgEtpGhSGQOZnrxRUdrncSun9IdkUiaSxXNrzlUhCJKBQf8IWnzX9RSbBxpI0ATkHRWJCCRT5JjEU8=
X-Received: by 2002:a05:622a:1801:b0:463:60a9:74c0 with SMTP id
 d75a77b69052e-4670c09df44mr91467951cf.14.1733322611045; Wed, 04 Dec 2024
 06:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20241202194107.105119-1-afd@ti.com> <20241202194107.105119-5-afd@ti.com>
In-Reply-To: <20241202194107.105119-5-afd@ti.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Dec 2024 17:30:00 +0300
Message-ID: <CABjd4YxYjX2bHSBMmPxH-5muQL5TG_ATS8B0+vCdNKJARke6BQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] ARM: vt8500: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, Dec 2, 2024 at 10:41=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm/mach-vt8500/vt8500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-vt8500/vt8500.c b/arch/arm/mach-vt8500/vt8500.=
c
> index 0ab40087ae1cc..1d294255d7083 100644
> --- a/arch/arm/mach-vt8500/vt8500.c
> +++ b/arch/arm/mach-vt8500/vt8500.c
> @@ -141,7 +141,7 @@ static void __init vt8500_init(void)
>                         pr_err("%s:ioremap(power_off) failed\n", __func__=
);
>         }
>         if (pmc_base)
> -               pm_power_off =3D &vt8500_power_off;
> +               register_platform_power_off(vt8500_power_off);

This really calls for a separate tiny driver under drivers/power to
remove the legacy single-register remapping higher up in this
function... Pending that:

Acked-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

