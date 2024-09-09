Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39F9718D0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794371.1203253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd2K-0006wf-Te; Mon, 09 Sep 2024 11:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794371.1203253; Mon, 09 Sep 2024 11:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd2K-0006uV-R3; Mon, 09 Sep 2024 11:58:28 +0000
Received: by outflank-mailman (input) for mailman id 794371;
 Mon, 09 Sep 2024 11:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snd2I-0006uN-R2
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:58:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d164d8a7-6ea2-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:58:25 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so187592866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:58:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7280asm329150366b.129.2024.09.09.04.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:58:24 -0700 (PDT)
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
X-Inumbo-ID: d164d8a7-6ea2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725883104; x=1726487904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H4BGQzk4oBM51u7SyNovk/gaQ0+7/Bt/Ud2EbK0oSV8=;
        b=bzumajl9Rf8wgdRAcSehwtOL9Kdm5VxSeQavsFHW3ImH4CpKxbvOIKiH1R99Tb1PiD
         zcwopRSDLCrQQSQavSlUyjPAXNiqMUwN2lPRT7idWgBfOGk/xhB7kUawegaqDbMeS9vR
         gZ2+4Bl6wU719eRZoO7FP7wn2zcy3FfPE+qMn6Cgf2C5d+iHl3zK7jKqZXLnjSLsUR1s
         QxQnc4x9HLPrCohmFGp054pwcJk/BoQYagCP2oDkOAaTpzBxyV8QVj30+ZHuiitvwfx2
         t4UoHHPy1KS5d2FxwYjy/aykAS4jzmYgEzEQmGMQWNhDSJfLAKd1XwlO+CvCA82pQ2v1
         KYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883104; x=1726487904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4BGQzk4oBM51u7SyNovk/gaQ0+7/Bt/Ud2EbK0oSV8=;
        b=apAYtQdc1Y+5NuRW5uOFYcySgYglueC8JZT61s+lHY2T4Dxq2FNwESB7AaqeSIdFFL
         LXFqQgHUUzDL9M9R0GOQ4WT19Z376FrRz22ePwonLnizKXqXPY6zc58gYsd5RvDZoY+w
         3jLYtqKAwiec+poAr9MaGRfKbq+kPiT0eUegRb8UcZy68WPlR1XOi8P227Mh49422sNP
         bJV+2A1GJMJFmK6MIRB2J5ONJ2ERY12wxPF/GS5xUAyapJoKwFbYaSZs+Kt2n6pd0amQ
         LD+qAeZFf914uJkUr3on1VKKJGn0OcnoJYOd6ZJhUCnqcuARH4peIijinLKIVOPpi2MG
         GHNg==
X-Forwarded-Encrypted: i=1; AJvYcCX92Qq3keNliho+GjTpEbRx075B8cKWiH3INwT2+HIVBiWjfW7RKCHePR/11DXHmGuHybtzmjL82So=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5mY5Z3dJ+mKjr9G7ClqE1EB6jM72D9O/EEz7Zl2MOY5cLlMAi
	6UH+5DY73MArpnKFGrXGbadRPGWrJ9g1dxx+YvTPReqjNj2Ri1jixPRPmwsz1w==
X-Google-Smtp-Source: AGHT+IGmP/rZOpM6EkExsTPnGRVkw5Ku8gjBBI7RFMQ3kgJohIJMKRKW4tXYPslUeh61E2kO1kxeKw==
X-Received: by 2002:a17:907:801:b0:a77:b4e3:4fca with SMTP id a640c23a62f3a-a8a885bfbe1mr1164990466b.9.1725883104311;
        Mon, 09 Sep 2024 04:58:24 -0700 (PDT)
Message-ID: <dcf7e808-5514-4c54-9552-d1a2cdd934ac@suse.com>
Date: Mon, 9 Sep 2024 13:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/build: Swap cache.h includes for xen/sections.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
 <20240905220806.141300-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905220806.141300-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 00:08, Andrew Cooper wrote:
> These include {xen/asm}/cache.h but only want xen/sections.h.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



