Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211F91079D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744714.1151817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIUj-00080g-Be; Thu, 20 Jun 2024 14:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744714.1151817; Thu, 20 Jun 2024 14:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIUj-0007yk-8Y; Thu, 20 Jun 2024 14:10:33 +0000
Received: by outflank-mailman (input) for mailman id 744714;
 Thu, 20 Jun 2024 14:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKIUh-000761-Jv
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:10:31 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a0b82b-2f0e-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:10:30 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so10336541fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 07:10:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96eb9bsm12374902b3a.81.2024.06.20.07.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 07:10:28 -0700 (PDT)
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
X-Inumbo-ID: d9a0b82b-2f0e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718892629; x=1719497429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dLibOHro7nMGYz0pO+wN0jLNcwMVfXyUcOvWCE38Pc0=;
        b=grahzZp34ABYdguIPLdhxEAMVmtJAUFEPyMjwkGxee4w+HbkIOgDitaxtRiCszHc9c
         hmunpyl5x6+AH3a4znmtmPf1JBsOCBaBzr4HBoi2sxurOZp6z+TeRBsoyA5KNnBllv4F
         fRqK7zXxwFxZcvQWdBAppxKQgfMInTMJCpXhLXF7NJXXzegv0M9NR7WX1nk5PdhlA/6B
         S6d9jT/NghSi+h9zIFoTjbV3DljYeglZVf/s5OUAVn3sxvEAlq8gx8UECWZyhucDRPeA
         HncvLFh9yMUBqfKAYX/git4mhyl+qcl7DRpdMUrx9Juhvl+EntH+uOxsRjtRiwT1LyS4
         WWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892629; x=1719497429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLibOHro7nMGYz0pO+wN0jLNcwMVfXyUcOvWCE38Pc0=;
        b=oXL+fChY4KNALJX34Sa0wgezWY6meKfdJje4QBM1M2W79sIuRUOBEYjFMxpoot0jr4
         RsSAwjQ/WChZYUfaSevcscmijzB1SzX7FEh8O3amWzJS18cTCpkWuflmPoEW6Frig839
         kBGl2OZyZf4PSK4PpWu8ymvW9rT+cpwu3YTKqX13SSn4i991Hw9TSH961p4Dtn0Gtfqw
         gol3CYZCSeJy/vZ+q3imr8QeUWO4vP+U9Gcu0DtbSJA5s3X1bUGN10CEPaGpBNzioM2/
         h6skuYCGVrhNQbuLd8DYp016wZ4XfCxMX77HyJb+24mWT5dbJs5r9k0otVayoJYpF6qB
         Trsw==
X-Forwarded-Encrypted: i=1; AJvYcCVovUqzTQPp6WMSxL8cru8LZ+ouE5KofaImFjxSHd4QKXbRBnev1rafyzVpHUDZboRcxI9xfTIfydPxj9N3xe+wpv7Fu/uRX6th1rkpFgM=
X-Gm-Message-State: AOJu0YybrOwUXTLQbMhszyek7h2mFtF0A0jKB3TioAOOqhB3LI8TfGWh
	U9kYE2MDb8MWMB6ltORG/CnS6alyTf1Qp+R6tbKY0mfNR2EyFfuWhkRSOYM54nMxeT+vY4WEUK8
	=
X-Google-Smtp-Source: AGHT+IHEMzVIzcgPw6U1pmHJXoDYZChmalJOuVfmV+Y1WOZbLbi3uQGQeFV3VSlqtkMmgYRmRys6Hw==
X-Received: by 2002:a05:651c:90:b0:2eb:e329:5508 with SMTP id 38308e7fff4ca-2ec3ced5bd4mr33211951fa.27.1718892629260;
        Thu, 20 Jun 2024 07:10:29 -0700 (PDT)
Message-ID: <c6a2fb51-1ffe-4d13-9894-5ca3169c392e@suse.com>
Date: Thu, 20 Jun 2024 16:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for
 MISRA Rule 7.3
To: alessandro.zucchelli@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com>
 <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com>
 <alpine.DEB.2.22.394.2406191817310.2572888@ubuntu-linux-20-04-desktop>
 <566b0cb9b718b5719a6b497b36e90ab4@bugseng.com>
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
In-Reply-To: <566b0cb9b718b5719a6b497b36e90ab4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 15:19, Alessandro Zucchelli wrote:
> On 2024-06-20 03:17, Stefano Stabellini wrote:
>> On Tue, 18 Jun 2024, Jan Beulich wrote:
>>> On 18.06.2024 11:54, Alessandro Zucchelli wrote:
>>>> The file contains violations of Rule 7.3 which states as following: The
>>>> lowercase character `l' shall not be used in a literal suffix.
>>>>
>>>> This file defines a non-compliant constant used in a macro expanded in a
>>>> non-excluded file, so this deviation is needed in order to avoid
>>>> a spurious violation involving both files.
>>>
>>> Imo it would be nice to be specific in such cases: Which constant? And
>>> which macro expanded in which file?
>>
>> Hi Alessandro,
>> if you give me the details, I could add it to the commit message on 
>> commit
> 
> The file common/unlzo.c defines the non-compliant constant 
> LZO_BLOCK_SIZE as
> "256*1024l" (note the 'l'). This file is excluded from ECLAIR analysis 
> but
> as the constant is used in macro xmalloc_bytes, expanded in non-excluded 
> file
> include/xen/xmalloc.h, thus these specific violations need this 
> configuration
> in order to be excluded.

Would it perhaps be easier to swap the l for an L?

Jan

