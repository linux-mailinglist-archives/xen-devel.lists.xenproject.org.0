Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C678A88054
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950098.1346514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Iu8-0004te-6Y; Mon, 14 Apr 2025 12:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950098.1346514; Mon, 14 Apr 2025 12:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Iu8-0004sA-2n; Mon, 14 Apr 2025 12:27:12 +0000
Received: by outflank-mailman (input) for mailman id 950098;
 Mon, 14 Apr 2025 12:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA/R=XA=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u4Iu6-0004rx-DR
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:27:10 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c853e948-192b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 14:27:08 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBBPR03MB7451.eurprd03.prod.outlook.com (2603:10a6:10:20e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 12:27:06 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:27:06 +0000
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
X-Inumbo-ID: c853e948-192b-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJWoW+8N9UgXVwvSIBGK2+qICPj+b9xmXRk9LSvaBNe2SdGr9i3ti1xk1vO9aQ8u5WGeZpgAoN7AGtUHlrYkUc6LJP0b7evcUrWK0qP/E/xf9JS3MmzWF/DvziEpDkOwVKzcxwofUzsjQILRRErBlmPvH0xjcvZbSAnJDcpUqIa5bN7eqL6Huo3Q6EgLdO4rlq0eX+iHUHefB/CqqWMFR0OtCioDNip5NWl09gB8Mh0mJ/QnUxezQV4giQEzlhdaqD6k7yJKqq/y2xri2jukLB8U4gGk83rvCiwP1D3z/flSV7kAnqEmHqLTNqIkfoGZpRyFN/YmVOkiUE8l97txWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oJkubyYY4TP5/Ikx8RQ0uDYFaiFiKmKIqsfApSp/IU=;
 b=WxzBKfWkiNk+MGJRwhYaLzObCyfnubPRa1aSrjEHi1JmgjFqZyMm98k/tyuvCxiks3CAETtHfe4Z/zxuhZbhRL6C4h/SyT36z0srFE9bxQCMM97jXic50XO9jnoRrqsNWHtArbVb4fkyw25pMjufkCppAWk2E07Uz5FV96OfIIT8pcJgaD18q1WEw8DgeyMxKk+whPWCULlfx8ksxnw18oj02ld0m0DxkER2J8BvtfIYzWKbtZgpnN9K8DLaKGAb2U4+rmtAhA2Qs9tvVMcqCMlpWyb2j6bBJCFwgQAg8uodekomRJcf1VsmVLs7YwdlW55ecEQlK4EbJ/V54o7ReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oJkubyYY4TP5/Ikx8RQ0uDYFaiFiKmKIqsfApSp/IU=;
 b=uS5DdsAtQJd/4BqB89uofQrwUJnOCKQBiPyigLM07KQv3YJEZL3QLvuteLfSRCeh/uH/4MyUVE/IW1sD+XqeaqTTe0iU9FM/do2YTSK4hGdwFZydvPGvlHFPVWgSIDhA1AJREb5xnhMmriznrjED402NaF0M9hEPtTDwCm/qakjm/GjiqdHdhraCUvrXKyfaYea2WEby0Dw7ZXHaTOZUFY7+fPibM++kGWyP/0WHD70el3+foNJ9HZ8eH5OouMMllDlmtPBnGJKSMUd2byyPn2/rsfAFErq1L5VtMG0k75O0E2RAHVAgPm1tgB9lPkWPOrCoBr45IYj/VlaZTpHhrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <be2aecbf-c8f9-4069-b42a-8f9d354be7f1@epam.com>
Date: Mon, 14 Apr 2025 15:27:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] uboot-script-gen: add xen xsm policy loading
 support
