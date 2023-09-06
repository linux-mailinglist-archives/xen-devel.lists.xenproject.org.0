Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DC793CD5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596583.930510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrny-0005qC-Ub; Wed, 06 Sep 2023 12:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596583.930510; Wed, 06 Sep 2023 12:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrny-0005nQ-Qc; Wed, 06 Sep 2023 12:38:46 +0000
Received: by outflank-mailman (input) for mailman id 596583;
 Wed, 06 Sep 2023 12:38:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdrnw-0005nI-PC
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:38:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ffcd6af-4cb2-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:38:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7727.eurprd04.prod.outlook.com (2603:10a6:102:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:38:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:38:39 +0000
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
X-Inumbo-ID: 4ffcd6af-4cb2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af4jfIzrkJyjpexgX2B42GiKuinszw98PGMCAMaE2IrQWjxgPuaE8NazpOogkh6/tWVADNGGaGDtP+AuMBR27SHQlF7cqx4pzZVE4O7KPfcY6ySGPAV9mMYjsClfd9YFv1ihiLFnqniHsvEgZOAc6948fPozZ/Os/3/FuS/xHmipDPfA88gv7W9qtIuNCD9F7FlVOWLDWPCeKM8vgRCNFUCnhFvfDhxbKHFOC2pmUJJuNsiVuepSxRMcRoHi76blk9weUL5p+gqRpAe6Yj/ydsjGSmVhi41mDbYM3ZSSz32Qoo91VXewD7AxJ7nP9PSQ7ZfSGaxEwUzRWZq6VgqkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMFUiH7TPjAgom+E8xcNGRDHEluUJV3lDLbbG+jyKGw=;
 b=KESTLhnlahOWfIqc1A2u2BeVaA7JcvuKKMfAp79bYc/dZs2JEPidLS8D5kyTeW77LGnSno6MTtFK+9MbbXaRGQGnGVzZ3Tht4kvaBjjxwASljxHwREmDMvid38aMriF2DzwiWjba9mUovfiGVaH2+lWh3KZok8/CTReHXzUUDQKwTPD2/4xRkhp6VNLJEFAQe+/arKxI0Rn+6i6+pAYI1awszw45Lz25L/Ygr7RJA646xIx0vLixquO/c13LyHJd5LcOB0JEje18vFIxB1RTYTxRvKeOchu45PYSnhivP+4V+zees3ZAtoUPexJNbRR7/CuaP7FjWJSxc2S2ZjMVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMFUiH7TPjAgom+E8xcNGRDHEluUJV3lDLbbG+jyKGw=;
 b=BopFtSA2E1BNd3LzRdkhqdrFPj2jNsgVtvFllfSIDjb6tIOy37xlSsb3rC8mCQs/N5bSGOW9p8C7fuwmlsj8g6cGThvf2wbZsFvGHx/ktE5mLfJ+rqQHkvDJunc0g8vXVbj3Pvyyh2jFsGCeexzfceIlbGAadg1fLc4s/m7qgLKCn0wMYTxIyrnldlkGkGXatDmA1zs1vJXuRe36m8e39fQN99Yk+JIKopEaDmiWejrEVnaqX20sA5VnnP4TsUMHFGAPY1xYuwoBRPyIHQIX409wFcqx67od4wpK/8rvVjoFaA39ZNtKP8uVPL4Oq9d9gzGyVqWQuhE6l1r6PjQmEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90502ece-0891-db40-325a-b325a2bdeb57@suse.com>
Date: Wed, 6 Sep 2023 14:38:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v3] drivers/video: make declarations of defined
 functions available
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <d0266b549dd88d273918521ccb538592df9e58b1.1693551521.git.nicola.vetrini@bugseng.com>
 <2dc97f01-7088-1a91-77e2-79792840b828@suse.com>
 <35db7891e985e3376f744b8cbffdf252@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35db7891e985e3376f744b8cbffdf252@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: b10d43a4-a7c5-456d-ece4-08dbaed63290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bbb6c6Eu6xRuyWkQt9GnHz7A2IYs/7UzmjJ4LOaaByURAC/TFpajBdTM1xQ8cutOe2cm2RTt3++hc1Y4jT8/KvrLZsdCFAhKUZ6nE9UG5f8lByOhPDit/DkTpsyfNeh6fKSjQkegVw7Gg6H49ljZP62mWBIZRkSw+5xzpYXEzh4O1riWXKnYR/Ig55u5iKHmLVYSY0VkZWBhT7DKRU/3moF4jtqeSxcKqeHb0jXA9gEp2bwDETQUcWvQRVgpmsJaa2Qv3v8lA7hxwUlo1yd1BXxmJh+bRGpetpU78Kda0/ZVHnBFY90aNFwvD2TAj79m4+6P7DKZx7VGylLAd5oVex5TKiuAHEEqnZOVz0LFWtNZsc741Cj9qLWq8gSV1pPr6Z5w7CgL6tppa+04IiIPsUqpE/EqjAVtp2mjPiNqOHw5aHtXTClfqOyEFJ/s+PNqJnbJylpkACFvfa1lDzm4cdSGsWni6Q1fgwFmH3GYsBQkuTL3wkzu32XojtFbb5GdlSLqQH2cl+Qi6wrrmd7589prgVpsXETZVp5Es2oENmBsTUWN4lOKRyF7rCpFkP47iTj+W2v2l7WpTRHgCs+3L8FhRR9Hl5bTfkb1/53IyV6kvGpZTjMLyN2snoUUjL5I8W29abwS+zI7EAMEKt/E9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199024)(1800799009)(186009)(8936002)(8676002)(4326008)(478600001)(66476007)(66556008)(66946007)(5660300002)(31686004)(7416002)(2906002)(41300700001)(6666004)(31696002)(316002)(86362001)(54906003)(6916009)(6506007)(53546011)(6486002)(6512007)(2616005)(38100700002)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVJUzJMdmlrZmdxbkRqWjFHTURSVXN0TEIwcUFVZ0tCRzFMZU80bmUySTJL?=
 =?utf-8?B?eWR0cGhHRXNXQWNwQzlHdUJtOGRHZXg2TFdySVhUVkZlVm1Dd3VWemNvbXBJ?=
 =?utf-8?B?Mm5KNmU0V1lWRG0vWUFWSUxlV2dRZXJrZjF6dWNGN0dLaG0xYTE5SU9KL01P?=
 =?utf-8?B?Q2JqcjVCMnZXVW8rbjVSSDJZcjB3S2l6M2tJVndYWTZTd3dqcDFsZHdqS2NO?=
 =?utf-8?B?dTRHdVQrTWRGWi9sOXI0Y0RUK1o1OW5JdEZydDViODRNZVFlWE4veUdmREtp?=
 =?utf-8?B?a1FRTzdsNGlrdjViUVFndkQ5Z0pXSlFiNS83Y01LUG9iUTFjTjRTYnFTZXl2?=
 =?utf-8?B?SWE0TWVYcnZZRVdrQWxLUzdERXZ2NzdOaGZwRnhmTFYzREozelNiK0hLOFJC?=
 =?utf-8?B?L1BRSUdhR3cybk9YVGx1S2ZBWFpsUHZxRmtLYmNIcXkzbnVodWRQN0dDblMw?=
 =?utf-8?B?TGR6VkRwbDBzNkRXQ283bHdXK1ZyaVkrWlkvV2RLaE9LUm8xUGRKd05VSUlF?=
 =?utf-8?B?aGh3SnpMaHRNNmZuK0MyU0wwMXpiTnA0NXJ0YWdPcVVVTFJlSGhrc0hNOFJG?=
 =?utf-8?B?U2x4RERLQUpEcE1XY2M4emFVWlRaWVNBK3N5M0FtQUJYYVBoVGNkYnBmbzB6?=
 =?utf-8?B?L0c1bzlDMWtnanYvRmRwVmN2bjNCVkdZaHpjSjkySzZWc1BHQk5jYWdxa2Fl?=
 =?utf-8?B?Y3pPbDRmRXdkTXl0YUdkOTlZa2s5cVRqazlWRU9vR3RtRVhVV3E1ajk4dXpa?=
 =?utf-8?B?ZC9hTlJkTFArUGhLbzZTaVZYTEhOeUJLUVo0ZkJyVmhLM1JiQy8zOS8xVzE0?=
 =?utf-8?B?a0l3TEhOQ2JvczRlUDJBTXl6L3ZVczdJZkpNSHljeWRzVTFSalU0c1BqZkor?=
 =?utf-8?B?NjhWWEZsSHpqWTlzQk1QMk83eGVJd1lGNzNuZDFOTGRtRVdncjJ4QUdOb0U5?=
 =?utf-8?B?R2cvVlZEY0w4czFjNXpRTS9HOTdldG9ibGRCRmcwU01pdXFyZHRrYjFSNjVE?=
 =?utf-8?B?QlhzcDlWUVkrVzRSc1JaVTNWcy9VL0VHYlJlcHc5Mnk3cXJQT1lJTzgyMWF2?=
 =?utf-8?B?OTZzc2llV2xMditKamFteVcwc0FldXdvUW5sOTFjN0htdmRpa0Fwd1NmK1Bw?=
 =?utf-8?B?QkVqWUs1bVk2VThDWUx5Y3pKNkVSSWpoOENNY2ZMSlNZWjdFUjk1alhmMGdD?=
 =?utf-8?B?alNldExkSVA1bTZqY0VueU9KVlZZRk9TL2dDYittMURlbUVTMlJLby9LMWF6?=
 =?utf-8?B?MGJmUTJYRnI1bGNtVjA2Q2FhSmVNZ0VQcGZRa1hHYUhuUkZkVTc5ZGFOQUk1?=
 =?utf-8?B?a2h6c2x2aXVtamZaMk1zamM0bS9kaU9VRDAyVjVKM0IrdVdTTnQ4Qlp6eks3?=
 =?utf-8?B?RDRGV2hNYW8wRU5FQUN6bHY3eTVYVjg0VlZodlFhT2NuQTcvSHJMbWIyKzk0?=
 =?utf-8?B?d2p0NkthU2NMMlZubnRnOEd5Z2dXQ3NSNks2M3E1WnpsdWRaL0NDc2RFTllL?=
 =?utf-8?B?OURoZXJSdFVMOFNESVFvTlByaGxCMU5OcUpXYUNuRnRqN0RmWUJzMHhYUXhi?=
 =?utf-8?B?MGRGeUNSSDhTSGFaM0lBbC9OS1JhWm92S1Y0WDdySDdXT0Zra2xZMTNiNEUx?=
 =?utf-8?B?Y1dhSWxGWUlJKzk1M3hncXNTWGRoL09hdHN3dGxnenJ2R2ZJNkpiUngzSU1i?=
 =?utf-8?B?eDhtMnNsSTJRZW96UzFLRkYrVXFQdUdMeU11ckYxY2hFUUlGM1V4WFFnME15?=
 =?utf-8?B?TmdMb2hiaWNIZlBaL1J6TlBHcmFmNWZqM0o3eUdlU2JnazB1QkpyVmxpZElN?=
 =?utf-8?B?dlBkZWhPZ0RJUWxoRnZRWUlHR09SYmhNYUtIR0Y3WXJTemVDek8rZE1qZmJr?=
 =?utf-8?B?MHhQR3ZqczFmU0V0RzEzcXdoazhBdnIraHMyWUtlTUpQWW5SSTZmZStxcGl2?=
 =?utf-8?B?bGhrcVpUZXN5eUxRbjgwNUt2ZEMxYjl6Ym9haUxrN2VsblFLTnBhSER6TlNj?=
 =?utf-8?B?anJLS0dnUnY5T0VoR3RTMk1LMFNWcW9TQmg3dDNuYWRYM1ZWcWlrS3FhYTRQ?=
 =?utf-8?B?RGdvYTJKVFc0TVVsNVduMGtFd0s5OGpEOEgrWnB2YWxFYlVLSS9MNmpKdDhz?=
 =?utf-8?Q?51SLAnNV1v05QtQZWPoux847r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10d43a4-a7c5-456d-ece4-08dbaed63290
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:38:39.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6KlSHtSP+TUeI+r5YmY2apEUQjUGto1sREEFUkxTw6RT9GtHNvhRdPhint+N3NdmKHKRP7J1JafCmR2oUPlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7727

On 06.09.2023 14:36, Nicola Vetrini wrote:
> On 05/09/2023 16:42, Jan Beulich wrote:
>> On 01.09.2023 09:02, Nicola Vetrini wrote:
>>> +#else
>>> +#define vesa_early_init() ((void)0)
>>> +#define vesa_endboot(x)   ((void)0)
>>> +static inline void vesa_init(void) {};
>>
>> So why two #define-s and one inline function? Just because it was that
>> way originally doesn't mean it needs to stay that way. Then again are
>> the two #define-s actually needed at all? It looks like they were added
>> to vga.c just out of precaution, covering the "VGA but no VESA" case.
>> Now that things are properly moved to headers (and keyed to CONFIG_VGA)
>> I think we'd better omit those. They can be introduced again when we
>> gain a VGA/VESA split (and a CONFIG_VESA).
>>
> 
> Ok on uniforming them to inline functions.
> I don't have an opinion on the second matter. If you're otherwise okay 
> with the patch
> and no one objects I can drop them.

I am okay with the rest of the patch (as always subject to spotting
something else when looking at the next version), yes.

Jan

