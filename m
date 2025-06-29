Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E459AECDFC
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 16:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028654.1402451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVt92-0005Zh-C9; Sun, 29 Jun 2025 14:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028654.1402451; Sun, 29 Jun 2025 14:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVt92-0005Wc-8z; Sun, 29 Jun 2025 14:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1028654;
 Sun, 29 Jun 2025 14:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uVt90-0005WD-BI
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 14:36:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 717e5a51-54f6-11f0-b894-0df219b8e170;
 Sun, 29 Jun 2025 16:36:29 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso714703f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 07:36:29 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ee:1da9:2a84:806b:ad68?
 (p200300cab711f2ee1da92a84806bad68.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ee:1da9:2a84:806b:ad68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b50bsm7814157f8f.42.2025.06.29.07.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:36:28 -0700 (PDT)
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
X-Inumbo-ID: 717e5a51-54f6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751207789; x=1751812589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d8BoEmLpfZ4wfOaxjizQSf77tH7NDGGE11mVzf6Xqgg=;
        b=PBQ7EHxUXcFc7AOZbwKJZwTBVZiQC3ig+AikzSLQYkt5N2F3+5Lr037Uho4auwbrQa
         mOiwsXCPrBC434VNzqP3DlaIZrUMzLXeYO1NzAzdg7bPMXYYrA5oIoC2WYsyLA7UKNIM
         vQM1Sq5PXC/4BGDs17W8k/WlNKcnNTmqIzgJ1DCJoSfScFkROsz7cEB7vr+Gm0zlpiIp
         yeRSW6/RMMkL1HrD2cVsBjowCM9doclBpwijbs4W9u2f6sKGog9j7HOy+MMB1y0kRGGU
         ZEFEY/o/Z6KzKP9xuDAR9j4s0ObAYs1raZ7vPX0yRk3Ip9v1+bjZ0AetQTuvKc0S1MM/
         hdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751207789; x=1751812589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8BoEmLpfZ4wfOaxjizQSf77tH7NDGGE11mVzf6Xqgg=;
        b=cgo1T6wjnvz8eucxbrVJwci7oWQKJkfR3tlUVQUwBQkzoiQhH+MBlfE2+tspRp4jep
         OVcLGtjpOgCzd40uW/Tvhw0Pp5k8mH+HaTTdIgTkOLd1zp8E6yRTeIxaBMNu9hx8inbE
         1BhfIhkKVjj2L3ciIA8vSqYfKH/SlFformLApleetgfbBzYBhFSbgI2OlrEKA5x7JxMO
         +TutdEwLuIAVoPcNuBIYsQs6KuEyRnovTVSYZktREDB7p5M66M3JSBAVl6CydoP3B3PI
         55fTwvisr+hhWMvIxJjEYbvmvxwxUe2wVO3CVBUHswUkrAkIq1/2xD/AIxGZziJei0BP
         b8VA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+z7vnQHhVdvyUjaWLJVW6UcG1Rxkikt5R5DcteBfK9jhemxu0P0PdgnpsmNBoA1nJbi/lEsTkCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMQkbSO3uYymo5KrhnE5P/npHj4x4Cxp2k10N1qHQmM+IsvYPS
	zTxWKIlbJdp02tGWjNXuw/Cv4MlnpQBNWSv01Gv+5OGAkdiUhFKgqJnGgFO7FdjygA==
X-Gm-Gg: ASbGncvoQDueuQOMntNdXNs6WgGppuXOqg07vtMz82SGPfrObdQOXMlnsXNRXmvWnmT
	peGyXEByHtfUGe+2N1wpH+27qnbKYklWswPiR8XuglaEbl+cd9HPr9hmDjY/DiwECCrTrk68LbA
	MiewF+4cafINYDc5fb9quwIGPxpxc/WQMn2wYask5OMlUUrBcxOMLHjVVEUxBrtfHfPK6wJAdbI
	3GmfQDduXrRyXs4YSp79DR03KO6ie6wXIu7uOUCLTM6zFOuTKuFMI14SxZxQ2Qo082AsX/eMUWN
	lfd4cUcEpftPqNyg687fbknaaFctmhXKWp8vzphuXVTqUAU1onmW+vUVxb9qdpHt/MvjbbTAm6D
	J7WyBUC3Jvz/m2RXeJeajE4KHH8QEfOOGIk0ih/pGYqueNwcWV3RBAu7s7PEKcgu7WQe4RkjCP5
	TNtdIobE2ZTKyn9gfKiYca
X-Google-Smtp-Source: AGHT+IGaY8hqgS3R48GHPOWH+BcG26/77v9n8PFNhbVXp5DeSG7J+FDh/7r5m3k1AT0FzhPrjY7dPA==
X-Received: by 2002:adf:9c81:0:b0:3a8:6262:e78 with SMTP id ffacd0b85a97d-3a8fe5b1dd8mr5226464f8f.37.1751207788611;
        Sun, 29 Jun 2025 07:36:28 -0700 (PDT)
Message-ID: <48882150-ed23-4810-b773-74748b9b3cae@suse.com>
Date: Sun, 29 Jun 2025 16:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
 <aFwish8zET1W6-CC@macbook.local>
 <475fb02b-0b00-4aab-b73c-9604fe050074@suse.com>
 <aF6wAh2VaMc9mYV-@macbook.local>
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
In-Reply-To: <aF6wAh2VaMc9mYV-@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2025 16:51, Roger Pau Monné wrote:
> On Thu, Jun 26, 2025 at 09:35:04AM +0200, Jan Beulich wrote:
>> On 25.06.2025 18:24, Roger Pau Monné wrote:
>>> On Tue, Jun 24, 2025 at 06:16:15PM +0200, Jan Beulich wrote:
>>>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>>>> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
>>>>> +{
>>>>> +    unsigned long pfn = PFN_DOWN(base);
>>>>> +
>>>>> +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
>>>>
>>>> Aiui for this to be correct, there need to be gaps between the ranges
>>>> covered by individual lookup table slots. In the setup logic you have a
>>>> check commented "Avoid compression if there's no gain", but that doesn't
>>>> look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
>>>> appear to)?
>>>
>>> But if there are no gaps, the full region is covered correctly, and
>>> hence it's compressible?
>>
>> If there's a guarantee that such ranges would be folded into a single one,
>> all would be fine.
>>
>>> Maybe I'm missing something, could you maybe provide an example that
>>> would exhibit this issue?
>>
>> My understanding is that when there's no gap between regions, and when
>> [base, base + npages) crosses as region boundary, then the expression
>> above will yield true when, because of crossing a region boundary, it
>> ought to be false. Or did I simply misunderstand the purpose of the
>> pdx_is_region_compressible() invocations?
> 
> If there's no gap between the regions it's IMO intended for
> pdx_is_region_compressible() to return true, as the whole region is
> continuous in both the PFN and PDX spaces, and hence compressible
> (even if it spans multiple regions).

My problem is that I can't make the connection between that function
returning true and regions getting concatenated. When the function is
invoked, concatenation (or not) has happened already, aiui.

> But maybe I'm not understanding your point correctly, could you maybe
> provide an example if you disagree with my reply above?  Sorry if I'm
> being dull, with this compression stuff it's sometimes hard for me to
> visualize the case you are trying to make without a concrete
> example.

What I think I didn't take into consideration is that from two pages
being contiguous in MFN space, it ought to follow they're also
contiguous in PDX space. Hence [base, base + npages) crossing a region
boundary (if, contrary to what you say, this was possible in the first
place) would still not be encountering a discontinuity. So overall not
an issue, irrespective of what pdx_is_region_compressible() means
towards (non-)contiguity.

Jan

