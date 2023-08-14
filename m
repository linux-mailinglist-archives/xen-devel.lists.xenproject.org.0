Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC8B77B2AC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583272.913401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAt-0006VO-J4; Mon, 14 Aug 2023 07:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583272.913401; Mon, 14 Aug 2023 07:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAt-0006Re-G2; Mon, 14 Aug 2023 07:39:39 +0000
Received: by outflank-mailman (input) for mailman id 583272;
 Mon, 14 Aug 2023 07:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSAs-0005XG-BF
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:39:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7fe17c3-3a75-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:39:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:39:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:39:35 +0000
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
X-Inumbo-ID: b7fe17c3-3a75-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ0xV2O0NUjL51cvUAdElafw8lsbKYFm+lbdceLon3qdh2hDGwlyYmdNmKfkEtkmBrJKXcfBj8awxREB7QLa0hjYcl9YLdt3235XTxsWW+GG1w/TBa4rrSKXzFHqZNKsYGi9oNVdf/3JClU0rZRTJRwpgfx+u4BOjGsPzxGzFEir7UpNoomWFh46qZjp8Cw4wRFLVh0OEoEgca0aTqtTOqi9pcziUhmQzhBKAHJ9A4ETUnQOZChQvzw9IXTOXn+9cmvrsY/hSyyR2u3rHgnEBIM8FvzxNMkbaJcnsV4tBWjyMZP1X8Xg17QMot/K5VctjC+26LQ4w1IbWHwQs4KTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHMmXQiXK3VPcqOHK5IUv7i4D+GNTUfg4/6TvJQGonQ=;
 b=TEvI99gufexC/5SubJ+/MQ6hqKUMvXKbuKAwkerTXL9yxCf686bLyAvHysqd7/krGMWJXw8d+TUh6Y6egihAdUtDdZvZC+vfP5yNkMAa5n7i9u20P9DKgc+/WvP1uxePhfKLyOn+Pj2kZww7QU9D4BMGzAnAeOjO1eMUdtXrA9tR7DHjUwFBl5DZD674EuuNbL5wISTnpVMzHBU9TOhKC6ggYBvbWtjw5br/uOxyhYYh8/Pzv6XXAToAh7vX0Esp1kWv0TY12Sp1GvB7sRiPXC/y6xjizHhF3hFO5BzIQHRS8U5oVgektmLpMEeSKmkedbUhhGK3X7SZ6y5n0Y81uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHMmXQiXK3VPcqOHK5IUv7i4D+GNTUfg4/6TvJQGonQ=;
 b=HrcXVWMHSbeyJKpHnWsQC8Z+xPU5OJwZaL5msObfO1dF3W5DptT6J232TkSkhpDMo8aXrnPsGWXViD+hvdvCGNxohT1xPPp+PXpd3dtc9XxnyWfLHXfPY+7yDnq+b4jPo4DgUEJxnG8vnWhjzU9Ob/te918sRZPup2OrmyU6TJagkmBHSuAgvcc1ZvtImUzKGvhCzKyRl5XEKNZ0E69ZWvA9AFlYQn0XEX6XhoD9zazSa6cCJgNR6J/UgzHgcYthXsvLIzeshXEV5io/etSJRFc9EkcQDcSPlHH7EA64UShQv69w7FAKsW7uKA17/aax6kKn0FjMFKcq+Q2IlbD04w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30d1ef98-d847-b0ca-6771-4bc0abcdb214@suse.com>
