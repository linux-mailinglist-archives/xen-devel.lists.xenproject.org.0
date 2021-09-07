Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38340289A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180991.327923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa5c-0006CJ-7y; Tue, 07 Sep 2021 12:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180991.327923; Tue, 07 Sep 2021 12:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa5c-00069j-4y; Tue, 07 Sep 2021 12:20:36 +0000
Received: by outflank-mailman (input) for mailman id 180991;
 Tue, 07 Sep 2021 12:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNa5a-00069d-Ly
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:20:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff3fde82-0fd5-11ec-b0ec-12813bfff9fa;
 Tue, 07 Sep 2021 12:20:33 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-6oMtLmXNOI67S5XH6MHvJg-1;
 Tue, 07 Sep 2021 14:20:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 12:20:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:20:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:208:be::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 12:20:29 +0000
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
X-Inumbo-ID: ff3fde82-0fd5-11ec-b0ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631017232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOo934swFYPJYytLsLK7LxicndHY3S6qCxAIAYTwKao=;
	b=BdsFBVHImLm1iUAZU8KtAJYLKE1WiQzIcoUmXgiOKellqhiurPtxMdjMRGQ14a/V3SB3Bf
	nShNUhY5HMfXb1t+FnI1Uj3JaQUBpnEq4jHylOZ9caXUkgN0VGDtlEWooQG/diP54RfH3a
	OVYV+mVOqUNh77viXyciTy63SILyL/I=
X-MC-Unique: 6oMtLmXNOI67S5XH6MHvJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0XAC/1buMfHNfuTp6lcySLLCKJ26HRv19rypIzje4uceXbmcIq9nGbHoYuhXpTFJ7wyxxm4KJLmzHglO2f/Y50QSPFE2bbwy9eN2mfF4dS4icuXPesd7/b0EsWd+v4UraFJk8mqAutocwvbkUCwnVFXLON1KBAVdLbVw4j7G79fGPABkDIwR6CWTNI4mu4xLZscR1XYlBKV5kjib0lEOq2lT7sfOOM5BjMr6ZmBPZRQdCMgaDg5f+knGnc/lHxgrxAX7fIgu48FD+N+hdggeFWgDwdXrYoGuPoDHLDacZNGpjyvqhgT1ZspyurYz9p0+Qr6yCHvvMiSqaQFx6jPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wOo934swFYPJYytLsLK7LxicndHY3S6qCxAIAYTwKao=;
 b=oP+AuPA9M+n9XXLVIIxOuyaHCAkc/h+F2qy7316wfmO3jM50MSH6be8pp1MKuLLqyaPHYZ7MpRo5YT2h59Q4tMvIttVcEKbpcVQEKdoMocR8eIsWkKOSh8vrLUukGLO13XFqqnRbCSbjPEZWeShi83gG+JjMWk89g2smdb5I3f13cPRwumbMWesgMcZ/pxQArA7hcIC/A5/frM/pf2eqaV4eDsarbvYNX+FNnPzLPQOsb+sSMPum88VH+8BVm12su70/WiqNEASR+UBehtZgLUk8gqIKrSMd2ExX5FEjanh0V8t/zy3FzqZBt/GSvcKFB7hkvSFIWPs+4gsL5LUMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
 <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
 <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
 <938156e7-cbd0-a19e-f09f-a41dce051367@suse.com>
 <b4c94187-db81-d52f-0425-959fe1e9e83a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de2165eb-0c81-d020-f76a-3a8f97fb8cfe@suse.com>
