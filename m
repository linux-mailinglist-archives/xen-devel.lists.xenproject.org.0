Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNmjLl0HimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:12:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163E1125CC
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225693.1532253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTrg-0004oH-8B; Mon, 09 Feb 2026 16:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225693.1532253; Mon, 09 Feb 2026 16:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTrg-0004ma-5R; Mon, 09 Feb 2026 16:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1225693;
 Mon, 09 Feb 2026 16:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpTre-0004mP-JQ
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:11:54 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076dffaf-05d2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:11:47 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 16:11:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 16:11:42 +0000
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
X-Inumbo-ID: 076dffaf-05d2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adljMjxmt0DyS/B7G7Hlgt2fMF5KudK8aYiP8fmcCrMeyEmOl1vkpj4MBcNXlrnYf+P7LQNeW0TCPHn/HcXf3k2fnq8j1YDSnizxXEa1nYCtk55prhbWnOOeakLLR2w3B4bC95XgRwk/9oKiYsjZbXBWEpmthu2E6xjHkrGKwvCecOq5YBmFuRbZnM+q25zkePBkopYZbbxb559za51slfLp3W+tsNxYcb1NLjMbdn9E0pAuIDrx66piv8rIjV094qR+17+0ChfLtNPTz8nRDcmuuKzRIwDraaPQznnMiKod5kL543Ai+FgpAOQjfT/RsvyEJLZxsz50eCgc106HSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juaxaDOV+OxrdiiSgPwPEYogUGI/uPsWoWxdFfHSa5M=;
 b=UERKE7Mmv1gwKGW+Km4/NcGCrYLGTKPwDfrimzz9K4OkaTv7jlUvl868AtzXGGNImPTDh0YZIUviN0mew9/hFw0TJ7gTWw5W/+GHKkAOm8rfoGk2e1bUUEfhZYr/VGUUqrB1EmHlfjxhtAegFNVNyeDRI/g8eff/NQAp4FtGJzQKkkZLGMxty07mItgg1ZQGLUzJCjX9pZFPeuXXcx7Bo4JCKaJf8mnnIJ8aXd41WZW+Zu/DJnz6w1MiJ7xV0r1TrmFBb2G46IHfqfmgLKGit5Nfx4CkJeq8EH9hjlj/pIEiicPSKfmc62UOnjQa+7gDBqGtawNpCfL+HcB4cKULzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juaxaDOV+OxrdiiSgPwPEYogUGI/uPsWoWxdFfHSa5M=;
 b=fM1t9//5FI7fV76WkscsgNTxuQ3icsrFSkenh3Tr1NNhavN0xECG1Wn4x/N1Lm5WS/q7wAEYwepBTJtfj8/tBhNqd0Oo6A2Uv2SKTvXELUtFv+y3StgT2YUDuiTJ+KpkWGPSc9gYhrjvJU3dBun7VSAI3v+v6iRcozDZzPWViaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 17:11:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation earlier
Message-ID: <aYoHO2WDnVR4wIL5@Mac.lan>
References: <20260209144049.86535-1-roger.pau@citrix.com>
 <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com>
