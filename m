Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1F662769
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473652.734381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsPS-0000YE-Hj; Mon, 09 Jan 2023 13:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473652.734381; Mon, 09 Jan 2023 13:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsPS-0000WX-Ew; Mon, 09 Jan 2023 13:41:54 +0000
Received: by outflank-mailman (input) for mailman id 473652;
 Mon, 09 Jan 2023 13:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsPR-0000WK-Tt
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:41:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f5c314d-9023-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:41:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:41:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:41:50 +0000
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
X-Inumbo-ID: 5f5c314d-9023-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My+JoqO6h5y27qEa+gNkIzD5XbmjuEeij+vbmCg7+wb+oDbVVbZmF+k8hPhK3yujbhBr21qZLHItaForEQSwG9QtC4WklzHJwa7qaFp4HXgLG4HwqA5JtsEHw57C3Ua2vCFxTe2JCaH1TqQ+GBHZ274vONz3eHlEr6u39etx28WmMED5srjoMKmdAJkwGsmD0mrq3WtHI5cu6X+u0GFo/n0o3DsYiZE7sf3Z2Xkdi+HEvqor9t4dAKuezNmbBCvWxUnEJfCubtekRKfjAY4f46pjYxn7yOsWR51GVMiXah3u4gfAxodMCVVeHyigp8hzrVW622mj6xc4ZZe2s2jYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldmrcBpaOs88X5aWnm3c9XzMTqcT0z7U/BEsg7rlocA=;
 b=oOpP5kcDhrQNgTmKSkFoukYGoyZ5AeCfPw8RHlKIP28B/2cMUN/EIVwJlJbI99T3l/tmBqTCRTYIBSD9F/gxT4WmfT8DwO7CF5mHMgiE17H22BmAMolr4H+BkKtHvBHkGGQLU2T5zS3jaRCHg7iGZNx3//jM1HeJv28rhyQgg6cVPOrFs+dkIgOCt38jVDLNOdvIXuCIr+rBnXSVm+wgoSVpxBtYIR+JvS8Xzl/hw9oERG4zqj/4opGmSc6ZA/iSJ0SMy0tx7UcovYF2iFyLBGWttTjcvIyevk8tGySfqeBw7mxuxDldUOvc3axY2VfFPoyH1lLZ2OvVGKF6lEfeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldmrcBpaOs88X5aWnm3c9XzMTqcT0z7U/BEsg7rlocA=;
 b=4AWJ/z4QMmbuE+TdW4gHklaV7jUuMXm4kCBH5TEScwQ2pH+leo9Qlfy8kKfztQEjz5doiBGb9nsx7WlE2iJsIPWGt/CWf5+EZKpC3PnEM/HuPPEdgyRU2yyJ4SneWmI9ZE/2owoXVNut7QL6medqo62wR2eMASBREimJpCGkTsgQB3GfoV65eWRGzmIQjD15O+4u02hbYaKCMlTAWFU9qNftZe1KcacDm/vJN0hymupxdIWGj7jydJH2b4XPhHxqIHjdU8MSN6dzpbmhZ36HN4okSU6cn3qbiGF3MM121AbFWPmLeGUJRS7iKL6Gu/CN5TxeRUCrLfYThG6uGC1YlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b25cd042-be18-189d-d53e-4ea8b28e2e57@suse.com>
Date: Mon, 9 Jan 2023 14:41:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 5/5] x86/shadow: drop zero initialization from
 shadow_domain_init()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
