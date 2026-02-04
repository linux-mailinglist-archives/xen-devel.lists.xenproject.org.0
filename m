Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB6tFUJdg2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:52:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E73E782F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220852.1529262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneF6-0004So-Df; Wed, 04 Feb 2026 14:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220852.1529262; Wed, 04 Feb 2026 14:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneF6-0004QT-9e; Wed, 04 Feb 2026 14:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1220852;
 Wed, 04 Feb 2026 14:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vneF5-0004QN-DU
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 14:52:31 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206c4862-01d9-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 15:52:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DSWPR03MB989130.namprd03.prod.outlook.com (2603:10b6:8:35e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 14:52:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 14:52:26 +0000
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
X-Inumbo-ID: 206c4862-01d9-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9oBZXPUhlXcEFqkBKnn4yohyOd+gxQgLzfmZiLRLMyBSrhCuXNZ/J14gcSdFU/9Zl7LOWRsJvuzHAAc2WW72mmoJ1Kh7b2lQdOjCcJhjS44ygunXzHl+oR39kDAvgQP5vHPfqpuCqCwEqL2mWpGFg3vRqNAza7+VTYATX6J1PLhQAO13veBlciHKC2sy2jmMoU9bJe6Q+ROxL0hqG1H/1wUkPoLxKgxzdjkrr0SC/NRDIHwgOvbI0LQ9/aTiebx9MYNuO6Sgk6WyMSMQMLFn8X41Cov/ByobBJSluv24CYWdsfniTbK2xaxKWxrRMSnQ2eAufKM6Tc3+K9/NP+T3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97KVZH2FexzGqNE8p0gXduSCXoUapWVK85TSJ7M53CM=;
 b=rSSHLtoqAV25X/32yGzQ8rLMw8L30XYAK/h/iNi/6wu8G/9sKPUqVBVOnRl7UJoZED1UyyyakBCNvjnJ083xCU2Gst0/KUU8vfofAqR1FfqmAq1mWxK8On9mpMaibksUARDMiiO2oJshzC5/W8JsAJhQgLiOaML5/JPpPHsLbgrZzm8jj6GzyZhs6pBdniP0u4L7gqZPc1AmmBeDRK5vWRjj66Pux/P0mfAwdkpvCqjcyZc4AsBLNB6bDBp1YlxvaO17D4lgG6Tg9E+I2Y9grSelFKbnwWQb95OKqMMtYvdtTIQ8amYHIRBIpHoF4Olq8WMd+zW0KDXe4ZEuFEtW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97KVZH2FexzGqNE8p0gXduSCXoUapWVK85TSJ7M53CM=;
 b=u37QyM6cAJYKEyTm5jzdwz9JFabY+rMSf9aeALq5vBhHK70yMZeelirhUHF+OP9WAJ30sjgqzpeKzy5qAxIhc7e4kv4/kDGv2ux5Hz8g5o1KRqs1nE4jZQqlGl2aqXvnb6THtEabaI5ulWKL5LwfN68vlK3p7p7aOGl/QPtTBxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 15:52:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYNdJ6sb4GPaSEyY@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com>
X-ClientProxiedBy: MA3P292CA0018.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DSWPR03MB989130:EE_
X-MS-Office365-Filtering-Correlation-Id: aafe95e7-ec3c-400d-b358-08de63fd035a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmlZNE0zMnFraXFKc2ZKL0lES1JGTjY2NE1RU1ZqY05ZN3l6b0J0LzMzY3hN?=
 =?utf-8?B?MlNialEyT2RRcUNSOGF4bmRLOVh5a1pIK1hJUmRiZmRqWEx6SGR0Z3N1UnEz?=
 =?utf-8?B?SGFLSDhUTFdoUDJUYnJ3cU5neGxqODYxWFNxdnZBNzd6NFhWSllhNnR6MVZV?=
 =?utf-8?B?YXJuWS9iYXZMcmlMd1JYWWtpZlJMeHN1ZmVNaWRmZVlMUzVSbE5qQmxYemY5?=
 =?utf-8?B?TENWY2w5UHIzN2ltZ1BYY0syVTJSVnNDT1BQUGhpYmI1WVpsQm42a09yVDgw?=
 =?utf-8?B?ajBnbS9Wa1pJTno2Qm9Fc1BDbUtDZndkMkc0dDQrdDlyRjN4WWxhNktGY0NK?=
 =?utf-8?B?bS8xOVl3UkRQNHhFY3JBNUtEY2FwSERJZWtyQ0FzeUJRcVBCU0FYM3RKeUVL?=
 =?utf-8?B?Q1FmbXN1OGgzaW90NHhibDRaQmRaSVZHaldtZ1FtekJWSCtyWHJaU1FwSTNW?=
 =?utf-8?B?OXVzazdMYlUxa3dTVG8vQTl2cUpsRzlranVjRTRJSzZKY0Y4YzN0SHJxb3cr?=
 =?utf-8?B?czVLc1NwSGdkSU1lSmRIWlA2MFV2d0VIOEtDU2NrZHVId1R0Q3hwWmRQaHd1?=
 =?utf-8?B?SUFwcGhxU3VRMEFETG5Ka1ZWeEJBSCtXQU9KSDNqS2kvSmxFRWQwbUtkZk41?=
 =?utf-8?B?TTZ4NzJtMWt3NHZBTFZ6bVBRazdQVS9wM1NVbzJmNFlvSzNmZkxUOThRV3ph?=
 =?utf-8?B?RHY1TVJmVHQzNG5BZGJzeHkyQUhXanExcm80UHljYjNqQVJiSVcxaHdjcC9i?=
 =?utf-8?B?Q1BIbXhsbDMrNzd1WVZVMUorUjc3U0pxemI2emRjeFg1dkNWSkpVTGNScXVq?=
 =?utf-8?B?d3lLNlhJTWZ4Wk52dVJPeElhRTZHejJzOFJsblJYazB3VHI0RFhwSGVnODgy?=
 =?utf-8?B?RXg0U0tDWElibkVuTFREME5COFBiRXJWNm10a2JLOEVkT3VOeVF4Ry8wczZG?=
 =?utf-8?B?cytaMWdRUU9XMTV5TUpUMXFWbzNEYlZhTVEvaVczUnI0UzJzcmN2NEd1Wk54?=
 =?utf-8?B?TU5rV1h1YVdTV2wxUzVNUmJkMng3ZG5vY1ByOUFWcHBJVk5DeVlrVXNBK0M5?=
 =?utf-8?B?R09kU0hwTkJYOUVJSHlLTGNkVmFnUUdVRFl0ZmtZSWtpdS9TdXl1dHV6NVlI?=
 =?utf-8?B?RmlhTjBTRWNQQWQ4TEJZVHBPUUo4WHZBNDRNQ0cxVFN2UWN2aXZRYmpSbCth?=
 =?utf-8?B?SFdCZ3p2Q3F1cVQ5ZzY4QjVUVGlKRTZXRzZIMnVmQjNUb2tkQTZrVzNTMmxY?=
 =?utf-8?B?N2JsYUJ0Y2hEcVNJNS84eFRnck9sakppS2hOdjFRVlhkVlY4bXB6cDYrMWJ1?=
 =?utf-8?B?MTQ0NFc2eHpsUnpDN1JGcUdmREUyRzVxQlhvQmJaeVlaMmN2YXZWZFpxQUNk?=
 =?utf-8?B?RDVwTzNIQWllUnk5NFVIR1BkZlIzejVodDBwR1N4YVgvYW9aRTBkWkI1ZS8z?=
 =?utf-8?B?NytqbEdPUk9QOWhEWTJOVDh2L1cxazEybmYrS0VFemtrdnh1dzdDbEM4RDhH?=
 =?utf-8?B?c2xNSHFxTytLaXlLQVJ1cGVMdXZiK1JHdnBPR2VpM1I5YUNuWTFHM21LNDRt?=
 =?utf-8?B?S2ZZRUNtZVh4amh6ZURWelR1SkFBNWk2ekdNa0RRNWJuRUtjUG1pRG1hNWhD?=
 =?utf-8?B?Z3pmalRTNVBkbnk2VjdYMWYyaHgvcTV5WVp1Ym5rK0t0Rjdma2s3QXFzODU5?=
 =?utf-8?B?YTFhNkRReGtaU2NYcjlaUkxOa2pUbzlBZ0V2TWZJT3A1UzJ3Y1RzQXBiQUEv?=
 =?utf-8?B?ejNBdTVXS2kyRVFEVW5NZGZjOW95ejJMMTJFWFV5dGtWdWo0WTFyY2tQV2FI?=
 =?utf-8?B?ZlFlVFVyb3dYSkNSbUdySW5FVXQwd0pvQkQ1Nm1Ncm5yYnQ2Vzl6WFJMSzdn?=
 =?utf-8?B?WXlwanV0Umdtek9uVTFuR0d6ekNJbUtBRjFPczVHZWFCc243OUlhZWdaQUNS?=
 =?utf-8?B?bHNZOTNCVXBnRmp5Y3VLWXAwZzI3M3FnS3Fsbk4wNXY2ekNubFFVZjI5Ukxt?=
 =?utf-8?B?V3JReWg3SGdvcXN5MHVrNk9KcTFFSU0zdU9mM2FYWlFHOWgxUnlZblJ1V3RE?=
 =?utf-8?B?MGxyTGVJSTBXbTdrQi96ME5HYXU3cnY3bjI1cjFVa2U1MmZsSzB6d3k4UXBy?=
 =?utf-8?Q?lVts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXl0Q3VncDFpWmQvNEIvSjBWdHlOZExPNmxJSE1jNzdod05NSlA4ck1NbnVU?=
 =?utf-8?B?YmtjNEpDcFJsa05kcldLR1EyYklvektkbWlHSDVaV0t2OHlDWWI4bkkvZE1n?=
 =?utf-8?B?NmFrSmkwb3MzdGJMYk5kL1dYVnNaTDdTa2Y2SVZZUXFJUjB2VTZEd2tWTHor?=
 =?utf-8?B?SUVGVWtnaE91ZnN6ZXl2YnoyNEdqTU92WlBhQlRpU2pJMnpjdm5SU0swUGhj?=
 =?utf-8?B?dzhEQ2ZMT01MM21RbU41K0M1d3lKOFRURytkTTNvYmZPcjlTenlmQTliSEdF?=
 =?utf-8?B?RHRBaG42UDlqZFE0aHFnL3Z3czAzenVSem05SDM4VW1ZWFJSQjZJUGdEUmM2?=
 =?utf-8?B?WW5adlV2N0VSMWl4TmU0c3UxWFp6c0RlWFBiWVByZWhVYVpVVytLcmVsekRi?=
 =?utf-8?B?R3ZwbUpVT2pWT09pVVZ1c05mT2VLK2RObVRxZVMvdHFKTk9MOWd3TnZkVWRq?=
 =?utf-8?B?Zkx2dGg4RlVmME1FT0J2SFl0aVpJQUliYlZPelBaeU5RMW1NQXlVdEMyQTZr?=
 =?utf-8?B?UjQycUo2M0E1UldjRHZsNkZ5OEpwVGFpRmFpK2MyMUx1R3cvNzljc0xNRlg3?=
 =?utf-8?B?R3p1dmliZjBrU0FuYnZuMVpPNmtqdHhlcTVLSEtONmtiU1FRR3VYZ1VONzVm?=
 =?utf-8?B?bEp4Smg4OW44R0RLaStnbE41WGpCT2NsUTVzejRsd3NORzB6UmFJQmo3WURV?=
 =?utf-8?B?ZnFYTU1CVXhjeCtTS0FSVFVmNk84akhMdHFKdFdISlByRkx3VDRxT2pNVWwx?=
 =?utf-8?B?aUpYbGJIN1grbVNwRUEvaThwblQ0c0VDT2dtSS8vaXI5dnhaMS9aSndIemhs?=
 =?utf-8?B?bjlKRm1VWTQ0UVVEZVFBSWlXNkQ4TGdEM0RZc2J6KzVQcVpSUEhlM1daaXl6?=
 =?utf-8?B?dWRoRTRnamlVcFJQc2pwMW5HU2lVZU1WRmhObjNEVzg0QXNmN3R6SU5xbkdZ?=
 =?utf-8?B?M3g1TW5FOWNEeWNtYVlucFkwZ3BWclZCaG9pOW5tZDFiaGhwUUNqcE5vRTZB?=
 =?utf-8?B?TzJOajlvbTZJTnBQUlZNcmZDUFFqUEtjYVNkemFJUCtGRDdQeE1WMkJBcWw2?=
 =?utf-8?B?ellYZ1YxK0J5WGF1bkFiM3Bsd0FmN1hzMHhEZnB3eWxTT2ZvUFdqL0hNNUI5?=
 =?utf-8?B?TEtIMW5oOE00aUJOMGo0M21YSzRHMm5uaUhycUhGdUhxWGdWa056UWFHcXlP?=
 =?utf-8?B?MHo4Rm81Uy9SajdhT1BLR2laQWtLd1I5YW0vQkRMVDUxZ1cvT2RkNDhnV0hn?=
 =?utf-8?B?NWR5MmtxN3kzaks2cndwWGdaNU9va3lIUmIrdEpUdWJhZmFBanJSQzBOUTBN?=
 =?utf-8?B?ckVqSi9PYUp4a2xsSjFCcHZYV0xPd09mRHUrRkNMUzF4MzAxbUpPSmFVZ3hW?=
 =?utf-8?B?eVJPWGJudnJKc1l6TzBCV25IUzkxc1YwdiszejZhbGlWcWxCS0NGR2pIS0ZQ?=
 =?utf-8?B?NGNpc052dnZTRm5WK1JxcFNoYytHZWNLeXUzcm9VU1ZOYTV1a3hsUHZRRXpl?=
 =?utf-8?B?OVNYb1ppem14bG5xWEQyZlpETjEyZHhsVkt6YkJqb0k1ZEZ0bEowZWQvdEhO?=
 =?utf-8?B?Smt0WFgrNFprMGdPUjg0dU5TVGl6TVNrWGVTT2l0aUE5cVpocDFMZWNnZmox?=
 =?utf-8?B?OGcyVjdtNy9JRlEraXlSbGZYNHFzeWczcG5ldWxVVTFTd0l1WW5TNW1PNHRG?=
 =?utf-8?B?TS8yWm5tbDYyN1h2aDlrclBuR1JIaDdJWTVnc3owa0ZpUGxlNzQxMW8xME5x?=
 =?utf-8?B?V01PSU5jeXMxUUcxbGFsUVRCODliNXZ5ZVB4R3AycjhVNlNYWGNIbWI1WHB3?=
 =?utf-8?B?cGdNbGRTN2dmWjJQbTN2Y1VsVFlscHV1TFR5MHpJN1Y5TzlhM0IzQ1dXNk4v?=
 =?utf-8?B?YXU4ZGp2SDh1TmF2R1lYTHBJbmFPc2FtWUN6Rm1qWlNHOUNhZFR5andJeGxs?=
 =?utf-8?B?R28yRHJKaDZDbXBGaXpKNnBGa29EQ1JaaGhISkk4VjJxdUZsaWxQU3JsSGdD?=
 =?utf-8?B?dS8rcVFCWUpBdmV3d2FjN0NKaGF3WDgxR0c0SXo1SVV4bU5SdXNQNVpPU2FO?=
 =?utf-8?B?SEJZVnpqdDNHc09jTWhjVXZGbVJqMjUwRDRrM1dVcG5nQ0V6SkhjbTJad2p5?=
 =?utf-8?B?ZFdwWi8wR3prZGVJcXQ0NHlWVkg1SHQ4U25IRFdRRU9xZUkvSUJ0dmo3UmxF?=
 =?utf-8?B?TUdDZjBRcTFFOXFIQ2NnMmJEbzBaOTJQUi9TNlEvVDZNeml1TS84cEpFeUk4?=
 =?utf-8?B?TVhoZDBSTExQYU1lS3JDcVROcFRWVC84bnY0aXRpWDdlblV5dkQwSG5zMkZB?=
 =?utf-8?B?bVMxbjdvY0d6VFZPK1pNaFFmTFRKbWxKcWIzcGcycXVod1dXbkFRZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafe95e7-ec3c-400d-b358-08de63fd035a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:52:26.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4GxW71w5KHIg5K4ZF9FeccWtrpwrCosoOpa0YtSfUyJQa23XKfrW50r1Z1vhq1T0qnkbcAlhIgGK7h55+UErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 90E73E782F
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
> On 04.02.2026 13:25, Roger Pau Monne wrote:
> > The limitation of shared_info being allocated below 4G to fit in the
> > start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> > start_info field is 64bits wide.  HVM guests don't use start_info at all.
> > 
> > Drop the restriction in arch_domain_create() and instead free and
> > re-allocate the page from memory below 4G if needed in switch_compat(),
> > when the guest is set to run in 32bit PV mode.
> > 
> > Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> 
> The tag is here because there is the (largely theoretical?) possibility for
> a system to have no memory at all left below 4Gb, in which case creation of
> a PV64 or non-shadow HVM guest would needlessly fail?

It's kid of an issue we discovered when using strict domain NUMA node
placement.  At that point the toolstack would exhaust all memory on
node 0 and by doing that inadvertently consume all memory below 4G.

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two nits:
> 
> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
> >      d->arch.has_32bit_shinfo = 1;
> >      d->arch.pv.is_32bit = true;
> >  
> > +    /* Check whether the shared_info page needs to be moved below 4G. */
> > +    if ( virt_to_maddr(d->shared_info) >> 32 )
> > +    {
> > +        shared_info_t *prev = d->shared_info;
> > +
> > +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> > +        if ( !d->shared_info )
> > +        {
> > +            d->shared_info = prev;
> > +            rc = -ENOMEM;
> > +            goto undo_and_fail;
> > +        }
> > +        put_page(virt_to_page(prev));
> > +        clear_page(d->shared_info);
> > +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> > +        /* Ensure all references to the old shared_info page are dropped. */
> 
> "references to ... page are dropped" reads as if talk was of page references.
> vcpu_info_reset() writes out pointers only, though. May I suggest
> 
>         /* Ensure all pointers to the old shared_info page are replaced. */

Fine with me.

> ?
> 
> > +        for_each_vcpu( d, v )
> 
> A common oddity, where my personal take is that only one of two forms are
> possible (without ./CODING_STYLE saying anything explicit): Either such a
> for_each_... is deemed a (kind-of) keyword (like "for"), then it wants to be
> 
>         for_each_vcpu ( d, v )

Oh right, I copied it from the instance below and didn't notice the
missing spaces.

Thanks, Roger.

