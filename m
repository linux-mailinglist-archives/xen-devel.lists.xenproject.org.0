Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B0690149
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 08:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492198.761631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1WD-00072S-5m; Thu, 09 Feb 2023 07:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492198.761631; Thu, 09 Feb 2023 07:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1WD-00070Z-2F; Thu, 09 Feb 2023 07:38:57 +0000
Received: by outflank-mailman (input) for mailman id 492198;
 Thu, 09 Feb 2023 07:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ1WA-00070T-T8
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 07:38:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf4f2a5-a84c-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 08:38:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.30; Thu, 9 Feb
 2023 07:38:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 07:38:51 +0000
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
X-Inumbo-ID: ccf4f2a5-a84c-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9A6iM5WzLpDdh+ELKhsprosdiI4vd86yfY/pPH9oMbmGvD+Qoa9viJ1qzZdUlKmXIkle80J8NdMSbWBnsFZnhxhTa43p9j2HxGk6Y6FIca/ERTpRfWWMLj5ey77qWtBfoFimRfrA4pk1Me+pEi88bHksAIWCo88NM4WxCNIGdI6nKbyRQPJ6zonyg5A/dCEH8edzazLv4xP42Ojsvki0yBScEQU1muBq7E2DVaPPkGDDTVueUPbn+PQVp7K7rBR/78EXG7ZFa0mmNud0DiLhYSrZCNLqT9DeqeX0uhOKdQpJNg1kZOjRyVQ84Sd1/vYLJg9Qx3SwBPmL+EOwpuiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA8Y9dUQxQ31dGbPEWhaaTsLMMUMB1hFbTfDymXaAYo=;
 b=RYuDbZJMfHbVSzGHAediwp0Ggo1YTdW/zSC0Yh5ddppXI/4xohNtomPU15D/UdEhbmBs4T3WMICdL8SVnZsYk6PSGQmwk3vQ/vpeeJh1oKoW5/rQ8+JBln2zQqCGcT0N5eI0jB61ycgczQRcv4yLCnERQpmMI6pnkb8WNcGQtrEg9bx8tXsTuLGUQV1cR7q8IOFVt2ngRfdqx7F2iQMzqo39gKdGJHV5Uj2d45HJdk04FVL8pK90lMZahT+AcrUDVf4eCpizrD+R34c0MWTW7mRagVYDNKKHrSSYymEVMDnHtJHSEVja/2olR7jce8bM7kzvvj0jLYpGqiaJq+0KWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA8Y9dUQxQ31dGbPEWhaaTsLMMUMB1hFbTfDymXaAYo=;
 b=iDBmJad4iEABko4kPyBGk+MeGglhdvdbsu35LPBeuVBnqakzaPSGvfo7bKAYe5JOGc+YbBTrCnJCO8+a6cmVWsKFrXVFtUc79icuZ+FyH5+Mt5yXDihfwvosnuOlgOoo0YJ+8UmqUCRe4qhBFg49cJF7y8aNRKzwZsI6Mq1tsUtfx2oXKqWb3snBd0PjQsl7mBu1K/TVGQPvtlqsiMdZxZyedi8xAVFTnUomporvKlJyKjv+u2PHx3UD2/+caOqYc4QWMcRJtdsRgvacoKOvixMeTzuYhXkod6hqZDdQIGt0lsODdAhk+wLyEk3Y3vIM9BlafUEt/BTZ9S57OF3GgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2d32c8d-b7fc-d126-f3d9-011dc3b86422@suse.com>
