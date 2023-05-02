Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126D6F40F6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528449.821598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn5h-0004dF-RC; Tue, 02 May 2023 10:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528449.821598; Tue, 02 May 2023 10:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptn5h-0004a1-Nu; Tue, 02 May 2023 10:18:37 +0000
Received: by outflank-mailman (input) for mailman id 528449;
 Tue, 02 May 2023 10:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptn5g-0004Zt-NH
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:18:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1db14ae-e8d2-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:18:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:18:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:18:05 +0000
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
X-Inumbo-ID: b1db14ae-e8d2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsLNfOW1W2yiuCDCNHqvfGcAigxhKI7kO4AessEpqaxhab5srP/+E8y+Yh4/it4dufy3efTI1scs8ER7ickA5l6D1fqANu8uXIdM1a7Hj+9DHv1qn+2wKku6qKJMS+ZaTWacnoJSRYtCeuM5pbpYO4faYnXfELAtMt2SmKtAFUKeaYozSFH7yZaEPfoM/Fx2xUUXJnoaCS02LhhtPzSoMinLJ71sVx54jFREmPsYHxB8RlTtUBckXNKuyTXvlouyWOQAUvUNe+6v6si2Mw4scsYZ9dbkMNFFfiJaNh+nQPWxj3scBLltxvRvZRjhYhou/qjJzBYuVix6O7kookIL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEep6J3w5rqH6AHqUm58pv5LcYpdYtdRvkslNxU9Hi0=;
 b=lMeeamR4dnJZj/VHRXu8MtVO8ydL97TGdNi5I3NEMy2EoRktlPNgOFnujmAlcIbCamd6EePztNBb6+r/wUcfkFapt1Fvvti1ZHyCb1a6k6OivUYfWV1g6gudpuDAiJNMbWHm9XpDMGSsk68TGG1+MZE21JMJoLytrIKs18koCgIEx0c+1cO/R/OkFEeab00oBMLjJwAT0eSTcy7nTxLEjahnbab4wK5WKpdMVKL5VmufEh8kR9oywbg7FpHv/0e9zGEiSqx7/yevFB+kHdtjLq3X4cDBg6g6YJsP+wz+HdkzBvoFcsyL8mKQZAjZh4bgMq+IiG3XtkQkrZS5L7/AcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEep6J3w5rqH6AHqUm58pv5LcYpdYtdRvkslNxU9Hi0=;
 b=NsFcYmJCBrPUKSNjnb4uarYtiTGM0UAYFIYa85CNeR+hA0JMB0fGOVIliOkbWoOOy5Nr1SjLgnpdyUnM/YFUf8KUJXrKybHClaSpapLXnbrD2NujVcBHae/X2lg7K9Md5xMvC9VQtEfQ7+7K/Q72X3TBxH11VmljkjnKpaEEKVYijzTp/1hJTl5TEZ0aamCidRLv0JvhFBnjzavaF/8zuRrLBwolMHMkPP3APf5Ln+zLQqLQjJu7Dgs77CTI4AImAR8IXbmzADJNXf123SrLBTrtkO7WAy0IsneVpX9ZMrHe0gX/gB1rVPI2+HQLpflSfpMyzK4W7imYe58ljUjcHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d865ebe2-81b8-465b-710c-81b9b07c9fa5@suse.com>
