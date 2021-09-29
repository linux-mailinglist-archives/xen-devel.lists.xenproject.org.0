Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0241C3E9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 13:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199020.352830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYA4-0005PP-5t; Wed, 29 Sep 2021 11:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199020.352830; Wed, 29 Sep 2021 11:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYA4-0005Mk-2k; Wed, 29 Sep 2021 11:54:08 +0000
Received: by outflank-mailman (input) for mailman id 199020;
 Wed, 29 Sep 2021 11:54:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVYA3-0005Me-6B
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 11:54:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f20fa97a-211b-11ec-bce7-12813bfff9fa;
 Wed, 29 Sep 2021 11:54:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-CgckERszOWWT22jBwUymNA-1; Wed, 29 Sep 2021 13:54:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 11:54:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 11:54:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:f0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Wed, 29 Sep 2021 11:53:59 +0000
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
X-Inumbo-ID: f20fa97a-211b-11ec-bce7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632916444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8z51UwVKPDWSBfBs3ps8xHTJL4MdVWelWkGkGl6tl3c=;
	b=ak+z841ZZ113xFMjU+03MT0x8IQ9tVEW1qsonsnfV1KQAZnwAcU6TMlddTB1eVegfKVRUh
	diRBFu56m6MrxL6qnpI160y3420Afv2lCr6OJB/gVgkVTPTdvbJOQKvTvdueTZL6siWf9U
	iHY6M6VIDy3JFHQa3v8yFJlQiqX1OU0=
X-MC-Unique: CgckERszOWWT22jBwUymNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAX0+2E76jqnGOi8jd/pBuNipq77Q9K2zrTNL7pJQnpJK0LExgG9N++i+hK7XNEZEDOKx4DpV07jzuCKmClBHtY0B8DqoEFs2QZqXxv3aDKvwf6+iDYJE6SPfnxtVrhw4gPv5wu/T5HZIxMcVjIXnT031S5/rHmBIBwopc2nyQUF3V/3EW8C/tK3tJsPzcYThyzlwJjcsVvh6QpldK4GksWcDkesWiI3citXfy4iOF1+0ZVawbnDxIeClWH7lFPQuH5tqosCmuxxRwHCSB5zLmpBjCYgkwZO1B81ULXPGl0P3mZLAf/cLbQAk3C4s7ibAbl6RDhHe11JQ+1qJZmCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8z51UwVKPDWSBfBs3ps8xHTJL4MdVWelWkGkGl6tl3c=;
 b=PG51bbUGl9fRQsum3lMMKT7fpmPw8TpDsLXgQ/YTeAP/p6lzIgivT8J5rU4ksiJW4kfp/k+/RAjRejTn/CNMFiGabupR9IIihfwCfZFRiOty8YVWP/zmelyH9bnjcKsYEFXs/Po/wjI8DY7dQJ6VkKmfE8hV3TN1TYKnl0TJZrHZ0YPFvTGD5bW8UhlZ28xqVZoRH/eOi34DbMo/RltLumsyctZbFt85v3CU72eRyjMslw+fsJPlRKL9smZCS51wqqqr4JZtiJUwOXHvj8naMHJEDlJhNCOiaARJXb/wDoEFRud4C7ztuY0jmK1PFHSutvJo96e3oy3BPh5hhDWBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210928163209.49611-1-luca.fancellu@arm.com>
 <20210928163209.49611-3-luca.fancellu@arm.com>
 <120aae99-d8f9-eef3-e6ac-b1b9b842083e@suse.com>
 <AB8612F0-623B-4E64-95FD-1D73E49FB169@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f64b6b7-e394-c57a-b4c1-b88ef09a9609@suse.com>
