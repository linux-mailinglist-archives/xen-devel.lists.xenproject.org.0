Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O//EttzmGkoIgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:46:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBA168832
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237191.1539582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRlP-0007Dg-70; Fri, 20 Feb 2026 14:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237191.1539582; Fri, 20 Feb 2026 14:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtRlP-0007CU-3T; Fri, 20 Feb 2026 14:45:51 +0000
Received: by outflank-mailman (input) for mailman id 1237191;
 Fri, 20 Feb 2026 14:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtRlN-0007CJ-Ai
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 14:45:49 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d692e69c-0e6a-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 15:45:47 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN2PR03MB5296.namprd03.prod.outlook.com (2603:10b6:208:1e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 14:45:41 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 14:45:41 +0000
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
X-Inumbo-ID: d692e69c-0e6a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwMFMVKxXc48iPsbwSDvFYFg84iDrEJLN+X/H7OQdMsdKZnWG0uSB48Oi5saQv2Q8INqkpjd76I3ELH3D7TQSWGJPEcL7f71WcixJ8dCe8q+X7SfPSgAlfsbX5bfGb5WcYm6oo3YcRWkiZUZSfBVIv+dItlNp+AU/SeU+AABUZiSICJX75aUfMfT55lgMDVDqB38GoZ6W/bIz9oQ8s4UJMKL4k7pwX7UWDhLWXSD89vrrtB613yrT5WLYGb/wuvDOjlqYZWvPpUcLEXs1F5sU9TPdPuOmcxTs3PRUzwsKgGQCFldCQrl0oN5QN9cGkTmoUQEW1btiSuIrz5mhadxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSUifaZHUGwmzRe4KPJHz/PDlv3KpgVkIVifw+mGS2E=;
 b=cAR5K+c6Sj+Nz6C0UCJOT+4S9nKhJWPnLWW/DNVLLnZ1iRvz9eoSFCWgCETYRzs3ArdCNebyZvykwB9pElMQPjLGP2dKhA+i88m03lBNXDQE7+nM1wqBwrvcAjsLfjUriXk8eykIDcgQGK7leQ54N9qN7lkvfv2W2nBzTxchOgFUEPSRJQFE+ZjWlMO7HeFk8eA2y7959umTtWJtiL24BabRqVTYkqt70/PzW1Razl7Fu5f/17wXLollSsM/nWg9/als11ReFWV4AIyFQCGiQMGBewr/tlVPxQELF4NXBehBP5Khq3mJYyZMYtplzZZzZ4wRiUYsO8y+YT44Ita5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSUifaZHUGwmzRe4KPJHz/PDlv3KpgVkIVifw+mGS2E=;
 b=V21VoZjzLopbbm1ZkcNT4twz1jjVlwTuSLQu04BRLZSdnU+Fxgfy4Gddz8kC8k2heoGGrHJMbjWGj9Yca5UpCr+icHNXTTZd58uH9n5B1s70PjiQHv3s/JNvSxwYqY7jCclvl87afiwPz9bWlB4DwK44EwTd4YZ1h+yZw3Pf0gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <378949c1-c124-49d5-bb66-012d07355dc6@citrix.com>
Date: Fri, 20 Feb 2026 14:45:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 02/12] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <dbdc07e0-4700-6cb0-4ba0-927417482604@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <dbdc07e0-4700-6cb0-4ba0-927417482604@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN2PR03MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be95925-8c95-4569-d8eb-08de708eb828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVpmNUhmZCs1R01IbTExaWQ0cE5jK2RCYXZCWlhhM0tJcytMRWo2M1VFaTZr?=
 =?utf-8?B?anZrUmNzbWlYdjJudHB6a3R2THowU2xObXhtSnBJUzNoOFlybHhGanNMeHMy?=
 =?utf-8?B?UzFycmdmRmtPTXkyaEFrYk1SMU4vQmlLbHBSaG9hS2VHZHZIZlZ2ZFZiVHFH?=
 =?utf-8?B?RkhaQWZMV0tLVHcxM2tsRXVsbHJ2ZWJNaTcxU3Q1NWQ0MkJnT09DeVBKNE95?=
 =?utf-8?B?azZ5RnRSSHcrTGtBemZBQTNsdjVYUE9WRkdlVjlVU2hQOVdWWHo4cTZGUWpF?=
 =?utf-8?B?c2FiWmJkZkpOdzlqdFBTR0hranFNM3BsQWYrcXdBY1BCL1l1NGlzS3FVL1lX?=
 =?utf-8?B?NVNqdEZUajBTTTd1a21yVTYwUDd1ZDF4WjJrOTZkUGlmRDdHQ0xQWi9Qc3hH?=
 =?utf-8?B?M0dqaFM3ZGNnZmQzdFdWdWlRNDhaTnQ0aEt4NGgvcGx6OHdjMjdiMlM0Q3NL?=
 =?utf-8?B?NEZHRmhjdDFUdE9EaXFtOS9nR0NiRDV6ai9OVGdwVnR4V0N2NDRrOFF6bmYr?=
 =?utf-8?B?cjNBYWY5c2Z0clNkQzkxRFVacmR6eGJYVDBiT1BoTGk4ZGYyWmtGZERVUlFy?=
 =?utf-8?B?SUc4L2M5QUUwS0lmVDRiWkVuYVB6YnIzWHFudXZ6VjZFZmlWUDdhRzcrcjVw?=
 =?utf-8?B?ekJneGZtRjN4bGRJWFVGWTlTKzJtSS9sTWxVL3JScXNBbE1oNlhKeXZxTGFZ?=
 =?utf-8?B?NjdDcGpQY1NhRDBkZFdWMlpMcFdsdzZVcWJqTzhYdmpxMjZPUld5Z3JHSytD?=
 =?utf-8?B?OFUvaWRDU2lHRGNQSXJRQlh3QytnUmIzY2pOeXA2b3lReWlKMkNEUTkzMTVG?=
 =?utf-8?B?d2YzUFNkQm00MzlwT2FMNVRJd0FLT3F0bkFLSHA4djNJWXNjbytTLzMxbFN4?=
 =?utf-8?B?UUVJS1BUeFN6T291QUZpQmsvbURBSlRVQkZoR2R2WG9LU2F4UHdiRWg1WGpt?=
 =?utf-8?B?N0NKcXJBcmdzTGNGQkZ4NXU5RE5OZDY4a3VreWVVd01sTElaekthQ2c3dFlZ?=
 =?utf-8?B?QU50NFFmTHhwZGJ1R0RiLy9BTGYxR0lOaERkenliQW9kdTlSWEVrYXNrckFj?=
 =?utf-8?B?TlBPdkZpd0RjSGlNc1lEZzZOZkl2eklQZ1dENnpsUTZzUG5uOUsxUUdTZDJ3?=
 =?utf-8?B?d3BPbEhHRTV6VlFOZzZiRUpRV3M1Q0owVkUwaFNFS0JDN0oyamVSQ1BwZGdj?=
 =?utf-8?B?MFM1T0RCTytCTkNwbGVLR2dqLzdWbUFYc1grdmN3YmhMOWloNWdaN2lmQXpi?=
 =?utf-8?B?TnBkcFVMWGdvUWpkeGVpQ1BZMGNsWmVSK0hjMitWMG90Qm1QSHRzTHkzcDhW?=
 =?utf-8?B?d0lQZ0pUME5tcms4SktzTldQcmJKaGZRQWFOdlRVVmZ2Mi9tMG5wSklUdzVi?=
 =?utf-8?B?eUVITVhONGV2Z3VpQlVlNVd2aUN2WS82ZU5qU2RybEppVjkzc0pMaHU5RU9r?=
 =?utf-8?B?QktHV29IRG1tY1dqcGQweUlhVS8wUVF3WVF1bTQ3UExwVTVMVldQOGd4TzNH?=
 =?utf-8?B?aUR1ai9yMG1kN2NGOW1HSms2V3hQZUQ1ejF1bDU1UTBZWkpuQUwxWEtnRzdB?=
 =?utf-8?B?aHArUHFQYTBUTWxvMFl5eGtSbFdYQThxN21kODM1T1AxMmp0K1Evd3R3K2E3?=
 =?utf-8?B?ejRUZ3B1VTRzalhvaWZsWThPZjRxNDcvQ2xDK1ZxdWZFdE4wcFd0bnpWRGQv?=
 =?utf-8?B?aGp1S0UwL0VnNVRyWld1MVY0blNrM2Q5NWwydWc1UHkyc3laTDVXcUJsVWxY?=
 =?utf-8?B?Tmg3Wmx2UFB2ZUlxbVV2czdXTjhRWlZITWIxWnpKZ3lsRWp0NVYrNkcvNWZZ?=
 =?utf-8?B?cWVPbDZIV3EvNUpUK0dKQ2YrRDByTStYeHhlN0Noa2RzdlBMb1Z3RVF2YVJS?=
 =?utf-8?B?RUdQdmxIb2NkbzNzM1pYQi95cHFmL2pRQUo3T0RQL2tSUTE4OVpBaUFhSnBN?=
 =?utf-8?B?aG1pUGpPUlovaGJKMWhrQTVpTWxZSllxS211MEFJUlc1bDZ2Ti80anlyaXFC?=
 =?utf-8?B?MmhNOVVIMHBlWGFCQ1B0c3E0UDVWaUg0dFpDUTQyaTBjMllFK2lwM0dZUU5w?=
 =?utf-8?B?S0RyS2dhKytLWjdkVmlWL3ZmV3RSL3lxWUVYQjJCekRYTnlqNjFEejF5eThj?=
 =?utf-8?Q?UXig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTc2Nk5TT3dVY3ZaZnlIZWg1ajFWeldIaXlUQlVHbEVEVXNLR21tYUVmM05m?=
 =?utf-8?B?cllaeGhqL05XQ1B2dG5KS1BZaWp5R09ZbkorNjUvdC9OMXNCR0k3ZTNvYWNK?=
 =?utf-8?B?cmRYRDh2c2dHTXRjSHZEN0hCb0pZNEd2ZjdRc2xxNHVzK0xBWGNvenFaWThO?=
 =?utf-8?B?NjJuSVRsVEp3RlBOaWtYL2hjNGR6WjR1NlR1WXlBbEJtMFl3RUsyeWZVZXJJ?=
 =?utf-8?B?UFpKT2xadlZRcmJxdXE0a1l2QWhIRzVvMTVleXFuVC9mdzY4MDJmNnlEaXUr?=
 =?utf-8?B?aDVWaXpmUHJjVi80QktOZnVVRXowWTlGMWVscngyRnpHQWk0djVLU2FWeEpN?=
 =?utf-8?B?d2V4ZlN1dG1leFFIbnJPcldRRkRJUUFFMDU4VUVQR0RhU1pDem1ZMFNlVWxT?=
 =?utf-8?B?THJMSW5YcjMvemtSOG81M3ZqTlFFRXVSanduYU1nQXFpa2hSMCtyeFlrVXE3?=
 =?utf-8?B?UGQxcVcxWTkvb2djejR3MjM3bWw2VkJKSWpXd1VZTUU2WGROL1lxTDJzcjMv?=
 =?utf-8?B?bFRubDJ3VWh0bEFOUWlRcGhWbzZOWVlNdkRUMjd2bFVJdmVLamZYaVR0d01h?=
 =?utf-8?B?ZFJ6Z0xxT2xBdzZzRzRaU1hTSlRCVW95N2dXOFcyRnJDR2pNeFhIbzRwbVZQ?=
 =?utf-8?B?L0Rnczhna1l2M04zSXM2cVhkQ3ZWanMzdFY3Y2wrbkdmU0Y2TlhXaTBucU5D?=
 =?utf-8?B?YUlzVUVuRjlkczRreExaWTAxTDN2TEJjVHJVbmtId1ZQbzNhdzArWTJJWCt4?=
 =?utf-8?B?NURFSVFuWW9oMlBmUFRSL2lLVEFnWnFGcGJvQmM3UmlmbGZpUU5ocVZOUDFs?=
 =?utf-8?B?emhTNUE4NVJwbmhRaDd6Mm9ydXVBY3gxL2lST0laRWlKajAyZXBTTy9UWUFG?=
 =?utf-8?B?RVI1WHFnbEQ0RGVLT2JLYmtudmR1Zi82TzZqRHRhMmsvMmlrcFBFNHJUUEhi?=
 =?utf-8?B?ajI5d005QTJoc1J0QzNLMEpJRDh3aWNBclE2Z3dmeHVpSU1NMmdXemt1eCto?=
 =?utf-8?B?M3BhRVBXN1RFQWlCVGJuZlNDMEc2MGpJeEFqL3Qwb3JTVEFHZWZ4WE9XTjJU?=
 =?utf-8?B?ZkozczM5S0dSbnp1SW8yUXdzd3FnKzkvZ0poVHNkK1loSi9pRzFRb1VVdEVT?=
 =?utf-8?B?ZVZFaUJRNktXUit4R2dUcFIrR1ZvYUt1STV6MWw0Kzg2aWFsaHl0Z1g3YlJP?=
 =?utf-8?B?bDdVRzM4ZkFUNzFOcVlic0dVRnNpdUQ2c1VYYU5xNS8yd3dld2ZPVmkvZmFQ?=
 =?utf-8?B?MldIMmVIMnNlQ0JIR0VlQVF2WnFKdW9TRmxoMzlWbmxhU3dFSVA0d2hsdFkr?=
 =?utf-8?B?S25jdHgrT1puR1djTmlMRjZTVVdKdUNrakxzK1JNeStGeEF6VmI4b2lzbmtN?=
 =?utf-8?B?S3lKc1gzUFJLMU42ZkExUHB5UUxjMHhuYmpCOW5oeE5lVjV6SlJnZmIzSHVo?=
 =?utf-8?B?U0E3bG9aRzF6UHZOdWxrakppaHF2dG5uT2c4bHBBdFNsNm9VaU5xTUd2MWg5?=
 =?utf-8?B?bWVDQkp2a0MyRnlhSjBiMXBXQUZaUGlpajhRS1BkSjZjZUpIWmVQSWlxSnZ2?=
 =?utf-8?B?ZEsvdmZHR3l4WmpVSXBBeGppVUZnc0c3YUdCNG1yQlVIMTUxeWRFZmMxekNT?=
 =?utf-8?B?UnZsUm43L25TbGlFcWtId2ZOdTJ5cTZOR3MwNVZ4eXh1VzJGZElkM3lvOWlH?=
 =?utf-8?B?c0xpYjR4eUppNitCK2FKaUNyS0NtWUhWSWprWkJwcEJvQ2NSMm1YbzBYVEkz?=
 =?utf-8?B?c0FNUkVWR24xQVE4ZTU0ODhHU2xCZUhLelFsMEVVMnVvcXJKMU92MW1USU5E?=
 =?utf-8?B?TDJHRkkwbXFQSWFJQXZNMTVKSmYvUUFFYnBlUjZNNndJUDkyYWtxV2NkQ2Jp?=
 =?utf-8?B?QUV3akpuOXMvOEZBKzcvR2E4aUxUVHkxTS9xZ3NtZzV5VU5EMVVQcy95OG9M?=
 =?utf-8?B?UzVvdW5CS1ZYMWNJZlVzQUJrQTEzaWZWRzZQYXk4WURDaWFhN2RyYXlVbW92?=
 =?utf-8?B?SmtxcllwMWxiZXZRQmh4T3VJeE53eGZ0QWpzYnFvQStlRFRSRjRiK1k3VCsy?=
 =?utf-8?B?aktuNlR4OFl6OGwxSjlUZWRYVkNHZkdJdThNUDN0SXZIUFhId29rVnJmcjZo?=
 =?utf-8?B?VkxpYmhJa0dWei9rcTVhSGIzUExjU0gxNzZoNDVqYWZjRWcvTjV4TmNyYnZF?=
 =?utf-8?B?MlkxMXRmVWhjelZnMkxkTkxaUEFzbk82MStYaVhIYUU3Z1c0RXpQNm1vb0Ex?=
 =?utf-8?B?QlF1UWlHUWxEbzh1eFh5dzFpb2dXaS9sQmlBWFhKRTZ0QkdKZmJtdlpmM2VH?=
 =?utf-8?B?ODYwZytXdzFLdnkvdnBnY3lJczNYS2d5Nk0wNjZqSXhRN1BoRmxUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be95925-8c95-4569-d8eb-08de708eb828
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:45:41.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9CwtJcIqfNrHoOW/5uWG7NpPy1UqgNRrUYLDHXjBboZlw1gt55t3EHwRII07Yd5eCeoR9O6hzV+fAe3Wezd9ZOpm7ImkVAearphBBnfHpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5296
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 89FBA168832
X-Rspamd-Action: no action

