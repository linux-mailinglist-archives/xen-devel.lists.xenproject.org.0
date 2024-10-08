Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FB995754
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 21:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813444.1226383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFSm-00009Q-PB; Tue, 08 Oct 2024 19:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813444.1226383; Tue, 08 Oct 2024 19:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syFSm-00006y-M7; Tue, 08 Oct 2024 19:01:40 +0000
Received: by outflank-mailman (input) for mailman id 813444;
 Tue, 08 Oct 2024 19:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+lH=RE=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1syFSl-00006s-4G
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 19:01:39 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be327530-85a7-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 21:01:37 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AM9PR04MB8195.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 19:01:34 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 19:01:34 +0000
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
X-Inumbo-ID: be327530-85a7-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja6yOzS7SdqpNOeo6DVMeoZAiirDb4AW3cFEgR+7uKj6G5ACC07sXrSWc5qI5b90gKk23ZEw0gLrftCEtU6LUsh2MQn/gbF7wekIurpNVnS6m5ZOxLKEMOx/J5GQZ0P/XB0Z8LTrqmuF10k8Ds+JfQDk+ncES2cXsqroWdTA9fIYNhPghDRdyeyJUH1Njk3SdmV2xWqYUUlDkchnES+fmRizb1759FYzpqHrpcqAg5XXOGb4Bs9hV2uUUyGQs9qr7dhati8kosArmVcMezqOfNZhzV2SJXSKYFPWRpCXZxu7WqRTqJ8MXlNdZt51zOrcH2aYGQE3Wj5M+mJl8BiQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB0b58nhZd8Oe98Fpia3j+KtkVGRk++7n4rLdu9xkrg=;
 b=Bqo+wAhNIdBXTfR+j4DpNY4v+p3YavWr5fQEdE1hEpy2TBHOCodSVrJ785dZ922aLPMfHP0mcYYqetntavWLxLuN5zjK0vo7YsK5wWOF22Dvk7Cl2P5yflxD3EWb24PIfLUo+Y8tzGXSuNEcLdofMWCVQF9BDy/kIDmzrb2VdZmmHsP5Al385LlkDJCKgTeHUHSaLfAdWwR3jYrhYGDY3PH5N9jTOw0LxhKj42HmWYN8fAhYyKSTj1Nb8jPnYk4JvYBNTxcZVibU2AE60HGsKw9PZF0Vt/oUKtB8rlYiUD1rFkhfw7xMM814EOW16vN5BkM0P1uNTFYBiO4i+5o6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB0b58nhZd8Oe98Fpia3j+KtkVGRk++7n4rLdu9xkrg=;
 b=jEdKhF9T5PwWSA3Uxb7C13uN337bgUyyUMbPVWWFIoOxcA+9i56EdjiqiU25zhoaBEJPG5cZ5YLBOIB8JDG2xD22yyp229SGx+uXRyzQWGrEKG1A96tge4rSEwkqwYEiQeQ3X0aLQf5iBRejQl6OmTvUPUFel6owH6g/+uhF0foMatg4flPCkXrDMxMzlUYN6WUkhN5tAMECgcQxH2Dy1/mRiIAhofo26o5dVeHEp6EKo3Q1P/tPyknSzumifNdmb7pBuZKRcJHCuAHTDhv4qMPgfvC//9Y5O2L1QwvBb9O097CgHJGhaG6j7YaJvanoYxJOJqchM9yJrxyWe78X2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <1de8ea10-f801-45b9-ab6a-25465ecd6b76@oss.nxp.com>
