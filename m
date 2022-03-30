Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AF14EC5BD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296348.504413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYV3-0007UY-9r; Wed, 30 Mar 2022 13:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296348.504413; Wed, 30 Mar 2022 13:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYV3-0007Si-6T; Wed, 30 Mar 2022 13:36:37 +0000
Received: by outflank-mailman (input) for mailman id 296348;
 Wed, 30 Mar 2022 13:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZYV1-0007SQ-75
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:36:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a078bca-b02e-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 15:36:33 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-sMjwqc8SONyP9BGpzstoPw-1; Wed, 30 Mar 2022 15:36:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 13:36:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 13:36:27 +0000
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
X-Inumbo-ID: 6a078bca-b02e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648647393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXCp5dTG1hk+GwpOlLv8wCFmJypzbGoC1LH92pS9OiY=;
	b=grovrovm7+IbBZEPkUj4NmDbYz3Y8eeJBz09ebbHbTVP+4Run94ougiSUy4wAn5vbPgx4B
	KH8S2x6wGTCBAc9q0MqcvwGWFtyhkFjriajQ2E6A2hXfvfOhEoLNu42C4pihxR9RBpmOKz
	6rRDLV2ycWZ/f4y1MoTqbUZoc87jZ3g=
X-MC-Unique: sMjwqc8SONyP9BGpzstoPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjG33WhFpXDundW43yA7Y6xLYCNTi46xOhZ3VPBWI+7Uh+DEUMyzEiSXDtnkVYgUYPfVEZ2iJhoUnd+ETJhKwnTiXzz2tCO8eaSrTzxaqP6VWK9M942BMRcU4IaNyu6Dxr7cdlXjGTFUEqZ3WgdA7vgkT5I+ctnpvYn380bJ/utcdpOtUKkD+4q690U32kmtLwSWOWDoN/lEM4ZCpbxWWIhtItH4pn+kkTz/F4cfFewOwgYx952NhEYLEbg3ksAsWjD3gz7y7A3lMhcG3R+xFmyLK+pZ0I2sUY/RlEU436ekx5EZdymSRukAo7N7Fbl+/VrBIvbb9h77OGPx911DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXCp5dTG1hk+GwpOlLv8wCFmJypzbGoC1LH92pS9OiY=;
 b=A6q8jN4DrSral1fC/RltVEXsAkaY5Z134PruXsNmMIEccPqo9hGeqos6IVhojJSOf3WGeaIaO8Pfe9Qxxdz7eNnniXUtF5Xc61xOyf+AwHmRXOa0SdWeQH/Swwl3FBJbSXdjaHggPDSiJqbRhLWBpRJKIffyR9gSI2yf9+RXbHFCl6Ed5n7ZnpqxKj53vCq53nf4AK4AePgpnXQhQATD8pRiFAUxsV0FfzcwZSrlESR0ttm87Sb26zrsyXg05idAqS0f+51uEENgaWsSS/3jiFs2hqw1BlkgzabH0KsmygHzbFDYQrWbEhzccFBXRu3BKwtQubFgEQzWcfyd24Ikfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <246437cb-ab07-d396-a40d-db14c744f064@suse.com>
