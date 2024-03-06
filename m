Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B9873C83
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 17:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689390.1074295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuMv-0007yB-Qo; Wed, 06 Mar 2024 16:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689390.1074295; Wed, 06 Mar 2024 16:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuMv-0007wT-Nh; Wed, 06 Mar 2024 16:43:49 +0000
Received: by outflank-mailman (input) for mailman id 689390;
 Wed, 06 Mar 2024 16:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XdX=KM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhuMu-0007wK-3p
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 16:43:48 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b32fcfde-dbd8-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 17:43:46 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51326436876so1565525e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 08:43:46 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a19f00e000000b005132cf9094dsm2368048lfc.36.2024.03.06.08.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:43:45 -0800 (PST)
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
X-Inumbo-ID: b32fcfde-dbd8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709743425; x=1710348225; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oTAhS6BPjC1OlEr+SwLhC4ThwGKDMP77my5pTBizAyE=;
        b=mUvFoAPJD1St6C+ojApcEfRF/QXIXIwaxSA2LAwSwJKpdMx5k6GRA+zlZ3hKpYQb3i
         wz3VuBdXgJcySkXvNgUyb3Zga+tQc3uyeTV5qddIjJZV1/g4jQo/7A8rQQzjpSgBDA9Q
         otjUPp8JPOuzTW6cChWC4v0ABw30v3jmOKj8dhUpdRrKCMfuXSZDUs1tyriXg2C/t7y6
         ZDYWPqziH5xD+dV8LIHZXjDkDaGRyJUIZku5TKuHvSRpzwVPJCHxfVa1xKabA/5mIm4N
         0KV3K7rf0vdxn1wlwXfLQ4TOynlBRDiBLg49vNZ6UAh/PtnOUnMxGE0Wbv4zR0ShoxvR
         xNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709743425; x=1710348225;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTAhS6BPjC1OlEr+SwLhC4ThwGKDMP77my5pTBizAyE=;
        b=MIG8X6lHACsidfYfqcApCVJ3o+zEP+/PkxIW5KzvGueRcvmBwykFviByyBo20CD2XY
         Y8PuLWQpWGQEhZsyaoScx+gnS9ZixEhaWFjy+Tf9zsHlcoSVBfQEIuQXijW5zzfxwHnB
         InpiVRvrKsqAsw06Olg0lcMiZ6nlM4kmlOeafA+waV3Wlu9CuYw3OUJ/a1fSolMmlBUk
         Oc+F9Nk/W+aJWrnCMK7AYb65gNFMFs/5Tto4EB5DirOnHB2GX+R6ggWdAuXsZL2+60My
         zzl3+jcu5Tn1s/A7hcyplBzioxlMnEsIH6+zVhMXYThF/ZUdI17OFg7Xjfrn/dr8pBYa
         zBtw==
X-Forwarded-Encrypted: i=1; AJvYcCXbYVJN5/wWbdPvRSNgUj8DWUQuyQL438MyopUHzP7sclIlUDaqVrtJbVDJ77gNQaObiJx21fyvfKaVftf7Yp7tk6am+puu7+Fycfp5stQ=
X-Gm-Message-State: AOJu0YxJY7d+tGdjaoxL8VumjPNBC1VTcteWUl8vs4DxTBpgOnnupjqk
	gfzVtlCvNkp0yfkAIofnLUn/YP/tJkpln6IGsbyjuq4T6CZ1gH3S
X-Google-Smtp-Source: AGHT+IETNvMAB8G8RD4G7IuoORU1JKVuKpH+bJSItVo4Mu1vuWsWw9L2uaYjsoxLSTJpgMMa9DNBQg==
X-Received: by 2002:a19:f011:0:b0:512:fe3d:a991 with SMTP id p17-20020a19f011000000b00512fe3da991mr3584085lfc.61.1709743425299;
        Wed, 06 Mar 2024 08:43:45 -0800 (PST)
Message-ID: <8ec313087bfd4449e259151688c1ba2cb5b3f24c.camel@gmail.com>
Subject: Re: [PATCH] CHANGELOG: add an entry for 9pfsd
From: Oleksii <oleksii.kurochko@gmail.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
Date: Wed, 06 Mar 2024 17:43:44 +0100
In-Reply-To: <20240306111738.1815-1-jgross@suse.com>
References: <20240306111738.1815-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Juergen,

Looks good to me:

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

On Wed, 2024-03-06 at 12:17 +0100, Juergen Gross wrote:
> Add an entry to CHANGELOG.md regarding the new xen-9pfsd daemon.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> =C2=A0CHANGELOG.md | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index f9874f9bb0..93fda73c00 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,8 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0 - On x86:
> =C2=A0=C2=A0=C2=A0 - Introduce a new x2APIC driver that uses Cluster Logi=
cal
> addressing mode
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for IPIs and Physical addressing mode for =
external interrupts.
> + - Add a new 9pfs backend running as a daemon in dom0. First user is
> +=C2=A0=C2=A0 Xenstore-stubdom now being able to support full Xenstore tr=
ace
> capability.
> =C2=A0
> =C2=A0### Removed
> =C2=A0- caml-stubdom.=C2=A0 It hasn't built since 2014, was pinned to Oca=
ml
> 4.02, and has


