Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC8AE5F9C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023401.1399387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzBK-0005qz-Uo; Tue, 24 Jun 2025 08:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023401.1399387; Tue, 24 Jun 2025 08:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzBK-0005oI-RU; Tue, 24 Jun 2025 08:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1023401;
 Tue, 24 Jun 2025 08:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTzBJ-0005oC-NP
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:39:05 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7acbaf-50d6-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:38:58 +0200 (CEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-73a9c5ccfcdso2338527a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:38:58 -0700 (PDT)
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
X-Inumbo-ID: ab7acbaf-50d6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750754337; x=1751359137; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fdVqUv9Dx1b2vakRY+bKPqpAC4603RhipA/F0JK1j8=;
        b=SDi9nH9H2rubkvkfrREw+0FFjSgrc6dlxoMngv8mlvgJ1H0ysRJTrAeVv0zWkifguF
         8kznDJX24OUB2FYOaHJT7KzurEYmwVbgr+jRQF/+mHpL1x2Zw9XKjEXIZ7fGOruLW6aW
         w4YmuuoGuMflOolEnE06Qmt6UHy0h4tY6o0Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754337; x=1751359137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fdVqUv9Dx1b2vakRY+bKPqpAC4603RhipA/F0JK1j8=;
        b=EP22OFNOsx6opdvlY6aR1D46HfvwEq1/1yR3OXivfu/Ofi4ODiTtnXpqmLgWFXYmT3
         O5kgAd6fR5p1N/KnR/Ml8znXKNEOi6cTGTBbVruxtWl8FZrvU5ZFzlV+TqX6wNiC8o7F
         xd6aJLST7Z3hCJldmAa82rWSFo1Y4K0OOMWXDV3mRXuHSLSbo1MrVCkf7ATL9bITWiNW
         aNTJS7OO3bmdT67pn9/xjaxL5MVvqCQ0qkpSCMkcvAzIBcMCyJXQRItAzOes8vHS9FnW
         CpzG6Z1zkzSCuVJkqV3ha9e1WWTvFCgHhGr4xIZEUSdaGb1VH3JALlWLw26QSR68ll4m
         RK7g==
X-Gm-Message-State: AOJu0YxErxvAj+91JHHa6rfs3HiGTGf8lJoNK53qqP0pcY3giiHSl1Hu
	eaP4tYCSkQzxv8K6dwtDyHF5G/IKPWDGQzAoigpj2EUfymXU340BxOSry59ikBBreq0x/Tgv1ml
	nvFzUNDhaDrGEUDrrJ8louOcn8/FlYSV5s3cTGkFA2ACSnBT/ZGbDyk/3PFMd
X-Gm-Gg: ASbGncuGiyelCNfyM46uDr6H/0r6fxTY5FzxY4hy7btG215MwM8my/UHn//I8R7eTY3
	M+8uQ452ekNe/JxeGpAStSPf8eEoFNGr0xmuf0Mg5yISlLzmzGXZ0JEqABJg1xG3Pkj4ef0tkPA
	iHROdxrncZ1vJkjzNqwxsu/4c98dSr9B1PHoy7tZ0W
X-Google-Smtp-Source: AGHT+IHrwOyfG9xQhD0rUrwGqpyLmU+ovT0WF/XyeL5zH/sZXyGDmaSVwWhPjBL8peiR3Z3tcxYQYkDccPnFhHF1OsI=
X-Received: by 2002:a05:6871:729a:b0:2c2:bd31:cf37 with SMTP id
 586e51a60fabf-2eeee3a1368mr12362980fac.4.1750754337171; Tue, 24 Jun 2025
 01:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250624083157.9334-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Jun 2025 09:38:42 +0100
X-Gm-Features: AX0GCFsSRwBTUdbyWPu7LqV1UnazyhdCwS-f7mQkE7nt0Nr1wjzp9uF173Rovnc
Message-ID: <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> The combination of GRUB2, EFI and UKI allows potentially more flexibility=
.
> For instance is possible to load xen.efi from a no ESP partition leaving
> a boot loader like GRUB2 taking care of the file loading.
> This however requires some changes in Xen to be less restrictive.
> Specifically for GRUB2 these changes allows the usage of "chainloader"
> command with UKI and reading xen.efi from no ESP (so no DeviceHandle
> set) and usage of "linux" and "initrd" commands to load separately
> the kernel (embedding using UKI) and initrd (using LoadFile2 protocol).

I was forgetting. If somebody wants to test "linux" and "initrd"
command with these changes be aware that GRUB currently has a problem
passing arguments, I posted a patch, see
https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.html.
I also have a workaround for this issue in xen but it would be better
to have a fix in GRUB.

>
> Frediano Ziglio (2):
>   xen/efi: Handle cases where file didn't come from ESP
>   xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
>
>  xen/common/efi/boot.c     | 98 +++++++++++++++++++++++++++++++++++++--
>  xen/include/efi/efidevp.h | 21 +++++++++
>  2 files changed, 116 insertions(+), 3 deletions(-)

