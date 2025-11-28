Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7039C90FD8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 07:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174504.1499465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOsLo-00027o-LB; Fri, 28 Nov 2025 06:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174504.1499465; Fri, 28 Nov 2025 06:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOsLo-000266-IK; Fri, 28 Nov 2025 06:53:04 +0000
Received: by outflank-mailman (input) for mailman id 1174504;
 Fri, 28 Nov 2025 06:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOsLn-000260-It
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 06:53:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13903fe-cc26-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 07:53:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so15670705e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 22:53:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc6f7bsm141639705e9.2.2025.11.27.22.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 22:52:59 -0800 (PST)
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
X-Inumbo-ID: e13903fe-cc26-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764312780; x=1764917580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cvrNGGsVlHFYpn6l6PE0avSFICAA5/4pl01G6mDSBSE=;
        b=PUJNFjPSAT/6FETiTtm0G7EAKkMnNJ8g5FDRLI8qSNnV15JMI0yhtG+If7DbTCWAH2
         Szu0L4Kt282YmK178qMhHaDveCDhVJ9oiEvlNoa2MuJaK1Ae9El7ao0zw7vXn4WEliJL
         ieT/rAhF7ZFA0Nhi3k3kMHutbFcPXBFQI0dTOm2wYROQxdiwi2fnWxsv9xepnSuufmK/
         yxcUX4e7mfThPmPeurNCo6w56diDwtdYhkZvUwJPxB8OxG4Lz17ZKygbTBlMZDAut4S4
         7h0Sq2a5bT8qsw0pyU/jseg3LzJjJLtC/zhhUW/bmtd8JP+mRLtgf5vRGAcmHZQhlgm6
         XX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764312780; x=1764917580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvrNGGsVlHFYpn6l6PE0avSFICAA5/4pl01G6mDSBSE=;
        b=w0m4FCNZJAfW/ZoA7NWVjGneN1cnAaLe3Ytw/iXyQFjTKbXZ/TRrsAYmXxHICgSmkU
         S+VJPjjn2gg2XVmeM5LO6hnxVCBCIeMYaQMccZrsfE1yXfcd2cpzlpWVmL0Cw17xLL6+
         v1asTgDKTGO7ScL0YNk5G0fxQSE+UIgkjpaIiYPBoZ7KTPWby7ah65FREuUXb58pAEsV
         2bogjyT/aSzwpzUYM/HS+BbiXPfjW3Pm10rUZkCOCYtfMprJBgkuD/dls3ib52kQ1eC7
         1FutId16beDyXUc8bWZTrJ7YV2NZKD+M5tzXaooKPqPsc10zBSdc3kb5OAH8gheavtDy
         gm/g==
X-Forwarded-Encrypted: i=1; AJvYcCXXE3g4Y6B8yJ/yOAZCHHo66k2v2xdtrp7gTf409/UIPoJeQiXS5hbcX3H2wd36YUvkpI5UCTBUfzQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXcRmIx0jbr3m8N/aN1rHKAAU2TvIfTsIDCsQkUapUdeuw7dtY
	rIatm04MnlLmWjp42Oaq3DKyJZyW9yC0GLh2ZYW0Cgf1tcyAdjjR0GArUMGjN542Yg==
X-Gm-Gg: ASbGnctMsxuX9uACjdAm3de4jKPxVFlWvTLieThfigHshN7EJPy0eNY50QiP2b1VWl9
	XiVLwEjnO36SIhye/uRXX91Xm+LgxqeIg7Qb4lIZfFGMPPB1hbfs5L9QeEnPjfiAXBRQQaWNZhG
	Vh6ovGCWIvb3vO6/nYtJj6Abcv4FyBXtoytDv89i7pTxslAyh5tFxJPcWtn5Sl7RtbhtZrQB5yy
	joHkUvBSR49G0UqszfRM5kaRlGCj4o8FCs5HZxH3vFTXouOzxMgUx7Qo/E5KKDk79HjEADF9aec
	CPUfh/leS3okG1O51ggPgyFQxMfUTBBD0pGIt35hH8+tQme5ajJb2vi/37dzeGSoLx/trRPQL+v
	xFgitJwywhqhABEU6ktRPOLuq8CKYp7XdWxpvwiqGi/BJcuobKyKPrzoxAVqI/8ggREtqmEBkGD
	Z0M2epc0t9N+ut9R+K8Km6GKpJaWuwmqQm8NUIajIkJlD3F5AwDH3MV+Le8YickGkc3UMiStjEr
	8r4nCryWWXfMQ==
X-Google-Smtp-Source: AGHT+IEKe7kQMRzO0VtSreEcKT3OKB5nPnlceQ8ayLCmtl5Bttn/s/NL0/M6rQg1bE61h7wzRO2Z/Q==
X-Received: by 2002:a05:600c:474a:b0:477:b0b9:3137 with SMTP id 5b1f17b1804b1-477c10c8886mr262484815e9.1.1764312780348;
        Thu, 27 Nov 2025 22:53:00 -0800 (PST)
Message-ID: <57e4e4a8-3ab1-4c7d-8316-e3e3a1848a04@suse.com>
Date: Fri, 28 Nov 2025 07:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1' 8/8] symbols: check table sizes don't change between
 linking passes 2 and 3
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <94f993b2-93f4-43a5-a502-da53b810b201@suse.com>
 <cd3bcac3-8889-4300-a488-b84963391c01@citrix.com>
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
In-Reply-To: <cd3bcac3-8889-4300-a488-b84963391c01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 20:31, Andrew Cooper wrote:
> On 26/11/2025 1:48 pm, Jan Beulich wrote:
>> --- a/xen/scripts/Kbuild.include
>> +++ b/xen/scripts/Kbuild.include
>> @@ -56,6 +56,19 @@ define filechk
>>  	fi
>>  endef
>>  
>> +###
>> +# Compare the symbol tables of two object files.  As diff's -I option isn't
>> +# standardized, the name difference of the two object files needs abstracting
>> +# out.
>> +define compare-symbol-tables
>> +    ln -f $(1) $(@D)/.cst.$$$$; \
>> +    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
>> +    ln -f $(1) $(@D)/.cst.$$$$; \
>> +    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
>> +    rm -f $(@D)/.cst.$$$$
> 
> Doesn't the second link want to be `ln -f $(2)` ?
> 
> It looks like this is comparing $(1) to itself.

Ouch. Now I'll be curious if with this corrected I still see this pass
successfully.

>> +    diff -u $(1).sym $(2).sym
>> +endef
> 
> While I am generally in favour of build time checks, this looks like
> it's a large overhead?

I don't think it's really noticeable in the overall link time, considering
how slow especially the xen.efi linking is.

Jan

