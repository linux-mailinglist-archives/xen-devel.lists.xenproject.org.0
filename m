Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACEAFFBF8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 10:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039191.1411130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmS0-0001hM-Dj; Thu, 10 Jul 2025 08:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039191.1411130; Thu, 10 Jul 2025 08:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZmS0-0001fA-AY; Thu, 10 Jul 2025 08:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1039191;
 Thu, 10 Jul 2025 08:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZmRz-0001f3-5Y
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 08:16:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2013c9a1-5d66-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 10:16:05 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso725077f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 01:16:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3e957e02sm1545527a91.1.2025.07.10.01.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:16:04 -0700 (PDT)
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
X-Inumbo-ID: 2013c9a1-5d66-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752135365; x=1752740165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NuICPZ4Xx62HNptlSkOZs8SPzISpyt3Gxf3PlS+cG9Q=;
        b=aYSBfrkVGzvqXVoPa32CLQxfT/cK1qS/sdoeSWI/FMl7mAiAlpD4yqYNmEwC1ajX7D
         48d09Dvne4tS+idWA3PiKkic3b44Hw/IjGJkZQUtmIBKQA38wv5Kh2Tl6XXb7xUFygoY
         99flHDdKGRaRpvFbFniBHn5ejRPCazE+FKGMbClBvg85SL0N9DkKcjZEEuXokyBMvcGN
         eLGYJDSv0S27OAMzTdNj6hw1FBPSYXZLW/LuEDYZoOtyTajtrQDk/MaAmGVMcVVQxPng
         6FMD9KCzd0K7D7Ik14IweV2pTS+VB4n3dZDuTTSrtX55tlBOCrilCt09LOe8wPeZIigJ
         mUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752135365; x=1752740165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuICPZ4Xx62HNptlSkOZs8SPzISpyt3Gxf3PlS+cG9Q=;
        b=usSLYdNOtM1/AUR/VBLhQgHbS7xaWK9vrXUWvUet6oZo8FH8zW4VOy1kEyuWbpanKC
         Mjm6lJKTbVB5SsHBjmfpK7WN05MaHVvhFzeWPeSaJDk/Dsuu7iOivCu/iETXHFzd9ObV
         PonVUCEFunxJq8zOnGmuq+AXVQxQKe4GhPaJvqXdmW9BjeD5NqfnyvtQZtHbTEBIzF0T
         QCAysGCulSRdS7ZV/6Srb+cPHdbE94RptG3rqgef2LBGY7qRmFfSY9mysIA2blRm6523
         mLR9uK81dssvryX+L7H8u8Ivd5qelxOtHqKkUTRhzjXvs8iLR8bAaKswZRdnbsRBXzeq
         PCjw==
X-Forwarded-Encrypted: i=1; AJvYcCWheIYj8dMPr3YgJX484G72KWElc/WMXt78/eDM4OnYf/W1NCHFoCuXOzmcI1aEsmIZPpDxp/khp1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxPt06z9vK3TqxI1Hls8OsrAiuBJUOrM5jerVtlhvV3zTlCSjj
	RR9iGgl3RVKITsr7BnGfCkZkiMFtfjZAm3gn8yVGoEg9N1A7yzWPTyrftzQPc6yYAA==
X-Gm-Gg: ASbGncuSYDCSaSl79IwNICNBeK54Aa6N7Z2m6LzFuT0HKtK7Qu9IsbEwAr6g7kka2sh
	EQplSCJQhTqDoswKxDTS/vFNDYou4k5TGxd9MEaKVs/BNh0Dvhk+BXBAR5ogH0d5ZRtB7xXZaqe
	B4naf1Hm3ElcdyI/8rNGCvrDTpXoR5fr5jgM1CMA3UX2c9B93cxjKN4AWsicSWcnZb4pPT7eAb4
	HBn3RBVvsBfxrleXOWTffCnH7VaYrT+y1Mce0hTmgOQXCU8wHDfgR3ofqCGt17AUPzEpXNWduWj
	D4whorQQFngiJ7G1t17b4bo2QMmnipW8tosKYHK6wrIzb5ZDkl7fXMO214MHM6BXDWmiisGq+aE
	hPqDGPG3Mb+UtxPEBiLlWEpLpnZoaCAPujHyXmdj1qF3ZmOk=
X-Google-Smtp-Source: AGHT+IEVm3u02QSkYOK0hLTKNwd2yX22K6qaU5fCucakFBD+o55zqwpjwX+1bmzR9DbBek+0DDqOoA==
X-Received: by 2002:a05:6000:21c7:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b5e867d7a9mr1049955f8f.20.1752135365123;
        Thu, 10 Jul 2025 01:16:05 -0700 (PDT)
Message-ID: <ca73a0b6-e484-48be-8ddb-4f53c18c99a0@suse.com>
Date: Thu, 10 Jul 2025 10:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-14-dmukhin@ford.com>
 <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com> <aFpUNB8BP6+COTRp@kraken>
 <3da8604c-797c-4ad2-b059-4bf9c5bfb86a@suse.com> <aG8eaUx0wW19xS6W@kraken>
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
In-Reply-To: <aG8eaUx0wW19xS6W@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2025 03:59, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 09:33:04AM +0200, Jan Beulich wrote:
>> On 24.06.2025 09:31, dmkhn@proton.me wrote:
>>> On Tue, Jun 24, 2025 at 07:50:33AM +0200, Jan Beulich wrote:
>>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>
>>>>> Move PL011 emulator to the new location for UART emulators.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>> ---
>>>>>  xen/arch/arm/Kconfig                               |  7 -------
>>>>>  xen/arch/arm/Makefile                              |  1 -
>>>>>  xen/drivers/Kconfig                                |  2 ++
>>>>>  xen/drivers/Makefile                               |  1 +
>>>>>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
>>>>>  xen/drivers/vuart/Makefile                         |  1 +
>>>>>  .../arm/vpl011.c => drivers/vuart/vuart-pl011.c}   |  0
>>>>>  7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>  create mode 100644 xen/drivers/vuart/Kconfig
>>>>>  create mode 100644 xen/drivers/vuart/Makefile
>>>>>  rename xen/{arch/arm/vpl011.c => drivers/vuart/vuart-pl011.c} (100%)
>>>>
>>>> I question the placement under drivers/. To me, driver != emulator. I
>>>> wonder what others think. But yes, we already have drivers/vpci/. That
>>>> may want moving then ...
>>>
>>> re: driver != emulator: I agree; but I followed drivers/vpci.
>>>
>>> Do you think common/vuart would be a better location?
>>
>> Or maybe common/emul/... This wants discussing, I think.
> 
> Will something like the following work
>   common/hvm/vuart
> ?

Not really, emulators may not be limited to HVM. But iirc common/emul/ is
what we settled on anyway at the last Community Call?

Jan

