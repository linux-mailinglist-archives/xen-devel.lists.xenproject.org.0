Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5FD04DEA
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 18:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197880.1515251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdtem-00047i-1r; Thu, 08 Jan 2026 17:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197880.1515251; Thu, 08 Jan 2026 17:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdtel-00045A-UT; Thu, 08 Jan 2026 17:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1197880;
 Thu, 08 Jan 2026 17:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ozhl=7N=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vdtek-000454-Ne
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 17:18:42 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12627b46-ecb6-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 18:18:39 +0100 (CET)
Received: from BN0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:408:e5::35)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 17:18:34 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::33) by BN0PR02CA0060.outlook.office365.com
 (2603:10b6:408:e5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Thu, 8
 Jan 2026 17:18:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:18:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 11:18:33 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 11:18:33 -0600
Received: from [172.27.233.189] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 09:18:33 -0800
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
X-Inumbo-ID: 12627b46-ecb6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBeRhnb/5LHlINSyvlai1Vsfy4T2GVDoXaz2EKn5z+4fViweQ7iyGMJqnt+kCYWfUvYV7lCnuAbZztIppEYikPqc7c/NMJRTNxs43zr4V3jkgzUuSqup4N+rfezAfLEIvPrit9ZBagwn5k9gzNWOOdfky7VLf9Jj1ueVMTt0sm+MWUipDaHVlmsHD1YB/0XaZh3ErY5PM9Qdc9yMNgZZPJPnT+6TEr736StEEWTwQRhJ+FnizT3DtuqYT+JeINBkuaD27izta6a18fqHN4109TJSjNgSUbGUBeNtQdlDBkh7rtJcJ/bGBdbmaFydHX9JbfzXgnyVm8DV7qzJok2m4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNHy6dwqWztWz+1vfSEuUKorK4pasF/z7XeKyakB4ic=;
 b=MfKwP+VhOYx/t3b6ZXD8EutbVVW9tHbYj9f7oolvi80YCTYew4gHAQHiFyNNc+3jcN8Qyn397pWEJw7SVz7sS6SxIGi357JRnfAY017pBi0EJsp0hwP/731sWlR+bnrwHDQIxVuKalQqfiROC2i3dM3Xx1mkt+GWoOtEE5c5iwEHfDJjIj5Qzlxxv3IAbMTWsxGDKQcplnTMW0/1xOCE19KQbZ5P7Wr7ZLlGluIg0/8bzToiLlpTPSItfVwl41jShGjLFqKONJLQWxuF/92zMGntqdTOno3VPZEjySNh/EgNlYjuEJcZ/nGmglrqEeSA4cv2jpnhy1zXvzUp/w9Quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNHy6dwqWztWz+1vfSEuUKorK4pasF/z7XeKyakB4ic=;
 b=Kz8jeaW2zL7U8/wedW2OSjP+Zb1SmfdDumTF2c14EF1ager32Z686UafHd8hGBOHfxX3/ucArnKkk0+nUJeIMGmUaBeF4oNwjafHkiXj4AtAR/gl6zChJftCnuu3FwPygC3RESzYWbXnFTkiutC/6Pxe8r9F4beyddiHPvOKUyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <40e8c68d-350c-4bfd-8eb8-3eccb81cf427@amd.com>
Date: Thu, 8 Jan 2026 12:18:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: guard synthetic feature and bug enumerators
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <239a5d80-c0af-410b-a053-5fa84273aecd@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <239a5d80-c0af-410b-a053-5fa84273aecd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: d2eecf6c-5e62-42eb-a126-08de4ed9f41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1l1VFB2K0xrcGVYVEhsQXZlNHVNUCt5K0NpeXpSYTNNWko0eGhzZThlcXJj?=
 =?utf-8?B?L1RZYUJsQTJsamk1RDdyRkdMWFNEVnVWeThSNDZLbUoxTzFKQUxzOUZIMHdn?=
 =?utf-8?B?cGVyS1hsVHRhdmhFVGp2SkJkSWI3N0tYZFd3Q3VlZy9JVDBnOXVIK1dmaEVo?=
 =?utf-8?B?TGJLUzJkWVpHdCtGb05iWjdRanpHVDNrZmJyeGIvY3J5cXRHVlF1cHZOWDM5?=
 =?utf-8?B?NTNXOHlQWjJzVUlnQk04d1czQlF6SUF6eVlEY3lKRVJaZ2hvKzYxNzlvTGxl?=
 =?utf-8?B?OEVwdE8vOTBpMWpUTnFLMjZMYUw3N3FNTDFwSWZtOE0xZ0NNUVVvY0hkbWMy?=
 =?utf-8?B?UDFKQTNDdWZNaHhpc1hMTHhxVjc2OVkralh2ZkxkL0lMejlyWGZVZlZtbnlM?=
 =?utf-8?B?bWtIM2IyN2lqVWJEMTVvMUF6VkVjU2lzUU5HM0FBK0s3Z2RuZHZLVFQ3dEg2?=
 =?utf-8?B?VmNid2toQTdtcWlpY25FaEpOcDRjcFYwaVdSeHo0ZGJ0QmVuQS84eTR4ZzNS?=
 =?utf-8?B?Rjh5YzBYMVFvTHV2SUg4eDhKUkFHNTVqalk3RE1ubThzY0JEeSs4U1A1QlRv?=
 =?utf-8?B?VzVQK1hVblNKait4Rk9IbWhDVWM5c1dZd0VVT09nZUtjUjRTcW83Q1BnVG9k?=
 =?utf-8?B?TUt3eUZvc3RGTjBxQ3lOMDZOVTltTUM4UVV5SzNjS3RuNnhxMjRXT1dvSzZD?=
 =?utf-8?B?VStSR1ArNENtRDhDTndialdzeFBRWmVheVJQOWdxNTFKRGlHRVBDM2NzenZv?=
 =?utf-8?B?ZmFuTm43Q1AwQ3ZvZGRWMkVuNFFjQS9PMmRDR3BnMDVPa3YrTzk4cG1vSk9Q?=
 =?utf-8?B?U0ZMK0Q3dS9GRWdiU2VOZXVteUZaQzVJeVY1VUtOMS9rWTdPd2RWMDFIejNq?=
 =?utf-8?B?YllBdzVrRkhOM01HUE1jT1VTWU4xUThSOS9oRXlXYXVRTnhIb1VrUjhvQmdR?=
 =?utf-8?B?dFhlV3IyWHQwMzBXbXNVQlRPMTNCdnhCKzdvaytxY2Q5b2NZMXd1ZWxybWp5?=
 =?utf-8?B?cER1ejZNYUU4ZlNEZUR1QitLSG9uSU9pMWFtYVMyaDY0ZnMyRFFUd3Vva0RB?=
 =?utf-8?B?MHpSNTFpQ0kvTU5rMDQ3SE5qMmJtQ2dSUndIajdRbmFGeDNzbzdSK0k5ekV2?=
 =?utf-8?B?WWpkOUVyTnBwb2xxa1NKVHJMZGVSdHV3QTJRdkxBYVUyOCsxbXR1aFYzOGhn?=
 =?utf-8?B?RVdpcmZFODRRcDdET3Nld1J1WFhRc1I3aVRjTGduN0xaelY0L3ZaWHZ2ejNj?=
 =?utf-8?B?QW8vOUo3OTk3WjhvSk00TVdvK0VLL3FOU3ZhQXhKU2RxK2tjVXFBNnpWTjlt?=
 =?utf-8?B?b3RndVVXMGlhUE1hcmNhWHMvRnZ4NW1aVmEzNlQySjdsL090bzJ5M21nU0xs?=
 =?utf-8?B?VHdINXc0Y04zMjEzK1lreXRabDRCNlFzcjI4S0FGRTJoWEVLaWpBY1p0VCtC?=
 =?utf-8?B?OEltY3hKcjRRNFArYjhJZmdCUlozVnFlUml0a21CdVUvdGpVTU0wNkRKRmFj?=
 =?utf-8?B?YWtEVDdhMm1PY1JSUWdXaWd0VFhwN1RKWjhpY1pnUXFRSzY3QjJNc1h6K3Uy?=
 =?utf-8?B?UWZ5dWRrbmMvNEpuL1B6UUMraWIrbEVkRlNuVjdTNHdyZ3JVWHl2OWRHZjEy?=
 =?utf-8?B?Y3BGNWZvVHRtaXJLZkVLWDVEVmZqV3lyaitmUGxzalpWMnhMM1hUYXhka283?=
 =?utf-8?B?S1U0WGNIaE5qRDVEaXVSMHNrVURFZ0psbGFpd042eVpmM0VNL3FpQzJNMlNF?=
 =?utf-8?B?N3ZSaEhSRkpIWmxYeXdLTGlJZGg1bTVySDN5Q0VZRDVCK1prTDAxc0NMWkZ1?=
 =?utf-8?B?ZlhsZ2NVbHhSM2dxZzBtRjZXSFJtQm5jYW5UcDVkREZYa2s0MnpPbldjNW4y?=
 =?utf-8?B?VSt6dWdJdHlqZlkzcmpBam4vY1RYWjh6bm1CaFJReitnODBoeTJTVkZxUVht?=
 =?utf-8?B?dTVjZWJ2Q3hvRTR0aEdmYjBPaElXeTN5SWJZZm52Yy9sRjRNL2pXU3duSndN?=
 =?utf-8?B?Ri9IeFd0elAzSUdtSjVtWFhBcitOcUhONmJHQ052WFhpUkFrd2xKTGl1L0RG?=
 =?utf-8?B?cFZqbVRVZWtHbXlPYUdUV0lRczZ4VnhyZGxzVlhVbWQyVlBIclBzcXhBTURa?=
 =?utf-8?Q?DFtU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:18:34.3146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eecf6c-5e62-42eb-a126-08de4ed9f41c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136

On 2026-01-07 09:11, Jan Beulich wrote:
> While adding new enumerators one may overlook the (rare) need to bump
> X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
> checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
> other changes, as the expansion may not appear in the assembly produced.
> Furthermore inputs to file-scope asm() are only supported in gcc15 (or
> newer).
> 
> No difference in generated code (debug info, however, grows quite a bit).
> 
> An implication from the changes is that users of the alternatives patching
> macros may not use unnamed asm() input operands anymore, as the "injected"
> new operands would break numbering expectations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

