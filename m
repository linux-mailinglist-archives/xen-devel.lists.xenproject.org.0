Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJLGC98MimkQGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:35:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660F1128A5
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225757.1532329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUEL-0003Fj-JO; Mon, 09 Feb 2026 16:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225757.1532329; Mon, 09 Feb 2026 16:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUEL-0003DR-Fn; Mon, 09 Feb 2026 16:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1225757;
 Mon, 09 Feb 2026 16:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpUEK-0003DL-E3
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:35:20 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c68b3e-05d5-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:35:19 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB7011.namprd03.prod.outlook.com (2603:10b6:303:1a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 16:35:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 16:35:10 +0000
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
X-Inumbo-ID: 51c68b3e-05d5-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2dIWzs5fZIw7sQbLS5PzbFBChVw3YyGGgaSP8tDu2c0wTGIyt0nqNVyewCg0F/LMtL/rIyWrJ+0fNMmeZN8fklFzM3wOVAqY+/53FxnuVO/oY2sXIt57Xxhu94dBIsKvOn3x0e3iu4nkEPggC1YBBo+NA6U0ND9iVQnPtX9uEHBMl2wYndZsSG4Q+2aUr0tjN7alSTEZ8chErWflWmhI5gmpDam5y4ZpMRzxBmOfcREJ/b6Y7VKLdPxSoVtn7uPbF1LipV6Yb8BOcTZ/m7zMitKyth6X3kZ4yoh7kNTXFq4vJlDayLFmLk5ibMbZcQT6QkI8cHSi7u6sxtILm8X9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avsp/xRrx/MtHZ7kNuM1deClh1qD4+uYOu29z4wQuRI=;
 b=C5ZU7rkZ8QtC0rBkYRQXZi/ONa8x6R1KRjSvMS/bdWv9bE+4gAI4J770kXintUMkaw68VNzBErzPmAHWz5mQhxGUa9zsOi1YNKnTMqLjRGo+jzWSI5xdebOdipBUD86lTRegPX7dBx/R3CGPcLnGiZvMyedKl3FGa3HdUMtsbeu2yx9/AVQWmuCaW6MkcQGCrkA+ijdAnBtx81vPHxaHoQpmZ8VuKlgcqCvMNT9MBJKS4E2pbwl+EQGpWQy9ncIBaX2ZfloRlg6wqpO2m2NtOH88iNUJfip0nkPD3UU3K5u52clcHj4dU+ELxtb+Ol0s1ZcT/IoNzNaAYNLPORy+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avsp/xRrx/MtHZ7kNuM1deClh1qD4+uYOu29z4wQuRI=;
 b=eip9JYplbpN02OB73597O+AHHcdE1JTMZQuQt9+QcDmgjKRwYSyYnryX0wrtQlSuey1mIBCB97CSmye+yZqlLa/RMtCsow+AVk/sWneN3fh/wzSyUUn48C0RmRgfl3rB9n0m54e6KqmgdVQJS2NEGUvydyR2TzU38wTcNI0SF7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 17:35:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
Message-ID: <aYoMuxwgWCcVUXEx@Mac.lan>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan>
 <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan>
 <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
X-ClientProxiedBy: MA3P292CA0026.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d9d5dd-b37f-4f09-2082-08de67f93129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWo2WktQZ1p1Y1lxZTQwY3NmWmVERVRVMm1TamNOWUx2TnozdEJDUG11elZI?=
 =?utf-8?B?ZXRhOER4QnNTNDFQQVVKamlXQUp2WmkzRHNYUUtQRWRzenNCSnRPSllmdk1t?=
 =?utf-8?B?UzhTMkxuQ0l3eGZBNEVNTnM5MS9jRGpOWGk3Zk5TYWpWdkFVcWNrdWVEY3FX?=
 =?utf-8?B?dFpZL1o4M2R0U3JYUk9DZW53MVEzQzRRUzlyWVc5VHo1NWZQLzhWYk45c2xu?=
 =?utf-8?B?K3pITmp5YklXQm9sTU9XWE5hNnQ3NFZWclc5d3Z0OGtkZ3BQa0hmMTI1RlR3?=
 =?utf-8?B?Qkc0SmJKZWw2NFMydDZWdTU1VFhhZFNUbWxWUDRzczh3S1FZRHlGNWMvcWsy?=
 =?utf-8?B?TmRjanlxWTlqRWJ5OGJLVy9KN04zTURVbG1uWXNCRHNWRjVaOFF2c0FjRjJB?=
 =?utf-8?B?YzY0VDUvSDFmWG82RCs3TGliMEZLcGZpNmUvUXpIOVdGZ2lleU1xS3FKbmps?=
 =?utf-8?B?WU13RGpoNXk3ckl2S3lDd2RQRWZlQjhHTXdzVnZTTWNVTVpsMXNGWCtaUzJX?=
 =?utf-8?B?TTJoYW1WWVRxZHFlcjRsUm1tMTF4ejh3clluS25YY1NlZXNOd3VmeUEzWS9J?=
 =?utf-8?B?SUpSaGRqOXgyZUFnUnNnRjNwTU4rRmdIalVDS3o5STR6U0RrdldRSW1SdEwr?=
 =?utf-8?B?YWdLMEVQblh4RzJySDE2QUdBK2ROdVgrdmtOM1J3NG9IVFV0MWhSMzh2cmpQ?=
 =?utf-8?B?VHFZaDUwb3lVR2xsOVIzZjRjSFJOdlViMkZkVjRJV292NHBrMkh1MnVoOWZq?=
 =?utf-8?B?OGU5Q1NCeXRqc0ZkdnVYSTBNQjkrZWhaSTZ5TWxpRy8wd3lEb1RzNllmRnlR?=
 =?utf-8?B?VVJ0UWxLRG5QMWY3MEp1Wm4yYW1ucWpsbkJZY0x2aGZPMllobmpBQzFYaXM5?=
 =?utf-8?B?YzNmdjN3aS9lQ1ByalRicS93QnlyMWZ2Tk0xUmdIT0d3M3Q1VGpGc2dnNFFj?=
 =?utf-8?B?VUtnOW0wVllWUllyeVlxZzZFOXJTZ3Z4Szlrb3d1M1VnK0lDMHpzLzEwTXUw?=
 =?utf-8?B?TkpiMXBvSHBIaVF2WDVueUh3UUUxSW1weHpFT0dVTFFsNWZzdk12R0hjTnNo?=
 =?utf-8?B?cXloLzlWNFdwamdFc1ZMM0Z2bWRhZzROam85dXE1Z0pWcElyamtYLzhsU0Rp?=
 =?utf-8?B?TXBLUGpSbXhOYkxKMFAvOEVwTjlpTnpjUnVHUml6WHNjMksvSlpSQllUYjA0?=
 =?utf-8?B?TlFuc0ZWSTNxVnNJelcrWkZ3MElSWUg1c0JMcnhtWlFjQ05RVVVNb3RoQ0Nh?=
 =?utf-8?B?b21xdzNXdHluTUVTTE9zNTVuMk8wY0p6QUduZUs2TXB0bERXN29QSC84cGs2?=
 =?utf-8?B?UkEwL0UzbHZ0Q3BMUXNYK3ZQUEVEb0F1WDZOL3RMTWduYVNXc1J6ZGUvV0xl?=
 =?utf-8?B?WExlUFNSQTJ3SzFHUzZrcUhZdFpuM1k0RVN4eVZvYWRxNFFzWkdqd2hjS1Bx?=
 =?utf-8?B?TVRwNHJhdlNISEgzMzUxa1VJdWlzUHhNRFljd05aSW5ONURlL25HTVFyZ3FB?=
 =?utf-8?B?NnE3Szd5eWFGNFE5dmNSNWhWdWR2WDZMRDQ2RTRsUDhTd1cyQW9KNVdXRzBs?=
 =?utf-8?B?d29iSXdvbXArL2lONkRBbXBuM1pRaFhHQTZrdlB2VmgzcEtQVDBtQU5ZWGlX?=
 =?utf-8?B?QmZuOEJTSS9zcmhJT09IdnFTYzh0UWt4VFFoOENQOVQwVGFjbHdwNE91RlZJ?=
 =?utf-8?B?bzBvRjdpT1B1QkI2M3J0UEdOUVVnU0ZvM21icGNwdzBKbkdXMXN3YlJ5TzNw?=
 =?utf-8?B?aVVQaDBKdDJNSUk3amVJOXBmODFqVko5eno3cUdxQkt5NTFTMlQzcGQyWjZT?=
 =?utf-8?B?d3NhdThza0FHVXJ3ekVXdDc0bk1nV0xKZGpXWGNQeGpzYms5ekFNaHVLZnRk?=
 =?utf-8?B?OEVuck9mT250ckhpUFZWNFAwdU4va3BrbUZHenhScmhuR1UyMmVjZXNUczlZ?=
 =?utf-8?B?Tmgwbnlqc3NjQXZWR09IU1gvaXVQTER3Y2xUQVUxdFdsNXVNRUxTeDlkNHR2?=
 =?utf-8?B?Z0tyTC8wVlRIQ1pNUWY4VlJ1azZwNFVyV3I5cUQ4cU1XN0FMSTlrQTRJZlJF?=
 =?utf-8?B?bXZnMWV2QkU4WjYzTUxxM0F3Nk1IcSt6YnRyTWJzRWZJcndQNGR3dkZOZXdj?=
 =?utf-8?Q?CKQY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTFrNjlDU1JweklQY2xSMUZldlpzdzZGem9VY3RzT3d4aFU0YnlEUzBBbTc1?=
 =?utf-8?B?RnBzKzUxNDNJNFVZMUhvOUtycDFnLy91UEIxNVo2Ky9qT0g2anVFRGJqUHRp?=
 =?utf-8?B?NnQ3YXZDU0FaTDF0MUFTbjJDQUY1RlMrZjNNVzdwbUVBK0ZuT0grVzM2K3dP?=
 =?utf-8?B?UUYxN3VQeGFidHFSRVViNW9Nbi9XaVluNFQxZFhORDk0eUc1YnBRQnlYYk9t?=
 =?utf-8?B?T3NhMTZ0eFVhNXJnMU1NV0xkcmh4TmQwdFBZem9OMndUUHhQM1VsYklKcU5h?=
 =?utf-8?B?RmlNK3V0Tld3Uy9ieWdwM25JaDlmeWdvZjJzY0FzdG9HaVhJbHBnL0M3b2pm?=
 =?utf-8?B?RHpQSEdnZjd0MnY5WGZsRG9ieHMvRnRPNCtPNDFZd2k5OEVlblZpaGxSM3RQ?=
 =?utf-8?B?Z1pNZjM3NWdwU1ZKMW1lMTk5dGVOSU5SZU5QYmxRek9xdFU1TTJPemx4bWpY?=
 =?utf-8?B?bGRhQzllRFo5WWw2c3hNN2Mwc0FsdVhiRzdFMG9sa1JwbW5OVExOQ0xSb2dH?=
 =?utf-8?B?YStwSmFWQ1I5aER4V01zeXMxRUhKWE5Nd0hxNXpMQlJ4WkwxcDNHUVZ4N0VQ?=
 =?utf-8?B?cG0zbWdFU280LzhVTEZBMndiSkVzTGNtbGZtVEJ3ZC9sSi9Na0dzTmtaaDdL?=
 =?utf-8?B?b3EzUUdhY3BYM3REMWE2WVE2UjBsNUtRVStDMDBIcjZFVG5vNkxJMjN5MFJD?=
 =?utf-8?B?cjFMbXFuTWlNcjhOemdLSENEcTRmQm9RZHlWMXNRR0g3QWRLeEdUTFhwVk9o?=
 =?utf-8?B?d0MwNFN1OE00bExJR1lEamV1Zkowa1NxWWZJMU9Kdy8rK0oxYnRrcEJvRmZk?=
 =?utf-8?B?aW0vejhmdys5b2hDajVIUlZwa0VqMjE1bnMvd011bXUwQ2tDS2hUc1RIRG5v?=
 =?utf-8?B?ZVc4bm9ha3psdGhLU2tJd1lHN1VFVFI2MkZjZWpIUW00UUdRLy9kRHI5dDFm?=
 =?utf-8?B?VE5hY3FaNjl0eUI3eTlWMzhOOFR4dWJLb3BYYUtxUXBkK2xEOFdEMk5OZ1U0?=
 =?utf-8?B?eWovTHgrUTVXYWdFeFFETHpkNytReUtuRlYrQm1UbzNaZG4zTnhHZXp3b0Mz?=
 =?utf-8?B?M1JRc3VQaFpEUXRZdnFwNEVtQUFmbVBDNnpvR1A4OWE1WTZEWG5VZGZPNDhx?=
 =?utf-8?B?QTRWUTl4aEoyYXJ0bXNSTDc2RTR6eXJoMENXL212VXJuVE1Cc2o0M1Y0UUpN?=
 =?utf-8?B?VFlONXF3NmMyMjFXQmJJekU4NG93cTRmeFNQeE9HSlgvcmRsaDZpVzV3RnlN?=
 =?utf-8?B?OHZLVDlqVjN3enZGeXV0eklHaTd2RHZaRmMxZFJpRUwxSXVzUzZ4SG8xODR4?=
 =?utf-8?B?L1YySnNKQ3ZsNFdIVWNsUGpHa3hTZlprSmUwVzdEYjcxYTdrTHhHbmk2MjEr?=
 =?utf-8?B?UThGNzlqTHE1b3RMRWRobHkwOTduRkRwcWE5emt4QjFqUGFCeDVMZDJ3MVhq?=
 =?utf-8?B?RStmUnNaRDlRYTZvZU9Jcnh6Z0tKMTdkY01jd0Rlc1V1Uzh1VCs2NzdCMVhD?=
 =?utf-8?B?bjY2U0V3WGlmN1VvWkNFbEhIYVdzOUlSeGZjclVmRnF4T0hTbEhpZlMxRTRm?=
 =?utf-8?B?RUYxYmNtSENmczB3RlJENmRaTUllUVhYSXdXSDVZUWpYOVV1SVFRVFQvaEtu?=
 =?utf-8?B?YXVMTnZ2dFRXeUR4Q21rNWNEcW9LZlBGcVMyZlNGUG9odFJ0aHZwNm0vT0to?=
 =?utf-8?B?cHh1SXNkTmh1ZE1MeWFKVEJwS2hrTVJEbFVXWGtLaklWYVFRSDY5Q3B3MHVa?=
 =?utf-8?B?cW5NSVYwai9kc2VSaVFabWRZSmJ4RkZoZFAyVld6dkFGb1lHVmphK1huS2RK?=
 =?utf-8?B?NjJKTUxFL0UrMDVPS2VHZW41b0dreldnek5nYm9RamE4Z28yZnJ3OEp6eksw?=
 =?utf-8?B?b25JU3lsUU9XL0xwUTYxOUdreTVyZUt6WFpiVSsxYWZoUDBreCtEL2JiR0ZT?=
 =?utf-8?B?UjhEU1g0MGVKMi8rdFpiLy9LVHpkU1RUVmRZTjlUL1A1OGlxUzJGSk5pVDRa?=
 =?utf-8?B?R2p1YWdnaGZqL2tZc1Y5SHMzeldaaGJ2VWttbklRbWlsOUsrVU05dTF4MzQ1?=
 =?utf-8?B?bGxneitiR281MjQ4NGg3OHJFRUZRRkoydGxaQThEeE1NQk5DRnlRVjc1aGp4?=
 =?utf-8?B?Mlo3bFF1dzczVkNwbTJzK1FpY0FxS0huYnNRREUvN3ZFRDF0SXdydDBsZm12?=
 =?utf-8?B?TG9ZZENpQ1pmNHhzdTV4WHFNOG5YV3B2Syt3OSt1NDEyQitDNVJYRDFCVkI4?=
 =?utf-8?B?WTNZL0pRRkRLYlNxZ3VSekViNW10VThIQ2RVRnNnYzlWRjU2by93WlB1R3hh?=
 =?utf-8?B?bVpoV0lHVFdtTExLRVRjQ2l2L3ZrV1lNZXpHT1NNenU1WmNHbVk3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d9d5dd-b37f-4f09-2082-08de67f93129
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:35:10.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz1mR5BlNP/PrD7iT52Py0RYuSQdYHIb1xQzYiRAvdZBScgxLnW+mwPfBVmowgz5bR7LSa50rHaSUna/hqTgbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:tim@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,citrix.com:dkim];
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
X-Rspamd-Queue-Id: 7660F1128A5
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:20:40PM +0100, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 4:55 PM CET, Roger Pau Monné wrote:
> > On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
> >> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
> >> > On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
> >> >> It only has 2 callers, both of which can be conditionally removed.
> >> >> 
> >> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> >> ---
> >> >> I'd be ok conditionalising the else branch on...
> >> >> 
> >> >>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
> >> >> 
> >> >> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
> >> >> 
> >> >> ... to avoid the danger of stale pointers, with required changes elsewhere so
> >> >> none.c is only compiled out in that case.
> >> >> 
> >> >> I'm not sure how much it matters seeing how they are all unreachable.
> >> >> ---
> >> >>  xen/arch/x86/mm/Makefile        |  2 +-
> >> >>  xen/arch/x86/mm/paging.c        |  4 +-
> >> >>  xen/arch/x86/mm/shadow/Makefile |  4 --
> >> >>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
> >> >>  4 files changed, 3 insertions(+), 84 deletions(-)
> >> >>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
> >> >> 
> >> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> >> >> index 960f6e8409..066c4caff3 100644
> >> >> --- a/xen/arch/x86/mm/Makefile
> >> >> +++ b/xen/arch/x86/mm/Makefile
> >> >> @@ -1,4 +1,4 @@
> >> >> -obj-y += shadow/
> >> >> +obj-$(CONFIG_SHADOW_PAGING) += shadow/
> >> >>  obj-$(CONFIG_HVM) += hap/
> >> >>  
> >> >>  obj-$(CONFIG_ALTP2M) += altp2m.o
> >> >> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> >> >> index 2396f81ad5..5f70254cec 100644
> >> >> --- a/xen/arch/x86/mm/paging.c
> >> >> +++ b/xen/arch/x86/mm/paging.c
> >> >> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
> >> >>       */
> >> >>      if ( hap_enabled(d) )
> >> >>          hap_domain_init(d);
> >> >> -    else
> >> >> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >> >>          rc = shadow_domain_init(d);
> >> >
> >> > If you want to go this route you will need to set rc = -EOPNOTSUPP;
> >> > prior to the `if ... else if` on the HVM case.
> >> 
> >> Maybe this instead
> >> 
> >>     else
> >>         rc = IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;
> >
> > But even for the PV case we cannot call shadow_domain_init() if shadow
> > is compiled out?  I think you want:
> >
> >     if ( hap_enabled(d) )
> >         hap_domain_init(d);
> >     else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >         rc = shadow_domain_init(d);
> >     else
> >         rc = is_hvm_domain(d) ? -EOPNOTSUPP : 0;
> >
> 
> none.c would need to stay in PV for what I proposed. For what you proposed PV
> would return 0, but all the hooks would be gone. And I really don't know if
> they would be triggered or not.

