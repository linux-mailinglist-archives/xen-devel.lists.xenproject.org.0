Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAE52BB5A
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332108.555750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJQZ-0001Gy-V4; Wed, 18 May 2022 13:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332108.555750; Wed, 18 May 2022 13:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJQZ-0001Dw-Ru; Wed, 18 May 2022 13:09:23 +0000
Received: by outflank-mailman (input) for mailman id 332108;
 Wed, 18 May 2022 13:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJQZ-0001Dq-3m
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:09:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8d3355-d6ab-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:09:21 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-Fjd0eupSMnOjpIxIlHhJPQ-1; Wed, 18 May 2022 15:09:17 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3156.eurprd04.prod.outlook.com (2603:10a6:206:c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 13:09:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:09:15 +0000
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
X-Inumbo-ID: bb8d3355-d6ab-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652879361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ESkNfCumVruGG3vYp53gMsi4FlHTGLWtoN/cGHQtHg=;
	b=Ysl5sNCye5oFbD18O49K7Qb99JWER+KiB6yFphILaqeFoEgnylaSu4Yx/vapLiyLNrpLmh
	JutFglXlwkgz7cjPyGCfnnS9TCHTm4NpdRvKXHpbSAKO8B36318mRbOnSwHbDhN41NuNt4
	ATWBQ0bdJXNPi0KBuwS+X6+AJ6uhlFo=
X-MC-Unique: Fjd0eupSMnOjpIxIlHhJPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du4Qch7mN8mDlGFHqnGmbkDiuzSldTh/Ok3Vukyle55tXIxYnLja8GPn6AF3HJYZ0z0dEde/DYqFNygglEOUu2t6SMBqDJEryIk1ZRov+dy01/WqNGdBVOJWQaDsO6IC6cP4tFz+Br7zhCSnxZ4NzDsFRd8Rory3dZEXKFDKhY9EvF7XrnrYMc3y5ccj4HssLf56UZ4JXcYb9XqBIEpQE6sMSa5VKDBvmm7+DNhJ0W03bKFlYJ6c1dyNlLlC5gtQVX4kt0/V+KyEzv10VoiOonD0Rj6Y9843vSC849C1Me4tFUrUpZMGD31GdxnobMetwakFg+QiGfxiemTKo/ivyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ESkNfCumVruGG3vYp53gMsi4FlHTGLWtoN/cGHQtHg=;
 b=XDnEYW+BhoDdVfXcewOAuD+tA0dPOfMyS0rq3F9FeAHtfh72ADN7w6KkatiVdtlgHoHS84aCShLS0vxznnWW9Bti2FeGzkKLYWjGw3GifFfh1WxUGLWRgPXjDDg3xZVS5FF0ptvvhXuGSPi2eoEIYOXtiD6nc5AN8QTziJrbjeYzzk2kBalzYftkwyHJWvIhJRHq7r8HjkkhSkFheR9BmwizXAQHdUhns/tV9+rzOqVzEQpwBkFsd8DjI/reDrjGK+2/tMcTtkV6BpAqkqh0V2aJtr2wf9NE96eF18eRz5M4+i3pXj7dz8K/OuFh5CiUK3JriVS7etMTXmEuJtA3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c6ce6dc-5d03-37f2-8a7d-9c72716abfaf@suse.com>
Date: Wed, 18 May 2022 15:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/9] xen: introduce an arch helper for default dma zone
 status
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511014639.197825-5-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0552.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a993c2f-c5d6-4700-3864-08da38cf9c15
X-MS-TrafficTypeDiagnostic: AM5PR04MB3156:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB3156F3A47DE7B5297B39F278B3D19@AM5PR04MB3156.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rTa6MH57ehvJUE3OKwpPkwXz7TMo1Fmx9NzBGt+ITMiJ6ZRcG0e+NbcdH9PdX3Nj4CebQN85Nv5NgN5q3+b5Co4Fv8H/qDLPtXefGCX5aj4BMhiwuKKyeyDcgWbpJqnVEFuQZlyWpbqw9czppqWuvIRUx+7Ico9HG+LH6v2zJCbpVm12m6+Jo5PwBctJ80hxkQeHnKzcouMBoqKoVm7YhrtfYx6Jj9shsjdkqzamMAmY5CMdfUVK4gBG14TVgf4Qu1CY412QCb+3VSQTnshXOOHVEua+AF/jGpYG5pBXPretoc9wPZH3FwW2VxUiHfpFOHRp1rWRulqKMvQ0VOnid+B0tX+IirYLseJp6zAEWU1HxUNggxZ7jlVGpn8IQ/ot4kOrc/hZ3FTyVeVC/y2U40WMFAB5chAPnxq9FUi5LNMrVqrQNQ+gb9/f4xivUFQjDcQOATc1To2FQs2ER2DWm5D9glW+DJeA2k0Ppm1w9QXk9RJ4tELU/4VWehZnYtSI3+azgibmewprBYPk21MisYw7E5hmB3CA7Y7xjLi0dfz4bwRZO4PDekpvRkcK/qi89iJhvf7z1Nsf3TipMUZeWvHApIaRrq1gva469M03MoHJ+XcMQu5YRkTRcsLADXalPoljCNjn3BKSxCpFIS5gbwA9kragN9vHkyhm1BwQG3cGDbt1YWTW7pSmsYQjlZXbPVAR17EZRYii2c5V2wvLkWlPh707Wxn1EUwZQik6jdnbv++kuRdlqkrzs+/LPxXD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(86362001)(186003)(31686004)(36756003)(6512007)(5660300002)(7416002)(38100700002)(8936002)(6486002)(508600001)(2616005)(83380400001)(6916009)(54906003)(316002)(66476007)(66556008)(66946007)(2906002)(26005)(53546011)(4326008)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0psanRLWU1aV0VnVlNSdVYvR0ZITlZWdG1rUGdtMzNkSUNWQ2ZabkthZUNv?=
 =?utf-8?B?MWQ2RVJrSUs0UUtUZjZDZm95NzgwbUJoa25XdXA2SzBtTHZzRFlxandGVVJZ?=
 =?utf-8?B?NHhFOXZ5eEFQWW50MGl1ekhCTlFsa2NPTGNsUldaN3A0SXI1WmU2U0YwVFVw?=
 =?utf-8?B?OFl5K2pncFpudHlaVWRRSDlzbFBObi8xYmJHTmRwdWZ1SjBUVlV0WkhTRG4r?=
 =?utf-8?B?UVdZdjR0UlRRNEFQM0xEYmNPeXhseDBPVm5mY0NjMDJ0VzlPZjd4VHF3S1BJ?=
 =?utf-8?B?THp3VmEvSm54Y2dST2JhYVVGV0xCRDcxVDBFMVE1NFplMnpqcjRSSnlLVFls?=
 =?utf-8?B?SSs2K1F3R3FBTTkrQ2dOdXRZR2QwK1l0WjNJMW1NMXBsTHQ0YWdoL1VMano2?=
 =?utf-8?B?b3hWc2lXckRzakgyNEo4Y21EVHBmMXhUQWczNGh4TG9jYXVyb1cwRUxwZkxo?=
 =?utf-8?B?UHJsd3hFNlhKQlJpR0crbytKbTZoYzdkdXMrWDlNR0xWNUpRcHJFSXFnVjJQ?=
 =?utf-8?B?YThKaFpRSE5ZRFI1TFhIY3JOYXd3b0YwVE1jdW1JSzl1aUdkYzBKTXhDd0lH?=
 =?utf-8?B?WUZ6b0ZPUzFLN3Q1Mnh1VzVoZzA5U3R5OFA3YldCRGZveTQ2TUp2cEFjMFNZ?=
 =?utf-8?B?UmRodXJjNkF3bEJtZmJPWjN3NGVleWlvKzFaaEp2a2VtdzRXVURIWDZ6QjRx?=
 =?utf-8?B?K1BhN2llVS9ZNTFpMFJDMTRzL1FJbExlM1FKNHRQRWVlaER6VW4raWo0VUZx?=
 =?utf-8?B?UXFKUmV1aUF4TWs3U1c2amdLa0gwTS9MSnYzdmR1Z1VqdFk2alJlYXdTZzRj?=
 =?utf-8?B?M0FVZHpaSFF0dmx5UmRLaEl6VEsraERNaVNvTXgwUnlXOGtueUZudDBWVDdt?=
 =?utf-8?B?TFZFRkI2cjBEdnFqaFh0VWI5SW56eklPQ1RXQVByUGZWMENhTzFKM3RPZkZE?=
 =?utf-8?B?U3RZWkJublFTZEN3QlhHOUZYZHBqUE5TQWNsODdRUkJoQjFTOHdCYzc5aERs?=
 =?utf-8?B?WDlXOUVuSmNEL09QdVlWN3NkMFRqNmVXa3ZrQjNjM3BxTzhPWlJ6Yld2M3hh?=
 =?utf-8?B?aGJpMTRpMUlrb1ZSYlhrK2xiMVhyU2ZUM3FDOSt0TVRTYzFVRFRHTjN5c0tY?=
 =?utf-8?B?Y29hV0ZwT0Q5Unlndm5sUmhCMG1Md0tHVE5ORU5DUWh0RDRYUzlVWWNyV25m?=
 =?utf-8?B?THVqdHNPaGE2Nk8yemw3TGZqWTRqZWdWUjNhMitTaWhlQ3lqQTJHVjFRV1dJ?=
 =?utf-8?B?VFd2N2tmTHpjeUhHTWh0REdpcytDeWxvR2dkNlVFRE04MUEwRkFmd2xuSTky?=
 =?utf-8?B?LzlmMEJZQ3ZsRFFxOHhHck1zQzFkV1IvZ0pDNWsrdFIzelZKTkRnT2NCRGZC?=
 =?utf-8?B?LzZaQitpd2RDV212WWFxcENsVDltRmRvaEw3TE9CWmgvR1dKLzBRZk9CUVlu?=
 =?utf-8?B?YjRCY1cxS295cVZFR3hWZFl3bmxzYzZvLzdxNjJmd3hSaDVNYUFUZnBaMDhp?=
 =?utf-8?B?QThSd3h4djMvNzA4eVc3aVo1TU1SWkRueHNUamhvRXVwWVN0bndFcytPdmh3?=
 =?utf-8?B?VE82UVpWZnVMZmpudHhZUENNVnVKeDJXM0R2QzRFWDlUblY3VUJQamVJaVRv?=
 =?utf-8?B?VmR3V05kRTZQWWR6MmNUcVQ1QmYyRVRyQmx3UkhzL2NscHV3UnJGRjNmOWN4?=
 =?utf-8?B?M3JqeUhvTGpPMUg3M2tlT2ZQeDJHSnpGSVBpY2l4NHUzV1JKd0sraXc3YVdu?=
 =?utf-8?B?d09GbFgyazAxdDZVOG9ycmYwNmtMcTV1cUdob2p2Ukk4RkpjRmQxay9sZWdu?=
 =?utf-8?B?UHA5YndYcTlqMGozQ3ZLK1d5Si9NUUtQZjZVYlQwOFhVeTJCSnBzTm5nQ0w5?=
 =?utf-8?B?SHliQjlTR09pK0dnUlVVc3d0TndpS0NWUGtSTzV5NmhmelJSVldhNVVKWURG?=
 =?utf-8?B?Q2RXSCtwdFNPOTJBQ3VqM2lBbkdRVlNSYjdMK1hUYzNvVEllT0c4T3BnOGxF?=
 =?utf-8?B?VHBreFN5QUM5L1BBVHF0RkVqcHFDNlJlMlM1bjVDWW9GRS9CT3drdHRQcmo2?=
 =?utf-8?B?S3VBMGt1Y0s5djBKaWRHQUlHMTdOL3B3cTlKdWNyT2Y4VEZOUy8rK0lkZ1px?=
 =?utf-8?B?VE5ja2dzbC9kRHVGbng5WlEzZjFHQy9aYmc2bldQM3ZKQy9SQ2k4RUp2RE41?=
 =?utf-8?B?anB0YmhxNmh2Wm9GeDlRMjVwa1NvNU1oVDJNY3QwYzBLUzJTSi8vWFBNRWg1?=
 =?utf-8?B?NEFNa1F6TzZKRElWMFJBcElvVDdVb2ZqZHFUUTFFa0lYODhpRmdCMjNtalZk?=
 =?utf-8?B?bVNWanJRRDBFaVVDSlA2NTRUMmJQbC9NZnZMZ1FvR01JNEdVVG93UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a993c2f-c5d6-4700-3864-08da38cf9c15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 13:09:15.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmhvMCTL5uZ6bKm+ryrB1YeMklKpGwHDtFTw64qHaaLhuPwglnsJWvm7kJLVRuGSv/vAlAqFygET3FeZhO5Zbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3156

