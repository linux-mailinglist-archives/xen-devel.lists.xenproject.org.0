Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4298F377
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 18:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809624.1222052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOHg-0001WU-6q; Thu, 03 Oct 2024 16:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809624.1222052; Thu, 03 Oct 2024 16:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swOHg-0001TI-34; Thu, 03 Oct 2024 16:02:32 +0000
Received: by outflank-mailman (input) for mailman id 809624;
 Thu, 03 Oct 2024 16:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ein2=Q7=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1swOHe-0001TC-Pi
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 16:02:30 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40cc449-81a0-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 18:02:29 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM9PR04MB7555.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:02:25 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 16:02:24 +0000
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
X-Inumbo-ID: e40cc449-81a0-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LywoP5Mx02vs+pDTcDitNmaCl093q7LaOwSZCh7re2g7LBWo/XQNCwNDRjPvcvrHoc4wApIZFnuxDGjrjmg65QQ5XObvo5uALsGW4TWwVvZaYCP9cN0oIo95zkTqirWzJAQ5YcJhIivkTZdIIk6XyZDQHWTOdqgi5xONdG5ie0GnE6MXFhaSF6M4PEEUs4cwlJmMKcLxEX1z6yc5reGt9B2kJwNvJjwqj94Agxy0POyZQSAzqj244P2xHwuB27H7bDW3YO4DZLyiFIjOC6QTENM6A89LLOG5urqOVWzzE0aMjrbJ/WBmsV16KptxRDD8efewVbdIHJZT87gK/MtCCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NMnEPMVzXCT8fmd3PK1T5A9vsu+k3+bQli0qyGy+vw=;
 b=VPedogi1sLbH/vs6dv/UWtGgISFMMFzQE3TJIPDyj51j1E/UuiO5rkBbeThFqGUoZsmKt898o49zbklDEWIIIt1cpXTbaygbC2TzXllgvJDHdcC7wqPPT4aTWmxWAaCiY7T24re8pmiXmDgqr7+OvdKNDj9WA0OxyPIa0S1yEzwSYdRtnOJf2EVphWS7sEpOKC0iTGuXHR/RjM4GLysh+jqbRR+jcVFTWZHhqMlUa8v5V7r8HbAlaII8cxKDErm8PJwk4NJW4U3qTD6CFVg+NwElfPD4M3n6Hp6YGA4b7VF/s/RmF5Rov7umQ+lq8Fm6yVvvEL6BsOQCYdO76iuIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NMnEPMVzXCT8fmd3PK1T5A9vsu+k3+bQli0qyGy+vw=;
 b=FUNpRRgb6ca6aeWORxjd5BlTv1VRQu31ZnG+c1mqLazAA8zJNOESAT3p//XLM1zW9apuPSjyl0hYoMlZaXO/5xHoHLLqxfI7GqMXMgmN2TFdd2sixpgv4uEXcZWGicWxu+0IVim2TlDhUDf4tczfOv0WyQqdPtp6aYq2g5ajxQxN0gI7qfCokrjS0kQ5I8SaGe1oLt+AAcv3DsOHX16iBKevHUyWOiuWEycCq8nVRTEtt+Ihqj5WTVpXmf7Hldheqsg+b1EZoexYrrpIMbKsF1ZKZYTeUgeSZwPZxRGH7UdhE/D46JLgVF+ca5eAB5sJJNmriAdnjT1pd6A6IytLQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <ccf364f5-86c7-4982-8356-f34afadec7b9@oss.nxp.com>