To: Alejandro Vallejo <agarciav@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250414081449.1763962-1-grygorii_strashko@epam.com>
 <D96CDMX3B877.3MD1OKAJ6JJ3E@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <D96CDMX3B877.3MD1OKAJ6JJ3E@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBBPR03MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 3271e3a8-35f1-472a-4933-08dd7b4fab1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QThSeXV6WUNNZEJhbmVYTzM1VjhLR2drYkwxUS9RT2NTblN1TTF6K2c4NUti?=
 =?utf-8?B?cFJvV1BuSXZtTjh1L3libkpzRkVOUVd5MURuYjg3MEdpa1ZBT0ZzbHhJUHY2?=
 =?utf-8?B?ZzRhSFB4SXNZZ29FdEVXVUJCZENzWGI3dHJHanc0T3ZIblNibTRSMzBTdi9k?=
 =?utf-8?B?K29CSzZ4WXR2YXpTNGU3WlhNNU81ZFFHeU14SkkvMnVuOW9uOHBKdVV6S3hP?=
 =?utf-8?B?cEdrUFNRVWRpZXoybW9sK2tTaU1wOHpvemJTRWtzc21lQnZkcVJtRHN3Z0pm?=
 =?utf-8?B?RCtpcVB5Qm1GQ2k5akRuYldWZ1BNQ1Z6a2JNVm93MUZ1K2RnTHpKcGR0V2g2?=
 =?utf-8?B?VWlTbW1mKy9oL25VN0d3SEVnM09aaktQL0VzeHFLYWJDaFpyWWROTlV2SDVk?=
 =?utf-8?B?eGNJUmlKT2pwczZNNElTZ1A3UzJhdFFoVjZvRXJ4Yzl4SjhTRCtwRG13Nzlr?=
 =?utf-8?B?SkZCYVhsSTlPbnI5YmdrbmQrNWJ4TnFBZHZENG96Ti9INzZFVUlqTzZINHVI?=
 =?utf-8?B?WTRvRC9ObHdjVmRZZkZKSTJLMGowblh3eFFoRFVzVm8vVUdrRUtWUGUxZUky?=
 =?utf-8?B?OVVrRGV5eExMSXNkVllwSUJTTHQrM1dLQm9zRWhUVmdtOU5kcWVyUlJ1MmU4?=
 =?utf-8?B?Ri9MMzlKSkx4L2hleitwbXRGblJsMG5uRnpqeGpPcElDS2ZkTmd6NmdGKzJV?=
 =?utf-8?B?a3p4OWRmMlpTTllOUVFYaXpnWmlkemt0WWlUZFhwdkxQL1o2TUtOTnVaaG1U?=
 =?utf-8?B?QlEwSEh5Ymk2c1dqYWF6YnlxK21UVGIrSmV0dkhOdTNYWksyUkhwU3dOeEkv?=
 =?utf-8?B?eVFpVm9TVEdnaTZkUDArdE9HZ3ViVFhDNXpBbnNKMVQzMmE5VCtzTnZhT3Ex?=
 =?utf-8?B?d2JnSGRXdlpPMzBha24vMXIxU2szcnJhbEFEMDN3QitYMHVrb2RwZVRlUnFw?=
 =?utf-8?B?Z3A2UlhNclhiNmlTLytZdEVJenE4YTNOSWxGL1dac0kydE5aYjRwUFdtakpK?=
 =?utf-8?B?dVhFN3hhaFlHR1VzSytCcTJ0RHZ5UEJaelpraXJ1OUMxQTlxVy9DSHgwM2dK?=
 =?utf-8?B?d0U5YWkvc2xQbmxobUdsSTdVV3A4S2JWOXZ1aFYwVklCdVlLVnhnTXF5Ykw4?=
 =?utf-8?B?bE9peVkzbHo3Y0pXYkQ2cUUwT3YxVnhTSDRTdzltZnFBNVpydG02WGY3WWhY?=
 =?utf-8?B?NXlkd1BmT1RJNlVqMWRub1E3MW5QRGNoYW1ZdGVlTzhFQnB2bURSbHNZeVQy?=
 =?utf-8?B?YWpuakhHUDl3Q1F2aXZzb0hqWkJBZ2kzazVZUitYVm1KdUJqQ3lseE0zZkhh?=
 =?utf-8?B?VUx0Q3VZZ2VUYnMrNXcvK2F2NGdlTENVYmlqeEk2Qk1VTVMwTGgvUFF5amU2?=
 =?utf-8?B?NVB5eFhhNHhPcmJLTHpxZDJXMjE0Ty9YNWZXR3kvWmtvL1c4U2ttTDZ0K1BK?=
 =?utf-8?B?TjJVSGNPdmZJeHl2M1ZNZWdkdWF0dGtycTJ4bkpkRG1JUE0xOFoxaWFpVDF2?=
 =?utf-8?B?SDl0TVdlUEdnaTU2SmFTaUZvSmV6OUJsWk4xLzM5RVp0VVFSL0R4dXdPYlAw?=
 =?utf-8?B?cE0vWE9pSDFpZzlydE5kaXNxdFYyVWY2ZUhQa1VLWld3dU10Sm5EQ3BDNnRz?=
 =?utf-8?B?K2xqaEZySWduNis2NXQ0aHBmWFFpOXBSdjFQY2prd0hJM2ZwQTFRb3d3K1ll?=
 =?utf-8?B?YkF3NUM4RlFXQW84ZE9RaHJDbGREOUNNbEZadGVzREtkczFvK2N1bDRXeUNK?=
 =?utf-8?B?WVowV0MvV0RBZ3VFWkpXWWFXdHZDTklabWZJU3E5WEJWQ0FLUTFkZmoyOWc5?=
 =?utf-8?B?bG9SeUFGTnh3aUJtazYwd0FvaDFGTmJNa1NWN2NGUkZuQ0Q0YTBRd3RJR0F5?=
 =?utf-8?B?M2dPT3ZNR0dySTEzdlJJVTFWbDBTdGVLdFgxbmtyMHh2aGVuTnBxMExsSmQz?=
 =?utf-8?Q?I/sKWTl9vJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEp2QVRrdk5Ud3hIU055Y3QrREdKNTZUcHBiZEh5d3BJK3h5eS9OVzZ5a2M3?=
 =?utf-8?B?d3AralluaGhuNVBrNnFoTUpta1hIWUUzeEU1Y2ljN1NobGJjM3hIS3lrZW9i?=
 =?utf-8?B?b24yeWxmSjUycm1hYWpzSnJEOWhTV3M0MkZrcnl3WTJOOEQzajB6UzNEYTZI?=
 =?utf-8?B?em9LMERaNlRFajVxNTc2U2tnMmpxdjlJalE5UE1oL2xnYXFKay9KMzR4RnJU?=
 =?utf-8?B?VXBjdWlkdHg2anhXdU1WRzJjdnA5VllGUHczczhHS015d1hyS0xnaEl2b00v?=
 =?utf-8?B?VWdkcU8wbGRmSDNhVE1oTzN3NEhYUGFpMzAvTGZ4SFJJd1RZdFVUOVhZZDJu?=
 =?utf-8?B?RXY5WkJSamZCU21OTWpZck5NRGgwVy8vTXIwd3NaN1I5SWsrNlAvVEdtU3pQ?=
 =?utf-8?B?QXJSczBJQXkwclF4cjZEbjRLUW1rbDRnT0lBR3hqNnVxMDNlbWZ6S25ld2p5?=
 =?utf-8?B?bXlBc0xLVDFVbHhTaDRjOGcvOHRRRU1PdXJHZEJTVTduQW1MQmorYTRtNDUx?=
 =?utf-8?B?QmlaVE5SVnZJK29OWUgwVEZWSjB4UFVTL0R5cGlOTjhRREhoeG5oMG9YV3Uy?=
 =?utf-8?B?WStVRThhMkR2QnFlQlQ5MWlDZzZkaHJqTWZqVU1uVkhhemhPREZXNWFwMWFO?=
 =?utf-8?B?NXNJUE1LeHIrQ3NKY00rMjZXcm04NWlEREJTcjF3OFZqUHJDeEwycTE1MW5U?=
 =?utf-8?B?b2k5Slp4Sm1SMXdCSjVncVNabnJGdG9VR1J3Y2JIVldZNVkwN2h0RUtla0ta?=
 =?utf-8?B?Q2FaU3l5L3Vla05MM052a2M0WjZKNnJXcXNFN2pGd2ZyOVF5WlorSlZ3NlZ5?=
 =?utf-8?B?eWd6akZST0cxMzFjQzkwUWxkTUJtNTA5ZTdsbkJ5QmJlUzJLNEFhL20vYjFK?=
 =?utf-8?B?R0tlcGF0L3NFTkNJd3Z6aE5vVTRVOE5sd2RzUmxQSWZzSTFiaVBJY2hQK3dV?=
 =?utf-8?B?Vlgxb2lVT3pWbGpMRDJtbldUdTIyZHZRR2V1UnlGd2J0UzNBUHA1YUwyZFUv?=
 =?utf-8?B?SldxNjNjbXUyeFFNLzd4bWV3ZlFJdml1OTNIRXZFcGxsMGFTSzV1b2FDTkU1?=
 =?utf-8?B?eWlSR3hMZ2JPYXBjclJzWlZJZVFRa05vWm44LzdFaUY0RTQrbmFDMUFvZ3pE?=
 =?utf-8?B?bWlmUzI3Tm9YL3h5OTEwSWoxV1djcDloem9EbitRYXg5dHZ4ZHE4SzVNV0xN?=
 =?utf-8?B?cklvN0tyV1cwbzhKa1h3OFdqYXZxTnlBUUdocldqelJNeFllaVM0NVliczI2?=
 =?utf-8?B?bUwyWlp6NHBrUGJxZ3VvTEFHOGRSMS9YRzlMemdBdUVKRVllR1NzcUNiWGF6?=
 =?utf-8?B?bzRkT2hGTVpZTzVZdGZFUXc4Mk5ZRE12dHVCZWZSamkxaTdlWTYreWxNbVhM?=
 =?utf-8?B?aUJiamRDa1lrMHIyckNwUmkrRTQzcGRMR01pQnl6RDc4VUJ3RFFWOG1ubmFw?=
 =?utf-8?B?bmw1UG11VWJsRW0xSTZzL0lDZE9HNEdJMHJ0VU10b0duZk1oZEFtdE1FeU42?=
 =?utf-8?B?ZEFWR2hKTU1VRGJwZEVKZFF2b3NJL2ZLK2l5aUIyNGVKT0RMbHduTEVCS3RG?=
 =?utf-8?B?RXZDMTlmVUE5djdHQjVodnB4angyTHFxb0ZVWmRvdVhHcmdHbVBTbnl0L3Vi?=
 =?utf-8?B?T1hxNnZwWUN0ZEllRDdzaFEraEthSUlTQWNDOUVNU1NaSVYyM2piOEkyQjh3?=
 =?utf-8?B?ZVkrZDBQN2tEaTBhYkNpdGVpL0Q0WkUyR2hKaXlvOTdUV0NXRDRzdXpxaUFJ?=
 =?utf-8?B?cVhCRUtKMXZ0OW45bS92SjZDYkpia2JCVk5xT095a3AvMmlMOUs1UXV5ek9Y?=
 =?utf-8?B?Y3czZ3dDTitLVldwYVVvZEJQK2NjMjdTeXd3WUtldjNNMitHc1NKbHRJbHl6?=
 =?utf-8?B?b3hGNzcwU0JFUkZweEE2allIaTFzUnQwM1l5WGhKaDBVQ1FxNDVmdXdLSmtp?=
 =?utf-8?B?YmxzOU1vS0ovNXJhZlM0elp3T0M4czd2NE5xM1V0NVVEcGlOaHkrOE8zOVRs?=
 =?utf-8?B?WDIva0JNNTJQK1RlRFRLd2pmWStMQmlmR3lPMkZqZWlMZFViajFQOWtENXpp?=
 =?utf-8?B?bmx6M0JSL3NkV2Y4SnovWlhpTmxVSG9ucUQ5Sld2dGlSdHdZNklSL1dUMUw4?=
 =?utf-8?B?dWV2K0hxWTRZcG5Qak8vYStCREpwYVJTZlUxVkxnR3JKUnV3dGVLUzY5QTRD?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3271e3a8-35f1-472a-4933-08dd7b4fab1d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:27:06.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GU/ZUoHM8l6enCdHD5Agzo4Pafaq6p1ZIZenDYs4IZJcxJzIqHxbYCPb0/vTyGaZoFvIhly0VZvqOgBww0oeMP9LFV8ZzlVFHfT2/M5O2m8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7451

