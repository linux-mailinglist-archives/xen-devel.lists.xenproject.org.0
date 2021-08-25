Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E13F74C9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 14:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172059.313888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrgI-0002qi-UM; Wed, 25 Aug 2021 12:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172059.313888; Wed, 25 Aug 2021 12:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrgI-0002oi-R7; Wed, 25 Aug 2021 12:06:58 +0000
Received: by outflank-mailman (input) for mailman id 172059;
 Wed, 25 Aug 2021 12:06:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIrgH-0002oZ-Gh
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:06:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0d1db86-059c-11ec-a945-12813bfff9fa;
 Wed, 25 Aug 2021 12:06:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-TxpwnDy7O_SU49WNmjtSnw-1;
 Wed, 25 Aug 2021 14:06:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 12:06:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 12:06:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Wed, 25 Aug 2021 12:06:49 +0000
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
X-Inumbo-ID: f0d1db86-059c-11ec-a945-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629893215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMCAVBZOF1ODtKLGj/2uF9N8WOvqW5qxcorizvqLzug=;
	b=Co9XZCK+m0XND+96Cke3fK3rkcm7lRy3BBApuBtmwXd7LgklxAI2H3AZEZ6TnFrrXs88nU
	i3MlTsrflVWgO8Fo0GDxa9hRoWXXZAn3R+oBbKYHnsMK9CRtmc5SqEjdSukRSraOVMpEYz
	AuMRUP1YIZeO1KT+iMGe1ryBg+8IE3E=
X-MC-Unique: TxpwnDy7O_SU49WNmjtSnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brP0h+7LwmmlX7U29OL+KWg3eZSThKS01jByY1RwkB6MJeUNmqvhnJqlksbN8TXs/TCpWemlInzVO/LSObILJXMeKLtBlvm/QTiHTMUKwi8Lm2YZ8IMzQK1BPYPXoZkGXJUl2xZCQAhKr8zxUsi+VHImi+86VBpBA75NxGiG9PaV/43KgyYejfobqBtPT1ZucUSJErrlAle5uJsRFZKVutq8AkkQ92Zg1v/RE/foFsxFudy2DCOI3rCGmyvH7sTerrBugzlW/gCf2KQizhdu8ol6CmTgKLa1ePN15AYJkW0e1zUHPCmGOnRKo1mS1yuAi1I2zaSkAYOQbJbRIKRtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMCAVBZOF1ODtKLGj/2uF9N8WOvqW5qxcorizvqLzug=;
 b=K62YYrPOSY7eUIGwpd4G7UsOSNyMjImOmCWMCqW6x+IHJCGZBD6pAIRzLnmUrxTyUdm9F6mlThoo7ElV6m2RGHEKqu2g5m/Hkp6QP6aXrRVdBvWaZVaJ5CIE8p3yhz5Jt0whr3rvHxJNDRNhhVdmTEvm3m6CJqJ8x/gxvS+BKSQxX3N43rW4nKmxq1zE2DzfNzEGrUtP+9fFL/YjJtcO/G6w+fHUVTzgQoURek/F6mSz/qNjIUjqodGjjO9oQGxdhZp1OZjvKAChlUHSkVa7rGxsO0qmx7JfoqZIyJkLI/xuQpSRaAj+Yoehk6BuVzczZkFO7I6yK4X4elOrBcFEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 00/17] IOMMU: superpage support when not sharing
 pagetables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <9aefc518-a85c-0b7a-9903-a30402d3191d@suse.com>
