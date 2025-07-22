Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84414B0D766
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 12:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052246.1420852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueAMA-0000na-Bd; Tue, 22 Jul 2025 10:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052246.1420852; Tue, 22 Jul 2025 10:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueAMA-0000ko-7t; Tue, 22 Jul 2025 10:36:22 +0000
Received: by outflank-mailman (input) for mailman id 1052246;
 Tue, 22 Jul 2025 10:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J0j=2D=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ueAM8-0000k2-Ag
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 10:36:20 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ac99dc-66e7-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 12:36:18 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-553b5165cf5so6320231e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 03:36:18 -0700 (PDT)
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
X-Inumbo-ID: b3ac99dc-66e7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753180578; x=1753785378; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf/IBJXkIyOuxGlUvS1AcomH3TMlE9hkjmJjP7DEB3M=;
        b=ft7Oy1TW/Ce7eOYg8p58x9EzOkaOG/vGfsGWxTHoQaShAJgqlBNDhNGpLWrGOc1RGv
         dUy7PTgsl1teZ0Bn5Q3Kun1iQHaRAP43pES+7b7tblVnhTff0+DIdzB+FIb/6bOJ3jZ2
         inLTBSLEHIPkdP0OituCxUJ4khsnWbKqPR7LOhmViK9nNKMV8rH3oeg85by0MkyIXEjx
         xC/560UYXbujoScL8KIGAJSaX1le9i1v5tolUKpZwJws5nXWiJ8Mx/J18zlG0Zxr0OV1
         Fjmlk79yxbCrAizbeLtK7w9GzydCC7yonw7XM7uOPHaHv76TD56BEUwh5oGJxuzaPQiu
         Gs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180578; x=1753785378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf/IBJXkIyOuxGlUvS1AcomH3TMlE9hkjmJjP7DEB3M=;
        b=sTxlS3+/DnTPzYDWmgE7Q1WfiHDdwF51wdAm2OusAishzKIloZmWYRw2VrhWdQ0XZS
         PCVX9fwEUxDmlb2IMjM5hCYvim0oiIvU9Sliwqi54iRvrw4hBmQosgraHQGlf4CFsoRh
         fxcJ82WQW/g7jMo2tYbbVcrDeOiAMXY33PZLLlxIvOF+cEL3Asej2N2ZSIyLKnQ00K/N
         1Nl5htzACaC/y5+lIHZrNSOF7GLHDlebZfDorEeAp3r/Xeuqx8owAIsaRtYVSAVrXSWS
         kX9e8E6mmgknoB9f1qqM9AUI1Xqa8o3mg8U0hvXO19aaiXYrmpB5Y9kutMuXXlVidoi6
         3x8Q==
X-Gm-Message-State: AOJu0YzzCWiVkCrcZCeQEoBSgR41XOII1AeFiXdcLJDaSz2M0l6YaOaD
	DRlnNcU4MaImqAikit9YTSdO1PwJ0Br/Qozg00eXKhSsHI9TDOdiMMXY2jCVkO6IvAqmPwwye6d
	+LflyyjpEj+0s8j9LI7nUPVIgZqdaWLU=
X-Gm-Gg: ASbGncuevqVVilNGHQSDL4acbfKC9YAZ9WQB2WOYf+W2qGo6BSfQRBebOWQAmafH5UZ
	X70W6aPwfC7oPKtNg0swefdYRtQOw2T4XVpkbwon77PYXQgltsAFn/LNDrzzsqtJroZG5A7sqFR
	O4zTbVwQdPf2gdhy4HY9RnQDadLu3M9fCB4ezMejmOSbrXlMWqnF02HKjnXmQ72vlvJEWGGaRUb
	E4Q6Q==
X-Google-Smtp-Source: AGHT+IEndj3q/zdd/oOqdhy0kwiVmB+RB+pmkr4P2yITQ8hH7TWpyleCEc1UATxN3UrySRiZJlLItKdJt7QWZnnep4M=
X-Received: by 2002:a05:6512:22db:b0:553:260c:1b90 with SMTP id
 2adb3069b0e04-55a2338ace3mr6687143e87.32.1753180577775; Tue, 22 Jul 2025
 03:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <d2d780b307d096b3ce157f8ef3f151b86727ea99.1751020456.git.mykola_kvach@epam.com>
 <73da6018-f470-410b-ad24-950fbb7502d5@gmail.com>
In-Reply-To: <73da6018-f470-410b-ad24-950fbb7502d5@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 22 Jul 2025 13:36:06 +0300
X-Gm-Features: Ac12FXwB7Xv2qnnEIW1Qn4kIx6vIFm8xT0D63m5ooH_65-aGkJ3COib2CQhsa-8
Message-ID: <CAGeoDV-8prNG_1+XVBJHWOgn38eycJkH43utBNvL-7qaX_o08g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] CHANGELOG: Document guest suspend/resume to RAM
 support on Arm
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 1:20=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
> On 6/27/25 12:51 PM, Mykola Kvach wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Mention the newly added support for guest suspend and resume to/from
> RAM via vPSCI on Arm platforms (ARM32 and ARM64). This support is
> limited to non-hardware domain guests.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v5:
> - adjustments to the commit title and message
> - expanded the changelog entry to include more context about
>   suspend/resume support introduced in this patch series
> ---
>  CHANGELOG.md | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..1c155f7ff2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>
>   - On Arm:
>      - Ability to enable stack protector
> +    - Support for guest suspend and resume to/from RAM via vPSCI (for bo=
th ARM32
> +      and ARM64). Applies only to non-hardware domain guests.
>
> I=E2=80=99m not sure it=E2=80=99s necessary to mention =E2=80=9C(for both=
 ARM32 and ARM64)=E2=80=9D explicitly, as, at least for me,
> it sounds like the default assumption unless stated otherwise.

I=E2=80=99ll drop it from the next patch series. Thank you for pointing it =
out.

>
> But I don=E2=80=99t mind having this clarification included explicitly if=
 you prefer:
>   Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Thanks.
>
> ~ Oleksii

Best regards,
Mykola

