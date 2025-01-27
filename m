Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64CA201D2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 00:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878232.1288403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYn8-0005Gt-W0; Mon, 27 Jan 2025 23:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878232.1288403; Mon, 27 Jan 2025 23:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYn8-0005Ee-Si; Mon, 27 Jan 2025 23:45:18 +0000
Received: by outflank-mailman (input) for mailman id 878232;
 Mon, 27 Jan 2025 23:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=naHB=UT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcYn7-0005EW-7N
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 23:45:17 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2405::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1542b0b-dd08-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 00:45:15 +0100 (CET)
Received: from SA0PR12CA0022.namprd12.prod.outlook.com (2603:10b6:806:6f::27)
 by IA1PR12MB7712.namprd12.prod.outlook.com (2603:10b6:208:420::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Mon, 27 Jan
 2025 23:45:10 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::99) by SA0PR12CA0022.outlook.office365.com
 (2603:10b6:806:6f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Mon,
 27 Jan 2025 23:45:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 23:45:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 17:45:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 17:45:07 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 17:45:05 -0600
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
X-Inumbo-ID: c1542b0b-dd08-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOQKKB8s1UHjWnyw5+SVVWMKpO1xSrq6jx5Zh92l6cJCDbd4yVXd5Y8JxPKECnScBOb/AM1/12c7kmTRcpPPi2eYuhBjJMNBKb5P7ZKWEMXaQ6nKaSiDkoae/xFwt+9ktDi/RdmlO1efxh73Y4MJJIgII0Azd3xAdQH5WC6n4iuhMPobiwa9wLQk7ePRHikHi8WYi1IBzHht5qwyULBVS9vJRMUOP0qZeXMgYKpFgoeD7F6aCwfINZBVEccSieKpp3b5t6e/E77cElKm1HKH7oG5CDSRBrkClgrXhQv6HFUN8Rh6ZpoiHh5i1ox4X36Xv+2M5Q+YYPFiZrgq1aNAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANoig7FuyQKJCpv8ZJW2tEa1w04hIsAQvmyOh3RHgjg=;
 b=uvzdEfcCGZVIRgduYShssbdiMCpuMYLIRB1cdn90DiZOvbKGF/V64kqaSY+gxgh+LDRKBSVVeNy/e0BNlYhXSdTLUnThl8eWlog+YhXbT6gaCL1ObifGmSazq0m6AuifE41hBkalMATFAyRGVNimjE5aILfnlSHGs587+U0Dp8zyDca35Y7VBOu4fehH4pdolvkDFFkVeO7rTFOiOezqUQG2OlNQwI988j3QpFgKMChWZyVo1smPVYBWi4Q55+7RaWX1JDIGSvrM3Tqi/oVGDro8LgE92nXDdk0y7Nqla09SwtaoCEne45Bl9bMaU/LHFxgGfUuYrU/YPhDIrvIbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANoig7FuyQKJCpv8ZJW2tEa1w04hIsAQvmyOh3RHgjg=;
 b=eI03PkDsuYl25uQBsfEf0rN5kONYjm/zz4wl3thh6JjPQjglypzYF1DhGqATiA1Et3crUaS4xDCyNIM749p83wp6C2TlgDAbAndQaEau7Lh7Lpye4AeMVrnc3b97ODMuiawM+xnZlgHeOdorwf2vd+HscFTjFXjJ+LRILYECGog=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <807198f7-37c1-4642-8d92-2a4844fef147@amd.com>
Date: Mon, 27 Jan 2025 18:09:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/24] xen/console: introduce consoled_is_enabled()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|IA1PR12MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4586e91c-88bf-45eb-1007-08dd3f2ca209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2ZsNFY1eFlDdGpaTmZsZXY0MytETE4xZEF2WmRuTWdjZWZZKzFUdi9nRDRL?=
 =?utf-8?B?Rm4zQ1gzOTNHZllrVTVnVHRXVVVxZDEwMjltUFZiK0ZiTlBVZk9hbXhKRkZh?=
 =?utf-8?B?dUdnbW9hR01OR0VtcEUyZGlrOWVrMjM1TktmbC9MTStDTW9nTUcwdmpGdndX?=
 =?utf-8?B?KzVKR0ZoM0crNzlXWUh0RjI0L0U2Snh2ZTB3QituTC95ZnNQVEdNZlAxUzlO?=
 =?utf-8?B?TUVYelVDWnVmS01sTHFtS1RpdkJmZFBnU01RQ1B4YnlTRmdjcEJVcDBCVWhi?=
 =?utf-8?B?ZWlYc1dITWFVdUlha3E1aGtLY2NLcDFobitrb1hZUWREdWNxcnAzeDhXbGcx?=
 =?utf-8?B?Z29LTmNaRVIvWDQ5aTlzWUNTcEdidk1jYTExNFpEc2NLYlNyZm5uZEJHS0sv?=
 =?utf-8?B?MHVLMFpXcER1eDdHRmltUnpJbFVBWmdmVlhTYm9qelZsWitpa0xyc05kN0hq?=
 =?utf-8?B?clRVaTY0QjFPdURDbmFLaGNBOEdkQ01GTmxoMis3YllDdE9FYUJIbTdOd1Y2?=
 =?utf-8?B?aldmSWFRSjFlRm84dDFvbUZWK1RpcHJGSDFvTW1YeHE4aERxNzIrUTI1OUhY?=
 =?utf-8?B?RW5FY0h4YjhMT04yQUlmanFsUXBpZ2hWVk1pRW4yODMvMkdsbHJPRHFkbDlF?=
 =?utf-8?B?UW9XcHVkeTA3MXU5OTdYOEFsdkwvK1N3bmU1ZEtDYXBCZFBibVNSQkxkTTY3?=
 =?utf-8?B?cXZSYzAvOUxXSnUzc3FoMFVpZkV0QUUzK1U4endIQ1YyVGxYaEMvd3pFY2w2?=
 =?utf-8?B?cnY0OUluVnJFQ09RV1ZNUU5EMEJiTWlQemYwOU5JTEtQM0R2QndOaXpZOHor?=
 =?utf-8?B?eWQyY3NjVmhzQ0liZ1RKVi9NdDdQVWpxaFRKOERrbDVSbUtJWjUzMkFTbHN0?=
 =?utf-8?B?TnVZUWhpSUpRMlU2QXlXczltZ0U4TldzcGVqRnNqU3dtelpvTHlKVkpqQ1NO?=
 =?utf-8?B?Tm5KOEI4S0xHMmhJNkQ5TnZyNmVjampjYWdPMDc2SzhzeVJNVEdDYWlRR282?=
 =?utf-8?B?a1FGY1NSYVNVUXJUNW51aTFXaGJGV3NEYnFMY0NLemxOai81Nm9PZjF2QTd1?=
 =?utf-8?B?aDRuQllZbzVpZm5GS0NzSmJZNUVMQjRIVnAwUjBWU0k4ZjU3OWE5NlRqSlNS?=
 =?utf-8?B?eDZJNCtxZzdsc2dVYkYrWEF0ZWMxWWdXSEs0b1dJcTFWV3hvY3NvQ3NJUHND?=
 =?utf-8?B?Z0doeFZoMkorY1JYU1Z3QmdyaGJwNmNsb21rZGQzMGtsNTlacURtaCsveUJY?=
 =?utf-8?B?SmQ3RXpHYXU2ci9oVzNSMGQ3U1RQTy9XVDBmZ2VNVGc2U2RFaEVxL2d0bVh5?=
 =?utf-8?B?bGxMa0FUOVFpU3A5akhUdzNEN2hTUklxamVVcEZvbzk2RmQ5Y2t3OGhaMlIz?=
 =?utf-8?B?QnJBNEprN1RMdkxyYXVhTmFPSHIxVTE3U1RSVGVEekdqc2cxM3dkVTZuMmpI?=
 =?utf-8?B?TkdkTTFWalpSZ0gvTlFQZXFNU21ETVRBZ29RdTRIUXMrWFlYMXdDNVBuYnF6?=
 =?utf-8?B?ckJleEVMT0MxR1VyVmxQYkQyYTU5U3Z2V2dTdDNiS0UxWHJLZnpTR0dIZlhC?=
 =?utf-8?B?MHh2NDA3VE12eW1oVVBUck92SUgvb2ZUOE5RNUgvdEpDYnZhNWtuK3pydFZN?=
 =?utf-8?B?TC9vUjR1YW1GTXdSdVFJTzdkQ05BdEg0K1JjbFpkVTJVc1RyaW4rVmxoNjFK?=
 =?utf-8?B?eFcwdlRrRVJ5MmZhZVhYUXhHYjRLMk45SnhRMXlaTlNLNjUwenVMcEtRWHpR?=
 =?utf-8?B?dHlkOUx1M1kzelBwQ3hrSEJBR3N3WFQzNENyK1UxV0dJaFM5L3BIOWlSeDZC?=
 =?utf-8?B?a1RySHpxd2p3L2QxdHpDWXVDbGJma2VaQjVrbUFVLytmakNsK0l0c3ozVG56?=
 =?utf-8?B?eXV4QURzYWhCZSt5ZDE0REFjbm1kbEpaUlNjRC9DTzBUWnpLTlEwYXBKTnpR?=
 =?utf-8?B?dFVtUDZmdnVIR25lVGpYVlNRaDI4ckNSc01acEY2cWdjQ0hDdTNmemwwZ2lK?=
 =?utf-8?B?NjUycmNtdGt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 23:45:08.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4586e91c-88bf-45eb-1007-08dd3f2ca209
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7712

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> There are few places which check pv_shim console under CONFIG_PV_SHIM in xen
> console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
> customize the logic.
> 
> Header file now can be included w/o CONFIG_X86.
> 
> Signature of consoled_guest_{rx,tx} has changed so the error can be logged.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

