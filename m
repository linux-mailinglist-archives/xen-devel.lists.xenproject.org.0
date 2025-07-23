Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3217B0F652
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054329.1423095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueawm-0002VP-8p; Wed, 23 Jul 2025 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054329.1423095; Wed, 23 Jul 2025 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueawm-0002Sv-5z; Wed, 23 Jul 2025 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 1054329;
 Wed, 23 Jul 2025 14:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueawl-0002ST-8O
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:59:55 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b04e9736-67d5-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:59:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso6366866f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:59:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2ccbsm99432305ad.4.2025.07.23.07.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:59:52 -0700 (PDT)
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
X-Inumbo-ID: b04e9736-67d5-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753282793; x=1753887593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgkAJMnqpz3pWyS1Ni3K7/Li6JLd2JBA9UOsfmpI600=;
        b=U7+cnJ/RRdxrayUrC3M0Un8ZXZAtSctaXpMs+7nKhcBuvKMKhGE4dAwCTBcIBdQxzf
         dVbpNFwVo5L+DhXsOPl0eMK34jCUdOFECiV32/i82AI3Bu2YiOXmRAkmiU2NB7Ciuta+
         VVJnGyPRIJ1IPmE6kBF7hAhXdzMt4eDTZZkiCDZ1oD2VRxtBezvkBYcilcINDrnvI3FY
         LZZv4jTGIh89GIrU3pNqqczMLqo/J2XiORf9/fyf/JNqz+UiCzeB9WKv53AppOrbWIGB
         UZbGCSwFE4m2DfSfEJ+0y7TTq4dPiCavaJWOSOpoWnfn88rylBLVWGyfa3czaDf4l3aL
         gnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282793; x=1753887593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgkAJMnqpz3pWyS1Ni3K7/Li6JLd2JBA9UOsfmpI600=;
        b=eHWx8IbsySCRNLZsDipo7IwNEZGLU94C11BotQ/8JJH6aiUn/lZdFSOyhp0Lel7hmC
         MBkTX9XPvbPShMyh8HSFiFKnIdp43HxyKhXKNgUa68Sk1XHTrITkTmwwSwyKwrT+Ymj2
         HJa/Q9bG59UCjs8l9HAbwr8XmogHsFesFrzD9ybnI1xEEcJbJR9gcU8/+EAxyHHdZ7mi
         rL3d81+WDa5xpQfI6AITjJ8wnZ/PrrVg5EHfCwz4qOB+X5tsskbp+UYBw3SMThd/g+mJ
         k9RqfkNEI4dm4hNKTVupDJOf9Fbqv0kZ0qC6wyQRIcbkf4vZXa83E83jjZb+IDlehlCv
         ad4A==
X-Forwarded-Encrypted: i=1; AJvYcCVq5R5nrphUX6dwC5ELvC4yOgKjmvPIOK78ViMdRsfFkzmdHD+Fi5ux0BTiKagINr8RQTWu26qnPcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvpjqpcrwYgCPu/0AitX8HD29ov243nZhlvAnDbsQW9653OtmQ
	QWC9OGQgPZSHkFaWEwJwsNNaf2fvjJNh/oPSR8ozNF+Qjtz4g2w8mVdcGKI+YPs9yw==
X-Gm-Gg: ASbGncue0PWgZUaX146R+Jr5wJHPNsHvEIPjjLRIjsv2fzGknefbgMQ14U7n+KvnLLF
	LRbdPH2vwPb+S2463J0cE1lGubghZJv01n410CPuR+nU0MaYeMUdt+jFE1L2NQ/5qCGEYXINEvj
	7t+Mauvqf8wD5ceRUQdYTpx5MRZMOIWXhKwI43UMjG1Q/3jlE3wh16MbLXowk2ouqaRcMPHMCbK
	fRn3OaYbDIHk8Avttd/GLkm3kKHzsmNv6kjg8MPbmRzhMMK0jRCw2qauwdNunXFBEShMKgYqypl
	ShhIvMEV1ekiDcO+YxkihbeQDk/3+Vhq7EK9GEFzFy+5kPMNjPxVeeHIXEju1CDNSHweYWQVgyK
	Ek3mXAV+Qw2qfqChLZlhx6cFJ3vZ/gezwtwjpQ+wCBo1ecUgUzcyLSz5No/+n3dKmrQvWNkNPjJ
	xsop6JCnYg9Yqmu+vCgA==
X-Google-Smtp-Source: AGHT+IETgya5to+M7FDsbMgYNE60d3sdiiyy0IsrwbgEZV38K5MF7OJUO0i8d1zs02KQmrZrUR8TTg==
X-Received: by 2002:a05:6000:4382:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3b768f2fb23mr2934734f8f.53.1753282792688;
        Wed, 23 Jul 2025 07:59:52 -0700 (PDT)
Message-ID: <c281035f-f347-4af9-a24e-6d0db6cb3ba0@suse.com>
Date: Wed, 23 Jul 2025 16:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
 <3518a202-c664-4564-b59c-194f954b232e@amd.com>
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
In-Reply-To: <3518a202-c664-4564-b59c-194f954b232e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 16:26, Stewart Hildebrand wrote:
> On 7/23/25 06:18, Jan Beulich wrote:
>> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -8,6 +8,8 @@ config ARM_64
>>>  	depends on !ARM_32
>>>  	select 64BIT
>>>  	select HAS_FAST_MULTIPLY
>>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
>>
>> As I just learned, this change (or maybe it was the "select HAS_PCI"
>> further down) has exposed the quarantining Kconfig option prompt, which
>> (aiui) is entirely meaningless on Arm. IOW I think further adjustments
>> are necessary.
> 
> Not entirely meaningless - the choice between "none" and "basic" still
> seems relevant. Just "scratch page" quarantining hasn't been implemented
> in any of the Arm iommu drivers.

Is there support for "basic"? For x86, most of the involved code lives
in the vendor-specific drivers, and I can't find anything related in
Arm's. Note in particular the hook iommu_quarantine_dev_init() calls,
which isn't provided by any of the Arm drivers afaict.

Jan

