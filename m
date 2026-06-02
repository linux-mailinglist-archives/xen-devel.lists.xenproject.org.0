Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioYcMuLyHmoAZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:12:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80362FA15
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:12:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iiJ0mp6Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325155.1590665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQn2-0007hA-UF; Tue, 02 Jun 2026 15:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325155.1590665; Tue, 02 Jun 2026 15:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQn2-0007fH-Qq; Tue, 02 Jun 2026 15:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1325155;
 Tue, 02 Jun 2026 15:12:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQn1-0007fB-MY
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:12:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQn1-00F1vG-3C
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:12:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef2bc-bab6-0a2a0a5309dd-0a2a45059460-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:12:23 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef2d6-aaa8-0a2a45050019-d155a72db8a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:12:23 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5aa68d9dc18so2703176e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:12:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm33962084f8f.11.2026.06.02.08.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:12:20 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413142; x=1781017942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSnb4qrcRi4dVAuMj81J83x0aJGcwMh/trmmN4Ow+tc=;
        b=iiJ0mp6Y5QA/nZ52AO+i/S25vKMCxzRD4VBdae9Cx7c6ayI+VlaIn9Y1JR+mh8ixU3
         QNqaZCOo1jyVStw2UGqLZ3/MBnTrzaPC+MVKzRyfxjm0AxSwV3BNB9m0g7lstyvvgkpp
         JYDWJjm8RSDwogTGv07PUuE4aNIrs56K7Dj4qM6WJ1NWqAMZaK7k/ztO4Y9wBKfsQyQ6
         YBPkn5faHWLoh853uXwGhOtnQjMiEQciEcdLj53SWtVwrF9YfWnXjjj1W8icBoBQe8wu
         d7e30OZQHXkTUWHS1DeBTAowVHS1BikgEuBu30rh+mjb+27E4oKvgbRbmj/2XWLprzZi
         3dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413142; x=1781017942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSnb4qrcRi4dVAuMj81J83x0aJGcwMh/trmmN4Ow+tc=;
        b=C5jy7yDnT5GUKJ1Ql0Az9+rBIifssxwFLRl4U0Q+dO9r3dZsu4FOyYuyuyJqKxoc0O
         Yt4q/zNSz8nS6PSDOSsMARvTJzkCl2n147Not/WEbCf+rWhVKb8VqmA2EoG/Oqgq7kuy
         H7zOHD/g4s4ZL3pqJ1pz2ppGWks88/2r5I8vI2OHCcD9Y6m2kOHq7lwzh8gi09gmJZb9
         lG4hVj219mbujFTJfuo4C2X408gwDG5g8uKNma8vhIvxixhp8q2YahTAby4ID1Ge9MRR
         uUFZztUm+kxRUrpynsTEOeryWMiBUxRLnx3qz+T6Az6ZBN8oytuSQRxwvAkbrjYHXAdD
         nrPg==
X-Gm-Message-State: AOJu0YwH/lU0MwBZJ35YEsK+h1zWxvJ9vxRKZIaiszRzytmQrvQ5Inul
	492D2g/8wdEwHtiZvSsJFDEQhHmNbqYt0isvv+L5p2rqXmJirPMofutA
X-Gm-Gg: Acq92OFN5j2jyFUvMb7VGkzk+YSNlJTiRfUlp8vZ+WlEIIjRdyXzGB2ePUUZd1HQAws
	Qq7WNjcMae1F4oOTfyllRPhUbiqFtzXjxH7dK6kIQfYrLqCAS4L9qhocMz1R98KRq3qmqyrgaDs
	YBUDMM25UC5FRJDfufevSwusJBrWX4dqfm/8Q9hwFTZvp/x2VWKEifFpZc92IsvCWRCcH1fkTdS
	ukzjlYngMTf/Hz5EZJGWCbzZ1fvxFdL3Ez0PDXhkX2BGS47r5WWaZoPOMiwZ1DCCIYgbtFF1ANj
	CWy/VWgGTifaJipUnLtsoEBX4IT4PcZbMKkCuciAI/JJngwV32KcCWVcnqpjdSfiKPUpTNuZzUl
	t+ytg5p9ZUPc6xU62KwzQirDPWlm8xzEZqSp13yYRXAr7BW7YrNeBJJ21amxRHwKqcATk0hvd3C
	MziSbwkDju6C94+Oj3YU/XnUBJcRvF5P8WfMzC3vMm+0eLLYzG0dH1+8nX/3JIaOxoD7z2buCj5
	4yUDdZmOStg3I5a
X-Received: by 2002:a05:6512:1306:b0:5aa:7126:c645 with SMTP id 2adb3069b0e04-5aa7126c96bmr2203260e87.2.1780413140883;
        Tue, 02 Jun 2026 08:12:20 -0700 (PDT)
Message-ID: <f4fc8191-78c3-4fa1-8168-52d6b24729a2@gmail.com>
Date: Tue, 2 Jun 2026 17:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: disable debug info for analysis jobs
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com>
 <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
 <4a7b6f30-de8e-4baa-b2b9-e15c8da16b82@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4a7b6f30-de8e-4baa-b2b9-e15c8da16b82@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780413143-E2997443-1B5A8352/10/73395122804
X-purgate-type: spam
X-purgate-size: 1068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,bugseng.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E80362FA15



On 6/2/26 11:22 AM, Jan Beulich wrote:
> On 20.05.2026 14:10, Nicola Vetrini wrote:
>> On 2026-05-20 10:20, Jan Beulich wrote:
>>> Its generating and linking takes time (and space), while at the same
>>> time
>>> Eclair should be entirely independent of its presence.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Sadly the setting of EXTRA_XEN_CONFIG doesn't look to be cumulative
>>> (across "extends:"), so the addition needs making to all four eclair-*
>>> jobs.
>>>
>>
>> Maybe with anchors and variable expansion it could be made to work,
>> having a base template EXTRA_XEN_CONFIG and then adding variables as
>> needed, but let's not complicate this unless needed. Indeed ECLAIR is
>> not affected by stripping flags currently (though I don't exclude it may
>> in the future).
>>
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Stefano: Any chance of an ack?
> 
> Oleksii: Any chance of a release ack?

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