Date: Wed, 25 Aug 2021 14:06:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bd870c-3bce-4381-6edb-08d967c0d1da
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57429BBB241F807395CD18F4B3C69@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2iWh+jcq8D9hP3Hs58aq4CCQMnlbkhFZYwZ74LNiTZpB9ZA+hGMI/SsMDAYoIRrp4ROSkiz14+ZtfSc0fUxmkdXQKOVaAuVy+MiuMnBnapJJCa6AxOue3Bg2Rw9y0D0PBXzCGNd2AS3/zCHBaUPwS26/XkIIMoblJYNSJ7fP1m59DBYAYLXuWMDXjnTbtE1PpoMvViqcDC049yL+Tu0EO20dCnL7j4ONMfcvD7Bc/L+6HbT4KDrAzRuph9QENPn4S3PJZcwdVeLvItwg0M1lSWXglFLo+QMOZ1wZrvd3BxQZDTQnqOV/1LUdyBwqVR/aZkxfVYTZRujWqIjx+LqMzmzLKPFfp61cM6F2AN7K7+cmUrak8Ts2KkL7ylNW8JYKtEk8E3/qtN1eAicUd8cvcdxPGkv5e0hM1ETdckjzpuFTjymEkBgHoyNxGbpvEOCwloLAgp3lce3dHGXryGN4AysL9gFX2Wm26Bnq96tl15tt0Vt4dqZ24XyLMCLSKPG1pBjtMTJKvd7u88fF9VFX8qPCet7dMnn7j4SuocDbM2ZyQxsTr9uU6lBBHBE0TwKFfXtHnE3af50tB5JvWxI6D5dPaLs1f10yxhBijn7UsQvkQvpurBx637NSthLgxCBiQNuxwfdTNWjbguQ/06rP24nhtFX/ZzAaXqISXMZFd54qsfDZRLWvxUn5QxUKmzksa2KIVMgRgeEIGJGad9gthWyRWFTUtCt2dbjTdRhtY/H1RRH1Dahsq/0dSc19PjxZaL7JbbXxFU/3LgNoY1ePVJUkZCzLfA5T/jaEIJxhTfv6NvPE7KmEtYS8ihMm0ERv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(376002)(366004)(396003)(86362001)(8676002)(478600001)(5660300002)(186003)(6916009)(4326008)(38100700002)(26005)(2906002)(966005)(8936002)(54906003)(2616005)(36756003)(83380400001)(53546011)(956004)(316002)(16576012)(31686004)(66476007)(66946007)(66556008)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU5zL2FmTlkxNjl4Rjk4TnIyMTMxK1Flcld4aUJiNkFQWGlHQU5rWEpNb214?=
 =?utf-8?B?K3F6WEx6b3RxT081czM5N0hsbHAyYVhHMlJiL3UxK2RNOWRxTGhtT1ZDQ0o2?=
 =?utf-8?B?NW9Temo1bm9uYWJIek5pWGlHMGtNaGlMUE5MZ2VOeGNWVEVhWXNMNUd1Z2F0?=
 =?utf-8?B?Rk1RRW1Wa1JzZUxXczFUOXJGQmR1U2VtNWJ1NnJWSnRjRVBPTU8rNjJjMjVI?=
 =?utf-8?B?RVl2cHpUNW1XbjNRbkVOV2Y4dEtpRGpoSWRYdlZ0RmF4cDF0VWtBN2ljY3dw?=
 =?utf-8?B?dmIzbkIvV1Zmd1dSZ2RmbHNmS0pMSDVvVDFxMkMwcXhrYzd4aDRwaWN4VEFD?=
 =?utf-8?B?SE10b3ZsWkNGalJFODF3MEdOa3oyQzFCQ1N5dXd6bUVIS25PZjRCU000dWFp?=
 =?utf-8?B?ZEpHVkw0NVB1Z3kwYWlZK3BKcnNGRXdPTVpvdXFCdHdZLzU0bVRwd0VQTG1J?=
 =?utf-8?B?SVFXOHBNTlFncnVBT2ZZeWo0MmxRRzhKNEJPaU1CekdkYTY0ZHhFV2JpaXhl?=
 =?utf-8?B?SFRQVUFWMVdaNWw1K1ZPRDJ6TWNZRzBtVHB5MmYrRzdNUk9sYVQzM1VzZVZM?=
 =?utf-8?B?UWlEWi91dThJb2pDeWxUS0lIZENjQ2FyVEZBdWgyVHY5Nk9YbTluVDd1L1Nt?=
 =?utf-8?B?dmp3QjNIRHZUUVpHL21OdGpuU1pZNnFhOUZGMUxDNVNpd3c2bjVJN2JMZVVm?=
 =?utf-8?B?dSt4bDROQjRSblJwZ0pkd3BEZEs1NFNxMktXVno5R3lVT1BnMGRCSDFabkkv?=
 =?utf-8?B?Mjh1eml0NStWMVRPTG4rOTRSSlR3cnJIM2lnT1oxNWtJdnFrbmE2a2tnZzNi?=
 =?utf-8?B?UUZCdzZTbDVHRlNITXl1ejdHYTE0OHN0ZDNpVE84Z1Bla01yUFN1SS9iMVJS?=
 =?utf-8?B?cjlGSFdsdnpER2ZvK3IrVFl6RnNnaTUvQXNLK3F1WTFCWUEyQXVDeWJETlBR?=
 =?utf-8?B?TVlQSm1Ra3FSSU1tcW5nZHJjTW81R1dzZE91a3B3RjM1OWtMYnFoc3N2RmhX?=
 =?utf-8?B?VXZXR0hOaWg3YU8vSnRqT1FyODZzMmJ4eHlwVzdmay94YmEyeEI5ejZGWmRQ?=
 =?utf-8?B?UHBIUmZkU1dPa0hMcC9Za2VWVVdnblpaSmkwNGxWamdEektweU9FcnlzY0VW?=
 =?utf-8?B?ZGNWTzdFdDBzeEV2Q3BxL2RXQmlpMHNuTUNrSW9kaW0wdzRUNHU5aEQ4VUNa?=
 =?utf-8?B?Zk55c29EYUtEdFV3SHZsOVdRZkdaV1RiZTFPbVlsQkdrdEJpZ0cvOHIxK3pi?=
 =?utf-8?B?RVdFZVl3YThyem9NSCsveWZ4MS9oOVROUHJiWGdrSFRKbHoxcWk5Rm9BMmli?=
 =?utf-8?B?SWF5TWpXQmsweEd3aDVLOGd3YTQrUDExMkd1TDBhZFVKWDhyOTg5ejNjc2Vy?=
 =?utf-8?B?MEx0NzJ5R0FWcXhnbU9oQzNzeWxOYTFPcEx5eVBQUk0zRmxCNFBGWXFqRkx1?=
 =?utf-8?B?RmxlV1NXcDcvdUlpekFabm1JVWFwRXMrWlV1RmhDWHFKV2dpVy9zRlZvSGx4?=
 =?utf-8?B?eVdZSElrNU9ueE5HdWM4SUNDdzEwempBS1hKTVlweTVLbXZlTTUrVUF3Qm12?=
 =?utf-8?B?dkVkU1R0Mml6dHdPR0NOb283NjFnVlZSMU16M2VCTGFGNnQxaE1tODd1SUJH?=
 =?utf-8?B?OUlKc2JYeEsyNUFyTEMyS3NYcGk1bjhxSmxEV20zZ0hJcFB2Q3NEVzVVWTlZ?=
 =?utf-8?B?OWZkN2lTSGRkRGlHbXNVQWVkMGVqanpvRTN2Uy82d1haeVRNSm55OW9ZQ2Mx?=
 =?utf-8?Q?J86dO69jM+UWa0tH6F4BTbH3au1hgjOi1Kx721+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bd870c-3bce-4381-6edb-08d967c0d1da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:06:50.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMVHmbhR3tn/bM9patXz1yWmpfwcnqFCMlIqppIOQxRRGGErjpVUQtam2OBJ4C1/tfZ5LuRd70UU1AMEgaZMyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 24.08.2021 16:13, Jan Beulich wrote:
