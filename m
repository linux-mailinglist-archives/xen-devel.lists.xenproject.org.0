Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09440B52AA8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119555.1464866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc9d-0005ho-JZ; Thu, 11 Sep 2025 07:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119555.1464866; Thu, 11 Sep 2025 07:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc9d-0005gG-Ft; Thu, 11 Sep 2025 07:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1119555;
 Thu, 11 Sep 2025 07:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwc9c-0005Z3-Pj
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:55:40 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b57cb964-8ee4-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 09:55:39 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b079c13240eso63546366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 00:55:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd5b4sm76856266b.70.2025.09.11.00.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 00:55:38 -0700 (PDT)
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
X-Inumbo-ID: b57cb964-8ee4-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757577339; x=1758182139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0tzrxVYV0ODh8wyuQpD65I+UKWhA/gnpjSYlbjKB6KY=;
        b=f6piUFKBBj//BkFdCpOKGt+93XDw/vocAppB75nwbGnlLb+eErmPd53iOs3CX3naRG
         bjyh+GNB4E7qBtDHDftIiFWE6EwPPTmRbjI/jknN3C65lkUs25t5hlJxjDixONC7xj6h
         0iNNEXxRsgKOLG8cLhHTP8nB61bQ78XhQncT9uDKt5fZoMffRLH9bxy5P+mm7tgDEyBn
         funmNOZ4IFFewt2C6FDAaSsvqZQ2JmVzUKJeD4My6MIu8S8g2KaHmtSWSLlH8pgltahu
         NYQzn47HxvcLc6/lDEtVWF001Dli5+u4BCnSfMrZEyFqaf4ZeiOd3DXANi58Tdt5JPhX
         6NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577339; x=1758182139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tzrxVYV0ODh8wyuQpD65I+UKWhA/gnpjSYlbjKB6KY=;
        b=FOCTtTrXO5wqB8IIZ7Zlgt5A9Wf+7GlKtrl++YEetDUMsTFixj5ba3kfeQVoqbWbtw
         CugqAtOoJ/DyShtQPnvMJZAle1O8b1TAdzuBPE0+cU8OidDG3/tiQgG5nnxI7asyFej0
         xiiwy9HI36vDKAcYlSEmwWQeP4/iiMNcElzg/N9RVG0NligoYCH6UVSkIH8/GguQKFca
         zEuMgA0EOPaGygJ5yFJyACtOu6nwhLX95xnSd2XGgjVYSYbszdus1VzxJ/XNsthmP9kt
         GHV6ulustlI5nfwoJ+FmhHa6XUSqW3jUr7XrU9q56Q+WKV8dX/SaRkmJYQyyJyO+R6gM
         svHQ==
X-Gm-Message-State: AOJu0YyQqCP/YEoqrYTiW/YPVAZGerIMVp9HRYb/VZNYchk2VcZSHAei
	pV0inGb9htbH55Jufptc+FM61n8stFtsf4x4kNQONK/PFbbFW6NymXFMP/CXVKdz61afuaAFOP0
	bORg=
X-Gm-Gg: ASbGncvILos9MbZn6CdWXSE7EIEHa0qz4rbCzrlunLmhwqMY5F5EekDA77Z+Ku9SohV
	vOsfLHCtN6GDKNGtFIl5oyM4AMMP96QdymTcXwvOBYticUL0yTQDRybf1xyiIej258PZxQHZgjH
	WA148ERuagsQkmp6ccPimTzIrpCARdDw+XKIJCdUecDfVg7hPaLV4xHhopzaV3Y9X0mq+hZriFS
	mH7KZCervj4EkIwe9ZC0NuBSp64h530srQEF8AzfVI7TSd/DjDh16bJpHeeaVYdYhA7wnH/riZN
	VrarsIonheH3OTjGNJjETOkxXjsf1iYgEiMlBHubdqdsgpdHyB3HehonTI9kJT/Gze4wTlxZV82
	pqUMVZceWl7zBo3m5EZ1/kDVGdkRKAl/ELlZ8IBQK/3zcJbHcLwwh0CC5on/tS1GOZQ3St1q7zV
	7bUFtc+aSEOi0Ms3fgcg==
X-Google-Smtp-Source: AGHT+IFnxSQgb/UHw78F6/80SWH/W663BFO1CdMU3hlrU50xG10aKuzjKzCxNfFNrpH1f+SF4naKxg==
X-Received: by 2002:a17:907:3faa:b0:b04:4b0d:8e82 with SMTP id a640c23a62f3a-b04b167d174mr1557318766b.50.1757577339049;
        Thu, 11 Sep 2025 00:55:39 -0700 (PDT)
Message-ID: <dfed2c2a-f4b7-4efe-bb1e-c5173c1fe531@suse.com>
Date: Thu, 11 Sep 2025 09:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU reboot claim failed
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
 <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2025 23:57, Andrew Cooper wrote:
> On 10/09/2025 7:58 pm, Jason Andryuk wrote:
>> Hi,
>>
>> We're running Android as a guest and it's running the Compatibility
>> Test Suite.  During the CTS, the Android domU is rebooted multiple times.
>>
>> In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
>> domainbuilder: detail: Could not allocate memory for HVM guest as we
>> cannot claim memory!
>> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
>> allocate low memory for domain: Out of memory
>> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
>> failed: Cannot allocate memory
>> domainbuilder: detail: xc_dom_release: called
>>
>> So the claim failed.  The system has enough memory since we're just
>> rebooting the same VM.  As a work around, I added sleep(1) + retry,
>> which works.
>>
>> The curious part is the memory allocation.  For d2 to d5, we have:
>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>> xc: detail:   4KB PAGES: 0x0000000000000000
>> xc: detail:   2MB PAGES: 0x00000000000006f8
>> xc: detail:   1GB PAGES: 0x0000000000000003
>>
>> But when we have to retry the claim for d6, there are no 1GB pages used:
>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>> domainbuilder: detail: HVM claim failed! attempt 0
>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>> xc: detail:   4KB PAGES: 0x0000000000002800
>> xc: detail:   2MB PAGES: 0x0000000000000ce4
>> xc: detail:   1GB PAGES: 0x0000000000000000
>>
>> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>>
>> Does the change in memory allocation stick out to anyone?
>>
>> Unfortunately, I don't have insight into what the failing test is doing.
>>
>> Xen doesn't seem set up to track the claim across reboot.  Retrying
>> the claim works in our scenario since we have a controlled configuration.
> 
> This looks to me like a known phenomenon.  Ages back, a change was made
> in how Xen scrubs memory, from being synchronous in domain_kill(), to
> being asynchronous in the idle loop.
> 
> The consequence being that, on an idle system, you can shutdown and
> reboot the domain faster, but on a busy system you end up trying to
> allocate the new domain while memory from the old domain is still dirty.
> 
> It is a classic example of a false optimisation, which looks great on an
> idle system only because the idle CPUs are swallowing the work.

I wouldn't call this a "false optimization", but rather one ...

> This impacts the ability to find a 1G aligned block of free memory to
> allocate a superpage with, and by the sounds of it, claims (which
> predate this behaviour change) aren't aware of the "to be scrubbed"
> queue and fail instead.

... which isn't sufficiently integrated with the rest of the allocator.

Jan

