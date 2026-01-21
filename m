Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KdnG4LXcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:41:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7457A77
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209786.1521705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYSD-00087y-BY; Wed, 21 Jan 2026 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209786.1521705; Wed, 21 Jan 2026 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYSD-00084r-7p; Wed, 21 Jan 2026 13:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1209786;
 Wed, 21 Jan 2026 13:41:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viYSC-00084l-JZ
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:41:00 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d1657f-f6ce-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 14:40:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso8553265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 05:40:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997e6cdsm38148531f8f.31.2026.01.21.05.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 05:40:57 -0800 (PST)
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
X-Inumbo-ID: d0d1657f-f6ce-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769002857; x=1769607657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FIHjcHzlX+JKkZyWGPWJkD7XCPOEBDcAXVZ3w2QFXKI=;
        b=C7eqYl/1z27ocDUBbB1T/hnqUTmAQvfGHHUw7abW3nD8fb/7ol7CbWo8j5Cn8CsU8A
         MGMTmZpEVlSQyItV2+X22xI1F6pzx/5lPgvBlFAaez7TV64L2CH6wKJWxiMMKDX0+l1g
         0aiy/9rS6Wg5zqYbumCTRGPgVRVkBQ/sTqsQpYUevV6ZSOOdLawIngwKNTKpwX4zqiYR
         rpKYd5L+snK+H1OOQ2LNXHY0Y011OXRQegyjb2ZuZKcz3+CboFvK2/4dJwNxGsVGRelI
         q02+1Yivu82zfd3m5hF1HxCNecshVIKIuG7OVEhLgKAE+QSRwjnuf4nLL7HU+ozoWtdE
         NY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002857; x=1769607657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIHjcHzlX+JKkZyWGPWJkD7XCPOEBDcAXVZ3w2QFXKI=;
        b=EcQnX/n5exuGngNxf9Qm6OMhvutKwZUm1bTZOL3dPjmlkTYx3qCUh3SBBIQuhHIstD
         tePZFxVwYKzqyZbq/Ah2opnwZhHkjCl5d8EUSn3aX2LUlU6if1EPFgCY835vY1McauHH
         FakrC03c3woXzYXN2LLZmk69G3w5zwC+feVdCqoZVYafVoF+U3cyL19imuZcCOZphQ5O
         0lPn2SI5H+SfpROvo7UohKsgt+x0d7IiIgg0LSW6Oc6OZTsZjTnB7Z1Sm1YWQr26+yJN
         qLtlAbJ3W6XYK3i/0Q/Ks3aXzSqxv4pvU2DoxzQ8B9BqMouZZ+5FttTrkNzaQApK8iF9
         gsfA==
X-Forwarded-Encrypted: i=1; AJvYcCU8+0XQfw+HJrgd66PzMJvZjBzMkLy3f6pSBF2RQk9HbqiF/jjZ42nGjp56F/9ENBTrlFx4cxgC6rk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZpJRh/61t1Aq7UfxEOdDVcDskJjbRQ1iIq8LXJKgNKGyJcpm1
	K5RfvLaQXZBgLK3vga/hiWH+FmlnesWvOAU6E12xlr2Kd9d7T3Q60Ic7O+vMWg+ZqQ==
X-Gm-Gg: AZuq6aLAxYEOoQtcExxx1KkZajwSqxmi1QutX6dZTORG3Luzk6f9nors9oKJmoMlfHU
	EDfJcCskdsuqfoKBDSul6LK7ESu5zXiret+qtIliRIG72WyU2I2aHxFkJhkthCL1o4JXOd8BOtJ
	1SN+n+4GKGqyX9w6ObLLLG0yF6aBlxjWPshql8vEQzmbMcxYNxvsT4iyviHHu3mqEswPlPYmHMt
	DY9ssZH0dgYujWXPelytEka0s53K2pe6mYdLZWRPgeGMxdTmZ1GTu9UbS4ww2aNCaRF4ZWc8iu+
	hJHYwA6rxCZBY6PU2hQ6IwAq9taJSEdg7LEbOXCGEh1lRUJCCUfHYQsENhs0hsiizoLNUxuYI0x
	k2mFskQHLX33vFDC1SIgzAGzI2f4862bUdhHGTnW3MflgSw4dB8xMc0I9d4vtPOdlsGK2D5F/hz
	jwQZkzBWbKZngkjMoigUGMgF7TqsBnv87XJ9qAtvZ2YSedKi3+LxylMfM62NrvVieKkoXtOjUNj
	7pNbROhs0DwAA==
