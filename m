Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAEBD1B36
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 08:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141713.1475878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CFE-0001YZ-0V; Mon, 13 Oct 2025 06:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141713.1475878; Mon, 13 Oct 2025 06:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CFD-0001X9-U3; Mon, 13 Oct 2025 06:41:19 +0000
Received: by outflank-mailman (input) for mailman id 1141713;
 Mon, 13 Oct 2025 06:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8CFB-0001X3-Vz
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 06:41:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9c7a90-a7ff-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 08:41:17 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso2105457f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 23:41:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce583316sm16661720f8f.20.2025.10.12.23.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 23:41:16 -0700 (PDT)
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
X-Inumbo-ID: 9e9c7a90-a7ff-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760337676; x=1760942476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SB5IJZRq0o5OML9RXJyOJf6IZB5Yjf9d2mYsoJO3os0=;
        b=PNCuP5xPk+5UHAVwjVy4UGhonv9+EegHPm7WbUW6ROThE0Iir6Rwzk58QbrJCGU4rO
         G3rCLZ0ZxYy90gqLseYCdFnxEmU0JaQar+6DwPRa8vvUMVuO0BjXMI3cy1q1bisNPfDs
         BqbM/ReeT5TC2hR0BS4g6tPj6q/zcHqeWglN2AJfPgp1WqGnjQ6AuRRNqg50a+VN8t4I
         ccT2/w8nCLtgCk0DQbgh5tyupXIFXGWEHJdUPgrIrV+qkqIVkBNAe34CwZ0l238K9YA2
         7je3zeQ3aGGnOaQOMtX6yWwaGEVZ3eEHJ/G1GO2xMNE2jnw36jKPVTsOXRPPRmfiK5Cr
         uJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760337676; x=1760942476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB5IJZRq0o5OML9RXJyOJf6IZB5Yjf9d2mYsoJO3os0=;
        b=e2Vu5SZIpax+QTDfYQzu+34rVga8L0NEwRSHAdPg/CDZvekj7gRlQgqwjQ8r3FCR1W
         3t3xOU5cvYWO+lkGBcdjoXuT0e1w117IFzvbajQZog4e3FT408/ypG5/FYyM5JIQJbmB
         dnEZw4KEs+XGVxOM8Dz5UC5urFF9nB71pGNFmE0IxOIhUwJnpeCHiSTNiBwZMOyDwupv
         HkYArvXbSnOgbv5G9nkp1XHZxdV6r/XKIAhVa7z/mQ5SxSqCSdMWhGN+/Jwr0drewAU6
         CuLVhDaAnQjrLOb6TamrR9GiG/NF3IP+UPcge47vzdfZnl3HB67xzkYSVZwXq7V7auzT
         GY4g==
X-Forwarded-Encrypted: i=1; AJvYcCWNwxdG77G6ibN6JyZHQ9vjFma5YFhnSwDl3dvyht0hd8mrOXvtGg5icTIROjdULEVmvYQgGfdaWaU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdxiWcmniVVByqYPpCgz0+/bNVPmik38oaeeZ6Ri3fP590VMZV
	YY8N31xqm/juF+6cvCvCiIEuf/pchCbj5JyyUIKjbjzwAFe6bO1IJX9+AwNq5MqxSQ==
X-Gm-Gg: ASbGncsNQW/ksu6vNWONhLU/24aYuRwxhyEgK6WTDVK8J5imA0dFYqZbjbbbq33zJ4K
	8XL0VsME5LwmgLNUyg+L7Qeq7xMcvfnVfY75Velh7IgDraqA5QIH3eGoPqqOf9/dLTDr0oUpnM/
	OJFNbNp1d6IM9DIonST2MAAhZecFYg2sWcb9efIwq1lq6bK03MpG0zQezKdWA0dl6ZxyTW4PaaN
	7ebi0mHiGyfi77mWihKlzNNRDMy5GljaFWvQgcro5E1ee8GAFrAjY9GVDBi0afFWgvRU6jlN4ql
	2wio4qodPO+WUgoedJSBGfUylg+FYKae6k0WR7vd+eN1cJPPvs2l0DR1HqbrdihdIBJ697cHd8b
	UJpM2pjOM0p2xbhA2U6ZzHWZ9iOLUcSRwd50+Ueri9oBY5GF218GfI69FOUhXTqKhbAw4VjYm6t
	qJ3VfCFi/j6L07IAFzpK2wkWicFjGdAnH2JVLR
X-Google-Smtp-Source: AGHT+IG5QO9Vk4ZEqwuc8v9ggbRK2KjJYTvZ4H3zvZNfPZy/oN9QDQa0BIxZodjD01MVLUbSaBIlkQ==
X-Received: by 2002:a05:6000:258a:b0:425:8bc2:9c4b with SMTP id ffacd0b85a97d-42666abb51amr10200735f8f.6.1760337676364;
        Sun, 12 Oct 2025 23:41:16 -0700 (PDT)
Message-ID: <fa709d35-8c7b-4c27-9bac-52a48f5b3fb3@suse.com>
Date: Mon, 13 Oct 2025 08:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
 <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
 <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2025 08:44, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, September 11, 2025 9:03 PM
>>
>>> --- a/xen/lib/x86/Makefile
>>> +++ b/xen/lib/x86/Makefile
>>> @@ -1,3 +1,3 @@
>>>  obj-y += cpuid.o
>>>  obj-y += msr.o
>>> -obj-y += policy.o
>>> +obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
>>
>> Fair parts of cpuid.c also become unreachable. And all of msr.c afaics.
>>
> 
> I just found that the functions defined here, as helpers/libraries, are used in tools/libs/guest/xg_cpuid_x86.c too. Emmm, to make compiler happy, I still need to provide stubs for them when MGMT_HYPERCALLS=n. Or any better suggestion?

How does the Makefile change here affect tools/libs/guest/? What would you
need stubs for there?

Jan

