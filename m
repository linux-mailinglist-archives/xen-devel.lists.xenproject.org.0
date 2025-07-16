Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EEB07F0C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045753.1415938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8su-0007Ty-VK; Wed, 16 Jul 2025 20:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045753.1415938; Wed, 16 Jul 2025 20:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8su-0007QR-SI; Wed, 16 Jul 2025 20:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1045753;
 Wed, 16 Jul 2025 20:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8st-0007QC-J5
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:37:47 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2408::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9e8db69-6284-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:37:45 +0200 (CEST)
Received: from MN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:52f::28)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 20:37:41 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::3b) by MN0PR03CA0001.outlook.office365.com
 (2603:10b6:208:52f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:37:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 20:37:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:37:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:37:40 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:37:40 -0500
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
X-Inumbo-ID: b9e8db69-6284-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVCbv7diERVHgKif4FribcKzYt7+mEkE9xXz/PR64v3EjYi0R2WeuZZiHrecWEkUH6cai7M7Mjt1cX0Dpu0OzTbp8nHIu8N3fXJTE7AN8vZqlj3j3eSmF9Gvr+H9qHheNMc4AlVQ+bDceGid0VsU5k/WtySO69kVHpSMgRNnIAJ58uikXTygKwzUeI6RrZf2XnIewFB7UinLZdxogUDZK9rU/c7J6nSmBv0aZKKz0DsUKeqFSyPEwPG+jrcoZ8ryYQqjSxtFCPNBo2JlLb88shsQ/XgLqbHYblySMmRb31NrkGRaJPvRxcv4CdoAxBpb0h1KyE8BdwH5PuNhdMqWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nazqJEnjAObPcDqizZgb4x7Sd4Egux0uPRxkGDRny+M=;
 b=GjW/AgGhjLJtyoGigdXyBQtYyqF4FzHgytsvYT9rX/Vv9lt8jvQIrmpfv6KZzz+W5XtfVVOQMhMITnAKsBl6yIwOnG+2AydsLALCpTGdIEq7JOh6iufWqQZHuKIMKb4AWUS8BpaFphcJqstvyn9D+GUxdfwO9jlmBM3WozeIJPBIZlNTcVt32X1CSXiaAyc3LKMVpzK7ROb0SNzMPMdwBoL3Y3OUvqErZE3khL8e/cZkXJZVVKkp5/VqZMAbu2uuSXbJT7nOw2suWiZSlm4Bu8YiLYF6GAVv9ctka5+/mEAgExEFQofdoQEhGdL5W+kDDLWeAiIXL3klCPEqDxIChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nazqJEnjAObPcDqizZgb4x7Sd4Egux0uPRxkGDRny+M=;
 b=dJeZEZB8P7AGtLoemaHNRtvQJOyj2iB26OjQ69P8fu98NF7ZCqe7LtVdDFip5k9M178SzgSxwpeT+Z3JMIHHKh4irPW/GSMmkrMD7vt55K3j1zTyYp/Bc9sYTRvIlS7vIDOi1S0OaR10JDB+TMvmXaaSkUeeTLs00W0GFw8MX2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9c828313-2d40-4c2f-b593-2bf440c27a9c@amd.com>
Date: Wed, 16 Jul 2025 16:30:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] tools/libxenevtchn: add xenevtchn_bind() under
 Mini-OS
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-8-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-8-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 78238372-052c-47a6-6c44-08ddc4a89c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGx1OXR2SEVQeHRsYUVudjJIUXZBbzYxYkp0T3JUZ1psZ1IwbXlXNE5lTzdv?=
 =?utf-8?B?UVdnVWZmMDJWQkFXRldWUHZWSld0NjRLVUtoQkdnNVlEbnEzeFJkbkZmSHls?=
 =?utf-8?B?SnBKRmVYYzRoYWdWQ09Wc3Z2Q3I5ZWcwS1J4NWZWWm1mWTM4elZac0hmd1pX?=
 =?utf-8?B?M2ZTZFVVTitVelBXMXptNFhkVmJocFhzbTNianlKcHpRc1B0NWZ2QXNpR2Q2?=
 =?utf-8?B?NFdSSkhRaStKRmNYYWQxblRSSmdtSzBLVENSUnppM1BBTENsbDlOM2JCREhR?=
 =?utf-8?B?elV4UXJPVitSdGcvcVlkcUptSi9WRDYxNjZRNDQ2WkZMbW0xOXMwdEdoUGJn?=
 =?utf-8?B?MXUwSC9VK3RvRi9iNlpLY0JwcFgwVTE5ZmlKSlBJOWZpMnFKVzl5SFhQTVdi?=
 =?utf-8?B?VFh2cFdjaHI3OW1UKzFUam8yVWxWWE83Ykx5V0l1UEdGay9PcDlwY2lpVTZ0?=
 =?utf-8?B?QVh6ckg1bXlPVWZBM0FDUjE4NU84dStFajZ2N3o5dHFiUTJGcnhPSU5EbXRh?=
 =?utf-8?B?QUo1TEVSNXJCZk8vdHhIekJ3YktqSG53WXVmbmgzRHJGVGl0dnlPdlhIUU9i?=
 =?utf-8?B?b2Frakc5aU9ETmlSN3NsVHJiV3RhZkJnMTc1bE9pM0xtUnZySTBNVlJsRkVB?=
 =?utf-8?B?MVJDSVpqOEhIaFVoQXIyMDRhSFRPWGRHbXBVaWc3TUs4RGpRMUltaVJOU0ZE?=
 =?utf-8?B?TStVM2hDY2JOK1J0ZlJyekdPb0NTOXNyc0FlaWZsRWUyMTVRTHdPdDkzNFRt?=
 =?utf-8?B?NFpTcWpyUnM3eS9KRGxCektFMU5MT3gyK3VGa2t1SzZOVGx3MXA1bEw5dkM5?=
 =?utf-8?B?VTJXMjBta3hLa1AwbHRBYnBmN2dDWUlhL1F0SDNrV0twUzU2M0xOa1VnTTNU?=
 =?utf-8?B?L2ZMTHM5WWxWVmluWXFyTEhSVkU4azBjRWNVSDJTSVNNSWpQRzkxUy94aEMy?=
 =?utf-8?B?enlWMWYvU0tYNTY4cGVLeW1kSzZmR1lMUUhIYlFKNmo5ODRpdFViTE1QTWhl?=
 =?utf-8?B?NEtGTllnNC9ka2ovdXdEZUFjK0JoNUwrYUs5Y2FXUVNSRjBTQjNUNnBQQWt0?=
 =?utf-8?B?Rms0VkVGSXJxTE8xcVFBV0IvSWVqTzkzNnBFUlZVVzRFYmNhdHdCS2NJc1FU?=
 =?utf-8?B?OHlidlpJdU1OWENIcUpOcDI4SkhjbkJ2aTM3WlZtN00xRXJBTXF5NFF6NStp?=
 =?utf-8?B?eG55dDdnZlJVWHRZdnR5WVJHSFI2OHVweTFWLzBOc0VydmdzQU5zRHRPbWlP?=
 =?utf-8?B?Q1FHL21OY1k5My9La0oyMTZzRmh5bzdMNlYrUGEyU2Q1VG9ROERsUUtieGR5?=
 =?utf-8?B?ckV2Vzkzbmo3SXUrOHVLMG1QTWNDNXNXVWQ5cGdBT1BtZ2JTTzRIYTZQS0xn?=
 =?utf-8?B?UHZOR21mK3pTbUE0WGhsKzVMTTNraDBuM01EQVpmUUZwOVZXU0lXNXNpMk9m?=
 =?utf-8?B?a1RDbSt3TUUrWXlpcGFBNmUyNklnOFFZLzcvaHF0M1hJcTZtYjRPa2JtRStV?=
 =?utf-8?B?b3RMbHN1bWViRUNnaWJHK0dIRXBpSG41VGxIK0MzaWhjTUVzdXowd1NsMTBI?=
 =?utf-8?B?b2RmMy9vZFM1bzd3V0NFd2hzL3BwczFkSHRCdmdrVGc5RTlOZlFDTlhQMm83?=
 =?utf-8?B?d0gydnlYaFBzeW1tbDNtczMvNG1mY3RUallXNTg2b2ZvOUtNSG5FK2Y2UUhM?=
 =?utf-8?B?SnhxRXVaVHZSRElIdHdKSUZWWjdjcWJtQ3JmMXpSTW5ROTNFK2lmSnRqRWQv?=
 =?utf-8?B?Q0FGZnBSMWxja3lHbUFRSXFWaXhCY1MrS2cvTURKWnNoOGlCYUViMXZSWDBS?=
 =?utf-8?B?TDBtZ0tYVVliems2Q3hDV3pxNXlueG1meVREQzBhdVdBViszaVJrU0lrOW9D?=
 =?utf-8?B?dkRjOEd1ckFNYTBraWptZXFsNnRMcFhTcWJ1cExCZTcvVTlyaUYyVEpPQ0lX?=
 =?utf-8?B?d0pCcTRsbDhaVldWZjhjaUkvNThlT2Z1dXBXdnZUcm9kaXZhb3hYTmJNUSt0?=
 =?utf-8?B?WHI5NWViSllydXpITDRxYU1Ta2R5RVpNenNEOU4rd3V2RzY2bkl2Q1kyYUxr?=
 =?utf-8?Q?7Q/e8/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:37:41.1251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78238372-052c-47a6-6c44-08ddc4a89c43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

On 2025-07-02 04:13, Juergen Gross wrote:
> In order to reactivate an event channel after kexec() of Mini-OS,
> libxenevtchn needs to allocate the port data for the event channel
> and set the handler again. Add a new interface xenevtchn_bind()
> for that purpose, available under Mini-OS only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

