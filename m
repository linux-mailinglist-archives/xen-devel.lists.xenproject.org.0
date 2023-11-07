Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F07E4835
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 19:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628972.980960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Ql3-0000sh-3o; Tue, 07 Nov 2023 18:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628972.980960; Tue, 07 Nov 2023 18:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Ql3-0000qP-0l; Tue, 07 Nov 2023 18:25:01 +0000
Received: by outflank-mailman (input) for mailman id 628972;
 Tue, 07 Nov 2023 18:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Ql1-0000qG-Jz
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 18:24:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f52df6d2-7d9a-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 19:24:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso10019532a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 10:24:58 -0800 (PST)
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
X-Inumbo-ID: f52df6d2-7d9a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699381498; x=1699986298; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5gYafX7ztJebzjQB8UVsV2fLf/fzoCDawphMK/D/UM=;
        b=YSx9zofr8eIF969aFWrfAaqtGrBdXoZStMPjWsyo2ccMzvIN3wtqv8DXMb1+dp8V5x
         VHN7B7XnwzXrOM5Wk2ElUFmIaQmYg4RguJhFfsjUIFHWYhjGnWSDwYLcxQCFPzdE3x84
         p+ot2dDUlzj+LLs/m2V0aCWFcsZuRffu+ANDQqIlWSBFphNZiVKQVpcdilXTBVF28IyN
         IWqR4TU1/z0jVUgye9nL9D5s6E0Snojs1osOYlYxicWH1qoepGINif4czNX/c6+6wh4a
         ywdlE+o3pmuflepCVQUoSkNzi6oysr1vFT6DIPf3cg/LGFaXS+qzVVNVbYpbAaoh6T1M
         0ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699381498; x=1699986298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5gYafX7ztJebzjQB8UVsV2fLf/fzoCDawphMK/D/UM=;
        b=nzO/o3Xli1zgk4VNT/FcjTknW7NgvDUfpwVf3ahJUOZuRT0O+/uJJIco+wMNi/3sgc
         dyditWcT8LEcnukOcC949s1nx/PfkFsNiU59QwH4RDpT53TtBEC9HvA2CKAI0B9l+pP/
         2Koy7o1gMNrDhpGLLrVE2k1q/5OGpeOGZZrW5FoPA6Q0h0f8RnS/MoyimUA20upsjkp0
         yYZz/NhKBlQi/eGPmyA0P7xd11hyIkcE64or/0Wl+ir6rjNPBhgrD1CJca/7sfYjS1wr
         tfJWuLH/VTB22KjAaLsbABct0y3AmeKc/1qpkcdm7VF4IzSmIC6LZjX1CpY+KtUbl8q9
         XVVw==
X-Gm-Message-State: AOJu0YzfgihsHK62hQZ7EKeOAES1ubs/arxkiZedzy/aUkF8F+VJQlU/
	FiztKNLmgaJmrkBIrmvQGZyDSqAVcGmeVLszQbY=
X-Google-Smtp-Source: AGHT+IHgTHQALyTMiY5UH3wGKMabsNuFiAQfgBIxZ79WOOk+k79ew0YaMR6HBspmCtT/NPYloa3mZs+VphNWqKu3mRM=
X-Received: by 2002:a50:9ea7:0:b0:53d:bc68:633d with SMTP id
 a36-20020a509ea7000000b0053dbc68633dmr27207425edf.7.1699381498068; Tue, 07
 Nov 2023 10:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-20-jgross@suse.com>
In-Reply-To: <20231101093325.30302-20-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 13:24:46 -0500
Message-ID: <CAKf6xpvn12Fn_yUVXBf7vrgMxxCQihRovvA=sfYYRHTnW6TFuw@mail.gmail.com>
Subject: Re: [PATCH 19/29] stubdom: extend xenstore stubdom configs
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Extend the config files of the Xenstore stubdoms to include XENBUS
> and 9PFRONT items in order to support file based logging.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

