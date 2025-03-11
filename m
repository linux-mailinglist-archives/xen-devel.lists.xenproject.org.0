Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCDCA5CB25
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908794.1315878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2nw-00032h-NY; Tue, 11 Mar 2025 16:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908794.1315878; Tue, 11 Mar 2025 16:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2nw-0002zc-Kq; Tue, 11 Mar 2025 16:50:08 +0000
Received: by outflank-mailman (input) for mailman id 908794;
 Tue, 11 Mar 2025 16:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts2Ct-0007gU-8F
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:11:51 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89a9ddcf-fe93-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:11:49 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac27cb35309so512166566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:11:49 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23943c440sm950636566b.15.2025.03.11.09.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 09:11:48 -0700 (PDT)
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
X-Inumbo-ID: 89a9ddcf-fe93-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709509; x=1742314309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfv6IeyBk7vuW3v0wmc2EBgHSmlk4Z7X15EWmQ8dG0g=;
        b=NLKijRXzLgGhnhXdSpE2A5Q9bjR1Go94Pm18D+mVHl8ofQC4CT4ZF2g9odncWMAmCM
         mSwMD0/FL43nGj2Z4DMSqSgMCQq34l91M/ydjHD/iBO/ju6TAgrHcuualPtNI/urdSdV
         6n1OprCQtULrWgtgMpx09o/yD/bEwWkdT1sBi81l0ulkQjY2ZTf0LjNWJfU+eFLf+e9C
         h1AJhST3zgxQRoSCehsSzxn66pZWVeRz+hPGjGDnZnu6BnQbyKZizKXUFOw6E6IFBc+C
         97OMnkVS49JF6SQPZq40q8FqW6S37jwTl/+sCUG2y/fpVvym0CGOIAghAeMVuo9vcy75
         qTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709509; x=1742314309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfv6IeyBk7vuW3v0wmc2EBgHSmlk4Z7X15EWmQ8dG0g=;
        b=n5wnQ/8lTfZvUwMbtm+bgXSkBQPAqRD6YOzrhULZe/VcApgOeb7db80Pq7Bx6OJ8Ly
         AOki5ilPo/3r8VWFIk9RNXcmsCjuugmbyKYyf1fcUSZsMveZV/mSvwguzl2wng1+BMWW
         JHDJD4YhrDhmXK5WggHyNKRET0wPXJEfap2eu4ZUmV6VJAJRHVXgXaOTKnK0BTn0aCFn
         rc/QK3M5nGeUMneBoIWfrVqXgN26nCblsSk58Wpe4gUHkJ4Tzk5OcU/DPl5QeqfYoSio
         owBCLdqa03qfhIvi4tIBTwT7cRND0xPJWweeN8BtIHodfPXToPUfUlKSls2R9JIZlKiL
         AaxA==
X-Forwarded-Encrypted: i=1; AJvYcCUK6DMHSSDl9gn82VT/lXLkx+ple5j73l4b1o4/9mlWl7G7bjzULkBs5qrdFPI9upBcUg3aYvwOC/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy69AnXVG9YOzzZUbVZi+w71ryHyaSujShLn5NcCKIxacXkmuFM
	UBkXQutP28RVaCq+LA7vgeRr7sWNY6dFKdBq/8phO39gC/paeGKVXNiuVw==
X-Gm-Gg: ASbGncsdUrYnZ/e5oGNIL1JnLlgAzx5ObO93WLsm6M2zeo1Atq9E0L/NufdyYwJrHlE
	hdowGscmu+w88NIHM7CicKFvDVftYidPufiYB1tgQipwV3ORLRaxJSoUw3KSHM0x5+kjbLKaMxe
	jAaeTtfhGEydLLyzov6OZGOMdGAyAeYk+aQBNnonJ5zfQ7Q9RWYTnkYFDTg/7S9huBm44xAii5L
	TqawPf2QK3dCCcLpSnAX+0gGSP8tkprsXjYtmEAt7tzDn9oNY5C1fdoAJ6epp4MeNkt1uJhxKnS
	mTWIGxNhYhRqdzYhleM1kqs3wc7s04ERd4y2piCarJtq4zdGBivuxhp+lZMeJslOKmPz/RncSg7
	rI/xeqnUcv4eWkz5TP7hW
X-Google-Smtp-Source: AGHT+IHn8SSbO7qJN5jDNDMVCXE3OPSV7wREg7noWOhAWLUFyo2LtPWVMGLrutRV1VbRKFuNMXy8BQ==
X-Received: by 2002:a17:907:d8f:b0:ac2:92df:fab3 with SMTP id a640c23a62f3a-ac2b9de4fbemr606821966b.16.1741709508738;
        Tue, 11 Mar 2025 09:11:48 -0700 (PDT)
Message-ID: <0ceda9aa-4e11-4a02-8f60-ea9d1247acf1@gmail.com>
Date: Tue, 11 Mar 2025 17:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] CHANGELOG.md: Mention stack-protector feature
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
 <20250217024848.3059635-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250217024848.3059635-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/17/25 3:49 AM, Volodymyr Babchuk wrote:
> Stack protector is meant to be enabled on all architectures, but
> currently it is tested (and enabled) only on ARM, so mention it in ARM
> section.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> ---
>
> TODO: If this patch will not make into 4.20 - rework it by mentioning
> a correct version.
>
> Changes in v6:
>
>   - Dropped Andrew's R-b tag because there is little chance that this
>   series will be included in 4.20, so this patch should be reworked for
>   4.21
> ---
>   CHANGELOG.md | 1 +

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1de1d1eca1..4cac4079f0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
>        forwarding the calls to EL3 FW if coming from hwdom.
>      - Support for LLC (Last Level Cache) coloring.
> +   - Ability to enable stack protector
>    - On x86:
>      - xl suspend/resume subcommands.
>      - `wallclock` command line option to select time source.

