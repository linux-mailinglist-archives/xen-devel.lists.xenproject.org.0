Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17534A8413
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264699.457895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbZh-0000ZS-Ba; Thu, 03 Feb 2022 12:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264699.457895; Thu, 03 Feb 2022 12:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbZh-0000WG-7F; Thu, 03 Feb 2022 12:50:57 +0000
Received: by outflank-mailman (input) for mailman id 264699;
 Thu, 03 Feb 2022 12:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFbZf-0000W8-Ll
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:50:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9276c5-84ef-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 13:50:54 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-eTOkWibcPsWMyzq2aHpBRA-2; Thu, 03 Feb 2022 13:50:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4860.eurprd04.prod.outlook.com (2603:10a6:10:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:50:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:50:51 +0000
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
X-Inumbo-ID: ec9276c5-84ef-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643892654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fJYLOu+SSapEu4PHaPUc4xhfvLCAo0tqu4/AKsrBAE=;
	b=mzhN0/kdJj+7Rg6/QATsTaEkXn85DQMxdN5xcNZ2Qlljm/dl8znOekM9MsHL134DQDKQkA
	mNUUEU31vO7os4rBsKzkW0uqFeY/3kQSiBrz6VIqoTM2avWG0pXoHdX48HGk3CXKmHOBdT
	VdOi9phh4ZecURVooV1miKgdUW+b/WY=
X-MC-Unique: eTOkWibcPsWMyzq2aHpBRA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cs4Clw9uLH9qLlHP0M9a5dQL62Gv7z+4SWuRaGz8hFKdHaj/rw4tlA38Zio3zjkB3J3RPHoYKhYAF79GBgoBfxJpXYYiFUj7+x91tpgBv3TK1oqCW1IC/V1GDngqxajRVWzix1bIcfkPd8QR54Fq1qqOc6MTETHmFysod2dANn4+vI3QT7cEJCA+prt17RzYnG9qWNKs3x0q3GEfybLmVxXpm6C07ISMPg4Ps4Znf+w8ihuKMt4SSmHLM5Kru8Q6W01mkfceqbIHjHgTkGfKUpZe3IZLwF/t6WWH2Kv/22d/vCYDxyrXxZBwtzHrLoX8Rh2bCm0HPP+mABeXSvT1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fJYLOu+SSapEu4PHaPUc4xhfvLCAo0tqu4/AKsrBAE=;
 b=im4bV4/4lf/GQTvvfHGV2+8bco7TWpjWEMFG0k+t85NjEkTSSGLk0hf2QAE7qgZr4qHMvXLmIGgYhTUOdLtCH2wM6ijorSjLyJrtEaQXyjzfn023lW1Jh0wQzsM2D+zSiA5cIEthk6XPIYab2Zzrex8rZu5qdQcRn0FIIWjN/aSx8E/08G3UkceneRFGydRme0+wd8WltjYmMxXwWvs7mCe/CatUfVdq+jS+HcLcPrCu9egi3Hx2XO7AbwkwkcTB+AeKjhX1p1rkS0AoCSuUy7Z46/TqgwoQhVnh5Hvwa6G2qwp1HmDGOPyL3UZijM4rLTLXzSiIJkVy9yQUHbgi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4dd945c0-c600-4515-6f99-a75d06cf84de@suse.com>
Date: Thu, 3 Feb 2022 13:50:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
 <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
 <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
 <8ac4e23d-afcd-d965-fab0-b437baef8172@suse.com>
 <c9e7b16f-db9e-e86b-a5b1-ca87d5fb6609@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9e7b16f-db9e-e86b-a5b1-ca87d5fb6609@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28065e1e-03b6-49ab-f283-08d9e713cebe
X-MS-TrafficTypeDiagnostic: DB7PR04MB4860:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB48603C5D116947AA2A6B3DC5B3289@DB7PR04MB4860.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HDl6xkprwM3WPrZ29+00uAggc5sSUdiig5acn/yqXxTr5DEDJ8nd/jf5a6iVMO0Zp/JcD1bhNl12RzsTJp44brVz2UxmK33WMlsfmyWbzygsMQwScHWQLmosG1jfIyIaTh20dCy4fL2VJEf+o7fSdxhaYWIeeEJKTDcj5fuWOTVLLjltL2gWXlJ8DSyulR1yJhgMw9h86gFfPlLDOdtjbZxqCkXt1HYSj2uLU1WG/4OfM/laWkPqmMQhu9r0K+aGRCg+yi2UHTlZ05BElbn0pEhKPeBjkvuZV3OkEWm3WN9jqqXyKgHz00vzJjwiOC1Z2++MFL7yWYkDAeGX/VZew9EEXnTudLLLbSmfwfbW5C4jjbxez8SBgEFR0RUD5akYsR0exxBC+rUoj+fdBmw0qstgXJ3raYIj6SkBd5Z3Bgsv591LzpugD3q8zZklYO57Ys8rLyoMYxw6U9V87TbnOFboaEtw5/S60VYTLGX+0B5v8lZxOdDCiMPuZ/vvXJ0BVenXGzlGZbg6M1J9k6/Lw7QqIE6qgdTiKEmu7uCsH7PiVFluNXyjJCoGfcPIwX3tcw9wutqpD9cunYU3+TtrgFOhx1IYwVQCN06SGKY6IqKCXQ7P7XkQIBrWUvE9yohthTmaQXuRCpxI/ImsGWsRcR6J/lkEOgNA0qtGDdFDfh7sJ6v6+DUL2xRgqpSOnZbuMVW1clZ3oqcHW9jhtvOtbsu18CC9ls1/vy7yHgLJybBUDFr3gWheTMPR0xaJU95w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(26005)(186003)(31686004)(7416002)(2906002)(36756003)(508600001)(86362001)(6486002)(8936002)(8676002)(6916009)(54906003)(66556008)(66476007)(66946007)(2616005)(38100700002)(316002)(31696002)(53546011)(6666004)(4326008)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzNCQStzNXkxNmxoNHF5SStkN2pxUU9wZmpKdUZMS2R3UHV3WEV4SDRKQUI3?=
 =?utf-8?B?RWVOTDQzQXBaN1grSHpxS0tmNzZwT05hb1A1UXlHZWo5Zk1vT0pwM2l2S0kr?=
 =?utf-8?B?bUJEa243ZS9wYXJvVGhWRlBiL2dkVStqUHRPczVLcWJrTEt1QVd0dkpwQ3I4?=
 =?utf-8?B?RHBEM0o3djR2RE9iTzFiR3BKb1hFWitPaTNKT0FFeXhGbnRSbmw2L1VONFps?=
 =?utf-8?B?bUZYcDNGZnhIZmJEV2VWYjJlMUFuM1Q0KzIwdkt5dkM5WGlFN3cxMldQV2x4?=
 =?utf-8?B?Z3pEcC9KdnBYa0NqaVR3eE9LK3U3Vzhob0pQQlBWVHZVS3VVRFhrSDZyLzJN?=
 =?utf-8?B?MFJRc1lkWnZTQ1g3UjNoQWY3aURuUlMxZVROR05ZY2ZUMHFhVlpTblJpbmNL?=
 =?utf-8?B?RE4xdlFmV25BQlpiOWYwNlkwOHMvbUdsS04vRGM3SDNGcTZvU3RSTDRoNlhQ?=
 =?utf-8?B?bThnU3ArdENOeVUvV3RUUEJud0RDdUsvWTFCMWZvRFVnVVJFQ080UXY0L1gv?=
 =?utf-8?B?Z0d1Ym9xRDdqa1Znek55VTE0dWhlZW5GazF5NXZCaG1KSUFsaUlMUkhJOE91?=
 =?utf-8?B?S0k4aHg1aWVBeUN3SlRFdExYRWU2cTBXQytxWGpFVGRLUDg0aEdOTnJ5Y21W?=
 =?utf-8?B?Ri8wMUlsWVcxaTI2bUxEdVN4TVkrRmpvWThPQkx3UXVmdjdQRXA1TktSc2xk?=
 =?utf-8?B?WmZuK1M5UjNmYi9lNVJ5SFFOYVVKQVhncVlFWXdhOUFYZWZoellpNUN3MTdh?=
 =?utf-8?B?NlNXZ3R6K1IwTm53czYxRFlFaHZaRE1TMm16Qmh0SXpNNHhUOTNuMDlhWkhn?=
 =?utf-8?B?LzdaY0xHNktxNXRSZ0s0N0txOXRhZU1xME1rSzNoQmtKTzZqL3JRcDRVSjlx?=
 =?utf-8?B?eFF0V1RDL3RzWTVKM3hJajJsaWYrN09Bcnh4ZmEwSklnUG82Nm91bDVHSHBy?=
 =?utf-8?B?TjYreFp5WElBZXhaZDhsK0hmR1ZXcytaNU9za3FxRDl2ZjZzZjN1MkZqZkVo?=
 =?utf-8?B?OUcyVWZ2VU1WZldpWGUyYXB4Y3UxQVRnMHRTeGpDVmNCbjJ3OVRJZGY3MXhz?=
 =?utf-8?B?bWpYWVhMdWtoalFMWnYyMDlLVzBVMFFtcVcvM09USkxKYmNxaGJsZERDUEZx?=
 =?utf-8?B?b3J2K2pkYTRFQlo1YUhhaUR5ZHI0Q0xqTEtkMDhhMDZ6eXh2aUFHU3lFUzB4?=
 =?utf-8?B?NnpybUV0ZEtkK21SVXgwVjI5cGhRc1FzZFpCdmdJVlBYQ2RCS0YvRTgyQ1ds?=
 =?utf-8?B?QXl5czlZUHVuT3pHVGl5eGFhY0FMY2pITjdRRGFqTithb0lNYlNGVFdPYjR2?=
 =?utf-8?B?ZHJudWN4ak1hMUxvcXYvUVU3VXhHUTZ4N1krVXMxaDB0Z3g5eWw2QUVaOGsx?=
 =?utf-8?B?ZUc1RUwzQ25tNVZ2Q0pjMlJvcXByNzlXTktieWI2Ulg0eXBlSnRTV2NXNktH?=
 =?utf-8?B?LzhNK1hMSFV4K2ViUTRKVWNVRXVPaFBYQnBFSHRqR2hqREJFeStFd2xDK0RD?=
 =?utf-8?B?MHZKejBOTy92bkk5ZnZYTlMxenJScDhoMCtQQ0xlZ0hZZTZBcjhqVnVZNlhw?=
 =?utf-8?B?L0p6YURmeldoNE1NQ2p1M3pyUnBUbmZWYTN5d2c2Wi9XOEVHWTViQWdyUE02?=
 =?utf-8?B?M1hCbXA3a0lsN0U4NHBlK3NCN0JsNUlDNGV6eUtNTGhUaEVRbjZ2NTVtZHIy?=
 =?utf-8?B?bjRnSUQ0V1RCa3VYM1hFWklsWUdmOWVEbVlEazRuVEJQbmpyNW9hY1c3V2RK?=
 =?utf-8?B?RW52MU40d0wxWnNVV09uSzRhL0VIRmt6YWJ6d3NSTXc2T3UzRFJWakp6NWM0?=
 =?utf-8?B?QWNxc2d2RnZxcmxSUDBQd0xnWmRyeUdvamRHdlloTE5WU1dVbVRJQjczOXU2?=
 =?utf-8?B?M1YrcHVJZlJoMnVrYnFGbVBYV3F3SDdCQURWdlZtUnlVaFhIaTNZRDYwOG1j?=
 =?utf-8?B?NGxMSVAzUXRzN25kQ21tNEVOK3Y0TEIxekd6MXRwK0NLTFg4YlpEcWN1T0tF?=
 =?utf-8?B?Rm9kdFFYYzVxRU0xYzBMNDZVclVENWs2VnlPN3hNOEhOT1RVdEJrRnVyOEY2?=
 =?utf-8?B?Y0pzTCs5Z0VPczVOS24wNkl3TnBrdlFsTXlOdmtYaHJrNlRjOTBZZHgyL0lF?=
 =?utf-8?B?MDdzWm9za0xkYmFremYrWU5PYVBNM0ZVS2dCMjdFNll2cVd1ditDZStEVjVD?=
 =?utf-8?Q?ZBqhHBR+Y3eE1mP/TqBvijY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28065e1e-03b6-49ab-f283-08d9e713cebe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 12:50:50.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9vYuVSuQjCk9f1E70zB/3Weui2Su5tG7PBGjawNYqPCzO+lNppm8YhnbMg37zTv9le7ve8MB5J4Q82JqTzkrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4860

On 03.02.2022 13:48, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 03.02.22 14:44, Jan Beulich wrote:
>> On 03.02.2022 13:36, Oleksandr Andrushchenko wrote:
>>> Hi, Bertrand!
>>>
>>> On 26.11.21 14:19, Oleksandr Andrushchenko wrote:
>>>> Hi, Bertrand!
>>>>
>>>> On 25.11.21 18:28, Bertrand Marquis wrote:
>>>>> Hi Oleksandr,
>>>>>
>>>>>> On 25 Nov 2021, at 11:02, Oleksandr Andrushchenko <andr2000@gmail.com> wrote:
>>>>>>
>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>
>>>>>> Add relevant vpci register handlers when assigning PCI device to a domain
>>>>>> and remove those when de-assigning. This allows having different
>>>>>> handlers for different domains, e.g. hwdom and other guests.
>>>>>>
>>>>>> Emulate guest BAR register values: this allows creating a guest view
>>>>>> of the registers and emulates size and properties probe as it is done
>>>>>> during PCI device enumeration by the guest.
>>>>>>
>>>>>> ROM BAR is only handled for the hardware domain and for guest domains
>>>>>> there is a stub: at the moment PCI expansion ROM handling is supported
>>>>>> for x86 only and it might not be used by other architectures without
>>>>>> emulating x86. Other use-cases may include using that expansion ROM before
>>>>>> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
>>>>>> wants to use the ROM code which seems to be rare.
>>>>> In the generic code, bars for ioports are actually skipped (check code before
>>>>> in header.c, in case of ioports there is a continue) and no handler is registered for them.
>>>>> The consequence will be that a guest will access hardware when reading those BARs.
>>>> Yes, this seems to be a valid point
>>> So, with the approach we have developed these days we will ignore all writes
>>> and return ~0 for reads for all unhandled ops, e.g. those which do not have explicit
>>> register handlers employed. Thus, this case will fall into unhandled clause.
>> Except that I guess BARs are special in that reads may not return ~0,
>> or else the low bits carry a meaning we don't want to convey. Unused
>> BARs need to be hard-wired to 0, I think.
> So, you mean we should have 2 sets of BAR handlers for guests:
> 1. normal emulation (these are implemented in this patch)
> 2. all other BARs: read 0/ignore write for all other BARs, including ROM, IO etc.
> 
> Is this what you mean?

I think that's what we're going to need, yes.

Jan


