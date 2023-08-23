Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59A7858D7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589225.921040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnib-0000Ga-PQ; Wed, 23 Aug 2023 13:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589225.921040; Wed, 23 Aug 2023 13:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYnib-0000E2-Lb; Wed, 23 Aug 2023 13:16:17 +0000
Received: by outflank-mailman (input) for mailman id 589225;
 Wed, 23 Aug 2023 13:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYnia-0000Dt-21
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:16:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a6b3bfb-41b7-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 15:16:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9900.eurprd04.prod.outlook.com (2603:10a6:10:4da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 13:16:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 13:16:08 +0000
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
X-Inumbo-ID: 3a6b3bfb-41b7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJ0n4XLBp3VE8b3WV+4BSmBAr/obBVjXPEGOVgcUl6TwpwpG+6f//m1Smh7uzdT0C3bdnTDIzlznumuE5LVl8coZ8L7xOdZG80F63QUZ1cg4PbnYJnY2cPXCdrarSyi5D0iw2acKg+CvbBxoURL9XKRAtUkOUSunvhvx9407PcdwYxXDnNkmirnmRfswlOCkC9ZeFAmSvsTzz9UB+n9C/WQEd97qBO/+LCOc9jHIF9Ej6u3AFVlQA6BB2JjnXIaIIIZHzDydKYUF8xjw063wiaof77WFhweihrZra3OyjpawTkh6eQBcqTZgsIoQMJ52LaSt8XSmFJRO1BfpO6eJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiBoAiF1hPydvZjvvmgG82qlfftm6SeyRMA9iZtTf+k=;
 b=Mkl2l3C0jk5TxpULmvcHYvIEVqvWbVDB1GPVIEHfLEuXlHGOlf2lRdaZAJg0au7+/uGA0SNkiNSDTHWV/vG1tcvU8+yZpr4RrsLbl85FbEktrVzAm9dL1bCc8GdzgPkhXFRTzxhQPhsejIYBrBI3DW/jfl/J3cfCXo80UnOtFF5J7A2gGPBmvDB31dBHBj8TYH/zBHeQyAP91OtitKFGProGrBLB97lu4Jw7pRWg1lmtCX//o5XkUc1UyKX9erGrw/t4logUi2zEjTguYvQlJAmGe3ECORcK1BzrDhj4ujK95f5M5RcwNyig5qoOI0GZ04OM/LYd9XoGOpTY4j387g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiBoAiF1hPydvZjvvmgG82qlfftm6SeyRMA9iZtTf+k=;
 b=dDQ5AE7060KYTzGPSnzN1oPXx4rmxnbVX1vvBiJhPy+jlOAR0S5AYyAj6+sXm8xJq9bx5Tc85X4bJowvr+JEJ2o1sUbfxGHH4SRtvDaI1mxGG0+vCn1j7Bzotyp/0he6QHYOfv4HEsSY57cCJqze3ft3IuT6XvLh6Y5Vda7cGtcnWw7dSLfTxdpRRPZ7L1IW+8hV+XKafPDkFUPjsRZ1TglBJXgcsKb1X0/nMsL8mh3u0N3WDdxS9YghgVIZNThqodrbyObBobbDfUC22qDG1Q/zqFGZkA3Ma1Izh/yjWFLQKcwvSQmpNv1ct0OCmQH1PxVmnN9LLPLjmHR9QnFylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c853c27-7ee0-e27a-75c3-837fd5bbc5a0@suse.com>
Date: Wed, 23 Aug 2023 15:16:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 04/15] xen/sysctl: Nest cpufreq scaling options
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230807185119.98333-1-jandryuk@gmail.com>
 <20230807185119.98333-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230807185119.98333-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: ba808bf5-64ba-4fd0-2318-08dba3db1cd9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mzE4kSVmZbanwLo9unli/pM3tiRNsGMHGExRcifbp7MI6fPc0s2Hvzuar0iB0dKNu98wXJG5azvbuY4hJmfj/apZillGo/lIDDVlt4k2n3DY+xH2TubAJ/mGQYWt8kPQe/yXPPBlhXE0JocsNbxHGp3R8jI5PcWjlVtmWTsfhIYFWBMfaYHbwXQdkYbLmGmFoAdmzVYP+yuaNGDHrfDlre8FVletsoxH/MdatYR+SVrBOFH7How7rsZcy+9SxZXREbwTtocDzKW1CzEPAh7aJ8u2ki4TmevnTd5rbu4c6WN36XBc2yGwMenLl+hhOAWhX2doYwSp7Yfp8HP6uxv02rQOFjtMLQl0mxEuw4+xO611egdBq6DiLfM/ByQ+Ih9SZtSQE3ufqq9Y9kXyVj+6V1daaDQdgIprovUJjUAIZqBI17CNn/55K3U9FXfH3SotOZHomJHavXM/kJEV7aLS0U5+RLv9Vyoq15kqhYPOQbP6i4AKXhFL4N1SAKlOsYbZYUgfQXeWO5WN1oNX6r0sdE11DsUOxDL8trlYDkkvTsq0mk+Zdl9h22WR0Pz2H9Oov9p9rH6pbtyDYXcl6Ck0fTORAPkDiMeF8YtIEW+HrQowz0C7cxYSF8T4S+7IOYusGVokSQ317i7wJV2xquHoww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(2906002)(6506007)(38100700002)(53546011)(6486002)(5660300002)(26005)(31686004)(31696002)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66556008)(66946007)(6512007)(54906003)(6916009)(66476007)(66899024)(478600001)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak5sOEtDcVd1NEZKQTFTcUErRHNQQkw0alRKalRjUmJSTU5CMGxCb3BkeVhT?=
 =?utf-8?B?NDlaelpwU0YxbzJZaDFPT1R3SnNxODBkbDNQVXovK3puaHZRMUpWWHU5WHNR?=
 =?utf-8?B?Mi82S1VZZVl6a0x5QlB5bVdnaUJZcUpkOVZIN2U2cmxmaE1SOFRiMWpQckxU?=
 =?utf-8?B?RnVmb0hMM29aMjFldURYbkhZRFdsYmRMSlJZY1BvM0JiTXNnaUoyUFFLYjR1?=
 =?utf-8?B?SjhzYXhjQktvRzJVK1RmWDhXMjRGeVI4Y29HQURYYVlpTXE2OUpHaTNtQnFu?=
 =?utf-8?B?enJvenJIdDJvNkRkQThPc0xlMVE0eGljTWNrMkNwaWlKanB1VXdobFVIUE1G?=
 =?utf-8?B?czZCYUNRYSsra01RMXlQTEFoT3NPTStacU56am5XaFZpb011Y1ZrRFV0aWsz?=
 =?utf-8?B?WWNQSktVaFNyLzlHRGZKMHB2a1M5Uno3YklMVGNMSkZwNDVZYkpmbS9LbmFN?=
 =?utf-8?B?TTBIVlB0SkRqelFUSzlxVzk0eDdvT25zc2hyaFh4TDMyaW1heEIwalZFSWZt?=
 =?utf-8?B?cURML0ZuQ0w4T3JqczRlbEplcVNXTmxZSjBibDBVUi9ETDlFNEd1cTcxOHVJ?=
 =?utf-8?B?NmhGd1NvV2RhUmxHTHZxMElhNHpEcEhBd2ZqKzFDVlJCcEs3SWErekFGL0NQ?=
 =?utf-8?B?c1BEeEdnRDNReUY0WGs1eDVyUVowd1pjdnNkZ1l1OEw2VWoveEtocU5FV1Bv?=
 =?utf-8?B?dzFxWDd1YndIZmEvWlcvMmVXNHBzSGlIU2xueVd4UzZxdWdBWHRLbjRtdnh2?=
 =?utf-8?B?L1dkcDhad0J2WVpYZ1hMbGZqcDhEKzdLWnJxYno3c3hLMEZ5Q0h5dDRpUDRP?=
 =?utf-8?B?UnR6SkhNaU9JQWRMQzMwT3JBVGhrVDBqQmlNTDd4Szd0a3liQnJmNGdtSVhD?=
 =?utf-8?B?ellsTnhSVnlBMllzTHNCZTF2OUcxaFJCbDNzZWNsdUFaMkVlMWQyZ3ZDdEd3?=
 =?utf-8?B?K0NKUHlyd2lUcGoraHNiYytUYnV6QnEvVGpWbnhoVGh4NzhnTkhlSy9aVjlv?=
 =?utf-8?B?MlUxaXd6dkF4RERST0VTU3BXSjBFa0dOQTk2UDJNUFB0Ry9WRW50cHJtWktF?=
 =?utf-8?B?cGoyNVUxK1B5MVZLUEsrZzBNUHNVYWMyWERkenJyKzhYdzJ3YmJ2MmVZVEtL?=
 =?utf-8?B?Wm8zWUVxQWFoVE1VUzBxcndacDYzZFRuZlhpWnZWMUR3U1FtTzNJMStHR1l1?=
 =?utf-8?B?c1pORy9GQkY5SUtET3lkVzllT3VTTlVIbnVPWkZHY3gxTU9UT1ZpUzMzeWRM?=
 =?utf-8?B?ZnR3OVlwZHZBNkFlb2FDSEU2dStiNXNlMm9aNW5YNEVENGQ1L0NGWjRlTHBI?=
 =?utf-8?B?YUM5L2xkQVAwOWxmL2lTd0Vicld4dk11elM0ZGdXbjA0NW5WZ2NYeThMZzJE?=
 =?utf-8?B?NUZ6VTg4WTAyd216UVRqYThvYjM4d2RUVWU2K2N2WUVMYk41YnZZVkw0QVRV?=
 =?utf-8?B?TkpxcittWjRqa0hpMENZYitGYkhMUUdXVWsybWFJN2xZcUZxQ3BRNFBzRkpU?=
 =?utf-8?B?eFo5dFQ2TmxRSFVyYXAybTY4N3crNGpQU1o3RHVHRGFQQUpsY2p2RC9uMnFY?=
 =?utf-8?B?S1lGWFlENktKQ3FoQ0diYnhrVGlJTzQrRWxoU0FJellscGFEcUhnUG5BZUF4?=
 =?utf-8?B?MURwR1lTMnJCSlNMcXMyeTNlemlsNmpMam5pVlNVdVJFVFJYZEVSUHpaZ0Vz?=
 =?utf-8?B?Skt4THExYjR2ZWNsTzVyS3QyNGlzaEhkWWdxc2NKd3ExZVZ5akdlWUVpdy9p?=
 =?utf-8?B?Z3FabHgxUENwNitiZDd0QlUwT0VDV1M2T0l2anlpc2tIWGtoZXNBSWo4aVhU?=
 =?utf-8?B?NkJaVDJVNGZ2WEEranpFcXhkZURZK2FYWFdyVnRVVER6UXkzQmNYRk9rbEVv?=
 =?utf-8?B?UU1wSktQbXdmZUJaaEcrR1llaFErSVY3bWQyWHNvaDIxZ0lQQ2dLL1B2andX?=
 =?utf-8?B?THlFRUdRekZPOEhDYlFzL3UySGhTL0ZEYmF4MFg1ME9kWUVzQWpNeDJwUGxN?=
 =?utf-8?B?N3h4M01BYnRKT24wdVZxRmpaSDRlSEw1RnBWRHZpUHgzUjl1VWhmOGtsRlEv?=
 =?utf-8?B?MSt4dEtBd0M4aGg3RU1tS0RVbWRjMVJDYm8vc0pKQnRnOTFVWnd4MlFFR0hv?=
 =?utf-8?Q?uFz6L96TebGmFlte6QxvAWtWd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba808bf5-64ba-4fd0-2318-08dba3db1cd9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 13:16:08.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 386GbYmImkCuJE42KBFiMhgi7vRqHIu0eF5u0GAhi8oQ3Kgs/HxneT0dkExYG0+GBidFrbmnQwTGi26aXkD5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9900

