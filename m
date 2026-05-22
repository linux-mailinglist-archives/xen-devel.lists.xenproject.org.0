Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGgKAHA3EGoaVAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:01:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0B5B2A5F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316652.1586034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNcY-0006P8-3u; Fri, 22 May 2026 11:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316652.1586034; Fri, 22 May 2026 11:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQNcY-0006MS-0j; Fri, 22 May 2026 11:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1316652;
 Fri, 22 May 2026 11:00:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQNcW-0006ML-Bg
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:00:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQNcU-006B5O-A3
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:00:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a10375b-5cb7-0a2a0a5109dd-0a2a450cd1ec-24
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:00:46 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a10375d-62f1-0a2a450c0019-d155dd32d08f-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:00:46 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44ccbd3290aso6557903f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 04:00:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4741bsm3492257f8f.22.2026.05.22.04.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 04:00:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1779447645; x=1780052445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ9aqb41laxGHbBhX8BrmHK/RbTseMwNuLRQmeNWdZI=;
        b=IqYi/BYqZpa2TlOsZ3wCpPddObeMi6UJ8MLt/nwsW1ERYh3wqs6iTLlGF6nO8xeT7o
         mv4TeZYypi8X+qI7JzaNk+C35sPE9GNbvIIa6pX1oOQJOL1fs3UStyiLJPaQbZokOzpK
         w54/9UKNcz8WxfClactVtYnOwob5VUFhjjIQMUIAeTSNpQhe7W5qhI5sTUaJiYB7VduR
         D8Ybf0PX5w/dkxd7LyY3jX6XXGB469zsnXMstmy2NbUHphrFUfue5Fmcyqm6xRCBl6xK
         l9IGAorsUIdxWfgB0zjg/iBIPNsPIBkmwxtDqDRFhpikQWIIg7X+fdPmijwwbNXdTEbk
         i/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779447645; x=1780052445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ9aqb41laxGHbBhX8BrmHK/RbTseMwNuLRQmeNWdZI=;
        b=aAvBWtUxx+KoqG0Nttk5e2WEnnVYbDYIla0CxAPq8IWwhUj018Qijfom17EpgvnmMt
         UwFIXMxAllH5i7IXmNOHfADuNSYdpiGc9xbVzSJzC+yVF7hw6ZqkWKhWhsKf1shA04Fd
         7Xoht1YPXY/Q4zgs+ViMQgqkwQ2RfeDRZoRmch4iLuHcxbA+AND/aJbS/zwxqMv3kqyV
         nHE+8p37wxTzPgBK4sUK47GTw6wnObYkSdhjm+0EH2rxLSVNZ/GxqhF55n0hR7dsahuC
         wWXoNF5BfcudfNHJAk5VzQx6Lt0nRFTcLmUR8WubHLI731zV+Fa7+1aHZSBc4f7WliQx
         zAnA==
X-Gm-Message-State: AOJu0YzLaJE0nUwPNNTrvPvSgib3w/WUvfavEd6cy13z7jMpskKJzwaq
	YIpS1E5Rljj/Z43IINwKA+6P7S1Gyzrww6RSv0pkXQPSVoH8ZHMq0O+yH7EjRMsYvMDXiAlao3r
	3SjM=
X-Gm-Gg: Acq92OEthDcj3A6QJn2kuUXi/6UdI9/NDSU0HUy3Nc1uQNtV7SSvkOU+c24+jpU1kkw
	UFsPWvyR3M4MLqk/AhRbThwKxGKuYueKi/RdOJaWrOdKOOXlKE4g8cqUQrgTeUmilHB0FXGADaM
	sbzVjSi/q5hDlB08AQ7EPjYK6V+x26pXD1cqIunuArIfkI+f0MMYPgILdELNP5A/50Cg02eIhpd
	usp8pV8QbHCa17DKXcrCxqpVqPQmtZN3XoHwEqxj1GnAhpQMyBwdq+bahR32Poc7UrSGb8R51ri
	FzlJ6m04GG65II3gRx3Wtsm6ib48AfI7hQgrO/NOMa3ORndimhVrIw2UOZLcj4VInQTxHmOW1qq
	ClByROQH/Kd3TJaNEH5TelXeRRTDgtGC8LniY8VBB22hrG9IpOdC40DTJT0wuTQy1uOHAQE2fjN
	UItqmmIfUsXjIiVOo3Ao5c8JVtGmT14nR8mTmN5iBzxphTneomGRP59NIFT0634CpJ3ryVh3n80
	TS7mc2fLbiJbEI=
X-Received: by 2002:a05:6000:616:b0:45d:d092:ac9c with SMTP id ffacd0b85a97d-45eb38c2374mr4765776f8f.33.1779447642705;
        Fri, 22 May 2026 04:00:42 -0700 (PDT)
Message-ID: <b8d684f4-44e9-4ece-80da-c14bb28fc5b3@suse.com>
Date: Fri, 22 May 2026 13:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/PV: address Misra C:2012 rule 16.2
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
 <d04afa56-1197-4f5c-b158-b4b7eb7fc6b9@suse.com>
 <ahA0qSC9w61Kx_4P@macbook.local>
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
In-Reply-To: <ahA0qSC9w61Kx_4P@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779447646-D956FCF5-BF772BC7/0/0
X-purgate-type: clean
X-purgate-size: 2911
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D0F0B5B2A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.05.2026 12:49, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 04:06:20PM +0200, Jan Beulich wrote:
>> ... ("A switch label shall only be used when the most closely-enclosing
>> compound statement is the body of a `switch' statement"). While I don't
>> really like doing so, use a few "goto" instead. No change in generated
>> code (somewhat to my surprise).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> With one alternative below if you would like to remove one of the
> introduced labels.
> 
>>
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -897,7 +897,7 @@ static int cf_check read_msr(
>>      struct vcpu *curr = current;
>>      const struct domain *currd = curr->domain;
>>      const struct cpu_policy *cp = currd->arch.cpu_policy;
>> -    bool vpmu_msr = false, warn = false;
>> +    bool warn = false;
>>      uint64_t tmp;
>>      int ret;
>>  
>> @@ -996,21 +996,21 @@ static int cf_check read_msr(
>>      case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
>>      case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
>>          if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
>> -        {
>> -            vpmu_msr = true;
>> -            /* fall through */
>> +            goto vpmu;
>> +        goto check_relaxed;
>> +
>>      case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
>>      case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
>> -            if ( vpmu_msr || (boot_cpu_data.vendor &
>> -                              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> -            {
>> -                if ( vpmu_do_rdmsr(reg, val) )
>> -                    break;
>> -                return X86EMUL_OKAY;
>> -            }
>> +        if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>> +        {
>> +    vpmu:
>> +            if ( vpmu_do_rdmsr(reg, val) )
>> +                break;
>> +            return X86EMUL_OKAY;
>>          }
>>          /* fall through */
>>      default:
>> +    check_relaxed:
> 
> Not sure it's much better, but I think you could avoid the vpmu label
> at the cost of keeping the vpmu_msr local variable:
> 
>     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
>     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
>         if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
>             goto check_relaxed;
>         vpmu_msr = true;
>         fallthrough;
> 
>     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
>     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
>        if ( vpmu_msr || (boot_cpu_data.vendor &
>                          (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )

I was actually happy to see this last construct go away, which your
variant would retain.

Jan

