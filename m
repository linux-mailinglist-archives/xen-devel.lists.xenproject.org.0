Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KbkHNumgWmYIQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 08:42:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC652D5CCE
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 08:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219133.1528074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnB2s-000286-Bd; Tue, 03 Feb 2026 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219133.1528074; Tue, 03 Feb 2026 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnB2s-00025c-90; Tue, 03 Feb 2026 07:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1219133;
 Tue, 03 Feb 2026 07:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnB2q-00025W-Bc
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 07:41:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef27a0f-00d3-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 08:41:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso53127745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 23:41:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee04csm49979262f8f.12.2026.02.02.23.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 23:41:52 -0800 (PST)
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
X-Inumbo-ID: cef27a0f-00d3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770104513; x=1770709313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TuBcQ34POpcZd2RjjxghArfkXhOfm5WbXGzkj2QKYEg=;
        b=amdDeeai+4xZBJfzlTQXL4LSdQLEuAnjIj5qs9cMnlG/ip20QIODx+gLmWzcvCewEr
         9lKpUo0yvHwcZa2uH2kGHjQupr8OFw7jkZL40f7DuO6/+PcuWZVn9JiJaWRfAxTmy6mP
         yc9laF3B1s/z+H7F3mBJA1ZT81JefE29LlCNuldF19z7XoNs2xQ4bI+7y9poODVSFFzX
         5Xo6qtr+hch8qlw10rYHVr2cCAoaQ4MxjI255YM4FokOfH3dqXTiKP+9u5iOJ4BpS1jh
         t5sKCv3RRGWYha88GSMOydNLVklMOsZmE+x+3EMD6fkoZM+UJuSQqKo/+PLaDliTnCW6
         P7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770104513; x=1770709313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuBcQ34POpcZd2RjjxghArfkXhOfm5WbXGzkj2QKYEg=;
        b=Q/oyYUlVfEgFyN3NPBZPKfjLYClv3aE5zjU7CrVsXEl1YBO3d1Y7iR4x+AK1BQY/ke
         4t+eF/qynnM4wGeia0Oq0MREV6LGxSb+SLPM4nyEDTSvY2jm7+CyukXx+9QgJ7z10cze
         0HE7AJbL8JFiEUpjM4xot65cNnshVIMCKcis0SGogXDRjGd8EWoThCLZo2cKPrTgIeRp
         Ra46II8TL41mgqCOvj/PpKce3cy85KBvNaD4sUyC0jhLWM/UF+z+XoP6b139lwBASK11
         zE/3vHzMQk7iN7c6mmum16PlZOApLxiOpZYWO5BXaP2zxe3XwFqZTJ71lVYMNvLTuVkX
         JEKA==
X-Gm-Message-State: AOJu0YzGVT9En6g5Gm/i15yTK/ZZuDfVLJWlZSH3Gk6AdX4RvEKFXgsK
	kBzfjquVluSCQsSbPMRxSHal5ULwvD43vgPepog0zz36IY63A9R/38p8fOUzrEKHQQ==
X-Gm-Gg: AZuq6aJxE+vyOBRUmvbNsX4yBybc234sVrKxeTcZzeKB/kIZ43086b/xExXItnIYj81
	J0R2tpN8md6AO91j31djIH6Dfrk0jSdLeusNTxp1Gn8LWi6jXRgFUfW7+fM+fkc4vnLObmZKz5s
	m5LeycmR7vtyVO2x7Ew56QSdZ7/Su4aKZeZMunGCsUNHPBczP/LeUWdGSsrfHG5JXMy9xATXpQV
	OyQoxJc3fn40EkymdH7lexAQTYP1J1xXwpaIlADprh3A45S2pR4Pji7ZBI8gT7PCDBXq42JCKfn
	sKC5rUpyLmoXt+j1NX+QT/dJmMp1J1nK4g7a1T0GS12iuyRf7tUELT9ejVczHOKMm0/XUp+018l
	W+M2GwOCIOX2qM/t2ACyyfEldGagWr9MkylJ3vBz6YEz4DqCUFicteNK5ti9fXmwInqn16Yz1x4
	yyGzGndxVBcEk32bfF/POo4NlQucEYYneUg2jfB8XKb091/K+fr6uyinVrtgQfx/+vwv5HgcBkU
	40=
X-Received: by 2002:a05:600c:530f:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-482db45dc5emr205916275e9.7.1770104513052;
        Mon, 02 Feb 2026 23:41:53 -0800 (PST)
