Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE4B3FF61
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106220.1456960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPq9-0004iA-0o; Tue, 02 Sep 2025 12:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106220.1456960; Tue, 02 Sep 2025 12:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPq8-0004gQ-Ta; Tue, 02 Sep 2025 12:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1106220;
 Tue, 02 Sep 2025 12:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utPq7-0004Os-LN
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:10:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c93f9dfe-87f5-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:10:17 +0200 (CEST)
Received: from BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::21)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 12:10:13 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::3b) by BL1P223CA0016.outlook.office365.com
 (2603:10b6:208:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Tue,
 2 Sep 2025 12:10:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 12:10:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 07:10:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 07:10:07 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 07:10:06 -0500
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
X-Inumbo-ID: c93f9dfe-87f5-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbGyjTshHXpQkj1qznkFoXKiwhCD45zqLwVUVtF6pL1pJncJBR7KzZDcViOuHdn/NjfuIAFG7AUs58YMzXnf6eEFRRTjXt2jyePSZDxQO8NJo4jwjIiQ8RoZjM5WuIUeibeOrZhILlJKiBLdKhnS0GpmKPDn3YPqkLjbdnRsqc/Rt24NTiA2mpsG16qgrFk0uM/EgGDqqthDQXarFLjYvhdIJMQi2Wym+8QkgAPokMSjX6ZmZUjvk/MQ6Vgb9HlfKJLSbZePzLbaD9+rgT+DsqzE3xessXaSNkBH3v0PyikzSCr/LAIDobdrvo6HYmlPcvZKnGjdSF5fIRN3xWRh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO1uF3FNGPw7ezUjoIDMsMsbcoHxMUCDEIMqDsqIAW4=;
 b=eO+2KLyg4QKV0mrMEA9fGCniz909834DlJxxElQgb2X/Uh08/T8L9im1UBbl4N18mMjXppS8tC9CGQlZ2sJxAQMsvZm07aFxi1xC/g74dp180wWNBQeLOc8hIt7SiNvPzqDSRfJdV5X2j1PfdkU5XPKA5jxkSDdPHM0k+365TH0lmyrPHljZ63YH2wlvyjC3Yv5dre0wG5CbS+vLyiATtgFTBOMhY0OArX+OCVjSY15wYYTIGVSuCIxPD1Wrkz8lGqfyfMKDtzDJp7B2gcHPyOeTHTY+4lMADCQYnsDgBXhyIfw+A3mxD99NoPaJo19OX4JPTGVWgjFjtdc1YC9vMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO1uF3FNGPw7ezUjoIDMsMsbcoHxMUCDEIMqDsqIAW4=;
 b=fL371TbulKAQUHcRaxGwQjwq6/WKqaWRnT4J7qYiC1hYUIN1/dOUvfUqm7xpay0GBr9Nwc/iGtI4CPl5Vg8It+e/yBowYyMRToUqD6Em5MS5rX/Erh5/BVvX90I6TVifVmtFN7oqvRqSlosAsdPYHLRgMlQ1AM/OWEoeNU/UF1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
Date: Tue, 2 Sep 2025 14:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
 <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: e581fb95-3922-46a2-c7a5-08ddea19ab16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFhNcnBxOXBGZU51N0pKWHNNaFRiWHQ1a291ejVwZlNGczk4b2ZiMUorSldP?=
 =?utf-8?B?OENUT1ZaL05CblZWVEVua0ZLYmhPOWZwSVllNnVnS09tZnJFSFRvZVFsNHNH?=
 =?utf-8?B?Z3RKTFRPV0pVY1JiZzJtcXhSTzhaZGRBTGdkQ1BPcHN5cUxqM3pwY3NUT1U5?=
 =?utf-8?B?NUlaSnEvRk1sUGRncFNrR0w2TlZPVzVFYXY1a3piMkVMOW10bGU5UndlZjlG?=
 =?utf-8?B?OGlJaENVNTFFdHBFWlNuMHBldUJydFY3cDIxamowZWR4ODYvcmZKWUhBSUVn?=
 =?utf-8?B?VTdBMmM1bkFHb2F0K3d3bWZ1VDY0QmdaVERvZEx4Q2dWWXlsL1hoQ3hNOVZn?=
 =?utf-8?B?MnlxQjBwRy9RdzFmZmE3Z3AwcGJYcWpOZng1SGNpQkNIYWc5d2p6VGRTeE9Z?=
 =?utf-8?B?UC9nSWtrbGNiOTZwNWJpMmxXT1hOMlo5RTdQTm1NTmdhbXRPM0NLa1BoaDFz?=
 =?utf-8?B?QjlxdmJPN1ZITHVMQjBNYXlxRnNUQ2lqa2JiNUdHOFlSaGFSeEJuWUVHTFNh?=
 =?utf-8?B?c0lnVU1saUh0dVNGM2tYdDlsMmhJbFBuVXN6Zm5PWnF0RUp6SDVTam5HM2VX?=
 =?utf-8?B?VzMvdEhrS0Z1OHM2QTFJRkcremRSVHdNZExRV0V5VUIvWm9ZN0svL0QvZFRU?=
 =?utf-8?B?K1paVWJVaGlac3dRaE9lQjdqL3RsaFZGK2tMclFreTZCeSs5NUdrVGxWUXMx?=
 =?utf-8?B?TkFZVHdsRSs4ekoxRmtJNS9kNU1RQjZWNUpDN1dPRXU2TkYvWTlwc0liWlha?=
 =?utf-8?B?blByankxY0pYM0Y2K1pHM1lVaVF1V0lyOTUzTUhsT1NwRG82WU5rSHRYZWUr?=
 =?utf-8?B?MXoyYlh3QWFCMnhOd1dDOHdoSzBaZDltTGJoSmFnaHpMeVM2UUtUQmtsdVM0?=
 =?utf-8?B?dGJyU2N4UmtVYkF6RVpWQkM1K0ZnWkppVHdaRkhTeWNDcUFOVzkyby9mOFdN?=
 =?utf-8?B?Sk1EbzIrMWhjNmpvVXo0aEI5QmVNeWVkamtnSzhLZlgza2xibDNXMURVdE04?=
 =?utf-8?B?Vnh1YVllQTRhM0JaenZUTnhKbjMvZG5QdWtTaUFoNVQveXJQOGNCa0xTTC8w?=
 =?utf-8?B?b0p5SytDcEp2bUVRQWIyNmZEanBmZmozanNvYmtFeXc3amxrcFp2SzA2WG9z?=
 =?utf-8?B?MEpQa1FCTWFtT3c3VGV3bUhxN3RiSzJDTHdpRkFTSy9jclJ0SThBMFVTK0Zz?=
 =?utf-8?B?bFVUbGNIUmhXL25obUxnd1BsQ0ozRU5qNEFZZVdBUVRJaUg2b1NrOEZXVVhT?=
 =?utf-8?B?VWQ0L2F6MFcxSkR2czBkSU5zT00yeTRBYjRieXBqdEV0YUptbUtLcUR1WVFt?=
 =?utf-8?B?eGtsN2czcWhDL2U1UVcrVXltOTBJbmdyMVNCY3ErVXUrT0locW5DSHp4cnFK?=
 =?utf-8?B?clRna0NoeTU4dXZ6MlRMSlFnUFNkN1VzS0Z3TTVoc3gxTzJhbDhBWi9jc09L?=
 =?utf-8?B?M20xL21GUDBMQnduNmgvdmJ0ZW4vWUV5bUtxZXZKYStYZTFNVXkrcjZncEV6?=
 =?utf-8?B?b21mSllVeFljdG5iSEd6R284cGhRQ1RTSFRtbHR5RnFOU2ZKVFNnelFIZEdX?=
 =?utf-8?B?ejAxOXZOL3RkZG9CZlBObkVZRCtWYXBWY0FWcjByZzhKOHpheFVaZnNldXZT?=
 =?utf-8?B?eHJsYVFJTGRjL2pkMHdVREpPb0NSdXdvTUFSTmJNdGpJN1h0eWpkeVNqOXZ3?=
 =?utf-8?B?SFVuc2dnc2ZTelZuNkQwMXVMSjcxS3N2dHVJV0dHSmJkdGdMWVJWdzVvUGVt?=
 =?utf-8?B?TWVqWHlZNGtBcysvTG9XdlpmSS9DK1FVUG93Z1JOY2dmVXFnMklzRW1RTWxo?=
 =?utf-8?B?SW8yL0hHVWZBMks3b1lzVW9IKzBxaW5PL1BjenROTnJocFQ5WU1BRVJhY0dN?=
 =?utf-8?B?LzNnTEVEZldhRmxjM0ltaUlBbWx5Y1Z4TnJDSU03cW1ocU10K3V6RzJvazE0?=
 =?utf-8?B?ZExTVkM4WnRSQXpweUViSVNYUDNyQTBpRXJrdEFSaU5xTjcwZWFScGFnaHR2?=
 =?utf-8?B?NkhEKzYyQXNES2V2QS93ek42MUtPaEhaT3hzTjRZMlBtaTZxMWxQMGVTTUlJ?=
 =?utf-8?Q?xj8Qlb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:10:12.1500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e581fb95-3922-46a2-c7a5-08ddea19ab16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773



On 02/09/2025 13:54, Julien Grall wrote:
> Hi,
> 
> On 02/09/2025 11:18, Orzel, Michal wrote:
>>
>>
>> On 02/09/2025 11:49, Oleksandr Tyshchenko wrote:
>>> The said sub-op is not supported on Arm, since it:
>>>   - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>>>     cannot be returned), please refer to ioreq_server_create()
>>>   - does not support "legacy" mechanism of mapping IOREQ Server
>>>     magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>>>     refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
>>>     Resource infrastructure is used to query and map the IOREQ Server pages.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Could we perhaps add a Fixes tag here pointing to the commit introducing these
>> DM ops and thus add this patch for this release? Not sure what others think.
> 
> Fixes usually implies a bug and I don't see what bug we are solving. In 
> fact, I don't understand why we are trying to remove the subop...
Hmm, the issue is that the subop that is not supported at the moment is listed
as supported in the public header. I think if we mistakenly mention sth as
supported in e.g. SUPPORT.md we would have no issues adding a Fixes tag. There
are many cases where Fixes was used just to change something in a comment, so
I'm having a hard time reasoning about when it's appropriate to use it. As for
the code, from safety perspective if this subop is listed explicilty in Arm's
dm.c, we would need to write a separate test case and test to cover it that at
the end, still returns -EOPNOTSUPP.

~Michal


