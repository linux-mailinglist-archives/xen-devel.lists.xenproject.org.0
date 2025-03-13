Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60FA5EDE9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911433.1317865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdrD-0004Th-GS; Thu, 13 Mar 2025 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911433.1317865; Thu, 13 Mar 2025 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdrD-0004RQ-DG; Thu, 13 Mar 2025 08:23:59 +0000
Received: by outflank-mailman (input) for mailman id 911433;
 Thu, 13 Mar 2025 08:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdrB-0004Na-5L
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:23:57 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81afb968-ffe4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:23:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so130962666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:23:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a9d208sm51396466b.169.2025.03.13.01.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:23:55 -0700 (PDT)
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
X-Inumbo-ID: 81afb968-ffe4-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741854236; x=1742459036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q9JMawlGe2/SeOILA3AYbGCQNZJWnwhD/eqnGmMvZro=;
        b=Ia6mtUo4A1WMDOSOly5/uNfys0NgsucKsRb0qQxrBMDMOTZ8fjx3AHLKjA3HdKisPp
         yLAncVEZ+HI5O73Qvi5zICx0gTVOIJTwA2QVPqRYvmrsqjqh+Wa05Uxwaw8GTPuj0DFG
         ctYUVIHRyst9xLcdSIetGatIYByDa9zNiz2Z5C2M5HLBZWx4kdLO0G44MvV++F+luBHg
         yJTJbBsr3CzYCwkGo90gNbic2i1tPxMLPCgm6547+WSrwoJUrVbLWve0Fr/d6snJN6Uy
         DMHALIn3ONXGCIny9wFKs/3f9TLbvyUQZnFllxKfh7BHGCC/t+uSkImBzVbwlyvYldf6
         3KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854236; x=1742459036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9JMawlGe2/SeOILA3AYbGCQNZJWnwhD/eqnGmMvZro=;
        b=GjBfGpsHU/acdRNh7PBVs6RvucPfHwVT2P6jX1Sp+sD0j9TCDcU5JOr9AYcOutj0Ay
         s+5nXdQd10QKDV5XwgZt0nsZPutt7/pYprkxYVvnBJ5kLM3aBnsVTY0ZLWU6Hw2BHSy7
         RE7Gas85Y4p25XNiJdYBgXaf8ut+ZaSTIdRcEEfVTGbOOYEKJQxs5Xk7CtwiFTbB9OZM
         m0yw7bB3d2V5IdfMhIJ29bFtFU0FfdMn2U8xommyb+RukS+zMBppjaUuoaKmX5Ay8+fy
         by9UMPIjJvfV1J+lcmaAk4SaFr4T1WaAA+RDiLQ3HN1DDCvOm8SUE9y0sFb76h8TkGXZ
         WeuQ==
X-Gm-Message-State: AOJu0YwZOBHN6lXg43X2OofYLN/9YiEZeQmIh3IDW/NvWRCBmvNyS+I4
	2tCos6Zmp3eHio4/lENczU5OuSSBU8vLlrjSfuhvCHrVl3+/byk2Zbl/XmXX3w==
X-Gm-Gg: ASbGncu5xmVHusrfsRNJr65omw59VeJiDSSjAsD1uwrBlUNIhozg94RWH1/lYx1I9An
	/MFYPANMQfp8nfdP7dg39MDDA7/qLqgcDrKZ074xs5aFSBsdgf2x69M9eqCGHVHb2JkjZWaEkMb
	wJDh1bMkfy7406WIX7RDVt3uTneRxOeZvTUv0/2YqDktM8Mlo3nGJUqWC+ar96wdZY0+Pzi1Ozn
	/+ksxh+4Yfwbk4yRIltIN8RYxFLAgC/ysVvdkqqbju6sGWa3Gf3+vmzoPpCt54UIveFfPV8M6+Y
	qZMhef0qvi5ohVNRfWzptkeWCqoAlPX8Wp/deU/GtqP+GAbsWZU3dHk+GEOli4LC5kAu1ouk1uZ
	qAAx4dMijSZb/9Bw1MMebAW7iGDEQJg==
X-Google-Smtp-Source: AGHT+IHgqz/Odtrn3mmwnn5k2LIZA1SYc4uhPHi9TEcfpyzCRS3Be4hrUMWoe0z0WrfyEUNiBY5biw==
X-Received: by 2002:a17:907:6d0f:b0:ac2:89d6:9123 with SMTP id a640c23a62f3a-ac289d6a156mr2249049066b.41.1741854236071;
        Thu, 13 Mar 2025 01:23:56 -0700 (PDT)
Message-ID: <9e16ecd8-97e1-4633-9961-183d053f5f00@suse.com>
Date: Thu, 13 Mar 2025 09:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-7-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503121610510.3477110@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503121610510.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 00:12, Stefano Stabellini wrote:
> On Wed, 12 Mar 2025, Penny Zheng wrote:
>> perfc_control() and perfc_copy_info() are responsible for providing control
>> of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
>> be wrapped.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> ---
>>  xen/common/perfc.c      | 2 ++
>>  xen/include/xen/perfc.h | 8 ++++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
>> index 8302b7cf6d..0f3b89af2c 100644
>> --- a/xen/common/perfc.c
>> +++ b/xen/common/perfc.c
>> @@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
>>      }
>>  }
>>  
>> +#ifdef CONFIG_SYSCTL
> 
> I think in this case it would be best to make CONFIG_PERF_COUNTERS
> depending on CONFIG_SYSCTL. The consequence is that without
> CONFIG_SYSCTL, xen/common/perfc.c will be disabled in the build.

But perf counters can be used without sysctl, via the dedicated debug
keys.

Jan

