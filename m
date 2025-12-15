Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D94CBDDE6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 13:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186991.1508417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7y6-00062M-Sz; Mon, 15 Dec 2025 12:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186991.1508417; Mon, 15 Dec 2025 12:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7y6-0005zz-Pd; Mon, 15 Dec 2025 12:46:26 +0000
Received: by outflank-mailman (input) for mailman id 1186991;
 Mon, 15 Dec 2025 12:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMu=6V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vV7y5-0005zt-SG
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 12:46:25 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d64a0e9-d9b4-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 13:46:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6065.namprd03.prod.outlook.com (2603:10b6:610:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:46:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 12:46:15 +0000
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
X-Inumbo-ID: 0d64a0e9-d9b4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLt3EYGkni1/baWVB0bj6BB6BTRqVkKw3hQL/4dBK4TqMsmlHmuCN+roDGYV3CbSNNOcPKOteYiE3pSE5Odj2MazhsleV60tUJNVCzTSV7b1Ew311AqhgbhMbNSPiwoiIX6I+aZeI1QGk2Zl3CmzlqUWo7O7TMZW30IujrxT/UXBIs3z3jb0fTYcckSYxhaQA7p1R1mzd8hGUxWALgT3Rh7NOVIuvJRCOPRP1VGsaRv2zfKEk3/EpFZ+SIWEsLD3LmIzPxmfTyZ9/R62RJCyIyJdxZUaO7ZnDAznyE0zUYk6SCJKMpeX95ezDHkGqYiFBDqKTSI58JJcbFPIv0wcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnBSn4xaXsptV87b7mB+Mcy023n3BNvH3quts1eun5k=;
 b=mV0L3Atwo4GSbQqwpdpQoj4lRVRCRExUP+euO0EeAi/FlElIJNy3mSE76u8opsi76rvgq/QfE0f6WBdiXFrhaEUZ8xMnuT85askQqUshYQW+ZEK1Jphs4T2AZtLsLLLDRiGHupWKVcAibY6J5khgasmsdMgI8kmKEtG/piI5FMpQjXeqwyqenTqzrK+olMfJFPrHuLCdoGRFCJVH7SYv6Y4X2NoSjZFTa8GN/4d9cHj7ZzP4TCnbqY9t21eLCEEI7DRw50+1t0IQS8qh7WskqBJYwRZqj1kn9N2Ce/hg+SapD5fFndzH8hnOHBXWP7laHqn0pi/j8A+MrYm/oUXxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnBSn4xaXsptV87b7mB+Mcy023n3BNvH3quts1eun5k=;
 b=k9HbhEdkZPqA8pCfz3qtkTelV31c01cVK46yevsieJSZH1YjN2upKO4qHpVKFhbVUtOfYWDqvXc2ixSngz0u911DC1rm+fkROED7qZ5XsBZBmDEmbiu9qp91adwEdnwHxcQ+Nd8lGyiOJXl1GGoC4wwV69kLexzKZKPZiJoNXPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8038ba8e-ea1f-4005-94ab-56e4ab5f7062@citrix.com>
Date: Mon, 15 Dec 2025 12:46:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] memory: overlapping XENMAPSPACE_gmfn_range requests
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7d254163-ac13-4c58-bcb5-aaff2e892e15@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7d254163-ac13-4c58-bcb5-aaff2e892e15@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f7b0b7-fd98-4a59-8a53-08de3bd7ef15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnBvRzNRR0pSRFZNTEVEMnNxN2d5WldVSlVRcFFXSGhxNEo1TUs2OHd5aDVy?=
 =?utf-8?B?V1NJdnJjVzZFRGlNMnFEbVpwY3ptcG9BME1GNWdpVy9Cc1FUT3U0VEhjcytB?=
 =?utf-8?B?YzJUWjIvVmZuSU1sUFZ0MW9CNzFkeURSWDVWazF4OEo1OEJNTTFyTEo5bjRN?=
 =?utf-8?B?NDRGNFByUDBrUlVFOUxsdVZtN1hjZmZwSHRvZ20wcHdOTVh5eVFrcDhKUVlO?=
 =?utf-8?B?TXhOQmdYYWYvMHBjeFovOHAvMWlIa0xQaE5DTGhOVWV2NnN3UkJmdFRSczNO?=
 =?utf-8?B?MGk1WHd3VWNONG1lVTBtRlRBL0pSRGdiNGF6MXZoQUZTcnVGYzF3VlJnMmd2?=
 =?utf-8?B?SVM0dlpjR3M3OGVvZzlxd2x4RFZrcDZOS2s5M1ZXR2ptK2lRUUhxRS9KRmV4?=
 =?utf-8?B?eDJqeTJpQnltYnRtbUdMRXU3L0tTTkFBL2t1MXMxUCtvL3NIWUFtbEUxSUpX?=
 =?utf-8?B?SjlUQXFCZm9xZ3Y2MHlXa29kcWJkeWZEYzJ4RDRhSGRvQTFpelZtd1FMeEJE?=
 =?utf-8?B?YlM2QnBNWVpCbUlGdkZSMkgxQ3BOK0NzZDJVZVhEaUpvb3Jja0Q5YkdxL0xK?=
 =?utf-8?B?cEdTN2dYMHkzQVQrN1dMWm16KzRHc2RyRDNydDlIY002Q0ZVM2Q2MWRYK2Zp?=
 =?utf-8?B?VHNqcWU3L1RDdkFPTDRBZjRnSkNJUHNRUXpld0NQeUNpMEJSdVlPWFhleDV0?=
 =?utf-8?B?Q3NCeXoxSDcyQm1XWnp2TlkvNEdIamVCSDAxMHF2SkxsdTQ3UVRyNXFLZ3JK?=
 =?utf-8?B?bzE0UnlwMXlwaFEwMjd6dmtGWXhLRjJpK1NlUXMxRytCSms3UnBBKzZ3TkJu?=
 =?utf-8?B?QTFpSk52dHNoQ25LRHhrRzFTVWhNQUxPYSt3VGluNEpvQ3JSY2lMUWZaQnQ5?=
 =?utf-8?B?bjYzZWpMaDFrM2JobzIybEU4RHRIMWJ5RGtMM080VlVyTnJFZHpwdU5ZTTNl?=
 =?utf-8?B?L3Ztak1pWndzblU2ZGlPaWRhaW9oMjdsUVQrdEZEV2cvUUdFQ01YVi9maFFr?=
 =?utf-8?B?YjgvTHVkTjdIZllhQTA2eHdlMHgyVXdyczV1QXZtZkx2SXFreXU2YWlXWHUz?=
 =?utf-8?B?ZWUrMmRBeFdrcGxBVGs3Q3k1a2VyazJ5YU5WcE5MVFlEaFdwcFBpWDhVZzNx?=
 =?utf-8?B?dTdxRHNucjZkMGFITlBsRjQzdk9hbFV4L29uZGMyd0xrVHh2WFVON3RUN0ZB?=
 =?utf-8?B?NFMvUWdpaTJBeFQxSXVYRXo1UHhIcFErZThVOGkvWWVNdHk3Mk0zUnB4U3FV?=
 =?utf-8?B?UTJQZkt0TjdkbzVCeUVIZXdoSFZramVjVE0zTWVRZytXQWhaTWp3MUZBTXU2?=
 =?utf-8?B?cE50QW4xdGNCeVBRU2piaFVPVlpHcUo5Q0xxMnVkZWFHM2Q0bVVmQlptZVdY?=
 =?utf-8?B?Q0dmdEp0QnRJempSaHJzUUlXeEc5RWV4cmxBWStMcVNoZUx0Tmx0RnpxMjZV?=
 =?utf-8?B?UVJZSGhVZGxLSkROZkhHNkF3YU5uUkVwS0UwQWpyOGs3dlc1a3BuQWQ1MSs3?=
 =?utf-8?B?ODBvRW5FUStycEJOT2pMQ29CQS9OTVN4ek9Xb2ZKaHNocHZ2cXJ1SW15NGpq?=
 =?utf-8?B?SDdMT1JpMHVhV2JDU1lKRHlsazlVWWpjbjE4TUY3S1JmQkZCYXJXcng5N3hV?=
 =?utf-8?B?OGU5QllnUlhaNTBsM3FTb1ZJVlVBR1VKTkUvK2U3My9pOTk1bXY1TnJETGp3?=
 =?utf-8?B?QWVqbjgxeGlZaTFucTJ2Y3BINVI2L2g4c0I1Q2RJbkZxa3Zia2ZRaWpnOG5M?=
 =?utf-8?B?YllQZzFDc2U5dXRBWmlBRlRPaUtDNUVQRThwMHhSNDJCUlA4b3JET3RhZ2pU?=
 =?utf-8?B?N21SejA0eVg1amJUamt4VlBRNkg4Q1FzYTlMK3NZV25YNnA2NlA3T0FoVVlJ?=
 =?utf-8?B?eEdHU3ZQbDVwY2pxVVRtcDR6RGU3YjB4M2E1d0tXSWVHa3RaL05mMDNpemdy?=
 =?utf-8?Q?jmA3h/U9EkICgSBcLPzeVk7UiULGbYvl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWRKbUFpSkJ0UWF1V3VXTXkxaEhrTmFrQ1hNY2NpOHkwUk13ZjBxcWdoUEhF?=
 =?utf-8?B?UGRBS0VibDVSMnJwMmJyQXp3VXBHMCt3MWRRMC9FR2t4YndHekxaS0FrMHg3?=
 =?utf-8?B?QkhwUkpvdVBxTjZqenV4YzlUSzExelAyRU9CWHVBTTdaNEc3aFE4M083NjVZ?=
 =?utf-8?B?TXhVdzN2Y0NweWNUMUlGWlR6d1E5UXdNYVpFYW5acUhBOE9KSUwrSEVPWkEw?=
 =?utf-8?B?V3ZNeXZES3NwNHdtNUc3SkJjWWdCMitXUXB2SEx2REZjcDJUVmJMSlJTaUNy?=
 =?utf-8?B?M3h0QVA4eHZoUjV1dGxUZ2JXT2orL0Vjak5BZE5QaDU0U3VYR21ETlRIN3o1?=
 =?utf-8?B?YWpGRmdUL0xRN09OWE1OZTFkVU1Oem00cGVNWnlBL3BMYnB0WW1Ed0VYS2g3?=
 =?utf-8?B?ZUUraUljaFo1Rk0xcWN4MkVScHZzazZmVmc0M0tvQS9yVXpVVEF4NE9MZmdK?=
 =?utf-8?B?M0FLKzZuMVExVkFLU0Y3QVNwV25oalkrTFFlbXBiQmt4Um84RTd3ajdWdTRr?=
 =?utf-8?B?cmRBdElnWXhFMDdkd01JTmlaS2MxMnlUVnUxR0Q5MlBRVGdVUERtWDBjRTRC?=
 =?utf-8?B?OTFGemVGMllNVmRTbHhOMVduNWZKT3FjdGN2UVo5MkVTOWRuNEVlcklCTE8r?=
 =?utf-8?B?TC9odkhOa3lrMG80WUM1RW41L0ZwRkJCSUdnbmVwMzErSmVkQ2FzOERMcUNK?=
 =?utf-8?B?SzZqd3F3alBIVUlnbUs5ak44QnozdlA2TVJmK1NMeUpQTGFYZ2F3cVN0S1BO?=
 =?utf-8?B?b0lPS3ZaNk9jUzVNSHc5THBTSER1Y05hUHhKRWEwQ0pMVVZpbUFpcXdQWW5r?=
 =?utf-8?B?QzhqYnBPTi9ONHJ6TzFKQjJvVWM4U2Izdm14Vkx0Q2RSQVJMc0Q3QktiOHMv?=
 =?utf-8?B?bW54ZzJDZXZvamRURFVXc3N1cThhM2tqWTRnYVg5alJmSGNPbjRJRkxlK2Ji?=
 =?utf-8?B?TjBDUFJpVDh5VEltR3FlU0JjY0lqdnBaWmwyTExGVzhSR0tlK1BXcGpNeXlp?=
 =?utf-8?B?Q0hsZEozSldCeDAvTWdpbjBCRVNHMzgrZVZsLzZobTBoUHNPSDBPUFJhN3A1?=
 =?utf-8?B?UUVWajhnSHdyTzNNMVFxV010MDVKSnR6S2g1c0hpeGFBek1oMlR1alZFR1JX?=
 =?utf-8?B?c25ncGxqcHlVWTRyMTEzSXRLdm16WHR2OG00eHFIVU05RlBvOXVJUmZ3K2NB?=
 =?utf-8?B?VVdYT0lnY1VPY3NqZ3NNci9xRkorekY5SmRpZERYRm53cEQ4YzlFVEppdTBT?=
 =?utf-8?B?TENSL2tYRUJuM0xVSExSZmFzcDlHQmJOMUFGbkhzZXpaUUMwUWY3K2U1SjBX?=
 =?utf-8?B?UE9KZHFsanhOcjdWbHhGSHFORmE3N2FaWjIwR1hKalNQWkdoNXA0dUFoOGw0?=
 =?utf-8?B?aE1MTXJnbnYyZlBBMVp6WWtRdEN2L0dyN1RtSEtPdGUweW9WUDV1V2Z5bWx1?=
 =?utf-8?B?dEltamVKVzFjMXJyeUxqN08weDlmYnkxcXJCV2wwSE9ZNkFVdjFmSGdScjQx?=
 =?utf-8?B?ZDFxd1lWeU5WNE9sUTRiaFI3RkM4OGJZN1owZXhpc3RHUWh6ZnZNS1hwN2ls?=
 =?utf-8?B?QlNiV0Q2U0ZNZFVNWTJPUW5kWFFhQjFmMjlJK3hPQlBTS3dRd0xjdDcxaUZ5?=
 =?utf-8?B?YXNQU2tiQTB2aVNqaHpjSlREL2lnSDFxMUNwOWJDdmxhSVRKMXV2L2hacjla?=
 =?utf-8?B?aHFnNlpvZzd0c1d3ekRCb0FUTGVuQU9DT1hQbU5YdTFrdkhBQkREQjhZTW9j?=
 =?utf-8?B?SXk2WW16RmFpdzYvdnByQWkwU2lLUkpYZGpTdlpPQU5tSmtIVDZIZm1adWVB?=
 =?utf-8?B?VGp3V0ZXSjBVdUY0ZVdEYm9SQmVrZEI2RGdXNnpTa1JIN2lraXQ2UW1RSmdD?=
 =?utf-8?B?MVBpSjBWeFgvR2t2QjVxOVBaR2o5UnE1SXhYN0JtcVptZFJuYVNWWkVTMkx0?=
 =?utf-8?B?L1pUK2k1K3B5NVMrcVRXRExwdksvODBiQThQQ1N3Q2VRTmEvWWtzZURuZXBp?=
 =?utf-8?B?Tm1WSVJDZ2pIVEN5Y2ZWZ2dHeGdkVmc0WHpmdXJkUC9KZ3c3Z1ExbkxtZXJX?=
 =?utf-8?B?VDJWSWpWZUY1MGlNcnFwNXlsejYxemZWOGowRnpwcXA4eE5Eb3lHVGgxL2ly?=
 =?utf-8?B?ektucUNqNitkYzdNa3J3ZWMrM1l4ZXFZRXRqZmk3K2hNK3FVRFROY3JLbW1T?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f7b0b7-fd98-4a59-8a53-08de3bd7ef15
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:46:14.9929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVorWi5EQQ2XmxjCdIvqGmcGhpBLw++s8pGgAm0WG7HwZ8ULVoCVH3ou/cgb9ur5ziuz6N92MgXvn78PxcZzNNZiCvI08gweS7IpvHjofsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6065

