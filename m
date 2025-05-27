Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF60AC529F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 18:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998636.1379361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwnl-00030y-5X; Tue, 27 May 2025 16:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998636.1379361; Tue, 27 May 2025 16:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwnl-0002yc-2C; Tue, 27 May 2025 16:05:17 +0000
Received: by outflank-mailman (input) for mailman id 998636;
 Tue, 27 May 2025 16:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJwnj-0002yT-7r
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 16:05:15 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f5616c7-3b14-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 18:05:13 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-551efcb745eso4420252e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 09:05:13 -0700 (PDT)
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
X-Inumbo-ID: 5f5616c7-3b14-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748361913; x=1748966713; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhYBjKtDHXYKRUMKJVj8jFgV9Y7ogyhIcysWSkhwnj4=;
        b=YJ/oWms2eO7JvIgWnan837seweum7537jQ/1QCxFYh2mzet5RQNacV3aY/+nSQuB7I
         c8O08W3qqr0Znmqoy075Bmm44dQv15ZPZq8vZql4Vz7W/0i6AZ6KE2LUEOSRh4HWJoM7
         QIrdrUYN5aKsFX+KnFk4vPVuiQ7Xc08EweF/HtWv+3ScA2mtQ6rqfyI2VgZqij+Hga9S
         gXUk7g3IzB1903ejhnXR/Q4UuQc8rexxjm86K00ym94E1rMQcB/mVyY01Uw+JUIcIxV+
         QEoGG56E8ILU7UlFZYzSOt42v9sFM6O4mosITp0PEmLdgeNDH1BUVK0VQWwPZKOztnq3
         JsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361913; x=1748966713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhYBjKtDHXYKRUMKJVj8jFgV9Y7ogyhIcysWSkhwnj4=;
        b=GLPN7WxtTRQTrDXDWDzbzwYHknUlahx84LzsPmnEkrOGM/SoMpmXkjn9YpI6LU5gP/
         zWHxAWiksaDQ9ON6XP92uok9BQV5HDLf7l2gIzfwm8xLj8V6x3fKi0/Fpy+WFp0WS2PH
         9qJVnadp/0O8NuHrNGFnLi+l6MHUT95r7y9GvdxDI5x1OhWVf3volQDXc6vdu466+/9d
         G2ehVtkd83x9zpJI7XwT7Z2qpRxZVxn1ZMSheqUJCjPN6LhAfjjmN9VGm/MLXgDjeeAi
         pKOW3YSoEHcCgKKK+SFaYQZwq4NLSELecl3Kd83FTlHEmZDjFf6hmRCTWhCU+4Ui2xmC
         ReDw==
X-Gm-Message-State: AOJu0Yw5ShPfJ8T68p7SG8yU4rrzhzUz3pS8Hgw3F0T+c6lAqUgtqzDx
	7N20GidBcuQR0+2EOyWagCnS3jB1ocVJdMlN7nKiWisve4jRrxve1UGEBcluA8ZiIwBSpyvAqhH
	b4QJ35fEITRCxgAoZdmm72kabqSrwbAI=
X-Gm-Gg: ASbGncu9eUz9YzGPPqpvfz6eCn+FxkUFpR6DzjAsIPYH3IwchOssrY5/Ips4QCftmCc
	mpkyTWkhg122gKhFIoWruR4N9gV6ljn6xHZROb+42P//URsiaSojl6SecWsatYesslXVFmhGZ+Q
	QpDvtOQBBK/UVcja/nam5PhlMXZkT0JpJ4bmu+TpJl9g==
X-Google-Smtp-Source: AGHT+IFe5kmraUvAs79PsRsply9d2ipKfeoxYM9ZLGKgzRyaBz/g/ln+u+fHXqY3NM1ViF2NCeaZ62zXDrsrem0OKFc=
X-Received: by 2002:a05:6512:3c8e:b0:552:1c1b:556 with SMTP id
 2adb3069b0e04-5521c7ae35emr4596587e87.24.1748361912471; Tue, 27 May 2025
 09:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748337249.git.mykola_kvach@epam.com> <1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com>
 <87034726-3a26-4146-ad05-655058b9eba9@gmail.com>
In-Reply-To: <87034726-3a26-4146-ad05-655058b9eba9@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 27 May 2025 19:05:01 +0300
X-Gm-Features: AX0GCFubT5IjTcKeb9dWPSKlz5xxutsuio3g6YNWS4fTwMdGIFiQF0yIHPh-SBw
Message-ID: <CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com>
Subject: Re: [PATCH v4][PART 1 4/4] CHANGELOG: Mention Xen suspend/resume to
 RAM feature on arm64
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Oleksii Kurochko

On Tue, May 27, 2025 at 6:38=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Hello Mykola,
>
> On 5/27/25 11:18 AM, Mykola Kvach wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ec452027f5..fc89ed6e09 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>
>   - On Arm:
>      - Ability to enable stack protector
> +    - Support guest suspend/resume to/from RAM
>
>  ### Removed
>   - On x86:
>
> According to your commit message, suspend/resume will only work for Arm64=
.
> I think it would be good to mention that in the CHANGELOG.md as well.

Thank you for pointing that out =E2=80=94 in this case, I forgot to drop
"arm64" from the commit message.
For non-hardware domain guests, suspend/resume support is available
for both ARM32 and ARM64.
When PSCI SYSTEM_SUSPEND is triggered from the hardware domain, the
system ultimately uses
Host PSCI =E2=80=94 that is, a full system suspend is performed.

>
> Also, this implementation adds suspend/resume support via vPSCI, which
> I believe is also worth noting in the CHANGELOG.md.

You're right =E2=80=94 in this context, "guest suspend/resume" refers to
handling via the virtual PSCI (vPSCI) interface.
When regular PSCI is used, it's typically referred to as Host PSCI.
That sentence could probably be rephrased for better clarity. Thank you.

>
> Thanks.
>
> ~ Oleksii

Best regards,
Mykola

