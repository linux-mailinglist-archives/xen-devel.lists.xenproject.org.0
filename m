Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPKrK0f0iWl+EwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:50:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7932111135
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225524.1532049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSau-0007fr-Ra; Mon, 09 Feb 2026 14:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225524.1532049; Mon, 09 Feb 2026 14:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSau-0007d4-O6; Mon, 09 Feb 2026 14:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1225524;
 Mon, 09 Feb 2026 14:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpSas-0007cy-Or
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:50:30 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabb2797-05c6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:50:25 +0100 (CET)
Received: from DB8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:110::34)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:50:16 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::ed) by DB8PR04CA0024.outlook.office365.com
 (2603:10a6:10:110::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 14:50:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Mon, 9 Feb 2026 14:50:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAXPR08MB7368.eurprd08.prod.outlook.com (2603:10a6:102:22a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 14:49:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:49:11 +0000
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
X-Inumbo-ID: aabb2797-05c6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h1sVCE8JOJDmilegjWstnRxGc90PUkgbglqwD1iQQRHiKmMdSZfHpXZnSKuLLbCHc/f4ypAD0S5eDoazAE88vqG42UJXLtz3T+L2CVe2Q/o2tASElo0aG6kCSlpW+KHDsVvGvSAhr1IzwVmCOOagHoIDpnRB57S07HxhwOTvgkYzJcoNu2uptJoUGlm7lySTuqw1jyRq2JvFMr1NHvvuspDSE9MHseBMcb8Ty5x/LIsi57I4G1ApJdvazuXeDmwyr1EmvhQiYWTWAaVhApvdLkg8U2e7qQJTxQAocppUb9MsPdZqAvCrisok/9qtbohv76DZfg17PoH1vRJewtgN8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFRsJIcE+DDKh+aEtOye2DuAMHliVcmI53HOEyXt+T0=;
 b=yRKmXBBfzg11VfUrbfGY8MjQPKPLkhnLomXAGtCIQzfiMfZiRaLRnJnaYzCEaF7SgF8RXniWdf9VqrFDL/B5LyQpvtNtI9a/utx6Xi0eBJu0F3eCBGJGNvPMJIhsU8Ppm5iSX8znlsZ7jMZInPj0RAFn2V1qNob6VVwty9+9/j8ZNYn/xc/lDF2q8ACDhdC9Ud4XeD1Ff3OOZpkpUn8qyeHuGby2EWSplEYq3bTZHSbl7gO2YjnVx04NPfpdzCtL/SodAd7FPJPv1iz+YmvJNlbRjT/zR04uQ7VUU0AYHwpRyTYUVMERKXHsiAHrII983TkEM1PQVEBwIK1IREjAzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFRsJIcE+DDKh+aEtOye2DuAMHliVcmI53HOEyXt+T0=;
 b=F/72UG2Hr5AEO1xWP6aBgqi6kTXK98RNh6lvQQFdVHPFnTbCo79AEu86jNaXSe/WTZDMn6acS6/aThQdaiE5ILLNqtvSaZNa/6xe2BaS6h8zOxK3PHImIsvl4pCPv9wjWhyAu14WEOyabccP/N0PHD2RUy9wSu5/XVkrmC7qvTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po7/fZAddu2Vf8jbXBG3Y0UJ5oFgcr2fHej1lulXCksoOUrMlxVdIQj+kU14lKqKXrnI3UNwzI8CV/2MrBo3ALlXwHsLCY5gpIn7pQsvpXwDRD73cufwy684saFDX5fVV9hPeOuzwMF332KTXRDeprhYkd70R4xxPNdWw+0imj8YORiUe/9Vt3qeriU7D7KMPfiRbSZ7zFCQ38dw2gbxXy1nRXct/gmQADvxx9jwJu/P3i8eE0GN8r8rQcI7Y4sDnoqJ5W8/GGwqu2i8TKmbBuzNqlAx/2pFDibHl76aewe7TON5mA/GbD5jvd+tHzpKjzhMXcXDzm9sxPmVM2CoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFRsJIcE+DDKh+aEtOye2DuAMHliVcmI53HOEyXt+T0=;
 b=K0ArB/lI1MYGeBz8OUmHeF7PveEMJQhYN7EDuzRPVmdNCQjeMH/isTjEIXY3iJa6XGiFQ5DR1lk5tts9+6Q1ypdabE9Db5aztxm4fi51tyHxo0KOOuSp9Im/5Bz8AT+C5EHkvK1Y9gr7YgjrJpJ/CzFbB6K+ItMGXNKNeUzieraTjXoCeucjdCUD0dUjd49EKcajIOGSRy1vSTl29cXhlDGHho+RQH+k5BIdz7MwtHmLc+sEmR8ifc5yeqt3s+9ASoK5l7Da2r60FWYfFEpm1rPixRYEY90rRT9Sk+HfWcsRQfu05Af6ozM+i9m385RUOoUXizWFX7oSiZLA0kDMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFRsJIcE+DDKh+aEtOye2DuAMHliVcmI53HOEyXt+T0=;
 b=F/72UG2Hr5AEO1xWP6aBgqi6kTXK98RNh6lvQQFdVHPFnTbCo79AEu86jNaXSe/WTZDMn6acS6/aThQdaiE5ILLNqtvSaZNa/6xe2BaS6h8zOxK3PHImIsvl4pCPv9wjWhyAu14WEOyabccP/N0PHD2RUy9wSu5/XVkrmC7qvTU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory access
 descriptors
Thread-Topic: [PATCH 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory access
 descriptors
Thread-Index: AQHclTP/RUvXxHHq6UOIad3SSLcFW7V6O1CAgABAvIA=
Date: Mon, 9 Feb 2026 14:49:11 +0000
Message-ID: <1A922065-D0DC-4930-806C-6C202B5A6957@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <a8d316dbdbd00a7980c6d527038f9046bb895c69.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44HZ59JC2X1p0GWGN1TVAoGo9K1emVPrBQon4V0VT960YA@mail.gmail.com>
In-Reply-To:
 <CAHUa44HZ59JC2X1p0GWGN1TVAoGo9K1emVPrBQon4V0VT960YA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAXPR08MB7368:EE_|DU6PEPF00009528:EE_|AS2PR08MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: eb01c2dc-4bfc-4ea5-6a71-08de67ea897e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?a0dqd2xBdUJBWGc3Y3NoRkJtcW1pMU93RU1velROQ3FLWDVTLzdwWXVheXFB?=
 =?utf-8?B?c1pSUERWT0pvWCtFTWRKQ2N6UUljaW9oK3p1b2JJMVJqeTBocG5WWExOZzFL?=
 =?utf-8?B?NUNicW1CeXI5Wk82b09GMDlqVnhxWnNoYzZHMmJJTjAxT0xKbHJwWis2VUNa?=
 =?utf-8?B?aHR6MllzekhHZnhlSzk0QVF2L0MvWmdIaytXQmJLNmpnd1UrOHpvUkRNYlRV?=
 =?utf-8?B?QndxREx3cE1TNkZldEUvZjZKbUVOdEl6alpUYTVKN3lGRS9KYmpsNWlvbkt1?=
 =?utf-8?B?OFJpdjhsSkxkVnJsaVZNMUczTU9GWlNNU0lzM0o1dDJoMkZMUEdaVlhKSWpa?=
 =?utf-8?B?WVlYSEdDTnJEN0dqY0pwVmJHaFJGbXRqV1JybXhkTENVU29rbC9YWlVWaGF3?=
 =?utf-8?B?TXhDc1VqVjR2bzFoNTM0aFMrRXFiMUdQRW1kNklWY3orUEtOdThwNG9Zb0NW?=
 =?utf-8?B?bk5JOU9GZlZuOS9oR1lXcmNlTS83QzFqOVZZb09adHhDM2ZKczlOaHBReTB2?=
 =?utf-8?B?ZC9IVzhIMWtCS1hnUE9IK0JaOVhVN1BRNm9sOEZqY0hhbkxWQ0Fob2Y0Tk02?=
 =?utf-8?B?c1dYcVVBUEQwbTlhTC9QNjBJRU5EdG9wSmZWVDVkazJRMU5hZnRtZFYrVHBq?=
 =?utf-8?B?eTJ4bFIxOWdXOGRFNjhFeSs1TFVaQzBzRm1KN25lUWpPNzI2dUlHZDc1TlFH?=
 =?utf-8?B?TmRHWHg4ZURPeXVTQkhKRWZWenZvUmRocisyUmZ1MkkwbkZXV3RkLy9UVkJq?=
 =?utf-8?B?RXIxUEh1cUNaSFhiWUlVMmNEdUo2S2piOUU0eW8rWklJbGF6cDA1Umh5RDFZ?=
 =?utf-8?B?QTBWOWNkYU90YzNxcGd0aUNEL1lXc0JlNEdqaUZac1VQZk1IQSt4UFR6dXdW?=
 =?utf-8?B?VzJPemNJeEtuaFh1aUVVL0ZhSlhqZTRoUWx6ZFRwWWwwVytXNXdZaW42K0RY?=
 =?utf-8?B?MWN2Z09lSFJjcE9PWTA3RnpWWERKdDFaRlRLWEhHbmF2ZEtlR3V0NDBtb25I?=
 =?utf-8?B?MVJsNlRtSWpJZ2NMU1VEcE05M3Z4Q1ZrcWUwbEFsWGhkUVlrdVNmdGRzU2Fz?=
 =?utf-8?B?UVdJaXFvWUpNLzl3WllSUnBlL1FOSVZvVnQybHl1VER6WHpMc1l2OUNSeDho?=
 =?utf-8?B?bDIwUis4eWhkQWF1dE5Lc3EyUUpVYWVtNDJJNzR6bWpVK0tVRzJjNDRPNlcz?=
 =?utf-8?B?bjdtbCt1b2pVeE5hMVZIQWhsTFNmWHFrQ09kT3FjaEdEaXhLN3FndTU4WEdi?=
 =?utf-8?B?aXJVWDVYcWg0UlJ6TDgwcFpDNmpNMXIrRHRQbEd4WDMvakpmSmVCYTJsRjRZ?=
 =?utf-8?B?aEc4dndqT0U0aVNUZHJ0MjZ6VVJEbCtQWFVlLzFwTGltU0pJY01jMW1DYnV1?=
 =?utf-8?B?WW9ZbEI3djVsS2h3cEJqd0RxS0VJbGVoTW1KbjVWU0h0eUJObEJWSHFBYUNG?=
 =?utf-8?B?MlRwQkl2NkVmL2VySmx5NEtFTmxkN0liZFAzTE5oMVZXNzV5cWl5NGNSNlE5?=
 =?utf-8?B?b2NDTXRtM2p5N0hUaHk0ZkttRm1hRVZwWXZvWEpuelhDejlVbmlMaktmcGp1?=
 =?utf-8?B?bXhaWEJhcFI1MmZVZm9pUXMvNU5CN0YwRTdoemk0N2s3cG5jVVluNVJmV0RE?=
 =?utf-8?B?YU1EYUJQK2JneVFoL1dCLzVHY1lqK08xTnk0TEFyL0Noak1ZTHV0MnZYeVNZ?=
 =?utf-8?B?K2JxSlR2Mmx1R0RuelVYTEl4OTNyUTU0c1hVT2o4SmJxMzJTMFN1ckdiQWpQ?=
 =?utf-8?B?NEwyaGVLS1Z6SEZkdHlsN1M3eHJScG1SZTBTYVVIbmpkSGg3VzVmbFNvcFF2?=
 =?utf-8?B?Z2pmK0hDR1pwcEFUWXJNbGVyUUZvY2NZOWVsYldhd3U4Ni9QcjdjMHh0Mzl5?=
 =?utf-8?B?NmZQRlVoMUU3YnpDQm9vVTF0emZCNi9RdFJZeUd3MHpPTWZ0SlJjaWdvV2t5?=
 =?utf-8?B?MmkreU9qcTIwZFlLVEdHUGM2dzBjbEpSSUIvbHVONDhlc1lnZ1RUUFBncE1C?=
 =?utf-8?B?YS9zd1FuQmQ4STk3QnFIcWIrSzdPbVFMRkh3bnhTMksydWtZNjhFMGczdnIr?=
 =?utf-8?B?Vkg3NVJYb09ESllSb3VhSm96VFJuMThwV2NkRjQvOURoUlMzUW1tMGRhejdk?=
 =?utf-8?B?MkdEdGcwdituWURkU3hYdXhFUk5wc1NwakovM3pHSS81YmN4c28yblZmYnpL?=
 =?utf-8?Q?9CZu9lMWPwa91AkagDWI08A=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06AA036A92A0DC4BB4AC8BD13B6233D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a4a799e-038a-4d9d-3d82-08de67ea634d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFh2aFRHcnVBdzE3RXAwNVNZSXNNTVprUWJMRW5rN0dvZHMvNnpEdHp6YUpJ?=
 =?utf-8?B?TTNBWVhRS2phNENCMjJ3ZCtsNVJURDhHZGwwVldVMlo5TEF1cDdvOGcwQmZ3?=
 =?utf-8?B?TXV4UHVvMUR4czZFYWJNZ0QyMU5GYndkeUhOcUI0K3JZL0NDN09qYUpYOGlY?=
 =?utf-8?B?cjN5am9DUlhOZExNM1kxamxaM2ZNaXhKbWlPS2Z6Tk1GTVNTdTR5WXhZdTN5?=
 =?utf-8?B?NEJqeWNJSGIwUVBYSCtNN09YOXBzcXgxeVNpQ2FVZW1CRy9jWmRkMUJZWHdr?=
 =?utf-8?B?VjlreHFuZTYvdUZ1dGxHVlBsT0ZvY3UzVGhJK2plQkpKZ3BKa1k0YkM3MDFD?=
 =?utf-8?B?dmFmOU0vRXlxMnhqN2tkMFVGa3E0L3VId0IwMUZ1eVZjelVDM1llRUozbk5Y?=
 =?utf-8?B?Q3pNVjREZm9qeVFJZ1RmUWYxNldNZXpKdmN2VDhDVmtUUHpDWmRGU3hlMHRm?=
 =?utf-8?B?UU5MUWpSY0ZKTWNPSDNweUk1cGhhcXlwOWxtTG96MktZMlRoRDh2dUV1T2Nh?=
 =?utf-8?B?ZHlESTFDZGlTMk1xRWZOTkZ5K0phdHVrYzFRMG5vK29NdE9za0lXaFBxYTNh?=
 =?utf-8?B?ZEJGbi94SGRDRmV0Nm40ZklKTmg1NVFMZFp0Q1VmdlFrcDJCamhZUy9Ldk9v?=
 =?utf-8?B?VDhlTWhNbHptR1RJNHR6NHZCcDEydExIeGZ4VWdWeVFzaDQxYkVhdGJxWVlM?=
 =?utf-8?B?bVBHdE9TbXRjSUxaNWZ1Sk1ncUR3dWI1eWR1UmlvaFZLcm13ZHFBa3pRbkor?=
 =?utf-8?B?KzVkSjBNL3Mwb3hkVTFrQlk4UnRsSE11SHpFR0VQbFVPWjZ2MVpJRVhxaVNO?=
 =?utf-8?B?RHVzeXpncXMva2RLV3lpUkJJOFd5RDVtM0hJSVZ6bXNEM2NSbWJKM0V6dHNG?=
 =?utf-8?B?dmxkNTVkdHVuOURzVjlqcE9PNTFZUWVUT0d2TzZhYzJoc3BPSS9QeUNvdk9o?=
 =?utf-8?B?VEFNc0VlcHRLbHB5TVhDa1hJdzZsUjBlQ1lBUURlckRXS0pSdmUzdjg5Q3Z3?=
 =?utf-8?B?Nnk0MHlxSE1NQXNRc1FyVm41bDFnNW9nQmRJVitmam0rdzBBZVN4ZWg4SEVp?=
 =?utf-8?B?Qm5sZmhBZGdpRGgwOXY1OVFFMEtTVVd6U1g5Y2I1Nk13SmF0SHR6TzZZQ0I5?=
 =?utf-8?B?aDhkaWdOdFJ3OVZTYU9HcWZiN3l6amxUQlIxSVMxaldYQ1VhMnpNYWtUMXpm?=
 =?utf-8?B?NThBNHVaRVNDWTVMQ3hLVWFVSGtJb1pEc3U5UkxrN2VwSkZnbGc5SzdpK2Fj?=
 =?utf-8?B?VkwrejdDa0lKRHFMRGJvc3lUVWtZbGRld3VITERxZklUWStkSWVJdHRiaW5J?=
 =?utf-8?B?NC9GczJwY09oQVA3MCsrQXpqMU54Ym1WUmg0Z1g5bm1walRwN0RGSWlMSi9t?=
 =?utf-8?B?S2ozcHNUVHoxR3k2a3Z1amEzNXQ1RTZUZUxkOWRJRjhWZ1pQOS9hTTRUUVFN?=
 =?utf-8?B?cEhlbUkyZVN3YjlrSnFPTUpXNkZIckZOME1VYVg2b25IMjNjWEFTQmc2SFN0?=
 =?utf-8?B?M3RFM2xidG1YemtkV3JYVWRsKzUwWmp0RWlOZGEydjFVQk1uTzJ5dHdMLzdO?=
 =?utf-8?B?RFBJVEo3akRKd1ZVbG1JZVMwWkhTVE5CZWw5ejZFamE1ZFVub3hZc1VXNWtS?=
 =?utf-8?B?RGZHdUE0MEtwdVRIc0Z3MEwwTVEyVldBOGY0NUZCMVB2b0tCQjlmSmpSWXRY?=
 =?utf-8?B?bzJrNHVXSndrbmxYa3R2d0ZoRDFIWW9SNEFHV3ducDdLZjkvM3dQdmpxeW9K?=
 =?utf-8?B?RlQvUWVXMld2UTZjRVAzQ3BRclZLaFVhcXlEQkV2V29pODFjQ1BvRHYxcFRh?=
 =?utf-8?B?K3hWeWVxYjF6dVBXZEx6WmlmSzZjdGdhNmwvcDNBWDFJeFlqek5mS3puLzAr?=
 =?utf-8?B?T25VV0pHSVFUTVlOSzEyYUhkYkNqSkRjRE5iK3VDRWhxdUhyY1NwN1BGTHIv?=
 =?utf-8?B?WWIydkRVVFRXbjF3RkZ0RXdRZitSdU9vK1RNNUMwQklSMVpPVHNwbm13K2V2?=
 =?utf-8?B?TzJqdmdEdDZNNUgzQTl4cVFYdWwvaGRMSHBDSVY0bmpZVHB2c2NocTRDdWNx?=
 =?utf-8?B?S0NBeTkvNE14bzZhMU9DVzlJU2ZDNUQ2S0RzMXlwYzJWNUFTZFR2Mm9FOFZX?=
 =?utf-8?B?WldtbTFoQVE1a0p4SGVzZFBoeG5wZGhUTUxhZ284ZGFYMFZOZ2VQU2tBSjFQ?=
 =?utf-8?B?cXRCS3hqN1g5SkhJSnFmYURjSUhGTjdyT1I0Mkh2K3NyMlI4NWVhdGZoSlpq?=
 =?utf-8?B?RnA3cDQ3UFdMQzdxb3l3TXFQbDRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	El3hpyNDPVSzVzRwURcI5Bv2WA2W995iOy6QFFWC6Z5eMDWNg5yG58PWnvFVzXv5WBH5Ja1EPokdnHSxJGMwZmhcEJ2D9SJOQfwSNuVBa1/Xo2kzoocomcw+gdifiz89778Y6jDtOTI+SEibqve6av6eykyRGzwko5VtsQkpouHujSphLpOLOUiE3H5X7ekLgGQYR19Enjg5rGBc6QjaxzsqmVLfEaVqjEFCsPg2qTzdA7migUCzfLOfnJrl7XsTnvyUTRDXYRv0SFEdn/5lwEZ5v6id+DbnugNxFbbcGMUl8TtjSMryMrQizsO3U1I+HJ7Qfdr3I7r0hTtLDBlfnc7mm+ujS+RHfRImlA/dMpO9eM7ts/uttvx/E7+hmFnRClsG1a/AlAA5HW02LUMW3ueHb5cxZ7t8PK4Q3KQf0Rc8xZwWSZ6FpJNjRPhZ2TgL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:50:15.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb01c2dc-4bfc-4ea5-6a71-08de67ea897e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,arm.com:mid,arm.com:dkim,arm.com:email];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D7932111135
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiA5IEZlYiAyMDI2LCBhdCAxMTo1NywgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBUdWUsIEZlYiAzLCAyMDI2IGF0IDY6MzjigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBGRi1BIDEuMiBleHRlbmRz
IHRoZSBlbmRwb2ludCBtZW1vcnkgYWNjZXNzIGRlc2NyaXB0b3IgKEVNQUQpIGZyb20NCj4+IDE2
IHRvIDMyIGJ5dGVzLCBhZGRpbmcgaW1wbGVtZW50YXRpb24tZGVmaW5lZCAoSU1QREVGKSBmaWVs
ZHMgYW5kDQo+PiByZXNlcnZlZCBzcGFjZS4gVGhlIE1FTV9TSEFSRSBwYXRoIGN1cnJlbnRseSBh
c3N1bWVzIHRoZSAxLjEgRU1BRA0KPj4gc2l6ZSBhbmQgcmVqZWN0cyB0aGUgMS4yIGxheW91dC4N
Cj4+IA0KPj4gQWRkIEZGLUEgMS4yIEVNQUQgc3VwcG9ydCB0byBNRU1fU0hBUkU6DQo+PiAtIGRl
ZmluZSBmZmFfbWVtX2FjY2Vzc18xXzIgYW5kIHN0b3JlIElNUERFRiBwYXlsb2FkIGluIGZmYV9z
aG1fbWVtDQo+PiAtIGVtaXQgMS4yIEVNQURzIHRvIHRoZSBTUE1DIGZvciBGRi1BIDEuMiBndWVz
dHMsIGZvcndhcmRpbmcgSU1QREVGDQo+PiAtIHJlZmFjdG9yIGhlYWRlciBwYXJzaW5nIGludG8g
cmVhZF9tZW1fdHJhbnNhY3Rpb24oKSBmb3IgMS4wLzEuMSsNCj4+IC0gZGV0ZWN0IEVNQUQgZm9y
bWF0IGJ5IG1lbV9hY2Nlc3Nfc2l6ZSB0byBhbGxvdyAxLjEgb24gMS4yIGd1ZXN0cw0KPj4gDQo+
PiBGdW5jdGlvbmFsIGltcGFjdDogTUVNX1NIQVJFIHN1cHBvcnRzIEZGLUEgMS4yIEVNQURzLg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlz
QGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jIHwgMTA4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA4
NiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS90ZWUvZmZhX3NobS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+
IGluZGV4IDRjMGI0NWNkZTZlZS4uOTA1YTY0ZTNkYjAxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfc2htLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5j
DQo+PiBAQCAtMzAsNiArMzAsMTQgQEAgc3RydWN0IGZmYV9tZW1fYWNjZXNzIHsNCj4+ICAgICB1
aW50NjRfdCByZXNlcnZlZDsNCj4+IH07DQo+PiANCj4+ICsvKiBFbmRwb2ludCBtZW1vcnkgYWNj
ZXNzIGRlc2NyaXB0b3IgKEZGLUEgMS4yKSAqLw0KPj4gK3N0cnVjdCBmZmFfbWVtX2FjY2Vzc18x
XzIgew0KPj4gKyAgICBzdHJ1Y3QgZmZhX21lbV9hY2Nlc3NfcGVybSBhY2Nlc3NfcGVybTsNCj4+
ICsgICAgdWludDMyX3QgcmVnaW9uX29mZnM7DQo+PiArICAgIHVpbnQ4X3QgaW1wZGVmWzE2XTsN
Cj4+ICsgICAgdWludDhfdCByZXNlcnZlZFs4XTsNCj4+ICt9Ow0KPj4gKw0KPj4gLyogTGVuZCwg
ZG9uYXRlIG9yIHNoYXJlIG1lbW9yeSB0cmFuc2FjdGlvbiBkZXNjcmlwdG9yICovDQo+PiBzdHJ1
Y3QgZmZhX21lbV90cmFuc2FjdGlvbl8xXzAgew0KPj4gICAgIHVpbnQxNl90IHNlbmRlcl9pZDsN
Cj4+IEBAIC03Myw3ICs4MSw3IEBAIHN0cnVjdCBmZmFfbWVtX3RyYW5zYWN0aW9uXzFfMSB7DQo+
PiAvKg0KPj4gICogVGhlIHBhcnRzIG5lZWRlZCBmcm9tIHN0cnVjdCBmZmFfbWVtX3RyYW5zYWN0
aW9uXzFfMCBvciBzdHJ1Y3QNCj4+ICAqIGZmYV9tZW1fdHJhbnNhY3Rpb25fMV8xLCB1c2VkIHRv
IHByb3ZpZGUgYW4gYWJzdHJhY3Rpb24gb2YgZGlmZmVyZW5jZSBpbg0KPj4gLSAqIGRhdGEgc3Ry
dWN0dXJlcyBiZXR3ZWVuIHZlcnNpb24gMS4wIGFuZCAxLjEuIFRoaXMgaXMganVzdCBhbiBpbnRl
cm5hbA0KPj4gKyAqIGRhdGEgc3RydWN0dXJlcyBiZXR3ZWVuIHZlcnNpb24gMS4wIGFuZCAxLjIu
IFRoaXMgaXMganVzdCBhbiBpbnRlcm5hbA0KPj4gICogaW50ZXJmYWNlIGFuZCBjYW4gYmUgY2hh
bmdlZCB3aXRob3V0IGNoYW5naW5nIGFueSBBQkkuDQo+PiAgKi8NCj4+IHN0cnVjdCBmZmFfbWVt
X3RyYW5zYWN0aW9uX2ludCB7DQo+PiBAQCAtOTIsNiArMTAwLDggQEAgc3RydWN0IGZmYV9zaG1f
bWVtIHsNCj4+ICAgICB1aW50MTZfdCBzZW5kZXJfaWQ7DQo+PiAgICAgdWludDE2X3QgZXBfaWQ7
ICAgICAvKiBlbmRwb2ludCwgdGhlIG9uZSBsZW5kaW5nICovDQo+PiAgICAgdWludDY0X3QgaGFu
ZGxlOyAgICAvKiBGRkFfSEFORExFX0lOVkFMSUQgaWYgbm90IHNldCB5ZXQgKi8NCj4+ICsgICAg
LyogRW5kcG9pbnQgbWVtb3J5IGFjY2VzcyBkZXNjcmlwdG9yIElNUERFRiB2YWx1ZSAoRkYtQSAx
LjIpLiAqLw0KPj4gKyAgICB1aW50NjRfdCBpbXBkZWZbMl07DQo+PiAgICAgdW5zaWduZWQgaW50
IHBhZ2VfY291bnQ7DQo+PiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZXNbXTsNCj4+IH07DQo+
PiBAQCAtMjk3LDE3ICszMDcsMjEgQEAgc3RhdGljIHZvaWQgaW5pdF9yYW5nZShzdHJ1Y3QgZmZh
X2FkZHJlc3NfcmFuZ2UgKmFkZHJfcmFuZ2UsDQo+PiAgKiBUaGlzIGZ1bmN0aW9uIHVzZXMgdGhl
IGZmYV9zcG1jIHR4IGJ1ZmZlciB0byB0cmFuc21pdCB0aGUgbWVtb3J5IHRyYW5zYWN0aW9uDQo+
PiAgKiBkZXNjcmlwdG9yLg0KPj4gICovDQo+PiAtc3RhdGljIGludCBzaGFyZV9zaG0oc3RydWN0
IGZmYV9zaG1fbWVtICpzaG0pDQo+PiArc3RhdGljIGludCBzaGFyZV9zaG0oc3RydWN0IGZmYV9z
aG1fbWVtICpzaG0sIHVpbnQzMl90IGZmYV92ZXJzKQ0KPj4gew0KPj4gICAgIGNvbnN0IHVpbnQz
Ml90IG1heF9mcmFnX2xlbiA9IEZGQV9SWFRYX1BBR0VfQ09VTlQgKiBGRkFfUEFHRV9TSVpFOw0K
Pj4gICAgIHN0cnVjdCBmZmFfbWVtX2FjY2VzcyAqbWVtX2FjY2Vzc19hcnJheTsNCj4+ICsgICAg
c3RydWN0IGZmYV9tZW1fYWNjZXNzXzFfMiAqbWVtX2FjY2Vzc19hcnJheV8xXzI7DQo+PiAgICAg
c3RydWN0IGZmYV9tZW1fdHJhbnNhY3Rpb25fMV8xICpkZXNjcjsNCj4+ICAgICBzdHJ1Y3QgZmZh
X2FkZHJlc3NfcmFuZ2UgKmFkZHJfcmFuZ2U7DQo+PiAgICAgc3RydWN0IGZmYV9tZW1fcmVnaW9u
ICpyZWdpb25fZGVzY3I7DQo+PiAtICAgIGNvbnN0IHVuc2lnbmVkIGludCByZWdpb25fY291bnQg
PSAxOw0KPj4gICAgIHVpbnQzMl90IGZyYWdfbGVuOw0KPj4gICAgIHVpbnQzMl90IHRvdF9sZW47
DQo+PiArICAgIHVpbnQzMl90IG1lbV9hY2Nlc3Nfc2l6ZTsNCj4+ICsgICAgdWludDMyX3QgbWVt
X2FjY2Vzc19vZmZzOw0KPj4gKyAgICB1aW50MzJfdCByZWdpb25fb2ZmczsNCj4+ICAgICBwYWRk
cl90IGxhc3RfcGE7DQo+PiArICAgIHVpbnQzMl90IHJhbmdlX2NvdW50Ow0KPj4gICAgIHVuc2ln
bmVkIGludCBuOw0KPj4gICAgIHBhZGRyX3QgcGE7DQo+PiAgICAgaW50MzJfdCByZXQ7DQo+PiBA
QCAtMzI2LDE2ICszNDAsMzUgQEAgc3RhdGljIGludCBzaGFyZV9zaG0oc3RydWN0IGZmYV9zaG1f
bWVtICpzaG0pDQo+PiAgICAgZGVzY3ItPmhhbmRsZSA9IHNobS0+aGFuZGxlOw0KPj4gICAgIGRl
c2NyLT5tZW1fcmVnX2F0dHIgPSBGRkFfTk9STUFMX01FTV9SRUdfQVRUUjsNCj4+ICAgICBkZXNj
ci0+bWVtX2FjY2Vzc19jb3VudCA9IDE7DQo+PiAtICAgIGRlc2NyLT5tZW1fYWNjZXNzX3NpemUg
PSBzaXplb2YoKm1lbV9hY2Nlc3NfYXJyYXkpOw0KPj4gLSAgICBkZXNjci0+bWVtX2FjY2Vzc19v
ZmZzID0gTUVNX0FDQ0VTU19PRkZTRVQoMCk7DQo+PiArICAgIGlmICggZmZhX3ZlcnMgPj0gRkZB
X1ZFUlNJT05fMV8yICkNCj4+ICsgICAgICAgIG1lbV9hY2Nlc3Nfc2l6ZSA9IHNpemVvZihzdHJ1
Y3QgZmZhX21lbV9hY2Nlc3NfMV8yKTsNCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgbWVtX2Fj
Y2Vzc19zaXplID0gc2l6ZW9mKHN0cnVjdCBmZmFfbWVtX2FjY2Vzcyk7DQo+PiArICAgIG1lbV9h
Y2Nlc3Nfb2ZmcyA9IHNpemVvZihzdHJ1Y3QgZmZhX21lbV90cmFuc2FjdGlvbl8xXzEpOw0KPj4g
KyAgICByZWdpb25fb2ZmcyA9IG1lbV9hY2Nlc3Nfb2ZmcyArIG1lbV9hY2Nlc3Nfc2l6ZTsNCj4+
ICsgICAgZGVzY3ItPm1lbV9hY2Nlc3Nfc2l6ZSA9IG1lbV9hY2Nlc3Nfc2l6ZTsNCj4+ICsgICAg
ZGVzY3ItPm1lbV9hY2Nlc3Nfb2ZmcyA9IG1lbV9hY2Nlc3Nfb2ZmczsNCj4+IA0KPj4gLSAgICBt
ZW1fYWNjZXNzX2FycmF5ID0gYnVmICsgZGVzY3ItPm1lbV9hY2Nlc3Nfb2ZmczsNCj4+IC0gICAg
bWVtc2V0KG1lbV9hY2Nlc3NfYXJyYXksIDAsIHNpemVvZigqbWVtX2FjY2Vzc19hcnJheSkpOw0K
Pj4gLSAgICBtZW1fYWNjZXNzX2FycmF5WzBdLmFjY2Vzc19wZXJtLmVuZHBvaW50X2lkID0gc2ht
LT5lcF9pZDsNCj4+IC0gICAgbWVtX2FjY2Vzc19hcnJheVswXS5hY2Nlc3NfcGVybS5wZXJtID0g
RkZBX01FTV9BQ0NfUlc7DQo+PiAtICAgIG1lbV9hY2Nlc3NfYXJyYXlbMF0ucmVnaW9uX29mZnMg
PSBSRUdJT05fT0ZGU0VUKGRlc2NyLT5tZW1fYWNjZXNzX2NvdW50LCAwKTsNCj4+ICsgICAgaWYg
KCBmZmFfdmVycyA+PSBGRkFfVkVSU0lPTl8xXzIgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBt
ZW1fYWNjZXNzX2FycmF5XzFfMiA9IGJ1ZiArIG1lbV9hY2Nlc3Nfb2ZmczsNCj4+ICsgICAgICAg
IG1lbXNldChtZW1fYWNjZXNzX2FycmF5XzFfMiwgMCwgc2l6ZW9mKCptZW1fYWNjZXNzX2FycmF5
XzFfMikpOw0KPj4gKyAgICAgICAgbWVtX2FjY2Vzc19hcnJheV8xXzJbMF0uYWNjZXNzX3Blcm0u
ZW5kcG9pbnRfaWQgPSBzaG0tPmVwX2lkOw0KPj4gKyAgICAgICAgbWVtX2FjY2Vzc19hcnJheV8x
XzJbMF0uYWNjZXNzX3Blcm0ucGVybSA9IEZGQV9NRU1fQUNDX1JXOw0KPj4gKyAgICAgICAgbWVt
X2FjY2Vzc19hcnJheV8xXzJbMF0ucmVnaW9uX29mZnMgPSByZWdpb25fb2ZmczsNCj4+ICsgICAg
ICAgIG1lbWNweShtZW1fYWNjZXNzX2FycmF5XzFfMlswXS5pbXBkZWYsIHNobS0+aW1wZGVmLA0K
Pj4gKyAgICAgICAgICAgICAgIHNpemVvZihtZW1fYWNjZXNzX2FycmF5XzFfMlswXS5pbXBkZWYp
KTsNCj4+ICsgICAgfQ0KPj4gKyAgICBlbHNlDQo+PiArICAgIHsNCj4+ICsgICAgICAgIG1lbV9h
Y2Nlc3NfYXJyYXkgPSBidWYgKyBtZW1fYWNjZXNzX29mZnM7DQo+PiArICAgICAgICBtZW1zZXQo
bWVtX2FjY2Vzc19hcnJheSwgMCwgc2l6ZW9mKCptZW1fYWNjZXNzX2FycmF5KSk7DQo+PiArICAg
ICAgICBtZW1fYWNjZXNzX2FycmF5WzBdLmFjY2Vzc19wZXJtLmVuZHBvaW50X2lkID0gc2htLT5l
cF9pZDsNCj4+ICsgICAgICAgIG1lbV9hY2Nlc3NfYXJyYXlbMF0uYWNjZXNzX3Blcm0ucGVybSA9
IEZGQV9NRU1fQUNDX1JXOw0KPj4gKyAgICAgICAgbWVtX2FjY2Vzc19hcnJheVswXS5yZWdpb25f
b2ZmcyA9IHJlZ2lvbl9vZmZzOw0KPj4gKyAgICB9DQo+PiANCj4+IC0gICAgcmVnaW9uX2Rlc2Ny
ID0gYnVmICsgbWVtX2FjY2Vzc19hcnJheVswXS5yZWdpb25fb2ZmczsNCj4+ICsgICAgcmVnaW9u
X2Rlc2NyID0gYnVmICsgcmVnaW9uX29mZnM7DQo+PiAgICAgbWVtc2V0KHJlZ2lvbl9kZXNjciwg
MCwgc2l6ZW9mKCpyZWdpb25fZGVzY3IpKTsNCj4+ICAgICByZWdpb25fZGVzY3ItPnRvdGFsX3Bh
Z2VfY291bnQgPSBzaG0tPnBhZ2VfY291bnQ7DQo+PiANCj4+IEBAIC0zNDksOCArMzgyLDkgQEAg
c3RhdGljIGludCBzaGFyZV9zaG0oc3RydWN0IGZmYV9zaG1fbWVtICpzaG0pDQo+PiAgICAgICAg
IHJlZ2lvbl9kZXNjci0+YWRkcmVzc19yYW5nZV9jb3VudCsrOw0KPj4gICAgIH0NCj4+IA0KPj4g
LSAgICB0b3RfbGVuID0gQUREUl9SQU5HRV9PRkZTRVQoZGVzY3ItPm1lbV9hY2Nlc3NfY291bnQs
IHJlZ2lvbl9jb3VudCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lv
bl9kZXNjci0+YWRkcmVzc19yYW5nZV9jb3VudCk7DQo+IA0KPiBQbGVhc2UgcmVtb3ZlIHRoZSB1
bnVzZWQgQUREUl9SQU5HRV9PRkZTRVQoKSBtYWNybyBhbmQgZnJpZW5kcywgYXMNCj4gdGhleSdy
ZSBubyBsb25nZXIgYWNjdXJhdGUuDQoNClZlcnkgdHJ1ZSwgd2lsbCByZW1vdmUgdGhlbSBpbiB2
Mi4NCg0KPiANCj4+ICsgICAgcmFuZ2VfY291bnQgPSByZWdpb25fZGVzY3ItPmFkZHJlc3NfcmFu
Z2VfY291bnQ7DQo+PiArICAgIHRvdF9sZW4gPSByZWdpb25fb2ZmcyArIHNpemVvZigqcmVnaW9u
X2Rlc2NyKSArDQo+PiArICAgICAgICAgICAgICByYW5nZV9jb3VudCAqIHNpemVvZihzdHJ1Y3Qg
ZmZhX2FkZHJlc3NfcmFuZ2UpOw0KPj4gICAgIGlmICggdG90X2xlbiA+IG1heF9mcmFnX2xlbiAp
DQo+PiAgICAgew0KPj4gICAgICAgICByZXQgPSBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+PiBA
QCAtMzU4LDcgKzM5Miw3IEBAIHN0YXRpYyBpbnQgc2hhcmVfc2htKHN0cnVjdCBmZmFfc2htX21l
bSAqc2htKQ0KPj4gICAgIH0NCj4+IA0KPj4gICAgIGFkZHJfcmFuZ2UgPSByZWdpb25fZGVzY3It
PmFkZHJlc3NfcmFuZ2VfYXJyYXk7DQo+PiAtICAgIGZyYWdfbGVuID0gQUREUl9SQU5HRV9PRkZT
RVQoZGVzY3ItPm1lbV9hY2Nlc3NfY291bnQsIHJlZ2lvbl9jb3VudCwgMSk7DQo+PiArICAgIGZy
YWdfbGVuID0gcmVnaW9uX29mZnMgKyBzaXplb2YoKnJlZ2lvbl9kZXNjcikgKyBzaXplb2YoKmFk
ZHJfcmFuZ2UpOw0KPj4gICAgIGxhc3RfcGEgPSBwYWdlX3RvX21hZGRyKHNobS0+cGFnZXNbMF0p
Ow0KPj4gICAgIGluaXRfcmFuZ2UoYWRkcl9yYW5nZSwgbGFzdF9wYSk7DQo+PiAgICAgZm9yICgg
biA9IDE7IG4gPCBzaG0tPnBhZ2VfY291bnQ7IGxhc3RfcGEgPSBwYSwgbisrICkNCj4+IEBAIC00
NDgsNiArNDgyLDEyIEBAIHN0YXRpYyBpbnQgcmVhZF9tZW1fdHJhbnNhY3Rpb24odWludDMyX3Qg
ZmZhX3ZlcnMsIGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGJsZW4sDQo+PiAgICAgaWYgKCBzaXpl
ICogY291bnQgKyBvZmZzID4gYmxlbiApDQo+PiAgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFM
SURfUEFSQU1FVEVSUzsNCj4+IA0KPj4gKyAgICBpZiAoIHNpemUgPCBzaXplb2Yoc3RydWN0IGZm
YV9tZW1fYWNjZXNzKSApDQo+PiArICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BBUkFN
RVRFUlM7DQo+IA0KPiBJbXBsaWNpdGx5LCBzaXplIHNob3VsZCBhbHNvIGJlIGEgbXVsdGlwbGUg
b2YgMTYuIERvbid0IHlvdSBhZ3JlZT8NCg0KVGhlIHNwZWMgaXMgZ2l2aW5nIHNvbWUgY29uc3Ry
YWludHMgb24gdGhlIG9mZnNldCBidXQgdGhlcmUgaXMgbm90aGluZyBleHBsaWNpdCBmb3IgdGhl
DQpwZXIgbWVtIGFjY2VzcyBzaXplLiBBcyB3ZSBoYXZlIG5vIDY0Yml0IGZpZWxkcyBpbiBpdCwg
SSBhbSBub3QgcmVhbGx5IHNlZWluZyBhbnkNCmltcGxpY2l0IG11bHRpcGxlIG9mIDE2Lg0KDQpJ
IGFtIGNoZWNraW5nIHRoZSBvZmZzZXQgYmVjYXVzZSBpdCBpcyBlbmZvcmNlZCBieSB0aGUgc3Bl
YyBidXQgZm9yIHRoZSBzaXplIGkgd291bGQNCnJhdGhlciBub3QgcHV0IHNvbWV0aGluZyBhcyB3
aG8ga25vd3Mgd2hhdCBtaWdodCBiZSBhZGRlZCBpbiB0aGUgZnV0dXJlLg0KDQo+IA0KPj4gKw0K
Pj4gKyAgICBpZiAoIG9mZnMgJiAweEYgKQ0KPj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5W
QUxJRF9QQVJBTUVURVJTOw0KPj4gKw0KPj4gICAgIHRyYW5zLT5tZW1fcmVnX2F0dHIgPSBtZW1f
cmVnX2F0dHI7DQo+PiAgICAgdHJhbnMtPmZsYWdzID0gZmxhZ3M7DQo+PiAgICAgdHJhbnMtPm1l
bV9hY2Nlc3Nfc2l6ZSA9IHNpemU7DQo+PiBAQCAtNDY0LDcgKzUwNCw3IEBAIHZvaWQgZmZhX2hh
bmRsZV9tZW1fc2hhcmUoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgdWludDY0
X3QgYWRkciA9IGdldF91c2VyX3JlZyhyZWdzLCAzKTsNCj4+ICAgICB1aW50MzJfdCBwYWdlX2Nv
dW50ID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDQpOw0KPj4gICAgIGNvbnN0IHN0cnVjdCBmZmFfbWVt
X3JlZ2lvbiAqcmVnaW9uX2Rlc2NyOw0KPj4gLSAgICBjb25zdCBzdHJ1Y3QgZmZhX21lbV9hY2Nl
c3MgKm1lbV9hY2Nlc3M7DQo+PiArICAgIGNvbnN0IHN0cnVjdCBmZmFfbWVtX2FjY2Vzc18xXzIg
Km1lbV9hY2Nlc3M7DQo+PiAgICAgc3RydWN0IGZmYV9tZW1fdHJhbnNhY3Rpb25faW50IHRyYW5z
Ow0KPj4gICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+PiAgICAgc3Ry
dWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gQEAgLTQ3NCw5ICs1MTQsMTIgQEAg
dm9pZCBmZmFfaGFuZGxlX21lbV9zaGFyZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+
ICAgICByZWdpc3Rlcl90IGhhbmRsZV9oaSA9IDA7DQo+PiAgICAgcmVnaXN0ZXJfdCBoYW5kbGVf
bG8gPSAwOw0KPj4gICAgIGludCByZXQgPSBGRkFfUkVUX0RFTklFRDsNCj4+ICsgICAgdWludDMy
X3QgZmZhX3ZlcnM7DQo+PiAgICAgdWludDMyX3QgcmFuZ2VfY291bnQ7DQo+PiAgICAgdWludDMy
X3QgcmVnaW9uX29mZnM7DQo+PiAgICAgdWludDE2X3QgZHN0X2lkOw0KPj4gKyAgICB1aW50OF90
IHBlcm07DQo+PiArICAgIHVpbnQ2NF90IGltcGRlZlsyXTsNCj4+IA0KPj4gICAgIGlmICggIWZm
YV9md19zdXBwb3J0c19maWQoRkZBX01FTV9TSEFSRV82NCkgKQ0KPj4gICAgIHsNCj4+IEBAIC01
MTUsOCArNTU4LDggQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9zaGFyZShzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4+ICAgICBpZiAoIGZyYWdfbGVuID4gdHhfc2l6ZSApDQo+PiAgICAgICAg
IGdvdG8gb3V0X3VubG9jazsNCj4+IA0KPj4gLSAgICByZXQgPSByZWFkX21lbV90cmFuc2FjdGlv
bihBQ0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpLCB0eF9idWYsDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZyYWdfbGVuLCAmdHJhbnMpOw0KPj4gKyAgICBmZmFfdmVycyA9
IEFDQ0VTU19PTkNFKGN0eC0+Z3Vlc3RfdmVycyk7DQo+PiArICAgIHJldCA9IHJlYWRfbWVtX3Ry
YW5zYWN0aW9uKGZmYV92ZXJzLCB0eF9idWYsIGZyYWdfbGVuLCAmdHJhbnMpOw0KPj4gICAgIGlm
ICggcmV0ICkNCj4+ICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gDQo+PiBAQCAtNTQ1LDEz
ICs1ODgsMzUgQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9zaGFyZShzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncykNCj4+ICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gICAgIH0NCj4+IA0KPj4g
KyAgICBpZiAoIHRyYW5zLm1lbV9hY2Nlc3Nfc2l6ZSA8IHNpemVvZihzdHJ1Y3QgZmZhX21lbV9h
Y2Nlc3MpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BB
UkFNRVRFUlM7DQo+PiArICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiArICAgIH0NCj4+ICsN
Cj4+ICAgICAvKiBDaGVjayB0aGF0IGl0IGZpdHMgaW4gdGhlIHN1cHBsaWVkIGRhdGEgKi8NCj4+
ICAgICBpZiAoIHRyYW5zLm1lbV9hY2Nlc3Nfb2ZmcyArIHRyYW5zLm1lbV9hY2Nlc3Nfc2l6ZSA+
IGZyYWdfbGVuICkNCj4+ICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gDQo+PiAgICAgbWVt
X2FjY2VzcyA9IHR4X2J1ZiArIHRyYW5zLm1lbV9hY2Nlc3Nfb2ZmczsNCj4+IC0NCj4+ICAgICBk
c3RfaWQgPSBBQ0NFU1NfT05DRShtZW1fYWNjZXNzLT5hY2Nlc3NfcGVybS5lbmRwb2ludF9pZCk7
DQo+PiArICAgIHBlcm0gPSBBQ0NFU1NfT05DRShtZW1fYWNjZXNzLT5hY2Nlc3NfcGVybS5wZXJt
KTsNCj4+ICsgICAgcmVnaW9uX29mZnMgPSBBQ0NFU1NfT05DRShtZW1fYWNjZXNzLT5yZWdpb25f
b2Zmcyk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIEZGLUEgMS4yIGludHJvZHVjZWQg
YW4gZXh0ZW5kZWQgbWVtX2FjY2VzcyBkZXNjcmlwdG9yIHdpdGggaW1wZGVmDQo+PiArICAgICAq
IGZpZWxkcywgYnV0IGd1ZXN0cyBjYW4gc3RpbGwgdXNlIHRoZSAxLjEgZm9ybWF0IGlmIHRoZXkg
ZG9uJ3QgbmVlZA0KPj4gKyAgICAgKiBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGRhdGEuIERldGVj
dCB3aGljaCBmb3JtYXQgaXMgdXNlZCBiYXNlZCBvbg0KPj4gKyAgICAgKiB0aGUgbWVtX2FjY2Vz
c19zaXplIGZpZWxkIHJhdGhlciB0aGFuIHRoZSBuZWdvdGlhdGVkIEZGLUEgdmVyc2lvbi4NCj4+
ICsgICAgICovDQo+PiArICAgIGlmICggdHJhbnMubWVtX2FjY2Vzc19zaXplID49IHNpemVvZihz
dHJ1Y3QgZmZhX21lbV9hY2Nlc3NfMV8yKSApDQo+PiArICAgICAgICBtZW1jcHkoaW1wZGVmLCBt
ZW1fYWNjZXNzLT5pbXBkZWYsIHNpemVvZihpbXBkZWYpKTsNCj4+ICsgICAgZWxzZQ0KPj4gKyAg
ICB7DQo+PiArICAgICAgICBpbXBkZWZbMF0gPSAwOw0KPj4gKyAgICAgICAgaW1wZGVmWzFdID0g
MDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgIGlmICggIUZGQV9JRF9JU19TRUNVUkUoZHN0X2lk
KSApDQo+PiAgICAgew0KPj4gICAgICAgICAvKiB3ZSBkbyBub3Qgc3VwcG9ydCBzaGFyaW5nIHdp
dGggVk1zICovDQo+PiBAQCAtNTU5LDEzICs2MjQsMTEgQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9z
aGFyZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgZ290byBvdXRfdW5s
b2NrOw0KPj4gICAgIH0NCj4+IA0KPj4gLSAgICBpZiAoIEFDQ0VTU19PTkNFKG1lbV9hY2Nlc3Mt
PmFjY2Vzc19wZXJtLnBlcm0pICE9IEZGQV9NRU1fQUNDX1JXICkNCj4+ICsgICAgaWYgKCBwZXJt
ICE9IEZGQV9NRU1fQUNDX1JXICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRf
Tk9UX1NVUFBPUlRFRDsNCj4+ICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gICAgIH0NCj4+
IC0NCj4+IC0gICAgcmVnaW9uX29mZnMgPSBBQ0NFU1NfT05DRShtZW1fYWNjZXNzLT5yZWdpb25f
b2Zmcyk7DQo+PiAgICAgaWYgKCBzaXplb2YoKnJlZ2lvbl9kZXNjcikgKyByZWdpb25fb2ZmcyA+
IGZyYWdfbGVuICkNCj4+ICAgICB7DQo+PiAgICAgICAgIHJldCA9IEZGQV9SRVRfTk9UX1NVUFBP
UlRFRDsNCj4+IEBAIC01OTAsNiArNjUzLDcgQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9zaGFyZShz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICB9DQo+PiAgICAgc2htLT5zZW5kZXJf
aWQgPSB0cmFucy5zZW5kZXJfaWQ7DQo+PiAgICAgc2htLT5lcF9pZCA9IGRzdF9pZDsNCj4+ICsg
ICAgbWVtY3B5KHNobS0+aW1wZGVmLCBpbXBkZWYsIHNpemVvZihzaG0tPmltcGRlZikpOw0KPj4g
DQo+PiAgICAgLyoNCj4+ICAgICAgKiBDaGVjayB0aGF0IHRoZSBDb21wb3NpdGUgbWVtb3J5IHJl
Z2lvbiBkZXNjcmlwdG9yIGZpdHMuDQo+PiBAQCAtNjA1LDcgKzY2OSw3IEBAIHZvaWQgZmZhX2hh
bmRsZV9tZW1fc2hhcmUoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgaWYgKCBy
ZXQgKQ0KPj4gICAgICAgICBnb3RvIG91dDsNCj4+IA0KPj4gLSAgICByZXQgPSBzaGFyZV9zaG0o
c2htKTsNCj4+ICsgICAgcmV0ID0gc2hhcmVfc2htKHNobSwgZmZhX3ZlcnMpOw0KPiANCj4gU2hv
dWxkbid0IHdlIHJhdGhlciB1c2UgZmZhX2Z3X3ZlcnNpb24/DQoNCkRlZmluaXRlbHkgeWVzLg0K
DQpJbiBmYWN0IGkgaGF2ZSBkb25lIHRoaXMgaW4gYSBmb2xsb3cgdXAgcGF0Y2ggYW5kIGkgbmVl
ZCB0byBleHBvcnQgdGhlIGZ3IHZlcnNpb24gdG8gYmUgYWJsZSB0bw0KZG8gdGhhdCBidXQgSSB3
aWxsIGJyaW5nIHRoYXQgZm9yd2FyZCBhbmQgZG8gaXQgaGVyZSwgdGhhdCBtYWtlcyBhIGxvdCBt
b3JlIHNlbnNlLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0K
PiANCj4+ICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgIGdvdG8gb3V0Ow0KPj4gDQo+PiAtLQ0K
Pj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQ0KDQoNCg==

