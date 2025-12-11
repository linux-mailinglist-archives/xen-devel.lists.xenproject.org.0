Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1159CB59E2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183900.1506492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTedy-0002Xf-A5; Thu, 11 Dec 2025 11:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183900.1506492; Thu, 11 Dec 2025 11:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTedy-0002WG-7P; Thu, 11 Dec 2025 11:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1183900;
 Thu, 11 Dec 2025 11:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pO9S=6R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vTedw-00024O-JE
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:15:32 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b395a1a4-d682-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 12:15:30 +0100 (CET)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 11:15:25 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::3b) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 11:14:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 11:15:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 05:15:25 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 03:15:23 -0800
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
X-Inumbo-ID: b395a1a4-d682-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGBmKUUlgi4ZzmhzgdT08XM8jBkLbFTF2ENHuqjxzuEuE4pKScSQCrcdWfjyDHTKeqkI8KYBMPq5aa4aEBzjkqOydCnixm+LbJ9R8aGQ7DTZQ8GBgLcouKvpdKeIbems1UkXjtWL8iMc2cGtFoWsvvgH9Djmg3i+maenz+YzAdvu6TLGk7wf9SrUSTzgg/uazhKeqQtp9l5x7dj+fc++OaH16R2uHfiuAKP6SDxBOvtFIQXGDnZWghGYBHUpLS1n18lMHLWz4zaYlZBWtyHF1nt0t6Py7w3gTy/Lkrelrd0BYykTK7fhp7AAjnHPQV1QCfYURFzApHC4tNC4FShKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Av4SsL33QvZiSQ7fmjZAOUg8EApb7foKL41TwP6xI=;
 b=M2mqxrwtfRypbWRawsoAx5cPBgL5tc1cZbibonrxpuvXag0/6d+C3WEeUu9DULc/GjBdR6ZBD7cpa+F/tPfBlPrwsXqUS+lDvdVg4v1EAnPHv4HRiA/E2tOoUohLcVQ6uBRSgWG++nNYO4rAhfjmLnlkh8/TZKKLykoUNtKLPUkADx0/LB9VN2d1pSTXGVhfJT3/5xt4elj8MXSWy3xCPDajJ3MwfG25TBImFVFVgxZbb4mXhAnHFQo6GxZjsKpRTD1lmwx26iowRI/KYZvWnZnEJl00kf8ot0z8OqQMhyOblhw135jbe5M0kwqTSKNfl/ZC1Xuqwp090buVprJw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Av4SsL33QvZiSQ7fmjZAOUg8EApb7foKL41TwP6xI=;
 b=B68lFICkj2a64GMVwY/Xg57ddkTt421QTEcLUyVJoAfffAYUm6N5PEbJTkJvdGVZYizMHCqIRmWGaT4i67CUpco+zc8lL/rGfqBW9Nuqru+30cEYEWG4FKqNdunWJJ4JRc6WLDj4YZ1saUorI/bdFklR2myIb+cQ3z0Xv0E6k8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b687a13b-5d46-4cb6-b927-59d1917f7908@amd.com>