X-ClientProxiedBy: MA3P292CA0040.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a347c1-dce1-440f-ab84-08de67f5e9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d21qWkk2RjU0L2hhQmNicGpJOVBmcW42Zmtad2N6Qlorc2VKUjNyM05YUUht?=
 =?utf-8?B?YVFjT3RSWXFRck1aaE9SWHVwQThOWTVJWjdsY0dkc1U3VmhNMU5tRWN4aVZP?=
 =?utf-8?B?QS84cWRCOThvL3NIUU1McFgvOUJVOHA4bGg1dGxPNlBEVk12VURiaUZudmMv?=
 =?utf-8?B?cWZvY1VzWDhnZXlsS1lvNjh0bVhUbUdIZGh3enMrVGRSdndmUVZtcEtuM3Zh?=
 =?utf-8?B?QkdQY1U4VGxwUmJCanQ2UmM3WHJGeDZYU3RDY1BrOWRFQS9tSFhheVZwZGN6?=
 =?utf-8?B?RW9DK0p3MU5yTTcxYVFya2VZb2tHQUI5eGV2MW45N1BheU0yQWZsY3JZeWRi?=
 =?utf-8?B?VGJnY0dkbVhOaCtSblZyVy8xQUNab2lZVTNGb2t6bUsvTU9yTERDbnRKeHZ1?=
 =?utf-8?B?bE90c3BYekpxdzA0Ti9jL1dvNS93STJtS3RsZXZxUUEyTTdaVURoOGY1MUtR?=
 =?utf-8?B?TTFTSUZHK1dPVzFsclN5b2tTVjZJS0pIMWxITk1wRWRGSWQwQ2lHQ2hGNTRt?=
 =?utf-8?B?aTMrbzlNYUtjb3JPcHRPRFJ0eVNZNUZXem1UcVFtRWRpblJsL09uMXF6elhI?=
 =?utf-8?B?NkcyOXQ5a1dZMGNSakFDenZLVENtRWJPLzFEZzgxRFpLZDRKVUpPUllBYXpm?=
 =?utf-8?B?RDI4b1VvL0Z5bTZEV1VGZEJkTEYyM3NJM2RtUFRHcDE4bVZGS2xzNkVUbWhC?=
 =?utf-8?B?V1BIM0NPV0FNZXE1SGJHYU1GYWYrWmo0cjR3WGt5Wm1oc2hLZHUzSzNhMHdu?=
 =?utf-8?B?ekwyRTZiUlZiZlNmaStTUWYrMjZkb29vMnZzSFNLcUpqTXNIamhQd2hoOHBT?=
 =?utf-8?B?djFwRHRsYVhUTGlhV0llZzNobUJ0OGpNbGpTSnVlbjF2eDU0YkdOeGhZY0JE?=
 =?utf-8?B?NjYyRmlVK1dHYXQvbzRPSW55TVRiS05ybFRxZERIWWVSRTh6VVo1bW80VHRy?=
 =?utf-8?B?ZHR4cVpEVUtNbkJFZWJDVTYyV0d1Z3dXS2lwcGJKYjlkNllWUDVhdk9Sa1o0?=
 =?utf-8?B?TXJkTkFVZG0wcDNZdmE0RmR2NFRacUtjR1d4N2kySGFOMHlUbkZ5dGY3NStn?=
 =?utf-8?B?UFJmaC8vQTJLWk1rVmZHdUdYVGYwZGY5eTlSZi9lYVRZSGpSSmxvU2F0cGZZ?=
 =?utf-8?B?L0xSOXpwcngxZzlQTjZ1ZG9uSHQ3TjlrM2Vzc2JRczhsYjhYVVRKa1lqN3hG?=
 =?utf-8?B?YlkzaExKRjdhVUROR0JJRnhyLzU4Ny9UelhiT1R2QjNKSzNMMVJZbnRrY1dP?=
 =?utf-8?B?NmpuZ3Z1REx1V0xlM1NsdjlkT1RzejhDZi9Mc1dwOEwzQnBwTkZFOSt1ZnhQ?=
 =?utf-8?B?eDVKcnZnOVIyaDlkWWFVL1VxWE0wOXkxakxlTXpRWWlsa2ZNei9oTDZkdFU5?=
 =?utf-8?B?VXc1UDF6Z3p4VjNGNnAzZTd2ZFhsaHdKZUFlMHppc2ZtdkszMjAySUpMTnVu?=
 =?utf-8?B?UmxnQVA4WldtZXIyaEN3R2xValk0NnlDL09ORVZ1cnJHZm1sZi9qa0htaHRs?=
 =?utf-8?B?bmdnVG1tTVJSUXNxMFMxbWdrczlYNFI0UGk3bzlvYXBUMkxSMG96UUpvZUxP?=
 =?utf-8?B?cmFTWE1VWC9RWDRtU2hkbU1XT3A0RWRvVGxVTFEwdUFrYnNpNExiVnpxUXQr?=
 =?utf-8?B?QWFoYm15V1FtcjhFZ3VGWGpZNlBpOGdINk5NNGE5TmJnWXNXU1ZZenNXcGds?=
 =?utf-8?B?QitjMHN3K3FVbG42eE1nZ0xWcFMxVHhkdVcvUm1NUjlxcGY1Mm12RVNRbDcr?=
 =?utf-8?B?c2U2eGJmZ0lYWWJJMVJQUmlNRmZVem5hTnhSdHVPcmhyNjZyWEJoZmlmVk9D?=
 =?utf-8?B?ci9RdFhwQ1dhU0FlckcrSjhQQUdySWNwZGFDQjF4UjRieXpXTlNRVGlhOTNU?=
 =?utf-8?B?QkZFeVo0Vk9hVjEySXRYMVUrTHRBQTFuS1lVRVpBcDdHSHcxSHI2NGQweS9p?=
 =?utf-8?B?RGthUFJiOWwyNFVBSHRNSmVBaHgzLzRzWXcyOTlSWUlMK2I4dHhHYmY4MkNV?=
 =?utf-8?B?ZTQwNWZrTjhDVkNhWmtTTyswVzB3Y3JRSS9wT2Y1NG9sZUR6NVN5NW9EdlhB?=
 =?utf-8?B?SUFGZVFCZUV0MHRNZDhYbDk5UjFleFZYdmFYSlNTa3AvMmU2dUVBYlA2WUZp?=
 =?utf-8?Q?W7hI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJNUHlYUGhXb3pZMkdaWFlVempsOGxlOTFEeWVoK056ck9Fd1BRS1B2ZjRB?=
 =?utf-8?B?WU5EbTJJUkpRSHZHd2wxY0pEOWRnWGk2SUYzbXJ3UlZMdGRRUzVMRHlGcVd2?=
 =?utf-8?B?emZpaTA0OVVjTkdMZndmeTJHdzZFeWQxRjA2Nmg4NGNWbXR0Wk5IeGpQU1Bm?=
 =?utf-8?B?RmJTU29KeVVvVUp0S0ltR0o3TWhOeGNuS09iRFhjdTdzS3I5Kzgxb29LSzNh?=
 =?utf-8?B?SmFUVmx1L29jNm93aHdUL3Aya1lYcG9pOEZpNGxQK1NYOXFrT2g5R2pJZ0g5?=
 =?utf-8?B?WVpJOGJ1U0dVc2FuZWs0SmV6bkZpa3BaaW8wdlh5emw5eTdOR3JZSzN3VEpN?=
 =?utf-8?B?MDJ1SzNTVnc5bkhyZTFnMUZ4Tm5ZbnZ5cllzaFhoZW5ENlNGem5MYUg4VDJC?=
 =?utf-8?B?RUhZaEtaRkc5Tysya1NvUWNOdjBlQkhrM0pIOUR0bkM1WUYwMWFmbkJPekR3?=
 =?utf-8?B?M3I3U0F3Z21KNGtrN3paWER5V3hBV0VUUTZmbzZwT01yNGIrK0FxaW5ZaVdj?=
 =?utf-8?B?K0c5dzNSQWg5eG1UTVlGVkxTWE5UTlMwRjdwenF3TEJTc1ErNEJCUng5S2gw?=
 =?utf-8?B?MjMwallBai9vVUo2eHFtVnhVZS9SMDdsYkdHRU5kc3J2cHNxalFobWpKb0kr?=
 =?utf-8?B?dzZnb2tTaCtyOWwzZGNLU3ZHSGJ3cVVOOEZTcmlyWThwcTZOT2U4ekRhaUZr?=
 =?utf-8?B?S0VrTGhsWmF6QjNOM2l4MG5QYzJ6cUovcDM2NG1yUTRIT1dFY0JUWWF4OW5M?=
 =?utf-8?B?L3o1NUFMOGZONVJSMGQrUGNVT1FrVWhIakNMVndVbDI1S2hhb21jWW9WNng5?=
 =?utf-8?B?b1lVaUl4cWg3djl3Uk4zMHN4OGZ3LzlJR0RkelhBQWNtaUNCOGF6KzJDeUs3?=
 =?utf-8?B?WE94OGVrYU9XeTRlYTBoWFo3elFzV3U5akdTejMxQUMwei9RRHBWbnhmM1hY?=
 =?utf-8?B?ZkdKMGVQOGVaUmlmc1plYUZFZk9VakhsOURzcUxOV2h2TnBKMlZ2K0ZDLzVQ?=
 =?utf-8?B?V0IrOGlzdnIrNktDRnpjMHloUG1aTjk3NHo3ZnMxWVMrcHY5d0FFaStJOUVx?=
 =?utf-8?B?U08zRjRkTFBkUStSZzVuY2JnWTRoYWh2T0JqaDlaSCtvUHVlMEdzdHBCUVRY?=
 =?utf-8?B?MHloS1pNTDcrZlVmL1Q2YzMvYWxqMFo3SWVDMGVNV0VsbzNtQjdNT0FRQTFR?=
 =?utf-8?B?bldiUDB6WlJzd1hha1FDdHl6NU1OcGkxNFNnMlBDTHVzeERPZkNoYVM2ZHYv?=
 =?utf-8?B?eDcwTzUrMHNkRHRodFpaRzhvSmNNYWptaE9Yem51MWlnQzEwYnNlMndqOVJC?=
 =?utf-8?B?Tlp3SkQ1bGhvN1hqdzlvak5aeUwzdWdQbnUvRzl3MlhReDVhdUlKU1NMZ3VO?=
 =?utf-8?B?WXRoR25KRmJWOHhZM2Zab2RGWSs3WGZ2YytZbG5ZVEFlVE9kbU1lTThxOUdH?=
 =?utf-8?B?aTduQ0RyY3NZVWZvcmRDc05tSjhiamZQQWU5SnRpeENrTU9HamdYcFBiNy8r?=
 =?utf-8?B?N0ZiOHA5ZmthR1RKVzFYQzIvT1lubkcrMmFVWW1OOG1uSm5DV1MzOEtrdjFL?=
 =?utf-8?B?OTJWbUVTMkg0N0xiTSsrM0NXVThhYmJiY2dTTFdRdmZrN3JabGpTamVDVnFI?=
 =?utf-8?B?YnZzQ1p1S2t6anlma09ZWFRpRXhFOXV6cWRzakxsZE9kekJ6Q05KclBVU2xj?=
 =?utf-8?B?Tk9JMnh5MUtNWHJaKzE0YmhFY01IR0NEV00xSXZveGtOOVBXMnZMSXVncis4?=
 =?utf-8?B?dVg2MWNnQjNMOVNYb1dXWm5WZXlMWlV0WnhSTlBBSkF6dEtHL2pRMEJETzZp?=
 =?utf-8?B?YVg4WWV6U3VSdkZRdjBVNUFqczBWcE1CSDVrcFNZSzYrQzB1SkNqS0NWNEdM?=
 =?utf-8?B?ak0reWlId1ZxWUlnTkhWMzV2ZzlUMTlPY3pUd3ppODMvVVoxYjZKZjVINGpB?=
 =?utf-8?B?RGhPanNrUDJSYTFZKzB0c2VLS0JSbUN3b3pDYk13eWZZV3FQbVBMRlBYUVVi?=
 =?utf-8?B?OEl0MEJJRjJZamFjKzRtb05DUDNXRDVhUGpmTUl1RXNCdm9HWkQybTB6U3la?=
 =?utf-8?B?aUZmUXFkbzIrQkZ1M0pIYjdzdU8zK00wMEVOd0J1UDlidTBtc1dmS2Vua0R2?=
 =?utf-8?B?NzFSQngrQ0hGODU0clNLVHBHdkU4aGpmKzFtL3dxd013VndNWHNGaXM3WDQ2?=
 =?utf-8?B?bktyZ0doSWVsN1hSRzkzN21pUGNoU0xrY0Q3MzF3M1NQKzltaUhFSktBTjVh?=
 =?utf-8?B?OEJpKytaazJSaDFVVmtjanptOW9lb3VraXJnUXhpVGxNR2g5K1N0Q2dORklj?=
 =?utf-8?B?UzkxSktjWGd3RmlXZDVzL0Q5QnhYV2FRL0UyV2RYazY1QXhpb1p4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a347c1-dce1-440f-ab84-08de67f5e9f6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:11:42.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEGxwdQ24UGL6BoTMs/VneLKfLfP2vpgXFxC72JaMtQ5G0+bmFBQEANNwfG4fc5+WvfVdm3zgJe0Nglpv2hnKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1163E1125CC
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:02:26PM +0100, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 3:40 PM CET, Roger Pau Monne wrote:
> > If shadow paging has been compiled out short circuit the creation of HVM
> > guests that attempt to use shadow paging at arch_sanitise_domain_config().
> > There's no need to further build the domain when creation is doomed to fail
> > later on.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/domain.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 8b2f33f1a06c..8eb1509782ef 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >          return -EINVAL;
> >      }
> >  
> > +    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
> > +    {
> > +        dprintk(XENLOG_INFO, "Shadow paging requested but not available\n");
> 
> nit: s/requested/required/, maybe?

The wording matches the rest of the messages in
arch_sanitise_domain_config().  I'm not saying that makes it correct,
but if we word this differently we should also change the others
IMO.

> Also, with this in place can't we get rid of the panic in create_dom0() that
> checks an identical condition?

Hm, I would possibly leave that one, as I think it's clearer for the
dom0 case.  Otherwise someone using a build without HAP or shadow and
attempting to boot in PVH mode will get a message saying: "Shadow
paging requested but not available", which is IMO less clear than
getting a "Neither HAP nor Shadow available for PVH domain" error
message.

Just my thinking, both checks achieve the same result, but the error
message in the create_dom0() instance is more helpful in the context
of dom0 creation.

Thanks, Roger.

