Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FEA90685
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956376.1349813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53nx-0006Qx-Tl; Wed, 16 Apr 2025 14:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956376.1349813; Wed, 16 Apr 2025 14:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53nx-0006O3-Qw; Wed, 16 Apr 2025 14:31:57 +0000
Received: by outflank-mailman (input) for mailman id 956376;
 Wed, 16 Apr 2025 14:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53nw-0006Mc-Bl
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:31:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b94d9f4-1acf-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 16:31:55 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so71837805e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 07:31:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9777absm17064754f8f.46.2025.04.16.07.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 07:31:54 -0700 (PDT)
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
X-Inumbo-ID: 8b94d9f4-1acf-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744813915; x=1745418715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q7xumUT/zjCR8C7rtHK77wqHNCrkpACurw5wPBGetJ0=;
        b=URXkwwlP14NwIfVeD4erwxNcW84IxF7Ra8GvbnLmTdKJfqTjj1omIn/pOxYiXiAtfL
         m4+I6q8Coyeshskt19cQkhoW/T0HincFGgyfml13Czg85jLyq6Lgr5Op9Qcc9fKs2erb
         LQvQUSgWbFyrduroKAvLA/kRvN4ayWLm28hq1Z2oJ2otcujVdp4+aqzjDi+zcEeZTROX
         ag6yyCmt5BZPJTILmwvirbhHEs6DslM0R/dA599Z/9QHbow2FHc7M9e4GwxcIWTmYieq
         v922mgzpz3fmoO6yPUGFvGmhmoLtjuTU9Wa4SONLxkynMQXDDNQeQxMi2e36mYlcIpPs
         FqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813915; x=1745418715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7xumUT/zjCR8C7rtHK77wqHNCrkpACurw5wPBGetJ0=;
        b=byOSCidm0qcj0kS58BIs3vKy4XDHBQlsBMB9nnXSYO77/zkvwvU2fd8V+qoKRZpkfZ
         hcOfBTNB6d0hXDsjIG3cCSeBu7ZhOAF7Abm5zBseIsn/CILb4eFHtQ/MkCyqKLSoJgDc
         QiQVOZWw4Zz8ERDkGllDVL2QXiZsj4uYAQ/z4R5XYKV7SU1LfpJA1mcSB3GOTVndE3Bv
         iycXAPvKPHN5cRWEGWr2gnlx1d5PElQpKCcGBS0RJ9xNCX6SVmKRXDjNWMBhEEKIh9lU
         IDC4QYTKw7DWPljG8VdqFl8qVHSbj+Il3A9q7Hwu8GNsqcf7rEAa1B1Mvj6XNDo1xleM
         P2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYl+tTmVm5vgMdijCYlwzar8yd1jCIvlvnNyCRX1+fbOtDLyfyaIBHPuRVyS+FIdHN7KFga23y/UI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySVQAqhGZ1HcSByViKdxBiaGdmTpHJmIH66IQQpwYFadNo2SJN
	KtyzLhHLBt3Ky/HNi7a8U3kv2MbfUS/+eyJaiuQZz+rvZiZgKXODVIMq/VdRzw==
X-Gm-Gg: ASbGncvNYylGyyiK4jCisG9R8XVSX10GAfFiPHk/6ST4KHRsJTH45VMBinASjVd5Kes
	tNofP3bB5j38d8+FcjRq0v7DNtNiHdodyRhpFEpiOIfSMqIjJBorv6TcQPwrzfjGnbAW2TbdKAB
	1lNi5vLFR2aSyi2Jk01XWH2x35PHOdA61goAEho6DCKxrddQ+eVklHGd7caFswVhQNlq+3RELmL
	O2S9k/AT+IgAAnbu9I+RPIFNevldr1XkINWaicbxbmP7yV7e6AWNW1FsJX++kohwqk48hF3yuwf
	4TIJ61bxjEsuRnOpO5+8zeK73ns/jGTP7kVelWQEg3Bd0/cOt+qh+w21yYiaNrRAi36GfHobWvY
	E+airl+15gH2sWDx191gOaW6Csa0Lo/DsNtVg
X-Google-Smtp-Source: AGHT+IH1CSr4Q112Zt+BY99T55bW3z+Hp+xPEb1Kx9H1BTPdnZlZMk2pybvbUI9lHui6/3MXqguiEw==
X-Received: by 2002:a05:6000:40c7:b0:39c:1257:cc26 with SMTP id ffacd0b85a97d-39ee5badc09mr2166657f8f.57.1744813914640;
        Wed, 16 Apr 2025 07:31:54 -0700 (PDT)
Message-ID: <cde3523d-b163-4e18-bf40-856e80df8b0c@suse.com>
Date: Wed, 16 Apr 2025 16:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-16-agarciav@amd.com>
 <c1e5af91-8f84-458d-a9b8-ab9758b5cbce@suse.com>
 <5a674e65-77bc-4d07-a4e3-2fa2c96bb37e@apertussolutions.com>
 <71606cc7-8d9d-4b6b-ac64-bb7bcc54eee1@suse.com>
 <fc3dc57a-523a-4158-9335-026b028e2bce@apertussolutions.com>
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
In-Reply-To: <fc3dc57a-523a-4158-9335-026b028e2bce@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 16:19, Daniel P. Smith wrote:
> On 4/16/25 09:54, Jan Beulich wrote:
>> On 16.04.2025 15:42, Daniel P. Smith wrote:
>>>
>>> On 4/10/25 08:08, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>>
>>>>> Introduce the `cpus` property, named as such for dom0less compatibility, that
>>>>> represents the maximum number of vpcus to allocate for a domain. In the device
>>>>
>>>> Nit: vcpus
>>>
>>> I agree with you here, the issue is that it was requested that we keep
>>> this field in line with Arm's DT, and they unfortunately used `cpus` to
>>> specify the vcpu allocation.
>>
>> You misunderstood, I think. The comment was on the mis-spelling in the latter
>> of the quoted lines.
> 
> Then your latter comment is that you want the internal field to be 
> renamed to cpu?

No? Where are you taking that from? My comment was that a log message refers
to "max_vcpus", when no field / property of that name is being processed.
Going back to my reply (and seeing that Alejandro understood what I meant,
afaict) I see nothing ambiguous there at all.

In any event, ftaod, there were three entirely independent comments in my
original reply to that patch.

Jan

> Wouldn't that create further confusion of a physical cpu 
> assignment vs virtual cpu allocation?
> 
> v/r,
> dps
> 


