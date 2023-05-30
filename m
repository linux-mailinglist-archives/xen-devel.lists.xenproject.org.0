Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214017159FA
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541021.843293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vaP-0007YS-Kf; Tue, 30 May 2023 09:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541021.843293; Tue, 30 May 2023 09:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vaP-0007V7-Hg; Tue, 30 May 2023 09:24:13 +0000
Received: by outflank-mailman (input) for mailman id 541021;
 Tue, 30 May 2023 09:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3vaO-0007Uz-Bf
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:24:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9ac3e8-fecb-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:24:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8914.eurprd04.prod.outlook.com (2603:10a6:20b:42d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:24:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:24:08 +0000
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
X-Inumbo-ID: bb9ac3e8-fecb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1MyNaSjLgTEwfakxh0Bp0daLXc7YsV8FpGMZS9yyjM3ztwhEEPw2P60c0UyvNCFNB7Qe21bBE5p8/DY2DJPf8pWmuhVLnDyeDznvLDdOLFGzDo9s+TPaV6n/j9CzDfY+wBa55+WWHCssOxayKBnL3KR48CsX/T4/TT+LnqLba+qfxE978QtaXn7jeqNBSxbBd2gXliOjLaiD42xdBfUku4LqTMXbSLxhyRKAxIJDwgTpL2H5PeNVTKuMIKD1hMLG7mk5xwE6nJYCKQfxJ0LU/ZxAsTB2LUl567Rhj/luqoa2goxE8n1EF+LZskDzA+FQDIVKCWFZmUoyQr1rgluMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCWhJN35/zT5t4ZuRwJIkJSlCuigQm4LDHVK4mym/BA=;
 b=mnkfSBLlwsxvWLy7VGsBsr02+mq66jkRhezZRdRgcza+KeGyop+t+uMuRASc7FjiTapvlj8ikrSVWdkJuFTeaL2LIG7ScSt/VuLwhWYtdULxuMYZvVw8X+8U6F06cGlMDzBgVF86cuozyln+HrOE5FTyIynR+ffzYF2XLK3vz1YFpRxJNIv2txagKRg5Ei6KdIM7oURqLNOJlGuXKPC4VuxKBpCaCmTSSZh+bebJ5D/JD3beXVJ8CrAAXV13r/q+LYOIfP0pXUr8lTzd4Yvs6CRbfNxOqEDX5cbCORQZnG5ZfxGfuHqxXsmbUoAzBDSj/gmteUI1dzpF4/9W81KeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCWhJN35/zT5t4ZuRwJIkJSlCuigQm4LDHVK4mym/BA=;
 b=KaG/Ki85ZlOynEDIzA3NCq6CB435lXcu4b5Bm55yoJuiTVGheLhFJKyXIo94gm3dHt6+32WTsKPgpRv+z3jgj431DVyuUM2DehBUPaReDHLOPFRy5YyfC6v7kVCdIGTwjmzG7Jkcnhw6eVlq4d4yF5y4Hhc2ZBOnRRi0f8HulrpdLe7EklhuCNszomU2wgkwIispEZhEjexRz4dpZFORKkOJMuKE6fHMCPXtTx4F4KMzyhBV0CPdfrmH6NhPdXpm6kCiSMdZ7fzyJssLIGwZKMhvpqZMnHeI4FnFppn2CAA+elY+tcf+HgmsgnFofxTlXWmEZ3m4bJwOQTutWx7ysQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <524d0127-e0af-a2d3-d475-f462395bdbf7@suse.com>
Date: Tue, 30 May 2023 11:24:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] x86/cpu-policy: Rearrange
 guest_common_default_feature_adjustments()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230526110656.4018711-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 136ee586-a427-4f93-96fb-08db60ef9e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ox4vxi0Gi8rTo50pc6f4fn/YfymzrCpBrdTlr/3w6iHnPfcQ/TGbJ/nEUY1drsbQwBXIb2T7u7SbqhAdA84An9ndCtV5gZMT37bugS+twpbh0q7U+T3hkYsZ+AMufw03muVHpFRlXJQMyS+1VhfrJPX2+TCLPEXSAnQMESfcMwZab24aYNyS5lFxHWI2ZWS9+UNeAWMPTg4SXgvUIq4GHf18ZGwvmbFTcTSw2TpSOn5xlfdDwjD+2JAtbUzk7eY6siRjAV+vVeCWHe7Rx30x//T8GjRVtQOlNbiat113N4Snx5frae1Lw+TNcvlpUlYipbXq8IyNuw+U4GW29KziW68TquRmTzya/Omp141Nf5mdkCf2qP+yBS6TaxZF/RAcC+uulE48oVtUq7RWA3jk4bgNbZPs3KfuBwDARYvbKokqTknnEH+NjA7tjl8ekHxsRXmDYsZPqUTFzABegHZvmdIq7Jvec7yWHFTHn69Zi3NoBTRq+jbZfJbN8Tcrg1zKf7y13Bjx9cHB1bzWqHm22RcUz3vIwzZRi0MbpWTLloOL6zKq4tuXzM7gVWgqtchXxBRNZuwK1Fcom+jd6l5G8Oc+TtJ2qeJOjK9+pk8YStU5q25wSwzSeuRLlVnrDLw/9J7JBbFRb8qmaeFNzVNi4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(478600001)(54906003)(8936002)(8676002)(5660300002)(36756003)(4744005)(31696002)(86362001)(2906002)(66556008)(66946007)(4326008)(6916009)(66476007)(316002)(38100700002)(41300700001)(26005)(31686004)(6506007)(186003)(6512007)(53546011)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHZiMGdIQXNEUlJZUmhhTXJESHE0bEZwUjBMYi84RXB0eFhKZ1NrTytEeUJ5?=
 =?utf-8?B?YUNWVUs2UTBINXdKWENtOTJBVGc1czhEdHRLM0VWSTNTVWtlalMvKzh2NHYy?=
 =?utf-8?B?Ky9waWZSMlgwYitxcUNQQ01URFdRaFk5aXE3NTJtY05Lb0UzaFpVU2cxWC9t?=
 =?utf-8?B?c0R4eWhjN3lsb2g3TkJKb1NUcGUraWYveVNqNXhNU1Vrc1J3Vkc4bzE4dElk?=
 =?utf-8?B?RHc2RzJ6dFZLQS81Ui9tWVg3aEo3M0J5K0tiQ0ZZcVljeC8yMFE3Ylg4cVkz?=
 =?utf-8?B?eEIrM2YwUHRVb2phdkFuYXBtYUg2aXhoMzFENkYxam1rV0xGQm9BZ1piaW1U?=
 =?utf-8?B?MmZHRjZFWUN1ME1KVGxkRURmTGwvbU0vZm9FS042U01BM0RWL0lYdHRlWUlt?=
 =?utf-8?B?Z05uVHRLeExtZ2dxVGtDOTY2dkJ2OTZLTDRsWDZRbThqYmRtNmpPUEJqeEJM?=
 =?utf-8?B?TXg1NzBDTnY5eW5kRDRNN2h4QVNnWGV6QlFPZVo2cHJiaFZyOU1kYS9LOVlH?=
 =?utf-8?B?SkJ0TWRrbHZkVVlUTFI0T1hnaTYwUFBWT1dyVlZhQUNpTXgvSjZaRzVQeHNT?=
 =?utf-8?B?RWx4Y1dlUEsvbjhPUlRWQSs2VFRKRjFsSGlCQ210cFdESmJBcFZ0blJKYlVx?=
 =?utf-8?B?cWlvK2k4eENmbDh6Sk1WVENYOHplVE9Db2xCY0ZJYVJTRnhqWTlXd2V4TC9K?=
 =?utf-8?B?QVVzYVRzVXZqd3lwQm9YNng4MWJBOEVLdWFxdnVxQ1NGMU1BR2xZSDU4VnlF?=
 =?utf-8?B?WXVnN3J3MzI3cXpsb01jY3NUTTBPUDNnbjhzTGt2N0JLaUZhclgzS0FpVnE5?=
 =?utf-8?B?MDhYV1owWUNtdGhYYUZ5dVU0TTZ6RFExUXRxRXZmdzdlUkpwZGoyTlkwSDdl?=
 =?utf-8?B?cHJmZjJzemdGcXlnVUtRZjlUVUZUNmFRK0N0bVhsNVQ2dE8rNjV1em1jMmQ3?=
 =?utf-8?B?L2grMGNsZXQrdGJIcXdJNHpvSzVJbzMyNmlNeEhzUG45THpOUFM3R3AzS3I3?=
 =?utf-8?B?Q0lHaGFINmFQeVhvU0ZlMllMb0s4M0FuYTZyS1RoUW5zbGtSdnl6dTcva1lB?=
 =?utf-8?B?M3BtMWFUcGlMR0VjZ0cyWFJBVFg0SzJEVm44NkVucjZFY0dkVFZLVktrbEZa?=
 =?utf-8?B?ZVJ4OTZTWkE0RVZjUTFtTmdSUE9acWY3Q2c1RGVpQ1FUNE40WXQxeUdaWXFp?=
 =?utf-8?B?Y3FUb0RTQ2NWNHRES3ZqcnZTSklzaDlYOW9IR2Uwc25tUmRkaHVMVThWQjhl?=
 =?utf-8?B?L1JJMVhaVDV0NCtrWC83dDJLSXJJUTc0VDRBek5UU3Nrbkx5NE93UEJHd3Av?=
 =?utf-8?B?ZkVPVDNXTk1ZbDEzRnZCdk1XOFpmOEg0K1pDTGR4L3Erd1hVZEZjSTh3UTNu?=
 =?utf-8?B?MStnY2hPNGpneW1TOGF6dnRRdVpOdS9RSGVEY0FsUEVHVHdTcUwrSEhRYXl6?=
 =?utf-8?B?YWM5TEtaQVNrY1pRY3FFNjBldzl3dE5MMTJqNkR0d1NleFEyRy9DdHBUSUFB?=
 =?utf-8?B?cHRUb3V3Q1MyWE5tZFF3UVR0Q1phT3ltTmhLbk05QWhma0cwd2FNZW5pTitn?=
 =?utf-8?B?OEhHRmVQOEtmditnYjNQUXgwZDhheTlBb1lJN0wrWkl6Umw4cEs1SkxicVZw?=
 =?utf-8?B?T2dNRlNMVitOQTQwc0RpQlBMdG5yYjhObnhIWDBSY3Nwd1l5ZzQ4WW1Fai8r?=
 =?utf-8?B?bVV3VWRoekNtMDFtSHBJcGpPK1B0aTZZbmJyczZSQUVBbEZDUTQwNFZ5NjBj?=
 =?utf-8?B?YlE4eTBJcFFGYUNTZHJrV0NQeFhKT3FMNU40WndwY1RhVklZTUR6UjBnZ3Fk?=
 =?utf-8?B?L1Fkdi9kRnllV0g3eWJ6OXFSd25SMDg0STV4d0pPYnl0S2R6cFVHNjdJdHpX?=
 =?utf-8?B?c1ZHWW5WWjQvM0hNaWpxeDNUaUdLZVpkemNrSkZHelo4UHFDcHJUSWZEeTNW?=
 =?utf-8?B?YU1nTTVES0hhV20vdEYvTHpPUFVmcTJKVDMyTXFFVDd5V0RsaTZSQzd1NlVn?=
 =?utf-8?B?L04weXo1YXJwWERJUkdxVkIwOUZ6TXA5cE0wcnl4Tm1hMHRKc01nVFNMak1F?=
 =?utf-8?B?RGVpa2k2WWRNSzdVSThDS3VPVnhZK2RIelBQWWRVZHAwdDkrZVQvMGZ1SGVs?=
 =?utf-8?Q?NpubrQgP//02bf53BtwhAfs0P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136ee586-a427-4f93-96fb-08db60ef9e92
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:24:07.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCmgqJEI0KKQFlGXK2QWMVPz7u0dnmZO+tmIf/dXSkR9ZFR4u0BygTRa+kEtYjRBetnLPxP6W55nNTInt5paMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8914

On 26.05.2023 13:06, Andrew Cooper wrote:
> This is prep work, split out to simply the diff on the following change.
> 
>  * Split the INTEL check out of the IvyBridge RDRAND check, as the former will
>    be reused.
>  * Use asm/intel-family.h to remove a raw 0x3a model number.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



