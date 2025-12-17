Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313DCC8C63
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188932.1509933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuPI-00073R-Hm; Wed, 17 Dec 2025 16:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188932.1509933; Wed, 17 Dec 2025 16:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVuPI-00070h-EE; Wed, 17 Dec 2025 16:29:44 +0000
Received: by outflank-mailman (input) for mailman id 1188932;
 Wed, 17 Dec 2025 16:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVrU=6X=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vVuPG-00070W-O6
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:29:42 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95640bf2-db65-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 17:29:40 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 16:29:36 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 16:29:36 +0000
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
X-Inumbo-ID: 95640bf2-db65-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdyA7uuZKxdrMCJ/DO4V5SrB0HPAWQ5m0AnmJb6cXIpl3GEQWcW5Mio6xEZazq3r+c9E509eG1JJd5u6Xx84k3jCSSJ1ekbWhY7+8e/Y5leS24sutobGCmb7StV9j6kYC/N1m6a/PIs7q2LWXPMSHPiGRGOpZiKQOFecLDKcaWqKa3hDD2kmjl40WDoy33i809XMt1CiG2CV8pbK5WRSmZ1TrvU3peiSBGaBpWlUMTA5P0RUiqlnANDTAI5Jdls8knMMnRENnOVj0r3g1OU/g6OIOyMGa6EaAoSCHFeq8p2CSlb7TGKkqXVkGkXPiDQoxsHaC9zNq0NPuxwibhijXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUUA2dbaYyRkhI72bQIFl/s45CQ0WeI786O5IMh3KAE=;
 b=Gy35SPxC/OztlQediihDARRdFh72W+aDxUMcSLJ3uh8MGSyjem2y+r4B5byj3XaPXzx7Q+eGknHCT2WwBRgC3jJb69RTQUVG8kLYAm1ZvWhA9YBjn6YQGj55KQ9iFxq209pio/tfdT1c5LqahbLucqTWmz4Ozgk0K+zySj5xXAO0BmCB+IQstSkay/x6le48NFBkT2Dzxh43TqzJNpCO3bK8zD1NVSYwYXr47wFgSKjVEJ9o1NkxCLdj41e0Z3qogRfqX/I5znrgee3ZPpTRNAJ/TMUELMGNkJaFOio6Z4m0accwMWaoN5XSSICp5VhMehifydmvMR7h5FRA7ekqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUUA2dbaYyRkhI72bQIFl/s45CQ0WeI786O5IMh3KAE=;
 b=Xf77+ytxUdpyvZkKyIMEmSvqBlGe9swl3G2wmdI0o9lzgYLUP/iw2UAV9U1awd0GpMZnu5oorEs5G/Kq9UmVzfPRbE2D0K0OS2f+lyE3iNI9o945t9GGmN0FW7h0fsforyy7o3gOV/QY2aLGODfca40TghntFz1wUYyuLwHpJh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 Dec 2025 17:29:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/4] tools/libxc: Delete ENOSYS squashing in
 xc_domain_claim_pages()
