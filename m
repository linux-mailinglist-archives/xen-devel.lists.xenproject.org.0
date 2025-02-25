Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C04A4460F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 17:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895914.1304598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxog-0007Vp-GU; Tue, 25 Feb 2025 16:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895914.1304598; Tue, 25 Feb 2025 16:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmxog-0007Th-Dv; Tue, 25 Feb 2025 16:29:54 +0000
Received: by outflank-mailman (input) for mailman id 895914;
 Tue, 25 Feb 2025 16:29:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmxoe-0007TX-Px
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 16:29:52 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9a3cc7-f395-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 17:29:51 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso38732245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 08:29:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b0371c51sm148087225e9.35.2025.02.25.08.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 08:29:50 -0800 (PST)
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
X-Inumbo-ID: bc9a3cc7-f395-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740500991; x=1741105791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6sdd1xOiXwyAseUmz0ICzOH5PpnkY7J6KN50/I+lhDY=;
        b=exFOs6ElmAwvoyKA35X0n3HaGhgppRXLW/ZSpTRVIpuey8ykVXp5CPooP1PKHpTp9K
         HnA/GZGXVRQV+weENh29hhyvh2s0+2pHGVkZLT7x9feAMah8gOpcvHE/WOC/v+z0pt6p
         e6DkoTNRHkPv77uw5oV8EAqrJfsWMMupICRUWFNP4E0WL/VI2z6Oa3ppRTp7OzZO/XWX
         J9WF8dwWcJjtk07jvl91aTC7OOzG+Mg3hi8jmBKAc7fhVIrQvCPcsVc2/PYuB6+v2Aek
         hweEUAxcy7ncqW25yBSOq7T9iipefRR10nqrjAGmVg1vIyKRg8BDanY/gTwvFsRFDf/v
         LaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500991; x=1741105791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sdd1xOiXwyAseUmz0ICzOH5PpnkY7J6KN50/I+lhDY=;
        b=IJ1Ut6pf0B43k4BKhvjEgmoMgbfVOB1LPnJI/ljZUtWXGcEFxNp6761XAMZj6Ejb1b
         ojqc2NBDPn6wufzehuNlfx7jL7G2nwxky7D+mvOBYY+u+YyNhXuK52D6H5lQVRTw5w0X
         rsDQqxGm6adecC7mZmTfUxMrxDJVAPOWJKkdFRsQUNZx3+6mQGrQaBrnvVqHwvY/ro8a
         GJo8kWpVZ8zkhkfx5GflKE8JJ2C0Z+wMeE20KyMR/7hmpqjnoszJJTNWzrXcxLmHLi2M
         3T7cj5gsgdUWbm9G+rDGgE64YL+2Lx4LLYpjhtGcFKbxoPzalw0H0AwO6sMQIGBwSeYv
         9o/w==
X-Forwarded-Encrypted: i=1; AJvYcCW6PFDiELu5ISGZiDZhCybIWb2xc/mZen9a9wln2+ZtVbffPQ7caRxAjAbKOzoVlcNPV/V72t7DRP8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhXJG200cQ78Qqvk81ckFIwe3Nc/c/DxsEST2lgLlaLELL75zr
	USjYsKU3c7Y5Wb+e0fBl6vVdZs7fE4QILr6TDzmV2aOOhv3A4CpGGWpjlAcZig==
X-Gm-Gg: ASbGncsUhH/UescGJzBZ622J73tJxdKiPiG6rRast4czZOvlB4RTbJ1xVb0lE8J4X76
	tOFaaFcwFHHT49knhBRAhCNFWrD9DUEHqd9rYNQh0v835OilsJw0xugZbm774yyXbYzbul4ttLJ
	GFoB6EbEHox7EREy8Wto/pFvNMQ5gLdn4XWg7WhAmDvDkFs2rU5vxWMAPyt3RdqM/hbuRQaV8vk
	1ktxO9ir/hIZ7q1fBOSjUBD/TTQWZyh3vwCBymySiSsqjttiZe7HpvGUEBD6MC+xC16eg44DiV4
	gunucxQjZOtrLerGmy+yZTt1Hu6mx8+CpgzpOEQQ+KY+R50yEnZf8mU5PKswfxZcfM1ntGpGrxO
	LBHI0zjtALBc=
