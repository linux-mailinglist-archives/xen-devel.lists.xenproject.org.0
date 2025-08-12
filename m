Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E2B21E51
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 08:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078273.1439259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uliWE-0007D8-PZ; Tue, 12 Aug 2025 06:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078273.1439259; Tue, 12 Aug 2025 06:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uliWE-0007Bg-M2; Tue, 12 Aug 2025 06:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1078273;
 Tue, 12 Aug 2025 06:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uliWD-0007BX-Ti
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 06:29:57 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c11c5204-7745-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 08:29:52 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-615d1865b2dso7533935a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 23:29:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2a448sm19708905a12.20.2025.08.11.23.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:29:51 -0700 (PDT)
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
X-Inumbo-ID: c11c5204-7745-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754980192; x=1755584992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UOpw8XetIMan0yhWiD5lJE5cK4SohqTFNxbbqrq+sRY=;
        b=OHpUN4jO8CtX1XDpnKLFfRUcDTuMSsxOBRlizlbHxrm/MvaESTs2qfxaQOpO8PM3jt
         X88hJcuznBo0tnNmARb6v7JP+vFp781JytQIoRBp/BMDk8eMWW3HrIjnJ3PQHKsYQjMB
         ODr05LSvEEyku4HaA8VxhRC1+t7Qt6xRygRlj/PzEyftXYc2tZ+2UGRBIO/NEN83xVsO
         xw0CJ7GL0+uYhQb61Fz2iroDoV3cVs11M6D1zRFrBGjPdSVlYkdXHd7y3pqT/ytZ9+Nu
         jAMUQ6tya0dImeIG6Yvt+5OI6N/cxV2tSfhR4tV9zGpaFsHMjIBq5oPmjql5aiOK77nB
         TqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754980192; x=1755584992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOpw8XetIMan0yhWiD5lJE5cK4SohqTFNxbbqrq+sRY=;
        b=k4jD82MddLQ7NBWeaW6ZPTfENGdnRJB2LCgNuC8yMRqht6eIib95u9Hm9XlVCofSdw
         HUitcnlgWggmGHTum8mCaDpNYl9eQXKQZq5UKKdSwa5+djZgGwvTt2a+EkdQyPjkWDVK
         W9UpCxty9DkamwDCXHbsrs8MvqBY49B3Itil28SAjn5GQ0p9uigPgGkaZv6R88XAqtTB
         OD8rHKr/oDNST4RUx44pOOGijs6ihqd2BVOIWylDid9UrAE0ClmWm/GCS5VOLhya2NTv
         1mCQ32oFz3BkPK/XM4XjPsjbzfDY9/QLgw9fMEVV7LFsOIaNZgDzjP7BEniXS6IclBPF
         nU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlGWYO6RDEmIOy8vrB9sarkTIGeHVWg08/AUQigCV68iuyAnmCkJF6OArdrFkn9wVxLX6zGe4sgFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQBoLR0BhGxfsT4G2AnqppyrHFmrwllb1P1uiyo06ireO6gYSX
	EJ+0u7Jit2kVtuuC/xXJvYU6shXDj6Dkkv/qfRhZTY617XWxjITo7ozwuT/atb57SQ==
X-Gm-Gg: ASbGncsE/FG8KitSHMuSk9xg85D0Sm4N4q8n0LNStQJeS44hr8RLVnzgwW0C06iZp+/
	g7xufMMimK/5djDbfYvTZ0EKfg9NjAKz711TDZ5FenGT+u5fxCM46+ds5gieRwkUSf1Oa/HmKs1
	8YhtbM+s6ZjMkoJ2Bv/DuNeZbu0+I+G6hHlhLh9VYhS6zr98qN/olpL9XrBrTtAszpbDxW35m/k
	XHebhmy1EO0DacSxEILPmKWZf0bsel7jeVCd2Lp63Pu5E1SJEiP5p2FNasbRYOCKG5U5lCdkXGO
	RA9e1iZUBUt+N5/mcOUOP/4Ynqvb7Y+FrAsRPcOIWfasScc1vxYekkyr4c3ppusxYSrvnNinJcj
	TRzT9ENEcs4t4r9dUV/I7y5uAWI1SbFtTLSJ0MjMmWnJSDFYREaVYD49k5EeAWvxkBhWTSsnW6u
	KkAXsI1vzrhqxXyCZDvQ==
X-Google-Smtp-Source: AGHT+IEK4yiVmkCLThUnyCElrDWbiQ23/ZYLAF+98DtJB4d+67Q39FPWgJ2JZwBxuUbbaZANs5uFyg==
X-Received: by 2002:a05:6402:2354:b0:618:c2d:dd97 with SMTP id 4fb4d7f45d1cf-6184ea28ea0mr1685512a12.1.1754980192024;
        Mon, 11 Aug 2025 23:29:52 -0700 (PDT)
Message-ID: <ece155ab-d247-41cb-b3a1-ae4233423cef@suse.com>
Date: Tue, 12 Aug 2025 08:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: drop assertion from page_is_ram_type()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <804094ae-bb76-4165-9e07-46b775b4b46e@suse.com>
 <86faa2fa-9f23-49a9-a909-a3dd3d5a938f@xen.org>
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
In-Reply-To: <86faa2fa-9f23-49a9-a909-a3dd3d5a938f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 19:24, Julien Grall wrote:
> On 11/08/2025 14:01, Jan Beulich wrote:
>> Its uses in offline_page() and query_page_offline() make it reachable on
>> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
>> code added. It being reachable was even mentioned in the commit
>> introducing it, claiming it "clearly shouldn't be called on ARM just
>> yet".
> 
> So I agree that the function can be reached. But then I don't think the 
> function can simply return 0.
> 
> The name is too generic enough that someone may end up to use it in 
> common code and there will be no signal to the user that the function 
> will not properly indicate a RAM page on Arm.
> 
> I can think of two possible approaches:
> 
> 1/ Implement properly page_is_ram_type(). We don't have an e820, but we 
> could mimick it using the memory banks we stored.
> 2/ Rename page_is_ram_type() to page_offlinable() (or similar) so it is 
> clear that the common use is for offlining.
> 
> The latter might be the simplest.

I consider page_offlinable() potentially ambiguous: When you offline a PCI
device, you offline its MMIO as well, for example. Or, much like RAM, some
page in, say, a video device's framebuffer may have gone bad. One might
think that such would then also be covered by that function. So minimally
page_offlinable_ram() or page_is_offlinable_ram(), I think. That would
then have the benefit of allowing an avenue towards x86 also making its
checking more precise, as certain RAM ranges can't possibly be offlined.
If that's fine with you, I can enlarge the patch accordingly.

Jan

