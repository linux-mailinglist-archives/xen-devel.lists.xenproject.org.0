Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DCAE46AF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022519.1398357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTi8e-0005T1-33; Mon, 23 Jun 2025 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022519.1398357; Mon, 23 Jun 2025 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTi8e-0005Pt-00; Mon, 23 Jun 2025 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1022519;
 Mon, 23 Jun 2025 14:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTi8c-0005Pn-2K
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:27:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 246c111a-503e-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 16:27:07 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so2371081f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 07:27:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a68b082sm8806349b3a.149.2025.06.23.07.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 07:27:06 -0700 (PDT)
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
X-Inumbo-ID: 246c111a-503e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750688827; x=1751293627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sasGtQsEsftue0w/QTUuMq1R1x2QMQPh3s4lYZtHf8A=;
        b=VaPxZtYG8PHoZXQ2HTLIPi0ReDWa8WeWB4cBvouCJQ+YAYYzY/8m7S/ByeeNYv5CMY
         baDNNRxbe8mMSfYh6J5+05cS/WIH7wS+mYgWMQgVBL9hh1OnPyLYFKqAJ6colUSDH1jN
         pvDhLTjR02ZDMreDMAu6flNUVhi9ySoTRvP3nviN3/Tkw+7FOOrhXongrKbVqjbSn20/
         YuqXfs6+IOX7wSs3pQdHL3vDe/eo99d9GefkF18C9fjAMbBbepFQsUWDzU5ySrr9usPY
         I52fu3UL3qod+xnK1kv64eDh5LAzP4/ejewW77HAL2FBog5CBK89+Mh+boO5xwRFYn56
         17pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688827; x=1751293627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sasGtQsEsftue0w/QTUuMq1R1x2QMQPh3s4lYZtHf8A=;
        b=roRSf9HMPkMG9On9BbaFqrfl+FSnze5UQ04skfLO1kmc7lJ16M8+j3du7c4rmXZuCW
         KZnhzPxmJN4AjvhVDiukl6Bjaw6fF7xx5FY7wp1RJgq3FeT23ByojjUVIxum9bLOZfcz
         xWO9Ax/Yhh/7LR6gxsB6mHS+Qpd++Tw3PfyMIHH7cUuU3cX2qu/u9DXPMkdQmwVUWKfl
         LVJPD2zrJlWbHhm5VhulOf7IAVj6uhC3FvkVh0Vuq2MsmJTWE8IWMdnBIoleBrmRMdWt
         yd7awGSfKmRbcm6II+IWBcfwgj6tEry1ugwItT5mZWszrQrh1TWDwxnLQU/BZLTjy+h6
         9epA==
X-Forwarded-Encrypted: i=1; AJvYcCUzMMWG87IvfYm5C+txZrMdZ5cMTmu23OXeqGCUSsyILPSHJ+NsByncg8OqXA4BOW4ysG471lnuDUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWdCUkqz1LWbfCgWKoLqgNjiWRM9J2ipE0Ir9U38dYyJrJPZr8
	cDSCctdrSmpgPw4NFBynRo9dnEx1bJMcrAChu2JOpUxDQGdJauZexGJOmvyz3SpeAA==
X-Gm-Gg: ASbGncsESYZQp/LdEscd2eq0CB6b0zzdkaysCv6KHVccd6y5YTwpTC66jPGEwmzIlOi
	6e/MF2LVPaJuIonwIn+4kBmqJCouXR0CmiGjVAL8bnvAZIxuEnnn4WT0g/M6qeJ87GsEJ3dKJZ4
	j8riDedd8oJgqpqbP/ENzOt3jqWtbXoTAaeA2gsHtxB/ko63Af9S16Q+D05di5D07ozGNXoSjqL
	Vk3pGjQzL2gd2xULjbhlUnzBXEZ4Vs7mcMhaOD6ksW4FcDHdblgCjyWNGopj+27cN2ZMA+JMaPV
	dETZJP0eM2GhDhBy3y6k7/eLgbNbYDE7ogBdlOYDFs8NsIQ0jNZhObz9zuYf3dXzyMoluFWfUpS
	KpELm/FVos0j3v400TyB5jZuHRQuwN87awfuUHIoKMnfYqhc=