Hi Alejandro,

On 14.04.25 14:57, Alejandro Vallejo wrote:
> As a general question, why using "test" so much, rather than
> 
>     if [ -n "$FOO" -a "FOO" == ABC ]
> 
> Using test seems far harder to read than it needs to be, and single
> brackets are perfectly valid POSIX shell.
> 
> On Mon Apr 14, 2025 at 9:14 AM BST, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> This patch adds Xen XSM policy loading support.
>>
>> The configuration file XEN_POLICY specifies Xen hypervisor
>> XSM policy binary to load.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   README.md                |  2 ++
>>   scripts/uboot-script-gen | 33 +++++++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index 137abef153ce..9106d2a07302 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -91,6 +91,8 @@ Where:
>>   - XEN specifies the Xen hypervisor binary to load. Note that it has to
>>     be a regular Xen binary, not a u-boot binary.
>>   
>> +- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
>> +
>>   - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
>>     and is in the format startcolor-endcolor
>>   
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index c4d26caf5e0e..343eba20e4d9 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -315,6 +315,15 @@ function xen_device_tree_editing()
>>       dt_set "/chosen" "#size-cells" "hex" "0x2"
>>       dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>>   
>> +    if test "$XEN_POLICY" && test $xen_policy_addr != "-"
> 
> If XEN_POLICY is a binary, shouldn't it be "test -f" ? Same later on.

