Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7AB34E7F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 23:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093702.1449132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqfA0-0003Yy-Q1; Mon, 25 Aug 2025 21:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093702.1449132; Mon, 25 Aug 2025 21:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqfA0-0003Wg-NR; Mon, 25 Aug 2025 21:55:28 +0000
Received: by outflank-mailman (input) for mailman id 1093702;
 Mon, 25 Aug 2025 21:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPTi=3F=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uqf9z-0003Wa-F1
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 21:55:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b931542-81fe-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 23:55:11 +0200 (CEST)
Received: from SJ0PR05CA0168.namprd05.prod.outlook.com (2603:10b6:a03:339::23)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 21:55:06 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::1c) by SJ0PR05CA0168.outlook.office365.com
 (2603:10b6:a03:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via Frontend Transport; Mon,
 25 Aug 2025 21:55:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 25 Aug 2025 21:55:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 16:55:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 16:55:01 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 16:55:01 -0500
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
X-Inumbo-ID: 2b931542-81fe-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub0vCrWvNc3SRxVnsjWy06trFMMJO/Efp09O8SThDAVtOwGzKJsvsHix5nHG0ZzikkflClYKZMgShbw5c+UmLXp3SmljhPkCmPuQptvV7408c/8L1cw795gyYee4ylKEKi1bEiWAcKFKqfQUPGwHZKIhlahUY/YhukPH6vvT98vqj8aagjQLPtg4V2cmoTzQAUOobxi6NHv7Eq5BaZIcKg1KM43JSHkF1S/h3eIV7wUnPPiVXVpbCWTuRiDBZhle/qQhYTsY4ml0X9J3RIO78ZbgmQhweUGXKrXVgPk7XvKWiHPaOKZJ1Gq16+mOcoCfikwnmSEp//8XZpMbjBSIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31nwGKdMDfhUHI+0PF46wLh7YDo0K9phaqr4p9Stla8=;
 b=ZGjAxzSA0iXwR5D3g2NrrZmDiGDDUefslY3mnG2THopFImvrUoHujaG7onYgbZzGDAwd4G3v4ivId/HHDCNtCrjsipBmgJxU+aZCnF6vHlAAGOXJNWr0SJ0YJwCTsDUkBsHzDdk+lqRJ5kw8L0BIEq7hbzu7WbEMdO3l1j+hWoTLvjk1I9qWE/2Tnu2ju+AS1+M46YXwMJJdsOcOMGEtkQfZ75+HvzXKiXZtUywMM8B+lKPUr+Iix8fRvYWRAZvLioFge7Ia1+v8Y5u1tx36hDg1OMBxo9OXHJIZ6GefZkETdwBQe7bC3xToVq1poAFdst1lOsrP9dHW1ST8vgpPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31nwGKdMDfhUHI+0PF46wLh7YDo0K9phaqr4p9Stla8=;
 b=rTJ9PUB9VeXYyXsD5ppF4NWQazHeOE8WYIwAVoV5ookD0lrvzEklHa01grl1VH8TKe3JLR56sXZC6sjFAhbgBodk78Ub2i2lxWftnkx7GbofzTSqUPswaxbPXQ87NyTHR8RoCEhDfwKDLfIzNjlCB+lwb2CIqgbgM2GMAWyMIyw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f2ab977b-3378-4e93-9eec-e59fb640b85a@amd.com>
Date: Mon, 25 Aug 2025 17:30:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, "committers@xenproject.org"
	<committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdb7b71-cf5e-473a-a35f-08dde4220dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clZxZElmYmZhQ2hSK0tUVjVMUnRoSGtSV1VQOXZNbnpVVUhuRmMrSVdxZDYx?=
 =?utf-8?B?TXg5OVZxWVpYNU1qN0tTTGQxM25BaWZkMW96V1lWTTR2eHg3eHJVSFpBcWZX?=
 =?utf-8?B?OUp3TzRyU3JpdzdPVklLb24rS1FjazI0MDR2RUNxcHc4d3I0U2RmQ0pUQW5a?=
 =?utf-8?B?dzFVWjFvQ3VzNk5DSHRQWkxNWmlvMTRUVDRZTHFNb1dTaWRlNjAyOWNzRUxB?=
 =?utf-8?B?Tk1YK0hnMzJwWDBkRzJOaktsbDZHbzEwSG5Ic2UvWGZmTWcrVTFpN0diUGNk?=
 =?utf-8?B?bk16TE9jNWxrWG1jMStKbFhmdGtPNUVaSEM4NnQrckxlaE9DYWFwNXhCTVpF?=
 =?utf-8?B?dWxyZThJalN4eTRRRTNBd0tIcXNUYkVCdjhiUVpJOVJnUVJLV1loZkxScDNw?=
 =?utf-8?B?ekVCUmdJVFlialMwVjZSN2ZhKzB0K2dSck54cW8vSDhJaXZkL20xS0NlczlH?=
 =?utf-8?B?TGN6MzJuaGFoRVczY2NLakV6c0JPeWxVV1ZNekRLVFBHam4zZ1lyQ3V3eHFx?=
 =?utf-8?B?QVRaYVpZeS9aSWVXdjFiWXQ3YllSSS9LMG5EeSszSE52SzJoY2RHNUw0bGZm?=
 =?utf-8?B?KzNVdWlEN2gzdjg1YjQ2UUswYWpRQ0E1azd6NWNpRkk3bndWQzJJS1hmRmxw?=
 =?utf-8?B?bkJidW5PNEF1YWczdnNRVHcrOHdGdVhRRlN2Uy9lb2NnQjhJNHZoaDROWjEy?=
 =?utf-8?B?aFh4a1J5eUpMZW1PYUV5L0Q1NWJrS1lIV0Z5T3FSNXFRMzVtMmxMdTh6VVps?=
 =?utf-8?B?bW9RbE1KVXhydzJQQllTeVlqSCtDYXYxU3ZGM2ZtWWFvYkdvaWEvRU1TRDFO?=
 =?utf-8?B?UXRJMG9hcnJmb0ppR3VVa3h2VEg3ZEdyMXU3WEZJQmdvRFhGcWFLc0VwWDVo?=
 =?utf-8?B?MWRRSWU1dVNTdUwyTzBUeDFaWE1vQXowT0h3anJxaWFiUnlBSVNiNG9PTTBH?=
 =?utf-8?B?bWVHSVQraXpocWx5dkFFU3I3ZHRQTFJOcXhoNGsvVkE3M2pUUlQ0US8xRTJL?=
 =?utf-8?B?TEtuR3hOdEtYSFJibndzV2tYdWI4VkpNemMrZktUazZRYlRqeG5VdEZlejNm?=
 =?utf-8?B?enFENEw1YU9LNXhVaVRoSURVS01RU2VqYmR0ZEY2MEJxaUkyU2ZJQ0hOcFNh?=
 =?utf-8?B?Q3ZhSWd2MHZBYXlzendsY1lURFhjMTlBc3ZaallxZ3hucDFRc1BrNjFCV3VP?=
 =?utf-8?B?cnRYOVJqUnU4WERyd2JsVEJlMklDUmxuV1NwdCtQTERNcVNQVkV0T3RpVEZV?=
 =?utf-8?B?YTFZcW9BNTVGekY5VElBRjhxWTRaOXUzZUxqRnErdXRia29KMGNyQ2d1UTFp?=
 =?utf-8?B?ckF3MVdXdHIxSlBpY2RXVGZibFpwemg5VWxyekwydFR3SWF2eUpvZDJRNWVr?=
 =?utf-8?B?dHRFMzFaQnVFT09BTWFLOTVwWFcrdHhhSXJJM2hNY2VVVHFsZlhLNEZYVkEz?=
 =?utf-8?B?V0ZPMktidit6bzdMNnlKa2w2OEplVkFmZEhGc2RNOFI2d25xUU5tQzZ5RVN1?=
 =?utf-8?B?dHZoMWtSUVduWDducWsxZkdPaGRHSExrSGNhK1UvMm5naVlaYmx3K3dwU0lX?=
 =?utf-8?B?MFcwdEVSUVJSZXdFWGRhWTlQMkRxK1BVeUh6bUxwaFN0OWVOMTVrQkJmdmRW?=
 =?utf-8?B?OUt0dDRKaENEWjBjM2JCdmZKUEpLSTFSQVhvZEplSTZ6QkVXWU9KQlRFUXg0?=
 =?utf-8?B?NzdhMjFnQ09sMlM2Mjh0ZVBIeWdka2VsVHp2V0VGUFNSZWNqOGFkcnV0RTJC?=
 =?utf-8?B?NDJ4WE5QcDczL2ZycWtNZDdtNFMrakFNcjVFelJvWGZnWENYVER2MllYYVYv?=
 =?utf-8?B?S2xZd3plODBBZXNDUkZ1bzMrVUFSaHNZd0JwdFViNUtTWmhlZ3d6MEozSW5F?=
 =?utf-8?B?VnZkSVB6Qk9RS0xIRGczZU9peGEvbnB2aFV2dlZxZnkrQXA0NFJwTGp2eER0?=
 =?utf-8?B?ZzA2SGNwdE5MWjZaaVlDNnorK1NZV002NDRVTzZyVUwyN2Jady95OTFOSXZw?=
 =?utf-8?B?N1cxL3owMTdrNkg1dWZJWG5MbnpwdmJFUkhmdGNobUhQdEF1MnNueWF0UGFy?=
 =?utf-8?B?OFZYSFNLNTMrT1p0TXFxbjRPWjRVd2RzYVpFUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:55:06.4627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdb7b71-cf5e-473a-a35f-08dde4220dad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471

On 2025-08-25 11:50, Oleksii Kurochko wrote:
> Hello community,
> 
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
> 
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

Hi Oleksii,

I'd like to get 
https://lore.kernel.org/xen-devel/20250822213946.245307-1-jason.andryuk@amd.com/T/#t 
in if possible.

It's v2, and there were 3 RFC postings before the v1 as well.

Thanks,
Jason

