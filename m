Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHNnGIoj62muIwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:02:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4045B0B9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293240.1571085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGBTW-0005r8-B1; Fri, 24 Apr 2026 08:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293240.1571085; Fri, 24 Apr 2026 08:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGBTW-0005o6-7q; Fri, 24 Apr 2026 08:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1293240;
 Fri, 24 Apr 2026 08:01:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wGBTV-0005o0-4n
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:01:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGBTS-003vQi-W9
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 10:01:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb234a-2eae-0a2a0a5409dd-0a2a4505e1a4-48
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:01:20 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb2350-aaa8-0a2a45050019-d155a72cd160-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:01:20 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a283c44478so12791903e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 01:01:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc274sm5839038e87.21.2026.04.24.01.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 01:01:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017680; x=1777622480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMqhxigLtjQydo7ejUuee05jkCh2bpHr5rm+RUIgjwQ=;
        b=dI4zn78jGtlf3Slj5XZ9CgOHnSfdUYNezv90GhB8raikx3dM9SZB00EEaxjflQy+Za
         z92XhmD3W3Cc5qEnb86s6mtCVAsT12Yc8r2ImpYDFAQotz0lMz98YiPgsmdJQbtrBaNc
         oL0aLoPKqvcxAIP4cc1GeSKUCBU+HSyBA8/bwXDwXXTqtz5g7EUbQO2Z/HI5pFIxmYRE
         Ji4IgHLkTQ4+i8Enn54TwA4x4raTRbvnB8Z/QcRTClqOivJSKbbENl9rj+BtQDm1XPb8
         TZsSqFm/V/WfpszouJZFmoQUxaRlYWcvc9ATTwO/LUFD7tOoXv7rl1k6W4WWIJaXhzRF
         JwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017680; x=1777622480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMqhxigLtjQydo7ejUuee05jkCh2bpHr5rm+RUIgjwQ=;
        b=NhYV/QBX/6aY4FYSxa6zCbC6XImMryYYiKYJqwdLJZtPx5S//ZvbBjpSRPYQIsMNCh
         vkuK0AJsp/32v4o48QVYBLaQTe+E23++EiIWF/CC1S0quoITLH0fK4GAYIMXhVMG7iQk
         aCxDmc0fDCv0SwSl3ZJQ35RCL/XIiZ4cynKbPm4SWhXGKG6BnueYa9+wo8XDHFhhcbLT
         +xW44TzgsIFlY/RkqxaerAHIpW+/Ji6DkwVLYbG5oV4QTLdNZaRyDmdtIa7enZxIMmxm
         Rn/WWYcWg7b5MVVfchbSFcEAh/fjQi7hLkGePGM/zWChiMi1Y/GoC9ZZUO1jjvDkRHaC
         3J5g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZZVuprTJmY1RXMC/sAAKy4/OrvBCd0NTm5SRECX9LYiNgG5yMWfDm7oE1ViDBmh4x2NQHhOSl4Fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxzje6tCymzyqYsTLPmwpcbGfNh51cDtuofT6JP9SSDtAXdJy+i
	motdkEfDb/hD9ifKmIWIlXH4mI8OpWZz9X74EFfb7W2EHi8Tv6nmIpanCbFgTg==
X-Gm-Gg: AeBDietOMEZQkq6uXGBPLu1WqZaG6uJpTBXveKynjg6omoaL/Yh3sSM8J/tOKhVM8dk
	LDpEB3RWCgOxmmzC8GlCKFpooCMD/k16i7I81tfWq7y3VNUzF0LGc4kUC5JdmGXdKQZ5cq5Lbj8
	T0AS29VA8ywQ8CblqUP33Qi9lPd5zY6kzIOLTO7xfWXKq9szE+D9FjOGfmoZ4XPO0DRJualf2Gp
	JckKw7ie4/hn2l+SWdCGZwrGFCTSCqS3v/yjwQ4xAab2CJfKBRt0MyYV5Atrh6vJGS4RWfITF6L
	He3OSj7LKC9b5CE5rGIGwhQTQHqjXt0H7M+LKjAoBt2WiVtNv/MLf0KAFl9f1OitxltOx3ZLGCB
	Duxot1tDw46wY2gLLujVUSF7Tk3aMrEEQiPCQDETFVNBe0zqzUjRDrmS6lqZ8vZ1vdtkhqyxL24
	JbMie9fe64N6gLlIz1VoLOZRzabdOdIabvZR3rmA20v5Tgsx7KEW/Lnm63Z/Wcrc70jjEEK6tjR
	Rm1LVviIazawA==
X-Received: by 2002:a05:6512:ad1:b0:5a4:1133:c305 with SMTP id 2adb3069b0e04-5a4172daa96mr9274802e87.26.1777017679189;
        Fri, 24 Apr 2026 01:01:19 -0700 (PDT)
Message-ID: <8fc5563e-9033-44cc-95d5-2bf9b89b01dd@gmail.com>
Date: Fri, 24 Apr 2026 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add xenstored watch depth feature
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20260423160714.566313-1-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260423160714.566313-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1777017680-E95A7443-AC0616D6/10/73395122804
X-purgate-type: spam
X-purgate-size: 883
X-Rspamd-Queue-Id: E5A4045B0B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,keepachangelog.com:url]



On 4/23/26 6:07 PM, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index bb41d89997..ce46020dbd 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Added
>    - Support for per-domain Xenstore quota in C xenstored (includes
>      xenstore-stubdom), libxl and xl.
> + - Support for Xenstore watch depth feature in C xenstored (includes
> +   xenstore-stubdom).
>    - On x86:
>      - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xen to
>        mitigate (by rate-limiting) the system wide impact of an HVM guest

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

