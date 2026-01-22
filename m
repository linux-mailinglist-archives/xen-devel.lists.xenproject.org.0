Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMTzCyEKcmmOagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:29:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E466002
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210824.1522431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vissJ-0006IA-2N; Thu, 22 Jan 2026 11:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210824.1522431; Thu, 22 Jan 2026 11:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vissI-0006Fb-Vs; Thu, 22 Jan 2026 11:29:18 +0000
Received: by outflank-mailman (input) for mailman id 1210824;
 Thu, 22 Jan 2026 11:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vissH-0006FV-7O
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:29:17 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9469e9b5-f785-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 12:29:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DSWPR03MB989131.namprd03.prod.outlook.com (2603:10b6:8:35e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:29:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 11:29:12 +0000
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
X-Inumbo-ID: 9469e9b5-f785-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kc8+4HGUOO8oapIS8Ms7+vpARSYiAD7gpv0mmVAq3em2po27h7z85uF0B0gDYXwzsE3mKDg3MCkFfn1eP5LhDgkUV0oLWpdEdX8MU5Pp39YHX/SdyF5WHVcLUm1bg3aOcphS88jsv4q85YYexfG8ibC5qfmbPEYuhf4xw/jJpZIlmKbwFvVkB4nnSrGQ5urvul/K6dLmYc+zQN7/P20IAfk9Drav6m1lhXOjgAUwDC3jftlZDpumXVd2HVf7XIY2cfSaE9Xp0lJ65Ws3MuAMjdk5bPS1ENO2hVYFjGfMDLV6eJdSS+AGIkoygEZLhF91BRlX+zT9UabzgMhTQGRkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gcUJCYdFH8VVWljgHuoSQiTwCh92/y7kYgFfRNKOUM=;
 b=oWANhRousfD1bXbYwqAyLdPvpgfKkfFYTj0VFwCIgDh8qjEGuM3lLI+UvXdmuh/bMYGCJyLaWVOeFp52kDDclsHvinOztIkn60GmR9lnLneI4RRV15ndUqyDf3FVe2PwqauZnNi587pF2FyJWtIsmxm+FaZaRI2zGJxHBjkLVpySG92euF/OJtAhUD3aXvRMC1bJkP19BxDFeJV8K0OL5ClIXxcIHSIRE/TZs6Ry08rZWYU4gJoRNkxX0RBNz1ZqTmaJe/glQjn2PG2lmwEvKHhG8rIico/LEZFtj+l1B5F5N+l21QV607Bskspd29XooVzrbjZzfAN+r4G24Vci+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gcUJCYdFH8VVWljgHuoSQiTwCh92/y7kYgFfRNKOUM=;
 b=IXk5PciCWVYo5zf6WrdanLlySg8Qvla2R3eW40HJBxO0iYysAuiWXAe+f+j5xtCAmgi4riAJO7i8vY2RzoX/OKV7Cuab8vuVvVTj0ExknXr0uMnfvt1oZMuVEgk2ImFjQz4h9jzf7OgyvjNv8VrdqGmtU2/qGD5RgohGkjycrtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 12:29:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 8/8] x86/HPET: don't arbitrarily cap delta in
 reprogram_hpet_evt_channel()
Message-ID: <aXIKBLqGt0PDiEkV@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <37cdba83-9bf8-493a-9a7b-5ec11c32159a@suse.com>
 <aXH6rwF7pJbPpxOV@Mac.lan>
 <72bff85d-9771-4998-bc80-1efe2d453e6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72bff85d-9771-4998-bc80-1efe2d453e6e@suse.com>
