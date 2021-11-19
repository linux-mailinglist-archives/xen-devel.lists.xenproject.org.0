Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0CA456F19
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227867.394222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Kd-0002Wl-G3; Fri, 19 Nov 2021 12:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227867.394222; Fri, 19 Nov 2021 12:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Kd-0002UF-Cz; Fri, 19 Nov 2021 12:49:31 +0000
Received: by outflank-mailman (input) for mailman id 227867;
 Fri, 19 Nov 2021 12:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3Kc-0002U9-AG
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:49:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2268e6e7-4937-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:49:29 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-DnNb-oR-NNWlSY-Mmeo72Q-1; Fri, 19 Nov 2021 13:49:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 12:49:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:49:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0368.eurprd06.prod.outlook.com (2603:10a6:20b:460::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 12:49:14 +0000
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
X-Inumbo-ID: 2268e6e7-4937-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637326169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0aiZyQ893H87PplnJ/v5X2YUGgRMy1gS/lYW2dLN3c=;
	b=G8gqRgHRjfjSf1fFqhmg/09LPDhVgFc2JVwL0k98Y+nvWGX5ziGYQJbjvFr1wAbItxa3E5
	qg7tJPTR2n5ymosNNCmp9B0UafB8+yUpGOCPs1Ynos9DM6ashuwFlVlaVw29AIyxdZjYvl
	iyHGSpjktyRHldc/1r85WBCfrgGMy+U=
X-MC-Unique: DnNb-oR-NNWlSY-Mmeo72Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3iYza2fjmqFlakqYsQ6uImQMrxdZJyOQ4eZZKbkq9ZAkLqavYtT3JOq5Yxbho+iivFzF+Bokw1L0RuaEkQk5SJ//X6R3NL97uHnImtsqSrn8YAmUrm4m39douZybdkMK3uCoZEO0voDqn+tdaLeWxdNTh8giWvxTUwkmcGQbPyw8e8n2DSXd0V9gq+76u5wDQ+tGWHONOudYNHEMMAcoweH0BtJPLhR/0yjH5liHit/Si0TeZYadaIaVY1lIJWwvdxwKR9oZkr718blUNV/NF1puWwQv7rJK6ofwt+uZFIsBzWtbb8K79jDi6ZLlY3cl4KCRAsCSCwLnKHZLsnIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0aiZyQ893H87PplnJ/v5X2YUGgRMy1gS/lYW2dLN3c=;
 b=XiA4731hI2Ps+QGsKpQAQfw1VPnc4gQQi+VtJKyRxQILgw6RwR4KcHFesGJfL2zYzyom2MzUgIS+gy6hW1xl3eh/ROAcXhyGVFdHIgyy9U91R4avPd0TEIuenq6ynkCxuyT/RO8cvVvRp+zkJzOmenslsBt0XDRp9pKAZSNYR0OiBKvUDyQGunBnnRGIKSeDWRyNqtNGLNJEZ0KGtt5Vwfz2aZoVfnLYu1YFHzn4gAvcq1IVavqdG3m7XqLZjtoKNsYDwQXznBzrfeSn0UYVzudXcbDVnBL4xUV/OBUSQ5s2nZXiSIZp0O+TGsFaZBZjGdW5Us4cow8nzZzGW7kWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
Date: Fri, 19 Nov 2021 13:49:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0368.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30317d71-35b6-4c12-32d9-08d9ab5b045b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6382ABB077502A8CC26C5F2EB39C9@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M9IoxhL/jZQ+fYl0RMQTMbwpBasCqafKwYSnbwhycmVZmsRrU9s6Ku7lJQtET6czVT35oR1kYWDVKbTfwwOSVIBim4yLbFY0Y3zs6UgfxTQBhe2k67Yi0jCrB9jXLSRNwAi8fzg1w5g760Ysnn7vNgVB0H7LJGQD4vvye5RO10kApY0BzKCedWWP8bpUGaY0tckZBxPxEeQK6IpHURMJBwHsuoyJS0mlJ2prVJeKkjRKB3vbtuuJvAkRTAdK0vFjo2rQ9L9wqaxYl0KEMykhm4sKeTSPi7LJqlRVeDosiY5s+cJg9Z01D9TEA95tjOKkFZlRrNhnhCHfeu9VvRpzqg6B7NfmVxRt7TrRI6arORbWglHEwNFJgZTvDE1FhOjruHUoCByc3syxzt95/e4JC5WItuAtyQw8Idl5ASo1kAgq6p9URd65e1BuuKrH4g68CdOQ1IFDHWU1yjItJJdWxFZCP45OHBla2HNF5F0pA1YSkW+01w1rzLrX31USYAL0pPmdkhpK+zm4MCyaM1ToxQo6trAhOaLShC92WvRN9mT9BtNMd3tyDwKk1QbmqWf7ZrhXwStzwBmsskv/xFs7+rbUDr7h3lcMF5Tg2mKLIs3sn1S04w9wqJ7oi/ZQAcpHWTLx0nV8L5ssdw2CuhKqALpwbe8vYsQSEhEvAK/fJ3KJqaYzrUdVBG8uR32Ajv51nmm/IpaOu03sx2elyxTFm67L4xNoUw2ej46qgRt57mI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(5660300002)(2616005)(8676002)(38100700002)(16576012)(6916009)(316002)(54906003)(4326008)(86362001)(26005)(53546011)(2906002)(508600001)(7416002)(66556008)(31686004)(66946007)(66476007)(186003)(31696002)(6486002)(8936002)(956004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aERPVHYrZjB3STFQbk1lOXY4UktzdjF3MW1aMzc5VUpOZUMwNkgxUDNGMUVJ?=
 =?utf-8?B?cnMrVHBZeXpXZXBKTHRQS0dXeXlLS01lTVJ3VzlKWSt2U1VHNGtSYXYvbG84?=
 =?utf-8?B?Z1lUSXNVQ2Y2TERwY1dUVDRhTzJYRHErek9MUDFnZWlEL0dUS3BOL2NHYkd1?=
 =?utf-8?B?bXBJS0QyOWxXQjZkc3M4SlpSY0hXZkdUdE1OT0VvT2NoYUFyMUc2dFBuRCtq?=
 =?utf-8?B?Y3JqVzJpY0N3Znp0Wmp4ZTVSMDczNnM2K0wzcjM1Nk5WOFlFU1dUU1E4Z3A5?=
 =?utf-8?B?bXg1SURPVmtxOGdDQ05VNks3My94SVN1Yy8yZDlGRm1OQjdtSDJUMTRsUUxW?=
 =?utf-8?B?emtnV1dGUENQQVA2ZU9hZUx6TEJxSUJCYitpbFhHR3BrN2drNUpBUzNrd2VL?=
 =?utf-8?B?V1VhYlVubGVNQ3JGQkdZTW01OCtWSktEMWNMbXEyNElkVjFQVXVCVTJTellE?=
 =?utf-8?B?K0dDSWtnQ1lhTFViZkdTQVJKOWVlZnpZbU84WVdQbXkzV1ptTFBSdml5eFor?=
 =?utf-8?B?UlMrWit5Q1FDQnY3Ty9RMlJ5cDROemhJUW5QMlNkbGtqVTRFZm16S2tsNDk1?=
 =?utf-8?B?RWFQc24rT1JHeEkrdmVNeFZLMytwOGFESmJqSlRxbFRiamdPZTdpeWlGemI5?=
 =?utf-8?B?dVB1TGJqSy9JNEtmWmZxSTd3VTI3UmtmN3dlWmlJN0VuR3hoVVJ6cm13UDRm?=
 =?utf-8?B?VFFOekZqY3RZNWFORmNhemdValp3eHBJT0lJckk1MjVnZXlaeWY2Sk9BMExP?=
 =?utf-8?B?RVYzVXhJd2JFYzUwN2RmTXQyUFlXL0ttbXlYTURJa3hXUDZBb3hZdjVKazRL?=
 =?utf-8?B?SEhiZ3dPQTJYL1NESGI3c1JBUTNwUVluRW94QzZuSzV1RE8veDNMV2pDWktp?=
 =?utf-8?B?OTVvUGp6ZysyeTluYWQ3aURIeXJLd2w1TXJYN1I2R2w5RGRFMjN5dEVuaUNM?=
 =?utf-8?B?SEM1R2RkU3FGTkRHQmhyaXdMTkZybW9QT1dNcG1VaWE0dC9IMERZd2I0bTZ1?=
 =?utf-8?B?MmVRVGU1c2Izdzg3UHJ1ZlhscTlmWFptYUErcjd6R2ZjR3BGcmJNNXVXL1o2?=
 =?utf-8?B?WE11M0llWFZRRTBvZzl4OEZNSGhnUlRSaGRXRWpKaGsxYkx1SVRYOVA2N3hN?=
 =?utf-8?B?Zk9UVjFZbTY1MkFrajJTZk43YVp2aUJuVVlEMHFucnJ2YVhMc1NkL0VKbEZD?=
 =?utf-8?B?MTZBMzZZYmtsZXlTclA1SG9TMlhoVUxJaGJyN3pmaDdjdTl4WlQ3ZHhVT1or?=
 =?utf-8?B?WlAwQkR3Slp2YzNzRHlUbk1LMnZ3Vk5JOGN3dlFaNk9yS3lBUG9NbkR3RUwv?=
 =?utf-8?B?bW4xTlNOejFPbm45UWN0WVNsZFUwZnRxUkxnZ0NwYVE1SC9XVGFoZENaTSs1?=
 =?utf-8?B?VUltdjZ3R1J4RE1zT2cxcThLVnNsOVBXeHhiaGNLeVFZbklENGNCS0xZT3Bs?=
 =?utf-8?B?NWR2b2RTRUtscGViUk5CU09Lc0ZYMER0WlhQVDRRckRRakhVWnp4MHVWODNN?=
 =?utf-8?B?cDdvSVpxWEhqTzMyN0hZc2MyYWdUd2hzY21NQzhnakFHWGh3eFN1cTBiYWt5?=
 =?utf-8?B?OEhqcXRMQS9tZHV4ZldKU05PQjFIV3FhYkRRS2dRWEFmVjBQRFhxTmxjYWZx?=
 =?utf-8?B?UUYzczltYnRFVUF3eHN6NHBWcXBpQ1Z4aElod2VaL1BKZzRwUW05aXlvWkV0?=
 =?utf-8?B?aDErR2l6dDQxS0JuSm9HUXB1OXM1ZWNoTU1iK1Q3QnRWb0lhWVVsMkc1dVBr?=
 =?utf-8?B?b2RkRFlNeHRHR3BrNmc1MkdVMnBuVnBnUUJncnVqR0svNldFajREOVMwSWRQ?=
 =?utf-8?B?aDVMVXBHQ1greGpoelQ3dzMzaGtzMFAwQ2lUZkRENzdCMFpsbURXTzRlU3Nm?=
 =?utf-8?B?OCt3RWJacVlBWDU0ZDBvSFpSNGpuZCsvV2QyaHV6b1dOQTZZMlpkN1lxZmVu?=
 =?utf-8?B?VmJ3bnBSSCtXdkh1QTExUDBidmJ3VGs2OWxCSzJGeUdaSlJ2eEg0eXZDdGgv?=
 =?utf-8?B?ZW9HblVuM3dMakxtaHRPMVZTV2dQdDNQV014TURNdnhXSklISm55dlRyRC8w?=
 =?utf-8?B?NWNoeGdXM1RxUlpUVyszdSs1S3lKSklxVnNFUktDTEdGNXJuOVkzZHRQQ0Rs?=
 =?utf-8?B?M0o0QkVDZjd6WkJPUkhFcEErK1ZWR2dXSCsrWXF1eHdZMXRreEJCVko5Ri8x?=
 =?utf-8?Q?d22b/qoKF4P7ldEwOIsKnmI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30317d71-35b6-4c12-32d9-08d9ab5b045b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:49:25.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeHcT/8E3T+fC/hM63m+My5n0tLtLKSie/p96i8OCcjsmbT3VlJm2hgAL/XWRUdWWA24pHX3EK6zD2hnpOEKxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 19.11.2021 13:46, Oleksandr Andrushchenko wrote:
> On 19.11.21 14:37, Jan Beulich wrote:
>> On 19.11.2021 13:10, Oleksandr Andrushchenko wrote:
>>> On 19.11.21 13:58, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>>        pci_conf_write32(pdev->sbdf, reg, val);
>>>>>    }
>>>>>    
>>>>> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>>>>> +                            uint32_t val, void *data)
>>>>> +{
>>>>> +    struct vpci_bar *bar = data;
>>>>> +    bool hi = false;
>>>>> +
>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>>>> +    {
>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>> +        bar--;
>>>>> +        hi = true;
>>>>> +    }
>>>>> +    else
>>>>> +    {
>>>>> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>>> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
>>>>> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
>>>>> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
>>>>> +    }
>>>>> +
>>>>> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
>>>>> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
>>>>> +
>>>>> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
>>>>> +}
>>>>> +
>>>>> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
>>>>> +                               void *data)
>>>>> +{
>>>>> +    const struct vpci_bar *bar = data;
>>>>> +    bool hi = false;
>>>>> +
>>>>> +    if ( bar->type == VPCI_BAR_MEM64_HI )
>>>>> +    {
>>>>> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
>>>>> +        bar--;
>>>>> +        hi = true;
>>>>> +    }
>>>>> +
>>>>> +    return bar->guest_addr >> (hi ? 32 : 0);
>>>> I'm afraid "guest_addr" then isn't the best name; maybe "guest_val"?
>>>> This would make more obvious that there is a meaningful difference
>>>> from "addr" besides the guest vs host aspect.
>>> I am not sure I can agree here:
>>> bar->addr and bar->guest_addr make it clear what are these while
>>> bar->addr and bar->guest_val would make someone go look for
>>> additional information about what that val is for.
>> Feel free to replace "val" with something more suitable. "guest_bar"
>> maybe? The value definitely is not an address, so "addr" seems
>> inappropriate / misleading to me.
> This is a guest's view on the BAR's address. So to me it is still guest_addr

It's a guest's view on the BAR, not just the address. Or else you couldn't
simply return the value here without folding in the correct low bits.

Jan


