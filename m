Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378346764E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237401.411774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6hc-0000ss-1T; Fri, 03 Dec 2021 11:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237401.411774; Fri, 03 Dec 2021 11:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6hb-0000qM-UP; Fri, 03 Dec 2021 11:26:07 +0000
Received: by outflank-mailman (input) for mailman id 237401;
 Fri, 03 Dec 2021 11:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRw7=QU=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mt6ha-0000my-FV
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:26:06 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd78d405-542b-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 12:26:05 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id b13so1898272plg.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 03:26:05 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 mp12sm5062949pjb.39.2021.12.03.03.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 03:26:04 -0800 (PST)
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
X-Inumbo-ID: cd78d405-542b-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Df2I2A2zVcIhvBHXD5z9iabD7nB5LthE/+eMaX0CJns=;
        b=LrhVabQro3+RJTAF2UUwo++Q3tHVPc9KkdjTXgZj5009TrrrQoEZbScehBEamrCUSN
         uAuPgOUZCbn39oord0X3XW7U/XIJ2WzNu0xdbBsMDjNH8DRAcaKxm/RnUdXTK7TPH9GB
         /3QVEkipv/oDwHi2iskl2LfbgoDlNjPpNEnAH9c0t4ds6OIO4vgwzDl9tD4vqPr3Jj1i
         soeN//lG51eXYc9/8Noh0CxgiHul5HzjoLY8pcB7lUlMXYr1yF0iF5iR8ZnAimEr0fEF
         u9pUnIeyp3+uCAIcJI0WC45iQsDzZ7vfXZh4Mm9tVdhmXvGp7nCrb22wqTAz0TVn9HBO
         JiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Df2I2A2zVcIhvBHXD5z9iabD7nB5LthE/+eMaX0CJns=;
        b=1oPEW9mD3W8vJJ6nCm9eC46OqPkIWmvZ8zHYwhXktqEwq1bxAfkhRYGF9OzYe2rfzf
         hdzrUY1JZh7VxhsdBt4WZLD8OHRM9lGURd7+vxzBIZNEFeaKLYNseNLpGADfsFtCq1sI
         WodjIii/EIIBAGmIdAsmJuz8+BSH+qPDUHM8C0Y1Jg0P3I6r1DqHTXnRvwmG7nnyeoB6
         ZEL1P46qfi09U74WdjUnDNpQRjAVRQlwsxHzC2p4bOdgJF54GiEZY7EThxdoZ5tTjt5d
         1lEA93TZj3FrQT3sAZ2ehomOklM0xlyQ8lMfIBZpk7HpJJexv2vc0lE/M33PDGsWbQue
         vDLw==
X-Gm-Message-State: AOAM530OCZa+rAuwh21Rqu9OqPLM/3fwM18KuPhxIAdwVkBoNPbwuIGi
	djPLFoqiQhDw/wEkmKbiqho=
X-Google-Smtp-Source: ABdhPJzPvoKIz31xLOmSdpnjjIrMa2J9GjBdJxPwkC+KmRLj7Ds+PG6GrIFi6sWFBo0epAEx6rdfGQ==
X-Received: by 2002:a17:90b:190f:: with SMTP id mp15mr13348018pjb.210.1638530764387;
        Fri, 03 Dec 2021 03:26:04 -0800 (PST)
Message-ID: <4006e942-b6bf-ac21-c56b-4719e514dbd2@gmail.com>
Date: Fri, 3 Dec 2021 19:25:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
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
 <20211201160257.1003912-4-ltykernel@gmail.com>
 <20211202144336.z2sfs6kw5kdsfqgv@liuwe-devbox-debian-v2>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211202144336.z2sfs6kw5kdsfqgv@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/2021 10:43 PM, Wei Liu wrote:
> On Wed, Dec 01, 2021 at 11:02:54AM -0500, Tianyu Lan wrote:
> [...]
>> diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
>> index 46df59aeaa06..30fd0600b008 100644
>> --- a/arch/x86/xen/pci-swiotlb-xen.c
>> +++ b/arch/x86/xen/pci-swiotlb-xen.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <linux/dma-map-ops.h>
>>   #include <linux/pci.h>
>> +#include <linux/hyperv.h>
>>   #include <xen/swiotlb-xen.h>
>>   
>>   #include <asm/xen/hypervisor.h>
>> @@ -91,6 +92,6 @@ int pci_xen_swiotlb_init_late(void)
>>   EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
>>   
>>   IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
>> -		  NULL,
>> +		  hyperv_swiotlb_detect,
> 
> It is not immediately obvious why this is needed just by reading the
> code. Please consider copying some of the text in the commit message to
> a comment here.
> 

Thanks for suggestion. Will update.

