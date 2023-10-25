Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057817D664F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622734.969827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZuT-0006bA-67; Wed, 25 Oct 2023 09:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622734.969827; Wed, 25 Oct 2023 09:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZuT-0006ZS-3A; Wed, 25 Oct 2023 09:10:41 +0000
Received: by outflank-mailman (input) for mailman id 622734;
 Wed, 25 Oct 2023 09:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvZuS-0006ZM-80
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:10:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb3c5d6-7316-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 11:10:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Wed, 25 Oct
 2023 09:10:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 09:10:34 +0000
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
X-Inumbo-ID: 5cb3c5d6-7316-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAkwbw4tOEhdgYJU9WZ252S44BLhAmumEIyINYz7s4opHSC4GU2X6Pfn0UQ7R2L73CPIDQsOM2zPuUBXfwdY9E3B2m14Xoh7Tnf2RIzWdIA58c1EtMCAXjm0ynd+fu6FcHKFWxM8AtyMysC8yOybBwxs3L0KCItjIGa87DKyqYuUAQUe+DnOCq/1I9V6U5Xwlv2I/e2f+iHpA4OVd6fSJ2sHSqluiQ3l6zZAQN8nOFIL9c0padAfKAUnOrxlfiQmnGIJ50Ag+c5wE1ykwXT/YnPHlYW4kakokSfPw/iVw3isIZXAe5XaTVqi+I/CV+NGT5w1PgtWxbYw0l9B433/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLyhuqfG3K26sdi4WRteel/HdL17xlYkKTFEfqVH4I4=;
 b=octZMf68ifENgXh8BuOkAIQZqpRQiJeWCiYFsqD4jyT3sJoBrUAfUmkEx/MZ8IiRMCYzeTLMaB3iLI+HOVbSt6A+aKcnu/Bt5tEbeoaAx1c2+XI37rdLD/PVt7uLvBugplCOvngpH/KSRmq2dROCoVa5qy687esRMkiwWdU1U6qqHGdrgfZAocSrufgYyouY7Th00aNENr64ndF8qgdzadU26DA7TQ/lqP0/A8PH4jrkKKbnQU9hBfINxw+tHb7itEy+IVN7stG1FsitL0jZaSd69u4RR+kDmcOx0WB5xS5MO9nQcSnkKUUtDRDFiNtF0BTkZMqrJLCQlWmz8OnmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLyhuqfG3K26sdi4WRteel/HdL17xlYkKTFEfqVH4I4=;
 b=ZEUFD74yURwQcH/6tRUfroYgqZDY55b9DK3Yzpep+y3XUXFIri7oCmFQjgUEExzItt/NNX1Io2NlujLvcdil5tr/tdUg5bd69uwJtmbQ3ojcaJ5brerkDASF+KnYxcvrCWLFZHG23VzO9C3xEA/fMqaGWd7owiLaneEJ7LXSfCJh13n72yvcVN1zYb/M1EXKDPURkimW88h3QDba0kVPOo1jP21OiJ5gj/OvgfOOAY6IHens6ypikEwng2X/xXeVp7GaQ+DcgrfUyfZPk3Ta+mW3ArwHLlJNngXPIhF80BXiS70efPmEKnaDpeR57aqrcDHjDl5F4qXvPFUgRqBPzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
