Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779270DB79
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538424.838348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QDT-0006AG-K8; Tue, 23 May 2023 11:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538424.838348; Tue, 23 May 2023 11:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QDT-00068Q-Gz; Tue, 23 May 2023 11:30:11 +0000
Received: by outflank-mailman (input) for mailman id 538424;
 Tue, 23 May 2023 11:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1QDS-00068K-6u
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:30:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b7a6c5b-f95d-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 13:30:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8684.eurprd04.prod.outlook.com (2603:10a6:20b:43f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 11:30:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 11:30:05 +0000
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
X-Inumbo-ID: 2b7a6c5b-f95d-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9PAN9vRVU5Bx8V4Nw/9xtVh05gWP6PckpLbDPSlpN3zqAFFFaMSF9RWG+BNpF/uWuNa9EjFBvuuHgXktElfbVbgANr04cO87CMr2dGWYjqgXksYqP1kygLYZ/X7hwWJV2cnnq/E6nUZ7oEKayA7wt+d4MheAHDM3JjHZYrZAi1SmMhjXkvEScn6dhnUWLT7Dae7iOwZSeuCotpbMVQ1DMW7vDQbgF4UhdJ7nqmOu58hzbxqFzsQVQULoy4Rzl1NjkunCK63gZy7qNt4/4hWsF5yupK+kaYqFcWQmWsjUFQRGtF2fNXfEd0jXd5jjiI/wHsIvACmCBt9xmkHNVUSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUyOU5lzXwzxWDwgmTXcg9sc8hmVRTtijOUrbr7KSpo=;
 b=c9VVZOpPJnax4iNT2v2I4dDqUfUjpgyEiCWnLBgQucsZ6wkhOo6EQg3mNzjQmVpg6qonTqkQ1V6zd1a/+Lv2KT0N6ivF/UOEwXuj5jp1EXZer0C+mBpuOvN3WxiW7hO5B9/c2qxeVGMy1PDkoclffvJcDs3bb4OyP0+kYcLBmZG0iSFB75JurplSefa+izyxKVILelvOtxqfWHMCvZRAguGhg3AMBlx15HLWIJW7QaLxIOZb/fySrmA2hLhinQXv+RS5PM9E6809Q7Wck77qneTFCO0of2oGgyyKccgnU7PRtMCgwlrHXH1bpNiFcs7GEEmolcW1cVHpfAbuBv6l9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUyOU5lzXwzxWDwgmTXcg9sc8hmVRTtijOUrbr7KSpo=;
 b=otTJi+eR0FIAfBpWscv5thJrjG1pOZz0Eqgh7D1+j472a9+poHIbkKUq8HpYR3PHFXhJiqb67+Vk/SKhCj1rlnkYkBZQr+gRFsVZJxA7OoTbwNIJCyGxnu88XmJ2BEHlUPqlejqD9NSXAEeQhmkhmVKWD+UzyylMlgQwEykXCBBs+qguNjS6Cgp2k7cj/qw2KUvTvezAc+2gT0/J4vrLekEC15w8KTUwsrhjkhnkv8SfmhUUAadNC+zVi8asyi5tVbNORuE9oGELZgIjEx2ZEobcXF3r/oM51FEVAlGgoAF6xj9kyEoU8E85qpnXL8RANuWUOnvGOHHgd6ttYJYrxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
Date: Tue, 23 May 2023 13:30:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86: annotate entry points with type and size
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Language: en-US
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2affeb09-72d1-4c6b-8931-08db5b810e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UvUOl0tmkf5SuPr10InfKpf04yncHaGosL+Qh1NddqXNbSOl+Y3RG5fCekzSVSdDEpMM3S/Il/uf9FDQiGZqEcDvI9wTbskSg3E3x8Dgd56XxCgiuzUFRrRqDHCRNu2hOrz3EX+WxznW7eusFBpXTf4FKzSvo7nMwMmEWNcK30pnI5BsIzfkb6iA7/2JygjRTNZ/cLH2dt/AvBuwRwrFRJtaIN4Db1/dbhdD8yNKcfT9c/9uudvG50DNObcD+sST7bkrTwLbijvRYtyw4VkMZSH1XaVC5Rg3xQZbI84jVLykHaUUFXEC4sYKDP6fvjaqHYJKr8mK/7baQTB2jMZW2RNkFHDDOOx2X/GTgIDZx6L9LIV5DcXNCa0mQo7JyKzQ8+8sO/udmGou77nwhXG1MTswBWspcVbsG0XWoBMtCjBhk25Spmp8uIhFeSimS53KKnnxYtGmrNr+jmjcwRyGV6gZ0Nq1bL8jiO6xyHRkCMgxDgK3KqFoFyDCxeK+AOQp2ALw0AgOo4FxcudEilCXo9rTp948r38ZriiDR5u29igqtDk5ossBcplDa+2xKHtyEtv5+6/AOJDeyRnJ6UeadqjpsMYzcelMKJjhqyB5+bqofbGzCG0PfTnCT5VyOhvQBJN4x8bRCfRiuJduNPdH8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(38100700002)(86362001)(31686004)(2906002)(2616005)(478600001)(7416002)(8676002)(8936002)(6916009)(6512007)(6506007)(36756003)(316002)(4326008)(5660300002)(54906003)(558084003)(6486002)(31696002)(186003)(26005)(66556008)(66946007)(41300700001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGtPWE1CbVNITUtnTzU1UlFBWXhzYno0QW9ENng0R2VwbWgvZjRBdEtBRE9W?=
 =?utf-8?B?UzRBOVJ1RWRycldzTCsvUmRNb2kvdy9DRHZDVllnb2tQd1ByNC9LbnVhK1Ro?=
 =?utf-8?B?dFYzemtRQUxUZ0V3UTFJSHFQMWgrWnBPTjZaMVBDQVZEbk5DZE5nNWF6eTdX?=
 =?utf-8?B?VzU1eVZ1Y2Vham1XR0RtL0l3ODlzaWJld3EvMzR3bEhabjVLT2t6akVDOUpy?=
 =?utf-8?B?REpKalFpa3pOQVZhUlEvSllaMi9RcVdPSnVvQW95SUhac1BqajJxcGU5TUxh?=
 =?utf-8?B?YkNNSmFCVFNTYS92djg0SWhtcEtCM2NTWUxuejJmV25GZC9ySW14SWVnb0p4?=
 =?utf-8?B?MFlzeGVTRmE4N0hxUHp6dXFUSnZZMFlGY21yd0NXSGNjSERKVTFXUkJCVmtK?=
 =?utf-8?B?N2VXT1VsbjlXQWlkRzM1YzErYW9wdU5Xc29NY2k4YTVKeUJJZ3pzcW9neWxW?=
 =?utf-8?B?ZktLaUhSS28vWEpicXk1U3NhSFM4eE5LaFhvRzE5WlUwNHJmMEVaUExpQk9s?=
 =?utf-8?B?NmRiUHRaVU82QVg3ZE9tcmt3Ty8zRlZaMWV3Wkptb3duMkVwdmhKa0dPTkcz?=
 =?utf-8?B?YnF6cVFpeW1aMC9ocVl4d3ZLWFA5RmFVekRteU1IbUN3YTBBS0JBYk8xQWU5?=
 =?utf-8?B?dnB1TzVvTU4zNjJBOVhVb2ZNMUxxTmEwNTBTSjZzWEFwZzYyTVhhNE9OTzlo?=
 =?utf-8?B?M1RBQjlaQ2dYeXVFK0ZyM3lIRTg4YTAveXVabEtXUDNzR2Q4RUNMRWpDQyth?=
 =?utf-8?B?RlJOS0lNeWlTajFtQWVSQkd5c0lORVNwMlJQQ2pDaXZGb2Q5K08rbkdvU1Vs?=
 =?utf-8?B?YTdGOG9NU01OTnAzMHp3enRBY1hXWkF6Q3JDMFpKZlk1YTBZTDV6MmdLMUZ2?=
 =?utf-8?B?T25NTVdYNktiNW5HKzh5MGJPOU5aK3lBUDhqekEzMjVQUlVXTE92MEZLdXJT?=
 =?utf-8?B?TnptdUtOOC9GOVo1M3ZidFZtK2dIb1Vzem1hdy92dG5TdnVOckVMeGRYc0RU?=
 =?utf-8?B?c0hXTTNhK0V0bUJCK1pnbDhoTFQ0WHhFWVE3VysxY2lzUjZ0dDRMOWVGU3cr?=
 =?utf-8?B?RjlFMVJnYlB5TlFKMGYwUEdZRkk0MDN6dkFaMU56MGhUbE9USmwwaTRZQVZE?=
 =?utf-8?B?eTduK1VJNzNFbi9VMzN3SWM2OHNEeUJDTXFRYmtoYUFzWlJKRlZkNkw1enRt?=
 =?utf-8?B?ZFZiV3hxaWNDQ3I0ZlREVGw0M29MNWFOQmFOdUFVSDI2KzBDZ1lkOFZFK2NW?=
 =?utf-8?B?SFcxaHVrOWROc1FZSjNGMFhzQmFid3EySWhoWjFoZHVmdW93WGFsU094RW9R?=
 =?utf-8?B?N0dmR3pQbSt3VWw1Q0Z2bDBVeWFVd2hLekNQVW1heHlBZXYxbWZUcUFaS2Nn?=
 =?utf-8?B?RlErUG1KNEJrUm5seHR2ZjJmVitiZWkxSnJoSlo3MWc5K3d3LzZQRXRIVHNk?=
 =?utf-8?B?ZU4zdU4zd3FUUjZVY1ovVW5BUmhsN2g1UUZNQ0w2ank4Q1FTUm4xcW1YbUtn?=
 =?utf-8?B?cGdSeVYvZzIzbi91QkZWTUtEejVXRGxXTHgvNDZlWjNnQ0l4NVU4SjZ3OWht?=
 =?utf-8?B?Q0g0R0c3UE0vd2cySDhoRktLSm5Fbk5GcWxhQm9HK2xFaEZtaXVlU1JkWUNZ?=
 =?utf-8?B?MThXOUtjVFdqbnYxbEsxbWZBd0NGZ0xza1gydkx2SmtlZHRIdjl6ZlFMdXJC?=
 =?utf-8?B?SUNTVFNkV2RzVDZSQWRycGgzeWJSNkpSUnBiZ1llZG5zM0J1MlB5TVNXSHhD?=
 =?utf-8?B?b1QrT1hLdVdsQURhbWQyTUc2WWZiQUZ5ellEaHpGaVdxUjBCekdmZHdybWt0?=
 =?utf-8?B?NXBlYTQxN3RKVlg3dk8waERaWWxBSWtXVU9kSi9oU2Q2T0dMUTRTUzdrdDMv?=
 =?utf-8?B?Wjc1UUJ6RUFPRkx1eUluZENmSi9IWTFzb3RGMnBmczFQc0tWNUZNRWtwRHlP?=
 =?utf-8?B?LzBvZXBwY2pJSTRzdU1aUlNhTHlmOXJSNWtmcGsvNCtGTCt3YWpSWnlmazFT?=
 =?utf-8?B?L3EzaFFCTlFvb2VwTDUwNWc5L0o0UWlYd29TcmVRMkM4SVI2azJ3UEpldm81?=
 =?utf-8?B?UVZ2U3Y1M0RYa2dwMmFUTlg2NkV1ZXZOTUpjQWdhejhuL25HbVNkMVFmNmpy?=
 =?utf-8?Q?j6m3heOq74iLoCLPOXp6LVC/T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2affeb09-72d1-4c6b-8931-08db5b810e34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:30:05.7466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUKfP5Mv2UqSL2eTHHQU76bE3BtxRqGGWyF2iHcXs9rCNb6V7a6bxF2lXTM4C5HwFHwyyScLOOxFlltfdXJ3Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

The model introduced in patch 1 is in principle arch-agnostic, hence
why I'm including Arm and RISC-V reviewers here as well.

1: annotate entry points with type and size
2: also mark assembler globals hidden

Jan

