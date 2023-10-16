Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BC7CADE3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617821.960867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPkZ-0007Ym-MK; Mon, 16 Oct 2023 15:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617821.960867; Mon, 16 Oct 2023 15:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPkZ-0007WJ-JZ; Mon, 16 Oct 2023 15:43:23 +0000
Received: by outflank-mailman (input) for mailman id 617821;
 Mon, 16 Oct 2023 15:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPkY-0007Ut-JV
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:43:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6d4763-6c3a-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:43:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:42:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:42:50 +0000
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
X-Inumbo-ID: bb6d4763-6c3a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te4c1JLHD2WAwa7BnuYflCYm1h/IuOIJhiGcO8/AC4rNPkbcieWdTPgRdIIgEDAtam32hb5KZ68eU8uFyUXhhAAlLrnKjLOdU8eheChpwUnFQg8CVsQ5r2UQ4TUPRmTORggNgKMvJ5jPY1hUqXKsXymUVxLVGI5213Wev7obzCNx2W/NS8bCTIdz+NlJWgPu690JxQVdiWvV3yz+KgLU+eNOn3vW0GIX9JMRJf5KkdToToh+IEn26rlMtSBbscWiNP/i/wO2q4GaHVGCAbjMsiiAfhd1a02DVtLjmMIaz+9cEKp+wQBpMJqZoKN6GSgs4oAWJ9OFL/drNyrer9u+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14n3ySF+i1IfwaNUMXlIHi/QBV0HBoFpjh+KJDaDLTs=;
 b=QpdEMrqEk6KdvnXwvNjqOhJ9XwP3uQ6oDG7BZ1aOJuAvhjPcG3+rbiPLecHrtqdMtLl0yfRNP7RZYH8gBlT7sGqiiuHNzVab6GNge7HJKUIG39RWAdcMm12FHpzRQg/uolPFB2yb4Mbgru5XCgpz7Q5ipyNav22elJt2e+hzFKaRaHI+/SB8kH5Q+x1SxFGTU7TB/mSFiC7k49lCWLLh0v9fQjR5Ogw/2IJKUcBiFyu/T+8PelQpdViZbBjzjh6pn2KC1N3KCi1Dl4a+sxxJn5aRG7stscr2US0gn7t+dt/Jnl93Q5M8bK1+qSnSdGpKw+CAOaKUgLlVOxuYjgp3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14n3ySF+i1IfwaNUMXlIHi/QBV0HBoFpjh+KJDaDLTs=;
 b=l8dwpRAB1Q0OZXVLQKe4YJAyGq1ioYsn5a68rBDT3mkGMvHy0S+EHfhevILPea4jFvAxH3GzsP+kNjqe0ymuVXsa20wuhvIXZXKRWXtvMjJcLb0W3yhOZwM75kWun71VWAXAyNA2NKf1rv46xNdIjFvWbOcnzH2hVioZU7mi/pPF5YNYvdWWWZML0cHCSExvVN+tjG8w9uepxcNw/Zbb5vJy4H7xgnJZcif0S5OVPnFCy2GlUEZeCStMAN1OWtmbfbcdDby6rBnffUmMQpCwxE+sBkvYvrSBPXKoymjbbk/8u6fv/0qMew3kIrNbzNhl3BESJFqLrmy0Fqvd67xZFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d52fdb46-5ac2-fb0a-2b76-348acf4a5cff@suse.com>
