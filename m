Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BDCA7D79
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179118.1502736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRWFL-0007bW-MN; Fri, 05 Dec 2025 13:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179118.1502736; Fri, 05 Dec 2025 13:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRWFL-0007Yw-JR; Fri, 05 Dec 2025 13:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1179118;
 Fri, 05 Dec 2025 13:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vRWFK-0007Yq-Op
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:53:18 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3a4cfc-d1e1-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:53:13 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA0PR03MB5627.namprd03.prod.outlook.com (2603:10b6:806:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 13:53:10 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 13:53:09 +0000
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
X-Inumbo-ID: bd3a4cfc-d1e1-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4uXBhNP6UpN59iH3MTvQppI0+1iQ2urPHw9pmL1xgI8hWOT+2G0k0BYFtumzhF91kNOsO5y/fuY+8LMyXUdfNNwZqeD/CEntKSUoVFjQr7y/LFS61LDYftBTh8SNkJNOJw2ppHxPwXQiTsfH3ZWUrrJcGNBEikG7pNozbJOMt+4gTli9a+mXJ5msvanyjD9yCL67kOr3eO/bbHjLDOx1ShaynTddJUafQF4mcmN5e4e9bPyyFBhxogqy65IxcgcZpeuHVwpUVGrKVkrqQABSGEOLKxVZhe6oKvJ5IuX5irLNVBsoz8xdFGbPeVV/IZGO5XmfFxRS/ABRLS3ot2rTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXfCLneTDE/wGmjOVHRM+sWugPFQ+/KQZJeE3ZuLfwI=;
 b=C/PZ5A/gpG3lBfxgk9dVfpMIFdBrId0Q7CUTpBffSxlQ3/I8dySGZBS+gBle/TtGfL7rQc6JXMzOmZDu3VuUeFDJlguQhEjtLfKEBCf/MmXhUC2E3wz6UtpSGhqL4Q0pikrr3nYeHw/2ImI1IFjZ4F2wCfRxiqCwCSROvO7gaxIv2w+4gjNDZ1qgCwDhRxEIeJlto5tyFW6iXKiX3cgBqut8NDk8gqwmxUar8ZNNtcVIL6ayOKI6lUIhNdGKwvJsEB/Yt7xXO0Bd5yUtQoXi1BPUlVsssDCz799u/qdSbXCo75OKt7Y60h6us+aA3FOcX6u9hieogF5JCD9z+LA8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXfCLneTDE/wGmjOVHRM+sWugPFQ+/KQZJeE3ZuLfwI=;
 b=eghA5vRQW9KrH3zbyqRNNadhkEl4iBZy/kzF4nUJVqgitHz8yT6cR/nnWBM4DPv3WWRou/h+NZ7X+kL7qRoJdS3/frazHPkaWoB7Lpu4eWEr3fUAPvyfAwm/xpPtu+JpHU2wZCQKtgiOXu+NayWy2ZzUw8Hqj3gf3VprCTLMfGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 5 Dec 2025 14:53:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
Message-ID: <aTLjwbcm4fjwNJfb@Mac.lan>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
X-ClientProxiedBy: PR1P264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::7) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA0PR03MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 678f3b1d-a653-40c4-7964-08de34059ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzVzOEhOeWpWQ3Q1MkFiaFFEdUo3UTFzOGUydC9sb2M5cFVBR1M4N1hnRlhE?=
 =?utf-8?B?M2xRSVdENXRXbGdyQk9FUVFqTSszTitSTjFoRjZVY0x3WHk5YXQ0dFFxZzFa?=
 =?utf-8?B?SWFadmNLYjVtRWRWaDR1bkdic2xQWHhnbjhyUHV1MHRORU92bERhSTRuWHNU?=
 =?utf-8?B?czlWWHkvL1NPRFZNSk9EZ1pTeHZnay9YSk4zMnhST2lIMmZBWlNhS2JWdis2?=
 =?utf-8?B?RHQvcjU3K2hVNSt3bVVDUzczM0MvNTVMdHJnek1TVm1Kb3JKdUZ1ZUFwdjBs?=
 =?utf-8?B?cmJIdDBPQ0h0WVRuY0tQZXFYaW93bXBGdWV2bzJLWXhuVlhxaTQ2eVdyWW9y?=
 =?utf-8?B?Sm8veW0waFZLWE9ZZmZxR3ZiMmxUeHJYdk41bzA4MnN1dmRDWE9Wa2ljNVdo?=
 =?utf-8?B?RjFPZWV4NU8wc2U4SEdnZkoydTBrTEcvWGZEYzBLaktkb0dSbFQ5djB1M2RL?=
 =?utf-8?B?M0NMMkFLSjZydCtnak05Q1NTMkVGblpuYWsxanJ2YThHNnRSaFM5R1plbW1q?=
 =?utf-8?B?ZkwrMlFyaFd4cmNYOTMvS3hVTGdmdC9QbHBVU0J6ODFQZmFLRWNRYjBMazYr?=
 =?utf-8?B?TmllamZuSGQ4c0VaakZHNzBIc3FzTWxiNHMvSndLdTNsNkd2cmp3RnlhZDRO?=
 =?utf-8?B?bFNQa0lucENZMXpsa2xVQ0lzVXN0VzFKY0lIbkllV05KV3l1RVJMT09saHhV?=
 =?utf-8?B?eGF1cWNLcDRKN2FpaE1LZlZxODd0UU1QaFEvK3NHT3hhQzdIam8wQ1ZjYXdr?=
 =?utf-8?B?VEMrY0ozZE56MU02VFp1TlUvWENUSkp6WjRTcjNWQWpySk9ER2xoaWdlT0Zo?=
 =?utf-8?B?OHZ5Titwc3VmK2s5TkpJa3JKVTZRZE1sdWNBcHA4bzNhKzBhc24vWWIzZ0Qx?=
 =?utf-8?B?c3lxeThDYVljWG5vTWdMSlR5aE5obmh5ZmIyWEYvN0tKMkxrNkYzaVVWaGFW?=
 =?utf-8?B?TXJCRU1sQW5yTnB3cW9VaEtUQldFZ2FlemFKK2pJM1pJMDNVU1IvMzJaQTVk?=
 =?utf-8?B?Z1hOdlZnSUNBVXZqL2EwMmc0SnJlME1mODFrNkpqMHNoanR2Y1A5OWpxdTZk?=
 =?utf-8?B?elpiRzVKc3VFWjdLYTUwSjExOE1rck93TFI5WjB5eWdQT1lmUWJ2VnNQcDJV?=
 =?utf-8?B?eDFHNFdLRVZDTVJTbHRPRW42ZDhzL250NWRZcE5vL0dyTGhJZUZRakY0SjdF?=
 =?utf-8?B?RFdqWmdsNmdVbExPNnhUd3RhRDRqbGZXaGdsZ2RuNzMvUGY0cVk2SGw3QUV3?=
 =?utf-8?B?c1k2Rit1ZE0zQytyOUpCVkxQWi90SC9sQWtwa1ArN3NKaWQ3QUFLUWNkUjdF?=
 =?utf-8?B?Wmh5Yk83VEgrL0phSkNNSklHZW1DNkFLQ3BPOUd3MmYrQUZZZ1pab080YXFs?=
 =?utf-8?B?eTd6eUlvcUVNZXowVzVrbEx4bVFaaE4yYlNRd0V2QWFQS0NSWkVLbDJNRU1T?=
 =?utf-8?B?TVdvMHV2ajF6WW1WcjA0QVF5VWlaRHppTmlydjIrKzNWZmhQN3pMNERSSlNt?=
 =?utf-8?B?c0F0N3hhMWNBbDVPRHNpdFlhcW8vcmgxTEs4b0xZM2Y2bGxvZTlNVzNJVEVN?=
 =?utf-8?B?d09JeDZydTBZYWVGMGtpQWhrWlM5MVppcHNvNDNST2FiYjUzc0lNcUEzbFVZ?=
 =?utf-8?B?UUUzN29hVG5QdEZObmNDY1h1SGgxS1FpT01pYWdsZ2JadnNvZHJDMWlYa1R1?=
 =?utf-8?B?VTVHejJhc2FaZzlLNlRTYi8rNWdNTHZ3ano5ZWV0dnBDMEFJSUhuVXJvRWUx?=
 =?utf-8?B?Y3MzNngxVEpTSTg3OHV4ZE1LTU0xMEdTeTRoTGY3S0VyVnVJa1pXNGt2S2JG?=
 =?utf-8?B?S210QTJPbkx2TDJ4ZHhNZGF5OXdoRUJXTkxqdWY2SjI5M2hFbDRUa2t2UUkx?=
 =?utf-8?B?QnorZlRkM3hlN0VxVTkvL1UxTEZpVWRyOW1jQlhmQUR1WU9JVFRxOXpWZWpF?=
 =?utf-8?Q?hlIxalDD1AyHAAMbC0j+gq42B+nKg//1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnlsYk1MMUZBQTZhdnVYaWhZOW42QXh6dU1FR29jUjdZRFpTQk1mTy96VGM4?=
 =?utf-8?B?WWxOWkJLYU9IVVpsZldVY0EzV21ERVcvdjVxZ2xrdy9iZ3pETHFjL0hYYzhx?=
 =?utf-8?B?MVVyeHpjY05KbWNwdEUrVXF1L1BVK0dEMmU0a1ZOUVpSK0Evb0dDWUV3eGlz?=
 =?utf-8?B?eCtwR2E1T0lrYWIwblJkVU5MbEFwQzZpK2NocUpiQ0h4Y3FhK1F3d3BGVVBM?=
 =?utf-8?B?YXdqU0NIV3lmNVIzK1pZWGp1SW84VTlEZkZUWjJwV1hVRUQ5WHFKTkNGNUxY?=
 =?utf-8?B?K1AwVzdvTXB0ZnBIUG1RczFQRGFUbkVrdHdzSGFzL3didWt3ZXNtN3U1UjBX?=
 =?utf-8?B?dDdVakgyZFUzUTlMZE5UaWFuU0JkKzVtOVhGTTFoa2JGd0puVTFVZ0xXSkhK?=
 =?utf-8?B?U2ZxSC9vamZDQnpON3FrUXo4MDhkVUVrWGQ5d1F6dXhrVHZjWXVucTkyYjBG?=
 =?utf-8?B?N0oxY2x2RGVXOGQyaTV1b2I2R2VnWGYvRnFBUXpROStIL0hNM3VyZTNxWXZG?=
 =?utf-8?B?KzlFRG1zdkNJMlc0OXlpR1dObm50NEEyaTlLM0lUcU00bExteEo1c2EycExo?=
 =?utf-8?B?VmtKRW95d3RqY0ZHUEJSY3ZtaGhYc3hHQWRDc2hoRDBkeVFZQlM4Ym45bkRO?=
 =?utf-8?B?aklUS1JIWFkydzR6TE1IcTNjaEdnSTFwSjJtcUJWNEZ1QjF5dHNpbGhKeTlj?=
 =?utf-8?B?cGlmQmJ5QlN6VHkxdDN6dVRsbkZDQXc2Qzlod2FWSmdvZHhUblRWWjQ2SGlN?=
 =?utf-8?B?VmQzMDJwaS90UjRocjJMb1FTU3JwVnRhSzdiMXpjZkE5ZzY4dTNjTXhlRVlQ?=
 =?utf-8?B?WWZLc3VOb0IvaDRPdzhFcURVRlNpQnAybHBiYndYRUZENGpiM1FRVEdJREh1?=
 =?utf-8?B?amZ2TkZmb3ZBOHV0NktoUnptcHZkWkgzU3c3eUFQbHpQZzJ2WGxpNWJ6YTRF?=
 =?utf-8?B?MFRhc3BmN2VUaDZiclpsdkwvbGVRZndQUDJuOGI0MlkrcjVIVVRQZjI1M2lO?=
 =?utf-8?B?Q1V0ZVk1clc1SWZHQWVrR1d2VjBLRDBoSkJMWGwySWxHaXVyNmtWUnhqQS9T?=
 =?utf-8?B?YUJGREo3ajNoU0svZDhjM3RXcDFOeEtaWTZreDJsV0RGMEhiRlhrSHJQVHdO?=
 =?utf-8?B?cHQ0YWtzYjUzS2d5K3g1RDNjN1lpc1cwM2htZXQzSWdVVVo5WWpQUjY3WnNk?=
 =?utf-8?B?cDdFaFYrQVJ4NW42d3h1Z2V2clRFTWdUQjl2M0ZmMDFZQXhhK3FFNkpmK0JD?=
 =?utf-8?B?UUU4RzMrZVFSOVpzTGJ0VnRuVVZZYTNFMFlhbURwY3NMelBUSVdYMUk4WjEy?=
 =?utf-8?B?YXVsR2t2OGdUaStKTGhvQ2thY1l4WHo1ZVhQUFhLbUFEUGRFSUxERGN3OTlQ?=
 =?utf-8?B?b3I4SkpzR1d4M1ZKcEc2d1JreUNnMDlPeC9SVUF5bFhBTTk3NFpWVGNGSGxX?=
 =?utf-8?B?bTNKZUY0ZEllVzRvck9DajhzSGxxek1TRzVER2w2SFU4Y1ZDUHBHLzlyQVFw?=
 =?utf-8?B?SXVIZVVZOUk5bmswa1k1NVg0QmplaEtONkNhdDV6R1hWeTZnbTVRWHMxSDZW?=
 =?utf-8?B?NTVCRkI0MFJTenlPRG0zZkR0NG91bXVPSCtHSHJYek16TUVHRzN4RHJGWU1J?=
 =?utf-8?B?cEdjbGxzVDh5UlBLWDdtVlZOR3o0Z1FCQ2RueEJQUzZoR0d3SXR5eDdkdTl5?=
 =?utf-8?B?U1Fyb0lMbzlreVIzUFZOUUt1ZjIvTjZja0JIZDY1alFod1c4REJiV1gxVWZ4?=
 =?utf-8?B?ZE5SSThCbkFQVE5SeUJXQ1ZwdXBweVpNUkN5T3FLR0ZseHk2d3pTSFlvMUsx?=
 =?utf-8?B?NTJzQ0RyQ0lNWHF0Ym5XNUNOay9WeEJjWmRvcXNtYlBYaVdsNm5GN0VRWmo3?=
 =?utf-8?B?dWw3QUNSZE5jMUIvaFNxUG5XUzV4Y1hFTUw2Wm1BYXQySkVIc2RNZFhlSVJF?=
 =?utf-8?B?RWRXcFAwSVJPbUhuT040QzF4RE1EOXVPOG1LZktyMkEwVnM3dVJTcWFOMEcx?=
 =?utf-8?B?Unl4WnZJeTlUZU1zYjhUSGtmaFNiVEJIa3dsZHpManVLZW44eXlhRkRsUVp1?=
 =?utf-8?B?VTEydStzZytpQ05PejF2UHJxU3kwZGZ4MGdwem1hU2l5NVVRVlF4cVg3Ym5N?=
 =?utf-8?Q?jpUd41rQVD8MHAVpDgxAc4URl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678f3b1d-a653-40c4-7964-08de34059ffa
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 13:53:09.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAtMCteJfifMmVpGgOxjBsp5mg+pyAqtVrtIdMUinrTcOU10UqjE9Ga2GIFJaSghAlpgYl14SqwW7GvNV6WZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5627

