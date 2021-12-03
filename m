Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BBC46763E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:24:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237394.411752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6fO-00089m-EK; Fri, 03 Dec 2021 11:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237394.411752; Fri, 03 Dec 2021 11:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6fO-00086c-AA; Fri, 03 Dec 2021 11:23:50 +0000
Received: by outflank-mailman (input) for mailman id 237394;
 Fri, 03 Dec 2021 11:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRw7=QU=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mt6fM-00086R-PK
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:23:48 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3fe6d2-542b-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:23:47 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id s37so2692974pga.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 03:23:47 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 s19sm3163132pfu.104.2021.12.03.03.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 03:23:46 -0800 (PST)
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
X-Inumbo-ID: 7b3fe6d2-542b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5qOEsIBGR+o+C/Sd/hZPIupqUBKJep0nylH6kuX0Ydw=;
        b=q0Pme1zsdQbsn/2lt0smQ5WZz4BXmeUPnOOQ1muby1YCdz5IT1U09UP1jUBBmxEyPL
         NOru1PSpvapDsmivD7kZ9TeY4nIh4h/PD8j+3/Qjz2xIc5mwaH978BhiApU+G+OBiI7v
         q/qNUWoMUpEW19dcyNf3m0rrPCJ/jIoQ8FNY77sy6LiOJroeLUPHkq2iJ8x4EVpI8qAR
         W8mXj1YcXAKXWrwiItNpeq0F/HQ8gvHL9KZdDyXlYDHHoBYGqS65rRws5i+e6DI7+Z4H
         wLyunjYStAzQIYUzq5SzqUYg0FmBREr2lO1ssgnjS7fDp96JlKgzobkXt7gXkITr/9HS
         GSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5qOEsIBGR+o+C/Sd/hZPIupqUBKJep0nylH6kuX0Ydw=;
        b=zN1B8hEVJ3uzzlZbeZ5HWWCKIMyZQAdsVg03Ic+0z38mQTleSxCzAiXsGJjFxzJXpY
         P8TaBT5xUKRDSq74oC4CEaxlA+r1YOMpA72AW/Jnx0CqDThZ457hfGB5aSAGPFlA1G6n
         RhRSxtnguqmlWXQI0cySnbM/wVLsGmgERJS/z8iF4bGSzCz01t9+FITi3mMj7bP3Iu4o
         UZP9gjSnDMiVxk7w46OTupna9KoH9mbED5GtdsgK+kpfUDoxCNXvqkWTA51D46v3/9nI
         4xoRs0pXPAB4tg/6ffIl/xEHto+YCGLT11GaSct7pQXXXL5QVNAxpWADkkjJQcxc9T6H
         AZ8g==
X-Gm-Message-State: AOAM533atOCSv3y1b0iRxLzIVxEnDBkh1WrM0mlDZjaFqWGP+H1q52e3
	bsy2Px7zCIv381asRjTpe5o=
X-Google-Smtp-Source: ABdhPJxsVhY/s/+3W38Gewn81IUYDNoXcMk2IwynUbTteHgWiue1YzqLNGeWHF+qlwyyWcrcPKXfoQ==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr4006669pgv.190.1638530626460;
        Fri, 03 Dec 2021 03:23:46 -0800 (PST)
Message-ID: <03718701-d27b-7da9-2849-46af3efaaa98@gmail.com>
Date: Fri, 3 Dec 2021 19:23:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 2/5] x86/hyper-v: Add hyperv Isolation VM check in the
 cc_platform_has()
Content-Language: en-US
To: Wei Liu <wei.liu@kernel.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
 will@kernel.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, Tianyu.Lan@microsoft.com,
 thomas.lendacky@amd.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
 konrad.wilk@oracle.com, hch@lst.de, parri.andrea@gmail.com,
 dave.hansen@intel.com
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-3-ltykernel@gmail.com>
 <20211202143946.7o7ncwcjq3t6xcrq@liuwe-devbox-debian-v2>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211202143946.7o7ncwcjq3t6xcrq@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/2021 10:39 PM, Wei Liu wrote:
>> +static bool hyperv_cc_platform_has(enum cc_attr attr)
>> +{
>> +#ifdef CONFIG_HYPERV
>> +	if (attr == CC_ATTR_GUEST_MEM_ENCRYPT)
>> +		return true;
>> +	else
>> +		return false;
> This can be simplified as
> 
> 	return attr == CC_ATTR_GUEST_MEM_ENCRYPT;
> 
> 
> Wei.

Hi Wei:	
	Thanks for your review. Will update.