On 16/05/2023 8:38 am, Jan Beulich wrote:
> There's no need for an indirect call here, as the mode is invariant
> throughout the entire paging-locked region. All it takes to avoid it is
> to have a forward declaration of sh_update_cr3() in place.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I find this and the respective Win7 related comment suspicious: If we
> really need to "fix up" L3 entries "on demand", wouldn't we better retry
> the shadow_get_and_create_l1e() rather than exit? The spurious page
> fault that the guest observes can, after all, not be known to be non-
> fatal inside the guest. That's purely an OS policy.
>
> Furthermore the sh_update_cr3() will also invalidate L3 entries which
> were loaded successfully before, but invalidated by the guest
> afterwards. I strongly suspect that the described hardware behavior is
> _only_ to load previously not-present entries from the PDPT, but not
> purge ones already marked present. IOW I think sh_update_cr3() would
> need calling in an "incremental" mode here. (The alternative of doing
> this in shadow_get_and_create_l3e() instead would likely be more
> cumbersome.)
>
> Beyond the "on demand" L3 entry creation I also can't see what guest
> actions could lead to the ASSERT() being inapplicable in the PAE case.
> The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
> PDPTEs, and all other logic is similar to that for other modes.
>
> (See 89329d832aed ["x86 shadow: Update cr3 in PAE mode when guest walk
> succeed but shadow walk fails"].)

I recall this being an issue in flight when I joined Citrix, and relates
to PDPTRs.

Architecturally, PDPTRs are are loaded on MOV CR3, the TLB flushing
subset of MOV CR0/4, and Task Switch, and are otherwise non-coherent
with RAM.  PDPTRs are not shot down by INVLPG/#PF/etc (they're not part
of the TLB state, they're "roots" of the paging structures like CR3 is).

(If you recall, this was one of my major concerns with your PTE caching
series, and I still need to figure out how to make this case work.)

Intel maintains the behaviour with 4x PDPTR fields in the VMCS, but AMD
punted on the problem by declaring that 32bit PAE paging under NPT would
behave as "normal" PTEs and get loaded on demand.

For a while, there was a threat in the APM saying that this behaviour
might start applying to native scenarios too, but I recall AMD saying
that this hadn't happened and was unlikely to.


Either way.  All OSes need to cope with both behaviour.  It's probably
easiest for Shadow to stick to strictly architectural behaviour, rather
than trying to account for a behaviour that only manifests in another
context.

I vaguely recall discussion of Windows 7 expecting one behaviour and
shadow implementing the other, but it was 15 years ago and probably at
least partial speculation over an unfixed bug.

~Andrew

