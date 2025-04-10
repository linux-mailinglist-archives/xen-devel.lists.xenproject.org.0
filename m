Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66CA84F46
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946452.1344357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2znP-0007rJ-6L; Thu, 10 Apr 2025 21:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946452.1344357; Thu, 10 Apr 2025 21:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2znP-0007p1-3A; Thu, 10 Apr 2025 21:50:51 +0000
Received: by outflank-mailman (input) for mailman id 946452;
 Thu, 10 Apr 2025 21:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2znN-0007fI-AB
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:50:49 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbd3bf58-1655-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 23:50:46 +0200 (CEST)
Received: from MW3PR06CA0021.namprd06.prod.outlook.com (2603:10b6:303:2a::26)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 21:50:39 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::60) by MW3PR06CA0021.outlook.office365.com
 (2603:10b6:303:2a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Thu,
 10 Apr 2025 21:50:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 21:50:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 16:50:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 16:50:38 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 16:50:37 -0500
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
X-Inumbo-ID: dbd3bf58-1655-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSnrGbtnsNV10rpuvNFqyIPVQrPHKmwcVFVhxxiEtxpphHk16QYHuD7BOAA1fGgwtAwSrZX7Ff4yH4ezpfEXaOqPDkflalJdu+cohQ6paKd/OgmJqwIZ65g5JtWdmut+DnKQA4z1ASMkcEzwh53h637sl4rE1Qoz99NV7KTC0cXTUHODlzbbTkkjgx7R0aqRdm/L6NhP8rPi5rO+3hTNOZELOWfwdInZY0j47REjlNmAOLRYyCfDHgVC+U1Mv1LuLbK3mLCDy2IGOVVqUoGNzanLO4plW6mrtFXPeBmXAeWfkKcybHnDMsyPp2UquNtmtcdZdCtEMamLc5af/iX4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlKyaIX1lcTWLpP6Bt+NUHybXgDX/kwnnH6Ar9FoI9A=;
 b=xwqsNPpmUwLhjaWUZx1nSytHOvZECfnUwY3Lud3uaIRlcOAhxhCVn1pZvEBiX1SBSnOLVdcBRYivD//dqV3jxYsYCDPHA4mSO11Bc8IJS3q3QQ6WHGKY/9gtSfhO9pFVYGnL81rNTlkKqRBqbwXYAm46bAZuqHeaMUV/v7VQMvJp7tTYN3MEYhAwU8AYbi0EG3C7eVWCAx3DFa7UahtVwrdMNUcNUF+QV8VYyeE16X97+0Ft8CE423fHT/If/hAl9ypNgydj3YoZhMZQTpTKJhClM40qFiKdmWbKV8s4SXGQsVbIGQvv/9JpdSwkEnOneaE+Gy9qMdWH1cth9jb/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlKyaIX1lcTWLpP6Bt+NUHybXgDX/kwnnH6Ar9FoI9A=;
 b=fktK8HxKJFQ0P+jDqG8JRLpiktIptEGIN2U/jr+yfsExgH9VWAZBiJttskDx9UJGZzF41oLlH+boisdpasJOeuXYBFcYcqyoh+pJRqyL3O0MmAThFc8h6VCqhL1t0izQ6XQZ9QpBtJrqo1S7RcuEY09DGdpYx0KqMbHqLZ/Pd98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b0da7fe5-9dc1-42d8-9acf-56141eaae053@amd.com>
Date: Thu, 10 Apr 2025 17:50:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
From: Jason Andryuk <jason.andryuk@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
 <5da1f4ec-43ca-4279-88dd-b51d57b306e4@citrix.com>
 <eeec5fd7-25ae-42e6-be47-d849e2e33f6b@amd.com>
Content-Language: en-US
In-Reply-To: <eeec5fd7-25ae-42e6-be47-d849e2e33f6b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9dd6b1-1a04-4061-538c-08dd7879bbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUM5djFUcmUrazRHU2lud2ZJM012ckFkRFd5UWJpdTlTdlhtLzdjTmFKaWhv?=
 =?utf-8?B?NmpmV3pwWmJOUTRBckdmaTZQQnBwWkVWZ3F2M1NFdVEvV09EL2d1akR5Z3F6?=
 =?utf-8?B?TGlnMEJjWnBxeG9FbUZGS3F3Z0lCbzBqbzRXZU5sNTczNFYyV3pOUmdkK29z?=
 =?utf-8?B?QVdRV1RtTTFKM3A4cnhRNFpabjlsWTZaUC9rNjJVa1dvYjV6TUNvMHVZRldi?=
 =?utf-8?B?R3B4RmZNa3NId2hkL216bGtPTHEyaW10b3lHQS9kOFU5MHRwbWEreWVjVmdI?=
 =?utf-8?B?Rkg1aDY1ZmhPUVBhNEJaZVc1bGFMbFhGWDNtRHN1K2lmb3RzbnFabHg3S1hD?=
 =?utf-8?B?Rm55MkM1M1NacGluQjRGSHJpR052QnVMV3lmaFBIeXNZcjhEbGY4eGZzUnRO?=
 =?utf-8?B?Mzl3dGZ0M1NNcU15bkFLT2tpU2pqa2RRT3FZWnBlUG83ODFFSVlVRWhQOHJj?=
 =?utf-8?B?UTFBN084K2NXUkRMNkNhaHQzWWx3NGtTSGJMaldFTW9YTnlFbm83c2UwVEE1?=
 =?utf-8?B?TDYwNDNmMjJTaUFmZTgySTZQbEZ1MktHdGJsUkVXcVRVM25JbWppOVNDdWt1?=
 =?utf-8?B?SmgwTS9SWlIvbWNPM3ZKTVcya1VqeFV6M0xQNWloQ2N3TXRWb1dQa3hzZGtk?=
 =?utf-8?B?WFRDL1pMMzdoQnFtTm5reUNSa3djTFp2bTBMVEZCSkU5WE1zUTJzQVZUdEpE?=
 =?utf-8?B?MTZSWXlHSnV5aEQrbHh0LzhGclpNMFVlUFlhc1pYNnlDaWN6Wk5zMzRIK2oy?=
 =?utf-8?B?cFpMSHpSN2N0bE1MazZxZ2xuWXZnMnBCV1N6SnF1cndVTVQvdWZqTW5odk9x?=
 =?utf-8?B?eFdvZC9LbE1hVUxDUjVDTmU4NnVoZ0FoMU5VSk1XL2RtUi9sd3dPWTVnY09X?=
 =?utf-8?B?c3hqMXJuVnl1Qlc2YU5Zejh3MUJTeWhhRHE4L0hKV21iYVhpYWhDU3NHWTF3?=
 =?utf-8?B?ZnRTSy82Zk9IdUpZZUYxYzh4UXMyZjF5YjVBM2JHUTBRb3llMnRmYUJjWU1V?=
 =?utf-8?B?eUFVOHBBOHBZSWc5akhMTm5qUDdHd0ZWR1VSZ2ZOeUE1RXphM2VWdk40NGtE?=
 =?utf-8?B?a29aY2dGSHJtVk5mbCtla2NEekt6aStRS2pkOERTZzJ6TlFrUWhBTmtLRWV1?=
 =?utf-8?B?WFVXeHd4UHpIWFFwY3RuY1RGTEtZTlBhR1JOekRQN1VzMzYzU1ducHJoK0Uz?=
 =?utf-8?B?dFF4WFgyY2V0SGluaFcwd2hlb0N2UnpxWGZKbmJKeDFwV3EyMy9nY3ljRWNV?=
 =?utf-8?B?cHdkOEh5T09tWWlIcWJlblZlbHoxU2ZXN0EzV1FvN28xRXZkZHNaSFFJNUZa?=
 =?utf-8?B?RW13d3RMLzd3VDVvR05YYjBsT1hGZklJVjhMdkNqc2dxVmxOK1FQWkhyKzEw?=
 =?utf-8?B?bHVJWmZSWFR1MXozQW43eUo0dkliQXBEcFNaTU1HakFHekhBbmlhRzhZM1g1?=
 =?utf-8?B?MUhxQVAveEYrUEFRWGxqaXJ2TElEMmZhUENlNHVxZzZZSzBiZU83RzE1dGdP?=
 =?utf-8?B?TmFNS3Z2VWZuWDNUNm5KbDFqK003eFJ1aEJKNVljQjM1em5na0xHRU1TRVE5?=
 =?utf-8?B?VytjMjFObzRONUpvMWlkM2p5OEFIbVdxQnk5M0R3MnllRG9CR1VJUXBpZlRp?=
 =?utf-8?B?SEZvR1E1M3V4dHQ1c0ZDZ1U3Y0R3RitTOEVWWGRkSUgzbWZMcnNjUUV3WUlI?=
 =?utf-8?B?RVlpT3ZQRlUwTTg3clRLRnZMcHB0eG9TTjhvVWdTamFaTzBhREVySHJRT3Ny?=
 =?utf-8?B?ekEyS1BlQVlpLzRyZDIvb0F6dnZCbXZqa3hnQUpLbUppWTJtT2hXZk44M3Jz?=
 =?utf-8?B?dDlhdWxKWDlwbTBlTk9ZbkhnTE1id3U0bFV6cEw2NlR1a0lLZERxRHBMaTJR?=
 =?utf-8?B?bm1OZ3BwOXRiUi9LdVBwSlNBNnIvbms0SHVIeTZJSndtQlFBMlFCZHF2c2Jl?=
 =?utf-8?B?RGxMSmxLdThDSnErL1pMb2xsM1gxeHRCMTFuRXZqN2FzcDZCL0hTbzZaSHdn?=
 =?utf-8?B?VU8vYS9JSGRlZm9mKy8vdkt2cGR1cGZMbjNwbkJQTzJ6NDVwSkxxdk1hNTU2?=
 =?utf-8?B?amt5eS9ab0lLcTVSWVpoc0VEcFpWeUhWWkU0dz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 21:50:39.3751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9dd6b1-1a04-4061-538c-08dd7879bbe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078

On 2025-04-10 17:16, Jason Andryuk wrote:
> On 2025-04-10 05:17, Andrew Cooper wrote:
>> On 10/04/2025 1:09 am, Jason Andryuk wrote:
>>> On 2025-04-09 13:01, Andrew Cooper wrote:
>>>> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>>
>> 6.6.74 is broken too.  (That's the revision that the ARM tests want).
>> So it broke somewhere between .56 and .74 which narrows the bisect a 
>> little.
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/ 
>> pipelines/1761323774
>>
>> In Gitlab, both AMD and Intel are failing in roughly the same way.
> 
> Something else goes wrong in QEMU even with my patch for the hypercall, 
> and Linux eventually crashes.  Lots of unhandled memory read/write in 
> 0x1bfffe000 - 0x1bfffeff8, which is marked unusable for dom0.  I trimmed 
> lots of the consecutive "unhandled memory" from the attached log (313KB- 
>  >22KB)

Seems like Rogers patches need backporting too:

x86/xen: fix memblock_reserve() usage on PVH
x86/xen: move xen_reserve_extra_memory()

Regards,
Jason