X-Google-Smtp-Source: AGHT+IGn+3jn/4k/MQwG3mLuQvTj887l7CbVEIwcEd1rUmxUeuOB81hPZuTaxzTn0uMlaX2iXwImNQ==
X-Received: by 2002:a05:600c:4e50:b0:439:8653:20bb with SMTP id 5b1f17b1804b1-439b2b06189mr168951185e9.14.1740500990746;
        Tue, 25 Feb 2025 08:29:50 -0800 (PST)
Message-ID: <b8364404-fb3a-4f96-8c05-2143783b9af8@suse.com>
Date: Tue, 25 Feb 2025 17:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-5-andrew.cooper3@citrix.com>
 <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
 <0ced63b8-e674-4a88-a979-ff807afe3576@citrix.com>
 <924de1d3-94e8-4d0b-8f5d-ebc9a92e81c4@suse.com>
 <b2220e73-6e3c-46a7-8007-20567d12c749@citrix.com>
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
In-Reply-To: <b2220e73-6e3c-46a7-8007-20567d12c749@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.02.2025 17:20, Andrew Cooper wrote:
> On 25/02/2025 2:33 pm, Jan Beulich wrote:
>> On 25.02.2025 13:54, Andrew Cooper wrote:
>>> On 25/02/2025 9:00 am, Jan Beulich wrote:
>>>> On 24.02.2025 17:05, Andrew Cooper wrote:
>>>>> Having variables named idt_table[] and idt_tables[] is not ideal.
>>>>>
>>>>> Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
>>>>> idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
>>>>> rather than opencoding the calculation.
>>>>>
>>>>> Move the variable into a new traps-init.c, to make a start at splitting
>>>>> traps.c in half.
>>>> Hmm, I'd expect a file of that name to contain only __init code/data, and
>>>> hence for it to be possible to ...
>>>>
>>>>> --- a/xen/arch/x86/Makefile
>>>>> +++ b/xen/arch/x86/Makefile
>>>>> @@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
>>>>>  obj-y += srat.o
>>>>>  obj-y += string.o
>>>>>  obj-y += time.o
>>>>> +obj-y += traps-init.o
>>>> ... use
>>>>
>>>> obj-bin-y += traps-init.init.o
>>>>
>>>> here.
>>> AP bringup and S3 resume will have a rather hard time working if that
>>> were the case.
>>>
>>> Plenty of it does end up being __init, but not all.
>> Hmm, yes. Yet then, taking into consideration what you put in that file
>> right in this series (which there's nothing init-ish about, as the tables
>> are needed until we reboot / shut down / crash), what's the designated
>> pattern for what is to go where?
> 
> Configuring event handling turns out to be pretty disjoint from actual
> event handling, and traps.c is already too complicated.
> 
> If you can suggest a better name than traps-init.c then I'm all ears,
> but I couldn't think of one.
> 
> Other commits I've got in the next batch of cleanup are:
> 
> x86/traps: Move subarch_percpu_traps_init() into traps-init.c
> x86/traps: Move load_system_tables() into traps-init.c
> x86/traps: Simplify early exception setup
> x86/traps: Fold init_idt_traps() and trap_init() into their single callers
> x86/traps: Introduce new init APIs
> x86/traps: Move percpu_traps_init() into traps-init.c
> x86/traps: Move cpu_init() out of trap_init()
> 
> which gives some idea of what's changing, although this isn't complete
> yet.  Even things like LER setup end up moving in here.

traps-setup.c maybe? Just to avoid the "init" in the name.

Jan

> Setting up FRED requires the cmdline, feature scan, and a determination
> of pv_shim, all of which precludes it from being used for early
> exception handling.  Therefore, what I've ended up trying to arrange is:
> 
> 1) early_exception_init() (start of day)
> 2) traps_init() (replaces the current trap_init())
> 3) percpu_traps_init()
> 
> where early_exception_init() is even more simple than what we have
> today, and traps_init() tailcalls percpu_traps_init() to remove some
> duplication we've got.
> 
> ~Andrew


