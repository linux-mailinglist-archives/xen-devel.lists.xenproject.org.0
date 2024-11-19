Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A939D2109
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 08:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839706.1255490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJ5F-0000Av-O0; Tue, 19 Nov 2024 07:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839706.1255490; Tue, 19 Nov 2024 07:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJ5F-00008y-L6; Tue, 19 Nov 2024 07:55:37 +0000
Received: by outflank-mailman (input) for mailman id 839706;
 Tue, 19 Nov 2024 07:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDJ5D-00008s-SB
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 07:55:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6f5e734-a64b-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 08:55:32 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso92815766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 23:55:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e045385sm619665966b.144.2024.11.18.23.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 23:55:31 -0800 (PST)
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
X-Inumbo-ID: a6f5e734-a64b-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE2ZjVlNzM0LWE2NGItMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDAyOTMyLjcxMzgwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732002932; x=1732607732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpsLiC6ANMQRocnay0VWZfiyMfcDEp5Cha3nTMuQC7w=;
        b=FKCCiK2zwGqfkNJ+BifSyT9mYMshYXqou8OVSaNE4U5BhSOQIrhZ7mwkDW70YeEskF
         5U/znnIwbMXQnEBXP+YwlA+UOzMUslo7FYmmEBeoVStt2ibydtKVMkYI15VK0/RYKupo
         4AGHt7OP4QafvBakpuIjWZlw5q/oxtO2mzCAUYGUngDmHoNwxqT3+il9ICZoVHJn33BL
         3vyy7aS8q4Z4t4dQWq+rZH7cG7LnzJjJWZ1H3tvtAYHzroFXze64bwEKuKgdgYnsHjMC
         MgYhve5h72MaFzI9izaqToXfVc1cVT7/RwyVkxME0POS5jz76MPIrVNr7vHPT+6qs+3S
         YDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732002932; x=1732607732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpsLiC6ANMQRocnay0VWZfiyMfcDEp5Cha3nTMuQC7w=;
        b=cqOW3L55iFnp58cdGy4R/JbceUhw5cbuvWDG3w1ogFVfdhKMvOpvAJ9PA4s5U1WSQr
         YBUp6Ixfh7LT7F0lI9pwmDxCleo6K6c6yBLmZPcMDuLZiznU+q5lgV6fAy3baPdS0rzN
         nUHS9Ilv6MW+jvQbrdiDDyqdML0gnnQd+LA5XOSisI9Rp3I9pElQ3WAK1cbEOUoXPVIV
         bXKzXlRdQew8M0CYNvvfdTKFoE4DX10cEAOFJcbygw1r8FRCuEa8043ISESuXN5nZrEJ
         l+J0pM8Dg6w1W73kGyym2D/h1S3yW+FgAAVxz27i47Ww98z67S9ShusvFPGxCRAfGNHN
         RO7w==
X-Forwarded-Encrypted: i=1; AJvYcCXxBTmeEQL5h+DGMNGpn6RSjUbVclXIVt7C9eWhZLhM37099HWi9SJWLK/wfUbP/GlKSkrSm4umldQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxugaqo66pWBBiypdOjgzP3f6/VYrF+y9TU216BSeUDFefGgB12
	mznyBhtauJ8yJZuPZKyGo5bFM9JlrUL0/aLOmvgcVqIQxD8ahOkt76iYRqiL8Q==
X-Google-Smtp-Source: AGHT+IEdh4qo9N899do3ftIaE+E31kFMeWPaYJKf3RtvmInNt9JQk4lhyyH8/EiMGd39e3hZPZJgWw==
X-Received: by 2002:a17:907:31c2:b0:a9a:1f8:6c9b with SMTP id a640c23a62f3a-aa483525b04mr1152135766b.37.1732002932147;
        Mon, 18 Nov 2024 23:55:32 -0800 (PST)
Message-ID: <3c596fa9-4a2f-4148-9d41-b3b6e556c041@suse.com>
Date: Tue, 19 Nov 2024 08:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 07/15] x86/domain_page: Remove the fast paths when mfn
 is not in the directmap
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-8-eliasely@amazon.com>
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
In-Reply-To: <20241111131148.52568-8-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 14:11, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When mfn is not in direct map, never use mfn_to_virt for any mappings.
> 
> We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
> arch_mfns_in_direct_map(mfn, 1) because these two are equivalent. The
> extra comparison in arch_mfns_in_direct_map() looks different but because
> DIRECTMAP_VIRT_END is always higher, it does not make any difference.
> 
> Lastly, domain_page_map_to_mfn() needs to gain to a special case for
> the PMAP.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----

Just to mention it (noticed while reading Alejandro's reply, and I didn't
check the rest of the series): This is lacking your S-o-b.

Jan