Date: Wed, 25 Oct 2023 11:10:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231025082834.31680-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231025082834.31680-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 01764bb1-dd44-435d-1874-08dbd53a3f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DKASpPoTBNNlMuiSrBVTDM1pr6SLnfWrRgZc8aTABFN5NdD38MUYNQQFSTAGIPfeq6Joq2T44ZMkH+iUVP9hGJ4q9Kpxg8cFaj/gCUFpPLyo7XnoO3y6dmToToiPuPZWT1W6TcF9/LjawPsMT7ixQ44AF6a7pGAljjbrWDDtFaxvZN0yEQNd326Ro0+oevlAtiHjbWEGAJeqf6+oJZttWmgNVGuaq5TKc/NjqGnB9myAAfydlp/+wgiX8MVZW+VCYa4KoJFzYUCSpXNFDOwLtkk+LQ3o26dmDcR7SUTC+Mn2nF7Eh6Kn1v5m+kDvy5HLbkISJhRBl54JLBWl3eQeuzUafJbKMqJCepcUQWCrOrBxzQKxHm8KBgaoB/KDuan3tRH0AkPwXal42t8koivATLQmc+0bpUH33S9ngpp5nsgn/m+p0qQL/a/4rox5Ka41ncGLB2xjO4MKQhPBzKMLnDbxONkasRQzd4+HRJIDG6Xl+osSKXTrz7qug2qMnLh7YrgfTdop/h2ymT6P0drDpckV10RFI+Ag3g3M997oKttxOHVNLuyrtvh44RUvjDUrxnmcATfNxxwQquwHGDJNTOym7XJ7fnpMM7bFzCppyok8mdTkdH0lf4AbcMspMBmQMsDqCVInQ6m/ff0izd8poFvWCcE15jho1/HFBaEPizm2Vw0ptpNseAoJyzqQ2mcl2jKVu+EO0g22PbSl1PUyHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6486002)(66946007)(66556008)(54906003)(31686004)(66476007)(26005)(83380400001)(31696002)(86362001)(36756003)(38100700002)(478600001)(6512007)(53546011)(2616005)(2906002)(41300700001)(6506007)(6916009)(8936002)(316002)(8676002)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xZYTVWWDRrd0N5M1h4VXViUGFtNmlEa3RiY3FYN1lGWmlqcUx4MnhVcjlp?=
 =?utf-8?B?N1NRQ1BhTzcvL0FUdmtOOEh6N2t2eWFsb0pTb3BqTm80NlR5ZmkvSTJYMmwz?=
 =?utf-8?B?clk4MFdIb04yaUFGSGhxNjlyU1Jid1ExTlhxZlI5NGF3L2dzelE4L3BwMHI5?=
 =?utf-8?B?RzBLVDJnZ1JhTnQ1VGR3MzVVVzRkVzFqSk1NY05LNTN4Q0g3d2pTcFpOVXNV?=
 =?utf-8?B?VWorb1krZW4wcUJWOWJDdHZsVWNGYldkSFdZTlVBT29EVGh4Q2xZTldhdXg2?=
 =?utf-8?B?RzFpWVBMSWZMcnFxbTlONHc3cjkrMzFITVNGWUE4ZnJFN2tGQ2lrYmFGdURo?=
 =?utf-8?B?ck5tenB3SlZpN05IdFhyUm9MR2xrUU1JVHFlSWY4Znd3c3ZXTkY1QmRwU0pZ?=
 =?utf-8?B?dDNSc0FnRVRZU2EzV1hMMTE3b2RqWEFDNFlyN1ljYTVWbDlSeTRWU1JqTERK?=
 =?utf-8?B?UDBlR0lIUDhDbDcwcFVMQU5KS1hUbFRlSHdLaFphdS81clJVa0V2RnlwaEpP?=
 =?utf-8?B?WEFoZjhDaCtpZ0VMM3FzWEFwUkJ6eWNYQ2plVkxRWUJCNWJDQVNoaVdDKzMx?=
 =?utf-8?B?VEFsTXpBai9UWjFZMjRTelNGS3BkUUZJNlNWUXNFT2VpNEZYeFZFaFF2eits?=
 =?utf-8?B?Ry9hODdzVi9ZeVhqbWk4S2ZRUU9JcUhEdzJXRjZlcG56aENYeERscWVodDFV?=
 =?utf-8?B?VkQyRzFTU1grT3FGblA5WkRiVytqOTFFUlhzc09ZT2lmS3RVQzZXRUFLTndM?=
 =?utf-8?B?MWhuRGtRbnk1OU1Ia2VKdEg1OEVuQVgzWWhYMlhRaFNxSEZBbXRaa1o0cGgy?=
 =?utf-8?B?Z1Y5S1hJemJsbnVOa0YyZVYrVCsvZWlNbU9sU3dXbmYvcmt3eFNBbDRZazFo?=
 =?utf-8?B?T0JhK0h4Z3pwK05Eckd0QWZUbWkzUnprMkw0dGlkbEpRaHlNcEcxUXpzdDFI?=
 =?utf-8?B?SElVM2pMa1V1eW9DWUxOSWdtMmJZSHdxK2hWbGxuMDZpV05SaEFraG9ybnJm?=
 =?utf-8?B?M0Nnb3pHS003S2g1V0hPekxLOUk4aVpCRzRXMTlacS8zaTJlWTVTN3N6aXpG?=
 =?utf-8?B?aXU3eE1RTmFVSCtWNzlzQSszY2pLVXFOTHZGOUMxYXlWS0NueDQrV2NLOCtT?=
 =?utf-8?B?UVdWVmpEL3dERjk3bmpRdnA0S3Fpakh5d1hId1BDT3JnRUxwbXlKVkR0bWZD?=
 =?utf-8?B?L3gwYkVMM2FYaXE0TWxTakRCV1dZNmtFSGwyZ2tydVh0MHFSYTBsTzViSmFL?=
 =?utf-8?B?NWdUN2xVc2kxM1U1eFJGS2dLRkxIdTZ0NjBrOUlaZHVhbVNmdVJtc0VIelA1?=
 =?utf-8?B?REljOXVXRlRGK0h1cnc2R1dERE5aS1J0R090VlVGblBwa2QzM1ZKUlFoTTdo?=
 =?utf-8?B?c1FLYU1INzVKa3JtMnJHRmlHU1pzMjNNcXJ0VGdUWEpjRkhPU0g0SHNVS3V1?=
 =?utf-8?B?RDlhUlE1WXZ0NFFiSjFlQi9zcVZ2OUVnSENodWF1cS9mUXZFYzNneFZqQVV2?=
 =?utf-8?B?dnZlNUFkbFp0QnhuVllBOG9kMjYwelBzOUx6UnpYZVNBYXFFQm8xR21hL25x?=
 =?utf-8?B?VDVlNitQUHJJbWYwUzVLSDdTeEpoNUI5RW1TYVpwMHRwWnd3UGxmRVRiYTlm?=
 =?utf-8?B?QXpleFlSVlpnM0EzdXFBKzYvTWNYQXh3a0pjSjY5SG9lalFtalVFdG1qN0tH?=
 =?utf-8?B?NTZzUzZHdXkrU1RrTzQ4OEJBaDZzZlJ0OWRpcWNaMVRvVmljY1ZWb1F6RlFN?=
 =?utf-8?B?MzJ1VVJ5RklJak1JRUFhU1JaL0ZUanVXeGc3UjdnZlJza3hHcERYblFzNnNt?=
 =?utf-8?B?WGdFRVAwQzJRcGJRbG1ESHpXTVpNU1ArUEFsazRrWm0xYklPQnZRWWh4b3Vz?=
 =?utf-8?B?VHQzVnArWEY2VVd3Z0Q1bGVOQ1Jpa0E5Q3pEWmJzMC9RZFdmSUNaeEt0WGVG?=
 =?utf-8?B?UFczVW56SnA0aHZnUHdIRkI3UjV5QkxpYTB4UFE1NUd1b29WU20rU2pqRGNX?=
 =?utf-8?B?ejZWR1h0QUxrM01BS3NiME9NUzJSM0YyNCtpM1IvZTE5TStkTW5nZzNXSk5j?=
 =?utf-8?B?dGkrSHA5WDV1NDExZ1RWVUUyclA4L3hLdTlrTG1GUnE5NFlta1NhNXB6bkg5?=
 =?utf-8?Q?OK+wcxURge8VbWPa9Rta6KRnw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01764bb1-dd44-435d-1874-08dbd53a3f0f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:10:34.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P/vVmCDYb6S9gaoOIeEi99ngNWjVXgMwgnZq5vE9U5q88PyDfzS9RhzxHVW3+FWkzIhAfQZF8WCRw/Sh3FcGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7402

