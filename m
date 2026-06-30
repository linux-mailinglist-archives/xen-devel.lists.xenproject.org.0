Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8svLGbRtQ2obYQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:18:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14516E10AD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:18:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Qy5xoDl5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348403.1606191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSjK-000236-Gc; Tue, 30 Jun 2026 07:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348403.1606191; Tue, 30 Jun 2026 07:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSjK-000215-DU; Tue, 30 Jun 2026 07:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1348403;
 Tue, 30 Jun 2026 07:18:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weSjJ-00020v-En
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:18:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSjI-00HR1p-S2
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:18:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436da8-e002-0a2a0a5209dd-0a2a4503db80-2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:18:00 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436da8-ec1a-0a2a45030019-d155dd2adc4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:18:00 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-474560436c3so1297382f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:18:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cdccsm4665302f8f.24.2026.06.30.00.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:17:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1782803880; x=1783408680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cB3+0vemUeXI2Uzo2PR6jfKoX5L+eHskLUM47hS9yGc=;
        b=Qy5xoDl5KlHMU61p0laaBEzJtlvCxlta8piqsdvMXk+PZoDLaphvb1HbnWWdflLF2X
         Uo8BfzU+rwaFEJolIp134WEwwK88yKEQJehTH8DDVpU8S/vcgwl/rY78ekFqUfJQSo3Z
         7HtkmZIYGZMN6zsPuANSS9un5sHl7F3NTA00XkkYv9pvAnWMmV5hl0xC8oojTaHSI9kV
         +biv5CzVY7uQXO+ydF9dKJc7zFIdUCwqMN9/poSPhaTxMoGhThn8xBTBihu6sKvn1BSh
         Fx4Hq/pYNGF2AcqKVbElqLf6Dl4tq1Czdiaf4HWbpyZvbUHD+LLlTL0k03byxwB0/11o
         S/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803880; x=1783408680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB3+0vemUeXI2Uzo2PR6jfKoX5L+eHskLUM47hS9yGc=;
        b=tD7KaVr3EEQFRV+nMijtDnZxg886COSS4tX0gHStxkuFifIiz178ometkHha2xPDAK
         vrAlfM1uIzsrM3vRT4lgsB+FOcUVJBIwhj/310aNacteSv0DtttxcmeRBTU4qqIt42zv
         jw3l/zYHOMWfJdoGYEamT5+Ly5BbQbN24Xdmoe1urCaDKKYIK5BfGoW/Do0zjVhahC6d
         7h4B021pKo3mdFM06N+KHmUIk44ra12VE3UhvuW0ClfaGXXKfps8Fl6FLjRlolEKm3Cz
         un8TkVFO1GFGBDCqlK23bdSofvEduR/Pw82/TsV6RAVFzrh9oStlGcr69oieEuTb2yKF
         8WNA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmlkts019d1hYEk+Abv/vkUAMHYaEYouW9HRw1OQMSce3fwqfagmptnxcePYo9NS0rbSCvp7do380=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4htOlzIunaIZUtW9pM8gwB7dFjK2iJjCH/f6ced8slNvntSkf
	P383+T6EJfcGt7meIdO0DFvsTRq+YQ73F/yvRsapje1ZXfUh679ywQDS33maIFI4XQ==
X-Gm-Gg: AfdE7ckGGjQAu1pPKk8Mbzjvwb3mrmK0LNmUHF1+vYzeFWu7+f3dUoEYG7crLy2hS+l
	evMTQVEZ3Aa1QvSuHlNW5WfgUPTjsvzyM1mT5lXKcMy0tGGzV/UvGdtjYOoqiAcZXKjtizdvppl
	2J0YcgKCCObwJQQKutPf1b9Y9KeyJ8vAlP865k5rALPs0K8LHz3aY0tpqxapNnPqJD/olywkmPi
	zFA+MqLJ7FJSFTbvsoaHLUH9nSFky8/a2u9CEofycZC1YabFB/8YtRcMe8zoeH96uze9fOozdS4
	MImPDuwSExq9tkFiu/t7flmSnbEdREEfz/NJt0NCbheQEYVSrhw8vVkVi+2RZHhCCiCVUyYe7DB
	AnZA9wb+a3b1ua7OIpXRpbEstdwZXWLDayM20fkjMlLmFZ0/yTXAKGQAdwKTprwImMWrSKJZdzk
	Zznz1242tlghQm0+eQVbbG9nv1k+Dyv4hmBZTGStqdR1Kb9yuvAye8tDnm3XAT5VVshZU+gbMPf
	uE+
X-Received: by 2002:a05:6000:2a12:b0:471:f180:86dd with SMTP id ffacd0b85a97d-47553309233mr2171764f8f.41.1782803879983;
        Tue, 30 Jun 2026 00:17:59 -0700 (PDT)
Message-ID: <4e0585c5-1838-4193-ac92-37e2b9ebcd81@suse.com>
Date: Tue, 30 Jun 2026 09:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com> <akLvI_OJ8RjU_90S@MjU3Nj>
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
In-Reply-To: <akLvI_OJ8RjU_90S@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782803880-B79255D1-AE1B3A0F/0/0
X-purgate-type: clean
X-purgate-size: 1518
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergii.dmytruk@3mdeb.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:trenchboot-devel@googlegroups.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: C14516E10AD

On 30.06.2026 00:18, Sergii Dmytruk wrote:
> On Thu, Jan 22, 2026 at 04:52:36PM +0100, Jan Beulich wrote:
>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>>>          mov     $XEN_MINIMAL_CR4,%rcx
>>>          mov     %rcx,%cr4
>>>
>>> -        mov     stack_start(%rip),%rsp
>>> +        test    %ebx,%ebx
>>> +        cmovz   stack_start(%rip), %rsp
>>> +        jz      .L_stack_set
>>> +
>>> +        /* APs only: get stack base from APIC ID saved in %esp. */
>>> +        mov     $-1, %rax
>>
>> Here and below 32-bit insn would do fine. However, ...
> 
> Are all addresses guaraneed to be below 4 GiB?

You use %rax as the loop induction variable, so there isn't any address
in it? Plus you already use ...

>>> +        lea     x86_cpu_to_apicid(%rip), %rcx
>>> +1:
>>> +        add     $1, %rax
>>> +        cmp     $NR_CPUS, %eax

... as 32-bit insn here anyway.

>>> +        jb      2f
>>> +        hlt
>>> +2:
>>> +        cmp     %esp, (%rcx, %rax, 4)
>>> +        jne     1b
>>
>> ... can't all of this be a simple REPNE SCASL?
> 
> It can, but then can't have an upper bound, right?

I fear I don't understand the question. REPNE SCASL scans at most %rcx
slots, whatever %rcx is set to up front.

>> As to the upper bound of NR_CPUS, do we really need to look this far?
> 
> Are you suggesting to use `max_cpus` instead?

Whatever the dynamically determined upper bound is, yes.

Jan

