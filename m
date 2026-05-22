Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJt0HDEMEGpqSwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 09:56:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E15B044F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 09:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316424.1585822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQKjw-0005Dr-QL; Fri, 22 May 2026 07:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316424.1585822; Fri, 22 May 2026 07:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQKjw-0005Ax-N9; Fri, 22 May 2026 07:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1316424;
 Fri, 22 May 2026 07:56:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQKju-00059Z-In
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 07:56:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQKjt-00DsHO-RO
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:56:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a100c1d-5cb7-0a2a0a5109dd-0a2a4507bc1e-6
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:56:13 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a100c1d-229c-0a2a45070019-d155802ca5bd-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:56:13 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so39277935e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:56:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4741bsm2284653f8f.22.2026.05.22.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 00:56:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1779436573; x=1780041373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CjifsBC2QPGjuFooy6rvKS9BK5hhQ4Fgiich6F8P3Ng=;
        b=RocXipDpEenf7QdYRrT9vWWZG3gEIDRsluvT4EKLTqUICc86XkyY9bcDqkPWD2yS/v
         Jo1vWBNnbnvV216wVZ+g2e2uNlE23Fgj4iQLGKfTo0OYZqPpQWF5X70omvRu8bfpkEA4
         k4e3CGTj5UoqCoDDAXyL6noVELEbhpI/eEZp4jb3utA1eh5rlk+lhqcbdiKy2+lYuCBZ
         Arg/S9B9w32zfA912Y4WeQi0RXb3ByY46ocZ6Z1nNZxZXKty7gHowzW8jrs39ZkDcjYU
         yWg0PxYtnW8tJSjwp2tM31IyXmXk7pH/pj29GjTJNq4/BkfHux5NYQiIVPmvGN2V62XJ
         kw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436573; x=1780041373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjifsBC2QPGjuFooy6rvKS9BK5hhQ4Fgiich6F8P3Ng=;
        b=migNIg2G3o0S5ytMG58KedxPenVC5Z01RaKGoa3ESe3ekkOI7yUjBGlseu1cjsX0XB
         rFpYRyDIeLua/Ng+s0CfK9VDqXcz9lNKm7aDsnxvAcbBkj/Y6uqzPMazUY1Fmelzyr0+
         bhHUwRrZHXC4I43nzPQmIglWzOLfpUITV0mXOHfBngcJqtekiPV0LOzaf9Aq7Y7xBAt9
         tEOCGJR8E9ODzjmtZH2SD5RUDXN1nlBYZm7sIEWrCLUv0uyoT2cvOfJOPS6YYBhuFTZj
         sTsW019P0xjAzTd8PXA5S6vKSxymSKCjqE/0psjJMAuK1V4f3QuYz3k3ooAeGkgQ0TfE
         A84w==
X-Forwarded-Encrypted: i=1; AFNElJ/AWbk7bQXf2hg/zQZgPOpNa0Sj0tGsqJSbfgDCGUGPTHgJO27N775kdRoeuRRL20O3hUGXrbueaAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcOzALTjGJmG7prh+P0tuvho/W9PWbD9Hp+qobznxYxULHboKj
	bfvNM+RTLKv2DgIivlswRAzVBfHIg72AqZvqAO2G52GVpRDrSr9LKBzW//xXy0jo9A==
X-Gm-Gg: Acq92OFNAkQ8f3/8+/02KdMg9hutVRRf8X4eIhZt7S+sqpjtBOBwpMI/SxTSH9ua4xd
	fbNYIj4mar+KdsjYJMeU0SA5ID187zuNAJ/MI6FB44B9ULIP2WwvedyQlPr3O2ZGsTHltfMAcl0
	pnpNonE4wvBY3uvF1nebSgSe21tDFj9Zmmi6cBjA16eUl8kn6PGx+sYy95dK2Qlt5vQMVvhWtXf
	z7KCu8o70GJvkjiHo35QgiOVi8/CryluGku4PnnTpkyYRx6pLVH6OmsGUesFKGOJ2JbAoQJXx7J
	dT3ebsyc0Mn6/BAr5PjBtgBq2RVrrtPmUiC9quFu4hOBn2kqRUHyWSJcKCTQmlxh83/hYCGygR7
	EHUSJBhtDu4fXUECTD5gfcrpUSnecAiqtQkcsRq0CRmjHiRc5t9G3rUP4R74vjNzx23M4tkuO2f
	Rep1YXHQLzpNAEURogAykV57UXBiUwp/f34bDX0SKXgQ1YEW/v4c7qX9fOtrM35xD023OoQSOq6
	/ug5hssDLLnEzc=
