Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37742C8A212
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172841.1497934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG6C-0005n5-Ll; Wed, 26 Nov 2025 14:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172841.1497934; Wed, 26 Nov 2025 14:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG6C-0005kY-J5; Wed, 26 Nov 2025 14:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1172841;
 Wed, 26 Nov 2025 14:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOG6A-0005kS-N7
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:02:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b06503-cad0-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:02:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso44585475e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:02:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790552c3c9sm44718985e9.0.2025.11.26.06.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:02:19 -0800 (PST)
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
X-Inumbo-ID: 86b06503-cad0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764165740; x=1764770540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1lLAgBSA1fy/Afxs8CLjI84CtrT7yl5PSkVP+nJMTwM=;
        b=J70fxsgkB97C8Ubk5l1jUuD93vj1FmRcMEYN/02If5NkWpA4rgnnZZSLRSzW19AI3g
         dbx5DxgV8kRa+f2AjaOOv93Io8BldhEGgrWfsvyzVzTXxdUkYePTgREURR0hsRKTTnB8
         DZjyb9LWEwnVJvNM4s5m7cVP3miOomeQnt0/BwCu5lkjEUwe5hL0CP6Rhdkl0cbaRYhY
         t3fRmhLMvXWNG7Z4LVKdDlAkcK51oCxH99k/ITy1BtvtGsJhdwbr3SWRA0MqjYMfqa9P
         kRmuRzqCO5MZAz3a5ELJ9e3mK1TuirMuvvjtCqccQ4tGwjFZodigmxbppJJFbRtiKmrT
         PNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165740; x=1764770540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lLAgBSA1fy/Afxs8CLjI84CtrT7yl5PSkVP+nJMTwM=;
        b=K72TVjUxJTcnfrLDudWEzHCn6jwoAODAgmvGUaF5rwO4oLDJpzjmyGG5EN9YoxOQCa
         Xs3m1dkNQh/IHn/RXSnfpBhMfuprriVXOtGKdbabzew3V21+fcDdssmoIuhnqC5+awqm
         2RnbQB1pWGYIrjhNEwn1tGxYkjQTw6IePro9071dYQQFdatQ1Mqo1SGBoV27J9MDHKud
         y1oTmj+tPEMxh67+dqFLcX0I92ZDDCGg5MuIfakvpy2kP3blgaRORECNZJXVFMP4C862
         mrZ/9UpCkePg5OrjP0XO3HmoWXiQ3VivnB8qZEf0cAgwGYbRPpeScapQ7GPql2k6JuHr
         iObg==
X-Forwarded-Encrypted: i=1; AJvYcCV7AdylXO8hHdZdiApgeNXtAgvyYPeS95ofKuguZY7moWuTe0asuI3tPWD+nM9VKbxao7oTnRAStlM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIh5wHHnNqm2rBQK0k7B8JDWDpY2qoBYbuBBpHP6lAu59xqWrT
	K/VglYe6zfMsR2fFKZ4qPaZyZs3QVftpn85bLFwkmgyhPH8B3+qlMISpslwwkQ3vt7+Iyw8r+Q9
	M3nU=
X-Gm-Gg: ASbGncuuVeun75rhxtdRKX6Xwb5hNXZWljfyEVVZm2+y89OvG5t6uMM5tfWOiILMGwP
	p3PRepTL4obYpfJK86Ztg20vJ+G1uEVmfpOjDoH+mnpigjSILIwyH90/eDE0fupiG+AqBmZ4tiH
	APUGMFq8Am4KPwAUTRSOUIqU278f23JJOMRWdFAUSh9oSYdVrV0C13ALalPXetXFXaZB+Xp4aiM
	TSXPguccp7KdTv+Flcgf2uQHAoWT1UU2H/hmNc/TcMajGIF8o7fH2ioPtJYggYPUTPmEy3BIEQv
	nl2h5haTI19S8qveN9w7gk31MynbZHHXelq8rjNbXJZzhUZYbnPGFeT+Vxb4mBpfwtkjtOI/OYi
	/UKfs7DWxhQul/KL/SxjXFY25b15MlVhYlFQWGmlUw9fZtv0sRcWQE4ldmWSYj/csR3QvyiTgWf
	ZOL5WS6J7BrJsNhHSFWg5RD2XJYKKNyVvWLVmXwKVRWKEKqR7cHcdLMTuH+edAyhxk6udFEWhYP
	Ds=
X-Google-Smtp-Source: AGHT+IFNCN2D10iFa6eTtPEk8TMpPynXFbNzS+5JfetmWeQ/UXRTn83Y23wK1NHZ2/W1oulLJgEq6g==
X-Received: by 2002:a05:600c:4f4c:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-477c0184b1emr222785475e9.14.1764165740450;
        Wed, 26 Nov 2025 06:02:20 -0800 (PST)
Message-ID: <bdd09a5f-6f31-46af-9349-1abfefae5590@suse.com>
Date: Wed, 26 Nov 2025 15:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: move / split usercopy.c to / into arch-specific
 library
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <fd3609bd-6259-4336-905b-732a2f171996@suse.com>
 <3c6af7e8-a295-4e80-b99c-075c21632cc2@citrix.com>
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
In-Reply-To: <3c6af7e8-a295-4e80-b99c-075c21632cc2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 14:56, Andrew Cooper wrote:
> On 26/11/2025 1:24 pm, Jan Beulich wrote:
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 61e2293a467e..76540d77e55f 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -72,7 +72,6 @@ obj-y += time.o
>>  obj-y += traps-setup.o
>>  obj-y += traps.o
>>  obj-$(CONFIG_INTEL) += tsx.o
>> -obj-y += usercopy.o
>>  obj-y += x86_emulate.o
>>  obj-$(CONFIG_TBOOT) += tboot.o
>>  obj-y += hpet.o
> 
> There's
> 
> # Allows usercopy.c to include itself
> $(obj)/usercopy.o: CFLAGS-y += -iquote .
> 
> which looks like it wants moving too.

It doesn't need moving, and I apparently sent a stale patch. This hunk is
simply missing:

@@ -93,9 +92,6 @@ hostprogs-y += efi/mkreloc
 
 $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
 
-# Allows usercopy.c to include itself
-$(obj)/usercopy.o: CFLAGS-y += -iquote .
-
 $(obj)/x86_emulate.o: CFLAGS-y += -Os
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label

> But, given that this presumably compiles, doesn't it mean we've got a
> search path problem anyway?

Iirc the need for the piece above was because of using __FILE__ with
#include, which now we don't anymore. Or maybe it was a leftover altogether.
Anyway, I don't see there being a search path problem, as #include "..." (as
used now) would better always work.

Jan

