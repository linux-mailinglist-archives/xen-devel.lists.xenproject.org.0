Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F4455CA8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227420.393333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhQK-0003Mi-6m; Thu, 18 Nov 2021 13:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227420.393333; Thu, 18 Nov 2021 13:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhQK-0003Jg-2v; Thu, 18 Nov 2021 13:25:56 +0000
Received: by outflank-mailman (input) for mailman id 227420;
 Thu, 18 Nov 2021 13:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhQI-0003JZ-Fy
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:25:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dae80be-4873-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 14:25:53 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-8edaqIXlOhKUwRT9e_EATg-1; Thu, 18 Nov 2021 14:25:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 13:25:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:25:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 13:25:46 +0000
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
X-Inumbo-ID: 0dae80be-4873-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637241952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Edk/7tlPwAHfMTQGjYz4puhyORycPzNtUVWTYTkXBc0=;
	b=dFcuGhXrrT7Uu5cpBCAYEgiF7BqAbz2qvJpVtWWyrss/pGEtlta5yYU7MtzHFDwJe/NPdz
	AqB1yMFeF51TZcHshM7/UP0RF86uLyDqRsopHDIILnLrN988g9CtQxqSI3lrI+qZvqoeBd
	nifjyRvVzQqCQe3mkvMSUXyURMyfFVI=
X-MC-Unique: 8edaqIXlOhKUwRT9e_EATg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl59DAnDYYv6qlM/Q0mIz33G8XQ7WeTR3MGAgyeyt3z5E7Ez2Gu7n7KSZp2rWdHdsE5G/Ala7aPH6GTL/3PChOfa7KepsUYeCKZGSGrN+1XA//lD88zpMmfkvSzT2tiC8V7tGta/luL6B5WEU28Y8DnJ6ujrUOQ9Qtd0f8F58A22NqEcRk4tS6k04nPa4eRgPvlC6Wn2OuztVO9abzFiZr7dRLOCV/Sl7SPpu5iFaT7a3a76iyo3MwLM0hzUYjpYL8HDm4n09nBjW3Rq+L1KYZTNEHSennQsvnXC6ih6pgg6wGujuImNUbNxFvcjnXHvQe4COiVN+PiJfuOjer9kbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edk/7tlPwAHfMTQGjYz4puhyORycPzNtUVWTYTkXBc0=;
 b=eJzHB4DPrdl8XGHliaYZxHfGxWujOTYCb/jtYp7/CLLbEI/0kltooA94c7iowWiKmlR12tpY/zE5B22eyVdiec4xCvF1GY5WJbN/ooZ7wV9IDvoKjPDqr4R0pkyV8nsI8Fc3zoWiEE4EjYRcxz3sbyplasK+5Fec1GTGK+7ZYe7nVS2+RecDDCJLIrfr6uff0zbIXWz6YcFgTagZ8Fi629dHokukwPUV0idVja5as+jLrf2D6CmIwDPYqMMI+jy76pmWT0Unoh0YtCpvB16OseLKiRdyz9xlWI0LYkZrqXZXdLVE4t9FzXt6ccbDAGG31vYyplNBE5uQ3I0gplxC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