On 25.10.2023 10:28, Michal Orzel wrote:
> At the moment, in order to use a different defconfig target than default,
> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
> Switch to weak assignment, so that it can be also obtained from
> environment similar to other KCONFIG/KBUILD variables.
> 
> This change will activate the use of KBUILD_DEFCONFIG variable in CI
> build jobs that so far had no effect.

I'm certainly okay with the change, but the above sentence looks misleading
to me: Yes, the envvar was ignored so far, but isn't it the case that the
envvar as specified in CI matches what Makefile set it to (taking into
account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
hence the specifications in build.yaml could be dropped (until such time
where truly an override was intended)?

Jan

> Note, that we will deviate from Linux in this regard.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> In case of reluctance to this approach, we can always do:
>  make -C xen defconfig KBUILD_DEFCONFIG=${KBUILD_DEFCONFIG}
> in automation/scripts/build.
> 
> Also, Linux defers setting the variable to arch specific Makefile, so it is not
> sth mandated by the top level Makefile or documentation.
> ---
>  xen/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index fd0e63d29efb..40feefff4ab5 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -256,7 +256,8 @@ export YACC = $(if $(BISON),$(BISON),bison)
>  export LEX = $(if $(FLEX),$(FLEX),flex)
>  
>  # Default file for 'make defconfig'.
> -export KBUILD_DEFCONFIG := $(ARCH)_defconfig
> +# May be overruled on the command line or set in the environment.
> +export KBUILD_DEFCONFIG ?= $(ARCH)_defconfig
>  
>  # Copy CFLAGS generated by "Config.mk" so they can be reused later without
>  # reparsing Config.mk by e.g. arch/x86/boot/.


