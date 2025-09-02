Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E3B3F7BD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 10:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105783.1456621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utM45-00077W-NO; Tue, 02 Sep 2025 08:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105783.1456621; Tue, 02 Sep 2025 08:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utM45-00075F-KH; Tue, 02 Sep 2025 08:08:29 +0000
Received: by outflank-mailman (input) for mailman id 1105783;
 Tue, 02 Sep 2025 08:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utM44-000759-EV
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 08:08:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00e94b85-87d4-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 10:08:26 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f646b1db8so4761359e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 01:08:26 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c4ffd5sm2994461fa.14.2025.09.02.01.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:08:25 -0700 (PDT)
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
X-Inumbo-ID: 00e94b85-87d4-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756800506; x=1757405306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNbUaKmMtwfR4+vc8Vw/zAOCPP39b/gYocjOV+di+aI=;
        b=go7/v9g8uqjeM/IXX/waybFWhtKh/R1+JTwt+Kgoqp+GO2Z+fCeLBYHBh3F0aTc5HG
         P8hvtIQtKTO4tIvz0umoFGK3rftB1pbpk0WUsXvwRaNG6jLj3ISyt8ZcQrmXajbefOB6
         dDekj+S0k8kCKO1NAKDdWpAn3NtWUs0ckfG6ZTAhM8iDCVArbYUa/qGreyklIu6rlEj0
         bUc8Y+3DJYQLdwMFbLaZlDiAcBuSy3CYRHpp9uSa4eoA1YdC0AJpQ/carwAo0PSWMmXD
         66muj3xZZCtdbKpwT4M9pO5vVCZnjYTTdG9ik11KiKhdJt0pGlPwlcogmBPM1yQ4oUHQ
         B3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800506; x=1757405306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNbUaKmMtwfR4+vc8Vw/zAOCPP39b/gYocjOV+di+aI=;
        b=wsoknXvGDtCUkHgWXei+ere6CXjEwHIc/QK+aV4eQ/wnjS+BNEMk0IDd7+j7ujO0MG
         TxNTvq4l8nNnb9hmz0eZ8uSon+XQeoheTJVAa7iGzVfEY7yjuqkOLeRM4CoZET+T5QTH
         tyXdORpD3SUAeGarTPeIcvnAo/6JN/1r2gm/M/40bc+Lr93vPGF4gkWTvebQUmwjOmZ6
         hE7BzXNseTIm4+6MtQk4M63YkaKxC5IjC++c2LAo1PKGaFujycGS+rLZqT/kIsrqPswn
         zhKsM0rPUPC4U1losTAVNBVki+DmdxHasdzrplSOISUI3LijGuDZpYKlczLFAySNI6Yz
         fzFg==
X-Forwarded-Encrypted: i=1; AJvYcCVReXaINTpLwUhbF+TXS7RSSQPxJY1C9StlVF1ix7LOdOkrLra0XviAjRCiwmT0x7KZwsl053JRYfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcjlrgK6VsP0BpRlIGEjHGS67N0PExv6HHjbhVvrD1s4J8pe5R
	Y2jzTAZTbMmXtNzlhgfn28d1DpqyhN+Fh4dmPmBSv+WNfaCufCu60XOV
X-Gm-Gg: ASbGnctG4eiyg6MUXKOb2FrjBmulbb8jYdhoDPlv9xYNFt0NYOQMK919tEbwxIWwgkT
	YOIVzOldoy92v1dvbwGtwYZnxy3vwEeYFbiwlKeaV08jWUfOLyjseqmEqbFZ4SGD1hvtIBCWlvT
	P4gkT4q1QJXWo58NRsgz5pVQD17ct576qSu4AxyIPUUUeC2Yk0Ad0eZpJbjaRqRsbDVksShtDcd
	Ldo0/XcFlOxlsBwjUZmpnsjo34IblpS3opsrSCR/vwLRcadpu1OB1CZdSbpTnga8cQ7f5UAi0ev
	gOYEW89Py01vWS+xJfjO1oj4/HN5s9js1nQWKzVghOrZ+vQP2KDgiR80RFI5yVXQL7fXADwQAT1
	UIVHZNpMNb0EIjgvx8PojJEsW4K+YnVOQZLUozO+Y0QPZyi4=
X-Google-Smtp-Source: AGHT+IHyi/uvGmhk3aM7k9lfiHFuzlMMVBXQEVcrisJrW1P2Z+bKg5XkomkmFfIoHaVIJMhUmFfTcg==
X-Received: by 2002:a05:6512:1357:b0:55f:6a38:f6c8 with SMTP id 2adb3069b0e04-55f708a2c55mr3000353e87.4.1756800505649;
        Tue, 02 Sep 2025 01:08:25 -0700 (PDT)
Message-ID: <da4e48f0-12d8-4e85-8693-42d64440aa8b@gmail.com>
Date: Tue, 2 Sep 2025 11:08:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: arch-arm: Drop XEN_DMOP_get_ioreq_server_info
 from supported
To: "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250901125837.1271101-1-oleksandr_tyshchenko@epam.com>
 <5d670f97-5e04-45b8-b9ad-81e42706bc47@amd.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <5d670f97-5e04-45b8-b9ad-81e42706bc47@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.09.25 10:27, Orzel, Michal wrote:

Hello Michal

> 
> 
> On 01/09/2025 14:58, Oleksandr Tyshchenko wrote:
>> The said sub-op is not supported on Arm64, since it:
>>   - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>>     cannot be returned), please refer to ioreq_server_create()
>>   - does not support "legacy" mechanism of mapping IOREQ Server
>>     magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>>     refer to arch_ioreq_server_map_pages(). On Arm64, only the Acquire
>>     Resource infrastructure is used to query and map the IOREQ Server pages.
> These points are valid. However, I don't understand why you mention Arm64 only.
> What about Arm32? It's the same here.>

I will s/Arm64/Arm

>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   xen/include/public/arch-arm.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index e2412a1747..023cc2f468 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -130,7 +130,6 @@
>>    *  HYPERVISOR_dm_op
>>    *   Exactly these sub-operations are supported:
>>    *    * XEN_DMOP_create_ioreq_server
>> - *    * XEN_DMOP_get_ioreq_server_info
>>    *    * XEN_DMOP_map_io_range_to_ioreq_server
>>    *    * XEN_DMOP_unmap_io_range_from_ioreq_server
>>    *    * XEN_DMOP_set_ioreq_server_state
> This list is kept in sync with the op_size array in xen/arch/arm/dm.c.
> I think we should drop this op from there, not only from the comment listing
> supported ops.

I think you are right, will do

> 
> ~Michal
> 
> 
> 


