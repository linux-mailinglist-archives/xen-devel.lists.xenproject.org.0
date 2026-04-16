Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBqRMfeU4Gn/jwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:51:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624040B32B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283028.1565335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHUc-0001Jr-CU; Thu, 16 Apr 2026 07:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283028.1565335; Thu, 16 Apr 2026 07:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHUc-0001IP-90; Thu, 16 Apr 2026 07:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1283028;
 Thu, 16 Apr 2026 07:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHUa-0001IJ-QZ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 07:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHUZ-004srb-KP
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:50:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e094c1-bab6-0a2a0a5309dd-0a2a4502b9a6-14
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:50:27 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e094c3-af86-0a2a45020019-d1558034dd12-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:50:27 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso92438315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 00:50:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f57da2aesm56616015e9.0.2026.04.16.00.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 00:50:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1776325827; x=1776930627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMXhL46ToYC2144wJofpwWHHdAPTGr07OEbGF3f56j8=;
        b=JkX1bfIDVS22QpHmcgMYfpc36adLDI01ES+siqTh9Lj74NE7FcOEkuhm1v1XHBbfZF
         fcZCGVbVV4YIpF2rqbJG+FVDZCGUuSmzEAZ1y6etYgYm86ZOFuQe6lvg3mmMyCszYJjR
         6exkCldvFfxnU0vBtlXGNPzk6Lkv58mfl3rPPXdz++k1GFuTlMUtKAC55/3OrkTIlZnk
         n9NtZ2Ns82NDIpm5KhjZ99bNIFUOdW2NsNVEyLDbAj0v2xcNgAWEKuc4uciCeklkaVIM
         O2ScrPWLJaZve7ooOkpUB+UEc6dUS22+VdnjQzE/hXC+bncMUzvyZdzUSnEXfI1nLxa9
         1vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776325827; x=1776930627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMXhL46ToYC2144wJofpwWHHdAPTGr07OEbGF3f56j8=;
        b=i1yKWRHwruKMxYFI6nw8Khr4auwMphPk9EkMQtuRlqCbE+bAIPtY8XiVEPGrssBzkX
         vEXOh5gOCUuoTjUfsXGlVFR+Dt2DAlle8Xl4xElMuJ/V0MFp2U+zXPFM9Cbwi0TNjc7K
         UMdysjsq+3rPh7iWUH11krgFRIEmsq0/ZnA8Emc13o5Cs6yC9ay71S63K7Xyywz1YxSy
         Pd7E2oZoPjCMqRVAFyhn0IGatvZLlbwdmgct0pIdfeWFeW/LSSBGRvD/XD5lLXjqp0Bl
         jrjU79hoQSFsX820iHNa7MPtcUlys7NUoXSKJLoyaEiuQJvlyTksfVroaUMBRwTO3eBU
         GjSg==
X-Forwarded-Encrypted: i=1; AFNElJ9aWVhp7c4vM61x0EW9xlHp7GEcxEnoyv+C+xb+mYfaqNDb/BlErRawWmtW4jAKAk9UivYnDLDPYRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOLnIggkfFz/qkY3QXVVufGYsjJFwnPxygKHoRlR2523QUIvMO
	FWSARF95hVAjBZgMmLAcvCc5rladklOMLLmBXKoB7pGjW/YcqsVXRzNFKV7btfsAPg==
X-Gm-Gg: AeBDieskoXY10mkBN3kLxFlaxI6TdRNwSNisXCepm3L9QI8FFR41hVylndlQBGQ2hXO
	a7BE1fabxGEuuB26l+yGQ06QrfcyPdNRPq2z469OJPG87bM+CmTYv4sGVKswQIgv/LzyzPLvJAt
	dLB+j4XicceUdx9/ZEiQirlIrCJ7W3wUsTK7M+brCyYx4qg1Oj6Otz0erhjX0jl3bwV9H38bDBQ
	2mJrLR8OumSGm1tJinaAd6rkb8XXguw8AbEbjkO15gLqCtw2x//H220mfuCE8dCSH5z7M2hLHyw
	fgn9DwpiJpUQ99EEjZpfGnrWwtWsQnr+9loURArV4PJKtDV6jxOAGaJ6BJKcGQB9s3otfAKnWlM
	YK/f2ti9FwX5AViW0YW6xeD6S4/IOS6xDlAxOA2EgGNRg3SlRS4E0/4D1KetZgUMGV8RpIZej6O
	ebKnzf+XV9QcgW5m0oCLEnORVyshX7IVuPFW1V4Eh5gSqWAiMLKC2f6KMQIck5F2Ol0uTeD7hmG
	tfLTv9wYOUmoM+BoBd18Bm4Lw==
X-Received: by 2002:a05:600c:4709:b0:488:ae6c:42c0 with SMTP id 5b1f17b1804b1-488d67d2ab2mr298039035e9.7.1776325826868;
        Thu, 16 Apr 2026 00:50:26 -0700 (PDT)
Message-ID: <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
Date: Thu, 16 Apr 2026 09:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
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
In-Reply-To: <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776325827-82969161-BA3636A7/0/0
X-purgate-type: clean
X-purgate-size: 1738
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 7624040B32B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 19:41, Andrew Cooper wrote:
> On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>> index 7efa76fdbcb1..80f0e9ddae6a 100644
>> --- a/xen/arch/riscv/time.c
>> +++ b/xen/arch/riscv/time.c
>> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>>          panic("%s: ACPI isn't supported\n", __func__);
>>  
>>      boot_clock_cycles = get_cycles();
>> +
>> +    /* set_xen_timer must have been set by sbi_init() already */
>> +    ASSERT(set_xen_timer);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>> +    {
>> +        set_xen_timer = sstc_set_xen_timer;
>> +
>> +        /*
>> +         * A VS-timer interrupt becomes pending whenever the value of
>> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
>> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>> +         * ULONG_MAX.
>> +         */
>> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
>> +#ifdef CONFIG_RISCV_32
>> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
>> +#endif
> 
> You've got this pattern twice in this patch alone, and these aren't the
> only CSRs which are formed of pairs to get a 64bit value in 32bit mode.
> 
> Sadly, the numbering isn't consistent for the high constant, but we can
> let the compiler do most of the hard work for us.
> 
> #ifdef CONFIG_RISCV_32
> # define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
> #else
> # define __csr_write32h(csr, val) (void)(csr, val)

Just to mention: Since the comma is an operator here (not a lexical element
separating function arguments), more parenthesization may be needed for
Misra's sake.

Jan

