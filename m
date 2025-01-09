Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C101A07C8B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868902.1280415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuqJ-0005xx-8h; Thu, 09 Jan 2025 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868902.1280415; Thu, 09 Jan 2025 15:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuqJ-0005ur-5S; Thu, 09 Jan 2025 15:53:07 +0000
Received: by outflank-mailman (input) for mailman id 868902;
 Thu, 09 Jan 2025 15:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVuqI-0005ul-42
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:53:06 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb1467c-cea1-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:53:04 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso14337645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:53:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c596sm2172609f8f.51.2025.01.09.07.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:53:03 -0800 (PST)
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
X-Inumbo-ID: cfb1467c-cea1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437984; x=1737042784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t1wBuwyeR3R3NkqT7B/IREcXAKQW7aUL8bc7w4JKv5Y=;
        b=gIfwZFOSV2/2IUhL8s7MLL73w8KGYinwvUHaEnZ1iWgbtJ786PA+jCjQsa8siu8mCN
         pq6GCWYYacdKwkTnyTGbdksw8XCcgJ3N2f0PPfK2DggwCG9ilF3FXC3ffc63uC2Asn4Y
         7opdc1kPVqS0SUy2wkWJR/Pnc8kk60pZzPpZKgwKnJo0QN9yfMsDXpU8h45cAodpnKvq
         h0BgDppUs+sU2qSjchc8KmoQgKWzIH0e2bt+X2deyHuNu+YwziUODU4ljVjKgXS5l0Kg
         vdNtkuFDkBoIx0bplsia5+oA5PoWCnJRbT1hku6PiXVxesVMx4p844RCScp2XgWclNB7
         7M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437984; x=1737042784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1wBuwyeR3R3NkqT7B/IREcXAKQW7aUL8bc7w4JKv5Y=;
        b=fU4Euxd7q2TGUd1SRTNVhbMETuerUc4w70VVemjIGGc+ePcj+N8ha7TE5ppMwJD99U
         JgWSNwTR1hiPSLQyAeMUC+K9j7l4AUDGT/l9xoP0SI8mtV3AWLsok0uXxWs+KWda4Itz
         qGp9SQJ/LRtJt76fhWyrtHVYEwc15VNqv6SUYLNME/gou76ANoEyE8aAG6zj+yNYYmyY
         woRslysM2ldpdwokCsehi9J8uwu1k6+995y1LoyY96tOJPiLOaEYijSA7c2LOzMnu2ld
         0b+0wZNXK/J+ATTkSAamBaWQofHGqzEJw3vm0KqoeKYgTX9+Z6CZ/16vauYSXApJrtO8
         lHWA==
X-Forwarded-Encrypted: i=1; AJvYcCVEOvVTEwoS8ZguOr4af7KGPRZ5T7vRJPUI0rrxkL9gRO8Vn8Pm8FkD4HJcX/ZtMWI8b1PjyrJxHeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcqaAA18XmN6+x25K1IP8hQyPfGdm6gukXxvCO5U4hwe2brsY0
	4012QblinoUNpvx+ltHzVYK5yWy0p7chwlFHEVHEBbXzwv4b9AtXOJfCt6CeCg==
X-Gm-Gg: ASbGncssiSyGXtzVTPVXBH0EMNfolIKWH9+hkihDGqvMLG6VMdSVdikcXaQoqvbfacY
	HmpbogvN/kuXALUWaGz0I+pLmm4WK2w/52V6g5Kq+Amb/lpUunZ//yyd2NGj2gXG+9KSMB/1gru
	jhqN7VphKQky/2eaAD0l8vFzFRuXNmJpQob6TJ8zdhrBkvMbkt8aWHtRe2pM0jlGvzGfXOad4Vw
	tqkgJb4QWKmlq9JgpB4JIAQD53BH7kxN/IlzRVE8iXN4ql4f/XGPMzeCPZHUXPg0sfRW0e6JjpA
	bTkBpXFQWCprnuntvPmPuDarHIpAPUw56sGLBuGGOQ==
X-Google-Smtp-Source: AGHT+IGWVo9hnAJZzNwnOcsJ0ej5UGM1XlIakU6xJX3QBMHAT0PYzNI1TuiDMuXnBlR+51mundQOUg==
X-Received: by 2002:a05:600c:1d02:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-436e9d6ff89mr23517775e9.5.1736437983663;
        Thu, 09 Jan 2025 07:53:03 -0800 (PST)
Message-ID: <bdb4a31c-01d1-4f48-82af-f3eb54cd8d69@suse.com>
Date: Thu, 9 Jan 2025 16:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.20-rc
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
 <20250109153921.43610-3-andrew.cooper3@citrix.com>
 <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
 <c7eeaa80-a4bd-457f-824e-accd23c2f471@citrix.com>
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
In-Reply-To: <c7eeaa80-a4bd-457f-824e-accd23c2f471@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 16:46, Andrew Cooper wrote:
> On 09/01/2025 3:44 pm, Jan Beulich wrote:
>> On 09.01.2025 16:39, Andrew Cooper wrote:
>>> --- a/README
>>> +++ b/README
>>> @@ -1,11 +1,11 @@
>>> -############################################################
>>> -__  __                                _        _     _
>>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>>> -
>>> -############################################################
>>> +#####################################################
>>> +__  __            _  _    ____   ___
>>> +\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
>>> + \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
>>> + /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
>>> +/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
>>> +
>>> +#####################################################
>>>  
>>>  https://www.xen.org/
>>>  
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>>  
>>>  # Release Support
>>>  
>>> -    Xen-Version: 4.20-unstable
>>> +    Xen-Version: 4.20-rc
>>>      Initial-Release: n/a
>>>      Supported-Until: TBD
>>>      Security-Support-Until: Unreleased - not yet security-supported
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>>  # All other places this is stored (eg. compile.h) should be autogenerated.
>>>  export XEN_VERSION       = 4
>>>  export XEN_SUBVERSION    = 20
>>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
>> Since we'd been there before I take it the .0 in here (which isn't in the
>> changes to the other two files) is deliberate now? Clearly I continue to
>> think it shouldn't be put there together with -rc.
> 
> Oh, that's because I cribbed this by looking at the recent releases.
> 
> The documentation leaves ~everything to be desired...
> 
> I can drop the .0 here, although I shan't repost just for that.

In case this (both patches) requires any ack:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

