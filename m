Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17C40AA50
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 11:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186331.335055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ4TC-0000bW-NG; Tue, 14 Sep 2021 09:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186331.335055; Tue, 14 Sep 2021 09:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ4TC-0000Yq-Jy; Tue, 14 Sep 2021 09:11:14 +0000
Received: by outflank-mailman (input) for mailman id 186331;
 Tue, 14 Sep 2021 09:11:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ4TB-0000Yg-1x
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 09:11:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd0a933d-9d45-4c7a-a713-3abea8683d1d;
 Tue, 14 Sep 2021 09:11:11 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-ENN272z4NSqmdlIA60AU3Q-1; Tue, 14 Sep 2021 11:11:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 09:11:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 09:11:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 09:11:07 +0000
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
X-Inumbo-ID: fd0a933d-9d45-4c7a-a713-3abea8683d1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631610670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRSbwAvJszhlt1oSYrz+SNQDPj7Z+tBJanyHUCx4ZNo=;
	b=jU9ubkUXp17p/Ayb1fik88U/IDMnO1EqZOopEdmpD3JNkj0Cw0lu3Wn3SAOrMf2MIySuT1
	qFRKcHFDQa0Cdh4M5VLdorNKDzXZl2xiUL9HZNsRzUCiZ+Wdb3bhl8PZfr/nCX4M1gK96N
	i3tVB2LXeYf1M7+LYGgXxgvgJAWDhco=
X-MC-Unique: ENN272z4NSqmdlIA60AU3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J59eIivuc4qVroPkdUYDq79upH69aDnlR4vVkunpz1oEFMMcPUP0jQtHyfqKId8tZKAElBfkyqPcdV1ACP55XgdBY6Xg2Q9S4Rss/7TZv1L1k8iSxG255U2D//M47nsAqyvHSHx1+/8OYkpe74ZrUGFnlUDv1srkN88mBaMwZlEIlr5Bcvq7wHTLpBiIw5X3fxR8f3/6cYhe20VZEcUlIamSQJyor3pJa+3HHlI/LHozed5uEg4Ab2rcYqLEFGianRIBJ/6m2UZw5PADZaMxFiSgaLO4LXn++wXxLFKvmPH55+PCnoGZS2LRkYEEJ49Ze7d8zg2EbEqWO9Gia7GKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lRSbwAvJszhlt1oSYrz+SNQDPj7Z+tBJanyHUCx4ZNo=;
 b=Np6siSC8NP7aoig05HnzItV2+UttGQ/N3WCuTXyrEx1TY3mgl4BR+4snqqTlNkFbUsa9wbNVmJrBqRHYLv3oEswFu7sbrGYSGqdgMHo1hSktfww5BujwsWkY2o9B6QEb12YcpfMyCuUANdOXw+LyopggN4BtyuEGkEQ4XzIngAnQYtfuc+H0MSp+SLix+DTSfryqw0NNciNxJcgE39Tu7qm2+Xgs4MirLYXCOMJ5BR9YeESH5TpbWmHSPq51CIz3BlCrE2GZcOXYSitCP3UUQQBmT4iABGguDhAN6BudijT2NPHhrZiZ9J8yiO6oAvOTh2koY9dmKk6UCrsn78eqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
 <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s>
 <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com>
 <alpine.DEB.2.21.2109131328130.10523@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9819a6e9-93d5-e62a-7b4a-ffc2ecd996dc@suse.com>
Date: Tue, 14 Sep 2021 11:11:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109131328130.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635036e4-15b6-4be4-ced3-08d9775f965e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24483B96DD16067785BF7C29B3DA9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xr1L8G4nsHsYGVO3yL71gJWvaOPRLZL54uPfjvJXE7L9p6CkeFSR658oMuVsIrIcdqIWwjrVxp+O1HCssOKPXqrTiq3bd66lwrKLMeqqeL4kMu2aPU14aNulvUX9V5rV5U6WbvQctSNTRTIjvBqha+DLkMy9KkXxjnLTVah35ZvfnVw8F5mXitrfq30Oqj4uD0VnfhGVdCHlZ4TEVTQDLC8mU9vAMzAoaJXakVP/EoW77XC40abeLS/8EKJUe0x1bkv00NrYrvrheiyl7x6U02+Gi5s90sB9IycHbxFnCeM0qL0ITVCmD5UTiWDIbt0LRkzk/X3qpFU+Qe10SgyFhU1MI7Siq6OywZUn71UPwP5XMrGl0VpEyMMF8ypWJEU4a/4nOQdjm4Fa+STRQUHhjvikzarfKxa3WeuXq9I8wo2Kh45yQMGw9A88fccH1XDCIlG0d5k/9wYW5x4+PCiqxEDwdnuosyj14FqpiMmRWvRFQvMrAqZZdhp7tpUpQIyXFu32PFv4xj7Qn+H7yzzOuqk5rOI4fL7GRgb5K/Pv+9kL1jDS6qkbJckNxl3L3J7I4qH8bloviLusuNcYbvfifSiCzGTF+vSW7Z8wVOKab4ZGwEUc2OwNNag3Br50gFVjzgF9tzGGvcaJojzWmNhVZxWMMVWgWfz/o4SUqbgUcWBVokqSKeeHh69ZRHgY6SnPiifLD8zxxth2kuwYhb+4ursUIZz3YD9CajWuXpen7H1NpRz64LGisnP3LA9btr+g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(66946007)(66476007)(86362001)(66556008)(53546011)(31686004)(36756003)(26005)(478600001)(83380400001)(5660300002)(6486002)(956004)(2616005)(316002)(16576012)(8936002)(2906002)(54906003)(38100700002)(186003)(6916009)(8676002)(4326008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHIwQUpyRUZUUnRlbldMVTJGaUQ1aXhoMExXbXZjU294NmdHdzRVMk4wNmZN?=
 =?utf-8?B?Y3RrUGlpRHo1N1AzMU5iKzNsSXFhT0lDZDU1ak5SeGFHSkpQSWR0ZS9Bc0ha?=
 =?utf-8?B?Yk9KSlIxMFJlVXhmdGxudjRrWWlLU1lqNGlkWHFYZVlOQ0dvZmYwNGo2Tkdq?=
 =?utf-8?B?TUJRay9iSklVVzBPZjhhMWVaNnMvNzlOSURReHdZN0JVVmFRWGdyNWdaRlR1?=
 =?utf-8?B?djRIZmVSbE55QzVlWi9TV2puOTFnWVdlZXk1bnVYamdVUWJyS1JkV3RsN0tT?=
 =?utf-8?B?OUpyNWZ3ZCs3ZysvU1BjbjQ4VndOKzBSNDJzS2p0NDFQd3l6d3NHUmhMQURi?=
 =?utf-8?B?YWRCREtPWmRZTTdjOFNYeWlYNlc4MnB4SXNuYmF0b0xPRE1UbDRwaWNsMWFi?=
 =?utf-8?B?YkVxZXlxaGUvOWEyaGM3TGQxdDV6UWdvbURrTmhpaThxUVY2ZTdnMFpZcllv?=
 =?utf-8?B?YVp1anN3bjJWYWJaSTRhdDZaTHVSWVVMcjNDSW8vMVkyWmQyMFFjTmwzTmw1?=
 =?utf-8?B?VzV6M3pQMHlWaUs5cE1yUGFKaVNlL0lnMGpaOHUwemhKMEgvb0h6dDBnalBJ?=
 =?utf-8?B?S3FtWk95ZTNkOFNHVCtZdHN1RmFNQzRYek5ZYVQ2MEs0R2F3bkVRWU5QeU55?=
 =?utf-8?B?c3pTd0pRVkQ1eWpJYlhSdXZZUTlWZkYzZlNscmFUREtETWhTdS84ZUtGWW0x?=
 =?utf-8?B?OVA5OHE5OXAwbUlIeXZPbDRMR0xqU2pYUE5iMDJkN1VLdURTQ3ZvL2I4RFBV?=
 =?utf-8?B?VnY2UktlcGNyUWFjaEF1d2xHZEtPRGVYemF0RlExalRhc2xNNi9hZnNqcG1h?=
 =?utf-8?B?MThSREhNMzl3UEwzYkViay94OXA3TU5vS1ExQkVpM1prYjZvWFJLalM5Y05h?=
 =?utf-8?B?RlNlUmN3bjNuYVFINXZjSkFiclozU3FhTTJ0ZE5GMVllbU1XUXZYdHFGZnk2?=
 =?utf-8?B?U1V6Nnpzd0NEVUhEc0F5clVaSzBIUGl0OGdpeTVQL1F3NVZHWnN6VmVBM29W?=
 =?utf-8?B?blhkUThtWE1rTlRIWXRzMEZtRG5EZTA0OEYxTjd4NjFSSjlaMUJjVHJTVmdj?=
 =?utf-8?B?ZWRJTDVuVFdCakRaMFkxbjZuNDJSUjdvQkVFUkswbzJ2QkdxTFFvOXFCTHIr?=
 =?utf-8?B?YVA5ZURKY2phU0V4SWw4YjROME1tSVpUUnd4M2I4bk0xamErTS82WU5WWXJa?=
 =?utf-8?B?RUx3b24xVkRKdXNJak5JSlJCSHE3NVI2dFd0WHp2aDV2ZW1HRDJRSGJjMDJV?=
 =?utf-8?B?MkU3MXFTWWw1aldsdkFZdFNZZE9OL3ZHaExhcXZTV2tiMndVMDVTbWZ0TWJU?=
 =?utf-8?B?VFFuS0dOczA1YXZ0ODEwQ20yVkg1VEFPTWdpSnBVZE5YUWdWSnlvcXN4NGI3?=
 =?utf-8?B?TC9rcVJtL1V5UEl3Y0s3aThNYkJjRVhsRkc5d2hleWhjQTZhTGZybVoxYnNF?=
 =?utf-8?B?RU5YV050Mi9ZYjJraEdkOEdrczM0UzVTaUJBYlNqSXlRcy9XTlhic296YWNI?=
 =?utf-8?B?dHNrZjkvOUJ6YmpscXRjZ05jMjR2aldvTlE4eVJYZ0lJQTFMSUJJYk1XSFJS?=
 =?utf-8?B?OHQrQ0I1blMvQ0s4eVBmcSttZk54WEh2ZHBxOUNIMVBpZ3RHRGtxQlV0UStE?=
 =?utf-8?B?eUNxL0UwQ2lCRzV5ZjJSN0VWNlhVTnJaUGhYNmRVTjMzendtWU9MY2x6ZElK?=
 =?utf-8?B?MkIxdE41eE40NUoxZEE0a0ZReUdRNXY4NzZJbW9EN2d5UDc3Q2R0aTZ3Yk40?=
 =?utf-8?Q?DuFGocYpke4supAyxyH9tMmtC65RbjxyO32he0K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635036e4-15b6-4be4-ced3-08d9775f965e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 09:11:07.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMRLpRtWPy9GhjJXRo7Xkgtazw7iE657sXD/ZbVbG3Lf7PAbBZ473CAGJb7MzgNM6bYOMfj2uvjAVEqseCYS3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 13.09.2021 22:31, Stefano Stabellini wrote:
> On Mon, 13 Sep 2021, Jan Beulich wrote:
>> On 11.09.2021 01:14, Stefano Stabellini wrote:
>>> On Tue, 7 Sep 2021, Jan Beulich wrote:
>>>> While the hypervisor hasn't been enforcing this, we would still better
>>>> avoid issuing requests with GFNs not aligned to the requested order.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I wonder how useful it is to include the alignment in the panic()
>>>> message.
>>>
>>> Not very useful given that it is static. I don't mind either way but you
>>> can go ahead and remove it if you prefer (and it would make the line
>>> shorter.)
>>>
>>>
>>>> I further wonder how useful it is to wrap "bytes" in
>>>> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
>>>> least was supposed to be, prior to "swiotlb-xen: maintain slab count
>>>> properly").
>>>
>>> This one I would keep, to make sure to print out the same amount passed
>>> to memblock_alloc.
>>
>> Oh - if I was to drop it from the printk(), I would have been meaning to
>> also drop it there. If it's useless, then it's useless everywhere.
> 
> That's fine too

Thanks, I'll see about dropping that then.

Another Arm-related question has occurred to me: Do you actually
mind the higher-than-necessary alignment there? If so, a per-arch
definition of the needed alignment would need introducing. Maybe
that could default to PAGE_SIZE, allowing Arm and alike to get away
without explicitly specifying a value ...

Jan


