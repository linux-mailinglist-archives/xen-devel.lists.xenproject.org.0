Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDB90E4DA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743503.1150420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJq3H-0000o2-VM; Wed, 19 Jun 2024 07:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743503.1150420; Wed, 19 Jun 2024 07:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJq3H-0000mS-SS; Wed, 19 Jun 2024 07:48:19 +0000
Received: by outflank-mailman (input) for mailman id 743503;
 Wed, 19 Jun 2024 07:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJq3G-0000jd-ND
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:48:18 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1285b0-2e10-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 09:48:17 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso58119971fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:48:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e5ba93sm110589115ad.3.2024.06.19.00.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 00:48:16 -0700 (PDT)
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
X-Inumbo-ID: 4a1285b0-2e10-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718783296; x=1719388096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=StLvSMkQR150txbL7SSXc/unofls6wsIRe1r4HbSewc=;
        b=NPpkVnuZLR4HejQgf0h0KmU5a3XzeoeS9kXIo1N/XI8GP1nxfg7pwWsOC/d7/yhMJj
         mZWCRjljb8KHlPO8kRSbpzG7ojHB08RNojqR+hhDBS7QEWRVNCJ8d50UqO9xxR0Iw2Wg
         QBY++9XzLkFsO49591SVqi8CBiaVzny0cVZAKXyatMd8XvzOw2+tarig2PkScybYlUBI
         9IhTvhEyFj2jUevzKKZC5JqQHfVdE9cvzCkIv5LOgrtZ3yTFfJ1beeAUn3oBv0JxZgge
         es0tmAkUPKHYxe53keaVq2+uc9JeV8xyk3LiuBujAq1j3zNoJVu6JWv3pqnkg9j6tOgs
         z2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718783296; x=1719388096;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StLvSMkQR150txbL7SSXc/unofls6wsIRe1r4HbSewc=;
        b=B9ASOgkj8CZDa6+Ff94qsBirDXFc+ZilWUAusbamz50MsMhYMjOTz00KE6VPiOXhJt
         tsjlm+qI2xWsRYiI4ZdANVjfNt89AaFajjckcqqiM34ihC1MqUso7eaitzeCdI+7Vzj5
         hAbWPhnN90Hyj9Mze7vY+xpNV+pUEL1qk1+7lUCbyKETL7CAtkfmdtyCei9LIAE6L6Xt
         iKR2iKlaftpttqCuzZDILTIwP5S4VSgIFYgRtwR9+6mt5vd7kXZv8zAactRaBz+XFZ9e
         F+8Uf12G5pK0k2TpxIQVfjRhYhpMqZ3B+TRqbvK+0N0TBUsXdryWqzAhwgFtNcN5gZCv
         r7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUXU/NQIY/Zh7kD/CQSDE0DG+2EfU0m/JcEZf8zUlDuyY5SM9fFb3+wcRkeyiLGV1hTJQzKKKsf6CoVwdVoRbe3r6hKZkVznExJ5+SnPzs=
X-Gm-Message-State: AOJu0Yy47YzbJW0XTydmM+JZXwxGSgad9Aej+yW8JrAE4eWSUHXQzvG3
	oR7eoBkp5HDO5rLrsqqBIlz9z3nO1RKk06sE80H9yPTjPdPTPw76VU0jQa87ThhChWdZHDCUgA4
	=
X-Google-Smtp-Source: AGHT+IH/Xr80OVPuSzjIMqke2a4h6TKZ2KeIKHbHPSwGQoKrQ+IWqKZ2THFflevpyrFDwauWNH+J7Q==
X-Received: by 2002:a2e:9659:0:b0:2eb:850d:a53d with SMTP id 38308e7fff4ca-2ec3ceb6a22mr11558991fa.16.1718783296527;
        Wed, 19 Jun 2024 00:48:16 -0700 (PDT)
Message-ID: <4cdd42b7-3751-484c-80c4-4bf321f1bcc0@suse.com>
Date: Wed, 19 Jun 2024 09:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] AMD/IOMMU: Improve register_iommu_exclusion_range()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240618183128.1981751-1-andrew.cooper3@citrix.com>
 <052cccac-8c8f-4555-953c-2bd9de460f2a@suse.com>
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
In-Reply-To: <052cccac-8c8f-4555-953c-2bd9de460f2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 09:45, Jan Beulich wrote:
> On 18.06.2024 20:31, Andrew Cooper wrote:
>> I've finally found the bit in the AMD IOMMU spec which says 64bit accesses are
>> permitted:
>>
>>   3.4 IOMMU MMIO Registers:
>>
>>   Software access to IOMMU registers may not be larger than 64 bits. Accesses
>>   must be aligned to the size of the access and the size in bytes must be a
>>   power of two. Software may use accesses as small as one byte.
> 
> I take it that the use of 32-bit writes was because of the past need
> also work in a 32-bit hypervisor, not because of perceived restrictions
> by the spec.

In fact it looks like we're already halfway through converting to writeq().

Jan

