Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3800A48280
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898206.1306782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfVr-0007F4-4N; Thu, 27 Feb 2025 15:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898206.1306782; Thu, 27 Feb 2025 15:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfVr-0007DT-0r; Thu, 27 Feb 2025 15:09:23 +0000
Received: by outflank-mailman (input) for mailman id 898206;
 Thu, 27 Feb 2025 15:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMN=VS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnfVo-0007DN-RX
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:09:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2408::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07a458a-f51c-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 16:09:18 +0100 (CET)
Received: from BN9P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::25)
 by BN5PR12MB9488.namprd12.prod.outlook.com (2603:10b6:408:2a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 15:09:12 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::7b) by BN9P223CA0020.outlook.office365.com
 (2603:10b6:408:10b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Thu,
 27 Feb 2025 15:09:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:09:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:09:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:09:09 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 09:09:08 -0600
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
X-Inumbo-ID: d07a458a-f51c-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmcAsEm7Nkzq+IAIvb8Oj++s3jdIvL28aM8h0lmvm0WQfYQ5wRIcD3lmLdzanhQMbYdKKWsmqnScMh+HWZSyFWYL0zLLva71SubZdyW8YLeUepaptshfHGl906mdD2BfYsKJR84ACqTeRgHXWsUHoE1O6mU6OyANQla+uBgkKAuFfgUhKzJeWaG1X/JUmcpyvpVp2qgj5ZNl+YCrwmZxA5/FBhlBE1/sJAueKnhYJ+2qFhY9TK0XB5/MaO5S/+9s5CF/7wPlxv059Iod6RmLnOhWlg/IPMo141ELls+v8DCFjYRWlwJbfRdg7ZzfiX9jSzcxNEiWoe0zDs0GZl8T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LifbGEWq+1iL9mxWHvrXWvMCXOo7lbz6vsZSiJ8SeI=;
 b=qFcXak0FqVVL7CJ7VyUkT3aDx7HHeA4WiPbcPy18u1q9WENXDDD10HpANnIEgmgPmXM+K0b4HWhOg3XT6PQi1Zhm+pNcQ22aRqzOTMOg/ZVAhkbRcEc4mF9gNQwNEfJvo1dHvUGG8eevNCG3lFD4VQ6Yl+8xaBKB1uUMkq2QowWvRa0lpMcqeuLxLN0gUyMjFJSbKKdXtEkY4idSCG297Sd9k/p4JsoYDor1NhvhJobwg3bowTlhvWzjs1LoFnzSnfnLAIjgjh12PCVUK+uEZ4QDlSoKba2e3nZw7D/gildErFec4U9hk3Y0dWLEMrCmQk2LXE+1iBRryRGW8d8P1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LifbGEWq+1iL9mxWHvrXWvMCXOo7lbz6vsZSiJ8SeI=;
 b=pKaIS9Fpr9K6/VZ9siemEQYDl5lv5dc3yXFGjxDAFBE6urtJVLlzbVFkzv7TVRKV47xam/7ggvb0L30zO3mBZXcAFQeuVCPFLvtIQ2IreM2BKVITjuCA4gktASneo9jfuYo3OEsDxH6qEztds6ztZYvKZ6KBJ6ttuxJfbAsWBnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7e2e48b5-27b6-45a5-975a-7616f2c0f2f5@amd.com>
Date: Thu, 27 Feb 2025 09:57:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pciback: Make missing GSI non-fatal
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20250226200134.29759-1-jason.andryuk@amd.com>
 <BL1PR12MB58498AC8C41605DD4E288F4BE7CD2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <BL1PR12MB58498AC8C41605DD4E288F4BE7CD2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|BN5PR12MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 709c2fa1-ed81-4e4b-6bd6-08dd5740b170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE5Od1FvQUFVVVFoRDAzRVN3dFdiMmJFSzBEbjdUQkhWUDVVeXpCRWtEZG00?=
 =?utf-8?B?SjgxRjFQUEoxMjZ0d2c4Y0JBdEhIZjJacFNleWFmMy9JS2hFSWlwUEpBQ0xL?=
 =?utf-8?B?NE80alNxNGVWaFRZSm94Y0IzYmZMQU5uTXZUOHorVDQxQWF4WCsvbkxZNHl6?=
 =?utf-8?B?cVNJVC9zN0EzYnVEWDZWU2taZDFpN3BNa24zdkk1REFxVTY2Zzc4a1pPOERJ?=
 =?utf-8?B?UXFHc3VOUUxuY1RWYmRLaDcvZHJ1V3h2dmFTZFZJMmhZODV2UGlHLzJyVEVW?=
 =?utf-8?B?Rjg1SUhJR3hWekpOZDZJUkZLL240MUNKUTFCOFJMRkw1MmtJUUZrSUdCSHhs?=
 =?utf-8?B?ZVk3dk5VeXVaVE95cVVxbEZkekNpdG9BbmlnNkZRUHQ1SEYzT2kyaVNFOHdS?=
 =?utf-8?B?blhEMGE5elNlUEg4VUpoNWhRbzczbmo4VUE4SlJmaGM2WDhKYllMU0tUdjAz?=
 =?utf-8?B?QU1PcnVlZ2tMZk5xbklQTm9SV1ppc0tGVHo1QWJIdk81ZDFXQm15Y3VkVXha?=
 =?utf-8?B?ZFRaSGUzZnFmQVZlOStlRko4dkZrWXMzVWU2V3A5eWhLYjdOb1FNZC93N01V?=
 =?utf-8?B?dEw2U0ZWbjltWERWYkxXekVQV0ZoRGdNaS9xQkx5MUQ5MTRpS2ZPRzNKMzJV?=
 =?utf-8?B?M1Q0d0VyN0NDanRLVjNyamwyQzJqWHlPcko2YWtuTzhHdDhYQUNOS3d3MlRz?=
 =?utf-8?B?dDJLYTd0QkdUSWN3VmZjVm9HVzltL3VVNTlUaVlQQjN6UlNkY2pDbHBKcEhv?=
 =?utf-8?B?WURGQW5oRUZuOUcvTTN0K2NXYnNJRzlIcVpmR1o5WkhNdmpxMWZucmZuWkVn?=
 =?utf-8?B?UW0zTEtPZS9zb0JlZkQ2THJXR2RsV1o4TVpBRXZ5NGQ3b1VFU2d5L05FTjBE?=
 =?utf-8?B?dHhObnZoYkdseHhhZzd1eDNxYi9VcDlqU2RUUitLZVhOUGwxUVZoMWEwclor?=
 =?utf-8?B?ay9zRFAvaDZKb1hzWEEwS1hEOFY2NlBERGdidW8vbE9MN0hMWXVIZk81bFJS?=
 =?utf-8?B?bEFYa0lleVV0RWJJTFhHM0ZIZUx5YlprQmVyN0NoN0g5VmhkNTFTRE50Q2VW?=
 =?utf-8?B?RnVZeGVwR2Rkak1sTHpwdktLVmdBVWw1MVpKWjFyc1BWSldvUC9OaGpVTnM1?=
 =?utf-8?B?SFZPU0hvY2NIMUpxY2ZjbHhKZzQwL3hJTVdib3JhaWU3MTdMMzR6cWdocG0z?=
 =?utf-8?B?eDBSa1V4Zms4eDR1MTVXWS9kU2hHajBVL0wwd0ZNaUpRU3l2OGUwNFNMYUow?=
 =?utf-8?B?TXZkWDhsSjRKUS9PY2J5d29kcmhpQ3E2SUp1dWQyVFkvSHYxWGV6UWZrTXBn?=
 =?utf-8?B?eTRNbW0zTS9kcFFHdUJUOTROOEJRWEh0d0RnRzM4S1pVY29QU0t4V2EwVzdW?=
 =?utf-8?B?OFFlZkFTN1l0dnNVb2U3cG5XSkpEaklscjdnQW5scGdMTjQ3czZCMG83RTR6?=
 =?utf-8?B?L2tXSk9XVE04clp3SkNqdU81ZzZxSHFXU0Nnd3ZFRGMySWFVUElCdGJMaFhT?=
 =?utf-8?B?L0NkZys3MkhQVU1Db0VRRHl3SWNMRWc5SllKQlV1bW0vUDZLN3ozL0EvdUZu?=
 =?utf-8?B?RXpGOHNTcVU0VXVSWUhLV0tTMWdWVmxHL2NlV1A5Q1lwR2IwNXNxRUF3YmFn?=
 =?utf-8?B?OHFxOERTNmdmbGhaK293VzdPVFIwSXV6d0lqMCtGUFpud0tqSSsybmEzN1BX?=
 =?utf-8?B?bUFWRmJDelBiRTRnQ3FJL3Rrb0JvMVVJSVdHbEVtblIxNnJGLyt5RGU3VGJj?=
 =?utf-8?B?VHh0L1lxZCtmSEJpcVZNRm9qaGJsVy9qQytqMzFLWTl4YnRUMmU5VUtrbXZF?=
 =?utf-8?B?Vy82TlRqU1B2VVJIVk9oYWp1UG01NXNjMUFYcUpmWGQxeDFmM2w5OVdHREcr?=
 =?utf-8?B?TzBYeEM2OFFzVzJPMVhqZjVjOXZvemJZUUxTTDdPUnR4cTFOYmVrUW02U0tp?=
 =?utf-8?B?UGdSNUhhYVFUeGMxRkUzVC83TTVuMC9nTDVnczdjT2syVXZweDlqOE1SQWY4?=
 =?utf-8?Q?3SOtg5RsUM4bh0STPj1lb+norEVwSQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:09:12.2468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 709c2fa1-ed81-4e4b-6bd6-08dd5740b170
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9488

On 2025-02-26 22:36, Chen, Jiqian wrote:
> On 2025/2/27 04:01, Jason Andryuk wrote:
>> @@ -475,14 +478,14 @@ static int pcistub_init_device(struct pcistub_device *psdev)
>>   #ifdef CONFIG_XEN_ACPI
>>   	if (xen_initial_domain() && xen_pvh_domain()) {
>>   		err = xen_acpi_get_gsi_info(dev, &gsi, &trigger, &polarity);
>> -		if (err) {
>> -			dev_err(&dev->dev, "Fail to get gsi info!\n");
>> -			goto config_release;
>> +		if (err && err != -ENOENT) {
>> +			dev_err(&dev->dev, "Failed to get gsi info! %d\n", err);
> I think here needs " goto config_release;" since it is not ENOENT error.

Yes, thank you for catching that.

Regards,
Jason



