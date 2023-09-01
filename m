Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ADB78F910
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 09:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594440.927764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyYF-0001OR-Bf; Fri, 01 Sep 2023 07:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594440.927764; Fri, 01 Sep 2023 07:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyYF-0001M7-8h; Fri, 01 Sep 2023 07:26:43 +0000
Received: by outflank-mailman (input) for mailman id 594440;
 Fri, 01 Sep 2023 07:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbyYD-0001M1-Ph
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 07:26:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3b35720-4898-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 09:26:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 07:26:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 07:26:37 +0000
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
X-Inumbo-ID: e3b35720-4898-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1R1wrjCQI/EFhgWmtVtGFZXOHo/xPBPcYdqDybfC8gDxR01YkTMX04O5JZlKi5OserNBo7m+eCMfsRQohimIs37melBuhvl89Sxj3i1823MQGwZ/sGz6s3PGWK92XCBEat2Bx9QAwgIvKPUkaMVKV8sz8Nqz9aZbe2XqCyj1msIb8D5pRT0TNgAwkYKNdlsm0Qk29eCmJDhw9jPykszR39AIs0tFRaSdiOOw6ZISJBjUL7bcEEjLOdB13gWNIwLJRkiTtyZARQ2LNpR72IHTdQZ2IFcUHn0RCS5yHCfR3U5qK1LspS1DqJ+eUGM6d0Z8weiLS89t40YwPhLa84YAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deRWhbj0zeKddml58ln36qokWmFeaFHTvp2G+ldc8+0=;
 b=N8SAQOIlRKDoS3r3jIrpTzOwoGPLlL6M+ThEJnDwJYbMIwUws32xBa2Bqt/xXNWG5mAgWJRdWVJYLjTHEsRvYWzwRPO2Li1EPyERvC2AA7pAo8cNLeUdJYoz3sPWFVBkolxkWBARXgcjIOWaiZoUrRTOCy4XDKXLHtMRNDynh/4qth5usLjHl1PIT4R4FjzRJdWjzOZ7EnLyjJExgR1AYedWNsiY2OfbL9GPJTPubxP4Sc7ybXFEMJYct4xbv80f2/9q6/DBd9pA1EhUlkJn0qxMDDlasEOefQ64Jb4r+WecZyjikwVF4fYlL4DgAiFguowmgLezkQaPn/6yVWNiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deRWhbj0zeKddml58ln36qokWmFeaFHTvp2G+ldc8+0=;
 b=fBObJax5N9tEszCWE5ObuwUkq1TSpHMrHvLkQrMMbSbci5x61MVXaz3qpcNQ4mDSRxRz+tfVwZiBxcdmXXF+amY2CKTSBA72z/T8p6s6OlcIIJNhasrbk+q5MqriHQfWQb7kLHJu9XefuAWRReh6w6a8XnwsvuJvM+bVZ+012JpPA+yjJvrB+g/wR1vF14zTPH7Y3b6D42w7bz19i+ga7tRlx+fv40f+hAOkyp4TAImaj9QIF9pXHI9kOqH2+Z5RIeWAqr1sl+COkLmfqVgTG+DYDnzyHcvy1UiYjuct85pkTwiy7AzuT4APavhCMNXK/iCVHd2fMKY082SsVa35qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
