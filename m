Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIjELuXmxGkz5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:57:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB0330BC4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263387.1555332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5faS-0006M1-FA; Thu, 26 Mar 2026 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263387.1555332; Thu, 26 Mar 2026 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5faS-0006K4-CV; Thu, 26 Mar 2026 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1263387;
 Thu, 26 Mar 2026 07:57:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5faQ-0006Jw-Sw
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 07:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5faQ-00Gzuo-4m
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:57:02 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e6c2-bab6-0a2a0a5309dd-0a2a450c90aa-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:57:01 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4e6cd-f93d-0a2a450c0019-d155dd2fc8d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:57:01 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso462037f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 00:57:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872092883bsm9853965e9.27.2026.03.26.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 00:57:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774511821; x=1775116621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HaD71KqVf3pgvjmfLSL3rF58PUZdMzLRDfqYa982xjM=;
        b=L0mHpy6hSMgZCDZ8j2t73H6PrvmHW2y5H0UVI0m13sdrosPjH288RLkkrLqvsVRQ+M
         nX1EUg4Y6HFisVBu0+9Oc3DMhMdAd29ey+nfZKparWucotDts612rLSlwcADevqen7Bl
         nxWrGzNosueiM6X6KzSVC5cgxgoTyBEJZdsqWvKXJYOqS9nSH4Xa32m/kIsnxfoU1Pw4
         ryP9e/SmdOVIM5l+dToRI+FKlXC7ItPnpN/mxrBHWb2XdLB+UMf6u0yIoZOpIvm+B7ZS
         iJIjZOQgZVHcWbOG4i19hTW/gaZE+3xADPf6klKmE4pKq2YclH854uE+HSKltF3JPEqw
         SQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511821; x=1775116621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaD71KqVf3pgvjmfLSL3rF58PUZdMzLRDfqYa982xjM=;
        b=A2811e9quaGrLWOYSq/qxruUgHBD/fvhGdqApechbqeWlGrSmeFggogUGp8Nyc81qh
         SwDI2wJT8Av0W8GExgdyTR+1yv7VTip627fiuCDT5G9GFx+TApwCnWPQ6Or1/uLJMsJm
         3bluC8KDGi0EAFqAP841/8nGoz3UkzsIY3ACx/UtzI3bK8HtoQBQrBb2w/DsfjyOa5XL
         rGkEvOi+nBSfIhWDKHwCwmX5IUOcLD7hk97y4WkdIYsPaQzzTjIeecG457AX9V1HirHB
         VKHPzG7vvb5KzsO12MnlokTlFnFUWfzTTZka2Y/9uIQX0T2ZSJjQzXryMHZaVjAeHvgI
         kwyg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJeo7vIn61HQs8pmiDXfKNMofJ3CeREWZBSBjj3EbY1EiJzDEfUqcsDiIGzUkp0xkav1PTnXNz8M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXvpt/YujTrMH85Fx7O7ShtDUsnP6KftWN8Qs1VMkHCDeUVjV6
	iAoZvDHGRc+ZlMlRWIBF0FbW4kLZaclSxZ19DuEqFkTmGgGHy1P1e/xprZE3rINgVw==
X-Gm-Gg: ATEYQzxhvRz14EmGrXKX75j6SU80m00bGdokP0FCaUzAaHG+hT/jwwzqhkXwlrW0cYq
	wneSotHqfoORzVWfixQ7S0paE/JvAz/k/dCOWG9NpTz8ZvFDSAGfEKm5uvIi7QI8xo5QjQBXFwM
	0HJqo8ivr7iB/D0ZNUzq3+eEz+OH2Vyl/AxkaMWUzZXqVh5IZwTNht7O2Tpzxm7pyuf4p5g+ZC0
	vQ1ue4ZgZOPorp5qj4+V6y4LNnNkP1QZxR8n7Hl3Nrv01jGJ1cJ9FjRdvnGY+Qr/V78ul+oFQLR
	AgENlB533nJSKjcM2QrA7WH6VH/g8Iqilm+EFNtpd3YrdT2iTg60jalndx945SzBPp3V7Kiiz3r
	8lwjE0qR0/UaNXwXy3YDEo2XnQmI1Jvt1T+jkQu8apCmJowrrwOkGHIu5Ie/6gfKXHyNJg6NHEO
	BO63L53ZzI+DKqFv6hZKNegUshPhHVXT8aAHucLBqjPSDJV4gJvRaa8NmGBttpdSJF0DVK6fJHd
	YsOEmAApsTcjd8=
X-Received: by 2002:a05:600c:1550:b0:487:1e7:8e7 with SMTP id 5b1f17b1804b1-4871606caadmr86960795e9.33.1774511821150;
        Thu, 26 Mar 2026 00:57:01 -0700 (PDT)
Message-ID: <65d27a54-5b81-4cbc-8fd2-39cce2f6092d@suse.com>
Date: Thu, 26 Mar 2026 08:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
 <552ba562-e948-475e-a235-89663b9ff648@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <552ba562-e948-475e-a235-89663b9ff648@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774511821-F6EAB734-0703E77E/0/0
X-purgate-type: clean
X-purgate-size: 1064
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 32DB0330BC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 22:32, Stewart Hildebrand wrote:
> On 3/25/26 08:54, Jan Beulich wrote:
>> --- a/xen/common/sched/arinc653.c
>> +++ b/xen/common/sched/arinc653.c
>> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>>      spin_lock_irqsave(&sched_priv->lock, flags);
>>  
>>      /*
>> -     * Add every one of dom0's units to the schedule, as long as there are
>> -     * slots available.
>> +     * Add every one of the control domain's units to the schedule, as long as
>> +     * there are slots available.
>>       */
>> -    if ( unit->domain->domain_id == 0 )
>> +    if ( is_control_domain(unit->domain) )
> 
> Sorry, I didn't realize before that is_control_domain() includes the idle
> domain. We don't want to include the idle domain in the default schedule here.

Hmm, I didn't recall that either (yet seeing xsm_set_system_active() I now
remember having been involved). Will add the extra check, albeit it'll
matter only during boot (i.e. if ARINC is the default scheduler or when
BOOT_TIME_CPUPOOLS=y, aiui).

Jan