Date: Tue, 7 Sep 2021 14:20:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b4c94187-db81-d52f-0425-959fe1e9e83a@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:208:be::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a8c0a58-6911-46b3-186b-08d971f9e1e4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167CC82093249586D7FD450B3D39@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lt5rPZjmXJgizDDx6O66cYvY4i1eFNfCxwQ5sdT+zeuAvBub4ahGOnjUtHjWMJsmcUV33iU4aNVbjPQELzedL5T2Q2qIfQO8RGvDTRodeUoGghqmrx86P+Bia1y6WDdelxiGvDJebGF0vay0gg2cfznq7vO0Nu5RkdtU1Uv/+7mers+jsAHzUgRIz3SLLxg844Wl330hLtb8YjK4osA1M84ckkkROpMNwgOi/QBillx8POhl5MWTCSgXpHsThU7Q3btr1p7i/+egnRB7t2hk+8ZUjAb13OI2s/BrvPBfLywACBr63ofvPNOlg/0t9MkKsfp22WWTs8FVHcNS8yWM9sOefx7J9U8XSfd1rdcbt2OjSGj3LrFZh1NsVaohheP528V2piVRdnKJsqAXscU+UZ1VEshW30NchqUXYxMAj2T0X4LA0T1+Y8X4AoLMIuHLu03+Wf5NfpvqhXIF4swbYe14XSwI3vkdxJZDzHZfAzB2kV6DCdnwVkcEQCmD1dxT+1jegX+PaaE9kCWUkrGfCkDSo0SCVILogZL1q5OGCfwlMV7cZv6+Lh3Jz0dU9XJpTwxWslAmgQYlrcfxgZeYj0w5AvVBTMy5zPWfhtq4LhspLNtiitHb0366PJGPTE5jXWbJbg7BCLWclMoSjo1S/oNIgA9HYwQOvoabACxhbQdsnayUqM6CgnQ0spnas1EGnyfV5ApyXxXytun/rFJXVkf5ILLngfbXnEq4csaah7MRHt+/CqPqJ19ocZIlQJa4gmD1m501mDs6zHDbZrymaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(66946007)(36756003)(26005)(186003)(31686004)(53546011)(31696002)(8936002)(86362001)(2616005)(956004)(8676002)(5660300002)(83380400001)(110136005)(66476007)(66556008)(7416002)(508600001)(16576012)(2906002)(38100700002)(316002)(4326008)(54906003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjEvcUZhR25NaTU1ekhiN2xFa296bUNoSTZFNWtKaHEyQUltUGgxZzZBL21M?=
 =?utf-8?B?ODZCNjhKZ2haWUxhSzdiUnIxODk4bVQrZE9iYXpTMlpRT0lKWE5NUXBLejJy?=
 =?utf-8?B?L3grWWhBK1JxRnBKQXV6WXpEZGNtZkxiN2tueUdBbExkTnFjcXRQcEJQWHNY?=
 =?utf-8?B?dGplNnBqVUJzWXd5TDhxL2dNQWFXOFRCTldZcnQzVGxOQWdGY3I5QkFYREpz?=
 =?utf-8?B?bHNaa2VFNWZMN0EwZm5DVkdHOHlnYjFxaWRoOEV3WE0wWUNZc21PbzMvLzh2?=
 =?utf-8?B?RE5qZlNiSzBjMEtXeEFDWnhiajQyczNFS2ZqUWlXaERHU1E4eTBtSHEvZzkr?=
 =?utf-8?B?aEJZRmZkUTZOb3lVUVBsZWxCdXNnV0VvL2lySjRjMUVrN25vSnFIZys4VHA0?=
 =?utf-8?B?R1ZMZERYZUc5OE43QVhuaTJpMGJUNUx3VkE2QTFPUHI3NHBnNjVMa2VPSXNS?=
 =?utf-8?B?NzBkeW9mWGZwbTdjNXNIS2VQOWNlWHN4Y0xTVXZSWU12ajJwNTlzRm1sWlN0?=
 =?utf-8?B?YTlGVHQ4WHE1YmVpRG1HSDZ2MCtmMGpLdWd4M3Ezc3c0Y29DTzNiUjk1MEVq?=
 =?utf-8?B?eVB6bHZ6alJidVptMWhDbXdBcDRrSVVKUFgvTGc0d3VhMnJjL2FqZ1VhcFhN?=
 =?utf-8?B?Zm1YZVhveExCcnh0d3YwMkpOOTlvaG9hVTRjb3BWeTJ0eS82OFQ3SFBCTU5p?=
 =?utf-8?B?ckJWVi9lMjV3b2RBL3BMUitpdTlzdWpUaUZ1TitFTkN0WjNoS2FtWWN4ZXVU?=
 =?utf-8?B?aDkrVldqM0tkT3U4bzZJLzh1T1Rxc09wWE05ZXNRZlI3YVpGTExZSGd4NmEr?=
 =?utf-8?B?ZUc4Znh3aGhvUUE4cDVzZXJtK1J6eGFsNUFyU1E3UThzV3lPSzNOWHZsVzQ2?=
 =?utf-8?B?RDBPUHQ3blJYTnZBV1c4RUk0SWpibVJtZVpGQ0ZIUmhaZTVlL3FmSlkxQlpq?=
 =?utf-8?B?OWl4L1RvVEJEOWV5VVhuanBLY2lldEdjVUI5RngxVGtwWUo3clRwbkVacndU?=
 =?utf-8?B?aGpmOXF5akliUVlVNXdXWUUwRXNXQS9NQnAzNnpUUkVla09YYmx0OXY2WExk?=
 =?utf-8?B?YXhnekhXTGd2Mmc3TUtRRVdpZm13TXN1U1poOGM3eEtETUFXb3Y2RlkzNjdU?=
 =?utf-8?B?eVBGOElYZ0hKV09LcXpaVjA1YWZWeSs5NGI5RjFOWTFrdUFDQUltNzFqK1pj?=
 =?utf-8?B?UURGVUh2K1lXUlFXeXhYQURZYkJvT1ZwU25CMkRGQnpSMzl6NE9tVXZ2UVFT?=
 =?utf-8?B?a3huWlhtYnpnZVpCWUxvY2lHSDloMVJBaEVoRFBaSkZBN2gvdmJwL0RkY1d1?=
 =?utf-8?B?ZWFZcFNneUV2RW9sRnQ1WWpiY3V0bXIreTFmN2x4UC8zd1pDdnhkK29HamZ1?=
 =?utf-8?B?R0IwS3lEaWVmRUUrYlBaZTJGTThMcWZCZmhxQUxGY3VHZTBjaXllS0JYaHBw?=
 =?utf-8?B?Vks4ZDdCajJQWjByeDNVNnlieGY0aUlMNWhleHZRRlk4eC9MR3U2QXlPQU1Y?=
 =?utf-8?B?aHlPbGFUTDlQdExBa2xwQUVTWVI2aURGOVNpRlpmcnZOQ3ZVdHJMVFBuOUhO?=
 =?utf-8?B?Snk4aTMvT0d4UUx5UkxLSHR1bzgwS210Z015bTdiaWJDWG0xQlV6YklBWUhv?=
 =?utf-8?B?Z21qZHU4RTZIT0VubE1wa1VhV2VhRVpoS3p2amM4a1lJVXlHVXBUcHUrakRJ?=
 =?utf-8?B?TGtrUU5aSU5Ja1ZVQ3Z1bWhadW93RDdWMENMaklqNk1UaGozNlZKWjV6Ynh3?=
 =?utf-8?Q?wkP5PargyR6utdG3vLZqxrGDqlyyt/oYzqIP2RQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8c0a58-6911-46b3-186b-08d971f9e1e4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:20:30.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swnGz/9p8fsPUvGOyqrBc14O/PWj0wDu1T+seFWUgyc89qHb+UJuIGqzEUHbnyKxJypJf2RTXbC2OT+apmmd2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 07.09.2021 14:16, Oleksandr Andrushchenko wrote:
> 
> On 07.09.21 14:49, Jan Beulich wrote:
>> On 07.09.2021 13:10, Oleksandr Andrushchenko wrote:
>>> On 07.09.21 13:43, Jan Beulich wrote:
>>>> On 07.09.2021 12:11, Oleksandr Andrushchenko wrote:
>>>>> On 06.09.21 17:11, Jan Beulich wrote:
>>>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>>>> @@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
>>>>>>>     }
>>>>>>>     REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>>>>>>>     
>>>>>>> +int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    int rc;
>>>>>>> +
>>>>>>> +    /* Remove previously added registers. */
>>>>>>> +    vpci_remove_device_registers(pdev);
>>>>>>> +
>>>>>>> +    /* It only makes sense to add registers for hwdom or guest domain. */
>>>>>>> +    if ( d->domain_id >= DOMID_FIRST_RESERVED )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    if ( is_hardware_domain(d) )
>>>>>>> +        rc = add_bar_handlers(pdev, true);
>>>>>>> +    else
>>>>>>> +        rc = add_bar_handlers(pdev, false);
>>>>>>        rc = add_bar_handlers(pdev, is_hardware_domain(d));
>>>>> Indeed, thank you ;)
>>>>>>> +    if ( rc )
>>>>>>> +        gprintk(XENLOG_ERR,
>>>>>>> +            "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
>>>>>>> +            d->domain_id);
>>>>>> Please use %pd and correct indentation. Logging the error code might
>>>>>> also help some in diagnosing issues.
>>>>> Sure, I'll change it to %pd
>>>>>>     Further I'm not sure this is a
>>>>>> message we want in release builds
>>>>> Why not?
>>>> Excess verbosity: If we have such here, why not elsewhere on error paths?
>>>> And I hope you agree things will get too verbose if we had such (about)
>>>> everywhere?
>>> Agree, will change it to gdprintk
>>>>>>     - perhaps gdprintk()?
>>>>> I'll change if we decide so
>>>>>>> +    return rc;
>>>>>>> +}
>>>>>>> +
>>>>>>> +int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    /* Remove previously added registers. */
>>>>>>> +    vpci_remove_device_registers(pdev);
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>> Also - in how far is the goal of your work to also make vPCI work for
>>>>>> x86 DomU-s? If that's not a goal
>>>>> It is not, unfortunately. The goal is not to break x86 and to enable Arm
>>>>>> , I'd like to ask that you limit the
>>>>>> introduction of code that ends up dead there.
>>>>> What's wrong with this function even if it is a one-liner?
>>>> The comment is primarily on the earlier function, and then extends to
>>>> this one.
>>>>
>>>>> This way we have a pair vpci_bar_add_handlers/vpci_bar_remove_handlers
>>>>> and if I understood correctly you suggest vpci_bar_add_handlers/vpci_remove_device_registers?
>>>>> What would we gain from that, but yet another secret knowledge that in order
>>>>> to remove BAR handlers one needs to call vpci_remove_device_registers
>>>>> while I would personally expect to call vpci_bar_add_handlers' counterpart,
>>>>> vpci_remove_device_registers namely.
>>>> This is all fine. Yet vpci_bar_{add,remove}_handlers() will, aiui, be
>>>> dead code on x86.
>>> vpci_bar_add_handlers will be used by x86 PVH Dom0
>> Where / when? You add a call from vpci_assign_device(), but besides that
>> also being dead code on x86 (for now), you can't mean that because
>> vpci_deassign_device() also calls vpci_bar_remove_handlers().
> 
> You are right here and both add/remove are not used on x86 PVH Dom0.
> 
> I am sorry for wasting your time
> 
>>
>>>>    Hence there should be an arrangement allowing the
>>>> compiler to eliminate this dead code.
>>> So, the only dead code for x86 here will be vpci_bar_remove_handlers. Yet.
>>> Because I hope x86 to gain guest support for PVH Dom0 sooner or later.
>>>
>>>>    Whether that's enclosing these
>>>> by "#ifdef" or adding early "if(!IS_ENABLED(CONFIG_*))" is secondary.
>>>> This has a knock-on effect on other functions as you certainly realize:
>>>> The compiler seeing e.g. the 2nd argument to the add-BARs function
>>>> always being true allows it to instantiate just a clone of the original
>>>> function with the respective conditionals removed.
>>> With the above (e.g. add is going to be used, but not remove) do you
>>> think it is worth playing with ifdef's to strip that single function and add
>>> a piece of spaghetti code to save a bit?
>> No, that I agree wouldn't be worth it.
>>
>>> What would that ifdef look like,
>>> e.g. #ifdef CONFIG_ARM or #ifndef CONFIG_X86 && any other platform, but ARM?
>> A new setting, preferably; e.g. VCPU_UNPRIVILEGED, to be "select"ed by
>> architectures as functionality gets enabled.
> 
> So, as add/remove are only needed for Arm at the moment
> you suggest I add VCPU_UNPRIVILEGED to Arm's Kconfig to enable
> compiling vpci_bar_add_handlers/vpci_bar_remove_handlers?
> To me this is more about vPCI's support for guests, so should we probably call it
> VPCI_XXX instead? E.g. VPCI_HAS_GUEST_SUPPORT or something which
> will reflect the nature of the code being gated? VCPU_UNPRIVILEGED sounds
> like not connected to vpci to me

And validly so - my fingers didn't type what the brain told them. I've
meant VPCI_UNPRIVILEGED. I would also be okay with HAS_VPCI_GUEST_SUPPORT
(i.e. not exactly what you've suggested), for example.

Jan


