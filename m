Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D4964CB2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 19:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786035.1195591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjisP-0006mI-PK; Thu, 29 Aug 2024 17:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786035.1195591; Thu, 29 Aug 2024 17:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjisP-0006km-L4; Thu, 29 Aug 2024 17:24:05 +0000
Received: by outflank-mailman (input) for mailman id 786035;
 Thu, 29 Aug 2024 17:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjisN-0006kg-Tw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 17:24:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a16bd6e-662b-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 19:24:00 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by PH7PR12MB6658.namprd12.prod.outlook.com (2603:10b6:510:211::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 17:23:45 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 17:23:45 +0000
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
X-Inumbo-ID: 7a16bd6e-662b-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY3itrknVLqDtjMIiTJ+4vOyIsINHvrj+qnbeAW2hfitq6cMLadI0gFJ1A+DEH81eV16Fx/F6dFwwVX3oBWCaZe8LFEm7u4TCuiws4xGFxoJFpGy55a/subQX6lr9djfSUkkk6zD7TbtNjPufrYiwciAjqVCMgSor7UdNHxOAoPh5a2eKD9IKXPG4dAoCfpQ7aoak8xG+CtLDfDRq2p/Ucd6p7YemYrqPq/dp7W33CfSy8djW7NYvBVMW+xcYO8iJX1t9+nm8IJkApg8KfT6ySbWhxy3f6/a7fQX3CT6yYNSNAwgO0dXHWj34hP73yHsYrySDK4Ruj3ZqaUoWoIpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJJTaqkI3DYB+NOL0fCH1RyECZlhQQPbFR4pvG2MHJ0=;
 b=HGz6jn4jlkNQaAw2ymvTi0jBk3TDxHD4U+vmXmJroB8oM4p0Wj9VB5Tp04DlvWf6z26bs4ZebHXwDqVoyt7FDbrNKPhsXV7Cxwiy3CfMu7Lu0rg4xIZv7rF2W2yDtfctx9MfzycOptnMLE2ghm2YnX9IVmo25jR/xkOJWjzU+aCasP3I2EPnDvIDPcRavwINNOSHnAR/cASedu8bvkXVt2PIsKJ5dL/zUM/XBhd+11qsdYUEqszZ4v7ByOxQ+bQoBv0ZRhlc7ZYSZJ3wRaxo/arnwOM82uOV8EZzIEfJhBmaw26h0AvOAtpCwXgkyMVb6+YBoWSqqtvDWFDcPJmGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJJTaqkI3DYB+NOL0fCH1RyECZlhQQPbFR4pvG2MHJ0=;
 b=MWWNW3LPObqGT1qEJIWQSRUCUe6oG/ibVNNTE8kTzI6YuRvylfOeZMiUCnj+Ht1bfJy+ic0wwjQNU/69sN+ytJmMA86fpHwSWALGw3LxVUo0Cp2wa9JO98g2CcjSQDlOI9jbDMBWBK75VhW53ajI1w5CnGkbaTMz16MRsXBXcss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fab9c785-3db3-45a9-b701-826478f9bdee@amd.com>
Date: Thu, 29 Aug 2024 10:23:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: fix false success in qemu tests
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
 <2756d5b3-e4b1-420e-8402-2697c559acb9@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <2756d5b3-e4b1-420e-8402-2697c559acb9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|PH7PR12MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb97ae1-3ade-42b4-4bc5-08dcc84f563b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alB3NW1TL05PVjRWNFg5NENKdUlYYnVnZFpDZVQ2MU1NZlVJR1ZCaVFKeXRX?=
 =?utf-8?B?S2ZaNWUzZ0NvNllaN3pKWW0xTjFiY1NnbTF0N1czNjM0QXN2aHRIajkvVXFI?=
 =?utf-8?B?M2pPeGlKNHl2V1ljUWpER3pHa3dScFhPdmJMS2F4clAwRGswRGFtODluQTlX?=
 =?utf-8?B?ZVcxd0wwRWNjSldpeEVwaE9hVWVVRVJZRWtDMDFUOUw4Snl0Wmd4N1FVVUtU?=
 =?utf-8?B?c3N5c3RnV08rSUlTVmJ6ZlRaZ3VWdWltaXNSeE1TMjlBdktLdStmdHMyRThS?=
 =?utf-8?B?RDllRjhTQXhpWVNuT3YvTzEzUVZjb1lZU0hDa25NM0dvZjB0TWxQK1JCTnNR?=
 =?utf-8?B?cHlNUFFOV1ExL0RiNnFYY1JYWUx3KzFQc2RBU1R5WkJ1dUdoZzJMNStaa2Jw?=
 =?utf-8?B?cWNYK2Y3ek1DcHJRaWZIcEh2MG85K3JOYkFIdWUrcTJiRTIrQUsydEY3cnpK?=
 =?utf-8?B?SjBXNmdHNkhxZzcyU1Y2WkdiaE9yS1ZOWEZNOUpyeGN6VTU3Rmw1Qkx0UXhn?=
 =?utf-8?B?cGM2VEV1eURlUDZuQitjaUJtOHVKN0IxVStqbmxtc1Zab0NkblVVS0VxN2FP?=
 =?utf-8?B?aEpQeHplZk1uZ3UyYmtaUlNlQmJSMjFiNVFRWVpOaldBMWZnaUZ5dmVWVHYr?=
 =?utf-8?B?NmY2dmRYZ0EwcS9jSTRMeisrOGlIazdaNnFLS2dOM2NKYXBsL2dyMGJIdlpM?=
 =?utf-8?B?TDRpbSttTWZnZDI1Z1QrU3JnVkFHd2JXcnhmTDFhbWRsbWpScy9NajZLWkV4?=
 =?utf-8?B?NFZhdkFBbzdaWUtRUjBUOC9mRGdIR2kzc1J2cHFpQVFXRmtPK2Qybk02aTNm?=
 =?utf-8?B?eWVXVzVBS1V0VVVGVi9pYlJtNjhIMC9ORUJRb0NIWGFQbXdzMFRzR3NjektC?=
 =?utf-8?B?a0hucE04R3RNRy8rOFBHL2JxV0NVMWp3anlEaXBta3JUSnhkNkc3ZEl6cTUv?=
 =?utf-8?B?bWdUN0VVRHJ2TTZZK1FUNk1JWEpQMmJZNmRPekVHM25kYSsxYTN6K3dCNmp0?=
 =?utf-8?B?MFdVTXNPNTg5SmJDaHk3YTN2M2FEeHZtOHdVVW1XQnhJa2pBYU1Cc1JhUEFu?=
 =?utf-8?B?UDh5eTRUQ0ZTMmdjY1dxakVWRDJzNC9TdDIwV0tOSS9sVTVIeEtHQ3cvOGR6?=
 =?utf-8?B?V0Z1eHhseTFNWXJyUUhtNGYzdGo1ZnhZWXV2SngyRUZkOVk3dTdTdkFkNUh3?=
 =?utf-8?B?WFYvM1NoVG1mQkJNaCtYYThHZStSTnpWQkUrOFQyL05FTHlOOVFrbmxYbklr?=
 =?utf-8?B?THMvL1NSV3UzOVRzTFYzZkY3dzJlZW5JSmNTMisyQndLdzliNW5pYkNtWll3?=
 =?utf-8?B?UHVtSDRwNDBabEkxNG5CN1BWckcrZVB1cTBzN1E4RE5kWTRScmpTRUxZbjVR?=
 =?utf-8?B?K203eUhoSXkwZEI4RWV4U1NJbnQwTkRraHpVaGNjcml4NVlTRUZUWGFRSFl2?=
 =?utf-8?B?NnkrZUwwOGRiakJXU1RPSXJicDJwNWFJRmpMenRzQzBDSXN6Q1FhSGFJZUg4?=
 =?utf-8?B?S3A4bUhmUjNDbkZ0RVdkRFNpMW52VFNUSEFrSzg3V2hJZXF2UXVjcUJ4MVdD?=
 =?utf-8?B?NXNKOWgrME4rdXB5bGttQ3VpQjJNZ0xmbTVGaGxjMG40QTlsb2tvM2xRVjlW?=
 =?utf-8?B?VjJYZGUreHpwVGIzSVNPZlkyUXZ3eDVxWVp6bEJDYXFTM3IxdDBnUEV6cnl2?=
 =?utf-8?B?VFk5dkJsS2NKTklsZ05tZ3NKY3hlNU84THNNRFpVN0RiNFBEajl4YURoRkxp?=
 =?utf-8?B?RnQ0LzlzTFlFa0VTVU9GYUk3dHQyazloUlVuYncxbjlqYUxqbWM5NGtuTDJG?=
 =?utf-8?Q?FJ+Yiznfmu+42ry00o6D31GDh+9bG1TAXmyI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9MT2JJZ3ZYeEJKbjRkaUFOVFdPcGhIWXI4NkRTK0pFc1gvODRPMHhQbnFz?=
 =?utf-8?B?eXJCSFFMSmQ5ZTErUmRUUUJtTVVOOGRueTRybUZEclVKQVk4VFdSdFNSVUJa?=
 =?utf-8?B?QUE1anJkZnpTc0tRT0RNQ09EVHpiMkhlQW14S3A1R0djdkFtdFR5SFZsUzhw?=
 =?utf-8?B?L1BOaXpDZ3VjdERNSUlKME1Ld1M1TVBldnFoR01xSThKQU5vclp4QU1XRTI4?=
 =?utf-8?B?SnpMU2ZSMXkvMGVMdUdnbTFRTUNHN0c0T2laV3F5VU9NbnBsRHIwYmZSVmQ3?=
 =?utf-8?B?ZnF3N2R3OVU0a09nL2tlcjRDVXpLb1JPZnBOL1BTNkZxMm14ZXFvTXRLM25q?=
 =?utf-8?B?UktMTmpYQ05vQUQwTTVNOTVNOEFEQUY2RWhnNmxKK1NNalpCRVZuSm8vbzk5?=
 =?utf-8?B?UDh3WFBFcWg2eG54RTFWYXdTcVJOY3FSbEFhS1BTVEkyTSs4SDVMalcrYTFt?=
 =?utf-8?B?U0t5bUh3N0FYQWlHWXllSDNCcXRtMmFRSFBuVFFsM3BBNzFsOGxzSElWaW5o?=
 =?utf-8?B?ZG1OVnNhUlJZa1l5WjI1S0FPOUdJK2RQSXhMTElpS1UvV1RVSUhJRXh0QkZY?=
 =?utf-8?B?QjRHUnFzQjZpZldPTG1uWm9VdFN6bTY2dURjYzNZcGR4MnRxaE1IbUEwUndJ?=
 =?utf-8?B?QTJJK1RoWGtHQ05WenJuNXlOdFpaWmkydEoxWGRwUDdTVEs3Nmh0dEtlRU9h?=
 =?utf-8?B?cFBVRVhmOGk4K3YycjhJZVREc3JZY056Z0VOOWpURldhbmRSc1BMRmVkazdV?=
 =?utf-8?B?M2JuMjJaMms4OEk2L2NDNGkyTzVTcmxwbDM4V0x2WnBnRjF2YStDRDY1cXp1?=
 =?utf-8?B?NUpvWHFQWkF2SlI3Tk11T1A2RXVZRHl1dE9DOW81NTJNRlF3UFRNdmlxcitv?=
 =?utf-8?B?WlFBV1E3MFZQZlVpMENoKzBVM21sRSt1UllJbnF5RXFNbFdQTFlSUHR6TkpW?=
 =?utf-8?B?M0NLTFBiZVlQb2JtVkxKTEhydHBlVGtqenJqQ1o0TjlPRG5pNUQ1Ny9lOXNq?=
 =?utf-8?B?Vm00eWdDK1lXQ0MrcENOckVhbU9JNVRueWpRblRmMDRSTEc4eWVITjZ6c0hP?=
 =?utf-8?B?ZGgwbU5zWVRKZW5tZ3psTlcyK0RtRjdJNE1RR1M3TlhCeWE2NTF0RnVLR1dV?=
 =?utf-8?B?dGpLcGZaMGtZbWR4Q2xSY2ZoQjZRelFQcnRxTmlsYmZKWU5TSUhvNm1NRWVV?=
 =?utf-8?B?MFoxRWZBSVhzaFdMUklwMjBnZU8vc1ErMU4rU0tjQkFVOWlmTVlvMEo4aVVm?=
 =?utf-8?B?S1diOXcyYnRFRlE0WXRyTzMzbVhYd2JsbitEd2x1c2pkZjI2UVcybjhVSDI3?=
 =?utf-8?B?ZXVjVFJxWHhEY0hCZjUwc2Nkdk84cDBNVVBpR1YzU0RYNVJQNkp0U1AyZldL?=
 =?utf-8?B?bXdhQ3BUSk5WZTNlR0xEQTd5aG1waktPY05vV0VDeXZocXhVQStIQnQ0SDFC?=
 =?utf-8?B?cDBRZ1pBZDFrTTJzdGZkamxPWVEvVlpnL1JqTjc2V1l2L09tekIyeWRKM3kv?=
 =?utf-8?B?QXdVbVRmUmh1aEtQS0EvQVU3RXZ4OWZyVDdYaXBXTFNaeGl1TUZiSXRybzRy?=
 =?utf-8?B?aHppYzlsTXpoK1hJYXJBaG81VzhrckVMSkNjUDdhUHlQbWwvcVNDaWV0R2xB?=
 =?utf-8?B?VVJmTVk2K1lSbzZwNFVIS3RHb2xlSTdaMVJWeGU2L1JJWkFiZ3VjTEErYzNi?=
 =?utf-8?B?UVFGL3kvd2h2V0hUTktIYldURVdhZlEwWS8rcWVVWWdzelVYYWFMMlZLWDZq?=
 =?utf-8?B?eEZWdUZKOW9lRURvZjgybnNYQjI0Z0VWVFlmOCt4b3poLzhXSEU3bGRwUXV0?=
 =?utf-8?B?UHBiUWExRElPUGhwTUJVVWkweC9UaWxoTnZScTJYZnpXVW1STTYxbXIzSHhI?=
 =?utf-8?B?ZGdHMFd4WU80bDRVNlg0SGdKWkt6NElTZ2xmUVBUaEc1UHE1NHJTODd3SHpW?=
 =?utf-8?B?dzh4QXk2WlhYWnA2RWJ5SzgydlJ6RWRDUStIbmJTT1FTNysxSXNhMW9VY0lz?=
 =?utf-8?B?ZmZaM09FaTRxenQ2TXBwKzhPWnliUmVYZjlFTVBUUzVMcG8waGxIekdHeFZ3?=
 =?utf-8?B?ekEzZ1N0OVZCbDgvVjVtOFZoMWREMW9INVU4a0hjUTRFcUJvZERGWHNrbnNh?=
 =?utf-8?Q?Ws5yF+Mkmv0psqUO+iEizMP7N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb97ae1-3ade-42b4-4bc5-08dcc84f563b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 17:23:45.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/uUoe2vaC0WVsebgs/jS0qV1hvjwev/xgy7tjQmR2V1dqi57vCXKf8nf0j3fGCx5KEzpsm7JC2MnETd4W9NbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6658

Hello Michal,

Unfortunately only removing "set +e" did not fix the issue as the test 
still will always pass.
See here (line 90):
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7700210695

I think we will need to use the fifo or the Bash "pipefail" function.

> You may want to use "Fixes" tag. See docs/process/sending-patches.pandoc.
> This commit tries to do 2 thins at once:
>   - fix "set +e" issue
>   - make xilinx tests use expect
>
> These should be 2 separate patches. The first patch should only remove "set +e" from qemu patches.
> There is no need for fifo in qemu tests. You should use that only in xilinx tests where we cannot remove "set +e".
>
> ~Michal

OK, I will review the doc and create separate patches for fixing the 
qemu and xilinx tests.


Victor