Date: Tue, 8 Oct 2024 22:01:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
 <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
 <b8419295-cc63-41b3-9f2d-277d81e5f85a@oss.nxp.com>
 <a24807bd-5224-4110-bc0e-946287f5c90e@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <a24807bd-5224-4110-bc0e-946287f5c90e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::7) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AM9PR04MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 83596c63-79db-4230-0c94-08dce7cba09d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHJsa2ZXNDBZZXQybno4RjIwaGhuMFlTMmVCZU1yU0FkRHVidXdtZnU4dmQw?=
 =?utf-8?B?VldMcTBHbzhMYzZBNDNCUnp6K2duRkJ6Mm9IUlBQWlk1MnBaNi9Vc0ZUcmUy?=
 =?utf-8?B?Y0xOeC9peW44dmhSRlo2UlNrUktDQ1o5N1ZObFY5SVZ4QkNaMGF3enAzaHNu?=
 =?utf-8?B?Y0Z1dXNiNktISVc3VDUxTzAwdVo0QUQ3d01aWkR4eXRTWld3dU1qL0NpT283?=
 =?utf-8?B?MVBLcEZUVXlxVnYrbENUTHFqdzQzNytLQzFOZWRpeC9YUDdDZXZkdE9aQ1ow?=
 =?utf-8?B?YnY0TGQ2L0RhSmdIWVBEYk1BUUJnYWRuY0QxcmlpSndYckQxR2VKeDBESitv?=
 =?utf-8?B?amcxVjFLeUF5YmNjSWZvQmUxV3ViZXBpTWFaN2ZtMHVHZkxQNGYxaUMraW1a?=
 =?utf-8?B?d1BERkZPN2gyOE5ZUVlYREdBbC9xQVFGejVHRmc4RlJkcGhPNzFDYXYyUWkr?=
 =?utf-8?B?QkV2amZMczZoakR1bDVLS3ZDaHY3c2NNR2ZFK3ZUL0dOZ0xwWUxyaUhnR1RE?=
 =?utf-8?B?NFd6SGp3MFUrMlBkZHZta2p0d3dJT0g5c0E1NXlaTTlWM2htN1ZvUUNUblU1?=
 =?utf-8?B?N1dXeEJ6a2h4Vld4M0I1b3UxWDByQ09DK05qOW9hMFhTcVNGcnJmLzYxMVps?=
 =?utf-8?B?MGdwMkV6QXFrNEt0TUo3TlNEaUZLMExPR2szMyttTzZ4bWNFRkxSS2hiT0hw?=
 =?utf-8?B?cDAxaW90a0RCNzI1RWdwUTIzV2tuRXFIR2pHcDYxZndxc2t5Y0U2TUIybU1V?=
 =?utf-8?B?dy9Lb3JMa3F3aklHYlFmdHBYNGd2a2ZOWXhlNjd1T3BYL3U0ZTlRcUVzOWhO?=
 =?utf-8?B?S0VaYnQ4QWRML01zMS9LTjBoUmZGNXhKeFR5M0Zna0JSYzY1bWdaYWs3cjNr?=
 =?utf-8?B?b2RrZXZQNXovK3BnN1FJenEwWEpPNFRZakJPZFg1czlnSHZyVGhJVnRSSGlx?=
 =?utf-8?B?aU13bjdXQU9yeDgvK0NMZElVNFdxa3haeWRUekFXK1pXTnJlZHZXTldJYWJM?=
 =?utf-8?B?cVRjZFlDQ0N4Z01mOUFvT1Y2MitUOW9SRHRNN2swdWt3d0dCeHc2dG9IV0Fj?=
 =?utf-8?B?cGlFOEI4QktTbDJxeDA1SnVTSXNzTE1kNFJNaWlZN05obTNCZ3FsbW1JR21Y?=
 =?utf-8?B?Vjh1NzFYZWxSZy96U091bVUyOHVrQzEyTUVPUVd5SzEydXlseWk3d0lGS2RY?=
 =?utf-8?B?c0pvdVhZRmxjWktDQTlrUGt4YUhOWnAvR3VlaVVDWks5SURVQTNUQXpqL1pq?=
 =?utf-8?B?d251VTJWTmoyZ3VXdU5lcndOOGh4UmZjWUtCNENVTGdoVkFJeDRkZWhpNENK?=
 =?utf-8?B?THlDTXBmdnJiWElNLzBTQTFCRnhNcERZcktTRHM3TERSTG5IN1VmZDUrRllm?=
 =?utf-8?B?M2xEMkQ4bzFZSldnOG5hL1hvdi96S2NGbmZtNVQxK2FUKy9sdVpRK0h5SWs2?=
 =?utf-8?B?N0d1am93SG9wamJhcnh0V0o3RWF2K2dUQmwrS3h4d1g3TjFvaFVCaEJ2eXF4?=
 =?utf-8?B?SjNDd2daTDVvWDBteGt1Z3lydmsyM205WGFISnJ5ZHRVWnR5VTlzYXQwbWl0?=
 =?utf-8?B?Y2NSYlJ2OEFoMkFMTXRIMHRQV1NMR3gxMzRGLzRiWk01NmdJRHVCN1VFYkNa?=
 =?utf-8?B?VFdhNHBQUlhnZWpmOUJHUVpyVXpFcFlzT0M2Y0V5djVzbDZtZnFleUVORzdQ?=
 =?utf-8?B?dWwvZXI5cElxNXQyL1ovSGpJcjZYM2NRcnZJNU9pV1RpV0tNc2xEV2NBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFM2bnJaV3BXMlZ3dlU2OWZ5d2pKelNNR0hjNjNURlVmYW4yRkZzc01lNW1C?=
 =?utf-8?B?bGlsc2x4VlNadGdOcHpReEJ3RlJQdjBCUk1GdktVYnlnUzliTnBUcVQyeHY5?=
 =?utf-8?B?TUJ0ZWZlNTFVbVZPVEwvL3JvWDFWT0g1a1VmQml4OXkvSk1RcHNvRHYwSlZI?=
 =?utf-8?B?alFlR0hnUjlTdjdFOWpYTUN2KzNVZnB0NjAvblUvTjNWaEVSOGEzdmIrZXlE?=
 =?utf-8?B?U1l4bHNNRW5tMHlDSWZCRmw1aHRPK0g2ZTNEQy92bVdNN21uQmxvQ0hHbGlW?=
 =?utf-8?B?WThhNFBWZ2FzaFhvck9USDBoU3dOU1BUamsvVjZoMnQyTzJvQTRnQ3hqTURh?=
 =?utf-8?B?cFBmNUtMYlpRQnRXQW9Za3dXUkUyZDVKRjZHUnNuRWFVRXoxREtFQVUyNDhq?=
 =?utf-8?B?SjQyMmMzNEIzY3JGdFFyVnFKVEZCNDRnUi9naTU5VWxvQU5lSStYLzk2MWll?=
 =?utf-8?B?VTh1ZThWSjRRZ1dkMVJXWFlFd29XTDQ2OWNGdVlDdlhtV0w1MGNROEVlZ0Rw?=
 =?utf-8?B?a2VYay9leVRFVlJQMnB6RXVkQzBQNGNDZTRkZStOb3B2aTZmejJrcG0xMW1E?=
 =?utf-8?B?ejhNSjY3cmJOZ0dNNkQwOWVxTHNmOVNnYnhUMTRyZzJpNUFRSHpvMVoxWnVH?=
 =?utf-8?B?U0pERW1xSzhvMHJHU0h3bEl5bU9ZWWxuQkhiaTk2eVQzMDU0YXRVTXlVdDBP?=
 =?utf-8?B?aFdhNWlHQnZpeVA3NTJLNXdGSThFZmticS82TEVPbDZjeGFidVpJa3dwMHZT?=
 =?utf-8?B?VVI3ek9OVDQ3NkRKemNRaWxWMlpiai95aFhKQW1Veko4QjRqekdkdHROdTYz?=
 =?utf-8?B?VVN2ajRaaE90d2N5UmhoTnFNUU1oNDlMUlkyRUNyVFpOQUsxZ2x4eFFqRDBF?=
 =?utf-8?B?Wmp4cXYzNFREcXJSYkcxZVVIcGV3M2ZvWjFWeW5UZHl6UjNhNGNFdDZFRXM5?=
 =?utf-8?B?VHFVbjJyNHd3dkdYdUhtSTRIL2IvWUR4V2o0TVhLcnkxMWsxbE41OVI0SWNa?=
 =?utf-8?B?TXd5eWVNaGFOOXZFazJXallXZGJCWEx4OVljSkRjMGlzc0d6djNuU2RNRDZt?=
 =?utf-8?B?MDFVKzZtVG9IZ1ZOeGVIT2poMVdNdVJ2UUxXT201dUIyV1lmMER6MGF4eU4x?=
 =?utf-8?B?NzRKSm9QbUlPY3ZXY0QxMDByWE9lM3pEelk1Q0hEbVF2amRaRzlGeFFKS1Vv?=
 =?utf-8?B?U3NJQ01vd3Y2TDhCT29QQTRheXA5WkVtdUZFNFc5UEd4bFUwTTdaSnpESHJs?=
 =?utf-8?B?U1pnRkc0RmIwa2Y0RkJ0VE1tWnJXSDVvR1hHZ0FKalFHNU5vWm90SDc1R3Yr?=
 =?utf-8?B?TjE3YUdySDJKb1BMdytvZ3U1Y0x3cXpLUkNwZ0tYV1FTS1VNdUhRaTd4czZY?=
 =?utf-8?B?cFJqSXJGcXVkU3hDL0JOS1NpaE50NGNza0VwTTBRMGxyYVNxM1Btd0FUZDQ4?=
 =?utf-8?B?bWdIRk1MWmJTOGFyWEJUWWU4T005Z1hHYURJdUZmaENwTDR5NTg4QlBsUlQ5?=
 =?utf-8?B?R1N4a0ZMcHV2UldFMndlOUh6NDFnNzR2UnFUZkhPeVJaTEl5ak42dG4vYUF6?=
 =?utf-8?B?T0g3NUQrWTBYNjdYZy9xRGU1WHRKa0RWaWhkTHRLaTBPalBFVXNWZUY5Wjhj?=
 =?utf-8?B?T2pkSlRjUXY2NDZPcHJ1Z2FleHlnemhIUjB6cGx6VGliMW05U3dqRmlaMVpL?=
 =?utf-8?B?dW1ob0dIckh3bGppNEJNY0dMYmdQMzMyVXpjZVd6WEZERS80bEQvM2xQZUsz?=
 =?utf-8?B?bVpsZkdCSjRhWnlvUFNYcE5KM1g3QjRCTXVtS01haDlaUGNCbjJFTUxxSy9G?=
 =?utf-8?B?SWxtV3AwKytVVHFuWlI5NlJqZGhnNXRVeHR4NTdhcFdFdTVDNU5Eb2VyT2gr?=
 =?utf-8?B?SkZqTFJ2dmFRdDlDRGhVblB0UzdIRHd0ZnhUb3lybUJqK2tUNzdTKzFoY2Nm?=
 =?utf-8?B?Nzdkd3hPcENuUDYzaTZFdHYzdUN4VDZWSkVBalNqaHRnaklSNTZ6eU1NMEll?=
 =?utf-8?B?ZWs5Umg4VUVYdEZaWXN1RCt2QW1GRXpjeEpRSHhEL3FmSGFMZlJCbmdHdHVK?=
 =?utf-8?B?U2g0K2sxMWFndWNyY29oMmlsU0pHRVJxT3hHUmI4SndSRXVPaUhSdDNpOUN6?=
 =?utf-8?B?VjBHcy9PdHJzUlJBWElWaXl3VVFpRXh3Uk81WWNzWCsyWEJwYzBuTGt4Q0Jh?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83596c63-79db-4230-0c94-08dce7cba09d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 19:01:34.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+dC2W1+hIx59TVmRebzd+d1GgAcAn+tLh3ebek4/wk9N4wW2WmPwNcjqxUQQQ6Wc3RQufM6UpWF2DJf/bSMIdK9SQqNQkB/XqHmwqv6lrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8195