Date: Wed, 29 Sep 2021 13:53:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <AB8612F0-623B-4E64-95FD-1D73E49FB169@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af19d288-9a38-4940-792f-08d9833fd3ae
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480E2FC2D5B45ABCC7D69B8B3A99@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yF43TbKNOLojtuPvAmpOfwfPWKF4s23ySOFw1UU6FcH9H48NHtyH5ULWMhB4dUXB5i+acZ08G4CgdPhjt8D5wVZRUiSKcXPfkLIQYTvG1tNuTU48rRqzrcK0AogY4QDTQZsKDtlQA745w4MIcVZbX7MwlGqnkenxDL0oB7rjSZHgspryrZtEuZ1S0cVnyXW8uABkXRz5ZpO5QcX/Foe7epG7sB1CH4x0od/vkKlmFUr7WCK8su0VMzBNV9yRW9uapet1ZL8GxgLaQA3x3ffYkBcqwE9+POSyvNSpzeuK2GbEYRtB5rV1svS2jiPPqslBH5LVx5phUt4i/TXEXpSb58nR/y2cxVHvpKCYwfyvhjBSHnySF6pYD3AVo+m6KlGLQyAEsM61kYnq5m4+ls48c3OE6zEfw0PpzSYwke/44r7YVNPVItyUvjfMR12pR+2E7Y2oOav+fKoiZ7ZM1dFpGUfg8jcuxNDNY3u1Rwb918J9Ft6UiKoSryiOZeptT/M0kKQZH6cN/OiQPRrWZ/lFCUtm820WYMbD+zfvYkbl4+6lUFmc2aejesSu1K8bJxfJe5D+LvU+U/xVabOttiD3uyIkgLDncuxEpCb1rQq3/NXZlEIKLHJgCxlW+aIuPOLB81VJbXFvy8HHn2FVO9ynzMiWzeEM2V3yUQEulYZs+c6u4HwT3ahKWKTnC3NLkaoWutI0Mh/m6WaHCRyyd8+kYwYqi77yXEEq3Jpilen1bHaHPbak3TwG9yh7GGCQUoq2Kw2afPCB5ALSB5SfOG6EqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(2906002)(38100700002)(26005)(6916009)(53546011)(8676002)(66476007)(8936002)(66946007)(6486002)(186003)(31686004)(36756003)(54906003)(66556008)(4326008)(5660300002)(2616005)(316002)(16576012)(956004)(508600001)(7416002)(86362001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejhrdERzZ24ybFVqRmdzN2FvUUUxaU0rcmVyWXZNSmY0UFJueUgvMVZEWUYx?=
 =?utf-8?B?VnpoeUIramFQSW9WQkw2OGFPVU9sRjBoakRNdjR0YTJXd3ZWV1M2c1hTb3pE?=
 =?utf-8?B?MDhBK3ZJQmNYMHkzSWN0QitlcUZxS3luU1pzTDFyWXRyUXM4dHhETWIwMkw2?=
 =?utf-8?B?aHdsWldOUGZXS1NMdHZZeFNUYTJTV3dQTnVZVmt1ejlGSE1JcXpWSCtwMkxp?=
 =?utf-8?B?T25VaWFoQmt6YnJnWUtYWmZvOFZEY3FSbEk2RE5jQU5TenRzYXgyMEVOTzNz?=
 =?utf-8?B?cDFmRWU5Z1hCUng5TXNyOFNMOHZ1VXpQdm5xZ2x0TXVUcVFXa3FxSXJzbFh2?=
 =?utf-8?B?T2tPKzJHWERCQURtMjZnenBXa29LVVdqb2RrRlFlTWttS0RaTTArSVFGMDJG?=
 =?utf-8?B?MWlIT2RRMTFKU0h6UWQ2L1B0cWgrZjZwWVVlNjFMQmpCL3BnVFVOV1hQeE5y?=
 =?utf-8?B?THRZVnMvbU5zcmtRSG1NR0txRFRBUjZsTENKUmFJbkJacjFIQTk0anEycm5v?=
 =?utf-8?B?dHRuR0wxMEQybFp6ZVVFY2ZacVllUy9LOWRKdkNaSVMyV1FuSzFzUXZQVU45?=
 =?utf-8?B?dExPR0ZKekZYdmYrNnVLY1Q4MU50YTQvcUJGTzRJWGhFd0Z6TUN2cTFuSEor?=
 =?utf-8?B?enZJSTY0dGd4amh1ckQyMnkwd0hOQllWb24zbmxBNHhzZDNSc0NvdSs5N3lS?=
 =?utf-8?B?amZENUcrU1FmNEFKWUlKWVpJVHpKd1NyMVlFOTNXcENpYlJESHVuSjRDcGUv?=
 =?utf-8?B?bzE0VTRWQ2VUZGFWaWYvb1lSVk0vcDAxeDBCSkRWUEZUYjV6L3M5T2ZzOEY0?=
 =?utf-8?B?bU5tLzJrYmpFcUNIU1h1YXgycU1GbnBtbENQeWNBSkN6UU9oYU95TjRxQjFS?=
 =?utf-8?B?M21hMUdCZHRFdy9ab3FWYUxjRitDZG9JT0thaUs5clZEbE9tNkt3RStUdWlJ?=
 =?utf-8?B?cFpGK3FvWlBxdzJUZWM2NjJkd3pXc1JYZUtLTTl5RE02SjJmMzdOZ2JUSE45?=
 =?utf-8?B?bURaQUVhcVRzOTYrVTlEbXpFWi8rb0NDTjhxUzF3bjZzanhQNStHTnZncmVS?=
 =?utf-8?B?MVRGVmlFUFVCS2hJbGpHQlJuak5UamxBdld1dllDaGVmTWp5NzVZK3dPYzFE?=
 =?utf-8?B?MlhTcDY5OWsvbXE2RURoVzF6SDluSXRNWG5lNGUraG1YZkhFeXFDcDFZcHJG?=
 =?utf-8?B?MU93Q2k3N21ydEtHU2FMVlNEUzRRd2hJUGYxVTlWVFBNV2hvNEx5ZmFiMU1Q?=
 =?utf-8?B?MWFhR0dvWTNKUWtDNk1hbWtlc1cwUkpkdWRwNjcxeUJJVkdEQlE5MnlvNEY4?=
 =?utf-8?B?anNtWmFtS1ZIWU8vOWdDMW5vRzJMTGp3MkZVY2h4cTJjL1VSMFlHS0MwUGRS?=
 =?utf-8?B?NGxkclg0bUY5NS9DWjFxUWx4TFg2bVBzTFRGTWdyY1Q4VHBYa25GNzZGV0dw?=
 =?utf-8?B?QmZ0SUs5OTJHZDdMcjNDTnphTG9tVU42eUY3VEZwK0JnUmVXNmFSUWduNTd6?=
 =?utf-8?B?czRWOVp6MmFKbFBaenNVYWFRL2pVa3VielpaTjVxRStWKzdmVXFkY1JuQnhT?=
 =?utf-8?B?QkwrbVgvNWpHeEdkSzh5ZDhmczU4MmdCRUd5eHh2bG5XWG1pdU1acjRoNHNU?=
 =?utf-8?B?SjB2Z1VoTzFMS1dwNDh6MzQxMXNPQjhPeDgzcHBScXJBWVB4YkFhcGFUNVhD?=
 =?utf-8?B?ajFSQjlZWS83UVBCVC9nNytmcDE1bFBsTUkweDZjaHJkZXBZb0p0eHpMemZm?=
 =?utf-8?Q?vUle45PuFCdS1Vl9+twlfL8TWbC59VsoRV3FW9o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af19d288-9a38-4940-792f-08d9833fd3ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 11:54:00.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5CmOGjd6g5p9+gcgwnb69unGfU7SfPLSmRCVMsdg0cigbpw5eAAcHoQ0g99mL7WsXOrrp92l4rcgRx5gjJpFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 29.09.2021 13:30, Luca Fancellu wrote:
> 
> 
>> On 29 Sep 2021, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.09.2021 18:32, Luca Fancellu wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -678,6 +678,12 @@ static void __init efi_arch_handle_module(const struct file *file,
>>>     efi_bs->FreePool(ptr);
>>> }
>>>
>>> +static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>> +{
>>> +    /* x86 doesn't support device tree boot */
>>> +    return 0;
>>> +}
>>
>> Every time I see this addition I'm getting puzzled. As a result I'm
>> afraid I now need to finally ask you to do something about this (and
>> I'm sorry for doing so only now). There would better be no notion of
>> DT in x86 code, and there would better also not be a need for
>> architectures not supporting DT to each supply such a stub. Instead
>> I think you want to put this stub in xen/common/efi/boot.c, inside a
>> suitable #ifdef.
> 
> Sure I will enclose it in #ifdef CONFIG_ARM and remove the x86 stub.

Hmm, so you've taken my reply in way quite different from how it was
meant, albeit I can't see how the last sentence of what I've said could
be interpreted in this way. The more generic stub wants enclosing in
"#ifndef CONFIG_HAS_DEVICE_TREE" imo.

Jan


