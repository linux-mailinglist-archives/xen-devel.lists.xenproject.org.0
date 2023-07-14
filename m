Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92522753254
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 08:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563508.880717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCjG-0000Fb-Pi; Fri, 14 Jul 2023 06:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563508.880717; Fri, 14 Jul 2023 06:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCjG-0000Dq-MQ; Fri, 14 Jul 2023 06:56:38 +0000
Received: by outflank-mailman (input) for mailman id 563508;
 Fri, 14 Jul 2023 06:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZ6j=DA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qKCjE-0000Dk-Uj
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 06:56:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920412db-2213-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 08:56:34 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 06:56:32 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Fri, 14 Jul 2023
 06:56:32 +0000
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
X-Inumbo-ID: 920412db-2213-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn+S4urDe7l3KPug+tDjaXs7CgTvH9v9lZcPyzV9ZsOiXkD42Q8zumCqIxXMD9Up3ZNviIxWxJ7Ezu+iLbga5Hpl7b/jdXnQpNQXX73X0p5HCeEL558E+6D0XdnNnwnmESDtpuEP5oj2sIFm+vQtDl+FHkUGSSrTPNjCac/R85kt7suuZ9QwIWZsF+mvZiNxa5e9XJ7yQiae3VSQc6BDEgWqb4Q4nAIjwzCTn/burH/tG+8VGZU9iiRjc7PB3VBpBZ0NXcQI65xQI4ylInkL2uiYl3j9FjYD07a59OkshIYwgZfmiH1P80SSXaAdfSOnaaneBn9bhvgbpJBC3L+48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsOLB+E0eqbsGn9k6wi61DOmyWFBtrf71/o8iat64fA=;
 b=a8w9PBYT7Whbr/Gl4G/6esthXiudZS1K5KVAXTqT/JQZcEnoSPf5VqB+gkdDu8TxEfbSrsbIB24dWzJQ1nwK+NcPfeNPev5wUE8w4hZDL216vtniqzeO6fZ+lCsVDVMLueqr/ii6ndLXlgagSBhKf8RhZTTsYA7RdokbiFphsvQS+/shmfQQt9P4dHs76frW+buimixEzr4SfrJHTpQ7wqE9/U3P3gxYAUlxbDUYhdlHrnlYl447FM0Pv1pMFv9eXcsr+GT82/OU5pwY3TGTnSeDMk2MloBwx8byFhA/wccdAl+ijmkRvuFbWzUJmPdm4iWrwtcwFIE/RWjKjDrPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsOLB+E0eqbsGn9k6wi61DOmyWFBtrf71/o8iat64fA=;
 b=HyMd4IQjyhW38rZnhl++DLMok52eUkgQYowG24JIILWXp0qbyXUXIArupLmwtPWz8U1KYysQY9cBLsZYWqqr4yvrUNrmh2eHPtzsyFKxyWU2VCKRVU6ToJFNi4AYVJ8u1gBFy91ptvmUBHPjcvcw8dkgL71dUV34hXwinCnCMSZIk8WGmnx6z+RI/droj5gmzXn/HdP0AgOUEy9N/RkhHOKGlX7C45ge1pLxjM+pKHm3TnmAMnc+x7AQFAFggsYFQeNYdI7NFclCC+CJ5rAB8FYvwAysk8MndWQaANtTyMJddUT/i59SPsWrR7SnWeOAJOs2PzuGzFcyGjasQbMIVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed458992-b1c3-527c-4372-67355a5616e0@suse.com>
