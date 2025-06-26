Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75848AE9607
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 08:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025889.1401133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUfvJ-0007zk-KI; Thu, 26 Jun 2025 06:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025889.1401133; Thu, 26 Jun 2025 06:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUfvJ-0007wr-HW; Thu, 26 Jun 2025 06:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1025889;
 Thu, 26 Jun 2025 06:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUfvI-0007wl-6v
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 06:17:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 374c5bec-5255-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 08:17:20 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so280195f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 23:17:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d874fe39sm148478005ad.251.2025.06.25.23.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 23:17:19 -0700 (PDT)
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
X-Inumbo-ID: 374c5bec-5255-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750918640; x=1751523440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTF0+ihzfz4kUDQoZFagBc2UYaepFiD7BMnzfXmS91Y=;
        b=dc18djiIPy8Mm65kpmiCbh31DIjHHeXfoVboF0QbwrwOa+W4qGCUiVVS7MupBlAznd
         bw3G2vQKi+0ArNnpJYA2SZg4vlQGbN7fvv+oup/ZPzD7iDrjFoxwfGhNGzIufkbhGMS+
         UNtn85ZMLZw9oBTyX3osmfw9thzKAf25QeIyCx2grVZoGUy8MACdVSkW8U84Z0w5n3zh
         mfYK6604TLObTa/2jmo/9GCTgWYUO5R8xNG5UgrWyc+zNVrbWB1/SOAnLZIhRIX7e/rB
         lNf7NiqMVKqKm7iVHCButvhKrDjvrMw5POBnHpbKkJ99/9vTESTbccJ9v0LGAWtchHjm
         s7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918640; x=1751523440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTF0+ihzfz4kUDQoZFagBc2UYaepFiD7BMnzfXmS91Y=;
        b=PNZ84/nG2hwU7m1p2i5+dXaYNzMnHmUY2o8kvB5W6KkQQgLXHaE/PgY+9JtDeC1h9b
         M/pmt8sF0Wyadqd7qe4hNRMjD17TerLGEvIUma8LqDzxX7G3rdMZenuBM3o65dtywdm+
         pJodHoo97jU1lKfZRkNxW7MujvWLmuFpqZuMqz/EQHdGFbUKhtUJWFinme0HAc/GGz+U
         iS8vq/jrsVIIkz2Ed6tR1Eb92Jw7qZo6h0PWNB5fHyC1voKkZ3S2q8f9l4sjA0t7YMzW
         1glmNoOPm44i9AhO4cW+UN1lsjOlRDh5jrxYe2V1PgapMlrUCSWml0qpmpL9KzwTAkpJ
         qnlA==
X-Forwarded-Encrypted: i=1; AJvYcCXVb3xEgHMJCKCe0X+2T0r0nBhJ4JGqUzMaO6kgUhvXxLShO9naa7DCpbbJBNIvsFXOPRtuHSl34zc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7JzW+cjmVV30BggDx0a3fmk9wA9TBn2Uj9bzn7lVeuduBIjtU
	0z3+uPChN9CJKA+UXSevMMpmG0P3dJ+yw16esHejlhXwY4/FVj7S3l/V4Lrv+/Zicw==
X-Gm-Gg: ASbGncvKrwrWFrfQ2MokGKnaw9jXGb60Jd2ElmzjTbZpzUBtcWxkf/11HehkvCZIJ+s
	gn6l87MrvGj+kNzl7dNol+Pw0iQeoh37mXfDJq1ZH7qEAVQlCy62oJ7nDhEgv0sfZBYDmp/qbr+
	jdG1IjwXTyQfy+r3a1s3wLDJ5j8WMFU5Q4ccym7s648ijFh66VT7+SYowCJQVg4+++vWtvSoKH2
	z/Ogpe9Z8+TtzmyZwVXEomdCXfTB1Anxg+59NdWpjSiZYuCNp8XeJqEeg8ixydU/+Gd4iM+rnSa
	+WvzKfuBIhw5qY/PrOcGmsYXK70eG0xwnBHcXAnNspb/5GJvqnaGbG4gnNVFoKaOep9y2MFOTSC
	ZyTZ0/Da168LjcaM15AdLBBG6kZRMfkeLXjJf/FctYjk/yhk=
X-Google-Smtp-Source: AGHT+IHrt2wufvA81nXTB59pCOJcogHROtKtPzmEXM2n1tflw4peYCtHoQvf0oCA89D0Fsv0hmAhLw==
X-Received: by 2002:a05:6000:230a:b0:3a4:e193:e707 with SMTP id ffacd0b85a97d-3a6ed652ad4mr4216896f8f.41.1750918639620;
        Wed, 25 Jun 2025 23:17:19 -0700 (PDT)
Message-ID: <06de6dd2-f73f-44be-8c72-6e5d400c3407@suse.com>
Date: Thu, 26 Jun 2025 08:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] pdx: introduce command line compression toggle
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-5-roger.pau@citrix.com>
 <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>
 <aFwZ3dSo1MHMf-Em@macbook.local>
 <23206592-6016-47cc-87a6-151c76f254d6@suse.com>
 <aFw1pY-4Yv2MtBp6@macbook.local>
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
In-Reply-To: <aFw1pY-4Yv2MtBp6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2025 19:45, Roger Pau Monné wrote:
> On Wed, Jun 25, 2025 at 06:00:48PM +0200, Jan Beulich wrote:
>> On 25.06.2025 17:46, Roger Pau Monné wrote:
>>> On Tue, Jun 24, 2025 at 03:40:16PM +0200, Jan Beulich wrote:
>>>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>>>> Introduce a command line option to allow disabling PDX compression.  The
>>>>> disabling is done by turning pfn_pdx_add_region() into a no-op, so when
>>>>> attempting to initialize the selected compression algorithm the array of
>>>>> ranges to compress is empty.
>>>>
>>>> While neat, this also feels fragile. It's not obvious that for any
>>>> algorithm pfn_pdx_compression_setup() would leave compression disabled
>>>> when there are zero ranges. In principle, if it was written differently
>>>> for mask compression, there being no ranges could result in compression
>>>> simply squeezing out all of the address bits. Yet as long as we think
>>>> we're going to keep this in mind ...
>>>
>>> It seemed to me that nr_rages == 0 (so no ranges reported) should
>>> result in no compression, for example on x86 this means there's no
>>> SRAT.
>>
>> Just to mention it: While in the pfn_pdx_compression_setup() flavor in
>> patch 3 there's no explicit check (hence the logic is assumed to be
>> coping with that situation),
> 
> If you prefer I can leave the pfn_pdx_compression_setup() as-is in
> patch 3, as AFAICT that implementation does cope with nr_ranges == 0,
> that would result in a mask with just the low bits set, and hence
> hole_shift will be 0.
> 
>> the one introduced in the last patch does
>> have such an explicit check. Apparently there the logic doesn't cleanly
>> cover that case all by itself.
> 
> No, I don't think the logic in patch 8 will cope nicely with nr_ranges
> == 0, it seems to me at least the flsl() against a 0 pdx size mask
> would result in an invalid pdx_index_shift given the current logic.
> 
> IMO it's best to short-circuit the nr_ranges == 0 case early in the
> function, as that avoids complexity.

FTAOD - I didn't mean to ask for any change. I merely meant to point out
that already within this series the special use of setting nr_ranges to
zero requires (a tiny bit of) extra care. But yes, since nr_ranges can
also end up being zero for other reasons, that bit of care is necessary
anyway.

Jan

