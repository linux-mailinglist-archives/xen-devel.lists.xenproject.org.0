Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19750976651
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797223.1207112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soghc-0004zf-Qa; Thu, 12 Sep 2024 10:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797223.1207112; Thu, 12 Sep 2024 10:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soghc-0004xL-Mx; Thu, 12 Sep 2024 10:05:28 +0000
Received: by outflank-mailman (input) for mailman id 797223;
 Thu, 12 Sep 2024 10:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sogha-0004xD-V3
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:05:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878a429d-70ee-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:05:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so100332566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:05:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c7277bsm716192266b.102.2024.09.12.03.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:05:24 -0700 (PDT)
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
X-Inumbo-ID: 878a429d-70ee-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726135524; x=1726740324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWBs3PW7VzLxjQ8kZzSsqEHqf1H7Xg+LCxE2sj1QSlE=;
        b=c0KNEmSsl3T5d5TUYKtHOd+dkbtLKu3jQ8ECB28UnGAxAEZdrbd64GK/NeKyE/nLRH
         ScyGZG7BHBBzLxz8KTyIQJCdeNkYeQAMogDaV1iVA8WphBM+cCnMtkVMbcXVzx2FbDTb
         rwnLeIc3PJncgm6A6yArK/Gyq3kTJlMIbPhhWKuzjBJv8E9S2Vpu3xuPcW5L9HOvB2Z8
         MrDjuzWo2Bz96GcgWL7vCaLwI2VM05q/ITruxJIalLAiuMQy5BH6XVFFiLUuH/D7giiJ
         IPB97Yoob+6LbEo3iRp2MMDCHA9BpftsWBp7gznD23F2vVQ8Py1q67qrSM037zRGekSs
         ojNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135524; x=1726740324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWBs3PW7VzLxjQ8kZzSsqEHqf1H7Xg+LCxE2sj1QSlE=;
        b=rR2eg8tnwOR+OtkHNTgkff/w1OWH3gkj9CQa1ACrhTQ5+mUNC0V5goQVkxRIRYY+Zl
         QIX/2xG7UjNJdEAYMMx2QG0858unuXuLraXXej+Jf/YbiqkzqzFYTRakG1Qr9QtaFKbB
         CH9XIevfrnwtAJMS9ihNlsfp6DRIk6nDf17m1fZ9fNGlV36Ek9s76BxFz5FezcnA+YXa
         0ZEUv8vt2XpCqi5dWjVVNuDzIYVVNNcKvDiBxXZONafP6tJtFVI1k7QTk5y/zzVYaOMV
         BcTzeGV/+SS4wZiRujjGpWsUGXAtnaw3uN/+8MfZMPnv2WoL/PbpqR1tn/gBc1/hdBaY
         dwHA==
X-Gm-Message-State: AOJu0YxLHVUT6Ievi+JLZEqkzLtE6E06xGqUizPxSS0SrzF4jH52lfGe
	ht4ciDpY8PU61N1w1SdnGprxOGLwsy/mfkcCLPUNQyxQgGUMqnigdM7PLdEfvg==
X-Google-Smtp-Source: AGHT+IHCN1pHeDuftP6QXLRGcMVD+Erg7l7iiLbrhCuqjNnPtgnFCRa6d8qZQNV5nh7TDCH6dmGawQ==
X-Received: by 2002:a17:907:948c:b0:a71:ddb8:9394 with SMTP id a640c23a62f3a-a902961794emr214714866b.40.1726135524381;
        Thu, 12 Sep 2024 03:05:24 -0700 (PDT)
Message-ID: <22e4c432-71c9-4d93-adc6-01136d71a093@suse.com>
Date: Thu, 12 Sep 2024 12:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] types: replace remaining uses of s32
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
 <ZuK50VAqUCfX29pt@macbook.local>
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
In-Reply-To: <ZuK50VAqUCfX29pt@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 11:52, Roger Pau Monné wrote:
> On Thu, Aug 29, 2024 at 02:01:16PM +0200, Jan Beulich wrote:
>> ... and move the type itself to linux-compat.h.
>>
>> While doing so switch a few adjacent types as well, for (a little bit
>> of) consistency.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. Andrew asked for a style adjustment, which I wasn't sure about.
I'd like to follow whatever maintainers prefer, so could you clarify
that please?

Jan


