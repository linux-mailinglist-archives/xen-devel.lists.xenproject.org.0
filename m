Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B188BC7A9
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 08:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717213.1119218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3rub-0001Dd-Tf; Mon, 06 May 2024 06:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717213.1119218; Mon, 06 May 2024 06:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3rub-0001CA-Qd; Mon, 06 May 2024 06:33:21 +0000
Received: by outflank-mailman (input) for mailman id 717213;
 Mon, 06 May 2024 06:33:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3rua-0001C4-52
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 06:33:20 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861dbbab-0b72-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 08:33:17 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso18590211fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 May 2024 23:33:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ka21-20020a05600c585500b0041a9c3444a6sm18389949wmb.28.2024.05.05.23.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 23:33:17 -0700 (PDT)
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
X-Inumbo-ID: 861dbbab-0b72-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714977197; x=1715581997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLjztR0JpobJ3JhIJikqgg4wdwh+y3Eegwp1h1Me+1Y=;
        b=K7qNQC0IAvbwbK9FIRIr58ZCRyPbD51t2OQ6EKFLhya4UoiYRytgS5OQCcZbl1Pl+E
         1MVDp0dq9P8NaQo+MA1xN+vORB7ou/5VhG80oArrp+NZ+ALHA+jKr93YlFzxINpjhbK5
         fDl1pFijZz9T2yYKzmmk8asiwYSHqJcS66T+UYQKJcLGyb0hqVVEZLGSeWnNixvM38G5
         mQVeluShaFje/uImdoo/kkC5QLewGz9vptl/RnSLON8s8KOSrq5jX6mL+Qfh60VA8Tgi
         gO5SOy1GINm4IdlYxGPfSFUqTFkUDSLA7nJ6/6aUF8IufwrOy1GRIyHKDm4nq8soxWga
         qnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977197; x=1715581997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLjztR0JpobJ3JhIJikqgg4wdwh+y3Eegwp1h1Me+1Y=;
        b=Zs86RDG1sHzVMGefnCFHGR8stwa5I7Vkvcdlr6uCUcSbsqKS68JAk/8IohP3KCv48x
         WWe22pelENJYRngjaYzbrkteiflCbRrTk6DXCw1hdjrgloznSZ2MgrzdT/DZx3sSWVMS
         3dHF0JfRVFKbRYD3xmOIe+fadjHEIa3mDOtWJSLXDmlf7UBivWrmtNIRpuIKXTNpGz9d
         H+qEnzuU0APDdCf7stSUMwK1x+7y26jOZVDKLcxMmJhP0I6jAS3hp6rb/QsYUDqW7qsR
         UkL+DmyuWyrUCnwK6WT8zfhoL6r+IJ/cIfkhVSQWpIGnuV5CTtunxN7FBCzCsQI2r9wI
         oAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEvw0h9Ny9AjCCkh3ppQ6Bjha2yyidC7K7r+H3whjXbE7c453+2nseam9DtMl7Nbgf4fKDejO+ysHTywvj5fXsw3irIqnqF061GnIzqYY=
X-Gm-Message-State: AOJu0Yy9XvTfZrowLIIDyL6sEA0c9W+bXMfwMAUdzvlLnV/CC3TTNnVM
	ELMdW9i96GErzoTISZHGiqAFgXsVCXd2Jm1GvZyoI2ZuaXi3Ixehop/Rypg6ng==
X-Google-Smtp-Source: AGHT+IGwyuIzosbBu5vfVd9tV76AZPwCvf77BCcHCkSFXJrAWS+QbLpG/SLBmc+gdASv2S2zjSE2dA==
X-Received: by 2002:a05:651c:201c:b0:2dd:c9fc:c472 with SMTP id s28-20020a05651c201c00b002ddc9fcc472mr5387008ljo.26.1714977197436;
        Sun, 05 May 2024 23:33:17 -0700 (PDT)
Message-ID: <93eeb1d8-d41f-40e8-8ca2-e6828877b53d@suse.com>
Date: Mon, 6 May 2024 08:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
 <940f11ee23b43ada1dba50bc0236c4764eb13d71.camel@gmail.com>
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
In-Reply-To: <940f11ee23b43ada1dba50bc0236c4764eb13d71.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.05.2024 19:15, Oleksii wrote:
> On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
>>>   #include <asm/bitops.h>
>>>   
>>> +#ifndef arch_check_bitop_size
>>> +#define arch_check_bitop_size(addr)
>>
>> Can this really do nothing? Passing the address of an object smaller
>> than
>> bitop_uint_t will read past the object in the generic__*_bit()
>> functions.
> It seems RISC-V isn' happy with the following generic definition:
>    extern void __bitop_bad_size(void);
>    
>    /* --------------------- Please tidy above here --------------------
>    - */
>    
>    #include <asm/bitops.h>
>    
>    #ifndef arch_check_bitop_size
>    
>    #define bitop_bad_size(addr) sizeof(*(addr)) < sizeof(bitop_uint_t)
>    
>    #define arch_check_bitop_size(addr) \
>        if ( bitop_bad_size(addr) ) __bitop_bad_size();
>    
>    #endif /* arch_check_bitop_size */

I'm afraid you've re-discovered something that was also found during the
original Arm porting effort. As nice and logical as it would (seem to) be
to have bitop_uint_t match machine word size, there are places ...

> The following errors occurs. bitop_uint_t for RISC-V is defined as
> unsigned long for now:

... where we assume such operations can be done on 32-bit quantities.

Jan

>     ./common/symbols-dummy.o -o ./.xen-syms.0
> riscv64-linux-gnu-ld: prelink.o: in function `atomic_sub':
> /build/xen/./arch/riscv/include/asm/atomic.h:152: undefined reference
> to `__bitop_bad_size'
> riscv64-linux-gnu-ld: prelink.o: in function `evtchn_check_pollers':
> /build/xen/common/event_channel.c:1531: undefined reference to
> `__bitop_bad_size'
> riscv64-linux-gnu-ld: /build/xen/common/event_channel.c:1521: undefined
> reference to `__bitop_bad_size'
> riscv64-linux-gnu-ld: prelink.o: in function `evtchn_init':
> /build/xen/common/event_channel.c:1541: undefined reference to
> `__bitop_bad_size'
> riscv64-linux-gnu-ld: prelink.o: in function `_read_lock':
> /build/xen/./include/xen/rwlock.h:94: undefined reference to
> `__bitop_bad_size'
> riscv64-linux-gnu-ld:
> prelink.o:/build/xen/./arch/riscv/include/asm/atomic.h:195: more
> undefined references to `__bitop_bad_size' follow
> riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bitop_bad_size'
> isn't defined
> riscv64-linux-gnu-ld: final link failed: bad value
> make[2]: *** [arch/riscv/Makefile:15: xen-syms] Error 1
> 
> ~ Oleksii


