Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D4B27BB2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083066.1442729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqBL-0004Ht-Iy; Fri, 15 Aug 2025 08:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083066.1442729; Fri, 15 Aug 2025 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqBL-0004F3-GB; Fri, 15 Aug 2025 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1083066;
 Fri, 15 Aug 2025 08:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqBJ-0004Ex-Kl
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:53:01 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e8ac98a-79b5-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 10:52:59 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb78d5e74so283704066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:52:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53c26sm93938966b.17.2025.08.15.01.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:52:58 -0700 (PDT)
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
X-Inumbo-ID: 3e8ac98a-79b5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755247979; x=1755852779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+KlIxOv/DM19//SJ3J/e/fsCOHMbI95nDUME0qVtWWg=;
        b=MMEpRnQjt8x+f+j3tKgX1h9VWe7gnFinR+71IQi0rR25BZ14q0uyh0TGj+nQDBMbwE
         TXau5uhfViA7JZCvr7HZWRuvsoO0eUYToQDb6MsNNOXyf3xyh5w4cijq8La8AZqsUhxB
         nZrZ5x0jb3uRZzC/z+DTljCe0DxryHFV5/hWEzgYyQmvLRL/koItQjkrw4mUERvdCLl/
         sN5k2donf4aLEqm6niJW/Rs0/8K1keO8+XjsxP+WpxHaLHhcPJe4ac1q3/2HGbIZQj60
         q/38t3jO3K1XjjFX1hXLMh9TWRw9Awoqhrry+ZwbQepru6OH1fETNKx2oYLKOoxCh4fP
         18Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755247979; x=1755852779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KlIxOv/DM19//SJ3J/e/fsCOHMbI95nDUME0qVtWWg=;
        b=Xpr7zOcUhWvQh+PcK6be6y/MUrJRUATnMfGbRWfZkz8v+L4+MFJDiKcsmrh0zyOo7F
         vW/gCqtPBMvsoODa/rjg5uxhxqUnGY1p4UIqWGnawOIkdtQ9XIfs+LRy1pzmRz4YX7vv
         TUBcLsw7jPCP7MiYN4WnVNGVOZUN339pAnerz/0tO53rgTTMB/r13FoRFBsZRzMS56CQ
         Ua9j0YN9D2D+SHFZsbjn16apJXRRNK/dZtMjFyIoziq5IRGIOkXbr8mDMJ1Tex9Bf820
         zs+NKHtmddOT9J7nL9dn+UcZov9JAwhxkHG5KNXWwEXtx7oSa4soP8kOCN4dJl4OkyYw
         C+8w==
X-Forwarded-Encrypted: i=1; AJvYcCXnwBMIc+zUzb0norCL0AWL37osErwGKHPXmbiR6w1ms0xF+fZX73ueoRClhzBlanLWAU+MoF6TGe4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3lcHnLWc1SD9R8AQKlZeUgzIk8DjzchiVcuxWQBka059hWa+0
	ZY3mYAKLY4CUvSRD3xJQz0FnEyBXdSk4A9U94rQHdcOovorLwJmv4qqbEDWkx9xlbA==
X-Gm-Gg: ASbGncvbcl/f8Hvr66lewSOcdlUC8YEsDKxhwPjKscfgchOO31OPDI9OkZEQSKTOJii
	tnX0WsyQf/pY9A/2L+KXUOPyV0oHPqwomiIZEVy1XT5cAU7sxfEJthKcicn17LlsMnPRbTqhgBR
	jy1TVH6FFssjrVhz3uB4iTYDeNkcK/QOV2N8lG9i5biBJwAEEPKsI4CF58Ww49HYrExwvH1WTKX
	JYXs1un/1Gnhk9iE+e/jaYMhXp7rl7c8JIh90TPL7zk1dt5y71yfogmGOlGl+dugvRvnR1vk2Ni
	Pn9h77LAVrNoH5Zq1c5oZFuBtfYJG0moSn+EtmRcdeSU+Fu5VmUqzlL3rNC41qeAIh9mt1MDGVI
	2HmeweY7nnUwM03BM508PMPM3OUXxeFRtNQhOr5Zmxzb2Myl1kEv5KplTtSu5YQtm7mn2XqlhHM
	QbJL552h8=
X-Google-Smtp-Source: AGHT+IHYGk5XgkPv5ka2vG5rSNtjWiJOJpW+ftjRmHXJ9D8w5+iG/5nzkQygwpLJCkAI163vLSDxvw==
X-Received: by 2002:a17:907:1b0c:b0:ae1:5db8:b78f with SMTP id a640c23a62f3a-afcdc35d96fmr105970366b.34.1755247978914;
        Fri, 15 Aug 2025 01:52:58 -0700 (PDT)
Message-ID: <2377fe95-2c04-4b71-8bdd-ea61996c82a4@suse.com>
Date: Fri, 15 Aug 2025 10:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] x86/traps: Set MSR_PL0_SSP in load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-19-andrew.cooper3@citrix.com>
 <74a76087-e45e-4d7a-8df3-2711f77eea2a@suse.com>
 <abfd11c9-db7b-4922-aeb5-381b5284fb22@citrix.com>
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
In-Reply-To: <abfd11c9-db7b-4922-aeb5-381b5284fb22@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 21:37, Andrew Cooper wrote:
> On 14/08/2025 4:00 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -65,17 +65,11 @@ ENTRY(__high_start)
>>>          or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
>>>  
>>>          /*
>>> -         * Write a new supervisor token.  Doesn't matter on boot, but for S3
>>> -         * resume this clears the busy bit.
>>> +         * Write a new Supervisor Token.  It doesn't matter the first time a
>>> +         * CPU boots, but for S3 resume or CPU hot re-add, this clears the
>>> +         * busy bit.
>>>           */
>>>          wrssq   %rdx, (%rdx)
>>> -
>>> -        /* Point MSR_PL0_SSP at the token. */
>>> -        mov     $MSR_PL0_SSP, %ecx
>>> -        mov     %edx, %eax
>>> -        shr     $32, %rdx
>>> -        wrmsr
>>> -
>>>          setssbsy
>> This is ending up a little odd: The comment says the write is to clear the
>> busy bit, when that's re-set immediately afterwards.
> 
> That comment is about the wrssq.  I suppose what isn't said is that
> setssbsy will fault if not.  How about ", so SETSSBSY can set it again" ?

That would improve things, but then it's still unclear to me why we need to
go through this. If the busy bit is already set, why clear it just to set
it again. Or perhaps asked differently: Wouldn't we be better off if we
cleared the busy bit when a CPU went offline?

Jan