Message-ID: <aULaa1EVjOYZL7-F@Mac.lan>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
 <20251216163230.2768186-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216163230.2768186-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PAZP264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::21) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CH2PR03MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: 496e639d-6a8f-40b9-6c81-08de3d897792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUMxLzNyT1JJaTdLMHA1dm5GUHhpUnNWdmhZd0VOUUtJWEdUVmdRMTd1anI2?=
 =?utf-8?B?TGVYeHhUbDJvWGtoaExzOW1ZK1dXWE9NbWNKZmMyQ21kSmRwRVVtOTNDeDkr?=
 =?utf-8?B?MisrcTFrK0g1WEdRbE9NWUthbDhxMko1OWI2NVZmSzlLYm9DOFZ2dFFRZldw?=
 =?utf-8?B?YUJtd05IaEZLMnlUQ1pkSGswUFVjRmMwYXNxRHBNamV6WU1uc2F3bkNnK1Yv?=
 =?utf-8?B?OStEZTlFaC9HeEJUdHR5T2MrMWxYY1U0dThJeERwYUJaK3piTmNqQmdFZVFk?=
 =?utf-8?B?UWxEWU82bjc1SXpNbHFNQjQxM2FFSkRnY05ZdWRCaXlESXdabklTS2M3L1NQ?=
 =?utf-8?B?aGJndmRreG9IRmpMQUlKbmZpMVpRSmVaRURsdmhLRmhveVBYbEtWc0xUMXR4?=
 =?utf-8?B?cTR4cDRRL2hFZHZ2NWNBejNOSUw2eFFHcVJ0b1NodlpPbXBYS2FMZUhUYlkv?=
 =?utf-8?B?ckNyQms0YnRlaWFRajQ5SDc2WFdTclZCejU2WFM1eHlVZXpheElFbk9JVE5s?=
 =?utf-8?B?Yy9TOC8xbDN3ZEIyNFNWMkdqN29pR3Fnb0t5TUlXUEZKa2xHV0Z3Mm4xdm9Z?=
 =?utf-8?B?NjUwRGhYNXZsWlJJTk5pS0FYREE0ZlpySmMrRjV0VmFwVkQvYTJlQU5mMnQz?=
 =?utf-8?B?T0tTOElSZUs3Um5xdFlsZE96U3pCNUU4S3pJM0hsM2U2ZVZjV1J4ejBiNWxu?=
 =?utf-8?B?OUUxTXUybnllaUdseVpZN1BNRGR5Z256MCtEanArS1JnbXJuMUVTSytEVXBF?=
 =?utf-8?B?RlJ3RjlFZmlhRmlreHE4TlRWdTJObG1QK1BFNDIxa3AxSWtqY0ZyWkxjcmRH?=
 =?utf-8?B?dkNXMnZlODV1cVN1K2pVckdvVlB2RWJOdEFubGR0eGpYTXNkRG96bTUxc1BS?=
 =?utf-8?B?ZEs3b1MrNy9CWHlwamZtSFRxdnE2VmQwcWs5MlRudE1GRHZucG1NaW1DNlBx?=
 =?utf-8?B?Ynp4d090VW9GeTFKWFFManc2QTErU24zVVV5QjRWOWdBTWtMbVQyRVp0NHVV?=
 =?utf-8?B?TmI3MDFtRGIvbEovbXA0ZktXT2xEdllPZ0xWVzVnVXFNN3oxeThQNzd4R1Va?=
 =?utf-8?B?VENlNjIwU0dDakJpSUw4SFA0bS9sVHZkdllvSnFXSm1YbittYWJCU0FPT0JE?=
 =?utf-8?B?dHFlVWpOeGdqQ3VBOC9tRmRzcnJsYmpYR2k5VVhjWktqQzRNWitrRWV0WjBp?=
 =?utf-8?B?cFNqcGdqcDRJSi9TelByd25JS2dpZ2tDVWY5TERqUEd5NzVKcW5PNFlPdjN5?=
 =?utf-8?B?MTVqUXZKRTg0R25kb0JsZVVKVGJvYXdYelVKQ0d1bTRwbVZ5TndnWkV4dkxZ?=
 =?utf-8?B?ZmRkV0lFdlQwQW56cVhpMGZrTHI0ZFNISmsyZldkK0ozamI1dmEyQ3g2YnhR?=
 =?utf-8?B?eXc2Sy8wUmNZOFhZd2lQdHhtM2NkV1c3VU1nZFQ2WFYrNHY1MS9NSmp5eFFk?=
 =?utf-8?B?ZW0vVlFWcFVwOGVNd2FVd3MweXc5VDJJUXlKNS9yU2UrQmJSZnFaS3dUVVAw?=
 =?utf-8?B?ZU5NRjd4aTU3Q3RJSGJHNFU3MFFwbWp4SnlSbUZIT094cEYyb2RvazM3K0Nk?=
 =?utf-8?B?REkzS0YrWkh5a0ZVU01YSjAvNG82WUNkUUQ3Y0FEcGFlejAxT0RwSm50TWdW?=
 =?utf-8?B?Z1lqUUdabHY2clI0a1dsNkhxbTYycTdldUF1dVhSZERheENBV0JXRXpOV3Bx?=
 =?utf-8?B?Vmc2MFJrRnVKNGZQdnIvYWtFbGl6b0FoaDNDZkNOdk1IVzF4c1lqUnQvQ0Nh?=
 =?utf-8?B?a2xVc3FUR0Z3ek1ZTEVmWVBHZlhxSXVZdnNwb1lPakdDcTFiRWg5QVhmNHVZ?=
 =?utf-8?B?akdjVEZJYUZtc0JKbTJNQndBRWYyb0x2QXRud1BVd1lVekxOZUlCRFpVTHpP?=
 =?utf-8?B?eS90WldMWkZJTjhvSHRuQUhHWFJQTUZRdXRmT1F2TUc5b3l5QlFmMUtsT0px?=
 =?utf-8?Q?6GjwAz/4ngKeaHhF4mlR7Phy6kxxsJxP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmQ1U1dvcmxZN0hHQVBDWkQyS1NYUk1HQkRBTHo4eXpZRmpJTWFTMlZ6c2Zq?=
 =?utf-8?B?K3VZTTZWK0dsL3BZd2hKdFNBSnR1VG1ZeUN6NGhDL3dNaGdtekdHOFJjcXJ4?=
 =?utf-8?B?WFR0OXpKaXJWaHZYLzVnZHNmL3ErRjJuUUtzWnBNc214T2JxYjlNa2pZeTRU?=
 =?utf-8?B?L1YyWTQ3dC9iOHhMRm1ITmZxcEZ4cEowRklLbFF4czBmUG91YkJWY3VRWFFI?=
 =?utf-8?B?WTJEWjA5L3VVY2NLZVN4a1oramxFc2dFWkRXTWZTWWlyc1FPNDFPSXVabEVv?=
 =?utf-8?B?L2hBb0R2ZTQ1Y0ZOeXB0NVZSYTNPZlVHbm9qQnlOV1d2UFBKa0xZcHJLc2VM?=
 =?utf-8?B?eUZVdzBjOER3cVlBRURYbkZadnYzcTBodmNXUWM5cDA5a05uSDdsbXZGR0k0?=
 =?utf-8?B?ZWVsVTIreTdrNE1zZTlVUG5hdmdvSTVVV0RsMjU2UW95TXh1QVNxczN6ck93?=
 =?utf-8?B?WDZGY05SWWRuaFlySlRzM1dhMHhaOE8ycDhSczFvN0ZBQlJOWGcvbGNRblIx?=
 =?utf-8?B?REdiMmRYOCttbU5qQ0EwdVU2QVpQMmJhSkVzbnk1Z0pvRlI4cDYvYnR1Znhm?=
 =?utf-8?B?VWFyU2RtU0JEakpLYzd4cFBuZk9CQm9paTZCdVpaTkVOcmIzWFNINVlaMWND?=
 =?utf-8?B?RkJXOGtrQ2JzYjdINDhPVjl3dnlYb3JRb0lUd3oxcU5uMGdkb2QyNTFoTnpj?=
 =?utf-8?B?cjNLQkIwOUt3dDFEY1FyMmIxbGZwZ2lCN2gxT1NWYkwvQml5eTl1d3FBbi9H?=
 =?utf-8?B?OVpFWmg5dUJyeVRBcm9mcmlOUDN5WTZwRFdYRVRvWFdhWW5DZGxaMko2aFIv?=
 =?utf-8?B?UFNhTTlGaEVRYWR4ZVN3eWovN0NyRnVXZlZxMnZJZzYyWTh6Y2JoQllWV1hR?=
 =?utf-8?B?ZXZCUEpkS1Q4aFZLOGVyZ1c1cmZzbkpNdU1DQmxaSGEzME45VU1Ta2ozeUVN?=
 =?utf-8?B?aDFOUHJ5amw0b0FpbklnK3BKVjg4djc2TGROcUN2N0daWGJXMTlZcTlNME5P?=
 =?utf-8?B?V243aFlVREdzK2xaalk5TS9mbHBjTmhIZGJTSEhDaE44S28xVnVMSGIwWlpr?=
 =?utf-8?B?R2EwTUpGV2s5Qm1vNkUzd0d3TnM5Q0h2dTM1eDVSNGI3MVBuWnRNYzFFR1Na?=
 =?utf-8?B?UUs0VWxZclgzT0xraEprMXJYelN0Tk9oOGlkS1FaVndBWGxLZHY2eGZxeUpu?=
 =?utf-8?B?UE9lZ0lQcXZFTUFBU1pDWlNLR0FqQk1QRlBFNEVFTHdkRXdHSkxEMXZWZ1lq?=
 =?utf-8?B?d090RVdCU2xYOVZiMjhja0FZQVdtQ2U0VlI2NFB6cWVobU1pc0syOW9LNG1a?=
 =?utf-8?B?NEJXMjEyNFNLVzFrSER0SUNSQ3lOUFUyclU3dy8wbTU5ZlZTSW8vMzVtSTFw?=
 =?utf-8?B?cGpIZW5YMEs5QUdNbCtmWlRsSUtEU0pQamtDR01pREpsL2JHM1UrbVRvKzQ3?=
 =?utf-8?B?NDVDVDRJSGNpODZVMVBxNGNkcFhPUTdRQlJLdVBBRmh1Tk1uL3QwSUZyYkZD?=
 =?utf-8?B?UGdONmRYVGhLenJqL3ZOdldUZ0w0dHhmZW9iTFFQdi8yN0NpaVppZGUxTndR?=
 =?utf-8?B?d25PWW9JOHBNb20wNlVBTnA0SFFtaHI5aXhaaTFIZFd2ektDLyt2RERvQVRo?=
 =?utf-8?B?MXk5dFNNZTUyemNrblFLOWFod2hLQXMzNk9MYVVMaktlek9OK0llQmF1RVNE?=
 =?utf-8?B?R1lkbktOUzlINVdGMzNDeG9MNGdZcUZuSzVhc0V1SHZBd1FlTmtONWxWOG80?=
 =?utf-8?B?VlExZHNseWMwMVdGNzYrdVUzaDdYTWN6WnN2c0t3SkV0V1NIYURrV29NTzZI?=
 =?utf-8?B?Z3grUVc2eHE5Rjh1NzNCSlk0MDQ5OUdqMlIvbkJucEFYaXVvM0xCZDZyVTdQ?=
 =?utf-8?B?UU9nWEVwNkFPbzhES3QwcnA3dktocGZvc0pWOVFkQzYwVEJCVytXU3IzSFdR?=
 =?utf-8?B?bG1QQkZYWUYvSk9MQzNtYWpZRnc0T0x0ZGxZS3IrSWMzZWRLZ3JTT1NUbUkv?=
 =?utf-8?B?aitJRFNvaXUrV295RGJzMUpUVXZLN0NxNTJwTi9yd0VtbURlZk1VT2pHeTdO?=
 =?utf-8?B?UDd3dkdwVFAzTWU5L0JWdnBQOE9va0MvVVljcnkrR3pPcTh3Y1lwdXJtNEJ3?=
 =?utf-8?B?M2dEUG56VW1VOTlHUjg1azY4SFNvTnJKSXd6UXZIZnZubDdZSk1hTTJ1c3Er?=
 =?utf-8?B?Wi9BNmovSmRjUFRwcUhQWFpBTmtOWnpQZzc3Qm1WS3R2V2E0WHZRN1ZnK2Z3?=
 =?utf-8?B?ZWM0ZjlDQ1Bnb21EclBRbU1pRTRUTzNJRGhsZGJKU21SZGlNL3NoMkFrT0Q5?=
 =?utf-8?B?OXdlQUlZTktEZUk2YWhhU1owaHJab3VibVBpa1hoT25lNms5STQwQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496e639d-6a8f-40b9-6c81-08de3d897792
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:29:36.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZTXbKMka08zZqON4LuE8AbCif9FDhYAOU8kNtu2mPvxf2e+p6k4VYRtyxjybFg6sgcz2R72BIifxaewIgQ/TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335

On Tue, Dec 16, 2025 at 04:32:28PM +0000, Andrew Cooper wrote:
> It's not acceptable to hide this from the caller; the effect of doing so is to
> break an atomicity expectation.
> 
> Only the caller can know what the appropriate safety action is in the case
> that the claim hypercall isn't available.
> 
> Fixes: fc67e9dc0c1f ("xc: use XENMEM_claim_pages hypercall during guest creation.")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

