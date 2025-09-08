Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FCB48447
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 08:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114564.1461415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvVXG-0002TG-LT; Mon, 08 Sep 2025 06:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114564.1461415; Mon, 08 Sep 2025 06:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvVXG-0002RE-GA; Mon, 08 Sep 2025 06:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1114564;
 Mon, 08 Sep 2025 06:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvVXF-0002R1-36
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 06:39:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e71b9ce-8c7e-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 08:39:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b042cc39551so730897766b.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 23:39:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0445cb9296sm1598441266b.61.2025.09.07.23.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Sep 2025 23:39:22 -0700 (PDT)
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
X-Inumbo-ID: 8e71b9ce-8c7e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757313563; x=1757918363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp8HBR7B4LrQDoIvCixnbA7tVhRaSijprmRgaRuLK48=;
        b=WOJtB41koFB8wcUs6tfxD39RoUOQYQTBwpdnaiFNG3QHlAJC6s87n+8pT1kyNpcxhh
         CmR/rlvAxidM3yU4dq7o8A6LNj8tpZPWSjK2n1rIaMbjPy29aEK4J26/zUZhNFzDn07q
         UE2IIwYmvJGw4zVXkuZGazbyd/fsY0Hu++rYQYjYyITc3O5SAenEWxAaulttys6Heebn
         NCNgAgJTmZFXVeZLJ+e4ZkGpdPtnbSgQVwhn/1a2S/uOIUDWFc5i0SaSznfCzpiB8Prf
         f+VOBx3IazQ2oai+24WcQaFiDFh0ILYTDAAqxvTFsp+dxUnpXPSkIvkceR2qPPFOomM3
         AeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757313563; x=1757918363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp8HBR7B4LrQDoIvCixnbA7tVhRaSijprmRgaRuLK48=;
        b=WMkKefn8F8pxJbpbzl4KdWaR9fh4PpFa9KxrmLyfJFjTCrwNmJffq2SDXVTaoxOIOY
         lLnFHWKXqIUuO0i2zOWdrZF6gYqicFzt5dK6VxUpquf6d3AxUuKCaRMriepZNG6MDeWv
         jTmgBPcf7AXy5yyN/PPFPSim4XUJAPsZX1xZPcu3De1bP7KT0Sekq0JHbsJ9DJWrGbiT
         sJqfmTIffusrluv+c9AbTcp0/lVlVnh+Soat2NNuoZHcoLscY+qsxC/Dq7eIJRYYn1P+
         /Obsi+xK49N6fFxRt+Jdckxsa/XjBYKrBLEMx+IcHEShuPmc8NC1k5BRETAG23/WdIva
         pMgw==
X-Forwarded-Encrypted: i=1; AJvYcCVMYC+20QWLL/dJuAPTotmjIDtmyE2cfzZ5fT4OiaAhxUpuv6hsgeBOfSnQqFa5bNVbsuiUumeZ1XM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqkDHQ3QTLlFYY0DAnN1DGGmcWQsDtvCxJwFSXgpq02LI7fTPL
	privALNCgHJyP/SLgvOq9TZ3tLD/u8YE2f6LforqTX+vgNM58mfL9hP2nXN8M1ztGg==
X-Gm-Gg: ASbGncsjVzIgxxAg8Yi5NDk65Yq69Fs2Ijlym9P0HWjPRg41swAkyoyEufqvsj8xB1Z
	z5fiagnu7wPnZl3xR6stqndeh9lMh5rknJNNbF2d6jdNTCb52Hp1zOV3bbxFnQvItEYGeZnLcLw
	5QfYVcn1Qmfunte7Xkjpd6hI4gLvh31d21HP9jjaWt2iHO2hGbpZYFe7rlbraN2/JQRwmi2b6xQ
	jZuI/5Bc1tgSTrX+GivrwHx/QZmeKnxeaPTbtn7gKUZ24DVrxllAt1lOXoMwx3e44q8/UkVhgES
	i/1uU9b8mY7QOV6xfUXSY82zAVb6sycN3ilH/1WP6e7HpfxmNthUHUnnSxC3ofqQsN0i2pFj2QV
	DTKYGYzGXU4WBd5lFDNwRSS79Drf2PzXrAQUtSQh6OCUAw5tTFNjpCTpQW2wF6EvhHH6057m7Ou
	nwzfBUf51fBtda1deaxA==
X-Google-Smtp-Source: AGHT+IGAHohBA3R7J0N1DDaHRrVZCreIwFn5O97Zt0sTrKiV3fzBZgQNMc8oJfZ+jnAawsSk9Jwgzg==
X-Received: by 2002:a17:906:6a04:b0:b04:6264:cf7c with SMTP id a640c23a62f3a-b04b16dd3bfmr659070566b.44.1757313562737;
        Sun, 07 Sep 2025 23:39:22 -0700 (PDT)
Message-ID: <e44450f8-279f-4343-ba3b-233a58f2d5bc@suse.com>
Date: Mon, 8 Sep 2025 08:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250904215137.135529-1-jason.andryuk@amd.com>
 <57fedb53-18b7-4d81-acc8-2756a899ef90@suse.com>
 <a60f0e63-8f3f-4833-84b0-30ff763699d6@amd.com>
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
In-Reply-To: <a60f0e63-8f3f-4833-84b0-30ff763699d6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2025 22:34, Jason Andryuk wrote:
> On 2025-09-05 03:39, Jan Beulich wrote:
>> On 04.09.2025 23:51, Jason Andryuk wrote:
>>> io_apic_level_ack_pending() will end up in an infinite loop if
>>> entry->pin == -1.  entry does not change, so it will keep reading -1.
>>>
>>> Switched to breaking out of the loop.
>>>
>>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> Noticed during code inspection.
>>
>> Well spotted, just that ...
>>
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1715,7 +1715,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
>>>   
>>>           pin = entry->pin;
>>>           if (pin == -1)
>>> -            continue;
>>> +            break;
>>
>> ... we shouldn't terminate the loop here, but rather continue with the next
>> entry in the list (if any). Hence presumably why "continue" was used, without
>> achieving the intended effect.
> 
> Ok, makes sense.  Though after the sending the patch, I was wondering if 
> it was an unreachable condition, and we should not end up here with pin 
> == -1.

I can't exclude that, but other code (e.g. add_pin_to_irq()) also deal with
this case.

Jan

