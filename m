Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOgOJbp9e2kQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:33:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20DB17CA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216733.1526679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU14-0001dZ-Sv; Thu, 29 Jan 2026 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216733.1526679; Thu, 29 Jan 2026 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU14-0001bv-Pn; Thu, 29 Jan 2026 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 1216733;
 Thu, 29 Jan 2026 15:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlU13-0001ZW-76
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:33:05 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cca27834-fd27-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:33:02 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so8323095e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 07:33:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5e195ebsm6799705e9.4.2026.01.29.07.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 07:33:02 -0800 (PST)
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
X-Inumbo-ID: cca27834-fd27-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769700782; x=1770305582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FNESxqxlFIjDAU4QM5qdfIM9OEBNjbf3UfqROLfs0jA=;
        b=FL4RCHt/h55Yr71d3aRO8aVrF9UbCG/nm4xhmapBxoHmiXV6cuhQV04bN3pl4UBF7Q
         bgcnQDvWR/qImitUmvbZOZnAFIEezohyzT1Fu/Crt1i9r/ikMLk4naiFoMM++YLFuwe5
         0xgvd7NPf3tWfMIZGZEeW3rYb/RSdEKtWrsWf//RUF2Wlix9A8EXF/XI+VmudftUwPxe
         ChW3SBvoEFluB/8e4dFfHUBxuIkcEhZRdB1pdw10IWO7tm0Xq4/ipHkXeb6op+0t+d2g
         NDYnXoDf1jD3gMsMS5cMPrLQ59tpkClrJ3iUGsFMBwZpiFXHwESQpwbEBomZHDbueiiN
         g+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700782; x=1770305582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNESxqxlFIjDAU4QM5qdfIM9OEBNjbf3UfqROLfs0jA=;
        b=Fy3cqROrIZjz4WgKuRtYMWfyTOnB/Wgyc7hVBkUJwi5pfEpnwpCdThMwsLEGZEmYR3
         j9mViwpKJSeZmd+pc4qtlAuvDEdNHnqpg5E8FPgbauEQkHfmK83tw/ArdPtAadTToSKu
         NPn+2mkC7/rg/aiKPZHIMdm6KetjAlyhF5x8wbd1Ib8Tkps8DafiP61QXJz4QQ9S7x82
         79eABQuuuE4sUkx8bC04kwNX48uAXksBPPOAF+fxumtRbmDe3SzUzStxedMg98mQW/ZQ
         sXwLHYe2R2SAhWOc/gD4M5rD34BQFCljMbNWeaaWceca1Ho9ACGWLv2fWtyYfPesXjgy
         owGw==
X-Forwarded-Encrypted: i=1; AJvYcCUK6PzasvDZrehAzhGyyojYIX1MoED1BgPAlYjAn/OfxDxK2cXVR+5aVSYbn8csKFSHlRJe4GPl2QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziDykrrgg5DTm/cIcdWvlOvvMdx1149GtoDKdp/4gADzwQXjwN
	HC5oUzrmvv8wjXpL1otqvPso8xpmWYs8zDz9RzCOQ/AAYL9uwMLYSsevJA/2IAnJMg==
X-Gm-Gg: AZuq6aKlzaRPOwFAaeNjEeP9XpaQz299Ik7Fc8+vfJlF7fOuRH/xlFN/ctUGTWQknX6
	3+ZI1SunP9l2/d/kJbFEGN/Zz/a9DrLnMhDNUWx6wGIPstV/fINh5yCfeHDd7/UjYT3cxG1gQc5
	GiuS7PjbJHF/X1g/gtm5AQJNYNPNIWApypE8fY/qUepqAI6YrTrObkIXDxPGwwOs/e3S7PgQXKo
	PM5ldQOn3L8To/FSNZXpKhUEMjMnxiPWpSzaAmEeQOCGVt79s8Gb/hR7WQ6FwIA5w3H06li5oHP
	CHAra91+//M3HQc97ddl6BDVKm9MOfpnp8LYoTh+Gy9DsqagxRcn1uCpc3lu4RnG48qtK7obfk1
	voWHd3h+9z3/Veiq2P1BA9j8QnODBxlJNKdergAVRBc0j/QuUtkm0ClaYdzX1cohjkOAXcVuxrd
	sYgCedEqrqHSPx6aWPJRBZqIszu5coqAa8YpKmEA4++MKb9BoKxoAN241WcMD7gFjqHVwx0LBSz
	MiIPR+DT9ut2g==
X-Received: by 2002:a05:600c:620b:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-48069c16922mr125053255e9.16.1769700782288;
        Thu, 29 Jan 2026 07:33:02 -0800 (PST)
Message-ID: <1c69cccb-6247-4c2a-9011-2ebbae0f77e6@suse.com>
Date: Thu, 29 Jan 2026 16:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EFI: correct symbol table generation with older GNU
 ld
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
 <2506be14-5615-4221-b6b9-079c709fddc0@apertussolutions.com>
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
In-Reply-To: <2506be14-5615-4221-b6b9-079c709fddc0@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2F20DB17CA
X-Rspamd-Action: no action

On 29.01.2026 15:44, Daniel P. Smith wrote:
> On 1/21/26 5:05 AM, Jan Beulich wrote:
>> See the extensive code comment. This isn't really nice, but unless I'm
>> overlooking something there doesn't look to be a way to have the linker
>> strip individual symbols while doing its work.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Should we try to somehow avoid the introduction of the two symbols when
>> using new enough ld, i.e. relocs-dummy.o not needing linking in?
>>
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -339,6 +339,24 @@ SECTIONS
>>       *(.reloc)
>>       __base_relocs_end = .;
>>     }
>> +
>> +  /*
>> +   * When efi/relocs-dummy.o is linked into the first-pass binary, the two
>> +   * symbols supplied by it (for ./Makefile to use) may appear in the symbol
>> +   * table (newer linkers strip them, for not being properly representable).
> 
> Just a suggestion, but do we have the minimal version where the 
> stripping is handled properly? I just think it would be good to have the 
> minimum version documented here. Doing so would make it easier that if 
> the minimum supported build tools are bumped past this version, 
> hopefully someone will either remember or notice the comment and could 
> drop these declarations.

I've changed this to "GNU ld 2.37 and newer strip them, ...". It's always
extra work to dig out version boundaries, and then the other toolchain
(clang/llvm) still isn't covered.

>> +   * No such symbols would appear during subsequent passes.  At least some of
>> +   * those older ld versions emit VIRT_START as absolute, but ALT_START as if
>> +   * it was part of .text.  The symbols tool generating our own symbol table
>> +   * would hence not ignore it when passed --all-symbols, leading to the 2nd
>> +   * pass binary having one more symbol than the final (3rd pass) one.
>> +   *
>> +   * Arrange for both (just in case) symbols to always be there, and to always
>> +   * be absolute (zero).
>> +   */
>> +  PROVIDE(VIRT_START = 0);
>> +  PROVIDE(ALT_START = 0);
>> +  VIRT_START &= 0;
>> +  ALT_START &= 0;
>>   #elif defined(XEN_BUILD_EFI)
>>     /*
>>      * Due to the way EFI support is currently implemented, these two symbols
> 
> With or without the suggestion,
> 
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks.

Jan

