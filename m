Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05938B10DF5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056197.1424388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexE8-0000A6-SE; Thu, 24 Jul 2025 14:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056197.1424388; Thu, 24 Jul 2025 14:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexE8-00008Z-Ox; Thu, 24 Jul 2025 14:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1056197;
 Thu, 24 Jul 2025 14:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uexE7-00008T-PF
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:47:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190c3756-689d-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:47:18 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so9269375e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:47:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcb8182sm2399101f8f.56.2025.07.24.07.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:47:18 -0700 (PDT)
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
X-Inumbo-ID: 190c3756-689d-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753368438; x=1753973238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PmirxZMk/GNXueAvFkRVmx9t810MKr6nMRzZRPm5nnQ=;
        b=EOSnmdv/Amc6mqJjbRBtmNOeAkF/F+yY97XxQQfFL39Ss3gaEHwVm22t/lVxpm3E5+
         c9JstMUVheehuWYQUIY2CEKKVdbw9O9VtUNh2SF+5LWUOmVMACdP1cxN6WlyyJcZpNBJ
         ZYu8y6ukh+QJKVL8Lkmz1PHfChmUK1z9lZDf0w0Yg+YncjO8kad0LOokYPvdpP9sH5b4
         994guTwOq9SPnqgXIcJ+ee8b8G5kVvr97ZZK7lkN40EXd4sSFdAwJ1bSZqR+XHcr1YY9
         14YCkktvoRkqQO7URMoAvBHY9j96kUQHvf5fcgJggRQ7f5c2d9kjkKJRanpJmyGa0mru
         8e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368438; x=1753973238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmirxZMk/GNXueAvFkRVmx9t810MKr6nMRzZRPm5nnQ=;
        b=RH4MOO3RbIi8sGpuJ4wtP4XP2LRg4fzEBW6ti0/M5A6DAdJokcdupy4jcYGNGZQ0XZ
         c6R7KUT1oLz2/YkWQB4vqJaRrg9uaIFsKWo8J5s0BziPxQ76d230lyxWfQWxJY0QsHTF
         BEiMO0ZuadwacrlVCPSX7sIl/oplmtZWM+iHixJWbVlDuD0692HObu8i28tHgq8Nin86
         xcvF/BAtRi7HMcWSHuJAmO+Lk7NcXaC3yvmugYMYEVpKxnu7cSe1uVqMQsEHKdtqCmzm
         JQE6cySmtSHuURoCWag6zE5+i2Ur+INwyY3QF2XOj9kVSwmpoQq98769M1cvMa9C2/pd
         fBOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHImz0VVWeYF1111nns7o4PJ9fzR/3VsFEIH1hZBRzSB9Qw5Hs5FBgFIOhCu6pY9+5drhAkeZrho0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA9tVJIrlbI+t3ayPB2ofz7uZz1LJki2gtuxIWxPaFmqOrBfEv
	or1cWOXmVizcaUCuPSl/G2+ecZmxJ0kqZVzDlmQg5dZnAZO+m0XasrQJqWvNBUh6iw==
X-Gm-Gg: ASbGncugEy39Iue1MGpVG3LAXnpEtZPV4RJ/Ho16oyDeWLMwstNQBPf4QV9ZAjbQyWp
	zoetr2yEoqobaiOBk/zn+m+HvlW9jeAzp698n8JhKp2yFwJxh7hxrvpuBeaUknQFX2RXnU7SSRx
	ZJ6MS0UKt3OsWFVhbT6EiSUjzlJ0AKFwHa3wxv/n6gOFHObFf0MqssN9OYMquupuxY4xhVITZ7O
	9Zqk59qNOi7Z0dPM06D1yEc0EloyKT5InQQrZwRHdqXlpwDm3CZnWxlgMm7R3w3+kfC2zM1OSLv
	hDIOwlZVNh698qOzDPwcV7fKX5K09OacLIddeOp6stEWUaDrsuYUZKQESgI4INcQZG0kzl6YLNQ
	kmWSc0aX6cQ3A5pK5DzLlLYhFDBiuRbqtegsjHQWcOlTGQRww7YbZuOK6365wpSwAKAQsDgel9i
	uSqqhkW0L2LuivGolIKg==
X-Google-Smtp-Source: AGHT+IER/+8yMY1MAZxZ24OlyOJCLv+rZpKCaff1D2dMLq795vPTZNFtDChLUmRIWJTnhD5Pigj89A==
X-Received: by 2002:a05:600c:4f87:b0:456:1a79:49a0 with SMTP id 5b1f17b1804b1-45870547e37mr25768555e9.8.1753368438309;
        Thu, 24 Jul 2025 07:47:18 -0700 (PDT)
Message-ID: <4e857471-e72c-4cfd-bd6a-174967d51a7d@suse.com>
Date: Thu, 24 Jul 2025 16:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-17-Penny.Zheng@amd.com>
 <87d9d5a1-39aa-46ca-9f2a-9169a2ef7a6c@suse.com>
 <0642628b-0cbb-4f7d-bc04-9f32c67b5965@amd.com>
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
In-Reply-To: <0642628b-0cbb-4f7d-bc04-9f32c67b5965@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 16:17, Jason Andryuk wrote:
> On 2025-07-24 09:31, Jan Beulich wrote:
>> On 11.07.2025 05:51, Penny Zheng wrote:
>>> In amd-cppc passive mode, it's Xen governor which is responsible for
>>> performance tuning, so governor and CPPC could co-exist. That is, both
>>> governor-info and CPPC-info need to be printed together via xenpm tool.
>>>
>>> If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
>>> out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
>>> make xen_sysctl.u exceed 128 bytes.
>>> So we introduce a new sub-op GET_CPUFREQ_CPPC to specifically print
>>> CPPC-related para.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
>>>   void scaling_max_freq_func(int argc, char *argv[])
>>>   {
>>>       int cpuid = -1, freq = -1;
>>> @@ -1576,6 +1622,7 @@ struct {
>>>       { "get-cpufreq-average", cpufreq_func },
>>>       { "start", start_gather_func },
>>>       { "get-cpufreq-para", cpufreq_para_func },
>>> +    { "get-cpufreq-cppc", cppc_para_func },
>>
>> Didn't Jason also suggest that we would better not introduce a new command, but
>> rather make get-cpufreq-para invoke GET_CPUFREQ_CPPC as needed? Considering that
>> as per patch 15 the same information is already printed, I think I'm a little
>> lost with the need for this separate operation (and command), and then also with
>> the need for patch 15.
> 
> Yes, but I thought I was repeating your suggestion, Jan :)

That's what I tried to express using "also" ;-)

Jan

