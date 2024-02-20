Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E585BA85
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683432.1062940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOGQ-0006te-IW; Tue, 20 Feb 2024 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683432.1062940; Tue, 20 Feb 2024 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOGQ-0006rS-Fl; Tue, 20 Feb 2024 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 683432;
 Tue, 20 Feb 2024 11:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcOGO-0006rM-M4
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:26:16 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db229a04-cfe2-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 12:26:14 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3e5d82ad86so301506366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 03:26:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ss1-20020a170907c00100b00a3e0c07c1a0sm3744849ejc.23.2024.02.20.03.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 03:26:13 -0800 (PST)
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
X-Inumbo-ID: db229a04-cfe2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708428374; x=1709033174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83H65JBn/OBpg4tMqx6OXYsljmCtU8NTWb2zbPb1FwU=;
        b=QuBTKTbWULyjYz75xHO20H3CXa0oS8RC9roQi+WdnXVQxQILGUuTdaI7jBW/PgEYrd
         VW0iJC7mQzboEEtW7g2/KluNiMsGHsRge5BcZFpxnLedwei7A83hY3DxsuwaYYSKgBL3
         SqrZqQXjM54QOcYLpiCOf/hFofLwMD0hOT2opH9F4HPqW3HzIXo7cqni+IF+FsOJh4C8
         XKkH3LHyjTu7qvcbKo1y7EqynhuYpH5iuU72eriezUPkcXZKajg8sknJXN0qxuOMeEYo
         v4y323AQygobCPeFHV3TCAL5Dj8q6uTu9x3qTNX1/amcCE5wKZcJ7DzNB3At4VTjbgv2
         48JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708428374; x=1709033174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83H65JBn/OBpg4tMqx6OXYsljmCtU8NTWb2zbPb1FwU=;
        b=Jdq98MAOC9xxDreoaTBtHk1E0XGZA7JfcH9woL3erETbVt/YDpvyY0JSST98Qu6jIz
         ivWAslgjFb6WTQhOy9GCbfNCH7inQov1amo/WJ1GjpbDPVv3OWM9HtamchHjaf3f9yll
         5c2UbMF9diJmoG1Cq73NLbw6gP9IO5Tk5T86OEkKZTwYcnvjv55E8oENS4ur2YD+dhJ7
         eeRfBRxAkVVd9/cH7ALoqwoSREHzQxECHeJcAtDcQvs7phQziG0PYYmM1288jCfv2a9i
         PapWq0MktuCb9kUFw43UVzrhBMT2HQS2ijtQymqEDRoaRyZqJfKSCGyfL2XyjrB0vH0M
         0WuA==
X-Forwarded-Encrypted: i=1; AJvYcCWSmc4aVNiYNUcZUN/hpX6KLnLmmLdBzaQmgSu0yRC3/+8D5zD2dseJKn92DqngUJGi+KtabUzzAm35bqWgvWPHv5myn3UtOhSxg0AmAJA=
X-Gm-Message-State: AOJu0Yx7EFJAhGTJl0dFwTg3RPq2cFw5xYcgq2HFVjGdqDMNoJjEavbb
	/alQmxFI1GyLiXYWqCJvaWdINwRqp4lsgWMy6PYVz9CofDrBHNysEvkEzfYOEw==
X-Google-Smtp-Source: AGHT+IEJLVOBLUPgvXtZEOn/8NHcVgQez3FHKSRORA/I40EAwtjFl9wMuz0SpFRwfaMyH98/dPh+Dg==
X-Received: by 2002:a17:906:344c:b0:a3f:cfb:9464 with SMTP id d12-20020a170906344c00b00a3f0cfb9464mr787774ejb.21.1708428373740;
        Tue, 20 Feb 2024 03:26:13 -0800 (PST)
Message-ID: <d70ff55d-e3fd-4c76-a053-617f42036295@suse.com>
Date: Tue, 20 Feb 2024 12:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2024 13:39, Oleksii Kurochko wrote:
> The current patch is a follow-up to the patch titled:
>     xen/asm-generic: introduce generic device.h
> Also, a prerequisite for this patch is, without which a compilation
> error will occur:
>     xen/arm: switch Arm to use asm-generic/device.h

I've dropped this while committing; it belongs ...

> The 'struct dev_archdata' is exclusively used within 'struct device',
> so it could be merged into 'struct device.'
> 
> After the merger, it is necessary to update the 'dev_archdata()'
> macros and the comments above 'struct arm_smmu_xen_device' in
> drivers/passthrough/arm/smmu.c.
> Additionally, it is required to update instances of
> "dev->archdata->iommu" to "dev->iommu".
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   This patch can be merged with patches 4 and 5 of this patch series.

... somewhere here.

I didn't touch patch 5's subject, but I think the duplicate "Arm" in
there would better have been avoided.

Jan