Date: Thu, 18 Nov 2021 14:25:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29923d2-5ebf-4db2-7b6d-08d9aa96eeb6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168584F5AD610A0B3B35CD2B39B9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/w5/lr2XNay/vW2azere6kaZrBN2Knrm3N5g5boz0ez65lDTjr5y9E2Cx2Iy/U4Q+yzpsj9dT5XqvPCzYH2mVJr7VcNWNG1i1lLO5Q0CyFj1IHJKWxc211dtOmhFEMsf9H4wXFthZc4yHZeG/XVo6+2Xj4OSvbU0OzjICHY1fAnuB5c3762/GwCQ5PijPoBqCZNoL0fRrjABJ58zte9U5H5ytb7GyRsKAj+XjhY/Z6bvM1tEoMz5l7ltOd70PsC4R0w+6Uil+n3DmuSftYg3hErqjgbyhs6pQnTRzW6Ps4EeePbyAT799oujj1Ezv5t3u/cwv+wK4ZKAD6VO/7XKgVBlJcpK4QiadlSw467dp+9XpzKZ7f4zSwuqtrKxBbFCdfg03SHTzAyUN59XwJ0/ZKp0GZO6QTp4g4UaaIDbXa2vJIkEwhMMS2LNQ6xhIM9025hTAjHxQDxpTP7zuBkN8CO/SZtg2xPZ5CAKRdUsQreSzKfnyow2qcpeVbBDuv0CWcqf1w7cT6KsMlQdq2xSzKH5iB9M1Rzi9JCLUBKkio2Ew1vuSnGZEofLATcy9ne+Im7DsUzG1UJbkwlxjtsoJGsdF4XmpwioujTNpVBAI2ulIfn/BUlFLUqexmPJmzzDRygaynXLiwFml53peBd//cGKbr5ZgLcqojSxFm/KFI4hSqLPadd4WK0PzJSrWmMihk7PbBMn5lWxApa6g0UBmLQbUbRImAmwFFDZMibfJPMZZqW1Vj8wxzVSw/fTxE9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(956004)(16576012)(83380400001)(508600001)(31686004)(2906002)(66556008)(186003)(66476007)(6486002)(2616005)(7416002)(53546011)(26005)(54906003)(38100700002)(8676002)(31696002)(110136005)(5660300002)(4326008)(8936002)(66946007)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFFJOENBcEtqRjhhWm5iM1BHT05USjBEZmhhRktoWm5NOVhZdVlIdnlVR2J3?=
 =?utf-8?B?cit3VlExSFUwSHdGUzAwUSt5LytDSW1yZ2hhdTZZUEdHS29iTVBYdEhrVXlO?=
 =?utf-8?B?VjE2VWs4THMrTkcxRUhTalRmRktFTktPUnJBWTRISTJYQmlDaTRFS25mNXc4?=
 =?utf-8?B?M2JUdllTTDltVVNzN0JxNDl0RjM4SDZWbDhxdWVOcGEyVk82UC9ienhyTVdS?=
 =?utf-8?B?dWl6TWF1bG15YUZNRDRab2tEdGRKd3cxZzlsQS91YmJURmJacENUS05xYjNt?=
 =?utf-8?B?WWR0VGJ2UGVqcFVzckR1aVFzWkNlMFlaMXNYZWwrZW1TQVVocWwzd2VmZS9N?=
 =?utf-8?B?YWhEbi9MeVRRbEM3SS81dEtDU2R1a3hxaVJkODJ4QlNxVWFoU1FHTExGWlhJ?=
 =?utf-8?B?dzgvUHFBdnZudWdzdzBuUStzWmQ1SkNTUFVEcjdPc0ZtVXVwMHltc1JKN1g3?=
 =?utf-8?B?c0wra2x4ZXI0M3pJbkdLdlJpQno4MEJrUzBYTktZbFU5R0tHNEtqRUV2Z2ZD?=
 =?utf-8?B?RXI5WDRtamdWcXZMbmpxR3I5YXRYcGVlV0tqWnJUWGZXWmtmOWgvNHB1RzFB?=
 =?utf-8?B?K1lVeDVKTldGclJQeVJzbUJ3amRubXUydGloVlM5dkV4MWRjV2EyeE5PNzlG?=
 =?utf-8?B?ZVI4cHI5SlNFUktKQ01BZmZ0dHlQdUhQQXk3aTZBSHFCUFc2MHV3b2ZPMjhY?=
 =?utf-8?B?OEx6OFZuWTRkUWl1MWZZZ1d2clRCY2FqQ3RGWmI1RHhDMDBJb1R6Yi9zNFY3?=
 =?utf-8?B?aG5kZmoyUVVQc1dhUjVod0RrVXpDUVdjc2w1QU01d0hNcU96aEt4UGcvV0lR?=
 =?utf-8?B?dXh6VGdPZmdXZEpCV1hjNks5REhGdkYxdlB5UStLS2duZ3FDSDNjV0lvSkpZ?=
 =?utf-8?B?S0dJU3gwNXc5RTRvdk95WG5DQlRaWkFibEl2OEF1T0RCY3Q4Um5CZndXVzhY?=
 =?utf-8?B?UUJTUVdXMncrQWRGUUZtWTc3Y2tGeE1hQ3UxTWk0RzVXSSs5WEZSckZtZlh6?=
 =?utf-8?B?M21qOTlWVzFpN0pab3BwdWVqbGpSckJMSTdtNWZkTGFvOVgzSUVsMkxKM3ZS?=
 =?utf-8?B?NUJnbGZTazdaZW1DM3lIbllWVDJUNUtIdHowL1FqdVQyS1lwZC9pVzRkUXBG?=
 =?utf-8?B?eWx2VnM4QlJWZUd6Vmd5WGVrdGw2cVBka3pPZEJyNDk1UTYrVk5HR2dIZGpJ?=
 =?utf-8?B?MG1uQ2JnN1RPbGdYWkpKNTA5QVgvS1BydzVtd0prTXM3NURPMGhWREtrNW9q?=
 =?utf-8?B?Q1BJWGdNbjV5bjRDWkFhYVA5R2lyUkR4bmpYRTlkbzRhTDRtaDNNSFNlWXpq?=
 =?utf-8?B?TExUWDgrNC9JdHpTM1p2UEt3RlA3ajVwNTU2ZHIreEFFZFJSRTVjbFRVRXUy?=
 =?utf-8?B?SE8vbjZ1UkVNZ1ZmTFdqdzQ1VHdvR25HWW1TaGEwY2Rub3VHOWtacjY1Z1Z0?=
 =?utf-8?B?RTU1Ri9EY2hxUVl0Nktia3BoaFdCMmFKUmc1bDNIdldVbTZqT095akM3V3VN?=
 =?utf-8?B?dk4ydkJUSXhvMm1Udms1ZHhLa0lWMEJieGhCZVNnL1VNZ1ZNU3RFaFR5QWV2?=
 =?utf-8?B?Zm1pTUp6djJNNzFIOEFsMHRsUzcrWXVDOWR0WVlwRWkwM2RVbCsvUTZkQ1R1?=
 =?utf-8?B?THdaM29zcUxaQmJBOUc2NnQ1RE1WY2hQZURYU3I1RkRxL3hJczBXQ3dwdjlr?=
 =?utf-8?B?ZXVmU25UWFBjTlZSdXNBWkxKQWlCTG54YUVIQjBWWThRTS91Q3FCdEtVZVNy?=
 =?utf-8?B?ZTZPYUl6M2hybUxnaXF1TlJWb2FPaDdwVjVHZmhabkcyKzBRNUliTWRCd3RO?=
 =?utf-8?B?RFdweE5ZVFlGUERScHpDOUU2d1R6UzlsSUt5aHZabm9sSDlSazlPVjd2ZmpG?=
 =?utf-8?B?WUhwaWlnVnZ6TUd6T3U1bHYwbEJVZ3l5K2VGZUl2N3BqSTJyeTh5d1hNZjM1?=
 =?utf-8?B?Y1d0UXdTSnF4RWlWUHZiTGE4TGdXMWtyTHRsN25DWVdCaFJHLzFPMkV1N1pp?=
 =?utf-8?B?VkM5SXVJZDNFSll0bUZMU0tVY1JiTHB2dEdaZU82c1hzTWtudTdKNUNqZ0lj?=
 =?utf-8?B?THA2Q25VU21SbE1SelZKU3R1aCtiZFZyRmdhbjdydTZmTEtBWFZJbTcybWVY?=
 =?utf-8?B?NlMvM0lVbjArUVhqTk9mTm5LclgzTlJkVkMrWmVGS3RucStER1RPQkNnVEZJ?=
 =?utf-8?Q?g4d7QmtH3hNPzGzkWW+4hEI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29923d2-5ebf-4db2-7b6d-08d9aa96eeb6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:25:47.7667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/aZsNmfgCmRaZ7OVlFJSBrYg7Tjj10bkeuCS/PPqQMgZdnJiqisOjEK2p4NWIzqbIWUkhrmvq5EY7nR74G+Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 18.11.2021 10:32, Oleksandr Andrushchenko wrote:
