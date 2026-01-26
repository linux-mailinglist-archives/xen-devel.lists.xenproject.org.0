Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHAuOpYod2lzcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:40:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C9858D9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213384.1523867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI9J-0002YC-DE; Mon, 26 Jan 2026 08:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213384.1523867; Mon, 26 Jan 2026 08:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI9J-0002Wk-AC; Mon, 26 Jan 2026 08:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1213384;
 Mon, 26 Jan 2026 08:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkI9I-0002WZ-Lo
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 08:40:40 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b08dd50b-fa92-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 09:40:38 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so48709505e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 00:40:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804dbd9436sm96712695e9.18.2026.01.26.00.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:40:37 -0800 (PST)
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
X-Inumbo-ID: b08dd50b-fa92-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769416838; x=1770021638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVDW0egVHX3ycdRz6KjAxDpgLlZpCPZ/MyY8UU0Qh28=;
        b=ZKe2k8Ir7HR+c3vETk/HAM51GDMc+p9plKLf7mG+w18fd5pEeNwTD4Y2969nZfhk23
         +2YKkX3CdvzCnw3Ziifz4KgyJ3N11jXYfWYE/NlNgcba+lfJlBGm8ahMYQPSiDuc5tEl
         IBqM9XqRRAie6QqK7DGdbiW61OGumK3gTY/Lp86wAM2xsXJz5cSTbWwrKMPlZxxxedzB
         XzVY55ulZ2d4yyWhERBcQHDIMMTxCftXkV54AqxEj3pMc5GciVMsxc4Bty6ka5MpWPTi
         PvWCL5W4VaOKetXanfr/l4qjIZOjfLTmkgF1uUlobvE1+yb7Gacf3C/IdgjaHJyGoQvC
         g/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416838; x=1770021638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVDW0egVHX3ycdRz6KjAxDpgLlZpCPZ/MyY8UU0Qh28=;
        b=Eolq3MalymfEWRLC2kxzLd7eIZOpgrfmcywMtEzUckk2vGt4dMXLd7cKP9GUX0KHHG
         2ih24N57XTev34Xnu0PLcBnAn3iUZuk+CZU2YVMkGHJe1/qKWND3oizriBl8Qnvq2Ihr
         Xlr/6rxkw4HB3Dt+1kpfw2aFDY6vNbSNsJgXJrBlOrbxPZ3t1z7evIO0AmfiX01Yw0WT
         3WMf9v7wYWaz9hWJ8lpmifQpHbGEhz837zWeKye+kUFCXiOJQz9ysB5S/rPcq3DCQ/bl
         x1rV+v8bjO3KydTRD9I7aJcWs9xFtDMDL8byPsVuEK9F4zVLIpUXQZPJGRiIqNeCHXUt
         bb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5HUSnFXDxeL16Z70RcyBrWuhjjyn6t8nwM9vjWoqQi1QbGyw0Yc7b05e7MYX3nK4Tvh8w5nJor6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFelQolDagHFAndXQ0v+4LC7xevaXmuPlYsQ70RMo8S6OZFUC0
	snIABUsnkxOtLOUFe8SRZoOug95j41eAJudk6MwEVGkwPY9mgsNxMzkL93xDh1HKtA==
X-Gm-Gg: AZuq6aJre0U5kDKTqWAY1MpCkznJdQGYJB/aNiCU68b4F8K1W1Ch6Y0xwjnVn+vu0rb
	lLo4nmHAKBLKwnLsTt4SFWHCybKOFXL8Ehow4zSR2ljyMeGXQUQe9+6OldOg8NKfxpWzUH2THs+
	8qwSp+l3gySm72P0MXHmwTENVAfiadEMQ1kOlmHOkC/0s9CwmNuP5VM6OiAomOoIRLXkASwP8MC
	9Wtzs+dW3lqecPsbuYYR6c1j5EbbAoSAd8fBRshHfFK1Z5JSc0s207+i7ft8hm1xpDRp2Ck6hwz
	teHelu/SiERphYnHCLfp93LPChznxR1gw+jrcw4FZwwcwrn/5VNZg5U9uAgREjXI1gzz5QkwMnk
	e2UmK0cPSwnbMMigD8zHeaDOeIGkRJz98K3C/0NijwG0UCCRIx7IMfjhi+nhfgjY3yb1enTssE5
	A0ffsYw0U9bxG4SkKrSF3NIcCtJV/R/6F79+rIC1vZ8rjwDEImQ2Oa1fGc4HTWY66aAloJRIYio
	jz7H9WynPY1Bg==
X-Received: by 2002:a05:600c:a106:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4805e6fd919mr48125825e9.19.1769416837771;
        Mon, 26 Jan 2026 00:40:37 -0800 (PST)
Message-ID: <95ae189f-5642-49a0-81df-d019b4a28c8f@suse.com>
Date: Mon, 26 Jan 2026 09:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/hvm: Remove cross-vendor checks from MSR
 handlers.
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
 <c78bae14-f6ce-4450-bf8f-5a19f8f7b975@citrix.com>
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
In-Reply-To: <c78bae14-f6ce-4450-bf8f-5a19f8f7b975@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alejandro.garciavallejo@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 422C9858D9
X-Rspamd-Action: no action

On 23.01.2026 19:35, Andrew Cooper wrote:
> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>> Not a functional change now that cross-vendor guests are not launchable.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/msr.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index ad75a2e108..c9cc4f0692 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>          break;
>>  
>>      case MSR_IA32_PLATFORM_ID:
>> -        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
>> -             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
>> +        if ( cp->x86_vendor != X86_VENDOR_INTEL )
>>              goto gp_fault;
>> +
>>          rdmsrl(MSR_IA32_PLATFORM_ID, *val);
>>          break;
>>  
>> @@ -190,8 +190,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>           * the guest.
>>           */
>>          if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>> -             !(boot_cpu_data.x86_vendor &
>> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>>               rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
>>              goto gp_fault;
>>          break;
> 
> Hmm.  Thinking about it, this would probably be cleaner to get rid of
> the cp->x86_vendor field entirely, and retain the boot_cpu_data side.

I was wondering of exactly this (particularly in the context here), so: +1.

Jan

> Additionally, this would fix a minor problem I'm having cleaning up the
> CPUID code for XSAVE fixes, and provide better cache locality.
> 
> ~Andrew


