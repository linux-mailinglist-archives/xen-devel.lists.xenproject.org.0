Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823B0D1816D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201385.1517031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbmW-0008PY-9M; Tue, 13 Jan 2026 10:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201385.1517031; Tue, 13 Jan 2026 10:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbmW-0008Me-6W; Tue, 13 Jan 2026 10:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1201385;
 Tue, 13 Jan 2026 10:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfbmU-0008MY-JP
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:37:46 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e47640fd-f06b-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 11:37:44 +0100 (CET)
Received: from BN0PR04CA0138.namprd04.prod.outlook.com (2603:10b6:408:ed::23)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:37:40 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::54) by BN0PR04CA0138.outlook.office365.com
 (2603:10b6:408:ed::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 10:37:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:37:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:37:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 02:37:19 -0800
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 04:37:18 -0600
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
X-Inumbo-ID: e47640fd-f06b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH7dJwwKtx/DDIJTESEG9aVak6Wt4SbPiRCCXwlkSsSKtdouK8Cf66S/4qDXBkI5GZlpc3rhU25gUARWlP9RiKORjCWxwCJotpT0RrKguWQgxC7w7etqPJsBm3PLPls8chrzaIElDqhrs8P+fw9tPKUw9aZTjMLDPaihUALCm8FKgJXQa/ujMN2ufRxZRfkfTZxfwHxPTr3sHGOROmDBd8iiIlym4ICmuaS/b0gJBxulr87AwopROVevKgOaqoIqyEl2QolASS0TwFNRUivOqX12QTqF68JhuWaAOrK8hnmK2wDJbqDYYsZ+tr2Rlm0fNMrdR3Vei4KNdfG+uoRsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgGxVNYG8YELeYIgfqBCNDjHyU1LsBL7L6iSbZP7FxI=;
 b=mFnt3JqZlpBiVvHkmuZ6Cy7TokFkLdmLYAGXyOPsjypLf485yZLnXz6vpHSmFa66A3Tm51fjM8q2biFJAI2NWHLK6OeE+aXl+0bR/c5Uw4BJv9ZRQwI3C9yJcyZf+w0VyqiQFLn6EgpvMoQWdNsqWOCQBSVAmv5DqxROLpRM+QW31n6A3xo1mW0BYYA9aVQhynOGo15/dygP1/msAbjkGLqUkVEvYrT0PzeuI+SHePWcb9zyd3dvRNnXhe8Thqyl5t+KPf/HSlc36Z3Cgt6ultPr/738dO0ya79Qi/rsT5/Ysrn1ThHoRr2JNJ93x0KZeJW8F3UpvueOwOspOR8lag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgGxVNYG8YELeYIgfqBCNDjHyU1LsBL7L6iSbZP7FxI=;
 b=db59u33DjcU8uoZYjxht1s9j6OCc5VvwVr1mPQHl3euQI/Vu464JETlWDn30wDC57IOYuRVI6vaAzjKYBsKhqlwzA6UFevi+UkVpditPg5E2X4hPj9bYI8CDnGc0ALGDQTL9N97v5qUQ/ggqEceRl3t4WOy/zMrTtiMBcb1QKKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b4689351-58c7-403c-83b0-002a61d582e1@amd.com>
Date: Tue, 13 Jan 2026 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm/mpu: Introduce modify_after_init_mappings
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Hari Limaye
	<hari.limaye@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-5-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-5-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: 9650a3e8-30c6-48e4-8d68-08de528fc689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFBTeXg0L0FhZm1HdWdxSThxTTlrNy9UaGY1Y0VjNVkvOWtDVTVPVklWVGZV?=
 =?utf-8?B?SlFtR053K3JENmhDOWh6MTVQTXlOeHJTNU10M2JudGp0Y1hlNTNrLzVrWnFn?=
 =?utf-8?B?UmxVMkRTUlY5UlppQ1ZheGlpSi9aWVBFS2xRNFFISi9UWDd5WmV6US9TUWQv?=
 =?utf-8?B?azB0SjJJZ1ZCNUsyVXVQZnVMeVJ5QzBuWjVUMHZNNGxYdGduVUZlTGMxcjQv?=
 =?utf-8?B?WFEyNGc5ZzRMbHJSWGZZZVQ4cDdyR2I1cHdUTGViR2U2UFY0aUlheTQvZWlD?=
 =?utf-8?B?QllFS2J2YnVPcmhnOHY4UW91bXNSOERUNEVzQ2g2OXRPVUZ4cFJYVlUrYStn?=
 =?utf-8?B?RGp5cXdJekt6L016YWppMDlaanhFY2pUM2M2b3IxeVhGWS9CL3FQRFFUL3RM?=
 =?utf-8?B?ZnJYYjM1eWtHN0QvQWNpaVlVMUhHQ0xXWmpPZHJPdDBDS25SZC9ITEw3ckpl?=
 =?utf-8?B?SnMzcXhzeDVtZjFua1ZVNGJ0MXRxSUluL0dtdnU2UklJYTQvb3dYSUVXQ0pT?=
 =?utf-8?B?K05teUpkZ0N1RjFIcUdQN3UzQ2pIT050aXIyeTVRYis3VTJ1aUh6YWZUVzNt?=
 =?utf-8?B?U3I0Y1hDSWxPNGRRenBlbjg3RjcxQzFnSVR0aUwwRVR4cm0xcG9xazVsUkJj?=
 =?utf-8?B?TU1FbHRncXVGaDdOOE5wOExtWHJUOW5jK2NTVnE2STFCMEEvVVdLY1Y2dTVI?=
 =?utf-8?B?Unozb0h3bzl0Q0tWR0Z4UEt2QVpXZHpGUlkxdjZHWUhUUktTOHlJNlpJN29Y?=
 =?utf-8?B?RVZrc2hYMDJWVlZGeStvS1VQV2NIaGY5ZjVoOTVnUEhpRGRYOHpCcXdDa3Zs?=
 =?utf-8?B?TnhzcWRiSkVTWUovTlVxN2lWbUhDWFhNelV3cGREcENjTStmZVRDOXZjUXg5?=
 =?utf-8?B?MzlrUkFxeVRWUUFjZU13T1hibWEwZEgwSS83OElzZHhlSHA4QjRxQkl2Z3NS?=
 =?utf-8?B?WDVJZG5ibEZtVWhYMWZ6Yk1BRGlSRGhsWENJbEp0bFY4eXcxZHlnSlF4UnBq?=
 =?utf-8?B?Tk05MEVRWmovWFdOcDZ3bVVqTjhVb2U5OE13REs4ekZ2anRRVWJDRFJ2SkJP?=
 =?utf-8?B?VzVzY1pZSFdKQ2o1VXc2N2lsSDFGcU9ScU5LenJEck8wNGdZWW1JZXBMYWtR?=
 =?utf-8?B?RVdZTGZudGMvNEowNXFiNTJSQmhncVZjY3BYY2ZmcnZUd2MxWnZDSGp1U29a?=
 =?utf-8?B?d2dFYTRPRmt1dVJPZkxsNDhXTWQ0bGhFWlp3SUVyNERDMjBWdklkbXRDam03?=
 =?utf-8?B?MHRvYWxpOG41SzUzTHZabFdSUVVvTThXOFhJL2JUNVN0VHppM0c3M0xhUHMy?=
 =?utf-8?B?NHBBVUQ2MmtDeldGUFZuME00UXB2MTJoZzBxSDYxM0lXeFQySGRhVUFFTjlq?=
 =?utf-8?B?bmtNWWJKVTlNVkRMbXN2TnBZcDV4blI4cWpJMlYwZ0VNLzA0cmM0bGxXaE52?=
 =?utf-8?B?bEk1cDlkdHlEa21ZVCtucXBlNjBWTFdjVjA2dE1pWXhubjNkMlBWMFBUYmVX?=
 =?utf-8?B?SkNFZ0h4VFZUUFdTcXdiT1MybE5BQWsvNWQzVzdIVHJ2UmwyRU5nRDZTT0xn?=
 =?utf-8?B?UFc5emd5eFpDNnZ4dlVKSnVXTzN5K2lGcVcyaHY5RzRNelpFNnN6VnZTVVdT?=
 =?utf-8?B?YmhlQUNXbngxNGkwMFJaVG9iYzhhdUUrTFgzTFZrZitVcmV1dGwybE9vdXNk?=
 =?utf-8?B?bm90L1JrcWFDY09Ca0JJVVVtekU3NU84ZjVTTmk4RDczb0JpakZ4M0FGb0wr?=
 =?utf-8?B?SlVWSDROQ3Foa0ZOSW11NWF3dHltbG5HZVJyUGVKUTlHMVI4U3BOUmZOWkN3?=
 =?utf-8?B?ZEpIaG11NElmVUIrRXg0Qkl0YTRIRmxNYXVtZXBKakZhS0xQMjFsNmViKzds?=
 =?utf-8?B?YkJRNUgvcTFQeCtydHdRNlpxQ0E4cUQyUG9sVCt5ZzBEWGQvS1NrcEEyYTBZ?=
 =?utf-8?B?Q1UwUjkzWFpRUTJ2bERjUWwybUErMnRndmFqVU5SQ2VvL3hpczVvWmFzM0VZ?=
 =?utf-8?B?cmQ2RWZxc0FUQllSTklxa2pxNlNzUnR2a0l0ckxpVU14MnR1ZXY5TEF3R04r?=
 =?utf-8?B?cGNhSjJGWEk5SnZZZVB4Vzgrc2xuSWxuQW1YV0E1cFNUWFp2ZURCV3ZHNmlp?=
 =?utf-8?Q?qaGY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:37:39.7465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9650a3e8-30c6-48e4-8d68-08de528fc689
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587



On 05/01/2026 12:35, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> During `init_done`, Xen sets the permissions of all symbols marked with
> __ro_after_init to be read-only. This does not work on MPU systems at
> present because part-region modification is not supported.
> 
> Therefore introduce the function `modify_after_init_mappings` for MMU
> and MPU, to handle the divergent approaches to setting permissions of
> __ro_after_init symbols.
> 
> For MPU systems `modify_xen_mappings` will shrink the RW mapping on one
> side and extend the RO mapping on the other. This approach prevents
> wasting an additional region between RW and RO mappings.
> 
> As the new function is marked with __init, it needs to be called before
> `free_init_memory`.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