> 
> 
> On 18.11.21 11:15, Jan Beulich wrote:
>> On 18.11.2021 09:54, Oleksandr Andrushchenko wrote:
>>> On 18.11.21 10:36, Jan Beulich wrote:
>>>> On 18.11.2021 08:49, Oleksandr Andrushchenko wrote:
>>>>> On 17.11.21 10:28, Jan Beulich wrote:
>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>
>>>>>>> When a vPCI is removed for a PCI device it is possible that we have
>>>>>>> scheduled a delayed work for map/unmap operations for that device.
>>>>>>> For example, the following scenario can illustrate the problem:
>>>>>>>
>>>>>>> pci_physdev_op
>>>>>>>       pci_add_device
>>>>>>>           init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>>>>>       iommu_add_device <- FAILS
>>>>>>>       vpci_remove_device -> xfree(pdev->vpci)
>>>>>>>
>>>>>>> leave_hypervisor_to_guest
>>>>>>>       vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>>>>>
>>>>>>> For the hardware domain we continue execution as the worse that
>>>>>>> could happen is that MMIO mappings are left in place when the
>>>>>>> device has been deassigned
>>>>>>>
>>>>>>> For unprivileged domains that get a failure in the middle of a vPCI
>>>>>>> {un}map operation we need to destroy them, as we don't know in which
>>>>>>> state the p2m is. This can only happen in vpci_process_pending for
>>>>>>> DomUs as they won't be allowed to call pci_add_device.
>>>>>>>
>>>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>> Thinking about it some more, I'm not convinced any of this is really
>>>>>> needed in the presented form.
>>>>> The intention of this patch was to handle error conditions which are
>>>>> abnormal, e.g. when iommu_add_device fails and we are in the middle
>>>>> of initialization. So, I am trying to cancel all pending work which might
>>>>> already be there and not to crash.
>>>> Only Dom0 may be able to prematurely access the device during "add".
>>>> Yet unlike for DomU-s we generally expect Dom0 to be well-behaved.
>>>> Hence I'm not sure I see the need for dealing with these.
>>> Probably I don't follow you here. The issue I am facing is Dom0
>>> related, e.g. Xen was not able to initialize during "add" and thus
>>> wanted to clean up the leftovers. As the result the already
>>> scheduled work crashes as it was not neither canceled nor interrupted
>>> in some safe manner. So, this sounds like something we need to take
>>> care of, thus this patch.
>> But my point was the question of why there would be any pending work
>> in the first place in this case, when we expect Dom0 to be well-behaved.
> I am not saying Dom0 misbehaves here. This is my real use-case
> (as in the commit message):
> 
> pci_physdev_op
>       pci_add_device
>           init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>       iommu_add_device <- FAILS
>       vpci_remove_device -> xfree(pdev->vpci)
> 
> leave_hypervisor_to_guest
>       vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL

First of all I'm sorry for having lost track of that particular case in
the course of the discussion.

I wonder though whether that's something we really need to take care of.
At boot (on x86) modify_bars() wouldn't call defer_map() anyway, but
use apply_map() instead. I wonder whether this wouldn't be appropriate
generally in the context of init_bars() when used for Dom0 (not sure
whether init_bars() would find some form of use for DomU-s as well).
This is even more so as it would better be the exception that devices
discovered post-boot start out with memory decoding enabled (which is a
prereq for modify_bars() to be called in the first place).

Jan


