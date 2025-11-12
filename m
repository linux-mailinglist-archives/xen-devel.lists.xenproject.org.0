Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790C3C50332
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 02:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159447.1487773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIzaB-0005F3-2l; Wed, 12 Nov 2025 01:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159447.1487773; Wed, 12 Nov 2025 01:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIzaA-0005Cm-VE; Wed, 12 Nov 2025 01:23:34 +0000
Received: by outflank-mailman (input) for mailman id 1159447;
 Wed, 12 Nov 2025 01:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P68F=5U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vIza9-0005Cc-Td
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 01:23:33 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32538c41-bf66-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 02:23:31 +0100 (CET)
Received: from SA0PR11CA0085.namprd11.prod.outlook.com (2603:10b6:806:d2::30)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 01:23:24 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:d2:cafe::b6) by SA0PR11CA0085.outlook.office365.com
 (2603:10b6:806:d2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 01:23:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 01:23:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 17:23:23 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 17:23:23 -0800
Received: from [172.28.100.6] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 11 Nov 2025 17:23:22 -0800
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
X-Inumbo-ID: 32538c41-bf66-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUIGPEUdedSAPuSj5VMD1SDXD/+y3Z2HH1YuxbM9K1nAASHhJZf8P0Ewm/7LQ72yY7kUEywN3GL4GE8IyIeZ+J91wMDoeGVzxvVmeKcddOKBvKNrZ8cXKwO3uIwcQI8DAzJWjBKOFVV0eQK4etDyMfpVSoGkbUQ6votmeeg3OBvKsoDj5RtdNcg0hQeM40y7WQzns3FdVzB2Yp6ZlihmrSzFH630T+t3iGA340xN9dHne4VAP3DtjA0NmM7KEeChzfALyVcPTUh23Lqrrifxdl4v2rijkZOKo8ZD3SoCbEXd+CRqBWnq8/pg+z2XZewUfoCdnsXDYlnhKRd1TG7cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8x/9tXkN/lAbw5bYMeeVxIhTOlPZhdFSyUxiHE0hPQ=;
 b=idGZkRZp5W9EDEd4yW0FP4imYwhxWTykJQI6OAC3at4iCRQ2Zup/p0JQ0idk5vlJliuHMaQkb5rSstfNzKsblMSKWwPJUYxH51tDm1LJ87giNOiMov77AsqmONOPTC57vJNz8lAJjD+aXVF4KHhrL9fd+5lGKTZcT/J4n/RVOQj5lVO37R4QGZbyQUV0iibUQ8U7Q9+zqEGj6V2DCwdo3dZVCD8rIC53juBIGlfV6P+EPE8pxPO4uSPR+dZYhS8rWnAHP/FMxWwKOlm+rnT9UXcLnkF6FlrFNEf7gJYPHoYGRElAl39s2LriwpWN3dmNhCeBM+2BvlFEKskmdOgppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8x/9tXkN/lAbw5bYMeeVxIhTOlPZhdFSyUxiHE0hPQ=;
 b=1mhHacQvJoihtxNO2vvO4sxKo0FfRUl6WNpIrdZC1a5FqK1gKDAya+SAaEydOT+OOATzuI98ZdzvflaBdTYJ0zOgNpC75vMc86zNynUJVdZIdY31kmS8yaUJ+hV5ecMOngCPJdHfabME1l5TN1+SkfbBgNpdofuu23HTyMA+VqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a46ba647-1b40-450a-8732-77db1be03f44@amd.com>
Date: Tue, 11 Nov 2025 20:23:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/5] x86: hvm: compat: introduce
 vcpu_is_hcall_compat() helper
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-3-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251111175413.3540690-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfb4d15-eb50-4a1c-df84-08de218a1312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGZGQ1I3WGNYdUJvbHBwM0dLZHRzelI5WWQwM0h1OG5LNEFqdHo2UlIrY1Rv?=
 =?utf-8?B?V0FLUlVmbE9aOUpsdkpkbzZPdVlMVDgvcWFxRWdyZW1zK2VLV2xEekZ5aEcv?=
 =?utf-8?B?U2xtcXpSZTBCc21WOW1RQUo2R3UzY3ZGc09TelI4M1ZoYjBSL3NjYjdES0hk?=
 =?utf-8?B?SjkzU25nbXhLclpaUG4xdm95UWRJTk4wdzlnUlhtWGJTTzcxSmFPbStQM0Mr?=
 =?utf-8?B?SEI4dlVoRHF2REFCeXJiQUg1ckxsNjl6Nm4yNWZ2dVVzVWpBaW40UFp0c2Iy?=
 =?utf-8?B?RFBscDBNS2YvdzJoaTlnMERpSGUzOFhVckdEektiYkRncVpiOEQ1YWRpdEVK?=
 =?utf-8?B?VTNMaFpxbk9HR1h2TUhZTDZCZWtucGp0VTF3OERUeC8xbjRVdlliT0I4VzNY?=
 =?utf-8?B?Ync1cFJ5ZE1TaWVXTnJwOHVOTW9oNFhSaXhBQ2dYUU80RDF4YVFJVk9INldk?=
 =?utf-8?B?TGNSMDFRWTluR2Y2WkpWRTU1dVhlWjhiNThOaDVrbU9GV0lrU2dsSFJmbkhh?=
 =?utf-8?B?cnphTElwY0lOcGRNZ0xlNS9BdDRpT3JJVG9sUUgyalNZNmN5TTlaaWN6aU9q?=
 =?utf-8?B?WGlQVkh5M253L0cyZTFhRFU3UzRoNUZ4M2lGOVFDODd5eitrTkZ3UXpqL2dP?=
 =?utf-8?B?cW56ZFl5dTNhbDJQZ3grbW1GV2ZYY09NWDl6YnJrcnkxSkpDUU9VUnZ0dlpH?=
 =?utf-8?B?NXZwUTQ3VDdjdkxzNFlidGQ0c3huWVFYRkNOUUl4eHM0ZUlkc3ZKOVRrUStW?=
 =?utf-8?B?eHpKcWo1UDdVQXE0UzFVM2MzOGtQN2k2NVRBSFlidzVjZnZPbGwrZ2V1Mjhm?=
 =?utf-8?B?azlqSENxK2p4S0dEREt1c2NnZnB0MHN3ZXdkMmdLcndpV2R4eEU1MXgwbnp2?=
 =?utf-8?B?cjdXVlRiM0c2Mi9NNzRiVGlXeGVkWmowQ0hzVG11WFlHUlBaNXhkTGdQNUtY?=
 =?utf-8?B?YzRGRWRha2NzbUQ1N2NIK2ZLb29BQzRmdHlnWUhzd0hHUDVaTHZ5QlRmN0FB?=
 =?utf-8?B?Y2VJRzg4T0l5eWNzdGFadmtpMnVwQ1B0M1BYTW9VdVdvZzB3OXRwOEVZZk1i?=
 =?utf-8?B?WXhNdldzN2wrN25WcTlyb29BemUxKzBFdWhIb0h4YW95TWF4QitTVmJYcCtY?=
 =?utf-8?B?eWs4T3ZFR1ArUkFOcTdYVjNtVzBOMERXYlJ2TFlQM0dTanhxT1dOblZocDM0?=
 =?utf-8?B?K1h1c3JHaDFWVS9CNUs2M1IzMEZkS2JZYzZicC9lU0NCdDRGemRrWDVaMWNs?=
 =?utf-8?B?eHc0WEdiQ0xqV25ZZmZ6UjgvREhScnprVUZ2N3k1R3pjSUw1NFlEalNKcTMy?=
 =?utf-8?B?VlBaajlJWlZlai9DSlJyUjc2SzlUaDZnelNLK3F5V2VSTnJGWVUvek5YeEs5?=
 =?utf-8?B?TFV1N1R1K1A0d2RCazA1UTJzNW1XNGZnYjV0N3JlTDVGVXlKaHo0bFlPRVlG?=
 =?utf-8?B?b1ZPWFlPaWhEUzB6RWIrMFVYSFRBVGl0OGtnVWZLRmQ3cW1XaHU5aG9yc29E?=
 =?utf-8?B?Q2xQMU5GYXdhU3BtbXRkUm5xeUphakNVa2d6c25KUCtQZkE0eGZ4SzBoYmdx?=
 =?utf-8?B?QVUwdDd5V2o5NVdIbWVvcy9kWjJxVEFWRytyemxDYVNCV1E5TVpZSlZtWWhr?=
 =?utf-8?B?WHl1UnowN0x2RnhNNmNBKzNvTm1pZmwxQjdvUnZWNDJmQllPZzZCU01XeFA4?=
 =?utf-8?B?bllrZ1YyaUhPWVZKeDc3QWU2c3FiaitvSkdQalpZQVEyQ2tiS3ZqVFpyb2k4?=
 =?utf-8?B?L0xWbXptc0xsL1hGL3NwWVA5TXl5M1VpSWgwMDM2YXgxdFNDT1ZIeUg3clZB?=
 =?utf-8?B?cHdDS0o3RUpLRG1uNXpFZDBhV2R5YmZOb1NwNVRGR1dEZS9PdTZlYlF5UkRz?=
 =?utf-8?B?SUx6N1lPVUo5aXhxbUx3M0V5RlBsNzFLQjVWMm9CS3NoK0JOajJ3STFoZWx5?=
 =?utf-8?B?QnRTVndTaFNXbDNvQlJ5UTRvRFdqdFNoYTBndVZOTnQxMkxuODVQVndVdmJx?=
 =?utf-8?B?OFF5NjBPcEg2NjhwS01QZDRIMUpUWFNLaUNNYlBDZUNmYXFsalN4MmZlSFVt?=
 =?utf-8?B?cklWMzFLenJHckZ5ZXIvb2ZDM0crWi96eHFxNnU3RGpSMW8yTjF2ME5jQVFZ?=
 =?utf-8?Q?FTDA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 01:23:24.1771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfb4d15-eb50-4a1c-df84-08de218a1312
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405

On 2025-11-11 12:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Introduce vcpu_is_hcall_compat() helper and use it instead of direct access
> to struct vcpu->hcall_compat field in preparation for making HVM COMPAT
> code optional.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

