Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CFC16BEE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 21:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152414.1482941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDq8j-0005mp-7I; Tue, 28 Oct 2025 20:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152414.1482941; Tue, 28 Oct 2025 20:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDq8j-0005kn-3k; Tue, 28 Oct 2025 20:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1152414;
 Tue, 28 Oct 2025 20:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ld8=5F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vDq8h-0005kh-BL
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 20:17:55 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f5e67f3-b43b-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 21:17:54 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB10147.eurprd03.prod.outlook.com (2603:10a6:10:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:17:49 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 20:17:49 +0000
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
X-Inumbo-ID: 2f5e67f3-b43b-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAM0GP6TieCgzW6751OI+IoAJ0ECPBBRoJM+g8VRoa6c5PsKZozGbNNb+Y5zCqBpLolZyV7ptz18RR7QSiWzSES1VslBlkpHa7dMtRP5al/yk4JWtltg0hkzU26cu1s8oCn1KFIIPRkeloICPHFCA/KX0H+s5aKR21YelJWi6Y7sm4e587BQqkJ/lyLUGtsy8+7eGZ020PiBGhG6x5FyWeM31tVXRoaatfea7+81UjIbIPSZS99So5yhdUY4DZEccWYU1RhW/kGNfghOKC4aGSuCBauQDhudufxBceo/RGF7+oDQpGpsJ3qh8VYL/rE+c8ZFNtXVGncc9lzyiF03dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsjvXvARxaGXfVSFISr6mbzt/YqfM+Vx9vWaY02EJk8=;
 b=iAvNBOpKf9zBW5v9nuA3kIO8TZdz69/dDAEm26YvNu0C+b65teQPEZJy0KGoRsS4rK65NbRcoM1nnUd8XZGuDqg34AkJVByLymZXL2fmfgslxEPUlgePRWLnDQpFtUQEnSdQ7FVBDN/ZMlbcZifZYMCiG+QuZGW3fKKIJL2TWzuBPAV+pxORC7O9NPhfI/wutE43XMoC2oYcuqtRaUjr9VVncmHUeNcASe2DYkKSY4MLYd8HWgi/4D+Ui4W1WjkGtlHGkLrdMIvHplK5MiA4iYVzi3ebgBQRGu5771AC+ckQQihx9qbCOjfGsyjAAI4+AjW7DmNSwPKB+9U1ObkV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsjvXvARxaGXfVSFISr6mbzt/YqfM+Vx9vWaY02EJk8=;
 b=ZnUr2MonDtq35+g9tkVn6T0ZWRbwRTP3v02RTU7F+krQhf8sRfOv7jJDCqlKop4iRAFzZw/h9TxGv6n+sTeidbbuUtbRtBQ5lL1bdFD7ErOtebtBPmLKtkRfaA3HmOzM7TTOd1RMoyLvuKxKhdaBi4smZVMiYuGA8hqyg43/Pcz84vU8DW0K9w65kPGHn9EI87DM8GafKdu1R1UPdGN3OkY0dXt82lPPArGwjRtbDW1YRryh/8qhHgsNP87ZUxy7KUXwi9SH1+YZLaYogw3TdXuVj2+IO69tJqjw4vfTx2GViW9SFYXduxurgE80htbYACAKiIN9yezq0Xorkn6JAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a66a8394-88f9-4b58-ade6-56c327e3cc08@epam.com>
Date: Tue, 28 Oct 2025 22:17:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] x86: make Viridian support optional
To: Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <20251023151807.560843-1-grygorii_strashko@epam.com>
 <cf7f5cad-06cb-4702-a10b-e0b087060fb3@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <cf7f5cad-06cb-4702-a10b-e0b087060fb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB10147:EE_
