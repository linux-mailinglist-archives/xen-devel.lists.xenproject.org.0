Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SHkEHFVUMWqlgwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:49:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0028690175
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:49:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=J+DdYwjr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339250.1600407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUA0-0005Gx-LM; Tue, 16 Jun 2026 13:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339250.1600407; Tue, 16 Jun 2026 13:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUA0-0005ET-Ii; Tue, 16 Jun 2026 13:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1339250;
 Tue, 16 Jun 2026 13:48:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZU9y-0005DG-MJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:48:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZU9x-0064dA-Ur
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:48:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315425-e002-0a2a0a5209dd-0a2a4502a80e-28
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:48:57 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315449-af86-0a2a45020019-d1558029e5ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:48:57 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso34454005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 06:48:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47ce3sm91122625e9.6.2026.06.16.06.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 06:48:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1781617737; x=1782222537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uJWI+YqyLtmeJtzFo5vFS4zLaKD0KZ7p4ywC5qWN6as=;
        b=J+DdYwjrfQXMJN69a1/JAffnsD6H2Tr7kZSX9awlmgjIxiK+9L7XMWxDfCCGoJs9p9
         X3rR5yhMaaUG+3KKesYJpvArqmFGgd0W52HoL2HXgeBz9OCyd2b88Djll4S3sbddA6dj
         sJp+bw0xvWo5trhMS1bLYvLMYJcV6NqfqZLD0IXpddvYjqJJN9cIso71wEZt2Zg1rELT
         HGcaJf/93A5KOflnDBIps5SLAdaBxyzttB0NzpNWt7ye5Ru3P8RdQMYmbbROJldmzSZT
         J03dIIzvdTjfsy7VeocxZfVOLx9Rf+6JgMZrwsXNdIGX7pk2MwiQlbQFDOMX87ckWaxD
         XHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617737; x=1782222537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJWI+YqyLtmeJtzFo5vFS4zLaKD0KZ7p4ywC5qWN6as=;
        b=f09lhZhGFM2GRoTaEGDSxBmtm4HWeSR2FixVaLBx/uTKAtRHTdOXwBxlBpAypY9yrw
         5jkzMNpYmDb6IABDYEdrbEZT8ou5d5PuPMxm3H5KlU0tSCT+qSmAw6MOrQnKEMCc8X6P
         Qp3LzFyGgtHzspVhP2vsI9nr1K8VPtCNAarhgUoMbsB0D4s3/W/wvOW8t+ZLeb0J0K5y
         Fsl7qTbuNLN9/EuA+7itxESvoc7mTXerNQgJlhDhbPtnLrQKdbngrkVmmmvI7tuIB6Ec
         Qa91S9NUNnIdgZnJXMZ+klmjtmo3k7j3eJsrJcF1SpCGPBhZ6nfY1QOXTXaN3q/UTQ2B
         YyMw==
X-Forwarded-Encrypted: i=1; AFNElJ8PtapO1U7r4sMyW1UC3tQSJGUfhwsIzEvyw50HHXsNuDz5Lz6SSTHo/+Ed1R6xwiBWicmDBAB6Lzw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrHlgm9pQ0VTiO88qOW6GbP1ScOMWiAhw5Wy4Qg8MzcP9800nX
	37pE3vRHa75QrUG+GBx+yI1Ci1EBbou3KrqRtf+2b7xO1SkjTXeweWl/usEENtAZPA==
X-Gm-Gg: Acq92OFM823+tXY7KNgxrwuOV6cMq463skoOIhZRa8ccynn1CbzLhEnIC2tG+OWanNq
	BvnnxrhQ0G1lP7hWMerJ0W7DvyxzOXWuciW1Wv203dDkW3/+y7E84oIIrZ54+LPPacptZ+uKz0y
	A+zcBght6eq/KwbrZNIGBSTrN2qek+lDrnVB1Z7ODMPKSCHB0ku8qzimvGwJLykOUirwxGSrZKv
	cPi5l9cjwU4oZIdOuJGGw76Q8A4yCugBWiYMU7fREnY0lhL+7zAbM2UbFDwzz9Ub9YGH7G2sX5L
	zWmR9qZjfyxEKW+9x3QWGmeMgHNrfsjwBTzGdQ4o7a0NSwnvdCaerCT5woliA8zl17QTJ6THfgL
	H730IThVGCP3QBKJvcxircigHexWH/QPx0JkcXWN98BklJe+fdpSXrOsvxy36ji8cR58A8NU4lg
	yOYddy5Xd3QMZruLlOVeaGFIHPzNRnr4U6s5e5CfkS6aoX3MQ07J08hKhnLT3MOJjPP/a1MklX6
	zR1dM1KNcrMuFXsJoy1QdgoFw==
X-Received: by 2002:a05:600c:c490:b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-4922ff9898amr53739015e9.12.1781617737240;
        Tue, 16 Jun 2026 06:48:57 -0700 (PDT)
Message-ID: <a12b80ea-7361-479f-8fbc-ec5f5aa4ceaf@suse.com>
Date: Tue, 16 Jun 2026 15:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/ucode: Exclude Zen6 from entrysign digest
 checking
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260616104534.22995-1-andrew.cooper3@citrix.com>
 <ef1f84c3-68c4-4619-9e32-b008e91725f5@suse.com>
 <dd974236-b6d6-4eba-a78a-5acd1ee17589@citrix.com>
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
In-Reply-To: <dd974236-b6d6-4eba-a78a-5acd1ee17589@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781617737-A8979161-714F783D/0/0
X-purgate-type: clean
X-purgate-size: 1561
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0028690175

On 16.06.2026 15:26, Andrew Cooper wrote:
> On 16/06/2026 1:36 pm, Jan Beulich wrote:
>> On 16.06.2026 12:45, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>> @@ -128,7 +128,8 @@ static bool check_digest(const struct container_microcode *mc)
>>>       * the digest of the patch against a list of known provenance.
>>>       */
>>>      if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
>>> -         entrysign_mitigated_in_firmware || !opt_digest_check )
>>> +         is_zen6_uarch() || entrysign_mitigated_in_firmware ||
>>> +         !opt_digest_check )
>>>          return true;
>> Besides being somewhat fragile towards future changes (to the family range
>> covered), this also sets a bad precedent towards the comment ahead is
>> is_zen<N>_uarch() saying "The caller is required to perform the appropriate
>> vendor/family checks first." My understanding was that a single family
>> should be checked for in all such cases, not - as is the case here - a
>> range of families. Using the (seemingly) opposite is_zen5_uarch() wouldn't
>> be correct here, after all.
> 
> It is true that they're not symmetric when used with ranges.
> 
> But "appropriate checks" doesn't mean single family.  I suppose it
> really means "know what you're doing".
> 
> Entrysign is weird.  All other uses of is_zen?_uarch() come with single
> family checks.

If you're not afraid of building ourselves a trap here:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

