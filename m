Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCE401751
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 09:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179407.325666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9QY-0003I6-3O; Mon, 06 Sep 2021 07:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179407.325666; Mon, 06 Sep 2021 07:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9QY-0003FL-0C; Mon, 06 Sep 2021 07:52:26 +0000
Received: by outflank-mailman (input) for mailman id 179407;
 Mon, 06 Sep 2021 07:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mN9QW-0003FF-HI
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 07:52:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5d175d5-203b-4096-b9e9-d4f224e47cbd;
 Mon, 06 Sep 2021 07:52:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-J4sBdIofMLyCw3Xre7vYZA-1;
 Mon, 06 Sep 2021 09:52:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 07:52:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:52:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0169.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Mon, 6 Sep 2021 07:52:18 +0000
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
X-Inumbo-ID: b5d175d5-203b-4096-b9e9-d4f224e47cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630914742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qfYe0MVEmrcUZ1IysB0i36pFwGoNwanHSmnwKiOeh0=;
	b=ioffoHOUvvwp7B6rWTm0TLucXCpthR08D+Luu53cmOQQEghIVbcAvfHcB8YyrjI1O3PscG
	IMdhKAkM35XtQpgYNUzrhQjx5vvikol7OyjjGiw1L3/dXnZl1ktYnPXCfFBGcr3UkQ75yr
	OE+LCUAVhkgwg97sWs6uyPc3Y3ltYdI=
X-MC-Unique: J4sBdIofMLyCw3Xre7vYZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSBZKt7WpvrLaPsX36LVFe2MBkhIPHObVSsG0VaaX/FzPh5DQpIB1A0vhKuxLCqML/unMl/CHGi+LnJsPamYyS59nmUwMFM+kcz8efuuHI3vvrvMr3KVzciQEUg8bWjZPXU+kc1tmfrdmGLAGxnsSwZkUv1UcBali2jeFcv/KmEyRIR433GzfetW15VM/dRqngA1p42dzvDZkIPUAXbUKUX4Kxsh2mYA5qCU8HWs38KE8uhcKIO6o+/ByA1PCE7zROgggoItfoqcfs+R8zQMjB3ooY3glRxTmv8pqXzEpKOel8XQpmcejF6ZziwIUtMq4RnzeDE+8IRnCQ6fU1+O4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7qfYe0MVEmrcUZ1IysB0i36pFwGoNwanHSmnwKiOeh0=;
 b=W3oVsyHyxIPcBbqn8IWX4EDYbv2rWkdUDxI4K/3kHQoCx3+W7BPrmy2knvRE1hBjShoQxNx8LxrrFEvV+XJwx6hGEksm/ucHkqfSVRW9wgk2/0x469lOvJBdt49wzMkj8vfrc4M1ir5ylLJ7DlWeVkbtr0HlScdZ9LwJTg/k+C3CFVK3bJXBzsGlc7iaugicQUh3OAtVdZ8pgYmJQERLVJjq9I0dWNE/RF6EDUI0pG+OSlotIHg5vvyzsDsFSqD+VEifX0+R9+36HY/4Vg2ryAQHP/hrpA0fmoNcvnk6Q4RLp2ZZfXk4AZRGT93WV0rceyqXbH9CLRlIxUAauE1C7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Ballon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
