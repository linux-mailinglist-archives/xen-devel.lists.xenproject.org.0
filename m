Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG3ZETneiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:16:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEC10F83D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225340.1531821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpR7d-0007us-LZ; Mon, 09 Feb 2026 13:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225340.1531821; Mon, 09 Feb 2026 13:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpR7d-0007t5-Hh; Mon, 09 Feb 2026 13:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1225340;
 Mon, 09 Feb 2026 13:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpR7c-0007sz-6v
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:16:12 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f95797e-05b9-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 14:16:10 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6668.namprd03.prod.outlook.com (2603:10b6:303:123::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 13:16:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:16:06 +0000
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
X-Inumbo-ID: 7f95797e-05b9-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JksPtjRrByi2SbCVEoXSZ4Dul/gNFdwq3689c4c7lBwpVBQAUAiGFTpFuFBwd5VwmAHnwR/BLAncCPjMkjxS1tH/z2SuT2j94Sj/rRWJNmVqXNgxgOcykEFeEUiG47YnfDJbIJMGegXvCLTCOkGG+b8zlSfwAck3jXOe/G752Kupx5ucYrk+ojNfjyfHA2PrmGa5gzKr6eko7zIKzCBZ1hMyte6nHoqQIIiFrZalXwBZRh749mmjpwVuvgPgAte0kSRbDy7sQyVH09QGYryUEpateJwcmnShkeMBI/pSKvEcPNcXoE3QoOeFcVsiMduggEztuAiKyEMz5M/qHYplUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzud+cLvqfABb4jnl6vBiJzYYIWClp5Iyz/6N6A1gKg=;
 b=PtTg3JslyrJs86EVbEq3tTGAEhk6mHlnE5kiw/EQCVSHHSZdwDJ1+TLUB90HrEgtua+aQNj9SYG+D4rpzicF67XgGpAzVoZx4B0SeyZUstdqOQ4BAshZ03E+s6Y0cmXrSNoo5ItmrJCku0o9OVxSjxX48GwhxlgTpXDYTrQupTsIxjl+2ThEdlHgnPTa4JoOIiH0gb4i5VufQS5kJLIPrs6eFbA7DqNVfEm2C7B1eHl6fi+G9wOW/s/auAuNTKJGVIb3rEM8qEUP0Yp2Eeydzy+0fYxfUTUDyHqCzZtduBQqKHZN0z3829PXWHJyoxhpzyWP+8U5bi+IUQJ3ZnP4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzud+cLvqfABb4jnl6vBiJzYYIWClp5Iyz/6N6A1gKg=;
 b=h6aDUV5BIZxBdVHo1ZE51fd1nZ8VJ41zBmmOSamBdA+heXOkOAQQmCsuE6xaf4zgTC0kCDvFYPTsKVV28YJ4WZV/uOEnSQThCq60weu0iiq3QK+DD6hvdjdiI9CDOc7ZA5gIvD3+dHrNq39TRT7e8QU/X4NzpZOiPhoqJVSAYUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 14:16:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Advertise and support extended destination IDs
 for MSI/IO-APIC
Message-ID: <aYneEnAa-LqQt8Gm@Mac.lan>
References: <20260209113412.2603088-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209113412.2603088-1-julian.vetter@vates.tech>
X-ClientProxiedBy: MR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: da3cf47d-e245-4a65-eb64-08de67dd61f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vkt3SGU4bUt5eHAzUHRKQUFxWTJIWUpsUFpXeUxuaVRIMmJNMEZGVURwV2pK?=
 =?utf-8?B?bHpWU3JOK2dUNktkalNxR3R6bE96R2U5M01BZGFLNXl2eHltdEU2ZG1sQWp5?=
 =?utf-8?B?VUJobXdCR1F4V3RoaXgxSUxTWVgyazZuL09nRUlvNHV1Z2I0dnMzVWdiejBB?=
 =?utf-8?B?Q0gvd0UyMmM4M0oxOGxRUUliakVkdjZpdjRjMDVTN0NUMGNaQkxqelI1ZTQ3?=
 =?utf-8?B?SGlmV1VpSUR6MmRqMUJjUkZXV0h4NnV3WVQ4VWt1QzEyZDNaZSs2aTJ2NENQ?=
 =?utf-8?B?UGdkS01oa05KWTV4UlppcGtqQkc0USs2ZWk5S01WVzM5dnZUL0gxUHh0VW12?=
 =?utf-8?B?QlFnRzNOLzRVV0I0VlZJQmdnTUlXZEFEbkRLUS9KZHg2bHFhUVFHRllCR2dD?=
 =?utf-8?B?YlBtZHJhU0kxOEcremhlMlN2TnFTbmh3OW9HK25mUFdtV24rZU41QzgxdGNt?=
 =?utf-8?B?S3VtWUE3TCtTS2dZRlMyby9RdHRld1NnbFZFWGFyMkVMRFBCMnBjT3lBSGpx?=
 =?utf-8?B?YVVYRE96WTZYNVllNVNPYmlXYjVMRFp4WW9JeDRLQWFCcVJrY0FwQVQ5a3lp?=
 =?utf-8?B?UUlJSDh5WVhtbzJxYmM3djF0emxJTU00ZFFLWndva29hZFN3SG9JbFU5Q2Va?=
 =?utf-8?B?MGIrZ29MZzEyTDl6QzJWd0FUYTRTMXJDeGlxeWVidXRBd01FclNmeDBxSjlt?=
 =?utf-8?B?bGk0SjFLeDRWWVdHNEdqaU5SVDI4bllyRFFLbmxhMmF6ZjVqT2sySGFCMW9L?=
 =?utf-8?B?RVRUaXVEM2owSDR6Z09iSjh0NC9NNEMvcHhDYlNNYnhxZUhLU0dOT1ltV2Zt?=
 =?utf-8?B?WlZZUWZiT0plNG9US3JsOGxySzY3L1gzamc0N1c0akw0UlA4ZmZtcWo1cUVE?=
 =?utf-8?B?djlUVVFVT0hFcjFIWHFMSUhPOCt4c1RqZjdSRDAvSHYxelJkYVYxcGhBMnFk?=
 =?utf-8?B?Vm1WR2doTVliU0djM284QTlpZHhsblNhSGp4QTVsUWorVC9ERFpIeHo2cTNp?=
 =?utf-8?B?L2JXY1BKQy9Fb2ptem9QcHVIMUdMaHJOcDJ0ZWhDNU9RV0RWRnMzbk9zbEJU?=
 =?utf-8?B?eGpuTFNlZEF2YzFLL09mNjVXYndXYXdHSE1maG1oSTVkcHZBNndOYWVkakZH?=
 =?utf-8?B?UXh6a0JGTGl2OXBwZmJ3a3gwcFdZU0E4VlN6OUxyQnBPNXNzdXlNN0tEeHZW?=
 =?utf-8?B?STBMZEgzRlo2enFaTWhiaUhMZnZrRmo5VEJycVdWYnV2K3JlL3prNXpKZUVV?=
 =?utf-8?B?S1Q5N3hmQ1VSWnorTjExbS9kUy83RmRtelhKTjl3a2xOanNLVldnTXpxZnpz?=
 =?utf-8?B?aFZ5Qlc2ZEQ2OGVKNWhwSWhhWHpwYTQ4Z0hmY3RzVDhxWmtmT1BHeWg4SUxB?=
 =?utf-8?B?UmVJWm8vTE1tQjcvREZxbnI5MjB6cU5Ua1pBd1Q1dXpKZTNiSVU3MmVRaHpT?=
 =?utf-8?B?MlB0S2czbUZ2WHdJaVFieDR4aDJrNnpyZU5jdjRpME81YjI5TUQxa1FES2E2?=
 =?utf-8?B?eGg0YmdGNCt1aitpU0l4djVKOFpWRkhiUGRWYjZoQW04UjRNUkFPMWlJK0N4?=
 =?utf-8?B?NTdSYWpJZzFFMDVTZytjWTFWcGlmY3lsUUhLbUVZNFFzZVFPaGVXaXg2MmRF?=
 =?utf-8?B?anFDV0QvMytMNHBEeGZ2VlhFaFkzRmJVWEYzUXVZWGgxY25rU01mL0lTMU9h?=
 =?utf-8?B?REhhc1RzMktPUTAvZURJWWV5NUN4em83N2tyQ0IwNVdXWVV3OEkxRE1xem5R?=
 =?utf-8?B?UHE4Tjl0TEVkUFcvcTBoTXNMZERRZkJYcEpzS1hCOC9hSnFONHVRZFJja2ts?=
 =?utf-8?B?WEJiMExraTNKQWVsSnZaYTR3ekxFOHVyQnNsKzNDRGxnZExQQXA2L0swQ2gx?=
 =?utf-8?B?UFMvbmtzbktiU0dQWE1IREhLUHlTSUt0SUY4MzllMU9qVC9weFB5dFVHTmhX?=
 =?utf-8?B?TUNMV3NlRWt3QWhTbE8yRlNNSzZKNUtUL2JzOVFSS25iUXVNeGFya0lUY2ps?=
 =?utf-8?B?RmRDU2xtejNoQktXV2dRTUgrUlgyck15dlVuUXZUTWtwMUowZEQvS09QZEcx?=
 =?utf-8?B?ZXU3Nlc4ejUwQmlCK2Yya2FxSml4OE85cVluTDcrNGJtdk1HcjR0QkVtZ3ZJ?=
 =?utf-8?Q?t7Bo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGtrNjdISVVvMVU0SnJlZmdJdFNsK0d3c2dUck1zTllrZ2NmVWREdFpibWxI?=
 =?utf-8?B?YUtuL2IvK3lYaWRkcnNtOXRHV056aXZIcXNaSmlWaFhqNDhhMTBrUU9xSlFT?=
 =?utf-8?B?Y3hJdmNkSXNVaC82ZXc4YmxQUVdTQzZTcWk0VFh6bURlcDZMdHdyMktVak85?=
 =?utf-8?B?R2pyb2NTUFducFVWMGJYbjhEdU9PY0FFdmpvcXhLUkRUWUlwTFNDcnVqcG1S?=
 =?utf-8?B?U2VNeGRqaWxLdEZ0R2FwSUVVU0lhRWxPUTRMMHc0Y1U1OTBhMzJGZnRvY3ZB?=
 =?utf-8?B?RkJ0N1dyamdkUFFtcy9Ya3pGNWRJZVllRk43V20wMEZobmo0d0pNZzAraGFM?=
 =?utf-8?B?MEpOcmFPSFRSWGE5TTVWUjRMYWZmOUQ1NkxCSzlZU2UwRWkvMjVPVUlOaDRL?=
 =?utf-8?B?RmtjVit2dUhGZ0o5REZXZ3dFVktONGZoZEo3S3VlcU8rd25lSmlFazJvUmhs?=
 =?utf-8?B?ZGtjd2FJenRoWForUDNvZjR1MUJTU1RFUUFkd2pxWEhoOVBsMkVORTNweDcr?=
 =?utf-8?B?U2hZbEJ4MTNyS2hDSHZ5WjNqU3lKLzJhbzBMN0I1eXk2SzVURW5pR2dyekJH?=
 =?utf-8?B?VklIZTdTclZiYXJYbTFyWXRibkdPN29MazdQc0sxQ2E5bFI1bFExWXZEVTRv?=
 =?utf-8?B?dHhBSWRZWnNpTGdVbnVQL3ZZZXl2bFFMUnh4U1dnWGxhOEFOT0FkV0VXaUJI?=
 =?utf-8?B?WkpEdy9hMUNZMFFBZXRqZEhaM2l0RmJqc1NuTjRHbnZlTnUzZGpZV3J4aGtG?=
 =?utf-8?B?czdGTnppUGl0cDlRcVI4OUJrTWlBWFM3dFdJNEQzMitDRzg3SEdPL05uV3dX?=
 =?utf-8?B?OTcrSVZzaE1wZEJZK3dMTDl2MnVDYWRhTjNyMTdtd1hJNHpPOS81WjVob3NT?=
 =?utf-8?B?YVR1V0s5c3pNcmszSmFGa1dLYVRZRHlsdWRyTEtzckJERzZRcXRMNWcycWpU?=
 =?utf-8?B?WFBWc3pEU3Ivem4wVU1qeGlRWDMxSW91bG43Z2JPOEJjRk5IdE1vTWU5Rk5W?=
 =?utf-8?B?a01hSnUwOHpwWlo4YVMvY2JDSGJoRThwZW5SdjRTZHg2ZjRlKy9VREh0WExi?=
 =?utf-8?B?TlhRR1dJTnVPMFJ4NGxnZEQ4ZmtBSTZTcS9RMFd6Y253SXlPNmdSL3BMYTRh?=
 =?utf-8?B?NDUvbjREdHpyam5tbzgvQ24xUy9YN0JwOXl2YVUzcElLa2VaYVFvb1ZYRENM?=
 =?utf-8?B?Mnlvakx4QWRsK3hTLzA0V2ovS0xWcDdsUnNYUlNmNTdYY3htQXVSTE9jOVpP?=
 =?utf-8?B?aEM5UUVQdXM1RlRMMGc4RkZ3ZHk0ZDZYNHpHdE9FTVhLOEtTU2UyTlVCZ3FT?=
 =?utf-8?B?cnFua3VCcSt2cEZHQm92NEJyVGVhMXk0S2FrZUhoTHlKS1RuOHVrR3hHdm1j?=
 =?utf-8?B?YjNRMmpYK2pjUXNUQkEycEJGVVIxME5Vak5PSlp1RjIrWHRMOEVaNGhScU9O?=
 =?utf-8?B?YUVKUXJHSFhwdUs3TlNyUzQzQ0hUOWJjeno2cENSN3NrS2pVUkY0c05ncmRl?=
 =?utf-8?B?QVlvZHVyb3psNUphZGJFY004S2hNU1F5NVMrZ0Zzc3RMOFlYRk9UVE5CVFFj?=
 =?utf-8?B?QUYwdUpkZGtkMnZFQ2dyWTJIZzAvUFl6NnFsL3M5bGx5QW5TTUxoVVVHMmlJ?=
 =?utf-8?B?TlBySmUyZVdoUUY3Z24rbDFsRE1ONjZEK1dNQVQ0N0FFSlBOeEEzVVFjRlFD?=
 =?utf-8?B?YVZUUUltYW80K3RoS0RUWjZZb0gwekdBT3Jnd1FqczNGV3pDM1E0RFBaWG9I?=
 =?utf-8?B?T2VlUUd3K25FWStFZGJUTkx1bDE2djFoSnp3VDdjUGRqR2N6d2RvZkJUOGtw?=
 =?utf-8?B?czNrWEJXcGQwcE5WdUt0RXloaTB3ZzIrV3BoN1EwZExQMktQZTQvL0xYcFI5?=
 =?utf-8?B?WUhwcWR2SkZqVWVZV1FaQ0VoYmt5VStyZk9LVUYwc3VXQXcydklKWlRsaDAy?=
 =?utf-8?B?Zlp3WWkvb2FLOGozQW56NFBQdHdrd1hYQTlibFFMYWJsY3R2TVg2OVFWL1g4?=
 =?utf-8?B?ODZhWnB6alJiME9PMXdnWVFaWHVrZVdzS2VUZnF2SE9EM0hvTXdmQ2piNUN0?=
 =?utf-8?B?SWpJeXZWakNUcFRWbG1CWjMveDJvaUpWSWY2S3l5dmFzVnZhbXJ5MllCV3Yr?=
 =?utf-8?B?UzVPSCt5TksxNW12ZTBaQ1ZGOVIvMnFWTFJhUktheVM0N0ZBOWZCc0ZCR1kv?=
 =?utf-8?B?Qi96dGNJYnkxSVRCVVU0VVltREQ1NDBIem1NUnpKWUtJUFQzbS9PTmc4bDFt?=
 =?utf-8?B?azdtRnVPUERGTUxNdGRHOXBaZkdaSmx6czl1djRBc2djQytnNC9qMndBanZW?=
 =?utf-8?B?MXlUQnZqUFltdkJWdWxKQWRlSkNQNjNBSWZLZ0toWmd3UEMwQ01Cdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3cf47d-e245-4a65-eb64-08de67dd61f0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:16:06.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhwrLMCJBUbU4NRxsn9BXHX0nBh1HXRz+AWLtTKZLIc3L/T9ge4OP6xJgtpHr1rygtdbY3Zd0bGb5fnKd/pgAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6668
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 97EEC10F83D
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:34:18AM +0000, Julian Vetter wrote:
> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
> addresses and IO-APIC RTEs only provide an 8-bit destination field.
> Without extended destination ID support, Linux limits the maximum usable
> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
> bits 55:49 as additional high destination ID bits. This expands the
> destination ID from 8 to 15 bits.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  xen/arch/x86/cpuid.c                   |  9 +++++++++
>  xen/arch/x86/hvm/irq.c                 | 11 ++++++++++-
>  xen/arch/x86/hvm/vioapic.c             |  2 +-
>  xen/arch/x86/hvm/vmsi.c                |  4 ++--
>  xen/arch/x86/include/asm/hvm/hvm.h     |  4 ++--
>  xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
>  xen/arch/x86/include/asm/msi.h         |  3 +++
>  7 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index d85be20d86..fb17c71d74 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
>          res->c = d->domain_id;
>  
> +        /*
> +         * Advertise extended destination ID support. This allows guests to use
> +         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC RTE for
> +         * additional destination ID bits, expanding the addressable APIC ID
> +         * range from 8 to 15 bits. This is required for x2APIC guests with
> +         * APIC IDs > 255.
> +         */
> +        res->a |= XEN_HVM_CPUID_EXT_DEST_ID;

This cannot be unilaterally advertised: you need a QEMU (or in general
any device model that manages PCI passthrough) to understand the
extended destination mode.  This requires the introduction of
a new XEN_DOMCTL_bind_pt_irq equivalent hypercall, that can take an
extended destination ID not limited to 256 values:

struct xen_domctl_bind_pt_irq {
[...]
             uint32_t gflags;
#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff

When doing PCI passthrough it's QEMU the entity that decodes the MSI
address and data fields, and hence would need expanding (and
negotiation with Xen) about whether the Extended ID feature can be
advertised.

It would be good to introduce a new XEN_DMOP_* set of hypercalls that
support Extended ID to do the PCI passthrough interrupt binding.

Thanks, Roger.