X-ClientProxiedBy: MR1P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DSWPR03MB989131:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2c2afe-6e7a-4daa-f1bf-08de59a9777b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TktFbFliVXdrRmQwL1B2WGtzS202L2lYcVlRcG91ZjlqYU4weDJ0MkZOZzc0?=
 =?utf-8?B?SzV0c0RKeHM0cTRCdGM1YkRxZ3FJTWVqM2loUG9YWk5Kc3hDODVNOFBpQkVy?=
 =?utf-8?B?b3M2bzRsM3ArbmZsR0NLQlZqQjczZCtjQlYzbUNDM0UzU2hjL1dlQk4vU0hU?=
 =?utf-8?B?bWY3dUFMTFpNd3BhVm5CZ2hHSm5tUWV6SXBZVlJUNGcxZFdqc3BEVTNKRFl6?=
 =?utf-8?B?WjNDTkJNbFdFWGpNS1FTYldZVzdRNDFjdWk3WGkrczlObzFvdDlUM2pRakVU?=
 =?utf-8?B?UStlci9kck1PY1gxN2xQTmMwNVVTYmFmSHBPNjJabG9WMHJlcFd5Y1Y2Rk9s?=
 =?utf-8?B?TFZOV0xXcFo0ZXg1TWw4MURCWjdTSXkvZUtMS0VkRVNsMmhUWjBaOW9zTzFY?=
 =?utf-8?B?ZERzU1JCeVlXRktnWDdoRmpQYjRIZ1h4d3RGVG5YUGVCOEo0L0xFUXlSWDdB?=
 =?utf-8?B?UTkyL0hmUEducWpITkFUTytzYTRjZ0hyaUVpd2pkK1ZnK0xhWmppTTRGV2Zh?=
 =?utf-8?B?NUR6ODJWUUROS1hFY3dWNkVtSkY5WURkOFRSQTh4SWIzL1ZQMDQzcVNBRmNw?=
 =?utf-8?B?THN1WHFKd3M2dHZiL1laZ0ovWEVKZE0vRmJVK0VMYTBXYk5uUzNMK3NqYkhM?=
 =?utf-8?B?SHllYm81OFpHTlJ2RjYzaDdCV0N1NUQzSzRPVkViQjZFWWRVQjJXcFBZVWNJ?=
 =?utf-8?B?czhtZDMwdlVrVnZCOUFteE1EWGlrZm8vTHE0WWpzR3hlbjBEd1lDbHVqQVEy?=
 =?utf-8?B?Q3JpOG1ZK1gxZnB5NUhlSE5wQXNXMzVuazFqaklCS0s4SXVzQ3phZjJRRVkx?=
 =?utf-8?B?MDBqRUthbEkzdGVseXBWc284SUpyeVVpNEpaRFYxNjR6cnM1ZjNKZ3hZUVoy?=
 =?utf-8?B?Qzlkcm9ETFVndG9mejZLOVRoMjdXUmJkZ3NCL3JCMEI0UlZIRXRqMEFndlVT?=
 =?utf-8?B?UFZQYXB0RmF2UXphVGIrdnZOZnpBZTROZjFxUklpYzBFcU9oWlp4dC80dGlQ?=
 =?utf-8?B?NDZBQU0vNU5zamlIcHNBRGs0czBQdU5HVytKcDBZTDhhS2loZlpsMkZkTkVU?=
 =?utf-8?B?VEJqWkRzNXhJRE8vcElGN1F3MWEvL3UvNDdsODNiVFFLTHovVW4zL3JOTnFh?=
 =?utf-8?B?N0ZtWUJDeGNTbDdyZUhZSkJsVDZjZjloemJJQzROdDNVeUgwS2Z4NHRKUVVo?=
 =?utf-8?B?YkRxOUpITVdRRnFNRVFRSVF5L0lUc29NNHhLeFE4bDRwbmpTczZ1UUpLYU05?=
 =?utf-8?B?Z0lkaXNiVytFNU9WY2tFQXNxQUNkblNURGlYK25rOEFRRU1seG96NlBwWGFY?=
 =?utf-8?B?VC9RRHJzeTRUM211d3JwY25xckFBdnJBL3FjU21ENVhVQ2NOZHA5RWhDUVds?=
 =?utf-8?B?ODlUNXhLVHV4QXRaY0Y2M0lEekI1THl3RE81UWlaRm5jczVGRkRubjlTdys5?=
 =?utf-8?B?cS9EOFl1MXJuR0szL1NkWXhOSmlNeGhlT1Jkdnc2WlFFOU5LMHJFVzBDS2dT?=
 =?utf-8?B?dU9JMlVaVm5qbVJmWVVEUTZRT1ByTnFxTWZpZzdhTUpPUFlrZ3oxVXQwemhj?=
 =?utf-8?B?aTN2V3VaZ1ZiUmFaRHh2aHZTK2pQdjVuUzJLUmlQbENUTEliNC84M1dPcndJ?=
 =?utf-8?B?ZTRWNE5yVzJxVXNsSzI5ZnVXcjhRR1BTOC9kcitmZ09wbUJTNi9xSTZRaFBV?=
 =?utf-8?B?VWpDMEpuM0hJUkZ2eXZwdVdKV3c3T3Rrelo5cWdITEhXUTd6T0RYakNBYmlJ?=
 =?utf-8?B?OGFrMDBIVkZDSGtYdjFkVllndWNGb3lObU9XSFVCSnBpL0JkYkVjd1VSbzdU?=
 =?utf-8?B?T25PekNESktOVVVTT3NMU0hCblAxcDd2WVo0dVhzb2VnS0hOQ3ZrYmdsOWpm?=
 =?utf-8?B?b2N6VVQxSklma2RYUUNKSk5sQ0xYeFBXQlNGZG91cTNFUERuK1pHM252M3JE?=
 =?utf-8?B?NUZLTCt0UjczbGVKVkcxZ05HQmdKdG95U2JDanRQbDRmWkFGVE9MeW5ReE9P?=
 =?utf-8?B?a2lFVUNwenNUVnBmUUVUTkhxTG1aTWNjWk9ObG00bkRWSTBCWDFmdm9URDFB?=
 =?utf-8?B?NXNiZGkyN1NxUmkxS1piNWdxd0dZdUNOU01tSi9tdTVpaW9oREJPUDNxRjJt?=
 =?utf-8?Q?WFgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJwbE1QaFczdm91cksxdTVXbHBDb2NJTXZBU25CNFFpYTBuZVBMYVBrTkhw?=
 =?utf-8?B?enordW03Z2ppSk03V1N4YnZMeklpaXJMdnNxWEdBalhKbmR0RGdqb1dyN0Fx?=
 =?utf-8?B?Ykt6SW43MFRRYVhDaVFFNkpIM2VIVVBrRk9aSEp5WGtiNW1hY1JMVXJoVWN2?=
 =?utf-8?B?YVR6UzBsN3RVOWxXTjc0a2cyanlhN1hicmpsU3RaQmhjdlc3ME1MVVFsbVJU?=
 =?utf-8?B?N1lEU3NTMzd0akgrM3NLUFRzTC83R3MxY0hIM2YyUWZNbGd6Ry9aUHppeGVq?=
 =?utf-8?B?VmNzQlVjTkZsZjBaalFYeTljQTU3YnFreVFJc1VoM1o2Z09Ea2RTaFNsRExN?=
 =?utf-8?B?QURTNHQxT01acmVTb25nR1BTd0l2N2hDWjc4cDFYT1NlN1d1c2R2Q1Y2OGNk?=
 =?utf-8?B?RjBzV2tOaW04blJNZ1FoQU1lYXExYU9xVkM0UHVuTWl0aVBlSWMwZEVZdkVh?=
 =?utf-8?B?RmF5TmQxdGxjNEU5QVMzaVpERUZ0NXp0QWpEM2hyS3ltZzJRNmlWQ3BsaEVh?=
 =?utf-8?B?bFprUk05NU5CUmpYTXhuQUJucDlxYjhZd096YVVlYVVUVUVXOWQ5ck1VTmpq?=
 =?utf-8?B?ZHh2aldBVjR3Y3pHblVLRndCMzFQWTUxRDY4ZitGTGVOQjFTckZZSkdKUjFW?=
 =?utf-8?B?a2E5Zno1UlkyTTFPNmtBWG9pTnFnNWdEZ3lmcjU4QW5Ydm1iTkJOZ3dmQVdn?=
 =?utf-8?B?eDVGNTZwcVdqNmZlYnRzK3d3c3VxWmFQZkdtQ0dxdDRIekVTcy83VUt3eWsw?=
 =?utf-8?B?Ykl3ZkowMUx2NENlcGNudWhIdU9yMEsyQ0l4TEhERjl6enVVT2UrM3FETXRM?=
 =?utf-8?B?RGpSSndGa1FIME5tV0lEZ3U2OUtFVEpMV21LVHllMGczRVg5T1BpUi9VNWY0?=
 =?utf-8?B?cE5wbmVkMU03dnBUSlBmNG9uZ043QkVOSElxVEo5Wi8yMXNwM1VhQ0ZhU3Mr?=
 =?utf-8?B?amczaHRVM25qRVhSa0Y3VGM2Nm5WQkFrbURienBFVnIrV2dQcXZMRDQraGkx?=
 =?utf-8?B?SjNyTEFpbTM3MnhGSmdhOG9mdE9XK2ZSZUczRU9NUWhtSWZtTnpkbjlnck9L?=
 =?utf-8?B?OWJNVnlwUml1dGpWVzI3a09CcVVtSDJnbk8yL3U4aityZFV0YTFXTHFrNmVX?=
 =?utf-8?B?UHRkVGVSSzlJc2JSNVB0dVZSbWhGaWJSSWxZNGpmYUdhRk55OXlNRURjSkNY?=
 =?utf-8?B?RUFpTDNaUEVSaDU2dWpvMDdPU1ZBc25kR1I5ekVTMlI4WXMxczRwTzE4aVZl?=
 =?utf-8?B?ekJKZjF1ME5GeTIzYXVtNFBkMDhNMHJ1RTRNb051RnQ5OFdFTEJYWWYreWtC?=
 =?utf-8?B?ZHdVR1hLeFdhZngycmRzaTV4aXBsYUZDem4zRDZpa0ZhWFdYQitSQzFWcjEy?=
 =?utf-8?B?RzZ3eU1PYlRBNmplK0dZYmtQcjh1UEFCWTlJVlk5QkhHb1pPbk8xM0VEL05y?=
 =?utf-8?B?TG1aVXBDTGZrVk5LM281TjNIZjFaV0NvWjA2K3RsZXFxV2QrM3BsZk5CMitR?=
 =?utf-8?B?KzVGTDV4OW1jVlhtcTFRTDBzZVI5VGJOQWNhWEVVVXFUaFpTNmlMTUZ6WlRP?=
 =?utf-8?B?OHVYTDBDUWx3N3hQZFFrQlc4cUhuMVkzQTJhekpxcjJBR2svazliU2p4WXB6?=
 =?utf-8?B?WjBqK0Z2dTNiVDcvQ1NOWExYU3VLNHBKcXN6Z3BnTUlOVFpOZ2E5eEwvSkwy?=
 =?utf-8?B?UXJqTGNjQ1F2Y2FQMTFteE1DUm9zVEY4WnVYSFpabVFWSFlMajc0L1ozb2lV?=
 =?utf-8?B?UHFQNUo0TUdsUmllelhHQmE1ZmYwakxlNXFEZnNsK2hvNjg0Sk5GUXk1Vmsy?=
 =?utf-8?B?SWVvNmhDWWZUc2ozNzU4WGsxVlljQS9mSVluZXVFbkQ1M0x2SlFMNGREeEdG?=
 =?utf-8?B?aVVaeTF6OWNrdWY2dUdtRzhacGt0TmJnamhjZ1RsOVo5SkNiMG91TkZkOWNE?=
 =?utf-8?B?TG1kV3hGOGt0UU8rd256RXRYdUJXU0NBa2xCSlZDTjZwL1NFTHRxWFhRMTF0?=
 =?utf-8?B?VjByWHczY1RSUzk0Q2NoNGQzOVhZVTkzbTZpclQ3OE14NzBtdUNEUlYxRDE4?=
 =?utf-8?B?c0daMVp6Q0lVbkJmeUJnN3BVRXRZd1Z3c0k3YXJSaG01aVVpa01oam1wODJL?=
 =?utf-8?B?Z3ZwMzEvYU9zY2ZlUHlPTlFQWkFtd3E4dlpnV3hBc3V1SStpa2dtUnhScGVk?=
 =?utf-8?B?SVlDeFp3b2s3dU4vcitiNys1b0F6N1ROcmxCVlBFZWlLQVFtUTVtZC84dFNK?=
 =?utf-8?B?bGJCdGtGZjFOckRZUHNpREgwZmNhVEFhTE1WemxxMnJDb1VKb1N1RXpvdjRD?=
 =?utf-8?B?aTlWUVZSeU5DV0Eyc283MWtVNnBVNG4wSG5uSUppU0NnZ0JkMkZCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2c2afe-6e7a-4daa-f1bf-08de59a9777b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:29:12.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf10HH9Z99KbxUSgT+v/k8LGETLwrVj8dXB0Ma3GHBXdGjmHCEmBJvb71qv9TPec5kcfWLhuQZ0n17HVxQ1TlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 960E466002
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:35:06AM +0100, Jan Beulich wrote:
> On 22.01.2026 11:23, Roger Pau Monné wrote:
> > On Mon, Nov 17, 2025 at 03:40:08PM +0100, Jan Beulich wrote:
> >> @@ -162,10 +161,15 @@ static int reprogram_hpet_evt_channel(
> >>  
> >>      ch->next_event = expire;
> >>  
> >> -    delta = min_t(int64_t, delta, MAX_DELTA_NS);
> >>      delta = max_t(int64_t, delta, MIN_DELTA_NS);
> >>      delta = ns2ticks(delta, ch->shift, ch->mult);
> >>  
> >> +    if ( delta > UINT32_MAX )
> >> +    {
> >> +        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
> > 
> > Should Xen disable interrupts around this call to avoid unexpected
> > latency between the counter read and the comparator write?
> 
> Such latency could then still arise, due NMI or SMI. What's your underlying
> concern here?

For NMI or SMI there isn't much we can do.  I guess this is much less
of a concern here than it is in hpet_next_event(), given the next
event is expected to be after a full HPET counter period.  One of
those events taking a full HPET counter period overlap would make a
lot of others things explode.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