Date: Thu, 9 Feb 2023 08:38:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN v3 2/9] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-3-ayan.kumar.halder@amd.com>
 <c11f89da-9487-1e32-57b4-2ddd1142c6cc@suse.com>
 <a594ba69-e4e8-5f51-f625-50171f22bc77@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a594ba69-e4e8-5f51-f625-50171f22bc77@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0881a8cb-91c0-41d3-dd0a-08db0a70afc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6BIx747dtsstnBLsdgyn4utZ8DEKX1+vQLLkRgdo9px+CMPbNwA8ml/dGtZyYH0jsMTaR9DrW/38I7smzel0B98hU6iSww3MMv3bgcwPyg89zUvV6ApbjCKvQiKZJRn3KlVVCV/uEYv62efM4648/OKvQwDZplR4fuNi4vJ3zA2B61B1LyKVvLbvLjE59tMRrRqcyQ9helxbiIdkX3uPwNrVi19pPCAPgMmzUyIimnNMCEnDZpsvhVxOoA90B9/9ly07Fd7vkqjgFKMFQh19tz0Tv2j7rqolgHYZMh/wFsulBaevalsbDctAE9fuhEA4zrCEBsyZYcJ5OHCVePyRcShthGezs4StD0b7yI6A9ZeUV+XxSJFO4vKwNnrmvelkW54GnewSpi+1F70W0CAJG+co1uc9LVUYUyrZSTXFiA7W97ul/EE5q8QGQ/OueuvVM9J/GI4rhnZk423AVgR5jMblj66wjKseH70mzVgNhVxMRR0vdQXMWGuTxKrPvMbB8ymnHEIJHFabHifwUfAgjwdN9qFG6PS4ROvKo7wMZitEa/Pe/DAzXTC28oZY8JL1ctp+YzDywy9TSJ8VeWH69IC03Htd6KnIembBVYnTRrd2/SnNRyw0fJDIa59wjk/Vt8nstUpf4gkeh4tgJHytpDdlgPzcCYtrU9w1nKgd3gKw+9KNVBKYgrltmmlgcpTxZ06AFPZhu7Io6KryWe6Znr6re82zAy4rywG4FNZpLIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199018)(83380400001)(66476007)(316002)(5660300002)(8936002)(8676002)(4326008)(66556008)(66946007)(110136005)(478600001)(6666004)(41300700001)(2616005)(26005)(6506007)(6512007)(7416002)(53546011)(186003)(6486002)(36756003)(86362001)(31696002)(2906002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0ZzeTVES2phMXp3NVg0QmVPd0dyWWk4bXM3SDY3THVvSjgxRjI1d00wZG9j?=
 =?utf-8?B?ZFloZlBJQTZFeXlXc25nd25DZVpBdkhPc0NraHFVT2VuWTdYcmdIQjhzM0lU?=
 =?utf-8?B?b25nUUI1b29wT3RKMG5sNXJyRmV4ekp0bC9CUjlsR1U4TXh1aDBkVjhacnIx?=
 =?utf-8?B?eWNEVHRjcUs1QitWeHM2MUpPR2ZmcmM1M2J3RWJCa2FoWDdSaVMwbXF5TG9p?=
 =?utf-8?B?bkZSUDZhT3ZGczM1SVppNU1nN2YwWXlLWVcrY1MvMFBSNXR3K21wSmRBR0V2?=
 =?utf-8?B?RVpXd1dReUJvcytVb2FLM0owVUJZMnB4eUdPK2ptMnczSG9nVE5wKy9vZERB?=
 =?utf-8?B?SEQxSWRlcU92WjV3cUdOLzFmTFRrcXd0aHoyZG5FOUg2OFdNeHVEL2RUSUFT?=
 =?utf-8?B?MDNTMDFnUmpvK3U3NUJCbHlEZFhQSWNwTVVLZlpTRkhBdmdWMXRPTFovTDZx?=
 =?utf-8?B?cTdtZUJ1bEhZZmdkNGo4djhWRm9jRXBOV0NHbzg3V1ZKTFhqdFpCKzRUNnBI?=
 =?utf-8?B?aGZmeUQrbVpsT3YvRzhKbFlQaWU3dHJyV29rK3hVQ29QcExSVzA1ZGRvblRU?=
 =?utf-8?B?TXFTWUgrbHVSbnJjVFEvMmlqelRZd1V1ak5ITGNtNVVIUWQ2Q0laWDliRkVv?=
 =?utf-8?B?R0Zva082czh1dXh1Vmk3T3QvUWlOT0ZPVnlNeFFCY2JOeWZyOUU5d2U4NlJl?=
 =?utf-8?B?Q2laWiswMHpaSUdOK0F1QUUxODJseER6QTY5M3dHbHpkckw2VTJvQzRNZjZF?=
 =?utf-8?B?b2orM3VScDFwc0lTR3ZrZ3U5RExNRjd0elgrM2xsNXdZem9RM083OS9Yc3ky?=
 =?utf-8?B?TnczOC9JVlVGVDhsU2JLOGIrWElrOXlNSk0rTzIxZ2VXQ1BoMGhVeExEbXF0?=
 =?utf-8?B?SlNDcWdpVi9NV3RlSmUrMEFHcjRQUWZLVUxCQkVacmdiSHFxTWlSUzZ0SmF1?=
 =?utf-8?B?M1BjMzM4ZXdsYkdwNW9WLzVaS1p0bXVTNXd6dDQ3Q05oOStBT2txek1xT3Yw?=
 =?utf-8?B?dTNzT2pUM1h4SDBxc3hsNjNqb05SWmZuNGtxNi93N3dwN1NSKzdPYWw2V1Jk?=
 =?utf-8?B?clhFOUFkR3E4eHFzZERJa2hxN1k5QzVxNlVsSUlacDgyY3hwR0dGNmRTWitU?=
 =?utf-8?B?d2dUeURWa09MRHNZQ0o2eEpUS1dMZnlhVFIzSGZzSmFtQStWR294WE9ZYytF?=
 =?utf-8?B?M0ErVnBqajZETW8vNXJTL0xpbWRVd3p5N3dXREd3RktQVjJ3QVRlS1gycmQx?=
 =?utf-8?B?NnFtTjNkZUVxaWVWYXpLL0R5NzFBZXgxOUtzL0pMSithVGdnK1RtUUEwUE14?=
 =?utf-8?B?VWRUTzFaUHlhSkFudVRSZVdBWUtseWFveXpGcDArb0FkNEtEUVRnK3pSNDJp?=
 =?utf-8?B?T2tkS21lVFZyd1dvRmhid1lWbWd4OUhSellqeXVCcStRM2M1MzBqV2E1WVpF?=
 =?utf-8?B?VlcyNE54bW5tWkFrbm43cmlTdUJhcGlaQzZpbzdvUHpubFhIODVvN05SVVUx?=
 =?utf-8?B?dStHOUFJbWZVdzhLcUc0bWpGTXdsalJnMUROWjBxckdHY3pWMXdnQVg0bkEw?=
 =?utf-8?B?eFYzc3Y5dmxRNXZ6d1I0YWErckVTOWNNQ3E2ajduRW5FY0NvditaM1R3ZFpu?=
 =?utf-8?B?czYxZ1UyNEF5QmtvMkdxbjhXNUxCNmllOU5WbEhUbk9vb3VqNzAzeWI4eGxD?=
 =?utf-8?B?Y3c1WkhVNDUrK2ltWlk1QTJmeFJkeEVtdW12MkFaY0w1MFNMY1BJZlVCYlFW?=
 =?utf-8?B?a3MvSEIvTTJTY1NicUtEVGk2cTA1Qk1sN3NHRmpFRXhXcUIxQ2EyT2FLbVVH?=
 =?utf-8?B?OGhubnJWN0pQUGdjemx6cXlybzN2VmxqRTVSY3BhUE8wV0dLMmJVbFdFNHNU?=
 =?utf-8?B?Sk80RXRFRGJ2akZKUENvK2dzeHpwdXNtYUhqTXM0SkxRM1pUVWJVMHZpOU54?=
 =?utf-8?B?WXkzRGFqY2ZPVnQ3WGxQY2NCRDdnaEVYUnduc3grRzRHT3BHUkRmYlJXQ0Na?=
 =?utf-8?B?aEtZdW04ZTRWeWRjbE1rTmxUSzdoQkdxMU5WNHB1RG5PUzZ0b2ZCZDBNT3Rm?=
 =?utf-8?B?aVNKWkkxVUdnYnI5L2lTeFNZMHBEUkJqSVJSekVsR1VOeDh3UEpRQkNLbWUv?=
 =?utf-8?Q?dMHJl+7xwzDgwKkuiW4mr57jt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0881a8cb-91c0-41d3-dd0a-08db0a70afc2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:38:51.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlOV0OduX2wSDnUbNTyFBJ0GWSamwPNnW62cExATCg/SP5VrJZzNBd9FXZi0q2iJOWchvGMPABeMe7W+NAh2ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890

On 08.02.2023 16:51, Ayan Kumar Halder wrote:
> On 08/02/2023 13:33, Jan Beulich wrote:
>> On 08.02.2023 13:05, Ayan Kumar Halder wrote:
>>> In future, we wish to support 32 bit physical address.
>>> However, the current dt and fdt functions can only read u64 values.
>>> We wish to make the DT functions read u64 as well u32 values (depending
>>> on the width of physical address). Also, we wish to detect if any
>>> truncation has occurred (ie while reading u32 physical addresses from
>>> u64 values read from DT).
>>>
>>> device_tree_get_reg() should now be able to return paddr_t. This is
>>> invoked by various callers to get DT address and size.
>>>
>>> For fdt_get_mem_rsv(), we have introduced wrapper ie
>>> fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and translate
>>> u64 to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as
>>> it has been imported from external source.
>>>
>>> For dt_read_number(), we have also introduced a wrapper ie
>>> dt_read_paddr() to read physical addresses. We chose not to modify the
>>> original function as it been used in places where it needs to
>>> specifically u64 values from dt (For eg dt_property_read_u64()).
>>>
>>> Xen prints an error when it detects a truncation (during typecast
>>> between u64 and paddr_t). It is not possible to return an error in all
>>> scenarios. So, it is user's responsibility to check the error logs.
>>>
>>> To detect truncation, we right shift physical address by
>>> "PADDR_BITS - 1" and then if the resulting number is greater than 1,
>>> we know that truncation has occurred and an appropriate error log is
>>> printed.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Changes from
>>>
>>> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
>>> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
>>> this approach achieves the same purpose.
>>>
>>> 2. No need to check for truncation while converting values from u64 to paddr_t.
>>>
>>> v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
>>> 2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
>>> 3. Logged error messages in case truncation is detected.
>>>
>>>   xen/arch/arm/bootfdt.c              | 38 ++++++++++++++++-----
>>>   xen/arch/arm/domain_build.c         |  2 +-
>>>   xen/arch/arm/include/asm/setup.h    |  2 +-
>>>   xen/arch/arm/setup.c                | 14 ++++----
>>>   xen/arch/arm/smpboot.c              |  2 +-
>>>   xen/include/xen/device_tree.h       | 21 ++++++++++++
>>>   xen/include/xen/libfdt/libfdt_xen.h | 52 +++++++++++++++++++++++++++++
>>>   xen/include/xen/types.h             |  2 ++
>>>   8 files changed, 115 insertions(+), 18 deletions(-)
>>>   create mode 100644 xen/include/xen/libfdt/libfdt_xen.h
>> Can you please avoid underscores in the names of new files, unless they're
>> strictly required for some reason?
> 
> Actually I introduced libfdt_xen.h as I did not wish to modify the 
> fdt_get_mem_rsv() (present in fdt_ro.c).
> 
> So I created libfdt_xen.h to implement fdt_get_mem_rsv_paddr(). The 
> *_xen.h denotes that it is derived from * (which can be modified like 
> any other file).
> 
> Let me know what name you suggest.

I don't mind the new file, all I do mind is the underscore in its name
when a dash will do. Underscores should be used in place of dashes only
when dashes can't be used (e.g. in identifiers, where dash represents
the minus operator and hence can't be used in identifiers).

>>> --- a/xen/include/xen/types.h
>>> +++ b/xen/include/xen/types.h
>>> @@ -71,4 +71,6 @@ typedef bool bool_t;
>>>   #define test_and_set_bool(b)   xchg(&(b), true)
>>>   #define test_and_clear_bool(b) xchg(&(b), false)
>>>   
>>> +#define PADDR_SHIFT PADDR_BITS
>> Why do we need this alias?
> I could have use PADDR_BITS instead, but decided to use PADDR_SHIFT for 
> cosmetic reasons.

I, for one, disagree with this (it's pretty unclear to me what "shift" here
is to express) as well as ...

>> And if we need it, on what basis did you pick
>> the file you've put it in?
> 
> I wanted to put in an arch independent file (where we have defined 
> macros related to data types).

... this placement.

Jan

