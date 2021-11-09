Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3344B2E6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 19:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224100.387182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkWDu-0004jP-PM; Tue, 09 Nov 2021 18:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224100.387182; Tue, 09 Nov 2021 18:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkWDu-0004gv-MP; Tue, 09 Nov 2021 18:51:58 +0000
Received: by outflank-mailman (input) for mailman id 224100;
 Tue, 09 Nov 2021 18:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nz9x=P4=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mkWDt-0004gp-5k
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 18:51:57 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c89db65-418e-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 19:51:56 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id 13so336682ljj.11
 for <xen-devel@lists.xenproject.org>; Tue, 09 Nov 2021 10:51:56 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z17sm95703lfd.242.2021.11.09.10.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 10:51:55 -0800 (PST)
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
X-Inumbo-ID: 1c89db65-418e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RcJOxCwTS3Za1DIXebYmwbP1nNUgtXkGoDkbHuW872I=;
        b=OhQHI2GVJY5W0lErScK7eneQ/f/+RdYbeY3Y+SmN+kIDHR+iZhBRROw9jYtynPnJo7
         8SFuBzGP99E9sPLKWqLn6qJWx56bOK/QEpAF/odpjjzXVUd2Htv03o03loj7l56f4hSy
         bcUTbJoFVDbWsTyfXC8BCto5EsSTE+q6sQkzqSAZ0d8exYF3hUkXNNXnK3+bpG3XtKeu
         l9tCL6eneF+GW4zaqcRu7E46ZRZ1kmcPyctPf2Czgh1+VCN37RBX4HBNmZ2WijkDDOuF
         bGyYJsxZzDf9MARqdvrhQz32cwngT1jdLf4XzKzzw1BxbIeNg9up8CZbH1ENROB+Poji
         Kn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RcJOxCwTS3Za1DIXebYmwbP1nNUgtXkGoDkbHuW872I=;
        b=XWj5I9n78UbOWSKpB3fOSxL97fBdHrqC761Vuy03uRm5fGu0o2qibn3pGBKmJq+8qh
         2byaTKvI2BNwJxusQUcVh8TXa9HMoHSiwtgdfM/L3OL15A/+wHAhp5uR82eqm55TODHa
         2go4V6zSXxMISoSJ4rK1RXnE9p9/G5VMI3A3WUNKJCLEH9zEWsiWCyUJsmrmkZpOclgQ
         0vdtcYLoYRQ0pjTIr84lVtAa/17cJ67qidMtO6hmWMrt+rqkSK9K4DwgWmqdwH/iZKwr
         6Hmkkqmp4GA9Nw5bQJ/GxTYe7/Mf+v9aJ7Uk89xitQKEUyQmLKIplEwVAlwyqw0CxYzd
         nDaA==
X-Gm-Message-State: AOAM530ojIzqeDvmGT+Teh9rfg6e9Bz0qrqDajZ1lZZ0yQ5KdLxQ6HHm
	XdPI6p6AyTr8IS1w0M2r/ns=
X-Google-Smtp-Source: ABdhPJxayf9eKbrNJ/FjI4DOI7nzTR9/ujN9m5MahKE+KF9yMCPcrSW/UchrHS05w8LK2eVXZZ4BwA==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr10191516ljr.408.1636483915850;
        Tue, 09 Nov 2021 10:51:55 -0800 (PST)
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <0b1837f9-57ef-8deb-df78-cb7841d93d68@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <00a9467a-3e48-9c68-1ac2-7ec2c7380d97@gmail.com>
Date: Tue, 9 Nov 2021 20:51:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b1837f9-57ef-8deb-df78-cb7841d93d68@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.10.21 22:08, Boris Ostrovsky wrote:

Hi Boris

I am sorry for the late response.

>
> On 10/26/21 12:05 PM, Oleksandr Tyshchenko wrote:
>>   +static void unpopulated_init(void)
>> +{
>> +    static bool inited = false;
>> +    int ret;
>> +
>> +    if (inited)
>> +        return;
>> +
>> +    /*
>> +     * Try to initialize Xen resource the first and fall back to 
>> default
>> +     * resource if arch doesn't offer one.
>> +     */
>> +    ret = arch_xen_unpopulated_init(&xen_resource);
>> +    if (!ret)
>> +        target_resource = &xen_resource;
>> +    else if (ret == -ENOSYS)
>> +        target_resource = &iomem_resource;
>> +    else
>> +        pr_err("Cannot initialize Xen resource\n");
>
>
> I'd pass target_resource as a parameter to arch_xen_unpopulated_init() 
> instead. Default routine will assign it iomem_resource and you won't 
> have to deal with -ENOSYS.

That would be much better, thank you. Will do.


>
>
>
> Also, what happens in case of error? Is it fatal? I don't think your 
> changes in fill_list() will work.

The error is fatal as we don't have a suitable resource to allocate a 
region from, and yes, the fill_list() must not be called.


>
>
>
>> +
>> +    inited = true;
>
>
> I agree with Stefano in that it would be better to call this from an 
> init function, and you won't have t worry about multiple calls here.

Yes, that's good point, thank you. Will do.


>
>
>
> -boris

-- 
Regards,

Oleksandr Tyshchenko


