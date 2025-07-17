Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD7B08DD1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046864.1417261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOGj-0005k9-D5; Thu, 17 Jul 2025 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046864.1417261; Thu, 17 Jul 2025 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOGj-0005iY-AQ; Thu, 17 Jul 2025 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 1046864;
 Thu, 17 Jul 2025 13:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucOGi-0005iQ-3K
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:03:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad174d3-630e-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 15:03:22 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso822313f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 06:03:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ec4e67963sm13191376b3a.114.2025.07.17.06.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 06:03:19 -0700 (PDT)
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
X-Inumbo-ID: 6ad174d3-630e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752757402; x=1753362202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IxpOQFkciFJOa5o9s3q7HcPS1ans9mfzo/+2anSsYr0=;
        b=PJtY2Gz5ceMBPwj1pqXAPA5F6y1QvM78hERAnxHsoFzn0SMGRecniSNyVLi/KSKPtG
         Sl3+c/S4VmowOZOQQi0ASvmCluzVM013t7xwv0yw9xBuAd6lNG4551hrtcVgLky3wEwc
         MhmH2oq40re8Cv9ZYIvIdskHSgnXBD7ppv3Y/f4jnAKp8BdX47tTcLY1TTAaykHQxVsz
         13a+ufmqBXc4HtdTjcxtv30IRbjjZ5k0KRBpj1zitSFBfChUROvDifs/4CJUC7bzSywW
         K8umq1rMh9o9fu9juCWy5Z/odGu5/w1gtoQw7s/i3tLUNBW1EprYgQssE+t+JB6u0qnp
         UQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757402; x=1753362202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxpOQFkciFJOa5o9s3q7HcPS1ans9mfzo/+2anSsYr0=;
        b=ZUZrU1dXTJvC6xO1DDl60+cRDZAFNBh6wX2QCEv0U4t6JyISsYu5p79KgkxGWr8jYh
         g4qVQzNfoz2PAA1KZNw2bbL5XmcvvjPf0Ki+q42iIF0DI9F739c67ys0XSBdZknnr9pL
         As3Ondso1e4//KlGwLxCAptO3Z22ZLQ8y3Pdgw48IZQx1l2rJv9sy2woZv+ZVDpf9Dnq
         V6au9Xp4/N39ccPZck1fW6C0HA1F7SXIESPbMYj25iJvgTKt2av7OYIWIsxblUirBX3a
         I1Dt1DIAxHeyODncoqMf8kKHO0OnQewtvPB8EdEA9LOlHV1/TkaU36FBIWA95o456txo
         XWtw==
X-Gm-Message-State: AOJu0YwRxgTKNftAzhl5GbbtTi1qe1Emi5wr3K9jvTzEC570lnSPenBc
	6V/ud/zRelcNhw7qdbpWE1PE3hJ+T79e2A71qlN4gkyF8P6vbiuijT3lpsacSVqzBhosClZoEyW
	VS90=
X-Gm-Gg: ASbGnct7tdggkBYU0HHUZ82MbnNlw77Y2vbeGslGNbcTKMWc9Gnela1ISmronOCgwr5
	uLZX7Yk1/vlqP4OXK7U4XXGps55x4YEcy4c0Lr+a/6jwq1a0patVVmfEo1TL0G/7zCCC7FjC0ir
	Q7iu2mol/ZG8jJHkta4ehGMky6o3QTBc8DU1fT55tqy4tbnaXVsLTI0lbslT8Fbt2iReFDeEF2B
	S3QfdjF3CYzeBAVlsC42umEeY2f+wgHa/rUOrw81mWfnKwrZsvtFucRZDTOV1pxk/B1UmaD/TjO
	PNNKzx1W/nk6XpGhEoeO4cE0O2IgP2LSoS3Y0RdQ8Bx5w/dcKegOfxkLbEB94Gm74u97wXdRMLB
	2F4t4dH89Abd98x1g180D8F0XHDwEi8GuvR1Aw3/Gq9Daq4IXBxZQ1u9Wa558/Zx1WHhFZKmhUe
	XA+L742oY=
X-Google-Smtp-Source: AGHT+IFDW2lFKQJn4eMevIkaKLOfTgyrTuNzVHCOJxT5V7PyLgHU0gJ/ugXGW1k+ZziYz08mcUQM6w==
X-Received: by 2002:a05:6000:2dc6:b0:3a6:e6c3:6d95 with SMTP id ffacd0b85a97d-3b60e523e58mr4153401f8f.41.1752757401142;
        Thu, 17 Jul 2025 06:03:21 -0700 (PDT)
Message-ID: <d0647b6b-ae49-4f04-93ca-545799a3c0de@suse.com>
Date: Thu, 17 Jul 2025 15:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] xen/domain: update create_dom0() messages
To: Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-3-dmukhin@ford.com>
 <c76704bb-f1b6-458d-8a43-475b161470c1@epam.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <c76704bb-f1b6-458d-8a43-475b161470c1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 14:58, Grygorii Strashko wrote:
> On 23.06.25 21:28, dmkhn@proton.me wrote:
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2080,17 +2080,17 @@ void __init create_dom0(void)
>>   
>>       dom0 = domain_create(domid, &dom0_cfg, flags);
>>       if ( IS_ERR(dom0) )
>> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>> +        panic("Error creating d%d (rc = %ld)\n", domid, PTR_ERR(dom0));
> 
> May be you meant %pd, not d%d?

Certainly not, as the argument is a number (and dom0 isn't a valid pointer).

Jan