Date: Mon, 14 Aug 2023 09:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 86688577-4d89-41b7-c4ab-08db9c999b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EghHSwCSAR9/nNunWCAL042+/JDDFC5xA0R2i/pTrFIJ2SIbm/ruUupf1Dv71v1DgKZAVrfnVi7o9ONqAoedwQ7QH3gJ/0YmxohBVLnVRpK7Zt0SwS84EG4sFW81ne+M8VR43i0P4uIaar/af+I/pA89NN8Ctp9712SgqFP7VwSo/XWssLsb0gdrgTJhzvg9dLGCNVlFicddaxqW6ciAxFZRIdvk+7+/R6wnt4k7Sbm/fFBSsuDLnxzRX4LX5ex0VhR7d6iL+iIvUY0YVjalKcHA7I5MKqrNXnmU2rmlnsaR7ZtO7IaXKl0fdatUbToAO6GxHcYAefzKmHAFq8twX3BEVDYKWI54TeJ06QSwwshVZr3HE4ohGQMifVCcgnbM9ea2qP34lxN9bKfjhaDOxhLB7p7/9MJbuTIoRYbyk7XriRhEtDmXIBrnnmw5cIXsklNcX4BB2NWkA0lSWcu6qpSNJZ7nWciS/z6aoxisk+cq1EuwYXdZDs1SmK3Dd2zMxz8Cur3V2fV7eTZzdyFsGCYzsFlEROBFJPJMXtwyCgrLEVZUrR2kAQBhTl81xw7RTUxZgQJpVfR/qdTZMoCxjhAV56Aj3+f76coPcY7AD1we4tAbnKzMxaE4e2yxV0UH/Ttm+26iYGh0W7xngT1b5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199021)(186006)(1800799006)(36756003)(5660300002)(2906002)(31696002)(86362001)(4744005)(31686004)(83380400001)(66556008)(6916009)(4326008)(316002)(66946007)(66476007)(38100700002)(41300700001)(26005)(2616005)(6512007)(53546011)(6486002)(6506007)(8676002)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmlJQVEyWFJsRW5sbFFuRkNucUFOMjVvT3h2RUZaSlpLd2haVUdQc0h4ZzU2?=
 =?utf-8?B?OGJWeTFMNFlNWVNZYmxvRzlNeE52bXBNdG16VWgvczB1OW9DLzBubXlVQ1dl?=
 =?utf-8?B?YzE2a3FXWHVuM3pnRjhrOFVXV1ZwNU8rbmZnSlFVQ1dKbHQ5eld3UjROOW1Z?=
 =?utf-8?B?YzdlSHlxQlVTbENKaThYOVlBZW52RGh4VGxnNmdNUDJ3YnBQUXJDUjE2ZnBW?=
 =?utf-8?B?T1didnNvNTlzd2dWU29TekErdUY0d0dLMWVKTzhOM0hWdHE4Q2lJMEh2TnUr?=
 =?utf-8?B?MnMwOFdiek0xL3g4bXZsQlVvV01xZUIyVVg3eDNwYW5tRG9oYklqVXBMRWph?=
 =?utf-8?B?REt0ZFA3MGJ6b21icnBWNU83WmhVQW9yQzRETDQ2UDhwc3lwRXNtUER6aU9l?=
 =?utf-8?B?bFdmWkVxWVVyNWwxVVZqeWZKTExhdXFpZkdVcnd1RURNbjc4bG8xZWVIMnJC?=
 =?utf-8?B?T1pIQnRTMFlpckdwMG1qdGVtREV3c1kya0ZJL3UxWFR5eGRxcklkMnU5ejhm?=
 =?utf-8?B?d0hPMnc0SEVwZUZtMzBsRG11VEhLcm1FRjVYa2poaENYVUFjQTRGMnd1Nzlr?=
 =?utf-8?B?NUxVSE1FcHYvSHFYU2lVdTM3bVpwSFVjbnhUNXBBdXppc1hpNlNaWkdsazN1?=
 =?utf-8?B?WjZPZjZnREthOVpmVFlpUjExcmp1Y2hCeHh2cytwcmlGbWY5WDZFUEFXamF2?=
 =?utf-8?B?bGVNd3BnMFh1S2UvZ1ExaXFxUTkzc0NxbGxsbTNtaG8vMjliZzZlTUxJbno1?=
 =?utf-8?B?VWxVM2kvM211eG5hOFJmOXdUYTJIV2JTVGZWanRSN1JEaVNtRXZZVThyNXVB?=
 =?utf-8?B?bmwxL0pCb0J1RFZ3NnRVd1JoMHZvSUNzaEREZW02OXFFZ3dXUyt0bUU4OGNl?=
 =?utf-8?B?bW1TZTdmMnVGYXIrdDNJSDFES3hQK2dTRXBnUU1BVFNvQ05PYmZZNy8zKzZX?=
 =?utf-8?B?S2hXeDRkQUQrVjNudEQwUWpsRktTU201L1hlT0tlL0QyWlQxckhhS1k5M2ha?=
 =?utf-8?B?c2FqV3JpOUNTbXREemR5VlkxVFd4OGg5QjEwOUhSaUUxc2FEM0w2Tlh5dDFr?=
 =?utf-8?B?R2pCemFjNmo5ZU1lTnFWUzFvZ2FraEFzWTRoektpYUt6R28wb2ZjdW5PWHov?=
 =?utf-8?B?aHExK2V2cTdESkJTWnYvc1N2QmFrL25tOUcvb2pYNDA4bjNMVjVlZlRoRUhl?=
 =?utf-8?B?N1RwSGt4Z1ArR2dEUDVNQjQvNlVLS1Zxa1g5T2xuT0tmUDlleHBtdHhIY1VY?=
 =?utf-8?B?QVZ2V3YvVUV1aHhwYitxNWJ2L2J3RktrZzQxaW1SNnNWeitIeTR2bmExNFhk?=
 =?utf-8?B?a1Raam9HQWhqM01zMEx6Y1dyQ0lmQTVpQVMwcVdHdUZPaG9vb1ZId3l1T1E0?=
 =?utf-8?B?VGJ1em93UnVqaldSU1p3VnNMZkx1NThjZ0JUV0FyN1J4d2tVTzlFSWsrdldI?=
 =?utf-8?B?anRLOFZKcTErY1Jkc0k4YWxsdGxHRldSeUJDdEU5cTYzb1JEWEdhbVA5ZkU3?=
 =?utf-8?B?bGk4Skw3cWUzS0k4OVFwWUY1b0VnMlcyM2kyalhvRVlRYzg2eEkvSmMvZEY5?=
 =?utf-8?B?YlVkU3R3czB0RmhJMEdVejZDY2JCMTlLMlJUcFBQWlZMeWFSZWt1SElBclBs?=
 =?utf-8?B?d0c1Zm5xYWpPNDNKdXpSTDNiZXNZekNrVjRRRXFhdkhNTE96dyt4MGc5WDRK?=
 =?utf-8?B?WFVQdEZzc2lTRTdPcm9VK093eDQyd1l6MFdqdkZEcXQ0eER1RTg0b2FJVGNE?=
 =?utf-8?B?UFlIdllTRVN5R082bnlJNEZ5MFlzMTF6V3J1MktFS2JqSS9sYm9zcmtURDJX?=
 =?utf-8?B?MGpUdHFTRENEVFp3N2ZWWFpMZzNEeCtoaVJkQnVweG9TWlVuWmdpSDFFZnho?=
 =?utf-8?B?d0VQUjA4K3VlRkZNcTloMXhUbmZ3aFdnZVJmMXd3SmNmZ2huQk5zRXZkYXlz?=
 =?utf-8?B?VXMrSm1SYTJ3bHFXbXpJYzJ2OExCN21LTUk3ODQyR2d3cGMrcmI5d0R0YXJ5?=
 =?utf-8?B?Y01EVXhXaE8vZzYxdUVyQk9YcVo0RDB4OGpTS2dmNm82V3BqOVRDSU1NKzlw?=
 =?utf-8?B?YkF1ZXJKeUk2SHZnT3l0SStLVHRNZjQ0K201UFFDcmtOTnQxWEhOS3VIUWtp?=
 =?utf-8?Q?MT6Kf9DrEhusXJ9JVX+a0l5Pk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86688577-4d89-41b7-c4ab-08db9c999b95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:39:35.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKAkJt/De7xTYQS9emEdwecA+NAmkEB6cBJuLCu0pCysrmWPH/IptE118HWQVRxlAzkoVhYP197L2OuaMzP30A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

On 11.08.2023 09:19, Nicola Vetrini wrote:
> The missing header included by this patch provides declarations for
> the functions 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
> that are defined in the source file. This also resolves violations
> of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs and p2m_vm_event_fill_regs")
> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
> Fixes: 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")

It's hard to see how it can be three commit here. The oldest one is at
fault, I would say.

Also please remember to Cc maintainers.

Jan

> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -20,6 +20,7 @@
>  
>  #include <xen/sched.h>
>  #include <xen/mem_access.h>
> +#include <xen/vm_event.h>
>  #include <asm/vm_event.h>
>  
>  /* Implicitly serialized by the domctl lock. */


