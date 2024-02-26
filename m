Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00E866E73
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685387.1066005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXIv-00066D-Di; Mon, 26 Feb 2024 09:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685387.1066005; Mon, 26 Feb 2024 09:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXIv-00064A-B8; Mon, 26 Feb 2024 09:29:45 +0000
Received: by outflank-mailman (input) for mailman id 685387;
 Mon, 26 Feb 2024 09:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reXIt-00062o-Rj
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:29:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 922eddaa-d489-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 10:29:42 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a3f829cde6dso312113066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 01:29:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k18-20020a1709060cb200b00a413d1eda1bsm2239532ejh.49.2024.02.26.01.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 01:29:41 -0800 (PST)
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
X-Inumbo-ID: 922eddaa-d489-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708939782; x=1709544582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdT5rVxCzzQei2lQdS7rNXeFjGJuJqcgwBCQqylrChU=;
        b=XJYlDagxohw9LlvRiNhwRqjT3ylWU+k+3it+fwSVYrNBKjbxX/DcmBGZDvpISryGRO
         HlMsl1+iNABwzxtOwCp0y1RoioTdBgV67eHB7t/jEq5tPU9k2A8gVyWADL56Nj5XZXEb
         idJcTfZdxnV2eKDz4z/WJ/hevrppf/4jUWJOu0vl4i8VHjeKOb50PeIxdVGA5ETdCH/x
         7g416DjNw5SWijL8iVdawgNdcROUy/OvaF2UnaOpdxzMydMP2eshQONoZXrk11LOF/Xy
         xpG0GhNWYf5pdVyQqFVMaqij8kXjdDRDbtyE/jtiFpLoWV2BSHDIILVPnkoSBj4/z3sT
         2m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708939782; x=1709544582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdT5rVxCzzQei2lQdS7rNXeFjGJuJqcgwBCQqylrChU=;
        b=LHgieyUZUhh8LWVqyBawDuFCeEttirsCF6UEgEG+mR8J70Huw/AUy7Hu18rAoGCgLw
         0oHvWrYiI7id8U7SQrEvi59oAfqJWVmrZb+tyv/6/7L3gJP5MsmTnTUEtCw5di6SxycW
         kf1RGbVtF5Yl3fd52tTnPE+0gaBBC8tX9NHlNpGv8doBerD6aZE1CgrFi98m+SpEgqzT
         glXceEsRDSwUoHJ4RJtVRI9n10YL/ZdQiZ8H4GbEut1EbYd+sPLDVQ3FshyFKKTrWCh4
         m5mwG9Zg4UDtuTO62ArJgRVNqp9r4jpRBZTU4dQa1mvI8OMq2esGOKg+/giXRsqGUEaX
         vi3A==
X-Forwarded-Encrypted: i=1; AJvYcCXLZV+KEZqPNvDbxdhgJUZj95E2miy3iuHN7YNk/UzRBUmLhGe0uUD4AOB0RvW5ZIFMCMZ4sWYQwIojBK7eo8DKgUmIy/uCwfztZAYtM4o=
X-Gm-Message-State: AOJu0Ywvpb4IcHtF/KST7iRP33u0vkM1keZM6fzPzYSoTPPbJVrtzejE
	uD1IiRFOsvbra05zYQkBx5uFpR0T5RGLJfYfMjuw/xVRkKRCI3eQdZxBERt/hg==
X-Google-Smtp-Source: AGHT+IFIkBqX5QJW2uWrAd6horu3G0GLtdsDsQXWsybY3H5M4MLkbl86e5StmM3T+09sIctF60Kgeg==
X-Received: by 2002:a17:906:39db:b0:a3f:173a:224c with SMTP id i27-20020a17090639db00b00a3f173a224cmr4629258eje.51.1708939781989;
        Mon, 26 Feb 2024 01:29:41 -0800 (PST)
Message-ID: <c3657c92-5e44-4919-9b95-4ce051b72d0b@suse.com>
Date: Mon, 26 Feb 2024 10:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hpet: use an atomic add instead of a cmpxchg loop
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-3-roger.pau@citrix.com>
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
In-Reply-To: <20240222090530.62530-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 10:05, Roger Pau Monne wrote:
> The usage of a cmpxchg loop in hpet_get_channel() is unnecessary, as the same
> can be achieved with an atomic increment, which is both simpler to read, and
> avoid any need for a loop.
> 
> Note there can be a small divergence in the channel returned if next_channel
> overflows, but returned channel will always be in the [0, num_hpets_used)
> range, and that's fine for the purpose of balancing HPET channels across CPUs.
> This is also theoretical, as there's no system currently with 2^32 CPUs (as
> long as next_channel is 32bit width).
> 
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, I'm sorry - it's now me who is recorded as the author of the patch,
for my script not finding any Signed-off-by: here (note the typo).

Jan

