Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E693EE77
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766307.1176793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYKs7-0002AU-0i; Mon, 29 Jul 2024 07:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766307.1176793; Mon, 29 Jul 2024 07:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYKs6-00027a-Tb; Mon, 29 Jul 2024 07:32:42 +0000
Received: by outflank-mailman (input) for mailman id 766307;
 Mon, 29 Jul 2024 07:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYKs5-00027U-JQ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:32:41 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc804586-4d7c-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 09:32:40 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eeb1051360so31485891fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:32:40 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d074b0asm12025641fa.102.2024.07.29.00.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 00:32:39 -0700 (PDT)
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
X-Inumbo-ID: bc804586-4d7c-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722238360; x=1722843160; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4mmW6m6430ybKp9+iaDOHgj3ZGQZMKcButDecWwu9nQ=;
        b=Shqv/w5KmTI9kUuT8OqaP6bM9JujjM1qAUHC3ezq+d2+1jPwYlI6buy0wAlCwkecwm
         8MZkfyJp1D+YBMFi0n/0PT6qsPxbDHBVHlWfv1/RD6zIJLzqeNikO9+a8rhS0u00h57Z
         sKAp1TiHnpG81tlsuBB/Z4nvH0I4uEZRazGC5uV5oSJzAL+YJeAGrJNcaDUtVNbKatID
         W6UlMwtV3JhiiSSTXjLk5UiazkwIlvz4Qg/cj9pupQ5XqJ7AIwk3bv5Zu3MGrT9NQwVr
         fXTXnXcxq5Q30xGBm8ARoVgJfhA8h5Oxel8SuNyvuOB8FQV6URam+fKY26zusR5SlyYV
         WN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722238360; x=1722843160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mmW6m6430ybKp9+iaDOHgj3ZGQZMKcButDecWwu9nQ=;
        b=M6Y5mC7Gqfc/Ng2muaXiZzuHacXegsr6knSucNstE2DRpKdPDD1FWmUmrHkr1++4Jr
         Ob3EYStdrk8mA5dqKo9GOXEHwyx9FxJtDrGals6kOIxRtkCgwLrjxf3QCZPczNOIp7Gu
         GakAiqF3OQXo6SmgKGutMPNgMeiUF2Er3ZG3UGeDyvsrxB2najy8rHoKZm6DAiuoWEj1
         VSyGjtqCsML8DhXVGbW7FEByZJneGu4Cuf0ij5pH66FOQKq60ubr3QWspBbVLb1LkErl
         bvYglB4inA7ZlILoXkwovoOmTMSlN3Mbq9hVFOOP5wCilrfrgRJQWt+0EzUaadaHcZsZ
         x+MA==
X-Forwarded-Encrypted: i=1; AJvYcCVNwiPK3hHFnjLcFkMDtg9ZGDgJYgNBMntAwraX23kmdN5lidvn6xcqvp5xo5PjFuqrChFZFpHxpn3vgzI+ULTbaTLOA74vp4QuWvadXg8=
X-Gm-Message-State: AOJu0YycjIKZ4X6U7wuDFmGAM0/B3nVwnVLYljnVBdwWKxmO1FNlyvdM
	J/jWgKvMXz/6YE58Gs3Nerm/wn7OQooFSu4hraVPDljyEHhjJOKf
X-Google-Smtp-Source: AGHT+IHygfLK9B+ljxtXPnXwQ2u2cj/kiNleR4EJTUVHcYrLP16bFZVMViqv08JX0iswBIpAT6VbOg==
X-Received: by 2002:a2e:3a15:0:b0:2ef:22e6:234b with SMTP id 38308e7fff4ca-2f12ee194bbmr39466531fa.26.1722238359583;
        Mon, 29 Jul 2024 00:32:39 -0700 (PDT)
Message-ID: <33f1595f10e3a6060119c6b22b930c299fd59235.camel@gmail.com>
Subject: Re: [XEN for-4.19] SUPPORT.md: Define support lifetime
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Mon, 29 Jul 2024 09:32:38 +0200
In-Reply-To: <20240727104546.94312-1-julien@xen.org>
References: <20240727104546.94312-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sat, 2024-07-27 at 11:45 +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> =C2=A0SUPPORT.md | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 77d2a7a7db1a..8b998d9bc7b7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,13 +9,13 @@ for the definitions of the support status levels
> etc.
> =C2=A0
> =C2=A0# Release Support
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 Xen-Version: 4.19-rc
> -=C2=A0=C2=A0=C2=A0 Initial-Release: n/a
> -=C2=A0=C2=A0=C2=A0 Supported-Until: TBD
> -=C2=A0=C2=A0=C2=A0 Security-Support-Until: Unreleased - not yet security=
-supported
> +=C2=A0=C2=A0=C2=A0 Xen-Version: 4.19
> +=C2=A0=C2=A0=C2=A0 Initial-Release: 2024-07-29
> +=C2=A0=C2=A0=C2=A0 Supported-Until: 2026-01-29
> +=C2=A0=C2=A0=C2=A0 Security-Support-Until: 2027-07-29

I am not sure that it is critical but I am still waiting for CHANGELOG
changes review. If it won't reviewed/merged today we can't cut off the
release today so the date should be changed. ( But I hope we will be
able to review and merge CHANGELOG changes [1] )

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

[1]
https://lore.kernel.org/xen-devel/0c93b49ac00fa92721035b4f9eb2ae76175fe886.=
1722237887.git.oleksii.kurochko@gmail.com/T/#u

~ Oleksii

> =C2=A0
> =C2=A0Release Notes
> -: <a
> href=3D"https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes
> ">RN</a>
> +: <a
> href=3D"https://wiki.xenproject.org/wiki/Xen_Project_4.19_Release_Notes
> ">RN</a>
> =C2=A0
> =C2=A0# Feature Support
> =C2=A0


