Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4120AEAE99
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 07:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027260.1401965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV26m-0001cT-Av; Fri, 27 Jun 2025 05:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027260.1401965; Fri, 27 Jun 2025 05:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV26m-0001ZY-7K; Fri, 27 Jun 2025 05:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1027260;
 Fri, 27 Jun 2025 05:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uV26j-0001ZS-Te
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 05:58:42 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65d575b-531b-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 07:58:40 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1333852f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 22:58:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c14e224csm1405952a91.32.2025.06.26.22.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 22:58:39 -0700 (PDT)
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
X-Inumbo-ID: c65d575b-531b-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751003920; x=1751608720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dSYAZdOVW1BBaNzT6nIbWfeeFJmvvWuz+ZuN8s51rwU=;
        b=P9pDltNoPnaPvtVsDae9lr8YW90wmS55gDYDD5/xYaVCnwB0IndSjh6P6K8x3dLkHC
         ufTOUDZ4SHyJfpu1qkL0mGr+Ijifq+THlFH5VX/8/dWRtgAPL713tjh7oS+KSuqwH6IY
         k/kVMV/p2KnGmdZENuzQE8xfh0LLFoET9f7C5NhbfwuZWf1UIG2AkzY9+NXTd/Q4VMir
         EMTFqFhbi+fh9U1hzgyWpUsZf5+bSDbOtIHsqsNtM0GPBJh+WvuPoBnMoJm7L6lty1Xz
         JDxz0qsva2jx+bIaxs1YHJNLXSPCRt4bMBf1rE4SNR8Ppvo4eGYsjYb+GZCQmEPjll0R
         QQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751003920; x=1751608720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSYAZdOVW1BBaNzT6nIbWfeeFJmvvWuz+ZuN8s51rwU=;
        b=TH6ILuQB0EGBjI+Xp9K68jqDo7hImnC3+bNvFHw+4MsBGXd0jn0E5Zq0VIVhdi3tqn
         YJDjB7y4t6T9IxX3uZE0pwmAaLjvVOJIZOY70+4gYPkr7Yuf5EJ3PEvEene3H5FXEg9i
         7xQEyboNWt3HuHPYO1Fp5GZkcFQeUWgg8K1G/mBdVFjEH7wGbC0iR5G7EyoNSUeGRxmS
         9CC4m3kq5pxENzsYLD2dAliUGGrffihpPyHNOfAJXb9SayAVPeBvywcPr5eZcrx0P+m8
         PYBEmR09hmMc2IE4V70c8ehM5DxPNQk9tIpk5mBHjOpDZkqyddpfr9zeSLKeZClk1x4Q
         BbTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFse1NG+/+iKFAdKv532FL+07h+Jpzdnz60m5+Qc1NfUIwwDSpSVdISggZOyzd69D2Ln1JnCPzbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXDoMAy1QiNrKVKZpfPB85QhHeye/mRAUDtb3ZfN5GHyT5VKGD
	HDU5GT3UNeRzHcXh941dfOSWrP3eW069WEqPgr1Xy2F80M8hB2sZWQETED6EVlJHTA==
X-Gm-Gg: ASbGncuthRUu05Wg+ifSrtbrI0lusGMwuLrCO0rmA3j4r067N/a7yMZ720EnFuuUY6f
	pfX0q89kzd5rKocyWIS8p420zxanrhlfBIdEKHrYGuj+U1ZoXcrGbE2AFz8nGSkP9QgoxBrlXEE
	P687i15EwUNWr73g68cBOrm++0rB2o862Dl1ZcYE89kK4wKbOQV3weIEfJ+t1U/SecDq+J+NwiL
	Owr0ICdxiMe5aHCcJJIWX3zEbJ57I2lXeptwzz/jJUNfi2QJC6/wyXuA5sOwKB04RIPlgFc+aJ2
	jvZZZgnfLL9UoekkaNmr56TSLJr5ac8zzqUhqid5qIoRe2bxAcNBCVAw5ryL9C9wIozokdAatcB
	dQ8l39i1dxd6rNb0DwWtwnoaXTtdPkCRSm9Ssstn88qR5fVc=
