Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65202A921CC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958154.1351104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RKn-0005em-7Y; Thu, 17 Apr 2025 15:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958154.1351104; Thu, 17 Apr 2025 15:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RKn-0005cD-3r; Thu, 17 Apr 2025 15:39:25 +0000
Received: by outflank-mailman (input) for mailman id 958154;
 Thu, 17 Apr 2025 15:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9F7A=XD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5RKl-0005EV-Up
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:39:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21557bd4-1ba2-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:39:21 +0200 (CEST)
Received: from MN2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:208:a8::16)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 15:39:17 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::f7) by MN2PR12CA0003.outlook.office365.com
 (2603:10b6:208:a8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 15:39:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 15:39:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 10:39:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 10:39:14 -0500
Received: from [172.21.212.118] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Apr 2025 10:39:13 -0500
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
X-Inumbo-ID: 21557bd4-1ba2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni+6yKYdelh8EFJ9KCJPwqMTjFc2nNNsU1GxPYqaV/SaI0wsDv2Ji05kgv+y9IsYrJ0XFCmzNBbpA1xIF7wFfSRCLE1XZSsImjtANFv3BmpuMo+oryvt96SGEgLgL/9Du30xYEbkyzEyGkwUP7Pfg79Ee3HZSnAWHBjUH75M+jlM8SoYAo2yglnXYDINS0Psm14sfxADuTS9hIm3fu7js4aqihKj3eVC5jSf3+xQzbicaq/8bpYz0saCZqIb/vA2JqcSFje+tThFmvtB5Ctn6wLiS8dVXg+WL7Gj+z0M6YSf3kRTG5R3ey5WpGn5RTuveDh5MScDZSaAD00NYv0JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRrsTGlM8jDk5NfX+04uV6Dn1dCgfBpnKsjcSs9c7pg=;
 b=DOj5sCjJUb1UZ8eYWtWzWLzfYJwprJS1GHQgvamX4QahDDPOohrp2PgkkELDyM86E1FZbOt43YV0xVTuN9pr5S9Bkj6vuFwKYuYXGhpZvy7ENlBMnaUND7IVsdCd+THGsKsZTI/TAItOic4qvKV866NfN08pcln8taKyLm9kDWdQucNthHBh7ZAZHDYHm0RwdFGeLDXhPKBV4+TK0YRu70z92Go5T0M2I7HReFtMI+Hu4brDymiT+GDIZ3zQuLfZvzpPvk0ZYtMS6YTjQqd8iGF1lsdq8dix61OZIWwQAgu6LD6inJ3BTW/BVMfoabRvdu0sJjN2aMhHHZgp5/llGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRrsTGlM8jDk5NfX+04uV6Dn1dCgfBpnKsjcSs9c7pg=;
 b=XIUzDILhlSwYc7bYXMssZyVf3FsOQB0Ym4fXkqWVUE6VxgqTOF7S5gN9N1QpmFEEc9fYIyDZjjx19HpO6dIaCpGhlXcZtRyCHM5l7BwjzwqFs6hAVajg7fhQQVqE/BHWFQ8y/f8Oj6h2zE6dCOg/iMJLTm3qhR4GYZttCtmLMyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eeea980f-3fed-4a59-9843-87798fc78606@amd.com>
Date: Thu, 17 Apr 2025 11:39:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] kconfig: introduce domain builder config options
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-3-agarciav@amd.com>
 <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 983dbe88-4ecb-4376-c6a8-08dd7dc60300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0U0THhHSW4vQTV2M05oNGE1a2NWbVg5Nm1FdVRyUHJBWUFTcWJkaEVybmk4?=
 =?utf-8?B?ZCtIZXU3aUUwckU5bjdOMW5GN2NFYlN5amwwVlRDVWQrekZJVHRXckRybDR6?=
 =?utf-8?B?M01mNHF2ZElraEZGMlZaRFlzV1ZybmFnRS9kNWh2TWQvbEtHTE8xWkhRaXUw?=
 =?utf-8?B?c1dlbWt4ZTNBaDBxVXpjVnNMU3BSS1hEVWZtNU5lWW81dHBkK0pRL0dHeWQr?=
 =?utf-8?B?RkFmTUcyNkRZOEpJY3BOMTBUZWhnQWY1bkRRL3hSYlViUW1hNnlmMDVDbGJC?=
 =?utf-8?B?OC9nZjIyTURhVml0SGlqejRZN2dWZldzYXV1bmdYUWN5ZTVUMVc5aGd3K2cr?=
 =?utf-8?B?SC9Xcm8yMnRhNy9WMmwxVGZZY2Q4WWJFYnJUTHZydjdpeVpKKzkydm9ZQmhN?=
 =?utf-8?B?VEoxd0tIYUNKUEJtUkpLQkU5U1JvUDNBTFE1WXNEZlhhbDhUVG1BRFRNQ0lS?=
 =?utf-8?B?Q1dNSzVjM0NrQ2lkRmtJZ1RqbFJ1ZmRIOTJKdytjRlZZU3N1aGR0OHNxeHFV?=
 =?utf-8?B?S3NZN0k5L0ZNSTNsc0NCMVAvR0cxalVqZzJ3eGljR1dRd3E3YVJkOElIWjYy?=
 =?utf-8?B?WUFUUTE3WTlmMXNmUVVJaEhGMG1ER0lEUCs1SndrNDJ1QURMbmswanNvbG9z?=
 =?utf-8?B?WE04dEF2cG1pZ0F1YlNZeWFlbjlCMm9WQkZZV1ZSdmZhamQvK2dJTVdBK0pH?=
 =?utf-8?B?dGZDTkRCMFl3anZoNkR6Q216UUtHdjdzcWcwVSswUjE4d0p4Y2FpN0hiNVgr?=
 =?utf-8?B?a3g1Tkk3UXJwSGg0QWtNMUliMjNqK1dsTUtYZjk0enBCdlE1Q0NyTHZac21T?=
 =?utf-8?B?OGNRRTM1RlMra3poZzE2MzJCSXNNK01LWUdUTHhYRm11dnZzZzFSb3hnVkZG?=
 =?utf-8?B?cEp4Z3owNGl5Yy9hNjZuWGlxV2dTZ29MR0lKdWJ2bHRWNnZIYWxwTitVYysr?=
 =?utf-8?B?dkJQK2lYZS96QTRZWFRFL0FnWmRSN1Q0TFRJV3FRZnpNbG1MMlA0cDB3OERm?=
 =?utf-8?B?QUxCUGFnR3Y2TWt2Y3AyOGlWdTdGcWhxSmZqMC9vMFFGVG4vQ2EySmhBRURD?=
 =?utf-8?B?Q3lwZUlqTVRCNHNLaGNVQm8vczFIbHdNQ0VOL2tEd1dHMzBvMDNSUnBJMHM4?=
 =?utf-8?B?QWsxUWwrRmFPZHdmWFVZekZyK25qeVArc1o3SHNIRC9BVzN6bGRVUG5PbFlT?=
 =?utf-8?B?VmdxY0lsUzVtUDhPZll4Z3o1Yi9hZk9RVytBK01pNzRENHAxRk1Jb3A3RWxU?=
 =?utf-8?B?V0phNzBieVJqTEk3RGw0b01wRkJnSEtIQ0djRzFUWSt1RUZuRDhiLzVSUHh6?=
 =?utf-8?B?NVBPSkpyV3ltWTQza2g2b3ZOUXV2Q3l6czZiWFBtK29XS3hHTGtmdzJybDlV?=
 =?utf-8?B?NE5KbDRZKzh6NXBMMm9UanQ5SS84eE1nb3pROXprSWZoRjh3eThyZ25zTkh5?=
 =?utf-8?B?KzNJaXVtT09iOTNTMlVsK0hWUFBMejB5cUdoVGJZVjZwUTN3NzBkNTJGMmdT?=
 =?utf-8?B?TXZDZVgzOWJmZStWT0U3ZkcyK1NoWFROeC9iU1FQY3Urdnl5bmVKNjhIVGNL?=
 =?utf-8?B?TFNFQ3hEYms2U3VBMEIycFFrdnlvUnNNcmFPMUJSZ3dMZDR5YnZnaDk2RG9M?=
 =?utf-8?B?VUlUNnJ0Wk5YOENHc0g0ZDZydVltMzczWWNOTEg3aXdzTmozNktqMmNCcUlz?=
 =?utf-8?B?OUZRSzhMM3hYcXUxTnQzN2lscVVocElnZDVSZnRnZHJxSG1pR2cvUCswaXVr?=
 =?utf-8?B?bndTWHVMSUxubjJ5VGQ0cmNSQWk3UkJDaUV0aUgwUW9zMmF6MHV5T0RxTGdo?=
 =?utf-8?B?TWRPZ0d0TVJiQ3l4U0FsSUtCQi9aVldFR3hBZ3llbFNxY2E0a2tjK0NZdmZ0?=
 =?utf-8?B?S2FQVm5USDV2ZDdyL1Ftdzd4Kzd6b0ZWVmlvZFNCajFtTjRxTld3WStuZHRw?=
 =?utf-8?B?QXZxUGdqVnNPdFlYZWpLWktSSWZackV1TXRhODJyRTNUTGV4V09FNWpFTktJ?=
 =?utf-8?B?dDNFdGUySmNDVFZnaDZ2Rk9yZjRBS1NneVBWbWZkbVRXME8zNGRpSnF5OFY0?=
 =?utf-8?Q?hwffPB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:39:16.3422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 983dbe88-4ecb-4376-c6a8-08dd7dc60300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056

On 2025-04-17 11:00, Jan Beulich wrote:
> On 17.04.2025 14:48, Alejandro Vallejo wrote:
>> --- /dev/null
>> +++ b/xen/common/domain-builder/Kconfig

>> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
>> +	select LIBFDT
>> +	help
>> +	  Xen has a built-in mechanisms to automatically construct domains
>> +	  (like dom0) during the boot phase. The domain builder is an enhanced
>> +	  form of that mechanism to enable constructing predefined domains
>> +	  described on a flattened device tree.
> 
> I'm not a native speaker, but (perhaps because of that) "on" here reads
> odd. More logical to me would be "by" or "via".

Yes, "by" is better.

The description is a little backwards - it should state what it is 
first.  Maybe:

Support for constructing predefined domains described by a flattened 
device tree.  This allows constructing multiple domains at boot time 
instead of being limited to a single dom0.

Regards,
Jason