X-MS-Office365-Filtering-Correlation-Id: 715e405b-0765-40fd-4caf-08de165f108b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blAwdndWdVVqOEFkbGtvQytKTEJtOUtqcVBsMVVjakxiNWZlV2pLcjhhbHlG?=
 =?utf-8?B?SG83Q1pDRXhKMUFrazFsZ2loNFl2SzhRcVh2TlJWdkFtdWFXMFU2Y1dsMnZr?=
 =?utf-8?B?eUlrbitCTk1RQjJDUHgxdFh0ZXdneGpUZXlKd3Uwc0JNL1FPSEtLMFpaR0xC?=
 =?utf-8?B?RU41TFJ5S1cvclZYTzlWdTJDOFVjL3hReS9pQllqWGdmMGp3eHI1c0hZVEFX?=
 =?utf-8?B?bTZCeVF3d0hWbEIzeDRURjN6RW9sZnN0cU9sbFJIM1Q2NUpNR1VRK3U4MmhS?=
 =?utf-8?B?aTRBQ21IelM4MWNyZG10ZjJGK3JOSUtoblBDTTczRjJuaFBVclAxNVVLK0pR?=
 =?utf-8?B?ZHdKWGFvTlpISDAvNkRGTHZBUmFmbEd0RXQ1ZWFycXR4SFpSajRoZmNpV1hw?=
 =?utf-8?B?cGQxbStKRDNQa0xPYmV2NU9FdStUa0hoMlFVUHpsLzRBbnRrdlRuT1NWbHhO?=
 =?utf-8?B?dkNUby9JVWc4ajhtUkRneW5XTUQvRUVKK3dHemIyTnFjeUc3d1FQZXRteDlP?=
 =?utf-8?B?TURFV292dWF2U2RyZ01ndGR1ZjJHWS9hOER6WjhXakpEWmNZNW9haytWTnph?=
 =?utf-8?B?Zm5oem9TNmtPYU9yNERlazRCeFJ5VUE4SjlKTHRqZ0ZaOTNpTUdCb0NnM1JJ?=
 =?utf-8?B?Vnp4cXNoYkJrRXY4NHphM1pBTW9GaUpsMXVheUdlN3M2SWZkbHFxTzEvdmxz?=
 =?utf-8?B?cU52ZFBGbXZPYytaYTRUbnkyMHdiN3FBTUZxMG1GQkNpU2lvK1pZQlROakc3?=
 =?utf-8?B?QUh1ajhpZmFyYStGdVl4OWVYN0s4aFltN1BYaWxMN0o4TDllQVV2eVZ4WUww?=
 =?utf-8?B?N3N4NVpOSjhJZEpoV01FQUhaenVVYkprNjJucThDVElZSno0WVhvM0xBaVlY?=
 =?utf-8?B?MzB2OGRTS2R6b2JLSlA4a25vM0xYTmMyV1JLdEV6eHpQbU11T2ZvRjV3TFVn?=
 =?utf-8?B?aEpOd28zOW9qb2tSY0ozZUJNeGNOeWU3VE5rVm9zQlU1ZWJGWmxVWWNiY2Nq?=
 =?utf-8?B?KzNpOHhQRk9qNzNEb3JRMzBSUTBPMGp0NzJLdnNseFRHUlEySDQ1Q3ZWdzNK?=
 =?utf-8?B?bWdIbWY5a2ZQbjNuaUhqS1JvTktEbGNWbXFLcFJld3VKS0x5Q1lTMzJaa3Fw?=
 =?utf-8?B?ZjVXNCszbFFIaXQybWpueEI2Vm0wT3VsRVNRcEt4amp0N1F5YlhPamtacFls?=
 =?utf-8?B?TEJkMnloZTVFNEZxbW95K3VDSzA5em5KeTd3NmlpMkNpdndWNU91UnFxa3ZK?=
 =?utf-8?B?OTE2c1RUYWtqYkJ2YzRuQi81VjBUb0JjUUd1Vi9CZ2wzVTIvU0tXeDJUVHB2?=
 =?utf-8?B?ZDFxKzB6Z2hoZll5YU5abWgzVUFHOWVER0JjWVk0dWpMVHpkVWpuempSbnU2?=
 =?utf-8?B?b0JIV3I2Z2gwb1NTVFRCT3B5NkRjM0tJaFlyMWFoVlVMbGlBdkE2cERES0Zx?=
 =?utf-8?B?WXQwRU50SEVUMzNqeFM5ZjArcFRwRnBGZ09NYmdKbFdXNVhhWkExKzBLM280?=
 =?utf-8?B?M2VQOXdjODBJUEdYQTNqWFl5ZDUrU2N3ZjBQZzFBSDhtUnJZcVNJRklHc1lT?=
 =?utf-8?B?dHJ0eElyODBibVc1cjk2U2FzT0x0b0UzU3I0cHdWL2l6eHFUV3VHa1luRFdJ?=
 =?utf-8?B?d1FnMHJOMjhvR29uN2VGUmhWV3kvbEVpWjlmL29nYVpBZ3hvN1N6QzBYdjFD?=
 =?utf-8?B?Z1crRmRHYXZ1VW56eXRtb1MzZ1RUd2FWN29SekJ0cWVPQzhRbXNjdlFaZ1Jr?=
 =?utf-8?B?RjhvdHZidXBvNnJiT1FPaE1CZkhIaWdvWjBnK09VTzdPZ3RGQXRiV1Z6enRx?=
 =?utf-8?B?aDU0SjRXY0hpcVo0L3BSa214bkE1bTNWVlRHR3dWR3ZNZTRGVi9HVkkzWFNS?=
 =?utf-8?B?Smw2bGx5QVQ2Kyt5NC9UN3IyNzNpa0VBYUVZVkNjaHRxWmtiS1hVZ3B1U0JB?=
 =?utf-8?Q?Egrvs83aphdBnAjU1UyOvfXv9Tl8YAmP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGlzS0ZoWUlYUkxFSENIblE5STFIcGV1aUtTOHFjaDd6Rm1SVlRYMmExWEdC?=
 =?utf-8?B?dTJkYytGYXhmR2hTVEFKQ2JHWndMeFJNcWtIYzRSZkJhNzFWK1F2QXpRYkpQ?=
 =?utf-8?B?Tzk4RzVFV0t2TWRBTzVWVWloV3praW1VdE5HVW1zT2hzU0E1SDg5ZEM5Q0hx?=
 =?utf-8?B?b09yUUorbzdaR1RRL1NiSHc5UXhvb3R3V2dsVmpUNUU3a2piclIyeGVDNVVs?=
 =?utf-8?B?NTI4WlB2WXJ2UGs2ajJxZGE5VUZteExZdkxxV0RucHhsYVhUNjU1eE5URW1r?=
 =?utf-8?B?ZmsyWTFWY3ZyZlJEczFxNWZtWFdBb3krY05BQVdsOWRNNnJtSC9meVYrV3Uv?=
 =?utf-8?B?ekUrcVIzRzA2QnZKMUxOOTFyc0EyODFqS1loQnBzOGdnMDBlTzlmV0E0VVgz?=
 =?utf-8?B?aEVMMGszYlJ4QXZlRk5iTVZQYnBXU1FXWWdRSnNlVzFqdXJwYjhUcTRRUXEx?=
 =?utf-8?B?LzJmdzRxMXl0YUxORE8zVkt6N1NNQzZJY2piWlIvODFUMXBUSlZiaU1FRnpy?=
 =?utf-8?B?Q21paHUwVTQwN3BlbUtRYW1Gd0tMR0xLVlFkaDVFMkZLNUdwYzl1S0R3SXFG?=
 =?utf-8?B?M0xNSXJTMThTajcvUVlLSzRzVllVMjNpREdpaU52NWt1SXByQWt5SjFsbndr?=
 =?utf-8?B?M0pZM2dMT0RjdXhWR2xKYTNMZHVUK3lFaXRRYU1Say9sSkt0QmdJSGtvMTJM?=
 =?utf-8?B?SUtpc0NJRXFLcUsxN2owL01nWEd0bGkzVU5XYSt6dlNyTit2S0Qyc3AwVGpO?=
 =?utf-8?B?WXpSWDZOcS91cEJMYTNaTHcvcSt2b3BZWTlKcW5ZbEQ3eVhnWDgyazJPeER5?=
 =?utf-8?B?cUFhRjVjMDlEdnlwaXQ3VEhSa0pmRmhZWGZSZ0htTmRZcldpaW5KdzlpeWVh?=
 =?utf-8?B?emxqcndNSWJDWWk2elZqc3pMVUl2SjVRM21sSVZOY2plMWQ5L3l6MVlYY0Fp?=
 =?utf-8?B?MkpXdHdKMTJtaGl6Q1lzWVpUWHhpc3BlTEk5ekt1SDlOSDhPMW1ERXJPaFZ2?=
 =?utf-8?B?RDc0UWozWEhkc2xhZTdpTjZFME5TS2hkQXpNTXpnRWhoM3dmSmpzVXBKYUVo?=
 =?utf-8?B?VzN1bEY5T0xzRGNaQTFCT3MrYzR6bGhBNW5YZzNPOTFVUDR3cTBxVmJ5U2ZL?=
 =?utf-8?B?WldiYjhucjZscnlJNjhUeCtJekJxT2h1N3BkdUh5d3RpZW9velV6cjdGSldq?=
 =?utf-8?B?ZlJQbnZIbVlOeHVoNTNKS0dJRkowaGhjNnJJUWdub2xpME1IRVNncmxIdzA3?=
 =?utf-8?B?dzBtb1NDQnY2aXhJVktldlAwcHl2RWZHRDNKWFdTTk9OSituMVkxQ3RubXAw?=
 =?utf-8?B?S3VDUTh4WTRmSksxQUJoQTFDSk9UTExDQjJ1ckVqQUVORTFKQVVnc0lReVFs?=
 =?utf-8?B?eGpQczJXSUx2RytNTWtxL2pSOUhOUnY3VGRLMFRuaWVnbGhMcE04RjJLYU5B?=
 =?utf-8?B?WEFmZTYyRmtsVy9pb2duV2dQVkdpUERXaVZKd21mU1pwK0lITU0wTkRIOEsy?=
 =?utf-8?B?b0ZIZUlhTzlNTDB3UTRVVnFGVURyNUhRRFNJN3lQTlAxOWZoZ0pIZlN4M1hC?=
 =?utf-8?B?ZnFuVEF5UlhHdkV2Vi9YRjRSbWp6OGFxVWd4a3dCaVJiVzFTWk14QlE1SDhq?=
 =?utf-8?B?RTdZWnA4SUo4RFhIa0MvMVVGcnBMZVZ1c2ZETVRvSmxLRldLT3ZYMEhuS3cw?=
 =?utf-8?B?WlY1MTY4akRMb0Zpc1dUa0ppQXFEdDE0RVRaK3dwV3lmSWlCc1UwTnVIV0tq?=
 =?utf-8?B?ZzAyVVlSOHZTNXlhQTZhUjl0TTNQWG1wVWlvU2VidHZ0TTVvSTJacS9wVElD?=
 =?utf-8?B?Vkkxa0hSOE9GMUZ1NTVzQ21rbDArYitxMkNBSjU5OTlHckVCTFF4VVIxdnVG?=
 =?utf-8?B?b3J2M2dLSm9MNDVoU2ZXU2tkQVVFSWQ2U3FPUVpQZ2p1d2E4elRQMCs0TFAr?=
 =?utf-8?B?Rm9kLzllcEhrdDNNVm5MNEZ0b2dFdWw4WnFpUEExSSsvNzZwbkJXdjU3TURk?=
 =?utf-8?B?dzg1Tk05K1d1OWFuMmlWK0RiVlp5OER1ZzA3TGlBOU03dW9sT0dqTC8vUVBK?=
 =?utf-8?B?MVJxOSt0RXZUOUJqdG9UWGVnS25yZ2J1ajRQenJUWWdkbWlObWVXNDdSbTJt?=
 =?utf-8?B?cjErTkxiSE52WG13NU1rQUJMSW5DVU9wNDBVMFduMUdCbnBPS0xFNFZ0MFZ2?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715e405b-0765-40fd-4caf-08de165f108b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:17:49.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjWEW040k+O5gV4mRFQKXKVfPRvh9wU0non1dQlFEFX1/6iVaXxqPEoKeGEu0fKOxuFJ/9bCyHGb6MxhGwLYiCe2GTfsvQetHXIYxKYA2+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB10147

