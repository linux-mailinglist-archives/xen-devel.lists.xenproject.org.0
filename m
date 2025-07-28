Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C5B1378E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061154.1426660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKE7-0004rx-PM; Mon, 28 Jul 2025 09:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061154.1426660; Mon, 28 Jul 2025 09:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKE7-0004qW-Mb; Mon, 28 Jul 2025 09:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1061154;
 Mon, 28 Jul 2025 09:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugKE6-0004qQ-RX
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:32:58 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d63eb9e4-6b95-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 11:32:53 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a528243636so2512094f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:32:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f58bec0sm4524388a12.17.2025.07.28.02.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 02:32:52 -0700 (PDT)
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
X-Inumbo-ID: d63eb9e4-6b95-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753695173; x=1754299973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ofzygOGkicFFf1sYTsDF9u2nyqP2V0CJo5N9Yj7z7yk=;
        b=MW8zW8sAISdHeiMNMu20uh3MP4ziGpQaZDBfqPmb1AgQJbklmxVTg9EgaE7F7OCaST
         JaRQBiCtbQX9mWkqeWouh9Zem5nDwEckuwKDEMixLxAjUUSdIkDowA/71Rjmn+N/jDDH
         ZL43GEJg3AUHbEqAThXjuZRuchv7hx0TpHHNFYKUB1At1mBWjqXRoojTmad1eLHz9sQn
         QISep8HNf3I8wrayAaKjYOJf5gZha2DboSY+zA38ap9aJ9ROZdFg1phJsYHgwrGGH7DV
         lp2qQ93p/0Q96mezB3enJcZdIHaM3MQb3BiqLgCdpGIg/pwXmliL7yH6O2JvbdBPo3/N
         a0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695173; x=1754299973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofzygOGkicFFf1sYTsDF9u2nyqP2V0CJo5N9Yj7z7yk=;
        b=Wj7V350KfavRLz8L47CEjrYHMva2RjacPAVk50Wo4ZHDu1xyHPIMhdBsnWVdwKjV32
         xbq84ny39RnK4+gqeGfCroDm0/AIJtOm9BJ8LVNqdo8TCdhjCup7MZkJG3wgnv10l23u
         C8eo8s9a6WDKQcMyNWUCGexii6eYrlv1AqNSFUQjUHdBTq6Q30SysKPhx1y7HPFx2Zsh
         iws8GH5OrnSNMAltwKLoqjUvD0iamqk7xIsQnqaULyKDbG5smj1XrRuRf7rtfxVL1BRP
         ra3hDHLo5ssbUC2gg/ibqd/QTP1qr+NHooF0ZEZmkj/9zobMiiR1qBqWQc47OcZgQmSs
         z42w==
X-Forwarded-Encrypted: i=1; AJvYcCWX3guDI3BDOTWAdsvUSTx87xawgE2VV2sF6JbLvWKhqoa5SRW+MGnOc2U8Xyg0wIzRSB9njAa1qug=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaDqk/s5iXhByghtUhgp1p8xVUtisfA9MRMibQJrLt8+CdXWui
	KI7f8hcuwjZGNhVD5BkObbXodLTmyVGznF14ZKva4XGnDQPJPn+Lcw7MU3ZPqjnm1w==
X-Gm-Gg: ASbGncsUb5qrKqgToeAAP7tKV2WyOXW82HNS+CAq/z7TKbib4NUbrATFvqnD/32LOTP
	nb7hvs+oR6XpHjuZXCYfCr1f0VHIKNdTYdJRiWd06U1RcGaqw15J2UjfOTOrd2FCd8iOzD2ILx/
	d3M2J2+NzhY7m1DUOZz0bOAJIVxrOQuV5WtaFU0Ddyo1jHY3/Ox+J4n/CSfpSJFoFnpNXksZ3KL
	6IOVzXiwtKOqk1pscGCwopVt5kCAqweRVNZm68/zUVFowNGGDRga2J4k2xoAUX09CBekhpuXCxy
	4LVoRQlDguHcb45MVTrhP2le+wgLCC/kU2WN7yNRazBar71Dd82uun3HKVYpAtZ78R/jWB1BfaH
	tKlCEONz56jWUzn933KFOZ0QaLo6GSY5znHKm2bgfybjYYG2jPaFcwweAcJlDq+TkcTD/Ep9DN/
	gc2z2JtYg=
X-Google-Smtp-Source: AGHT+IENwU+UBwWghtyCsqQzdfrzF4qs4/y4iURHdWJQzp7w9eFv02eVOQNMCZOA70zdjFCsk6GDZw==
X-Received: by 2002:a5d:588b:0:b0:3b7:8914:cd94 with SMTP id ffacd0b85a97d-3b78914db69mr1364526f8f.41.1753695173187;
        Mon, 28 Jul 2025 02:32:53 -0700 (PDT)
Message-ID: <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com>
Date: Mon, 28 Jul 2025 11:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
To: Julien Grall <julien@xen.org>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, dmkhn@proton.me, xen-devel@lists.xenproject.org
References: <20250725212235.753363-1-dmukhin@ford.com>
 <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
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
In-Reply-To: <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2025 11:20, Julien Grall wrote:
> On 25/07/2025 22:24, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> __printk_ratelimit() is never used outside of the console driver.
>> Remove it from the lib.h and merge with the public printk_ratelimit().
> 
> Is this solving any sort of violation? Asking because even if the 
> function is only used by one caller, I could see a benefit to be able to 
> use different value for the ratelimit. So I leaning towards keep the 
> code as-is.

+1

In fact I'm surprised (or maybe not) that we still don't make better use
the rate limiting functionality.

Jan

