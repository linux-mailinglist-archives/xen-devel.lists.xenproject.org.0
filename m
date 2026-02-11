Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFfsJgKYjGnhrQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:53:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8B12557E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227761.1534189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBb7-0000tX-Tc; Wed, 11 Feb 2026 14:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227761.1534189; Wed, 11 Feb 2026 14:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBb7-0000qn-Qh; Wed, 11 Feb 2026 14:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1227761;
 Wed, 11 Feb 2026 14:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqBb6-0000qh-NT
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:53:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c885d8-0759-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:53:43 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so1799705f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 06:53:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc54csm5114630f8f.25.2026.02.11.06.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:53:42 -0800 (PST)
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
X-Inumbo-ID: 75c885d8-0759-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770821623; x=1771426423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PVLB1q7EISviKkx7eVoIwrYqQArt16a7JSdeDujZ43I=;
        b=cXdfrWH7LXF1ROgNAaWFvpe7HN0nfxhL2wlZCy6xg0dLpMCi0WY3jfR9cuLirgh7KA
         BDkZ5DZodBo9r1+ejA+z9t6bafpASUb2r5HXxA2b6LTFl/uaESYsIx+Qz1LZIglT4ojf
         IWtDU/fOtsnffk4jxjScLPQKbiIBzCYVsBVY6iL+YBOw+cZLIF5Y4ZnZz9AnQRAMCb9l
         QwJKfP45u88WXzghfDejxQJpmGFxwKy8D1gVzQDGkCAVI7brIdYWhqmPzY2SLTVPQ7Gb
         0/Q3PKNB3MQuhTLO3MdkUu1+WXJ6Ry4RkT0IBVfQ6k5/2eF2EePwb0DSMMHXMuQQ3wJb
         ZK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770821623; x=1771426423;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVLB1q7EISviKkx7eVoIwrYqQArt16a7JSdeDujZ43I=;
        b=jmM32TiXt6Sn+k6CxAqOdGWCtd+gHu4ljOx+HgmUF0arEvLTjU6cxWYooc8CriNuyO
         aTSzSJ8/O2wWThSKniq4uci3Jotue+jBIamk6aYp/N/BphEwiMxU8JZ9tdrtgxYSMPKv
         KmcR5bLaqzhQ2RaSg7wngnL559ZxrgCHC2MhIB3Ze0CI5bLOOy0Z/CfOUg3J1rFJ6mOj
         8mYXP07RNt8zblTHxZHQ93DWXkJ8UvYBQgWY4UtwD25ycE54c4cMTDn8pBHPUfdO7w+X
         2asJjHIk5Sj2UE1Q0C+Qw5zY7dRIj2trP0z+btwYlaS1DlU4z7eQy4eAtzHN8iJwekCy
         iGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfdzc4DzaNZWTsGKofU7HGEMpuOqZ0c0Hb6l+UQeOj2gX7+bNMmu+pVoKnX04IT5MNHxN6usseWnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmoxsSFY4HG9hXWsu66VepNO/o0eqZMmQPsy3IxgpoyBqaXw2j
	dqTltFaLvuPKFlVu2sXY1Ky+6yB8jgP3z6f9t58OGkBOHxGAaTJQs+OfxY4O2Ua5Yg==
X-Gm-Gg: AZuq6aJM+KUkypfpdYsK69ZLLXr7cEDsWm80UN0EdPFgbWexLMCMy6PFQDWJwF3OpjC
	pHfPj6iz00Z4+5Lnm8h66W5EJrToOndu1K/TrLn7J+MrdnqfVcfawr6afQjJ480QSNZGRUzlrq8
	+tNV9++s3ABqjkrhtM2NWQ2FvuKxAp+bQ1f+pwbFng/fhrKNCPQKrwAg5v2S+a5AaLoqaPa/fvL
	L7NaHiNSxlrqBj/HKcttSCDaRn1xY5sKg6r48EoqyJTKdyuuNWQzsjEyXcICM1xh7jOxdQrLOEr
	AOduWRRHeHTrveqKJM3/u0MvD5x4YFGXOOjZG/o8W+W3Aw7oxiULUOETEXiy/jdeIhpN1dThqfG
	NgBwjA+vQ+rplThvzL89ggLidftxcCsVThmeHm2ML41PMTbhsWZueeDWv1XBJUEyLQs4AjCNMU2
	1EBAvYPEASVnNK7lumwX90wLM9obsKoe/eCZf6LA5C/gRiwR02Ja20APsw/N28+F5LuXsCuVbfK
	au+igfW7WnEXaI=
X-Received: by 2002:a05:6000:24ca:b0:437:6806:994f with SMTP id ffacd0b85a97d-43768069f85mr20510678f8f.12.1770821623054;
        Wed, 11 Feb 2026 06:53:43 -0800 (PST)
Message-ID: <5d108b61-f46e-404d-ad03-18a0405fe44d@suse.com>
Date: Wed, 11 Feb 2026 15:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
 <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
Content-Language: en-US
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
In-Reply-To: <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 01B8B12557E
X-Rspamd-Action: no action

On 11.02.2026 15:16, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> @@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
>>  {
>>      vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
>>  }
>> +
>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    /*
>> +     * We only allow VS-mode software, timer, and external
>> +     * interrupts when irq is one of the local interrupts
>> +     * defined by RISC-V privilege specification.
>> +     */
> 
> What is "when irq is one ..." intended to be telling me? There's no ...
> 
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
> 
> ... corresponding code (anymore), afaict.
> 
> Further, who are the prospected callers of this function and its sibling
> below? If they're all internal (i.e. not reachable via hypercalls or
> emulation on behalf of the guest), this may want to be assertions.

Having seen a use in patch 08, I should clarify the "reachable" part here:
It's not the "reachable" alone, but whether the guest has control over the
"irq" value passed. For the example in patch 08 this isn't the case.

Jan