Date: Mon, 16 Oct 2023 17:42:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bf37d9-2cd9-4994-bee4-08dbce5e8db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8qRYuLad2sb4a07srVPS8LCpJgAokPQVaHTXiZyO3hJgjFqz5cktWyFvWqHxpKRFz0H9/rF6/2+qkd4vqKrPouvqLfi+rczoSa1JjRkwbpxUd/PBdUwr/5Vu76g/izkEog9y+sZJNBQSx2k1Yp6Lax+2baV7MrnKpH5Qg45yjSa2nJSUukehmKF6T0Dko2PC19ffe5WJO61t3bsVm7zRW5PQNtjkvExuAsTNsJamLJsq5OXXMciJsqoNY/8ghepz7O9IIDtIDCuMYuGPNen5dFuCYMBylSxY5LIPKe9/1vOLO/kpBrfn9TXox6vbhMsHBoewpTVTKum8BhH5Ah/TLOd/9OAg0ocmLJcawNtrFsG9icnp9wC9jhiz/2HW5e9UXy38j0X6+uN8FqpfeFxepeiMWOa9+8UC6hmEmJjbhvpMAukSao18FfppEfwbdy9eMcBxIpjYmKPWeZPe/xjljF/PKeOrkvHR3cTq3r1XnjUNFeDBH7RNiTpj3378aYSWzeIBp0TfVqfAeoQFR9xTTZaQKaybrPQbwaE7DcbiGxRDhRcQB60fQ6TTwymr+tuy9l3rf+kQK8BSnr+gq44F1d6JfztOXyIfe7Ew4KZzm1dUzargXolEhBOsjLwI6UJg/xlAU+VtA4/JuI2StpLsHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(2616005)(6916009)(66476007)(66556008)(478600001)(316002)(66946007)(6512007)(26005)(53546011)(6506007)(2906002)(5660300002)(8676002)(8936002)(4326008)(41300700001)(7416002)(4744005)(86362001)(31696002)(36756003)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVdlV0pob1pVVTgwMS9FQzY2cDFaQ0JOQXFaRUhKU3E4RlIyOHNVa2tyMjhv?=
 =?utf-8?B?U3NienVzdGtGNUMwWkhQbmRDRUxTbFhpZkEwWlJUL1lyazk3Mm03cmVPWlNk?=
 =?utf-8?B?OXUwa29lK3Nsc09MVHhuR3ZJUUM1VEk1TkZJa0NyMVYwOGJiNmE2emcvdzJs?=
 =?utf-8?B?dXFqVm1MT3J1UW51VTRtTnMvU1hhbi9yUlhYK09CdnVwQS9hMUVIcHNHWFZs?=
 =?utf-8?B?czFXd3pPc3lHdlN0V3ZvampNN00vWFpiRFh0Q3RwOFBPV1RnVU8wRVAwTm1V?=
 =?utf-8?B?enlmYmtORjAxekFkQytJVTREaHoxU1RJQUNtS1dVdGlmSjB3UHVOcDV6c1FV?=
 =?utf-8?B?bHhYc2t3bWhneTRNeHFzUENJSlkwdENMTkhLUUV1TUMwc29wN0o3endGdU03?=
 =?utf-8?B?dlhQTm1XVitxTHg5NUp5bndGTjMrMzM4TGR6dEdkc1AzS0REQS9qSzlMaVdt?=
 =?utf-8?B?RU1heWZzQmlocnBpR1QwZE53cVdrWmJpT0JxTEtyaE4zY0VRUmVicjFaSFJL?=
 =?utf-8?B?MHkyT3FkNEdzVk1HTEx2VXU3RTUzelYvUVRHTEFzZis3R1JmMGFoZE93NEJu?=
 =?utf-8?B?S0s0ZzlXUEl6SFR5ZWYwTlYwWmR5cW56cExFcDhibnJNQTRQaDhjeURmTndu?=
 =?utf-8?B?ejA1amM5RDdqSU9yVGdSQXZHdnVoZVZ5cWhLcDRucXQzOEFhc0Jna2pWVXdR?=
 =?utf-8?B?OUthMFUzRkRvZ3dCR2NMbkYwWUJiTWRpQzJJSXA2Uk9keWVzOUgvdmRvY2Jn?=
 =?utf-8?B?emgwNk5Ha2Z4U2pML253eVRWZXJzQk84dDRqVDRDOTJRM0tHbTl0M0oxbGdm?=
 =?utf-8?B?YzUrU1JZYkpqMllSQkRHQ2NFcENTUWFiVitvUGNyOUU5MnBiTWlXbUpoaWE5?=
 =?utf-8?B?Mm03bis4SDhMb0UzbVh0cEdCYW1iejJGL3VnVkpXVkhIQ1l5OWEwM0tpREJy?=
 =?utf-8?B?Y0g1STUzbmFqTWgxOHdseXB5RVh3U3JGMkI2amxEOTA1eE1OaktjME9MbGRa?=
 =?utf-8?B?b09YdnlBQlpCbXJXOHJLVnRhR3BoR3VEMG11NGJlSmdyQUUwSXo4U2g5emx5?=
 =?utf-8?B?L3htQm4vaDRuNUNBV3NCdUxpV0swTzFSNVViRmo3T24vNnBYam1yMWMvQm5D?=
 =?utf-8?B?aUc4YnpZdU05bmtOZWQwNkpVZGpqY1UxWjI4aG5FUTBnd0dTM2w1djloNVRY?=
 =?utf-8?B?M2VwTWdaRXI1OVVjT3MxZjlzSzdZT1JVOXdJc3pIdUQwY1M3MXJUN3U1Sldw?=
 =?utf-8?B?WWxSVVR5MXhIanA5Q2dXRUpCbVdlRXRtdVVtQTcyYWJpZmlIZHZ6Y0hTWjYy?=
 =?utf-8?B?SUgrNWpTUmFZVzFvU2tUcTEvc3RVc0ZTWFI3WnZpOTkvUUJkUEozZ29ZQVJp?=
 =?utf-8?B?YzlpcklWNSt2dnNFeHlyWWgrVnllLzR2YURkc2dIK3RybVArTkdzS2lIQ21E?=
 =?utf-8?B?RDZpK0hSK1Zrcno3ZndYc3UyK0tuM0JCR2s4MDkyMk9xQUo5N29senBBYzk0?=
 =?utf-8?B?cUhxNGNZMTgxVEhwTmdPVWMrbXZxVzgwWWU2QzFKWklVZGdxeUtzcHN3NCtM?=
 =?utf-8?B?Z1VweHkxTWpQeWQvYTRYTEdOaVYwSklybkxoMHROeEErS1NyVWFvYWxrZTgv?=
 =?utf-8?B?UjJtOFBVMC9wVWxkdDJZeVF6VHhiR0oxQmI0SExSeXQxeHVPOGxhZUtXUTRC?=
 =?utf-8?B?K3BIaEZRS1ZYZjl1S0Z0bjl3WVNpdklJVWozOXR5VXNKbDE5QmRwMUZPbE4w?=
 =?utf-8?B?Y2c1eUdWUG05aitmUlF6Nm5xRTR1MUJqeHFwcWNsZksxUW5iMko3amJ0NWRx?=
 =?utf-8?B?ZGNMbWR0aGFhTk55M0xiMkVxZDhvd3IzdFo3ZkN0YXN3emI1dG1Ld0txNWZl?=
 =?utf-8?B?SEx2TDFRYTdobnRmTmZDclR5bU9yUDQrejdBYUtqQXdtZTVvNWRwallPR0hp?=
 =?utf-8?B?SnBqNitpYWw5VDl4RXBpaVFpZU43bmNKaSt3Z3MvRXpDMW5TMTVkVWJBYjBS?=
 =?utf-8?B?YjZvdGt4MlN2Tlk1aFlmZEdzb0plZmplbGVRR0tkZmRyUkxQMS9nL3IxNHFo?=
 =?utf-8?B?REo4TTBiSFZES0pHTEx1U1BRV1Z1TzBHYzgzaC9BbjRsRDZXMjgvaFljeXdD?=
 =?utf-8?Q?VyRX4x2qCP3hXap49ruHWGu/T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bf37d9-2cd9-4994-bee4-08dbce5e8db0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:42:50.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hL4p8dSH8foNjs0Jjzmnii+3aCz/HmN/sbHNudFhuez4vm1ldRPG8gOb895baI46zrrsMiFmvN1dLvIigU2FBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On 12.10.2023 17:28, Nicola Vetrini wrote:
> The definition of IO_APIC_BASE contains a sum of an essentially enum
> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
> instances, is unsigned, therefore the former is cast to unsigned, so that
> the operands are of the same essential type.
> 
> No functional change.
> ---
>  xen/arch/x86/include/asm/io_apic.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Oh, also - there's no S-o-b here.

Jan