X-Received: by 2002:a05:600c:3e08:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-4801e53c069mr224552965e9.6.1769002857453;
        Wed, 21 Jan 2026 05:40:57 -0800 (PST)
Message-ID: <2dc8f5e0-5fa3-4165-88bd-be4246989817@suse.com>
Date: Wed, 21 Jan 2026 14:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/amd: Fold another DE_CFG edit into
 amd_init_de_cfg()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-2-andrew.cooper3@citrix.com>
 <55f40e49-027b-4162-94f0-54573fb1abc0@suse.com>
 <a7b124a6-6d92-4713-89e5-f608de7ec45a@citrix.com>
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
In-Reply-To: <a7b124a6-6d92-4713-89e5-f608de7ec45a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CBD7457A77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.01.2026 12:46, Andrew Cooper wrote:
> On 08/12/2025 9:17 am, Jan Beulich wrote:
>> On 02.12.2025 11:57, Andrew Cooper wrote:
>>> Fam12h processors aren't SMT-capable so there are no race condition worries
>>> with this path.  Nevertheless, group it together with the other DE_CFG
>>> modifications.
>> With this, ...
>>
>>> Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")
>> ... isn't this more like Amends:? Aiui this wouldn't need backporting.
> 
> This does want backporting.
> 
> d0c75dc4c028 explains how it's buggy to have multiple pieces of logic
> writing to DE_CFG, and here's yet another one.
> 
> It's only a latent bug because Fam12 doesn't have CMT/SMT, and this
> property is not discussed, meaning that the logic as-is comes across as
> unsafe.

Hmm, this last part again leaves me with the impression that backport isn't
strictly needed. (We often don't when addressing only a latent issue.)

>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -920,6 +920,13 @@ void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>>>      if ( zenbleed_use_chickenbit() )
>>>          new |= (1 << 9);
>>>  
>>> +    /*
>>> +     * Erratum #665, doc 44739.  Integer divide instructions may cause
>>> +     * unpredictable behaviour.
>>> +     */
>>> +    if ( c->family == 0x12 )
>>> +        new |= 1U << 31;
>>> +
>>>      /* Avoid reading DE_CFG if we don't intend to change anything. */
>>>      if ( !new )
>>>          return;
>>> @@ -1201,15 +1208,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>>>  					    smp_processor_id());
>>>  			wrmsrl(MSR_AMD64_LS_CFG, value | (1 << 15));
>>>  		}
>>> -	} else if (c->x86 == 0x12) {
>>> -		rdmsrl(MSR_AMD64_DE_CFG, value);
>>> -		if (!(value & (1U << 31))) {
>>> -			if (c == &boot_cpu_data || opt_cpu_info)
>>> -				printk_once(XENLOG_WARNING
>>> -					    "CPU%u: Applying workaround for erratum 665\n",
>>> -					    smp_processor_id());
>>> -			wrmsrl(MSR_AMD64_DE_CFG, value | (1U << 31));
>>> -		}
>>>  	}
>> Are you deliberately getting rid of the log message?
> 
> Yes, it's basically line noise.
> 
> Most errata like this are not handled at all, and this is not overly
> noteworthy.  If it were at debug level then maybe, but certainly not at
> warning. 
> 
> Fam12h were rare in the first place and are museum pieces these days.
> 
>> And I assume it is deliberate that the adjustment no longer is done when we're
>> running virtualized ourselves?
> 
> Of course.  It's pointless, and a readback would show that the write had
> had no effect.
> 
>>
>> Both imo want making explicit in the description.
> 
> I've updated the commit message to:
> 
> x86/amd: Fold another DE_CFG edit into amd_init_de_cfg()
>     
> As amd_init_de_cfg() states, it's only safe for there to be one location
> writing to DE_CFG.  This happens to be a latent bug rather than a real one
> because Fam12h CPUs aren't SMT-capable.  Nevertheless, group it together
> with
> the other DE_CFG modifications.
>     
> This removes a printk() which is not noteworthy, and skips the adjustment
> entirely under virt, where the attempted write wouldn't have stuck anyway.
> 
> Fixes: d0c75dc4c028 ("x86/amd: Fix race editing DE_CFG")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, this reads good to me:
Acked-by: Jan Beulich <jbeulich@suse.com>

I'd like to understand the backporting (or not) aspect, though, in order to
properly know whether to pick this up once you put it in.

Jan

