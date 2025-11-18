Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FAC6C100
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 00:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165374.1492158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVZZ-0003bz-IZ; Tue, 18 Nov 2025 23:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165374.1492158; Tue, 18 Nov 2025 23:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLVZZ-0003Yv-Cu; Tue, 18 Nov 2025 23:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1165374;
 Tue, 18 Nov 2025 23:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/+5=52=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLVZY-0003Yp-8b
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 23:57:20 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f00447e-c4da-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 00:57:16 +0100 (CET)
Received: from DM6PR17CA0031.namprd17.prod.outlook.com (2603:10b6:5:1b3::44)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 23:57:11 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::3d) by DM6PR17CA0031.outlook.office365.com
 (2603:10b6:5:1b3::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 23:57:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 23:57:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 15:57:08 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Nov
 2025 17:57:08 -0600
Received: from [172.27.232.218] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 18 Nov 2025 15:57:07 -0800
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
X-Inumbo-ID: 4f00447e-c4da-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV+hPqtRDcyBPpwfQIf5u6Xt+GK2B31UJQaFkwp+Ze4rrE/4s9uSGM9Iq8i1jeW7V1m54UQPnwUo5iD1vsinzFKqR7H02//Ajf2QQPZWJ9tSR58ZEBJo18jLlwfygq9T6uSV30SFv7ahqDtRqjYC0jxL+EJh9LCw6JugaRrk9OoXO4S5vPTmMXIqmn1TtrKGokN9tfkoVdlhn9iSn0mtj6AyUs/9/LV5q0VDMWvbKipXnXtssrmOCCO+PRGzJRo5PrEAdFUYP5tYwFCgjVv5WZedCwqmfIdxIU6iBq2fI6ARKs7gQg3ifUzPG9fA2Ll7vGvuUd8Wll4l7r6RFUTcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJSAe+xeKd4uG+kuBtefz60/TNdSAs9kSUiyuH8nHAQ=;
 b=B39NUMXaERjF1vh/zJg02yzSiHf57LhnzrHTFZkY9Fa8NGcSnc7wFc9oh+5ZMUa1jqSs0byY8ywfvnRBbuxJ1/KLxeP60iNxqYi7PMVv+THv78uxWNbuOXTi+qFI3s9NKRfR4mWC8BLtAo2rOCbxt3KxrDAKCctpI2vpC6ngHu7hRyPD7+2xAZaNr5ihm6xhluVOWqxAK+Az9cwdXgfyV3XoEBpbsHSdWf2vTAM1jtNFYEaLlOoY/NIBntZe87r43257eax/sLxiOx2V3W2NLy4qXEQva0HAzrXf1ho0A+vCOyMkqdVAfOBvm1seca4kQz/Dr96qLzKSqx+bJ0KBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJSAe+xeKd4uG+kuBtefz60/TNdSAs9kSUiyuH8nHAQ=;
 b=miCWQkg3/hmRHQq8GCWzCSs5DH2Zj2WcAPZ/z5ndsA2e9V3hulLSvVv6YA/TtAN7Y1PVo0ZGl401lgYxWSFJbMGXw6rRRGyvm7VrCsF3MMgCiyFRYuu0iNjIhhck12xz/FWBxfxSFpoB/zxehShzkoULIPSEbMHXhRNBupU5by0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <53d1878f-413c-43c2-8bec-750ff3eade9c@amd.com>
Date: Tue, 18 Nov 2025 18:20:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] xen/svm: limit the scope of "rc"
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-2-Penny.Zheng@amd.com>
 <8304ea57-0574-482b-a2ea-e1dadc58656e@suse.com>
 <DM4PR12MB845149F3F5C2262969771FCDE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB845149F3F5C2262969771FCDE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DM4PR12MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 04294a5d-334a-4e81-9596-08de26fe3095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0Nid1VINkp2Q0lCRVNrekhkVjZUTkFDVVJLaUl6SDhKWkRrUmI2UG5KQTJa?=
 =?utf-8?B?ZUtPdURZM3JSUmtEY2QrQ25QaGY4OHM3VXVoQU53TGo5QUlkbUV5Y0hGcDEz?=
 =?utf-8?B?cHRvTmkyU1ZMaDczUmc2RXl1SDBnRGNkbWttT1hrcVJ1YlB3SFNYbDBqSTAz?=
 =?utf-8?B?TENMMVlOQWk1MUN0YmxyZFdvNjhnM284OTcyTFZrcnJTTGxGa0lLK2NDQzhk?=
 =?utf-8?B?TUJTTHZzK2pvcktRMVNCTVgyV3hiSDRDdWgrSzE2c2Zib2VjcHdmTUJMeWx0?=
 =?utf-8?B?N0d5ZCt1aUlXWUNJeVpTR1cvYkdROXNuNmtlNzRzeFFQNjdRNnZBM0pFK1lw?=
 =?utf-8?B?cnltOEVVZDhDN3dqUSswWXBpTkpQZkU3amgrdTdQaytxVlpDNGpvcEZZN1Vv?=
 =?utf-8?B?dXVJTjVWbXVET1E4NTBLelpjRHBzdGlDNVJTazNDQTVrdElHT2Jrb05YVEt3?=
 =?utf-8?B?Yzk0RHhiSUtPdDQ2WTRxYXZVVVpMMjk4VURZWGwzSkloUVFnR0QzK1RNVjA3?=
 =?utf-8?B?cllaUmtibWU4Tm1PUnhZRkJseURyQ2I4MWEzMExwdWJzT1ZNYjRrb2R6aGho?=
 =?utf-8?B?eFZESGxpWWI0WFpkYXZQSmh0dnZMSVpudUxzLzZtdHVHVmlnVElOWDByRUJh?=
 =?utf-8?B?dTcremJpV1M1RndRQk9yOUJwRkp1aGtoUXh2UEl0OGNnSDRsUWNPYkUvOFh1?=
 =?utf-8?B?T0FCL2czREhLd050RXU2YThYWnhiMXhVc2RoRWc4MkpIUFNZYzZTNTFkZTZ6?=
 =?utf-8?B?dGtMa1lMU0ZXS3F3UUY0bkYwNEZDbVhVVXVFeWVnWE1DWUhORlk1aWRUQlIx?=
 =?utf-8?B?S1NPeGpXamQ1VHpxc1VQekpoTWZTRGpkS2dDV0ZQZTg4UmZDWUtwS2d0MHUy?=
 =?utf-8?B?YmZ0NDNNZ3ZaSjdPWU9zR3BOb2JCNEwrdE10RS92aHc3bTN2WlhYd2JWWUQw?=
 =?utf-8?B?T0Mwd0NJYUFCQUpyVzhNM0NYT1VZUFRLQVdEaVJTZG1UVGJhTDMrNVBjRDBk?=
 =?utf-8?B?R1dMZVY1cUJCeVBac2dWem9HTy9IY3ozSUpOdDl1WEhibVZ4SkpsaXdzNTVh?=
 =?utf-8?B?MkNOVXh4Ymx0ajNNM0g0Vndicm1oNGs5U0dIOHhwU2dNV2Z2dUF2RG5ybTd6?=
 =?utf-8?B?d2szOVN0emUzajNXTmNBa0RlL3BHbzh5MWVIR1Rva01VdGY3MnEyZXliL1Jy?=
 =?utf-8?B?bnUxTkxqTEFhRVQwYUkwU1RaUDdTMFRBRHdxQTdwdmRCQ1Z0bHVnMHZxakd4?=
 =?utf-8?B?WUhqWXc2S09Xd2F3aUdrRW9VaTQzZ3dYSXhGdEd4dUZ1ZUJqWXoyYnVDM3dD?=
 =?utf-8?B?TmFXam1yaE1QRGpwVUhDa0hmUDNTWlRoTVVKYnB0Qk02T1d6dUF2TlUrQjd0?=
 =?utf-8?B?UFBHNEF1amNITHVQRWFMcXhLWEFwWHRDNzZkakNOTnFJa09XaVZSU3ZGNGhu?=
 =?utf-8?B?K2lUdGdmZ3NwTnlIenIxSjVxNHZVZlJZVWwwVE1oa3dhNmVlWGthMTNYeXp4?=
 =?utf-8?B?NU5qajlYU01tWTlqRFJwNmJUT2M1Qm9FMWRXVy9uMW9MVW1saGFveGVTVWlt?=
 =?utf-8?B?VFU4MktTTmkxd3hCaHUrbCtOcTdUKzYxd3RqZnhNMzM0SkpxbHZLcVlKajRC?=
 =?utf-8?B?ZWxDaitZdGpCY01RWWxBaDRqUmcvbFJ2NWh0OTlSRHlOUU9iZXUwQkhRMGFZ?=
 =?utf-8?B?Vm1vVHhyU3MxNGgrbFdhRG56Wkl5SHk4TnkranNMT3lCci9rbnRjU2NBYWUr?=
 =?utf-8?B?Z29UejZ1ZkNuNzlFd2l0ajA0YXJzQWp3L1hVVmI1T0NQeENlcUVjazZORTYv?=
 =?utf-8?B?eVlORG13R0Q2MWpiMnEzUFhBL0h4T2hXWkR2M2xuYXk5bXR1QnB0WlZzc0N1?=
 =?utf-8?B?cHliMXZKcTN0T0EwdThqcDJPbVlSKzdzTmdLbG4vK2o4dTZmbFBhMmVaTkdR?=
 =?utf-8?B?S2ZKN0JiMExxRGc3VFNBRnE4eEorMXdCdVQ0cndTUlRVbm9OUVVZNWR5NlJW?=
 =?utf-8?B?V0Nta25PYkZuZ3lXblVleFloSGs0MGc1VHRhL3RobTN3YmI2cVY3Nk5qQmty?=
 =?utf-8?B?Q0tWQk9yR3BOZmpZTFNTRGF6V1hIVVk5K2hoWDlIcy9MbGtDTTQyRkhyMnlL?=
 =?utf-8?Q?fsCE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 23:57:11.1044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04294a5d-334a-4e81-9596-08de26fe3095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157

On 2025-11-18 02:11, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> On 13.11.2025 04:16, Penny Zheng wrote:
>>> To make codes less fragile, we limit the scope of "rc" through adding
>>> several instances in relatively narrow scopes. We also fixes wrong indentation.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>

>> As you touch the code anyway, make this the initializer of rc? And at the same time
>> join the latter two lines? (I may take the liberty of making these adjustments while
>> committing.)
>>
> 
> Thx, plz

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