Date: Thu, 3 Oct 2024 19:02:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <b06a2506-92d0-4bd2-b377-c9d140c0d6ce@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <b06a2506-92d0-4bd2-b377-c9d140c0d6ce@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::19) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM9PR04MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b73414c-67c5-4b88-386f-08dce3c4c55f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGFoOTB6UDFJRGIxQWdwU0p0VjFLUHJKQVRoTVNrTlJEZnE4cnpmajlXZmZW?=
 =?utf-8?B?S3NrTmJXQlA0TTYwRlJEWTExOUdrOW1jelgxd3lwU2FLcjBseUF3VHRreXF6?=
 =?utf-8?B?TDNWNlcwOW1WSFIrRUhyRUhGdWJqZWJvalI4UUVWb1IwMVJPV3lXMDlsWTVk?=
 =?utf-8?B?bFFtT3JCb3N3WXdRTm5xcFRKUU44WFJ2M2J3ZzI1OFVLQXVXQjNVd2daRVVL?=
 =?utf-8?B?S1pVMG5PQ3V4eTRoMUlNRjBTc2RsUXVKNTRhK1NlMnZTMnIvamh5WW5HazIz?=
 =?utf-8?B?NDhra0tPQmtuWnh3Vjh2QWRKWitxeW5wSExhbXBreHlIK2ZhVTNhS2lSbUdt?=
 =?utf-8?B?VDRodGxpaHVmUDJuQXJlQmpPYXF0cEMwd21QOWZmVUE3K3hxT3dTNzBlVHlC?=
 =?utf-8?B?aWdKeGhCWGpOZnBEVHQwRkJHK29nQndtN2FJcTN0b2swb01zK1VEcnAxSTcv?=
 =?utf-8?B?c3lLYVcyQlZTdlhKRDQ0cHBRem5XcnFTUmdYK21LK0pRc0ZLRW1xdEF1enE1?=
 =?utf-8?B?VGFFdEVRdGlSSEcvdHUvQXg1aGRYZmcwL0pMNCtLYlhmdU9vaktFOCtnamlm?=
 =?utf-8?B?eXJBTTZxL1JBRXZMblVMUnM1UzRZRlJlK1o4UFVFWmtnQktrRHFrUm5Cd3pX?=
 =?utf-8?B?Wi9vdUp3VG93dXpkd1B6dGRGTC95QU9PL1RxWXlOSTRpTlNMc2ZRQ2dlaWtC?=
 =?utf-8?B?ZXZET3ovL1BTL1daNzR2Y0NzRE1jQXNjSmlyOVNLeGE3YUxFOUlRYzlHU2pa?=
 =?utf-8?B?bUczVDVwVXJHTTE3MmI1aUFoTzIrdWhNeWp5K1QzNnhSTEQ0dzlqL2VkSlds?=
 =?utf-8?B?aFRyQjhxT1RjUElqQ0Fha2RyM3dNcW1BVHlpWUJDa1hjVU9aUCtEUmdldldN?=
 =?utf-8?B?WnUzZ2RJTloremZta1BJbUVBbTl0cVVmd2k4WFNISkpMOTdocjFpUVZ4Tmgx?=
 =?utf-8?B?WU83by9pcmFmem9DWDFsZVVDNzVwalpkSGRrZk1JNEJwZW11dWhsNmZnSGtZ?=
 =?utf-8?B?dDF4ZXBrNEtaenVCQUlITk1XL0ErSkR0L2o4UnJFZTZ0UnEzVjAzbXU4Q1pj?=
 =?utf-8?B?QzRrRGdLa05nUDl4aVVCRHdCU3Q3Q0U5Ym8yRkVnanJjTnlBZzBELy9kM3NX?=
 =?utf-8?B?WUlTUmdaMnkvVnlranIwWDEwOGNGSjZ0YlZCNlFlWUdsN2lMa3lxTWR5NHRw?=
 =?utf-8?B?MWJjTE5JWk5VN2piL0V2dytnWFVtMmZWa1pWbVNuK3A1dHcyTE5LYjhQUWly?=
 =?utf-8?B?eUhRQW5aUlNQNmV6QnAyRlJtSTJnUklSSDM5UEg5RE5vazZQNWdtMDk4QTdx?=
 =?utf-8?B?c0dKNzlsbEljMHN3LzJSeitSVnUzRDBmMFFYZEtPQTVjZVNCNHkvYUlaTnVW?=
 =?utf-8?B?TW00cDJOaWhaQm0yVGx2OE1RdXJyTUE0dWdGMzc3TGlzUUIxTng2emE4UXdJ?=
 =?utf-8?B?bXROY2lNTW91MnEzU3JjVVRwRTdLL0tDVUsrelJuOEtNZklSM2xzNEJySWNh?=
 =?utf-8?B?NVZEOHJNVkswdmh5aDZ6c0lMeHhsRnhVQmlVTHpjQzVLTU1LaEQ4NU53Szkv?=
 =?utf-8?B?SittcksxOFJCR2VVbnkyRkZ2VkIwWitUVTArSTVFTDNGR3R5Y2d2d1k2clZa?=
 =?utf-8?B?SGFmbnkyTjBjMHJMbm5HVGdzbVBhTG1SMHpCb0gvR0JuQVdNLzdBaGhtNzhL?=
 =?utf-8?B?WUE3c0xaV3FVaE5NUE81TGZxY1c2NWJFRE41alR3Zm9CcEM5cFZtU2tnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVppcFNlS1hvSUhwN2V1cDRSdmdNSFhoSG5YV1RDLzVnVTR5M1RHY1BrNFl2?=
 =?utf-8?B?eDB3Z2lWa0pUM1lRMmY5c0Q0ajBUQXVKaytxemU5Z3E5N28rayt3OFdhRytF?=
 =?utf-8?B?K0tkQzAwSUxac2o1ZnZaWXZFNWI2T2MrbzBPbkN3UVQvR3l5eTFFYXlRblVt?=
 =?utf-8?B?RTMvd3hKcGtUZUVrbzVrZ00zTDlDMlRvZ3pjKzhQWFFMY1JOVVh2VG1jcDU5?=
 =?utf-8?B?VEFiY25MRndsMTNaLzBQbkp5a3doWCt4cU9yZjY5TkM3NmZicTY1UnQxMjZI?=
 =?utf-8?B?Zm5jS3dsNy9vZEdjK1FpMmpRazh2R0pKV0xBQXFNYzZPSytNeno1RzRISi9B?=
 =?utf-8?B?azQwRlJhbTJlK2w3N2xmRGljK1Z5RW9qWHZPY1hLeDRuS1ZuKzYxcHRPSU56?=
 =?utf-8?B?STRnOWU2R0Vqa0l6RTV5NnlqMTFFVDRHZW5IVG9LalZmSGYrZHdjMi9aSEd1?=
 =?utf-8?B?cll1WUhIejg3UU8vL1F1N3VYaUcxbW0xSkJPTTdoSVFMNndHZkRMLzVVZ0Iy?=
 =?utf-8?B?TWVUQnJpT2h0YndsZ0ozSkl2b3h4Q0llL3VvMDRBYlBndVlNMGEyZ1JWYjhH?=
 =?utf-8?B?MFJYdkorNEFZVnFacG9VRVlUWjljNC92U2NLRjgwWXNKUlBwY2szV3kvejdS?=
 =?utf-8?B?VWtqRlF3SnRteWkvVEJ2VmM3SzNOeFlta2hESmNHTU5XSVFuTTJ1ZDM3WVlU?=
 =?utf-8?B?TmpDOW94QklFdyt0MHZnY014T3E0eUZWOWlaQ3c2UlNTdmJUamwzNUxyb3Qz?=
 =?utf-8?B?RXVRbllxSUdrNGRENlpOTUNrU0hmVVNHNGlOQ3lLQ2VaczdFSDQ5L01TaVd6?=
 =?utf-8?B?Umd2UER4VnNNdGZqNWtkUTEwaXV6c1BocFAvN0xwRlNzdGpJK1BySEYxUWZ6?=
 =?utf-8?B?UjhlYnRkZkNWL2VHTGdoZkpBRUMxaFpsUmNnckdXRlhmaFA2L3k1R0NoRlB4?=
 =?utf-8?B?SzRUbEErWlZWVFhlbWIySzVMOUt0NUxlOFJ3MHI4YTRXdWZENUN1aDNGQjI0?=
 =?utf-8?B?UDlaNThNZHB2NGk4WFcza09yK0pCWjlZMGlsQjlWMDU1OWNZbGMyVXVtTWhM?=
 =?utf-8?B?M29na0lyUFhZRkVXTDd3b0MvdXcydjlLSkR3QmhwZkVIWXR6VFlGaEpEZ0lW?=
 =?utf-8?B?bG9GT2R3VnZRbWF3YWJVWUlJR2Jzd09SM2hnaTArd3ZvYmx1NWlGd21uZ2Jr?=
 =?utf-8?B?U1FqY2xCUm9KaFZTblYwdTZzTGQweFByNm91TG1HQkZqY05CRkViS2ZYQTBi?=
 =?utf-8?B?UGRmYW11RUZNT0kvbUJHZzJrbUF4U1dOSWIrRFBvd0FVRWhMVXpsWG1MN1hI?=
 =?utf-8?B?RFY1Q0x3Tk1RRnVZUkd5UzNyazBtUUd2aXlNaHo2ZGUzcCtIRVgwOTF4NlRa?=
 =?utf-8?B?UThMWk0zTkpHKzArY0pxY0ZPMzFaSUpHVHM5cEp6MmZXQlkyYUlmUjhSVkQ3?=
 =?utf-8?B?K2JxcnR4MjdaMTRPVnk2QTYybWl3bkJha0lTREJKWWNIZFZrTXBMenFQbUw0?=
 =?utf-8?B?ZVFIWDJ2aExvZGlQa25rRTlPcWE5RDhLK3BiSEk0MGhEd2dIbVVNajBUaTN4?=
 =?utf-8?B?THBCaG9saXFZVldYRWF6NHRqL3ZRb1ZqT2k5ZnVxeno2QzdDRE85TGFWVFdi?=
 =?utf-8?B?TU1WS0xGSkUxQ1BhbWRhc2NaUFlCaEVtaU40VU1kaS9mcEN2SXFQRkVhTGs4?=
 =?utf-8?B?eVJaTThKb0tUTU5EQ2Q0Tm1uQXNGK0xZdmYxMHF6bTVGeDgwc2RJSHUrOGhm?=
 =?utf-8?B?cFRpVi96Yml0UDA3Zisxb3FRaTdnM3pEWjNEazZJby9SQktCNHR5MG01ZGRm?=
 =?utf-8?B?TXFSSzErS0MxbkwrUUtmRXFTb2IzSVpFSzh6WmRFZlFReDNuZlY2RmFmeW1Q?=
 =?utf-8?B?WEJwNlJadnkwYzllZzNCNTQyQzAzb2NmK1ZXSVNEcmhpYXA0VDFWS3FXaEJC?=
 =?utf-8?B?eGl3ekVZUVVLQ1NLQU03YUJmbE1heTFsRVZCckc5aHV1RXd2Z2JVNTJLWENN?=
 =?utf-8?B?UlhneGxscWNWVlFkWmFJeU5OenQ1Wi84WEY4MnB0bEFkNmhiUDl1WWlyaUN2?=
 =?utf-8?B?WUZLMVEvVmJIR3R4em1DOUluYWJ2Z3NpNkFxTVBvMTJEZWoyMXFtR01rN1Bv?=
 =?utf-8?B?YWQzNHF0NFd1bzVLSzQ5RDMvSllZSjVGUTZoZDRHSkVTY2duZGdOKzEycWZk?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b73414c-67c5-4b88-386f-08dce3c4c55f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:02:24.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxs/cptfbz4HsR7QDff29Xyd7im5zNMouAcBLi7lpYEPZMBauZtjG1fhb+HJKYybcmehViA/TYR29ytp/LvDL0rxtf86C9qI31MtFMqENwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7555

