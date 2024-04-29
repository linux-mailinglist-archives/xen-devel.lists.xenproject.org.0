Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BC8B5550
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 12:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713967.1114899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1OEl-0002CF-J8; Mon, 29 Apr 2024 10:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713967.1114899; Mon, 29 Apr 2024 10:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1OEl-0002A1-G7; Mon, 29 Apr 2024 10:27:55 +0000
Received: by outflank-mailman (input) for mailman id 713967;
 Mon, 29 Apr 2024 10:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1OEl-00029t-0V
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 10:27:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22930e81-0613-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 12:27:52 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34d2178fc7fso459542f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 03:27:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b7-20020adff907000000b0034b3394f0e1sm18622886wrr.10.2024.04.29.03.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 03:27:52 -0700 (PDT)
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
X-Inumbo-ID: 22930e81-0613-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714386472; x=1714991272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVXVZr++boh0EeYcsFQzl7f9887cbGwnOOCyCo94y4o=;
        b=UhVXLkYiVxAo9KZ1/DWk/k0OVSLcQi7SUcbaiSDfHEPc4ogIzusR9afMQpKWv3t2gE
         o+rQq6R0Oqq8tJp6SYd6WndHyFLhXfce3Qxgeq3OZrNpPO0/bsUd3c1fPibK44CCRy0N
         YBFwPHpl7asM99k1DqgtjuLdrEcuIlmr47OBmMVldqHcRKH4bm88i8wQGqhvSLNs0fZL
         36sji88VrDkglnG5Lc0xXpmCJ4psDfIggq5kmwiD5qZ8ZW1YwL1JXOgTBy1scvkGEt39
         hDk4h4IBK/2xbr+JNJYZIgyAb0f6N6x8kERg44Mi6Q/wWZMWYLgNfzan8KVUapwXYw6S
         1sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714386472; x=1714991272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVXVZr++boh0EeYcsFQzl7f9887cbGwnOOCyCo94y4o=;
        b=YTXihSjB2OnfF3ZOMDCaZtuvpEH0jua073MMoFxMS0bhUcdnTbvezvVicmAjX/22fG
         9tnFMrULMbN2yfjay5fPIUKU2iq3itprwCdmBfGysWLDzlIZKBuTp4G73DdN5cMDkfwo
         vb3LCeOGpbWOvUAk03TmucvMW8xPdvzbm+TLbnnyJSa3vJ48pVnGqN7M+/CenB2oPugj
         txrtQRlYAkLMX8/UZbyesjiegMc1wezpYfwQBMpGfddcc9euxQszqPtOH3i3hqg5otf5
         sTzxUIp1d2WXLjesM1yzWJQiasG+v6MfJma+BoKMFeKNNTJExEGQhDsYgVB7naqVtZ9d
         l+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWs/1LdjaaPBv4/PcbOa3MhU9j3kGBLsUzgfdZUydp+FM7FXLJ6Pt1DT3bGIC5GAg3NWbjktqvubYRFkQvp4mM6i/UqO6KghTpDBa7xMNM=
X-Gm-Message-State: AOJu0YwEcBC6PkbWjpML4INO/iSoWAqMPubJf3zNsap7aLJPzGTAoqLW
	n+kzVCGUFrhrxYfGWntW8uzT88GQws095czLtHBztk7oklt+BEtQH6pe/BdezDX1dAX8aIPS3mw
	=
X-Google-Smtp-Source: AGHT+IGKAtE6qG+y6jPc4+ehlJ4qm/3Acg4ueBCZmPob9MkZPvur5IgN7qvwKbAXI/vuHPu4QZz3vg==
X-Received: by 2002:a5d:4385:0:b0:345:816c:6e16 with SMTP id i5-20020a5d4385000000b00345816c6e16mr10427477wrq.25.1714386472245;
        Mon, 29 Apr 2024 03:27:52 -0700 (PDT)
Message-ID: <7947e9db-c2a6-41d4-b92a-f1b46d5befb0@suse.com>
Date: Mon, 29 Apr 2024 12:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/p2m: Add braces for better code clarity
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714322424.git.w1benny@gmail.com>
 <90082c0aa2047edf5764840f1903d1797ca4b902.1714322424.git.w1benny@gmail.com>
 <fd3efb33-6611-4c6e-a2b6-fe47f655c0fe@suse.com>
 <CAKBKdXh7oRu0Yn_fUfVb_FcqRJZxDiYTo_iyPoSHnCp1ZpWSkw@mail.gmail.com>
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
In-Reply-To: <CAKBKdXh7oRu0Yn_fUfVb_FcqRJZxDiYTo_iyPoSHnCp1ZpWSkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2024 12:26, Petr Beneš wrote:
> On Mon, Apr 29, 2024 at 9:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.04.2024 18:52, Petr Beneš wrote:
>>> From: Petr Beneš <w1benny@gmail.com>
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
>>
>> Where did Stefano's R-b go?
> 
> Oh no, I missed that one. Should I do v3?

Not just for this, I'd say. Just don't forget it again, if the patch needs
re-posting.

Jan

