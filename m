Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0A896459
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700293.1093189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrtkS-00010X-PW; Wed, 03 Apr 2024 06:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700293.1093189; Wed, 03 Apr 2024 06:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrtkS-0000xu-Mg; Wed, 03 Apr 2024 06:05:24 +0000
Received: by outflank-mailman (input) for mailman id 700293;
 Wed, 03 Apr 2024 06:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrtkQ-0000xj-Kc
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:05:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26c06ea5-f180-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 08:05:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34356f794a5so1739276f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:05:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d59c3000000b00341cc9c1871sm16477888wry.0.2024.04.02.23.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:05:19 -0700 (PDT)
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
X-Inumbo-ID: 26c06ea5-f180-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712124320; x=1712729120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2dnsa0Yzg9Sq6N1p/S7fALjG1opHHlRs0IiPclbh7w=;
        b=e1xjklFHDu1ZnrwERy3RjNqgwqOQhHPg1q1iiZK1Q8gVfglBMKICihbqsvPfAA/5zq
         Gf27MNn6U9IaY1BytWnORZC6yybzR2jA8QDpQ8WBTpAQ51bX9xSO4KCjsnRh9qUC/x5/
         b5ntlZtjAFFPQtfTXBQJyQnKYDJ4qosmKBqRYEHtkvC4c8PT1u/OV+Dr1yDfJlT3VBnR
         azU+RiiSORb+NbpYIt4wPthz1HM41Vd3RATjUEO14V9sjRjHq/GcQpRW2n6Hjm1GkgAZ
         fzQ7JV2GZQbvkFQPA/JSlk/ihDX941RaOo5BTi3oKw+YXW0CPBZcSpHc9XRsrWazDcu0
         K33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712124320; x=1712729120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2dnsa0Yzg9Sq6N1p/S7fALjG1opHHlRs0IiPclbh7w=;
        b=m9agsB3M9RNVbU2J0EkHb5HJ+JXyP7lHKFAPqYbQJQIWfSCEmQjAr8SviCdPpc+nXp
         UusmbDmzYdTz8SX4U2fq4asiw7mUHiTCVWeDPASJl/V2CzYORoAF3GyMSOTfcIz4/sG7
         36RN7FLrgyOggevsOKxknWqGESpsD44iQ0Bl/c0mDJOxKZgW7defFgafU6v9dkPWsC8w
         aHTTGmVYskcICl2Rk4omrd40RDeaIZdNdnzCfgG2CLNOnkGUOjf8+CPTT5lC5pZCghaW
         l6WkjsuL58K28SyGuCyeBYhBCmxZGw/dLoht3KnBjqszzsAWyY3kxeJG5wgGl9eb+1by
         kJyw==
X-Forwarded-Encrypted: i=1; AJvYcCWwvdpVCAcMhBANXuwbt8TFAIGIIkZ35jRxt2nHmUvhgAipWLIgAYLv1Brw+pvUaM0JpA6WgrzpHFUHIQvzoHYa4itD0BH6t4loFvHhZlc=
X-Gm-Message-State: AOJu0YyzUgaAJKXAuwJq59WSfQ5/7rdC56XCyY39nfc5sQ4r+pVmHmws
	TjiHhbutwIk1im2zsQQE0edXuaRrpr0YjeHNqY+4OBPuAWWWwpPtzrWrZY88Sg==
X-Google-Smtp-Source: AGHT+IHb0iivp+TeTVZu09YtqsE6BAn5Ls7uyqzjq5tkZGjmap4LLq+f4V9K5RQHFhXSAoR/rQwyCQ==
X-Received: by 2002:a5d:47a4:0:b0:341:c14b:598a with SMTP id 4-20020a5d47a4000000b00341c14b598amr4293998wrb.23.1712124319909;
        Tue, 02 Apr 2024 23:05:19 -0700 (PDT)
Message-ID: <de005820-1965-4e5f-b797-0fbcdc87c870@suse.com>
Date: Wed, 3 Apr 2024 08:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-8-jgross@suse.com>
 <7e94482d-2c03-41ac-827f-af92a94796af@suse.com>
 <afef3207-deff-4eb0-ae28-49b49cbcd2be@suse.com>
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
In-Reply-To: <afef3207-deff-4eb0-ae28-49b49cbcd2be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2024 17:29, Jürgen Groß wrote:
> On 02.04.24 16:52, Jan Beulich wrote:
>> On 27.03.2024 16:22, Juergen Gross wrote:
>>> @@ -36,14 +36,21 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>>>   
>>>   static inline bool _is_write_locked_by_me(unsigned int cnts)
>>>   {
>>> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
>>> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
>>> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>>>       return (cnts & _QW_WMASK) == _QW_LOCKED &&
>>>              (cnts & _QW_CPUMASK) == smp_processor_id();
>>>   }
>>>   
>>>   static inline bool _can_read_lock(unsigned int cnts)
>>>   {
>>> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
>>> +    /*
>>> +     * If write locked by the caller, no other readers are possible.
>>> +     * Not allowing the lock holder to read_lock() another 32768 times ought
>>> +     * to be fine.
>>> +     */
>>> +    return cnts <= INT_MAX &&
>>> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>>>   }
>>
>> What is the 32768 in the comment relating to? INT_MAX is quite a bit higher,
>> yet the comparison against it is the only thing you add. Whereas the reader
>> count is, with the sign bit unused, 17 bits, though (bits 14..30). I think
> 
> You missed:
> 
> #define    _QR_SHIFT    (_QW_SHIFT + 2)         /* Reader count shift */

Oops. No I idea how I managed to skip this, when something like this was
exactly what I was expecting to find.

> So the reader's shift is 16, resulting in 15 bits for the reader count.
> 
>> even in such a comment rather than using a literal number the corresponding
>> expression would better be stated.
> 
> Hmm, you mean replacing the 32768 with INT_MAX >> _QR_SHIFT? This would be
> fine with me.

Happy to do so while committing, provided earlier patches get unblocked
first:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

