Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002819EA94E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 08:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851878.1265856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuNz-00050l-FA; Tue, 10 Dec 2024 07:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851878.1265856; Tue, 10 Dec 2024 07:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKuNz-0004zF-BJ; Tue, 10 Dec 2024 07:10:23 +0000
Received: by outflank-mailman (input) for mailman id 851878;
 Tue, 10 Dec 2024 07:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKuNx-0004z9-Q2
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 07:10:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1284579-b6c5-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 08:10:20 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a2033562so47463995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 23:10:20 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:a58f:4219:ab5d:cf03?
 (p200300cab746063ca58f4219ab5dcf03.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:a58f:4219:ab5d:cf03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621fbbdd8sm15077691f8f.95.2024.12.09.23.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 23:10:19 -0800 (PST)
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
X-Inumbo-ID: d1284579-b6c5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733814620; x=1734419420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GTFiWN/I8jtMOqAmrEtbxysEib3F+04J/YUa2umo0fk=;
        b=QlrxDdZzWK9iR9WLZ5GU68NvUXmyGPpqAujLrM0BDz9OJUwmOgZla7IeW92XCeeuFx
         I3Kcu3oxlwE2B9YhPd1xcXPyXX5aC1XgVx7J2gMHzZDbjUyvoybzrCJ3EIrd8ZUlevs0
         mfAiYIu21KwjQSs2ngZrZYCb+7B0V/X/MG3q3RiH+wCO2Sdm80V2WtJ/x9L+YcZHW3nv
         FqPyJAorFP+DcfwOCdOdh6TvItG9wQEB8Tgfhsj+RbRHl/ZBDk+Hpw3hyJkSpwN9sfky
         C0h7lOUyXPJijUX518aTGLDNvrBcJm6yvcnJEmN2WSvtoTbAacNCmURZ9eNev4BEOUN8
         /K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733814620; x=1734419420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTFiWN/I8jtMOqAmrEtbxysEib3F+04J/YUa2umo0fk=;
        b=R0sFeO+U6mdP88xuNP9RmRJwdUsY2pyhP/HsF/gEvNFJSfVvDHg8SzU71bpAVeWchO
         V9C/ViupYp7E+vbfJGy5NHst5BTBwbEvhEWqpR1GQQE5yN4gPtcwDiHJw/C74buh/DB+
         1BBYEvKXMUd/Ljvj/TcTq4/oalKyY85vgAhb7Z2sdxzNgOoWYEkCQiwZ4vNmACIQ4Zh9
         FDCBeH2yDM9tI4xpjxVk8Ac507Vc8ZeUWAiac2rTjhKZxgca1WWvZdo+YbR09veFNFhY
         895nxB4VOmTG/cUA6zSE6iInqpkFV1kkvN/zXQcGnH6KvXGv6DKsgY5/jVBwi2oorTfS
         hC0g==
X-Forwarded-Encrypted: i=1; AJvYcCX6lsdcQaXQn+qJusS12GHjLvhKRgisp+qEqLTM3oPILv3Y0EkhXyKS3/POYRxfYj22BGr/CrXkyow=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+UX4v58DHvdOg2FEB0TaPpCHCEI5lFmp5IGxdcldXxqnWaLDY
	Kqwu9i/2TWVYeKe6rrR1hs5M+bhnbLxMjBg2vgtdEBOJD0HcTTws+W+Z3pWViw==
X-Gm-Gg: ASbGncuZcG5NABLndwvOIMSWEdL9imvgnjAYzGFTRqb/wW6RXocR7y1kpGWFp8xJxhN
	4It4KZyky4DuWqlUeNisLaCiqB0/7z4/jJrbAbAqwvRas635s2f2+E46/sQsWlF3LHL6+gLsJM1
	/o7PkysRvBlH3V+Hm6lJytUVmTfvHAflg5KCoP5s3VM8C0JZF2JGxCBnMDTJkJCSfVG6nst2oSi
	DruZNT312YglclAIzZvRYEAtgQiyjZKRWJtulAVKGvhRtYeSdO1l42/A9FtxPCBqZBnJLD1jl44
	IkrgJYxE3ozIMhqnJsbn98CG1hsqfKKlyBaNr+h8ztcKPgEuoPjH8o2jk/Yl254Rk+u1mOvHXZ7
	BgvSfjLbKaQ==
X-Google-Smtp-Source: AGHT+IFK3ouiAOtSip3qbm9FBgxbL/q8AUc7IXBS2WERI5zq9OJRqlUhGGTzsLahb8rfanUtxlGTdA==
X-Received: by 2002:a05:6000:1a86:b0:385:ec6e:e872 with SMTP id ffacd0b85a97d-3862b3cea1dmr13109617f8f.38.1733814620117;
        Mon, 09 Dec 2024 23:10:20 -0800 (PST)
Message-ID: <24731167-3af6-447a-b61d-b1985360a2fe@suse.com>
Date: Tue, 10 Dec 2024 08:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: Mention xl suspend/resume
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20241205195026.3523-1-jason.andryuk@amd.com>
 <638e4fe3-c346-4c03-a3db-2027986753a8@suse.com>
 <f2c8d9cb-d201-4136-98f6-4beb6654b997@amd.com>
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
In-Reply-To: <f2c8d9cb-d201-4136-98f6-4beb6654b997@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2024 20:20, Jason Andryuk wrote:
> On 2024-12-09 04:29, Jan Beulich wrote:
>> On 05.12.2024 20:50, Jason Andryuk wrote:
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> It only works for x86, but it isn't x86-specific.  I chose to add it as
>>> a generic entry instead of listing it as x86.
>>
>> Which probably is fine, yet then ...
>>
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   ### Added
>>>    - On Arm:
>>>      - Experimental support for Armv8-R.
>>> + - xl suspend/resume subcommands.
>>
>> ... you'd want to name the limitation to x86 here anyway, I think. Unless
>> there are firm plans to remove the limitation by 4.20 going out.
> 
> No, I don't think there are any plans to remove the limitation.
> 
> This seems weird since the feature depends on platform implementations of hypercalls and library plumbing:
> 
>  - On x86:
>    - xl suspend/resume subcommands.
> 
> Whereas this seems unusual since it's not following the above format:
> 
>  - xl suspend/resume subcommands (x86 only).
> 
> I guess I'd put it under "On x86" if I had to choose.

I'd be fine with either; neither looks more "weird" to me than the other.

Jan

