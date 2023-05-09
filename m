Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BB6FCB43
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532361.828520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQ9J-0007CC-GM; Tue, 09 May 2023 16:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532361.828520; Tue, 09 May 2023 16:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQ9J-00079x-DW; Tue, 09 May 2023 16:25:13 +0000
Received: by outflank-mailman (input) for mailman id 532361;
 Tue, 09 May 2023 16:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwQ9H-00079k-In
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:25:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1124a157-ee86-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:25:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 16:25:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 16:25:07 +0000
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
X-Inumbo-ID: 1124a157-ee86-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/lCRKkVFlvsenPzdEq2mi7nG738Lo2D2Rsf9rs63V8UjFl5ah0E5JJbWaZkBf1P1aWszPeKMAxj33+5SwWVOmDc2JONmW6aL/RQzkOhWbyRmvfdaoVsEsBM8Ha8L3j+wHpOm4FIAkngXThxd6hKfNbMnxqWCocmjBPC4l3NB/NYk2UT7mOJ9wtyJ12dAb9QeC+oDW/AlvIDMuwQCTSNHKCdTLd1npKONfIp5zryCnXmvuy+Sy4cLpYI/q8ehi/v7qhEQgDIIekYCJZ+AC2UI+dnjlnKbS5O6MK+KMQOZDciuRCtsMUyWR7xxiJyO3ZGOo+Q976MybVtN+S37qiDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE5Ni0+G6ask8+koWbUDzG5lMKS5+OBPt48hbBBuaYY=;
 b=Dgz7yZAnJmHFPto3ewne9U2p8DKmNCoUBVuqcaXiqvJkVepy5cdsyF+MvrDxDgJBiPBNTSTAt43ToMBRcZpWGqnNbFHlKfa7qy2KJVrR5YuPTORguvLwPVPj47VgHN0PR7eDchQmn5vO9meI3v2J+WPw0UpaVzfUM6szO7NBHXJYC5aakMKpR21Noyy9N/vxSZCkUtNcaYCGn6t5i1a4gelVy4rmICl9eIQwZkWVQWspNZVWdS1Hk2LXEJgIq7egy/slXGrTu4/qKEoIJ16hvNwKbNixiUeuxu1SjWihZztX6/u0C9lp300srVIEAL+arYFX8Te0J6ZWUiVYW3x5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE5Ni0+G6ask8+koWbUDzG5lMKS5+OBPt48hbBBuaYY=;
 b=KTYYKfvAKfs9tr4OPUw9lpihbsflmezyEHLSMxXutU5HQs3b7itVJsCVs7lbyOvH7X+3cLlnrZnzUJod3PfMVUL6PmaiYtpwKch8aZVPmGenVsG7kZy4Ys7cDJ1yW0u9oRUfSnZ1jjc1oFlRuC5NupWXf9XSnrMf1+/n0tJHFRyvE8LUt9PPwu7s7uo+bpLB+Tv8qq1yGieSi+zcqtcQ17JJ1rnBc5s+90Ek3lJTotb0U0TsfoMBdRTv/5lxRpIJH/4ppXnddbb8IAqr4ra+SAvqpgQuqDeUmio1qvAZAIbWHZddiBlszTMWxmp53WYuFMAbGs5IWE64BJ8GoT5cyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56c5d0f1-bc47-8824-9515-239647015d47@suse.com>
