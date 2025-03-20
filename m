Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D90A6A3C0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921658.1325448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDD0-0001HR-6E; Thu, 20 Mar 2025 10:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921658.1325448; Thu, 20 Mar 2025 10:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDD0-0001Fg-2J; Thu, 20 Mar 2025 10:33:06 +0000
Received: by outflank-mailman (input) for mailman id 921658;
 Thu, 20 Mar 2025 10:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvDCy-0000nL-Mi
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:33:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ce18e3-0576-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:33:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so6211015e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:33:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdd0sm23489418f8f.77.2025.03.20.03.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:33:02 -0700 (PDT)
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
X-Inumbo-ID: b3ce18e3-0576-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742466782; x=1743071582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eQVazOJlWberGa7NQsP+2uxAiCJL+ke5FVATRNPr0UE=;
        b=N0dWPAfxx+0BiMqgcqYe7tKSFYk90CtDgXe7xyeTt/Koc29fpujNpQe8WUgo2kxSMa
         hMc2yTkVxrvKGOdgPXoqHa9xbzi88Qe52Bb3KYHiHkO1FEvkgOjefu0nKCru9LEqI4ky
         dpXNwnpYD+ini3H7e1mMAS31+1qLHhj0AKJJSvZWRpkw14jToWt2SqozZ95JEZs7/7bd
         8h72u58DVFgCXCqR9iqitBiuBw2mG18peJIAHK6QtzTydLGwQAbuaLK41Lba4YRf5mnw
         E+jkY2h2T0sS4eWpTKnPRuS4jhrW6ErvTuBCC3E/lkpW03GdogZ8kmffu2n2nDTnXodp
         65hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466782; x=1743071582;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQVazOJlWberGa7NQsP+2uxAiCJL+ke5FVATRNPr0UE=;
        b=Fi3Z77jQ+Z/lSxKETnxpf+6G/3Lb47kAs2wJJ455Ik9zlFBrIbnP8IUne094peEW3Z
         SkeyKXVaVc4/oyORWHqk0526G1UA675SsybO3yY5d8UQwZqK7vaqZNv6xZJK4zJi5S/h
         UPfktbS+qnVcxlk1kMsV9/2yJrHNLkHWPomRczXRHR1R7Dz8iZFp5ScTMH0rDWCJcK1I
         nXGQwRt8qqe/P55mED3vaFbGiMYbKjHeLMFXyFw/bKPydu0gB040snUwsOdc/QdAzWpD
         wz5woIRaIdb7R1ARXzZ90pkSuVo1iI40k6xDy41ZeI6oBlmXyAEqkOi3e3EvKMej/x0H
         TI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9e8kKmks5LFByxMVp0md0SpC6mNJQg/pvEeIp4TVnjecC1B7MHYQtGIFTQiAZ5HXmb1yLb3DaYhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/ZKmAumIfpTRT7JBm1QWdoPRyMxPwwItjQ6hweBmA53Ip89o/
	g367wsy/K3Of/kn2hhHSU+36JL7T9i58jlheq1ThAyVjbFxsl2L8Jb27xGMRyg==
X-Gm-Gg: ASbGnct7rTun3esJPacdH50fa7ZagJkzjM6addRUqdhMWlsGVgBKfoVpaeStz3re3Ud
	AxRgrb+sgVEuEBdCJPLLtvKkC1mDTarbuoNgAAIQRKqm2yf8ZR/gRki33a1IgH+5zWHZguWxguq
	2hM4PopL8l7BdCd//wBFls8KuJtg2eEqsMBD4bAhlyEjgTqVTzA7QTlX8YAkRFaL2atSo4TAMd0
	xK1u5IlENmyuDRS241hJu1mPPkFDMgoOZ0sAaQuGNng7TybQesfsbrPQk/4d3vd3NPhUtWVvsqr
	TvgnoaoTr59T92dHZadk3adKfV8/yZX4NbiMHOgvKGdPecheRPpZwY1QfCDrWoKds7glVnY42dL
	c09bYRGhEa/os/Gk83+tAKKkkStS+/g==
X-Google-Smtp-Source: AGHT+IFa4BgTQzkO6ClckzVQvn7CXXNMQfUktt0xJSLv+0sFvc11SONO0l43BlTmfNLFlW1iVNYOMA==
X-Received: by 2002:a05:6000:21c6:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-399795e07d1mr1930920f8f.55.1742466782452;
        Thu, 20 Mar 2025 03:33:02 -0700 (PDT)
Message-ID: <6f28f284-25b9-4a28-a6ee-8588647801cd@suse.com>
Date: Thu, 20 Mar 2025 11:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog
 timers
From: Jan Beulich <jbeulich@suse.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Mykyta Poturai
 <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
 <ddbf31ae-5877-4df2-a6c7-8b0251ce2b01@suse.com>
 <CAGeoDV_h9vgyKyk_kH4XwsoWiJN0dx2UY+N0JAezUknGk9ez3g@mail.gmail.com>
 <7a1e9fdc-c1ec-449c-bf49-70bbc8e9c352@suse.com>
Content-Language: en-US
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
In-Reply-To: <7a1e9fdc-c1ec-449c-bf49-70bbc8e9c352@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 11:31, Jan Beulich wrote:
> On 20.03.2025 11:25, Mykola Kvach wrote:
>> On Thu, Mar 13, 2025 at 5:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 05.03.2025 10:11, Mykola Kvach wrote:
>>>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>>>
>>>> Introduce a separate struct for watchdog timers. It is needed to properly
>>>> implement the suspend/resume actions for the watchdog timers. To be able
>>>> to restart watchdog timer after suspend we need to remember their
>>>> frequency somewhere. To not bloat the struct timer a new struct
>>>> watchdog_timer is introduced, containing the original timer and the last
>>>> set timeout.
>>>>
>>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> A From: with no corresponding S-o-b: is potentially problematic. You also
>>> can't simply add one with her agreement, though.
>>
>> Thank you for pointing that out! I'll revisit all commits and add the missing
>> Signed-off-by tags in the next version of patch series.
> 
> Ftaod - you may not add anyone's S-o-b without their agreement.

Oh, and it would help if you could avoid submitting patches with invalid
email addresses in Cc:. Everyone replying will then experience delivery
failures.

Jan