On 07.08.2023 20:51, Jason Andryuk wrote:
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -245,6 +245,45 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>      sys_para->freq_num = user_para->freq_num;
>      sys_para->gov_num  = user_para->gov_num;
>  
> +    /* Sanity check struct layout */
> +    BUILD_BUG_ON(sizeof(*user_para) != sizeof(*sys_para));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpu_num) !=
> +                 offsetof(typeof(*sys_para),  cpu_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), freq_num) !=
> +                 offsetof(typeof(*sys_para),  freq_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), gov_num) !=
> +                 offsetof(typeof(*sys_para),  gov_num));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), affected_cpus) !=
> +                 offsetof(typeof(*sys_para),  affected_cpus));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_frequencies) !=
> +                 offsetof(typeof(*sys_para),  scaling_available_frequencies));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_governors) !=
> +                 offsetof(typeof(*sys_para),  scaling_available_governors));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_driver) !=
> +                 offsetof(typeof(*sys_para),  scaling_driver));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_cur_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_cur_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_max_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_max_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_min_freq) !=
> +                 offsetof(typeof(*sys_para),  cpuinfo_min_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_cur_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_cur_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_governor) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_governor));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_max_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_max_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_min_freq) !=
> +                 offsetof(typeof(*sys_para),  u.s.scaling_min_freq));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.userspace) !=
> +                 offsetof(typeof(*sys_para),  u.s.u.userspace));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.ondemand) !=
> +                 offsetof(typeof(*sys_para),  u.s.u.ondemand));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), u.cppc_para) !=
> +                 offsetof(typeof(*sys_para),  u.cppc_para));
> +    BUILD_BUG_ON(offsetof(typeof(*user_para), turbo_enabled) !=
> +                 offsetof(typeof(*sys_para),  turbo_enabled));

As the build breakage shows, these checks are too aggressive. The two
layouts can't possibly be the same with 32-bit tool stacks (and hence
pointers being 32 bits wide). But we also don't need all these checks;
what may need checking is only what subsequently is subject to
memcpy(), not anything that's dealt with by field-wise copying.

Jan