Message-ID: <6bf9c569-9843-41fd-820e-6377255b13e5@suse.com>
Date: Tue, 3 Feb 2026 08:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: split struct sh_dirty_vram and make results
 private
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <3dce4f28-558b-495c-ac45-0f699da82458@suse.com>
 <aYDgRamZZRNsYPXF@Mac.lan>
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
In-Reply-To: <aYDgRamZZRNsYPXF@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC652D5CCE
X-Rspamd-Action: no action

On 02.02.2026 18:35, Roger Pau Monné wrote:
> On Wed, Nov 12, 2025 at 04:47:31PM +0100, Jan Beulich wrote:
>> The types are local to the shadow and HAP subsystems respectively, and
>> HAP has no need for the shadow-specific fields (i.e. it can get away with
>> smaller allocations). In struct hvm_domain it therefore suffices to have
>> a union of two (generally opaque) pointers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/include/asm/hvm/domain.h
>> +++ b/xen/arch/x86/include/asm/hvm/domain.h
>> @@ -95,7 +95,10 @@ struct hvm_domain {
>>      struct list_head       pinned_cacheattr_ranges;
>>  
>>      /* VRAM dirty support.  Protect with the domain paging lock. */
>> -    struct sh_dirty_vram *dirty_vram;
>> +    union {
>> +        struct sh_dirty_vram *sh;
>> +        struct hap_dirty_vram *hap;
>> +    }                      dirty_vram;
> 
> Other in-place declared structures don't use this aligning.  I have to
> admit it looks somewhat odd for structs like this one.

As I don't mind much, I've changed it. It's odd either way - either, as you say,
it looks odd, or it's not in line with the other field decls which all align
their names (except for the in-place struct decls).

>> --- a/xen/arch/x86/mm/shadow/hvm.c
>> +++ b/xen/arch/x86/mm/shadow/hvm.c
>> @@ -1033,7 +1033,7 @@ int shadow_track_dirty_vram(struct domai
>>      p2m_lock(p2m_get_hostp2m(d));
>>      paging_lock(d);
>>  
>> -    dirty_vram = d->arch.hvm.dirty_vram;
>> +    dirty_vram = d->arch.hvm.dirty_vram.sh;
>>  
>>      if ( dirty_vram && (!nr_frames ||
>>               ( begin_pfn != dirty_vram->begin_pfn
>> @@ -1043,8 +1043,8 @@ int shadow_track_dirty_vram(struct domai
>>          gdprintk(XENLOG_INFO, "stopping tracking VRAM %lx - %lx\n", dirty_vram->begin_pfn, dirty_vram->end_pfn);
>>          xfree(dirty_vram->sl1ma);
>>          xfree(dirty_vram->dirty_bitmap);
>> -        xfree(dirty_vram);
>> -        dirty_vram = d->arch.hvm.dirty_vram = NULL;
>> +        XFREE(dirty_vram);
>> +        d->arch.hvm.dirty_vram.sh = NULL;
> 
> It would be better if this was done the other way around, first set
> the reference to NULL, then free the memory?
> 
>         d->arch.hvm.dirty_vram.sh = NULL;
>         XFREE(dirty_vram);

Indeed, changed.

>> @@ -1075,7 +1075,7 @@ int shadow_track_dirty_vram(struct domai
>>              goto out;
>>          dirty_vram->begin_pfn = begin_pfn;
>>          dirty_vram->end_pfn = end_pfn;
>> -        d->arch.hvm.dirty_vram = dirty_vram;
>> +        d->arch.hvm.dirty_vram.sh = dirty_vram;
>>  
>>          if ( (dirty_vram->sl1ma = xmalloc_array(paddr_t, nr_frames)) == NULL )
>>              goto out_dirty_vram;
>> @@ -1202,8 +1202,8 @@ int shadow_track_dirty_vram(struct domai
>>   out_sl1ma:
>>      xfree(dirty_vram->sl1ma);
>>   out_dirty_vram:
>> -    xfree(dirty_vram);
>> -    dirty_vram = d->arch.hvm.dirty_vram = NULL;
>> +    XFREE(dirty_vram);
>> +    d->arch.hvm.dirty_vram.sh = NULL;
> 
> Similar here, I would change the order.

Changed as well. I can't tell why I didn't do it this way right away.

Jan

