Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D747FF42F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645026.1006776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jRG-0002oQ-AQ; Thu, 30 Nov 2023 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645026.1006776; Thu, 30 Nov 2023 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jRG-0002m7-7g; Thu, 30 Nov 2023 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 645026;
 Thu, 30 Nov 2023 15:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8jRE-0002lr-RW
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:58:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b3e63c6-8f99-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 16:58:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 15:58:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 15:58:21 +0000
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
X-Inumbo-ID: 5b3e63c6-8f99-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVivXSJ+FBmz5sXfV1bKrbSwQLpG67CbvG2aK4nQ1irtFOJAudtRc1x7lih0UZ9mWe3QWC4htjqSKUCmQnOvpw6yMelIZj1koXRoZ4cJITwvPtHi7qVRawf6JqIDISlbfsCyHSuamNW22mQkrAseVtHQ4h9OpopXyYPnoPJfyrREMnjyh3h+egNI+pqm+EozXGCq4FLjplAitMD6Nszb6vl+LpXy0b6GPZhGyTMf8IMn+LqY9Jgpy9BKq2dIV2G9Afv39VMsr3MhIlaf0q4RZa9/Yx/NhKMG9sR4uod2qNlyv2Kf+K1r1bF/2ozQxwDWiQXUR4IlDSbOlJUv0ZoNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=d3LAydGtomPE5NN6bm+MzcMxE22xRX4G1UyADydo6rEYrzuZr/Ebl8Ba5wfcE1iSv88tHK8y4mPCtbRjqsWt3/QYUw+/PnGn36tMgovGFeNjf9DRbdZRyRDJwi+8vFQROgY2L9yDT8A+zYJFrhMgwgKJvIAPL+z9QWepgI8TF8msIh4Oo8+7d97E4DTqD2ofCrMdVMqJBojwTf01ToqBzM6gNDhJHC2yEEVgmDZATQXlIcioR5dhwd0f/lPvsAM7hQe4vqwFg9CBZQWRB0YrD7tZglLzPSQOwUY6rFOKTwujlZ+alMrfXCwVQ7rjIl+lD/bV1VGfg562BunqkUmIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPAnAkPuF+r9vh72RFbq6quMYRHsEkj7B9nvnGNJ3Js=;
 b=0N9tLNHZL8Xh62MCLXOu2Ec1lEaeieDyZh32rduupAqbCc2pzTDuwAUWbAyIapoBed0f/PRMndLjj9JUuP04ChT4hfzupcnXofouwk2nudCfeGFWSeP2kT95/uXywr2Gb9jHlXFa4zq1fcR8Id5vj1JgYuKh1fEY7wfIBabwotpF55773H3YsR3ngRS7JaSDhrO8pAGQneBM+cxwS6FYyJujYQMesZf6sXRldqZ8MmcwUOlFd8Z8E4krpNqYuskNDCUI9AcuNCcqWAVktBN5WtCn21deSr9dWK/eBEGCcTmcVeQkvxf6WNho9olTRjGZnWMMRKY5uB+5HRF/dcvubQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97c2031c-6be8-43b6-9ebd-c586985ce089@suse.com>
