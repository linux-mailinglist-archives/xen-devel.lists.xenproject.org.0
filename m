Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D0975306
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796625.1206357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMvF-0002u2-49; Wed, 11 Sep 2024 12:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796625.1206357; Wed, 11 Sep 2024 12:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMvF-0002sI-1U; Wed, 11 Sep 2024 12:58:13 +0000
Received: by outflank-mailman (input) for mailman id 796625;
 Wed, 11 Sep 2024 12:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMvD-0002sA-JV
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:58:11 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f861eb5-703d-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:58:10 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-535be093a43so2698432e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:58:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d556e8sm610098266b.204.2024.09.11.05.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:58:09 -0700 (PDT)
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
X-Inumbo-ID: 7f861eb5-703d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726059490; x=1726664290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqnFvSE/DgTaXHKqfyrD6LlV3ZdPjRZwNf1KHwEJWR4=;
        b=XlrUnVQVfz024z8NYRQ500JyimPvHx96LXjLHm4eW38ZG4Ta9sWs4mTzNub6G1W59i
         xFkDK9p6N0E5xc6ypMWNA/5zODE8OlnDJp5KEgoUhe9K879Q2JfA6tdCJ4xe0lPWkg9g
         RE03fDiqLvpenmjvPSy/5vM5wT39gvxY9r3sTbf15UR+K8H1Fsl8PsyxCXj9fsSH65xJ
         x/EgwoAXMGjSZhgwhd+r+FB+gtJA0x+qPmPVUjNW+v+8Qe5MEWv97bq52Nx0mjTDAbXc
         AP0ZtG58/vIBkqEeZFbxxT02uDdw4rQiphehHecKstFaPTE3J+vZLRCfiQaY01xw7/U9
         BXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726059490; x=1726664290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqnFvSE/DgTaXHKqfyrD6LlV3ZdPjRZwNf1KHwEJWR4=;
        b=Y0zr1W+F0WHEcokiCE+ceJvyA8Qz/omuZ8E6KqTXpaNiob+9BA3dCpl+Pqka6KN3Jk
         hcheYyPU43us2hoo2SqFLRfzco1dCLhkTP1UG0xFh7qKm/rk0XXYjGdniy02L1+9vHcq
         Mms8L/tMLw1VzTYtXbQfi//rk0rQmV1QMWjFwVdz1/wz/s6SLiUOUa1VIopBV0tQvig2
         oyYP/TGuCJeifqM+skoidQoSqo0G4Z8P1R/ibH9L7T6LOm+OKPkZfKrWeTk68on1uE/5
         gdNm44nfuAz7xLQk38O9bJ+QuzmxVJ0sKNnBGuzxUG8+T4z3Xex6X2zZSAaW94RKFrmC
         az6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr9e/5fj7qTwks6wVhd3bb7OxWDIUvbbT0BRE4lXHBAYGgbBFLHu6AcCaiDYHIUZYk137hbsXHQ1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMUVXqYcjgIczC0hAPaNd2cS+FaHbDeSHyniAnboXKa22WsVub
	OyAgP9a+wZNlkRO9HVm7669ECNQAMoipDkyQDdtVw4DkHmyezM2zQnLL1Jkjpw==
X-Google-Smtp-Source: AGHT+IE85adI0ZykAS0nwc7/6ff8WG8qh8WfKRYIlJ0kWLdbVSchxCjtXF4KNSdj8DZWKt/YBjrC7w==
X-Received: by 2002:a05:6512:1589:b0:52e:a68a:6076 with SMTP id 2adb3069b0e04-53673ca1524mr1881663e87.49.1726059489888;
        Wed, 11 Sep 2024 05:58:09 -0700 (PDT)
Message-ID: <d7394132-e3ed-4804-8da0-6333a1dcf466@suse.com>
Date: Wed, 11 Sep 2024 14:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] x86/HVM: drop stdvga's "lock" struct member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
 <716868cb-6a94-4470-a1a5-a4b5994e8195@suse.com>
 <dcc120ce-6634-465b-81ee-d652bd0935a7@citrix.com>
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
In-Reply-To: <dcc120ce-6634-465b-81ee-d652bd0935a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 14:42, Andrew Cooper wrote:
> On 11/09/2024 1:29 pm, Jan Beulich wrote:
>> No state is left to protect. It being the last field, drop the struct
>> itself as well. Similarly for then ending up empty, drop the .complete
>> handler.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> with one change.

Thanks.

>> --- a/xen/arch/x86/hvm/stdvga.c
>> +++ b/xen/arch/x86/hvm/stdvga.c
>> @@ -69,8 +69,6 @@ static int cf_check stdvga_mem_write(
>>  static bool cf_check stdvga_mem_accept(
>>      const struct hvm_io_handler *handler, const ioreq_t *p)
>>  {
>> -    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
>> -
>>      /*
>>       * The range check must be done without taking the lock, to avoid
>>       * deadlock when hvm_mmio_internal() is called from
>> @@ -80,50 +78,31 @@ static bool cf_check stdvga_mem_accept(
>>           (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
>>          return 0;
> 
> This wants adjusting too.  At a minimum the comment about deadlock needs
> dropping, and a straight delete is fine.

Oh, of course. I meant to but then forgot.

> However for performance, we also want to do the dir/ptr/count exclusions
> before the address range exclusions, meaning that ...
> 
>>  
>> -    spin_lock(&s->lock);
>> -
>>      if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
>>      {
>>          /*
>>           * Only accept single direct writes, as that's the only thing we can
>>           * accelerate using buffered ioreq handling.
>>           */
> 
> ... it wants merging with this into a single expression.

I'm not convinced, and hence would at least want to keep this separate.
Which exact order checks want doing in would require more detailed
analysis imo. Or do you have blindingly obvious reasons to believe that
the re-ordering you suggest is always going to be an improvement?

Jan

