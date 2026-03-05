Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGj/DCM8qWkd3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:17:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177720D575
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246267.1545471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3tg-0004JC-E4; Thu, 05 Mar 2026 08:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246267.1545471; Thu, 05 Mar 2026 08:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3tg-0004Go-BA; Thu, 05 Mar 2026 08:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1246267;
 Thu, 05 Mar 2026 08:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy3tf-0004Gi-Lz
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:17:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be9cfc8e-186b-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 09:17:26 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so90834185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 00:17:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae0202sm34657045e9.6.2026.03.05.00.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:17:25 -0800 (PST)
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
X-Inumbo-ID: be9cfc8e-186b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772698646; x=1773303446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QEjeYz6lnIlzwxWNrjsCG0up/pNF6u3rQp6W7WOXyaA=;
        b=RN+1F8fOi93FZ/Iz2PcbpI0nCJcTRweCiG+Lq3Tq72Q/72JObprmHIgRw+2XCyQj8q
         cWD87rE6SbZo7HyyH9BG3vvx8LJQmzWAuWxixTc+8LZreQU13e0ZQx/BUUbZZClYlec/
         Wf9w99JRH2IniSYnLJu40ywCxtLlihPmnt0B5Z19X/9wjBNly9/Q7FWKplWyYwZw+M2d
         kSiA6i8v5JncWk+btsZFhO8WvfSHur9EouSdkkpDa2/lh9hp4izeLSZU6aw96ucAxJVQ
         93WIHXQEShtNyULdJCzBIY9umQVNFpjeOGPXRA4YF7HMgRJm0gDwitW45qPcYaAhahoZ
         Pu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698646; x=1773303446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEjeYz6lnIlzwxWNrjsCG0up/pNF6u3rQp6W7WOXyaA=;
        b=O9FeSIBGKFykBSFMvYB/VYTr8ch2MZ636A+uoDZfxHN/tqNxYuAJ1Q/IpgEGRF0lIT
         1YpFpYvw9ivbfVe1MeZgRg8k7Z15ZeEg/3MN1I4gc8v2RnWZAAepHGWOL4KhU3EYeQpr
         k/Xy23VwS2bT3vDMvHkIJUT6ll1n1AjjtF2FPQ7+OrC86iOz0Oqvv3aOXSWzUcLZx1lz
         9Glu2L+O0Z7+czTxUOQJZSH4rRQ8NYyibQixE//7Ko0W0cNqhl5T0YW5sdLaM/e8QLpl
         VSO+8ikgTzAjU3ceJg/zeiU5bxO9bAHZ0nQHOgE5pk+q/VMWDhJZhDaZcAeHaKbUkGhU
         BhBQ==
X-Gm-Message-State: AOJu0Yy8iVV2KrjFlOWSQhQzDho2+q/NR2PF+A8FQTMts5BRHSLJY7Sz
	ZSvsDqzFACGVLLVPcPiVCKVubXfpaLMn7TnZuBsZSPw9oRZl2jwMrFiw8W5P70O0Lg==
X-Gm-Gg: ATEYQzzE6y5He/qPPWXGgeHZhyThfVU2U1Y81i6gKHV6KI+tJWgxqeonDYPxaFDS+IF
	QXjBP0nqo8h6Rvyo/G6FZZjI/xG62vPCkayBYieQ4YuOwJ3VxFejsDVKWEE+Y1Bsle+Fdu4P8Im
	iw+yt1AJs9ASzc62K8UAhFkHU4o3fo32e59FLB6i1c994871f6UFUYXXVa5gxg+P7wo1Dqj5cz+
	lVD+bVCC8vfOEPkYzWTa+SXujt+1XYBTFEyEyYnF7vJEbLN1FEtUn+V70GOBHDXBWXqwV/vUgS4
	HT/bQtpdE+H8elQLP6tN4BXra/Sgpxc6WJI0ZJDw2Oci5cDHzlSg3rxYiYY1JrA2MDjQ/0l1YoE
	z7XXBKS11f1vEaux3q+g0gMyCBw+EEgLx49eqkl/CXXfxlT7XLwv/7lLphbshG0WhZghOxfZ3V+
	U1+wTS715YYYCoBnDWAAbRQtijYjbhVI58cbgNyIqCIaQwof7+fflcBxO9kjRDMOM0YQzcUKCR0
	gn1x4Up3bo5k2Y=
X-Received: by 2002:a05:600c:8b86:b0:483:3380:ca0c with SMTP id 5b1f17b1804b1-485198bf9f7mr98613605e9.35.1772698645782;
        Thu, 05 Mar 2026 00:17:25 -0800 (PST)
Message-ID: <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
Date: Thu, 5 Mar 2026 09:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
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
In-Reply-To: <aahfgDDNVwJPa-jF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9177720D575
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

On 04.03.2026 17:36, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 03:37:25PM +0100, Jan Beulich wrote:
>> The treatment of ACPI_PDC_CPPC_NATIVE_INTR should follow that of other P-
>> state related bits. Add the bit to ACPI_PDC_P_MASK and apply "mask" in
>> arch_acpi_set_pdc_bits() when setting that bit. Move this next to the
>> other P-state related logic.
>>
>> Further apply ACPI_PDC_P_MASK also when the amd-cppc driver is in use.
>>
>> Also leave a comment regarding the clearing of bits and add a couple of
>> blank lines.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Including XEN_PROCESSOR_PM_CPPC may need accompanying with some change to
>> arch_acpi_set_pdc_bits(), but it's entirely unclear to me what to do
>> there. I'm unaware of an AMD counterpart of Intel's "Intel® Processor
>> Vendor-Specific ACPI". Plus even when the powernow driver is in use, we
>> never set any bits, as EIST is an Intel-only feature.
> 
> We possibly never need to set any bits there for AMD, as those _PDC
> Processor bits are Intel specific?

Indeed, that's a possibility.

>> --- a/xen/drivers/cpufreq/cpufreq.c
>> +++ b/xen/drivers/cpufreq/cpufreq.c
>> @@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
>>      {
>>          uint32_t mask = 0;
>>  
>> +        /*
>> +         * Accumulate all the bits under Xen's control, to mask them off, for
>> +         * arch_acpi_set_pdc_bits() to then set those we want set.
>> +         */
>>          if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
>>              mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
>> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
>> +
>> +        if ( xen_processor_pmbits &
>> +             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )
> 
> Currently the CPPC driver is AMD only, and hence when using it we
> don't care about filtering the _PDC bits, because the ones Xen knows
> about are Intel-only?
> 
> As you say, we likely need some clarification about whether there's
> _PDC bits AMD care about?
> 
> Linux seems to unconditionally set bits in _PDC, so some of those
> might actually be parsed by AMD.

Or it setting whatever it wants is meaningless on AMD systems. Where I
have extracted ACPI tables readily to hand, there's no _PDC there.

> I think we might want to split the setting of XEN_PROCESSOR_PM_CPPC
> here from the addition of ACPI_PDC_CPPC_NATIVE_INTR into
> ACPI_PDC_P_MASK.  The latter we can possibly untie from the questions
> we have about AMD usage of _PDC.

Hmm, yes, I can certainly split the patch. I'm looking at it a little
differently, though: Us leaving any P-state related bits in place when
cpufreq handling is done in Xen has been a mistake anyway. What's
unclear is solely whether because of us driving things some bits need
setting (likely none if AMD systems indeed don't surface _PDC in the
first place).

Jan