Date: Tue, 9 May 2023 18:25:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/iommu: fix wrong iterator type in
 arch_iommu_hwdom_init()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230509110325.61750-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509110325.61750-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: d7399060-1f28-4b28-1ad6-08db50a9f3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Etk09ThO8KZjkMzL4wC7UsRfjp+9JW+ptXMGeoCujL7zux2/g/a51+pN0hPBs1uFEYyA3CHbv3+JmmuvIgvDIE0MwoRNguOKKDGGUlwVa0hKZdPL2Zoro+jrfAlBSWRMGLN44MsPz11B7Bc/M5cdtDxDbAsj/4a0wH0qbZ3CEL6wYoTEB7iiu3Srvy/FO1hOuyOULeP+g9MpPJ21mTTc3Q38/R28r74sdOYllLY/ARK/1a0r0ebqgKwuWL2wHigoxeqD19bkKF3srCQYMc2gBf+cJSZhR3Im0hFYM9jAfp53SgmeMKdixZKBvW9JPOU/JhTdw++VxiSrR0eQx5200t/G/5c8zLN6uuBBxYPd6ZQJhssYpNrGNeh2Nl2wDY4ItpG316gt8aFG0DrzmdG2sn/w9n9/3M7IP0SE8o8YIiiM7+6VEkT5eZXM5OvaDej2dJ/Ni2MbFiAaSQfsxgGLt44GvGSm7zp+YVTW6bnw6TTnjjDeKXkv0Fytj33TYaYSYyGswUEopm34yn8uvzFaKNY1uAfuJ7fuc1akBtXTbKNGR78swFNqYKvRbHR5FQpreneXSfQcF5V3NSh4JOKcNUlT/GUge+fajeFycNuGU6y4SKM0txo/VvekR6IBtTtqMCD8yriDwfps+Pp/yElF2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(6512007)(6506007)(26005)(53546011)(6486002)(2616005)(36756003)(38100700002)(31696002)(86362001)(186003)(83380400001)(41300700001)(4326008)(2906002)(31686004)(5660300002)(66556008)(8676002)(66476007)(6916009)(478600001)(8936002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUQ2dkt4KzhNUUVkTjNnSEk5SzBFZDMxNkZlTTgwcVhjOUJ1OGxYc3krY2Zu?=
 =?utf-8?B?ZnJyaTF5YndORzdkMDNlWDFoWFppSGVjdGdhVFRsZ2RJSWlIeXRCOGRBYTFP?=
 =?utf-8?B?MzREVU5KK3k2QU1aUnF1OWNsNXdiaVBTU1NkWVRiRUVRV3VBMERCNCtIRmw4?=
 =?utf-8?B?YkVxL3RPOUx5MlFzbERXZFc2aVpqRFphbm85TjhVK25SbFl4TnAwZmtFcTRJ?=
 =?utf-8?B?bFEzTWlTTk16WU04VXFPcDF4ejZ2NWFEYlVYdXhWT1FvR0ZxWGl1djd6ZWp6?=
 =?utf-8?B?UVRpVkxBdmI1WWFCTFhxOUp5SThsaDBXN205N1UxbXdPK1ZJV3YzRDVtYjlU?=
 =?utf-8?B?MmlNZDRmc3BDUzIxT0RYRTVPdmdYYmlzVUpLaE9IK09SVUV2MlZhMDFZeDRC?=
 =?utf-8?B?QXArMnhRV2xkN1ozb0NzZkpCNXlUY1lzclhtM1pISFY4aDRIVVNBRTFIRXlU?=
 =?utf-8?B?YXRlS2JYZjlsbGNSUW5jTkF6RlZxZ09xQnB5K2xJcHcxMi9BZWZ1ekVXZVRT?=
 =?utf-8?B?bVhvRTZnMTFEVmFQQUVvcThIOEkyZVFUSDN0cGNQMmFCMGtzeUp5VllTem1H?=
 =?utf-8?B?THV4QXBwaFAyYjlsOUxsRUxKdE1oSXFUbDF6V2kzekNrSU1OeFRqdWNCVjZI?=
 =?utf-8?B?dVlGZXpOM0s2UEk2alRCRHl4ZmtNOExza2haRVdvNFNtbDlUMVdDNU5yb3RS?=
 =?utf-8?B?cDBueXFxSHFaN3k2Skd6R2JXOG03M2UzaStyS3I4c1hGK0tOSkxNN0xMTlZj?=
 =?utf-8?B?ZW1OajNaR1dvQVp0aWdDd2ZxQU83c29qdS9lRXpEWFRZRE9ScXpZZFpPTnIy?=
 =?utf-8?B?QWd4VHd4WVJKV0luVVpsWW1XcktMOElVdUFGWFJ1djJEZm5FTExJL29ta0Jh?=
 =?utf-8?B?QVlDTkY1ZFh2TUl6WERtWWRQTGttQjFTT0JxdU9pd2w1VjB0NUx4UFFZOFYw?=
 =?utf-8?B?eXZQd1A5a1d6SnlFS3JzN09JTmx0c29sVlBHdFhPcmc2aWZheEdSOWl0VDAx?=
 =?utf-8?B?cDhSSndkbWJpMCtGYys1Q1FxaWt0YUxPZ3lNWHlkT1pDQUtuZVBBbkRyRElE?=
 =?utf-8?B?SWNtQnVSeG9wb1ZBeHRNQXNtdVBiZFB6QXcyN3BDZHNEUCt6cHNCRXBpaVFK?=
 =?utf-8?B?eUpwUXJaNUZsb1Z4VUxPaEo3a1VnMnRIZTVDL21JMlBEN3UzZmNVTnlzUW1T?=
 =?utf-8?B?dGhoSzkvVEZoa1g2am0vMnNkMzlHWWp0Q3BkUVBqcnZSRkZBamFMcUpBWUFj?=
 =?utf-8?B?bThUY3dnUW83U2J4d3pDa3BrcGpVdUl1L2xzQlpPY2pDWDk2RFR3TGlVdFli?=
 =?utf-8?B?T3VxZ2R1N2dZcTJWWGJTYkhuRkdRTnIrb3FGRWZNL3BhZzk0akNlQlZyUDRT?=
 =?utf-8?B?Z3M0VWx3MUY2ZUFjQzlwcC9ub1VScisyKzc2Q3M1dllJQm51b2FrR21xQ25I?=
 =?utf-8?B?Qzk4ZXdjQWZ6aC9YOUNJR3o4QmlNaS9yK0VFWG5VcjJ1WlhLM09QQ1l1cExM?=
 =?utf-8?B?OHk1MVQyNUwyYm1xYnJVYzZzVE5GSTdvZHFWNmFqMTA3bTU1VDdtS3hVT0d1?=
 =?utf-8?B?ekF1ZEZ2Yk1ZZ0w0aTV1K0xudEg4RlNVN243NEpKWlJqZk42T3lBZnA4cDZh?=
 =?utf-8?B?RDRGUnlEam0zdEFrdTFTeVB6dStaMkQ0blBISkhBMTNrK3FRSW5KUWI4dndR?=
 =?utf-8?B?TXR3WDBneDg3aW5yMU9GaTA0V2VzRVQyVzE4ZWc0TTNOM3dPVFN5ck1xTTBt?=
 =?utf-8?B?NmprS1AwSEM5SEk2ZzRRbDY3NW84V3RYTmRwQVU0bTd1MVUwdWtEOWljQTBQ?=
 =?utf-8?B?NWU4N0hoWHhWbk9TUkxFUmNFVFk2cXQ0UU9TNjZjaFczM2FlSGgydHNJRmR5?=
 =?utf-8?B?TDBmNFFqcVpQOHFNTUVhNlZUamx6N0VlQzJHUUZUV2hzTHNJaWVFc0ErVG45?=
 =?utf-8?B?TE93eHJONVUvdkdCZ3lzdUpVVDhrK3JGOTZIdkJOUzFGNW1jS3RJem9zcU8x?=
 =?utf-8?B?OW9jZ3ZnQUNFZko2K3M2VWx1WTh0czFQTzFPRjVXdW1DVzMrY3FEclBKL2w5?=
 =?utf-8?B?ckJ4OUdlblRsaWVnYVd1NFZZVHpybGdNUGQ3Ymp4ek0xNnZ4T1JHUnAvVlpm?=
 =?utf-8?Q?kmzdQtkrsb5vRLPOzsPzFbrot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7399060-1f28-4b28-1ad6-08db50a9f3e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:25:07.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLFCZ4r96urTZjxveWxYFpWxyLj86Wg3rdoTcu1kb53u9xg29kQ2r5oeJw+fr1WLDaRL05yhlwbDmt1zGhYasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921

On 09.05.2023 13:03, Roger Pau Monne wrote:
> The 'i' iterator index stores a pdx, not a pfn, and hence the initial
> assignation of start (which stores a pfn) needs a conversion from pfn
> to pdx.

Strictly speaking: Yes. But pdx compression skips the bottom MAX_ORDER
bits, so ...

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>       */
>      start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;

... with this, ...

> -    for ( i = start, count = 0; i < top; )
> +    for ( i = pfn_to_pdx(start), count = 0; i < top; )

... this is an expensive identity transformation. Could I talk you into
adding

    ASSERT(start == pfn_to_pdx(start));

instead (or the corresponding BUG_ON() if you'd prefer that, albeit then
the expensive identity transformation will still be there even in release
builds; not that it matters all that much right here, but still)?

In any event, with no real bug fixed (unless I'm overlooking something),
I would suggest to drop the Fixes: tag.

Jan

