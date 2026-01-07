Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF93CFF231
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 18:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197077.1514740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXSt-0007qZ-WE; Wed, 07 Jan 2026 17:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197077.1514740; Wed, 07 Jan 2026 17:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXSt-0007p8-TN; Wed, 07 Jan 2026 17:36:59 +0000
Received: by outflank-mailman (input) for mailman id 1197077;
 Wed, 07 Jan 2026 17:36:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtGs=7M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdXSs-0007ox-Gm
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 17:36:58 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76de854b-ebef-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 18:36:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8400.namprd03.prod.outlook.com (2603:10b6:8:32a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 17:36:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:36:53 +0000
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
X-Inumbo-ID: 76de854b-ebef-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ee0v2bA9lZxZDiG5pSAiKn7AF3r5MO0MSuaFEBgSLjDiE/wjmhHVLhb5oMb8u+v4YPQapBCbCmI4htQRiUYOtDJGgpNX7LiSxUib/nH+U43IvqTr2L2kYrLmpe1QV+fAgzIHiDOdOEkB7CzJCFzrTuusOAp55RnP/VkDrTEuRj14XkMLqlbRpDkCAGLMx4g+4AP6t84w6Hrtf98YRUUPI9edBy0LbifJABJ50ayQH8Mk3aureHodj2YKlUYY4VEFsGlSgkuSUR2WCcsRV0WvXWIN2zsB9ZbOXLn5z15PEtoNd4zb6Rb2nKe/3SCP3awawmOpeigE1W1vRgzI/ISnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uesa2GPeb4ksot61NbQpAiq0XBW5LczxjehMUfGERmo=;
 b=IkKnBtRun/pixI6nIqpiI8IK9zMUshHLTJH1VeDT8LSQa9S5NY5bjUXS0vZ/msm4JukPH5DFRclsiuW/mPi7kwqW2Ddp8lYaNGh41zOG4SHLkowbbWHMVi96VkTyYuXwXnTTUDiuxrRqoPVoa7k4W3BxDoav6RdLfzEFKZm/V26eC+GiywrFIDHyJ/xim2rhxjGzSjvxUcDzmazRM65E89t6UFHgvfAZcepoc120cRC3pCv4xynoo8hm/x6lT/eno8ecXN6Is9DvLG6MPfqZSTr203BmtTpnd8CsDyxbq0q3M0Tqn0bV8xopvWDDwwPitVdjgHelw7MKwJZc/YAOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uesa2GPeb4ksot61NbQpAiq0XBW5LczxjehMUfGERmo=;
 b=SYYf7sj9oirYAIQ67+7IMf4dp7lDpIFoVNnwWOzrenqm0sTK8r/Zbwth876giQ8fmgoAmxtEvGNZEiDaFP4453cGRE+80Y4g8DjZwEJUZ42rjLTheRF+CEiqq6tXE+fWOPlOZ5CF0dbP/YRNYRmWD7yrfnuEQv/DG/Zl89rXXeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d2cff32b-0170-4afc-8033-b7bd7ca20eb7@citrix.com>
Date: Wed, 7 Jan 2026 17:36:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] cirrus-ci: introduce FreeBSD 15.0-RELEASE as "current"
 version
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260107173509.56155-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260107173509.56155-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 23304312-4aac-4f8b-666a-08de4e1358cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUcra2FlTjJyR2Y0YkQrcElhRkJGY21VR0s0ODgrZXRqd1FRRHNQYXl1ZVJD?=
 =?utf-8?B?bnlhNHowZklVdkx1VDgycE1sU0lmOUx1Vm5USUpkYnArWCs4ekJKRU9Namtp?=
 =?utf-8?B?cHk5cmp4NEpaVFh6SEVSN21JL3dqdkZlTVAzZjN5RFNFWldzYlpxM1hKck4z?=
 =?utf-8?B?bHp2SWVBK3M5K0ZtaU02Ny9zQXFSbGV4MXBQOTVTQ1EzQVVsbnlUZ2dzMHVG?=
 =?utf-8?B?c081M3YyNEkxNW5xRDhjbCtqRnJILzhIYU8raVZjM2dINXloTmEyNExXa2Zn?=
 =?utf-8?B?Q3lDK1pJWjVFYS94ekRvalpNM1RTeW9mejhaOVRyTFc4aVRCTEtSeWRBYnp5?=
 =?utf-8?B?NVpkV0kvckh4bWtheDdBVHRxaDlFNmsvTzk4a1ZKWlF3UHYydlh6MGVDYkZX?=
 =?utf-8?B?VUpxSDdNd05JSWJoNjRvbDFmLzhQZlJ3ZkhESVY0cUtmZFVjUVV1NWFTdWsz?=
 =?utf-8?B?eCt1YnlmbzAxMENrZEZhS0h6Y1o3Kzg4SURGakozdGN4d1plQkxHeHQvY2do?=
 =?utf-8?B?YnNiMHdya3lNTFcvVzQ3Nld2czZKeVUvNmt6OFljdEZaTHZXRk9Ldlg2ZVNI?=
 =?utf-8?B?MUwwMGh4Z1prQ3BzUFZKVUJkalhMb05lOUR6ZGgzelE0VWZQZEszeEZhY1J5?=
 =?utf-8?B?enVRdzJ6Y05weGp0TzBvcGdxOUU3U1ZKZkp1bmFnVnNBOXJDSVVPZ1ZNeVpL?=
 =?utf-8?B?U2EwdnNYSTFmU1dFajlwR0ZqMUFoSFNjcGhTMUZlNFRaTHpxYm5jd254N3cx?=
 =?utf-8?B?SldNMndFcHZJVURmRmFJazdzUWFpamxuNmZMczB5Y0xpOUVoQ08zdUxCQ1dE?=
 =?utf-8?B?anFqMTNkOFErQmNKNjdKWWNSN25IQVNYdWQvUE9qVXFyVU05b1lrK1BjbHIv?=
 =?utf-8?B?eExLWjJEMGtGWWhIckVtOXlFZENnZGdieHcyVms0NUtUK1hiZE1wTU5vblV6?=
 =?utf-8?B?SlNxOGhwRThlZ2tIRWk2Z1dQZlQzYlc1YkFlelh0T0VTa2xIZkFBcHlzSVg1?=
 =?utf-8?B?TSswWGUrWmd3N0FMcnVGUFVrRmV2SVpmbzh0TitPMlQva1k2Vm5OeFRnZVNV?=
 =?utf-8?B?SjQxU2lxMTJwTTh6T0FLYkhsVVFMR1dZMWVnWWw0NVFzcmhXYm1KbUtqT1E5?=
 =?utf-8?B?MHBrSmcrdUZveE5ZdWVoaXZSNDVyMExHNzB1K1hxaWp1UzBMTDdrSUtyTkJU?=
 =?utf-8?B?ZFVtcHE1QitOUDdxak8xTGpCQ2JRS3I3Y2VzMFRLUDF5enpMWmdvRDFMbHFy?=
 =?utf-8?B?b1ptNWdubytJdHdjSzhzTTdoM1RtNERDRk1vNXlGRjJyUURpN2lTYm5ucFZZ?=
 =?utf-8?B?djZjOFB2TEhVTHBaaWxydy9WSlRGWXE0SWM0RUd4dmxIOXdwZUVVWFplaUdr?=
 =?utf-8?B?M1E0ckpROWZIWDRoZkNtSXRYeFo0c1dwMVZaSlRoVWhHZWN0TTNDVUJHaitE?=
 =?utf-8?B?ZUdLekgzOVlNUGRyM0M5bi9Zc0VsTUs4Y3V3SXZzamNCZFNVSXpoZTBNU3Ew?=
 =?utf-8?B?bllPelJuSktMVUJFVCtjZDRsenpxZEdlWEdTRFZ3czg0VHF2OGtWWmJBQjhw?=
 =?utf-8?B?alhscmVVejVHR29FUFNCeXN5WDRCWUFWSzZMdmVxdDl0c1RjU3NGNjVBRWFL?=
 =?utf-8?B?TTExcjFvQzhlK1NQb21aWWZoeWZhWm5lWjlQT3RDd2FNZlU1MitHV3QwQmNM?=
 =?utf-8?B?aU5IaTQzSWo3MGIxSHlKS3ZZWEpOamFIYk5NSjRxZjViaURTN1dKdnhGb1BS?=
 =?utf-8?B?cW96SUNPTUY4YmljT0RWSDJMeFo4QUh6WjBGM3pHZFBWYWNLUDdpeWU0cllt?=
 =?utf-8?B?bkZUM0JlbTMxWWxadEYxZ09PR2tZSStOdXdiK1l4YmdqQW9JVWQwQ2tlSVhQ?=
 =?utf-8?B?ZWF6WXRHSngzQlMrTForSHZlL3dxSGROOGZneE5EY0xtYytXdkNqYUZjZm5E?=
 =?utf-8?Q?sxZlBit745oz/wo5pXTZQSVcbRVbv5EC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3BDVWxGM2RKRjVsUXZ1Z2JzQ3NvaHBEWm9nS2UrN1FVV1FYY2QvTXpyYzUz?=
 =?utf-8?B?RHQrSmxyTHA0VlpvZXpoaWJwNkNadkVTSHk3cDVQQzd4cHUxVTIvZ1ZGNE8z?=
 =?utf-8?B?TzFtVkpTbFdYWVZ0U3pYNGJjbEJFMW50Mm50Z2REQVBvQXFaQW1jaUlPOFNM?=
 =?utf-8?B?Y0hiUkZlNzlRMWEyZEQ2Wk5IOWpET0h3b21ETkhSSnVRM0taaitaVkdHdTBD?=
 =?utf-8?B?Zk1KeFoxdzgvWDVqTm5PTHpDTUpjSngxbHN0SFJhbGhNaUxGNkpCZEwzZkp2?=
 =?utf-8?B?bENMNVAyNnMzaEVSWDFqMytPY2l3SldQN0FMdjBWVlI3NUhiOG83NXE2YnN2?=
 =?utf-8?B?UDJkelBGMnpUUEVGUUNSVUlHY21RZ2d6L2FkbWd6QTFKRytCcEhrWnd0VjQv?=
 =?utf-8?B?Y3EwL3ZabkFsSWorQTF0cWRTV0lYSDdzRS8rYVdvczlRWXJSNHlKT0c2akJO?=
 =?utf-8?B?REdwenFNZ2pObFA3Z0VUTm9EQWd6YUppeTlzTVFHa0hDcXFqUFFzcFZ0bXhN?=
 =?utf-8?B?MjlBUEFKd3doaytPdGtpcHc2a3BZRlVkTzl1ZEltQzZBU1V6VG1aVURTdFph?=
 =?utf-8?B?TzJkNUozUUYzaVBQZm5qL0dNK2hxVVZlYlp1eThmN1l2RFlMTGl3bFV2c0NG?=
 =?utf-8?B?ZDZ2bUE0QmVmK3pCQ0syQnBMdXl4RmhxYWNDV3FNNXBlaUI5Uko4bXArUzht?=
 =?utf-8?B?dEEwSjlQTTdxQndXUlRXcEl6RTV1Tm5WY21GY2VreE1RZHlkVWtqSUl3bzBH?=
 =?utf-8?B?K3dyZ2lGc0hZaHBTRklDd2dxN1dQMndXNXRZMUNwY3l1dDdIa3JXMmhia2tU?=
 =?utf-8?B?Zm9NRE9ES2g1bE5HWUg1U0NzWHRNNGZSeWFHS3ZJVjBlQWhPU1JrcTNkOGVB?=
 =?utf-8?B?c3lBUkxJRnk0YXhOSFZ1Q3ZBVkYyckJqTFNkWDlsSDFmT0pyNk5XYlVEZ2cx?=
 =?utf-8?B?ZkdOdkRIQWNSRHMrSE9zZExpNWVKSXZLVWIwOXNTaXJtT2x5azRCUEJLUEJ1?=
 =?utf-8?B?U1RjSklub0VXVXMwZEVmbENQSTBkQS93NzRGb2VqSXFySTVBYWJqVlBibGZx?=
 =?utf-8?B?bGFBclVZZGgwbE9PM1hCcHVoMERqU29vemdOYWhyRWI4MVE0QnZNbTNSeTk3?=
 =?utf-8?B?T3AxblJSNENWb3ZObXBJUHpNNm55MFhZYzUwTG9pRDdBcFZJMkc0MDVIVU5P?=
 =?utf-8?B?VDRiVitwZmNSblNWcTFiUWZZaU93djJEOXdkY2RGQTE5Ym9GMWNJekJHVzVS?=
 =?utf-8?B?c2U1WGt2dzVDUXBkd20wRGNoREdwYnA0K0dwZGs0YjFoaVRoRml0ZzBaOVVz?=
 =?utf-8?B?TERzYjU2MTdkRlZoU1VRSHQzYkExM1orUWdCTEpFMHBCTnFkKzJjamtLVDB1?=
 =?utf-8?B?RkhnZDdPeTA2bU1JUzVaaUhkQVdiSVlNVE9lZDdFQTk0WGJWOTFiTmJBZXRx?=
 =?utf-8?B?QkxhT2hKRzFvYXJwSCtxN1l1YU5DdEZTMGpJTEEveGNKaVByY1NxbmQzZXlp?=
 =?utf-8?B?cTNNZzBLdk1HK0lvZys5YUxkN2RUWTlzb0YrSjY2eGtyMmtXcG4yTzJtbng3?=
 =?utf-8?B?OWxwd2d1QW5EZk1EZVFvSTFRdVdEYzFUMWx4TjcxVUNCMTRkL3hXRXNJRlBo?=
 =?utf-8?B?M2dCVDVaQ2JSWld5QW1xdEpBeVMrWEtHeHFxdHdqMUJ2MW5uMitVblNZYXFD?=
 =?utf-8?B?TjJjOVREaTZHT3A4ZmRLY1lOYnRZQ0x0RW84a1pld3RMRFE0RXRzU1Z4eWxl?=
 =?utf-8?B?ekRWRkRPK2JvMHgvcVQyMGM0OERRN1pjNDM1NkxaN210clg2WTN6QnYvenRi?=
 =?utf-8?B?MjR0cTUwV1Uvc1NJKy84UWt6NE1LYkpLYVhvMjdHNk1YVnNwZVFDZ20zYzBC?=
 =?utf-8?B?NkRFbE9lbWRTSVJxbmZLemIwUjJRR0VkVERjUmQ1WjI2NzEzUmtoTDRUbzFx?=
 =?utf-8?B?VGgwTTJPMVFyV2tDREhOS2h0UkpUYThrWldGRHBwazI0RGdGL0dMZ0JEMUR6?=
 =?utf-8?B?cGVsR1puWW1NRHFFcjFxcGExalVyekhyNE5qZDNQYzlUQTBzMThiYnhpREVT?=
 =?utf-8?B?QTd4SmNNM3QvcVRCNzNPczV2VTZKODdUbFhSdzdWOVBVL2xIamNRdWJ2aDYv?=
 =?utf-8?B?RUMwSEl5YkxvVjJ2RmhIcklZdkxSb2Q3ejk4VGFETUNkZ1FuU1lLcnZSaEhX?=
 =?utf-8?B?WkEwK2lpenNkWHlEbks1QU5icThvTHJURmVPVEYxYTQxWlJLM05YMmNISHpv?=
 =?utf-8?B?WjBmenR6b1ZYK2dQSFJZNlo2VzJsZUxCV3dwckRHYy9ZZlovQWcyNlJJN1Ex?=
 =?utf-8?B?d2ViRnQ0YVl1ak1CRStXYkJzb3NLbUIxOVVkZisxeDBHaGxWUjU2K0dwR2VW?=
 =?utf-8?Q?4kJR4WyHyp6V7ts4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23304312-4aac-4f8b-666a-08de4e1358cb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:36:53.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF+Sabf/3hexsaRCctjAwKdTZX+oPZvYUwBD3+r2mT4a+Zc+R7HySUi8+XMbOybvQNtWxjFtPpH/2eBrrzeUr4Gp14uK+KJmITYITLjNZE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8400

On 07/01/2026 5:35 pm, Roger Pau Monne wrote:
> Switch the current version to 15.0-RELEASE.  Sadly the 16 snapshot images
> are not working, hence use the FREEBSD_CURRENT variable as a placeholder
> for 15.0 until the issues with FreeBSD 16.0 snapshot images is solved.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

