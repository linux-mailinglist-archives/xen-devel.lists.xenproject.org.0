Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E62C5798F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161461.1489405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXBF-0005xy-88; Thu, 13 Nov 2025 13:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161461.1489405; Thu, 13 Nov 2025 13:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXBF-0005v7-57; Thu, 13 Nov 2025 13:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1161461;
 Thu, 13 Nov 2025 13:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXBD-0005v1-RF
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:16:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e744ebf0-c092-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:16:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so1173962a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:16:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80cb6sm166471466b.7.2025.11.13.05.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:16:01 -0800 (PST)
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
X-Inumbo-ID: e744ebf0-c092-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763039762; x=1763644562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WStyKkKSy8Yy4nFKaQnYd0JZPd3uoBBPaR3rb8m7pXA=;
        b=VNXvlJMNOniWevcjbUbs2YugYZ1KgL/asaybLjOE88EDJFMiBGRiRS+uGsfjx8V5JJ
         Crj9IJLtgVhoSGqVn7uUATzh/sqqvhk/TnuGGMIYUXvkCMEVNo+1jcEnoyBbyjHOfjJE
         4PuPEEs6nZSP/XA4eegkRcI4tV2wQrXLmzPo63Exzk148gjZ4P44u9MgCZhkAp/+eDsq
         5Qan1/4R+dXl3IPh4ZGdBhk8FYgLoF00xiohfDE4Ssp975998+azZGQ1N+ZVtr4WByvL
         e5aH0OUFDxCG4R2Entn16fD6tUUm+YwwYQ2wCRx2FmPM700C/JxFeFab2+sqnKQuYOoS
         sxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039762; x=1763644562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WStyKkKSy8Yy4nFKaQnYd0JZPd3uoBBPaR3rb8m7pXA=;
        b=AQCOx8W+Ozw8X00IwKr/69sumAwFI0S7ylp2axXYm6cbYOjdxsYvzWBLs9DuPRJpex
         KWf4SvZsl+CjFqrAJSDWQZLrywn0Kk0gTxpjRAg0I1QgL9pK/5TwSm0Opi0DSZ60cuwv
         y+oNJWfFiZmKsANwOakCe23fQipyosg7zNLB3opNOuoL7N5asRzegsREXjP4YM/EQH09
         xkdiD3wNyWYayBNVoKa3kxK7ApoNYiwXzbUnt7pcqteMO3v044xUsbCnnjS0eOBiDngH
         JDQ1bL0HZVR+mlb+8OAMLUFre2n3TN6XznFYyrK/XMsJIHY4rD8JnF/dA7gn/UrM2LlJ
         QRqw==
X-Forwarded-Encrypted: i=1; AJvYcCXAiNDtbMZGALd2yO86bjH4kg1xnTdewpcCXGXrUE82qa2Tpw/BPfsyIsfVMO1wi52m4R4z+3zn5t4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUPXLMZtKr+uMrQuSq2rBrY3bICan1ZwM99ZEvauaJjE/qA2gf
	vn7bei72UWLhaZ6qOde+EDAMDyhCijYThK2II4k71QXA9gIJp24/ncQcZQN/1uM48g==
X-Gm-Gg: ASbGncv7MHEErJJQFlnYao5A/l/0KHjDM+0pbk3C6xkScl3zIwLxwBuct3ixDvwgqvr
	wlfldchjH81fwd7NiNYOZcvA1HMEntnhBGTI+8chB7nkt6bRmMX52S9RwA6SQdESY5/9xjl+6VS
	aXAatRT+SqEDA3doxRvxwOmOoVXOS78Ub6rQWOT4plvSmN67gbY9++pzBJ3UWkEkkS+ZHJik7at
	1GCi02q5HyeGiB+NEkIXDCInNoSiuYBF982KQP66+noYngd1wtoXerQlMskZ9yPmN4IE5CAdSO7
	rQ2gaVVd2Oy6cJjRBlu4yyzULWLMbMqyw9YFAR/JLoTByPG+cLM3rZX/cUMoVcJZGqhXwLE0bwJ
	lObAzaNCXGZ0oHyPKxavxQuM40I11b8nZT86JwbAcX85QhqsoI4SFJy/rcVHCT6WQiD8HEjAdhQ
	ih8VoA5EPCj1Pi5V+mETj5dtqGWui65kfUf0quKqA8g4GuFPD7TZ4jiXQfgLq3CYIR
X-Google-Smtp-Source: AGHT+IHblvet1Hn0bpIJRhJz5Lh5EAJP6/Utk+d8S6NP9ennfv7yoT+lPo3HcLw3i/UnOU0qDCGDOg==
X-Received: by 2002:a17:906:f405:b0:b73:544d:ba2e with SMTP id a640c23a62f3a-b73544dbbfcmr177084466b.25.1763039762077;
        Thu, 13 Nov 2025 05:16:02 -0800 (PST)
Message-ID: <a4ede115-7d3d-422e-b679-9740963fbc54@suse.com>
Date: Thu, 13 Nov 2025 14:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251113124945.25343-1-frediano.ziglio@citrix.com>
 <70c36cf7-de4e-418a-921c-fe1268178194@suse.com>
 <CAHt6W4fjxoGF1rNMhQ2M2_uOEgAyBtNvDcmmbBF6U7qp-LZWOw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4fjxoGF1rNMhQ2M2_uOEgAyBtNvDcmmbBF6U7qp-LZWOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 14:10, Frediano Ziglio wrote:
> On Thu, 13 Nov 2025 at 13:02, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.11.2025 13:49, Frediano Ziglio wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>        for hypervisor mode.
>>>
>>>  ### Removed
>>> + - The install-time environment variable INSTALL_EFI_STRIP is no longer
>>> +   supported, xen.efi will is now always being stripped.
>>> +
>>>   - On x86:
>>>     - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
>>>       broken.
>>
>> That's the wrong "Removed" section, though. Moving it where you put it would
>> be part of backporting (to 4.21) effort.
>>
> 
> I think there was discussion that should go to 4.21 as not stripping
> cause issues with some firmware.
> Should I move to 4.22 then ?

All patches should be against staging, which is 4.22 now. Anything against older
branches either needs explicitly tagging as such (e.g. when no staging equivalent
exists), or otherwise would need backporting from what went into staging. (The
more that at this time of the release cycle I'm not sure this kind of change is
still eligible for going onto the release branch. It may well need to wait for
4.21.1 now. But that's [mainly] Oleksii's call, whom you didn't even Cc.)

Jan

