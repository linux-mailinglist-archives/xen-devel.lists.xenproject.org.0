Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABdvGsYqymmQ5wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:48:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032053569F9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267253.1556787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Kz-0005tX-I4; Mon, 30 Mar 2026 07:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267253.1556787; Mon, 30 Mar 2026 07:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Kz-0005qc-FJ; Mon, 30 Mar 2026 07:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1267253;
 Mon, 30 Mar 2026 07:47:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w77Ky-0005qW-3N
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 07:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77Kv-00ACgL-0H
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:47:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca2a74-e002-0a2a0a5209dd-0a2a4502d174-6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:47:02 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca2a76-63bb-0a2a45020019-d155802ee815-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:47:02 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso40507155e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 00:47:02 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c95041sm242110645e9.6.2026.03.30.00.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 00:47:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774856822; x=1775461622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8YfyAv+OiHKmh8cOjSKiL7chdcEdvllKRsxAnC59Pg=;
        b=Vs8P9eWsa0JPD5Amlc9TKp3GWH4jQrqf4VRpv2b+q2v2+RFDz4F0O3tTBP/Grz9+Gb
         OP+wIi54bYltMLAr6v5NTEum7M9dI1qRBGrvCiqnVVNNeM28vDcp4dhNCDOdTrLsxWE7
         v8WT8ErQ5MlL1Y/aow30zfo9M9AAo72Og7FbH66TX8aR1w5JVZBYJXfMzF6jkLA9Pv+A
         1vCiEU1SukyKb+Ol9Fvow+802vS7jmPT/AnVoY1OO6StzuHYaxyWFJl6nhrN6GK3jsrv
         VvYd6HpbrMQMumi+30xQrR6ZEaSBQMNj58Mm0D90ZSsJY+GZaOE2cJAJhB9WQUjeW+GH
         Q1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856822; x=1775461622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8YfyAv+OiHKmh8cOjSKiL7chdcEdvllKRsxAnC59Pg=;
        b=cvMuzGTLTZD2ORStCyn1ANjR6qdlf4uC3L+5VNYysr3XZgooacIPSG321FKmlUEoV3
         1gOCfSTm92Q+XctmOT0dIksMolHySYuWhTfbUWEUN3QyzmFwmWs72OzDKt8GEqugm5OV
         131+4Oqv0Mn2BVEV+YLEC1x8VNeAfxFku1Pwutgm00b7ZN0mwhFp4Kf9/9gV/AYBi8WS
         044rgQBPO0ukyUubVN1x7sHb6J56Y3qcL6hwhIffzeCga5OGkrySNuDyO80VbheGdxlP
         B9hTlelM3FVbibTTNTgKEUedVUbqEP2iv8jT+zzrZkn1G7ntm9Z5B2e7kQ2OvUiJJNyF
         nw7g==
X-Forwarded-Encrypted: i=1; AJvYcCU9vNRm0GZZj3ERbXFiIfXp00nmEwP7ovsgSVCZcKtEcUO5jpiDlPa9cLBiP2TH9snze9Z3HkhS8hE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDfjkhMvaMNUI2DLYOODEih0yDnyyfdXnYPBCoKUUS/n44yxe6
	9imjHV9SXUHmMxsMs/2oF0Yy+IhU+v6xFOwnIB0OlIl0gk8mtN2J5DPF
X-Gm-Gg: ATEYQzz+tAqcLqp03pStWE7YsBJbkbNxwhe7zSx7e2GPMO390mbW6iicRHPvCHAHArd
	ElTH1BpuEXpZqqszr5loCgp926d4/x0VlDsSnCRI4eMTgaurjh9fvl0yyWeSOdWtpkFhDXAQQzd
	XBtaGzaib/qORm4THad2HM+rerJ8Uw7926X8g05H7H/9OwSoHGZ0i/L5w1s+Hl09AMC+q0e9y+K
	AR0bhHqBk8K2iqozi2uS/Y3FCaY+TIcOjaWaP9/hFLuqa2D3iXKRiGdv/RyLDBBjGUExchiNXdJ
	MdeabQl8047J6lGJhuAADscgyOMy7PZrzkDgWxf3cyNVeGywKvHY9dzRc+OJVE3ZHa+Wgv0sipC
	rW8SQoivicwe9njrB7XlvFHvG9Zz8714UFbBduSA9k0EmcMWdPka7iF8SDuFGXzBo2YojeBtxTL
	2PT2BmPa2eibdXLRX8Q4z8s2dVb7JAsRhGetaO6Kgfg4IpCxoJUf7QyEQRwPGeEU9bSmjDAR083
	K7BaqP+cDTo/A==
X-Received: by 2002:a05:600c:c178:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48727ef16bamr191648535e9.27.1774856821431;
        Mon, 30 Mar 2026 00:47:01 -0700 (PDT)
Message-ID: <cf43e50b-d7d6-4578-abf7-f93c69ca7ead@gmail.com>
Date: Mon, 30 Mar 2026 09:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add xenstore quota support
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20260327152103.438997-1-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260327152103.438997-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774856822-42885DB8-2A477CD6/0/0
X-purgate-type: clean
X-purgate-size: 808
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
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,changelog.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 032053569F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/26 4:21 PM, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c191e504ab..566fe510c5 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Changed
>   
>   ### Added
> + - Support of per-domain Xenstore quota in C xenstored (includes
> +   xenstore-stubdom), libxl and xl.
>    - On x86:
>      - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xen to
>        mitigate (by rate-limiting) the system wide impact of an HVM guest

LGTM: Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

