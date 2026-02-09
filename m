Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGuZFTu3iWnoBAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:30:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9523710E2B3
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225162.1531641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOWa-0002gA-H5; Mon, 09 Feb 2026 10:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225162.1531641; Mon, 09 Feb 2026 10:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOWa-0002e7-Dp; Mon, 09 Feb 2026 10:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1225162;
 Mon, 09 Feb 2026 10:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpOWZ-0002e1-8P
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:29:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409cf749-05a2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:29:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so60996225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:29:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d33f5fsm320151745e9.5.2026.02.09.02.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 02:29:44 -0800 (PST)
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
X-Inumbo-ID: 409cf749-05a2-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770632985; x=1771237785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iHAPROrQ2OryllZawBueycjWCxXkYKUy81Ev28s7ahY=;
        b=PTFy7nKuXreD8J+CtyFs0FbAiuZGKgW3VWNteaNqdRNMcZVApS/8shQnuzNyyB0vGE
         KHRCSHqqA7Qat1V3R+DWg091ZCj9V6S7Mz1ETkTgzi2VNMAiGSmZrvD11Z3d2MBkwoSA
         FVhEta4U1rmC8NONM5GjQQmeF7ckWVFRTVXofoMmFnKO42FJifuFWlCd9Nr5XbyzJnYs
         JkalMxfrPFwperLjds1ZEUJLzHvJRAYQKbyFOHv/+9+MnadS3uO6zdCjPhzrv1Fltqd0
         yiXNuxR9pWHBiESYc+CMxOUPJDbjU1kit+jibvFUoGcqp9jtwuAeKfYoxi+rydJsANGI
         l6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770632985; x=1771237785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHAPROrQ2OryllZawBueycjWCxXkYKUy81Ev28s7ahY=;
        b=VmsOHbdgFYWngvHRR9A/YObm1gKDrwOlxEH7oLZkmlaSgy2gedVnWw/JBI6Q7YnkY0
         Rmpk9vlg88bdzjySUy/Q3t9olKVpVBNJvGOMjRpQSB9hfH0bGLAU+W1LrH/ETzzP165X
         7xbczt87FgO1DkCXTkHrJD2Oi4eAJKXHcK8BcvQBy4SvS6gOlME9cpBVQdaynLjylZD0
         hnWDz/68ffAySF2QLXa3vzyANRZ1tBj0P7bDfm1bRpUEDHXdy/gapMhJoddePSVSYqDB
         1dbmJFe/k0COTkNwFwfKwf1N1HulWewPeAatbj9Mq13ZmOzB4l1CEXwQwCi0P5m4zq/U
         Vakg==
X-Forwarded-Encrypted: i=1; AJvYcCUG0jVL0qYSXXFHL6VwxpjGz3dFHfRrVpgWNRUhtWXotEn4whdAsnWjk0v/80eLL6PN+8yczApPZeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyk1s+0PUYgmgyiMlLHV8r19dVrnIr+HLtNJBYGxirMjsA8QZa
	k7LFWlVUTlhK+ARsoScklA2d1o4JLZa/EatR/wJa0Z0ez6AT54L4YIx4UAEyidGmIQ==
X-Gm-Gg: AZuq6aIjTBuhvRhaykr8xOXbH5ThcgKejD/LBuFYBvjx9UQHJWHritUr2nRd3H7FVgS
	MWi9jfecEWR8DXmXoLuEZoiZOHE/ftqrODVfL776bg31S4aWR8Y2swqiyD7JMPFPRUimwLOKCGy
	JtM66ulrk5VnnzDYVn7GRF8wIKVpKDE1O5mJ728Bu+dqVeba6Ez4APsuIR3isvgXj1pYgN/l2GF
	tAhGDY7h1SQqrx9KgZ+wGLPSmUNbz/qLHn+Uivo8OOvP3ogZw//H8+OM5EJ/djom0socqrKUebc
	Ih2DFTWJ1m3H67GcqV7iEthFsVqXJNtLMZ9fwFz46WkNR750je92JA2EpegENniE7atFhZPnu/Z
	gllhpCokdXUCs0ibfXtu+ANbFZMbaqV9coIl2GaN4hagP453stua3eMWoMYkI1LqfqScWNBmDGr
	f0eo3JheUUaGA3dZMiOtl5/L84cvNjg3x9HGQpkiefFMHDw73OfPxelsN0KNKTsN+D8U3N5IT9n
	gzNsZbqpiv3aRY=
X-Received: by 2002:a05:600c:c0ca:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-48343d88e32mr18815195e9.28.1770632984713;
        Mon, 09 Feb 2026 02:29:44 -0800 (PST)
Message-ID: <5c66e79d-1455-4038-ae07-5f73756e0008@suse.com>
Date: Mon, 9 Feb 2026 11:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add support for local guest TLB flush
 using HFENCE.VVMA
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
 <309e4e0d-c2a3-4f56-ab6f-f648da313bb6@suse.com>
 <060f4338-d6ac-41a1-8036-ab506cd54bf4@gmail.com>
 <0574673e-0ca8-4a65-bb5e-89d475676631@gmail.com>
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
In-Reply-To: <0574673e-0ca8-4a65-bb5e-89d475676631@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9523710E2B3
X-Rspamd-Action: no action

On 09.02.2026 11:21, Oleksii Kurochko wrote:
> 
> On 2/5/26 9:56 AM, Oleksii Kurochko wrote:
>>
>> On 2/4/26 12:09 PM, Jan Beulich wrote:
>>> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>>>> @@ -14,6 +15,12 @@ static inline void local_hfence_gvma_all(void)
>>>>       asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
>>>>   }
>>>>   +/* Flush VS-stage TLB for current hart. */
>>>> +static inline void flush_tlb_guest_local(void)
>>>> +{
>>>> +    HFENCE_VVMA(0, 0);
>>> For this use, ...
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/include/asm/insn-defs.h
>>>> @@ -0,0 +1,10 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#ifndef ASM_RISCV_INSN_DEFS_H
>>>> +#define ASM_RISCV_INSN_DEFS_H
>>>> +
>>>> +#define HFENCE_VVMA(vaddr, asid) \
>>>> +    asm volatile ("hfence.vvma %0, %1" \
>>>> +                  :: "r"(vaddr), "r"(asid) : "memory")
>>> ... don't you want to use "rJ" as the constraints here?
>>
>> Even without "rJ" it is using x0 when argument 0 is passed. Just to be 
>> on a
>> safe side I don't mind to add "J".
> 
> When "J" is used compiler is trying to use integer 0 (what I misread when read
> about J) but hfence.vvma expects two registers (zero register in this case), so
> "J" can't be really used here.

Hmm, I see. Besides the option of using just "r" as you did originally,
another looks to be to use the 'z' operand modifier along with "rJ".
That's what gcc's riscv.md looks to be doing, and I assume there is a
reason for this.

Jan

