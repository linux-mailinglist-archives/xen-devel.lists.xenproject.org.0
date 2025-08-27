Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA0B37AC5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 08:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095580.1450536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9yW-0006PG-Eh; Wed, 27 Aug 2025 06:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095580.1450536; Wed, 27 Aug 2025 06:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9yW-0006NZ-By; Wed, 27 Aug 2025 06:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1095580;
 Wed, 27 Aug 2025 06:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ur9yU-0006NT-Vt
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 06:49:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff191f98-8311-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 08:49:36 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so895598666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 23:49:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe76b4dd5fsm664376966b.102.2025.08.26.23.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 23:49:35 -0700 (PDT)
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
X-Inumbo-ID: ff191f98-8311-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756277376; x=1756882176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcJMorFk2kd6b4msBMnKbHG6JUC4+XVrRfprzYQVQ0U=;
        b=QjDEFe6VCIlECBpVZKWoXgXOurhHBVygBEDDrgcUyF4tmkUKyLPJEG2AU5W//OiyQX
         V3wBdUPwdq9mktsFwDBHrT8NVLKczqTo0xgiTitfjceqq/ErnDAd98a6jhVlKn7m1+lS
         6xR07nNgvMmdlWhY0ZTsIkzOOHQebbrnB+Rr9YTtfYFht4vgzN/8S1Pr3DS9Hnsme7iH
         JSpggCuTkYQCGcAutxUaTW7kyHde68PX7BvoPPi7Z8EJhfUI6Pk5Oa3JIqLKlnmxlcpW
         AU5UfIwdD7HplQsmas4vXePJ7v5edGTIIQe9DsfePvL1yybtlbGGBVQTtgevTFtpH0p9
         9+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756277376; x=1756882176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcJMorFk2kd6b4msBMnKbHG6JUC4+XVrRfprzYQVQ0U=;
        b=Nt76p0tcDkeqQiCw36FKX3qy4aNl1hkNntCsvcJvJHUVDKQYyQ5aZowvc6ABlkRz7Z
         r4jyaVZWwiZYJ1TwZz9qo5p6SJnEGvUn1QCeKgwFIH5uhOmidDUALIJ7N6aUgslfBy1O
         swBljWhw9o+j4X439+0rUn3RWSDXE/ZQlvLEzU/omQ67R8XaEpLdwtHCZigQ4tey4ecb
         bq4/MBvCPDyQwzkiNWO0pwEZtY1UmyrXE9Vpz774RV4mFxkL65FrBY3F8eReNYv4J3NJ
         rV3islKEdfEu+HaP3nSSTCSwH/bOOdSAc0Dn5qbLFm9omv5U8duQWuPOYBsETODtL+1A
         HqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDBwUZmeRri1GjOUI2ETzNREc1aSFRmkgKejR+jByqJ0MxvxtoBGthyyo8oCBdj+LlhsD8sRr9KiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/I57T9FGJy+WO5mtf+YahEcwvImx7easTTT9HlwbZD8wulVYZ
	Q/m6xeDV/vF+/68j/ryndJl1q5pvuVZa8JJYhcCdq+/VWghkUOVpWQ6QTSG2PZbb7A==
X-Gm-Gg: ASbGncv/dK8sQQrqh5p2A2XX7rde51QY2rPrU5swUvbNp/CT13O6AQr8ZV0KvpJvmOv
	xLN9us5mCfhFqIH6Xo7HJn8x8YSUrZpt0jxqj/w8eg3VBzG9zhwswT7Fin1D5nmMCb9trnrYjoW
	xkg0RZTYOE8BQ2vdtXnSJWEjw8sbksd1ewQ4pXK2pIDZE4vW3adRxd6if2uuRog4I0La7d3sGTJ
	MmwdS25+3rEApDZ4GM0lcmtOEHFanyAXA7wLK/SgfARrhL2gdaGK7+4Uk6OOt4GOBEOZwuOcPD8
	LZNTA/Ge3teKgp4kYMuNfv6767tFvAyBd8F0L2dgDaYcHzM67j8vfP0+1Dmpc55//YwZOGFMCDO
	Y0pPa89/y2QTIZ45biu+yWQs/LKy8jrUaSvAW72CXm+I/NGoXSRicUBWsBXP2NGpZYobsW2BIex
	79Ap9fqR92Iiy6cY6XzA==
X-Google-Smtp-Source: AGHT+IE8aRxAuz5UROSemss777nP3Mq4Wr/VsDKBN7UrHEHBGfPDNTehx4t7m+F+brGODXbF/45deQ==
X-Received: by 2002:a17:906:6a0a:b0:ae3:a812:a780 with SMTP id a640c23a62f3a-afe294ce84cmr1764436066b.61.1756277376067;
        Tue, 26 Aug 2025 23:49:36 -0700 (PDT)
Message-ID: <87d3e637-cc74-422f-9711-dd42e93475a4@suse.com>
Date: Wed, 27 Aug 2025 08:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Leiber <paul@onlineschubla.de>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <5b85b5da-dfa3-465a-9708-62fc55fe48bb@suse.com>
 <aK4Ztm8QE3O6Ifcc@mattapan.m5p.com>
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
In-Reply-To: <aK4Ztm8QE3O6Ifcc@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 22:31, Elliott Mitchell wrote:
> On Mon, Aug 25, 2025 at 10:07:18AM +0200, Jan Beulich wrote:
>> On 22.08.2025 22:09, Elliott Mitchell wrote:
>>> On Fri, Aug 15, 2025 at 10:14:42AM +0200, Jan Beulich wrote:
>>>> On 14.08.2025 23:27, Demi Marie Obenour wrote:
>>>>> On 8/14/25 02:55, Jan Beulich wrote:
>>>>>>
>>>>>> Parties interested in changing the support status of any component are the
>>>>>> primary candidates to actually carry out the necessary work.
>>>>>
>>>>> What is that work?
>>>>
>>>> To determine what exactly needs doing is part of the exercise. I, for one, am
>>>> unaware of a concrete written down set of things which need doing.
>>>
>>> Since you're not pointing to anything definite, could it be everything
>>> has been resolved?
>>
>> Possible. Yet even then the state of things needs fully writing down, perhaps
>> in a commit message for the patch changing the support status. That's likely
>> still a time consuming job.
> 
> Issue is much of this is better done by the people doing those projects.
> Most of what I've done is checking a real hardware/software platform and
> confirmed functionality.  Presently it boots, but the framebuffer doesn't
> work.  VMs appear to work fine though.
> 
> How does the attached patch look for enabling ACPI?

The main (Arm) effect of it I can't judge on. I don't, however, think that
an experimental option can be default-on. That would effectively make it
(security-)supported. And of course there are a few formal issues with the
patch.

Jan

