Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046D41902D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196431.349277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlKp-0004wQ-4o; Mon, 27 Sep 2021 07:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196431.349277; Mon, 27 Sep 2021 07:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlKp-0004uK-1X; Mon, 27 Sep 2021 07:45:59 +0000
Received: by outflank-mailman (input) for mailman id 196431;
 Mon, 27 Sep 2021 07:45:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlKn-0004uE-R2
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:45:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e42d40b8-2252-43d2-8624-76bb858806f5;
 Mon, 27 Sep 2021 07:45:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-rB0Csll9MGaVqHBu945SqA-1; Mon, 27 Sep 2021 09:45:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 27 Sep
 2021 07:45:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:45:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Mon, 27 Sep 2021 07:45:52 +0000
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
X-Inumbo-ID: e42d40b8-2252-43d2-8624-76bb858806f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632728755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwNwRqoEtd1Tv6Fa40/+aQ9YyaXVlHlq/LvEhc6yWpU=;
	b=O3mlmvEKQA47Wwn5Xkdovbo/DqXsTfPiKAeEcQGkqOE+4nsWyfbTtQfeRv0SB5hPEqa8Hm
	IKGnVy0Hv8DnoeXJTSTDKytftJARLhGfW8iiBWrA7MzSi6At/6VYX4r8A+zrcdhlq5+AZG
	4R2y8/94F7ioiDy6fuAMDcYkf7ELFJg=
X-MC-Unique: rB0Csll9MGaVqHBu945SqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0lfuZ29sJCzQbucmKptyVTdCraY0tHr8fgK9KBYOJOdkC8T7p2bUa4gs9Sqz95FOhe2/qcuC0U3WjheZ96KqDRpf9WJRNZFKSehyhzz8R3NJsiu7qPjF+ZSy0cR43K6ZMjp5TQETaaH2k3dSDyxz2GnHWgJ2pefZIJ3/ShoRj6Aq02gvRrTDQfjn47JuNkNupl9+7gcArptKiRETTmww42jVtVsJ6E7rC62bm8bw+UV3lEY6/w2LSwFIm6cFMMTxlIqnK6FTnMxsLPpI0TyPOgYYaYRv8KW1dyNgfQxpmZJ2Y6AAVP7eerIiPNYQHL+KdUdQRdg9fwEQYz1LplNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AwNwRqoEtd1Tv6Fa40/+aQ9YyaXVlHlq/LvEhc6yWpU=;
 b=nRsFXQGh0PwUZsQj8No+xtZH5XOuJz/o5etfwmKERs/XlXib5L7JlbO0WgM/SLjQUYZN0/D84iLeDwvLrjlmSjBA0u2eePVMcefbAmaHtijDCYPbFRRaEk/PViuRnBDN4Nhou4GRmvYkjyoKVnPA92y0y4e5exW/CycOd7hX8A7CdsOLD5wUXaYxpjAhxj1k4QrHw4SOf64hSzGz09qrJ3kRJWSjg9IvIqeDTpz4Wc4BIzW9KfIWxopRwvy6aOYn1cJqYu+ky3jjRgo+AqXz6YAbDTjO5Saxpi0N5xes9reblCySvwpxCjnV+srH0r4UQ04E5H2J966yH7IgQlk0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
