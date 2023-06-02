Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2F71FD1D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543008.847545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50jo-0000V4-64; Fri, 02 Jun 2023 09:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543008.847545; Fri, 02 Jun 2023 09:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50jo-0000RZ-2q; Fri, 02 Jun 2023 09:06:24 +0000
Received: by outflank-mailman (input) for mailman id 543008;
 Fri, 02 Jun 2023 09:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50jm-0000RT-1w
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:06:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7b069b-0124-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 11:06:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 09:06:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:06:17 +0000
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
X-Inumbo-ID: bd7b069b-0124-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFClVYx10y67BVOKaODtttc5GWXz5ch9nuClBkYqtf3cOf2hGln63TclZn2vKdNGWZtG+sc5tf8zBC8wD5EXT54Mbztvy5U8B/yBSIwky3Grw71Le6HSkkOWsT62T9fLS+/syQkDXwjr6pOJOMOmTg9IGFqI4WnqHTot1X/kRxE60JsL+WIDsgJ6y2VAcMkspelMn6c1T1a9BtTDt15VVk7dOPGjw1xaOnJQmgV5GwxZkSuEZNRlu10S2+NgPG+mIg647vTE2DAV/pBujaXJzSCRqWUNfdhtQr4qhXbgai12iUxBp3C4D2YIgK4G0O32vdT8GPMhOuwW5BDIjc91Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQkbwwLsHrsSymWhVUkVi/YaHHc/hwVJAyoC4cqQqUM=;
 b=OYumfpYIHM7MLjxvREussREUprF+e6MYikM+UFAf9AMsrJPeNdw3tZ5gJcRhsjLsJ6ogbBuhuANWZgSFIswKtZ+XBolnHOq7LEw+cS2wZ/Enbg4b7UQ/wgJ36+q/J6g+5+BEWfPwxNj/IM/SBnjRC9+kmhaqMk2MuGDKYu30WDM5C3MEs6feIdkcsevSiyrDtcDIBad+WyMgHTEisXuYGiNbX1Q2XybD9vBCSL3kQt84LqMR+j6Ok8rpsDtO9sOixyaTG/qtOSI7jkhYXVixtAmF3wV5cTHx4r1Rjf1LOIG+kMXsgv3+OhXr4zDRkB8LRlvqm4i3Db5KWlgU4qfbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQkbwwLsHrsSymWhVUkVi/YaHHc/hwVJAyoC4cqQqUM=;
 b=LZOiFDEFd4SvceHr0Dx1iLXHJXbCpZsBYU9Acb6zi08SPqQRWqZaPv/T20PICMgzUHIgGYTS/o8PufLVnVXVxfu0a+5eESXxiyEgFvWejF84YRPQidRX0mnejV2L83jB4kU4iQv0aY8PLGX5D/p00ac0eoAfkg1yvGuXEUQIHIJsvF82JbR6351bbaiBhnEhPOsNjSsXUJGSahJbpMBt+TyViLkfWI6u6VJckuu1/CJ7oLEDwi/NCdFAcQ6Mz5hdC7mzB4E/myaBb4TJGdaTmoHLRx/GD5eH6wKKCARoXFJ2dgOKXlYcqRGYBR/UW0o0xSMwkwdW+v3+J5k6bIhBBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad948249-2011-316d-f194-7d7f76667530@suse.com>
