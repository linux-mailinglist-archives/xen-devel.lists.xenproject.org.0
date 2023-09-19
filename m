Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C877A619E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604633.942119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiZBF-00067I-JI; Tue, 19 Sep 2023 11:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604633.942119; Tue, 19 Sep 2023 11:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiZBF-00065c-GU; Tue, 19 Sep 2023 11:46:13 +0000
Received: by outflank-mailman (input) for mailman id 604633;
 Tue, 19 Sep 2023 11:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiZBD-00065W-Sp
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:46:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f316556-56e2-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 13:46:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9406.eurprd04.prod.outlook.com (2603:10a6:20b:4da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 11:46:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:46:05 +0000
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
X-Inumbo-ID: 1f316556-56e2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI27OGNb0/lbYZV1jOYyeFyj7kKu7G/Dobc+5LLKfzrWF5siDoQqkUW85uVqRwZdNGCM5TVDigIUcWGndCLqJxQvXcsufcQ6OWneBjLI2zcnJLGsJLEfYI8Lmvea0ZUby7D4bVfpQDCv7gvztIXTJCc0vBFIAlwBFvxiIV66MZ/jK/FcO4QqUJ2st/9YRgnK/PIXZeFeD1IaKLD0X+HeCCrO4l516DHDQyZzsr0dve3249cKEnJLfgbGRecN5D50DyBPXcQ1v6AywVUX9Fj0fFk5MtHFlLnRcYmqWitUPEzFUpJsjKamQdGrqbRE87n09qurgwTYdpFSEwlI/ozHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN9zawvMhjoZ53DoBECh7cxX9t4/BR8dWT0he8sNyz0=;
 b=i4/V1WGpCq2AYcaP4HBg8muvFXZQSAZ4lPtRljjFX+eWNXyKVFXaPYH5rQg+Kbmsf46v6ImOLRSj+elyYr5b9aPq3IZxK7YOgvmOcSbCHBCbC8agRIE2i6t6QUG+ry3nGZ+LGA5qcX5vcQ1SSGtak41GYBo/hE2OGKHjmKvZEi0bmE54cjY+bTM9LOhr51XixOE6T1oEssRbPB4H+VebWe1h58BxxDyNZXSjgFowSHUCNE2EEyQdam4BCyMgVWx5zfR1UFUvpvvcjojcvs+tnFh7/dF8cBMODSg8u1pS5inXncdZbOJyh6P9lM4LNYrPHVFb3VLbOZEjDdbxk2VV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN9zawvMhjoZ53DoBECh7cxX9t4/BR8dWT0he8sNyz0=;
 b=sZfOUlrMyrrk3dp1gvC3CBBDMIAQYLjwqYFjNHTqih3NSgtlEpGQmwr5BDiV0DfiNcW7c1c0bZKcNeYanQLAZFzogPoJi8P6i7XvEAoxFqYCZJa4yNbtYjBxKS8UVpJoX0dBehI6hnWN5/PJymhvLsIxM1hn/O75LjmVII8nwj9e2snU0BAmIrDWK5ldX+irhUNFUAsot7eF5JktaBrib+L9i9aBMCIBeITEkfA1q8jN1PhYxLmOw64U9MpBzulCeViQqDaadMKEvtd/C0pkoCJsFj9mj/4BehbpAgzLF/ptpsZkBxDfMeUca7nZn6WbHQ7/WUlD0m9oa/4AU0qkWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a576bdac-42b2-3d62-dbf5-200fa68d7513@suse.com>
Date: Tue, 19 Sep 2023 13:46:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86: Fix check_ist_exit() assertions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230919103514.1076888-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230919103514.1076888-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 53198193-b97e-42dc-2399-08dbb90601cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pT9gHje5JYBp7mpC5G6fYwrqk7Z03Ei7Qqhqd+GBQdMjYzU4gMx3tK2eIheUTKB0ZC8qgL+QSUrRP+sRHMLyppGbvZS1tIDYtco7I8lcb4NkgKlPlBbshcdIaFeMNOnpIx1pEsk83v33NnIIEVx/5JsfdXYrfiSeE984lpX/P6mPfuvipnYH3XT7+nmp1WvMiiSw5IWsaTPMKcT2LdZCOAj5+LsZPwd2x+kiLG1qUdIJV0DO94aOF10Bin5tXcMhCggyll2XDNZ4eqS65+TfE9oqWxA2+Uf/e5mhzEP4dHfvOvId5Nw20Y8I4CpZ6rDZY3butgSP+36F0hFG4Aki+OA2wPMPKMaQSSvO1z62PmBrW8YFE8hPc4VTM3tg8jo9rH5LUaYkdbYMJoXE9z99CDosOmWibggSHra50AsoIKy+Tt2ix7FKfgI1sZJ3rC0XfUAAzCdSrUXT1R4kWhCAib99Hwaryk2S7xgy9w5o7YJUuJQ4Hz78WJX/Bq0jsl0zUrWgnac5MmvH4tKN+jE8+iioMLqkKczVhB2vJTJmaKSx9c01gSdOhlfhHDDhwFX4TaMcHkl+QVEa3imEyiGNL1glULgwJ8PHg9ZmTHMb1A+NdQWbmiplFmTyu86hgake
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6916009)(316002)(54906003)(41300700001)(66476007)(66556008)(66946007)(478600001)(966005)(38100700002)(2906002)(86362001)(36756003)(31696002)(4326008)(8936002)(5660300002)(31686004)(2616005)(8676002)(26005)(6486002)(53546011)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXl4cHJuVndVbFozdkRITTZ6VkVrejBrcmZrSGRYckJrTll4aUdjOFNKdUk2?=
 =?utf-8?B?VVlsVlFqVWNmeXRoTGNFSFllTWtjd0RpYWtUcUptWi9GVjVYc1pFSE9PdDZ5?=
 =?utf-8?B?SHhrK1E3MC9Ua21YZEJReDVYVTdQL0xtMk9oaW1GaGVCM3hXNE1ZTTNaYytB?=
 =?utf-8?B?bjFpSFc4bzR1d2hXTFFpMTRHVlVCRU9TbEdBUHozYnpMZU5EcUhadzNwUVQ4?=
 =?utf-8?B?UmljV3FQeTZ5UWxLZjE2Tm1GelJHN1A2NDdkMkt1VHQwa1crRmtyaUR3c1l0?=
 =?utf-8?B?ME9JR1d2ems3Qkc4ZS96S3RYbXJiU2VwMUNUcHVGUnhxS1RyREloS3lhWFZk?=
 =?utf-8?B?TnNEaW1HMWovTHFORGI2SFBnMzUxMGRTT0VoZ2VFeTRsWTJUQ0FMb1VPcDN6?=
 =?utf-8?B?MGYyQVdVSlNHWFZKdFJkM1krME5CL2U0KzVndU11UlV5c3B4R3FYbnJzcmZ6?=
 =?utf-8?B?Z0l3bk9BVUFFeHZNOEl2UkN1TjZvQllwRmNZWnBiNWJLejVxUzEzQTdFLzVq?=
 =?utf-8?B?Y0NoTkpCL1Mvb1pTaTdJcy9VQWxWY2ZiNW1jWkVnUlI3Yk1rZWlrbmxERzd3?=
 =?utf-8?B?ODNNbkpIbEJQZXd2V21Db09YVWNpT1F4a1BXajN1ZVJWOFlCbitsM1JKR0p1?=
 =?utf-8?B?eE4yVHU0QmRzSmFicm5tZlZvYkVEZWZkRGE5UDcwcGE1Yzl4Y05iTjRVTFFS?=
 =?utf-8?B?SlZ0WC9NNWREbkpFRkJpQ2FJc3p0cy9kRThXTkppVDNWNkNxUW5ic3VqZncr?=
 =?utf-8?B?V1ZxVVlvS0JVWmlyVDllOWgyMFF0T1hTRWlnaTU4Zi9Ua2VoUjJiSjg1KzFG?=
 =?utf-8?B?V0pVMURUWks2UG1BWmovRUJ3cjNieFRIS1JWK3dFMzRKUk5hY0dCMGlJRTE1?=
 =?utf-8?B?UjhTcnQwVjhLcXMrUHZEVnNmWFpFVGJzQnZoOEQ0VU8raDUzV2N3dEVJZUwz?=
 =?utf-8?B?SUMxdWZJUWEydGwyWmVUd0pkbTlWRHM2NzNHWGJvOFpuUWtaam5KUytlL2dC?=
 =?utf-8?B?YTFEdUZtbi8ySm50cnFmM1FwRjBnNXl3c1pmbnh3UHJ5cHFQN0NFSloveWRZ?=
 =?utf-8?B?b0NNL01nTFVBZEVJdmE5MzU0Sk40Y3g0TUpPU3JmcWhqMFdiQVdQVTlqbWNw?=
 =?utf-8?B?YmhyUWw5UG95clVhU3lCdG91ZHovWXdwdkVxMGNGR0VQditmQkhXSnN4NTVl?=
 =?utf-8?B?aUZyWlBLL09wMWN5VFlCSGFyOStaVXFENFNBSUVWQXlhK2dLRlNZQ1Z1bEtS?=
 =?utf-8?B?WGVLMWFNZktaajdUUlhtY1Zpa2ZBMUhubnpYaG1WM0x2SlNpWUliTVRwSWl6?=
 =?utf-8?B?U0I2RlZ3SmpjWkVjN2UzdkhnMGdFTkFWblpoeGxBaElFMGVKOUY3M1FKZGp6?=
 =?utf-8?B?Yng5SW1XaUhhbGVzcjNyaVFCYlVqVnJBNlZ0UkVTb0laL25PdDJHVm9ma3ZV?=
 =?utf-8?B?bjFZZEtIMUZCTnhvTUNOMzlwYWZSWC9WYkYwUGNTTDRydFlDQ25uckpRMXRu?=
 =?utf-8?B?SDhqaDFHY09rZDdQN1NsMTZpVzcrNGpqY0N5WElMNUkyN1pNb0JGcktLZU9j?=
 =?utf-8?B?NDcvZy9weGdnR3ZmOXdHRWxsOVlDeTBTM3JEWUpnVTQxUmlMdmZ0VW14Q3R3?=
 =?utf-8?B?a3IvYk05ZkpQMytLYzRyWTNKZUhHeUQrV0FPdVNTQ2o5Rlp0eFkwL0lNeWYw?=
 =?utf-8?B?ZTliOUhRdy8zUlRuQzkwUzFCeE9McU9sd2Yrb0kyMlFXaG1Ic3ZiV2hlcmZK?=
 =?utf-8?B?UXZ1Q25VK01WMzN4SmI4TDJIUG1YZ3praGUzTFVmSnlKY3lST21mMXNZT3U0?=
 =?utf-8?B?SU5uZ0tyekNVZW9pOHY4bFA1TlIzR3BMek5xcGhadlVtMWFETktLdlBEWGls?=
 =?utf-8?B?NjFiblVVQlVyeHN6c095MnU4MDRCeW5OYk1XNWtlZkUrZGZmdzdTRzJnYUI3?=
 =?utf-8?B?Z0N3VkFOSm4rbXdIdm5Hc3ZIWjExUEluY0VXWlBvbXgyR1V6ZFMzSnZDWjNI?=
 =?utf-8?B?c1RZNFVUOEhxY2dhdnloczZ1cVhOZnE3dUJKRnZJUjVlelVqeTlFTDlmd3R6?=
 =?utf-8?B?d3lhd3dLelh0T3kwVUUrZ0RZcFFpTHFQWVRocElPTThNMVBMYVpIdFB1VHdm?=
 =?utf-8?Q?7SdsKjsoZ9BplA/d/El2PGWzM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53198193-b97e-42dc-2399-08dbb90601cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 11:46:05.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /j8qAvlOHhUllq3UBGpp9v8Mi5hebJ4H3Uk8pJuyYDPQgKRY/1tQOkFjYfZrjeTe3iZAt92NA3F2yOC5wMg6GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9406

On 19.09.2023 12:35, Andrew Cooper wrote:
> The patch adding check_ist_exit() neglected to consider reset_stack_and_jump()
> leaving C and entering one of the Xen exit paths.  The value in %r12 is stale,
> and depending on compiler decisions may not be 0.
> 
> This shows up in Gitlab CI for the Clang build:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827
> 
> and in OSSTest for GCC 8:
> 
>   http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log
> 
> The justification for ensuring ist_exit is accurate in the exit paths still
> stands, so zero %r12 in reset_stack_and_jump() to indicate a non-IST exit.

I did think of this as an option, but I don't think this covers all cases.
If we take #DB while in a PV guest, that'll be an IST entry. Assume further
that we re-schedule before re-entering the guest. Upon the vCPU being
scheduled back in we'll have %r12 clear with an on-stack indication of
having taken an IST guest exit.

Jan

