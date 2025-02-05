Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D356A286EC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882037.1292206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfc0n-0006bH-Bc; Wed, 05 Feb 2025 09:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882037.1292206; Wed, 05 Feb 2025 09:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfc0n-0006ZW-8v; Wed, 05 Feb 2025 09:48:01 +0000
Received: by outflank-mailman (input) for mailman id 882037;
 Wed, 05 Feb 2025 09:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfc0m-0006ZQ-GD
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:48:00 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4803b4d5-e3a6-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:47:58 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso1322645a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 01:47:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dce0a3f2d5sm461608a12.30.2025.02.05.01.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:47:57 -0800 (PST)
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
X-Inumbo-ID: 4803b4d5-e3a6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738748878; x=1739353678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L7+kBy1J7ldgImOVmYM6rBwvgjzh/E61spzVjQqHmoY=;
        b=HpBJl87dOgrZs/K91cYYcBycGzCScd7yTrWmqkvjotyB1n8AP+mBM6hr7hbPBfhNxg
         TA2su5LW2jo6PlhxHNfUR0UNjFoaZ9XDYRAQEkaM96qV7pYdsnt9HCGnNUTh8qb1Pu/w
         +BZWe0OldLxv0M0hU1qqZHXZ+10jIFA48DxlveJ1HNh/mL/g3hHS4XZXG1R2ssrb65HN
         4LEUe7UVIpeHIVXLd3fl5Ai4c7Va5v6EFuG6ka1UuHZ7d3zvhct933UZfhMMWMikLFHZ
         2aATVSAcuzZhG2YlTdjm/EQti2p1CszjKccK3bf+AxTWfDCZouFH/+6wQWxgxJvJyOzM
         d8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748878; x=1739353678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7+kBy1J7ldgImOVmYM6rBwvgjzh/E61spzVjQqHmoY=;
        b=qC6InBhyR8jAqMOwQaRBrA3G5x8G/Xoi/Qx+Ro1TkPIcrwMB1AQQ1v3MHg+HsZcQ0P
         +TTpBkSOUgiUBfqiFDJY1kqDVUI3zT7SBLLluH9haVvxf8KnaUeWtVoEdoDVXopTYiv7
         Wl3cQRiKnEUEJ/3zcqlkCZSjYx/k2IOyJQCDG+kZeznXwQNGft4qYvi8fsA2q4tP771o
         cgxo0QvZo6/EeQLK7ks/bBs+ZH0bLNiVpqhGITVFu/2rZ0AZ8GAlZ0l3xE/K/DCDCPyy
         nTGE0bbL+zohfUbAMdBgXFZs2nBUnPOTrjKMjfbE+9cST65Pw3rjA80cwLUlaXaG3CGA
         Fg5g==
X-Gm-Message-State: AOJu0YyGSumxqKl7N7WQ2IzC6j4dkoCfeVJLG//FE967wPdPpoSxlMJu
	nuI5huNu9RMVoYHrepcr7XdhLURQ71t0mknoeMbUVSH7sTlAGSTaUn0sZGJGRg==
X-Gm-Gg: ASbGncuf18ebYCY2JIvhqljvXJFpQNdGIdqYAAc3Oni/45B8lINd/W7e5VKGMjxvxXC
	QjL8prDR177gVWJy3e7+xkQKjiCEumrkv2cq+av+3A6Bv+HYMXT6HJpTHqs53V9Lm4xBg1t5eO8
	DAPt3FCmjHc5Gg8nrHkEFgjMOT0z5gOBSsiB3Tpx9tgI//WAPXZjvP1JO4zkHRvV0O49H21VUhC
	nDC9vzywCNsJq+yiYAj845oCPU2ZKP+s7aqFRpAu6S8j05RMe2w271oc9wFyrFxTuuVcGQp0pmN
	vy8YeuE2VgcNaMOWIAP2E+MFvZOlLHmQwr3mSuWjEg7pfKKXFi4jRa5q+oCyXqSy5VABeiBH69v
	z
X-Google-Smtp-Source: AGHT+IEumbSbiVMefaa4V/IC8O3G02qlCPD36fQxYiyo4CEQLPpouWwSdvO9dyPZ/BwaUaZyuExkeA==
X-Received: by 2002:a05:6402:26d3:b0:5d9:3118:d0b8 with SMTP id 4fb4d7f45d1cf-5dcdc01b8demr1953138a12.8.1738748877996;
        Wed, 05 Feb 2025 01:47:57 -0800 (PST)
Message-ID: <e17d6462-1324-47da-b8bc-433f5476fbf6@suse.com>
Date: Wed, 5 Feb 2025 10:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic due to xstate mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Guillaume <thouveng@gmail.com>
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
 <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com>
 <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
 <087acd38-868d-4e1b-ab0f-9dbdb0ceb8a8@citrix.com>
 <CACt9=Qh0nXr35wx-ce8BC-xHcQjAa5nUdPvsm2K12RusT-wzXg@mail.gmail.com>
 <79fe5f32-c345-41ee-af29-cbe3c45585e8@citrix.com>
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
In-Reply-To: <79fe5f32-c345-41ee-af29-cbe3c45585e8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 18:35, Andrew Cooper wrote:
> On 03/02/2025 8:58 am, Guillaume wrote:
>> Oh cool, thanks a lot for the explanation.
>> I added the "vzeroupper" and Xen crashes so it looks like the CPUID
>> emulation is buggy. Also I was able to try it using a VM (same debian
>> testing) running on virt-manager+kvm and it works fine (Xen in debug
>> mode). I will have a look by printing the xstate when running on
>> virt-manager+KVM and I will also run the xen-cpuid command to see the
>> difference just by curiosity as with your test we already spotted the
>> issue.
>> Thanks again for your enlightenment. I will continue my testing later
>> today and if you need me to test something else you are welcome, just
>> ask I will do my best.
> 
> It sounds like KVM has a better CPUID emulation than VirtualBox.
> 
> It would be ideal to report this bug with VirtualBox.
> 
> But, as you identified originally, it's not nice that Xen simply like
> this. We should see about what to for Xen, seeing as we're close to the
> line on 4.20.  I'm thinking maybe making the xstate checks non-fatal in
> the cpu_has_hypervisor case.  Thoughts?

In principle: Yes, that's an option. But then we need to suppress use of
xstate_{,un}compressed_size() anywhere, perhaps by disabling respective
features. Not sure whether that is what you meant to imply.

Jan

