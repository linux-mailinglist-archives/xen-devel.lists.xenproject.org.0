Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4FB1545F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 22:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063042.1428815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugr6Y-0005ee-Ht; Tue, 29 Jul 2025 20:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063042.1428815; Tue, 29 Jul 2025 20:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugr6Y-0005dD-F1; Tue, 29 Jul 2025 20:39:22 +0000
Received: by outflank-mailman (input) for mailman id 1063042;
 Tue, 29 Jul 2025 20:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gf+C=2K=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ugr6X-0005d7-5i
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 20:39:21 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f91b39-6cbc-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 22:39:20 +0200 (CEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2cc9045bae9so831223fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 13:39:20 -0700 (PDT)
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
X-Inumbo-ID: 19f91b39-6cbc-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753821558; x=1754426358; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USOC25bA5w/KexXKLwYrYwLnKpgaqGDcwKQvzxnREWg=;
        b=SoUP5LBrp9ys1NxseVtZCXum/3jUkCHDwkK5Y1GqEuBcD4ubaHZU8itKH4DRwecegT
         kRfkB90dCs9ZTCqyO8XgJ3CBbiBqMA0tdMWg7g9/JlgeHNfWGDzyFMNmzTr+pXT82G/d
         BLcaPop5LVQBZ69tITcaK5GpHBcHfCrRDYMYo/7y1AS8W4D9qhO/Iivd7xaQssCBTAt6
         T14bB0Y1255WiCXmjnTHljAag7up6B7my5aHzkEW/Lb30XldMPL6+I41IUUpC9ssQiGt
         MY88gy9h/BYqA+nbputd1ys9buNkZTpL2QTM8bmBX4v9lj0TcR9zC4F8kSnPYxo1liUN
         FJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753821558; x=1754426358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USOC25bA5w/KexXKLwYrYwLnKpgaqGDcwKQvzxnREWg=;
        b=FhnnnGyTfFgzkZnr7euFeFXyJk7y2rJA7/ODZzh1iKLuE3StHD7d+akNtsnlwwRuLg
         GmG5yCHKAIamuhrXafpQfGO1JZXhSTQBCOpy29lIuoGxLsPc6OPczFUSakFsPD7XIiqQ
         5zaGVOv45t50V9JN6CbCupX0a+Dhr69TuHMZMVFTzJqncK6cBl9J6Jr3Cf0yOxGy5lbf
         TcWoNRcYGCfu6Kda1HOcaeN+SZBTC8Za+8+oiS1T8t0/JQ7A+q5W/m/TX2/KIDQDWRgE
         tu+do2aDe7e41NORDWS6aPZLuaA7mUTiWx+5QWpL5HVrlx5oNGzZSGZY3oO916XwqCI4
         1IgA==
X-Forwarded-Encrypted: i=1; AJvYcCXmHS4D3dFXHcEeEu97qZJPR3oAvfXHp9+xaTuOkhJ9pI8IspVAwBTgXhGFFGt3lAGe5CzAT1kisDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxroiqoE04J98/7DbDVuJfvjT2QmDmYtk3/trUSNBCd6bnFT0Gm
	H9qNvICcqfk3FggMFDqD2RuoPfyUt7HS5sIkHswzDICYHDlMwEsiVD8YwdhTW8O6HDzf4ZCHs3p
	IQH3Ydb2A1SnCdv7rn3TgCn3hmPkbq78=
X-Gm-Gg: ASbGnctxr3anmwhK0OEpbLdyHp0RONb1oKPTzq6gw4U12Ww5ZLhnIs/y2iyimhZl3Tg
	kGw0/JxKbmUj+OiFgAybHNAhL3V1KkKkd+u0Odw2WttgKEX7zraVGDC2GypbGHRJwuBWsFkm/fD
	3qRnebsWiE5iupGfsI+xfUGo0WrSWVkFNqcj/4pFoiFgU+lG57JU6ftM9wz9A1ZZ+a8eIgILZen
	ufelg==
X-Google-Smtp-Source: AGHT+IF9U9g0veQlMSbWjyKlZ+DMDJztE2QTQH5SQFEMecen6xFzZUux2QXdI354loe+7nK+dV3uPtSYynskDawbmsY=
X-Received: by 2002:a05:6808:6b96:b0:421:5b56:5402 with SMTP id
 5614622812f47-4319be01729mr243367b6e.8.1753821558552; Tue, 29 Jul 2025
 13:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752691429.git.w1benny@gmail.com> <3c46e6bd09b2481360fbdf812926d199c5416198.1752691429.git.w1benny@gmail.com>
 <888b0ca0-4fe0-4457-a614-fb853dec7a98@suse.com>
In-Reply-To: <888b0ca0-4fe0-4457-a614-fb853dec7a98@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 29 Jul 2025 22:39:07 +0200
X-Gm-Features: Ac12FXxQyGV2cBajoz6l-EBdER6vy8obiBjjJAegXYN_Uagwnlmhr4iT7BHCJrI
Message-ID: <CAKBKdXig2ogkT4993He8scocdx3jz4yVG97ESYQnqXGmTuNrcQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/9] x86/altp2m: Remove p2m_altp2m_check stubs from
 unsupported architectures
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> Hmm, using IS_ENABLED() would certainly be preferred.

Why? Very similar usage is a few lines above, with #ifdef
CONFIG_MEM_PAGING and CONFIG_MEM_SHARING.

> That would apparently require ...
> ... the declaration to be generally visible (likely also outside of x86).

With all the other changes in this series, it seems like it only makes
sense to guard p2m_altp2m_check with CONFIG_ALTP2M.

"Having the declaration to be generally visible" is exactly what I was
trying to avoid.

P.

