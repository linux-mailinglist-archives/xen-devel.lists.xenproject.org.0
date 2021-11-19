Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA19457026
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227962.394421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Ot-0002by-Lr; Fri, 19 Nov 2021 13:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227962.394421; Fri, 19 Nov 2021 13:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Ot-0002YP-IR; Fri, 19 Nov 2021 13:57:59 +0000
Received: by outflank-mailman (input) for mailman id 227962;
 Fri, 19 Nov 2021 13:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo4Or-0002Y0-Cr
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:57:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29768a2-4940-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:57:56 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-RvNbStJlMZW1NYQ6D8rszw-1; Fri, 19 Nov 2021 14:57:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:57:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:57:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:313::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 13:57:52 +0000
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
X-Inumbo-ID: b29768a2-4940-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637330276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIelfDHgW9Bl6uL3rurtp6p0J7AcKWD1v7olwfE/yn8=;
	b=AwtiPC8iHop+GOo2GdWa++aQNGA1TL8rtIMbSAEA8Eh+Eu2g6VVg5qmWyubtK4tTuxS4YJ
	5enyc/ulqKK1JldU7cqqJv/rZoQ6MwDtNKq+FyJWyYzZXSNP15bnajfCwURmgiYV+Qglcy
	WMSe5FVXObmxawDoue5RL1mJVjm2YJ0=
X-MC-Unique: RvNbStJlMZW1NYQ6D8rszw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldtn4LlYmQdOdw4gkKp2953yfsfJsyRtfyhqmOq80LsCWzkLGJYtK4sefjIfCM4Xfu3fun0e9NyNY8r3lBtMIcpfYnmeoexi24sD7ABQDvvqUWKaNaFD6WEkksiv2dOFDKb5LmPgEv/VQYvsegif1AecwBJj1zwgZASRnyZuTBipyWojj7brSo4rNvZlnySr9MHnZX4QPCvY6EpHSGzpNwKXTF33cJayGHUhdC3ycdOmUpKjeJ64oYLef90kmqjAMC2lVMLOnheHy1v7ZFAX2/J98Fgw80H3YcpoJv1hA4fQr9phNytEmNGIUy8ZN7C3q0tMuFVckYQMP+odfsdPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIelfDHgW9Bl6uL3rurtp6p0J7AcKWD1v7olwfE/yn8=;
 b=KRrYRCPLMMdtRvxYpRwQXg23ADJJZ/CblxfA2a0wHPuL/ICkvEqwXrBX0YmkXJDK70C8wPEYVEYGld3INkD/LdoYyRxl56LMIFqQwuooaS3zPNloXOxTSmiIklWRN/7CPp9FPj0cUQM8NpNKdAcyIP7S8GW50CDXcBKgqmVFajmBSSPjDrItfW28pWb8Xzv6IAzS3Hmx7Xjvsul/fRjs5tN5yHZa7+6TlwlYFvMIiBq1hM1Q9CjJ5Zdoi+ZSzS+3hWpOzG20ERH9zvcBjKgckB2lC6UE5wcWOIBaheGdAzVvCI4cTx2hg6DFV+B2g5EVBwABnk7Y76GGa2ao+leAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb72cae2-1b7e-8d52-48d0-2967c68325ea@suse.com>
