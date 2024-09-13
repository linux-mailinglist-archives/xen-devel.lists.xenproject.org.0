Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35497826B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798224.1208356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp797-00077N-Pq; Fri, 13 Sep 2024 14:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798224.1208356; Fri, 13 Sep 2024 14:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp797-00075A-ME; Fri, 13 Sep 2024 14:19:37 +0000
Received: by outflank-mailman (input) for mailman id 798224;
 Fri, 13 Sep 2024 14:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp797-000754-4C
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:19:37 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c862f6-71db-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 16:19:35 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so2619887e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 07:19:35 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f86faf9sm2320992e87.63.2024.09.13.07.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 07:19:33 -0700 (PDT)
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
X-Inumbo-ID: 33c862f6-71db-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726237175; x=1726841975; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jt4AxGjtzrVIc8XkGo67Tp32S/QxtxCD2FZNP96mDp4=;
        b=e9KAx3JSnWNNgdVIZI1OTYWAquuEl7n8W9JA/CpRIe3t59wdcCT1AN7xLg+/DHQKY4
         sgdEb2f2AAP8NA32Dso+6NNSVpsJ7QViB803qK/mccNloCjVYAM8v/uCoPIS8aTavBQm
         DAPs+jb3ss3M249xTvuJXabdAulDL5XG+Est30B7OW+8y1aJMDO71ySafNxPIpW9pkFZ
         yLSazMKpDlYtx9Dlum3TjKaZK7sqQbEyLr2upY4NUEVSbmGC+oZM68r6HEOpm9g9L+H+
         dPwbiTbsCqQeefDVdUIOrT0fdTI3Imzs2ZJaAYmbTnwtCnmntWFZkAP5uu0tmfWX0GEa
         +/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726237175; x=1726841975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jt4AxGjtzrVIc8XkGo67Tp32S/QxtxCD2FZNP96mDp4=;
        b=TOmU6r3sIMVU4W8OjN7iYzX3orgnufufHehd8YIBNpdXCuiHTgQDKF9gXMErYCnx69
         6Egzq/41ZnLRrqmBUbU52jYxJLjMSOAPQKsnzIVnbjYmLwBVUuMo+iWqAF6nPnzwZuwM
         VSjh0X8pSwRZUDnVtG9AMWxobmqni1qwVRK3mjiUpq9bmXFhVzqzuPzBiuaBPqTepW67
         KLhbu7BEQd5QA6/yusxMgLr9apfhJLCSap3pG8IiTlhNTLwdyqYz/L9d+ogGWMLYFw/w
         /fxSwb6FHb5MhtwyIQYEfp6guagwaPOHFaxzUn59WnVhzcKn99AT4YC86+XknF4YrqyV
         w3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXsrLiRzn15IC0XwGmyyqhHppk9SUBB9VItcF6XD654ANETSDcLVapmzphcJyffyG46jM1XJ5OHd1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq5H8C22CF3JaZndYWxRoNnS00XRaJGlshEhDyH+OX1S+/Fz2y
	2+Z8cma+neUqzwhSk7MyqxozxdhfS7r2EQ1BPnoMGtDg0g5aOucv
X-Google-Smtp-Source: AGHT+IFSMjmP4abKDuqNFxUkOC+TDkuPmw05U2Ito+zoFSR7qDUL49NEADtflb3118GQfCXL4oNFJA==
X-Received: by 2002:a05:6512:1052:b0:533:508f:edf1 with SMTP id 2adb3069b0e04-53678ff4e66mr3481398e87.60.1726237173601;
        Fri, 13 Sep 2024 07:19:33 -0700 (PDT)
Message-ID: <ac1317a18ddc993a5fc926a8d25feb39c5349662.camel@gmail.com>
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
From: oleksii.kurochko@gmail.com
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Andrew Cooper
	 <andrew.cooper3@citrix.com>
Date: Fri, 13 Sep 2024 16:19:32 +0200
In-Reply-To: <20240912132347.28756-1-roger.pau@citrix.com>
References: <20240912132347.28756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-09-12 at 15:23 +0200, Roger Pau Monne wrote:
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
LGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> =C2=A0CHANGELOG.md | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 26e7d8dd2ac4..8864ea7eafad 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,7 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0### Changed
> =C2=A0 - On x86:
> =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run time =
service
> call.
> + - Fixed blkif protocol specification for sector sizes different
> than 512b.
> =C2=A0
> =C2=A0### Added
> =C2=A0


