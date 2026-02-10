Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC3bIJQZi2ljPgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:42:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9711A5A8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226307.1532849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpm83-0006u3-S4; Tue, 10 Feb 2026 11:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226307.1532849; Tue, 10 Feb 2026 11:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpm83-0006sK-O5; Tue, 10 Feb 2026 11:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1226307;
 Tue, 10 Feb 2026 11:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpm82-0006Yr-QL
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 11:42:02 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e589fe-0675-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 12:42:02 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4834826e555so16775015e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 03:42:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d835f6bsm49106975e9.14.2026.02.10.03.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 03:42:01 -0800 (PST)
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
X-Inumbo-ID: 83e589fe-0675-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770723721; x=1771328521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iGBjopm/fQWLDgBAA6SIJVEeq8SnXaq3tpyu0grrK3c=;
        b=KMPR1C/yE63lVFaINbOLtLmyLYd67WpZxctNQYrcA7c4YJ7hk66gwPM6m/XqBzhKo4
         KURT5i0k8Qr/25W4qduJnjoMPy4OA1xUzCYnHkP+1uUviQbD3va2jq2thSW3ElV3oycW
         H45h990rCWBRULlZyC+QYMsEux4WAnv6VfcuKKaO2xAzTifZlFWt6/OVgDj8rIevUVXj
         An37HBr0jntS9lXXcB2vUxEnBc1kYM2lGg9pFPvBBeAJb83lWIbKZ7it03q4b5CNOumC
         v6Y4/MKBkwjzK9wEqm0Vd5DfTcb3wm1SrdOsqr7sKIw3Fg27ePhUM6HMlYoBXns7cnJC
         vlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723721; x=1771328521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGBjopm/fQWLDgBAA6SIJVEeq8SnXaq3tpyu0grrK3c=;
        b=vF5AjDOZMi9NnNtTWHv+ZNfRSnO2y7QThQZfa6DoKdSp+2imPp3kLDbGxg5UUISA/+
         uG1MkwJY8o/eBvhra1UUZs7vlUmiFBgzQR1/HjxjubkY/aGYbathRfayUOkbpSIvR5ba
         dAGlTBX46tSKkYsRwLkYHJUxa7zEv+du8TYXGsbEQsEws7Oxi63ZAJameykt3VPehPug
         tJSZ0pw4szRg/vE+cHBLfg/SmjdTnmqyOgYJw8eVQqQiOH/OHXEl3Fey1v65bb4LeBxW
         UDblRZJMYD2ZTZNO+E34i9ic7FCvLdaN1mO935Vp/UOLgpwDHztl4u0n93FIt1EkF+5B
         IN4g==
X-Forwarded-Encrypted: i=1; AJvYcCUh7pWLr77gRZLUAhp8oPbG1AgUyvJt8WJS6Nn5qYoJ245ftGCEXBarh1/NJJ9X0aYt08byL74qRQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymUwPOEBFLf7IP8b+/1w/w38M2XlnwTHzGio1ER29fjb3NecoH
	MHJwiUdemUTftPrTy/65DB5gLsinyovlxh3i+zX6lQve32I4L97MNbvNJyn9GE3q/Q==
X-Gm-Gg: AZuq6aJeKS4DviPLISz7FwfBmNq4lPx185inCCNtMuRvTtusOZh5py7Al2q+3oySIJS
	ChVTn7jl3ZUxCR6TX6OA2th+jEO7EWwq9/9lH5hchjOu2Ne4Gv70prqp7v8v54sv31V7ohCi+fy
	R2D1QaC8rKsoARJBVybFYnM2h3AdI9P+ezq+Vl29JRYc/tZshiKihnNAH/c5XtnuaEq0bBhABJW
	Ne97PD2oRCY2GhlVHt9eYZvruN3YDnKWuHSW+JehsB/vJ18xn8CkyNksv1Y7FV/qCNeK8IlNV8q
	aQhGEKtyk2hm7Rc6YZ0OZW2q+ywGZadASvUfWTQLeZCeRo9MDbIHOMJ4h3Byo++OimY0JhDseUy
	WMoxJnr1K45AQ+Dq8inX7sWSCABcFLEGURGd8sZutwY0UoRNi+jm//egd2r1LgAKLSY7nFAr4il
	tMTlhppz0rXKOpywDEzLqKCsgONKfrTvHsNH9EPJCw1LvnJs8oMvgikfaQ5DcuO3W3KdHpcJkPq
	u02oBYEpuxlYac=
X-Received: by 2002:a05:600c:3d96:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-4832021e86fmr216429165e9.27.1770723721354;
        Tue, 10 Feb 2026 03:42:01 -0800 (PST)
Message-ID: <9c7930ad-196a-419e-b81c-d87cba5973db@suse.com>
Date: Tue, 10 Feb 2026 12:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
 <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
 <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
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
In-Reply-To: <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
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
X-Rspamd-Queue-Id: DEC9711A5A8
X-Rspamd-Action: no action

On 10.02.2026 12:15, Andrew Cooper wrote:
> On 07/10/2025 4:58 pm, Jan Beulich wrote:
>> On 04.10.2025 00:53, Andrew Cooper wrote:
>>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>>> is active.
>>>
>>> Fix a typo in the parameter name, which should be shstk_base.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
>>> to parse as an instruction immediate.
>> I don't follow. Where would the 2nd $ come from if you write ...
>>
>>> --- a/xen/arch/x86/include/asm/current.h
>>> +++ b/xen/arch/x86/include/asm/current.h
>>> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>      "rdsspd %[ssp];"                                            \
>>>      "cmp $1, %[ssp];"                                           \
>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>> -    "mov $%c[skstk_base], %[val];"                              \
>>> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
>>> +                "mov $%c[shstk_base] + 8, %[val];",             \
>>> +                X86_FEATURE_XEN_FRED)                           \
>>     ALTERNATIVE("mov %[shstk_base], %[val];",                   \
>>                 "mov %[shstk_base] + 8, %[val];",               \
>>                 X86_FEATURE_XEN_FRED)                           \
> 
> I find this feedback completely uncharacteristic.  You always goes out
> of your way to hide % inside macros to prohibit non-register operands.
> 
> This is exactly the same, except to force an immediate operand, so the
> length of the two instructions is the same.

Might there be some misunderstanding? $%c isn't what forces an immediate
operand. It's the constraint (not visible above) which does. What we see
above is only an elaborate form of a format string, requiring that
operands are already of appropriate type (arranged for by way of the
corresponding constraint). If a modifier character like 'c' doesn't apply
to the type of operand selected, the compiler may issue a diagnostic, may
ignore the modifier, or may emit code the assembler can't make sense of.
(Of course a particular modifier character could, in principle, also have
different meaning for different kinds of operands.)

Jan

