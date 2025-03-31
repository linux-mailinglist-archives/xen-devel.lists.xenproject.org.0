Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FEA75F09
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931927.1334101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz90a-0003bq-GL; Mon, 31 Mar 2025 06:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931927.1334101; Mon, 31 Mar 2025 06:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz90a-0003ZP-DB; Mon, 31 Mar 2025 06:52:32 +0000
Received: by outflank-mailman (input) for mailman id 931927;
 Mon, 31 Mar 2025 06:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz90Y-0003ZH-Rx
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:52:30 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b441cc-0dfc-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 08:52:29 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso2616200f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:52:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4318sm10257624f8f.87.2025.03.30.23.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:52:29 -0700 (PDT)
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
X-Inumbo-ID: b6b441cc-0dfc-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743403949; x=1744008749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n08gtiAEQAz01ni/J3mRmiRql8AVgHhCnoE0/vItLoM=;
        b=H49vp/1iu71vus3kDZvjaCUmTjM5sv0Qi7rUjHtXpEDhQVjQLExbd3+QE2+n9l5BV1
         uZQ5Edxdc/47wZLQQp6vKvPWcYON+qvHzN9dOAt2KZAyi04nZ/o06Mp+/GML9gB3JqNa
         YUIAo3tOiAYLYqelAld+b/x6u7RV27gdghJiLTwq9l1SJurt3cQm0xoOVrCrMpdNUehE
         f7XI2/oEU3I/HyVpUUdj9A8dTJjUiGrBFc7HcaFR1Ns/uzMTSjxVJct4hxZz9+IsQ/z4
         dLOvL1Z3JGsN65J2hX55U3k3Fhh74ELNug6oYB8uUChiSDcw/dHgiIzCmHPtgjFftiVl
         gn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403949; x=1744008749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n08gtiAEQAz01ni/J3mRmiRql8AVgHhCnoE0/vItLoM=;
        b=NCEFEj9DOYfDljU6vWjju59fLTpv2ImAnsn6OML3YWQJjyfZc0AsihAKdnQmfErr7L
         +q++IWMoABDFb9VfvYex+ipe9fV/rLOp/GZRb/qckV2Y47yMlDWP6+Vp4iolhWZqIw00
         cQfk3duMkByO7nBjkAlku/TeYnWCcOzXH5UlykXGrVSWnweOCn81nr8dbqQkOYkfY8wB
         FwpvHqMWl64aB2uGH5lVg6laJJYf8k/NDGyG8tk8YemgTS1NFwEczyf0UXek38JVD7QU
         qb5kENUUCXWZmU80PalySaklFJTnB1PvYWqXOZT36Bs5pLoMSBqYWzvsuZckEk76v60B
         l1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXSrFrmmcpScrEBtlXfompEDEgtg+9JLWZ0j4BnD+oSPgRMqipgQgIr5cIB7q1eEOXlcTP4RIGSLro=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4wbNzvAz+nfN/7I8Yzugt7CQiJ6SG7ISJJOgiau4RGQny2ozH
	q65dYaH57znVV3hsJ9/oGZz621ilwwK8OaegUHs/JIvwpymXW06rIXtXJ6mAHQ==
X-Gm-Gg: ASbGncs2AdlDqrwH9+mlEx+6d8esPISLvK8exXRTOwDogy+zevSKvut3tkQ0dS1tIPz
	HrjBoHgl4v0djKNMEFJyKdXZupG5SCbzPUXaGALi7XUctV0yb9DBwXKxDjU+TRi2gZU1DOs/1l8
	xm2F+3hIjcS6nebM0cWqG1cipH9MJno0OmzXDMQgKisuW62H1xV9tnWMDWg9MkDa9iz1BfyBJql
	ui5p5QQA5rdcFV7YpIQyH9z8cbv2qs7j+zLmECnA0lEnXsjmsDhwr/eJeVZhPeD0y/3VWYhB8lj
	eQVv/BdnE+JcG9PAYPALYup8EJzq07kyxCsq8GGK9ZIClejSm63ZGpPiqIhcUwek85GCNIitqLL
	FWPvpsNrGLIf2SmZd6/q+NF5FC4Qa2Q==
X-Google-Smtp-Source: AGHT+IHb6/hVyxKpS3GektByaO0WZ2oiwI3JY0Xv4CO/6hbATvAaWok96JfASv38Q8JHMhscE2r7+Q==
X-Received: by 2002:a05:6000:290f:b0:391:4231:40a with SMTP id ffacd0b85a97d-39c120e30a5mr6828470f8f.33.1743403949300;
        Sun, 30 Mar 2025 23:52:29 -0700 (PDT)
Message-ID: <9bfa0537-61e9-4dbf-867b-8b2162be36ff@suse.com>
Date: Mon, 31 Mar 2025 08:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 3/6] Arm32: use new-style entry annotations for
 entry code
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <149aff98-bccb-4671-9961-484e5651bf1f@suse.com>
 <a1c41776-fb5e-4b83-a6f0-b4370a0c0e0e@xen.org>
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
In-Reply-To: <a1c41776-fb5e-4b83-a6f0-b4370a0c0e0e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 19:46, Julien Grall wrote:
> On 13/03/2025 08:07, Jan Beulich wrote:
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> ---
>> Should the GLOBAL()s also be replaced?
> 
> I guess the goal is to use helper from xen/linkage.h.

Yes. Imo in the long run we shouldn't have more than one annotation
scheme.

Jan

> So I would say 
> yes. It doesn't need to be done in this series though.
> 
> Cheers,
> 