Date: Thu, 11 Dec 2025 12:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/libfdt: Fix comment following treewide __ASSEMBLY__
 cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20251209132509.2095158-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251209132509.2095158-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH3PR12MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d32b03-d5d6-486f-e6f6-08de38a69587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHY5Kysrc3ZJYnZRT1VZSlB5NHZUQWh5TW15bDhOZUxmbVFFQkpoQUdvZ0VS?=
 =?utf-8?B?ZnFkYzJlMis2SE9RY2JYVDZkZWU4eDM5WHhqaFQ1NkI5N0ZqRDhLWGVRRFdl?=
 =?utf-8?B?NEx6SFJST1RVZnhHUlFXRHFJQmZFRlc0Z3QwNnhUcVpBajl5S0VSazRlUUV2?=
 =?utf-8?B?SVJWamRibHdLWFkvdUpGQmZDbHIvY1lIY2k3OUhZd1YyOXFuamNzNVVXOVJo?=
 =?utf-8?B?cTJ1Uk4vbFVNelNUdTY0aVNJcFBvOHllZWt4alVrbmlpeWhzd2hHOVZmWHZT?=
 =?utf-8?B?NHk5R21WcDVtQi96Wm9wRnI5MXp4VjF4L2ZXZWwwczdEREdobG1WM29FNGlq?=
 =?utf-8?B?Ym9ORExtQlRPcEJvbTY0ZUVQc0NQc2piK2lUa0hibnhBN2dPN1BsbTFVWEg4?=
 =?utf-8?B?dTZUaUNZRGkvMzJ5MUlWQ3Vabm83TG1vUEdaWVg0aFJOejJqSUtrbUZFTUsx?=
 =?utf-8?B?eU9EWDIrM2xqNEE0K2pXRVI2cVVodDg2U0lSNG1tQlVKaWRST1VMbmI2MU5Q?=
 =?utf-8?B?R0tLVEc5cTBic0FHTXRuazQxSjQyN29laWZmZDRQNWdDVEFCK3lzeTVnK3RV?=
 =?utf-8?B?MEpsZWkxdjhoUVQ4MUlYOHo2Tm1YNWd1VGVxQXZmckVlc3RLeFJJNjZ3UEFv?=
 =?utf-8?B?RDdhanowSWQ4NE9LamNLMXJ1ZGZtMkRFV1JSYVl0R3RWbEErRVovR1JML2NP?=
 =?utf-8?B?cWttbUVBdHAzd3V5SXp0OUswU1lWN0hERldneVVzRzBBeHVHVzhTOVZMMmtu?=
 =?utf-8?B?eGJzUUJjN2d5d09jbE9LY1lVVDYreWZOK20vd2F5RlNBeHhsdmtNQ3BvUDds?=
 =?utf-8?B?ZmRkbjJHOUtIMUhpZDlaMTdGMmV5anhacjhsUDc5Qkh2SXB4ZUF1YlZEQ2hv?=
 =?utf-8?B?ejk4WFNYekZyVzBhZkFWeFhjYmhEeG1UbnR4eUhWT0R1QlN2UzhxeVdnNzd3?=
 =?utf-8?B?MVgyb1pjTHJuQUtUNzVFcE5vbW56NEF0S01xay9xclR4UlEvb1hwcDFKQUpI?=
 =?utf-8?B?U3V4a0h0M3JBbTRkL2x4SEVjTmFBbERYOFRmT0EybUhyYTIzdXZmT1dQZHpt?=
 =?utf-8?B?U0ZQd1p5L3M1TDB5THd4ZzNQUjBGQkJ6WkhTZVliRmJXL20xdWJYbDFPSmVi?=
 =?utf-8?B?VTZwTDg1c3dFUVlva3ptYy9uUnlXL1l0dTJtTUFSNjNtQU1ablptUjNWZEVv?=
 =?utf-8?B?OEJxcFJNZG9QeCtCOWV6WjJzZkRLSnRuZUtYc3dtN2pIQUFWQTZIaHk3eXhE?=
 =?utf-8?B?Wks2UWpnV2p3UkpoWGFUNDdJODJSL2RleUJIK1ZiMkhYVlVoam8ycWVhLzZM?=
 =?utf-8?B?UjhzQ3RXVG5MZjRzeGd3TDBlNS9RRVdOMlpNbmVtalFLZk5YWkJmRnRjdE1t?=
 =?utf-8?B?UG5GK0VGMzFUUitMcXNWVmU3bzUyT2JkUitZZk53R09tWlhaUGcrbnAxSFZH?=
 =?utf-8?B?aHpJTFozcXpLNGVOaGVzbGNpaUZkaDBwZW5IaDBLVStOQklrRHQzc3R5QjB3?=
 =?utf-8?B?SVVSMzBCTG1RSE9lUXFiR0VvSThpWXlMUGY3Zlk4QS9zR3FtYXJObUUydzF0?=
 =?utf-8?B?Z3lZOHovYjVhanBaYW96dldsZXRwOUJoOStjdVVYbkRJc0pZREh2dnFLOWVa?=
 =?utf-8?B?K1lnWms4cVRCYnF1RjZVTzBLUW1teEZMSDF3VUpLa3g4a3c4aHNFb0ZpZHZ3?=
 =?utf-8?B?cXJXUEJma0NzYUdxTzdnME1DUU9rdWhiUVk0eUlkMTkyZUZzdENlZGJOdFlY?=
 =?utf-8?B?azIwdjVQVS9uZGRpcERnWVo4NzRhK29Kb0p2OGlDZTNQQ3phVVJnK2doWHl0?=
 =?utf-8?B?TXBvT0pJVndBRU8xVzk5UlorNUQwOVg5QmIrakVSVUZMbFh2Q2U2anBsUGI4?=
 =?utf-8?B?ZHhqajZiYlVpQkV6LzlzWm9EdW1FVVhTSDZQM0dIekNqRG1abzlYZE9DT1JI?=
 =?utf-8?B?T2Zpd3k4SjU3eGNtdFFDSFMxMDZ0Y1NKMDdocGV3V1YzMFVKYnBBYTRHV0ta?=
 =?utf-8?B?SmxOV2xjcHc0Tm5sSnpJS2FDNWRwU3Z6cUdOK2FaVVJHakxuNjBwbVFVS2Fj?=
 =?utf-8?B?UU82S0ZWOFkwcGY5SUM5UVdpTWQ0QzAyVE04TWd0b1EzZlhUcGtFVTAwSnVm?=
 =?utf-8?Q?4S3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:15:25.7207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d32b03-d5d6-486f-e6f6-08de38a69587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902



On 09/12/2025 14:25, Andrew Cooper wrote:
> This one comment didn't match the #ifdef symbol, and escaped conversion.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


