Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D2C97D75
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 15:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175747.1500362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ4pD-0002mu-Vd; Mon, 01 Dec 2025 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175747.1500362; Mon, 01 Dec 2025 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ4pD-0002l8-T3; Mon, 01 Dec 2025 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1175747;
 Mon, 01 Dec 2025 14:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQ4pC-0002l2-MO
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 14:24:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6da800eb-cec1-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 15:24:21 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so23916305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 06:24:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc186sm299916015e9.13.2025.12.01.06.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 06:24:20 -0800 (PST)
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
X-Inumbo-ID: 6da800eb-cec1-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764599061; x=1765203861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BoNc0EfE6oIDMoAeDnIpEEeaSUgG+5MJKYEPo03xtjc=;
        b=KklLoMnrc+6mZ6ODt3VXCo+N6ygm3lZBKJADJr2tH97p1UwYRuIj7DEyDtcgtMIQOZ
         x66ACYLEQilCQi5gdAk0g+2zfxuIx2/NbeiASPkNt8TZ7C40Awo6uKsY98+4KKNk6ceS
         pcaf9ZTwq53e21VDMNLimwsN325orUO+mE4pzKhxFjl232XYS+ZlXpsdu/wFbpTaOm/L
         0DlNYG1JsB054Bjr9aFJIMjqZ1jyXofUJG9gb9L+9s4Vk/leo7P9niDR8wXhoT9xYGa9
         dQ+ZDHfhmSO8tHCYfrh9EY/sV+SKcBSha6ze5bEhCEmAtKHPquW9pDHjdsFNoCVKN2O1
         9P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599061; x=1765203861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoNc0EfE6oIDMoAeDnIpEEeaSUgG+5MJKYEPo03xtjc=;
        b=mmUHDmsCOw94b9Cnt801+HlCtWChQh+R1ZP2/RyG2NO1auoUqd/Ozl9PMEYW35isES
         NqRewAnhdgQMzZ7cix+imC78betQTp9pyUjwg0KWHMqG9ZigGl/825VaMY1VmzNXO+E6
         18fqin1SPrsp79/iLl93z50SxaWv4KSJ+BPdsxZC0l/OU4aRBTO3QYd9CfchJT34qIl6
         OemgJ+ee//STVPs3d/SKuOrgC60FTyT8RPwxONE73iyWaVLCY3G99l4FMBS0TeqFWzSM
         KjEnxRvhhfBqzkPVXy/IshwsSshdAC087+r3Egxk6/io8buhc63DCRm7WAY4hcKg1opU
         CEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZFUNgEqt/zpBXpoIkUQRXOgF6J1xd2tj1MAcjbSSmI0uXXzybvLv6+9iOU3+gCL9q2Q3l1iF+yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFsMQBMLL6ohwys7BYldyCo90j1we1MahuCYiIf0/pl1aM9+wz
	rjNKcZi/IbkyExnL0BxdgNLh/DmgQwafSXmQFIQfuZ/eDHhiTcjbx3BqviZHQkbKbg==
X-Gm-Gg: ASbGncsjD0YEjzKA8vDA68hBpCo+woi3ivbbrEq3rTg0O5Lp3ASPbBbRln2IrgDOXY+
	MeJY6sKsV/YKkjxeXV0DqEPA8bn9jOAuMBXPAcAcz/KyYo7bQObFrnEMMVjVKuy9MHlhd88LEwo
	3kY0oYZ2ovl6jjDXEoyqlYXvtNcl6+Liyfh/Y6uNRxnzyU3GEJhOK1rz2BG3y1dbvwB0QiGhY/W
	gwSZMzzCO1/JjOSl7y5o39j+HMDN9hQtsd6mXiFsccLDfO+ruqwS2iwr7Yrh9++sa5W9LESb99K
	BPz3dcDRMxeYCmPKo8iHZxL8lJ0ik4gXAIp2pRwxC4i8A3ZYbByHhKD6wc8GMDjosuhrYED1bes
	3RJNwWH4Iss3IbdpZNO8HKVqNkK06IEwQVHkacErJSkDLeJHk7d2RvgLT7Mx/yhHDe9XoaMN/lT
	CgU0hLjGwVAykltbLypBG7JGmXP+8ThF16A5u42biYlWH7Iajnpl72S1YBy/ePBlzWIsC3LJm8h
	qQ=
X-Google-Smtp-Source: AGHT+IEWPFOrhbQSpnYMgepsF0cx0F17DxyoneBP/C2+0fAPq1Swe3sOx16GNa2sTAMAUNXJo3+Euw==
X-Received: by 2002:a05:600c:1c9a:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-477c115dabdmr460533875e9.30.1764599060702;
        Mon, 01 Dec 2025 06:24:20 -0800 (PST)
Message-ID: <8556154c-86d8-4208-8c47-3a2507c80dd1@suse.com>
Date: Mon, 1 Dec 2025 15:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/lib: Introduce SHA-1
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
 <20251128184757.1243678-3-andrew.cooper3@citrix.com>
 <bb4ca936-da10-46f2-bf9c-055e19990d82@suse.com>
 <040dbfeb-fe2f-4b5f-9495-799a22876d4a@citrix.com>
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
In-Reply-To: <040dbfeb-fe2f-4b5f-9495-799a22876d4a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.12.2025 15:19, Andrew Cooper wrote:
> On 01/12/2025 8:46 am, Jan Beulich wrote:
>> On 28.11.2025 19:47, Andrew Cooper wrote:
>>> --- a/xen/lib/Makefile
>>> +++ b/xen/lib/Makefile
>>> @@ -17,6 +17,7 @@ lib-y += memset.o
>>>  lib-y += muldiv64.o
>>>  lib-y += parse-size.o
>>>  lib-y += rbtree.o
>>> +lib-$(CONFIG_X86) += sha1.o
>>>  lib-$(CONFIG_X86) += sha2-256.o
>>>  lib-y += sort.o
>>>  lib-y += strcasecmp.o
>> Why exactly are we confining the two SHA<n> to x86? They're both plain C
>> implementations, so ought to be fine to build everywhere. Being in $(lib-y)
>> they also wouldn't make it into the final binary until a reference would
>> appear.
> 
> For the SHA2 patch, an objection was made to compiling it on the other
> architectures.  Personally I think they ought to be plain lib-y.

Everyone (not knowing where the objection came from) - can we please re-
consider this, ideally ...

> I could always have patch 1 fix up to lib-y and have patch 2 match...

... allowing this to be done?

Jan

