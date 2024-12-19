Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCF9F7AAD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861196.1273176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOF0t-0007aM-O9; Thu, 19 Dec 2024 11:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861196.1273176; Thu, 19 Dec 2024 11:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOF0t-0007YQ-L4; Thu, 19 Dec 2024 11:48:19 +0000
Received: by outflank-mailman (input) for mailman id 861196;
 Thu, 19 Dec 2024 11:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QrUY=TM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tOF0s-0007YK-G6
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:48:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22a835f7-bdff-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:48:16 +0100 (CET)
Received: from BY5PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:180::20)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:48:12 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::dd) by BY5PR13CA0007.outlook.office365.com
 (2603:10b6:a03:180::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.12 via Frontend Transport; Thu,
 19 Dec 2024 11:48:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 11:48:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 05:48:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 05:48:10 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 05:48:09 -0600
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
X-Inumbo-ID: 22a835f7-bdff-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAPvNruc73mLo9i/lTjYNVO9VEisvy1fKxl5BXVxDAwKHxIRqISLdxl0QTQgJNSuw+IoINbq4wwuIEl0sjWQIL9Q3X/OWG0su5po6v9HUIV/4/HEdCr9h8CYEoozoyhxT/KsbFdwwBEC8aA1Hx9CHZ/n4dfBvhc9aZ63Y4D/ELmRrPgNOZreJdgbYJNFyKleNPqLsoo4BbjNnuTRU6+mQOmv9Xartqz4b9ZL54yTZDFoftT4Zky+5U8Qiux2Q+NO+G8HvwQaF0/KLkuA8vju0OONpuwxxfA4lhHNFPE3jG8Gq0TAnmdqrTcY19iDwv7mpGZHrNye7Yds3te/woctOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zyby56vWh5zGB3Pcac1H9OfoizXcHv8RILeAHEZ+O+Q=;
 b=okpMcGjPN8fe7aXjWJTqQXK7C5q17TsBhLGujk4plCOnsA1KdDNjNSF9dJTP4KzFDDZeqs27PqZVd3AhW9rdSlK5lRM2enjfdIIPTl0HB64rR6AzdCf9YkK8Wu/hQCw1aSWoyek/Mhzl7IeQ2b10YBDwiofjVxeH2kwZZl972CU+lsZvS4iVcaNMjtw6OATp4A1HbR4bBjRguF7hEidcqYSAgdSyLUaMEk/zWboqhbWPacmY4OvDmb5tf4OLGJ5GmdMAd9UcqcO4Hu9IJgFmfBPvnng3hKP6K3k/fgmp/qGbYUv/SpUq886o9WatrwvN2fx7hm3aRuNaEbkEGwL1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zyby56vWh5zGB3Pcac1H9OfoizXcHv8RILeAHEZ+O+Q=;
 b=EYfy7gXfkBEenZeOMSiX450r1XJ6WGHo6/TYZs9oWYgRDUH1h/MkiRY7dxLg1j91p1r7QnokteKmDcVbRVpWvMje72Td8fb1P7+IEvIJriDLqp1xhWB+5iScWRkVp7hQr3Veu4bQx6nWqm6d0f9+jpYpl/UUNeJK9nDGZv4jmEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e0c4b768-9410-4163-95db-5eff89cb3a65@amd.com>
Date: Thu, 19 Dec 2024 12:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	<xen-devel@lists.xenproject.org>
CC: <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
 <20241219112315.2461048-2-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241219112315.2461048-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: f4da8355-a6be-4e4d-56ce-08dd20230418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjYzdGpTNGhnNHJRVktVNlZLUUNSemYzemRvaWtQTDFPdldmWVpoNnBQUmtE?=
 =?utf-8?B?ZUlsUzluWlVMY3JDdGcwVS9BbFQ4OVAxTlFFVjRvY1NCTXBidXByYm5zU3J3?=
 =?utf-8?B?WHE3RWtpcVM1NFVGQW5McTB3eW4vR1lCcHVGQXV4bnhIT2JHRU9hWHNkd3o2?=
 =?utf-8?B?V05DK1lYVkxiM0ovYTR1KzVaWEV0NDh0SC92WFJGak16L0Y2RDBrNWJRTDlH?=
 =?utf-8?B?a01SNDJkRTNJNmFIMWJFTjREOFZiU3F5Z2I2aWhEQVYvclRQOTNqYlpUbzFn?=
 =?utf-8?B?dVU5Sms0Q2lna1JnWVJIa28ycEZIOGIyVE9LWmxDRXhzMVR6OTJPNkZtTUh4?=
 =?utf-8?B?YkFWT0xjcG9SK25HQlJYekFYTTI1WTluREpzR1lGQTQxZ2xQQy91Rlc0TFJp?=
 =?utf-8?B?SG9lRVkvdU1hbmdzeC9OZjJvRmNpbG1Mbkk2NUdtNVZKOUErNlk0V2FMRzJ3?=
 =?utf-8?B?TTZMZEN0UjVVcDE0SUhPQnUrVWNFRDdNeGpOSTkvV2lmcXY5NUNvNG1EVS9x?=
 =?utf-8?B?V3R1TWJMQ2N5KzFjWVluOXhyUmpmc0lEb2ZQUTE1SlpGOExmSm5TYlgrUlU2?=
 =?utf-8?B?MUkvbVRSd0kyWWZ3blQ5c2Jtd1UwTE9nUUtjVFNBNlRhWE9CbUhhNy9JamNC?=
 =?utf-8?B?MkFSOG0yTTR2czlUM0JoN1NadG8yY09NNFU0dWY0aVVvYmFKQTZnVmtLYk1Q?=
 =?utf-8?B?THFJcUdFdUlKMjNHKyt3TElHODVGaWI4NDhsQ1FKeERuYklTUzM5bjB5M3d3?=
 =?utf-8?B?d1JPQVVGMTlHZFlLTHZQU3gyL29xZzFoNnZlWFlzWlZlMzRPaWNWOEFQZWU4?=
 =?utf-8?B?a0lVcnBXUS9oU3hYZytzUzd4WHFyNWtJbXFZU3U2MnJYeVhNM21ucVV5dFBO?=
 =?utf-8?B?cTk0T3lnMlVEMmZscEhLcWJWYzh5dURNSG5hdDhITElCYVpzeDBhN1IxVmdy?=
 =?utf-8?B?S0p4M2xLK3Yvb0NwbzlRbnBCUHJPV25RbXUyWlNGMDNnU2drYnF2aWdkdlNH?=
 =?utf-8?B?bFRYckVnYmVEcWlHNFJWaTBzUFpqT01rMHRkV1lZL0pidG10d0ZJS29QK3ZC?=
 =?utf-8?B?WjNHdnVhdC9zd2JMeGdrM0JaQStCQlRMWFUxaWNFMktEYUg3cko1bXNsMmhD?=
 =?utf-8?B?WVd5UzJkak1kUkxZMi9SYVdPekI0d28zeXByblA0SXRoTVBLM1ZtYnZ1a1JT?=
 =?utf-8?B?MVc4SlJPeU01ZEhDOFlDaWRHdkpFVEZJNTFpLzhydmVBWkh3UzNNbHVrSDFr?=
 =?utf-8?B?SWpXcGJlNFhnamZMbGRUeThQOHpGNGFGTHRsSWo3UVRGRUo1cDBDR2RaaHhQ?=
 =?utf-8?B?OXNFVTNzK2FWLzVwdkFGUjl4aWg5ZjdBMnl1WEZzaWpOcC9hVkwzT0szc3dw?=
 =?utf-8?B?Ykp5VmI0WG5LWkViNXVRMlNNZ284ZDc5clJZNnJMeVVIanlxUklCM0ZCaDlk?=
 =?utf-8?B?QitwYmI1OFBFU0k5TW1jZGhxQmhvU1FjVDkyV0NySEtnOG9JYWhLQjZTbHhl?=
 =?utf-8?B?aFpwa0JWYzd0Q25TTkpHNkErZ0F3TWxISWFadnp3SVFPZXVOaFNkV05Bcm1F?=
 =?utf-8?B?OEhLN0w0a2VCUmVuTkZwdDRFNDNwdmZpOXFaOUxXS2NObGNLS084ZGZPWUxG?=
 =?utf-8?B?L0M3WVJKOVFnc1F4SzZWcG5sL3lyRjE2WWZlTXNlRm1DY2htNFA4bDUyUXVi?=
 =?utf-8?B?WEVRRkp4NURtN2xTYWZ2Z3Bvb2FuRG9wd1BnKytKZFZvVmFrN3h1bTFTTEVF?=
 =?utf-8?B?c2pQQjkxdS8xRjBKYXUyeElHbEhEOGF3RjdmU2ZDZzA0dG5DYWw0MXROM3BK?=
 =?utf-8?B?akY5aGJJUzV4R2xyUkU4c1d2c0w3cHF1MVFndjhQL1JxWW01d24yRzNlM0di?=
 =?utf-8?B?Qm1rcUJ0OXBGYWJCUGJOaER0bTV5bU5sanl2dHdCNGlpVkltbUlmUENQcks0?=
 =?utf-8?B?U0RiMmhqMllONkxFZU16RHBDTkg2bmpDaE1PclZmT01PUzRnZEtQcllSZlVH?=
 =?utf-8?Q?4zVa/vNBxSgpGW+dBPdjc7S3HrGdLk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:48:11.9407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4da8355-a6be-4e4d-56ce-08dd20230418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431



On 19/12/2024 12:23, Andrei Cherechesu (OSS) wrote:
> 
> 
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Introduce the SCMI-SMC layer to have some basic degree of
> awareness about SCMI calls that are based on the ARM System
> Control and Management Interface (SCMI) specification (DEN0056E).
> 
> The SCMI specification includes various protocols for managing
> system-level resources, such as: clocks, pins, reset, system power,
> power domains, performance domains, etc. The clients are named
> "SCMI agents" and the server is named "SCMI platform".
> 
> Only support the shared-memory based transport with SMCs as
> the doorbell mechanism for notifying the platform. Also, this
> implementation only handles the "arm,scmi-smc" compatible,
> requiring the following properties:
>         - "arm,smc-id" (unique SMC ID)
>         - "shmem" (one or more phandles pointing to shmem zones
>         for each channel)
> 
> The initialization is done as initcall, since we need
> SMCs, and PSCI should already probe EL3 FW for SMCCC support.
> If no "arm,scmi-smc" compatible node is found in the host
> DT, the initialization fails silently, as it's not mandatory.
> Otherwise, we get the 'arm,smc-id' DT property from the node,
> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
> are not validated, as the SMC calls are only passed through
> to EL3 FW if coming from the hardware domain.
> 
> Create a new 'firmware' folder to keep the SCMI code separate
> from the generic ARM code.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
NIT for the future. If there are changes in-between the revisions, in general you should
drop the Rb/Ab tags. Here you incorporated my feedback, so:
Acked-by: Michal Orzel <michal.orzel@amd.com>

The series is ready to go in. I'll commit it today or tomorrow as I'm waiting for
staging to become "green" again. Thanks.

~Michal