In-Reply-To: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: eebc57dd-0faa-4bb9-2a30-08daf24742de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/g5Fhg/WFGQ3i6EQjIuIAJrgx6d+r9ywCwbB+v8XzL0fn21OiVNDh1YoO3qgfd284PczrIxwKp/ISWhMeA6SWTD+fc7h4qOERKFWHZ3FiFu43P1snWsQwaEFLDxoFg7Xz/RnWsxVy2gzDJtjprBBLjWy1pApzjpFuO1n7hyAE98GFMF/6s7gVbJJsHGYp3ixwmrtyQb/D6+aD2gGJw+zaKuHH2WYteZDDvkR1sPGWO66G9hbUCgaiDQMeAKZKDgrzfFF67DulJ5LNXNQR2F2rUhthshatkOAomcq71fIJX6SlpYv3XBDLJA7YnBraa3zt+JnnuQN5QnpPqJwAJ3BNAtlg/Vt1kQ4tVOEGvSBHgfVIBbI/cggmOYDRmGYk7c65Mr0ETZAok6awTwcy+ZYT1SSPwS7IVsHA15CKSzYDue2XwOoVEIJwcBZl4jfqVETb23RUA4ut5EOMFjufpLG0ykBOBG0XPgHsg2toEr19TY3E0aTReC1ZbKB2uCZLQV0JjL3jVqwT7Mc+vyh+K2d6jupE647EUwTweV0QDRkj7lYt8Xu6KZ14JoJXEen84GgdurfxFl3So9H2DUOB2+JisEhqdpGLCoRZxIstVR49NOwgP82ZcDsij3gwt5QTccWUYen1TaMjKnu4lBOO2t8fOqui/mWKwWXsbYFcHAJQmNZ03a8uCUQAF/4lvPv2zTkrERHupkxKMzmVqOhyUQtjAAESjYfAwZFHnn4vlxPq+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199015)(478600001)(36756003)(86362001)(4744005)(54906003)(5660300002)(31696002)(4326008)(66556008)(66946007)(8676002)(66476007)(38100700002)(41300700001)(316002)(26005)(8936002)(6486002)(83380400001)(2906002)(6916009)(31686004)(6506007)(6512007)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukp0RUxqdUp5aWp6RjRQSTVTR2piZFhScFhLSVdzOTVTZm1HY01La3M0QjQz?=
 =?utf-8?B?R2xDd1ZLWkxZYmVoM2xFMlZnbTJKMWpnRkhsOFV0cE8rMWZVUExMRld1dW9r?=
 =?utf-8?B?bm5VN3VoSTk0QnlNWE5tdjVkeEJIZlZUc1VBcHE1b3c2aUFFeEExUHpFVm1l?=
 =?utf-8?B?OUxNM2NMTlNla0pMbnNkQVJZZzZRb1pnR05nTDdaTmtMVnMyaG1rYzhIWldi?=
 =?utf-8?B?RlFTQjRFdW1YL3ZCa3o0UGNSVnF6ZWdRUC85TGhiNkVtc2loZ1A4d29vbUZi?=
 =?utf-8?B?aHdpZk1VRUNGL1hLcmpGWFUzUE1CUDBha2lLTE1lNVB3clE2VXh2UnNWL2xh?=
 =?utf-8?B?dFZoMjgvZ3ZRYW9HVFVyOFBENXJjTzUzOVVkbzNCd0YwNGVTSjFybkhKNU93?=
 =?utf-8?B?ZzRUbUhJcDJQQUJPRzVSYTJyNVl4V0NVK01xL0dOZitQbHA2M3lsdzF6eSs0?=
 =?utf-8?B?VjJiS0NpUkZPam1JZG9SK3lQRklOWXZSeTBpMC92NHNBTHdDTERJYVd3RGEv?=
 =?utf-8?B?bnNaNmJ5RUJPTHdQbEJzYXVHb2dZYXhxcFN0NjcwSFZhUk8rWkhlZ2tQREI4?=
 =?utf-8?B?ZVcxdytyZVJJblQ4M2gwRHdOYjhFYTZYVGpoNXQ5Y1M0a2xiT1kwQjJSUVVN?=
 =?utf-8?B?a2pkeXVtOWt5VGRJRDNpeE5KZStYOGpTaEc2d1ZvLytkQUxyU0VTaG02VVRB?=
 =?utf-8?B?Sm1sR2d2WThOcURheDFpV2k1OHk4WkpHdDBWdEtLbjhqZzB1STI2RkxPa1Ir?=
 =?utf-8?B?SzRNSnZOR1ZwY0hoWEl0T2pmSHkxbGlBZGgvdFIzN0ZhMzhTdHpzYUZ2ZVdF?=
 =?utf-8?B?YkFKL3RXRzFaUFRCVkpWR21oNTYrZ2NnVkpWWUMyODFzQlJuSldaNytNdXUv?=
 =?utf-8?B?eEZXT0Q5ZzY0TjEvQ2xubEJnU0ptTDRMRWlRcmc1dnFBMC9UWmFWWWd1d3ZC?=
 =?utf-8?B?M0ZVT3c5UUU5R3VEbUhIZ0NZdW43YngyV2p3N296ZGZDU0U1MWptYk9xNy9U?=
 =?utf-8?B?UU8wK3lWWTQzNmFmUXJvbVRPRTc3TnVvY3JFVlB6YTM3SzgvazBKcXlEbW95?=
 =?utf-8?B?U3RlUlNKM2h3TEZoQTI1cldPSXFGalI2VlFFQ01nMFZQSkxZbVQvcmxRbzdk?=
 =?utf-8?B?R1BZeTZPdEoraDJ2R0FHc1RvamExanpaMDA5MTdSTm5DZzZzT3JoRk5hQ1Ey?=
 =?utf-8?B?VmFIaU9qZXFjeTVsbVU2bzNQUDBUZ2dBbllieXdWd3JtV1FzbFE3NjNydmRB?=
 =?utf-8?B?RUVnMUREZkVNZWJJTmZaSS9RTnNEbG1xREZhU0RJZ0NMcnFiQTNlcExJbGxD?=
 =?utf-8?B?V2JNUTFHSlNtVjgwM014Y2gxM1laSGJ5ejF3ZjVBb05oNUpZQmNlOXd6WnVP?=
 =?utf-8?B?UnZTS0NSSTlrVCtmcnBFaVhFM0V4R2VZaFlMMDdzZCtzZFlNRnBpc3lybVBy?=
 =?utf-8?B?TmVSemhLQ1J0Tkh5dUkwSXY3czB4Wmd3d01PKzBOZ0R4Nis5bG12Qlo3dk10?=
 =?utf-8?B?dy9aalZaWW80WG1VV0dUTHJmdDhJNXhZc05jUnpuWGZjdzBSZ0cxVnM1MExo?=
 =?utf-8?B?UmYxeEprajQvR2RaK1c2WnlBWEdUR003MTFPa0JzZHNjY0k2RE8vNXdPdktK?=
 =?utf-8?B?dENKQk5tVE9iTVh0d0dORnZmaC9XRWU1L1dkVDMxTXZVSTJpeFdoT25xekxw?=
 =?utf-8?B?S2xtZk0wLzVPQUtwSU9zZm5iVFZrVElMdlVWY0wvMFFWS2xiNEdsLytOTWpl?=
 =?utf-8?B?RjhEZ01RT0xTRWNNc0M2THp0eVdHaHdGN3k5UkFlRnZkS2FyM0tKZ2xsUmpD?=
 =?utf-8?B?dStLaHMvYmhXemdMZS9SdEt0OWg5RGpSaitEZDAvbm9xc295cmlpZlVkaDBF?=
 =?utf-8?B?MTV4YW1ad3IwZ1g4TlpkYXlvZEQwOHRIc1ZzWXZENEVKdmdTV3pzb0dNOXR0?=
 =?utf-8?B?Z2pKL2NnWnRVdFNnbkJUeWV6RzIwckYwVTFDbFdLRzlSbWYwZVFJTURabldO?=
 =?utf-8?B?Rk45dVEvVUFIUE1jR0R2ZExteWkyRnA5bjVSd0JIUWs3eURsR3pxbnkyT1Iz?=
 =?utf-8?B?R0xack92M0dETitVQzJ4eklUT3JuUEc5UmU0ak5DbVh6U01NaitJQ3orSlVz?=
 =?utf-8?Q?wmbRvaLJsG4vzq7dGK4JXPJeQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebc57dd-0faa-4bb9-2a30-08daf24742de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:41:50.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydGtY3AoJ3GhLG0asHd4xt16nog1wJxntn0TmoVTnoRM71INdJBM91TvfEUzCA5g2D5o2E8wImVHh8qTUVmHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

There's no need for this as struct domain starts out zero-filled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-base over changes earlier in the series.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -64,12 +64,8 @@ int shadow_domain_init(struct domain *d)
 
     d->arch.paging.update_paging_modes = shadow_update_paging_modes;
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-    d->arch.paging.shadow.oos_active = 0;
-#endif
 #ifdef CONFIG_HVM
     d->arch.paging.flush_tlb = shadow_flush_tlb;
-    d->arch.paging.shadow.pagetable_dying_op = 0;
 #endif
 
     return 0;