> For a long time we've been rather inefficient with IOMMU page table
> management when not sharing page tables, i.e. in particular for PV (and
> further specifically also for PV Dom0) and AMD (where nowadays we never
> share page tables). While up to about 2.5 years ago AMD code had logic
> to un-shatter page mappings, that logic was ripped out for being buggy
> (XSA-275 plus follow-on).
> 
> This series enables use of large pages in AMD and Intel (VT-d) code;
> Arm is presently not in need of any enabling as pagetables are always
> shared there. It also augments PV Dom0 creation with suitable explicit
> IOMMU mapping calls to facilitate use of large pages there without
> getting into the business of un-shattering page mappings just yet.
> Depending on the amount of memory handed to Dom0 this improves booting
> time (latency until Dom0 actually starts) quite a bit; subsequent
> shattering of some of the large pages may of course consume some of the
> saved time.
> 
> Parts of this series functionally depend on the previously submitted
> "VT-d: fix caching mode IOTLB flushing".
> 
> Known fallout has been spelled out here:
> https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html
> 
> I'm inclined to say "of course" there are also various seemingly
> unrelated changes included here, which I just came to consider necessary
> or at least desirable (in part for having been in need of adjustment for
> a long time) along the way. Some of these changes are likely independent
> of the bulk of the work here, and hence may be fine to go in ahead of
> earlier patches.
> 
> While, as said above, un-shattering of mappings isn't an immediate goal,
> I intend to at least arrange for freeing page tables which have ended up
> all empty. But that's not part of this v1 of the series.
> 
> 01: AMD/IOMMU: avoid recording each level's MFN when walking page table
> 02: AMD/IOMMU: have callers specify the target level for page table walks
> 03: VT-d: have callers specify the target level for page table walks
> 04: IOMMU: have vendor code announce supported page sizes
> 05: IOMMU: add order parameter to ->{,un}map_page() hooks
> 06: IOMMU: have iommu_{,un}map() split requests into largest possible chunks
> 07: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
> 08: IOMMU/x86: perform PV Dom0 mappings in batches
> 09: IOMMU/x86: support freeing of pagetables
> 10: AMD/IOMMU: drop stray TLB flush
> 11: AMD/IOMMU: walk trees upon page fault
> 12: AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
> 13: AMD/IOMMU: allow use of superpage mappings
> 14: VT-d: allow use of superpage mappings

I should probably spell this out explicitly: These last two, which actually
enable use of superpages, and which hence introduce the need to shatter
some, comes with the risk of tripping code like this

	ret = xenmem_reservation_decrease(nr_pages, frame_list);
	BUG_ON(ret != nr_pages);

still found e.g. in up-to-date Linux. This is - similar to the other
fallout description pointed at further up - a result of now potentially
needing to allocate memory in order to free some, and perhaps the needed
amount being higher than the freed one.

Jan


