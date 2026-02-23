Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC9hJBODnGkKIwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:40:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE0179FB5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239267.1540709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYzB-00026J-Rn; Mon, 23 Feb 2026 16:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239267.1540709; Mon, 23 Feb 2026 16:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYzB-00023k-Oc; Mon, 23 Feb 2026 16:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1239267;
 Mon, 23 Feb 2026 16:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYzA-00023c-Bx
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:40:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e5434c-10d6-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:40:37 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43590777e22so2779700f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:40:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00768sm19945437f8f.10.2026.02.23.08.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:40:36 -0800 (PST)
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
X-Inumbo-ID: 61e5434c-10d6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771864837; x=1772469637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc9jEP1X7SCH7rR+O3UuEd32paWL5Oixf1DpZO/vhR0=;
        b=AVY4XEhCme1Fgvtu5+Wfyb7LwTaKCzkn4CaCj0NrxSebH4dYDaXE5z/99cMsfTzjKk
         2ar9kK+KfJ1IZ2GzajUNof2v58iAzcyf61ed2x8qylCkiuvxcBPA/oAeHTEaZqciOnh7
         1AZqHHYTT9TIArmiheh2xUz3sUxiOXWT7YbXs5B8HdyXJ1SKi8/oMTljvhjf18G/ApE3
         gM2BC/kvymO0txDErxW4FrvG2KL/slllMfI48uMqwzwetLy5elkUlfGC/5Rqf9ZkXUcR
         L/dsenkJBo+e346pbnjwhaBfDh93PteTutieIyps2Mo7GnWdy102g6j5/VCqgscCtINn
         fIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864837; x=1772469637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc9jEP1X7SCH7rR+O3UuEd32paWL5Oixf1DpZO/vhR0=;
        b=DobB2Foqs70AP2hTLGYNWVZ8jIQ3GqoYOBJxaU5EHufrEHnzcxPDHCU7IuNOALH2I9
         QjPchzjYCwR8v5H8mjYzO/uhUiclbzUMTrRptGY5qbSA+f97zbHsnayMUfM/6VbADTdx
         l4om9lU2lWxtC1IlNpEHx4eGxmRPryAn+JbjSZtZq91LgxKhzRICqeKPZZ4wNBJf5dsH
         PMAA3a2jaY38xJ/6Xp4NYNsrE+XD3phytWce8HxYZcy5VrQe18/00ZAsV4CY5YDQKuvg
         tmKuvUT7t07sR/lbae3rvCcivhSTUyj1uby65Golr8pKOoZKnoDMGsQ2qnMKauFuI4jG
         gmfA==
X-Forwarded-Encrypted: i=1; AJvYcCUgk5rT904tHEcyAC5SJo35aiXBhwNVcOWkgWr1BQnQvJL/dDQYtWrn04dIoRzak3W6SVG+a1KYzPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2XJtdvVRfWWrL4jTwVg5mD2Rgf0VOarWpGQqT9kp4HjVEmQ2l
	/NuPCn9vBfgOyhGnPcCraxwkKsRRX0MDRqnN0xozQ9o0f81pST2cmoXawIqN79+Yjw==
X-Gm-Gg: ATEYQzw/p6/SMe3dWfPH49ReyxZ8FJy72UQ16GgH1V+r+OSBre7xKfQNk7vntg5Nz3B
	VR881TPnjCHbI3A8N32xib8fSN8GaA5vwHtsJkBFxLxlD6LDzf6evauK/xmHLAU9gcpErVQy5vg
	1qJkWJMAmlSZ6A4nMOiziZxDKj4l8PtTJdGa5n1wR75tlywxI9ZP62vNeeqc08yaXx/7qQw7oJC
	y6FdZCqkSUSiu4ZsPmnbnjurK0a/dMwDQHx11SJTNwbTPfVXIBkqZfmpm3RyUK05L1eqMMkMT22
	3XTo1gOKcAKQTeR5YYUVuvyeE0uGMlFp+ipdkLV2SIbQiFv0g0QUhEwhyanoqwuCPSxy9ST6fKV
	v9GoZopEP0XRiMP/US7AMeJKw42zKshQHL24CWYT08UvDYDVyhGmGp9bcuiQnATfSv4Q8Q9+hS6
	rtyazPtzwuDI36rt18brojLp9fVGvEdKYy+ObsUJGnm3nnMwVtZhK9Z/dMNmrhrp9+0VUy5V8TN
	XZm0CCFmzZcqtU=
X-Received: by 2002:a5d:588b:0:b0:435:6c8d:d017 with SMTP id ffacd0b85a97d-4396f17b315mr17041567f8f.32.1771864837187;
        Mon, 23 Feb 2026 08:40:37 -0800 (PST)
Message-ID: <c9b20e41-cab5-4fb2-be32-cea6668a56ae@suse.com>
Date: Mon, 23 Feb 2026 17:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
To: Andrew Cooper <amc96@srcf.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
 <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
 <c69950cf-7544-40e4-a58c-e2b826f6a5c9@citrix.com>
 <76041b1f-aeb5-4d9e-af6a-a2616763e5c3@suse.com>
 <7cf0df43-6271-49f3-8bc1-ceb54f4b8463@srcf.net>
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
In-Reply-To: <7cf0df43-6271-49f3-8bc1-ceb54f4b8463@srcf.net>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amc96@srcf.net,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 09CE0179FB5
X-Rspamd-Action: no action

On 23.02.2026 17:36, Andrew Cooper wrote:
> On 23/02/2026 4:21 pm, Jan Beulich wrote:
>> On 23.02.2026 17:06, Andrew Cooper wrote:
>>> On 23/02/2026 4:02 pm, Jan Beulich wrote:
>>>> On 23.02.2026 11:04, Edwin Török wrote:
>>>>> clang-21's built-in assembler is enabled by default, but it doesn't
>>>>> support some mnemonics:
>>>>> ```
>>>>> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>>>>>  2636 |                        "fidivs %1\n\t"
>>>>> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>>>>>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>>>>>       |                        ^
>>>>> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>>>>>  4251 |                        put_insn(vpcmpestri,
>>>>>       |                        ^
>>>>> ```
>>>> Was this reported to them as a bug (or perhaps even two)?
>>> Looking at just one of these, the mnemonic is FRSTOR without an S, and
>>> Clang 21 is happy with that.
>>>
>>> What is the trailing S supposed to signify to GAS?
>> "short", i.e. the want for a 16-bit operand size prefix.
> 
> But that is normally spelled 'w', not 's' in AT&T syntax.

Floating point mnemonics look to be special (and AT&T syntax is absurd in some
situations anyway).

Jan

