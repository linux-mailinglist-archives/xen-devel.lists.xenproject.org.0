Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36152B0A5F7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048828.1419017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucls0-0003ZS-7V; Fri, 18 Jul 2025 14:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048828.1419017; Fri, 18 Jul 2025 14:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucls0-0003Xv-4s; Fri, 18 Jul 2025 14:15:28 +0000
Received: by outflank-mailman (input) for mailman id 1048828;
 Fri, 18 Jul 2025 14:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uclrz-0003Xo-5p
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:15:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a63c0a7f-63e1-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 16:15:25 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so16009625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:15:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6eef80sm13885265ad.181.2025.07.18.07.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:15:24 -0700 (PDT)
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
X-Inumbo-ID: a63c0a7f-63e1-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752848125; x=1753452925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRO1C+IWuWT8GYI8fFnnU3p1NoHCZHKJOokAhr/ZxBM=;
        b=etCCAxCDAflXlf9MNplc07uHEZ4roRt6fQifSEKPcdgHqdoAiY6qGPUI+qbDM+cYUp
         NIdyUT8q8FrIPmNCwC4bHBZ21E3dBaRYpu0joU0AUl5osAdTrU1ybNW3eRvwjCfr76Gq
         zdxhO8dkGAmGoeZ5JSPTRTHvbWFFYyt/f50eNZmbSyh36BDInesAHO+96SPzwt30732N
         Hyw5Uv4bnN86vl/qeE4jmQdGN8xcV98DjMrMHmgHsVSPvZYooTgpC0FnqwgiNCv5gGj/
         lxIDI6vNms8O+DuXnmh+FN5t3/ShRdY/CvcjWNJWkT83IRsHkKLOJ7x/vnqJcVRmxGqv
         Hm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848125; x=1753452925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRO1C+IWuWT8GYI8fFnnU3p1NoHCZHKJOokAhr/ZxBM=;
        b=kTxaIFOIhJuMLtG8dCnu+7/UsYtPjKTuJm+p+lujNDalcs2NMWxhTnW4D6o2mqoIeL
         NNNOgz8GbB3T+qokYBxc/23iOMVrBExMD9Tl20tL+xWskYXg99kX6Cd4S/5cxYBQl9vQ
         nPEdyASiZCHW0X5bCKfMHDGRAeoy02Nn+MgnB7ISiBGtZ6Gjeei74Q5BBc42BhEkm3Ju
         RNaUmUsOIuOYVNw3k77K00Rh1PeCwJVd3kQLJpga/xPYENgNqaciY6W2Hqj/3WPQhlrR
         kTPDIE/BFzDWb9aFzTt+Kq0K5D00SCvUR9fz7Kl6BzTCL1Lbh+seJJneFRXGBM5vdEf7
         qmlA==
X-Forwarded-Encrypted: i=1; AJvYcCX55LekOQ/7r1zDPWKMOy2koYicy4XOSJjwlGXOKxBUwe5pB99AT5z4apc0fYzbAL41B4wsVmCP5As=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNhHKg8oWBI+HfoPBmHoveu/Ze11zHYxo1GbhnFa0/Ndo2Bu+g
	vrfpiW0t4H8sVsE704Xl35sGoL5jSIMeHTKkgTBbwq2tSElOngpxyo+fTKQyhRCQlw==
X-Gm-Gg: ASbGncsWB+7hw2vYz3eLE6WDg+K+GBYFVVdTG7reXbMlEeggOtLBrqIxi8I+iNeRUaC
	RwhGhfRMjwhy4VUkukAolBrz7ddB7eERuCrIncJeQ8GyXc5VdWFTmwLWKTvfvupVUi2+vHDXQSH
	uVHtMT+MkpUQH4UZoarIo6dKaWya6x0i9cOwdS/6ylpaQNcGyFF+DJjYPZOo8o3vEDM31gXpQpy
	n3bgY3rLMkQ5F3LrFV3xrJ8T4gkaqZfp8XrrDu7pA710PKBUKxw4w8KsHmnnrjDnYNScEH5Elol
	fBl80/r95j/7E/soOQh8pbLnQYzFg6knyBvPe0nn6gfG+sbENwttixjhcQ5hUwI9df9XJs26rTD
	RjXIvUcy/nXtL1hlpU0CV5xWdyPXp5Pyyor0vBAbLZCP5BBKE7Qei1Upx6X0iCMuW5SP1kcMdZg
	3E3H1ezpw=
X-Google-Smtp-Source: AGHT+IFk/D+uhlcUL8rX9hvKBiWQYQgEDvZTdKbgN2A6Di63V173EGjvnjVoUXDim6oFgUZvugOvrA==
X-Received: by 2002:adf:9dc3:0:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3b60e5127e4mr7737035f8f.32.1752848125180;
        Fri, 18 Jul 2025 07:15:25 -0700 (PDT)
Message-ID: <e7dda6db-b09a-4b0b-9366-ee847ad5acba@suse.com>
Date: Fri, 18 Jul 2025 16:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table
 to X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <20250718100739.2369750-1-andrew.cooper3@citrix.com>
 <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
 <9c820057-3e36-45dc-b71a-95c9d2dc4398@citrix.com>
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
In-Reply-To: <9c820057-3e36-45dc-b71a-95c9d2dc4398@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.07.2025 12:23, Andrew Cooper wrote:
> On 18/07/2025 11:19 am, Jan Beulich wrote:
>> On 18.07.2025 12:07, Andrew Cooper wrote:
>>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>>> helper to match a specific stepping, and use it to rework deadline_match[].
>>>
>>> Notably this removes the overloading of driver_data possibly being a function
>>> pointer, and removes the latent bug where the target functions are missing
>>> ENDBR instructions owing to the lack of the cf_check attribute.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>>> -static const struct x86_cpu_id __initconstrel deadline_match[] = {
>> Seeing this transformation ...
>>
>>>  static void __init check_deadline_errata(void)
>>>  {
>>> +    static const struct x86_cpu_id __initconst deadline_match[] = {
>> ... of the section placement, we may want to investigate whether with the
>> toolchain baseline bump we can actually do away with __initconstrel, using
>> __initconst uniformly everywhere.
> 
> To be honest, I'm not even sure why we needed the split in the first
> place.  We merge both sections together, so it isn't about section
> attributes.

It is about section attributes, but at assembly time. Even an up-to-date
gas will choke on certain conflicting section attributes, when multiple
section "declarations" are present. (Oddly enough I did fiddle with that
code earlier in the day, hence why I have a fresh impression of this
error appearing in practice.)

When you have only constant data (no relocations), the compiler ought to
request an "a" section, whereas when there are relocations it would
request an "aw" one (along the lines of why there is .data.rel.ro). Some
gcc versions and/or some gas versions conflicted in how custom
(__attribute__((section(...)))) sections would have their attributes
specified, causing assembly to fail.

> But, if you think it's safe to remove, it will definitely be a good
> amplification.

As to "think" - I'm not sure, but my recollection is that the issue was
with some gcc 4.x only (or binutils from that time frame).

Jan

