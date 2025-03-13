Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7FA5EDF2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911443.1317875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdsE-0004z8-ON; Thu, 13 Mar 2025 08:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911443.1317875; Thu, 13 Mar 2025 08:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdsE-0004xO-Ld; Thu, 13 Mar 2025 08:25:02 +0000
Received: by outflank-mailman (input) for mailman id 911443;
 Thu, 13 Mar 2025 08:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdsD-0004xI-Ge
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:25:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7655fe0-ffe4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:25:00 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so130543366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:25:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147ead1dsm53210966b.58.2025.03.13.01.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:24:58 -0700 (PDT)
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
X-Inumbo-ID: a7655fe0-ffe4-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741854299; x=1742459099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pr3i/ysPDB/VwmjHcYlP8Hx9b8dFXnEP/r2glIoXiuM=;
        b=Ef3WT4iaD1rbeD0LloBhqnVO4tfbbJD/kjjoHwR+6MxtLXYZFaSzA9s3X1X+n0RrbL
         xx0Ej6BmuudyAV+V/QS7OdiG469WPB7gTJ1wVjrcZPuey5gyx+ZeMdx6eA5cwP8F37lH
         kEReqY5iP1q12BMZWBr61ugPlRU2ce7NPHMMHnN+Siz4XIITWGAuNcCgCswRzSRNlHN/
         glPXYB3Yv/r8oVdi+tDrVhE4q2TUaGTNhv/00B3fAHGdAfA2Twx0adMJ7ipKVMwCvd1R
         WbSAWXRQaN3OoyRFoToSYjVDzNGKySsfPnAOQzt+O4ShEt9KRYJTdGmSt1Cc28ljM4bS
         GyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854299; x=1742459099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr3i/ysPDB/VwmjHcYlP8Hx9b8dFXnEP/r2glIoXiuM=;
        b=WD6TYGjYfGaxMLR3zpAkn1ti30FVKtcsz81Gm413dXw9+HLEleavtc3A/xKVAtUlw1
         ChOo+upuaphkqFUDYsAMEiC+T8CL78Y1T8m44H8fhEUnHkdqMuumssOI6is8Hhd+Fo6Y
         obkplUSpha6TSH3TIA2WVJZ6iBatjEvNICM6fXziaMo+vnm1ZgUdQFaOksSqyJT0S5/5
         TCOdedo+4xIV3nM6w2go7ShcOhxn+k/D4eHQ62IxV9kjTUULgqZlCnViRjxEC86SuwXY
         IFnqzloyQBWa3tsmYGb225aonyV3DZdp5IKl6uM73nGLQOf9ITh/lWWtcoaRdZXhlki7
         vsEw==
X-Gm-Message-State: AOJu0YyGkV9/R2vj5cQdpnh0J+YSNZyyzDpmO8bMa06+E5sUkbN1JLWh
	IYWUOdfuFWUlQFHQ3YvrsnfmpLJizd10JEcRYmPpluw8RdELsSaihwHO7xLxVQ==
X-Gm-Gg: ASbGnctI6+qWsDsMjr6yQq28Da4gaG1SEylQPHfyp4HuA4JAmS5rJn8PBuq2VASqG3w
	TYswLahTGmPHqsSf9FIkTcjZWQrHYWm9rBSFGoofKMuXeXGmKzX81h2VYjGRKVLXYR+LGnba/s/
	aVzW5PEbHhxfj8Q2ZJD1svlrdtDpj22nL7JzzI8PUvSHtAuml4VEGn6LZab380w//gtQ/7B/ZIr
	eN7L6LahCJGYzdcOd7kwT2lQtE9x7faOpwiIrh1g8NwOHXqlVxfngDA01mCKtNfzjBtFBzZHP/S
	hIrQmfcvmkGCdjX6hJJTeTwVRnOg6ytyUPI+JHhfVwsbtBRU3tdBMJDsp5T+iGPLbxq1xZPzjt8
	9w1kbWlDzZdVGrNkPQ7yaXRm8o8vhrrgrVQBGPKg6
X-Google-Smtp-Source: AGHT+IHwPphU5EOAIoejI51/L2SoDy+98ReHIFo7NvtNULYcoY37a+vTnfGHHF0ojX3f6ahOTXiVPQ==
X-Received: by 2002:a17:907:3f9b:b0:ac1:ffde:7706 with SMTP id a640c23a62f3a-ac252697d79mr3219081066b.25.1741854299397;
        Thu, 13 Mar 2025 01:24:59 -0700 (PDT)
Message-ID: <30c2801a-3738-4834-8dc5-9d4b5465541d@suse.com>
Date: Thu, 13 Mar 2025 09:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/19] xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-8-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503121613300.3477110@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503121613300.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 00:13, Stefano Stabellini wrote:
> On Wed, 12 Mar 2025, Penny Zheng wrote:
>> The following function is only to serve spinlock profiling via
>> XEN_SYSCTL_lockprof_op, so it shall be wrapped:
>> - spinlock_profile_control
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Similarly to the previous patch, could be make CONFIG_DEBUG_LOCK_PROFILE
> depend on CONFIG_SYSCTL? 

And like there this also has dedicated debug keys.

Jan

