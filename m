Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B538AE975
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710668.1110021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzH8q-0006FL-OO; Tue, 23 Apr 2024 14:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710668.1110021; Tue, 23 Apr 2024 14:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzH8q-0006Dg-Lc; Tue, 23 Apr 2024 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 710668;
 Tue, 23 Apr 2024 14:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzH8p-0006DG-79
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:29:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f54738-017d-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:29:01 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso30552575e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:29:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b0041a809403d4sm5586564wmq.6.2024.04.23.07.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:29:00 -0700 (PDT)
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
X-Inumbo-ID: d3f54738-017d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882540; x=1714487340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QSMRC+rbLTrSzNXnM3vju+nO9SOLJi7XbQfDtq9npww=;
        b=bCxeXfCSU9r1Cq06rOe/r7czD9SAiVRm9NyXCd6Ov5nRWIW2mOknvrLnYqFkHXH4vT
         adWcipzXwWSlOrdjUH6DqMYC7nzQjFtZIcwQGZ7yqxKgLUd9cjGcWLfRsjsaIaYdvI2H
         Vyom+/QApxH9X2qmUcEF6BwOhK0ndrxtvBvWAQ02Bc2et35GKZS1/cZGTL3p415ntzZ8
         wJtI8s5YEW/44fs1zzpihEI3rHGYcS1Zs2u/nK7h12Xy9QGBrxZaDZ7L1XB+hX0rBH3I
         n+nBP7DUz5p+zntxpWyPqioUeKrTPNXwk07yAjSmW6TtgV4oY8cwsX6gqgoOsG0QLmi5
         027w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882540; x=1714487340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSMRC+rbLTrSzNXnM3vju+nO9SOLJi7XbQfDtq9npww=;
        b=QKbtz2hO0KMrmrfsTJ2sR1ZaPBInB3ZE0emlIAhSQXK9UHUNKW66vkllc+8kAXpRJT
         Y4KttTIXrdGWaA56YzvezYSMFjKCW+NMHBoIrvy1fNoIRJV/wb9fR1t24c5aJep5jXu3
         3s9u+wWBoD7njgUPbEQYbdtrcYy6Od3uZhzu530VOlg2xmlNEdQsazIqZXXuFs+UqLxn
         /hAwzGuSYLhZhVERXbc0ooQhMxEilki0VtbOf6IZVxuToY1vuy6zQtMocPCvUEauJHm5
         4+ubpMUnsz55x/5j3Zib63d0j2ViW7kdG8/bOwOYNFJz30HF6Z8kXWS1oQe57rdY+lPT
         dCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmb/bs8xm8yyjF0FQNrDMAhmdifYZHOkmnHQozK07q9eqLE2wzIdmwjFlPGYdi/KTHLHV0agNeqCNnbSuT+fBypiGI2YdJjTVBWiTr8b8=
X-Gm-Message-State: AOJu0YxWU0OyDCpeaYMvV1MUFEK3xznfuB3JsUT5mpQvKxfhS6Zaz4VQ
	nluR4Ij/PB6beZVFXorwPVpBjffbpKGHR/+RH5GsFWdMnScZhpBmTjNVZdog9Tv5Gm7AZ170m5M
	=
X-Google-Smtp-Source: AGHT+IEfP5pnnXamAxsiSgyFEADvElm4kLiXhfuc/qyD/SAUYGfLFhoWEr8WSdUX5uZG/1Ah0v1OQA==
X-Received: by 2002:a05:600c:3504:b0:418:9d5a:f680 with SMTP id h4-20020a05600c350400b004189d5af680mr9168763wmq.25.1713882540582;
        Tue, 23 Apr 2024 07:29:00 -0700 (PDT)
Message-ID: <46c58aa4-d908-40ff-9c77-e0eacc7e10b6@suse.com>
Date: Tue, 23 Apr 2024 16:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-4-roger.pau@citrix.com>
 <0625d7fd-1554-4d47-a8a5-0d6bfb1fcd56@suse.com> <ZifE_rQhaZNbjIt2@macbook>
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
In-Reply-To: <ZifE_rQhaZNbjIt2@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 16:26, Roger Pau Monné wrote:
> On Tue, Apr 23, 2024 at 03:44:42PM +0200, Jan Beulich wrote:
>> On 23.04.2024 15:12, Roger Pau Monne wrote:
>>> Livepatch payloads containing symbols that belong to init sections can only
>>> lead to page faults later on, as by the time the livepatch is loaded init
>>> sections have already been freed.
>>>
>>> Refuse to resolve such symbols and return an error instead.
>>>
>>> Note such resolutions are only relevant for symbols that point to undefined
>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>
>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>> resolutions against it.
>>>
>>> Since __init_begin can alias other symbols (like _erodata for example)
>>> allow the force flag to override the check and resolve the symbol anyway.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> In principle, as promised (and just to indicate earlier concerns were
>> addressed, as this is meaningless for other purposes)
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> However, ...
>>
>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>                      break;
>>>                  }
>>>              }
>>> +
>>> +            /*
>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>> +             * livepatch payloads don't have init sections or equivalent.
>>> +             */
>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>> +                      st_value <  (uintptr_t)&__init_end && !force )
>>> +            {
>>> +                printk(XENLOG_ERR LIVEPATCH
>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>> +                       elf->name, elf->sym[i].name);
>>> +                rc = -ENXIO;
>>> +                break;
>>> +            }
>>
>> ... wouldn't it make sense to still warn in this case when "force" is set?
> 
> Pondered it, I was thinking that a user would first run without
> --force, and use the option as a result of seeing the first failure.
> 
> However if there is more than one check that's bypassed, further ones
> won't be noticed, so:
> 
>             else if ( st_value >= (uintptr_t)&__init_begin &&
>                       st_value <  (uintptr_t)&__init_end )
>             {
>                 printk(XENLOG_ERR LIVEPATCH
>                        "%s: symbol %s is in init section, not resolving\n",
>                        elf->name, elf->sym[i].name);
>                 if ( !force )
>                 {
>                     rc = -ENXIO;
>                     break;
>                 }
>             }
> 
> Would be OK then?

Perhaps. "not resolving" isn't quite true when "force" is true, and warnings
would also better not be issued with XENLOG_ERR.

Jan

