Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9g1sO5Suj2mqSgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:07:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E2139EAD
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232079.1536931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2FD-00035Y-EI; Fri, 13 Feb 2026 23:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232079.1536931; Fri, 13 Feb 2026 23:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2FD-00033C-BT; Fri, 13 Feb 2026 23:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1232079;
 Fri, 13 Feb 2026 23:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vr2FB-000336-R9
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:06:37 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0cfa7f6-0930-11f1-b163-2bf370ae4941;
 Sat, 14 Feb 2026 00:06:29 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6120.namprd03.prod.outlook.com (2603:10b6:208:311::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:06:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 23:06:25 +0000
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
X-Inumbo-ID: a0cfa7f6-0930-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p56CaKiCA3NWddG6KBu1gmP860x3cvgTPfGMsHLRIx7EqdBGiKYIZIpFqsQJWtb+Ft9HFcPbAyS96xCJkscX+23ItpIoS2jPAwtOFE+GXPl17kKJ0ZAtKRUJer/8RGC2yO23iXQxXqhswfwbMLoGzNBgXYxYy1H97LoWgT1HClFm0EBbmIteW5OJZ+RhpjMJV/oqu+/J+5iQGA22lNORRiIl22jZ+SSY1F0RfWaa93ln2QWLVOhFoFTiA3BFVrjq56/WLsQP4F158ogcOidlFd+vbQeZlOQnPOS3WLISQasPXnfm6627kWtXA0srl9JlycOdpefl3GDmyDREMQIP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWstmqlcbFh2PdISqfIc6omKP+dqUvJGW7ddMcoM+bE=;
 b=bta54EKX3Rk0ETqFusCxSjyfCaQZ6WPkyhM2uhvIXe27mY3xLDqnePDQBXH1VhYv2m+siapJexxNmzN2/msoYJx/3QslNNkNFoz9BqWrfpmHyS9tqdYGGbbnpbjbdq67QZQppCcMDt+aY2H2La3eKbGSzGqKBuF9LhzN0XWuRQlZG0Mzp0G1fBWjQbYQ2Nqt8D9jClVxk8Tra4G3nWsevq+zoAVlQRJca0x6pKAtkChdFEYjRWsp+p86DnHcNbbOA39Sx/x/c42+uNScWqur46rKEkOzR4qavNF0DhAqkhz4jIBFFrN1QGalzFvxkL3HcpoRF4R0oFBCjpQS/EhsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWstmqlcbFh2PdISqfIc6omKP+dqUvJGW7ddMcoM+bE=;
 b=e3EUcksxEHnP9LHZK+U5MEOeApZUnzHUAgu/eE8eC2PsrNQ7dzVbeGwROLPpUBhXeEMvGs8wufVKXM/z1SdqgfLeK5FXSkBPF7RPwJEkHXyHK905Z4+0GSfHEEBP2Ap/qDulsvUP7EpkIhAztpyloJbY85imsucdDFj+6qjfPg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <60153ff2-4c0a-4ce2-b5e1-e2bb750a6f62@citrix.com>
Date: Fri, 13 Feb 2026 23:06:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Put wait.c behind CONFIG_VM_EVENT
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260213225635.346187-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260213225635.346187-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d2a2cc-81be-4fa0-b370-08de6b5482e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alhCSzNENkUzMFpheXlpM2RxVGFFV2lmUytRQTB6Smtaa3FkUi9xb1ZLcVRo?=
 =?utf-8?B?M2lWSHVFVERJMERGSXNQN3lDL0R4KzJmcSs2alhIbldMNHhRT2hpYnpEQmFp?=
 =?utf-8?B?bkZXT2d1NVNRM2xsblJsemdITTN1WFFMZEJxaEQxaEErRVVVcEY3NE1OcmtM?=
 =?utf-8?B?NDVhUEMwc3NRNHZGeFUzUjB5d2JiVm4zNk0rK3FEMHZzZ2VuaXp6ZFh0bEhF?=
 =?utf-8?B?NTVuVTRQM2REVUd1bklHeFpkTllJdkxEM003NlU0bXZhcmtvN1ZYOEdDaDl2?=
 =?utf-8?B?Y0Z1c0JpV09OTTZacXN4dDNoNGg4WllHT2hXeEtwYTlteXRRZ05WYTQzdjNz?=
 =?utf-8?B?UmE4dVVmQ3I2bUlyd0pjVmxsRk5XKzhyRit5YUx1cGhETjRrZjYzOU5xMkVW?=
 =?utf-8?B?YTlSMU1hL0Nvazh6ZzE5UW1MU1FaN2JJUENjYTdIRHA5TWFLRXJ1YWcrR3N1?=
 =?utf-8?B?SjBLVmdaa2RFREZObCtrRktyVGZFKzhPSU5yZ1hKcUQ1OWJHdzNHTzJDOFlT?=
 =?utf-8?B?UXAwdGVYTEdTN3RXSlY2eG9lM1RJRG1GVlhHSmhSUDd6NjdOdDJRWVlYTTRn?=
 =?utf-8?B?OFdnVjREbzg2TnBsUjlOVm9oWnNoSjVPQitNY2JRWGRzcVRUd0xOdDZ2YnFu?=
 =?utf-8?B?QURWb0tvVFlMbG1GbVFpT2kxaFo3UDRXNmRuUlF0NDZIaDlEdnE1eDYxY29D?=
 =?utf-8?B?R2xyOGVZL2h3OG5raWxWZjI3M1Nld0lxNTd2MDhxcENpWHNZRmhCSmxXWkUv?=
 =?utf-8?B?dDhETEhkT0Y1RUszUkpyYWlsUUFVNGhaWk1qTm5yMTZ1NW9Nc1dCUzl4MTFl?=
 =?utf-8?B?bmFQVFJQL3JyS0R5UDJ0b1pnblR1WkEyVjFYRVNBZHFaSVhDVU43MDNLR1RI?=
 =?utf-8?B?dGxadHFWbUpJdnMyektGVDNEL1daNFM0TXNFNi9Oa1BLRnhVcWpLdzNUQTRp?=
 =?utf-8?B?a0NGZHFqamtYaTQwOXJIUCtxR0EwOFJEWnVwN1FPTmU1aWI1TCtxQXVRbExm?=
 =?utf-8?B?L1lFTXJHaTY1UlIrSWNsRGowL0pJUjhXSjIyVHptUENqVitkR1NhOFMvZkNI?=
 =?utf-8?B?U3J2VFNieU5ZWjhpTm4vbGpwVTNIbzE2TTBKTlV3QzlKR2gyMUg5TTJ4b3hW?=
 =?utf-8?B?Q010cGpwb0YwSHhUMm1hcndaakEwTlZId294bEhuTVZEcllpWmdHZVlEWW9K?=
 =?utf-8?B?Y25qcUJCclNvaUpXM1ljcWFLb0hEdytzemIwblZERllYT2xJZHRtVHlZeVVK?=
 =?utf-8?B?Yi9YM1A2UDhWaGZ0dCtLaCtvSlVBcThzUk0vem1mZ0hHeHRoN2wrZWRMRUwv?=
 =?utf-8?B?NmRIMjMxR2lWdjhWZS8rOTVkOGVISnE5MjJjWHJvZWUvNHVMNUlibU5wRUJ4?=
 =?utf-8?B?V1VsQ0tIR0xaeWxrT0Rnek5NQmw5VVdyRFdjNE5rMTVHaXVmaTg2UHY4K0xM?=
 =?utf-8?B?RjZNU1dvSXA1dWJQOHJpaEhoeFJOdDJJcGFIWFBKTmVreDY4eEc5MEhNbW5F?=
 =?utf-8?B?MHJTNmdkMmczdXhOaFVwRldET05nU0VCbTltcVc4OFBFdytDUjhuNkZ6N1do?=
 =?utf-8?B?YWEzNW9hWHRkRlQwZHlxbDh2dzlpRVZCQ05lOEIrS2tuQ0NMTGZMQnNQQUkv?=
 =?utf-8?B?c2dWZlpNWVJXeTMrVGVibER1SDN3S3Y1c0JYaG5EYk9iZDNYeGczTnI3SVhM?=
 =?utf-8?B?bUJvYXJkLzhydm5wa1UvYTZjekdxNnc4M0twRE11aHhZbkc3dnAyTFJacm1l?=
 =?utf-8?B?cSt3ZzVRTG9YREs2cG1rV1pyUkw2S0MyTTlFTjZkZ3V5dnl0MGR3cHJ6amJj?=
 =?utf-8?B?M0RQc1NGTjVteHZGUGxtVUxFVWhPVS9Vc3JkWXowakF5MTZRWVJsVTF2RlhB?=
 =?utf-8?B?UGZ2Ym91dmp5UFRiV01VV3hhbTBUWXEwU1hSRWo0RmRleEh6SE80eFJ2NGlC?=
 =?utf-8?B?K08vOWJQNFNpQjAySVJmZUhJTjMreHlsdTR5aGMrWWtXd0NEZU9LdTVFNlBG?=
 =?utf-8?B?WGhlS2QwTEFvYlBENHlUK1hoRmQ0K1JnZ0I1cTRFZ2YrcGtuWWQ2bHdOcDZr?=
 =?utf-8?B?b2xLZXRpQzZmeHZSbEJ4ckI5dGxROEVRWi9QQkdXaGl5ZDRvSHArMytkek5D?=
 =?utf-8?Q?KrE8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJRN094eGgvMkg2NUx3cjhxRWt2d28rWDV4MTFJVTdISGtKQytEY2tJNGd6?=
 =?utf-8?B?WXlDZE8zb20wVTRLaEVTZDA3ek1kSlIyMWxNb09ZODNTYzBlbUZiTjZDYmts?=
 =?utf-8?B?c01mc29JTkNWUVpySmpRTGJOcnhsM2RNMWhIcDhldUYzeDhKMjRzNlFBMlFq?=
 =?utf-8?B?bWxPcWNyb3dVVDBPVFpUVmJDejVvcHRYb1pSZ05PVXNlMjhwTTFHZ3FvZDlP?=
 =?utf-8?B?eEEwZy9ycUxsTmY1eFVsSWVQWm5XOEh0RUVoRlp5cHY5M1hkOVdrTXBXNFhi?=
 =?utf-8?B?TktrYXFBZFkxMER4L2tSdzVKOHU1OW9ZdTRadmpzOUpGSGRIUmZBaEpXeWcx?=
 =?utf-8?B?Smw2b2w4MFovN0ZxY3BabDhRa0JuWHlEazNhOWpVOFN2VkJKRU1xdzE3bkZu?=
 =?utf-8?B?bEZWYlcrMVhob0tweEZPaUMzb2VMRE9NTS9mZG9RWmZRVGgwRHhWWHh4aUhq?=
 =?utf-8?B?SUYwcjlSK0pBNmF3WC8rdkxsdkpDenNQY3I2eENRS3Vjd3hrYytEODFWajB4?=
 =?utf-8?B?b2ZOSVJ2czVOQ245cmFBV2ZQWXFnclNJK3NCWkMxRE1SSE1EeTlPTE5OS1NF?=
 =?utf-8?B?TVVjVTlnb2RZMDkzQnZ6RDEzRmhpNnNyeWZXcDVZT2lQd2VRVStnRVpZM3VP?=
 =?utf-8?B?SFN6eE01NlNucGdPbk1pUUZtNkdNUHZFUlhOQ2EzN0JOazNtS2NkaG9HL1Ft?=
 =?utf-8?B?cjlVVDVaQmNOaUJFblZ1Y29MQlFoclMyRnJMTWtPOFpFVnpES2V3KzRYaEJN?=
 =?utf-8?B?bDdEbVRTQTBmNloyRlQvTFhic0ExeENnZGg4YjJ1cklCWDBzSVp5bk02dHIz?=
 =?utf-8?B?Sy9WU0pjRnhPczg5ZWM3SHVvNTRsbnVaL1pqNGh5Yk5pZ2VwNFpiaVpsTlJM?=
 =?utf-8?B?T3lUZ21pd3NCUW1zNlN6MnFweHNlMjEzbWxSWWE5K2lEd1o0bmhBNjg0U2xp?=
 =?utf-8?B?SnRXRW1XTE5uL2dkUm5RdGl6bGZVTnpHcVo3SFBRRjQ0eUxBNGRXblFrNG9W?=
 =?utf-8?B?U0dGV3Z2a1VPOC9NWlZLM3JoVUVnTmVaZVhBTEdZRHlDZmdQM3NaRkR5Qndr?=
 =?utf-8?B?aWwrazdEZm1MaElYd0Q0SzZNSmk5alNOWkFvRlc3UTR6VVYzS21rZVYrRTUw?=
 =?utf-8?B?VWNtU1NqampIcHRrL2U4QmkxY2hNK1NQNDdobUVCNlk0RHpIcXdnb3NXNlNn?=
 =?utf-8?B?dk01dkI2bDRQRC9pTzZKMmNYcnYrTXdGYjVhSHJUQXc1ZXA5QklJSUxneVpN?=
 =?utf-8?B?NjFnL3JuZWp0MktMREhIRFMycy9KOHZCR1NvaWJJWCtXTlFic3N6eit0TzlN?=
 =?utf-8?B?Nlg0RDk1RTd0cWdkRG9zUE96eHNFcG5XbkIwUWVsVkVSdkoxR3g0TlBocGh6?=
 =?utf-8?B?ZUhNRnM2aUxFMjQ3MGtoV1MxMDBCTCtrZmIyRUtGUVB3VGlGR3M3OGkxU0o1?=
 =?utf-8?B?OGFBclVjTkJONHVzT0xvYUNzc1BnalQrZWNYRkxRK0tDVTdPN3JkdEF5NEY4?=
 =?utf-8?B?TTdERFlCVkZRYmNTV0hTS2ZYYlVRSnZ6dlc0SlMzTzlTZWxGU1h1V3hLSzNp?=
 =?utf-8?B?NU1FdzZBU1EyRk9MWC96VVVNaE5GZEpGaFZYMTdwekxjVE9CaTNrTStzOXNl?=
 =?utf-8?B?RndyNUZJR3ZRT3lqbk9DTW5zd2RZU2JNeTlNalZXd0gxL3VYYnlqRDkwdllS?=
 =?utf-8?B?eiszcTFqS09SY3BzMk54ZVIwME4rRGd4andhTmZmbm9TbHIxMFg3R1dHODJD?=
 =?utf-8?B?ZTBLU2EvNmlqY0gza2tDWVJXSGVFSzZRUXJ2MmFLYzJYUkwzSXJOZXEzeUdL?=
 =?utf-8?B?WEx3UVJsczRTYTlxNG0vakRWT3VNcW1CcjExNkZJenBvaEc5YVg1WHpPR1hq?=
 =?utf-8?B?Uk5FdG9wV0M3aE9OWnRQMXRUZ085dTJIbHJVQVk1M0dBS3RoZ3VJUTA0Sisx?=
 =?utf-8?B?MUJqQnlOK0Z6QjRHUFkvV29hL01ib202MHBYaGEwN2lid01kM00zV1FIcHZN?=
 =?utf-8?B?QWIrYzMyZ29pcFphVzRqZ0ZWYms4cTlzSy81YzBEVzZrYmdkZWVpZldvTDEy?=
 =?utf-8?B?aWhUZGxnemFrMWt3TTVJMWJkc3V1UWdkelF3UmxUNGV5c3hEOWJkZ2hyYmRq?=
 =?utf-8?B?cUR0b0NVcUdqcFo3K0hkTitVZXhpL29uQWJCU0JDTFZMbmZHZTVmNy9NdFRY?=
 =?utf-8?B?MzdGQ0xyc0ZyaGZTM1AxL09xSkZpdExBOGRXZW9PdGlhWjkwVTBHMUJDeFNM?=
 =?utf-8?B?WU5NeTZNVWlsRE5hOUZ2VzRQTnZIbU0rUTdDU1ZFc0RtTGhqUFFRbWZJMWRr?=
 =?utf-8?B?ckJUOFdYTTc3MVgvcVpvOEluckgreEJuMWgzNmtraTBSa1lTTllpUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d2a2cc-81be-4fa0-b370-08de6b5482e2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:06:25.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6HzX2VuhHKI5BUWuogTQ/BwnEhFqdVRuapgQWXcAZr+H8+R5C1bhFQtsvVbCyyZEuOknpQAQNzPo+WNPYVy1zrDggHPOYjU2vIH1GRpRAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4A4E2139EAD
X-Rspamd-Action: no action

On 13/02/2026 10:56 pm, Jason Andryuk wrote:
> wait.c is only used by vm_event.c, so build it when CONFIG_VM_EVENT is
> selected.
>
> Provide stubs of functions called from common code.  entry.S needs an
> ifdef to hide the symbol from the assembly.
>
> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This will do.  It's probably not worth the effort to move the file or
untangle it in ARM, given that it's intended for /dev/null.

~Andrew