Date: Wed, 30 Mar 2022 15:36:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@arm.com>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
 <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
 <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
 <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
 <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
 <cfb19224-6b83-6fca-37de-703152e38af6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cfb19224-6b83-6fca-37de-703152e38af6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f94204-e963-4832-10ee-08da12524a92
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903B1983B1DCCFD782D94ECB31F9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	naZHiPJySCkq+/HkiPMFkwXHYS1ga937dgQ6dqJwgpvUbtlmuGIe9s+tWZ5JeL0S+p0PVGWbYghrYfM4xLVm7OsmQuFi32vCEc08UmxmwrK7Be6Y/5PTIPGSXK7tLaUQHnNhoibYmWp/MbGfhTNnjQtUaY9Vttz0pcecvxoPwTcDVZ8oYcB1q3+GxtuKPjB5ihWBERFIGpfRtJDNhs7c5jImCh7I/wOXEkyTQk2xWhCVZGI7x5j4JQjmFEDaWnbQRVDpXWnDwlVufNbLBgIsKvVNxY1OalX5arfVZkSF4yqExhZyXBEwg+QKIT/nuesDbm/ygjl3nblz/ZaEqM97tFHhkSv0Z/y5pa6/IQtEkpYCdYotw33KKEZCFHxOTPoaD+3QwwgLyYTsR/G+Ua1Ei9Wv+vTXG2xg88EavRj+/XXZfWUJmykZfzFuyGqJ7+lNOVGE3giIrVoPaPL0DxkGpd8XRKLfdZ42iBsKLfMcGuE69AWcwnU3s1EqM2WueCA2EVja0MdZ8WvayV+bbzoV+OLMi/W8ak/gNSY89I2b4H3MqH9Ydquv5fOYNLcJrcr56UV8lya8g7qKZ2nxGOoGJMqhQYBS8s7tD+UN5IXcj7ifSoeyxsA8sHbQ5qcs6rsAvudo3GpTgDQDh0fqfEN4Bt/X4hGBwn9NiwlGJE6ba0SyrD8kG2571Oyct/7wijywIiwjKQks+/uWgD8YRFzm7MLvED3+F8GbqKTJoL4n9Q5DnVTGqkESFKeP+XKrV3Ni
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6666004)(7416002)(66476007)(66556008)(66946007)(53546011)(5660300002)(8936002)(31696002)(86362001)(38100700002)(2906002)(4326008)(8676002)(6506007)(31686004)(36756003)(316002)(6486002)(54906003)(6916009)(186003)(2616005)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1qcUdUOFp4eGJ3Y2JKU1RVb0xOR2JRYnYvRkN6aDd2dE9pekJYbGlTLzdx?=
 =?utf-8?B?V0xQK2t2NGVBY2I2RmtNdnlHeklzaTNmYXNCMlhVclduUk9OYXUzTEorQ0d2?=
 =?utf-8?B?cXpVTWptenZuZXVOOUo4cENRWXFLRmhKcGVFbllROFg0SHRmNXFBNUVkOFlo?=
 =?utf-8?B?UjRSeTJhY2xzcUxqWGpMKzJ3bGhHVlcxS3RvckU0SlRxV1o4TDR0QlZNQmFV?=
 =?utf-8?B?ZmhBeHlBNmZmUjN2UDJBcUY3MmlxOFdxUmg2K2RIbkJib3FOUitQU29idnFK?=
 =?utf-8?B?NUNaN0x6L0NTN3JDUVNyNVpBNi9xS081V1F4QXVZWWdoU3JueVBlMVVDaFUy?=
 =?utf-8?B?VUJvZXNsTlUzbm9ia0xkaWtVNUhjOEw5RW1oc1FNWU85a2x5OHo5Vm0rdDcy?=
 =?utf-8?B?MVdMaXBuWVhaWXBTT2Q5eXlxUDFPWVN6RVlRQ2V3YzhTUWdaamh2UWxzRU1w?=
 =?utf-8?B?WE9ZVnJ6NFVOeGxWajMwckR1YUlKYzZmYTdyV2txSU5BeWJsaGpTRExSUFNi?=
 =?utf-8?B?UUZhQkdtcjVnRnA4MnI0UFh6KzUzbmJ4MTBSdHpJejFQNGcvVHBPcnMwQmdN?=
 =?utf-8?B?S1U2OVRHblpucnFiYXI1MEphRmU5a3A1VzZzZEpnTDB5a3F6STlRSEcwUUJ5?=
 =?utf-8?B?MkhmRmpWZi9IU2I3QWNoNWJJdHBRN0JxTWE4RThvcmNlNTZNNGY4RFdzWUU5?=
 =?utf-8?B?R1JpWWtDMDBHSjlqdGhQRWZGWVB6STN6aHlXNG9jRXFmSTdSWXYzSmNESVVB?=
 =?utf-8?B?bzV3NGxFa3NqUjdhRkJ1NUNPU1ZXSW5kc0NpbTZUOUI2ZnBQeXdTQjlRZlZ4?=
 =?utf-8?B?MmZheStxRmdvaW5FVlo1cGVZdlJ4L2N6UExIcVo3VGJ5UTJIaVFqOGFxQXYw?=
 =?utf-8?B?cUhHZXBLcTY0S2loNkkyNnJJR3ZQMGhOZWV1Q1QwdThkMUZQY1hxVTRUalQ2?=
 =?utf-8?B?Z0l1WHlZMCs5a3ZmaG11Myt2SXFpcVVZRXVGRDJBclM2YTNZVGpTWUtZYURF?=
 =?utf-8?B?M1I0MEd4WUYwd1lGYTFOaml3ajk5NVkxN1NMZ3gzQnN2b3g5d2NacFlVenRi?=
 =?utf-8?B?UzNjWjNiSmdIQXhmOE1ETG9mVk5CYUtwQVJyZUJ0UTV6R1VBa0QrRjRGYmJU?=
 =?utf-8?B?eXVKNXUwaE10aVJlOFdpcGpRclNZc1BOVlFWckJ2bXJ4YkZiQzZ3WWlqQ1E3?=
 =?utf-8?B?cnA0azlFeDA2MlVXQXhDS1hTNnJsMXprcHI1emtZalhxa09oZnBwaHFmWm9q?=
 =?utf-8?B?K2oraHpzMk9zWG5vWmRsa3gyd0drR0lOOVZWYVhhVENCSUlJNjZXYUFaWWk1?=
 =?utf-8?B?c0lQejhwZXNmWHR1d0NBQ2R3dVhUbjZTUW5nTGZmaVNiYWgvOGJCMXUvZ245?=
 =?utf-8?B?ZzVybnd5bUY4SW8rZUVhaitLMEJkcFZubUhxa1JvM21XeG5hb1lOdk5kdUhj?=
 =?utf-8?B?ZFV2WEY1N1Zhdmp2Nnp4enBKWHA0cThnd0NncDhwVGxkUE5Vdi9NUzBiY0JL?=
 =?utf-8?B?VklrWUdYemxubkt4aHJXU2gzRHJDSjlML1BTcEtkSFBzY0xuS3Q2aGE0SFFs?=
 =?utf-8?B?NVlkdEZZZVdtVDNKS0JVZXRUK3VQeXQ4R281UEZVK3FaN1g3bWY1c2Y4L0Z5?=
 =?utf-8?B?OTdBZTlIKzNHRCt0VVZtY2hreFRzOWkvVE96anBBbkdpZmV1Mi9tU2p1T2pl?=
 =?utf-8?B?VmlZaForZmh6clBmcGc2QW95aEZxMXRaVW5YWjhXcG1tdEhzN3NUOU96dmMr?=
 =?utf-8?B?RUNSdE5KalVMb3VGL2VGdXRKU3lMQnQvTytsUTF3M3ZHN3ZvcTdoYXVJaHc3?=
 =?utf-8?B?MVFXcnBwRHhJNUxYb2ZIUmFvZkdmdTRQRXpPaHVaMkg3UUswcktXV0NQN2Qz?=
 =?utf-8?B?cnZjSUZIN01sYzlqT1ZxdGJ4ZzNYR1ZEU0Y0anp1YVQycDRyTENzazJXdXZ1?=
 =?utf-8?B?RjFzcEFEenlvbXFiK3lsc2E5eFg2MG1xNVh6Nk5QQkRoOVh2d0w2TUVDRWpV?=
 =?utf-8?B?azFsbmRwUnI4dVZNRklIdGRVZG5KQ04yY21aaHI4TW9oSE1LWlNMWVpwWG9X?=
 =?utf-8?B?SmxWYVZyY0dlcmcyR0w5VnBWVE9Mc3Jsc3h4QnJiYnIzRGM1UGkyV3R2b1pK?=
 =?utf-8?B?VlppOFJselJpTEZ0bittWHRGSmthUGpMWUdOK3BPa1FtWjY1Sk1tOUdZTGVt?=
 =?utf-8?B?MUltU1hJLzg3SWZNdm41NFgxcllQUS9Sam5Xc3BrSDVSSlRjUjlCci9Wcktm?=
 =?utf-8?B?ZjhIT3Iyc0dwdHhjajZoVnpZa2VBOHdaSmpBbGh1K2Nuck1QTmNOalAzZ084?=
 =?utf-8?B?NmtKYXdFbnJWVCtlVjRvN0w5elFkUW9KUDlQVjgzdjI2Ui91Z0E0dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f94204-e963-4832-10ee-08da12524a92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 13:36:27.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibXB72fG+l0Z54V9yiErnrpcclZ2NvhbjHqdGE4AmlR1gP2vVA46b/eI0v/eDkHUx86T2skL/qdOW0fJLIj8Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 30.03.2022 15:30, Julien Grall wrote:
