Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE993F619
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 15:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766730.1177242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQ1y-0003rU-1L; Mon, 29 Jul 2024 13:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766730.1177242; Mon, 29 Jul 2024 13:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQ1x-0003p0-V2; Mon, 29 Jul 2024 13:03:13 +0000
Received: by outflank-mailman (input) for mailman id 766730;
 Mon, 29 Jul 2024 13:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYQ1w-0003ot-CQ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 13:03:12 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e80b09-4daa-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 15:03:10 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso480808666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 06:03:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4ddb4sm504897466b.69.2024.07.29.06.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 06:03:07 -0700 (PDT)
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
X-Inumbo-ID: e7e80b09-4daa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722258190; x=1722862990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O0uAjUn6r9NlxZ/Oo/ODqWkDwrD9xKvGqeEaBBccDAo=;
        b=HJWwUw5HPgorar0diaVqPF7buqPOhY+rjDFSN+nIdICP3RQd3lkK1lGiezrbpkBAXW
         JcyQD5QHkwdKwfk+eKxYYzzPbNY7dlH9Fqe/UEgFhPMGJ63TksP0AW+rfdtm7AzicfVH
         N+L7Nd5CBZHT0Fp712i3npbdRnwGYHyFvw1GMLhWXXSczAOAtbJIsR/HLicdwCExxi1g
         b3IYUwUuMnOD04vNeWhnjLY3D4suw5CZJJzaECkTL/m6S4skIz7Z7IYuQ+arAmdmY8gj
         NG42QaM4UG5ETasU3l7OYGF1A/HbKyW8/Wo5OBnSUjk8FsHfF6XQCsps1e+rvaT800S4
         UlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258190; x=1722862990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0uAjUn6r9NlxZ/Oo/ODqWkDwrD9xKvGqeEaBBccDAo=;
        b=RVVF3LG7FQuP+Z1/3UWrA9TXSgED7+eEix8d78efxWxdxDwJh+NZxszKjw2jQFR/IY
         iXIoRpU45xqtxfH8JBhkzqXt0H9o84NzMleQR864xQJWOyxBlc7QTirDeD2FHEMBCo2e
         YjCL0TQ1uwGeNgEXrb+3wSCKd0BgKto7KmHp+r4GmtrgxOLGRZ8KrCgHzTW59EgNwyuq
         qY+MKhjSy8ELjR9SzWJpEMKYNysj0ImnCOxF266YoRkK4iICVkg6lF0Q68HYSqJJAs3V
         6PM65g7ffJlRLp+rw94oeuDiuBNd5Wrj2Gj9P4cLHdJK1GHWZtM2ysHdhjiaqA3IAMFS
         c+fw==
X-Forwarded-Encrypted: i=1; AJvYcCWfcOhO8c+FlqLRs8EU9i9zvGruoeCRvBm+qAtD7yEMF7DGU3ApuXM2V/NWr59rrQBoVAHpl+TntyrTXWPKBOA9Izqv6fmi0AAOcn0ixKs=
X-Gm-Message-State: AOJu0Yx2YiDwmAXikQ52lFy7c/2bV7WLSMHCy4igslMKJk6r35Oei3SY
	V9ZVowyPKrAthwjaWZccIsMQNm+zYCTtmbJcNMari33emjfp97GEky0RS0LP3GqfFU48mRaiAU8
	=
X-Google-Smtp-Source: AGHT+IF1fyx68ZGsTbFrYVz7vVi29GgFGBziNLkoF2DLEEkhPyoog0Z6c49ll1dsS4q8QoYa0ekgjg==
X-Received: by 2002:a17:907:3f26:b0:a7d:3cf6:48d1 with SMTP id a640c23a62f3a-a7d3fff4d58mr638355266b.32.1722258188210;
        Mon, 29 Jul 2024 06:03:08 -0700 (PDT)
Message-ID: <8928eb9d-2765-42ff-b885-00d4709b6b34@suse.com>
Date: Mon, 29 Jul 2024 15:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240729103050.38401-1-roger.pau@citrix.com>
 <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com> <ZqeESDfcw85yJv2e@macbook>
 <2a6efb82-bde4-490b-9c72-413009e756bd@suse.com> <ZqePfxLIrTjqdxWp@macbook>
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
In-Reply-To: <ZqePfxLIrTjqdxWp@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 14:47, Roger Pau Monné wrote:
> On Mon, Jul 29, 2024 at 02:41:23PM +0200, Jan Beulich wrote:
>> On 29.07.2024 14:00, Roger Pau Monné wrote:
>>> On Mon, Jul 29, 2024 at 12:47:09PM +0200, Jan Beulich wrote:
>>>> On 29.07.2024 12:30, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>>> @@ -183,13 +183,13 @@ extern void alternative_branches(void);
>>>>>   * https://github.com/llvm/llvm-project/issues/12579
>>>>>   * https://github.com/llvm/llvm-project/issues/82598
>>>>>   */
>>>>> -#define ALT_CALL_ARG(arg, n)                                            \
>>>>> -    register union {                                                    \
>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>>>> -        unsigned long r;                                                \
>>>>> -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>>>>> -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>>>>> -    }
>>>>> +#define ALT_CALL_ARG(arg, n)                                             \
>>>>> +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
>>>>> +         unsigned long tmp = 0;                                          \
>>>>> +         *(typeof(arg) *)&tmp = (arg);                                   \
>>>>> +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
>>>>
>>>> With this, even more so than before, I think the type of tmp would better
>>>> be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I consider
>>>> that less desirable).
>>>
>>> Won't using void * be uglier, as we then need to cast the last tmp
>>> statement to unsigned long?
>>
>> Only if we stick to using unsigned long for a ## n ## _. Afaics there's
>> nothing wrong with making that void *, too.
> 
> Right, but then for consistency I would also like to make r{10,11}_
> void *, and ALT_CALL_NO_ARG(), which might be too much.
> 
> My preference is likely to keep it at unsigned long, and adjust the
> BUILD_BUG_ON(), unless you have a strong opinion to change it to void
> * (and possibly the rest of the register variables).

That's okay if you prefer it that way; I said "less desirable" and I really
don't mean any more than that.

Jan

