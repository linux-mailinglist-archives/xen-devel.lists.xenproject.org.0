Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09B4533D6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226299.391006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzCo-0006ey-5p; Tue, 16 Nov 2021 14:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226299.391006; Tue, 16 Nov 2021 14:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzCo-0006cE-2p; Tue, 16 Nov 2021 14:13:02 +0000
Received: by outflank-mailman (input) for mailman id 226299;
 Tue, 16 Nov 2021 14:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmzCm-0006c8-Ri
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:13:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dac051c-46e7-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 15:12:59 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-g0fHA9t3NJ2OYU-yk4Uhbg-1; Tue, 16 Nov 2021 15:12:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 16 Nov
 2021 14:12:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:12:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 14:12:55 +0000
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
X-Inumbo-ID: 4dac051c-46e7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637071979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IyKxyp2bgnLyHxgHbqYzbTTGw+e8z5zgUCFne7TGBAA=;
	b=BjMt3nOuR8Ibjx35iFlObjvDAA358oCyK6evmu7BxLZEDpRaRe1ufAtFgNvoLfukf6W/oT
	VYaipctriRHrGJvPilAuwQXShjrj+5WGz09KRwlW0BWOWlajHbKH3SrYOWLN3xgq8Sq5sd
	z7LdVCQui8AtDQnWHn7RvGvyxSfvvj4=
X-MC-Unique: g0fHA9t3NJ2OYU-yk4Uhbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnbZKKsu0+gA0lrY3ws05YRUJqtBPEYv9fXroeA5bfWqqt9ZPhkTmK6mK+cP/8Ce0r2XAHiilqTJT98UZt3uwGTTuERu8yFsEc/8t2nij6AMx+jQI6lm9YxakGcalLbgZJipjSZ83IT6i2f/m2w1iW2Zmr1wc9VfLRFqeyjQ1B7tyZrMG4XgK+KCdKE92JJVBiZCpLuR4EDKlxzIcyTrbQJiCTzPD0YNFqQY5llANxJzTDTErm84s9gNX9LvweX0Enwdv9aVgvuLHkWZOoO3juHPtuKYdHD3c/NvLQkyCE/vdY5UFG2fDpYGd8MkJRaZzXZMIOJl/z5s3NJ9FoOBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyKxyp2bgnLyHxgHbqYzbTTGw+e8z5zgUCFne7TGBAA=;
 b=ZIduPe/9ZlANo15T0TlVumJrVQB6Ge+uPdaL5UX6Glrx7hjIqe+jVzddzSYa+ztclC+6u5VnftcGA6vOtxtDungh//cYLtQ4mB/hWfwkn010v5cDEvdQRcd1zbKF30rcq9XN0goTUaD+7gfE7yDcJ8SYKrGyKuQ7M0kxa2dr2DBgj4EXPy0gwKhVIww4kx57VfL2a7X+8oPwECwW+ILqRiOWSJTXNENPFzGILBrkEkHhYR0YMqGR39HLgtZ9e0fuev8zk6YH52OZCi/vvVylYWwN5yqgOuIDN8cMoBXPbTmJnQdAb3K+c1IKcXXrRiPgl0przz1dYPbXij49gG/Sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