Date: Mon, 6 Sep 2021 09:52:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0169.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330106e2-2405-4fb5-be32-08d9710b4083
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260727A0C4D6A75617949D2FB3D29@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CUF4WvX9MiLywgBKoR4NXK1izs8+nkW6MmnYvksLWK6v8QH3QfW+nmklUo7uM7qJpEelGSt4m1VI+btS7WmgoDIqmASuCXYiRhz57t+kRImiuUVGbJmng3OeuhJyf17ZjUo6dDvWVoFfSPxido2xxuutLmwN8x1iosxzpyuBS8uZshmHYgSPeGAQPO9fww/whGmGOEcQfDZhOLmj8GAOkkZAYmjKkDxDLNuPUwDq5Jt5j7J90WuX+6I+qWA5oNcG18l4riPkn6emsLi4ReT5Hq7l9Sw5RvGYtlT3+oCS/5ru9P7ITvNM/+yIR2x4ja1sXxDwKeG9T25MH45kf6H/m37s0fN5IkNgcqSzYshHLmFT2R+q5LqPVGregy+mCpYTM7w9o7Er05JtfI8NJ/VkoHw3LeT6OGzvR0CkgmgrT8hZkueb56VbvvvvGYkmQCcjf8HMzo/ko6tVSqbzS+3+xeLQBNsXWMdJyg7IwHXhZWtRLmxbK0D58PkXht6qJvUbkKgyuhv5JHBWCasS4JS/6Sg6lZITiK3hGAjx6jzNUQqnLqxslu+u3dMq5RFqkcRZmtkN2OQDJLBM6a+PDVXyJjVMJ9BX+0jXFmOW7uVI4UKuCBVF34xheBRqkGqoHduqPIm64io544anmmYDC7fayNDHeWZA1xTomx0T5J9qekjdoJWUm6abBpg4c4oUdSOFn8URGxQ2LAxs7SH6ydGN6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(136003)(376002)(366004)(478600001)(36756003)(31696002)(66476007)(8936002)(66946007)(2616005)(956004)(2906002)(3480700007)(31686004)(53546011)(66556008)(316002)(86362001)(6486002)(16576012)(4326008)(5660300002)(38100700002)(26005)(8676002)(83380400001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTd5eit1Sm9XU0FQTmdHVEdpb0dVV1pHanBaek5HdkUzRDJzUVhyZ2piS3ds?=
 =?utf-8?B?UytoRDVBbExHUWM5ak9YRUNSYUhNTHU0SUpUa3hKMFlrSXZ1c1lrWXRhRWlV?=
 =?utf-8?B?S0tNQzczMlBaOXJDUERPK0lISkx3WGxuVFhWUkZHa3luUlB5UFY1eGNYMHF6?=
 =?utf-8?B?RjZBNlc5ZUZyQ0c4MUsrS09aL2NndyttdWtvOUNYMitOSFNjMEtqNVVHQVVS?=
 =?utf-8?B?aElHQ2xIU1hMajhtajR5dFIyUEFLYytXeEY1cGI3OHVtRTZwd0xZUGRHYWI3?=
 =?utf-8?B?WTNQdTJSQ243WHNaWlFSdUVJSUdpa0dab3VqYXdWUGFmcVcrUmZ4WkswT2RR?=
 =?utf-8?B?UGMrbmdrSnRBMGR1L045SjE5RGxsOHRyV1F3VmVBYStVWjNBZGdiVk8rak9k?=
 =?utf-8?B?Q3d6eFg3L2wwZkY0bkN1ZkNGaFMvU2RpRVRNa08yMFFXTzIzYzFZdVREdENw?=
 =?utf-8?B?Sk5BLzNYVUtqREFialQranhoNkFvaUYvZnIzY05DY2ExUVFsZGVlRjhva3hh?=
 =?utf-8?B?K1lMTlh1dVpCaG9McFQrWDZnWHoxOEVtV1hZUjhEN0ZRTFo0cFJJWHJzUzgy?=
 =?utf-8?B?QUpRRXB6bnMyNjVnVHVrdWx1WFkweWtmY1R1QXVxTHFBeTNabjFVQVlJRGU3?=
 =?utf-8?B?UXV1LzRwUzIxOUplWjRtakZWRHIzeTVkWHg5K2dNMS92N3ZHcVErQTA5azRO?=
 =?utf-8?B?aU1UMnhvRlVsN0Z1Q2UzL2ZEVmZuZGovdU1MdW9qYXZOZFFsWkdIOExVNnNG?=
 =?utf-8?B?SW5JUDBYUjRCZkVsT1V5UWg3NlNDLzFhN2QxbUZ5OXBKUy9pazBqcTNGWUJ5?=
 =?utf-8?B?bDBRMDd3T3dwZFJNeTFGdGlVOVpzSGxzcXZIaCtFclNuYjd5eURUT0tSWHZx?=
 =?utf-8?B?cStXbmdBZ3MzbzRzRkttZTBOcGpaRGNLSXlTL0pHYzRnMXgwQVFQRXJYYlF3?=
 =?utf-8?B?R2grOWhRaDFQdU1zbGJIbXBjY0E1QmEwc0daSk45VGR5WktRbEpkRE94WDhJ?=
 =?utf-8?B?K3lIaWFsbmt2djE1Z2I3UHhEa0l0T05BUGxucUcwMWcwZnpUMUQ1UGRualZS?=
 =?utf-8?B?RHVYcVlldWRDMWJzYWhuSEpxTE81QVJDVmptMmQ2MmYwZTRWOFgrNXBUYXUv?=
 =?utf-8?B?OGlmK1pFa25KbDhVbE1kMlZlTmRldCtHMjgxSEhQbnVoM1dRaEdORS93eVdm?=
 =?utf-8?B?MGdYdThiUWpzRittcE5xVVQzTGdWbDV3T2IzRjVkYjRrT0ZVb0R0QlZZRWho?=
 =?utf-8?B?L1dqeWpxQ01zZHR4VHZGSDJhUW13aVRubVFmRnhpTVVCN0l3NUdGaUJGTUNX?=
 =?utf-8?B?bkozSWw5NXUzMkY5L1BoZk4xWk5zNnRFZ1ZPUm5YanpFRmdjc1dpTUgwRTZH?=
 =?utf-8?B?Rjl3WFNaZWNkZXNzM3p5c0N4SFQrZlY1OUp4QTJ1dmxnRFBxS3ZXSDZUSG1j?=
 =?utf-8?B?QkZPL1NqZXduMHdRVFhYTnlVMUI5aGhwS2FJcDMvNW5wRmJJK05kQzZrdDNF?=
 =?utf-8?B?akZwQk53RkVXRVc2aHExQ3Rtd2F2VlhxSXQ4WE15NURSNUxHTTNML0xERVgw?=
 =?utf-8?B?SVMzK2Z2NUUrWHVnMHgzT0wxaTdiaEJSQy8wWC95T1llWnhTZjI0c0NrRm5O?=
 =?utf-8?B?NmdkWmdCb015OXB3eDJIR1JGZlhXZkFKcnlvbmNoQkFwSmtTejdybWhnMXhH?=
 =?utf-8?B?MnYzWGF4TU02N1FjdjdWK2VtZjNJR3UxWWJzcXMva2o2U2hUUzZpOVNDNzFT?=
 =?utf-8?Q?16F+saPMZBsHHN8/V4I7ccIsgzL2RIzFt5yTT1R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330106e2-2405-4fb5-be32-08d9710b4083
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:52:19.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4+tzR+CZWYFj46pFiCEM0ItKO4MTF29fJGWUhhcFF2yremcsivMnXVV5zWjErPUPd1goG22F/WxEmx6EtUhMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 06.09.2021 00:10, Elliott Mitchell wrote:
> I brought this up a while back, but it still appears to be present and
> the latest observations appear rather serious.
> 
> I'm unsure of the entire set of conditions for reproduction.
> 
> Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
> this is an older AMD IOMMU).
> 
> This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
> Debian's patches, but those are mostly backports or environment
> adjustments.
> 
> Domain 0 is presently using a 4.19 kernel.
> 
> The trigger is creating a HVM or PVH domain where memory does not equal
> maxmem.

I take it you refer to "[PATCH] x86/pod: Do not fragment PoD memory
allocations" submitted very early this year? There you said the issue
was with a guest's maxmem exceeding host memory size. Here you seem to
be talking of PoD in its normal form of use. Personally I uses this
all the time (unless enabling PCI pass-through for a guest, for being
incompatible). I've not observed any badness as severe as you've
described.

> New observations:
> 
> I discovered this occurs with PVH domains in addition to HVM ones.
> 
> I got PVH GRUB operational.  PVH GRUB appeared at to operate normally
> and not trigger the crash/panic.
> 
> The crash/panic occurred some number of seconds after the Linux kernel
> was loaded.
> 
> 
> Mitigation by not using ballooning with HVM/PVH is workable, but this is
> quite a large mine in the configuration.
> 
> I'm wondering if perhaps it is actually the Linux kernel in Domain 0
> which is panicing.
> 
> The crash/panic occurring AFTER the main kernel loads suggests some
> action by the user domain is doing is the actual trigger of the
> crash/panic.

All of this is pretty vague: If you don't even know what component it
is that crashes / panics, I don't suppose you have any logs. Yet what
do you expect us to do without any technical detail?

Jan