Date: Fri, 2 Jun 2023 11:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-6-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3b6f8f-d398-42bc-09f9-08db63489f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RPAZYRUDYCxqmqffqsHgwVNTjBu06y2cGG2Ew33GiPxm+tkqirSALdJcXXh7SqyJsH+LBdAAmMOWMSWGTqGXXEohrrd56TJzqlVU777N3H859WTyi6iEGJG/SQbYsCpF5KfbyZxRv5rxbF9CVSQba+q3DG1Y7CZpAHInDfmT0UDBV7UYkmYv6FAh2/0ADJJ5BLQ0+4DG6dpY7S+Zf94qUSvHlPn7gZ7J5YCnBae7aQoC8EHVj8EWZIJBU5yBZTb15snv4pnfYJa9y0woMCyx58p7tql0jVuoP9tJO0EAOzNSTLzdYiKqcz1Lx84K8ScvKxyfbS1dgb1NgQ/WcOoNtiAtCLqZT/0pZnD5xOQnPzg1HOJ6mi3qiP56+Ld5EvewpRZ/uUtdeRKuOsIqea2sGrTul7jT4mRCAqlN+eKNBZanF+oUkFDkXNy5ylU2nCxxI5nLMIb44p9jHqDWbUaYHEa1wHnNzFlzle3St8xrRArPczV5FROiH6r/MG/qd1unzGBVLmcrzF+oophNM7d2QywflYHH1V5n2i8gin/gPfcZuz24CEb3Mylm4ycjaXlElHJJ1gp1P5Mw7zsXGvVlG7eeed9bKbzw0BM3aD6njnQFl+/Tg9yE6mINWg3DDEH5lJO9i1v/6ZLs/cZBomv1gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(6916009)(7416002)(4326008)(66946007)(66556008)(8936002)(31696002)(86362001)(8676002)(66476007)(316002)(41300700001)(54906003)(31686004)(5660300002)(2906002)(478600001)(38100700002)(6486002)(36756003)(6666004)(83380400001)(6506007)(2616005)(6512007)(186003)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHAzQngwdHZWbjBmaE5RK25VWmJmZWdNamhFanE3NUhqbXRVZ0xWSjZKdkVr?=
 =?utf-8?B?TExBdG9TMk5YK2loNlUzdzQ0VE9zUDZVY1hQbVVYZkFMcWs5VjFVQktrSXZp?=
 =?utf-8?B?MUZkVkpSNXZST3p0SElBcElEdnUycUVrUE00aEF3QUV4QkpheVBrbkFSaUIr?=
 =?utf-8?B?eHF3SzF1Vm5sSk9LK085N3NFMGlwaUlwdXZwci9wa2sxc3ZYQzNQdnRGVzNy?=
 =?utf-8?B?Yng2V3d3Y1NUMTYwVnhhbW1OcUdIaWRkSE9rLzBrVVJiUVFEUEVHMDRJblVG?=
 =?utf-8?B?NFNUV2hEYW9HRmRTRkVrM090UGRCQW5TQzE4QTJzQS94YUFOUjdlUlhxNklG?=
 =?utf-8?B?RkIwUE5yRnM2SnE5V3lyWFRtL0pWb0U3VHVPelNwMVhtS2ZwY05KNndWSVNP?=
 =?utf-8?B?OStOZy9xczVMSkFLU2x2dkVML0NBNmF5WENxbW43UE00bkk4VXVwV2Y0eTRl?=
 =?utf-8?B?R2V2Vy9nTFRxaTRxUTVUVHpadXF1TmZvbHVZcDY1ZDgramlDZi96enBTU0c1?=
 =?utf-8?B?cFY0aFZ6UjdEeU51L0hiR1dGaHFpMzRoL0MreEJ0YjdGdkFYZnNHTjdXWnVa?=
 =?utf-8?B?bTlGSmlua3RHNEpWc0YxblBTV1pqd3BzcmQzOXRMcWlTbTlsZDJqVFNSVUtD?=
 =?utf-8?B?UGp5ZHRieGNXN3hDUjZlVkVKUEZ5bHpXNWxlaTgzUmlhZm5hRTN0ckhwM3kw?=
 =?utf-8?B?WGNjdzNmOHBSZTRPNWRBMTJib3RKMm1JUnh3RlZhYWhUUGdLTmpXUXhtdlJv?=
 =?utf-8?B?RDlnbUlzd09TcTBEMkk0bE1DV0dtNGtnbXhFVTc1V21CeWFwTnowcE45THpy?=
 =?utf-8?B?TXprUFBLMzdNMWZ4NWx2MkR1SVA0ZVpxTnVrYWNibkI4bDBMamtuMzM4bXdM?=
 =?utf-8?B?NzkvWWFDS3p1MUJ4dnEvQkZ4MVhZWUJUZnZIMktjVjAza3JpSG9MRzdPRGdT?=
 =?utf-8?B?dTJCTzJSSlRHaEpEdlpqbThtRVRENzd3NEVUUXhLVlNkczRWWVluS2dBOUpQ?=
 =?utf-8?B?cklkOUs1U2M5L1JMckVnZFIxOCs4NnRXRDhhMkRSdDBUMHRsSFlzUVlnZGpH?=
 =?utf-8?B?Q0NEZEJJSlVBbHlhcENUY2lqRHlhVTJkREg2NGV1RXRIbUk0UmZkZjdRYXRK?=
 =?utf-8?B?VGlibVFQdmx1T3c2YjNlWWpTWElLcWFZZEh4aTRYU3JhWlUwNk43Z09aQ0hO?=
 =?utf-8?B?QVlkOTExWWVRNDZRd0JIYVUyMlZNenliTWZmUlh1Kzd2eDBYbHJlckJLOStU?=
 =?utf-8?B?NlhCenhycDdnekxWeXQxKzQ2YTV1WDNSaHVkQlZnY01sT3NBWmlCcEJ3NUkx?=
 =?utf-8?B?ZFR3UFVLM09nRWVuNThMN0NUSm95U3ZnM1RWY0g1b1dkbVE4Z094VVFaSnJ0?=
 =?utf-8?B?c21ZUjhVVWRIY0toaTBpajRwMG5BMzZVY0EraGgrN0cxYmpheWpqb3ArcCti?=
 =?utf-8?B?bTF5NXJmdlFIL3BCSUxwQm1EQ21yQjNtVW5uRngxb3ZXVGthNlRNazFIN01T?=
 =?utf-8?B?Q3J4M21zNzk2bS9uVXA0azl2cHg1ZktOcExySU8zNmhWUnBzaXpxeFFWNTJa?=
 =?utf-8?B?ZXJtN25FU0ltcldxcGM1cUZMRTc5QlVxL3JWZGtoMHBLekF2T0dKMFp0Zlpt?=
 =?utf-8?B?MGdLT3lTOGNOalJWczR2blJLVGF3RzNtMTkxdUhicFUrZUpIdHp4amgwUU5s?=
 =?utf-8?B?NjViK1RtS2hkVHhhVHoybVd4dDluTzUrTXJnbmh5SGhMZTFUZ2FFTzNseDlY?=
 =?utf-8?B?dzFaSW9NQ2lRbVF0YStNaWpxbnVDVFFQUFdlWFJyT3J0aTRXbm5FWWwrWnF1?=
 =?utf-8?B?K2tVcmNINXR6TXEyYzc5bDdCcFlFNVVSaEFoUmU4TDBkMWtqK3JXb3pieWVH?=
 =?utf-8?B?WCtWQ1I0cUozR3kvZEcvRW5kQzlld3NJYVB6U2h6OEVZV3UwbXlIZ2h4MTRi?=
 =?utf-8?B?Z21reGtTc04vY1h4ZUZ6SDBkTDcvUUxYN2VITmh5UVRKQmM5TExCdks4bEZl?=
 =?utf-8?B?dXdFeFYwK0taTGF0T3lFSjBJak1NR0FnY0tXdU9qYjMxb0ZUazF0RkF5Kysy?=
 =?utf-8?B?a25xZmJhaEFCSW15UXBGbWlPdmN2M1J6YngwNm9kSWNJQStLNnFybmpyTFpF?=
 =?utf-8?Q?LTrKl11QneOt8AUpkCxap//Ja?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3b6f8f-d398-42bc-09f9-08db63489f94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:06:17.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0WnIpPlZkD/mOHlOOIyle6+IvJ1UKQeZxwqRYypTcGkpdZLWP7j9rMYXcH/RiLcIMw+OF3dzZZGdlApokDNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

On 02.06.2023 02:48, Vikram Garhwal wrote:
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> Arm.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v6:
>     Add CHANGELOG and SUPPORT.md entries.
> ---
>  CHANGELOG.md         | 2 ++
>  SUPPORT.md           | 6 ++++++
>  xen/arch/arm/Kconfig | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5bfd3aa5c0..a137fce576 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -20,6 +20,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
>       wide impact of a guest misusing atomic instructions.
>   - xl/libxl can customize SMBIOS strings for HVM guests.
> + - On Arm, support for dynamic addition/removal of Xen device tree nodes using
> +   a device tree overlay binary(.dtbo).

May I suggest "..., experimental support ..." here?

Jan

