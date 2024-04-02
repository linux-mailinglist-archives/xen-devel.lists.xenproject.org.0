Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67B895782
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700180.1092891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfV1-0001AB-46; Tue, 02 Apr 2024 14:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700180.1092891; Tue, 02 Apr 2024 14:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfV1-00017g-0c; Tue, 02 Apr 2024 14:52:31 +0000
Received: by outflank-mailman (input) for mailman id 700180;
 Tue, 02 Apr 2024 14:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfUz-00017a-M1
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:52:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f81d904-f100-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 16:52:27 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-416200b3caaso7805e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:52:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r7-20020adfab47000000b0033e43756d11sm14477935wrc.85.2024.04.02.07.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:52:26 -0700 (PDT)
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
X-Inumbo-ID: 9f81d904-f100-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712069547; x=1712674347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nci9zZE4Di+fsi7I0pp4pMvTXlu98LFwAXsmUQYtoYA=;
        b=DT0K472S8uuEbUK1A22x4lwcrX4tjyABcRlSspwaxngc02GW+WIu9y4sIOpGhIBRBJ
         dGeyEK6qKJ3M5dTwtvX3+keG7zLLd/4IjQmcJ5Te2ss3aIAkTrvUpRWgE+/IkS0DOHUw
         jmjdWgGf+ScFS3AWDMMvL+1OTVieT1/SOwHmp0cVUhGhj9lkFVpMmBhUmmJKuwkNtYtr
         R3x2TZTYxSJRrmpZ1iZyTQEK2spUjW6pioXObZ+53Gb2R5fioV73n0fo7lBjiALzgkS5
         wqMRc3CdS6ITaSu/fD/Zg82/L2QsM2O+SFRpHN7tEED3XKUTVZzAAt4lvSpzon87Xkmt
         wFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712069547; x=1712674347;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nci9zZE4Di+fsi7I0pp4pMvTXlu98LFwAXsmUQYtoYA=;
        b=k4x7e58wFj1J8f9w5ZZ4lkq3YoU/nTOSA1advKwl0wPh0XrhCMB82dx62H1jjRcDut
         9+2eDaIvB88fiKbit8huqCSD67dycUBNYxc68hNa1dcRhk4D6HlZDPE6/VGS93tQQAMn
         9no+ftGN9k1hYF4DEDH+MDdQn2UPmHp6v8Z/69PREopyYDOD9JsgVVWpTi98jocq8DDo
         qzz8xs9JjMb/r1cJmaRqCxoqw6rXm6RvMfJ1j3wlCDKtVSSbGk5RuoOXivR/4PeSOx34
         T56bSw1xSf5bdpcMcilbGfeeAcLEDiB5H9bdkD130WyP1xsfSYbYzzopKiF4qU6gaFDg
         fBpg==
X-Forwarded-Encrypted: i=1; AJvYcCV2AmvH9yofDF3zSkm3r44HAoL3xhwrPZ3IqQomfr+RautWHyP6Whto2/Zyo0oTQeZfEruxGTRwuKGt3N50rzk8r9Or4AK6vJV6T9AMd1c=
X-Gm-Message-State: AOJu0YzTB5IwVtCs0x3tRJJfHx4Jj0k8mahy/EYXF/r7MZYtSg+1x7si
	KuwtxMo1+Kn6R3yE3q9LkD8rluvteErA4o/HLgEk7nBOa3VvnVjqPs1XlX3OYQ==
X-Google-Smtp-Source: AGHT+IF5ISvCldfn4cXBSMbt2GUj6XT+f6uJxOH6foQEVrwStluaCAWKKV7I5rpcoiiZdLvybIW4Fg==
X-Received: by 2002:a05:600c:154b:b0:413:133c:b9c8 with SMTP id f11-20020a05600c154b00b00413133cb9c8mr8685755wmg.33.1712069547008;
        Tue, 02 Apr 2024 07:52:27 -0700 (PDT)
Message-ID: <7e94482d-2c03-41ac-827f-af92a94796af@suse.com>
Date: Tue, 2 Apr 2024 16:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-8-jgross@suse.com>
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
In-Reply-To: <20240327152229.25847-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 16:22, Juergen Gross wrote:
> @@ -36,14 +36,21 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>  
>  static inline bool _is_write_locked_by_me(unsigned int cnts)
>  {
> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>      return (cnts & _QW_WMASK) == _QW_LOCKED &&
>             (cnts & _QW_CPUMASK) == smp_processor_id();
>  }
>  
>  static inline bool _can_read_lock(unsigned int cnts)
>  {
> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
> +    /*
> +     * If write locked by the caller, no other readers are possible.
> +     * Not allowing the lock holder to read_lock() another 32768 times ought
> +     * to be fine.
> +     */
> +    return cnts <= INT_MAX &&
> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>  }

What is the 32768 in the comment relating to? INT_MAX is quite a bit higher,
yet the comparison against it is the only thing you add. Whereas the reader
count is, with the sign bit unused, 17 bits, though (bits 14..30). I think
even in such a comment rather than using a literal number the corresponding
expression would better be stated.

Jan

