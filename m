Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC34878BA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 15:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254467.436316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5q0m-000842-Cl; Fri, 07 Jan 2022 14:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254467.436316; Fri, 07 Jan 2022 14:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5q0m-00081e-9M; Fri, 07 Jan 2022 14:14:32 +0000
Received: by outflank-mailman (input) for mailman id 254467;
 Fri, 07 Jan 2022 14:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5q0k-00081Y-HW
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 14:14:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20cf91a-6fc3-11ec-81c1-a30af7de8005;
 Fri, 07 Jan 2022 15:11:24 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-hcXfqIb7O2-DuA9ScJXDMQ-1; Fri, 07 Jan 2022 15:14:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 14:14:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 14:14:25 +0000
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
X-Inumbo-ID: b20cf91a-6fc3-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641564867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5WuuNgJhEFKyF6HTH6N7TYfyfm6w/0abFEOFDDCIjk=;
	b=S5v/D5wu6UG+FA90pakJCfnKR0G6oBsvZ9lY0nlN7JXy2Fri5kqSuEDBfaYHbiKvCDuHLq
	39Wcv0vdwrCU6p5zpQ/VY7S9S6leNHmCDYhY1Rt9/nmO6eN+MscIQ/L2OFJk8GcmO+6ot0
	FYdc56pja1ORZDI3Gg+jmt3XSqb2G18=
X-MC-Unique: hcXfqIb7O2-DuA9ScJXDMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnyPuEa2iV9TuC4OPsz0MNz4Gru6W+ruvOjKhZ7tyQQgTlSA5EKXIMZDeJUuM2OBsfS/pdzoSI3tpZWetwtTCEd+fE1JEecS/ZaEPWlXA5rhornIhSQIjc6aN+tVXyANv6oajttkHHy+OkbD55ybnVo444G8O3E/qke3ubVg8ibXR4PYkxpYX4iE53PxHbhG10n9WinXhEbl6U5T5MPz+wwTzVGZoguPKRFTtlljDzsyxJyyWZGYkgt8x3fhigaRC2Mdu6OSgj0rwzOdQ9tt3z5Qk6CaHK5DlcYpWHaDI0XzQN4rKOQ6pUKDLdERiGClSE1xIbMdjaqzToVJtGLuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5WuuNgJhEFKyF6HTH6N7TYfyfm6w/0abFEOFDDCIjk=;
 b=W2mrT4lGCOt39f5Fe3/dSvpwYkJa/wd4uJ8NWo4ObWley55XDOy5ODtDaASwHG94cvnrIbF9/vkMiVeWVINLiJolSL/yGMno0+oTwFLOzbpG1JydpMt+p582vntFz89psCEB5PkQKFhZ6mBGjjJqLk1uX/QDr5r/zPeWxANXB3cRGvSzeP33Uqsq5R/DdlzVEEq8dIaw6FHoAx5FDfc+0AUj+dAbEuWrzR7tuakiISZIpGyN7BVz+RN2TZcB1tTHuu9t0htw8f/K2gvELUJXxKH61w2zEXnQnYS8ObpDTvO0TjZnhqyW4y6TXbjOL0aLrvaJk0irA2NvfeWgvb8bwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33b0cd75-4ef1-3d46-2952-64cd4e15b4b3@suse.com>
