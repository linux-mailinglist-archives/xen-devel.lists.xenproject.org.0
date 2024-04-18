Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B98A95E0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708153.1106788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNxW-0008WE-Up; Thu, 18 Apr 2024 09:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708153.1106788; Thu, 18 Apr 2024 09:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNxW-0008UP-S5; Thu, 18 Apr 2024 09:21:34 +0000
Received: by outflank-mailman (input) for mailman id 708153;
 Thu, 18 Apr 2024 09:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNxV-0008UI-FY
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:21:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aef6d85-fd65-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 11:21:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f55so4559305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:21:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b00414659ba8c2sm2035490wmq.37.2024.04.18.02.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:21:30 -0700 (PDT)
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
X-Inumbo-ID: 0aef6d85-fd65-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713432091; x=1714036891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5FFMombXYQkmuM168vFilxXGh2CNQWXX7VpGzRC5Jo=;
        b=GqROYpOCtomy3Kis5+n2YBaOrNOGKQKeFU9T1ulhWbzxY2lxto24hLBItEufQybCeZ
         WJS/lw3ugQGV8WeWMi6stGJb7z/C1fsqMbFePs3HDTJguInDz63yUyZ69+KMnpCoxtZL
         LZp3uxfRnIA0ZkGmXh2q2olGxB+WYHmT1N++JXSdXsPi7bh80OiHvHEivvDJNDW4urZK
         ZACbfCXWpMYOE2ia/Zz39DdIqLoqSSkhmNJSV9YGP20zur9I/w7VL5lpj0qOHTmg9rCr
         /K2hw83dl+n9aMMkEZMjutSAt4kIp1Ln95Wquet5C5WOFNL5bOWzcSn3C3WbrSnq7L05
         wUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713432091; x=1714036891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5FFMombXYQkmuM168vFilxXGh2CNQWXX7VpGzRC5Jo=;
        b=kmSrGqCNDhgB+dlr0eCYBRG5cdekisFxsUQmp+yb+8nrHKhpB0f4UKSpXD5qaS3X+p
         GMZX1f3OKbOJjqLMOeJ8NYymyWUX3Q1geOOlIEoMNB7W7dAe9LeQrTdOxOBvXh2PHerh
         fKfVE5P/dUKs4iLqbq6nuP9QnP6fC4gMfX6u2vvI0MN/5uTUEz2vvMoRQGvhDWD9pIF4
         uTReWtgFld1d3rKmraCc5XkEUo3zneZv2VjKCJm6pTqiJAu8GfY+X1vXB/Hgkx0Ev/Pj
         WmXC8ApxGxjT3xU44SIIvwIsE54cOO5lJdVvC9RWqqSnmpt/8jTSj6n9dgAti674XKRh
         xd9w==
X-Gm-Message-State: AOJu0YwknElrc0quorDlvdWwcA8zVwSKQdw+nGqVaffeXQcw04RhV4Vv
	FgABqSCC3XEsncSxFz9BghaEWEVWF5jgZNTTtyN0V1vAsmKKiimzqlfkxEw4kA==
X-Google-Smtp-Source: AGHT+IF12mCsXRYplyI9q62HnRMpMF2fDmAiLW4QhXYvzufQfhLEfeBCuFuDC4QptcB9jFgK1WRtXg==
X-Received: by 2002:a05:600c:154b:b0:418:a2ce:77ae with SMTP id f11-20020a05600c154b00b00418a2ce77aemr1488736wmg.27.1713432090831;
        Thu, 18 Apr 2024 02:21:30 -0700 (PDT)
Message-ID: <7704ce51-2cfa-44ce-9001-a5bda1dc0dfe@suse.com>
Date: Thu, 18 Apr 2024 11:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/public: Use -Wpadding for public headers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-5-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2404151456280.997881@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404151456280.997881@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 00:15, Stefano Stabellini wrote:
> On Mon, 15 Apr 2024, Andrew Cooper wrote:
>> RFC.  In theory this is a great way to avoid some of the spiketraps involved
>> with C being the official representation.
>>
>> However, this doesn't build.  gnttab_transfer has a layout that requires a
>> CONFIG_COMPAT if we want to satisfy -Wpadding for both forms of the structure.
>>
>> Thoughts on whether this cross-check is worthwhile-enough to warrant the
>> ifdefary?
> 
> I like this patch and I think we have no choice but going in this
> direction and adding all the padding explicitly with any related
> necessary ifdefary.
> 
> The only question for me is whether to:
> 
> 1) add -Wpadding
> 2) add __packed__
> 3) do both
> 
> I think it is important to add __packed__ to the headers to clear out
> any misconceptions about possible hidden paddings and get a
> correct-by-default behavior for anyone that would import the headers
> into their own projects.
> 
> The only issue is that __packed__ makes -Wpadding not useful. We could
> technically add both if we disable __packed__ for the -Wpadding build.
> For instance we could use __packed which is defined by Xen, and change
> the definition of __packed to nothing for the -Wpadding build.

The other issue is that __packed__ isn't standard C, yet we intend the
public header to be plain C89 compatible.

Jan