X-Google-Smtp-Source: AGHT+IFvQw6f59hCuSlteSqwAQw3tKzbu14WChjSYyghVcMoK/U0vaetPa9QPrMpDH+rwLHHDPKs3Q==
X-Received: by 2002:a05:6000:2889:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a6d12e6912mr10768972f8f.54.1750688827146;
        Mon, 23 Jun 2025 07:27:07 -0700 (PDT)
Message-ID: <a751010b-070f-4d03-a5e2-ea58adf05214@suse.com>
Date: Mon, 23 Jun 2025 16:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-11-agarciav@amd.com>
 <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
 <DATXSLGR4W0C.I4IQ77V0K6FH@amd.com>
 <1fc40753-727e-408c-940e-07f3efe1ef48@suse.com>
 <DATZ8OYEKPTI.3OUBFHLNANFIW@amd.com>
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
In-Reply-To: <DATZ8OYEKPTI.3OUBFHLNANFIW@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 16:19, Alejandro Vallejo wrote:
> On Mon Jun 23, 2025 at 3:44 PM CEST, Jan Beulich wrote:
>> On 23.06.2025 15:11, Alejandro Vallejo wrote:
>>> On Mon Jun 23, 2025 at 9:39 AM CEST, Jan Beulich wrote:
>>>> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>>>>> Moving forward the idea is for there to be:
>>>>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>>>>   2. Full DT support: used for device discovery and HW setup.
>>>>>
>>>>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
>>>>> DOM0LESS_BOOT is left to describe (1).
>>>>
>>>> Considering hyperlaunch this feels wrong to me. Did you consider splitting
>>>> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVERY,
>>>> as I suggested on the committers call? You weren't there, but Stefano said
>>>> he was taking notes.
>>>
>>> Some might've been lost is transit, I admit. I don't remember hearing about
>>> a HAS_DEVICE_TREE_PARSE, but it might've very well been me being spotty when
>>> syncing with Stefano.
>>>
>>> Having a special HAS_DEVICE_TREE_PARSE doesn't seem very helpful, as every
>>> arch would have it set.
>>
>> Hmm, yes, we don't want or need that. But then what's option 1 about? That
>> shouldn't be "described" by DOM0LESS_BOOT.
> 
> It's about x86 using device_tree/ for hyperlaunch. x86 is the single user that
> doesn't need (2) at all. In the x86 case the same selector that picks  
> 
>>
>>> I'd definitely like for the "enable support to boot
>>> several predefined domains from DTB descriptions" to be a single option for both
>>> dom0less and hyperlaunch. And be selectable rather than unconditionally selected
>>> And ideally move towards a future in which both dom0less and hyperlaunch are one
>>> and the same.
>>>
>>> I can do an early rename s/HAS_DOM0LESS/HAS_PREDEFINED_DOMAINS and s/
>>> DOM0LESS_BOOT/BOOT_PREDEFINED_DOMAINS/ if that helps. I was waiting to do so
>>> until x86 gains the ability to boot off a DTB to avoid having help messages
>>> describing things not yet on the tree.
>>
>> I have to admit that it's not clear to me if that would help. As you say, on
>> x86 that's not a thing just yet. What I think we need to aim for is to not
>> leave the tree in a state that's more confusing than anything else. Even if
>> later (which may be much later) things would get tidied again.
> 
> Ok, how about turning it on its head? Seems like we're in agreement with
> HAS_DEVICE_TREE_DISCOVERY for Full DT support. There could be a DEVICE_TREE_PARSE
> (no HAS_) that's selected by HAS_DEVICE_TREE_DISCOVERY and DOM0LESS_BOOT. This
> allows x86 to deselect it by not picking DOM0LESS_BOOT.
> 
> Note that x86 cannot select DOM0LESS_BOOT yet, but that's how it'd compile-in
> hyperlaunch. In the meantime, the tree depends on DEVICE_TREE_PARSE instead and
> device_tree/ is gated by DEVICE_TREE_PARSE only.
> 
> Sounds better?

Yes. Except that in the last sentence of the previous paragraph: What's "the
tree"? And in device_tree/ wouldn't we end up with unreachable code on x86
this way (the parts that are needed only by DEVICE_TREE_DISCOVERY)?

Jan

