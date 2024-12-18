Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9679F638F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860241.1272292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrUr-0002Ef-3u; Wed, 18 Dec 2024 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860241.1272292; Wed, 18 Dec 2024 10:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrUr-0002Cw-17; Wed, 18 Dec 2024 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 860241;
 Wed, 18 Dec 2024 10:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIsi=TL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNrUp-0002AG-Ce
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:41:39 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85f2961-bd2c-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:41:37 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-303489e8775so41144651fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 02:41:37 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30343ea133esm15583311fa.0.2024.12.18.02.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:41:36 -0800 (PST)
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
X-Inumbo-ID: a85f2961-bd2c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734518497; x=1735123297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIy474pgaZwdFN57z4t1lxSVi4NdufFWtGZHQvKna7I=;
        b=eBfX3qso4M+c7bQ7lGailxMtURdzN0U5IcxZ1O//51n9hMc63RlFXkLdjrhxSjVG8t
         VarXoyIQ7t8ho4VuF9JytUgX7bXklJ9HebhIQf7NsicV71macv6Jo60jRJLbU2ongj3P
         ji72hoGVMRRJoFpXbvMRXWPKeqNjs+gI9oysW6IvSqrLBNVU9jyP6jURtH1H7sViE1Ed
         sJOjis8f4KS/IK+qjr2d+xZqy8T9GSMl2B3ht7oCTYXWhWHd6g8S3lCFPVp3yzgpFWjK
         1R0AYgD615FHvtRTgbMU3ymNZxABAdA8F5HaszFv9dCrmjMOi2NSPWQ+NnAqYczH7RUM
         znXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734518497; x=1735123297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIy474pgaZwdFN57z4t1lxSVi4NdufFWtGZHQvKna7I=;
        b=gHu4uD7pl7JllD1WDqMZlqYqBJPI9x5nTPypgIlQzdYpG37J9tdcCiqRNH1DgwC6Zm
         668qy1CRwlaqALK7PjViWpHaV/mmrKDh02eEHoMvbhJXJgYoQba4agCBSEPMptwGdd3N
         P39D9CFqDdBL+3dpmI3Gv3QNeqiLCM4PzSQu4xo2dBRlumX37AIVibDHC0envTsLxib0
         vLd7CMPg+Cy+Q0Bn+CEKSYdasl3O1geQcy8ybBHXlqKu0TMGu7Tb9WDDlUJDNhQZogXP
         fpRCwCI4aW//m8CgXRpX14Uf8D+Y/rnvtursBCRbixy1OTxf0DcgDKu4qG+M1taXS40g
         5b8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJJHSMbHzqkbXFFdfJKZClzUrJ2At03GpkJBuX0VCCfFlKVkEU0FMcI4t1EiiYQiSyE149LpXOOec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtmHEb7Mo0zc0kak52gYX4SnvoyauUDt/xDBIL6sUfX9gKOtDM
	IO5xVqxqrqcQnuJYi+RniX1PNWyfT7U9tvi2OsllscF1jRk3AMXSzPmcjuaF
X-Gm-Gg: ASbGncsWEpKwWOHK+PLRC4c7+4wQb+gCPdSKX8NTx40lp4v7ni3sCTnfcY6lv8u8d1v
	I9Xk7q3ZCu1MqEf3rdFBxpFS2bH22Qi+6k4IDh+/hPKPfZhheUrzHdmQ5IHX70FAcz/+44a6Gv3
	q3pmVNUivBWmWZ1tHg7UtOCP4qul/K1Fxzy38nkHNvCzLBTT0L/mYQGtUo7v+uN/21occ1SSUgA
	r5FAaYaJJA9ZjeYFkJF5to7vy7QQRd9Mq8rhjsYAS91OjCvTI/RA+bdWQfMhE123dYamA==
X-Google-Smtp-Source: AGHT+IGQNxnwQ5uviSEP8/LRr2Xzl9a01p6tFroaZFQQTStWEfHHkCbza4zytC/51ZkOhXRyPgIZyw==
X-Received: by 2002:a05:651c:154a:b0:302:3356:7751 with SMTP id 38308e7fff4ca-3044db51faamr7203951fa.40.1734518496661;
        Wed, 18 Dec 2024 02:41:36 -0800 (PST)
Message-ID: <51d71dc5-8adc-4382-8218-ab4ee3061d78@gmail.com>
Date: Wed, 18 Dec 2024 11:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer
 support mentions
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Community Manager <community.manager@xenproject.org>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-5-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241218101142.1552618-5-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/24 11:11 AM, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
>   CHANGELOG.md | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 15f681459f..bda43b1efb 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Added
>    - On Arm:
>      - Experimental support for Armv8-R.
> +   - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
> +   - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
> +     forwarding the calls to EL3 FW if coming from hwdom.
>    - On x86:
>      - xl suspend/resume subcommands.
>   

