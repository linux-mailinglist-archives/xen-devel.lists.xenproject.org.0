Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAsgG6a8BmqMnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:26:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5106549FAD
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309579.1580621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm0A-0001m9-VN; Fri, 15 May 2026 06:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309579.1580621; Fri, 15 May 2026 06:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm0A-0001jr-Re; Fri, 15 May 2026 06:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1309579;
 Fri, 15 May 2026 06:26:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNm09-0001jl-RF
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:26:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNm09-00EzKw-1r
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:26:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06bc8a-2eae-0a2a0a5409dd-0a2a4502aae0-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:26:24 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06bc90-af86-0a2a45020019-d1558033cca9-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:26:24 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so93926025e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:26:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab52a6sm36315535e9.10.2026.05.14.23.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:26:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1778826384; x=1779431184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7fywG0RcbcVRXiQ/OUmBP6jPNsrqS2f8I8apqhDXw2o=;
        b=ZlcA30SstcUj8FUA2KDY/X+oRAmiT9AlEBM/D/NvLFP9ZIwoPvuatTeMWcurhPX0Uj
         GupwTzWYNhxBbqV9LOExMJk9T70/fq+BQEaJ28MVrr8/a2H+xF8Fn3GYI7vFGRcFPtZC
         267zy+/CXHP6QD6jBXsJDpt24rhSe6KWIgnSgM5RRGuJmvSlMv4Y1YiSm98OR2j/G9sV
         PBhpCjI5f55UOh4wjFULsLC7UO3gUoCAemD2eORUCgNhSIp7Kqi6hcJ7CpN/IwHEDQSs
         VvlxnyS6uBga+Vh3+LvQAFlAXoWtk+j54kj0Kq+hPxlpv+Pw+Txf0AHdlXUdFWrGGJfQ
         uW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826384; x=1779431184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fywG0RcbcVRXiQ/OUmBP6jPNsrqS2f8I8apqhDXw2o=;
        b=CuAR3oqP8FyLCEu/TUqh7Gbx5xiDCVJSQKHaD/UkFyAHb8ZpChr9dBgpE97Uvf1D65
         VjVIBJPe7JHPfNfWWpIqkhxXrDlWIf3RseJnW6QGENxTGcuedYIXYOnycbdQRYJ/igSV
         0tAM8H7Dsqk9DWBgH1021tM63VblDkhJEylrhW56qqH+bn9pgokVEM9263dB2Dd+9Gu2
         /dB1r64f5hAcOdBguJ4bPY6QbojQ06P57GgTY5B97gJBzXj4uDffeOpgvBiauNcg1TyU
         xNc28Y0rxf9uT+pu9Gu47bfsiPhLISUcnCAv4HcjoLzdDnBSNOG0V4IrtPCpcMMSgxiB
         6ITQ==
X-Forwarded-Encrypted: i=1; AFNElJ96L1MJwwLV6a4SFz+ZHhPrpr95Eva8djh1RK9XxJIfD909mv3GnU4o+qkSzF29GvlHejyQs9+RRf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwduQR7KXdbxgRMEsMTO3S1nL7blb0qWaZ32riFRMSyynaYM1XU
	cYMyjjpSc1RSc6J96Cfk+AlOuIgxB7ZFpWKfUJdtROd3BfKZSvvERBmWJZjOYJg+zg==
X-Gm-Gg: Acq92OGvpDpG18fm7jihyo5YRfGtZV7DAle+H/96URwyyySWWDmMGRIGY9dq8y/YXK+
	X2obWCYPN3W+42xhOF1eK46izaWUu8Fp1aTaiv6ufaJU3sWlDDCmbH9grV2Cep1ouFQTbh//NZG
	E24btVEGCpUOapkZZFAkh4tSnANy67EV6wXyGKPB3mJpiGcIqkE+Guoa+gk3R/2RHX3HBz/FAsk
	3v34XBq9FFOs5/+LW5Nhi1TTkY7wgdgHL9vl4TXH4bRV5LWqlLZEK/tgqvyfxehgynU/+hB8Di/
	gvWCYInjkS/GOeA0GzV48j2W8DTWcOdXx7SZ/JUBmH/uGLpeHvwxtIbZ4aZ3WeBtRT4+sOn6owo
	NcjHkbmDwztqAiPwZUUqZpkijdmsbUzZHwOCk8tJilQi/R+gdGztqf621isqtF18qlMoKt2zVGC
	+wzVHLg+g+xtbhIGH6i9qDHKdOobBiNvHUvZsQK8OXx8H/MyaOuySa+rR4+qmHCwDylP6KlGshK
	qbk2LaC8dHjxJY=
X-Received: by 2002:a05:600c:37ca:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48fe59b05b2mr35557655e9.0.1778826384299;
        Thu, 14 May 2026 23:26:24 -0700 (PDT)
Message-ID: <b20a2e70-f08e-41da-ad81-913d5e5d2b7e@suse.com>
Date: Fri, 15 May 2026 08:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
 <8ef5af19-7660-4ee9-9cf6-094c744abd0c@citrix.com>
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
In-Reply-To: <8ef5af19-7660-4ee9-9cf6-094c744abd0c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778826384-8316D161-681DAAD9/0/0
X-purgate-type: clean
X-purgate-size: 785
X-Rspamd-Queue-Id: D5106549FAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 19:00, Andrew Cooper wrote:
> On 13/05/2026 3:03 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
>>  
>>  #if BITS_PER_LONG == 64
>>  
>> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
>> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
> 
> The interface here is horrible, because we're passing a pointer to a
> uint64_t to userspace and back.

Indeed.

> But, can't we just cast through unsigned long instead?  The compiler is
> happy, and that feels safer than using a pointer type.
I can check if that also helps. Casting to void * let's us, aiui, get away
without leveraging any custom deviations that we have.

Jan

