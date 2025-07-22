Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C31B0D144
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 07:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051954.1420425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5d5-0004ZC-Iy; Tue, 22 Jul 2025 05:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051954.1420425; Tue, 22 Jul 2025 05:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5d5-0004Xa-Fw; Tue, 22 Jul 2025 05:33:31 +0000
Received: by outflank-mailman (input) for mailman id 1051954;
 Tue, 22 Jul 2025 05:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue5d4-0004XU-DC
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 05:33:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 634b02b8-66bd-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 07:33:25 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so35509765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 22:33:25 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f239:d89b:91e0:de29:9808?
 (p200300cab711f239d89b91e0de299808.dip0.t-ipconnect.de.
 [2003:ca:b711:f239:d89b:91e0:de29:9808])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e88474fsm183235865e9.22.2025.07.21.22.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 22:33:24 -0700 (PDT)
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
X-Inumbo-ID: 634b02b8-66bd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753162404; x=1753767204; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NAhSgc3PBoOf0mCsSEOCcqYR09fTiZjuaaSD2iy2s2c=;
        b=Gci9lj/Vf1uFPir+fEvipO9iny3Gn/a+GBXBK1LJjMXSBFHy9xTwnLhhgSt7qG1ARk
         YMAlFP6ZTRi0R0BGVoaKUYJc2k9cZLo7ekoYxhz+x4yqtscAWxyy8oD5Yh336IjCs9nd
         IMzRHAES/QgUz+k58nAgEkD4CE1Dyec2RyFa+WzOTK5jyJ+ShJL48YD+zrm49DxAtQQz
         LOKKij1gqJeTVwsfiWixuB3IFqzd7Z1oeZuOdleuUAHYtwSpB6FnE6JFk9qs8sCJ/pR1
         KhR+EENtXcB/U+oQCR0aDpv3YXUi5WR7C9qRgw5Wbat6lxPwKKkI06+gdaU43oLcgM/N
         WLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753162404; x=1753767204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAhSgc3PBoOf0mCsSEOCcqYR09fTiZjuaaSD2iy2s2c=;
        b=MEJfXiBwp6zt+UhFNpHpOVajNq82i7vjgDrQDc7TVSaR1YdYVWr1OL4h1pC8teaOQz
         ca3dTcvXPAn4bqO2AdNd6GVi6KoVBzPXg5mE+tdTsz5L/m3KZBKy3rGg0Necx3EkWN4t
         F3n9UFlKobqBN9kAozNbeD2JUW21m425XkR6BJXEvIx5Ip9CvmKMGOAmCwhycLVmv7pi
         9rZKV8o9Mi3hnhZLt1+QsymPbtiWY8Ww7sE86aW8vFvVJpQl/7FSfPFNtmeaY8sYi/Nx
         u2GH1PfTqrZL4CY8ctc5f4t4GSWVzwXdFgLyI7QC52brXGVxoZrTSiGe0rjGZoOJCFwr
         cdPg==
X-Forwarded-Encrypted: i=1; AJvYcCU2AFOCWQM6Vdp/AwD3H2qr6PDSU/BYaqJXR0aL+VjQdNdZ9VxdFNY4UVp0bGT+esfCCxUNJvrUZok=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgf9VQwGedMiP2YOIfkoaAoxhZSN0wHrM1QlHauwWlTw65TKlB
	cCKL0gflX+MwN7c+sWa6m/fE+6KNXiixV7WP1iBaE96o7m5OXVoTTJTNsk2cKcadGw==
X-Gm-Gg: ASbGncu8J/biLuVYskeTCwm16zdLA+/DzjnI3SAyUAtFbNXanTpkDuE5k+ozwwpuc3L
	GbwBW9KiH4oHYGi76gxMa2I2JKXGLfEJ0TGieZIzZoV2Q3k768hW8H6bvVj79bhdo0IP3GvOjmN
	B9If7mbxCDwBGaKDmcLOfwyS5jAkD5P2xkzjdJ0t/5kKX6SbOdhNczEnD1/d7m2Jc/xpSfkgE8c
	4/yoQo68UK6auODhLRe5rLoPOYNI/AafXOsxuSJ+rOWICk7evAHC3rqXanUYZHZIcK6XCbtsY05
	ylaqE6v/bGKFMt2OzKtkoM+nGGTLr9RHlzoC2k1EBD59l4Nzwth2V4CUn4w3qaUdKBOu/wdJ40o
	wn/sdzSemPjUrtGk2IWRfdiCX8OpUg2MZXjwzo8G8Y93soBK6AmNv5uC1FZ1ix2VqqaEyX/3/KN
	xd9Js1a2SfJgDzWiGoblp2rmq3s992GBK10WwAtkrxrXPpYJjuQzD0J9FHQwwb9UTdsT8=
X-Google-Smtp-Source: AGHT+IGPaWRw9sAnHv61cTegVsAZdIuWFDYR6htJqbrgcf/cE3zu8C2PzlXnVgneup1sS67/yWkI4A==
X-Received: by 2002:a05:6000:1a85:b0:3b5:e6f3:ac9b with SMTP id ffacd0b85a97d-3b60e4c47fdmr19219274f8f.5.1753162404475;
        Mon, 21 Jul 2025 22:33:24 -0700 (PDT)
Message-ID: <a9443bf4-78ec-4731-8e05-dedd65547ed0@suse.com>
Date: Tue, 22 Jul 2025 07:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
 <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
 <DM4PR12MB8451571C1DEBBA2F5FA66A87E15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451571C1DEBBA2F5FA66A87E15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2025 07:05, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, July 17, 2025 4:55 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Stabellini, Stefano
>> <stefano.stabellini@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger
>> Pau Monné <roger.pau@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>; Julien
>> Grall <julien@xen.org>; Sergiy Kibrik <Sergiy_Kibrik@epam.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
>>
>> On 11.07.2025 06:31, Penny Zheng wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -49,6 +49,7 @@ obj-y += spinlock.o
>>>  obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o  obj-y +=
>>> stop_machine.o  obj-y += symbols.o
>>> +obj-$(CONFIG_SYSCTL) += sysctl.o
>>>  obj-y += tasklet.o
>>>  obj-y += time.o
>>>  obj-y += timer.o
>>> @@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o
>>> memory.o multicall.o xlat.o  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>>> obj-y += domctl.o
>>>  obj-$(CONFIG_VM_EVENT) += monitor.o
>>> -obj-y += sysctl.o
>>>  endif
>>>
>>>  extra-y := symbols-dummy.o
>>
>> CI demonstrates that this combination of changes is wrong. The job that failed
>> (debian-12-x86_64-gcc-ibt) is a randconfig one, and ended up picking both
>> SYSCTL=y and PV_SHIM_EXCLUSIVE=y. Which results in sysctl.c being built,
>> but domctl.c not being built. Which leaves getdomaininfo() undefined, causing
>> linking to fail. In case the next pipeline also ends up failing, I'll simply revert that
>> change. In case it succeeds, not reverting may be an option, as long as a proper fix
>> shows up pretty quickly.
> 
> I've push commit of " xen: move getdomaininfo() to domain.c " to try to fix the error.

And you're reasonably certain that's the only issue? I ask because it is the
nature of randconfig to pick random combinations of settings; on a later
pipeline I had seen a different failure. I didn't look at that in detail (it
may have had to do with the domctl lock or something vaguely similar),
which perhaps was a mistake.

Jan

