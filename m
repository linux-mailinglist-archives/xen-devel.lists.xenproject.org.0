Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BEB9DE1C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130090.1469726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gb2-0000RW-Jz; Thu, 25 Sep 2025 07:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130090.1469726; Thu, 25 Sep 2025 07:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gb2-0000PL-HL; Thu, 25 Sep 2025 07:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1130090;
 Thu, 25 Sep 2025 07:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1gb0-0008IO-W4
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:40:54 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77b2a8f-99e2-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 09:40:54 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so933968a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 00:40:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a36508a9sm755444a12.15.2025.09.25.00.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:40:53 -0700 (PDT)
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
X-Inumbo-ID: f77b2a8f-99e2-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758786054; x=1759390854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t8MPA9oNypKPaWXdVSX9BKS3bRKo1OjXaFYTtDNO6SY=;
        b=SaiTazicThNxGT1D+tj9l8OV2uXV/JEwOh32WqMn7+yWbFnxh94RnBwYxzKmT0/kng
         42JWsMyL/2g/SF3jKhd4wEKw5YL2oPw7BP4R/rzoQE1QutYACEcdHZCeOXRsXKe/m2WW
         5uCPTJ3hWEljhcCuq3PoxfQoTzxEZ/wczZMoI8IHG1VSeFROBwSsWhRYtqG3ddR+ayi0
         rK8zyiBmsaDNi5JpTFexr1KS9imbKWFoQClvNZNFbSjCx35tm8fBG03ZKnRLZLBtVLSH
         dc5DWH2Q9kvoXKRsmDMaOr8J6rR8YUPWIlNBtHNWDFnAsTZd5qoqp6gteZ3mZjUfp9TG
         S1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786054; x=1759390854;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8MPA9oNypKPaWXdVSX9BKS3bRKo1OjXaFYTtDNO6SY=;
        b=My3JuFSGSTFCQ8+pcTK0Aqhrn94pQaFfOoNFVnnw6ayG9h+CusVlyFz5Zc84RQ+4FL
         NLv2rJlIhjNa5nc/U3lz7LLOlR5N+yUBC0hpWpSFwuVKOzH9OE1FXDDz6uyt/ADEetTC
         uPfj4BdwHf74acaGOQ3LzhzeNEBxI0M4I/ujnGYF1oerZcaSeJGU0gkKSzlBnL9V5T98
         GQoBR90Zb15UrOQ/k4jF+RaUNkw+dRcrGk50HX7cEVeUAyPV82bB8kHIRKBOhuIRINzA
         Gcv2Ik9llEVEAB8vJzk+4uR69dRXnP8fnby66XT0V0ybZ0H/j4qu3ulbo5RrNchcGVua
         LjCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCjjhHYbDJGVEPpKFo72tmZ13Nn4OVGKk9RgwIF3UaS2/ngoZLw6Qyy6zgKuzqCFJWV/Hz+LqapbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYUjhTo9IAzuldsulHjzBY6s6mholws9SLQlynECYUvVOJoUFF
	NkjdxPAOaZw1SnJGRQFZrIBu2O23nlXuwQKkkEQldXefzleT/Zk3gzJ7/rVUNlFFWQ==
X-Gm-Gg: ASbGncudAbWzqw2O+5cqlOs/uA5M+huoXXx7AhgAcHnJb8F80Ed8Ak+S2wPgKDwEM/b
	UWfx+cceFjnTeV6S6v+eP7pj7Nfi0D3ulpuGPEI4ggeSmbWl/6OtXwWaXN+AT21DtFdEt09IEQ8
	1+Obhn8JpwU++lJ0B5G5w3o2ckiWB3EuPJMzEH8pfxS98c3VadSdN87TVgqi9eZUiQGD7Qri2wW
	HVjcquYyFCZcdXEiG4EuZRHxBmS1MuVZ8rGW1ohAkZ0WgBhW8U59kYhlkTWPkFlIWe+DIDTuDMw
	DjuIJ5AbSxhSRPwPBIoaZ/0MSMyDNfECgNBInHZT60DESFlXIZoELMlves+W4+yBoLsr9u9c8ya
	Uya3QcIA36ncRCjm0auBpJrzn5nt7F2XprMskbjNMxEhyVaNDTzHVWCBPoN5039VbDghZuFR1gV
	qYJGHg7Gc=
