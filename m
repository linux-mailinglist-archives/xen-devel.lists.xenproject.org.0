Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09784995460
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813332.1226219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD2k-0001t6-Cb; Tue, 08 Oct 2024 16:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813332.1226219; Tue, 08 Oct 2024 16:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD2k-0001qu-A3; Tue, 08 Oct 2024 16:26:38 +0000
Received: by outflank-mailman (input) for mailman id 813332;
 Tue, 08 Oct 2024 16:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syD2j-0001pd-JM
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:26:37 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2405::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a4024b-8592-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 18:26:35 +0200 (CEST)
Received: from MW4PR03CA0185.namprd03.prod.outlook.com (2603:10b6:303:b8::10)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:26:27 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:b8:cafe::55) by MW4PR03CA0185.outlook.office365.com
 (2603:10b6:303:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:26:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:26:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:26:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:26:24 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:26:24 -0500
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
X-Inumbo-ID: 15a4024b-8592-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmrF62WXxJ+o6lmQkqYL4/2STaAOu93jlsURdcAwGgkI4SR6dyhW1wgIDJRB8ynN7H7zryAlSx4KktVNWSZfIwLqD5aM3/7laG2BJ1IIIU/GxogE1WacnhMeoRMSJM83g+02tXeFJ49iBmbQG28PuOBpm0N7pEHKmbJtm3SqKMYD4mdTmz51YYATatCQ1YuwbgpT0i3Dxz87FlpDMrWbiVhySQcc6mmijOYNKQ4HigPUM5mW7ukj3J5ZMX9w8p6i8JkoPoZlJcGteXILgjsdlhq+y55c5iJS4orHJBJlS9Wu8yk7Al+M+lfkMwNXrxOKVkxbfXSyAp85o3fk5k8IGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZMAHhIryKrkyrdYwQrfH3rn7AeVWhlCMqxtKqFEfAA=;
 b=wWrs51TmFWFXq4ZmrYXLqdFWKJrp32s1k+EwFRd9eTUG+/mpxL6pXhKcXOmWD5kH6o5Q4Wy4CjMtacDmvpKM3eBMcOmSZ0M9MGE0FoUvMqokis5oTUnz4TZBXjE0/gkhXReUM+0lgesP0Y54anPhdZc8g+BBugYz6cT5M6Qa+5ol7bOo9+/aQnWo2UrtWmVGO2PUfuttOKYRvkSEhjtiOjgaqSvFDPB6AJhauQ1h8j+Y1iirsmpH6ikbdhVBKlXy91XZcv34Czq2TPgPPRXtYkt7XEOaxS9g7sQK8/iHdIpoM9t8+JsetzAjW0EohJn5fUaD8TtPbqTZlgPamRtbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZMAHhIryKrkyrdYwQrfH3rn7AeVWhlCMqxtKqFEfAA=;
 b=h4EaSajDOATI43AiYsbN/Hpp3FFxdOORcZprEGeFEGzC2mWQ01Xm7YcFweJaEhzWG39OV5Px/tOyfM10Czhg4FfP7YshLIWxSxK4M2DE2CyTyOMUhSXavdblmQr9vAf583DWUzazke1NNDfPRRSXSOCdC1zFtAvnH7Cp6p5PMak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bea80e29-221a-44c9-addf-b04c82c505d5@amd.com>
Date: Tue, 8 Oct 2024 12:26:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/44] x86/boot: convert ramdisk locating to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-22-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-22-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6ed6bb-ee11-4533-89bd-08dce7b5f509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUxjYW9rNFZFaStia1ZBanFpSmZ5clQ2anU1UDRmOWNsV1F4RGNwWHRjSE5p?=
 =?utf-8?B?NEZWOFpPU3hPSktVdjRsT2hpelQ2a28wNXg3NmdFOWVTYURFY3QrM0w1TFRZ?=
 =?utf-8?B?MU9GU1R1SWJQRm55T3NkRDV6MGljVzBRUHgzYkxsR2t5RU5Hek5IMWZEd3Y1?=
 =?utf-8?B?L1IxUjBDdnp1OTYxMW1VYW5GL2VIK09vay9FN3BHL3dOMHM5dnB2Z0dVU3RP?=
 =?utf-8?B?MWlubEtoaXNnTzN0VXQyTm5LT3E1dG1ubmVPaFREVVF5QkRJMnhBWTBJVHZU?=
 =?utf-8?B?d3R3Ylpxcm1SQllLTkpHcTNaRjZYZUoyWEpvOERRNEJNaWp6cWYzUDRua1pC?=
 =?utf-8?B?VnYxNk5FQ0puWnNJWXVUbEhITGxZQmVFeTU1RzA3Sjh5UDVkUWd4YS81SjlY?=
 =?utf-8?B?YzlQR2F6dTBWQVd4eDd1VUQ2OHF3ajBUNmpIbkpBdFZ4SWVIamwxaEMrYW9B?=
 =?utf-8?B?WEdJMTBQUHhDSHphNW42bVNjYkdZNHNmWk9zMjYzb0s0OGxqZkgzT2VjdHlI?=
 =?utf-8?B?MVpGV0MyNjhpV3ROcm1jd3dFMFdEMWY1bmU0LzdWQXo1cEN4cWdjbkNVSjAx?=
 =?utf-8?B?ZXJtWktEU0VoWjJrbDdSS2themM3am9TZW0zYWxsR0RrelJHeTJBRjc3UHpB?=
 =?utf-8?B?L0NFR1huMi9TL2hkdG9pMkJoVFA4N2hlU3R2SXFEVmpTdjZnTTNYSmprdk5Z?=
 =?utf-8?B?RlBSVlZ0ZWJxNk9SWTgyUjVzSmIzY2hMbWpGMVZBL2lMemkvOFpzREZ2aU1s?=
 =?utf-8?B?Y2ZtQTM4U3QwN1dyUHRSZmlqaGdhZFZ4K3Z5U0hNQXY3aGRraTBkTHl1WnZ6?=
 =?utf-8?B?TlhnYlU3RGYzMmFJdmxldmxad0ZHZWRVNVNsODQxYW9GSDlhOC96SmhuRHZ6?=
 =?utf-8?B?VkxyNlhzUjJvVDlrVWxhTkU2OEx0akErQ292K3c4OUlQUmxJTEliUUUrbHZY?=
 =?utf-8?B?aFdjZkdsNlBUNnJsVGUyU0xJbWpYZkhJYkFMMWNtbEpzNWFnZm1YRlFVaSs3?=
 =?utf-8?B?aXFCNWhIRCtjM2lhcGwzUmxEOWdCUll4ek9VRE16Wjd6TGlMYmNUSG05V29o?=
 =?utf-8?B?bGNwaTNZZmxoQ2xwdWZ3TVJsaTMySkFtU1N6aEYyb251Nlh3YTU0aEh1MFYv?=
 =?utf-8?B?KzhvdHJvelIySllrQzVvdkpqbklYbCsxeDVsQVpaTFFoMmZLRGNMVE9NYWtI?=
 =?utf-8?B?UDAybGdYUWxRQUFsTmlHRnB4VkR0OG13V3pWU21lYW1CVmlJWXBkZmJGeEVj?=
 =?utf-8?B?QTgzTmlBOXFSR1Jhbmo2T0pLRnUzNEtBMitHMFdFalZLZHZnVmRXbWNmOGhV?=
 =?utf-8?B?bDRQbWprZkY4RVhqalMvdFpXVWdzdjMzNThyazh5VGpNNFBHRGlxaXF1QldJ?=
 =?utf-8?B?dXdYUmw5N0FDWHhxQ050Wm1QcHJXSWhIOEdaMlpLOXR4RXZCL0hBcXVJU2NF?=
 =?utf-8?B?ZjhUTzJJZzNMM0hHcmRuTWpuMW40Rk80c1A4RG52ZFVLNnlwZ1VONDc2bVd0?=
 =?utf-8?B?RFZBU2g4U1lFaVgxZGREV0k4L01DaUFLdGo2MThIcmViNXVxWHJycWFyNlI0?=
 =?utf-8?B?VXQrWGlHL1czNDZWaEx6UlRGdmhadk9Va0pydDB2MnR1cUVPakdOQ1JhWnc0?=
 =?utf-8?B?eTlRZzBybFUyRGZFTmQ4MmNCbkFwcWJSeHpNV1VsMjIwMTdDOGRRS0NrelZK?=
 =?utf-8?B?MzdCQm1uY3pwWGNyekhFc2F2cEU2MFJkYmhPVGIveDJYR0U0OWFoQmNRK1lF?=
 =?utf-8?B?YzAvVkJHU3VwMnZSSWZCRExTeCtLWEwweWFVdmJKY2MxQmZ3dVplZjdkTzlh?=
 =?utf-8?B?dkJndTRiSWZXVXVUSzNHVE9Hbnl4MDArT3ZLU0d0dVoxVmRBZTN4SUhuTlA5?=
 =?utf-8?Q?al2EUfs9ZBiUJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:26:26.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6ed6bb-ee11-4533-89bd-08dce7b5f509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Locate the first unclaimed struct boot_module and mark it as ramdisk. If there
> are any remaining unclaimed struct boot_module instances, report to the
> console. In the change, the new boot module iterator is used to find the
> initrd index, which returns a signed int. Switch initrdidx from unsigned to
> signed.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

