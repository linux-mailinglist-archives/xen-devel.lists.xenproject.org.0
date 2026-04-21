Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ju6Cz0m52nV4QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:24:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD86A4377E4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288365.1568639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5TC-00056A-RJ; Tue, 21 Apr 2026 07:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288365.1568639; Tue, 21 Apr 2026 07:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5TC-000540-O6; Tue, 21 Apr 2026 07:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1288365;
 Tue, 21 Apr 2026 07:24:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF5TA-00053u-Vi
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:24:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5TA-009w2S-8v
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:24:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e72618-bab6-0a2a0a5309dd-0a2a4503e0da-30
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:24:28 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e7262b-672d-0a2a45030019-d155d0a9a88e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:24:28 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38dd9f0fdc6so51803171fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 00:24:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb6f0729sm28815201fa.21.2026.04.21.00.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 00:24:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776756267; x=1777361067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGwWeAi6fCFlu1+XCUxfo5CmfPPMxqinAUjT8lOwyeQ=;
        b=qS4uzHIETgzZ7WKVlBp5turQDdWXTXKFKjE01yyTGBRjvba9ES4jR4ZrzqwarkWJIB
         rooIphnsUeIXI3m3RzV9GEYeeG+T5gsAqX87Oo7UcX1V1i1QGGNv2Of6V6CK8ht5AoQA
         dBzP5Lh3qgrXMEVmVy/BGlioRJuocvIeoYlQ+kjLeFCncMl3CgGDTKP7B3G6rrNXn8c/
         fZJe7pEtLdOleiqg01GaUyq+48LcPJMQJg8v9h/jffI90gh9pwB91Xis0xgzZaN/OMq1
         OxOXEGwTxUvGAU5NnBYNQix+EEicrS3/MaBsU4FudBQOfV4iKgVtiRdXqS4gpKa/OUpW
         3iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756267; x=1777361067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGwWeAi6fCFlu1+XCUxfo5CmfPPMxqinAUjT8lOwyeQ=;
        b=OssvYhczI/htee6YZeSKXbbCg9iqHlHvdvj9P+KSujVJ9dLX0AaBn+CkmkbsSJDT+6
         PSc19AyPgwoPtjAatR52IbKBRI/vj0CAILKviXhEbsUXi90c0Y1pCupLGtM9PEm75M9I
         3HgNM5WHvs6UPlEQZqalkqBYq7mjbawQm4eGYjrKj3ZbzkFcJYdmlTrcSi+eYOgInbut
         b0YGulCHUgOMhPv4HjtAHUKhHvaVJhMcMs+DprYKoz42exDQ38W0O9GOfXKGYo3A4dmK
         pk0HN2mwCg1J5Pb2oiFwqt99/1eBK8ZodqoHFR881+87/VRbw0SGGf+v7Gv3sbOqJMCt
         3NMg==
X-Forwarded-Encrypted: i=1; AFNElJ90aNQ0tyZpLz+SJAne6D83SDXE9FQDg2iNnzPNRgfXTPWaPIVKKlWTTbJPOq+7dih8nUEbZUAwDqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnZV4xMOat4nn2B6uZOEH6b5L7GKzmKB5z42nYR8LZuaOu178x
	y0Tm38xdK9ZIO2LsWsdYvJh8I0MKR4FwIXmZqNO1EDMMpimefNjnlZoc
X-Gm-Gg: AeBDies0tnCaBT0cz4p0sTAODOUrEIvpQ6oiB6UvlEWHWGB40PmJN7vTvg20VCUZmeB
	vkGtLHEn53JSjGZYEwB404HbHnKvajcIeN5Yx2rtObBFod38SrxI6DgYJD5AD+deUoQgGt8z5Lx
	kzR3U/evqdejbRYRVmJFbJbMSRfRYUUB+N8N2BwJ9fLOEiIOb0Upq1pDGaQiDvv8UG1dLc3uGNC
	dEM0CIkNV15AhCaTReI2l13q9SnZq1SQhwN9ZVtVmKQoYJnAx11EzFiFwBaHuBV6M+HdzosoofX
	xMuq8cznXM0rMkDD1FAXWwJPLkf6/lcL/hbhAUCxfcCGOl56qwfHy/30ZkAKB5sioMHGbpQkrLV
	zKqiofDs02z6Kv/AhEgySgC/6lwSSA/cjQAnauqppLYSu+GrQwIvygjFqUUgjzYM5jiA/sQsNbS
	EezTUZm13DmoIpzGQOQkfvJ06O94jEeD1WuWYuv6yieAsAdXsMPA48dVCneR3RjI4w0nRNBHqED
	vFAdBRXaYn64A==
X-Received: by 2002:a05:651c:420a:b0:38e:58c7:cda with SMTP id 38308e7fff4ca-38ec8ff68a5mr46703061fa.1.1776756267092;
        Tue, 21 Apr 2026 00:24:27 -0700 (PDT)
Message-ID: <76cd2f66-ca58-41ad-96a6-c191c74b0a09@gmail.com>
Date: Tue, 21 Apr 2026 09:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] xenpm: Add get-core-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <22bcde2914c0303b2c594485542af19d2952e782.1775570823.git.teddy.astie@vates.tech>
 <a9b21308-18f6-41ab-9ba6-1c2874cee86b@suse.com>
 <9bad4d4c-b6db-4cce-b43b-2970d333c0ce@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9bad4d4c-b6db-4cce-b43b-2970d333c0ce@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776756268-28776938-CDC96F94/10/73395122804
X-purgate-type: spam
X-purgate-size: 1015
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: AD86A4377E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/26 3:13 PM, Teddy Astie wrote:
> Le 08/04/2026 à 14:36, Jan Beulich a écrit :
>> On 07.04.2026 16:10, Teddy Astie wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>         mitigate (by rate-limiting) the system wide impact of an HVM guest
>>>         misusing atomic instructions.
>>>       - Support for CPIO microcode in discrete multiboot modules.
>>> +   - Introduce get-core-temp to xenpm to query CPU temperatures on Intel
>>> +     platforms.
>> Would you mind inserting "command" or "option" before "to xenpm"?
>>
> Some like
>   > Introduce get-core-temp option to xenpm command ... ?
> 
> (or something like that)
> 
> I don't have any issue with rewording it.

With rewording it to "Introduce get-core-temp command to xenpm to query 
CPU temperatures on Intel platforms.":
   Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