On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
> Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
> respective page as dirty, additions to a HVM guest's P2M should do so.
> 
> For HVM the opposite is also true: Pages being removed from the P2M are
> no longer dirty at their prior GFN; there's no point in telling the tool
> stack to try and copy that page, when this will fail anyway (until
> perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
> (intentionally without a paging_mark_clean() counterpart) to handle
> this. Note that while there is an earlier call to set_gpfn_from_mfn() in
> guest_physmap_add_entry(), but there's little reason to mark the page
> clean there when later in the function it'll be marked dirty. This is
> even more so given that at this point it's only the M2P that gets
> updated, with the P2M still left unchanged.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> p2m_add_page()'s error handling looks bogus in this regard anyway: If an
> error occurs before an MFN actually is assciated with the new GFN, the
> M2P entry ought to be restored imo. But of course a guest is still hosed
> if the operation succeeds partially.
> 
> Note that I've not even checked mem-paging and mem-sharing code for
> whether they may need similar adjustment. At least the latters is, aiui,
> incompatible with log-dirty mode anyway.
> ---
> v3: Re-base.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
>          {
>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
> +            {
>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
> +            }
>          }
>      }
>  
> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
>          if ( !p2m_is_grant(t) )
>          {
>              for ( i = 0; i < (1UL << page_order); i++ )
> +            {
>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
>                                    gfn_x(gfn_add(gfn, i)));
> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));

Have you considered placing the respective
paging_mark_pfn_{clean,dirty}() calls in p2m_entry_modify()?

There's a lot of repetition here with regard to handling the side
effects of p2m changes that are forced into the callers, that could
likely be contained inside of p2m_entry_modify() at first sight.

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -165,8 +165,9 @@ void paging_log_dirty_init(struct domain
>  
>  /* mark a page as dirty */
>  void paging_mark_dirty(struct domain *d, mfn_t gmfn);
> -/* mark a page as dirty with taking guest pfn as parameter */
> +/* mark a page as dirty/clean with taking guest pfn as parameter */

I think it would be clearer to use gfn here rather than "guest pfn",
and the function parameter should be "gfn_t gfn".

Thanks, Roger.

