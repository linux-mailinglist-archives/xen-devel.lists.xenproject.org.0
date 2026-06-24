Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 01DcA1N/O2pCYwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:55:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F16BBEC6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:55:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Fv/l9abo";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344572.1603626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHVn-0008I2-9z; Wed, 24 Jun 2026 06:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344572.1603626; Wed, 24 Jun 2026 06:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHVn-0008Fg-6q; Wed, 24 Jun 2026 06:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1344572;
 Wed, 24 Jun 2026 06:55:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcHVl-0008FU-CY
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 06:55:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcHVk-001GJG-D4
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:55:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7f42-2eae-0a2a0a5409dd-0a2a450cc48a-6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:55:00 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7f43-94a4-0a2a450c0019-d155802bb1c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:54:59 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso5694805e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 23:54:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492609154cdsm29372565e9.1.2026.06.23.23.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 23:54:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1782284099; x=1782888899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz7Vaj0GGT6xCbJVX2HSkbEWmtZ7kFVwL22u/vcYl8E=;
        b=Fv/l9aboKs29kJ7aHbSyax/o5O/bwO4cLRN7qPPkMmcypHAsmM8I4ijvA2MNSi2TCu
         agpmOOzASbWgZe9KBgP6IgF/zhcO12v+N046KxrUc/jNqFk38wcnZAVqBe0/CmQj8ERN
         NFY0YF2FHVqO4wi4ihtPHf34Vja87qtNJl/hl3JmCxZDKdcwpQJuxu2tAbgDbL67ge+O
         uXWK6rfp2qgkWpsBEZYg34m82/6/3uR7yDXIjLJvvI4q9rOrg2vJIbOreMB74nZLqKHr
         hlp9MEiqE8FEEsctxynnv3FwxRUSlLeKJjZwXVISgW+EjyedobGXhZ4jbqloxtDIMTm7
         +kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284099; x=1782888899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz7Vaj0GGT6xCbJVX2HSkbEWmtZ7kFVwL22u/vcYl8E=;
        b=Djp83YWz+VfnUmf43Lram+6VP0nD2OpOp87sVYn3/54tT1kDHsp1jfF3Uh+1o+rkhS
         +VrycIWa3mLUouSETE2AmF6wwIn+QbVcUP9xt+/eLzvcNHZM4sxXfCHIoXgIgH1yC1QG
         SiDB5PX/Ssn6e0ytweYMJA+K54bUgZoeRyKsbzI1cg9J41/YdizcKXIKew7+VMcYhg3/
         NJqWBGgseZWL2wXOwp1kP16EwTDfI7oPVxK1tw2wfWffFTuRzyr/UIGpuxSCkDUTkAab
         cMar+QwXsfZ7/d3bGG+sXDXp5M44b8+vx2Fa3Wuw8BnYXbFY+9tTsAnO/qayrFy0KN8s
         5knQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1FfSsHK0yK/kYf7bk7qXySd1eqDaKA1pMHkXp1RXMlOTcjN4HBNFKFPBkBM4otaNrxiYLf8nNeBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3eNzQW8feqn+J0jhMPM3zw2+5MrLjbL5uhzlHHKYZFKyVkrY/
	oqpEwpGXCsEIxkuvF/nDpeKI8YgobAj3eAKm3Tsu+4pLaq4e1yBd1QPzf+3lR3BW/g==
X-Gm-Gg: AfdE7cnlOFnA+c2fjdD+cmMQlQiOXk9jbYTAiKqcEkjshkNPHhXc1SP6uPfj6hVZes0
	ppbHqUuNA5yegWs73saxBxZ9xXfV9ZFvuLrzRzKhdBQOdhgaDkGEmt8dcdFG3Air76SpEKwkBP+
	t9oKGBiWAJCn9Ao3KnaWQh81cfaPknftXxW7tAJ/NFwKIcnhp/M/iDgUMEFx6zbHvjK45OIAGWG
	Uw+44WT73h6JxFTYYY756a0XKE+HguZ7bh4e7PNoqquD3mrP3jn3hH8+1xgk86M0hdQN/DDANLu
	0zhXVNevAdb+/1E4UQB3s4tYyLMg9WdUlV+ASCMUbFiX8YTv0rhjFFDAW1LCfwkRMZk3G/81RUD
	eCfPask74Nf4J/ROhaudULw7jRYnkACW7/yGKuZjLI+DM9e8LarBV8s94sQm3CsrPLO+o4bA6h6
	MzZ4PE/MTBc2g4F67EZF6LYTI6l06P+hfXC7TZqxahMd8ZgqLPaZhpXpOfBjtHusRbd28pCXIZ2
	6d/
X-Received: by 2002:a05:600c:34d2:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-49249083bb5mr265165845e9.8.1782284099426;
        Tue, 23 Jun 2026 23:54:59 -0700 (PDT)
Message-ID: <dbb8ee7b-164d-4634-b738-cd9630e9f11c@suse.com>
Date: Wed, 24 Jun 2026 08:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/kexec: Zero GPRs before entering new kernel
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger.pau@citrix.com, ross.lagerwall@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-8-kevin.lampis@citrix.com>
 <63766e74-aaf8-48b4-8ffd-321f150132a4@suse.com>
 <eca91510-4681-4fcf-9b5e-e79c6c010b9a@citrix.com>
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
In-Reply-To: <eca91510-4681-4fcf-9b5e-e79c6c010b9a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782284099-D81C6ABF-7415B79D/0/0
X-purgate-type: clean
X-purgate-size: 1538
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:kevin.lampis@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 656F16BBEC6

On 23.06.2026 18:51, Andrew Cooper wrote:
> On 23/06/2026 5:04 pm, Jan Beulich wrote:
>> On 22.06.2026 17:18, Kevin Lampis wrote:
>>> --- a/xen/arch/x86/x86_64/kexec_reloc.S
>>> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
>>> @@ -78,6 +78,20 @@ FUNC(kexec_reloc, PAGE_SIZE)
>>>          testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
>>>          jnz     .L_call_32_bit
>>>  
>>> +        xor     %edi, %edi
>>> +        xor     %eax, %eax
>>> +        xor     %ebx, %ebx
>>> +        xor     %ecx, %ecx
>>> +        xor     %edx, %edx
>>> +        xor     %r8d, %r8d
>>> +        xor     %r9d, %r9d
>>> +        xor     %r10d, %r10d
>>> +        xor     %r11d, %r11d
>>> +        xor     %r12d, %r12d
>>> +        xor     %r13d, %r13d
>>> +        xor     %r14d, %r14d
>>> +        xor     %r15d, %r15d
>>> +
>>>          /* Jump to the image entry point */
>>>          jmp     *%rbp
>> Why is %rsi not cleared here? And why is keeping %rbp non-zero okay?
> 
> %rsi is the parameter passed in the previous patch.

Ah, I didn't look closely enough there; I merely checked existing code. A
question that arises: What guarantees that in the 32-bit case the value
actually fits in %esi (i.e. the upper half of %rsi is zero)? I can't spot
any check in patch 6.

> Linux used to require the entry address in %rbp.  I think relocatable
> configurations can cope without it now, but we don't parse this property
> of the image.

Okay, but the description then better would say why %rbp / %ebp are left
alone.

Jan