Date: Tue, 16 Nov 2021 15:12:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48aa785-41bb-4005-722f-08d9a90b300a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70402BE39D33709F4C19BF19B3999@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8qWhQLeMJ2j2f/Dk+XutDYZckTIW+BNTpizUAyZbnWZlaIicQgiaB87lj1wN3aBoYNZYK/Eb5h/H9oyBcfjyONODZbpfucGjiLez6z7mMM/xdWGODyu7Rx21fsSKmTKGlVfHrjXX3b8XlBPyASzt1wiTkDb98NYZYcDuy9Ybd9k/pUcd9piaJ+3C2jY7uuA3qrOh4sZZ7XzUgI1G2XAgvRZcAyIr5HjlhomB2HQvR/RY4C9bnmGRF5bwsmKeQY/CycUDgVBiUKxBCOv2tdm0TuBM/FMates8ziwo1pTCy7fbEfW9VMTbENfNU9YUfFpcuNS6EFRb3Sqf2U+CmP9Ajkz1urgWjCf9XNb4lxSRCaBjwRUqrEuOEqUObOp/yjPRqkvJc8SMbONh5Wu/nbPEclG8yvQ3c3vuzkSVAELPgxKWEBt+OT5YRdtPmTBMlPKs+V4ZvSJlIRGUwqlKG0biCWiobYmez/cO40kKRmK2z3Zdh2c//g4zKE86SHBWm3ExKJAzoISFoDBzGQmmHlMv/Ur0wvTezAtBs2DPfhE7tY7SyANU59BDAbGnmazzVBLhB/E7uygaqmDmMLvmCTfpDQ+ltBEobupUeftYqN2puZEIyT1qRau0cjmRG9lfgUPVQjw0RoALDEXxg3Xk5A6JCpIkrE8CFBsVmX+tQIwY6hP2On2twG73QZAxdBNGz8DTpYeXg2tiKMY6M5LU1XAQ6HDvlJjS/YQ2bQwQfLk5RfbJhC1jChOUmON7cmfmf4P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31686004)(8936002)(186003)(508600001)(2616005)(36756003)(66946007)(6486002)(66476007)(86362001)(2906002)(66556008)(38100700002)(7416002)(4326008)(6916009)(53546011)(83380400001)(5660300002)(316002)(31696002)(8676002)(54906003)(16576012)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tzh0STUzdmY4NFA0MEZhVklra2k5dER1NlFtK0lrWmxKNmo5NEIxYTFGTWdR?=
 =?utf-8?B?VzJuWGFQbzJVbHNFaU5kUkU5YmQwcENnK3FQK21tTjIzWFBsYnZ4TkNNWS90?=
 =?utf-8?B?ajNqMmNoZm01bUdqZVdxdlgxdkw1ZDNGRlFBS2hNMHVzU0lRN083OEcraDJD?=
 =?utf-8?B?TUlubWVBcS9kQnVOSHBBNFFiWFdJczR3dzc2Y2NUTGMvUHhXNG1jT1lUQ1p3?=
 =?utf-8?B?bWlLck9KT0FvYnY3NnYrYnc4R1laKzRhckxkbHBsbkFCSXlSaW03M2FiRmxD?=
 =?utf-8?B?bVBsM1lzc2lKNmpEa0lUT2h3U1pVcmNFajVPZUYwd0VaMm1wUWpVc2tGZ2lH?=
 =?utf-8?B?T3lpWXd6c2Z4cE9UeFdNQmpqaGlranJEdGxkclZuay9uUlptT29ONFZPc0x1?=
 =?utf-8?B?TGxUcWhXNHFxZ3RoblZGQ1EwVG9TSFFEeWVaOW5tVzJCbCt6dWFaeFZ2emlI?=
 =?utf-8?B?QUoyYVBET2wzMTBJTFRGeWZaRE9mREg1cXZ0KzR4ZG1Ocm4vS0N1dGxiNEFU?=
 =?utf-8?B?dTZkbDdTK0VLK0VpWHFnQ0Jham5vb1ZObG11QnVZT1dyL1IyS1ZnbXE0bk9H?=
 =?utf-8?B?bStnT0c0RFNSNEtoSkcvSHJlSDJEdEhYa2VjOFhaRnlwb0VDWmNCUFYvYXl6?=
 =?utf-8?B?REFTa25PaW9GZS8yZlpkdFZta1JPQStFMkNaT0pWUnlsZ2JMaXZqdElqNzlT?=
 =?utf-8?B?TWptUEEwc3hTazVTQklHN1RNb1orNE53QkNUeTBaWGpYNmd2Y2FYNHpWN29V?=
 =?utf-8?B?aXV0bWpuNEZxZ2t6QTlTS0NnRk9uTFE3SGIyN1lGeURIWkpqQ0FJM3gzTWtP?=
 =?utf-8?B?N2lQMkYrK3dGSjNmdHFBU2FSWm5sVEVlS2pNcXljdkpLeHJsanRlbmtWaFZB?=
 =?utf-8?B?Q0Z4azdjZTFTcytUN1A5dHJkVjl0cUt0aXFqd1NSZUdEMjdXNjNXWkplM0Zx?=
 =?utf-8?B?MU5WMG5vMStSLzU1cHhac0xSdkVweGEvNEN3eGQrMnNscGUzK2d4RjlXU1VM?=
 =?utf-8?B?TVcwVkZLQmw3NG1wMytRSWVUYUZydU5MWVQzdmJlanlCT2JFS2w5SXFNK3JT?=
 =?utf-8?B?VGswNzg3Z0R5WS9FaDJvZEtTYWJ3QVY4TGtaYklRa3JRYWk0dEoxUUppSDdl?=
 =?utf-8?B?S2Q0d3lJOU13ZFhiTG9tY3l3cWNEbTdOaExYVlNsQmNkRFI0SXp0TkJDdFJ5?=
 =?utf-8?B?MzFIKytnMG1salFMT1dBb2NaZXV2STFMaUJPUUp4SHdrUzZlRm9QRVI1SjRq?=
 =?utf-8?B?c1F4OTRSeTkxeExVL09OSDVSOEd1T1orVnpjQVBqckxlUFNBRG9vVmJhWnFH?=
 =?utf-8?B?TWlCYnd3QmpVaFRYaGNQdWExR1VxVzduK3Z6OGNBT1BwYkZEUjBDbmVVN1U1?=
 =?utf-8?B?V2VRSXNmSjZKME1xM09YUm5YbGxDM0hBcGFxUFBoRHRTNDliK1FMajgvT2xR?=
 =?utf-8?B?R0ZTbnlyRzQxSHNOb1lDSEVpcXAyRjFtQTNqditad1JVT05qeDF6aUdjV1k4?=
 =?utf-8?B?K3hpYzhjT2hGaEZvbmhtNVlYSnF6WTNVZTFETFJnYXk4RjJVNU9abUY0NEJq?=
 =?utf-8?B?b2YwR2JGVVhBWjVqVHRTeU4zZi9MN0tkbk1hWE11emdVb1A5OGNlcUZoZVlu?=
 =?utf-8?B?aVM0OFBOOVdKWlAxYmVPSW1UckdwWnQ1cGEyTXBqbDJudU9HdzBkRExOOWUy?=
 =?utf-8?B?U0FzY0JzNUdqWGszY1JLQk8vK3UvYUhXY3REMDFJRGs0eW5lNmtXL3FENGth?=
 =?utf-8?B?VHB1dzBqdlMxYTA2OC9KemlESEs3a0luakFGVUtCNXF2c0RUbFIzcG5EVE1a?=
 =?utf-8?B?UEJWUjB5SzBINkwwU01WQkJmQW5jSm5waTNxVUQwMzR3QklreUVrRjFHWlho?=
 =?utf-8?B?VWNaeFNsczNha1R1UjVscitJdGFWK3FJYjlTWG5JaXRXTFJxci91Mk84ODgw?=
 =?utf-8?B?Q1ZaQyttd0s1RE5HQnVlWDU4Y2Rtbzl6SFJ2SStLVUpIa2lCS2V4VDRqK0dY?=
 =?utf-8?B?KzRFM3BkdHJjMDRyTTFIaU1ROWNYVHhldWFwT3ZUOE9zRXE2eHg1MTFCQWRQ?=
 =?utf-8?B?UXNxMHgyRkZBaXVteUdBYmYxT1hiSEdQRHRhQ0ZOQ2Nhdmp4eGhtM0F2TG85?=
 =?utf-8?B?R290RFZwZjRFRFkyWlVDcE1sOU5DYkpHNmlUUzJDM2lFRzgwSk42UmdseHVw?=
 =?utf-8?Q?fJQ22lAakxI89c/TzbOMrBg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48aa785-41bb-4005-722f-08d9a90b300a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:12:56.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqN9J0d4Eyyn1mLIWqyTPV7Gq9ZrkeVXOmBZYvcKdW0HDtpkMBrTXgU3/u24RzwGkWm7yiFhAlpeC8faUizfLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 16.11.2021 14:41, Oleksandr Andrushchenko wrote:
