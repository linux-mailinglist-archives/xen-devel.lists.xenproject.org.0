Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4759AE712D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 23:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024094.1400131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAkS-0003QZ-T6; Tue, 24 Jun 2025 21:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024094.1400131; Tue, 24 Jun 2025 21:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAkS-0003NZ-Pj; Tue, 24 Jun 2025 21:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1024094;
 Tue, 24 Jun 2025 21:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnmP=ZH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUAkR-0001rc-U0
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 21:00:07 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2409::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34483e89-513e-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 23:00:06 +0200 (CEST)
Received: from SJ0PR03CA0220.namprd03.prod.outlook.com (2603:10b6:a03:39f::15)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Tue, 24 Jun
 2025 21:00:01 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::90) by SJ0PR03CA0220.outlook.office365.com
 (2603:10b6:a03:39f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 21:00:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 21:00:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 16:00:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 15:59:59 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 15:59:59 -0500
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
X-Inumbo-ID: 34483e89-513e-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaDYHQtcdwDInOO8yTpbxE8fJJhGgELhOdZZnMWlaePjdxndXH6wp70s67WrJRWTc5fMHaH/dnWaipXPc46pk1YULm5QiasE+CDC3pA6i4zjZvCpRfkVh5DSM3+0/8Fuwhu8vjGidZjIPCiKsqXqtIA/qmnePFXsplJrHNRxzW/pTvzqrIqhBOcYB+pTd2ecMckGck/aN2Ni59EMBuHGX3EYDliTtai1zcu1j6U2jF9r3m+1sTIb+LUknenqeEALcCTOitaQba8lryqfFTHJ4xC19JFbtK/uX65/gZ5AEkuIkw9enMefoFNZDGhZGiAHrrb1KkFbwt2dZOc4ch0BOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3uEL0VfP8gxDc1pnTVaS5liZ4SfDSVgPX7sBd+vu68=;
 b=Z2S6w5ULcMSqxnT3aohSSpM3rDzXSFmOCa4itMYty3/IDL42MpbxB3Axdoaxt44x4LTxployuss2GiyVkDb6Zug2x2s1z9lYh1qJFDooyxwj0YicRf7BC86v+03GfdyUyshzMFpRKmUgrXUvu5FtC1Vc7jiXKKz5a4yf5bv0Ub2lTEzsVUQ6avvTqvlnly0xqprGzMm9RrH0pa87bc9OVkerBFaO/2+XQIW0caWGzkc9f685YK0/j1m6hrZmnSKU8ByIr7w2ZQFCKDacXuywT+Zc4KnrsRoZETYJ4m+2CDWv8o54qNxzB7ABhBTtgly5EkCGL88gWXmtrMVa756QOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3uEL0VfP8gxDc1pnTVaS5liZ4SfDSVgPX7sBd+vu68=;
 b=wJ1Pf7E9dp39gfdYV+jtH2otwmwG2esiJcIQCD88Z7SxREwz3h4VfDdcT1qBz8C6Hotuo2lxfV6J4N758/6z/gwJWu8EoLsdnJyWRrM45FnQbPRATotj9waR1UFkB2RDw7Fqk0F+fB+Z29nWfrVwvko4+2wsf2yMnCTjKjLil3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <222702e3-d525-46fa-8ae5-45f3c184b9f8@amd.com>
Date: Tue, 24 Jun 2025 17:00:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] x86: control memset() and memcpy() inlining
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <c926a369-598f-4b3b-87ac-cc5ab94f8dfc@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c926a369-598f-4b3b-87ac-cc5ab94f8dfc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: cae5e0d3-6e49-4bc0-ca77-08ddb36215c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmRjUVdMbXNUR1pWbXc2M01vc0ZIcHloVC92VUNrM3FGUG13VnZPS2p5Lzd5?=
 =?utf-8?B?U1l1NjVxZzlYazVTS2JKZHN3ZHc1bktoZkswdTdhTDlzNU8xVnVYMm4rVEFB?=
 =?utf-8?B?eGFUK0daYjV2Z29admQrMFMwY3B6cCtqbFNacHdzT3lodm1YQ3luUWlpQmxu?=
 =?utf-8?B?cDhwS1lVWURYbjVjRjNMZDFEWkp6NkVzS1lzQTBiOWZXL2tzME16VmluODNM?=
 =?utf-8?B?VnFYakMvcERjRlBqQ1htRzVwQXk2RGdiYTd6NTVvY05XREtwQlZqTHBaSU15?=
 =?utf-8?B?RUpBaTdmQW5JZDlnWUY2dVNVZ3N2SnV1Tys2UDJXd2Z4WnhlamQvSEVPcjZk?=
 =?utf-8?B?SFlPakNGVjVQbDVUQWlqY0lCdXZZVGdMTXlBQXY2c2NhK0tGMHJRclMwd01l?=
 =?utf-8?B?TUQ2c2ZKVGxZWVplcjBOMDN1VHcwa2hRSUpBbSswaGMyMEZ4ODBhZ1hkYjFI?=
 =?utf-8?B?MWRSeEI5elozZndNK2krRTBkZzVKWVZrYzI5a3V5VlNGcXB5MDF4cDdpbUhU?=
 =?utf-8?B?MlUzbGc0a2M0cGtldEtzQTJEOHU4K29pbkpicCtQbG5pTGhxMWhweldIWjh1?=
 =?utf-8?B?OFl6Rmo4QmFkdm1FZmM0cmJNNFdXN0E3bUtqUDhjR0Y4dVF3Z0xxOER6NmhG?=
 =?utf-8?B?QTl1WGZvQ2NUQ2xvWlF0TmFMVitsSEs0eUovUDhzMTZRRTZDb3N5OXpSeXVs?=
 =?utf-8?B?bVYrMTVXdjZQaWhoK1pCQjh6SUxBUHZMSmRFTkxKZmtUNzVrWHIyQzA4RkpZ?=
 =?utf-8?B?b3hBR2U5Tld1Y1BhZXNhdk1JM3R5WVZReXBOU3diRXZBdlJwUjg5RU55a2FP?=
 =?utf-8?B?eUE4ekt0ZTlSOVZNMWJ4MjlOUmhIZzBMUnA5akdMM1NWcEttMHRLdmxsSlFj?=
 =?utf-8?B?eUZOMGNWVmVUUkRCTmNSU2duYWlockYvUUpFcE9MYlhiaGszRGRVT3NsU3Nu?=
 =?utf-8?B?OXFBS1RsZjUrN3I4eFQyeTB5ci92T2dZSjNDLzduZWJiVU9XZkdEc0UrMjVi?=
 =?utf-8?B?NzExeVdLeEVTNURuUlJCQnZ2YzJmdHIvUmlOY05TNjZaRnY4Zzh2T21lU0tU?=
 =?utf-8?B?YnVFZE1xMTJMVTZEVjFuS2hLMFNWbHRXaW11cDcvUlJzK0l1YzVEOEx1S3BQ?=
 =?utf-8?B?Nm1aL0pRZGcxcTFVc21DNFVsQmtISzQ3dzdmRmtzb294UGNjZXdoWnBYbVUw?=
 =?utf-8?B?Zk1IalBIb29QSllnUXNZUDdOZ1lpbVV6Qm9sc3B0UUZuT3NDb2tHL3VycGta?=
 =?utf-8?B?aGRJdTRFTzVkNTRqRGlGK1NSc3JjakgwRlU5RFlIRTd4ZTNDQU1DaGNoYVc5?=
 =?utf-8?B?ZTdBc1dYK1VUOVBYeHNXQ285c2RuQkE3RW9yTGV5ZGEzQVNIK1BJT2pFTEx4?=
 =?utf-8?B?ODlYek1vL2h6WER5cFZodXRDWTc3aUhPcHpvYkpNRzhzUmFraGx3YXoxa3ZY?=
 =?utf-8?B?d2p5bzl1bXFycEdiZWZIcVQyZ2gvQUxGdVRGWWxtc1VZWEpiS2xqS0NBOXRa?=
 =?utf-8?B?UWJDSXpyb0o2c2RTdHFZR3RBUDNMeWhaL2hUcHdYblNzWGg3RnFlVnVSNDV3?=
 =?utf-8?B?S0poV0JQREZRa0xRZlBVRjM4cUVqUUtkckZKc2NUU051WDJjWEVlekN1MnBk?=
 =?utf-8?B?eEVwbEdsWHNGdXNuVElkK2Z4ZEZFeUxpcVBZVElZVDdzQ09QYWhvYllHTm4z?=
 =?utf-8?B?c25FWGptMEFTQkc5S0IyZm5ZTHJZQ1oxNGZqN3VzTGoxTUlXeUhpVXJXL25R?=
 =?utf-8?B?ZzNYdXFmRmVhUU9Hd0ZsaHcrY1FQd09GZlBoMWp4eExnQnZTKys4VXRmdS8r?=
 =?utf-8?B?ejZTNlBlOWUrY3k2OFkxaGJ0WnRpbVJRYTFnOEp1YlB0MzFPT0Y1WW9qczFu?=
 =?utf-8?B?d1pFemRRbXJsMlNiOG1NMFBCbnlxYjN0MW9aOTRsQVdjYlpRWW9GNUQ3cWFR?=
 =?utf-8?B?MVd5SS81WXROcS9zdnUrbjcyaG9EYklnVmc1Z2MySHcrWkoyUDFlM0FXeEdP?=
 =?utf-8?B?M3JES1VaYjBpd1RlQlFEamlLdkJmb2JBT0svSFZ4SzNKU1NUZDFRcytPMFRE?=
 =?utf-8?Q?TvTK3P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:00:00.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae5e0d3-6e49-4bc0-ca77-08ddb36215c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

On 2025-06-16 09:01, Jan Beulich wrote:
> Stop the compiler from inlining non-trivial memset() and memcpy() (for
> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
> examples). This way we even keep the compiler from using REP STOSQ /
> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
> available).
> 
> With gcc10 this yields a modest .text size reduction (release build) of
> around 2k.
> 
> Unfortunately these options aren't understood by the clang versions I
> have readily available for testing with; I'm unaware of equivalents.
> 
> Note also that using cc-option-add is not an option here, or at least I
> couldn't make things work with it (in case the option was not supported
> by the compiler): The embedded comma in the option looks to be getting
> in the way.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

