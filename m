Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BEB99633
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 12:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129235.1469277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MVb-0006BD-PF; Wed, 24 Sep 2025 10:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129235.1469277; Wed, 24 Sep 2025 10:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MVb-000685-Lo; Wed, 24 Sep 2025 10:13:59 +0000
Received: by outflank-mailman (input) for mailman id 1129235;
 Wed, 24 Sep 2025 10:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1MVa-00067z-Ps
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 10:13:58 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec67b77-992f-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 12:13:57 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10304.eurprd03.prod.outlook.com (2603:10a6:10:51e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 10:13:54 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:13:54 +0000
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
X-Inumbo-ID: 2ec67b77-992f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER76Dphd3IiRw99mTfBAdZYmZV6B4SqyBNFdYYnwsUD+ZJdSRgjnPfEkyBzfJ6Vg+u0D7jv7xgRoe3lm7fdBpjLXbC9QGOKzc59gRwApNs2XN/0W1VVqDbPGkov+xGgxe1KssK9mM4reYhi+fHmrL+f+6aka/+wfxmdfpm965u4zFxPazXX4Qu8pnXuGeGuCaTeoRNXKStclL4H8qevFANLDIpJD3V1gdAW+/VfiNCN3XlLfYzVXWplOjFCm1Hv75SeDtpUqqxRHC25brvOlS5g70pHJdigLw15UvEaFf1nggX5M/gjKMEz5o9ZgYgnWegr5aKmp34DusgaH8DGr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZh24mg9yneXZeRrOk1njoyYCQYbTxK2zbMrRvHMnjY=;
 b=UYRimua3/ySGwrK997sD6LlZPGFlVyp0wWWFOuDYLJYow0Sr4XLZhIx3P/CoSP7RkphGs0vsjPu7FbtRl+HumRLB72W26x9C56uOTZPi+zCieMNayCoWUOTtQkE9KtRi0+5ORxwcPMsuPzObFAlg1VFESVbvJE8opHuAnHPKPe8332llr+XU768oCEdu60BWdT5a6h1VOdMpWHhyfdefDx0rl0dyirrD3Df2I52oXh9tYSG9N4A9mgAMEFMzC4cpN0FfY7rCUEBwsE1nDuqhFdU4/YOIF9IKzT9x89byoiMii1VY0skK9wrw7QWKBKforiGKTggIEzJt6beMGjd9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZh24mg9yneXZeRrOk1njoyYCQYbTxK2zbMrRvHMnjY=;
 b=sESfSFmKXrRPRcUXGLNE3BzOH7YEMGwGuai4BAi2AUiLJSZJxDFydAjkE7QEpiR2AIIcHRzTQ8A1fh28mD/efsjVCbTE9r3UYQH6x+YIc2HJxmpLoajHoX76SPH3343llKbmrGGBTqwwr3Jt7WGeanVT07f27+LTWuWyxbN4tx3PvwKf1xcW3LhGcPu0c/NWB85ak89sEShTUs6ObRAWsqmJwtoYtXdKKy9xB210tGxuRkqvndf6Y+AK2iIXS9/VcbjxMmJzJd/L2db5kzwI/nG7dN+pNkG6SIIg6/6RNmHSqZmn6ZULZs04yv628Dq1gjPWz4OI1KuR5hnunGuNOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <74460196-3bf2-4927-ae38-dcb52755ff04@epam.com>
Date: Wed, 24 Sep 2025 13:13:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250919163139.2821531-1-grygorii_strashko@epam.com>
 <5c495ffc-40c9-4c55-bfba-3e1c0d9955c6@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <5c495ffc-40c9-4c55-bfba-3e1c0d9955c6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU5PR03MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2ab933-af1b-495c-9337-08ddfb5310a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STIycGczeUFCbHRwY1VNZHp6WHFQKzNyUHBsSkZFaG9tUGhYR2pWOWFXM2Fi?=
 =?utf-8?B?c3BhSjl6dGxsYzJqMFZ2SG5sTXNBUFZrT3hnY2FjY2tRQ2lPZS9kTUtqRCt4?=
 =?utf-8?B?NStMZ2VWN3dTZi9JTm4yWkl2Qm90SE0vdmVibVR6dWdrcFJFN0tXeURsZEd1?=
 =?utf-8?B?SlNtaTlkdGpSYy91OGFaNy9QSjVKczliVzRsdVIxV1RTbktMMkRIVEhDWnQ4?=
 =?utf-8?B?QmNGcFlybURNbjQwSDJ5cDRJcEtrbE9XS2pIUFpFRVIzMjFWQ0hDQ3loMXJV?=
 =?utf-8?B?QlhKd3B3bzBoWTUzdUYwTVI0eFNuYWlycjdVb3RmVytJbzkrYnk1TVFqVm1x?=
 =?utf-8?B?OXZzdXhiN3JxdFdyS1pKaHFuSTVsQUh6MXNlVmdta3FNOW5yOUhibExsV0l2?=
 =?utf-8?B?aVBFZEhkbnVJbGVqYk04dFMreGFoVGxDOGF2bm4rbS84TUVLdFVUY3VKWjE3?=
 =?utf-8?B?bHc2c2J4VituSFJ1UHdwcHBiS09Wc1paVjRYRG5TY0FLRHhsdFFLRCtUQTJG?=
 =?utf-8?B?WEptOFZNNndDVFlJRTFLMSs5NkdmQ2xrZGl2dU5US01VYWxVTFpkQ2N5cTYv?=
 =?utf-8?B?QWFFQmM1cEVrTEQrVzkrMXRYSGZVZVhybjNKcFpPVTZiemlDWEV5blFGY3dL?=
 =?utf-8?B?SWM1SjVnN1cycGtLNXpzSXBIWWVZdnYwUDF5WXVrY2J5WVhUZmVlNjA3Ukxh?=
 =?utf-8?B?bExMdXZtY0Zld09Ba2ZWd29yMzBaUTl1M0lRRzdqRlU0MUJ5bk92VC9BK280?=
 =?utf-8?B?MEFVNW0xbEpxWUZxNEo2SHpzWTAyUEt0bFMrS3NGRitOQ2dqL1RPU3VlMHBX?=
 =?utf-8?B?NTkrS015SnlTMXBRaDQzUWhzTDlQeVkvWkZZT21FZ0lhK0dqOGNFRC9UK1lr?=
 =?utf-8?B?MmVRamU2MDFaUFg3MHlQSWV3elN5cmZ3VUh0OW9KdExBL0NYazFvMHpRU2hq?=
 =?utf-8?B?NDR0MEpVOEdZb2JJUGtWN1hwTTVtQTljazlMMk13NHpxbTZqR3UyQjc0Kzha?=
 =?utf-8?B?emhFUFdhSkFsOFIveUVtbjg3MjZXekxxa0FVcnlBN2N2ZFJKSU5Gd1o0QUZF?=
 =?utf-8?B?UWYrWGFJbVBIWGxaU0IzM096aWZRb2pqaXdzZjBWV1Ivc0JUN1A2K3F1bTI2?=
 =?utf-8?B?WDh3NzRmTVUvTmdzLzllY09ZWFBwTnVCV2NGZXNKRG1xZThTNUQvV3Rxekhj?=
 =?utf-8?B?WHhXanM3QVo4ZjlFN1BxMlVFTTdOR2Zuc0d5Tm1ic01WUGRhdkNNbUxwaW9K?=
 =?utf-8?B?bnowUDlMa0UxRWFyaFlZNTlKcHd4ZCtOWE1UbTRpVVZlbE9tT1pTaGs3YlAz?=
 =?utf-8?B?eFJ0aVJhcUF6RkZkeVlCYkRQZkdxWDZGL1NJb21YTGhHMjQvekc2T2xoVHpH?=
 =?utf-8?B?M2pVbFcwV3FzYmhlWlBEOStOMHRwaTZiYXB5dld2V3lPeWtZZjIyQnY4WXlG?=
 =?utf-8?B?N2Y1eUI2aFBpWmEvQkhnZWt6dExtc1Q5a0RXQmJYT1h2Y0FxSzBXclFHNnpP?=
 =?utf-8?B?Tmw2VHhJeWcvdVp3R1ZzVDJDWGFqODRBMGhjYXNtNmc2T3RsODdyTTArOExx?=
 =?utf-8?B?UDE0YjNwYzRpeUwyQzlXenpycDdwR3dtOERoT3pBMVpyRjl4SWFTdUIzRmlq?=
 =?utf-8?B?VmNyZ0sySWk0VkREdXhnMUlpVzBCeE1Ga0MzUW40TmNCZTZyaE9sTWlZNHZu?=
 =?utf-8?B?ZjZEWVQxeEllcWdPREZwUE94OENMeEtYMmpKV2hKbEQ3Yk16Tnh4L1g2K21X?=
 =?utf-8?B?YUgwSnNnajR6Q0lXcExleGJWcUV1VXBRckVZSmxURUxBODZVaUZXS1g3NnhM?=
 =?utf-8?B?b2RyK1lsTzFaSm1GY2JYRWMrcFQrVm1qaXJwNXlDOTRBemZZZXJtaGRIa1or?=
 =?utf-8?B?bU5uY0lRUXZlYlZVaFhvU3RWSzhsczdtYmdZaGI4RlZza2puSGh6d0lKZkRz?=
 =?utf-8?Q?vR8iKjlBuQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnlBeVdLb0NyMHMvZ2UxRC9RTUNlRmhLYWQyQ2cxam9rU1NxdGcxc0hPSmtD?=
 =?utf-8?B?MTZLTk8wWlk3TmtuOGhVSVhRT1VFeUo3a3hRSDVaZkVvSTljUDhuNTJaY2ZQ?=
 =?utf-8?B?NlQ0L1RRbXNWdTZNUGZqQkw4TkZQN1dPeFY3NmVnaldWU2h3SktBeEl6Wm01?=
 =?utf-8?B?NVVWais1VjlQT0hlejBzbXZNTGVoZ2ZPWFFoV2ZIcnJEYzhEZnFlUU9pMDBi?=
 =?utf-8?B?eXE3NUpPaXVITjFVbm5xVUFkK3hsanp5ZHlzV1Nzc3diMVVCbFY4UGc5bnB2?=
 =?utf-8?B?Y3RWSE5qeFRrVUd1aDU1cFZIbGFjT3c5VC9vcGRFRnhJK25oemZDZFUvRVFl?=
 =?utf-8?B?Tk5iR0EybGFJU2hJM1A4dEJ1VmswbFl3UTlSTi9BbEhMRXlrVFRIUmw1WEN6?=
 =?utf-8?B?YS9RWW9jaTlBRkRsQ0twRWppZDR3akRubm9iV0k1Q2dTUUh2RktuRnkrRVI3?=
 =?utf-8?B?RnloME5uMUhEaDViVGc2QzRLVkxORWFIMWloVTlRZjdZWjJLcU5jdHd1eTVo?=
 =?utf-8?B?Q1EvU2Fva2pWNmxjTGhUVEl4RzdkZ2hiNjAxMFZ1K1JPbGVYVUJrNVRXSWMx?=
 =?utf-8?B?MjAreFpjaEc3TjdHYkY2Mk13dXJUL294Vnk5WTZSZEFHVUM0aUY2MHhpbVVY?=
 =?utf-8?B?NSt3aUFNV1hld0dvM3FyazJtMGx2K2xjTWxHWkxFZUYzQSttRXJhcVJ1VWo5?=
 =?utf-8?B?VjlOU2hCMVkzSUxQZTViUU5ob0lvVFBvaWR5ZWRmWDc1V3MzWms3VDdWNjdC?=
 =?utf-8?B?aTdNUlNvVzVCQmxWc1NPM3pCREgzUVpFOXVjdGdiektuekNVTld0akxwWXU3?=
 =?utf-8?B?NTA5L1JJS0NUMEJxSjdqSHVjN29yL0MvNUNkNnU1NUNSbktMM2lZWFBvNnNu?=
 =?utf-8?B?SnN2ZGV6SWR5UlNBenQ0ajNEQWxkeHpaWTBtanpGSU01bDROekU0SlRNOEFI?=
 =?utf-8?B?b3pXYWNwT3hjZC9DbDNCLytNd21xN2w1UUUvMW9udk1maEFyNXQ5N2xlb1Iz?=
 =?utf-8?B?bEpma2txT2F5d0VyT0NTdDhXY0Zqc0RCR01wS04vOEtlc3NVa2RlTnQxa0V1?=
 =?utf-8?B?MEo0RG8xMW92WEM1Um85MUJ0WkhQeEFXbXptcEdEMnN0RmRSNE8yTlRXNFhT?=
 =?utf-8?B?YnZ5RDdIVXVNeUZqU2REZjBmbUlJUytPT1J6aEpWZndYWDZncTJUQzF1WU5O?=
 =?utf-8?B?NWxCa2FoWHZoenBNL1UvQXBDaWc3empBci9RazhyazczRkFrUTl0TkVlTFdS?=
 =?utf-8?B?aUd6Qjc2ZUNERnJqV2pMVmFTMHM2blJHRFR0aXhDcFd5U1FQbTM3VVZsYU5C?=
 =?utf-8?B?MFNpOHJrZ2V0T3ZNTWhIaUxucmdBRjIzOWJiZmEzWm81TlZGV3haTTY1aWp4?=
 =?utf-8?B?WDJRM3JEZStFdkxxcG9WODF5OFNuVDB1VEJkOGFhQU4wbktFWStON3lzYnkw?=
 =?utf-8?B?K2F5ZlViblFYMVNkVWNkcFBYODFVak5WNUo3REtqSDkwbXVPVG9qNGQzRmlP?=
 =?utf-8?B?anlRT3ZDUEV4OGk2SFVJU3BBRS9aUWJtaUw2N0NZenF3TnVDdzd6Njh2OXkx?=
 =?utf-8?B?YWVDNEJjQWc0NnMxZVQ2VCsyVXVQMGN1dXdUZVdrT2ZLQ1hybml4QlA2NUQz?=
 =?utf-8?B?R0R0Nk5zL2c4S3Jac0tuaEtRMndxbHFmcUNpcUxSUFNmMUFXOUdBQzJCZHFm?=
 =?utf-8?B?aWoxYkFHdFdzQVl6YkltSjBiL1VDNUxRTDFkc2M4UHBWZTkrN3Y5ZFc0R21o?=
 =?utf-8?B?RVE2TUxMMDFOZ1laZjg0UkE3VVNVN1BaVktOZTYraVZ2OFNXTWhreWhoQ1Fu?=
 =?utf-8?B?Tis2VlNybTBaQU1Ra0pERGV2OU1TdktaUzhmcEJDNm1HSW5aVXhWRzFhUjBM?=
 =?utf-8?B?S3JUKzdwTVgrdzZYbExCbHBmVnZ5Qm42MXNSNzhiZ3JSeHpkSWNMeGhnRFNm?=
 =?utf-8?B?WkJKdSszelQ1RzBTbzF0aFB0Zjc3Y004V29EYWFyVmJKc0dOak5zdU1GOHYv?=
 =?utf-8?B?Mzl5YkVqOElCcy90d3JmZEVEaGN6eEVrak1iblQyeXVFRE9BWkhqc0dic2I4?=
 =?utf-8?B?THgwYzRZajNqdVk0SFBhQlBRZ3VsWG5HeHBVVUl1eU50KzBhWkZKN2sxQzFB?=
 =?utf-8?B?c0YwUWZMZGt5L1Z4bG9OLzlycmhSaWEzYzBENTMzSXJMUFNiZDg4TkJXbjlM?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ab933-af1b-495c-9337-08ddfb5310a1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:13:53.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To+XYQiSxU0ylTNYfOKSmZrXr0x91JHddOTcnMs16fnBe04HPe13XftgPEKUnJHjNUHKNJD0i+o4EUyweq6NY4Nhie2S7yN4clLeJxBRzhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10304



On 19.09.25 23:49, Jan Beulich wrote:
> On 19.09.2025 18:31, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,17 @@ config ALTP2M
>>   
>>   	  If unsure, stay with defaults.
>>   
>> +config VIRIDIAN
>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>> +	depends on AMD_SVM || INTEL_VMX
> 
> Looks like either there was a misunderstanding, or I wasn't clear enough.
> Here the dependency should strictly be HVM. If anything, the dependency
> above could appear for HVM (but as said, as of now it's deliberately not
> there).


Sorry, I misunderstood you. I'll drop above "depends on".


> 
>> @@ -1136,6 +1136,9 @@ static int cf_check viridian_load_domain_ctxt(
>>       struct viridian_domain *vd = d->arch.hvm.viridian;
>>       struct hvm_viridian_domain_context ctxt;
>>   
>> +    if ( !is_viridian_domain(d) )
>> +        return 0;
>> +
>>       if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
>>           return -EINVAL;
>>   
>> @@ -1172,6 +1175,9 @@ static int cf_check viridian_load_vcpu_ctxt(
>>       struct vcpu *v;
>>       struct hvm_viridian_vcpu_context ctxt;
>>   
>> +    if ( !is_viridian_domain(d) )
>> +        return 0;
> 
> I don't think we should let these go through, but rather flag an error.
> And perhaps an intentionally exotic one (e.g. EILSEQ or something yet
> more "odd").

Most of existing load_x() returns -ENODEV (for example pit_load() for !has_vpit()).
Some -EOPNOTSUPP.

I'd be very much appreciated if you could explicitly specify err code to be used.
-EILSEQ? or -ENODEV? or ..


-- 
Best regards,
-grygorii


