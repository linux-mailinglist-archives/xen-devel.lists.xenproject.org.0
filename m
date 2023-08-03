Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4F76E421
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576128.901927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUSv-0008Qj-1H; Thu, 03 Aug 2023 09:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576128.901927; Thu, 03 Aug 2023 09:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUSu-0008P5-U6; Thu, 03 Aug 2023 09:17:52 +0000
Received: by outflank-mailman (input) for mailman id 576128;
 Thu, 03 Aug 2023 09:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRUSt-0008Ox-Qs
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:17:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9de3da00-31de-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 11:17:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8678.eurprd04.prod.outlook.com (2603:10a6:10:2dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:17:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:17:47 +0000
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
X-Inumbo-ID: 9de3da00-31de-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfSmX5lDI7WU/+3s1fMwFAoK5fwYkUGS0BRfQaenDQlNYtg5eQrrr8uo2WYVrnP9Zm2wSL/v/Xt0uR8etWl07An1v9c7IBoMSelrfo5KrkGeJw5+g5OJYeLcq1JH/wbR970ZIU1p/nwsynAV3udkgm2PaTfXje4D2C7D3NfbGjxK3GZy0TncJclhNrwMLZDY67I0SGy7NqDAgsTnh4RPWGluVsannN2Ychzutzh0nrx66OhT9CMLXrW6oLIoIa3ZmbUSU38fomtBDbLSyWNcSVXYctJq7tajzUCahpTaD7BAZ1fPexqpIGhZBRKPAQ2MR6mlPy2aWnGX0zpm35w/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enfIGUhhvDBmZOOL1jGIxqtRs6Basm68Vb70YeM5t5A=;
 b=BQsl7swxVwQzPZGumSXYsDKiLW9+J8emC5bFkyR20VhCSMSRYjYhoHfdwrxG8sNETGmXrfzZRCul7PIZHgVDkMCao8tJPbT1J+Ti535JxQBNopewz3/orf5PUivzHvnu6aV/S4SR9XnjOExKd51FWwtquQL4r2ahsYw8pf7LHQPv6pJU+qS6qa/939Q68RaiWSmxjdKiZsGfTI7I0m9IV/P+h2O6MXwgOQvl43OO9ziIvr9WoRQHxQ8R/d8M3yz3L9XMdgltVvtMbsDkLjyYY0CsHTumHVEJ5ylJpwQ15QwyqGrDc/oJ4SCs1OkgkHycT/dbRWCyaTZQao9BKK6tPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enfIGUhhvDBmZOOL1jGIxqtRs6Basm68Vb70YeM5t5A=;
 b=NnMx/KpXZECVIPSwdB3aw2yEQ5COuD1525h79nnG/baGKXholK3AjBNyTLcX5Gd5bwwhGS/slRNIQSWuRR3fOBBt26xwe1xgoM7J8iH2U3+aU3tDpLB7YlExyjRyWlhTNMkuH5+TGA66xAbpxRvrb//Oouap31VmlDdBUMgoxnGHU5qsVeKjDFmnhTpOWuEH5p88b4E2nXJPn8DvAh+lERQVKfI9vongT4xOS6WdQfFYuYwePxmQB+P7KtOS/sqCyLdjjZo1zVq7RmOrZJyFQwoy+146ebOMpr3BvxF19L/2C9MIVkuaWvdx7l9GxtKVeE8++bXzOxQG9afIquIguw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d18a1e2c-4396-7d7f-bd28-2d9e71107862@suse.com>
Date: Thu, 3 Aug 2023 11:17:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6feaa4-8585-48a2-b5dd-08db940280b2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xHCoWj2w69YZQJYSqZX586pz0PEPyRBj5pUexGPupeckulG1wCe2VI7nEbhIqpZltehrirmD3TCKdkMLO9CB1AeMDtQ1GuyMlKLxnG6jLiDEWukCWJ7EnFPvQmHt+ahJwRcxJveRmKO7M0kC5P3q6jF08+vADyzMbgBWB0LGHi9r90883u6AxUHCDEWnHZd77vRqxBQUpFhLHACIMajofKudSueuaEbXL3PoI0FeMOH/xuki00tlPk+wg0fubIQnw2E2kpYgYnq38Z2ifQoIRSK9vmIgCVZsxY1r4C2CJRySyg6rK/zU3ZFrIOZ+mqap8hjzpl6k4MuiPhAXK4I1YRCvzQtE5xQTF1K64nvaWMdzOFbWfmj4XY+3K9VDg0/cMVySLPbRxsoQwbf6dQnS2csQyuBjQ0H0Irdcp9GlS25B9nV7Tft0pw4RTsF2AQu8ih83Ihz9Ks/4izoRMh3p8zDLv9qRqLBOZbAgWLwtWRjTlD4NtuPSPkOMjQBwlqYRRQugzLkeOlPz45R1Kg34gxcxSgHlT2D5qm/Qu+sb5T4lvFAuPnKCXJ17nJfeIGfZrHjwYsO0AsaOzWX5fS7QkrJvWQaD9EK2IznmdybkbYXmVG/Io/Md5IsdAFgMBh2/1QM5UHcbVpJBgyEVOKsYQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(4744005)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2w2cThSdDZNM0xKRVRmSnJaczEwZDBIT212enI2T2lQU054SEU2cHU1UUdL?=
 =?utf-8?B?eGJCdisvZHNqcFRCSkJzMjBlOUhXKzVpU1huMVlKLzBObkNRVEN2bVVFYk5t?=
 =?utf-8?B?UlNjK0pVRkxMSmlKNnE4dnJpWXJCNktlakl0TUZTdzh1TWtyNmVkVmxkMUd6?=
 =?utf-8?B?Vk9VYm5BTEFTZkZUdUYxeUFCS1BzVTNyeWdkK1BoeU9yRk96c0VTODZyM2VU?=
 =?utf-8?B?Mk9lNit4dHJoMmFnQkFaVksrSXdFNjhMbzgxUmRnZitTZEs3Mnhza3oyNGVx?=
 =?utf-8?B?YXdpcWYwWVcyc0Rma1hBTHFmT2d4ZnA4Yzc1RkQzVFVWb2ZNNlVtaHhUeHMv?=
 =?utf-8?B?UWxUeXdKY051VVdadFhaTEcxY2ZGNmhoTUg2M3kzOXh1clo1ajU2ejJkNTBC?=
 =?utf-8?B?bnJVemx5QTB0TmZVT0lZbGU2QzB6WHJUY2dzNnFiTC9PcjJ2aHBNVEp0VnVI?=
 =?utf-8?B?QXhVRU94aU1Na0ZFTjdlMDFqckh5NVdJOXROODBCNGRqNFRJd0o3ek1PTEhE?=
 =?utf-8?B?aWt1RVEzU2tBMTRxaVgrYXlpb2orZGlyckI3bnpQbmkrVlN3bUNjN3pqbEkw?=
 =?utf-8?B?dmdxQjBsQUtxMjMwNnVLNDk0aHpKZm9KZzVsMHpTZlJPanM1MW1WQVd1M0Nw?=
 =?utf-8?B?TUNTZ0hDei9Mb3EwM3QxOGVuN25VVlJuQW1qdk5WRmJEcEt1MURSQVhrRFdw?=
 =?utf-8?B?dm1nZmFwWHFSR2ZiaUJXQkxwcnF4aVVvR3ltRlNYbC9CSDdCY0hjQW1uYXpo?=
 =?utf-8?B?KzZIcTJKNGs5QkVZRmhBMFk2RUdkT3FrbDllZWFKck12NGc2ZG1sL1MvSzQy?=
 =?utf-8?B?cTVyRDIvTDJvR2w5ZzZrVEJQa2NrcDA1aVJUblY4Y0duQzRKVEpzMVZMNkRx?=
 =?utf-8?B?S3psTFRDOHAzOEd5QzdUeTNSZWRjOEk2bWJzRFI3SUgzb2svYzROcm9zN0F6?=
 =?utf-8?B?QUdRNlJkVmgzL0g1WDZDcFMwMUNlQ3pjU0d3aE1RZ1dGVVhXeUhlNG9BeklN?=
 =?utf-8?B?RnBoYW5meGtKa280VS9hZlBDSHNGeGc1bnJHbXJKZWJ0RGZjZE8yYVlxSlNi?=
 =?utf-8?B?MGVVc09aVGk0VTlZMCt3Q2JKUlR2UXBwTVRQNHZyeXpQcDZtaU5qS3pxUXd2?=
 =?utf-8?B?MUJpYUwxV00rKzhXOUNVc3FxNVBGTWR6WmZzM3VrVHB2S3d5T3QzcFpUWHZy?=
 =?utf-8?B?bWlzT25WOUpKL0x1Wll2ZmUrSXhzZ0hGVHlLcEhmTmFURlhjRm1TaTFtMnZa?=
 =?utf-8?B?NXoyQkRBWkloQmlnaEF1eHJ1d055Z0I1LzFVanRQT0svNFA4TWxYS3hjU3hI?=
 =?utf-8?B?ZlJGenVBa2VldTU0dTdCSzFOWmQ4aC8vY01QMC9RK21JMFRDYTN6WEJkTDJl?=
 =?utf-8?B?Y0xURUh1QVNFUTU2OHcraFZhdUJLY1R1TDQwVXBlRmlsWnhzN2N3anZTTXRy?=
 =?utf-8?B?ZzQwU2Z4Ukhjb25GZ292WnR6M296K0hGKzdReTlVSk5YdE5VRzJXYUxLd2VG?=
 =?utf-8?B?bTlydDNnclg5VXBsVVprbzU0RDZkMUN2SksrWFJmb3c1OWlkdWt0ODlSbW00?=
 =?utf-8?B?ek92WGQ5RUF4S2x3OEE4NjhzSGV6SFJGcEJZUkNiRnNFd2ZmK0R1WEZKWUNw?=
 =?utf-8?B?azdXc0xNTmM0S1k0RXdPQ1BweUFxRTlkT3RITFFLQjQ1c2krdEtYcGlDVmQw?=
 =?utf-8?B?R1lhWHJudGJlVWNOTy9mS01jUER3bXgvRFpwUUhuQzBaMC9lekV5SDdMY29q?=
 =?utf-8?B?UXhkTXgyalFDc25iaFF0MGNvZHluaDZxMUJDckN6UWx2THQ0aGtiRjlpdE9x?=
 =?utf-8?B?akVQYlRqakNscHRwSFUzRkJJOW9sNmpVZlBCdkpSM2ZxYUpMS1pmSzdEaVVN?=
 =?utf-8?B?WUxGUlRPcmJqM29GTE1VVXgyL2JaZ2ZMVWM0VHlqOTdrYVlNNFFubSt2NkxV?=
 =?utf-8?B?YTU4dGVwQlpPVVNQaEJsTGNoVFBKUmxwbVduZXpGeU5WRDhsVENvbUpYSEVa?=
 =?utf-8?B?dU1yK3IrSno1eTB4c25KYkNZd2pSckEwVm8xRFlSM2lXNXp2d2pzdzdqMDdV?=
 =?utf-8?B?OG9yOC9Md3g5RGs4UjFMMHNqVUtZTWhDSTZKaVNhbFNBdUx5b3NDS0FLclo2?=
 =?utf-8?Q?3F4ZFZcvKt1gvgm3YUxXby2R4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6feaa4-8585-48a2-b5dd-08db940280b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:17:47.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFvUo+XwPl58QuBY5dSca8uDirfjvQUYHnUnfLR0PpTAr1S+gt6nIDMSLIi5AQwHLvNWLHcs0+EWtNbKe09KMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8678

On 02.08.2023 16:38, Nicola Vetrini wrote:
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
>          /* fallthrough */
>      case TASKLET_enqueued|TASKLET_scheduled:
>          return true;
> +        ASSERT_UNREACHABLE();
>          break;

What use is "break" after "return"? IOW rather than adding code here,
imo a line wants removing.

Jan

