Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8724CCFE1F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 13:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190641.1510988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZvA-0000Oj-By; Fri, 19 Dec 2025 12:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190641.1510988; Fri, 19 Dec 2025 12:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZvA-0000M9-9E; Fri, 19 Dec 2025 12:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1190641;
 Fri, 19 Dec 2025 12:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWZv8-0000M3-7A
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 12:49:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 235c6858-dcd9-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 13:49:20 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7277324054so300190266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 04:49:20 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm223522766b.64.2025.12.19.04.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 04:49:19 -0800 (PST)
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
X-Inumbo-ID: 235c6858-dcd9-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766148560; x=1766753360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19GTY5qEJX6TG8NCSh7ISltFZSbUNmv+0gKGWAVgOc4=;
        b=PoETOGkIGbp1rbAcDDLR5LDhQW3xsgpEgOnaXc0358RR7zRe/qWjiC36XHgxzq6AEu
         2wLsBwikaG8Bo6YzAeYTINZjZ/HdIMg5d1EyDndS+Mw6BFpjZxdo7XLEu+X+kC6vW9tr
         VczUF4qmQSMGI/YEZQ5w7vg9ky9BRTeiXEGThrIK8OTlwuA46S8BUTYc+xS4a0p73BC0
         Gi363iLldZORXPpo+6zNiz8I2NR1WveOkQpP0/blt4/Z2AzhYv9RUVBjzeJRaIl7AFA7
         CH/w9G7kkrTNl5B/HlMW2L9i3Q1kmCkWdJAE1nZP3JK2ruAcqB0xJxs2qe1kZKKfxs6b
         ct1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148560; x=1766753360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19GTY5qEJX6TG8NCSh7ISltFZSbUNmv+0gKGWAVgOc4=;
        b=n5j6XKY1rWKeC1QVCr5+YUgqQJIjyCXZdgSunxnqDXqzXZmYD0VRBUQV7L2QkOxY8t
         0JtkzsA2cH0tmVVtN17dLhjJypsAc6Edv4Cgn4PSeXL7Sxqtp61oAvvMvlVDItU5BAeH
         vkSBSgOuoqFwrZ8FOIOWGXfFtLPOIGwm5BBdzXtmnXF3AiOiI8qvylFiw/kx0AtmBtCA
         CW3kkeDZ+vE1FJQG0U2IGoA8HNZl/HE0DemMi8cteD3faZcpqtt9o/8o8R/pB/fkwxhc
         7f/2Q4AysJbNAEmxpJpilEcAIWkXZs5xqTi0eZUueo36mv1A7xwGhX1+YbVXxgAOvXgR
         ZU3w==
X-Forwarded-Encrypted: i=1; AJvYcCULO9tLNXsBSLENATpeHDPbYcM8/5Ulsf13YW5sf8tc35txIaLCyvqpkDBWAoIBoYU12oij/jnPCf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCHe8AeKfgI9jJuAiu6G68F/lmWo6ovbAk5ZhJp3GxoXKXT46l
	r3ingbXW6A4biaF8t7DaffvG6YQPPXekiJcGtxFjvl2wDnM5ogKaFGn6
X-Gm-Gg: AY/fxX6NGq4v0RvD16C0M3DKjzvSuISvpRkiU8O6viD5rFg1ubn7b3ITDh2qfrGfAmk
	3iqNnRY6WIKct7D40XA5IqUpGAU3dNRlnAfxH5MnVWg4l4vjN5H5hWvjNPU4Pc8RxAJWzWA+vwL
	BBGl8b1+DwZoPeF+0w6gmlnYdSxVHhzBYIKHi7Egx613z8rE84HB2N4XxBrO72ALGFsr/+eA8Td
	hPvW3OnMgZIZx4lUXDusS0oO7V1LMbWNFSjw8Ex5WugN/2x7j1SBZ5EJOF3rV9gryLmCOwnX0sQ
	sHO3ypqSQCj/OBhN2qz2qIAH277RZUvpJ4/ZovOVPV6HMu0csh+DASyd94nwmdC6tcB5ir2w0z0
	uBI93dhZpW/Bx9KnEhMRc8LIqtyhS3Xto1WRpo5ElF8b3ZrNG3UlswnXjqLxAomwFeH5fEdFhkv
	mD9q9GnSK9FlQGuN8wPf2hx+qwqcfS3YVH8/DfAP50sS4Z/6M7zQS36/xi6wDyQC80
X-Google-Smtp-Source: AGHT+IFM7yyYSCWXjnTrcyxZ/tArE+m4f5bWXFIZeMHbFRBMDTovM//0nOUInDie2V5ZH2Cpsr3npg==
X-Received: by 2002:a17:907:868e:b0:b76:4c8f:2cd8 with SMTP id a640c23a62f3a-b8037233e75mr277327966b.55.1766148560062;
        Fri, 19 Dec 2025 04:49:20 -0800 (PST)
Message-ID: <1110cdc9-bb41-4ae8-9039-75b82ea4a056@gmail.com>
Date: Fri, 19 Dec 2025 13:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/common: make {alloc,free}_domain_struct()
 static
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <439f6e9dc1f35736024023d70ed7e1daf1ec294b.1766053253.git.oleksii.kurochko@gmail.com>
 <69b3249f-220d-49bc-a1c6-e517ae5f3b68@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <69b3249f-220d-49bc-a1c6-e517ae5f3b68@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 7:21 PM, Andrew Cooper wrote:
> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>> As {alloc,free}_domain_struct() are used only within domain.c,
>> they can be declared static and their declarations removed
>> from xen/domain.h.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>>   xen/common/domain.c      | 6 ++++--
>>   xen/include/xen/domain.h | 4 ----
>>   2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 92fc0684fc..7509dafd6f 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -690,6 +690,8 @@ static int domain_teardown(struct domain *d)
>>       return 0;
>>   }
>>   
>> +static void free_domain_struct(struct domain *d);
>> +
> Another option would be to move them both up here, and avoid the forward
> declaration.  It's a bigger patch, but results in domain.c being
> slightly less complex.

Then I will move both|free_domain_struct()| and|alloc_domain_struct()| (to keep them
together) to the place where the forward declaration of|free_domain_struct()| is
introduced in this patch.

Does that work for you?

~ Oleksii


