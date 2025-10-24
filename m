Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE674C07D41
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 20:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150827.1481823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMyL-00046Y-6f; Fri, 24 Oct 2025 18:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150827.1481823; Fri, 24 Oct 2025 18:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMyL-000459-3q; Fri, 24 Oct 2025 18:57:09 +0000
Received: by outflank-mailman (input) for mailman id 1150827;
 Fri, 24 Oct 2025 18:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOOD=5B=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vCMyK-000451-3G
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 18:57:08 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c10580e-b10b-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 20:57:06 +0200 (CEST)
Received: from MW4PR03CA0281.namprd03.prod.outlook.com (2603:10b6:303:b5::16)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:57:03 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::dd) by MW4PR03CA0281.outlook.office365.com
 (2603:10b6:303:b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Fri,
 24 Oct 2025 18:57:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 18:57:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 11:57:01 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 11:57:01 -0700
Received: from [172.21.152.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 11:57:00 -0700
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
X-Inumbo-ID: 3c10580e-b10b-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re7dF9kcPa+X2uQuxJPrsDzbCq1iyoBZWKRgeKRk+Fgx4huSCzXtTxV9XP6B2d3SeoI8J1SSGvLgTlUTe8wa9WN6hfvK7ZzCBaFWQHOm+vwQ8BzEv1QdwqDcWJ/yx/xfCQnNYCLKN37qD1II/s6ZP7ceQkgTVYKwU0mYy7uOM+L53AgbxZXeeaEHEs97JbGyIridc7hS1iC4/IZnzzB2+mDFRGRRs3bzqsFYOIzY11kevs+HcC1lPQekUd2kf35eSwvHvIGOYIqFFEca8WBrm5WnquCqcpAfX/JnzH86ojL9vZb+1ZKQdpFemR/Dr6AdftkEv9mLT1HjzAgbAF14+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd7tZbzvmqgrEPzDypRJePt6QWP8hgz93pJrXN1EH+o=;
 b=b0BMeuXK0Anms2g4lOP8ucLdqVYQKHLRtcx/1hU632E3DjTewcW+BBR+Jj7s/MrYoxYqpHFXny4wAVZnlSccgBKK2yfkgHXEiXrnRJ76R5bKs0zilDERsxwKjtmDJCoBiNJX13sGzE7VZRUjTdjgSlsDVyb6Sm953fiVHjEJmJwm1sgtma/h510q+Nwl/2B/xr0kVNZsUCTOLqad0cBu1vGR2O9A7NqijMxsIry8vaGCBtGlupDuT5TsdtgIX0+Bh9vVph+ZpsCR/UKgM9DwjT1QKrtB8i5H0r+kjvr4JIhODsOF8ocDaCxrNtKI+wvn7bfHoM01GH9N8aC6UN1vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zd7tZbzvmqgrEPzDypRJePt6QWP8hgz93pJrXN1EH+o=;
 b=iHE4nfj5pmSPXY4vG6G6M7BzhLaPYRN9xutgCKZrplSttHRE9o+nYuj4Ke/9vvDiVhSbKUvqOQdIMM4/ymP9zt0d0a+z2uqWqk6Y6J9yRDocuIo6Fz07BXRnL/YG1zecXy3axk62ZXCQ4l732T6jWejIM65Jte8X6cbPJ2jVjyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <057f4722-114d-47ea-9c99-ad7ee0c6763a@amd.com>
Date: Fri, 24 Oct 2025 14:56:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20251023151903.560947-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251023151903.560947-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: df3a7787-ed31-419e-594b-08de132f1e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVhZcC9sZGZ5ZWJMeWs1c1pJRDEyVllsaWRmQ0RuRWVYMzltbkthUVFubmpw?=
 =?utf-8?B?cEdLWXB2ZFk0RU5jbW9WakoxYmkwQlNYaG02elZPenUzWlZBbXR3bmMxemU4?=
 =?utf-8?B?NW5VNHZsSjdKWkh2N3pHdGRZSjN2cE5oaXJ4K09iRmlOVHBTc3M1Nm1xdzR0?=
 =?utf-8?B?V280TzZ6OGh3QkFxZTR0QTNvRkZvN1E2MkV5Ty9BNkI1ckJvUnJia1pQZGJK?=
 =?utf-8?B?ZU1IVFUrNERTZTltcTluQytac2FMVzFIb1F2RWRxYkZIejd0UkM4YWlOcWli?=
 =?utf-8?B?eXV6RXRQNzE5WE0vM1pUa09QaVFZRVJKNjlUN0NId3libE9Celh4OG1LcGo1?=
 =?utf-8?B?NTk1QmUzVDRrcG9LVHRoaE5qeVFmVlFBMHdjMm5sZGdQVHptUHJFRUFmZGor?=
 =?utf-8?B?SktLVmkrTGtQUll1RE8wWmlHVFNMY3VheHZxNzZGckpYUWtVYnB6RTc2YThO?=
 =?utf-8?B?aElyY1JFK2l0RVVqZTZGYXMwcjRhNG9jQzFmYUhPWnNIRndrTTEzWTZodnRa?=
 =?utf-8?B?TWZVTERyZHJsaHRlY3VLajZ2dlltc2dJUllVc3h4ZHBLdDUwTWlXL1A3bGRQ?=
 =?utf-8?B?YmtJMzE1djRaZm1MWFQyMElPR0ltL1oyTzdXM1V6NGNCOGoxOEV6dEU1ci84?=
 =?utf-8?B?RVludG5vYnkyNzVRclFtT3NjRnprWUFuTUt6WUZicEZhUEJlZHhkRnd6ckJE?=
 =?utf-8?B?S3VQcitKTVQyMTlLZDBNSmltSlN1KzhRTFpsVm53ZE9aaVhjWkp0c1NBVThz?=
 =?utf-8?B?YkdXRTVnLzI4QTV1V3F4YXZJV3N6WExzS010NlRmaXpacFRuL3cyWUQxdVZw?=
 =?utf-8?B?MDAvMjk0QlNzRFJxNlVDOTFqUmpEOWFmMnEyN01sK1BCdi8za0hVc3I5cmJq?=
 =?utf-8?B?eGZIQ003VGM5ZjlFQU5mYitFZzVGTWtQRlozU2JxNnpGaGJNOUQ4UHVjWVZT?=
 =?utf-8?B?dVJQWWlCU0h2MmJLQWNDZEpibWQ2TnFOOVFvanozaHJYcnE3Q1JTeWFLWmJY?=
 =?utf-8?B?bmIrUWtuOEFPL2JBWjdHQTBEdEpwL1pad1pnYlNJZ3pmMXNtOFcwSEZ3SXNW?=
 =?utf-8?B?R0JrcFRMWUlWV1JDSi9tcEZPT2laRERUcW5xVFNhUjFwcjBieHhBaWFhUFVJ?=
 =?utf-8?B?REF6Y0owL2xBWVJLUjM5djF3TDlFM2xGajB3ajhKMjExSmJNWGlIUzNIWkpO?=
 =?utf-8?B?ZU5YUnQxN3Fad1ZEMGJDME1pR0NHMG04UDhCS3grUUg0U2FSVUhCRUM0Sk1u?=
 =?utf-8?B?QTYxcUN1N21xZE5qNWY2K1daTG1KRUE1clN2S1Y4MzM0TWxaSjZEN2dBM28x?=
 =?utf-8?B?cStWVnlMQzBsZVZpUXhxLzI0Q3NOMVBUTXY1UjQzTmgvRGdUbTF6LzIxem04?=
 =?utf-8?B?eFRIWmVDTUdCNXBHUjlrSXFzRGp2YjFkVGVLSEUrNDYrTnhRWExMNGhMcXl0?=
 =?utf-8?B?WEVwZWhjTlNRMGNuUTB5MnVKS0hSaUpnd21QZVhrM09wUitqZ0FYbDZBMlZv?=
 =?utf-8?B?cGFEWkJmcUZqRWZEQXF5anVKWHJacXM5Y0FwbUVoalV4UjgxQTZ3NTVad29y?=
 =?utf-8?B?ZURVRzZEcFBzc3NiNDhXSmZOWW9LV0tUL2wyZURUK3hRbE5YR3NWM2xqaTZT?=
 =?utf-8?B?bS95a2hSaElOSkwrQzE1SURyY0hMbGR4ZGJsU2M5VkNsL1pEM0tUcWhKU1lP?=
 =?utf-8?B?VkVQVkZkMU1Scld5VnZQc0FhSkhrOG12cHBwSDlYVFQ2NGRZVU5wdy9IYVpP?=
 =?utf-8?B?Q1J4ZzQ0dFJIRlo3dit1S010SjFZYlFMbVVaLzR6d3RMU0xFU0ZRTlNOckRm?=
 =?utf-8?B?YUw3ckNZWnVSY0tyVTcvcVNELzhLdUdoNHQ0RXg0N2RzKzZxcy92N2RUcktW?=
 =?utf-8?B?WlovRE1BZlNZZUFQUzc0dWw0dTFOd00wa0JYOXVnVWJWS0ZlTzdMenNFWjRU?=
 =?utf-8?B?dk9JRTZJaWlQSnZkNmFlR05oRTk1ZExMSVhuSDZwR0pqTzBkRmxYT2xZMGlH?=
 =?utf-8?B?N3h4bk80RG9TMkp1aVB0eGtGcXlsbXRQMDN3a0RueG9GNXQ2bmNnWkxOT0hr?=
 =?utf-8?B?clIrQkp3SFltL0xMUS9OTzI3OXdjeTFuUEFORVV3aFdnT1dZb2RybzdEY3kz?=
 =?utf-8?Q?o5QI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:57:02.9200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3a7787-ed31-419e-594b-08de132f1e94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094

On 2025-10-23 11:19, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Functions:
>   hvm_shadow_handle_cd()
>   hvm_set_uc_mode()
>   domain_exit_uc_mode()
> are used only by Intel VMX code, so move them under CONFIG_INTEL_VMX ifdef.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