X-Google-Smtp-Source: AGHT+IGTLbsYatgm8H2Dh8n9o7FDaiecRvtS3c8jPjkduVCnaK2No5O36cwmsrsK2dgjRTDTcfIewA==
X-Received: by 2002:aa7:c543:0:b0:633:b513:c5be with SMTP id 4fb4d7f45d1cf-6349fa24029mr1728764a12.14.1758786053675;
        Thu, 25 Sep 2025 00:40:53 -0700 (PDT)
Message-ID: <3855eca2-2961-4ca4-8c26-f51ceae70e9d@suse.com>
Date: Thu, 25 Sep 2025 09:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
 <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
 <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
 <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
 <e599c29f-03e4-40e7-99df-33b7f2143fbd@suse.com>
 <e246c2ce-dddf-49bb-8013-cbc302fe5ff0@xen.org>
 <1110e604-0eeb-4786-a829-8f92280b7dd8@suse.com>
Content-Language: en-US
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
In-Reply-To: <1110e604-0eeb-4786-a829-8f92280b7dd8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 09:26, Jan Beulich wrote:
> On 12.07.2025 12:37, Julien Grall wrote:
>> On 03/07/2025 11:04, Jan Beulich wrote:
>>> On 03.07.2025 10:52, Julien Grall wrote:
>>>> On 02/07/2025 14:37, Jan Beulich wrote:
>>>>> On 02.07.2025 15:18, Julien Grall wrote:
>>>>>> On 02/07/2025 14:06, Jan Beulich wrote:
>>>>>>> When the bumping by <nr> (instead of just 1) was introduced, a comment
>>>>>>> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
>>>>>>> code path can in principle be taken (depending on configuration coming
>>>>>>> from the outside), and we shouldn't assert anything we didn't check
>>>>>>> elsewhere.
>>>>>>
>>>>>> I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the
>>>>>> overflow is not something that should happen and it is good to be able
>>>>>> to catch very clearly in debug build.
>>>>>
>>>>> But catching an anomalous entry in DT (which aiui the values come from,
>>>>> even if perhaps indirectly) isn't going to depend on people using debug
>>>>> builds. It depends on what DT blobs they use. And issues there shouldn't
>>>>> be checked by assertions, as those blobs live outside of Xen.
>>>>
>>>> I agree we probably want check upfront. But I still don't think we want
>>>> to remove this ASSERT_UNREACHABLE().
>>>>
>>>> By the way, I am not asking you to add those checks.
>>>
>>> Sure, I wouldn't even know where and what. I can re-send just the comment
>>> change, but that would feel wrong as long as the ASSERT_UNREACHABLE() is
>>> actually reachable.
>>
>> I am guessing you mean this change:
>>
>>           /*
>> -         * Count ==  0: Page is not allocated, so we cannot take a 
>> reference.
>> -         * Count == -1: Reference count would wrap, which is invalid.
>> +         * Count ==   0: Page is not allocated, so we cannot take a 
>> reference.
>> +         * Count >= -nr: Reference count would wrap, which is invalid.
>>            */
>>
>> If so, I think it is still valid regardless whether we continue to use 
>> ASSERT_UNREACHABLE().	
> 
> Yes, that's the comment change which is valid regardless. My reply was about
> the dropping of the ASSERT_UNREACHABLE(), though: To me, dropping that
> change simply feels wrong, as it was put there by mistake at the same time
> as the comment was left unaltered. So to me both changes still go together,
> unless by a patch going in earlier the unreachability of that return path
> was indeed guaranteed.

I think we want this sorted for 4.21. I'm happy to shrink the patch to just
the comment change, but only if ahead of that whatever other change goes in,
making the assertion actually legitimate to live there.

> In fact I guess I should have added a Fixes: tag to the patch.

Locally I've added
Fixes: 5951b856d8d0 ("xen/arm: introduce put_page_nr and get_page_nr")

Jan

