Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B769C03D6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831673.1247015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90cG-0004kx-VR; Thu, 07 Nov 2024 11:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831673.1247015; Thu, 07 Nov 2024 11:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90cG-0004hn-Ss; Thu, 07 Nov 2024 11:23:56 +0000
Received: by outflank-mailman (input) for mailman id 831673;
 Thu, 07 Nov 2024 11:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t90cF-0004hh-GX
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:23:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48a80cd-9cfa-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:23:52 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso8136871fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:23:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432a26a7508sm72434345e9.0.2024.11.07.03.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:23:51 -0800 (PST)
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
X-Inumbo-ID: c48a80cd-9cfa-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMjkiLCJoZWxvIjoibWFpbC1sajEteDIyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM0OGE4MGNkLTljZmEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTc4NjMyLjU2NzMyNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730978632; x=1731583432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Syh19L/M+eIV2mKgeoSgMkx4RX4dpOVqnJMgqzmGFI=;
        b=MdOySZdiyBQH91xddWLWIwsdKeU/ZC24AyxXlnNHnLYZP1gVAxe+B9NDCQLteVMRrd
         n9UF9T3Uvhn+S3I2/B9uGdyy5tu1/FGiD/7WMUl2sLJhwOGwnRpFtkuv75DFwlJc/ngq
         1xAnulhbajlqs0AZlxV71IboJyGl0+/7UVWz6BRWlM/kSBylzhoxCR70evXQHpE0JZF0
         XJghS6y+OeZtziFzBJrhenoDxiohHIFZCnt+hiCm/SlhqcnZqH5qcgHGHBZ8b1cAfTAp
         03cBb5Dgs2pt3HUtHcCQ/o+IxGlwe5JIrdg+/+T0GiWqX08T9/BvIsB0WuVb35sd9AHk
         YkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978632; x=1731583432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Syh19L/M+eIV2mKgeoSgMkx4RX4dpOVqnJMgqzmGFI=;
        b=GSAYfL+Y0D8w131ZmDaxGwLpjmtrth1hH4fKlbTUsj7fVaoME3/eVF70Oe/9sW8a0n
         6z+tgGgKHMHXsLNtsPjDoxZTmnniEvwGPX/JtZSajMNmxMemzZdS7qBzDStnNQVUAwvV
         +N2fFZhjt/Ie6S2h4IcttRWPk6MICBXaNMmOadjDrNUk5azqUGE1H9AECfjoUwBsT99c
         G04+HgPGCpO08q69hlWsMuVA1yMw8OTaU4jH3I9TKo07LxfWIGe8arbYnjl1jDR16ANM
         7Iq9yHLvm+LO2zsr2S/poNKYnO8Kzk2NhpZ5aRMvmdaDplcm526bNAm5RIcQs7e4dfts
         ES1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXERwWszhWNIKDnWakIWj7PpWm2zbaJfnqZfHub4u9oiB2BTud80nVFqqsBvVqeVMdJrbhUHn7/tQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzX+GVa0V3Dg27zsfBrOVmIgCvnw94oJRfPK2X4bQCVsKDK7wz
	SBVNm1SxuhfxKsC2rQn9YDzO5g3lm17IWteT8/cMEdsD6vZXji6ne5Q34cGlFQ==
X-Google-Smtp-Source: AGHT+IFXU7XB0Evp6CcKHZiByPYRpUxo6dnZ1rCX9IK22kSLSbc9xs8xtAHKrAuFlUMI847G76Ukkg==
X-Received: by 2002:a2e:a596:0:b0:2fb:57b7:5cd with SMTP id 38308e7fff4ca-2ff1a8c4906mr7005131fa.7.1730978631930;
        Thu, 07 Nov 2024 03:23:51 -0800 (PST)
Message-ID: <c8620982-37b5-4556-9061-5dbf5778a43a@suse.com>
Date: Thu, 7 Nov 2024 12:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of
 destroy_xen_mappings()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-4-roger.pau@citrix.com>
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
In-Reply-To: <20241106122927.26461-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 13:29, Roger Pau Monne wrote:
> bootstrap_map_addr() top level comment states that it doesn't indented to
> remove the L2 tables, as the same L2 will be re-used to create further 2MB
> mappings.

With that I assume you refer to the 2nd sentence in the comment immediately
ahead of the function. According to my reading, it may imply what you say,
but it certainly doesn't "state" this. Imo the problem was latent already
before, if BOOTSTRAP_MAP_{BASE,LIMIT} were changed to cover at least one
full L3E range. Which isn't to say that ...

>  It's incorrect for the function to use destroy_xen_mappings() which
> will free empty L2 tables.
> 
> Fix this by using map_pages_to_xen(), which does zap the page-table entries,
> but does not free page-table structures even when empty.
> 
> Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
> Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
> ---
> The fixes tag reflects the fact that if 4376c05c3113 freed the L2 correctly
> when empty, it would have become obvious that bootstrap_map_addr() shouldn't be
> using it if it wants to keep the L2.  4376c05c3113 should have switched
> bootstrap_map_addr() to not use destroy_xen_mappings().

... I mind the commit you name to be blamed. It was clearly something I
missed back then.

With the 1st sentence of the description re-worded some:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

