Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72B8CD5C1
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728558.1133517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9RF-0005xv-H3; Thu, 23 May 2024 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728558.1133517; Thu, 23 May 2024 14:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9RF-0005vp-Dx; Thu, 23 May 2024 14:29:01 +0000
Received: by outflank-mailman (input) for mailman id 728558;
 Thu, 23 May 2024 14:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9RD-0005vj-SA
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:28:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca317660-1910-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:28:57 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a621cb07d8fso284837666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:28:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7dd4sm1942816966b.139.2024.05.23.07.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:28:56 -0700 (PDT)
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
X-Inumbo-ID: ca317660-1910-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716474537; x=1717079337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGYX5cZNEZCr/r7aY+MvBTpZfJhz3uIklvKnW9itnNY=;
        b=cZifHapv/BM8LNM7XHBKnQ7Iasffrbli2WyYVM6VDLzsFeWeHC4lZrRKl2aAryPG39
         pB+jQQ7WcDMQkztRup2Mp0T/hcmVJ5mPMMMg0YJ9x8L3w7HMu+wBY92DUjMN8+vyW/Nd
         wsAFmduh5FsSO19SRt5Bc5S4op7fu7xT6LhBLt9Ssfi5WPhNEjdInxLWs+MZqvE1laye
         sNHDonytIlbc1qaqDzU1v/sVzS02CnTufngBWdtyCw7SVDQLioD+7YxpErQLmYNQWwYC
         wuehlrLH0xxWoB4mKkB6P5Hja6jqD1s5dozDpjhplZaSSuNOsOiCTTgnb2pk5yJaWysF
         0PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474537; x=1717079337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGYX5cZNEZCr/r7aY+MvBTpZfJhz3uIklvKnW9itnNY=;
        b=Y6jV6aR/RgGDvY6UzZ3w/vH2yjgRX80YjkMnUktJIiYMgMAwPm+wt3/RWN5c4oggB6
         9+95hQWzbmKKGgPWbuUv3p7kJgQiWqG11es0hgUy46GoIUh2YWDLs8Cirxi9zYxSlnel
         w5op3W+DvBPmfr0YXIShtXt+Ka2nl3caFNFOAqb+4/o3cBeJscQzuZplZ2TZv3JKHO/s
         Uetzf8m1t/BwsyH3aXDGJqWPfHccbbT96o0j3nga8UM2PDY+7Yw34HLHExjRpcNQqx9x
         +7vZxKO3D34djrQXqPmRfCGu8ET0VRy+AY2cCS9Iuw9zKh0+Jusieq+cH3oqEpCLHUDq
         hzZQ==
X-Gm-Message-State: AOJu0YwefB3s8X2MocNMx27krWDB4/ym7YKwlt9ms6DHXpY+b5bDuHvs
	OJgJ3jUiQqhsFvher7vmB+G/H3aTs4z0Aenwn5dW4ckNJRzTd2xVx6QMRxw+RQ==
X-Google-Smtp-Source: AGHT+IHZQ+W+5LFH6NClVB3/Y0RPvpfK5PnafyJS3lSxrcTlsReYUw5Il68RRT/wzjPiJppqqDVM3w==
X-Received: by 2002:a17:906:3b87:b0:a59:c28a:7eb6 with SMTP id a640c23a62f3a-a622805efc9mr370076866b.24.1716474536884;
        Thu, 23 May 2024 07:28:56 -0700 (PDT)
Message-ID: <5e2eeb3b-7ab7-429d-b113-134d526374d8@suse.com>
Date: Thu, 23 May 2024 16:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <Zk9RChKHBa4mQAVj@mail-itl>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
In-Reply-To: <Zk9RChKHBa4mQAVj@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2024 16:22, Marek Marczykowski-Górecki wrote:
> On Wed, May 22, 2024 at 05:39:02PM +0200, Marek Marczykowski-Górecki wrote:
>> On older systems, XHCI xcap had a layout that no other (interesting) registers
>> were placed on the same page as the debug capability, so Linux was fine with
>> making the whole page R/O. But at least on Tiger Lake and Alder Lake, Linux
>> needs to write to some other registers on the same page too.
>>
>> Add a generic API for making just parts of an MMIO page R/O and use it to fix
>> USB3 console with share=yes or share=hwdom options. More details in commit
>> messages.
>>
>> Marek Marczykowski-Górecki (2):
>>   x86/mm: add API for marking only part of a MMIO page read only
>>   drivers/char: Use sub-page ro API to make just xhci dbc cap RO
> 
> Does any other x86 maintainer feel comfortable ack-ing this series? Jan
> already reviewed 2/2 here (but not 1/2 in this version),

Which, btw, isn't to mean I'm not going to look at it. But 2/2 was the
lower hanging fruit ...

Jan

> but also said
> he is not comfortable with letting this in without a second maintainer
> approval: https://lore.kernel.org/xen-devel/7655e401-b927-4250-ae63-05361a5ee71d@suse.com/