On 11.05.2022 03:46, Wei Chen wrote:
> In current code, when Xen is running in a multiple nodes
> NUMA system, it will set dma_bitsize in end_boot_allocator
> to reserve some low address memory as DMA zone.
> 
> There are some x86 implications in the implementation.
> Because on x86, memory starts from 0. On a multiple-nodes
> NUMA system, if a single node contains the majority or all
> of the DMA memory, x86 prefers to give out memory from
> non-local allocations rather than exhausting the DMA memory
> ranges. Hence x86 uses dma_bitsize to set aside some largely
> arbitrary amount of memory for DMA zone. The allocations
> from DMA zone would happen only after exhausting all other
> nodes' memory.
> 
> But the implications are not shared across all architectures.
> For example, Arm cannot guarantee the availability of memory
> below a certain boundary for DMA limited-capability devices
> either. But currently, Arm doesn't need a reserved DMA zone
> in Xen. Because there is no DMA device in Xen. And for guests,
> Xen Arm only allows Dom0 to have DMA operations without IOMMU.
> Xen will try to allocate memory under 4GB or memory range that
> is limited by dma_bitsize for Dom0 in boot time. For DomU, even
> Xen can passthrough devices to DomU without IOMMU, but Xen Arm
> doesn't guarantee their DMA operations. So, Xen Arm doesn't
> need a reserved DMA zone to provide DMA memory for guests.
> 
> In this patch, we introduce an arch_want_default_dmazone helper
> for different architectures to determine whether they need to
> set dma_bitsize for DMA zone reservation or not.
> 
> At the same time, when x86 Xen is built with CONFIG_PV=n could
> probably leverage this new helper to actually not trigger DMA
> zone reservation.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