Hi Jason,

On 24.10.25 21:55, Jason Andryuk wrote:
> On 2025-10-23 11:18, Grygorii Strashko wrote:
>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Add config option VIRIDIAN that covers viridian code within HVM.
>> Calls to viridian functions guarded by is_viridian_domain() and related macros.
>> Having this option may be beneficial by reducing code footprint for systems
>> that are not using Hyper-V.
>>
>> [grygorii_strashko@epam.com: fixed NULL pointer deref in
>> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
> 
>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
>> index f79cffcb3767..b935803700fd 100644
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> 
>> @@ -1153,6 +1156,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>       struct vcpu *v;
>>       struct hvm_viridian_vcpu_context ctxt;
>> +    if ( !is_viridian_domain(d) )
>> +        return -EILSEQ;
> 
> Given:
> 
>   #define is_viridian_domain(d) \
>      (IS_ENABLED(CONFIG_VIRIDIAN) && \
>       is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
> 
> CONFIG_VIRIDIAN=n is okay because of the IS_ENABLED.
> 
> For CONFIG_VIRIDIAN=y && a viridian domain, is HVM_PARAM_VIRIDIAN guaranteed to be loaded before viridian_load_vcpu_ctxt() is called, so that HVMPV_base_freq can be checked properly?  I don't know, but it seems a little fragile if this relies on implicit ordering.  Maybe just do:
> 
> if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>      return -EILSEQ;
> 
> ?

Should it be done the same way for viridian_load_domain_ctxt() also?


> 
> Everything else looks good.
> 
> Thanks,
> Jason
> 
>> +
>>       if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
>>       {
>>           dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
> 

-- 
Best regards,
-grygorii


