Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6CAC047A
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992909.1376382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzGK-0000tv-UO; Thu, 22 May 2025 06:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992909.1376382; Thu, 22 May 2025 06:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzGK-0000sM-RZ; Thu, 22 May 2025 06:18:40 +0000
Received: by outflank-mailman (input) for mailman id 992909;
 Thu, 22 May 2025 06:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHzGJ-0000sG-HW
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 06:18:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98cbd618-36d4-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 08:18:37 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso1358829566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 23:18:37 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d496576sm1028632066b.133.2025.05.21.23.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 23:18:36 -0700 (PDT)
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
X-Inumbo-ID: 98cbd618-36d4-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747894717; x=1748499517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rv3uqiJ2sWJIAWxz/PlWHp0yGmTX9oHCdn4+VUD3ukU=;
        b=K2QFAVrF97i4M1efDC+fHubk7D3zGKVwyNuIGfKr3piUenxKwhtioExL1iRu/flBYY
         39Ea/cu2i8+Es2fHKuW1SOtYU/dW3mwlViyM9+R0ZJwKUHsJCJn2LjzCz0It3vXequ8w
         jTWxqsIb5nqldIynh+dtDzI9U9tPzy5AG2jH2V7bwPr3ZqzRtuDyKBRPqwW4mIpI57Lp
         kVH3uY3H5gNCVj/xb35hf8PYKqpWCN+8P0+M9ISu3yWkEJt6g+wRtcN4U4CR8lhiamTr
         4dRjBekDolvgh9+/19rTaw5sulOEzwGXXWXnCinfeE6uQsfyr8ZPsVfsgLYn8dHz0unP
         IxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894717; x=1748499517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rv3uqiJ2sWJIAWxz/PlWHp0yGmTX9oHCdn4+VUD3ukU=;
        b=CSfcBnCTsXSqCe0lGdg6fOnty/B6HVXJCJd8JnAQrGG49sZCMgBy2ddh8bJr5yWMtE
         zzNedLPUmzlscAKLxXTUqpQRnAj1Jo259qO7ilP8k9JWLxPYqI9BvjJOdOc/z/H6CTwR
         k23tEj/xrBxI9022N2/ND+hzVsXLzAsqCsS2ie4KK7LLRyYozyIggtlISpfcn8V92lL6
         rOo/bRBPJUjCjKUebtL2drFROs2J++QBab9maNxe8PIuNkQRfZUTujoFTnAekmeb4z6M
         z9JbkjY83CSynrnmJZhxapBjFry0hpcR7uEpNKU/vgYzLRfIdFcz4gR7m9NA0Mj2sKIO
         ZwHA==
X-Gm-Message-State: AOJu0Yz3NFcsO0ePl0a1gfwGQArrth54P076/l7DrtmtFxedhQ8OdDxR
	a15xklK2Fwt8zwtYIrxrPEhjBbU1phkFQXsK09KYvYYpEL67rB+YSIJQrzVXBojjPQ==
X-Gm-Gg: ASbGncu13C4ZltHVMxbibzniTtMUEiKaVHvLAXNF4nV5rH7TDzFWtI1ZLIIs5Etg/Le
	i612sph8lRWeZUZ60PyahIs+KxiHApnJMbWSVEFrjThMF1+tU8ETW1RQ5AIlb9pANX582y7MZbZ
	aJ6fsn0xFGZjfeck6i0wszLa9WPQyzQrw/4Kzf226LdSxFuyP5wv1zpptc/2XPGvCujVeYAZmml
	0aVZhb6XGqHlnx+1fuofD3YI35mUHq6REmxiYHCXzFDp7+b6lfYHNCCpF0aCnfAYrZDm9xaa/mx
	+ci0QYe1IzZ2y/FdnkVP0DY14m2kciK6JwogAR2+LNEs0vkKoI2+fvLBZhhepw==
X-Google-Smtp-Source: AGHT+IHVkNN8GODRZ97gLn33E626sY3/r+HgtrVXasa/uFFKNRleUnmfkTJE3OnnV6ldcBBhy1bHHw==
X-Received: by 2002:a17:907:980c:b0:ad5:bf7a:964 with SMTP id a640c23a62f3a-ad5bf7a0dd7mr241058666b.8.1747894716808;
        Wed, 21 May 2025 23:18:36 -0700 (PDT)
Message-ID: <862c0fe6-8204-4c85-92f2-388d44e01af3@suse.com>
Date: Thu, 22 May 2025 08:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 02:25, Stefano Stabellini wrote:
> On Mon, 19 May 2025, Oleksii Moisieiev wrote:
>> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>> +                                    domctl->u.assign_device.u.dt.size, &dev);
>> +        if ( ret )
>> +            return ret;
>> +
>> +        ret = sci_assign_dt_device(d, dev);
>> +        if ( ret )
>> +            break;
>> +
>> +        break;
>> +    default:
>> +        /* do not fail here as call is chained with iommu handling */
> 
> It looks like this should be an error

The way the hooking is done at the call site, I think it can't be an error
here. But I previously questioned the way that hooking is done.

Jan