Hi Julien,


On 01/10/2024 12:59, Julien Grall wrote:
> Hi Andrei,
>
> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>> +/*
>> + * Generic handler for SCMI-SMC requests, currently only forwarding the
>> + * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
>> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
>> + * Can also be called from `platform_smc()` plat-specific callback.
>> + *
>> + * Returns true if SMC was handled (regardless of response), false otherwise.
>> + */
>> +bool scmi_handle_smc(struct cpu_user_regs *regs)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    /* Only the hardware domain should use SCMI calls */
>> +    if ( !is_hardware_domain(current->domain) )
>> +    {
>> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",
>> +                current->domain->domain_id);
>> +        return false;
>> +    }
>> +
>> +    /* For the moment, forward the SCMI Request to FW running at EL3 */
>> +    arm_smccc_1_1_smc(scmi_smc_id,
>
> Actually, shouldn't this be get_user_reg(regs, 0) so we don't rely on scmi_handle_smc() to be called only when this is equal to scmi_smc_id?
>
> The other option is to move the check for scmi_smc_id in this function.

I'll move the check for scmi_smc_id in this function and make it static,
to avoid exposing unnecessary complexity to the users of this layer.

Thanks for the suggestion & review.

>
> Cheers,
>

Regards,
Andrei Cherechesu