X-Google-Smtp-Source: AGHT+IGNHGBtCU9405shdxz716hxGs/iugmok9cODuxcnRHBb3ZDWfXXcljQME0Ig9YLncdQZoRXAg==
X-Received: by 2002:adf:ea49:0:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a9000ac6b6mr1393572f8f.55.1751003920070;
        Thu, 26 Jun 2025 22:58:40 -0700 (PDT)
Message-ID: <0be4bc45-5634-422c-8820-bf4e9a903868@suse.com>
Date: Fri, 27 Jun 2025 07:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hardware domain and control domain separation
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, ayankuma@amd.com,
 xen-devel@lists.xenproject.org, demiobenour@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2506181757282.1780597@ubuntu-linux-20-04-desktop>
 <942a6178-0fe7-468e-8e45-ea255fd20680@suse.com>
 <bc36d2c0-3b25-4735-92c7-6a37c47978aa@gmail.com>
 <alpine.DEB.2.22.394.2506231448430.862517@ubuntu-linux-20-04-desktop>
 <381dba84-3108-42c8-a4e5-7bc74d5e1075@suse.com>
 <2e27e128-398a-4714-b019-eab04520cc97@amd.com>
 <48def2b5-44ad-45fa-b052-67520c0961f0@suse.com>
 <96104098-0369-4607-b378-60b80bb0f560@amd.com>
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
In-Reply-To: <96104098-0369-4607-b378-60b80bb0f560@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 23:18, Jason Andryuk wrote:
> On 2025-06-25 01:32, Jan Beulich wrote:
>> On 24.06.2025 22:14, Jason Andryuk wrote:
>>> On 2025-06-24 01:25, Jan Beulich wrote:
>>>> On 24.06.2025 00:51, Stefano Stabellini wrote:
>>>>> On Mon, 23 Jun 2025, Demi Marie Obenour wrote:
>>>>>> On 6/23/25 11:44, Jan Beulich wrote:
>>>>>>> On 21.06.2025 02:41, Stefano Stabellini wrote:
>>>>>>> Also a more fundamental question I was wondering about: If Control had
>>>>>>> full privilege, nothing else in the system ought to be able to interfere
>>>>>>> with it. Yet then how does that domain communicate with the outside
>>>>>>> world? It can't have PV or Virtio drivers after all. And even if its
>>>>>>> sole communication channel was a UART, Hardware would likely be able to
>>>>>>> interfere.
>>>>>
>>>>> There are well-established methods for implementing domain-to-domain
>>>>> communication that are free from interference, such as using carefully
>>>>> defined rings on static shared memory. I believe one of these techniques
>>>>> involves placing the indexes on separate pages and mapping them
>>>>> read-only from one of the two domains.
>>>>
>>>> How's that going to help with the backend refusing service, which I view
>>>> as one "method" of interference? Or else, what exactly does "interference"
>>>> mean in this context? (More generally, I think it is necessary to very
>>>> clearly define terminology used. Without such, words can easily mean
>>>> different things to different people.)
>>>
>>> Yes, there are different kids of interference.  We are concerned about a domain blocking another domain.  The main example is an ioreq blocking a vCPU.  The blocked domain is unable to recover on its own.
>>
>> On which insns an ioreq server may kick in can be well known. A kernel
>> can therefore, in principle, come with recovery code, just like it can ...
> 
> The case I am thinking of is QEMU providing a virtio device to a domain. 
>   The domain has to write to a MMIO area in a BAR to notify QEMU.  From 
> my understanding, that vCPU is blocked in Xen until QEMU responds to the 
> ioreq.  I don't see how any recovery code is possible, but I may be 
> missing something.

Hmm, yes, no idea now what I was thinking when I wrote the earlier reply.

Jan

