Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32461850C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 17:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436888.691081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdLb-0001Bt-VO; Thu, 03 Nov 2022 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436888.691081; Thu, 03 Nov 2022 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdLb-0001A4-SK; Thu, 03 Nov 2022 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 436888;
 Thu, 03 Nov 2022 16:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqdLa-000197-S2
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 16:45:43 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2086.outbound.protection.outlook.com [40.107.103.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ea666c-5b96-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 17:45:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6846.eurprd04.prod.outlook.com (2603:10a6:803:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 16:45:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 16:45:39 +0000
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
X-Inumbo-ID: f3ea666c-5b96-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUKtGXSkLvaco79hV0W2ZSiMcVT0KvJwfMYKCdznPrf9rlaPQm/BsiROJ19xSGURHjoA3qYBXS203no8zvqKzVgVEonJUsW2Jms/E3Ylj7vrc5U286D08e6KrO5qpzgA6I6hDEoftFRkLOem8gYYccIE83L5tELoW1jYTx/hUHqqOJkZnlWj1wtbexJviOxtnUT/+sulpjWujVzKllFKba24zySXKdfMVwoTu6aZLn3WegKgW5TpVA+DVtXNVuAnbDq9OJJtno78d49noJL7HtI/FeNX9D3edhyxjoPLwvlL+Vz09slfgu3Odw6Zwm6/lZqXfG5P1d4juwmbGh8eGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciM688YFTQ2O2s8+rccgGozuFycwStj+ET2HgOKN0Jc=;
 b=XQ6tt//dC5PtUYSGwDdZNWVAVSUDDzusfUhdIXmpzBkMf28qI5yK11pM7luNn8Cfokfw2216O+B1zfuODYgZGTiSwnM4YefG2EEbhLw5MUvxPGn8hbsOpeM8cstKemreG9waTpTaNckLIAH6EBE1E+yPKd9IsX+C8xavUrOBlYQYXSs4AzqnsqaNjShcu/4pLPoIXj9peHfxQT5/cPTtWaYYKSb/Gkmssxg12CpapUZW0bTnN7Js8s/T8fTntPYtDleTGI4XKlVDUowqM4TeICzyvfDdj4vSjPwKLThHYKf4/OoW07D5ZyIWR9XOCPqJsLbwUSHGp7O8//fO5Ogiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciM688YFTQ2O2s8+rccgGozuFycwStj+ET2HgOKN0Jc=;
 b=24gUraJCoz7siwrRSngEt1iVIPzyKdBeTVhRk+46OYyiL0ZVkSl4YY5e/dVey8pkwyZCeEe4tUK3Spw3+eQtZR/5+Z4IxJptNiGT2I9OOLuH2CqufviO1U1J4FWHT73DGraDmDvrWrp8WBssu/haOPJ80kmchlh5RhVk60s3SqUJSW7nRaqskpACqMyBc9JWj968CIXimygkb8aeyl+quPjM7FsFPxXu/7CIUnKx8eZs22+5XQ9gEqIQn51h0j93247WI/hlNCmEYetdRy2qh7/1FcMJOU5vg8xbIouxSqfgs/fKsuu36e5tER0mDtVikd0tBACsGUFxOhon8YyqFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc48e60a-a048-b954-eb64-53446dab9c32@suse.com>
Date: Thu, 3 Nov 2022 17:45:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH-for-4.17] xen: fix generated code for calling hypercall
 handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221103163631.13145-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221103163631.13145-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6513b1-e413-4148-3593-08dabdbad6fb
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8wJ2oNopDhEEMkT4fM136HZo6TOa6yU6P6s3s1Oa5tkvivanmfsNvB3lNRNem9RMq4VpM6tULvy6qQrl2/CjV/hwX/UfZpLD+qZWgfbOcRqoEIYVnN3TEMWr8adxFXFptdTIf8iRSeJDU9J20pTeXN5Fsf73OS5niDUuHF7O3kmiuC9dsI7OM2FsOs7IeMkmpcvewVP5iCW3RbdqSQFzvqxghvLaTnMCd/bK1khVgO5nFA/y7qy4WFRnChqsWfZaimlHmyZxVSd1zbJmXSCE4ykhTjHOM4+04oBqybrco1c7onYqRf5dQXSKln7Y/wGZICgqN8XZxkDCyZadvNPZnRKvHlmTnBQ1Lns48Fs1zuJ9NPg+v+bCZNv0UbkUMQV3233WWPq6prVkR4WV2SPHuPr5jgxkm+aFBjTWRioJLA7su9rnE9vzDkrU8Kyb3Xtl1kVbH/shFXOSt+8JsWqcgZJx26bVPW1aenDdu1hSPAEZgxmaUGiYeoxoE6rA/GiuhHTLqu3B1zLzpaRohJKGK7o1SML/meBkAKyftyN9Ue8TvBAk4qdCgjlAEhvEmL6ho4RRVZaa/+CJ4fQZp1JLEOa+Z2bmGrhGReq+iQbe0S+a9cUKDvENJFTR1az+TXVDOkS/QFWJ5Sz2aZ7U9cBfUlbDo++3M3blFuQ20JXhCMcTE+HqyXbcPD91JaO4zR3LpwjLte0NAWVDgS2N6gHlIv/F7iFe+4bMtTUhCzgPEIhREZlCQm1DrOM+izGMQlcQ6JwNVxQ6RFA+DQ2RkNyfEEHVhuL4wg87dzoskC/y5dM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(6486002)(186003)(478600001)(2616005)(2906002)(54906003)(38100700002)(6636002)(37006003)(4326008)(86362001)(8936002)(26005)(6512007)(41300700001)(66476007)(316002)(31696002)(6862004)(66946007)(53546011)(66556008)(31686004)(8676002)(5660300002)(36756003)(83380400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEt1WkR0SFI3ZUN3bjdZVi9kQ3lPS3R0WStkZlpYN1dXWWpMZmp6R1BmOW5o?=
 =?utf-8?B?Mm1iQ3MrZDRRbUd4bzFxczZWMHVOVzdVMkFXOTg1ZDBUOXRoM2tSOHlFSmdn?=
 =?utf-8?B?SXd0WHhoYW9CSnFlWDh2Q05yQ3ZZdnJPSXJqSWZLT3ovT3B3dEhqc2ZMMjAr?=
 =?utf-8?B?bVM5MlhycjU4OWNQcnQ3cHU0WllzS1pzVU5UMFdvZVFqNWJST1hiUlN4eTBU?=
 =?utf-8?B?c3MrU3NEODFpdUx0OS9MTGJvdE5hcmZySkFNbitxU2p2MzV6TWZ3c1hUakNl?=
 =?utf-8?B?Y3MzSWxKemRaNWZDS3NnbkhXenVVUFhKd3lBYkxqdnF0Z3ZHTzZvZGVJUzFh?=
 =?utf-8?B?b21oaXlGTTQyMWxaV09DeFpvOXRQRUlsem9FMTZ3c091dHg3R0htaFRpdmVj?=
 =?utf-8?B?TDlabWRRQWtWVXAxbE5rWElsTmE5aVJJT1RzVVpQZ1RyQ3cvL0p5SGIxL0U0?=
 =?utf-8?B?cUU5M3pkWHRrZUFBejhUYlNJREVGcXJoUFNRVWhlWkVpSlBnQUJ6cjVveDda?=
 =?utf-8?B?eUVWd0IvQ2pNeGtVUGc0ZnZCTVJSMk5VU0JPY3lndFRHY3l4QXZsYjRldXpU?=
 =?utf-8?B?WS9tYXZZcFpUeVZka2VPVHQxVXRJWFh5L3ZCQ2hQS1dyQzF2Z1QyQWxqZXRm?=
 =?utf-8?B?UlJwZ0dhUDJUM3Fueko4dHUyTVl5L0EyZko0SndGeWRxblc5VjVHcGYzWjdE?=
 =?utf-8?B?TmlTR25qNFVrOGJvYjgySXJyWWNaUlB6Y1Z1SFBVcWpsTFhRM05ydlBoaHVW?=
 =?utf-8?B?M2l1NmMvSmt1dE9sV2dqMWIzUGxabTk0d3FZMkNVS2piUlNmL0gzOFVyQWZZ?=
 =?utf-8?B?NnZsVmZtYjhJQTJwWGxXckJFNnE5QjREalNmYkpkekJZeUU1MjFSbGxnYklK?=
 =?utf-8?B?S09lamdNdUpZK1AyckU4eUJGNEhOOHZWRERlaTJTU09neXhDUHpjakV1YkdK?=
 =?utf-8?B?MUt5RSt3QjV6NitQNXZicFFPSFQ2SXRjUTNHZDBxcEwwVlpnRkNacDRyUDdu?=
 =?utf-8?B?QXgxMkluaXNzd1RibElrVHVQSGh5NG5aNStxZmRRRGsyM1FkQms1UUtEazlT?=
 =?utf-8?B?VVhkbFBSaXVZUmczcUQ4ZlF1aFNicFc4MFU1OTFVejBkREJHbjAwR0NUdktu?=
 =?utf-8?B?SUR2UXVscjVlcnU4QjdTMzRHKzVEWkV1cjBLU0JQc1NaNnQ1d0VEdjZHZm9y?=
 =?utf-8?B?THQwWmxZNW45YUMwOWU3cGhWUmpaYUk0aHFlTUhUb2o5SlUrNXhXcTNtT01y?=
 =?utf-8?B?a1BtUnMva2doNDVGRWJ1WThNM1B1VUhTUEhIbmZJZ3ZEQmI4Z3pOSVNBTWNC?=
 =?utf-8?B?MUZDTUppUEdTR1JMeWF2cVZsOGV6cGNFZjh3YmpyeFN3WHpRZ1VTcTF0OVl5?=
 =?utf-8?B?VHRIYzBGSmd6MHRoVUloZEI3a3orRFpLQU1MMm5IWUpUNVg3YUtUZmVlL1lk?=
 =?utf-8?B?TzZFTFprRFFMQnBxZkNGSlB5eU0rb1JLYlpoWFh2R3k4UGtkL1gxNnVUd0Vk?=
 =?utf-8?B?TFFRMUJpSVp3V1UyRkJqQ2VOKzJLTldtVTVoQ05zeXovdWhMUXZUSVJ3Vngz?=
 =?utf-8?B?d01pVmtuekZrYlNsU0xLU3B2c3NtSkxRMzlWYndmTmhIcTh5Sk1MN2pWNVlz?=
 =?utf-8?B?d0U2Q3YwSkZmc1J0TEdUanBFZzhUVDhmYit1eUt3K1hIV0pJMDJkRVBIVnhj?=
 =?utf-8?B?cytXL2FScmU4RGxGU1l6aVplMFBJdDB6VmZQN1dsUTF0clFOUGg2NE9qalJ4?=
 =?utf-8?B?UkRtN1g4NjRyYmhsSlNWOXlROXcvcGwvUXBEaDNuMjVVVnNRbFVMa3J0WlhU?=
 =?utf-8?B?VGVrVkV4dFhwNnRwRFFYOGJjdDR5eVpmdGRZRktzb0lmc0xOTW53VnZkVENy?=
 =?utf-8?B?OURtdHkrN2w1V0tXVmgvVkhIVnk1VDhxZlIwZERVbXNvUFpxSEJ0ZFphY2Rq?=
 =?utf-8?B?ckkranoyelZMT0twRjluN0RrMkd2UUE2RnlrbWpsQU1oMCt6S1ZqU215b1FF?=
 =?utf-8?B?Ky9Mc0t0Q3g2THZyM2hYSnI3MXJFWXBvVlVvVHZRMmR5RFBtMWh1SnN6MitC?=
 =?utf-8?B?emd4WUg3VkdMYnhIUDRFUmMwcU5SL2NxY3IzMTMyVVpGU000WGg1Y2FCa1Nk?=
 =?utf-8?Q?EA3sR4b17sDMwcy80f9beCNyH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6513b1-e413-4148-3593-08dabdbad6fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:45:39.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq/YORNNkMGmJYG+m0gdwlej42ma4R7e2E0gdvhVILx5OxiEc7ziCtLWDJ1tFsIuvoKfILNLd2OsY9NJ6W7Tpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846

On 03.11.2022 17:36, Juergen Gross wrote:
> The code generated for the call_handlers_*() macros needs to avoid
> undefined behavior when multiple handlers share the same priority.
> The issue is the hypercall number being unverified fed into the macros
> and then used to set a mask via "mask = 1ULL << <hypercall-number>".
> 
> Avoid a shift amount of more than 63 by setting mask to zero in case
> the hypercall number is too large.
> 
> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/scripts/gen_hypercall.awk
> +++ b/xen/scripts/gen_hypercall.awk
> @@ -263,7 +263,7 @@ END {
>          printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
>          printf("({ \\\n");
>          if (need_mask)
> -            printf("    uint64_t mask = 1ULL << num; \\\n");
> +            printf("    uint64_t mask = (num > 63) ? 0 : 1ULL << num; \\\n");

... "num" also properly parenthesized (this is part of a macro definition
in the output after all). Easy enough to take care of while committing.

Jan

