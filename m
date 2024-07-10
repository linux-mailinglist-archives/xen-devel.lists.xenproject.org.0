Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C36892D039
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756804.1165557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVCx-0006LZ-Nj; Wed, 10 Jul 2024 11:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756804.1165557; Wed, 10 Jul 2024 11:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVCx-0006Jh-KE; Wed, 10 Jul 2024 11:09:59 +0000
Received: by outflank-mailman (input) for mailman id 756804;
 Wed, 10 Jul 2024 11:09:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcuT=OK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRVCw-0006Jb-Ve
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:09:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0cca698-3eac-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:09:56 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so1096313a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 04:09:56 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc719sm152705666b.13.2024.07.10.04.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 04:09:55 -0700 (PDT)
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
X-Inumbo-ID: f0cca698-3eac-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720609796; x=1721214596; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NaJygtshhgBHjRH7wVOuVQ3e38dgXp5Z2LojDwxntc=;
        b=CxEGUzsqFEZxmrQDeQ3Z36/EAeA/oTlrX4WOXJaSN1r6tLvYgRI4ilVPUjl+LN92EY
         v69ekvgYuXHeLKW1G/bE8iGZ6SpGzykyvt+FrtfGCagsOW6ve2uoxrYNnmcFDeyTgl+2
         9CTHqPM+3ed6FBYqD2MAC1KYwxRyMvziFYlps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609796; x=1721214596;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NaJygtshhgBHjRH7wVOuVQ3e38dgXp5Z2LojDwxntc=;
        b=QRzjYU2QCtpnPl6paPsMgHDkR+FuNiatadBEvl7o9jyuqPilCFU+Y659k26C4bW3cH
         MR56f7FuNGizvr17uXcZTwv4K1fKTKa9HzODcLg62uIFLu2dnbzHtCP0SAE1f36BPXbk
         h7uUnDfq7NNalMkB3OhzUTuABjkahjpELXLL8bd3r4/C/JxP25XB/6cGM++FFBRmt8vJ
         ADGVg4eF0bEWLXM/QBfo5Iumwm5ec9EoOUTkkSzFBoYvN6IOFP613YniFNq/fUgsk3VR
         07fde4lnPRayQiN7eEEsKUqst4YTSb48jHkmkVBKEvS4qSePwDocne3KlT3zudnZ2oU7
         gEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFIlyfo3XbYBK4AK/YKnPhWv3xpXbqZWTo+syI24sE0Rv2hmv0JGTiHjKLplDsRGxilAC09f01BP0A00MFPhIgNxv+I4zhUTXRumRqI50=
X-Gm-Message-State: AOJu0YxvpXSwklbAdamAA6i9XeR2iPz/rEQjg6NJaASqZg5MB42cJmbj
	0ypnPcq9kjMtaocOwnfNnOH0cL6kyiv538JOdvinrVT121qvVhtMYfvwhMiUHk0=
X-Google-Smtp-Source: AGHT+IHjrIby3ou041jTjwlRnf/JkMEWsIgcSvWSEfn+axNxQS0htXiiRMMkzHT0GWIr6cBDDgUsog==
X-Received: by 2002:a17:906:b0c:b0:a72:75a5:bb42 with SMTP id a640c23a62f3a-a780d28ed3fmr332415566b.29.1720609796278;
        Wed, 10 Jul 2024 04:09:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jul 2024 12:09:53 +0100
Message-Id: <D2LT9N7YHPNZ.3T00VMT94G20E@cloud.com>
Cc: "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20 v2] automation: Use a different ImageBuilder
 repository URL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240710093751.25154-1-michal.orzel@amd.com>
In-Reply-To: <20240710093751.25154-1-michal.orzel@amd.com>

On Wed Jul 10, 2024 at 10:37 AM BST, Michal Orzel wrote:
> Switch to using https://gitlab.com/xen-project/imagebuilder.git which
> should be considered official ImageBuilder repo.
>
> Take the opportunity to truncate the git history when cloning using
> --depth 1.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v2:
>  - truncate history when cloning
> ---
>  automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
>  automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

lgtm,

Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