> Hi,
> 
> On 30/03/2022 14:24, Michal Orzel wrote:
>>
>>
>> On 30.03.2022 14:53, Jan Beulich wrote:
>>> On 30.03.2022 14:13, Michal Orzel wrote:
>>>> On 30.03.2022 13:57, Jan Beulich wrote:
>>>>> On 30.03.2022 13:04, Michal Orzel wrote:
>>>>>> On 30.03.2022 12:42, Jan Beulich wrote:
>>>>>>> On 30.03.2022 12:32, Julien Grall wrote:
>>>>>>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI.
>>>>>>>> That said, it would possibly make more difficult to associate the flag
>>>>>>>> with "linking an EFI binary".
>>>>>>>
>>>>>>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>>>>>>
>>>>>>>> I think some documentaion about the define EFI would be help so there
>>>>>>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to
>>>>>>>> put it. Maybe at the top of the header?
>>>>>>>
>>>>>>> That's perhaps the best place, yes.
>>>>>>>
>>>>>> In this case how about the following comment at the top of xen.lds.h:
>>>>>>
>>>>>> "To avoid any confusion about EFI macro used in this header vs EFI support,
>>>>>> the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
>>>>>> the latter means support for generating EFI binary.
>>>>>
>>>>> No, that's the case on Arm only. As Julien suggested, it is perhaps best
>>>>> to explain the difference between EFI and CONFIG_EFI, without going into
>>>>> arch specifics.
>>>> Could you please tell me what you are reffering to as there is no such identifier
>>>> in Xen (as opposed to Linux) like CONFIG_EFI ?
>>>
>>> Let's call it a "virtual" CONFIG_EFI then; I think we really should have
>>> such an option. But yes, if you don't like referring to such a virtual
>>> option, then describing what is meant verbally is certainly going to be
>>> fine.
>>>
>> FWICS, there was an attempt done by Wei in his NUMA series to define CONFIG_EFI.
>> However as this is not yet merged and agreed, I would like not to refer to identifiers
>> not existing in the code, even though most people are familiar with this option from Linux.
>>
>> So by taking an example from Linux I would verbally explain it like that:
>> "To avoid any confusion, please note that EFI macro does not correspond to EFI
>> runtime support and is used when linking a native EFI (i.e. PE/COFF) binary, hence its
> 
> "EFI runtime support" can be mistakenly associated to EFI runtime 
> services (which BTW not supported on Arm). So I would suggest to 
> s/runtime/boot/.

Or simply just "EFI support"?

Jan


