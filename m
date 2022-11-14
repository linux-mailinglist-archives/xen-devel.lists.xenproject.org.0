Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11A627BC3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 12:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443274.697824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouXN9-0002Cs-Mo; Mon, 14 Nov 2022 11:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443274.697824; Mon, 14 Nov 2022 11:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouXN9-0002A8-Ji; Mon, 14 Nov 2022 11:11:27 +0000
Received: by outflank-mailman (input) for mailman id 443274;
 Mon, 14 Nov 2022 11:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5ls=3O=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1ouXN8-0002A2-QT
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 11:11:26 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 122ba2f9-640d-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 12:11:24 +0100 (CET)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N9mnz1YN8zRpK3;
 Mon, 14 Nov 2022 19:11:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 19:11:19 +0800
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
X-Inumbo-ID: 122ba2f9-640d-11ed-91b6-6bf2151ebd3b
Message-ID: <c7bc7aa8-8753-e099-f8f2-8624feac6870@huawei.com>
Date: Mon, 14 Nov 2022 19:11:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] xen: add missing free_irq() in error path
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: "jgross@suse.com" <jgross@suse.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221114070702.1887144-1-ruanjinjie@huawei.com>
 <4b735f01-6028-d7dc-d715-8c56c790a8ad@epam.com>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <4b735f01-6028-d7dc-d715-8c56c790a8ad@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected



On 2022/11/14 18:45, Oleksandr Tyshchenko wrote:
> 
> On 14.11.22 09:07, ruanjinjie wrote:
> 
> Hello
> 
> 
>> free_irq() is missing in case of error, fix that.
>>
>> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> 
> 
> Nit: neither subject nor description mentions which subsystem current 
> patch targets.
> 
> I would add "xen-platform:" or "xen/platform-pci:" at least.
> 
Thank you very much!
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Thanks.
> 
>> ---
>>   drivers/xen/platform-pci.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
>> index 18f0ed8b1f93..6ebd819338ec 100644
>> --- a/drivers/xen/platform-pci.c
>> +++ b/drivers/xen/platform-pci.c
>> @@ -144,7 +144,7 @@ static int platform_pci_probe(struct pci_dev *pdev,
>>   		if (ret) {
>>   			dev_warn(&pdev->dev, "Unable to set the evtchn callback "
>>   					 "err=%d\n", ret);
>> -			goto out;
>> +			goto irq_out;
>>   		}
>>   	}
>>   
>> @@ -152,13 +152,16 @@ static int platform_pci_probe(struct pci_dev *pdev,
>>   	grant_frames = alloc_xen_mmio(PAGE_SIZE * max_nr_gframes);
>>   	ret = gnttab_setup_auto_xlat_frames(grant_frames);
>>   	if (ret)
>> -		goto out;
>> +		goto irq_out;
>>   	ret = gnttab_init();
>>   	if (ret)
>>   		goto grant_out;
>>   	return 0;
>>   grant_out:
>>   	gnttab_free_auto_xlat_frames();
>> +irq_out:
>> +	if (!xen_have_vector_callback)
>> +		free_irq(pdev->irq, pdev);
>>   out:
>>   	pci_release_region(pdev, 0);
>>   mem_out:
> 

