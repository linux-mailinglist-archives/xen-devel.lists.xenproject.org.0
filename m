Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424742A8BD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207475.363326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK0l-0005OG-MQ; Tue, 12 Oct 2021 15:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207475.363326; Tue, 12 Oct 2021 15:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maK0l-0005MT-JE; Tue, 12 Oct 2021 15:48:15 +0000
Received: by outflank-mailman (input) for mailman id 207475;
 Tue, 12 Oct 2021 15:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maK0j-0005MN-J7
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:48:13 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8def96-88cf-4d72-ae19-3b189f7e5c57;
 Tue, 12 Oct 2021 15:48:12 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t9so87949124lfd.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 08:48:12 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c24sm855222lja.52.2021.10.12.08.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:48:10 -0700 (PDT)
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
X-Inumbo-ID: 2b8def96-88cf-4d72-ae19-3b189f7e5c57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=b6PuABebMZgQhVbL8I8sua236kFuHfHUd128sudRUvk=;
        b=EWzZvM8zyhVxegPoJZ8E4TQKMNIeoHeDclck1QADTX+NvrMivEAaYPU0lS5jjQju0R
         4PTOsXAhak9LYE7Nptb6S5D+6L7ll+8wQbUwSn4o++i+uBQ/EPPJ1pfAzOIANwdQpW6+
         grilIbL2je5JcZpCD+ktSvKro+lqAG+8MX/VF1dc+KMQ3+mSocX7Oidgh0NaGNLfvboN
         IzTdUtz96aVeQO39kMSwP7/5AIFELi/EG2+YZIEs6bxHDhzsQeI2R4fkWPw+4JzyUMmo
         RPFn9FGWijkmR58xK1UvKeA9ScM2w/dzAmL/IR8OO3TcCeQd2woPZCxYWQGmDJ+SYTj9
         cXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=b6PuABebMZgQhVbL8I8sua236kFuHfHUd128sudRUvk=;
        b=ncZ8Olxf+nqsVF0pkYmDanb15ITZ5f2IjajBgFTnjKntn0ahbi97cd1Hka+5sdNKNd
         IeTSF1YCDgJt7zhIYB3ZI+mGb1lULkrwusLLLkM1sGvpQT9GXYl1v6j7HJEZ7vL5XI/Q
         RvcX7Yzf0okkDN0WjDN4jqCD/h/YxbszSwE+f8O3EwgmKsVnG8POKm6xT7DGXuQxhIrM
         ULicJlHiVem1VqcfHvpNyJ+v9NgK00tME20uNWo1dJXK7aoFVMqtTM+uXB5VyQTAedAo
         KNboR5dBP8r9RrIBGA3GBexBIKYaZHhNFZ7XBnUNSmMDfZPqISAc50CmrpeXROC19HQy
         bNhg==
X-Gm-Message-State: AOAM530DPSFO9XgZSXos9dXI6jLuGNWP/5QmEVX+kFmodzkJ5vIrrj5v
	wxmzrEroha7xdf4PF3V3T1Y=
X-Google-Smtp-Source: ABdhPJxwuXnPhUorWIRQQepHLbim8uw0NAEz+1JiJ1VZkWknkCEz1parM/E1h/KOklap+ZK2LsqNAg==
X-Received: by 2002:a05:6512:2291:: with SMTP id f17mr30398792lfu.253.1634053690727;
        Tue, 12 Oct 2021 08:48:10 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <24933.42667.311553.565032@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
Date: Tue, 12 Oct 2021 18:48:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24933.42667.311553.565032@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.10.21 18:15, Ian Jackson wrote:

Hi Ian

> Oleksandr Tyshchenko writes ("[PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported guest physical
>> address space size to the toolstack on Arm in order to properly
>> calculate the base and size of the extended region (safe range)
>> for the guest. The extended region is unused address space which
>> could be safely used by domain for foreign/grant mappings on Arm.
>> The extended region itself will be handled by the subsequent
>> patch.
> You say "to the toolstack", but you are exposing this information up
> to callers of libxl.  Do you mean some higher-layer toolstack that
> uses libxl ?  What does it use this information for ?
>
> FTAOD I am not opposed to exposing this in this way; indeed it seems
> likely to be useful.  I just want to fully understand before I give
> this my tools ack.
I didn't mean any higher-layer toolstack, sorry if I was unclear. In the 
first place this information is
needed by the entity which generates the device-tree for the guest on 
Arm (tools/libs/light/libxl_arm.c) to properly calculate the extended 
regions to be inserted into the hypervisor node.


>
>> +        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;
> I'm pleased to find that this is not arch-specific.
>
> Thanks,
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