Date: Mon, 27 Sep 2021 09:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923125438.234162-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84099f6c-2308-40d5-ad20-08d9818ad4dd
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087F7D8B6DDE796C64F4BE6B3A79@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TDsGo2XHUylb4qGAW6H/7ByA0+HFqMiR/JMxirpoK1Po6v83w4axmG5HXOzK8f4Z/XjQ3561bGbde0yKIORtnBQ5FbDPJyAwz/8BEsEzHj2QsVMntPsQXATwb3qaq6Janf2M0Izl9tagn2EGOg6ZMCnCZoURFpo3xyagairXd0ToYrNplTFatUMlRDhsQR/EeF5THdrBeHGe1yFP4C/1r6KbkVtW2tFF8LKyRMGUglpm31qSdwFgZOfJZmZGwd0CMgEZfrtgUh3ExeF7mWH6yWOXhcyv/14z7px1kCDXakpuCMxYk1sucDGgJvmaTW3ERy6QiHxt9FFk/plpN1RVyHNAdNIyGCGGSyLPKxcI8vZi0pNO77T9Fb1CXjFKp2PM8sk0UZL+3ovGbNP2gH/zTpivg2R32IXKS/GzFvDnwn7X4L8UDLBYRQ7NQyIOn2dPSMDQfUnlmowRga3sii71ADa1KMdkz5u0PQmLAK1+liNA/W6Z1dOAAbNFf+jcYWZO5L8GgI0eJh8dJqcwRFChOfrDl5IYnNmB/aJetMiowg8TUYvgiAvpSMrC6bRuF5oR3SQBHOcxevzrDBayqRgQiYYml+78G1rqJNNm3gl5j3PTbz7Fb5lEZZiVnodLkt0cxyLOEsDHdefldbnTdb0r1hz8DNRSSKN68sTXZBvFlyV/4QBXfwdKqS6xyQDm4Os7C+wUILDdrpVtWYbAjpwk+rQW6q6ezW8nb7bEHw00HnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(2616005)(316002)(16576012)(956004)(8936002)(2906002)(31686004)(53546011)(7416002)(66476007)(31696002)(38100700002)(4744005)(36756003)(6916009)(4326008)(6486002)(5660300002)(26005)(66556008)(86362001)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxCeGt5Q0pnTThHZzhNOUdkNkZvM2l6bFF6WUhRUUg2bkNwYnM5aHNReWRl?=
 =?utf-8?B?NFJHYnFBOHMxYVYwRW42dVF2ekRMMDVBUk1qQitxZ0wzZnBDbXJOa09rWVpD?=
 =?utf-8?B?R084V05yVjZ2Z3J6UEhiMkZOWTZ0cklWbEtITVRyTVhxMG5Vei9NYXVQdmFS?=
 =?utf-8?B?cjBxRXRqRnU2V3ZFaXI1cDlmbGdjbmtVSDNFMGZ6U2JDNWJYTXhXNHV6M1VI?=
 =?utf-8?B?UytSVk1XcGZXTXdzaVk4MC93WmxZYnZLQ3VrK0xHRVo0bUViUUx5WkdzQUtj?=
 =?utf-8?B?RlJpeGptalBBaDdQNktJVGpoNGdaeE1pT3ZNSGhzVmZnazl1TlU1aEFucnFS?=
 =?utf-8?B?Y044bkhSRDVWclRtSldJNCtEMzEzNldjSTZFQ3Nna0hZTzJ1UUFScHhEQkdu?=
 =?utf-8?B?b1dibXpDU2U2T0d6Z0hBUkhpRVJ2cWNJdmhSdFAwcjl3V0N6aHlmaEVUcE5T?=
 =?utf-8?B?RVhsZmVOSGFnMncveWg0MDR6MTRxa1IwYTlVcFB3WVJlaXJSSVBSWUlTU3hy?=
 =?utf-8?B?dzhVbU5xU3Q2Um5RbmxtSEFoNkNEeDEvSEF1eFUxRjVSSWF5bldseHlRYXV2?=
 =?utf-8?B?eXhIbXAxVzdqRldhWTN4WERmTiswSU1ZSnRLM0NTQmxZcngxb3NqQXhCSmh6?=
 =?utf-8?B?QmlLeHIxWUZzSFRqLzZ0MDBJcERIaDBMQkQ0TjlHY1lnOGRabklBMlgvSjJX?=
 =?utf-8?B?VmEvT1BYL0gvT3dBZVJUWG1LdWdTT0l3bTZxOEROSkVlczR2ZllvZm94eXZw?=
 =?utf-8?B?QVNjMnlGN2VXTTI0SG0xbUlQWWNIbTNFUkFtOGFmdWZyL3loUXdQZWpENVZp?=
 =?utf-8?B?bXVMTUFYajBKR0dXeFRPSTZILzlJU1I3akxRNTgxNTN3UnNQNytFWUNBaGZT?=
 =?utf-8?B?amgrcjBJbS93S2NtNjBvWmkxSGtRTHBsVzNNaWdVR2srNmpkTVdhTGFCc3Nn?=
 =?utf-8?B?NDlUWXU3aVpLTnF2SXpISlBvdjNhSVVxL3RJM2krSnM2dGhyL0RCMkxNQnRP?=
 =?utf-8?B?dE5Nc0lFMDQxeU1xbHozTDFDOEZiajFnT3RCRHN1WVFXelJSOTRVK3Bud05k?=
 =?utf-8?B?MmwvYWhBOHU3ZGhCMklsdy9Yb3BXa2lYT0pYWlR6SHV3SWs5dWNuM05vQ0Nu?=
 =?utf-8?B?aUZwazZhdjE0NWZsbmI3R3JhOTNta0svY2FEYU00RjFvNXRSSGE4NVNxSnE2?=
 =?utf-8?B?Y1dTblBTRG1VOTNSVFlDcHdiOVY2MVpjakZZMFA0eUFISWwzK0EvQmEzMVRK?=
 =?utf-8?B?cmhHMHJqWVlpTmRLamNFZnA1NjJ2YU95UWxFKzdPSWdJMGMvR2V0cmtNN2V1?=
 =?utf-8?B?ZHRqVmk2eE5EQXlUN2U1VFdIeFBqcHg5Q2RpTjg0N3pQUE9kMisrbWRHcTBP?=
 =?utf-8?B?T1puTndjTlhFQ2o1N1BsSjZjR0dJN3hjaXJNeU9BY3FwTXl1N3YvUDFJdnkx?=
 =?utf-8?B?Ym02UURxbU5weldSWTBNS003eGdtUXZXbU1UZmQ1eVJDUlcveUhETkdrV1c1?=
 =?utf-8?B?b0VuZDh6TGhzampoYWVkWWdIZzlkbDNEZkhhd0M1dVpLUGtibmlsWktZY1ZL?=
 =?utf-8?B?MWhtcG82Q1pYSnhFZHZySm5rbVJxbzZLOUU1RzlWaVRzenZsVmlZdU5wUW13?=
 =?utf-8?B?WG9FVk5nZ1Q5U1VZaWtCalBxSkVPYTJWYUxZSUFtQWdHWFl1VGVNMTNTV1R5?=
 =?utf-8?B?Y2pXMlNrU0ZBMUJOWWdoWVRjVkdla09jMFU5TFVXQUdUNFNPV1ZsNithZzFL?=
 =?utf-8?Q?X0sOl5QKxdHd0jtvcz1UJI+FMOGntm5w/oLjct1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84099f6c-2308-40d5-ad20-08d9818ad4dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:45:52.9041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8g5uWHerCuZvF8Om25/NGJf0Fn4ARGpjLYK5Libj6xKXyzBFE5LyLvD7o4mz4bVNeM3BpEfRCOizNXWXTq2tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> +#ifdef CONFIG_ARM
> +    pci_to_dev(pdev)->type = DEV_PCI;
> +#endif

I have to admit that I'm not happy about new CONFIG_<arch> conditionals
here. I'd prefer to see this done by a new arch helper, unless there are
obstacles I'm overlooking.

Jan


