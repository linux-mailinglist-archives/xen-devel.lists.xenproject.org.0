Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D00944FC4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 17:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769838.1180716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYCR-0007YS-Ca; Thu, 01 Aug 2024 15:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769838.1180716; Thu, 01 Aug 2024 15:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYCR-0007X1-A2; Thu, 01 Aug 2024 15:58:43 +0000
Received: by outflank-mailman (input) for mailman id 769838;
 Thu, 01 Aug 2024 15:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZYCQ-0007Wv-22
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 15:58:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebeabc85-501e-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 17:58:41 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34722so4189671a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 08:58:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590592sm10316884a12.25.2024.08.01.08.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 08:58:40 -0700 (PDT)
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
X-Inumbo-ID: ebeabc85-501e-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722527920; x=1723132720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvlb3zd0Ja1LCtzWABlbmHpD5P5UU/odjZEXmbn6kps=;
        b=Ek75FNk6h3vBb9xDGmSJbqIsxB7Sxe2dAbPQDM0YBYvVINaYsYNPJZkLL05Gme9eNu
         CRuw/E51UQShzWKvo3bIMQtrBSSklDDb0nyRY+NqrMPQrOuNIqpsxrDSWkLmD1gxo9um
         JGrSt4RZX7/yQpNzfc8iQ9qny4zAY/umefOQE0DydtmBE2xMkEqxoPtwZAoGQMy1NL92
         VxqyuDEIopTXT5IrUZtDnsNg3CnVQ0AAt2fG0JICtkyN5HVMajN23Q7/Yi+e+Emy/EtN
         atwcta9JpaGR4O8AsfArn+sDgIJO+j3KLEzyTdjgSpDI9chSdY/vAQTaOkG36mKEZJeu
         psUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527920; x=1723132720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvlb3zd0Ja1LCtzWABlbmHpD5P5UU/odjZEXmbn6kps=;
        b=UISdzQaI31KCBRT6xYbk6x67AuMSPb8Lann7kXfHTkBLQjLTH7ucpyfobuq6olGLb9
         cfQGRWqo2vfPoHF0w2eO3smUv4fwN9+tO/j+Zx6JgW6jXimwH7tUzGCdWKxkBFRuCuha
         0UoZljxwHI4MQyVWdBPA3XZwtZoZx9VJcJmleSNHHhPi9UwmdlA4jgtzP6vrdXhXSB7q
         /nZGlO46hYJTANUQLQzIyv+v1d3/A9bgWaDCn//I0ekMVnKw6VcSYKNJZZT+NsutA2Ul
         Ltp/CNI1ZaRUXON5FGC/DWAavRNx1H3lTZUoM/2gEAEFlt+1XCSV2Mg56a5YkhrRkG/6
         YEpA==
X-Forwarded-Encrypted: i=1; AJvYcCX7osBpEeZ7C5SstFBCr47n6alixdD4ySpODsK1QhBap2yrffaGYYsFbU4t6sCHOAH09uS0HE79/2HRciVTTQVdxWr83Zdh80M9pJKeLkg=
X-Gm-Message-State: AOJu0YwG/VSx35KHK62bO3+QCafjQiOt1DwbusIQpqViNSrg9rXbPXwo
	xuad0TqWc19NiqQv+SxhKgNRQCiObIcaKOSNytkwomFFC+6peEoPsYD35Y7XnA==
X-Google-Smtp-Source: AGHT+IFJG1Q32Sh2aULfHAtGv1KpzPzPdNBCixhtIdbr6WYKQYw4oD0nrnSkfAEcJ2D73Af1rIYyUw==
X-Received: by 2002:a05:6402:5253:b0:57d:455:d395 with SMTP id 4fb4d7f45d1cf-5b77c28ed64mr1696721a12.7.1722527920383;
        Thu, 01 Aug 2024 08:58:40 -0700 (PDT)
Message-ID: <f3aedd33-f3ac-4a75-82db-5da827a6fc5e@suse.com>
Date: Thu, 1 Aug 2024 17:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240801095201.91180-1-roger.pau@citrix.com>
 <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com> <ZquraLjpMe9fToZd@macbook>
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
In-Reply-To: <ZquraLjpMe9fToZd@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 17:36, Roger Pau Monné wrote:
> On Thu, Aug 01, 2024 at 12:28:06PM +0200, Jan Beulich wrote:
>> On 01.08.2024 11:52, Roger Pau Monne wrote:
>>> @@ -1907,16 +1890,25 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>      if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
>>>          setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
>>>      if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
>>> +    {
>>>          set_in_cr4(X86_CR4_SMEP);
>>> +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
>>
>> Could be just "cr4_pv32_mask = X86_CR4_SMEP" now?
> 
> Yes, indeed, same below then.
> 
>>> +    }
>>>  
>>>      if ( !opt_smap )
>>>          setup_clear_cpu_cap(X86_FEATURE_SMAP);
>>>      if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
>>>          setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
>>>      if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>> -        set_in_cr4(X86_CR4_SMAP);
>>> -
>>> -    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
>>> +        /*
>>> +         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
>>> +         * don't set for the BSP until domain building is done.
>>> +         *
>>> +         * Don't set it in cr4_pv32_mask either, until it's also set on the
>>> +         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
>>> +         * received on the BSP.
>>> +         */
>>> +        mmu_cr4_features |= X86_CR4_SMAP;
>>
>> Don't you put APs at risk this way of triggering the BUG in cr4_pv32_restore()?
>> They'll have the bit set in %cr4, but the bit remains clear in cr4_pv32_mask
>> until much later.
> 
> As long as the bit is set in %cr4, but not in cr4_pv32_mask the BUG in
> cr4_pv32_restore won't hit.

Hmm, you're right. Despite staring at that for quite some time, I got
it wrong. Feel free to add
Reviewed-by: Jan Beulich <jbeulich@suse.com>
then, preferably with said minor adjustment (left in context above).

Jan

