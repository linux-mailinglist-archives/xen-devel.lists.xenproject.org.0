Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EC956AC6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779606.1189312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1RX-0000sE-6c; Mon, 19 Aug 2024 12:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779606.1189312; Mon, 19 Aug 2024 12:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1RX-0000q0-3o; Mon, 19 Aug 2024 12:25:03 +0000
Received: by outflank-mailman (input) for mailman id 779606;
 Mon, 19 Aug 2024 12:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg1RW-0000pu-0x
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:25:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dca9371-5e26-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 14:25:00 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5becdf7d36aso2996016a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:25:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5beef16a9bbsm1888619a12.57.2024.08.19.05.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 05:25:00 -0700 (PDT)
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
X-Inumbo-ID: 0dca9371-5e26-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724070300; x=1724675100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IaNKqlOguBm72gTDAQUaaq6VKtkqgB0dJSIk5iGSdrI=;
        b=TGsHBT8968fYysXjI/scTadjCL7ms1HtpYeK9DHDK1HSWYcKjZLKdFChwHCjXxf5oi
         c6gW9LT6GOjB0HbKbsS1j389sYrZk/fZWRmS/UCUiuaLUC8a4oCDBcmstp5lRQMRzmbh
         KFuKmRNk2k6UZG22xzM8LwXdMKOXNJHTrtvoizNLptf1JLbdcLto8LIyhlpfS45CdZm5
         eK91kFPwLVn4mybCShrwgcpLFHZ36XhyezCi3NgT9eQbLl4pDZ4UXbzXU59x1xXDtnZg
         4H9j+DMKCtVzh8IgNOYcLQuEThSxr2tAFLFFycgGSm8di3vt/GcDBa5Ef9ZmQ6tEcWkS
         O7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724070300; x=1724675100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaNKqlOguBm72gTDAQUaaq6VKtkqgB0dJSIk5iGSdrI=;
        b=J66jufrCbe9z4YlcKzz99BiY6zW4ejgqCZUI0KFv/kFlhkAsyIQN2Mop55gPgqTV0m
         ilq2ZOkrEpfFTygwOT7cdsseOEZJfodN84d9mjZ6Sq8VxwIixMKzm9tkpx6a+xB0UYe+
         FT0o6Ij6cGEDD9+56xTxvC+U8qChe0Qf9ImQPgqOMPsqtbRczXz/Y2lmIowMuQ4X6+06
         RLhHN0xBjTc8ndUFVxFQ07gGpkDm0KjcrPfnH+DxnmrAbkt+K8la4vos4vkhIOduL95P
         y4YIoE3sPaK+udBkoKBKUHY9Y8FX95emhlx3io4kU8fjplbEwH9lLxsb3haNVm7rI/nL
         YiqQ==
X-Gm-Message-State: AOJu0Yz6jwMr6M5UyE5MVwmcMKucELnKtSEKfxZ/MH4/12Hrc8nHw9ut
	9ivWxt54LJpKRVkHCgr1kqmQicURtx8FZO6J/nW95o/fmNgbPxcs2o1fC7LYNQ==
X-Google-Smtp-Source: AGHT+IEg0g7fr1hhWr4ZAd1aEWGIB2G/REpDomPh8AMppDx+8thlR67ab7Yorb3DcyASvESBgWyFRQ==
X-Received: by 2002:a05:6402:5290:b0:5be:c5a1:cc6 with SMTP id 4fb4d7f45d1cf-5beca7959eamr6585334a12.34.1724070300328;
        Mon, 19 Aug 2024 05:25:00 -0700 (PDT)
Message-ID: <759d5d83-b09c-4853-8ec0-63a19faf8af5@suse.com>
Date: Mon, 19 Aug 2024 14:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
 <ff48fff8-a659-4e63-8e1f-2385a936ad61@suse.com>
 <826532b8-1618-4246-aefb-d5315b877d6b@xen.org>
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
In-Reply-To: <826532b8-1618-4246-aefb-d5315b877d6b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 14:12, Julien Grall wrote:
> On 19/08/2024 12:39, Jan Beulich wrote:
>> Guys,
>>
>> On 19.08.2024 11:45, Ayan Kumar Halder wrote:
>>> On 16/08/2024 17:40, Julien Grall wrote:
>>>> On 14/08/2024 13:33, Ayan Kumar Halder wrote:
>>
>> mind me asking why I continue to be on the To: list of this communication
>> between the two of you?
> 
> You were involved in the review and AFAICT will still touch the common 
> code. I am happy to remove you from the conversation if you are not 
> interested :).

That wasn't my request though. It's fine to keep me Cc-ed.

Jan

