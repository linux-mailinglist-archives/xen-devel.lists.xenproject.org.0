Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059087DBD90
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625269.974403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUss-0004DU-Lg; Mon, 30 Oct 2023 16:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625269.974403; Mon, 30 Oct 2023 16:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUss-0004Bm-Hx; Mon, 30 Oct 2023 16:12:58 +0000
Received: by outflank-mailman (input) for mailman id 625269;
 Mon, 30 Oct 2023 16:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUsq-0004Bg-Od
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:12:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f427bfd-773f-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:12:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7690.eurprd04.prod.outlook.com (2603:10a6:10:200::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 16:12:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:12:53 +0000
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
X-Inumbo-ID: 2f427bfd-773f-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L08P6zrjSKNNFWfz1xFW9GSB4sDl6SVf5FIw/j11EjAOQqeWpzRXd/w1ekmvMSB/Ly3tW5nxZH0Jr81SUGwE97/AsIupCgu5dE0rtOgEzhI0ZXQwcXaGVruExQ5kb1gw8xBu1YjoN/JiT7A0mDMXMbsd11p+rFi4mW+vIdH3+CiCoo2xDHKMdN2mXIZxdXPIVFVk/tbT6BsnZ6XohGCYCUe5MJNBnc4DBH8sabPasxIe8cLCVS47U7O/2wlNfdC+SRZcbLZO6OAU59BcJ9WDUMNzeLDv0WSS0kmnJNf5D9r4SAsoKvIu/suCZwcytoypLXeI8swzVVRrpNScX63asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0TWxnaw4ejw+TwWZThxVpM7WIfbwSD/zM1TROyDKJs=;
 b=jjXKPz1G5G+1LEg7z7YV1F4dt/y944bhXooTO7SCH/LC/x6vdjFflsuMq1mq9U8R/O8f9EJZtDf1axMLgnX7TQjRut6L3ZZJ3SJdnIfeSfslidRABV+NmR5krm4Hy5ah/iZIcnuXMn1qjX6aVJ4ptX3PmqUOvZ1wj4QQUMskxgKcA/5Jg7kLZDLmF08zukznZXQ4JTiqBHwdH8zxIGU7+AZDkdmSF4Nqvakobg3oQCqORmQT0yz/eiK2oyL34QXn7ErHlih0cBjAFjv4Mrt4lBYbISeK8HkUThdZH9w+Rq8dISAwFlDqO0dA1Erhp/K2fa3lvy1d10c+DUIHEddkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0TWxnaw4ejw+TwWZThxVpM7WIfbwSD/zM1TROyDKJs=;
 b=2b9eAKFx76gtlHuQGYrrJjValQFveSyTtEBoMEhT8IIesXk2tTtvizy4xRtlWPP6Nq/T+ddk1QxowdwrQACenQz74zvUseCIUoyBGLAL/bKocn5U3wpNb0xC55MD9OWxhGq7G8OGgm2EnjAUetDZnQ7rbJsyyRE9bzkTREZAeDZ4lBvYaUbNZI+F7ba/GwZYlZaTu2yNWmJVEZyfe7QHcDVVncAyPoSp9zDkZDNktdFhUtb4czFE7qFCxXmUa6XwWwD1HtPTZTSB4EV7iJDwpviQ1ydVIp8kk829AvuBRmZEXYfEaNrLa4J/n4bg/EuVlkTj2BU/VI0t9Z+D510SAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f3680e9-27de-fdf3-c5cd-d3413bd3239e@suse.com>
Date: Mon, 30 Oct 2023 17:12:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 12/22] x86/msr-index: define more architectural MSRs
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <4675c236ea5f66bfce36eb98ac5806ee0468b4fe.1698261255.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4675c236ea5f66bfce36eb98ac5806ee0468b4fe.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b36127-cae3-454f-385d-08dbd963121b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	auLza/iqRWfqAuD+QtMMcbg0jslFyszDT0rjapelcbGgr1KhpRFMyNa4hUM/Ossuj8hS/s0VkUENc4w7VD2RCKZkw5mSpoU73EwBAAf11omj6RN6iEngwCVCfgt/Rfe1kcr1IRMEIUbOy+OwO2kNgG7RPNHgwf6V/alweCG83L8ZSgdXDlmmSg0Ko7/mvCOCm7oC8hcZVeDIfDLZPmQ5lvNA0AcXDF6yUtHx8u8lZtJFyyqKw2BAlbVXGDYlZNqSDXtRvyaeVEaKylJWnvmVXSGWaU5YRzVnQfdwAC9OK45xP7ZgqqcuFpXrezo66bJ+aezvsD6a2GvA4V2SaKdhhj+DbBsbyZrUMS1RQlJwqOjG9O3lj6e6anW2GXwLHgplnxxVLTRiU81kd9a9UNRL/IwxLzFPdlfiHqBx5MjHclLhJwhviMGJOC22/7n6ubndULcRpCwfc0kbPgmH6NDvj+EfrnUxsQ94LAV8nx85JFiV9md2wN+C/7Hl1bb37hK0jYKhVme8F0gac1EdePXG82Nf3Y4fbxWdA8SXiSvESHu8vW+Of1OGSAvviJ9M4jtndjNCABF3yT9Ci93XO1XUOgLm6IbT9Wtys03O1LBpjSc2c7FdiND9sWJa+TeinHLPVPFCCeuG5mB+Cy7HE9rwZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(31686004)(478600001)(53546011)(6486002)(6506007)(5660300002)(4326008)(8676002)(8936002)(6512007)(38100700002)(86362001)(2616005)(83380400001)(26005)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(66574015)(31696002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzJJOTkxWTNNOE9CcHI0dy8xQW5hZ0s5Z2l5U1FUTDlQbi9PVDI3NFBSMHdL?=
 =?utf-8?B?bkJrejVaU2FtMFJDdWx5N2d0WEFaK1QyZmNub2NCRVVHb2ZMYWxJdDd4Qnpx?=
 =?utf-8?B?dlQ5RGpkRExTY0lWQk5pdFZsRTQvb29hb2Z2NDBvU0ZrSUtYM0pBMG01YUsx?=
 =?utf-8?B?a3FtcmRYNVlRYVgvUURxb3k4TVYrYnpQVDRQcUp5R240TzZHMWhNbkhjOHNq?=
 =?utf-8?B?dkU1Zm9md1l1S3lucE4reTRDbUYvT3RXTnU0M1RWRTVJSUFwUW03YnhPbzNZ?=
 =?utf-8?B?R1NqZDNpRXRubUdBTVI2YnlXTXgzUmcxdHl5MVNTcjc3TjVxcXJBWmlaOU5k?=
 =?utf-8?B?T3F4NXJFTGd0YVRBSTlERmdLWXVLMjJXRGhjdHJTU2I3cTZ6OXpvSHBhMmtK?=
 =?utf-8?B?b3d6UHhUdTlxN1RLVGNiQ3I1aWtZSk90dUFoSzd1ZG9WWngvRmMyWVNKWGRO?=
 =?utf-8?B?WFdwUFdWVzZPeG4xclJNcFF1cGJnMjZUSUJpMlJsTG5oNkRzNU92dU9iaGpU?=
 =?utf-8?B?Sk80SnJVOHZYZHdyNHFNTlBYWUg2dk41ZEtBMUJMcW1scDBncEpCemxEUGUw?=
 =?utf-8?B?QkVXSWpwUCs3ZUFFTTFOeHlGVUFBTGxqeXdxWGZKang1c1pjOUx0dXM3YTFJ?=
 =?utf-8?B?NFdiYWdJQWMrbFBDRGRRQTlacDNJM0NsdFBqV0RDVFF4OXc1K1NMQ2svYkJK?=
 =?utf-8?B?bVJqZzhFNDZOOVU0UU04NytJRjI0dXhXM3N2a3dNbFA5R2hnUWNIeEVwWFY1?=
 =?utf-8?B?MmN4Njk2RkpmNWZ1S011TnVDNndWSExwRm0rSHkyMCtHTHFYbGdVbjRhemth?=
 =?utf-8?B?Kzl0eG9YMFZ3R1ZsZWFnNVJvY0xTTXRtYnZ1REhRb0lXZEVBdXhMVm40TURp?=
 =?utf-8?B?ajZWQkIvbFlSTzNiZlJhR0M0ODluaU9qQXljRlRWWTVrYm1FRTUwSjdPb0Nz?=
 =?utf-8?B?TEVXdTV2NUErYU5HbEthYjRXYmNBNy9SUklkTmo3cmlTSTNpa1ZJVWRFM1Iw?=
 =?utf-8?B?WkJiR2J1cTVVODAvN1l2NkpqWmp3WlNYWkx6SWk5ZC9hYllZS3YzZWhJMXQ0?=
 =?utf-8?B?VmdtOGpBaXF4VjRKaWFhczVJMVdMclNKWHhvc0N3VVpFaEtoYUJCR2I0ZjVn?=
 =?utf-8?B?dlVLUnRWS1NJVWtGT1lxZTFSUEoveURUVWRwOVdURDNlZGtRM05MM0s4dnJU?=
 =?utf-8?B?NDc5TTIrVC9oL056YlRPS2lHWjNGaXdscHYyVjlRQU51YSthcHFHQk1pZGZw?=
 =?utf-8?B?cG1zS3k0ek83TS8rNHQyWDZBQlZZQmVTdzdTQlZRc1FDY1pLZU9SV2pad3V5?=
 =?utf-8?B?ZU1IaER0Rkl6ZTZCUWR5bHk1V0hYWjVGK2Y3aDVzekJ5eE5EelczeUE3V24x?=
 =?utf-8?B?d0NUaXBoS01pWDNnd3RwSDI2dmpXZGtKVHIzWG9YQVd1YWFRUk1pTi9wS2hE?=
 =?utf-8?B?SVcrMTFHYXZ5Q0gwRmhLVWlUMkViNXB4ZjNxZ1c1bmN2R3U0cmFLMUlpSk5v?=
 =?utf-8?B?a2NQRFhRb1JjM0FtRmxGVWk3TzQ5eWVmTzUySkp6TFN1cnR0MHA5VEE2bld3?=
 =?utf-8?B?dVAyWEJTdFpQTWFSckI4Y3VzZTBMeEdRNlVYL1poLzg1UTJkN1N4Y0FSa2Jp?=
 =?utf-8?B?dTRlYldFSW9hVGhXODJoVjNBbkZKOXdNbnZ5elJOSTV3TE1wYk4yTVYxTkM5?=
 =?utf-8?B?eUJDclhWME1wR2lqdWVBZzJzQStTcE5MZ290RXN1bE5mWnpDdTN2RWk0RVYy?=
 =?utf-8?B?RnF3WWhjSXlxMGJNNTRwb0J3cHEvaDhwYlh0eWFZQUFWRFU2KzczOUZUZ1hi?=
 =?utf-8?B?LzczOGxjem9xUU1RQVZNcVFJb2J4RTFScHdDcjhSMzFJNzBOL0hucWNWaFdt?=
 =?utf-8?B?dFJRcFdZUXYrTTdUVlRUQXNPRXZMd3ZseHNaS01tang3MGxQc1BxQ0xBaEpq?=
 =?utf-8?B?cDRTWXRiN0V3MDV4TFFLZ2pybFpPbHErUDVSUTNla0lKakZycXFZVTJBSW1z?=
 =?utf-8?B?TEdnQWE2dkJRRW5OOVgveFVvL0ZCdDNSaHIraVdOcnk2SEZkYklHUlBKQkpz?=
 =?utf-8?B?cW1KSVFJQ2FUbU9RdzNiY3duTDJrMm54NHRKbWhIL3Q2MThjTUF3VG5RY0E4?=
 =?utf-8?Q?ty/YLTT60Dd57QadlYBKJaB4I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b36127-cae3-454f-385d-08dbd963121b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:12:53.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bfuvyzg2IBE5CwTnvvUCZmTEbvEM1/WrX3q1tXvH2VGSdjMFg0g0ECwbJbKb5lyWlrGof5BvN6de17/nDnDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7690

On 25.10.2023 21:29, Edwin Török wrote:
> From: Edwin Török <edvin.torok@citrix.com>
> 
> Add most architectural MSRs, except those behind CPUID features that are
> not yet implemented, such as TME, SGX.

I'm not convinced we should blindly add MSR definitions for ones we
don't use. But if you do, ...

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -58,6 +58,14 @@
>  #define  PRED_CMD_IBPB                      (_AC(1, ULL) <<  0)
>  #define  PRED_CMD_SBPB                      (_AC(1, ULL) <<  7)
>  
> +#define MSR_IA32_SMM_MONITOR_CTL            0x0000009b
> +#define MSR_IA32_SMBASE                     0x0000009e
> +#define MSR_IA32_SMRR_PHYSBASE              0x000001f2
> +#define MSR_IA32_SMRR_PHYSMASK              0x000001f3
> +#define MSR_IA32_PLATFORM_DCA_CAP           0x000001f8
> +#define MSR_IA32_CPU_DCA_CAP                0x000001f9
> +#define MSR_IA32_DCA_0_CAP                  0x000001fa
> +
>  #define MSR_PPIN_CTL                        0x0000004e
>  #define  PPIN_LOCKOUT                       (_AC(1, ULL) <<  0)
>  #define  PPIN_ENABLE                        (_AC(1, ULL) <<  1)
> @@ -267,13 +275,21 @@
>  #define MSR_IA32_MCG_CAP		0x00000179
>  #define MSR_IA32_MCG_STATUS		0x0000017a
>  #define MSR_IA32_MCG_CTL		0x0000017b
> -#define MSR_IA32_MCG_EXT_CTL	0x000004d0
> +#define MSR_IA32_MCG_EXT_CTL		0x000004d0

... please obey to the comment a few lines up from here: Altering
indentation is kind of okay, but most of what you add below here
should be added (well-formed) above that comment.

Jan

>  #define MSR_IA32_PEBS_ENABLE		0x000003f1
>  #define MSR_IA32_DS_AREA		0x00000600
>  #define MSR_IA32_PERF_CAPABILITIES	0x00000345
>  /* Lower 6 bits define the format of the address in the LBR stack */
> -#define MSR_IA32_PERF_CAP_LBR_FORMAT	0x3f
> +#define MSR_IA32_PERF_CAP_LBR_FORMAT    	0x3f
> +#define MSR_IA32_PERF_CAP_PEBS_TRAP		(_AC(1,ULL) << 6)
> +#define MSR_IA32_PERF_CAP_PEBS_SAVE_ARCH_REGS	(_AC(1,ULL) << 7)
> +#define MSR_IA32_PERF_CAP_PEBS_RECORD_FORMAT	0xf00
> +#define MSR_IA32_PERF_CAP_FREEZE_WHILE_SMM	(_AC(1,ULL) << 12)
> +#define MSR_IA32_PERF_CAP_FULLWIDTH_PMC 	(_AC(1,ULL) << 13)
> +#define MSR_IA32_PERF_CAP_PEBS_BASELINE		(_AC(1,ULL) << 14)
> +#define MSR_IA32_PERF_CAP_PERF_METRICS		(_AC(1,ULL) << 15)
> +#define MSR_IA32_PERF_CAP_PEBS_TO_PT		(_AC(1,ULL) << 16)
>  
>  #define MSR_IA32_BNDCFGS		0x00000d90
>  #define IA32_BNDCFGS_ENABLE		0x00000001
> @@ -307,6 +323,8 @@
>  #define IA32_DEBUGCTLMSR_BTS_OFF_USR	(1<<10) /* BTS off if CPL > 0 */
>  #define IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI	(1<<11) /* LBR stack frozen on PMI */
>  #define IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI	(1<<12) /*  Global counter control ENABLE bit frozen on PMI */
> +#define IA32_DEBUGCTLMSR_ENABLE_UNCORE_PMI	(1<<13) /* Enable uncore PMI */
> +#define IA32_DEBUGCTLMSR_FREEZE_WHILE_SMM	(1<<14) /* Freeze perfmon/trace while in SMM */
>  #define IA32_DEBUGCTLMSR_RTM			(1<<15) /* RTM debugging enable */
>  
>  #define MSR_IA32_LASTBRANCHFROMIP	0x000001db
> @@ -469,6 +487,7 @@
>  #define MSR_VIA_RNG			0x0000110b
>  
>  /* Intel defined MSRs. */
> +#define MSR_IA32_MONITOR_FILTER_SIZE	0x00000006
>  #define MSR_IA32_TSC			0x00000010
>  #define MSR_IA32_PLATFORM_ID		0x00000017
>  #define MSR_IA32_EBL_CR_POWERON		0x0000002a
> @@ -491,6 +510,7 @@
>  #define MSR_IA32_PERF_STATUS		0x00000198
>  #define MSR_IA32_PERF_CTL		0x00000199
>  
> +#define MSR_IA32_UMWAIT_CONTROL		0x000000e1
>  #define MSR_IA32_MPERF			0x000000e7
>  #define MSR_IA32_APERF			0x000000e8
>  
> @@ -498,6 +518,7 @@
>  #define MSR_IA32_THERM_INTERRUPT	0x0000019b
>  #define MSR_IA32_THERM_STATUS		0x0000019c
>  #define MSR_IA32_MISC_ENABLE		0x000001a0
> +#define MSR_IA32_MISC_ENABLE_FAST_STRINGS (1<<0)
>  #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
>  #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
>  #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)
> @@ -508,15 +529,38 @@
>  #define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (_AC(1, ULL) << 38)
>  
>  #define MSR_IA32_TSC_DEADLINE		0x000006E0
> +
> +#define MSR_IA32_PM_ENABLE		0x00000770
> +#define MSR_IA32_HWP_CAPABILITIES	0x00000771
> +#define MSR_IA32_HWP_REQUEST_PKG	0x00000772
> +#define MSR_IA32_HWP_INTERRUPT		0x00000773
> +#define MSR_IA32_HWP_REQUEST		0x00000774
> +#define MSR_IA32_PECI_HWP_REQUEST_INFO	0x00000775
> +#define MSR_IA32_HWP_STATUS		0x00000777
> +
> +#define MSR_IA32_PKG_HDC_CTL		0x00000db0
> +#define MSR_IA32_PM_CTL1		0x00000db1
> +#define MSR_IA32_THREAD_STALL		0x00000db2
> +#define MSR_IA32_HW_FEEDBACK_PTR	0x000017d0
> +#define MSR_IA32_HW_FEEDBACK_CONFIG	0x000017d1
> +
> +#define MSR_TEMPERATURE_TARGET		0x000001a2
> +#define MSR_TURBO_RATIO_LIMIT		0x000001ad
> +#define MSR_TURBO_RATIO_LIMIT1		0x000001ae
> +#define MSR_TURBO_RATIO_LIMIT2		0x000001af
> +
>  #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
> +#define MSR_IA32_PACKAGE_THERM_STATUS	0x000001b1
> +#define MSR_IA32_PACKAGE_THERM_INTERRUPT 0x000001b2
>  
>  /* Platform Shared Resource MSRs */
> +#define MSR_IA32_PSR_L3_QOS_CFG		0x00000c81
> +#define MSR_IA32_PSR_L2_QOS_CFG		0x00000c82
>  #define MSR_IA32_CMT_EVTSEL		0x00000c8d
>  #define MSR_IA32_CMT_EVTSEL_UE_MASK	0x0000ffff
>  #define MSR_IA32_CMT_CTR		0x00000c8e
>  #define MSR_IA32_PSR_ASSOC		0x00000c8f
> -#define MSR_IA32_PSR_L3_QOS_CFG	0x00000c81
> -#define MSR_IA32_PSR_L3_MASK(n)	(0x00000c90 + (n))
> +#define MSR_IA32_PSR_L3_MASK(n)		(0x00000c90 + (n))
>  #define MSR_IA32_PSR_L3_MASK_CODE(n)	(0x00000c90 + (n) * 2 + 1)
>  #define MSR_IA32_PSR_L3_MASK_DATA(n)	(0x00000c90 + (n) * 2)
>  #define MSR_IA32_PSR_L2_MASK(n)		(0x00000d10 + (n))
> @@ -682,6 +726,8 @@
>  #define MSR_CORE_PERF_GLOBAL_STATUS	0x0000038e
>  #define MSR_CORE_PERF_GLOBAL_CTRL	0x0000038f
>  #define MSR_CORE_PERF_GLOBAL_OVF_CTRL	0x00000390
> +#define MSR_CORE_PERF_GLOBAL_STATUS_SET	0x00000391
> +#define MSR_CORE_PERF_GLOBAL_INUSE	0x00000392
>  
>  /* Intel cpuid spoofing MSRs */
>  #define MSR_INTEL_MASK_V1_CPUID1        0x00000478


