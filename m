Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3CC14AE6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 13:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152098.1482629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj5C-0007Pw-EI; Tue, 28 Oct 2025 12:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152098.1482629; Tue, 28 Oct 2025 12:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDj5C-0007Nq-Ab; Tue, 28 Oct 2025 12:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1152098;
 Tue, 28 Oct 2025 12:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ld8=5F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vDj5A-0007Nj-HF
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 12:45:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 040c81d7-b3fc-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 13:45:43 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV1PR03MB11029.eurprd03.prod.outlook.com (2603:10a6:150:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:45:36 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:45:35 +0000
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
X-Inumbo-ID: 040c81d7-b3fc-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYtZCIGUWjoqZOGAzplw9IHHRl7gyvW59rX0fZCq1pCVVghbNUByKIRfwae1eKaqvqmFYUUfSabyIkdYdcI7XsST5iGRPlx/dM4SCzmJibu4w3Ss8P0pbcERVUsgZsHwe1Q+xGIw15bCjFL+SFj2xW85ay6lV+8WsheTG0/v6U/WpTba9EnUpodTGMExNeYCtYXxsrVUsskWaPkas27zHgPlusy8de8lYkWdZXVtkzPFwCy2AW90mR/RHniWx3zGDBobXIq316XSulxEhpk5SryCBFIPa8EfqYtJSyucggm8lsooao5Rp6UiTDpJ1jV4u0lAnhYBnmibgAHMir+X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTvnQvUBqwSqQJ7zORi1lY85P/9OGQ38YeFEP7zBOXE=;
 b=pTJwWptQUzsuSwfEcECZp/ehPF7tt06qrb0gZv7gk1KgKzgGy4FYl33Po/aDKjpkd43xI+Bok7BtWkf96TL/Y/ftBaYFGjEadiKNLhyf0Ms2fcFSG4k8TQCA7Pc8sD8M5e+PCUgKVKaDvb1LhPFi0KW+0F5kEDJb+PPXag5aavEFxqrsghCC53IkN/MfS2KdcXmtI7jt5LyxjYzcz4HY+1i/62udIwhOwC/3Jcif4Gs58iZajMQw1UJyL31iaq5/DSrCI3YGrdjJdIMN1YMoMRFW0ft6NYRVbX5zjT+Tu8sDkXHrou9TBW4qiHuSHmUt89bVxqanLXULuynk/N+Mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTvnQvUBqwSqQJ7zORi1lY85P/9OGQ38YeFEP7zBOXE=;
 b=domevFh0ZNdAktB1UtQhbObIkrVEioUtGFnCe6X9I1MMGuD757VZi243/4MtmjLCDFeDsoWeaBUGoQuY4FeTXSxrgQulW2Y3sIdKmZZ6NkHN15v1Ty34hPwnFl3nqVJOzFyElQt1A2GzY1qK6+KphqSNxi1nTJ2hfWi4Q5brbt1cZFnVIJaxTanu8raeFyJrXAtNNsMinvyWq8q7gANUkikvz/zbxDDD6HleARQZfncuH59KDosdzRI1xGfPbicwfaYoSb1uGonGfEu6FvdT6Hd+likOVIXu3OvT5kpjXIO6+SKrYIz74TgBplUqehsgXheltQ4FK37iBMAVuFuEVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4059d1dd-4e5a-429c-96dc-e7d81f4af7ab@epam.com>
Date: Tue, 28 Oct 2025 14:43:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <Jason.Andryuk@amd.com>
References: <20251023151903.560947-1-grygorii_strashko@epam.com>
 <eaf5e6bd-e7b8-4a3d-8b5b-33d1a9630619@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <eaf5e6bd-e7b8-4a3d-8b5b-33d1a9630619@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV1PR03MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: b4911673-1cdd-467d-bb13-08de161fe3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEROOGQveVRwa1oyTjQ5UVBnbUMxNnM0UkN2WVRJNnVNZzRCdGVwTjhablFh?=
 =?utf-8?B?d1JNWkN0NkFPNDFFWlFmc2phQ3NpbUJudG1DSWJtckdrRFhseHpvU3RKVHE0?=
 =?utf-8?B?VWxjY0tFMnR3RGx3NDVNR3RvN3ZrTXVRWnRybXM4eEJBMkhUYXZtdmF1WHpr?=
 =?utf-8?B?VkJzZ2VJZXJIUm1mUnN3aUJnY2dyMXA1blZ2dFBkdzZOMTc2bzFBWGJwY1JI?=
 =?utf-8?B?N2o3L01nYU9JY1NZSXIzS3FiZmZJTFVyNlhtM0NJTVBLd1NVWFM0VmhzNU1s?=
 =?utf-8?B?ZEw3eUpwM0dCSCtGK1JTNjBpSG5XcXMvVXlHUnlyd0JCdDZhY1JCRTlVM1h3?=
 =?utf-8?B?UmVQMyt2YitaMHJxOGx5bWgxM0JCY1Qxc2VMRFlmU0VuU1VuMmZjdmRkbEJy?=
 =?utf-8?B?OEtRWnJDZHhRaWMxZzhZbDIwSEwzUnpEa2V3N2dxRzNEV1FtdU1hNXJKYVN5?=
 =?utf-8?B?dWI4VTNyZERValBPRnQ2Tmp5ZU5FUDd3aXdSK1o5QlNQVy9namQ0ODFGMFNa?=
 =?utf-8?B?UFdXajFJeWlnSkd2K0tpYzhUVXUzR2N6Q1Y0clZZV3hnTWYwV29BQjNvYjRv?=
 =?utf-8?B?SzBoSWY4b2ZvRXdkTzlmYXNBSXdXT0dJck5tSU9sdEc1Yzk3QVE1TEFIVTJZ?=
 =?utf-8?B?ZE9ZUGRsaWJxaUtqZ3gyMHZYbm4ybE56MmQrMjZ5OW93aTlhVERXZU9LNmp3?=
 =?utf-8?B?R0YvMERaYk9sRVJTYmtldnlOK1VoSGpBc0g5Tkw2cUlxKy9JdDZzaXNCUnVI?=
 =?utf-8?B?Q0hHbUNYRlJHZUpyZ0JZdTBZWHVRZWg2bXU5dlMvcW0ycnYvdytCcTR3N29y?=
 =?utf-8?B?NFpFeCtmNWhicEZ3QW95cVdsM2NxcGtEQlZneDRzQndLL2J4MXRkZmY2UVRC?=
 =?utf-8?B?YkhjekRDeVRDajlBblFKb0pySnk0bDh3dmRTdGZ5K2laeWMvUUhIcTlCd3FK?=
 =?utf-8?B?QkFpUkVMRW1lV3MyVGYwY05mWkllV3VVWlFlZG1FS2ZYcHk1b3kvd3QyWHhO?=
 =?utf-8?B?OGtOL1lQRW9hTkxCZXhXN0JYTHRuVjJ4bERpdGFZYkZYcTEzK2JsLzlKcVRE?=
 =?utf-8?B?ak92Nk16UjFKcG0wWFZTVFJFSlRmMWR2ckhOTmZoSWpIeTh3MlNEZld5M3JZ?=
 =?utf-8?B?N25melpJREIxcTZqczhzMXV5UHZzNE9NZnJmU3ZyNWtEbnlOcHFpYUNVYzFl?=
 =?utf-8?B?ekZNYkhiQkR4R1lRRGEvMnlVOXN5ZUk0eHBtckNGT21sV211UlBBc2FzbjAy?=
 =?utf-8?B?YW4yWitEZWhGK3hGVStkdklPY3l2Q0dmZFVYamlpaFNxT3JmUG5IejgrVG1O?=
 =?utf-8?B?aFgzSGxDK2FJM2JvZHpjRUFJcFZHcEhzNE5oaDE4NkNLNEplODZDdklKNUVj?=
 =?utf-8?B?Ym5EWDlSbEk2NldkbTBIZFJrbm52VjdMTjUzOWhCcmxPbldvMzV3OThIQ043?=
 =?utf-8?B?bEhEMVJ6cFpaYzlyWDZ1N0h2eFdTcUlDYm5pNXpDekNJczlDd0JiRU1YZkRC?=
 =?utf-8?B?VFlDK0pVUVFXUFdOZ00vR3g4eTJLS0lXMGxXbU53Rnc5VWJ6YklnbGZ0d1Fn?=
 =?utf-8?B?VDJNN3V2SEpEVitXNkllYlRsVTJROUtBNTgrTmp5K3Q5cnkyRi85dVlrazBv?=
 =?utf-8?B?SGMxU2RJQzN5MWg2R1dqZjUzNURVaGRmQUpBbmhubk9pNGcvTEFWTWlQWTA5?=
 =?utf-8?B?TjBVSHpaMjQrK1pWMEZEZjM1QVRWYkpkR1RuSUJJWmhXNnFnQmFPY1V1eUxU?=
 =?utf-8?B?UlgzdkE3UWpjTnU5dGthREdyMFhxWTJsRUdNQUVsTmhhb0dFQS8rU29DZVVy?=
 =?utf-8?B?TFBybEZTQWpvbnNVYUY2UkNjT0xTTERpRzFQZXFIbWJFS0oyd2svakdLeno2?=
 =?utf-8?B?clJVbDJ3RVU4SEYwU2hlYlp5V1B2MjAyVEpGWmFBYVZWWE52MjlnR0NoMFZC?=
 =?utf-8?Q?wdsYinfrVWoVYDgvzA97CLlxn3zVQDtq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERuNlBvUkJUdnVzelhLUVNxZWdMVFdMU0EvNjc1eC9TaXdwSUlWTTB3VnBO?=
 =?utf-8?B?ajcvaTA0R0MrR2w0VldsemtuajM4djJzT2dnNEplZ0QxUCtubVVnd05TU1I5?=
 =?utf-8?B?SVpNZXU3UXYxemN0OCtiSVZqQXUrQ0hXcmNEMEtCa000TmFxSmN6d0dGZFl5?=
 =?utf-8?B?MWNHVHlDTVJ0TG01bFBMYnd0anMzZXpYODJxSFpaMW4xRXp0U25yM3lzbDkv?=
 =?utf-8?B?MVJ5S1cwWm1ncEtLdXdrVlczOW1KMmJGRGJ4RkE1U1hqM3Y5andCdXphRUxP?=
 =?utf-8?B?SWFHc2htOTZFd2RnNkVKMlhZWUtXcjlhRVArUkFPdmw4bjVZeHExZ0xDbGR6?=
 =?utf-8?B?c1F3OWpiQ0dSc3h6MzE4aGIrWmtvVG04M1hiM1BMZU1vY3pFRzVzTEVvSEJB?=
 =?utf-8?B?bUl2TnJyK1ZRZWJjWCt0QmIwdzVmM2dKaXVxMnFMZXN3THhHZVVINHlPVEFx?=
 =?utf-8?B?SWdMRU53eTQ4bXE5WnM2TEs3M1Yyb0M2cXdrUk5DcnlNYktXd0gzWFJJQWkr?=
 =?utf-8?B?eEtYN1AwTmxoRXRVUnluMk5DWTFHNVZnNVluVGljWndvVm40am1OTmNNNUh3?=
 =?utf-8?B?ZlAyWEtoYnFsbHMwR01EbDZsM1FWUkNDU295aUp3R0J0UW1UOHZsWkZFVjlk?=
 =?utf-8?B?cjFjV1BkeDFwUERsVWIwTHFiQlFWdjZtaE9jTzBuZVRwN0N6Wlc4QW9BYWRI?=
 =?utf-8?B?TVFPQm9scG5TVnozWUNmbFRrVnNhTGhJK3JDZTBqYkNzOTc3WS9hOXZ4aDZs?=
 =?utf-8?B?RU0ycUNvb25waWc3d1BRbXgzWVJhcnA3TUg2VmZyR1dRdS91OS9mRlNwNFFV?=
 =?utf-8?B?OWFNK0tJc2lQQUxPSWNLTWNhSDBVU3ArNFRvK1FrMG9wV2dSR0U2QVhrajBG?=
 =?utf-8?B?aC9qaGk5THptenQ2M296V0FLRzJOM0Z4VlVYOGFWeGlnSU41Yzl6R0wzVmti?=
 =?utf-8?B?azBnZHV6MGxVTjJQVmk5S3RiTVVoZC9BMWU0bjZjT3FWSHV0dlNoTjVWNW01?=
 =?utf-8?B?S3Z1Si9QbS9pV0wxVTZ1cXk4cWVSWnozRFhEeHlrdWxRWGlaVGV0aUgzMHVU?=
 =?utf-8?B?S0FGRDJReHN2VEc3eFduc29UTmhwbjZQMG1ISU1nRnNTbzdhbVJYT3o5SjRu?=
 =?utf-8?B?ZlhxaU9EWklpTEI1VVZHOTdOajJobVZybXFoQlFDbW1xTmU2aTBXY0o2clpT?=
 =?utf-8?B?WG5IVnRDYklHTktySHVYT2xkaHUxYXlaRmpYSWZTandkTjVuS0Z0STBaUmZx?=
 =?utf-8?B?NnEvOWRBemo3dnNybXhGM1B2ODRqL2I1eUVadS9INnR1YXVaUm45MEZocEFr?=
 =?utf-8?B?ZVc3Sy9rVXBkeDhLWnFSbEVBaTdZYytsRVdkMEJvK0RZa2wyYndWV04ydFJI?=
 =?utf-8?B?WEQ3dUxtdkQ5dHU0UXZKbzc3UStLWFdHY1ZUWEptRzBwQXJybkl4OXFwNGFv?=
 =?utf-8?B?VGFIcVJ4VEhVZmhWdnErdmxxcDFKVitXcmJDUXlLWks2Unp5SlBGd3o4UGpw?=
 =?utf-8?B?bGlOV2hKaEEvcFFxaC9SSzU1MzZyTDEzcHpWc3F3L25QSHRSYnZXU0tFZkRD?=
 =?utf-8?B?WHJjdlNNK1ZCMU1Fd2JveVFXMXlpSGdGTERUbU5MVlVPUE13elBVcGo4MVJB?=
 =?utf-8?B?WEhERUczSndWMGxzenF3TTg1NHpvWnUwQzNVNWxhMWxhckNZL3o5cms5MlJR?=
 =?utf-8?B?K3ZLTVpnNll1Q1o5MC81akU3cTZ1M0hqVlJ6MWpBUERvNVhZYzhYQkdha3hj?=
 =?utf-8?B?N0hwREk0VGNQQUIvYXNDQjBUbzhTYXp1QkdFeVczVEdrRjA0eVVXajE2QlhO?=
 =?utf-8?B?V1lyaEtkaWhyS1FwMlRQL08rbWlGaTFMTVl3MFE5RC9pME9QTG9nekVaSEdE?=
 =?utf-8?B?Nk1ZVUR1Y2tWY3MvaGE3bHZIY3lwWDJrSFJWRHAvcll2Q2RxNyt6Z2E1a2Vr?=
 =?utf-8?B?Q1luejJvdGFVaU1TVGovTE1KU0tpVUxPeFVmTkhPd2JGejVFUUE4N1AwL0RR?=
 =?utf-8?B?ZFdEQ1pRM2ZSeGJIbE1GcSt6WXlQL2ljQ2FlbHVjZ1pjN2ticFpGQ2svU2V4?=
 =?utf-8?B?RFg1K0ZBeEpVYlIybnR1R3FUL0JlTkJNK0duMDFxa3h0OGpGRTBOUHBKM1A3?=
 =?utf-8?B?VWFKOHB5ZXZHazVlK3VxMXJORTFzR0JmelZvM3VJU0ZmVXc2c1JNcGRWc0dv?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4911673-1cdd-467d-bb13-08de161fe3b8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:45:35.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNGfWylvaBpFxhF2HA+ye5aFus70Ku/6rWtzGN70wfOXZg+ZTHHOFynvg5BIrwz6js8m+Yo4yvBa1/VBAaRHuuFfyswzB34lu99KqDBc9SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB11029



On 25.10.25 21:10, Teddy Astie wrote:
> Le 23/10/2025 à 17:22, Grygorii Strashko a écrit :
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Functions:
>>    hvm_shadow_handle_cd()
>>    hvm_set_uc_mode()
>>    domain_exit_uc_mode()
>> are used only by Intel VMX code, so move them under CONFIG_INTEL_VMX ifdef.
>>
> 
> If they are actually Intel VMX specific, they should rather be moved to
> VMX code (and named appropriately) rather than if-defed in shared hvm
> code. If AMD code happens to need these functions in the future, it
> would make things break pretty confusingly (as headers are not updated
> consistently).

I agree and like it even better. Can try if there is no objections?

There is hvm_prepare_vm86_tss() also which is also used by VMX code only.

> 
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>    xen/arch/x86/hvm/hvm.c | 50 ++++++++++++++++++++++--------------------
>>    1 file changed, 26 insertions(+), 24 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index f1035fc9f645..3a30404d9940 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
>>        return X86EMUL_OKAY;
>>    }
>>    
>> -/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>> -static bool domain_exit_uc_mode(struct vcpu *v)
>> -{
>> -    struct domain *d = v->domain;
>> -    struct vcpu *vs;
>> -
>> -    for_each_vcpu ( d, vs )
>> -    {
>> -        if ( (vs == v) || !vs->is_initialised )
>> -            continue;
>> -        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>> -             mtrr_pat_not_equal(vs, v) )
>> -            return 0;
>> -    }
>> -
>> -    return 1;
>> -}
>> -
>> -static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
>> -{
>> -    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>> -    shadow_blow_tables_per_domain(v->domain);
>> -}
>> -
>>    int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
>>    {
>>        struct vcpu *curr = current;
>> @@ -2273,6 +2249,31 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gpr)
>>        return X86EMUL_UNHANDLEABLE;
>>    }
>>    
>> +#ifdef CONFIG_INTEL_VMX
>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>> +static bool domain_exit_uc_mode(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct vcpu *vs;
>> +
>> +    for_each_vcpu ( d, vs )
>> +    {
>> +        if ( (vs == v) || !vs->is_initialised )
>> +            continue;
>> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>> +             mtrr_pat_not_equal(vs, v) )
>> +            return 0;
>> +    }
>> +
>> +    return 1;
>> +}
>> +
>> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
>> +{
>> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>> +    shadow_blow_tables_per_domain(v->domain);
>> +}
>> +
>>    void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>>    {
>>        if ( value & X86_CR0_CD )
>> @@ -2306,6 +2307,7 @@ void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>>            spin_unlock(&v->domain->arch.hvm.uc_lock);
>>        }
>>    }
>> +#endif
>>    
>>    static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned long value)
>>    {

-- 
Best regards,
-grygorii