X-Received: by 2002:a05:600c:c3cf:20b0:489:1c0d:c9cb with SMTP id 5b1f17b1804b1-49035f2e1aemr64316895e9.5.1779436573054;
        Fri, 22 May 2026 00:56:13 -0700 (PDT)
Message-ID: <55cbae35-702a-4176-9c2d-3d400c451a29@suse.com>
Date: Fri, 22 May 2026 09:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] time: add "NOW() good" indicator
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
 <38b28709-eddc-4dc7-9e8e-92db67d20ea7@suse.com>
 <fd31b3e1-1995-4cfd-840d-0d7c26765318@gmail.com>
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
In-Reply-To: <fd31b3e1-1995-4cfd-840d-0d7c26765318@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779436573-21F6EC48-16E6DF18/0/0
X-purgate-type: clean
X-purgate-size: 2408
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,wdc.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DB7E15B044F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.05.2026 09:46, Oleksii Kurochko wrote:
> 
> 
> On 5/20/26 4:45 PM, Jan Beulich wrote:
>> printk_start_of_line() checks for a value of 0 right now. In order to be
>> able to have NOW() return at least monotonically increasing values, that
>> needs replacing by an explicit indicator.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Arm and RISC-V may want to consider whether their initial get_cycles()
>> can't be moved yet earlier, such that the indicator also can be set
>> yet earlier.
>> ---
> 
> At least, for RISC-V ...
> 
>> v3: New.
>>
>> --- a/xen/arch/arm/time.c
>> +++ b/xen/arch/arm/time.c
>> @@ -145,6 +145,7 @@ void __init preinit_xen_time(void)
>>           panic("Timer: Cannot initialize platform timer\n");
>>   
>>       boot_count = get_cycles();
>> +    NOW_good = true;
>>   }
>>   
>>   static void __init init_dt_xen_time(void)
>> --- a/xen/arch/riscv/time.c
>> +++ b/xen/arch/riscv/time.c
>> @@ -87,6 +87,7 @@ void __init preinit_xen_time(void)
>>           panic("%s: ACPI isn't supported\n", __func__);
>>   
>>       boot_clock_cycles = get_cycles();
>> +    NOW_good = true;
> 
> ...  preinit_xen_time() call could be moved a little bit above just 
> after riscv_fill_hwcap() as it is using riscv_isa_extension_available() 
> inside.
> 
> preinit_xen_time() could be splited so it can be moved just above 
> tasklet_subsys_init() after device tree is initialized but I don't think
> there is to much sense for that.
> 
>>   
>>       /* set_xen_timer must have been set by sbi_init() already */
>>       ASSERT(set_xen_timer);
> 
> The ASSERT is harmless, but NOW_good could technically go after it.

"could" or do you perhaps even mean "should"? I'd like to keep the write
next to that of boot_clock_cycles, but of course only if there's no
dependency on set_xen_timer.

> boot_clock_cycles and cpu_khz must be visible to any reader of NOW_good 
> == true. There's no explicit ordering between those stores and the 
> NOW_good = true store. In practice this is fine because SMP isn't active 
> at this point, but a WRITE_ONCE(NOW_good, true) or a compiler barrier 
> would make the intent explicit and protect against future reordering by 
> an optimizing compiler.

Hmm, yes. Logically it would want to be smp_wmb(), and then I'll also
have to add smp_rmb() in printk_start_of_line().

Jan

