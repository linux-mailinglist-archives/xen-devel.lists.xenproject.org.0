Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52446833B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 08:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238071.412820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtPh6-0001dw-L2; Sat, 04 Dec 2021 07:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238071.412820; Sat, 04 Dec 2021 07:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtPh6-0001bM-H7; Sat, 04 Dec 2021 07:42:52 +0000
Received: by outflank-mailman (input) for mailman id 238071;
 Sat, 04 Dec 2021 07:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Auw7=QV=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mtPh5-0001bG-8m
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 07:42:51 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77693c2-54d5-11ec-8a4d-196798b21f7b;
 Sat, 04 Dec 2021 08:42:50 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id x7so4041395pjn.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 23:42:50 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 mz7sm7286643pjb.7.2021.12.03.23.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 23:42:48 -0800 (PST)
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
X-Inumbo-ID: c77693c2-54d5-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k/XW81IzuVveDnfkiaihrgRy1fm8QRuVkAriBYUSktQ=;
        b=aeetCr9E159DG34hEjAeWGhArTHlrTQp+RvPNuwjMb9u/3PFY53wzhtHubgWJQvDgG
         Jozxdg5UENxD6v0AUKHmjx4efncr1d3uH51laaSKr9cPyQcT+BdlVcFvxfS2q7alc9M+
         IQoElcNzWMNvIxf21BBZKf234HszCsVWMj7scSChzf64nuKTXacuscJrUCAKLRq29Wrh
         e5337Xbg+LNRcQZd6EO7eqCabhSTi7bBHidYnjemVzHYg6jyVwVpnU2LRvbC5rtLuJMX
         22ZzHU6J0KwMuux99RJ5m0Zk9mxBVsGjyiM9lko2MTYAamfaDiH1DIbBhIO1ffuEquNb
         e04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k/XW81IzuVveDnfkiaihrgRy1fm8QRuVkAriBYUSktQ=;
        b=GgQcN1KAkuNUPBjJcjOjDUp59xuxXHrZzrExQidolyPYXDqht3b4tfV/8odO7wBfmh
         GsOh2gn8b+x7wit1TbG21H5m577sFE5Fi0Gya7d4F13LFd808ifhGyMFmlHirz3neOcR
         QYlyZK0CwwcS7B6xnVSaEBFVTqq83wFdSmjYRtFsJsL9p3SGnDG4Zx+lS1JYOWp5RU8S
         DeVMwZLBIv5riRt3IiXE3wpQxWF13cRyex1ar9E/fWMnVC618bvmToIue4OtUpEHxdNs
         V5Ta4H2qvN7oSwKV9gaSEt3W27pqdjM7/E3nNI2ABQj/yZvgqDyfwuxMJl3jRxjRZ+1m
         QpYA==
X-Gm-Message-State: AOAM530BC0xVFgGMBLIRaubTb3JYKKOUhNdl+5tzEKdQn+sS0fRvrueP
	MK2kZUYm+bpDe9fUKNiugFo=
X-Google-Smtp-Source: ABdhPJwRWGj4ETvjt39e2arm3ZwL48sLjKr/6To2ton+oBAvgGlhyx9UEyFTCkGwPmBxwIqCiR8C4Q==
X-Received: by 2002:a17:902:714f:b0:142:892d:a46 with SMTP id u15-20020a170902714f00b00142892d0a46mr28039873plm.39.1638603768758;
        Fri, 03 Dec 2021 23:42:48 -0800 (PST)
Message-ID: <448de4ec-b73e-597f-16fe-623123c04d1e@gmail.com>
Date: Sat, 4 Dec 2021 15:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 5/5] hv_netvsc: Add Isolation VM support for netvsc
 driver
Content-Language: en-US
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "hch@infradead.org" <hch@infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>, "brijesh.singh@amd.com"
 <brijesh.singh@amd.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "hch@lst.de" <hch@lst.de>, "parri.andrea@gmail.com"
 <parri.andrea@gmail.com>, "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-6-ltykernel@gmail.com>
 <MWHPR21MB15934DE25012A8565256336ED76A9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <MWHPR21MB15934DE25012A8565256336ED76A9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/2021 2:59 AM, Michael Kelley (LINUX) wrote:
>> +
>> +/*
>> + * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
>> + */
>> +void *hv_map_memory(void *addr, unsigned long size)
>> +{
>> +	unsigned long *pfns = kcalloc(size / HV_HYP_PAGE_SIZE,
> This should be just PAGE_SIZE, as this code is unrelated to communication
> with Hyper-V.
>

Yes, agree. Will update.


