Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C6A5EBE9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 07:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911253.1317706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscTq-0000l9-Vm; Thu, 13 Mar 2025 06:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911253.1317706; Thu, 13 Mar 2025 06:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscTq-0000kJ-Se; Thu, 13 Mar 2025 06:55:46 +0000
Received: by outflank-mailman (input) for mailman id 911253;
 Thu, 13 Mar 2025 06:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tscTp-0000kD-6l
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 06:55:45 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee09597-ffd8-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 07:55:43 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a823036so4934635e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 23:55:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d1666sm43408005e9.40.2025.03.12.23.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 23:55:42 -0700 (PDT)
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
X-Inumbo-ID: 2ee09597-ffd8-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741848943; x=1742453743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=61GOI3WhQ4mgiHqGLI6UiTmbnYrMZQ3YrRFRFBSOVWg=;
        b=fhNlSJi545X0br9fNKkRwBvgFMZQ6S7LLaIcMWIRALh6KUlUheuYWcYQfdW30NnMJ5
         fA03QoPfuaZFyOn+4g/zoxLojeqnunndEIzd+gbPh3C/CXbi8ixdJOOx+5kfDFxTp7h9
         inV1q2QpQZEbXJLIRC0hyIspLUlW50V9oYVbJ+GscRoN/KglNVAwPM+qNxM1L/hShwjV
         N+SlpDe94HRU9T3lhmpaejqfH8/Q5578Fkar5YeMZ2wzCMqDVNL6Ko/b+tXECPM10tW2
         9GkgMpy/Vuh/LJekXG3HviKqQzsaf+Gto4s0v7Hdv6xJ7205v3wJkHf6mNF5/wJ40rZ4
         tJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741848943; x=1742453743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61GOI3WhQ4mgiHqGLI6UiTmbnYrMZQ3YrRFRFBSOVWg=;
        b=A4FZhtG8ql3eTRlSbdy8BHmyIP/c+HKYZwtx9vy9RhWfgBzjCU5vJ7a8kkYtzDqc9u
         TVUg5N1nh/4brCV9JBgsCYqtO6JzUzaK6WWtCAl+AtyHhAhI3218TttKDKZuKPyIA4D0
         W8bEkxK2VBVKrocVeb7IQtD+ivibGQErGLA3c05TwreTUuY/AVN+jnFL9iXhLtwUeiqB
         JurhyWKtDEBBxFhyP/MIKHSL9tCav5/wXO03ACU4hA1QPnGaXOM86GDP1RpAKh+TLCq4
         vELZK0+Z/U/j2KN1nkpfyptckR1AcQLt8s5i42O49E/Am68IRiqFPj04XHLBmBx5Jf9x
         toyw==
X-Gm-Message-State: AOJu0YwSSctqRe8okQoQYGil0PuKyUVxQKQh1VkEDA91aBhOv9sB5KIB
	2ugdtE28FdmSzdAnWEqY7e2fztASwDa7lo0ZUVbEqRY1s3X1qkw10LcwU3NdxQ==
X-Gm-Gg: ASbGncsm2ELLzxvUM3L2hbhu6LXwAYu1p5aSoFwjUojK0ZHo9XLeAuSS9g+BfMnUG+i
	KEvdiIjCtPpPFe/5eXlVlK2W5zOfGDWFCjaLZvaZhkmzyPjjHO33fNhl26ygaf1lb3+4amqa0A5
	Op0KjwEBABDemSgdyNp9O5Ygc3J1L261TiRGaFnS3s2TIfGHVLvJbnMAnYGHwUvB+nSg7PLct9y
	pSQtd/o4Z+I/H9v/lQ9T3hFnuB4LxWc3FnOOPgYnUGrf1zYU1UQw0vay3681X6euV9Et0O6VUWX
	9FFG3HnmlskzwbDT/LFa5a333XO5cuoYXBLn+9AUw/Gj9M+hoEAM0Nnkhgnf991T4uFXertGXRM
	iFuHEDMtbQVkITQZrzwnY6o6RSvyb1A==
X-Google-Smtp-Source: AGHT+IE9LnU+mL/7E20v7bjeu3YecQmbZjIxsy0w9j2B7ki+7laFsPvObZGPs2Cw9BgqZLiFJ7jMVw==
X-Received: by 2002:a05:600c:35c7:b0:43b:cbe2:ec03 with SMTP id 5b1f17b1804b1-43d01c22600mr91729175e9.27.1741848943141;
        Wed, 12 Mar 2025 23:55:43 -0700 (PDT)
Message-ID: <61a7d917-c044-4064-91ee-f558f6416c0a@suse.com>
Date: Thu, 13 Mar 2025 07:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: replace p2m_is_valid() uses
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
 <Z9F-Xul18_96ok1N@macbook.local>
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
In-Reply-To: <Z9F-Xul18_96ok1N@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2025 13:30, Roger Pau Monné wrote:
> On Wed, Mar 12, 2025 at 12:30:40PM +0100, Jan Beulich wrote:
>> The justification for dropping p2m_mmio_dm from p2m_is_valid() was wrong
>> for two of the shadow mode uses.
>>
>> In _sh_propagate() we want to create special L1 entries for p2m_mmio_dm
>> pages. Hence we need to make sure we don't bail early for that type.
>>
>> In _sh_page_fault() we want to handle p2m_mmio_dm by forwarding to
>> (internal or external) emulation. Pull the !p2m_is_mmio() check out of
>> the || expression (as otherwise it would need adding to the lhs as
>> well).
>>
>> In both cases, p2m_is_valid() in combination with p2m_is_grant() still
>> doesn't cover foreign mappings. Hence use p2m_is_any_ram() plus (as
>> necessary) p2m_mmio_* instead.
>>
>> Fixes: be59cceb2dbb ("x86/P2M: don't include MMIO_DM in p2m_is_valid()")
>> Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -2366,8 +2371,8 @@ static int cf_check sh_page_fault(
>>      gmfn = get_gfn(d, gfn, &p2mt);
>>  
>>      if ( shadow_mode_refcounts(d) &&
>> -         ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
>> -          (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
>> +         !p2m_is_mmio(p2mt) &&
>> +         (!p2m_is_any_ram(p2mt) || !mfn_valid(gmfn)) )
> 
> Would you mind adding some comment here about the need to forward
> p2m_mmio_dm to the emulation, and hence not possible to short-circuit
> here?

Will this do?

    /*
     * p2m_mmio_dm in particular is handled further down, and hence can't be
     * short-circuited here. Furthermore, while not fitting with architectural
     * behavior, propagating #PF to the guest when a sensible shadow entry
     * can't be written is necessary. Without doing so (by installing a non-
     * present entry) we'd get back right here immediately afterwards, thus
     * preventing the guest from making further forward progress.
     */

Jan