Hi Julien,

On 04/10/2024 19:24, Julien Grall wrote:
>
>
> On 04/10/2024 16:37, Andrei Cherechesu wrote:
>> Hi Julien, Stefano,
>
> Hi Andrei,
>
>>
>> On 01/10/2024 13:01, Julien Grall wrote:
>>> Hi Andrei,
>>>
>>> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>
>>>> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
>>>>
>>>> S32CC platforms use the NXP LINFlexD UART driver for
>>>> console by default, and rely on Dom0 having access to
>>>> SCMI services for system-level resources from firmware
>>>> at EL3.
>>>>
>>>> Platform-related quirks will be addressed in following
>>>> commits.
>>>
>>> I don't see any specific quirks in the series. Are you intended to send follow-up?
>>>
>>> [...]
>>
>> Well, we could use an opinion on some SoC erratum implementation
>> and if it would be acceptable for you or not, from any of
>> the ARM maintainers.
>>
>> The erratum is about some TLB Invalidate (tlbi) instruction
>> variants (by Virtual Address) which are handled incorrectly
>> in some cases (for some VAs), and that need to be replaced
>> with broader versions.
>
> Can you provide more details:
>   1. Is this a processor issue?
>   2. Which VAs are affected?
>   3. What is the impact if the erratum is hit?
>   3. Do we need to do anything on the behalf of the guests?

