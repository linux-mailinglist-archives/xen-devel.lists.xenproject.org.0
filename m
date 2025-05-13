Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF928AB5691
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982889.1369241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEq61-0006VE-Eb; Tue, 13 May 2025 13:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982889.1369241; Tue, 13 May 2025 13:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEq61-0006Tc-Bm; Tue, 13 May 2025 13:55:01 +0000
Received: by outflank-mailman (input) for mailman id 982889;
 Tue, 13 May 2025 13:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEq60-0006TW-2i
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:55:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4151b9-3001-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 15:54:58 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad241baf856so556828466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:54:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad236cb21a2sm602973566b.159.2025.05.13.06.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 06:54:57 -0700 (PDT)
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
X-Inumbo-ID: db4151b9-3001-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747144497; x=1747749297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oyxsQtOlJqzbvOYH9xERmP88RL3iOliw5gVY/G40uZQ=;
        b=T9dzBX4TnOKQz7l2uBqpMhE5vyOTbX9srcPzlV5EyXbH80jQb0VaSc00b5CHSauL+P
         s45v4+BbUHWTM1a+T0nMIq4ric/yySg9Oasxt6IpQ+NA+Rh8Ng65aGZsqXmmSw16z821
         tUsc5W33d3R2ivpCdQwsOBozaIFpviP791fLXT7juEJ8o7HtcazQLcqm0EROFzAA0g4c
         zVtYFK6JJli6Co0yl3N1kw/YellIkNLiOKwjVlSXvMoXgHX1Z9hMhVyQXgtqSLvTAsj5
         0S8NLfHUA2vqjy7oO5QgDVZuIm4gW7fvwjj5PV+Hxkgzf0EH7yNgrhOvHTqqN7e8tlr2
         VELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144497; x=1747749297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyxsQtOlJqzbvOYH9xERmP88RL3iOliw5gVY/G40uZQ=;
        b=cq9jUTpxWT8KafSU9Y1xbQykGujRcEKU9S6jjXA2JQTvHZ9HLIKRDJ56RGrFGSD7m5
         yLMNSVATzm0MGegXXkT5+o4XlkBKVbt32YNhLUcQifkE/5kLv69uMr5XjDJ0/oUjmyk8
         5k0eVFdghtxYpLt1Az+my56DIyd1ab5sa49U4xkR3DIW9HHMj+TWPXPe0nLpBUSJoFfk
         n2CtGLplLfxJAGVPv5u4b5riFxlFcFa31IBthnzKXt8x2RHvQBdAoSBvi+Hv45rCsXQ8
         Q9GVuXO+3Kto/7ppA/iYSICg9lwwmE7P+oTxg8SFmMXziqh7E9pMGzSnpb2PiwJxLFO9
         9U+w==
X-Gm-Message-State: AOJu0Yzy9zAWQU8Sn2m922nJpzbht3VsbiqIM/ObyTgXZcVkAEo9WFh/
	hdtwTYUMny+mgMtjNMpwCv3Q7aNyx1h8LmXLWXCZkQKdjCGyYm7bVhXefAUBbK29tRjpF1hQ/4s
	=
X-Gm-Gg: ASbGncsUx1Ia5c+wGak3nHd7O1Tu5Soi6DM39DJmov+tYGes015twIgAj6O2TiTFFS1
	RCNUU50iwvfvJLS8HarhS4wkTLWCGvMlYqmOPbqYR2mnw6ppxN5RDFD11e9Fp4qr+LzEympVvrT
	WoWTzuJStw/8zOQz7hak5RgfDWAZGDxb+dZkQ2PJTCR2B3ZoqOsZb66YayVeg7pmOBETYD7GmLm
	x8bsbRhJ4eWg05gMoYREw/zLddQgtMhuz61315gyxDhnCvhHe9QBLFOp0tDpMDkMrwJEnH+w9GP
	F+Vsz91TplqaTs+3QI1vpTd/bBdrSFAHUbmGSPqAQwdcCJPzq7F+5kOqGo4VigOof5SnUxeSlO7
	JEExZEwZ9c6NLt3BqW2QlI8TE/jPQlgeMhA19
X-Google-Smtp-Source: AGHT+IFpPEqfWY1daqN5ckJL0Xw3NFizx0fyh7PZ1P7CmrKG4vIrvBfpDg8e49ErG1/Q0pVy+uZV6g==
X-Received: by 2002:a17:906:6a22:b0:ad2:16ce:7c38 with SMTP id a640c23a62f3a-ad4d4e326camr351413166b.16.1747144497551;
        Tue, 13 May 2025 06:54:57 -0700 (PDT)
Message-ID: <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>
Date: Tue, 13 May 2025 15:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <aCNMEadsYoIKLbSp@macbook.lan>
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
In-Reply-To: <aCNMEadsYoIKLbSp@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 15:41, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 11:45:22AM +0200, Jan Beulich wrote:
>> We allow its use for writeback purposes only anyway, so let's also carry
>> these out that way on capable hardware.
> 
> "for writeback purposes only" > is such the case because we cannot
> guarantee the guest in which state the cache will be when resuming
> from a wbinvd operation, and hence won't be "clean"?

Not really, no (see below). This is inferred from us limiting flushing
operations to domains with physical hardware assigned plus the fact
that we avoid the overhead in vmx_do_resume() when the IOMMU is snoop-
capable. (Plus I did all this work over 2 years ago, and hence I now
don't recall what other commentary I may have come across saying
things along these lines.)

Which, thinking about it while writing this reply (and also taking
into consideration Andrew's earlier reply), may be all wrong.

> It's my understanding that the same is possible on native, as the CPU
> might speculatively pull lines into the cache.  So there's no reason
> for an OS to use wbinvd if wbnoinvd is available?

Speculatively pulling data into the cache is possible only when page
table entries permit caching. Hence after changing all mappings of a
certain page to UC, an OS may have a need to ensure that no data of
this page is left in any cache (and it can't be pulled back in
speculatively then).

IOW if the goal of the OS is write-back, then indeed it should prefer
WBNOINVD if available. Yet the same "replacement" isn't possible when
the goal is pruning of the cache(s).

Jan

