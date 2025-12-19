Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504FCCFD9E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 13:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190630.1510979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZot-00085y-OV; Fri, 19 Dec 2025 12:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190630.1510979; Fri, 19 Dec 2025 12:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZot-00083F-LW; Fri, 19 Dec 2025 12:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1190630;
 Fri, 19 Dec 2025 12:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWZos-0007zd-3O
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 12:42:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c6467ea-dcd8-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 13:42:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb94ff5so722715a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 04:42:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53bb7sm2115888a12.7.2025.12.19.04.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 04:42:52 -0800 (PST)
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
X-Inumbo-ID: 3c6467ea-dcd8-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766148173; x=1766752973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1jMJceSBlap6GNc6rJt7NHv7jH7WosXTCKxXBXC9EI=;
        b=Ap5KMI/VP6Y5pS+qYq+htljsx4yHINCykEeN3i7i0FeTbBI0r9LUg4B0UGMJW5ujcH
         mH1Jg+TfKIXHWakNbrXRZOAhwus6cVIZNYzAsoq7702Ey3JlAYXpnWa9oPJPl7L6AE9q
         IhL1T8n2QJziHvyl3HQ48yJPbrFWO4h0MOCh5208rFg46DYt66hM/Ube0kfSNyLuhiva
         7Y2j53pWtwY9JOdpa0VXaxOP7VXYRE6c71RY4vycaXOi7w2L5Q9GoESiYCYxJMf8Yw6L
         aA8mjwqo4OwOSTtxI2FVHQrefXgc0pXyuqJ+4uVqYhYtHpPdBGtBVHusedJNJf6Psv1Y
         k6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148173; x=1766752973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1jMJceSBlap6GNc6rJt7NHv7jH7WosXTCKxXBXC9EI=;
        b=YyOWhNv9xhFv3/7WvOfpOFTJQ3l5ilUzyzKTBUwXd7fd/EfENLoAPXBef0R+dFUJhp
         5+7wxuplJWNpGZt9b9TTVMn9Mk+8eJo3PBKkGYb66C8ztJX/f51e1inrC1IU9XbKynLu
         J9z/GoPGTqXzhIG0N41pLOA1b3rVcD2kqF5U03MSzMeqTsxxz2PNk00C/fIY5FH/bL5C
         /oJwPG0xk4jW1iyLy6f9+qzy+5ia0ehLTaAeylrf99vlUZESWY2RstDuqBAmjU5wwqg6
         qCCrKow3t4qRb5l1v7L1TCS1GdbhJT68O4+qEaGnvC1UdR1DSSLRC9xjMFkq9FUHSSyI
         PBvA==
X-Forwarded-Encrypted: i=1; AJvYcCWYZt1+unk3n2uSEIacEQAH8wlMGtaoJFX5eTWgfxx6Evu1avk7RnYksq7dCNMaF5niuVwVSmLH42Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEyQzD/zNGnhcU7hhQqioc24DfaDMwqwjZ+VcE7GDB4eMJiPvo
	qsKVrogpa+zy3kxRrjLM6UAPFNWzU3Hj6/nt0PxOfTkOMdilmYpcff7f
X-Gm-Gg: AY/fxX5TOfzFsmVDCsV6mJlSq3IDZz+FpvnbkNQV4048nh7J6VSyNwwZ+8P4yehgxuH
	lYtMbFnFx1MLHj1udpEWIguqy940iIQiBN7SvtEjOttTtf4Wrgpx0RNhTld0tSgiq3k4YRiyYhc
	87RyZiqwxV7WuPv7Sjn9CeqbbtGzc2gYAqyGMUT73sR31bRxkeDW3wVA7ZSweZgWDxsxvkfE3RQ
	NY9FiFUU+hnUPgDFpkGJCmRBgTJDoZUNfxJv6/0+LRd7N/+WCeziEeKMWlJ6s6asRSqLZnPqzkn
	O9OW3tX6OSvfKIpCVxwjmtZ16SqgpjnQyh1u2MU+oZ9LmP5JVWJsdt1OdZayK68S29PFYAB9MuG
	WnnDqDj7yupBi2n5q2s5s21fGU9o/LS10WRqcmJ53TVeJEftgxaHYg1rESmR26+gUv8by2WXMTz
	4kq88LbO9sZkyY2KsxOI6sYiJ/BKGTOmLtquhGoZgUrzLxClehGE+iRBEloiXLXYdq
X-Google-Smtp-Source: AGHT+IGtAlyIG/uH2hOJikr4KLhkONfu8WpRqTGaSZtdljnT7HO0evwGi1chQQyT5YsSt2nk75g4Qg==
X-Received: by 2002:a05:6402:35c1:b0:64b:7e25:c4d2 with SMTP id 4fb4d7f45d1cf-64b8ec9b1c8mr2330585a12.20.1766148172619;
        Fri, 19 Dec 2025 04:42:52 -0800 (PST)
Message-ID: <d17861f4-7ca9-4ab9-a388-ccffe2f1c0f3@gmail.com>
Date: Fri, 19 Dec 2025 13:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <74f1594aad235765002b59f2baa975cc8fe72f06.1766053253.git.oleksii.kurochko@gmail.com>
 <acbc46e0-e102-41cc-ace1-578a20644b34@citrix.com>
 <a59fdb5d-0c7e-4303-bb1f-fa47ebfcd163@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a59fdb5d-0c7e-4303-bb1f-fa47ebfcd163@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/19/25 9:22 AM, Orzel, Michal wrote:
>
> On 18/12/2025 19:19, Andrew Cooper wrote:
>> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 47973f99d9..e566023340 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -473,36 +473,21 @@ void dump_pageframe_info(struct domain *d)
>>>   
>>>   }
>>>   
>>> -/*
>>> - * The new VGIC has a bigger per-IRQ structure, so we need more than one
>>> - * page on ARM64. Cowardly increase the limit in this case.
>>> - */
>>> -#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
>>> -#define MAX_PAGES_PER_VCPU  2
>>> -#else
>>> -#define MAX_PAGES_PER_VCPU  1
>>> -#endif
>>> -
>>>   struct vcpu *alloc_vcpu_struct(const struct domain *d)
>>>   {
>>>       struct vcpu *v;
>>>   
>>> -    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
>>> -    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
>>> -    if ( v != NULL )
>>> -    {
>>> -        unsigned int i;
>>> -
>>> -        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
>>> -            clear_page((void *)v + i * PAGE_SIZE);
>>> -    }
>>> +    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
>>> +    v = alloc_xenheap_pages(0, 0);
>> I know this is only interim until the next patch, but
>> alloc_xenheap_page() to match the free function used.
>>
>> Personally, I'd merge patches 2 and 3 together, because everything you
>> touch in this patch is deleted by the next one.
>>
>> But, whatever the ARM maintainers prefer.
> I'm in favor of Andrew's suggestion. There's no point in introducing something
> in one patch and dropping it in the very next one.

Then I will merge patch 2 and 3.

~ Oleksii


