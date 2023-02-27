Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95C6A446C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502627.774505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeWN-00013j-R9; Mon, 27 Feb 2023 14:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502627.774505; Mon, 27 Feb 2023 14:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeWN-00011C-OC; Mon, 27 Feb 2023 14:30:31 +0000
Received: by outflank-mailman (input) for mailman id 502627;
 Mon, 27 Feb 2023 14:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWeWM-000116-28
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:30:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4850fe4b-b6ab-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:30:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9636.eurprd04.prod.outlook.com (2603:10a6:10:320::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Mon, 27 Feb
 2023 14:29:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:29:56 +0000
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
X-Inumbo-ID: 4850fe4b-b6ab-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my9L38EIr5XyOfzwAweXEdhCwUty8EwZLHVCflCT/Mmiz5VE3xtMCCCkVJY7avmPpHMpY5bphVeABlG1EHvn52ibTQcqzxeI42dXxVXI5nFQkfM/BQYdNNNLgEqIz8IWkTPEpFcM3mi1FGTkLDEC8YA21BQ2X+XoR73700yRVMlpPLlPh8n5zc9PSMusA/t7oapmz+Mmkn/v8UH3+sg+NjB0T5eAvCFxxwQXzsTzL5pqhXH5/rEsfhb/Hl95wC3QJk+S0aJ5QffFmT/olwmPZ3G5nSPtEaWIYzm67yvSk27bZ/w/rzwyK8pQc9TnRu7TndppBg8Ezw70ZvkmQqIZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8Zed6N2stI86YmYnkXPep1D1Ny6NPk7wNNmHzXRReg=;
 b=B97/0j3Li3+gclWQBCe0A9GGSZ3FBQ8osgdb7OdsNurYutrhGsnGyixE/Kv7BZ0PB3AD+0XBnhSreAVDZzEFi3T4REL3Jb2L6TDd+tvw2gI0EYhP4D3izjB+z1XkcANEt2s71DvdlnzGDetvyu6VDMj1vuYrxgdCPwh7fuISHdkUovBo61RpXsLciFHk/2VpGIdHB9XeJQMh6H5hu+7TuJpHW3yBGlHOcuogncNz6nwkbD3EgfNjjDImMFH9RvVqzn/h5cNKa0O9yP7eLS+vr3xbFE03nSUAqL8KKujNY7QEuoBtrQpl61SzClatLjBkTcqy1LZXPOFXVf7XPfPzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8Zed6N2stI86YmYnkXPep1D1Ny6NPk7wNNmHzXRReg=;
 b=O4iUQSNL8+JJV7yNuCG3gnS3ZMq652mfQ87a8amyS4NGaxfJcO9uqQMJaQ5CKHKChaP7IC9enZk7OtL1q3k6DhPqdkC4ZEtaZqAYxjIL1/KR6IeL95YmWOUKpFJbVoJygvsm0gcT/wzpCFvuMdFXVl5ylJcO9Z4PU5jXWwJa5C5iwRC5iRATGURE0JvWScjCvg02UA/tINj2aV4reYqe5NbMILIkaERCpFCUKxQScyjmlA/tnFGk/5tWyz4+TaMppCwh9CTnM5E7hcpT4TpV7MExplRNZBwsKi0cjbeW4MLYtZ1ac4MD2U1NEAKkUp3+n3CQtCFm6Wkvvjj+GcRB8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b6fa456-4653-4fc0-d777-985ee217954f@suse.com>
Date: Mon, 27 Feb 2023 15:29:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: a35ee977-8f91-425f-c1c8-08db18cf18e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lhr1ahwuvc/wOuHK9rQmxbob/1XRakzK1dm8cz6v43uRbOhuI1hDp2f4ARkdG7gbADmQ7D3ySNiHXXpiYNXeNyoOz3AAL3dxE8DyKDh61mDORGkfMZpnHc0+UOO2PrclbJw27Mrq2pgKkbcb7PeulWWsUWCyTSv9SUqpBqve5Tgd7HGeiOJtQ7QZwa9B9Ub4gerFHMgBOxDuRFLPRzNk+t/I0VqGokDJT3B0XdwjpUu2PCNihKeHPbkNeRV07g8sSxAGyibSwH5fxwbcb2nqXVNr5+xRGXOZ5qCiBRBogON86WVrC4ocwYVwz8XOtEKRliTUwca2K+SGWMsu7wd1Lyw4VCFLTmPVsKe4tZRN6B0gXb4vqSXn/+T02bv2s1p77SNK/xF+sOJsnj4kKsuATWVdMBQTI74X6qXK7P4R0/RrfFfYzJyl/2f3GAnJ/8htjMRnOIBQDxPgcIamPNyx6zVTe4vyrVzqFwAgFuV53TsDap/apkIpd9chvIZCtaCI99j5n9umOq/4YBPNjr/wfqdr2Tr7mec7vt1dem3CdWWhY/gP780iBhqR6VQ2zxAfwPJY4x0OFLqpdmswqQrAi+3BBYDEx/5FouvPjG6XFDL4+xF8N0huGVzHGz9CTOSH5MRYAq8kXAyIs+ERSk91nhPGViKYp1z0Bkgq1pplDVD5u5Cqh012tvEg3qkgWIIH5qFllgD0DWC9Fr8GrLQIUI1XnO/DYhJVC5INy24MB14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(7416002)(38100700002)(86362001)(36756003)(2906002)(5660300002)(8936002)(66946007)(31696002)(8676002)(6512007)(53546011)(186003)(6506007)(26005)(4326008)(2616005)(316002)(6916009)(54906003)(6486002)(478600001)(66476007)(66556008)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHlTNkpIalp0TGRuZEVhd21oL2ZmWVhrVkJRazdxWDBtc2xYamFoYi9SQVhX?=
 =?utf-8?B?a3IvdFgrV084Q2NZQmtKaE14YnI3T1MvZ01nOGl5WWZzeCtYS0E4QjFvR29h?=
 =?utf-8?B?L2NKd0s1VjFiOFBVdzdVdE9VTVVoMS9meGQzbFByRDZYbWtKMks4eExWdDJM?=
 =?utf-8?B?MWJKaGlPYkExdUxOUnRQZnBaZ2k4OWVXUnhQV0M3c3pFWndSZHZiSGtBazFn?=
 =?utf-8?B?MHVncWNrOUNsRzRCTzFpZzc1aGszRUMzd1dvRzBGOWF4R1BleC8xcGs4WGlI?=
 =?utf-8?B?bXo4ZGs0NWJZcnhLK1ljTjdCb3hYSXdMK0pIN0tmUUtRMU9LeTJYY3R1ZWph?=
 =?utf-8?B?d3NYNW1lSnJTc2l3alIvZXZkRDZwYjhObWN5eUNsallpS0pjVnl3VnFYYVor?=
 =?utf-8?B?Ti9lOUVHTHNSSTBndUdROVZndjE1MEFWL2c0ZjVSM1pjLytyMGxkbHNWRDNr?=
 =?utf-8?B?ckU3amdSb2lKMkVtM1BHVlpZL0F2WFdmNC9IRzZhMHJFQlVZVnhkRDI1MkpH?=
 =?utf-8?B?MnNjQ09sK20wcU5iRmFqbDlFWUlaMWNNSER5cGNCZ3FGMmVmVCt4N1gvYmsy?=
 =?utf-8?B?RVNKMUlqNkxJS21uQ09na0FRM1JOQmtHa085VVVjUlYvUDhvQmR3Zi8wMm9H?=
 =?utf-8?B?Y05EUXRYM04xMVlndUJ4THFJUU9mSVRyZkh6K1Iya3pkWVhzTjdBZ1V2RlBF?=
 =?utf-8?B?TnYzV3ZWbFE2TmFBVHBndHVMTEp6eDFETmdxQjQvR1dZQVp3dnl3LzFVZ0NU?=
 =?utf-8?B?R3FxcVhVWnVGNGQ2YU1USE1KVjNpbktQV2hRWGkzL1VLQUovbEpyV0ZYWU1l?=
 =?utf-8?B?andJWFVLRXdha21vWUZGMXFyZHJSZWtqcjkzT2c1d3V4bUh2Y1ptS3M1ZXJr?=
 =?utf-8?B?ZWFWd0NnNWZaQXBOLysrSXZoWm5FN1I4TmlsWjhmblJMeXVvNE5ZZjBxekZR?=
 =?utf-8?B?TWZ2dWhMeHgybGxvWTZtRjJtZkRmTTdTaHVwYWdicUx6YlBCWDBRTTQ0UVkv?=
 =?utf-8?B?emxoL0cxVk95SWYrOHBmcEFJZFFUSnZKdkpCZFFRWWlZcWdKTmJOZHBhR3NJ?=
 =?utf-8?B?bTdOeTgvWkgvMmhkUXlFWm5zM24rNHFIaG9BTGVSVTR2a0FzRjBzVVJMRVlo?=
 =?utf-8?B?WElKTEowcUVFNnJndVlpUG1HU1psY1pTWTlDY21mZFQwR2RXaTBmbUZJc3kx?=
 =?utf-8?B?VWVPWXMzWitVY3FMUzI3WUZIbkZMTTVLbnN3U3VnOE9rd1E1azZsNndRaktF?=
 =?utf-8?B?b3JvVTVTZ0p2b2ZUSzgxQ1ViZnVuU1Y5NlViOXA0K2NzTW9DMENHRmRjZnJC?=
 =?utf-8?B?dy9tNTFvcm0reFBuOWFpU20yWUFBcnNlMVR4RzdvdTJVcTRLZTR6L01CQ3A3?=
 =?utf-8?B?MFNnNjNZeEJKcFRMT2J1N01LZ2hWQkRiUDRHV1ZwZG5JcTlHYjdGSjNYaTJM?=
 =?utf-8?B?NEkzRkM5UlNKRklPQlNrUUdabGNIaFVXejVheGlUMVZsZ1pzK051MnR1V1VT?=
 =?utf-8?B?azdrcjlncmtHV2pYeW1CRXYyTENwMElxYVhVNE5tUDVUSXU5YkFXZmxmWWpZ?=
 =?utf-8?B?MG9UTW1ycTUyQkRTeVVwNE9uRGFUQ0kyYVVteFJIZzdpeFdrNGo3N0gyZU9k?=
 =?utf-8?B?L2YwNGxZMEw3Ri82MU95TTRLNm50RG0rUzhLcVNRSXp2Y2R5ODkzcXhuWk1i?=
 =?utf-8?B?Z0xCblhnaHZTcCtsVjY0ak0wQzJoQ052WWRJbmowMGI4aWVsdWY0VlROaHMx?=
 =?utf-8?B?WFNJWFZ4SW15eVhyMlNlWW1CeGNOV0p5cUtMRGZsV3MwanE0NEluNmRGTXJz?=
 =?utf-8?B?U1N2NCtmcXFodDY5L3RkblVHU2YrUkNPT1lJcTYxZHRudDYwWFV2N2x1Nk1S?=
 =?utf-8?B?NldCY2dLMmdpQnRheFltaEJ6eldQSnJCTEFkVm9aRitETDVhdlJuWExoc3pk?=
 =?utf-8?B?QUxFRWMvcjdhbWg0dzNnRFJRczgyT3puWkQ2Z0lXUzhVT01SUnJFMm9raU4y?=
 =?utf-8?B?WEx3U3FMbnBCQUdyakNMVXVsU3U5UDlRRjlNSHUyQytXZ2J1alZBeUh2RkRB?=
 =?utf-8?B?Sy9WY3dXdHNtRXVLWGVUdVVtS0h5azIxc0xzSUhDUWZsR2NtVXJTYTRUNGU1?=
 =?utf-8?Q?uoI5HKnuHXnn81fpwYWj9eBC+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35ee977-8f91-425f-c1c8-08db18cf18e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:29:55.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofola8TpTsJ4J46lU4hWeq7j2ns4iYrl31hUhw+r7tWt/AiInSBmyvKrm9v+OlFRrWsNab5mg5pN9GnkBFt+zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9636

On 24.02.2023 12:31, Oleksii Kurochko wrote:
> Since the generic version of bug.h stuff was introduced use <xen/bug.h>
> instead of unnecessary <asm/bug.h>

You keep saying "unnecessary" here, but that's not really correct.
Including asm/bug.h alone simply becomes meaningless. So how about
"... instead of now useless (in isolation) <asm/bug.h>"?

> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -1,19 +1,10 @@
>  #ifndef __X86_BUG_H__
>  #define __X86_BUG_H__
>  
> -#define BUG_DISP_WIDTH    24
> -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> -
> -#define BUGFRAME_run_fn 0
> -#define BUGFRAME_warn   1
> -#define BUGFRAME_bug    2
> -#define BUGFRAME_assert 3
> -
> -#define BUGFRAME_NR     4
> -
>  #ifndef __ASSEMBLY__
>  
> +#define BUG_FRAME_STRUCT
> +
>  struct bug_frame {
>      signed int loc_disp:BUG_DISP_WIDTH;
>      unsigned int line_hi:BUG_LINE_HI_WIDTH;

Why would x86 continue to define its own bug_frame (and other items)?

Jan