Date: Fri, 7 Jan 2022 15:14:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 01/11] xen: introduce internal CDF_xxx flags for domain
 creation
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20211220052123.969876-1-penny.zheng@arm.com>
 <20211220052123.969876-2-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211220052123.969876-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b9077a2-3989-49ec-fad1-08d9d1e802ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349BCEA3B5155FD6BA139E3B34D9@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2xegTNkt+qK9pgf1ZvttB5BQ/2wnNdMIXIJoR3qN3iSaxk1tI6atXxfOOfoYo6R9fD9T6SsrXEaQLrSgY9DIvnY8/+JoSpeZYIEASz9ajuttIq8FxLNJSAyg3o97P/XIwDXg5zU1m/rOCPuaVw+KQsuHaFOxftaHaqJ8VMYShNDnyFt5q+U9q4yDqSbOTWZkKD4TWyS8VYnCZScqQj4YX3JYBDMPObrZjTo1g5LNLqQifkui15Hl83ZBzBhgtPT2LSbs3lmSGPiZuOQsWLieF0kyR5aymowS8kblKpCx09z7MbgIz50CuRKUrWcJONU6RPjnmPZ6sT00E0oukcrbCOdY9ufm6WdTfOOkmeEgE5AW/1r/SB52vUfwVZZ6R0elMxXnx5vRvHyrfW2YCEUp/wW2X0GpsoZ/LuqtjJ+5Y/dqhbmEXI0TGh8ho3GXbNGX3B0fUmmX3D9chagpy0q03FlDpjk56ydmGaxYNwU52FU9BfDegPSc/dHuDIMm2sJe+1Dt5qg+Om7BSmYFQQ1sWa5zpBqxYOQpAVGwnRUoPFJJkG2b5CaNN/0wC+2tmohr/szPAi153D8xG1s+jZhu91w0ILUTWG1Yh7PeBtR7iC4XRl0CNMJVgmVXiGdcGjgOLb1jG5l3/mt6nDdjXTXo8XRZ3hP1+4cFKeVCJWsM8DPBjOLeNVIyHJRaPDRwQCb2gdroJxZHGQGJffP4u/DmLrep7nhOh/eMSIR6PeER79+AM6ZN27pdOGuo0b0stMAgOCJ0l85wgbCwVRtftRILfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(31696002)(66476007)(66556008)(66946007)(316002)(6512007)(4326008)(6486002)(38100700002)(26005)(53546011)(6506007)(186003)(2616005)(86362001)(36756003)(2906002)(8676002)(8936002)(6916009)(508600001)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXBxcTd5NTBxbHo4RitXYnY0d2VVU1A1SlJBTmlxTm1QbWRDTWgxWFF6QkJZ?=
 =?utf-8?B?dXB2R1ExRTFQVllIV2dTS2U5bUFxTnE2UGxZOVZadnhqc1d1QjNQRHRWZVJK?=
 =?utf-8?B?OU9vVDVWUFpBTFNpVFpkdlBTVGhZdHRrd1hhL1dHRkNUQU1TWVFoVDYwNmIz?=
 =?utf-8?B?MDBCb0Q4dkJxM2ZFR25CdTZTMnBvRkVibzdKci9lM2VacXRuWEhNR2Rhd3gx?=
 =?utf-8?B?aE1DVEtkTnFEUXRXZTBXdFE5cHRpcjhkYkRHa3M5cnRON01LSjVRWi9iOUlG?=
 =?utf-8?B?amRmdUV0MytlQVlCWThuUTV6MVY0Yk82YWJ2Rll5cGM1MjY3Z2crNUhvQ1ZE?=
 =?utf-8?B?aVgweVhQakdnT2IwSXBLSFlKNnNtaFZVU3QvUjhTb3NTN3ppbkVGN255N0FX?=
 =?utf-8?B?MnV0Y2FtaUd5R1dDM3RRYWpITU1MLzJhMnlHQlhsZHhLaE03VmY4cXNJYTlz?=
 =?utf-8?B?eVNNalRxeUhQQXE5cDhuRG02UUcyOFgydmhWQkR2cUFQa3dvQWdWMGs3WUJD?=
 =?utf-8?B?ZmdKSWY1UXBEbExJZldoTXFIakZNTUwzOVdZV3Rrd3dRZmJLeWJJY2Vnd0Ru?=
 =?utf-8?B?WjAwdTBJcElwZEkzdGgzOVR0OGlNcDhpRU1mV1VyL2hNY0l6NEw0NUhMbmtM?=
 =?utf-8?B?NS8yNEtEcUNYRTJsS1pRQ0hSb1pOWmVLYW1kWGtQM1NDV3MwUUorL0dnWXpo?=
 =?utf-8?B?RHJVQmEwaXRMQjRKU0pWMWh6cS9pcUlocFlyY0FyUUxGSm9TSHEycVIxSC9a?=
 =?utf-8?B?RGYyaVRaaElMSW51WDNhdHgxOFJxWVBkcmMrb0lGQW5zbTR4Qk9ZdGd5bktH?=
 =?utf-8?B?RkFWZktvUGo0U252dXNGNkVPWlZSdHhpN0FFaDNmOFYvdEI3TEgzRXFLTExh?=
 =?utf-8?B?cVFZa1Y2UW9TTmxiN2xEWHJJTlkzbnYyKzFhT0kyOTErbndRVmh5bG5LSXB5?=
 =?utf-8?B?NXV3Wmh4V1hzaDRQTkVtSnloeVRUWDMydnRKSU5wQ2ZoSEdqNVNGSVhrdFE2?=
 =?utf-8?B?bUVhNjFFTkNrd2NsZ05TekM5d0JCblBsbVM4SUtyTWdJSUwxZFYzTDVUSjV3?=
 =?utf-8?B?Tmtmb0tMbzRYYzBIS2F5c0RsSnV6T1hBVFRma1V5bXZjbThLSGlHdmxjNGxV?=
 =?utf-8?B?Sm9HWjhQTlVQMW9TZGl2dTgvbm5QTXIyVnlRSGZMaWRoNHNpOGQwcFU2KzY2?=
 =?utf-8?B?SStLa0tIQ1dOdHBDUkUvL3UvaUpOakZlbDc0Qyt0b3M4N1RNV1p4aUdOOE5o?=
 =?utf-8?B?QlVOY2xlb0NQRGk1TnRlUG1YNy80S0xERmFtaGZVVVE1NzNRTUdST1ZJRjJ3?=
 =?utf-8?B?elgraXMyUnFScUNtWkJWWkF1amc1N2x4WGhjMERpTkplaDFQREtPVmhFM3ds?=
 =?utf-8?B?VnNoRy9MQXRNZlRrM0x0M1U2VXJWVmZKY0ZnYlFLMnlKYU4xRmxkZGtiSDgx?=
 =?utf-8?B?VjRXc3ZQakhGRlRQWHBOQ1RPbjU3WnM2QURXTmY5MWc3R21LWXhwaXh4RFo5?=
 =?utf-8?B?cGgyU1RjbkEzZE1Ob2twWjdGWDBTWEp5RVlCV1l4RGM5QWFVNXNTc1piM3Vn?=
 =?utf-8?B?SHVTSkxHeVJjMlFJbkwvWUhTTXc4dHZ3VS91UmlKY1NUL3JiV2ljMDZieVlv?=
 =?utf-8?B?Z2F3WW1yUUFBbjdyL1lUemg0UjRpUnU4Vi9lNENVelNXOFJyUDJoMTZuODFm?=
 =?utf-8?B?Rk5YaVo2b2FkSXlrenN3algwTTBaclBRczFHaDF2YTkrYVNCeFVTazcyYXZ3?=
 =?utf-8?B?RTEyTFZ2SE12VEJvd0MrS1psV2d3WkUwS2pPby9PT3hKM09MUmRvMk9vSjZh?=
 =?utf-8?B?ZDhJY3pFVVVXYlo2aWR6VnBnRTdGTGFWZ1hVZHEvNXFqRXd1SHBoWWRtU0FD?=
 =?utf-8?B?THZldHhhVElhRVhScUo4dVdqVUhQUk5jNGVwQ2wvUmUyaE05M1V5UVFWdmFv?=
 =?utf-8?B?ZVQ0d3krNy9MSUhScmxHTjBCUXJhUnJBN3hOSHBVcnFJOHhWVUJLdy9oUmNz?=
 =?utf-8?B?bHdkN2NCOHF6TWkwTlNWcGNEK3RlYXVwTmExaGRzc3labzFTWXBhL0k1U1ll?=
 =?utf-8?B?TDR1MlYwMDY1aWdLRFZKMWtwT0x5VU9tVThrdkk2QTVRd2wrR0lmZW9nVVkz?=
 =?utf-8?B?QzJ5MkwxZk9mR09tUE1heUZnZzJYaDI1WnlEWURJNVBaSzJvSDgvYXdjaTdP?=
 =?utf-8?Q?sM7ttAAdFFFmrgPHeOj4F5Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9077a2-3989-49ec-fad1-08d9d1e802ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 14:14:25.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geFcLR4TFyDM9J05mGTto8qZH/bGWvEaWJCXkhF216bzWVMuMY0noCOXrT+tHtqv4fObkfZuc6kLd4Z+L3l9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 20.12.2021 06:21, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> We are passing an internal-only boolean flag at domain creation to
> specify whether we want the domain to be privileged (i.e. dom0) or
> not. Another flag will be introduced later in this series.
> 
> This commit extends original "boolean" to an "unsigned int" covering both
> the existing "is_priv" and our new "directmap", which will be introduced later.
> 
> To make visible the relationship, we name the respective constants CDF_xxx
> (with no XEN_DOMCTL_ prefix) to represent the difference with the public
> constants XEN_DOMCTL_CDF_xxx.
> 
> Allocate bit 0 as CDF_privileged: whether a domain is privileged or not.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -552,7 +552,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>  struct domain *domain_create(domid_t domid,
>                               struct xen_domctl_createdomain *config,
> -                             bool is_priv)
> +                             const unsigned int flags)

We don't normally use const like this, so I'd suggest to drop it here
and ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -665,7 +665,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
>   */
>  struct domain *domain_create(domid_t domid,
>                               struct xen_domctl_createdomain *config,
> -                             bool is_priv);
> +                             const unsigned int flags);

... here.

Jan


