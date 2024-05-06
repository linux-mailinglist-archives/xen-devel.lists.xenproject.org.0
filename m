Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB208BD191
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717728.1120210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40Mo-0005Wy-Vx; Mon, 06 May 2024 15:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717728.1120210; Mon, 06 May 2024 15:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40Mo-0005VA-SQ; Mon, 06 May 2024 15:35:02 +0000
Received: by outflank-mailman (input) for mailman id 717728;
 Mon, 06 May 2024 15:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s40Mn-0005Uz-BV
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:35:01 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e738e1d-0bbe-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 17:34:52 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso26661331fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:34:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b0041668162b45sm20089734wmq.26.2024.05.06.08.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 08:34:58 -0700 (PDT)
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
X-Inumbo-ID: 2e738e1d-0bbe-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715009698; x=1715614498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUiUBKu9XEb28QbAb0HZrV56jxAQv7um+hXO5u53PNE=;
        b=P785VbQrvuj5fLplNzpd9BlIBiDqP8kuqG9xIQS5Iuf3/2Eoot8p+BNa1r54/xSizn
         +hIURgVQhQWW36VN0oYAr01k6LHpMLYUcNPsYv1WVoS7Rljh3jh0czghfhnsZeZA8tVv
         SBec2f2H6LHHSBFMxLtiZvRN2Z+w55mbc/qaAgUk61YjOypXRSXS51gRIzEHuQct6uZA
         TekXfNoPWw0sQmDMo8LaM65bZnt7cmdAe/J1/HRtCNDIwvWPVwFeiJ/l3Hd/CJFWzqu8
         h7co8//coqgyqunebs8tV+kaUrQWgkRShIA1cmFTAHb62ZlYeU3aku+CrfcWvORPytff
         A8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715009698; x=1715614498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUiUBKu9XEb28QbAb0HZrV56jxAQv7um+hXO5u53PNE=;
        b=W36QNrhKL+TSyviByNxF625mpO8xcIpjZXqFZ8rpIaQFvG0qb5t6DkLyem3J3A3EzR
         rnCA2to7cvAZf1V669ioTSXsY0kgixmwtp/6StCC09zMVgPW20YXd7qD3YctcbfL0uhA
         Wy9C4p4nHAZ+n6uEktovejnNLSbveKoh3L+Y1XaznUp3/jCpw+m9hvXCtRp4nCpqNY8G
         dF9nHEbwYVsL40XfyAt9ANe+h/leUqgh0PtCWc362ism/ZGenDaiG9K5lZ6EEfpFW/XM
         yxB3LEYioxm/EBemG5twuUgMHZR7yKZpyd+cmgYRxEgi+oArTn5WWpvNO4QblDv3/Y7I
         sL3w==
X-Forwarded-Encrypted: i=1; AJvYcCUMOQbQA215s8+BbXlxrPIEsP8A0ePzCDYhI+J0Z7PoKA0266auzAMwM38J+a2K0pnO7q8f33jRSINtjsB4b9xgqydPrngZPPRoNuh7K8g=
X-Gm-Message-State: AOJu0Yy5aD2X6WOd5hNccrexR4p4zHCqPz1gOlqvp8+mvW6nAhVDvVZ8
	n5z4i9k+d8TZir25WprQG8nvw1xLFo0qe+BL9+O+759U2+akxAtNzcNAuNmCqA==
X-Google-Smtp-Source: AGHT+IFq+0/nLuXGQDq6UZfPIqUf56hXBLcuLmZxE+IWoFTSmESnYCdq/DsBDJKby5ySpl1EBmZ+fQ==
X-Received: by 2002:a2e:3c0b:0:b0:2e1:dc63:9f9 with SMTP id j11-20020a2e3c0b000000b002e1dc6309f9mr7887870lja.23.1715009698523;
        Mon, 06 May 2024 08:34:58 -0700 (PDT)
Message-ID: <a2c6ca3c-4d34-4423-bfb2-13bb98dff56e@suse.com>
Date: Mon, 6 May 2024 17:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
 <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com> <Zjj4SQ3r9ZtjjjKn@macbook>
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
In-Reply-To: <Zjj4SQ3r9ZtjjjKn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 17:33, Roger Pau Monné wrote:
> On Mon, May 06, 2024 at 12:07:33PM +0200, Jan Beulich wrote:
>> On 30.04.2024 18:58, Roger Pau Monne wrote:
>>> Keep track of the maximum gfn that has ever been populated into the p2m, and
>>> also account for the number of foreign mappings.  Such information will be
>>> needed in order to remove foreign mappings during teardown for HVM guests.
>>
>> Is "needed" the right term? We could e.g. traverse the P2M tree (didn't look
>> at patch 2 yet as to how exactly you use these two new fields there), at which
>> point we might get away without either or both of these extra statistics,
>> while at the same time also not needing to iterate over a gigantic range of
>> GFNs. Going from populated page tables would roughly match "max_gfn", with the
>> benefit of certain removals of P2M entries then also shrinking the upper bound.
> 
> One note about traversing the p2m tree that I forgot to add earlier:
> AFAICT we would need one implementation for EPT and one for NPT, as I
> expect the different page-table format won't allow us to use the same
> code against both EPT and NPT page-tables (I really need to check).

Yes, that would be pretty much unavoidable, I agree.

Jan