> 
> 
> On 16.11.21 10:23, Oleksandr Andrushchenko wrote:
>>
>> On 16.11.21 10:01, Jan Beulich wrote:
>>> On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
>>>> On 15.11.21 18:56, Jan Beulich wrote:
>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>
>>>>>> When a vPCI is removed for a PCI device it is possible that we have
>>>>>> scheduled a delayed work for map/unmap operations for that device.
>>>>>> For example, the following scenario can illustrate the problem:
>>>>>>
>>>>>> pci_physdev_op
>>>>>>       pci_add_device
>>>>>>           init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>>>>       iommu_add_device <- FAILS
>>>>>>       vpci_remove_device -> xfree(pdev->vpci)
>>>>>>
>>>>>> leave_hypervisor_to_guest
>>>>>>       vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>>>>
>>>>>> For the hardware domain we continue execution as the worse that
>>>>>> could happen is that MMIO mappings are left in place when the
>>>>>> device has been deassigned
>>>>> Is continuing safe in this case? I.e. isn't there the risk of a NULL
>>>>> deref?
>>>> I think it is safe to continue
>>> And why do you think so? I.e. why is there no race for Dom0 when there
>>> is one for DomU?
>> Well, then we need to use a lock to synchronize the two.
>> I guess this needs to be pci devs lock unfortunately
> The parties involved in deferred work and its cancellation:
> 
> MMIO trap -> vpci_write -> vpci_cmd_write -> modify_bars -> defer_map
> 
> Arm: leave_hypervisor_to_guest -> check_for_vcpu_work -> vpci_process_pending
> 
> x86: two places -> hvm_do_resume -> vpci_process_pending
> 
> So, both defer_map and vpci_process_pending need to be synchronized with
> pcidevs_{lock|unlock).

If I was an Arm maintainer, I'm afraid I would object to the pcidevs lock
getting used in leave_hypervisor_to_guest.

Jan


