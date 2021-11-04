Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D744560F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221618.383420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieMu-0004k4-NW; Thu, 04 Nov 2021 15:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221618.383420; Thu, 04 Nov 2021 15:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mieMu-0004hq-KP; Thu, 04 Nov 2021 15:09:32 +0000
Received: by outflank-mailman (input) for mailman id 221618;
 Thu, 04 Nov 2021 15:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mieMt-0004hh-60
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:09:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 356dc24c-3d81-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 16:09:30 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-jCZuCbWtOLWVsoF83YiVeQ-1; Thu, 04 Nov 2021 16:09:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 15:09:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 15:09:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:489::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 15:09:25 +0000
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
X-Inumbo-ID: 356dc24c-3d81-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636038569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnZo+JwINu+yj1b7l3ZCxTtCOlVokXmizl2oT8gQ4ow=;
	b=RgISnOVGkSzgBwmdjkXx2IEeAyW4XxCQKQ5A+mFQmEXJDwgr7DEmY/XFppf8CaeFHrPmoe
	i99rpKJ4moU9yZofCveUGFJ/gZWL9j7JmTlhVVKTf3WndsM51xtVLGt3v0YFaGBMNJ4SDG
	nH6IFoS0VQkv1JFOPrMFOMH5nk8g4g8=
X-MC-Unique: jCZuCbWtOLWVsoF83YiVeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WchwRT3yTzdIaLNb4Fkq6UhQ0XEaUxtNINjEOfTFr9ENVfVSAqDi9B9imSaBdf1PjM3QZT1yWQHD0jvFf7q6doE5LRH1Jbg/UIU7ugyBrkjKME4CpetVgH4i6qib8EoQ/bXLddX/yGcXFMSmQcBqIWNLuq9EkXL1G2LVSUC37PZjcWJabAdRM76bhLk6bG0SQmrYTJNwmg+YPogLEtz8+soe9ecbI10sV8ZMJROY8jCWkSCLl6uYvgGuTE9cB0QpnLyZOXcnmf11JQ/PWkVdQfXr4AhPDbkk2jw71r5bmby6jp+IWRBycd7z9FQwtACsLmwEyDzZpAMT7aRsGBJl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnZo+JwINu+yj1b7l3ZCxTtCOlVokXmizl2oT8gQ4ow=;
 b=nmXIx+wlo6b199kd20rkmWgZhOzpeRRNF2koqUnaO9M3tshGerWdGgH4wOOds9aJoHuL9NbO5ddnIsAN/57opmWoJ9vu66AibFBlgHTvTpSx2BoOLfCDyI4ZpJv4UtRDgnhlS2/PnUg70lpfgUUqtKHgyg1BoocqC/4OM+ADVc86j9rfbY8P3BVvXo9ha51LLY/Nhbb48KkOFoN8Iw1j5H/SVDEwGFUJqFCZRF98GNW6g+GJwOkNSYbK5q6+DbqyHH6vrmfjLbQPJjTGUmDYFLgabQgJ8qudafdEyQL5H3/ujxfyzqUgFaMyqi6rzxsAqcI2UhfjkUyAw5jwmLzSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cbf609b6-3ac6-c355-66fa-81b353280773@suse.com>