Sure:
1. This is an SoC issue, present in a subset of the S32CC processors family.
2. VAs whose bits [48:41] are not all zero.
3. Well, TLB corruption.
4. There are instructions affected at both levels 1 and 2 of translation.
The guest will have to work its own way around it.

In Xen, just `tlbi vae2is` (only used in flush_xen_tlb_range_va()) seems to
be affected, and if we go with the 2nd approach from the ones proposed,
it should not be very ugly to implement. I am of course open to any of your
suggestions.

>
>
>> It doesn't apply for all S32CC platforms, but we can use the
>> Host DT compatible to identify this. My idea is that we define
>> a platform quirk for this and check for it using
>> platform_has_quirk().
> > Then, we either:>      - modify the definition for the affected 'tlbi' variant
>>      in arm64/flushtlb.h to actually execute the broader one
>>      if needed
>> or:
>>      - define a new wrapper for the tlbi variant we want to
>>      replace the affected one with
>>      - check for this quirk before its usage and call the
>>      more potent version if needed (there's only one
>>      occurrence of usage for the affected version).
>>
>> Number 2 seems better to me, it's more customizable and
>> it's similar to the existing handling for
>> PLATFORM_QUIRK_GIC_64K_STRIDE for some other Arm platform.
>
> I need a bit more details first (see my questions above). But if there are not many VAs affected, then we may be able to re-order the Xen memory layout to avoid the VAs. So we wouldn't need any specific change in the TLB flush operations.

I'm not sure what to say here, we would need to have the layout
limited under the mentioned VA range in our case, right? What
about the GVA layout?

>
>>>> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
>>>> index bec6e55d1f..2c304b964d 100644
>>>> --- a/xen/arch/arm/platforms/Makefile
>>>> +++ b/xen/arch/arm/platforms/Makefile
>>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>>>>    obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>>>>    obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>>>>    obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>>>> +obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
>>>>    obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>>>>    obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
>>>> diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
>>>> new file mode 100644
>>>> index 0000000000..f99a2d56f6
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/platforms/s32cc.c
>>>
>>> We only add a new platform if there are platform specific hook to implement. AFAICT, you don't implement any, so it should not be necessary.
>>
>> Like I mentioned above, there's some erratum workaround which
>> could make use of the platform_quirk() callback, that we want
>> to send in the near future.
>
> I think it would be best to introduce platforms/s32cc.c at that point.
>
> Cheers,

Thank you for the review and suggestions.

Regards,
Andrei Cherechesu



