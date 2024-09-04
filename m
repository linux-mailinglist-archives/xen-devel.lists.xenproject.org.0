Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC796B22C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789855.1199517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljua-0007Sw-MO; Wed, 04 Sep 2024 06:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789855.1199517; Wed, 04 Sep 2024 06:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljua-0007Qh-Jh; Wed, 04 Sep 2024 06:54:40 +0000
Received: by outflank-mailman (input) for mailman id 789855;
 Wed, 04 Sep 2024 06:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljuZ-0007Qb-1m
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:54:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d283384-6a8a-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 08:54:37 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so4006699a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:54:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfe78sm7131244a12.69.2024.09.03.23.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:54:37 -0700 (PDT)
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
X-Inumbo-ID: 8d283384-6a8a-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725432877; x=1726037677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eMGhQtUGPSKCT6piGkvO6PnMQHTr+qSw5kdU47Ng5Js=;
        b=TYKnp1h2THrMmhTNq2ZbCZ8ewXNCv/LSclxQgQNqnI1q3bWowmFXsJMEDv0CW/SJ2l
         vs3TKLCChnUbJ8f9/rhcfD9aKhWf9kGERK3G1+QPz9pirX5wY803bWdcE435oXDgM5FO
         KzAJthyVejLjtXYrYYFg44NDWDXUIwUDIaE4l32IyexPZTA3DaTWU9zUPZHOFEUfWlYA
         WrYuNsFAAaffUtnkf/CP1jBWSIwtpbFt++sHbym0V2BCOGoyVapMwmCbFTkknniSQc1i
         ley1UCelx3+t0Gmv6WI9mtxGfhyUvDEUA0kpAXeXFBrjNL6G+f932qX95Rh5/7SvlRtD
         83mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432877; x=1726037677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMGhQtUGPSKCT6piGkvO6PnMQHTr+qSw5kdU47Ng5Js=;
        b=l7Z+omWzksQxEqLgAz5gcyaKRkC55roMV92dNKFWqNs/VakeYhTuAVxqkRYc39g1mp
         0WRU49yM4vkpeTS4YCtyMBRbjrbBU6kzcYttU3k49lnsWP6kC30erx9qLCMnWa71RNck
         f8bk9jNXW5OjtNFdW9+STBLe83aEN/b794DH46t+L6G0MQ7tNX1exzzbpyiPcjloS0ws
         SR9JnPHqY2nvCq/QwhlTLeAGjH3BFJeftTKSFvsWNpQaMcTb9/yWEJmQy9G8TJBW9s97
         8qmWhHesA7kSByGnoFvfSFmGJehyDRw34+w1WMEMQ/K2SJsHmbyvmwgZrj+6s5pzCkVY
         7Rrw==
X-Forwarded-Encrypted: i=1; AJvYcCVrLB4rcpsz1KWi+kYrIw0RfkH3M15erkpYvQFTnm76UQet3E5nU5pc8uhHP2GNwWzsAlCOQw/0NXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd/QQmUOw/1pxMt1eRnYoliz4PoG/vXYSjEljgF4mcOyqcUIJb
	2q0FzhUbUoXdq7aSEr2SWMiRNzvm6sAl3wzNJaGFJYfvYhW0hsnOah2QUFFKSw==
X-Google-Smtp-Source: AGHT+IFdsNRrFCrj5mqEClpNG/Igx0/ZgOmcClcjzroMsRUWh9bmJTQ+Js9TqY6c47o8/hcyxJEjOA==
X-Received: by 2002:a05:6402:35ce:b0:5c2:7570:3a2a with SMTP id 4fb4d7f45d1cf-5c2757dc9a0mr2754677a12.17.1725432877480;
        Tue, 03 Sep 2024 23:54:37 -0700 (PDT)
Message-ID: <26b84bfa-e186-4b07-8718-72a10be8b03c@suse.com>
Date: Wed, 4 Sep 2024 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240903115334.3526368-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 13:53, Andrew Cooper wrote:
> Most of Xen is build using -nostdinc and a fully specified include path.
> However, the makefile line:
> 
>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> 
> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> 
> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Despite the title saying "Fix" I take the absence of a Fixes: tag as meaning
that this won't need backporting, and is rather only needed for what went on
top.

Jan