Date: Thu, 4 Nov 2021 16:09:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI
 table parsing [and 1 more messages]
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
 <YYPsT7wp0aWZapHU@Air-de-Roger>
 <24963.62794.407130.517684@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24963.62794.407130.517684@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0034.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfcdd8fd-b09c-42a9-f78e-08d99fa51719
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703707389F9E21D798CD7ECB38D9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hASlpeTtUeRl1vHnM26im8cp7HILsnJp9mnH5G7YCOiDnUcU6/89OrQbdcNcbOVN3DJJPF5s+3serJk9Rjba3aoVInqkExIh+eAMq3wgFA4n10iTYVOXAmdN5knh7mK43AefeqgJP78DSJox7upnS17c/X8ivVVyS7F2XAPa4vv59BT50sZAS5d88BZa3aMF11zIAVz8Hyj19FC9tKwM1yiLCJZGB3sX59o+Ry5ZCIIjgMK3W5I4Up9LkIzP7k8C+F1y/KE8KoArC7bVazRWMRRLZdIc4kyaZ/guq/ddSb5t0S5alAAGPuQy4Bg6HW0ai+Rdm+fLH5+ADVUDTz2m2j6LscGarLJrpGqO2gfD0C8gxBFVy4SBhYSTFGM1DZ7jAnL8FgbnONlZgtFGgXtWMHhSHt3I7v0tRPYaNkAW8CJNH/twxtCkxHcBUDNnirS+e3P3Mk4vR/yk4BjPdjB0HeB41koUkiwvBi5dh/CaKB/8Ms9vwaGZRykRDNENEk6O703Z54CPFoFaYf1GMHOsZ2EWHMIb2Ye2ZdbBf8Z56MXlHe4RveyrEtaAtm2whzbQoPUu/DDKeQmGYZaKJyWPUj4QUCf+ftGpOpo/WTPDlXWBYJXweYgKyVi0XbSQn1JVLpAkVbUhp1Gpnba83IbabC0lxvTz9RuY86iRaIzuYUgOIVbnYd/mZnx2mqlYdmyEqQw2bwrnFx0k696pSqItmeQBHwGuNEfq06ktCjONP8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(15650500001)(53546011)(54906003)(316002)(6486002)(186003)(26005)(6916009)(8936002)(16576012)(8676002)(508600001)(38100700002)(956004)(2906002)(86362001)(83380400001)(31696002)(5660300002)(4326008)(2616005)(31686004)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTdGZWdZdWwvVGQzNVJPYi9zVFFpREdmaFFnTmdkKzJubjl5THBzZ0ovb1Bw?=
 =?utf-8?B?NXEzSDFGWjZVcHRxT2FiUTJnOHkyVE9uMEFlRWRydklXWGM5UDNkV3JLSVUy?=
 =?utf-8?B?UzF5cTJRLzJITUlOS2srMEM1YXo0SUZhNzZHQk1MQis2WmNLVWpKWHVscWQv?=
 =?utf-8?B?WENDM1pzeFp4RUZYYVVZbnVGTUgxMXcyeXlENG90K3UrQTVMcFVnYUozbXQw?=
 =?utf-8?B?SGhHR1p2VnJ2b1NwVFoyOE9xVG5qa1dmYloyRUNxVzJGKzE2eElONFh3SFlv?=
 =?utf-8?B?aVZUM3FzZXpzRzFadEJxeFdFQ09XdE1xSFlOMkFmSnVCNFBhWmVnN2hhNmQ1?=
 =?utf-8?B?MVBSRUFKMjVnUmhRdVFrY0UzUlc4djU1MVg3YSt6anduM2tITFR0L3U4UU5P?=
 =?utf-8?B?cjk3QjB5WURvNzRYb0xMc3BNTUcxTTBrcnBWWlhCVTdKUlM1TmVXZGo1cjRQ?=
 =?utf-8?B?TWhxMUJoK1RQMHdhV1NuRzJJdExQRHJaY1NzL2RQRy9vbW03QmxWNE1BcC9H?=
 =?utf-8?B?MlpmelRGam1DeTVoS0ZMb29pUTh2RG1kczhCakkxWHpDZjRML0ZzS0pIWWc0?=
 =?utf-8?B?YnoyZmJreGJ6UTVhNW90T3dzeXB2Lzh3YmgwL1hXR2xONHFHQWtsNGwxLytY?=
 =?utf-8?B?Z0s0emZGM0x3S0tDK1JVaU43cEhwRk9mNTlRZGgrMnFjVU9JTHA3WlNaSTFM?=
 =?utf-8?B?S2lRdXk4SGJ1MUE4TEt4UzZyVjRGVHJnUE5JTjNXR1BsbnRDUG5QWmdwM0ND?=
 =?utf-8?B?NUx4OEthbExOTEIvUW8vZVVNM3l0SmJiN2FqVmsyYVJWZzZ3dWUvdncwUDNs?=
 =?utf-8?B?TWhXaSt3bUhXalY0VU12bXNUbnZyV1BYVGUvdHVZL0ZQOUNMTUV1R2xVYmUy?=
 =?utf-8?B?RVBxQUlEZi9rUjRsSldJZlEwbnk5WDF0aHcrd094Ylo2aWdlT1NBSGVoZGhF?=
 =?utf-8?B?cVIwT2lJRjU0Mi9OOWFoTEpzc3dDd1FUMzVOSm5hVkJ6d0w5OXpoZlJuVE5Q?=
 =?utf-8?B?a001Zng2SkdBdXhHUkYzS2YrZ0duYmRZb01uL1dZWUJaZHRSajlLRitBN0RZ?=
 =?utf-8?B?Tisvd2lZL0NvRlQ0SytDYVpsOTd6NmJiRlNZSXJ5UXdlL1NyTnpyZnpSK2px?=
 =?utf-8?B?WFFrVWVBQ0pWWHYxR200VjBaeHRBSVowdXdDVkJCSUZNUVRJVzkwbUpxeUN2?=
 =?utf-8?B?MmE2TTlsK1NiV2VGZDdZVUVmbjg3MDZsOUxYT3lnUGQ2cG03ZURENUJXRWNE?=
 =?utf-8?B?azd6NDZaZHd3bVVGbWR4cUVGQndqQ1VBVlc1ZHI2bjBrTDZmWG9DOVVBdDl1?=
 =?utf-8?B?Umt2VU0ya2NqY3pjRmlLK2lndldjYmMvZ0hLNTJpY1BwWVkyQmI5STc2WHZz?=
 =?utf-8?B?b2NVOHNoZ0VJeWVlY3NHMmJOZU5xdW9kM1ZXcGFURnlPYXJsMkdzb3ZyUWxB?=
 =?utf-8?B?Zk1kSXBwRU9JL0twd2tFNDdpam5Gc3hYdVhZOENSRnpsNW9vcU9FUjZVbzFP?=
 =?utf-8?B?MVNrM1ZDSnM2YVdiOC96TlMwQndJSmoxTkJJejhZaWduKzB6NFdLRlB4Tktx?=
 =?utf-8?B?akFHS3lCVkFLYXBRTG1jdWI5RWNhTDMzeWhHa0hmZ0tndHNaVDFIYS83N25G?=
 =?utf-8?B?elVBTXNCVUovWklsUFE2OURBa3duS0FHS1g1NW5PTjZsb1pOS2phYmVoaExt?=
 =?utf-8?B?NkV2TE56VWtiQ0M4ZXUvRm5JVVVLTzVYaHpNSnp4Q0hsdmx1Ump6RElCTEYz?=
 =?utf-8?B?SEZqNkRmakk4dW0zUlBhV3NEVytpTkxSV0VBTHI3Q2U4MVhsMldiSmlmTkRr?=
 =?utf-8?B?TmNkbTdNd01UUENQa0Y4MHVRQlFnQnlJeUFWVW1QUWJ6NmZLLzJJRWtNYXpp?=
 =?utf-8?B?MjJuK0hDUXpRYVBFRE5ReHhyWlVjTEFKV0NiWmNSUUlhczRYL1VUbktValo3?=
 =?utf-8?B?T1FjVTZwRHFqaXhuUzAzdFRPbENXaEdydU9FcVlobHFDeUZ1ZDlVOUVQZzNQ?=
 =?utf-8?B?WUJCbUtIc3dQemY4ZFRvVThjSlpmcCt2REdGbW1LNS9vRElyYlpuVjZRTjFm?=
 =?utf-8?B?QTRtM3RHZTU3L3dja05udWVPMlp6dFE2Z09nazZZN0RxSVkrZytCWlJtTEQ0?=
 =?utf-8?B?TDRVT3FTQ2xlZmlHc0ZBcWxHMGNVbHJ5YjlrOVpHUmltV1ZSRmFaaDB6QU1I?=
 =?utf-8?Q?KNXMztLxAEo7rNHtGEBexno=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcdd8fd-b09c-42a9-f78e-08d99fa51719
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 15:09:25.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQBTH1RbU9dLvKfLBSoDAAhHeYDer0vGJY3wzzJNCbC7AculUP9OS7WwPEHZ1f/R3zvlmWPvPuQkw34XRjOwMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 04.11.2021 15:59, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
>> While commit XXXXXXXXXXXX ("x86/IOMMU: mark IOMMU / intremap not in use
>> when ACPI tables are missing") deals with apic_x2apic_probe() as called
>> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
>> affected: The call needs to occur after acpi_boot_init() (which is what
>> calls acpi_iommu_init()), such that iommu_intremap getting disabled
>> there can be properly taken into account by apic_x2apic_probe().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Based on code inspection only - I have no affected system and hence no
>> way to actually test the case.
> 
> Do we have any tests for this ?

If you mean in osstest, then I'm unaware of any, but I also don't have
a clear view on how much x2APIC-capable hardware we have, and whether
among those there are any where the firmware pre-enables x2APIC.

>  I see it's tagged for 4.16 (and I'm
> favourably inclined) but I'm not sure I follow the implications.

The main aspect here is: This is the other side of the medal as to the
referenced earlier change (which I did commit an hour or so ago).

Jan