Date: Fri, 1 Sep 2023 09:26:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 1756d957-8639-43d8-af8f-08dbaabcc6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y5w1Ke8mQ6q885QLwckrPvdpae/gX9/cNNR5ZocQFcc3q4xKzW0iai2N8HEgZnTH1L5Na4PfQcguoohVnJ42J13+eUViCz4pWGAltTl17RwKe47gmePCoa5uaDQAWyZjlfJY3atER50+t4O2i/HyTOWTTNDSeB1u79kKWHJrNcwVUem+LvV3VrP9Oef6BXtA0aCZKvFkwEcCPRvbuDd35GD+BtBnUO+FWeHo9YNe4m//MZbHvMbJK/UEV10JSKMCC3n3JmcPnEyFZ2Unm0NVu8yqHLljutSYhrjdxFIpcLpcwcMNAycVgdqAYAmRfAeINkOvZ7RTB8w4iHfnlP1nHPHyHgVk9LhO9cxQC408O1qDjWgyzMhQPcrkgxtyAP704s4oOZ07Vuj+VRieCnjIDQA/m7xTAbw1pgKwlxXNxERtcUyq2gFBZswGMGvTSXwKPzxAOTQgP+tiaGBMYq3MrsDZ0jc7vsLzyP70OPNS1D/G4+DpiJ/rvaIv+6ikIiqoWr4vdvg5L3dGfrXSzRQ2r0Vd6MZWse0ic6tIdMKtVVz/GFdE4mqaUKX7CocaH9gnA86g2kMUQKw47cDdYqboP0d9wXXw8FPXzoyNBnPpObF66kGtY9eHjampKSfolj7wQ5MT4A3gtfPdh0/aSPAdQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199024)(186009)(1800799009)(31686004)(6506007)(6666004)(6512007)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(4744005)(26005)(478600001)(66946007)(8676002)(8936002)(4326008)(5660300002)(6916009)(41300700001)(316002)(66476007)(54906003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdCYUlBMm1sbTNpdUxaOUJFT2JSVHpCemlHb2Vvd1R2bmsvdm1tYlZLdnVR?=
 =?utf-8?B?MlFvbmN6WllIWVVWY1ZFc1o0b2tlYjFSTEJmL28vMmk4bHdEaUp0eWlpK0J0?=
 =?utf-8?B?UVRnZXNzNDlWdnlOTUVOVlhWeURGWTFVeGd3T0krYnRSSXBZbmFkUjM4ekhI?=
 =?utf-8?B?QmNiODRNeTFlZkxrM0xjYnIxczAwakVDb0c1QTZ2ZTRZdFkxQ29IRW9RTitE?=
 =?utf-8?B?RnhkcTdFOUpCcDRpY2VLN0VPaVI2SS9FRVJTOTRlL1VNOU5tekxqY1hIT3dE?=
 =?utf-8?B?ZENqY1BYZnhLTHNrYjUvN0d5cnVGSU9pTDZkRXBZK2p6Tm9xaEkybFNNejFD?=
 =?utf-8?B?TDJpeUhoNlRhZENOU21rdXlQcW5yOTc1cWVZeExZZzBkYkluK2hwSzYrbUtJ?=
 =?utf-8?B?bml2TWJ0bTBCMGxhdjRnU2JNZmRDQlZ6V0hhbUE4RTQ5K1JOTEFMa1ZlbUY4?=
 =?utf-8?B?dGNreE8xMkR5NzBicmpxSitTZFNpanpIQzdjYk1COUVTbTNISUUrRVMxdXhJ?=
 =?utf-8?B?UExXdFgwTy9xRlRhUFhnZng1d0IvMVJ0RC9Sc2twaEVWYldmME9wazlqOUwv?=
 =?utf-8?B?a3g5cHZySU1CbWdVVjBid2JYVmRaVXJXcXRYbEpHTlpHTzBZL2piK25rUlMv?=
 =?utf-8?B?Y1N4Q1dudnJIR05FQW4raGxsVUxLZ0lMZitCUmZDUTVFMWQrdjk1OHFVTytB?=
 =?utf-8?B?Qml1eE5lb0ZCUEI3MFFEdjM1QjFSSnhzSld5cGtMMTBxMHlrZ1JaZU1URHZC?=
 =?utf-8?B?L2dlVVYwUU5UV2NuQnlQcGlENUJya0dtV2NMK3dtSkZlN1ZGMzdpUHZGK1BC?=
 =?utf-8?B?OUpONnNwT0lQL2JPTGNoTkVwVzdnVG0ySnkrVk5Oa1huSkh6SGdtc2RwNXl6?=
 =?utf-8?B?OVJhVkpGbzJQOTdGbXZRSXE0K0Mvdit1dUlKZG9zdHRySk1Damkyejlub05J?=
 =?utf-8?B?NHhpdEZEbTZRQ3pqMWFiYmN3RGdaWVZXR1JZeFNXVjVHMUdNRnFuUlBKdEp2?=
 =?utf-8?B?eXJmOUtSV3Q4ZzR1a2l3NWM4b2VhbmRRQlpqcHgzZ2toY2Y1T0JGbU9ENDVC?=
 =?utf-8?B?MmlZcmlnQ081dFNkWll0Q2grdEgxaXdVcnF1WGdYOTAvZlVndFFlMlZ4YUZR?=
 =?utf-8?B?OGJqRk43cThONUlHejBKUXZHbGhTaGFndFM1RGM3TXFWS0NnY0tZaXdtVGlC?=
 =?utf-8?B?MzJFb2tlT1AyWWQ4SHdxZWk4a0cySzZibit5Nzk3Uy8zWjFiaVdzQU1PaGww?=
 =?utf-8?B?Ny9veWRLcmpLK0RoSzAyTnU5ZzJIY2REVUdUQnRXY0tEMVZJZHgyZmdBYzkx?=
 =?utf-8?B?ZS8zWEpmc0VNRnVoZElRdWMxSFJnV3lCSjdIaDV5SU9KWG55NVNWZU9YM0c4?=
 =?utf-8?B?MUZWd3BuRndUY2hjcW4wV01DdjZuZ0VjTjFETzNxeTFiZEg0RUw4bUpGZzE3?=
 =?utf-8?B?Vnp1bmFNVVhjZTNBT0cwT2tUOU90TldnaHFSQUFQaGo1UlR1bXNsOGxlSkkz?=
 =?utf-8?B?UmZaVVhIa1hGdnU1MGZEYzFFMmwwNzlrNnpIUWxNeVY4YW51QVdUSVQ1YzlX?=
 =?utf-8?B?MklnejZSKzZhQ01OSUVHM2ZhQ2JjTnhRZEJGTDFxQU0wbG9ieWYycnI3VHRu?=
 =?utf-8?B?dElxNmhSd2k1NnBSc0drUDNSV2svZzQ2SzJEWW5ySXc2S2ZMV2J6NGRBK2dZ?=
 =?utf-8?B?Vktab1lmNG8rakJFQ0x6RDJPOEkrNWJLcjM2enhEVGlUaG9KWkRTMk1acmtL?=
 =?utf-8?B?c0NEM2gyQ041V25nRmhrSVU2ZFVIUW9WTlh5WlYxQVdRa0JrdlVuZ2tKNFJ0?=
 =?utf-8?B?empwVnZ5YjRaekNTdnJvczFrQnprczY1TGR5bzNtTFo1TlhMemxXSmdaT1ZL?=
 =?utf-8?B?bWlsM003UFRGTFVvck1FVC9jNzR4TkRscnpjNThidGxyai9lTEFPbG5PYzJY?=
 =?utf-8?B?YzE2UjdMSlpuS3RXQjBwUVE0aXl6WldjRExxK3ZWYmJUb0ljcUdpUTA0UlFK?=
 =?utf-8?B?TFFEaGp2bzBESE9Xay9lRVlpcldhbXlqKysxMjhwWUpqT2VnTmU0dWI2ejVs?=
 =?utf-8?B?NTdwQlh3ZzMrdDBNSHNmRUphQVQwbkYyZXdhUmlBb05sY0ZybzEyRjV6ZHds?=
 =?utf-8?Q?x21Guu9BjtVCy8o7m5soVMJaL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1756d957-8639-43d8-af8f-08dbaabcc6ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:26:37.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ6/qu4VZqTT/k/HXdNyiaIfOdKujUGR+4gRNncV3wJ7UPFC5mN7rQiXYXC6qE9npBxwUtYCTN5J855/vOHlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557

This using a GNU extension, it may not be exposed in general, just like
is done on x86. External consumers need to make this type available up
front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
the type is actually needed outside of tools-only interfaces, because
guest handle definitions use it.

While there also add underscores around "aligned".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -152,8 +152,10 @@
 
 #define XEN_HYPERCALL_TAG   0XEA1
 
-#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
-#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
+#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
+#endif
 
 #ifndef __ASSEMBLY__
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \

