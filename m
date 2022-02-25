Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31564C475A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279145.476715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbUw-00080x-Bt; Fri, 25 Feb 2022 14:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279145.476715; Fri, 25 Feb 2022 14:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbUw-0007yg-7V; Fri, 25 Feb 2022 14:23:06 +0000
Received: by outflank-mailman (input) for mailman id 279145;
 Fri, 25 Feb 2022 14:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNbUu-0007yX-Rj
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:23:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71273dac-9646-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 15:23:03 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-URA9ahGKNwOykTVWSHp7vA-2; Fri, 25 Feb 2022 15:23:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6033.eurprd04.prod.outlook.com (2603:10a6:208:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 14:23:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 14:23:00 +0000
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
X-Inumbo-ID: 71273dac-9646-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645798983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdHSh8pofKzrcB9b/7qOSRhrz2eHlDdGdXyDUN+sHZU=;
	b=d14T889vJXfQQVbxrFiKlY+L1RS2DTifDVGGU2x7hd1GWZDGHUJTOpuMNiVHDL8ogeZq3o
	h8l2gCZSN8MqTGblVCZtMJqfADBP+dEh7H00ZV+nubh6e071HIHcWQEC9XS/ajJG1neZmE
	jmhsSgCN4gpjC7O+iXGKRNzRfDvG6u0=
X-MC-Unique: URA9ahGKNwOykTVWSHp7vA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdp2o+XUw/eO/q+H9g2qRu1w6xlSFcGy9foACSuzmHc76gVcszDyDm1vuCMsup5rbxr3jCw1O0RkHaPZSNjHNdidGZesoKEQugQFnzliwXQ0e84MRgRt3dHNw8muAIZaC+i5NAlXb9obNU6kfMTBjHJtkfHIfNcY1HaCsrooWmgbN5CkvypnKvyCVdsJ47SmLn9WbNmUTbRIvXR04PGkQ+WctU3GD4MTxG3hVi2bf98l5mgVkl1ze6KCez7Nyk3nmq38s0ZkYggf5nB4mH8joqmdVeA5RHjFHD/lOgNicw1tsq8nDyEbJk1AaJGkcEvd4U2xvT7WVMZgZoNGYExpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdHSh8pofKzrcB9b/7qOSRhrz2eHlDdGdXyDUN+sHZU=;
 b=h1FJilQr0uuB05eG63vtbVKZZEArz9y8rntZ+g+BNczHiTTVvymo90+N9WkqJ91z0goKLJLAi1ZwlaH4WmTh4OSJVMppoTvvlW4WqAtaFP4lVoOaldSkpEt9RuydKJoz5tshCW5a3K8MefguoMeV53yXGIOStFamIftdmTECslKlPlSZsR3aJn91Y58jUaYUS1XNfHEdnQQ8L8k6nW0c3uPcUejQL75js0zcvCjm9CQPI//wT0G8cLJ3D6PNGfLiOJMhxskGH7VEg/boiK9PFOuriiT7X4c6OmaDeZIKpEbmWflsl2sAhKcyqqgCL60StltrZrjuZY8GSmg2NXtC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a96d555c-8540-1f83-f110-a47904e74b55@suse.com>
Date: Fri, 25 Feb 2022 15:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: PVH dom0 and MSIX memory mapping issue
Content-Language: en-US
To: Alex Olson <this.is.a0lson@gmail.com>
References: <c33d1731b054a488974f96b8171b7b1b5aa61b4a.camel@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c33d1731b054a488974f96b8171b7b1b5aa61b4a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06811325-8588-47b8-eb35-08d9f86a53dd
X-MS-TrafficTypeDiagnostic: AM0PR04MB6033:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6033D96519E58C2704D29F0BB33E9@AM0PR04MB6033.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7wooipM5XBda1aBByzhKqclkO3x1YH0gbqdbGUqQhSwh2Rmvrdly3CvdFkIgbQqzglGquN2QA7pyngwFf0NCcqShTLRAiQY/kynXBwtcPfw8GQ8us41rCkT9cA+NNxruXmAJCUZWYZfSM0a0/t4uqZTjvI63laUMLXNYjKLDU68QuevNDzzTyiSzw6irBZXD3YRW2JGrPsc8SHoBmNn7ebvtvymjjSFEu/lgCz2triCL5KeHx0hdm7xd6JoZByi+f+FKEL85iC6ekxFlXMTbisfrowvP2YrIR2UMpPf6g6EfyzaRzkZwk+eZn2Hw+u6nHbjzlMUUxPnHiXBI2Gthiri3GMrinZ69TXX4OuVV9wmn6qhinIFHwZ2pPbqfdyng6+3k1Eq7JFDeiR+3vZY7e2zCeanfFRehZm2z2AkXUao/OqtxUi6az8QfTNLAyILNqp8TNnCSev3Bk+YQWnJIMuGaXJHzga/CYqavBI3DMwOWU/1pJSV9ltr0fp/xcxmyoSNVWomxPDwwuNthZ1GlMqUwFO90RyzyTOyAcOqJnpfvdqdXDMn/gfLzqlJoBGopGCM4pSmoH2sHmtok1M5+3dyGRJc2lGoFxVU016KbyFniO97JicSpVIQr98E0JI7lz1331KLwXiCeSQecx4t8QLC0z9nedXI2JyKJa+mkSRa7DT3+vmFlwel0AxNIWZXpHfMMPmhyLOg3GNF3Qo6njQR8n79IXvye64O9Z6QQJy51MG23KOU21iwMxbizmXodmBwqntI0sIDX/5aAwUEFpewiHvALyLLDWGRVegWUepCCX+T2fwFRmZhg/cqwCJZg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(83380400001)(31696002)(186003)(86362001)(26005)(53546011)(316002)(6916009)(36756003)(2906002)(66946007)(66476007)(4326008)(31686004)(5660300002)(8936002)(8676002)(6506007)(6512007)(508600001)(6486002)(966005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtqTktGNGhZK091ZUt2MFB5TUNGUzBTektBM3d3dzRrS2VjL1NDeUZTNFlF?=
 =?utf-8?B?eFNXUFd2dnpoeW9XU2lqVVNuMEhXYmhHaFh2cWxIZjBkaGNFbjgvaElhRnRx?=
 =?utf-8?B?QnhaNkE1S1d2UkpSVm4vVFVwdzZiT0dvdUwrajBYZnpJWnFhT2pZcyt2dFRJ?=
 =?utf-8?B?cDdzOVBETGVkM0E3czhtdGh6cVdHR0phdzJBQ0NMZGEvSFlDRmtkeDlSL2ky?=
 =?utf-8?B?YVNrYzlaWmx4OWpDQ2ZsaUhCMGtPQ08vNWVlR1FidkZaVjl6TlFxWG9PZmZL?=
 =?utf-8?B?TGhXREc3Q3YwSkxZOXRHelprM2dKTGNWdGZvNVliZjdSRy9tbG9tTUxMcnV0?=
 =?utf-8?B?b1dldW1rUzFMaXB6d0VkQWZiSC8vTGNpSk9lL244ZzAxcTNyaUx3TDRYaDZn?=
 =?utf-8?B?RVpWL0VxYWRmd0ExWVZnZTNubmtNYk1sbUoxRks5MUJDNkNraDZBSFU3cmM3?=
 =?utf-8?B?dFVNUlBNVmRsZks3bStQTmVSNTVDOUx6bVpzVlpVSmc0cDcwWTVFdG9sVFp4?=
 =?utf-8?B?czYzZXNBcXRkYWVlWFFHbWVBbDNzUEFaVG1pTEhoYkRURThoUDh0SW9ZaXRP?=
 =?utf-8?B?K1ZtNmFuQ2tZYUZOTFVMZld6aXk1OS9sTjVlRDV0NkViV3RidDJIWW14eW5n?=
 =?utf-8?B?OUxJRkJLTVMzQjgwWmJYaWtWRjZSa0V1RmJVZGtmQmNPUGIxSnNHOHZka2Ry?=
 =?utf-8?B?NjlzMWcveGhKTmdVQjUvZ0tWN2FWVlc0Rm1DZVd4VnRXTm1Bb0VORy95TGlY?=
 =?utf-8?B?S012QUE3aFVHc0s1aVk5b0pmU204SVhXank1bG9rSW14R1Nzbk9lbFJjc1d6?=
 =?utf-8?B?RU0xdHF0bjcxaWdYZUZNWVdCNHNFKzJ5a2dLQzUvdTNUVGFjei95NVNFUEJ5?=
 =?utf-8?B?YllEUzdOQWtZQlBmempIWmxzOWRXaG1ka2dpd1diR1huMGdkOEJqOXc4d3NH?=
 =?utf-8?B?T1dJcUduenBxTkZsWEwvQjQ5SlVsK3lDZlh2QXM2d2FBK0p4TzZzbTNFSUwy?=
 =?utf-8?B?c2x0S1lJVU5vblZnS3p1Q2MyRFp3dWhrN3JyakU5Z1JUUmZCMmFocmYrY1JU?=
 =?utf-8?B?YzlMakxCWEdZMEd5UnRwMkFPTXhRZTc2bXVSYTg2TldVVzlPODdWZVJFU1ZO?=
 =?utf-8?B?VjhxeWd2c3cvS3E0MG9CU0pKMmVoRUdza1dhKy9xZHdCV3dwZ2pWam5vaDJT?=
 =?utf-8?B?YktUMlBXMDkwenczRGFhbFN5eXd4RU9LUi8xTXBGTFdHTlpVa09WOFd6UEVx?=
 =?utf-8?B?RnVGWTlob1kydmxTbm9KTWlhZGtQVjkxbGZXYXhmWExDeGp4RFBDZWhHWis5?=
 =?utf-8?B?NFlPZDViZDMyOTZFTWxlWm1Vd2V2LzJtM3dPanB1bmlyRU56UTF6V28yb0Fh?=
 =?utf-8?B?TUhBQUR4RG9NeCtDVmNKdHo1c1ZiMTJHS1E0LytheVpLb3E1cEhLWkF4MFlK?=
 =?utf-8?B?WVFPM3dsMHhVUGlKc2NFYzRuTXk0V1MxaTEvMDRiTzM4d3VZODFLNWRPU0ZF?=
 =?utf-8?B?MWN2ZTYxZnVYQ3VrSGtJem5iQW9xbTkrUFV0MDJ2RGd3Z3JzaldNbGxvaVln?=
 =?utf-8?B?VlhWUXhqcVU1ZEJLWDN3R0JNMElnVWVGWGZtMnk1NGwwZkcvbDY2akhyMkRR?=
 =?utf-8?B?Y2dYdWptMys2MmFrUHQrOGU5RzZpRGZXdVlDbVFod1QrRUlJRjFLcXZ0R3Zy?=
 =?utf-8?B?dUkzQmU0UElXNmxuZ3VUdThORDdaNXhQUTF0Q0I5SzdJdnRTNUMwWklFZ3ND?=
 =?utf-8?B?T05iczQzWklWMUVtbFR5VWM3WUY3RG54Z2pMUWFpRzdJa2h1aHlNcko5U3FB?=
 =?utf-8?B?Q3JwZ0JiNG9KdTlyUlo5T3pGQlhwZ1h2a1J3ZWczcDd1ZCtRUDJUdmNZVFdj?=
 =?utf-8?B?eENEMEpnODhZRnpOckRyU1AwcnEwV2xSWXBwWGcvc3hEUnEzTkdDaHR5djZv?=
 =?utf-8?B?aWRNWExqVVRJT0Q4U0xhWTB3cnlDZldSRUlhdDZ0dVIxOWw4V0lLd0d5SlFK?=
 =?utf-8?B?ZHAzejhoVVZ4ZjU4ZzA3bk9mNTUwRVl3azd2ZTVsQnZCL2dPdEdGUkxPZ1dB?=
 =?utf-8?B?Wk1UMnZKditjd3M2ZUloeHppK0VRWUoxam9xVUtrNDhjeUh0T1Q3WXpLNG1Z?=
 =?utf-8?B?M2ZHVExJTTZmU2VkZVNDTmEwbG4xYlN0cm5hcVROZldkSUJlWjNGWEhPcEJE?=
 =?utf-8?Q?UZQDG8u5mH92nmptWq8TfoA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06811325-8588-47b8-eb35-08d9f86a53dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 14:23:00.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vukCBxkAwjPqLNDX9G9jtc/hzXiAy0/ele/1mhoYM9UjpwbxV03rh6f+Atswt4aRdxFR125qOjCsk50/u3W6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6033

On 25.02.2022 14:50, Alex Olson wrote:
> I realize PVH for dom0 is still experimental, but was trying to see how well it
> works in the state of "master".
> 
> I found one issue with MSI-X interrupts in dom0 -- a fatal page fault occurs
> when the MSI-X PBA is accessed from dom0.  It looks like dom0 doesn't have an
> identity mapping for the PBA of a PCI device --  intentionally caused by
> vpci_make_msix_hole() ?   
> 
> I was also wondering, what is the impact of "existing mapping (...) at 0
> clobbers MSIX MMIO area".
> 
> Is the purpose of vpci_make_msix_hole() to make MSIX table/PBA accesses trap to
> the hypervisor?  Seems like the page-based granularity is too coarse since the
> PBA can be much smaller than a page as well as not aligned... 
> 
> I was able to get something potentially usable by adding a "ioremap" call in
>  msix_read() and msix_write to deal with the access of the PBA.  Wasn't sure if
> this was a proper way of handling things...  Was also wondering if it would make
> sense to do the same for the "clobbers MSIX MMIO area" cases too.

You happen to ask just over two hours after a patch was posted:
https://lists.xen.org/archives/html/xen-devel/2022-02/msg01657.html
Since Roger didn't have an environment to test his change, maybe you
could do so, offering a Tested-by if successful?

Jan


