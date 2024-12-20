Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1F9F8DF4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861699.1273766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYM3-0007vC-4o; Fri, 20 Dec 2024 08:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861699.1273766; Fri, 20 Dec 2024 08:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYM3-0007sk-1V; Fri, 20 Dec 2024 08:27:27 +0000
Received: by outflank-mailman (input) for mailman id 861699;
 Fri, 20 Dec 2024 08:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5TkR=TN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tOYM1-0007se-Td
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:27:26 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d044658-beac-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 09:27:24 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so1944861e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 00:27:24 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238216ffsm406145e87.209.2024.12.20.00.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 00:27:22 -0800 (PST)
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
X-Inumbo-ID: 3d044658-beac-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734683243; x=1735288043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+g8j/yNIC3Ej+QWktUVcZXAr/OOGVXyE4CaI5JDFJms=;
        b=GkHxpA5WJyV1dtanQL38nXzQzagFuSp3r3ZCLvudPUylrHnHt+T4hXPPpX+7j/TDSU
         4Ap+1LqU5N1k4AlTaqqRfCKcnVIi3FFSGZRmuGDzf1TaBqzG63EXC1aXcBoF4ARwTkl9
         /ivPEZUwEWkUh6x+yimgeAgxO1ZDWox6CglqTY8wcHPAktLNbdVDfNHNv2j03EBQ0WxV
         2H1sZ8bbNxxMqkA3MfczTUZAw93YaWQVmmBbsNxOQ4JuClhShEr1h0xUGh7WeJx9a8EN
         ATUaLVMY7+OJMURt7/eJG1U/NzDORRuLhAVBw3/XvAu6qqmRlJvNT9TaMqaq34KpJFHe
         5lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683243; x=1735288043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g8j/yNIC3Ej+QWktUVcZXAr/OOGVXyE4CaI5JDFJms=;
        b=UJtqi7815KREUH9gqkRpn/zukN3KWHeo9x9yQksEp6vzwu9XA9qQYkUD8xVeSNEZgL
         nHcUheqCrrCRAf0sKkDq4yQ+oNcY2KUL7DOrwVEVa1F1SsX4Wc/VPHQfclPu8uE363cz
         b5lhSy/VVOXeQBYUsWaKeRfMMZZt076f/R7C/l5nFlDtw0oaXWg6eZQWUYQayIa0JLX3
         Hg/r8JqKPoiXR73AiJnd+DauU7HF19tpYi4K32qykIIKTrb4+nOKI5nxHVv803mKZz3W
         X6u7f2LCxP97nXZvU7N5mbKz7SRLQcZV4z92JII/I994uZmnDnnIi9tTe9DhEWFOj3NI
         DCsg==
X-Forwarded-Encrypted: i=1; AJvYcCUiwD17MyHjYzpc+RhoqGBryKXuKA9Ze71mDlufjSeGbKPimDjRAiBmj3cs04eylMGf9kjOMJhQYXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNDk2epMTHj7pa/GSrfqqWmGISxBJkJFW9YRWe7XQwdlRRSNVw
	o5Kc1WrxoVUmQOpiufF5LTaqBJPYqLp962PBJgBfHxj7DLn33hvH
X-Gm-Gg: ASbGncsA4mWLyRi1c+gYmpwZEI6LWvD/+MavpNqFLhWOiuYsRZ1ghpKK24SLDgbJf3H
	stQAj8dx2DLRW/N9trzdkjcPzS/CZ9SjlEH+qbEI9nCdQm133pgm+PLj6EG/4+PiOHtuAG8EIIX
	gQLCTQ2g/o1SeYJNDjtRAW1oE+K4m95fklTn1Yq4igQUNZwE6X+kR8ylM84apVbnO6be9ku2XtA
	S1PmFPFfUc6V7bhPVQnqmHSSGw/0ISpIlXCw9VzJnPedgVztpx/NcDOw81Mz7bT37uLKQ==
X-Google-Smtp-Source: AGHT+IFnMzDMq7dkcD5KzBUoya9u+7oxp1nZQe2rogPWFf3lnl0/hfFvTmS4rgyXGbjyVgwGKsuY2w==
X-Received: by 2002:a05:6512:ba3:b0:540:2542:d89a with SMTP id 2adb3069b0e04-5422959cf51mr469517e87.52.1734683243046;
        Fri, 20 Dec 2024 00:27:23 -0800 (PST)
Message-ID: <ec7a20f0-b30f-4381-bcb2-038fbd49b222@gmail.com>
Date: Fri, 20 Dec 2024 09:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: Mention LLC coloring feature on Arm
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
 Community Manager <community.manager@xenproject.org>
References: <20241220081940.7954-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241220081940.7954-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/24 9:19 AM, Michal Orzel wrote:
> It's definitely worth mentioning as one of the most notable feature on
> Arm this release.

Totally agree with that.

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Thanks.


~ Oleksii

>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index fe6c4cf9432e..8507e6556a56 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
>      - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
>        forwarding the calls to EL3 FW if coming from hwdom.
> +   - Support for LLC (Last Level Cache) coloring.
>    - On x86:
>      - xl suspend/resume subcommands.
>   

