Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4531AE766A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 07:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024307.1400211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUIdd-0004yA-Ec; Wed, 25 Jun 2025 05:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024307.1400211; Wed, 25 Jun 2025 05:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUIdd-0004v6-8q; Wed, 25 Jun 2025 05:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1024307;
 Wed, 25 Jun 2025 05:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUIdb-0004v0-Kh
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 05:25:35 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0a30589-5184-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 07:25:32 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-442fda876a6so55090675e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 22:25:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f22a:dc83:b72e:7a24:c0fa?
 (p200300cab711f22adc83b72e7a24c0fa.dip0.t-ipconnect.de.
 [2003:ca:b711:f22a:dc83:b72e:7a24:c0fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538236694esm8574135e9.28.2025.06.24.22.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 22:25:31 -0700 (PDT)
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
X-Inumbo-ID: d0a30589-5184-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750829132; x=1751433932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P+bJU4PAZSKYKKXh3OEvEgCL/2i5HMkaPXf4oVzoT/Y=;
        b=TweZsfiFeMMJ4VOzfmnqKvWVc1gi3hW0uK2VKL1xJDggI7lbR4gJ7H3bxVXkKRCCRr
         6Hv3QyjC8F2E6pseM0CRoDXxL0U10KU6KRkbyr6aSpnZY0DkdY/Xx4YCsChm77/CV020
         uHD+7vaxLSbMjtDg3tGt/PjARq0aeSOjCvu9Fr29q3jdktSDdGfGbP1DuBEE6LEFBYHP
         CMtd+aDGiHR2surRvvXNxyjZCe2NCQQwXIq4X7/FHeRBHzpvAv9MKcU8x48+IyeNtWRZ
         S/8dD1mhBOrwHiK0Y5W+yBX7m79vK9gn9rJeW9PzNcBIL69cVfwnBnhhB8Z+H/aemqtp
         hxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750829132; x=1751433932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+bJU4PAZSKYKKXh3OEvEgCL/2i5HMkaPXf4oVzoT/Y=;
        b=thpK2yBTeUuqvBIzqZlRLR67OpTq4BqT4nn8A9ViVxW7sdiH//VCM21iNupaZGPFp4
         6VIVpMgQCzbKIpXFTuM8s+EevL/hvGmttofzepTHLfmhmneQp6MrTymQralXcIbAKCEQ
         RNEf3ZcWhELZFqYVGHEYtEJzvWo806E0PCAHLRhNOMS+i09oHpBYiCFhYo98W1DBLsAY
         QmCCATErzbWqCOAW7Ay0mm1Mm/20UWdEE3iSJUqX9GJNDSU+h2fz0DanqWX41tM0DV0m
         bsFAaMurOtf0vRLihJPbiwTQUu/aO+zD/9X383MJYra3kvc/Aws/xvY8kCR2i6UVu9Ol
         r3fA==
X-Forwarded-Encrypted: i=1; AJvYcCWA8o2j8ZefbPnwxEIMgP6pQmjAWrHclCxzOkDqqdAcYQM/JQllSx+Rs86bs6Fu9kkCOipC/il67Pc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytAJm1sGtMhNxCQ61P984KNAyVaO7C1Hw89NfNQvJxkfRBAVDE
	ZWBbMFI+jbZ+Vwo5L4X6Z/+h+Dk0I0J2vtYbuFv4+BGUT62wGm/Csm1edM+lUADAhA==
X-Gm-Gg: ASbGnctAZRIwKF+GBPksCmzqIzL2wcSFyZbS9QqbdJR09z4IBdKFaIx7ghM8E2KDwR/
	ymcz/ZVPChsQPAaTNKwBWwJcu5wK1KDxvhEqap9TExIwVDh7VFr7Xlx6U2VbZYjpFzrl3lADSMK
	9t5z+y7asw5n9iVVh6p2oKGpSqtlUTskzQmeKkn/MvOnqG96UifIAqbankon7ZqAE5LWwSSAnu8
	K1V7vpVOI1z5RCQ3mc6RosxhlCQjhVeLukmr7n+tgWTNubRwVaNhgv7Cddxg/vP4GGC2ENHfylW
	TNWjWK4zwIve8Szq3tMw3lIfSkn6o9AmEGZW8drhxm5RTbDShdBsLY9uVwBoRdfG34gHuyCNvpq
	zOIWCeFKdhxiDVeYZmt9+ADb28xEGmhF2Nd8JY0K4oneUhxOPBGrryODpTOUNi4FbcGn5WT2Hy3
	3ST8JyNBo5pjDYcYQk6cSlaRY1HGDr7us=
X-Google-Smtp-Source: AGHT+IHKBdM//9HncCq6qLsA3PG01Qz9U9HhmPGH3kzv2eaQ4AKdkbndTv6YKs9aPGhYA6R8ihJjsA==
X-Received: by 2002:a05:600c:5492:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-45381af1eaemr10357805e9.26.1750829132180;
        Tue, 24 Jun 2025 22:25:32 -0700 (PDT)
Message-ID: <a63ac9d5-152e-47b0-8169-bf470611c059@suse.com>
Date: Wed, 25 Jun 2025 07:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART
 emulator
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-15-dmukhin@ford.com>
 <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com> <aFpViicgGigZPFNv@kraken>
 <6d33355c-477f-4ef3-8f17-b7f1dd1164ce@suse.com> <aFsssYQu1GcuvjPv@kraken>
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
In-Reply-To: <aFsssYQu1GcuvjPv@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 00:54, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 09:40:02AM +0200, Jan Beulich wrote:
>> On 24.06.2025 09:36, dmkhn@proton.me wrote:
>>> On Tue, Jun 24, 2025 at 07:53:04AM +0200, Jan Beulich wrote:
>>>> On 24.06.2025 05:57, dmkhn@proton.me wrote:
>>>>> --- a/xen/drivers/vuart/Kconfig
>>>>> +++ b/xen/drivers/vuart/Kconfig
>>>>> @@ -3,6 +3,15 @@ config HAS_VUART
>>>>>
>>>>>  if (ARM_32 || ARM_64)
>>>>>
>>>>> +config HAS_VUART_MMIO
>>>>> +	bool "Simple MMIO-based emulated UART support"
>>>>
>>>> Perhaps in a separate change this should be renamed. HAS_* should never
>>>> have prompts.
>>>
>>> Oh, so HAS_ flags are non-interactive selectors by design?
>>
>> Well "has" simply by the word means "this is available". Any user-selectable item
>> deriving from the mere availability would then have a "depends on HAS_...", thus
>> hiding the option in situation where the functionality isn't available (be it per
>> arch or for other reasons).
> 
> I see there's a lot of drivers (UARTs) which are selectable by the user via
> HAS_ symbols (drivers/char/Kconfig), e.g:
> 
> CONFIG_HAS_NS16550:

Iirc it was prompt-less up to some point. And when the prompt was added, the name
wasn't changed / split. Other UARTs then followed suit (when they shouldn't have).

Jan