Date: Tue, 2 May 2023 12:18:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/msi: dynamically map pages for MSI-X tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ruben Hakobyan <hakor@amazon.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20230426145520.40554-1-hakor@amazon.com>
 <ZFDhr+IlwjCDPOOC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFDhr+IlwjCDPOOC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a28759-f6c7-44a3-ed54-08db4af68461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6KXk2MXMRFBBbxd2KsQxJO3YW5FFhIwGYFrPNRypPOzhHUjagF6Ty+U5LUMR9cj1OAughCW/HicA27D0GhotIam21W5vCZmM8e7mqHAVVo/kyEtjZapMGm4b8+MhtmaSPUP+XFNJ37/ntSg7pCxoqtcUkZNKXtiLJK4qz4+MAwc0mmQVnfppBABAjZrTLoEGX1d39EBUlmCFLMMQFcTMnvFS1EgJKi0s/qDHMC3dEbLiJh6hZZx57XODXYhQhIhHTGKR8Rbvj8DfYLrOoNgCjbZdRdCmJWNSgEHqLTWK+x8s2UhhDxGDKxPVf4ccJBR9LMU9jSueNnP6LCSmV58CdDoKeV8Qcl1jqzSX4YPV9dfwobcr9aHbv9Q5HqRzq8qnjPlZp4F6uJCIw0NqjS5XLPO9ew5B8WbuXRfAbbrZwHeqHGFkuS6HSg9pSfk0sdpAr3spdE7PZ9ylJipyEjyZGOjqWH4aP1QJu+SHJvuvR3fSTvnEm8aSASosZb4BgMLxniJVQjgE9Kghfi9RaKDjLHXMvLDDKWqwPWz1jVL0JYXvDzXX0bdYl4PEaCO/R71WEO4K4fVVUicS211SsKwUajszehktqV9eP1pyQy64/8VPiiGrOUcMDk43FVgzHPBSnzlsPs0POQs3TS6qs/XJQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199021)(31686004)(6486002)(66946007)(66556008)(66476007)(4326008)(54906003)(478600001)(110136005)(316002)(86362001)(36756003)(31696002)(83380400001)(53546011)(26005)(6506007)(6512007)(5660300002)(8936002)(2906002)(8676002)(41300700001)(186003)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2YyR2x1WjAzeEtEVEJsWlNLdnowM2dpK3RJRGFoYVlhTGlTN3dZUUs5dFh0?=
 =?utf-8?B?TTBicmtrUjJwK245Z1l3UjNYdHgxVXJ4aWdZNVd3MkpWZzBHUTJveHpTaGxG?=
 =?utf-8?B?eUN2akthOE5TOW8vUWFabmNkNFZQNU00MmtaTXFSeUZvYzBCQWpSeWZQNTdF?=
 =?utf-8?B?QmdvaWgrQ25iZVN6QjR6VDJ1cEVLdjN4UFJSa3RHeWd1ZW5QZXV2cDQvYTVU?=
 =?utf-8?B?amxvaXczcHhYejhHV3VINEFuR2NZN0ZxU3pVbEVnV2ZvM2pEK1VPb3V2MVg2?=
 =?utf-8?B?aVFzc1E2V09hRWx6SkR2a1h5VlZlUTcxUTFGb0lqUjVQcWpIbHUvVy8vNkpz?=
 =?utf-8?B?bmZ4K1ZkWWJvVW43a29hYThER1lwYVZ5ZHgwenlTU0RBN3dCSG94YlpOQS9z?=
 =?utf-8?B?aWNNTzJhbTNjdGF0d3VVNWlKQXhtbDZZeWhQcHgxQ0UrSWdlSDN4RStxQUp1?=
 =?utf-8?B?NldBR1ZPNGI4SDBSU0lTVWVBVEY0ZGxOcjhydU9uYkZKU1FLNmoxbjBsQU1k?=
 =?utf-8?B?bC95UHNXS3NmUWsxVzUxRGlWcTMyeXZWRE45VkU2MTBoUm5WWTh1OHQ3c3po?=
 =?utf-8?B?WmxsdFhHdU1hZmZaSGd5SytLUVJkek1EcWJISVp5cm5Oa1oyakNuNU5CMFVm?=
 =?utf-8?B?MnozRFAxczhreTFIb0c2aDNWWVlFWUdybUZRRnpvU0VDMFYxVFhhdjgwQ0tV?=
 =?utf-8?B?bGwvdGQ1YVZaQjk4UzJheTlwUzJvc3lPMTNnMXphMlhFRTZzNW1nbm9FQ3R2?=
 =?utf-8?B?ZVdzSUF3dG5raVE1cGpmdGFFaS9zTjF6bDBZQS9pZWtSVnkxZU5scFVTS3k5?=
 =?utf-8?B?QlQ3d085OVJxQ1dGSU9GeHZnTDJOZHIraUJpaWt6QjdUbU9lamRIOHZLM1B1?=
 =?utf-8?B?bm1vWjhLa2c3eWNCN1dGQ3pJc0hCV0NXRytVNmo1YUx0Qks4WlpkdDVNV3pP?=
 =?utf-8?B?VGxJS0hVNFhFS2N1UUsrRFI3OTVxbG9wOEdMN2tITndVbTN2dFFIV0djdzRN?=
 =?utf-8?B?anFwMEFSbDBSd2h4STRPMHVVUlFrYUNRRGQzN3hIa1dWaGRuU2djN1ZpVFBj?=
 =?utf-8?B?V1NqbVVjUHFDejd2dGRZVGdGZld3Q2t4eVVFeURpVmV4L3M5QnJURTIydlJn?=
 =?utf-8?B?Rmo1Q0tRa01vMEgxSlFhVGxNa2hucEVGeGZlTGhCWkhVaHFiYzBaWHlVeVB5?=
 =?utf-8?B?am9XbWUzMTkzY3lLTzM0Y0YxUWFvbnF1a2hkcVhtdFc0UTc2aWxyYlVZNHJF?=
 =?utf-8?B?WmtGZTk1ZkozZGFJNFpBMVBwZzNLTFZ3WDhrUlJsSGtDbGVtT3JQZDUzZGNx?=
 =?utf-8?B?ck9tLysvTWtMY2pqVVhNMFlkS0ZPQmZVQWZRYVBkbTZvSFJUSExJOC9TTHNU?=
 =?utf-8?B?ZVk2TStUQy8rZS9zUjBRR2h6a05ZTmJMdGhYUEFXL0Q3Wk1JekFQSkU3S3RJ?=
 =?utf-8?B?SkZYNmVwZVJTb3NQT0Y1WVNOWStVbmZJMjV5SlVyVmJTamwzMXpnbzJjSjZ2?=
 =?utf-8?B?R01KZklYUXhUZ3p0eEpsbzdpZEdLZDBxbWlNNUZuTHpLN1YveXpBbFpnZGFO?=
 =?utf-8?B?Mm1UTWQvSW1ZRjBuZ091Q1V6QW1oSmIzKzh2Y2JDRWNPKytQSUU4ZlRmYnZU?=
 =?utf-8?B?R1EvQ0p2azliRlF1RjlDL25DYkg3OE9XTHNqRnNUS1UyUVBtU2twSExMb0JW?=
 =?utf-8?B?UXFGdmhoTEQ4NlMxVXEyWjh5b3dTVmdEZW11RGpQYVlDWmtCN3RnQk0wS2pX?=
 =?utf-8?B?MVAwQkE5b3RnSDBSY2c3SjhIRmMrcC9tNTRnR3VySFB3VExnaEp6MkRlYzA3?=
 =?utf-8?B?Uk9QSURObTBoMDVUTVJ6NnFqMTZzSktHR0xiOVBZcjVxK2dhVWhtbjFtRUpY?=
 =?utf-8?B?dWlpVWY5OUZjWWFTKzNDZmRqSzZ1c3JidEVXa1FPUFBIb21TWlJMTEY2aUZl?=
 =?utf-8?B?OG5mN0JxYVBaWlQ5UXlwaDMyMDhybkRtbkFFRVVzSWp3VWZ4Q1NYcTJhSHp6?=
 =?utf-8?B?dHdheXR2S0NxYXFyb3JmN2VqMjJTT3pDT0tmcFF5MU5wQ0ZucHcrTDZMM2NV?=
 =?utf-8?B?cVNzZms4dTNGcTEyUWlZQzVrRVR6UE5ockZnNi9pWUNmUUNGV2M2RHdSLzFo?=
 =?utf-8?Q?nXd3bMQedZtN7NIG5hR/zoClQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a28759-f6c7-44a3-ed54-08db4af68461
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:18:04.8553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R72a0Hf6PwzwKaBPqgw+V77gQGse1nWl3+k++TGoTltIJdOXLquUPaHVCbqfa7pUOaKcsffi5JnVNIarsZAGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On 02.05.2023 12:10, Roger Pau Monné wrote:
> On Wed, Apr 26, 2023 at 02:55:20PM +0000, Ruben Hakobyan wrote:
>> Xen reserves a constant number of pages that can be used for mapping
>> MSI-X tables. This limit is defined by FIX_MSIX_MAX_PAGES in fixmap.h.
>>
>> Reserving a fixed number of pages could result in an -ENOMEM if a
>> device requests a new page when the fixmap limit is exhausted and will
>> necessitate manually adjusting the limit before compilation.
>>
>> To avoid the issues with the current fixmap implementation, we modify
>> the MSI-X page mapping logic to instead dynamically map new pages when
>> they are needed by making use of ioremap().
> 
> I wonder if Arm plans to reuse this code, and whether then arm32 would
> better keep the fixmap implementation to avoid exhausting virtual
> address space in that case.

I think this would then need to be something that 32-bit architectures
do specially. Right now aiui PCI (and hence MSI-X) work on Arm targets
only Arm64.

> This also have the side effect of ioremap() now possibly allocating a
> page in order to fill the page table for the newly allocated VA.

Indeed, but I think the (vague) plan to switch to ioremap() has been
around for a pretty long time (perhaps forever since 32-bit support
was purged).

Jan