Date: Fri, 14 Jul 2023 08:56:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
 <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
 <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
 <200693a2-267d-16c8-61f3-3047dc8967da@suse.com>
 <9415dc2fe8c8ca0325ba6dfe41fdf72cb0f2ea0a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9415dc2fe8c8ca0325ba6dfe41fdf72cb0f2ea0a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 6718b846-fd9c-4fa5-64a8-08db84377510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aj3pZX+WdnNczWqcxiz9lVopV3cD4IoemphaUjIkYbGO9OO8BUjnU0musFBj+l7C4+iKb4O+SeiakIt+6K4EFv2qWh7uY71erIce8TnvmqEIoI3wHOL+wfeM94ceiRsSYfIW7OmO5nEDxMPML6Qyt4/GRq+C0gsotjY3Qe/3FOVL2zrsj15mTrJ+SKivZr3PoSJNlHWNlAvmgIPuTN1ixUvJzxRQFbDtJPYQyeKvNFW58i/j/d08eIBfNkiDR15clpYn4+uyk+AL8pZ1gr0WFcd55hyHnXVMgGHDQYh2lrSvervtANbec3dfJRBwGoQrefzzwMgxNdZa/nTMY5qbjFgW6v87dBvkU/Ud6IJeQ/7kvciNvqCvTapu5cmRilHzDyHUfVBS/TRe1Ie05xHEBYbLIiav2ELspDHVMYVlAOXNzFTtfbBIClr3sS475HyEKVdvDzqAyxBZHbGpA0FgXj8EJfh8AQCGsY9s5ee4KOtin7+nGuQToQRu1JnHu3fkbV+orbRDKZaMivXG1vuHvq3AwySeE8Fmp/gnNHb66reejPV9p/eOH8PZ4UA4FVRfsc1RTIiBVfXwgskxrAizbrvGMbnLihyJaQTRQbYTKZxr+i+NehuvBFIfsnrXZJ93
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(38100700002)(36756003)(31696002)(86362001)(31686004)(8936002)(5660300002)(6506007)(53546011)(54906003)(8676002)(41300700001)(26005)(186003)(2616005)(2906002)(966005)(6512007)(66556008)(4326008)(478600001)(316002)(66946007)(66476007)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXArS2VUL3NsU0haSFJiVmlYdFpUdVlCNjNhc0pDR2QrWVhweHJ0UHNuZWgz?=
 =?utf-8?B?Yjh2dC9BOTExSE5SVVdXd1FXQU45TlVpWVp0cE1RN2JGdlNHemN5dHVBUWtl?=
 =?utf-8?B?UG5Sd2lpdWIxVEFQcVlNQ2pvM2tnLzBSVHJvNE9hMVV4a3BjbVFodDZpZnhz?=
 =?utf-8?B?TjRKRnhsQkVvbVprdlR4Ry8ydDljbXlCOUFrUlkrbzBUT2xiMVFER043M09l?=
 =?utf-8?B?MnhQdFI1bGo5ZzNjODVTZWY0QTFLQ2RtVGl6b08rQll5MlB4R0duL3NqZTFQ?=
 =?utf-8?B?WktoL3dITjFmNXFZRXFoQlBaUXpTZXIxWGtjQ2pUZXJpSnNORGtCdG1UTk9H?=
 =?utf-8?B?cGF5aFdTZzM3bVAyQ1ZhL3lSUkF1dHp0QWZweU9LeThvK0N1YVoyZmpGaHpv?=
 =?utf-8?B?WGJIbXA2RU54Q29pSGg4WGh0VVhudXZiSnJaN01UUkRmaUo1WGJreDEwbWl1?=
 =?utf-8?B?akgxOHMrN1NnUnc4OU1zRmdaNmtDcTZ1SUg5SVFhbXhWelljaGxLM2dCRkpL?=
 =?utf-8?B?TVRHZXZCRVo5MEpYV2x2ZmlWTWdpYS90MXV3eFNKTWFZYTBoYnlzYzF3emZI?=
 =?utf-8?B?Tk4zK2V6aTg3TVVMV24xWWNMRHIrcDY2Z0VTMEE2ODk0M2VKR2RscFdTczMr?=
 =?utf-8?B?UUlTNXFwN1Q0SDdUQmlqNWZpV1VEcmFSSnV4d0tZZEFKaUZ2N2Nrb3QrYzVG?=
 =?utf-8?B?N2x2UWkyZitIOUJiM2lXM2hybHVIaFdocFFzdm5XQVNEYWp4RzlwMEZ5YnBn?=
 =?utf-8?B?REhxVjUydkI0YnhYL3hCd1hKMmVWU04ySWp3RDFxSjhaU2NkMVc2RFlubzlv?=
 =?utf-8?B?WEFQWm9lWVpjWHNwVUFmY0hDVzEvK1A4Y0lCaWcybDRoNGZ5MzBvY2ZxMzRT?=
 =?utf-8?B?Zzhmdld4SllwdjFvUFdmYlF0Mllhbis0djFWbU9kYjVZUTFFWnFZa1pYeXha?=
 =?utf-8?B?ZFh5VDNqTmNpTnNRUmhxWlhLRXFUL1ZYTjY4RXNwWU4rc3ZlRVJkeTZlMlZP?=
 =?utf-8?B?eklmZ1liUlJzb29VcjRTQkZBYi8wNXJXUVZmNXV0b2NDeDhjWWN1bGw3ZU9N?=
 =?utf-8?B?L0ZsR3FpRHBzeEw1OHZocFp6cHVKRWQ5TUlld2pmN0EvbXdpZTZLbWV5cXlw?=
 =?utf-8?B?alloK0dCYmRzQmg1VkhsQWQweGtTV3R0a1ErMFJvNXBrNFN4M2pXaXN0ei9O?=
 =?utf-8?B?NDZoc3VPRVRtWHE1a09MMTJsMG9WUlJMRCs4bFB2ZzdIRGM2TWdzVXRYZ2xM?=
 =?utf-8?B?KzQvcVJqUjZRN1QwL3l5Y2txdTBwaWZZQjEwV2FMTlk2Z2FkSEpEU0pVM0U2?=
 =?utf-8?B?ejQycUg4NUxudVlEMnRqdndjYVFvV1lveGxrY3kyUnRZYVluUGpONnQybTZu?=
 =?utf-8?B?ZldMTGY4V2JHTFhMWHNRS1p6UnVQZmo5bExndDcxOUg3YWZJTUcybmIrNmZu?=
 =?utf-8?B?c1ZOTFF6TkY3aytSZjYzZzc3RmNRZkZVYkhFQ2Z5aG5QZU9HV1Ztb0pEUktq?=
 =?utf-8?B?bExqMUVmRFpXQ3pQK0JVTHFDY1U4Mjl1dFVvVm1lZWthMGM0Zk02b1BZcTRy?=
 =?utf-8?B?YTQyaTFvdUtoY2pUbTNocFUydlZ0K2pmalg3allIa2d6Zm9tWHdCN3R3TFU1?=
 =?utf-8?B?N2pkMGpLWnozaGZhQ1p0M2pPZEdqeERoYnYyT2tjSXZ0bnRNVG9hVkZ6bWRX?=
 =?utf-8?B?aWl5WHBRWUh3VTdiNzRDdHc2OHpraC9zRVJtRVQ2Mm1FWkE4YXBDblZwMlhQ?=
 =?utf-8?B?K1dza1hvakUyQXcrQzJ5WHJHRXl0d1dWeXZDVmFKc0ZncmtlR0V0MXUyOTBL?=
 =?utf-8?B?L1hEK3I4RnZmTGdkaU81RkRuRXFCYUNRK01JdDkvWDJ5TlhQbk90c0RnbWlu?=
 =?utf-8?B?KzBJblJtTXFGdUNXZWdDTmFKcE5DUnFvYU5zWm1jemtVaVpPaExxMy91QVc4?=
 =?utf-8?B?OFR2b0g3S0kreU5oaUFlcXFOQmVkb1pUUDUySHN3VTlwR3V4b3E1R0VGZ28v?=
 =?utf-8?B?OUMyS2xBNVBlNjMrWVZDamIrN2lFQ0w1aTVWSzVGeUJLMzFDU0hwb1M4Njdy?=
 =?utf-8?B?NVNCejJaZmt1TjVDUDZDYUl6ZFJXTUhCcllsSjBpdzNKeTdKR0M1M0VWK3VR?=
 =?utf-8?Q?kOp1kCnJ5ff6zFY0Q0hB/Il8u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6718b846-fd9c-4fa5-64a8-08db84377510
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 06:56:32.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2i7Af4soRswuWgm1MFHAVFN3k8pZFl+um5zdKNOwKTUQLHFEQ9KDpqW8XhRrlsph2lw2yMEnThX8MMm9BxA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

