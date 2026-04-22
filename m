Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLj6H13P6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:38:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8080446D54
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290575.1570139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXmR-0004fQ-Au; Wed, 22 Apr 2026 13:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290575.1570139; Wed, 22 Apr 2026 13:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXmR-0004de-7x; Wed, 22 Apr 2026 13:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1290575;
 Wed, 22 Apr 2026 13:38:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFXmO-0004dX-VQ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:38:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXmO-000dtP-5W
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:38:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8cf3f-e002-0a2a0a5209dd-0a2a4505c518-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:38:12 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e8cf43-aaa8-0a2a45050019-d155d0aee531-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:38:11 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38ce8a5bc20so59390661fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:38:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb5f652asm34587111fa.12.2026.04.22.06.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:38:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776865091; x=1777469891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QC4eHEOEbVaYywNbf+ZVU97CJ3kZzG2ulmfLQUFsk+0=;
        b=Xrik2mbDk6tkpcdc+3DNx84vOjPxU2MTJYSJ4S4orLdTHX1SIqWSyEbWcHEZuZNuIz
         vTVEzxyhhWOKihrIpRwn6U0dQXRlq5EJE7bWLo1nCdKzlRw3m5GbcQw8TNOfUO8ScsJJ
         3TyOX9MAgQ0w0BUoJhfSeMtNwoIMq/4dOnJKevavbfbFI8dTebsUMb3lJQJyEUxYreUf
         KuFuvGEsy+ohTqbWSVgNYM/idZgQtqe/K/pWtzE9zc6vV3wnkPriy9J2JLFdgWnMRlwH
         42ODiLY8L+Cp5ugJTyj2poUcXs376HMPB7xBckhWtpVUX9r5OKWLYSbAwGCHQPyEjtp2
         3v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865091; x=1777469891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC4eHEOEbVaYywNbf+ZVU97CJ3kZzG2ulmfLQUFsk+0=;
        b=aU6dw/3L6uqtv5n2fyn6395+n5KH6IglQkGX0XRKLNjfVPQSmgoIO6HZthV9puottd
         mQwt4sMZR3Aj6F9pUvcOrm+3yulrLMOqn4NP9CRWIc5FL9ytKlZ7F+jQ7yBitZpQDoCM
         P7j9Z9uq+xIn8BLAXQ4UrJ2qzq122wYIK543jNv2ygBP4S6BsH/dHFkmVkSauAHvFpQC
         QPgNzjni3l4bTYXFmrbxhNsy966bsZ9B7V/9DMydogXGKnQRHuud3xbvdceV2KVoO/PL
         yJjBRJgs46+AGuc5e+tAZupcBUxtnltftl9AI5/qJUKXiSFs750q0aDUGI26tPsAmWI+
         /ugg==
X-Forwarded-Encrypted: i=1; AFNElJ/HtKn5qx/EWQlnai9iExD3Sa94D34v2+sfO5IwtzWRO4KIaXdanblybFgJ9DK/GdyNG98FtM7B6L8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXC2itjdfsoyW2uAmM4K/MY/qDApCG3dny+F+V//UZZlI2h4oB
	fU3xNbGObgL4jfFTQc7hx9qkg7q7oJ9gWqF8IWgznRwptxwxBg7uEVQI
X-Gm-Gg: AeBDiesOUSczF9H8+KkxQar6KoCc5QQhn28mpCK/Aeg4/E7OEJWadGxh6oXLbSWKi+i
	OvW8QzDQKE0Yr+Q1TbFylX1+TXoPkuHWKPGUojCcSxPuGrfS5XcFTgt8joGueTLvePXhgHng0zn
	viBS+gYQgSNr2wtkZlfy+H3qLvOiUtBL2jdHsxdJIzGbZByBaSJAUy5BXc4AWXyYlwvs69O3tau
	BUGGqeCyi5JDq1Gz55wmg7npAcJia2lr/sNNyPoze2Uop2dssVxrQ4XkjkB98GGlwmDR/FqQDsG
	Ll0KrOM/9kRJui2wQaHFWSeTnNAyWaJ4DKOlVClzCd+eARyicVohnx64pHM0OjbOrt9g96FuiED
	u34557hwpXk2VJnIWbf060cCJ0cW0n931knjTShfzOKRQnJLNltPzznTE7rnTdwc3Hjl1kLYA6T
	1hfZr0fnKVm/0CrtbhDb+KWxmgZX7OIusvEM4ACZ6WkvT+PQ2IB38VOdM0C74Sa6OlTvx3kbqAP
	QbOiuF7Cyl4JA==
X-Received: by 2002:a05:651c:421b:b0:38e:9e34:786e with SMTP id 38308e7fff4ca-38ec78103b6mr69334211fa.12.1776865090797;
        Wed, 22 Apr 2026 06:38:10 -0700 (PDT)
Message-ID: <d2070fa5-dce3-46e4-ac23-7d1956d0bc65@gmail.com>
Date: Wed, 22 Apr 2026 15:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <61c33c15d046110b5c99490f54191facf18068e1.1776780944.git.oleksii.kurochko@gmail.com>
 <f2ad01dc-0f8b-4514-b35f-24b254c9b2ee@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f2ad01dc-0f8b-4514-b35f-24b254c9b2ee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776865092-E0FA2443-AB9B6437/10/73395122804
X-purgate-type: spam
X-purgate-size: 1531
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E8080446D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 12:37 PM, Jan Beulich wrote:
> On 22.04.2026 11:44, Oleksii Kurochko wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -29,6 +29,9 @@ config DOM0LESS_BOOT
>>   config DOMAIN_BUILD_HELPERS
>>   	bool
>>   
>> +config HAS_DOMAIN_TYPE
>> +	bool
>> +
>>   config GRANT_TABLE
>>   	bool "Grant table support" if EXPERT
>>   	default y
> 
> Looks like I need to repeat my v1 comment: "Why here rather than where
> the bulk of the other HAS_* are?" They are (or at least are suppoosed to
> be) sorted, so that finding a particular entry (e.g. while checking for
> name clashes) is easy.

Sorry, old version of this patch. I put it through the other HAS_* in 
this file just after HAS_DOM0LESS.

> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -13,6 +13,19 @@ struct guest_area {
>>       void *map;
>>   };
>>   
>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>> +enum __packed domain_type {
>> +    DOMAIN_32BIT,
>> +    DOMAIN_64BIT,
>> +};
>> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
>> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
>> +#elif !defined(CONFIG_64BIT)
>> +/* On 32-bit-only platforms all domains are 32-bit. */
> 
> Btw, while this may be true in practice right now, it is not given. A
> 32-bit hypervisor can in principle be capable of running 64-bit guests.

Agree that it could be.

Do you prefer to change this comment to "At the moment ... are expected 
to be 32-bit."?

Thanks.

~ Oleksii