Oh, OK, so that would already diverge form the current patch - in this
proposal you completely remove none.c.  I see at least two of the
hooks look to be reachable from PV seeing the ASSERTs in there, or at
least that was the expectation.

> >> And gate none.c on PV && !SHADOW_PAGING, which seems to be the only use.
> >> 
> >> It's a lot easier to see the safety on the HVM-only case, particularly with...
> >> 
> >> > is compiled out, and the toolstack has not specified the HAP flag at
> >> > domain creation you will end up with a domain that doesn't have the
> >> > paging operations initialized as paging_domain_init() would return 0
> >> > with neither HAP nor shadow having been setup.  That's likely to
> >> > trigger NULL pointer dereferences inside of Xen.
> >> >
> >> > Also, seeing the code in arch_sanitise_domain_config() we possibly
> >> > want to return an error at that point if toolstack attempts to create
> >> > an HVM guest without HAP enabled, and shadow is build time disabled.
> >> > I've sent a patch to that end.
> >> 
> >> ... this patch you meantion. Thanks.
> >> 
> >> I'm guessing it's still a hot potato in for non-shadow PV, which strongly hints
> >> at our being better off leaving it in that case. On HVM-only configurations it
> >> seems rather silly.
> >
> > I'm not sure I follow exactly what you mean.
> 
> I'm not sure _I_ follow exactly what I mean. Part of the confusion is the
> overloaded use of "shadow" to mean "shadow paging" and "fault-and-track"
> of logdirty behaviour.
> 
> > Some rants below which
> > might or might not be along the lines of what you suggest.
> 
> Thanks.
> 
> >
> > PV needs shadow for migration.
> 
> shadow in the sense of shadow paging? So PV-only + !SHADOW means migrations are
> impossible? Why can't Xen operate on the PV pagetables rather than using shadow?

At the time it was likely seen as easier to re-use the shadow code
rather than add more complexity to the PV one?

> > HVM can use shadow or HAP, and our default is HAP.
> 
> For regular use or migrations?

HAP doesn't need shadow to perform migrations, so in HVM there's no
dependency between HAP and shadow.

> > For HVM only builds it could be possible to not
> > recommend enabling shadow.  Even for deployments where only dom0 is
> > using PV mode, it does still make sense to possible recommend not
> > enabling shadow for attack surface reduction.
> 
> What do you mean by "enabling shadow"? compiling it in? Running HVM without HAP?

I meant not compiling it in.  If the only PV guest running on the
system is dom0, and the domUs are all HVM + HAP, you don't need
shadow for neither of them.  PV dom0 will never migrate, and HVM + HAP
domUs won't use the shadow code for migration (or anything).

Thanks, Roger.

