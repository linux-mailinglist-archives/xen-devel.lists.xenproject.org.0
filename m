Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75549554552
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353749.580726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xiu-00022D-NB; Wed, 22 Jun 2022 10:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353749.580726; Wed, 22 Jun 2022 10:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xiu-0001zo-Jc; Wed, 22 Jun 2022 10:36:36 +0000
Received: by outflank-mailman (input) for mailman id 353749;
 Wed, 22 Jun 2022 10:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3xis-0001zi-9W
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:36:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f095322-f217-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 12:36:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB6542.eurprd04.prod.outlook.com (2603:10a6:803:123::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 10:36:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:36:30 +0000
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
X-Inumbo-ID: 2f095322-f217-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5kPfimPc2LRcNJLrDLYrQPRRUod1PxcQFijYHOOjEtciQD9X1iLgmoPzZVWwn7blqVoKrsQuy+pH6HnRZmyzdG1Kex8/3zCnfH0/2ICroiivgEN0NNNK1zAV06ddYRRN3Z8kZ7GdOrY5myV4cO/xynxHFwN42acyrX7P3pWKTcnsfFeQzAIR0W/LqXZjueFfuSvCwHS5Je+xpovQvnXdrMTt8nYh0cBxVqlpbWs9NcX4F0XXUXem1etWWnZFtIHr/yN/hV9FWY+lPwfsJDfS5CSRNkSeaQwlRqh4JMqHhovQi95GCYAw2DdeGRVkrtlmLGgCi6lP6E9JEIbC792ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THiQZQA9BYFFOtXzxLC2xtyzASzx6KnHD9/p/+q81Eo=;
 b=Ro/O/U9b1trsTdvhiMwdYahM9apcp+p3ZByKyM4aBgKNWjapI+zjUitavgXn99FX4KuBzwuuR7WdFeCaxljlqSRKSU81xgZi5kB6Fk60EiTToxgeYucKDpFpLksYXpcPgv2elpfpTXcfguIT2LQ1JuqTEC/JNwqxBIrIBGs+pB82tsqUc2TSkyFkHD91d0By3o6kTb547CC4Oi1hxILHPgwPaTS/wQvFdViHTLXZL+ckX//x349lvECqOZ/bnmPgOXLPnav/q3bit9uK+lrHHRJEn/wGPW2QjedRWkdba6z0L8+6JtXljtNeu3qtuFsTInEtBJKX/1w6voNvdqJPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THiQZQA9BYFFOtXzxLC2xtyzASzx6KnHD9/p/+q81Eo=;
 b=OTvb3TRoNo6w/RcciW53Vmfy/4sr6kHPro1EIWwshlqZLfmRLxbL31mDeyN/58hs/LHvv/Yh9dnE7OfhhxIz0Q/cNOjS6JV1cQJVj6kgL5dejf64MU9kiPD8k04LWBlkHIDP7uCCKRJeujxjmwSqB72pGNLnG2eGGnVbhoaTskEWXqIEzZnW4fqBN7qkVupGphu3DFUv6Kl/CrZyusWCyIdPy87RZMAsxanAUIynM3rsdxF83o4Uoql+w1UfXOiiuCi6+q+LSouSJf0L4Wj2F5WX6InH0Zh+Sjv8f3SEgEv3FE8ViM62avIzDh/wTiB7U0ofTyBrvxc3PR1cdEcBpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <155d8f62-aece-8fb8-8be2-6d21d20926d7@suse.com>
Date: Wed, 22 Jun 2022 12:36:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 9/9] drivers/acpi: Use explicitly specified types
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-10-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20220620070245.77979-10-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0011.eurprd03.prod.outlook.com
 (2603:10a6:206:14::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63fd0936-64a1-436e-e6e5-08da543b1186
X-MS-TrafficTypeDiagnostic: VE1PR04MB6542:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6542A416E226146D6FCA5206B3B29@VE1PR04MB6542.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7wg5pRhDgp1jw5fQ0vl39u7hCjoNgG0PLUHfI6D314HClzHrwDqWjOEPqogtmAyfurbah4uDm1tZqX6PwtEklzoDrwoTAKYU6HapoN9HRt+5BhgWB/9ovkoNp8I6LfsVhSA4AR+zMcck+G9vLoC7sqbTzzVkkozle3308SA138SuIpFA+/dAiWHDd3eLqowW96/EV7PnJZCbgUZa+tdw8Cw9mgRi75AldcXUoM8w9QcBdZ1DoUpsfjkzoaJRSxKgJtBJ4TgjbaXMfTa9hUBwTCyn9laPfnHipol34XecE22vKhErI7N9lwjlIz0o14hyeR/25TZrx2095z7wdMeNUSJQwGPegApHLSA8mjhLl+peDfW8B6I0WDOuvEc2wtEM40VKvmnxcpMPuXRWB2nqlZM/L2spHIJuIo0csXxBzWNHv53arGpSThX7Ws0wgb+ohQ0IFLqfsNPoRbgzaLHWD7lHohev/yGHBF70E4is6xcFiAeRwzNqJPDcEDgcDMoxg+DFh3gGDruvGAI+xR7yGO4vTZjtPSLLTC7yNVEDsaB0t7ejYEQ2YFQNMhgHWxULpXZC8i+y/Oa9Sch7zBNyT1hIeEM8T0hVK1GyRud6HcVNC9rPIBMbQ5ioeFXC0nb8yJXb0Clk501RU2HTMKEdFBMejg/XOn8+ud9FyDfYQ1APlfKqt0hdhQLqWRw40q/SkokEt1v+lDnuaBTvhuzDsHcEjjWy0Ef23MKU76sgviACGNt46FFcv/6sGpUBvRwdHMPbyoWOqe9ciBoEnYFx0sthTXBRxph7Eso7FUnCOiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(366004)(396003)(39860400002)(66476007)(4326008)(6486002)(316002)(8676002)(36756003)(31686004)(5660300002)(66946007)(6506007)(478600001)(8936002)(6916009)(2906002)(66556008)(83380400001)(41300700001)(2616005)(38100700002)(86362001)(6512007)(26005)(31696002)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDhaN2FOci9ONmZmSEVsOVVGUFc4QTFmRUR2bzk4SzdUZi8zcktJdGRMN21n?=
 =?utf-8?B?YlhGb2huei9PKzRzZ1p0bUtUQTN0SGV6Tzd3c01OZjAwTmp3MHdoQ0hOU0Vz?=
 =?utf-8?B?UWplVkYrMGFmaXhQWEVnbVJlc0ZHR3ljNFp4VzBaSkkzMUhwQVhUSG11aVZJ?=
 =?utf-8?B?VG1kb1RGN1VTbGQ0WXQyaEN4bTZ0RDNSeUNLYXo2M2tYWHBZVlVsaG5IN1JF?=
 =?utf-8?B?cjVQUXUrZ1RpS0g3OTV5Ym9MK2QrdlllOGNrRWV3TE1XT0x5NWxNMy9ZdDVJ?=
 =?utf-8?B?U2xOUUwyamJIejNKQmVWUm5wMDU4b29ka2NhWnpRYnczeCt6eEwydGswU3A5?=
 =?utf-8?B?eEtTa0s3NDhwZGptcit5K1drejRYQ1FFeW5YeHNmUFNsNk1LY1JrREkxUWJI?=
 =?utf-8?B?QUE0S2xEKzJ5ZWJJR1A2czZuQ1pXV1dIanEyaktjck94K0Z5YU9ocUVJRitP?=
 =?utf-8?B?K1FRYUJWVUpZbVFHV2lQaHd6ZEpVQjZJOGlyMWd0ZGZQYUp3Zml1TXRVR1d6?=
 =?utf-8?B?YjAwKy93YXBOSlRsNElFRzAvTHZFWmkrakw0YUFMcTNuSlFYY2lWL3ZZZmtt?=
 =?utf-8?B?YmdDdi90NEFEVzRmZG9Hc0c1TWhQZCtDZW02TXVsOWR0bmk5VDIrdUdSQzYv?=
 =?utf-8?B?bjk5aDNRZFAvNUNjWC9BaUhqMHNGYXdLcjBha2RNSXRidnJiYi9VbE42akJ0?=
 =?utf-8?B?RnRSUGcrSWNsTkJ2eFdWanB1aXIxVU1JY2I5OFdLTlFBMkFPVUlEYmFsWjFi?=
 =?utf-8?B?UWpzV0J6a2xIVmt6YkxIbGVwVDNCZVhoWHVGc0FxYmd5V3lmbm1xVzBINFhS?=
 =?utf-8?B?WFJHbzM4Nzg1S1hvU2s1eXR4Q0dlTzlxZXFmQktOVGtGVndwOWE2N0ZEL3N2?=
 =?utf-8?B?NGtXb09sZEFFbms3ZTVhKzRjcnJSckFwUzRYQm9kWjdrWDk2QnlCa205Mjlq?=
 =?utf-8?B?ZXByeGp1UmM1RE4zdHUvQzdCcldxMkhQYkU3eXVBSC9uczFjVmZjNjlCR05P?=
 =?utf-8?B?K3F3dnd3WHplTVBpUlBCdWFWMGZkeTUyNkVRVnkvUU1HbVpYdVdKQWpBZW9O?=
 =?utf-8?B?RmtxYU9SWGZmd2tFeDRoR1E2YXRNZng4bmRXS0xhdkN2VmxXTFZkTGFaWXlJ?=
 =?utf-8?B?Q2tYOUtzZEZlZkdqSFdaSWdWbGplTFRjYWQ4Nlo2TWpGTmlUaFRPVEdiclY5?=
 =?utf-8?B?bjNXZW1vSjBqcFo5NldKQ1lTRGpTWVZtbWMzSXhjUDMrOXNKRUpGQXZaL1BN?=
 =?utf-8?B?VTMvMDVELzc5MjVMMm1JUm9OWWNab2R2SnJPalVwdFYvYzBhNTVYVis5UklU?=
 =?utf-8?B?R1Y0NmhQam1NV2FieFBLM0IwUkxGcTlaZW1udHM4SWlyeUlvSGE4VTlFMnJQ?=
 =?utf-8?B?UDdzNEpWQmthV3U2b2FtcU5TRjhZemw3SXRoWFVSN2YvUG1FbGVrRkZhVG55?=
 =?utf-8?B?UTJpZXlBR2x3aXZxa0psNE83NCsyOTlMa25vSEcrb3U2QXZXWmFXa1F0R24y?=
 =?utf-8?B?WGUyVFBVN01McEtROVlscFltb2lhY3pNTW93dzNKOVo4enV3Y3psbmk3UlFo?=
 =?utf-8?B?eGJxWUlhWXJOTVBUa2NGRkNDdjcybDlUdzNGYm1reWhVYzZFbklZVTRUL0pO?=
 =?utf-8?B?Tkw4MHJjQmJOVmE3eWJKRWkzekppc000MitVdUFnVmQxREJCeXBYcmNEdHlG?=
 =?utf-8?B?dzFsRFF5MnBzQXVRbTd6Vk5JcmpWWE5WTmU0R2hsY21UeUc1QVpibTZmY2Z6?=
 =?utf-8?B?YmxrWjZUYjVPQ1ppWVZQT1BkQVdGeFVWQjNPaDdRV1VPZW9ZWjBLQ0FyUXVC?=
 =?utf-8?B?L2tjcTAwelA2dDlkS1lJZDBXd1FWbDgvc0pGWldvOEMwdmlWNEdwSFZSVzVz?=
 =?utf-8?B?bjViYnh0TVVGQkwwdGlBejlxKzArV0FjYVZTOHRDY21CNVlxczZIeXBNQi9B?=
 =?utf-8?B?TmhCQnZKMTY4dXYxRER5Rk1zeUdKMlpTWlJVV083RmczbVZGK2RSbVJKdXlL?=
 =?utf-8?B?Rk16Z01CdFZhRzgwbll6eURTT2F0ZjlwdnM1Qjc1amVIZmNUYloxQzY5Vng5?=
 =?utf-8?B?a3ZGR0YydkMybUxscnB4TklJQ3ozT09pUnp4cXM1UXFmTHJ2M3pTTFIzV2s1?=
 =?utf-8?B?RndWYnVCeDR4a2YySU1rZHBET2k5clVNZStkR0ZXN0IxVFQ0KzZ2elRCMmZv?=
 =?utf-8?B?Y1MrRUpjYnhuenk5bURNc3dhUjZlRE5DOUFpSThpRWt0UjZlY1EvdGhOR3g3?=
 =?utf-8?B?OCtUUlc4cXd6ZE9pNU4zeVBNTGt1RXJtVnZmbTdER2JkT2dpMmxad0M4UGJv?=
 =?utf-8?B?Z1FUeEdFM3BLRzZHL2pSZkEwU3lzL2ZRRnM3UFNtT3p4S3pQZkZxUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fd0936-64a1-436e-e6e5-08da543b1186
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 10:36:30.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6aw9SEPxq8JDVfGLCFtM05+s0mN0gIry3y73fvPlnAL9+BlXjVm6uPddKi+fCj9ctWbZ0S3YX1qLIrPoVdcpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6542

On 20.06.2022 09:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> This patch may not be applicable as these files come from Linux.

We've diverged quite far, so the Linux origin isn't really a concern
(anymore).

> --- a/xen/drivers/acpi/tables/tbfadt.c
> +++ b/xen/drivers/acpi/tables/tbfadt.c
> @@ -235,7 +235,7 @@ void __init acpi_tb_create_local_fadt(struct acpi_table_header *table, u32 lengt
>  		ACPI_WARNING((AE_INFO,
>  			      "FADT (revision %u) is longer than ACPI 5.0 version,"
>  			      " truncating length %u to %zu",
> -			      table->revision, (unsigned)length,
> +			      table->revision, (unsigned int)length,

Since we generally try to avoid casts where not needed - did you consider
dropping the cast here instead of fiddling with it? Aiui this wouldn't be
a problem since we assume sizeof(int) >= 4 and since types more narrow
than int would be converted to int (which in turn is generally printing
okay with %u). Strictly speaking it would want to be PRIu32 ...

> --- a/xen/drivers/acpi/tables/tbutils.c
> +++ b/xen/drivers/acpi/tables/tbutils.c
> @@ -481,7 +481,7 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
>  			if (ACPI_FAILURE(status)) {
>  				ACPI_WARNING((AE_INFO,
>  					      "Truncating %u table entries!",
> -					      (unsigned)
> +					      (unsigned int)
>  					      (acpi_gbl_root_table_list.size -
>  					       acpi_gbl_root_table_list.
>  					       count)));

Same here then, except PRIu32 wouldn't be correct to use in this case.

Jan

