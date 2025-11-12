Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9EC50314
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 02:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159435.1487762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIzY2-0004ed-IS; Wed, 12 Nov 2025 01:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159435.1487762; Wed, 12 Nov 2025 01:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIzY2-0004cL-F7; Wed, 12 Nov 2025 01:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1159435;
 Wed, 12 Nov 2025 01:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P68F=5U=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vIzY0-0004cE-AH
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 01:21:20 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff4a30a-bf65-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 02:21:13 +0100 (CET)
Received: from SN1PR12CA0092.namprd12.prod.outlook.com (2603:10b6:802:21::27)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 01:21:06 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::a1) by SN1PR12CA0092.outlook.office365.com
 (2603:10b6:802:21::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 01:21:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 01:21:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 17:21:03 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 17:21:03 -0800
Received: from [172.28.100.6] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 11 Nov 2025 17:21:01 -0800
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
X-Inumbo-ID: dff4a30a-bf65-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNDYkdt/knD78PD4vNQUQKUAUMfaRFvK8wbA1PlPdOvgUbJ8AKobZMHEtnOdHBbBCE3FIykeBo+3MAv6yU16LQ31huD3AzszkadvZMBcAKyuj3M0+E3WCr7GeEXGtPWciNgSpODwt3SA4EG4u16T+lzY+aYOpwef5Pdx9hKMhgw2nOpugtbRojbIYLMIJ1z0C7l22stHR8+K4wJ+Ypl0BU/F24NEymZeT3YoFQIlruKVz8RtOTuEx2KlEsj9NZpM/g16gTWQVlcRAyW7ieMyi8SCcq7VBfHkubUFaPZWFXIRp4MExVyF5/qGIdrVuxL6We+NjPVP5ZkZ2hPHT7c6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktGJPSQTd+vfBwXa7rurz/0mSlEmpoQZvOmd02Cocdo=;
 b=wYPojAmiUZWKgkBfJS5Gy9IO2siJaIU73a2uIHKKpUfkCG4qsTaiVTBM06C8kd5zkwt14RxaiVKWy4u/m3lxyMGtFKUrzdP6iWofNr1IIktnfHj11oSgc6vJJrEBRck0yp6hqk693adU/RD2nXMlWmyc9paT0FgjlNxQPcjePFxG26bYLebs8NMU2A7zVgl8SiWXSL36pGIMCkE647K5sKTBPZyj42WBKn0hUHfbgJV4Z35FtwHl9XfEKcFxyHtbqBH4/t49SrDa+O6KLBLMzWZQXtfTl/45WlEYWzFEw4kxui+MrwJ9CO2+WcCMPopOg5pQrvTQ2wwuazzUPXLzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktGJPSQTd+vfBwXa7rurz/0mSlEmpoQZvOmd02Cocdo=;
 b=avpBGRC5QPuxUqWUWuBJyBZmG/+M9WTaccxP1THrZUZP7ARapjNwRyRjm5DWd7CXIPeJ+GeIlHAir8Vw+S4OBA4ZteiXMWwEEeQmyn+PvlQ+kiglXJcawPU7ELat6pOh733iuj5W+QjfMh+ytNwDwOvTUtugCVBjuu2ev4d7VBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <84db78e4-313e-4d6a-81e0-230cf27ca78d@amd.com>
Date: Tue, 11 Nov 2025 20:21:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/5] x86: hvm: dm: factor out compat code under
 ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-2-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251111175413.3540690-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e455bd-87a6-4904-0b86-08de2189c12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vmd5VmdHTGFwNzRSTjVrU0txWjFoNW5rQlM5bGVEVlZKNDd0aDl0MWlHZWVC?=
 =?utf-8?B?Rys1a0hWU29Cd1JLODBGMloxVndJeFVuN3d2bTExYkJoMkdDMGpBclY5bkRZ?=
 =?utf-8?B?ZlpBSDJoNUJOMTdKUFlsYkdZQ0Fac3hZTGtUNnNmZjFMR2piU29MQjZpdlhE?=
 =?utf-8?B?T1RMZUdTMDBQTDhJeGx5MkowZ1lRc2RZa2hnK1o1QUgzOGErYjQ4MjQyWCtQ?=
 =?utf-8?B?YlhQL2kvaGRaYXQxc0VGOGZFQnFBTFdWcDlZWUdpMVp0dFNZN1c3dE1rZytG?=
 =?utf-8?B?Q0pWM3Z3djRmYTFkODVxbUlwMElLMDA2UStXZ2Z4TXFhaVl2bm1icVZsaGZa?=
 =?utf-8?B?MWFoZGVsK2VpNHhkdHhtNkJNR0d6REl4cVJRUTY0eUhpM1Baa1QvMUJUMDNO?=
 =?utf-8?B?WmZvNmJJMXRPSlRqczFZcEZBT3lXcXVrZ3RZaTg0TkhRVkN5dE5PSmovZ3VW?=
 =?utf-8?B?cEkwTVo2aEc5T0s0NllmdDRSTDgzS05qZlk4MmNaQTc1c1lLdWp5bmVUZlRP?=
 =?utf-8?B?RFoxelloRXFvMlM3SHdqZGlpOFMxU3ZXZXN2cjlySkdjeXhVOXVvaWt6TVpB?=
 =?utf-8?B?aldOWFNLeDFpOThMMjUrK0g4Q2svOWJ4eFlvM0tmMTF1dmplVWdNaVNWdUZN?=
 =?utf-8?B?QmtxSGYwR244SXJTUmNQcGgvVCs3RkE1N0ptbXpSRjFyR1JqanNkUnVnK3ZY?=
 =?utf-8?B?eFEwakhmbGJhN2YvRUEyMEFuMCtCNld0YnhvQm9DSnlQbFZBc3gzclFTZmdo?=
 =?utf-8?B?VEN1MnU5R05YUjZmY2IvRVk3V1Q0WmVvR3RaZVR0UVl1Z2RYZUhWZWQ5TG1O?=
 =?utf-8?B?MlRJYVUwWHNRL2pTdGFUbElSVUVKeHJqSjVvZGhna3dSbU1aNENhNlhzdXdI?=
 =?utf-8?B?T0xYYmxFNG4zWVJta1FlQUZsTEJyd1ovVU1lbWEyL095MWJsQ29ISzg5UFpj?=
 =?utf-8?B?OEh3WGVFaCtOYjNPdXYzbjdhSUtDSTRyUTdNbUJPQ2VHQy9jZ3lITlFWSmlq?=
 =?utf-8?B?aDVuMnM3SXp5RTJQczUwR3JCak5hT2FtS1FJaVdWcUtLdXpQaUxFNEl3aFh6?=
 =?utf-8?B?L1NEeHRZVmNNaWlRM2g4YnRRdnQydk82RjZwWUcrZFFuUDRLTDc5S2VUY3J0?=
 =?utf-8?B?cmp0dVB4NTZpek9mdGVxK1c4TXRydzhmN211YnJIR2VaVGdFRitxa3FFSDd3?=
 =?utf-8?B?NEU2V1hKaTVLRnJxSy9Vci9YUGcyUjZPc2Q1bXJkMENkRVg3NTQwNEp1MGly?=
 =?utf-8?B?QTB1MGp2TW5BNVUrdWgrQVZDaWZsbXEvaDhkUGJQalFjUThXaDdzL3JIWkR5?=
 =?utf-8?B?TGdwaVZFSFNtakRIUCs4Q09scGluSzJzU2w1YWM5UldMcmk1b0xrV0RlY2Mx?=
 =?utf-8?B?aVpDRk14VDBoSUdOUDVlMUlDVmJEb3RZMUg4a0x2UjBQMU9jNVN0Qm9DSWxD?=
 =?utf-8?B?TkNMTEFrQm9oUW5rSmpEdXNRTXpnb3JuM0gvY0VGL2drWGczM2RKdmh4WlRh?=
 =?utf-8?B?bjA4VjhLSzlXemFRbVdzRS9IZ0FpVnNhUUhuNGtubC9qOE9FR1ZNRzRtQjZp?=
 =?utf-8?B?YVkzQTh5WmVZZTVQMzZ6cW9QcUtGWVZrMUNWSGxKTFFNMCtSalJqNnN3R0Jj?=
 =?utf-8?B?M3lCY3F1QjRYTlBSMXlJa2tWdXRmVkhodGNWamNIU2k0bTdxN2RNVjhlODRK?=
 =?utf-8?B?bGp1NFpvZFRGcEt1L3hiM1VKU3o0ZG5HNnM0RjEvbDNJeU5UT0I5bkU2VVgv?=
 =?utf-8?B?OFdWSENxMmhCelh5bkhnOEROTDd3a1NubEhET3RPeE1VYkFnOG51VDd3aCtJ?=
 =?utf-8?B?WXhpVTVIWGYxcG4xdmt5YWo2OTYrbTc1UTVLVnhkRjZ4S2tLZEVVcEU4Y3ZP?=
 =?utf-8?B?Smd0dG0zVGVLRHllb0I4Ky9odDdTS1pFZ1p1M1c3Ung1NWtrRFRCazJnVmZ6?=
 =?utf-8?B?RE0xTkVaNDZOeWJLbFpYSXd6eXVCaVVLUEc2OGdDSW9zOUd0WGltVno1N3JM?=
 =?utf-8?B?V2dFeFpHc0YrT0FIekorbVJxbFVvd3dhdkhNVTVMVytGLzYxa0lybmh6TCtu?=
 =?utf-8?B?SWhQbmVrVmltaHRWTU1YcnM3Tm84VVJveWMrUUtKM2FJUlRCNWIzS2VZcmg3?=
 =?utf-8?Q?I/k4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 01:21:06.7585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e455bd-87a6-4904-0b86-08de2189c12b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985

On 2025-11-11 12:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Factor out COMPAT HVM DM code under ifdefs in preparation for making HVM
> COMPAT code optional.
> 
> changes in v2:
>   - do not move code, use ifdefs
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

