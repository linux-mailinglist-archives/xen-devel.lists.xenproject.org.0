Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE2AE7133
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 23:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024108.1400151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAmo-0004YR-Fr; Tue, 24 Jun 2025 21:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024108.1400151; Tue, 24 Jun 2025 21:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUAmo-0004Vg-Bl; Tue, 24 Jun 2025 21:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1024108;
 Tue, 24 Jun 2025 21:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnmP=ZH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUAmm-0004VO-HE
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 21:02:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a765dc1-513e-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 23:02:30 +0200 (CEST)
Received: from CH0P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::29)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Tue, 24 Jun
 2025 21:02:25 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::b6) by CH0P221CA0048.outlook.office365.com
 (2603:10b6:610:11d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 21:02:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 21:02:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 16:02:24 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Jun 2025 16:02:23 -0500
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
X-Inumbo-ID: 8a765dc1-513e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtTR8jT9olP7XZKcro1VybMRLLMpq171X871OpRlFsVgADrgdOktkhp2tnVJpSpE2g/FLZlGhtelkwQ1NA/hZgxMBoGnR1tfw3gu3hzkqOZdegLF7jvVUb/scPJ0S9rAbt7y351HuvbQWYoO59hx8DOK6nzS1BobFXuOJPEJcok+VEtoyL1f2r5XF71r1g03Gb+ul8C0ZY8hSXKLxKbKs5dkG0QW9BkYHIUpbGmyNhB9y97RA6tunrB1wdcgGjZky/Haa5ZDxX+eDUZIruhKhKC5jpMaLhNPiK5wNFZEPjCZtj3wT/3VihOdd1Lb7WuHHpqsWUQUpXx1Db0IBMea2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iziTIulgBRL0iZ4VHL8f+gFBagH0ReS49NxaMmUA4fE=;
 b=KT8JfPotumlJOqq95uopYspqvzqmCUSxYVBKMo8rLUME1ZiYQ+nsq/YsbD7Pd7XO7TVAUydn3Rq0wIOK8friQsxz51bhOMGdF12MqLWEnzNffxttWRuWHPqaSWYE9Lep+QUD7RygCcNuWCCiuLX7D7lZ9u+tKWVGGaZnhccJy+N7kptGyBvIc+6ZgBRTRctUeqjX5WvAv6/xnRN2VuqcZb38zovvb+UTmSgUPnVDD1OoSKro1j777oJkgvD25iouH+ImgHSEVH+vt/3HPFtfqGVKIPW8m9bpA2mrdtTlYqFOkQdxlicG4b8q1MQVXEnxaMjpSwZOLP5s6YgU33mSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iziTIulgBRL0iZ4VHL8f+gFBagH0ReS49NxaMmUA4fE=;
 b=mj1C6CwUp5GtjUnHBYh6GVrqSii+zmMnDDdDSRVVywcsBC9sjb1yhl6ViQdMtOBpRjjQOfZdzOZL6OW8AOOWw5m9+9f/UuvV0apVZoHTY1GFhqqiGLM7GSZSkdWup5JNI5aVlAlj655yqVM3zxez4OyPsr4zuzqjH0KcXodj2FY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4845b3ec-7f08-432c-8d8c-eed611ba4a90@amd.com>
Date: Tue, 24 Jun 2025 17:02:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0d2b44e3-bf6c-40ae-be4f-d0ad2845e925@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DS0PR12MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebbec1d-0dfc-41d3-d05b-08ddb3626bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnRBZk82TExpWDVSUnBIcGE2SFZsbWpXUkNjRnFkQS9XRWxZTG5Rb2szekhk?=
 =?utf-8?B?UUlqbnE2ZnZsTkVQcFVYVGRRZC9sV3hXYnkzY3ZzRHNONzUvK1dneWRTc1Rn?=
 =?utf-8?B?SjdMaTBjaEpXR3o1M01uNnBBcXhxY2x2RHJtQlVySEZZMnBxUitJSm82YitI?=
 =?utf-8?B?S05GTWpYVzhMaGdHTHNyVUg0VDduRmFhRWR4aGgxck8vZzl5cWdJdmpaWFd6?=
 =?utf-8?B?YlpjeWJVR1M0RDBMUS9rZVIxWDRsYlZNRFhMUE5NUndnNzk3N3FIOXJQYlQ5?=
 =?utf-8?B?Tm1GV3FVMjY3SWNOZU9sT216SUdZa0c4MXIvOCtQSUttNytpYkxuUkZ3bEFI?=
 =?utf-8?B?bDhudXdyWkJsVnBtUW1pSmJoV29vamRFTk51SzZDbnNVbkhjdlY5aGw3S3Jy?=
 =?utf-8?B?a2haQXJGalNPd0FiMmtiMFlaNHUrUjZhamMxcGpyUWxJRnFBWUNPVFFoa0F2?=
 =?utf-8?B?aUZQNmZadmMxRWhaZnk2ZElTWGQ4THF6ODRDTU13VXNNMEtyZGlHYnZkMDdi?=
 =?utf-8?B?d3FwMnpGMFhMZDdadHJXME9nWUQ0c2hSbE1ka0xvTHA0dy9venpSSmQxcU13?=
 =?utf-8?B?OHBKQ2I4MTlRcHNDYkUzSzArb3JKQ3U4Q2NLdXZLQkZvaFE3SmtENU5JdVdL?=
 =?utf-8?B?eEYweFA5Y0NXY0NnWGlGTW12WklXN3BxWU1XeENBcnFDU1g4d0FBeE41M1Fp?=
 =?utf-8?B?QkdENjhCOWJiMWFJd1NUZDhqVFdiTUQxZDFCOU91M0ErdkN4QitkdWdqT2Nh?=
 =?utf-8?B?TUlwOXRBbnZIVkdKUU4yYnFkMlZObUkrM1QyOWVTWGJlYjlvNmpwVnVKZzFM?=
 =?utf-8?B?RG5CMGhhK2taSERoSU9KTjNJWTVkS2lZTzMyck4xYjF5MEpSb2N5cHJlUytL?=
 =?utf-8?B?OFZuQmhleDhOU0tiZ3B1THRjeGkzb3lPOHZlZmpNSW41dm5naEQ4elV6NXly?=
 =?utf-8?B?a0gxRmtBekp4M2JQOHBnSGkydUFHWnpNdFhWbHdKTWJNMTV4NC9vYnpKcmdR?=
 =?utf-8?B?Z3IzUWdBSEYrYmVXV2FkRURDcWxha1ZMS2w4elVVa3VjZUdQT3htNVlzbm1N?=
 =?utf-8?B?aXRrS2tjbkdQUXhyQzFJOEdDKy9XOVZRa2FoelFjcHJvekpxd2JBM1NzVkZH?=
 =?utf-8?B?UmRXNUlUa25COThMTHNHUy95SFk0MElwTFphMkw5cStpY0JnTHozZHpnQ1R5?=
 =?utf-8?B?a0JvVXRjMlNaU3BFbm1EWjJGV2p4TnhJOVdZOW5TNXY5Mkpyaml4dmtmbWhN?=
 =?utf-8?B?eEYxRmZOSVB2bUZ0QlJxYUVjMHhVeUcyK2dQSGVmeXpPeU50RXY4QTZMUGJR?=
 =?utf-8?B?eGdSR0x1WExVdWRMcm1sVGJUVTNJTUJETDlvZ0IwbkJOeU9HSm52L09Xcms0?=
 =?utf-8?B?OVVka2E2aGwzMXdYbzM3b3U0NkxJVlIzSFZENlowZXl2QnoyMjVmUVlYMmQ5?=
 =?utf-8?B?Y3hCa0luM0pWZU5LMWlLbTQ5emV5WHB3RzJ3OXV5aEtZREFVQWtKaEtDdEJr?=
 =?utf-8?B?WjkySmpTbHVseE9Zb1k3azlWK1c3QlI2ZjNGWWk4RHF2UnpldFE3T1FHbjNJ?=
 =?utf-8?B?ZFE5VnVtU3htWFV6ZUtMWkNpckxrdkc5VUNYNEFiQmIxaGZNT1lZTDZDaXpB?=
 =?utf-8?B?RkhLcTFhdlJ5LzNJOUFzRk0rbnFIU0tDd1JVS0VmNndrVGxab090MWVrUWg1?=
 =?utf-8?B?dEwxcDNWajRqTndZYThxMnhDMlRGSDdyWVptQzVxdEVpSXdWbFhrQ3AzQmox?=
 =?utf-8?B?NHRVZ3JNRDM5M3Y5ZWc2ZDVoRVoyb1M0T0sxcVdvUkE1bjU5c1FrcXNwQmZZ?=
 =?utf-8?B?am5ZUWhXZG92UzBmYmQ3SGZadEFKbk42cWxoRUxUR2lxVC9sM2ozTEUzMGpM?=
 =?utf-8?B?b3MrcFYxNlM0ZkFieE0rVi94ek5wZjBCRjY1L0gwamZvVWJNZ3l2Vmw2RmNq?=
 =?utf-8?B?RXFpQWlSNFpYMk1CbzBXMnZ2bGxZSExqQTBVUkFZUXJXSkhDa0FHZ0R5eS9S?=
 =?utf-8?B?YlBENUpZcjJvRTMyWmlSNU8vN3JuZWFUKzBzbnFXQTlubE92SWcxT29hRFN1?=
 =?utf-8?Q?MxArZG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:02:25.0747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebbec1d-0dfc-41d3-d05b-08ddb3626bae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535

On 2025-06-16 09:02, Jan Beulich wrote:
> Especially when dealing with large amounts of memory, memset() may not
> be very efficient; this can be bad enough that even for debug builds a
> custom function is warranted. We additionally want to distinguish "hot"
> and "cold" cases (with, as initial heuristic, "hot" being for any
> allocations a domain does for itself, assuming that in all other cases
> the page wouldn't be accessed [again] soon). The goal is for accesses
> of "cold" pages to not disturb caches (albeit finding a good balance
> between this and the higher latency looks to be difficult).
> 
> Keep the default fallback to clear_page_*() in common code; this may
> want to be revisited down the road.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

