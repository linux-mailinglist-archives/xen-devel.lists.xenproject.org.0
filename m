Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAEAB4813
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982277.1368822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEd1x-00037J-PZ; Mon, 12 May 2025 23:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982277.1368822; Mon, 12 May 2025 23:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEd1x-00034Y-M8; Mon, 12 May 2025 23:57:57 +0000
Received: by outflank-mailman (input) for mailman id 982277;
 Mon, 12 May 2025 23:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNBB=X4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uEd1v-00034R-Ed
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:57:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eacaa7d8-2f8c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 01:57:54 +0200 (CEST)
Received: from CY8PR12CA0046.namprd12.prod.outlook.com (2603:10b6:930:49::24)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 23:57:49 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::e3) by CY8PR12CA0046.outlook.office365.com
 (2603:10b6:930:49::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 23:57:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 23:57:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 18:57:48 -0500
Received: from [192.168.94.239] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 May 2025 18:57:47 -0500
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
X-Inumbo-ID: eacaa7d8-2f8c-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKJUvM90koNw7v4EMaW8HO4dhUV5E2mBD4qocIihCXMFmy/Ch+NogX0Jw+krYKksmMKOyYKLSkCEjUHqxLaUZEwY81FoMqnSeJOfBcFQNmlcCwodGrUbblFC6jx2Qi1JfXYM8gF3b3ExyvAQgXeDeGTfEgY5ouvZ32+nEpIeLRPfVbgCJd8BOAMdja835GD1WWSqrq30wG86CWTKSWJd4DYroPGh8FnpOx8wCaxUUUS25aw9pBjkJYseM4wSDMplksLs04UJ1RjBFmuRFCHH11qgfh7apCKj4bjV/MXxk+wrtc9i8hlUqKSkfDAvydr7CQJFF+piAjMCW7u1USQd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0uKKYff5mSu6UzZWbs2UCsZ+x5hy9BC7W7cMRNo6WE=;
 b=u3GvXJFQp87bIdUWwePuWLi+taJUTw4iXf43hkI1IakJBhyQPF0lRaW207vLcP68l9aVPjx433DFLVFdpoHH9bYQxnAXiSgM5RyBQcy2ubR6GWTPW47z1PnaA5E0pa4uPDZxTi2xXIsR4AAIWCn0WRpx869djxXMmKy0SrgZuVLj0h1CSOgoftXJnTUypkKFte8ybJuDHfuUTLqiE/JR8ljY6esHQuLCW43haFBz5ffIkMkkF4nXSUvgwGRHrspDWGWBqo9j/6oa7VQJMdbARASanpNl8sgXDl9W14pW7XonHa8szRl0kzr7EHU02KHcQ8sAQjoOE3dmNXRxiDuDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0uKKYff5mSu6UzZWbs2UCsZ+x5hy9BC7W7cMRNo6WE=;
 b=JQ6RvTO39w5rA1JJi9sHEInfDu8TTRjaHavMsjuFCveyjKb5IaNhMnIZBteDkAXKNERTXANlXN78xIJAnxntwx3oItGn0V9ndaFmPIao5Iw0kUysU4d2wwAFMGCr1JKoVCviv8Oefmqselwq66LzmdZko/PgBDGLOPd/TIiAXdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e48b9752-7f12-4b73-90f9-5432239b5beb@amd.com>
Date: Mon, 12 May 2025 19:57:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Only read legacy altp2m on HVM
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250512235409.18545-1-jason.andryuk@amd.com>
 <20250512235409.18545-2-jason.andryuk@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250512235409.18545-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f1c6fb-4055-4528-da22-08dd91b0cc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTVxZ21YZjdZWFI4K3pFTHNvbElZVDNESHZFbjQ2ZFJXSC9od0ZlY2p1VTdS?=
 =?utf-8?B?MURBU0UzbW9ueER4VlZtdlZ2U2VkYUk5M1h4T2JrdDUvVXNVUWdKelBrL01V?=
 =?utf-8?B?TEttZWJ6bDlUaHlkUzVkeTlkNkJKb1FXd1RyQzVtSGk2TWtLWlVXbXN6U1V6?=
 =?utf-8?B?REZPNVdrSGlQMlB6TFlLNndxMUV1TVZJQyt3MXNFMGdUdDZDekYyN0wzeExK?=
 =?utf-8?B?S295VUxoazd4Z21QTzczaXppc1ZsanRSSzBHL1NvUkFOQ0tMcnk0NlFUZTFa?=
 =?utf-8?B?d0FhWnBvYml6LzduQjJFeXZwQ2xhOWhPeDZvVHF0VHNGaU9xdFlpSUdCVUFo?=
 =?utf-8?B?MTRRLzhwaFkzTURXMUs3b1cxUlc5OXhPMXdXb0lDOTNSb2N6cjZLN0ZJNHll?=
 =?utf-8?B?K2RGc3lRR3NVS1Y1VUxzNi9qUTcydU1PWkNybitveUk2KzBmMUtmNmZTQVBR?=
 =?utf-8?B?eC9vaGRCTUE5NXRkd21HcEdhb25FckNOSUtwRHZ2NmRpSS9HSjBiVDdMNVZN?=
 =?utf-8?B?anUyYlVoeGNnQkJ2bTJTVFJkbEVuYXgwaGVKd2l5d0lkMXFFT3k0dUZCckJr?=
 =?utf-8?B?NnpvaSt4TEs2VGZTd293bHZIbU9nYk40TTRkOHZRUENuUEwwMXFBZVgzN1k0?=
 =?utf-8?B?UWRaZjhxbW1GdVlmbnZ1MjIvY2hYRTdEYzIxV1BuVktqaUY0MmtabDkrMU9H?=
 =?utf-8?B?czdQSHBPbEo5Nk5yanF1TkdCeG1ZbC9zNU80SjBQMGJaNHdSd0h4aHBldnAx?=
 =?utf-8?B?ODQyWmZRZzhTNk02MUxvSmlYY2JicHNpMTVYK01udW5LSnZvNWhyVDdjNUhr?=
 =?utf-8?B?N1dBbWd1RFFweXphZFI4dHNoRlFBWERGVTNVVHl2Z3JyNEpMR2Yvcm45TlBn?=
 =?utf-8?B?MHpvaFFyUXpCTy90ME52OWcxeWlGUGhYU0xMbFlJbEV0ZG41MXNUaEdjbktG?=
 =?utf-8?B?UGJxTGowdUsrTC8vQmFFeFFpLzY4L2hxdm9ucUpmRVFTdFpINHNYd3d0UHhm?=
 =?utf-8?B?ZWQvMktPS2dJTkhXM2h1anVxYzR0dGhMN1o4WC9KMmZ3ZTRZRk5DcWxlazJ4?=
 =?utf-8?B?TzJrMjMyNi9uakM1NTYxV3VCcytCRmNvRWhOMFNKKzlTQ2ljL1V0WWQvbUJ3?=
 =?utf-8?B?V3k0WmVVdEVrRExmS3JMcjA4czRsTmVRT2ZVcEhhQTlSSnpYbVFtQlBWdWJF?=
 =?utf-8?B?bzRuWWhqMzNNQ0tPWm5YK1NPVkhrYmhjMFJkSFFDSlRTK3VPdDBHeWpJM2Jj?=
 =?utf-8?B?QS9ZZHZxMkt0TjFnbHkvM1pDelpzQzRjRHhJM2V1L2JwV2N2VGF5dEI2Z0k1?=
 =?utf-8?B?eEFoZm9seDRuWnBjM0pBZnBOYlJBTzlHbHlBRGVqWWVlUzlsVmErSXdHM3Z2?=
 =?utf-8?B?cGZEOFdybmtUTlA1UUNrWGppOTZNVzhBN3RQOGVZY1JHRkZoeitMY1V3aFdU?=
 =?utf-8?B?OG9LbnpPWklIS1NUZHkwR1dkVzdqNkhzdWQ5aUdJNytoUnR2bVpURmJ4R29P?=
 =?utf-8?B?SGNEbGJuMG40cWJQR2xJZTNiTHJwOS85Ump6MWJWa1dLT2IxWkFZUWFpUEph?=
 =?utf-8?B?UmtNKzAralYxNkI2bi9iT2RBQmU2VDc2U0xXcm4yUEJYVHhucEtRRnhGWTQ1?=
 =?utf-8?B?bjZwYWZXUnlvdDNDWXcwaDIvdElBN2FLaEFaN3N3S0MvTmhYMDlJMUpiQUNU?=
 =?utf-8?B?VjFvWFUxZk8xMGV0aUlVWk9RZjQwRG9xYkZQL1NYK3R2cGYrMkVMQ0RXWmRi?=
 =?utf-8?B?SU5Pbkl3NTRZeGQ2VmJzZGtLU1gzREp4azVkRnNJbkk4bjcxOWxucnVnU2Ey?=
 =?utf-8?B?MnNDT2o5NExiNHpGQlQwSEJQaFZCeGxZQ2g5TzFsQjR4OHdLdEVRbjZoNVUw?=
 =?utf-8?B?ZVVWNVVTZ1FieFgxb2w0ZENzS0N1SUtpQTZpeTl0TmpuenExaTBXZmIzYkhj?=
 =?utf-8?B?UUZab05LRlZ2c0RBc29vQjd6MW9SaXkxRUV3Zllsa0tJWFh4ZURQczBOeU92?=
 =?utf-8?B?cDdKUkxoRElFcHZhR0JjWmtZTUd5U0FrQmN6bzRTV2Q0bkFBQkRNWkhHNSs0?=
 =?utf-8?Q?SIFpIh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:57:48.7656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f1c6fb-4055-4528-da22-08dd91b0cc8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271

On 2025-05-12 19:54, Jason Andryuk wrote:
> Only read the HVM union b_info->u.hvm on HVM guests.  The union
> access is not guarded, so this reads even on non-HVM guests.  Usually
> this doesn't matter as PV and PVH unions are smaller and
> zero-initialized.  But it could incorrectly set b_info->altp2m through
> aliased data.

Oops.  I re-phrased the commit message, but I accidentally had an old 
version in the directory.  Sorry about that.  Please disregard this one 
and review "tools/libxl: Only access legacy altp2m on HVM".

Thanks,
Jason

