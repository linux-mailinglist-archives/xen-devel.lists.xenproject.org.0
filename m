Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655D453708
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226430.391325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn13p-0001M8-K5; Tue, 16 Nov 2021 16:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226430.391325; Tue, 16 Nov 2021 16:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn13p-0001JR-Gj; Tue, 16 Nov 2021 16:11:53 +0000
Received: by outflank-mailman (input) for mailman id 226430;
 Tue, 16 Nov 2021 16:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mn13o-0001If-AG
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:11:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e893b1fb-46f7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 17:11:51 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8--gp3___SOBOMabdLrj6oeQ-1;
 Tue, 16 Nov 2021 17:11:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 16:11:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:11:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0124.eurprd06.prod.outlook.com (2603:10a6:20b:467::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 16:11:45 +0000
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
X-Inumbo-ID: e893b1fb-46f7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637079111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKaH47zIMbc//wK4qcmYNjZ8PfNlPttuXeOEVfSEpto=;
	b=DNcuw9sBjbNwUyytsoCcs5ky7OWBaJ2/rbGyje4wNp704sfGm72paxrWyAs5oyzjRYo5RM
	DW7TDHwQYXX0uBCxOjfNHQwtYh1wU3pRGEH2tniPmyAcTpOSoSY2X1kVOqRSzCe7DBywoG
	91GAncInupfdi5i6GdVfDVpB0iTqbQI=
X-MC-Unique: -gp3___SOBOMabdLrj6oeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsJJlvMIGbIxg+xLeUafVg03ABlbVy6umW8/QFwhCbM7kDbUI3B8bskmh6cYOl4WDeX2GHr0Mw7YbDHd7MbKv8wdbVHjO0+LPvGzrcsfyY2ap5vXdVd9EeD9tjC22vB1rUIhgjUUCk0d3fwQFDkYLKeT9l/WZ/UPv0rNZc7KR96uTC1jWSXUkUf9mRBxl1XFYf32svawzEMeOi3GW6WQuVJZjmTydelpHBHZ+UTnB4rWwjoph3l6c2ZADGOg9KG7NfdRe2UBKJmieJLznCExRnZD4M2WxdP9miNat9VG1e2LIG2X24h0yBmHU60W0elUSgLpOZkFhIoTGPyhoypFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKaH47zIMbc//wK4qcmYNjZ8PfNlPttuXeOEVfSEpto=;
 b=XSDqbaJLPacUUgHdvpWcBfhU2q9DtTHhf4Ct2YeCMWlBBTcTIcBLKkwbcs6L2kyJlZ/HqHIqW/AqpXonp77cobl10kmQ/1GRnYW0ivi0s7FKN5YWctykjD8Aad+7m0AVRFG+JiFIzoVweq10k1lK6NIAxQbEhlzsUIwDCmBvkOG2xMu+mcHxx42LYQpzJBra8h6MEvqenJrA0w2EHKiDALCa/25k7FUUE12whBgvvHGzqsIKHdnN/Euck2wkNY/MvOWqlr+eeKz2QvZaPf4lT86wWPRx8zxwxShulC22ioGZq+0aa6tcdHCU3Rw96yEVTsT6VvA144ADqYXm+IfaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db75423a-bb59-6536-20ce-fc9df89149fe@suse.com>
Date: Tue, 16 Nov 2021 17:11:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
 <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
 <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
 <725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
 <a07ff375-b910-0d73-e957-15ba9d2535fe@xen.org>
 <alpine.DEB.2.22.394.2111151359360.1412361@ubuntu-linux-20-04-desktop>
 <1606F25D-53BF-4350-B065-B1FAB525F6A1@arm.com>
 <24979.51557.253278.46402@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24979.51557.253278.46402@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb988c8-9230-40d2-5eca-08d9a91bc950
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590297BDD2C824724C4B9455B3999@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hTd9Q+8fUIe3h7om3q8L++KKlCjJFzqaKlCrteHMzb44GeuIjRjMS2fXKZRXEWkf0tfT9fq+5wEwDfYvF9W8lrk+EyecL5AxJcTH4UvuEJZKphQ5oweIxMLRVALmpsTVM1XPz8rKfxugrYrJrvti2No8cXzi+5cLtkgfgFgRdSIXBWKX7xz2LGMvbv20zRnrkhTw1W3B7avrRUsvKgsZAfKOOmoYs2c5Qkh9xPRtS7koaneDZcUmfM7CAGC4PF6r9Xo7WILJt6JTxNLZZUZ7TugfPMwrbz7dFJmZLQwFoo5omXIgREOd/H7jIbwaOvXUWR/mezufrzG6oO+U7s9l7QutxxNeGk6tdp5xod6z9Dqs9iW4iz7pdWTqaX9LT+QDdXAsMgeucbwI/0IUBGWetXssKyvOawnqIaWgASttNJAK0VCWjYf4t5AtAlsS//p7fQgQuORYeqjcnqmww+EAduMmPvswjWoKGJ3FXq4ENLUgOfqgxpm+fNmmpA+uPKkzGZzqLG2MzMqZGTKDe1vVaZoBSfPHqdSmoO84Aux8C/PsH8PhkwdhY6kZlcRfNKmnMEPbHntE50v3O6pV6V5vBVOEcxddl63yrBKgGVgZgKDvyiqO9QG8LpKGGHZ7WE4xAnYG07qc/M+7L2m3lGFCKSM7ugi3sqO/qCE+6fp7erVMYqc9enE4Nq98S9t9h2VbC+vcatXOXZF5V2os2EdPYK8rsV+ZOI0GCRlL/+jTL7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(4326008)(38100700002)(6486002)(956004)(31686004)(53546011)(16576012)(2616005)(36756003)(31696002)(186003)(6916009)(8936002)(316002)(5660300002)(26005)(2906002)(66946007)(66556008)(508600001)(66476007)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RoOHNLc3JvZURuc1ZRNUMxQ3BSSW9CQzZQR1MwVHYxVEYyeUkvZHJFSGNu?=
 =?utf-8?B?TU5uTmg0WHh6U0t6d1dkc1VoRlRkbmorVGFBZ1VYNHRFUSt1RnVuQ0NVa3pI?=
 =?utf-8?B?QkxXcm55bXRDUFcwTkVCZnRnUGJ5TmIyTFVHQldEWmJCL3Ywby9pakMrMitu?=
 =?utf-8?B?a2RyRzN3QmZOZ1lmKytrVUhqL3ByeDV0YlZRTkd0dmxoSUdxaUJ6WTZSUzhU?=
 =?utf-8?B?WmVrQUxBRi9rR043a003WlBHaXZNbVdlYy9WVjQ3Y3pxeTdPMjlVNWF3K2da?=
 =?utf-8?B?UWtjS2dQRUdjdVN6Mk8vVnFZT1ZaSFpwQkk1bVBHdkpzZ3E0RlFxaGxJWGZH?=
 =?utf-8?B?TU5aRHdFS1BoSWZUdGVhK3FQWThUaXRKb01BMFBIS3U5QW1jTXFKMjhmNVcw?=
 =?utf-8?B?dTFBKzF5M2FWSXphazhUUEIzbEJTWWplWHJVbmhIUFN5NGtPNkcyMERoU1l2?=
 =?utf-8?B?NkF1ZHYwU3hxRzRJaTZtcjlUSWw2R0xpYTBvc3dXUzBydklxSUJ5M1F1aVpQ?=
 =?utf-8?B?OHpwMHJ1TS9KS0tlR1VHOWUyU3BaMzZ1YzFLWFc4NVJzM3l4aHY5Y20xaTd4?=
 =?utf-8?B?S2xqZFVQM2piVnA2K0VZNTZ5QmdFWTRTNWFrUkJrZy9UWDE2d3M5SVhFODZj?=
 =?utf-8?B?QUxkZjh4aEk4Vi9wa01JZkEzY2pGZTNtRnYzaDQzQnhwRzc1RURmZXl6c1Fj?=
 =?utf-8?B?SWcwdWFuSGhQTHZOYmQ5ZWt3MS9yeUNpdEc4RDR2UjF1d2RkSnp2WUlNdkJk?=
 =?utf-8?B?K05sR2ZJeU5HbXpSMjF4RG5VUHhnZDVvNlVJcFZ0ZTJTUjNCbmRJYXBSMXYy?=
 =?utf-8?B?RVlvNGxUUWlDYmhqWm11ak5JVkpETVk3RWlsblRVelFwaXozb1gycTdzQ1NM?=
 =?utf-8?B?bVN0OC82RUVnblp3QnBCODZrZEJRSVZvdURHeHJHM1FqMkIyeHE2UkJLdmZD?=
 =?utf-8?B?Y0w4UXVic0NzY3FkcHRjbjlGOEZEQ2xnamJ5Znh3dXhReDJ4V2ZKSmJnaW04?=
 =?utf-8?B?V2VkU1U5emVjNFpaLy9zYS9HbGJ2QU91RXZVS3dOa1h3SUFGTlYvMlUzN3Fw?=
 =?utf-8?B?dnZMSUJjcTZwSURDY1pneFdLdjFtSDNYTms2ZVFFVXYrTlcrd05OY2RxcVVv?=
 =?utf-8?B?Z2t3N1BscnpubmVlVGV6cU41Z3QrVURBblRWb2cyQkorbVB2YnZURGRxYVBV?=
 =?utf-8?B?dk02V0xQeDJSVXRHK0xCVkZPd2lDbThTMWF6SzUvS0pmZjAzQ2p1WitWRlBa?=
 =?utf-8?B?Z0VqSmRtWUdqY2V2YXhJSUt4Sm5RVDI3VlJ0c1FkMHhxOGVEaEJMTFVUK3pZ?=
 =?utf-8?B?dkttSFQxUytQWjFJdDRqRzU0ZGNhM1FMYjEydGZhTFpXaFhVOUhyMmlzVFYw?=
 =?utf-8?B?M3NIL2I2Yit5VXgrWWkrcFdZRkREVmRQYkdsKzB5M24rQ0pFYm1HanlSL3VS?=
 =?utf-8?B?TWMxQmNLNWE1aVpkVVRRUDZldDFiMEFQZkZFUGE5NVZRTWJSa09qN0pPeWdV?=
 =?utf-8?B?SFBRYVdielBzRGRUekNvd1FqWmEwNml4UGU0ZFVOVXpQSExXb0VwWWlOU2h3?=
 =?utf-8?B?TkdHOWtNSjVnampnRUZ5blYxVXhjZG45SSsrYkwyVWdaMkFROFhROUlFeUtU?=
 =?utf-8?B?WGg0Qk5pbERLU2xCUUtYK0dRd2QxTW0xY1E0dzRVNm1PMUxVWkxrZlBJMmVw?=
 =?utf-8?B?cUl3ejVlMGVweFlSbENNQjZKV1ZLem1RNlMxT3doOXJwZU1TbDd0VnBTcmxL?=
 =?utf-8?B?amZtVUdEU1doWE4xRk90WEwxaGxnNWhHTlE1RmV3bjYvWEFzRUhOcGRvb05O?=
 =?utf-8?B?Z0RDUHZlbFE2K1hNZEdVVnpKMEdqV0tYbXlQQVk5MUN6anRjb0FrT0c2dy9j?=
 =?utf-8?B?NGljVk01NHJZWFdzcGJoc21XVU0xSnRUSzVVRFZJWXBjYUNZY2hYbFVQRitk?=
 =?utf-8?B?NXJhQmdQckJra3FMdnNwTUoya2Z1QXlYcllFYTdQZVMwbjBveXFVb09kOGFP?=
 =?utf-8?B?ekRBcFZMSytXczlkdE9OMWRPWTNrVWpEZzNZeW8vT0RwYkdYM0Q0V2owZGtk?=
 =?utf-8?B?akViYVR5aUJ6TWNKUEt6WVMyeitaT2VReExZWFFrdjkySXJ0TXJzVS9xNk9C?=
 =?utf-8?B?cGJiblM0QkFyMXgrSm5Ua0ljRk1mcTRsdTBkenA3UTh1NHFqKzNQOHFTd25q?=
 =?utf-8?Q?XHdTTNSdhjforTbXX3acPm0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb988c8-9230-40d2-5eca-08d9a91bc950
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:11:45.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7VHpzwvD+5tfqBUYmdIILMEv4FFPL9ZujDG7Ua3NeywqFUqp50JGuJeaep6J5JZYystQ0UgyF6/sq47y1U2Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 16.11.2021 16:08, Ian Jackson wrote:
> Luca Fancellu writes ("Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64"):
>>> On 15 Nov 2021, at 22:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> On Mon, 15 Nov 2021, Julien Grall wrote:
>>>> That would indeed be better. I'd like this patch to be merged in 4.16. Would
>>>> you be able to send a new version in the next couple of days?
>>>
>>> I'd love that too; adding Ian so that he is aware.
>>
>> Hi, yes I will prepare it and push very soon.
> 
> Can someone explain to me what is going on here in management-level-speak ?
> I have read the thread and, as far as I can tell:
> 
> There was an actual regression with Grub2 on ARM64.  This was fixed by
> 9bc9fff04ba0 "xen/efi: Fix Grub2 boot on arm64" (committed on the 5th
> of Novwmber).
> 
> But there are some objections to parts of that patch, from Jan.  It is
> not clear to me what the status of those objections is.
> 
> Was I wrong to think that Jan had given an R-b ?  Had it been
> withdrawn ?  I apologise if I committed a patch I shouldn't have.

FTAOD that patch was fine to commit afaic. My concerns were addressed,
but further concerns had been left pending.

Jan


