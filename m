Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C8640D7E2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 12:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188358.337497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQp0I-0001ye-85; Thu, 16 Sep 2021 10:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188358.337497; Thu, 16 Sep 2021 10:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQp0I-0001vq-4Z; Thu, 16 Sep 2021 10:52:30 +0000
Received: by outflank-mailman (input) for mailman id 188358;
 Thu, 16 Sep 2021 10:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVhn=OG=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQp0G-0001vk-Gd
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 10:52:28 +0000
Received: from mail-pg1-x531.google.com (unknown [2607:f8b0:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d460d58-1427-43ce-9436-276fe892b660;
 Thu, 16 Sep 2021 10:52:27 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id h3so5760568pgb.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 03:52:27 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 21sm2624212pfh.103.2021.09.16.03.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 03:52:26 -0700 (PDT)
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
X-Inumbo-ID: 3d460d58-1427-43ce-9436-276fe892b660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VNKbu9+xQ5ZpUtGvMTcqpK8Ho+xMSyVZ8+L+t3qGVwI=;
        b=XSZj6K6WXxfevgNkMQWTVWN/pRsGZ48Hpf1aapa7yFejBTCFdA6HUCPwkA38CUvHOb
         12EGRvxxebdCNuoE+ObAyvTNwWyxDdbNnDJYQNBCpkkMDkdT2sOdFGpKg9oYBfCBDwL0
         XflKHpxQXjZ521DE/0ZBRDz1uCKiQSaIrItzbkcc7HCVprwqAzWPmTfhfdTuxhcGIkae
         17ws4naiLQWag9g0raMGIBW/7G/5E7reQPZwNkqgzzUPtdDb0IjYRvViaMPYRdxPUde6
         Bl5njgBd1GAcMu72JAentZ78PNGD3qywdjPZPtQPg3O6M2RygtB2NwLk/e/0AhwfWnul
         yMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VNKbu9+xQ5ZpUtGvMTcqpK8Ho+xMSyVZ8+L+t3qGVwI=;
        b=Sv79o/8vV+WjuYfB0HCEl5wxMn5Hbh4Ac48XEU1ZLoXpG2tcz7aYsiB7Q18+ZuSwdh
         d9BuD88M0TYpsKdk0ttX3E7709O0DUetIskcwOMWN1BVlRzrghTAidRuGEodU1wNNXEj
         DfwRZIeH6CTLYdxosA/lGC/Xz0gilggsoZhu2PKfHGuq2IieTJIp/SV53N1InoS/83t3
         W16MCihpQciVbcK7uNq9bGSXkIFCVqZ7EVJZ9jmauMtPBG1yv6en6IJaeJc0uBgjl2Du
         wa6bflB5KnlRGKWvTdf+7hoNQ01uE4cVQQoH2zGeMpzqkm5InNPfTzb6HB01TB2Okq/A
         dE2g==
X-Gm-Message-State: AOAM530fUJdl/FIemQUtVXMfPsc5LLWeWVKS7VkwynZOA08Cf1XTLvHF
	VQiiP3MyytwjU+JSggoHvxs=
X-Google-Smtp-Source: ABdhPJyl+TWhw4qIPd+GNTqUwBCT0hUxX1fvNVQYkrBsEjf+FvFMSf2MpaDHDZtEUEbJwfeL0pUlhg==
X-Received: by 2002:a63:4614:: with SMTP id t20mr4441488pga.372.1631789546934;
        Thu, 16 Sep 2021 03:52:26 -0700 (PDT)
Subject: Re: [PATCH V5 07/12] Drivers: hv: vmbus: Add SNP support for VMbus
 channel initiate message
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "tj@kernel.org" <tj@kernel.org>, "rientjes@google.com" <rientjes@google.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
 <20210914133916.1440931-8-ltykernel@gmail.com>
 <MWHPR21MB1593D9CB27D41B128BF21DC9D7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <15d177f8-5e20-8630-2b2c-8a00a5309a61@gmail.com>
Date: Thu, 16 Sep 2021 18:52:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593D9CB27D41B128BF21DC9D7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/2021 11:41 PM, Michael Kelley wrote:
>> diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
>> index 42f3d9d123a1..560cba916d1d 100644
>> --- a/drivers/hv/hyperv_vmbus.h
>> +++ b/drivers/hv/hyperv_vmbus.h
>> @@ -240,6 +240,8 @@ struct vmbus_connection {
>>   	 * is child->parent notification
>>   	 */
>>   	struct hv_monitor_page *monitor_pages[2];
>> +	void *monitor_pages_original[2];
>> +	unsigned long monitor_pages_pa[2];
> The type of this field really should be phys_addr_t.  In addition to
> just making semantic sense, then it will match the return type from
> virt_to_phys() and the input arg to memremap() since resource_size_t
> is typedef'ed as phys_addr_t.
> 

OK. Will update in the next version.

Thanks.