Date: Thu, 30 Nov 2023 16:58:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/11] xen/domain: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <d38b5f555c622a23b2433793e70156efe459a811.1700832962.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d38b5f555c622a23b2433793e70156efe459a811.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 94858acc-6c68-49a1-7ca7-08dbf1bd2d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbrW6TCudF6fjp/VaB/6UqsX++NyybmzWtiSW3CUHYZuUEZdxGdaXvjC/LzcvOAuTo1gBJwZWntS1kcOTuVxstroCkeWu+rcH9lMisUCck1Jz09H/zWmSrEwGmyElkCVRoAS0xK2arHj8bgWmTGh09BgF00Kf/hJxi7rBcdxz4rGaW3W04ErtHVp0Q54695SKmkUcqBiAswj08pGqE/u+1D1uAnac5Ii9uroCO91hA8EAcSwul8fPWVxomQd33VId8LKo4bgFGpPkVXRp5jx0i/hhPIORPmwYlJvw6NlYTeTKAa7/YbqbCbO0UbLMxJM3KWw5ymfTLo/oaQbTivY0n2INx51ZSf+XVjQmSBaw0kOJyfiHmVtGMLNyU8We5DO7sxyPOz8aew3FMclYSqA89WZS1XzDUXityuYM6jt0j44NJJmaCEMorCjftg+OxcrDJD2279Sv37yjkC9oktx9YpO3tkLXXN5bQ9GYg27/aSR1lMukbl7IJH+usp5fjN+sOcPKErWs97zF98/UkKwEiuTIqrJ4Qsnnn6yzYmCYDrRL2ijCrbbFvDxzGFtABlM9tPtGYuJNF/MOt2Gzb2UEeWmxuzzHLiW7i1l0+Wgwi0s7LWFAy9eRq76yw2nyXO0VBnrNVELzJco5ooCWqMZIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(31696002)(86362001)(316002)(558084003)(4326008)(5660300002)(36756003)(66556008)(6916009)(66946007)(66476007)(54906003)(31686004)(8676002)(6506007)(38100700002)(2906002)(478600001)(6486002)(53546011)(6512007)(2616005)(41300700001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzJOcC9sL3FNbU52ZnIyNDJ3bG5HUEZRMUZiVDlJOFRVZXU4UWRKRFFYZnlv?=
 =?utf-8?B?dGx3eDB2SHFNYzdRdzV5QWxTRzBUcHQ3RldIOEtrUXFzcUJkZjhUVHJNbFRS?=
 =?utf-8?B?RkFvZUFrNy9JTEk1TVpxODRuUXVFQ25tbnVWNk1lQXh5S2VGOEZQNnlmV1FB?=
 =?utf-8?B?UzArMkc1N25WVGV3TjRXSldGMWtRM2ZXQ2tmd2hocDhBcDhCaWVrZC83aUNC?=
 =?utf-8?B?amlJWmFra2k0eFlsSE5FMWtiZmtuQkI2UGpQK1ZhdUFqSm5lNFBSbXROdFB1?=
 =?utf-8?B?YnN2cWozdW9LM1lzV1A5SmR6MmYvR1V3RHNZSU9nT3JHcGZVRStWN1orWTEz?=
 =?utf-8?B?VFQyVmhBVU1TcGtuVUZIbmMvbFNVaHYzblkxdnowT2JQa1Joa1ZhRTRFcmJY?=
 =?utf-8?B?OWRTcStnNzM5cjgrQ2Vrbng4NERnVjJ2Y1VPUDl4VTVrRkVTTVQwcElBaFIy?=
 =?utf-8?B?d2tDa2piNjZ1eDB3UmZkUmRHS0JGZk1NZTVqbUdIR0NOTDBFbVh6TWZaMUVy?=
 =?utf-8?B?czk3V1VIQkVUT21TK25xd2t6NnlkK0NsakVTajFiTzZaUFZGR0hmK1hPbFhh?=
 =?utf-8?B?NXZUQ0lyek8vL3pMUVFKc3VHbWRCdjFyZE1aUUdoR2VCMldIZzlWaExHMXFX?=
 =?utf-8?B?dHpaeFdZVWZabnMwaFpRRFhINjJqMnBLSHMwOTRwbEtaYmFDVmd4azlvT0tk?=
 =?utf-8?B?eUZ1RWlqTjVJVmx1S1FQNExTK0pzY1lRNVdzZ29JQnVhRW5ZcVMyN2ZvNzZx?=
 =?utf-8?B?a3JhL2NhWjcxVVo2VXRJclBwYXY4b3RWY3ZkaHlHNDJoS3lVZnlMcDh6aE1k?=
 =?utf-8?B?R1hYbnhIRFJWREwxODB2YnNxWDZuVTBQRHlPRUVpUjFqK2FGbEYrSms1NFpv?=
 =?utf-8?B?MUhlcDV1NUxtRWErK1BYMXBYSXBqdkdRN1dDSzhuWU5xUDQ3cGJOSEZNNmcx?=
 =?utf-8?B?dGlGWC80WDRNUi9EZE5USDJiS1NYMUdIcG1JQWhPMWUrU0NNN2d1UzdBQWtP?=
 =?utf-8?B?WE85OWlQVWJNeTkxLzdkcWxxc1YrYk9vYUsvczJTbEJiZjhUVzNJTmw5dFM4?=
 =?utf-8?B?bW00NEtyWTBWcktST0JLV0JkYk56UkQ3MVVwbFdUN0hvWnNWc0RJNE53RHZN?=
 =?utf-8?B?YXVZSk8xSFFybEVUT1d2UXpmMy9DcDNMUnBDRGpPc01GNWtzdUoxQk5tNkNL?=
 =?utf-8?B?QTB5VE9SWG1ad3NXa0FKZ090dUUwRUVVNnRVbDVIN2N0K3l2ZVR4aHVDZkR0?=
 =?utf-8?B?V041K1Jjd0NhbHlaWHVNWHk1dHNkNEpDa2hqNWFzQTJDaXFTTWp2RkxwYWVU?=
 =?utf-8?B?aTRkZGFmVVFlNGVmbkZvVDNhWjFEOGhpSFdlQ1RqZExEdm1ldHdUcjNsUFdC?=
 =?utf-8?B?ZkdwbWlOMnAyVmE2a1BPeGZSZXRLRjJRRk9xcm9USmRkY2ZsbldRamRiN29C?=
 =?utf-8?B?SnMxaEZHbVk3eWlETXQvTTBvbG5Ra2p0TEIyWmxBWlNDQ3g1Smplc3RDZ21h?=
 =?utf-8?B?SUdDdDZQYnNDeUxWRXcxQ3AvTDlmd2VqZjZIUnk3a3c1RTFob0ZnZ2FRYlRE?=
 =?utf-8?B?N29hVWZkZ1JGZk9BbVJkWlZ3T3l0OFo2QUQ0Vkkrak9tZUpaanNjZTI5T1Y2?=
 =?utf-8?B?QXhJOUZNRnBDS3RtdndoQjVrRGI1cEhyU0lRMlN0VTBPZkdRYTFrZERna2tl?=
 =?utf-8?B?UW5rQ1djcURSQ1RibG1vOE1DU3EvSlhHZ0tvTzhzL0MyVHpIQnBieGEvWXht?=
 =?utf-8?B?cUVEc2dnNkFYblMveTZQdVU3WktMU1lnTkNpWk1ubkRqRjRKbXk3dDVBZHVR?=
 =?utf-8?B?b0FPU1Vqdk52eEN0S0dZRzB3NHhCM0RQNXp6VmEvRkdaLzhQVURrdHdZaGdm?=
 =?utf-8?B?K1NEQTI2MUJac0FBQWd1YWxTRFhhd25vdFBRVjh1eG83U0R0dzFBTTk1QVB0?=
 =?utf-8?B?SUVKQWYrM2tCWHJNV1NidkFiUCtOSklMbUFjRHhCZTVwa2ZQNW1wcHNlV3pP?=
 =?utf-8?B?WEhEaDR5R2YwYzg5MVp1L0FIdHJGL1Q5ZE1laWlNbnY3YWpzMHVLTjNkSnlY?=
 =?utf-8?B?Z2ZFVlhvMnYwelRGL05rRGw0dkF5b1dXRzBodXBrTS9WdmxzZHFXakNEUjNi?=
 =?utf-8?Q?W/vLa5/3gFqSwrtSuuQATnFd7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94858acc-6c68-49a1-7ca7-08dbf1bd2d5d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:58:21.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8YkTtTalkToxDjGBcUN/75ZoU81tlz3LYiHlmaK7fERhwQr1gvDEgjnaCqnTFwlip/fyvFB0rj8dXP1SZNeVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