On 13.07.2023 19:49, Oleksii wrote:
> On Thu, 2023-07-13 at 16:26 +0200, Jan Beulich wrote:
>> On 13.07.2023 15:36, Oleksii wrote:
>>> On Thu, 2023-07-13 at 15:27 +0200, Jan Beulich wrote:
>>>> I don't understand. My earlier comment was affecting all checks
>>>> of
>>>> uart->irq alike, as I'm unconvinced IRQ0 may not possibly be
>>>> usable
>>>> on some architecture / platform. IOW I don't see why the check in
>>>> ns16550_init_postirq() would allow us any leeway.
>>> It looks like I misunderstood you.
>>>
>>> Do you mean that on some architecture IRQ0 may be used for ns16550?
>>
>> Yes, I don't see why this shouldn't be possible in principle. As
>> Julien
>> said it can't happen on Arm, so if it also can't happen on RISC-V and
>> PPC, we could elect to continue to ignore that aspect.
>>
> Then for RISC-V ( at least, for PLIC interrupt controller ) it is
> reserved:
> https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-identifiers-ids
> 
> What about to have 'define NO_IRQ_POLL 0' ( mentioned by Julien )+
> assert(irq_from_device_tree != NO_IRQ_POLL) ?

Such a #define may be okay as long as indeed used consistently in all
places where it belongs (which may mean making some code less simple,
which is a downside), but I can't judge at all the validity of the
assertion you propose.

Jan