Date: Fri, 19 Nov 2021 14:57:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
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
 <20211105065629.940943-7-andr2000@gmail.com>
 <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
 <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca5909c4-4bb2-461b-a62d-08d9ab649509
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41911B1B939FCD1580E65D20B39C9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EoqIalisuFCLYpru3ZCrea7Tw1L865EJMk+4fymdJoKsaXp26OQYEfQQhcWjXLZlmN4M8/xR2tCqW/4nSaXIrSVe/7+9wqzxj0AaMOr5+9kwrd/zA3uiwlwm4C4W0uTC/VG6cAm1TksRde59Jf0dqzc3kTdUuBilmNvbN1hOiAZ7FJ/yL22Tt1WSlfqHhZJSPhMiwBpfvgQuGi+xN0oJSZr5o03xiSvIX+xoAkt/TCNlIBQxmlwb41+sGQtnxzsLUGlI7RTwIsRvhN4wUrhNJG1CJO0hui24Mwu0w5fDXl/s6VCb3LYS2eJDqY4YgGKipaCHYTGtPJTHu1Bg1GZDn2sGC/CcSF9H6dTWWHfgOFf7nIecPpE7iEu9X+2k7gCxkKdPpLAL9pZ63Fz3/vf/OZY5RIEDkc9geZW/v174X2/xryWLOPNZ3W2Vxe0GYXxD6I9blnhb1CBwAt1qi6WTPH/PZZlNBMdGW/1Rwj8clKwxBFgL31xTBtreQ8nGwAxtrJxjkggEHnZq+hOFOHfwmDvMIJQqP9fzQ7STStD0EUmfQ6Q/F0JJND3OeaKOOW5ic0vOg2a9Wiptru4aFgkTmT/8zn51Xb223UhXE2N8KgXlhh/5ibEym2OgQz6pCKHMzgYeQ7Z4rcyZFVSEb/tghXYXOZOGK8lNYIw2T/VGPlpqmFuHLViYier5c0klM4oqeZmYfBHt462+YEK0xUnYAA/BMSSgT0pKUIICLLvnV+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(83380400001)(186003)(66946007)(2906002)(66476007)(31696002)(86362001)(7416002)(66556008)(8936002)(16576012)(38100700002)(53546011)(316002)(54906003)(110136005)(5660300002)(36756003)(31686004)(508600001)(26005)(8676002)(956004)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9rZEZvQUo4RUxHVCtaOUl6YmVNUDUyV01vWFdkQk5vb2I1dXp6L3p5eHdC?=
 =?utf-8?B?Y0I4dVR6YTBUZGliWTBvZlBzb2pnaGJJcXJGV2owdjl3SUVpUDA1b1A5bWRT?=
 =?utf-8?B?QWxvN3I5dHF4a2ZvMXgvTW5kaEN5T1lmelpBd29CZUozeE94VGxJbmtzWXkx?=
 =?utf-8?B?MUlGMzJjamovNko4RjJBZWlFc1luRlJDbU42cHI3ajFxbHNRbm9rbFpkUFdh?=
 =?utf-8?B?Qi8xdDF1MFJOTWg2Tkc5TDJYYXVSTy9GYTh2SjN2ajVMODZLcUZWUTdaWEJV?=
 =?utf-8?B?T0RQaDdYNUVBc1FoSURNWXEvUVh4RWFQUW1QZFl5bnBieEJMaVRoUzNoR21K?=
 =?utf-8?B?WUhKakVGeGUxaXQ5QTJzVGxRL3g3alEzM2M3Vnd5ZU0yV3ZMMThTU1pVa0dF?=
 =?utf-8?B?MWI3Y3Z1YTFxcHEzTEJvbm5MWHN2b0ZUQWFRbFN0Tld1WGRsVmtGY2FyNVJa?=
 =?utf-8?B?N3QwT3pxZVpjRHNLczI3eFVkTDFDQ2ZiV0pTQ01QUi91dkY5bzBvT3dUNko3?=
 =?utf-8?B?c3RFMklzOTJyWTJzRkVFYjdDV082QTVFQ3dMUW4xcDBpSnlzcnhzVW02VHBi?=
 =?utf-8?B?cUR6UkpZN1pwVkpCaGR1NEhoSlk3T2NRTExhcTFtQkZwQTZNb3lHN1VkOW5o?=
 =?utf-8?B?SzVGQXJPUGxQajJ6NmhMajB6blltWlFqOG1oSXFwTm1tT1Bydm11bkZxNkl2?=
 =?utf-8?B?cGt5WmNBZ3MrY0lEbkhqMXBsVGNqUWt1cnRTdktzUjEvQnJ2bWpHR2piVHRk?=
 =?utf-8?B?NnROY21jNTE3M3ZhZjAxcnhkaFMzS1BjWEwrc3pFbjMvNHVaU1RjbVYzdjIr?=
 =?utf-8?B?clZ2RWNJb25KQWcwR0d2VWFBVmtHWkJBcUkxQmxDeTh4SWpCejVoM0Qxcmt3?=
 =?utf-8?B?bGNiYWl6a3RMeVkxZTlFb3ozY1NpTHNSdnFjUFpENjR6Umx5SUJXRHRlV01Y?=
 =?utf-8?B?d043U1lIcURKUG9WZW5rNC9ud2FrbFo5UzVBdERWUzQ4YnVOdjZhSTVyQUxZ?=
 =?utf-8?B?UnJzeW9hSDd2K2tmYXYzaXdyd2RVZE5Hd3VTaDlTankrYVZNc0FUV2t3c0Zz?=
 =?utf-8?B?MFQ4TW8yWXNXVWoxYU9JUGk2cHN1WENOaTVDWkt3UjE3RzBzUkxTeGhKOURn?=
 =?utf-8?B?SjJjMCs2Vm1JVC9Ea2pWek9GMHhyQXZiWUxOQTdyaXJrM1pJRzc2THlLSy9T?=
 =?utf-8?B?MCtuRTh4ZVdxdzJncXlubTZiZUtKbE9QRjZyY3hhOGJHU0tLam5xVE5NaE5r?=
 =?utf-8?B?RHFsWGFaRXRrMHU4VmVLcXlFc2s2TTVJUU15N09DNzJTb09uNHNQWnJjNUZh?=
 =?utf-8?B?dGhtTFFXNTZLcWh2NXJmbkNHV3YzRk9zWFJsMnp2b0VhMnU0SlVNc3VwaGZK?=
 =?utf-8?B?ZkV4bHIzNk9WT1FaMi9idkkzOXZwUk9tQ2Fadmd2cGpUdXYrM2FlOGRyaGc0?=
 =?utf-8?B?ZGEyanpVdTFabGhjc05JR3ovQ3VrN2Vqd2ZhUEpoaDRwcXRFc2RNL2RZb3Nx?=
 =?utf-8?B?YWFsTVJ5Z01jUjdLMHNZMk9LNGFRRWFSYnA1UHpMT0dtMy9udWI1aVQxNDRG?=
 =?utf-8?B?UUJzb3BnRW1udU84K2Z3MUo3UDlOVmVmN2NxVjlmRFRwVnhNa28xZ0lNeHlu?=
 =?utf-8?B?N1phQVdGODd4MTVmZFhPVERzOTBLVWZYT0ovZXVySFpsQXgyY0NDOS9hby9H?=
 =?utf-8?B?NmlINlJLY1FnTXJEN3J2aUgzNCtHVXpXeWl0WVhxLzNrVHZtZkNJdFRXb292?=
 =?utf-8?B?UzR1MG5BL2IxY2Q0Y1hkVUxXd0FhRmVGTDRYL2xUUW5WcmhpMDA2YVpHRlo5?=
 =?utf-8?B?OWszRVMwTDluQzFpZ0lKNTBXbXJZVFRhMHJMTWVRUGh3OFJGcE5Yc21PZWg1?=
 =?utf-8?B?T1RkekhqcWQ5Y0hUaVhRUFhYK0ZUTTVaaEM0emsvdnZlUis3SldOQ2IxVlJs?=
 =?utf-8?B?ZjluOEp2MmVGOS81TURxMHZwTW1UVGpabXZGS1BDeEw5aG1GQng4TThTRTJB?=
 =?utf-8?B?THkvUy9wcWh4MHJVWlNMSDd2TENYWlErd3JtK045S2VGeWwwL1FGVXYvSEtw?=
 =?utf-8?B?L05vb21KRzVFd3FvQmhqSWwrOUJCVUgrVTdYVnJjT3VVQklXZ204NFBXTFJu?=
 =?utf-8?B?OFVFMThhYnA4NGR6OEZBeU03bWtIME9IZEgvRndEZXFDVGJqcnA1dnVhVitN?=
 =?utf-8?Q?x4wnHu+LzQZ2iGC44YTr6+0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5909c4-4bb2-461b-a62d-08d9ab649509
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:57:53.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy6HEoMlwM41s5dvVJvj2CqJUB8s/T6zJ/GiUQel39LZbjSms0lM/+i1+ug//S1jQIYSEKMc2o6SHQFwJDs3ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 19.11.2021 14:41, Oleksandr Andrushchenko wrote:
> 
> 
> On 19.11.21 15:16, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> @@ -95,10 +102,25 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>       INIT_LIST_HEAD(&pdev->vpci->handlers);
>>>       spin_lock_init(&pdev->vpci->lock);
>>>   
>>> +    header = &pdev->vpci->header;
>>> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>> +    {
>>> +        struct vpci_bar *bar = &header->bars[i];
>>> +
>>> +        bar->mem = rangeset_new(NULL, NULL, 0);
>> I don't recall why an anonymous range set was chosen back at the time
>> when vPCI was first implemented, but I think this needs to be changed
>> now that DomU-s get supported. Whether you do so right here or in a
>> prereq patch is secondary to me. It may be desirable to exclude them
>> from rangeset_domain_printk() (which would likely require a new
>> RANGESETF_* flag), but I think such resources should be associated
>> with their domains.
> What would be the proper name for such a range set then?
> "vpci_bar"?

E.g. bb:dd.f:BARn

Jan


