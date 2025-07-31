Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55157B16C04
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 08:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064831.1430160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMhb-0002QW-1p; Thu, 31 Jul 2025 06:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064831.1430160; Thu, 31 Jul 2025 06:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMha-0002Ok-Rn; Thu, 31 Jul 2025 06:23:42 +0000
Received: by outflank-mailman (input) for mailman id 1064831;
 Thu, 31 Jul 2025 06:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhMhZ-0002Oe-IP
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 06:23:41 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id def0a2f7-6dd6-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 08:23:28 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso286517f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 23:23:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfe8f90sm668924b3a.127.2025.07.30.23.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 23:23:26 -0700 (PDT)
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
X-Inumbo-ID: def0a2f7-6dd6-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753943007; x=1754547807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6nhZm1gZQG2jqY0Jkj6o629kfjca5iHJebqX5PuY6qo=;
        b=XJ59nUfqPrJD00XdRD6JN1gKgx6W/mMdZ2gVA0SZ5THIXUqtZIvpSmSYnleRYdTCHz
         fp6ZZnhbsutFazCVHrg5LnUwpQkImNtzn4FY+Qf3wR+ZjO3gOGZ9kloikGGH2MmIp2Fl
         INrqA4RMag58gTwHKCto5Z6+64TSTSTX3pNkiPr9yh/vpMkMuLoqU5Sy9KHUXLerd305
         Duu2hsjRlfVS4H/ikkQnuwPlA0rSXI2ES62o3F8eFpgWS9jRzLcN0qsbLJOHk7utr2JK
         5oFL6p48Ho9I+XGpMYWq2EEzR+ft2upWw3mqKf2bm3T1D0S45+K5X9Qqbjry4AEgZPBT
         6IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753943007; x=1754547807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nhZm1gZQG2jqY0Jkj6o629kfjca5iHJebqX5PuY6qo=;
        b=qzqt8O1rkn0QTh5p8u4FbfkDvqInrs9YkvTFYvYLzw6cEDBVOuTTtLbAYwXSmRmbOA
         +qS2fy6CR1pQH9fZFW+Bbvkqli8oYiENZwtberxC6Qqe3+I/12jEic/4tOf8MLAdsrlw
         X91v9N/bTdDNuIz4EuAcS0qJeD1RxUANLm+H70L7MJCQiJgsXfo5gf41Fpt377McrfBO
         0v4qKfYKO4iDHKnl301yADUqcM3RMSOdoCdEnFWOoDERkqUHChgaK8jlPgfsrMa0b2u0
         pEnpiT89sRAXWqan1dzVLVzBkTs2ZOD32rKaAS/FKWcbunO58KqkGPUBpIGsVu3D/BOr
         aazQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIMB7gSrE9hURJhhCiibwqS/YjgOCCy+KYYg0GrT1THENmxcJXlGRJa4tEgdBZIUAybxgWioeiQ4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmYUlIY1Oj8rkSSMMARzQ2k3yuPSBGc0pV5p0HiTR1LRh05GX6
	QLmQw7XFoLCcsxicz1eDgZHDFRsq3YTuGlf3vADimAz5Jbl2r7ELFQhjez/4tZoQ6w==
X-Gm-Gg: ASbGncu8LFozoYwCeQBluFQZpdR/mu06xzHavceisogkv0LCqVPSUO1wYHGmL8I8fON
	Fle1YOScj4HDXy+SbYAgdmFX2rsadHdSWliFX3hmKROBqbDo5I9xHxo3O3Vv2+78ry4EpzBt5KK
	+XpupQjQ7XxH958W6ESZnbO4lGKgUQt+ebt6xLxhW5Rn+i0eXAVbK9ehQX5bXb8ezb18VsbdHyN
	5LVNbSjA4mylu8wZm37JZ9X9zekIj6Ne1joowo0I91mTDcb5yyNH0fWmCaVj6UjICACIt/iJ49h
	UzN/nRViXWSIgrJaHZ6gu/Cxe+0QUXVfsRGRI4oazLGqsq0QmkX2kLJEuLLznNBB+FJvItk7X7T
	+vO3Ax1kSUxvpg4J9Hco9W+UoowIMeuE28zJSEaGc8yoMhdmNupUioqsctd/38BDe1u5An5MIvS
	c6Kw+4Gxc=
X-Google-Smtp-Source: AGHT+IHPQOH8PjH0nJWv8+EZnnulMTkUUiJcS3e9Z6cS2/XxbyXNsEGBDUNHlv+m0M31hlBsJ9O0mw==
X-Received: by 2002:a05:6000:26ca:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3b794fb200amr5290252f8f.1.1753943007290;
        Wed, 30 Jul 2025 23:23:27 -0700 (PDT)
Message-ID: <528f4bd1-4a2f-4fa1-94cc-363a5f5fdbea@suse.com>
Date: Thu, 31 Jul 2025 08:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
To: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250725212235.753363-1-dmukhin@ford.com>
 <290ae958-4fba-42d8-a64b-d44845b85491@xen.org>
 <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com> <aIlIm7F5L3WQLoWd@kraken>
 <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com> <aIpfH5Cy10o8VMCu@kraken>
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
In-Reply-To: <aIpfH5Cy10o8VMCu@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 20:06, dmkhn@proton.me wrote:
> On Wed, Jul 30, 2025 at 07:35:04AM +0200, Jan Beulich wrote:
>> On 30.07.2025 00:18, dmkhn@proton.me wrote:
>>> On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
>>>> On 26.07.2025 11:20, Julien Grall wrote:
>>>>> On 25/07/2025 22:24, dmkhn@proton.me wrote:
>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>
>>>>>> __printk_ratelimit() is never used outside of the console driver.
>>>>>> Remove it from the lib.h and merge with the public printk_ratelimit().
>>>>>
>>>>> Is this solving any sort of violation? Asking because even if the
>>>>> function is only used by one caller, I could see a benefit to be able to
>>>>> use different value for the ratelimit. So I leaning towards keep the
>>>>> code as-is.
>>>>
>>>> +1
>>>>
>>>> In fact I'm surprised (or maybe not) that we still don't make better use
>>>> the rate limiting functionality.
>>>
>>> Out of curiosity, do you have any ideas re: make better use of the rate
>>> limiting functionality?
>>
>> No concrete ones; thinking about this has been way too long ago.
>>
>>> Build-time parameterization?
>>
>> That and/or command line controls.
> 
> Got it.
> 
> Can you please explain why exporting __printk_ratelimit() is still required
> for implementation of build/command line settings in console.c?

I didn't say console.c, did I? Whatever subsystem wanted to do proper rate
limiting would need to gain some way of controlling this (as said, build
time or cmdline driven), and it'll then need that function: How would it
effect the behavior with custom ms and/or burst values, without having
that function to call? (It is another thing that the function, using static
variables rather than per-caller state, may not be quite ready for that
kind of use. Also the arbitrary and hard-coded 10 * 5 * 1000 there would
probably also want to be customizable.)

What you may want to do for Misra's sake is make the function static for
the time being. The compiler will then fold it into its sole caller,
until some new user appears. (At that occasion dropping one of the
underscores may also be reasonable.)

Jan