You're right. I'll update it as below...

> 
> Also, missing quotes around $xen_policy_addr
> 
>> +    then
>> +        local node_name="xen-policy@${xen_policy_addr#0x}"
>> +
>> +        dt_mknode "/chosen" "$node_name"
>> +        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
>> +        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
>> +    fi
>> +
>>       if test "$DOM0_KERNEL"
> 
> test -f?
> g
>>       then
>>           local node_name="dom0@${dom0_kernel_addr#0x}"
>> @@ -900,6 +909,14 @@ xen_file_loading()
>>       kernel_addr=$memaddr
>>       kernel_path=$XEN
>>       load_file "$XEN" "host_kernel"
>> +
>> +    xen_policy_addr=="-"
> 
> Do you mean = ?
> 
>> +    if test "$XEN_POLICY"
>> +    then

I'll add here:

             check_file_type "${XEN_POLICY}" "SE Linux policy"

and fix other comments.

>> +        xen_policy_addr=$memaddr
>> +        load_file "$XEN_POLICY" "xen_policy"
>> +        xen_policy_size=$filesize
>> +    fi
>>   }
>>   
>>   linux_file_loading()
>> @@ -939,6 +956,22 @@ bitstream_load_and_config()
>>   
>>   create_its_file_xen()
>>   {
>> +    if test "$XEN_POLICY" && test $xen_policy_addr != "-"
>> +    then
>> +        cat >> "$its_file" <<- EOF
>> +        xen_policy {
>> +            description = "Xen XSM policy binary";
>> +            data = /incbin/("$XEN_POLICY");
>> +            type = "kernel";
>> +            arch = "arm64";
>> +            os = "linux";
>> +            compression = "none";
>> +            load = <$xen_policy_addr>;
>> +            $fit_algo
>> +        };
>> +	EOF
>> +    fi
>> +
>>       if test "$DOM0_KERNEL"
>>       then
>>           if test "$ramdisk_addr" != "-"

Thanks for your review.

-- 
Best regards,
-grygorii

