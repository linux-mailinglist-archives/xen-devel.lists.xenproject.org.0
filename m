Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04928B3FA78
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105944.1456752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNNT-0008CE-OI; Tue, 02 Sep 2025 09:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105944.1456752; Tue, 02 Sep 2025 09:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNNT-00089M-KN; Tue, 02 Sep 2025 09:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1105944;
 Tue, 02 Sep 2025 09:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utNNS-000898-39
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:32:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c127214e-87df-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 11:32:33 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso243435366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:32:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041f6fb232sm582322566b.87.2025.09.02.02.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:32:32 -0700 (PDT)
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
X-Inumbo-ID: c127214e-87df-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756805553; x=1757410353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NXdi+eL+bu6vyU0ShyxyymOxzjSvE9FE8HyeCBj8ZSg=;
        b=M1ajwX4U1h0TkXs43nf+c4wKEfpvUI8eZqqITRUs2qym6upsX76tdSf86vp8J5cCv4
         xCG4oiZEgqqt9ixUMr9Z682DiSgVuqV5ER6HYrhwVI/I2tJCbC8xnfkE+1UBRz+n9DWp
         FXX/XakNvRO8P1cvktxfLb557MgE6Uk/z5q8gbua4jCxLMjTnkKcELCM1wOE3dWaSkJU
         /72V4Jz/u6lgZKZoMgr2J9gdeBrlIv1yWr/DkKgZ59zFlWwgcScdRyQ3A8lt/HP7AMfQ
         Fd/AloAGNV4+s8ZhxVa2HU5rGsnvAtBxUvAruvnG2VVsDYUfmFJkSf3uHfifDra43dBX
         +6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805553; x=1757410353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXdi+eL+bu6vyU0ShyxyymOxzjSvE9FE8HyeCBj8ZSg=;
        b=wpUReW8+TBzDXDM37PJyjp7vRG8q3YnmVICYy6IDZ/2J2YZTCdW9/wI7QGwYj3VBux
         yM709G/EsZuw2bRdQyyGfxNrasubjauc5beQ0qwB5d1yiBkKBlpkP+ryq4yTJGgUrH8S
         iKRJvjQaUQI2EyoRnij3Wsk0IepcUNShzpKk/5RdR1Vggab2G4KymGHljh+u/Qx2Jgpr
         Mug7M3bsqCKXGtqC5LSH6dtYS3fdjj7yKpysEfnNsZ/k7JjB0XBPxahCEOClvc29AGu8
         QvDvYUrw1tYWVJoqNXZUOyriQkyDdxrm6pRx5uFacn0It/OKgjq9U7FCJhrncSGd2tTl
         1CdQ==
X-Gm-Message-State: AOJu0YwyYsJ899SsRx9mosc1liNpFPoDYs+HYOiwfjKSptetHHJbRqcv
	eO8VzuVCQskWqDjBnsRo7sgVyBqwqqetcXBM9YHynvLRFLj0H98R0dUIOr1ub7T7Ew==
X-Gm-Gg: ASbGncvTqazyiTgbw3hIEToYrxPqSy0qL9Vu0TAelvjSu0OLL6nQ6GwqQu0FXEfCOJp
	DAdWoWfYVSTq4UjyEMovslE3Okb4nfKk2ESsflzWBM3z5ZKH8wF0Ms3KVoD4G7q9EJCqZq04h7q
	JsN9vo+ct+o/dTj4D4hjXQblUZQFSVDFA7exmVM7l3mGbPgShGvjRk0SZ29vcjBj0/loMOUP/Wf
	IrSfDbMtS/VP5i7hll5gexMAAAPQcxcRvitMbTPyckuH2GvharuGVhZ6UxQmJD9S86mPfLz31LC
	Wrg2+1j1H3DGcojXuhboAtAtUBtugeY6syCeCeh9gT9j72CmRW0LHB4/hWVcr03yCXGS6QlciLm
	fZdRUMQyXETgtUPi5AzSFrbX2UVnD842tkgJMm1WZsWCCZ68Pr8Ewjab0nDopF0RGpTfZzk3i9m
	hGPocVHNQ4O0YqinBRKnbQ7ax/hZR7
X-Google-Smtp-Source: AGHT+IEJkS/x53nwwWhIB5BtWQD9NKzIVr8j7nv4xL6dzyyUwyvyQKYORYQq0jVZ6L3wdexVfn4ZGA==
X-Received: by 2002:a17:906:dc90:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b044ba75282mr199267666b.26.1756805553080;
        Tue, 02 Sep 2025 02:32:33 -0700 (PDT)
Message-ID: <7a9210e1-d579-48e1-99ca-1685d7561529@suse.com>
Date: Tue, 2 Sep 2025 11:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/15] emul/ns16x50: implement emulator stub
To: dmukhin@xen.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
 <aLYoF3PV/ApgosUb@kraken>
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
In-Reply-To: <aLYoF3PV/ApgosUb@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 01:11, dmukhin@xen.org wrote:
> On Fri, Aug 29, 2025 at 12:57:43PM -0700, Stefano Stabellini wrote:
>> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
>>> --- a/xen/common/emul/vuart/Kconfig
>>> +++ b/xen/common/emul/vuart/Kconfig
>>> @@ -3,4 +3,22 @@ config VUART_FRAMEWORK
>>>  
>>>  menu "UART Emulation"
>>>  
>>> +config VUART_NS16X50
>>> +	bool "NS16550-compatible UART Emulator" if EXPERT
>>> +	depends on X86 && HVM
>>> +	select VUART_FRAMEWORK
>>
>> default n
> 
> Ack

No "default n" should ever be put anywhere; it's simply redundant.

Jan

