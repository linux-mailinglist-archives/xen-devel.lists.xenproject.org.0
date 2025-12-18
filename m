Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E024CCB344
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 10:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189375.1510148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWASG-0004K8-7Z; Thu, 18 Dec 2025 09:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189375.1510148; Thu, 18 Dec 2025 09:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWASG-0004Hv-4T; Thu, 18 Dec 2025 09:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1189375;
 Thu, 18 Dec 2025 09:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWASE-0004Hm-KL
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 09:37:50 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ccd229-dbf5-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 10:37:48 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so740135a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 01:37:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b588b0b3asm1997714a12.35.2025.12.18.01.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 01:37:47 -0800 (PST)
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
X-Inumbo-ID: 36ccd229-dbf5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050667; x=1766655467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2vf34F7y//sajh7ViQUwq0NB6wa9GyQUR15mIECzrk=;
        b=NP8bn5//hUBSGsNfIvlEBq1thJYd8X/RQ0gc1N2vNISxWmIxBCOPYxjN/2ApGgF0Lm
         tiEhI0mPVlpbyZAMY0CXG1Dx5qVPzALygVIZ4FWc0LsDaDx/hyLa6yYOdJGtKh5UUZkJ
         S+3VpFb/d0HBV0D10bKqhDnW+V3bYEJE6H98G/26/+iFK9qAV5L44BYPzmXriRXvT4VI
         PggSAjafkxHxZqYg8GTVZy/89MB+gTEl0vVzB8xdEc5twxOR2OYApPdDe9sjeA2KZBux
         Z31g7Q4oCUYY77pA+zp6IyaCe2AL7/STZA66dYPjwb1gb0t6z710r5T1KkEaA3owNTK9
         Ef7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050667; x=1766655467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2vf34F7y//sajh7ViQUwq0NB6wa9GyQUR15mIECzrk=;
        b=D7rB6H4rt59m/fQ/uEDNW1zV8d3y1yRVRRPHSb7UXvykZMtbMKArbGkkQNv1N4BoEZ
         TyYmNtLOLZLGa92l/1JBGtOJ3ouxqJ8lvgAJKCidusxqlW9dcqbBWTqPwP13KJbi7Eg6
         yeqHR4jRz5aVPcJkV1dRXU9hZphdmPvw9h/SX+MJmiqL8kFIM7bsHWcFTaBxFK4wcC9u
         MZBQOo62aWu7egX1vmeJ2LR31VLWp+sGVImzu95/n+ZvXKaBSdyuS7ZbkkadOB38DlLM
         fiYizbf84ibX6dzDT32ouUCLDWEAcM0PsqoqGkCwytdjuds8JBWvHNmeOO5EnhnWP+Tf
         4/fg==
X-Forwarded-Encrypted: i=1; AJvYcCUXSNUBLr+bCRym4PwGH0PR9fzUdI+UCQnzA/Gku7EyMfuXlRTvf8RmkNO6/pxB0E/7uA/HGlKeVZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNG9hT1J81FVBegnoaJvOpRpOo/ElqTBbnGyue34wPa/ljrI4a
	3+yS3uBclteTNGsopCDxaUYrJkRv1/xEcdgCtFMtiRyenQV1xrRLgVme
X-Gm-Gg: AY/fxX7NoeF6oUWfL8Ixfe/nWbUhyuYgZB1csh2KPcJChA1pd3SMyD6/8i9HJE4/i3q
	0UtMId4RnfzZH4CFAJ7ndbmWH9kL7J95YR9HWXSz/OwwWWUrYeohdlOm1/D+jA5+cYebFYnSmGA
	fVFS3nlF0M8R9gu2ho9OPlosQ4K+F7CknI94J7KgYtoopwK2+UZy99FuPpwFR7d/cuEENGZIFgh
	jp1KfZJ16P/ytY6Pq1QIeo+bUpw4SGx2QvISes0D3c+S4EnC2Qh8uA+hjYVrvImVdl6M1iBtqod
	V5qIiAkYzjSYWAgJ1dfIHKK0OHda6i/EMla/SzaziCkIHOG5YODitajpPozg2K8Tgrp5knC5jPK
	VgskYrNshATvmNTNdNZGl6DOgHPwszAxS1MMvAFLJLK/6iZeodbPy9Ehpe2vKn3diScnZZR+rKV
	bn7UykO0Q76fbf2oPDycVWapOgVsPa1q67Xs+rQUmRYs0Fr/4KjfLEEqGLFGI1uXnU
X-Google-Smtp-Source: AGHT+IESdw4MrbfMzZELfE5T/PnKm2eW+SWty7iyNS66373LHYaVkny9ReFLSxwkCMUOe5d1fFALOA==
X-Received: by 2002:a05:6402:4407:b0:64b:4333:1ece with SMTP id 4fb4d7f45d1cf-64b433321ccmr4581574a12.34.1766050667338;
        Thu, 18 Dec 2025 01:37:47 -0800 (PST)
Message-ID: <a4bc524b-a2d1-47d7-8ffa-b4af3cb5315e@gmail.com>
Date: Thu, 18 Dec 2025 10:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Support for Intel temperature sensors (DTS)
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1765300623.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1765300623.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/25 6:19 PM, Teddy Astie wrote:
> The idea here is to expose the DTS sensors through XENPF_resource_op
> and expose it for the user through xenpm.

If this is something exposed to users, I think we should update the CHANGELOG.

Thanks.

~ Oleksii

>
> v3:
>   - use msr-index.h instead of adding defines to MSRs in xenpm
>
> v2:
>   - moved userland part to xenpm
>   - use cpu policy infrastructure instead of inline cpuid
>
> Teddy Astie (3):
>    x86/cpu-policy: Infrastructure for CPUID leaf 0x6
>    x86/platform: Expose DTS sensors MSR
>    xenpm: Add get-intel-temp subcommand
>
>   tools/misc/xenpm.c                   | 91 +++++++++++++++++++++++++++-
>   xen/arch/x86/include/asm/msr-index.h |  3 +
>   xen/arch/x86/platform_hypercall.c    |  6 ++
>   xen/include/xen/lib/x86/cpu-policy.h | 27 ++++++++-
>   4 files changed, 125 insertions(+), 2 deletions(-)
>

