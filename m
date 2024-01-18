Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14C831CC8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 16:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668830.1041314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUda-0004LA-U6; Thu, 18 Jan 2024 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668830.1041314; Thu, 18 Jan 2024 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUda-0004JS-RJ; Thu, 18 Jan 2024 15:49:02 +0000
Received: by outflank-mailman (input) for mailman id 668830;
 Thu, 18 Jan 2024 15:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQUda-0004JM-34
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 15:49:02 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18850251-b619-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 16:48:59 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so80937845e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 07:48:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc11-20020a05600c524b00b0040e86fbd772sm7418234wmb.38.2024.01.18.07.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 07:48:59 -0800 (PST)
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
X-Inumbo-ID: 18850251-b619-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705592939; x=1706197739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUfHsBZg1o5efKphDQQGpo9k5ziKDu078UEQb2CoKYQ=;
        b=MsYW4hNkOfcXGNNIe5B+KvikuXpbWe2YVm4ORLf1x6O1qJNdz9yarfkIzW3UgfNRVY
         bMARZiEuIEM9IPxY9MxVD0YoUYPeKgnCwVZTecUP/jgiUIkjVeiKUXspsJy3cbui5/o/
         sqVsR43n4PXl5P5T/7UWp+MUgaXUorgAbBn8tVCV2Zhftbbzf8dKnpIE96RZ8d81WF5G
         j+r5e/eMH4qHMiT/8CO4eZ53i678XNiGuKjRhu5CrOTmNwxNlJeUDev9NTGQ+Myjepaz
         Ts+r68tZCQSC+XI36b4ccGrhetK7g3Q0mwg+XjycCS2vZ6BUKw8cEeLipLEJz3ItVQu7
         zLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592939; x=1706197739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUfHsBZg1o5efKphDQQGpo9k5ziKDu078UEQb2CoKYQ=;
        b=V2NSZ+PH16fQoump1CMCMCMkRlkq7w6nCGSn7eUqpAz3FxobUsIF9KwuAIlRCTlbjJ
         7AGLhCWwwTz9CiHERJ13Kv5f/bHXOC9lFbzDEBbUb/lIWRS9TvWiWhjy/BXDCx0PQ28Q
         4rPjomsYRsimuMgXa5X252XJrB18hGWZUpbKMQ1/TCa66a8sDBY9FLRZQFJHI/lSrrIW
         H83m/kPTS1IxGIGYcXFsSaKVMF6dvQyMoJzIAlbHcdFoyAs2WRteb/CwsOdGo7jIN/FG
         wHtpuu7RjI01lg0X9nHeeeLnrhvMP8alLOQ/NGcPZTZALOgsdQMTUk1vuCZoIlU7r9hn
         RuhA==
X-Gm-Message-State: AOJu0Ywduqb0UTvTbUSLdqiYAaFDLbZvQqR66x07/2PxAlxr/XBer8BB
	XdNpYhIibh+DRKkPhFiRAXC0zMw99md04/Z9WxgqZtaoof63EcpDJ2lHQv4WEpKRnR5S19ZY0kE
	=
X-Google-Smtp-Source: AGHT+IEGvcWPMzGZUvG9tlQDIwNF0ZwvutE/ao+X34c548aMxmq519eNRUXg3IgfXLvecnwYCOgLXQ==
X-Received: by 2002:a05:600c:ada:b0:40e:6357:5ff9 with SMTP id c26-20020a05600c0ada00b0040e63575ff9mr609164wmr.183.1705592939332;
        Thu, 18 Jan 2024 07:48:59 -0800 (PST)
Message-ID: <6ad6a2be-473a-4ec2-ae97-a9d777e83a0b@suse.com>
Date: Thu, 18 Jan 2024 16:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] common: assembly entry point type/size annotations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <38de36da-0822-4452-9594-8d50a5a77335@suse.com> <ZagIQkyR0SoScaAc@macbook>
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
In-Reply-To: <ZagIQkyR0SoScaAc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 18:02, Roger Pau Monné wrote:
> On Mon, Jan 15, 2024 at 03:34:05PM +0100, Jan Beulich wrote:
>> Recent gas versions generate minimalistic Dwarf debug info for items
>> annotated as functions and having their sizes specified [1]. Furthermore
>> generating live patches wants items properly annotated. "Borrow" Arm's
>> END() and (remotely) derive other annotation infrastructure from
>> Linux'es, for all architectures to use.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- /dev/null
>> +++ b/xen/include/xen/linkage.h
>> @@ -0,0 +1,54 @@
>> +#ifndef __LINKAGE_H__
>> +#define __LINKAGE_H__
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +#include <xen/macros.h>
>> +
>> +/* CODE_ALIGN needs to be specified by every architecture. */
>> +#ifndef CODE_FILL
>> +# define CODE_FILL ~0
>> +#endif
>> +
>> +#ifndef DATA_ALIGN
>> +# define DATA_ALIGN 0
>> +#endif
>> +#ifndef DATA_FILL
>> +# define DATA_FILL ~0
> 
> I find the fills a bit odd, compared to what we use now (nops for x86
> IIRC).

Well, these are generic defaults. X86 then overrides CODE_FILL for it
to remain NOP. ~0 is the best I can think of as an arch-agnostic default,
considering the half dozen architectures I know at least a little.

Jan

