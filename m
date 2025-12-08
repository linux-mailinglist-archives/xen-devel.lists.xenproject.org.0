Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C49CAD74F
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180732.1503865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScJY-00074l-24; Mon, 08 Dec 2025 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180732.1503865; Mon, 08 Dec 2025 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScJX-00073H-VV; Mon, 08 Dec 2025 14:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1180732;
 Mon, 08 Dec 2025 14:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vScJV-00073B-Qr
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:34:10 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2d2c211-d442-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 15:34:07 +0100 (CET)
Received: from BN1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:408:e2::23)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 14:34:01 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::82) by BN1PR13CA0018.outlook.office365.com
 (2603:10b6:408:e2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 14:34:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 14:34:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 08:34:01 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 06:33:59 -0800
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
X-Inumbo-ID: f2d2c211-d442-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnA+9yi1XGZqdaTvue0S/uxKI/OLojCl3YL5eqwcw8dGTFHv4AK+flSHxrOVyeBDyual5rNszPmjzhNxyadzamITi72UAGuw4v8zpNU0evo40ymGWl4FWap6DfLBmrPxQqONJxo9CLrRF3GmxgulyxAIz3k+Psj1OA5ddlMFuMMuRqcO2cag7Xtp5djD2WBo/RkcQEXypTZG0lg/ElfMt50O8f9Gp26/L0HCeq2xGRX844IdlwJAOW7et2Yb/TP6KNwUiqUh9vScFxmJwYXK+enOoyoTUsxSyoEc0NzuPdzog7wT/RtzW0oOJPEiwDu3FX19QO9f6qDGhaxwN5B2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDnVjRbgSYqxpkoxSP68C4S9GvBlqNNyIj1+ypoGNoo=;
 b=PfcnJdidg0GGfErkDc4tBW9+B3Bkd905sQUJFA3veLlInVwuiK/pl+6ZGP/Ytbo/P/7vohsQsyNCGWb/CmUWxf+aHQrwZ/t6U7u6GhYFpdJZvxjGmhuzaPyJYzmMxSlo03a30XQgXQDRRZuy4TX4CuUrBd2NHeWWMLmBwrmIBwt61wNrpc2SfNymRnrSEkvUBRxZqxkwA26lz0jNVqh4wQi9aERANP/FZTrKDE6QV9VU+13SmmBaguhV+fwf2kGvFjVWZbdceSWW+BVbQryXGr207Mv6Z/lzbRW4DurclE6hg9GK9cz8BBMgJLaDL+2RfCQpvNDWosnGgnW9a/j2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDnVjRbgSYqxpkoxSP68C4S9GvBlqNNyIj1+ypoGNoo=;
 b=b1h9M1ULBV3wBpdsw9IXbelp1ejWSl6rVFLRNOfhd7IezOB3c3PGfMpSGu2fgoyalaHaxS/Sn3Mij7iMhP3SU0rivFOU+5Zc3HYTjk7a1wmTvEyVlaYNTVk8Q86SAQDGSBOQuVk/m2lOgVOUOrwgUigM7JnCMOiDTbOtxMIf98s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <ebdd9260-0f66-4bb2-9c11-8b328c5ea799@amd.com>
Date: Mon, 8 Dec 2025 15:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-2-grygorii_strashko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128152218.3886583-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 1094a903-dd48-4cdf-f85c-08de3666d486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGlLaE4vcjlKS1VjN2pUemVKcEl0SEc3bm9GWGNyalliNlozQjRNK29RUGNt?=
 =?utf-8?B?dE41UXZ3QWxzQjNGbHZlOWEzc0FkRllab0dZVC9iQU1XUVA4dEwvbkJHTTND?=
 =?utf-8?B?Y0tOQTRSa0xrMUlqRE16d3BTR2luaWdQSHdJbkJKOTBicktIWFVoMFR6K3Yv?=
 =?utf-8?B?T0dHeGxCWGdZK0NMTFZRTnd4VlBkdWY3M2Y1QWVRUUMwSTJrUTdlbG93MGY4?=
 =?utf-8?B?UGtlbXZrVG9STGJVSlo3T2EzdXljU1J4NXc0Y2JKaW1kclZUM3U0V0JVWThS?=
 =?utf-8?B?RjlYZ3VJM3NxTXV3Mm9qSnNUbUg5amhma3NCZnFGMlhMbC9sVk5WWjRoZ1dH?=
 =?utf-8?B?eWNCRFJ5ZzZLdkNJOVV4ZmpuMFhUa3FnNjNXNTZVQlB1YjZxbDQ0d2p1YS9n?=
 =?utf-8?B?U21jdG5vT2dIOGxVNEMxTGxsdUJzeDJqYTlMSUlXQi9SUnYvM05sQkpwUnlG?=
 =?utf-8?B?L3AybUVLTGZ5aUVhZmJLZVRkV3pjWk9Ua1RhZ1RTdDd4TVZnM2c4ejRZcDM5?=
 =?utf-8?B?eTdVZlFVbUJhdVBVaVB4TE53R0szeXhkd21NalE1VEJ0cmVwY3BiSCtQRWxa?=
 =?utf-8?B?K2xZdUM2RHN6Zmw3R1ZOWlhHWHNMOU05TkkrdlpIRlhhRUY2M1ZMQk1rbTBk?=
 =?utf-8?B?dmFoL3BnSlhJdHYwM2FqMjd0SlFyOWVoZWNhNHVidzZUa01rc3FDdW5RalRZ?=
 =?utf-8?B?dVpRM3lZRnAwUDQ0QUVmSWhBREdXWTRtMVZ1REpld1hxTExSNmsrVE5EQTc5?=
 =?utf-8?B?dFZCaTk1UnNFeXdSWnBTdWE3T1dndnQzcndraTIwWk5Ic2t1QTNmVFd3TjdF?=
 =?utf-8?B?TWM2R01Wb2E2ZGFtdGZYQ0hhUlM1cmFpd3FmSGxsTkFVaDNYZDQxd1Jkc1Fl?=
 =?utf-8?B?WFdBN3VTanQyZ2FPRkkxVHd5K0syeW9rNldJenNOUDNuUFFXM2k2UXFaMVpx?=
 =?utf-8?B?Uk9xYkt4YmVOaE91TEhYWVZFZnkvMER0VHFjUng4emR0a2syTmRZQTUxdVZo?=
 =?utf-8?B?bFUwN3NXMXdkcmNJOW9vQ1FLSWlyQ1QveUlaK0FwbFlWTkF4a1Z3YnJyVlFs?=
 =?utf-8?B?WmpCNW14M1VwMEhQMnJiemxEdWFIM21wSDg4a1I4K3ErcWp0VS9ESElPK0w1?=
 =?utf-8?B?NmNBcEQwUWVZSGlKZjd6WGxOWGwvZEdtTkJ5c0pVZk1FOEc0bzROSzkveVUr?=
 =?utf-8?B?UWlac1FrcDdZc1c5eVBrNHU3TnNMTkRPWE5GeG1HRG9VSEJiYWp1VkxBcCtL?=
 =?utf-8?B?bTUrZVZ1U2tQN1piSEovVWwxQTM2LzlNS0Z6UlhwQlhGMG9OVm1XeXNtUjgz?=
 =?utf-8?B?cGFJUVNyYjU2bE82V25iY2dQTzRLYkFvVVlGTzFuU0xYVFFjUUJiQ2lubnVl?=
 =?utf-8?B?OWFWZm90OWY4a29OZkxIMVZIQUtZeHJCQ2FhWU5vemRDSWlyS21BaGxiRDZH?=
 =?utf-8?B?Q3NRdzR2dnR6K1JVV0hKQkFSMVFkTDJJSmhHR0RzYVpFUjJsN0p2djRNb3Jh?=
 =?utf-8?B?aDdYbUpNWEpOZ2JvTy9lVzhFY2kvaFphL1MzS2JIZS95MVdmSlVFRENNUURW?=
 =?utf-8?B?ZklNem9hN0Y4S0wwTWxidFdIa3l0dlliRFJHNm0xQWhHT0Rvd3p4ek8vZWNs?=
 =?utf-8?B?OWx2aXJyZVdFU05vRFI2WXRhSFBoTnBQNnc5eGtRT1BNNFE4dDNDUnluUE1L?=
 =?utf-8?B?TlhpUEtidHk3N2ZScGNuejlJbEUzY3RaQmlNMkJNTng3cGxSdndTa2VnOGlP?=
 =?utf-8?B?SUR5SHk5MVlobHBCQkpnQUo0dkRMM0plaHR5eldWdkcyU2FQeExsS0RwcURO?=
 =?utf-8?B?WXBDbGxZUFBJdkxwS0QvcXVzMXpFODZlcEZJaUMvYUtJNFk5VnNRbTdQeSsv?=
 =?utf-8?B?MEIvSkhmZ01maGNhUnRTT0VtckFzb1ZzMXd4K3hFV21CVXBMNU9tRzBGUFNl?=
 =?utf-8?B?Nmg5eHB3WUorQk9LaHNLTmJQRC93SVI2WFUzWE5hSm1xN3gzamk2d0IxU0tn?=
 =?utf-8?B?eG1Td2dsSWNiYVBnb1RMTGxHR2xRYnNmeGYzdDdFY3hXd0UvMi9ZM296a2pW?=
 =?utf-8?B?eDBJOTVBemlaZm1aNnVpck1SWVl3bjNYc2doRitiVWZTTHZEUW1obkRFNnFP?=
 =?utf-8?Q?ye4k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 14:34:01.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1094a903-dd48-4cdf-f85c-08de3666d486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499



On 28/11/2025 16:22, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The domain_set_alloc_bitsize() is x86 PV32 specific and not used by other
> arch or common code, so remove it.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