On 15/12/2025 11:22 am, Jan Beulich wrote:
> Overlapping requests may need processing backwards, or else the intended
> effect wouldn't be achieved (and instead some pages would be moved more
> than once).
>
> Also covers XEN_DMOP_relocate_memory, where the potential issue was first
> noticed.
>
> Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course an alternative would be to simply reject overlapping requests.
> Then we should reject all overlaps though, I think. But since the code
> change didn't end up overly intrusive, I thought I would go the "fix it"
> route first.
>
> In-place moves (->idx == ->gpfn) are effectively no-ops, but we don't look
> to short-circuit them for XENMAPSPACE_gmfn, so they're not short-circuited
> here either.

Maybe we should short-circuit them.  I can't think of anything good that
will come of having redundant TLB/IOTLB flushing.  At the best it's a
waste of time, and at the worst it covers up bugs.

>
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -849,7 +849,7 @@ int xenmem_add_to_physmap(struct domain
>                            unsigned int start)
>  {
>      unsigned int done = 0;
> -    long rc = 0;
> +    long rc = 0, adjust = 1;
>      union add_to_physmap_extra extra = {};
>      struct page_info *pages[16];
>  
> @@ -884,8 +884,25 @@ int xenmem_add_to_physmap(struct domain
>          return -EOVERFLOW;
>      }
>  
> -    xatp->idx += start;
> -    xatp->gpfn += start;
> +    /*
> +     * Overlapping ranges need processing backwards when destination is above
> +     * source.
> +     */
> +    if ( xatp->gpfn > xatp->idx &&
> +         unlikely(xatp->gpfn < xatp->idx + xatp->size) )
> +    {
> +        adjust = -1;
> +
> +        /* Both fields store "next item to process". */
> +        xatp->idx += xatp->size - start - 1;
> +        xatp->gpfn += xatp->size - start - 1;
> +    }
> +    else
> +    {
> +        xatp->idx += start;
> +        xatp->gpfn += start;
> +    }

These fields get written back during continuations.

XEN_DMOP_relocate_memory will corrupt itself, given the expectation that
'done' only moves forwards.

~Andrew

