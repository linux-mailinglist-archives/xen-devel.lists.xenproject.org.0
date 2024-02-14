Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC085447E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680270.1058292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raB9J-0006vU-8B; Wed, 14 Feb 2024 09:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680270.1058292; Wed, 14 Feb 2024 09:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raB9J-0006sO-5L; Wed, 14 Feb 2024 09:01:49 +0000
Received: by outflank-mailman (input) for mailman id 680270;
 Wed, 14 Feb 2024 09:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raB9H-0006sI-P8
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:01:47 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id add02d99-cb17-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:01:45 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511a45f6a57so729302e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:01:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hi25-20020a05600c535900b0040fd3121c4asm1276799wmb.46.2024.02.14.01.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:01:44 -0800 (PST)
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
X-Inumbo-ID: add02d99-cb17-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707901305; x=1708506105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0ur9nELkuWSS0YY4di7Ol5dbQl/XWQkAoCQYw4HsM8=;
        b=CgUF6PMkHj4jyslE9Ujt5g7O12JOBK6Q+jSYaLkOYAVk2N//jvBBNvYsFdZ2guMw6n
         eK94HzxksKIuU/7MDUbRi2ALYiRPJeq+C5jJbsMfpx4MOs6Rdp8Jy99sHSoA+iX7M2GJ
         ZPQC0O/jSCnqUsQT07TXPQSFGu00LfEI72YxeLVNSdtaz6IuoQXTiAoLJlaaZAmx3B1g
         9AvUVgwXfM4gA2NfSAlFCVdDB+b6V7f/tA7Pd8OnIqMxdMYD20wmmLoza5tfdFOecg05
         Q92aLL/YkHdy70oyq42ggaJyHAFG8drdG0GgFIGNen5SDliXFku0FD5656EgL8qu5ubs
         HVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901305; x=1708506105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0ur9nELkuWSS0YY4di7Ol5dbQl/XWQkAoCQYw4HsM8=;
        b=YzzqX3QMDMFtKNC4N8Z3w3VB3VpMdsjdhcsGsHAPBtkvnyXxdh1jqrKpGT1rdIkB2K
         KQGU3WE4KqVfNpGfj/Dr343ExD/uyhYlNLKDkREKGUklJnubZktj7n6yn/eh6bilFWso
         k/JZi+ILTc3wUzodp9qSG2Y3JeGaK3XU4cexU36juzozgAgoCz3wYhjuviUvmQ7cEpz5
         3fPwung8a0QTsNUnruav80of3BVMeQikjSatZPtnIwYWruhvcRmnPeoFffiJxZ8hPrpH
         Qc/LXVBh07ce/7/QloVFz+tdN6Z33dAkBto9ZbZ+7Noms2houLuTvYg0FyiyRPbfqmK7
         gApA==
X-Forwarded-Encrypted: i=1; AJvYcCWl7XGsFuadZF2LoyZvwQyOJb0hjTNmaHGUehBXTmGAhtSo6ZmZyUXd4BmNOxejr3jgz8XHfDhmiXV9P2VtJVJGdCQGQNp1dJoGlqqtIBM=
X-Gm-Message-State: AOJu0YztFuIWfujnjyyUnth+qxrGa4OS9RLmGHBdJPPRGKZwecbW9kCJ
	kxFicFX+YQNP9ZYYmrWBOdwJITZ4V4JuXw7XB7Pg7Z81qplW/KFl9g+x7S8L7A==
X-Google-Smtp-Source: AGHT+IHFIFktTo3watGZnMVNWV8V+fi0IZlCpQIqRa2rZDhNnXIvNAt6/dEk023SkjPqJYIqdFv06g==
X-Received: by 2002:ac2:5e8d:0:b0:511:5537:fb26 with SMTP id b13-20020ac25e8d000000b005115537fb26mr1532705lfq.39.1707901305139;
        Wed, 14 Feb 2024 01:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKtHMzFPmTacNM0Q8yxgcyTf7HpN/58W9N2pL/IllLC4GHcTv9TxuNJU8c8Cm+rgpl3yOg5bs1bKZM3HGALBhXiFf1T5GBCz8Xuz5KRuSAEuFu9I8sSm4Z1ifcZoW3XaJ9j0oZ
Message-ID: <790c81c8-04f4-435b-937f-87fa1cd54998@suse.com>
Date: Wed, 14 Feb 2024 10:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR
 checker
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com> <Zcx9w5eZkXiN9s66@macbook>
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
In-Reply-To: <Zcx9w5eZkXiN9s66@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 09:45, Roger Pau Monné wrote:
> On Wed, Feb 14, 2024 at 08:45:28AM +0100, Jan Beulich wrote:
>> On 13.02.2024 23:37, Andrew Cooper wrote:
>>> It's very likely something in this series, but the link to Intel might
>>> just be chance of which hardware got selected, and I've got no clue why
>>> there's a reset with no further logging out of Xen...
>>
>> I second this - even after looking closely at the patches again, I can't
>> make a connection between them and the observed behavior. Didn't yet look
>> at what, if anything, osstest may have to say. Do I understand correctly
>> that the cited log messages are the last sign of life prior to the
>> systems rebooting?
> 
> I've found it:
> 
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
> 
> Should be:
> 
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
> 
> mfn_add() doesn't modify the parameter.  Will see about making those
> helpers __must_check in order to avoid this happening in the future.

Hmm, yes, it's not the first time this has happened. But even seeing the
flaw I still can't explain the observed behavior: The system ought to
hang then, not instantly reboot?

Jan

