Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BECD24A9A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 14:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205081.1519528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgN2u-0007FG-Pm; Thu, 15 Jan 2026 13:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205081.1519528; Thu, 15 Jan 2026 13:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgN2u-0007Cm-MD; Thu, 15 Jan 2026 13:05:52 +0000
Received: by outflank-mailman (input) for mailman id 1205081;
 Thu, 15 Jan 2026 13:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgN2t-0007Cg-39
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 13:05:51 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e975e7bd-f212-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 14:05:50 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7777.namprd03.prod.outlook.com (2603:10b6:408:28c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:05:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:05:46 +0000
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
X-Inumbo-ID: e975e7bd-f212-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO7NRBuk9Qevn/5dSw+Dnxw6pzaOdUvuTtgtKDff7xxZm2tgNu7+WrXXdnmAKZb9NnQxzXkTw2MyKd2NmJB3cgnwtH5WNMy0rcuN1+i8oTfLh3devEOo4SsR3TX7U3T+6zWZTIX2yJZc2+tgz/U7sv4AgrgrpZ8L5nbUXzyTTDCh2rJBOwNQVWgKyQnXgcSjL2wMZKMaO4HiNRRPUNjnR0JeRRYRtaT0O/6TFU0Qw+5uuG18IV9z5OqSQ359ODh46QV7rUVKdqMvgjtgp01r3UtaWh6YTs0yrkoOgvnJSixHYJAW5gSAH+rJ1aFStzywDTqmmqM58/D6M87Gq1nrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpV821/MNKcxrhFf1YrO3uDU67SP6H8I+lFrszztmZY=;
 b=KhiJzMuU48OPIpQCcvfOnWi85e8mf4oDlcsMQynkihu9+bIG6R304K9Qb1NaY4yzMDb9xkQAlOiSMmLcA7I8LYSSLvuyA2AhTfZMAdkjBCpkTQ7v7t6kexJEoC5EI+GHC2NNnclBm1B0+YHv7dHwxPMj1ShGP948WOrWXUjcTlLi9Q18FfX5/ZS0tEoO0pofXmpNj+6Fs+aAZfi07Ulk+qoXwu3O2+BfzV7HaGyToIE8w73h59crfTajYTByDPp0Si8PZObR0Xz2LakoQ90MlwHrYkTBlbAd+oWT3STWmnVGd5iIi86p+eLC2z+xi7tttaQazZc4+nChPNS1Nhp3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpV821/MNKcxrhFf1YrO3uDU67SP6H8I+lFrszztmZY=;
 b=MjDLN+VlPqccfwkPkTTU0kMdB9V2Dt5595H59YbXzMLTPAmE67vgdGLXl6LKm03lMvjl0+iNZklqNR9TfKbI3ptTIJ5MwcahnoCtw3qXUdVnjgtH75zU7bEnbS/nFv60FHYahyl4Wgfd3hCIeO8rFjlO9DNvssItD1YB/iCeJUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Jan 2026 14:05:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
Message-ID: <aWjmJrWV4VoCOGVF@Mac.lan>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
 <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com>
 <aWZQLL997K3MTQY4@Mac.lan>
 <b535344e-1f27-4d5c-85aa-1529868f85fc@suse.com>
 <aWjGDy3ixLRTpZbF@Mac.lan>
 <14560e88-bbd5-48e1-848e-e53a3237d16b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14560e88-bbd5-48e1-848e-e53a3237d16b@suse.com>
X-ClientProxiedBy: PAZP264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 7619dd5c-834e-48bf-8d83-08de5436cbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjdMcDllZWh1MDltdFphQzhTdzRTRVFuajR3U2hOcGlUMlk3ek5rbXJRQXZI?=
 =?utf-8?B?Ykg5Y0loWWZrN0FLOUE5SFF4UmtKUTZibE95c3JZOHo5c3JmdVBxSUM4S3ZC?=
 =?utf-8?B?U2FnVmpiT2NPMjNFMVBWSkdiL0xsQ2lVVXVNMmVtQUVLdHYxSC80eit3MGUv?=
 =?utf-8?B?b0xvS2FpVGNQOWJxRDZkcnk0R0pGQUVFbVA1K0VvWm52Z1JzcitBdDh0aFZI?=
 =?utf-8?B?RVNyRnl3VjRTRVZRcXFnckRyVDNoSlZFQVhWd0pLT0VjdDY4ZXZHak5aZEIz?=
 =?utf-8?B?bFJDN3NoWERUZWlCZDlGWE9LSEUvdmxrSW9aSmxZVnphYUZDQXNlb29MYUtI?=
 =?utf-8?B?aWxRaFRFZGZDYi9zQzFnT3hGdDBxZUcrTFU4ZTF1ZlJIdGlJa0VhWXg5emQx?=
 =?utf-8?B?MkRYZWxiWFIvZE9YMTFzQlhUZDJzaGtUVTNUM3VaanBDWnpQY1dIeVU0Rytp?=
 =?utf-8?B?cjNIaWtjckM0QUdzbXl6TG5Yc1JPalRCVmFzMmFTQTJTcTRLeWpYL2xYSkVF?=
 =?utf-8?B?NSsxVGNscnordVNRa2FyN0RFRTVkSTJGbkMxTTQzQzVEK2lXY011cEhPM296?=
 =?utf-8?B?R2ZENTZxeWZpR1hNR2Z1ZlBWMTB3d0Z1RHZhQXRCbEIwOW1lSllNblI5ZW4w?=
 =?utf-8?B?MHNJVVZqT2hScEtNSXUrNXZCcDcyckZTK0M3R3hNWkJWYzI1Q1E2WU5YUEhm?=
 =?utf-8?B?SUI3QUk0RlZoZExtZXNhVXBqUUlTNWNWZG5KdjdwcWNtQjEvUGNiN2o1ZVVT?=
 =?utf-8?B?Qm9ieHVtTHlaemJPUGhwL3BMcUJyaXM1UTlUUkpQS09WNDFxSGdwQWdhM294?=
 =?utf-8?B?NVhYVUVRM2NrSGxqR3B3eVIyT3Z4aDNWSHJwM3R3WDR5Mm1tZEwxenVvMVM1?=
 =?utf-8?B?cXgrT1BzT3lIN2FnQzdRUGl2YjRVWURxMjRSL2hHNkdFR0hST1ozYXQ1OFp3?=
 =?utf-8?B?OVM5OXc3WlA5MUhPNUxrOWhUajJFTys5ZFByU0hTMlFxM3VNN3NXdGQ2Smdn?=
 =?utf-8?B?bi9raVhNVWFnZEtlN25pV3J0MzdYbVkvZWR6S1oyVThPaFhVUmlVc3dDM3V5?=
 =?utf-8?B?NVN2Wjl0ZC9nWEU5T0pNdTAyTWxOdy95dXlsRmZqNnpvekhpdzRHU3lzZ0hw?=
 =?utf-8?B?NlBvU3RFWTBDZWhLQWR6WjNkVmYwTEI4U21na3RZRjJrN0hlSWlWaWVDVkhk?=
 =?utf-8?B?Um1TSFBYK245bjJ1elJWU0crODlEWFRKQUZZKzY3S2VQOGhTeFd2cDJ0a0sr?=
 =?utf-8?B?RUxGYlIvUTY1Sk1IeHVnN3A0ajFmZGV6NmFxQ3VHYVhYQ3hGT0JDYXdSSnBp?=
 =?utf-8?B?bkJRay9BTEFpeGxELzFweUVQK3hVeGEvb0M3Ty9XK3lxRGJ0NktkTlJBeDJw?=
 =?utf-8?B?aFNzUDFjSURHU3BjSEtTL3I2R1VCcGc5N1ExTWxaQjY3SWNnb0w5bEIzdVQ4?=
 =?utf-8?B?bmtwdzZvVEhVcjBnZzZHZktERU45OEVDLzg1TVlsN1V5d0phTkw5L3ZVSUE5?=
 =?utf-8?B?bHdlZjdJOVFXOGtqeW1pZ0Zvajk2WjVvVlJlU1g5R0Z4V3IrWGdRdVNISWRI?=
 =?utf-8?B?d1VoM2dCbU4vOGRTUFc1T1ZPRk1vYkorZDBOb3luNi9NQmoyLzF6YkxYWmlP?=
 =?utf-8?B?eU0rVzRJL25peEdVRUYveHZlNlU1cWQySUxyNDNTQ1BkRm0yVzZZVGYvMnVo?=
 =?utf-8?B?aWlwenNnTjlidGljVjhkT1FsZXF3dWk0ZnZDUTIrR1lOb3RUVGhqNHFXNVoz?=
 =?utf-8?B?RlVqQVJIdTJlMkhxaVA2Z2IwQTFZYzFOYmk0R1ducWVuM0hlUE41LzFIOC8w?=
 =?utf-8?B?Z3NTbHM3a0J2OWQvRVR2Q3NPbVp2REN2TGFKZnFVeWRIMzBrdklma3U1dUpt?=
 =?utf-8?B?cmFTZ2hDRWZYdk1OK1VWZVpMRHB5c2ZyNHAvdHhraXZGc0VZV09LVWV6MHFw?=
 =?utf-8?B?T0hyU3R3d2h4ZnIraFNtOWNQN3hWQ0JRbk5qcDByL2pZTEh2S0dYd2hNbFhw?=
 =?utf-8?B?MmtwcFRieHZHQnZWVVhjL3VpanpNWjhNWTRHVjlycDVFeVdhUXlwbExQaWpC?=
 =?utf-8?B?Wisyb1hLNVBEOEVXbldJNUZtWU54WlNhaTVUNmVzQTJnNWRUYVppdHJjOGU4?=
 =?utf-8?Q?AwNM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STdRdTB1djJUOFhIV3g3NTNhdUJWVVNHRHhJdldGdWZlUzlrRlF5TGdGWmpX?=
 =?utf-8?B?UEMxUWlHTHo3T2xya2w0cW1LNzZYYmdwRUZXRUowa2hJNEs4U2RUaVlscnU1?=
 =?utf-8?B?am5xOHZPWnhlbkVhOHovcDRQdVhhK1VFZG4zT0tRYTNJQ3FNdmtIcUQ3TXIw?=
 =?utf-8?B?TE41QjE3Wm5XTi9Zd2E3TU9xeTZtaWFpS0Y2QWZiWUhMT3F1VXBjUXBrOTc0?=
 =?utf-8?B?a2FoVEt4MkJITGQ2aHlTREtrNm93azFDYWo2MlB1ZHFuQzU5RXIvYllwT0l2?=
 =?utf-8?B?a21YZjhZMU04QURtUHZjc0ZIOHgyOE93RVZDMzBScGxidHpScFVzQ2lIdUdz?=
 =?utf-8?B?WGtNK1RickxMV2UxZUZZZWp1aEZyYlVJSmJPaDVpZVFYSFJ2bGV6VitsNHlO?=
 =?utf-8?B?M3BiUzVhRjBFRys5bkZVS0tGSVNyT0pUS3VHcG5MUDlKNnJJbHYrbllTRFhF?=
 =?utf-8?B?YUlzWW9ZcTY1cWRaZFlpeEdUcFJzR3o1MTNoWnhGOEwyaGw1NkJ0V25sazc5?=
 =?utf-8?B?THZ0dElCUlVEWlNyaHN1d3RaNHVDUDl4UjIrUFYvNUlvMXNmRjRSNkpBVGEw?=
 =?utf-8?B?b3hGRXB4T0E1Y3RTM3F1RzZkaFBjTUlxa0h1L3liRWlJOWRzb3U4YmgvYWFn?=
 =?utf-8?B?OUcwM3RoU1crTE51bGszVm01NEtyWTR5cUI5L3BMNklSL0h1dkdGYk8vY2Uz?=
 =?utf-8?B?YnBCMVVSd0NhUzlIWTFpWmNVK1VqN1VuRXZjb2Y5UUpMOGRGQmxYNmQ5T1pj?=
 =?utf-8?B?WnNzUUVJb01TRm5ERyt0QzB0bXBNejdXMTlZUlYzUkVvYWFOZ1c3QzRtSXhX?=
 =?utf-8?B?KzNuVWpIMnVKaHF1RGsxQ0tqNjl5RWpWY3hpa0dxWjZpenQzRkk2VFhQTGxP?=
 =?utf-8?B?VFppcmxZVHRIMHdwaXlYbzlUQ21mUWhLKzU0cEVaN3pUVG9kcStJbjhKWi90?=
 =?utf-8?B?M3VwbGlFRGFXZ1ExQ3A0dWNkdUMycUpuU0pCZnUvV1orQnhjM21ueWJFR1ZX?=
 =?utf-8?B?bG5TWnRVRE1sd1BJL1hUYjA0SkpyTzVDdjJPK0RFZHlkUlNQbDFtZGg0akpH?=
 =?utf-8?B?b3h0VnhBY1lSYTBMUWJDZjM0L1czYXhXMTNIaDlZQ0lkbzJqcDc1Tm4xNyt0?=
 =?utf-8?B?VnluNy9kaFdTMFRCTE83b1lDbmpFWUkxejhidEQ2c0NCRWI2eXViRVZwUk1N?=
 =?utf-8?B?RzUrcHJrcTJuek1xTGlKK1c5QkhKeC8vbE1TV2g4ZlJsV1IzOC9iMU1WU2JD?=
 =?utf-8?B?dXJYNmUrYXd5M3BOQUFtdTVITE9GcHVvNlJpbTMrYjUrTUFFSkNkWWRkYTJu?=
 =?utf-8?B?MVVtR2VFeE82ci9NaFFQZlkrZUFNWUhkMnhVYWJPYk5BZVdNNDY2VGwraUUw?=
 =?utf-8?B?QW5Jako3NUJ5bklCNkxiNW92cDlXaTFEaVBoVWJ0em9Ob3B4aHJmeTlIeU1p?=
 =?utf-8?B?bjZJQ2hhZ2pyUnNTb1phQlM0RHNHTU1ldkE5WFpFMHlIRm5wclRkcGNvWU5z?=
 =?utf-8?B?WFpVSjhZT00xdWVmYjJ3VWNOVXdPS29LeWdjdk93aE5NSkF4cy9YWEtUSTcw?=
 =?utf-8?B?NnBXcUJUWnBDZFh6b3JMNDc1dzJYM1JTY3pibk9yTWpqL1FtcVM3bmkrT1Jr?=
 =?utf-8?B?VE9XYjM2NEkydUpFc2J5OEl2KzRlVmQ5alN5bmUwelF1RDNwWjg2ZFM2SjJW?=
 =?utf-8?B?OGJYdVd2aTBReG5ESEx2YSs1MlJyWVpjN25nSjFTS2M2VzFuVHhMejJXK1VS?=
 =?utf-8?B?SWpmUFhqL244YmdnalErQmNrWkNoZk42SGFkS2MySmZSSWRJRkRDWS8yYnhn?=
 =?utf-8?B?NUsvNjB3YmlGR1IvWHhBUzNsMTdoWHZiSUhvV0xZOVRGYmF5c1A0ZUg3YXNO?=
 =?utf-8?B?U0VxUmVBYWtoc3BCNTBubUpjN2RLMmMwSkVkTGRSNktkS2NLZ2FLRjBRM2FB?=
 =?utf-8?B?dk5PUGh3Z2h0TDZBeVFualpqVGhxQlB5VHJOYTVmWm1CMW44R0pMM2s1a2xT?=
 =?utf-8?B?Q0dCV2IzaS9XSkNKeE5leVhXMnl2c2NRSFNJUWQrbXIxckY3dlZEN0VLY0FN?=
 =?utf-8?B?UllDOFErdm5PaTlUNmJ4NTZ0OEZkcytnM21UdWZYVGZaWFlLSURVUnlLOTJQ?=
 =?utf-8?B?TWxZcU5RditVTzdRMURBL1Vyc1pKTkUxdkVBY1VSWGZsZVdaNlF1OUQvNjh3?=
 =?utf-8?B?Q1JSRVNhUHF6VCtFWmdPMk1WRGhST3pUUjVMVGdraGdiS2p3R29Tb3Q4N3JO?=
 =?utf-8?B?YytpRFkxamZrQ25ka2FqQzhyYjdXSm44aG4xazQ0VnhqeFZIQU41bDl3NFZZ?=
 =?utf-8?B?ZldlN1dubEE2WitLemkyTVZEYzVVYmZxb3R3MzE4Y2w5SGZhZUV6Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7619dd5c-834e-48bf-8d83-08de5436cbf9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:05:46.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cwpg4j1qxtuvC3lZN6XskPuhKZSP3d82xlFojfxYz26QlwC5KH8IpeATsBTz8q3SE3eudO01yFU0a/Y+pf7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7777

On Thu, Jan 15, 2026 at 11:56:16AM +0100, Jan Beulich wrote:
> On 15.01.2026 11:48, Roger Pau Monné wrote:
> > On Wed, Jan 14, 2026 at 09:48:59AM +0100, Jan Beulich wrote:
> >> On 13.01.2026 15:01, Roger Pau Monné wrote:
> >>> On Fri, Jan 09, 2026 at 12:19:26PM +0100, Jan Beulich wrote:
> >>>> On 08.01.2026 18:55, Roger Pau Monne wrote:
> >>>>> --- a/xen/common/memory.c
> >>>>> +++ b/xen/common/memory.c
> >>>>> @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
> >>>>>  
> >>>>>                  if ( unlikely(!page) )
> >>>>>                  {
> >>>>> +                    nodeid_t node = MEMF_get_node(a->memflags);
> >>>>> +
> >>>>> +                    if ( memory_scrub_pending(node) ||
> >>>>> +                         (node != NUMA_NO_NODE &&
> >>>>> +                          !(a->memflags & MEMF_exact_node) &&
> >>>>> +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
> >>>>> +                    {
> >>>>> +                        scrub_free_pages(node);
> >>>>> +                        a->preempted = 1;
> >>>>> +                        goto out;
> >>>>> +                    }
> >>>>
> >>>> At least for order 0 requests there's no point in trying this. With the
> >>>> current logic, actually for orders up to MAX_DIRTY_ORDER.
> >>>
> >>> Yes, otherwise we might force the CPU to do some scrubbing work when
> >>> it won't satisfy it's allocation request anyway.
> >>>
> >>>> Further, from a general interface perspective, wouldn't we need to do the
> >>>> same for at least XENMEM_increase_reservation?
> >>>
> >>> Possibly yes.  TBH I would also be fine with strictly limiting
> >>> XENMEM_increase_reservation to 2M order extents, even for the control
> >>> domain.  The physmap population is the only that actually requires
> >>> bigger extents.
> >>
> >> Hmm, that's an option, yes, but an ABI-changing one.
> > 
> > I don't think it changes the ABI: Xen has always reserved the right to
> > block high order allocations.  See for example how max_order() has
> > different limits depending on the domain permissions, and I would not
> > consider those limits part of the ABI, they can be changed from the
> > command line.
> 
> When the limits were introduced, we were aware this is an ABI change, albeit
> a necessary one. You have a point however as to the command line control that
> there now is.

In addition to what I've said above: the limit that I've introduced in
v2 only affects dirty allocations that require scrubbing.  If the
requested order is available and scrubbed the limit won't be enforced.
So the ABI is not changed in that regard, only unscrubbed pages past
a certain order are considered as not free.

It's possibly best to move the conversation to the v2 proposal and
discuss the limit there.

Thanks, Roger.

