Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23092E1BC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757159.1165896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRowS-0001F8-9x; Thu, 11 Jul 2024 08:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757159.1165896; Thu, 11 Jul 2024 08:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRowS-0001CC-6l; Thu, 11 Jul 2024 08:14:16 +0000
Received: by outflank-mailman (input) for mailman id 757159;
 Thu, 11 Jul 2024 08:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dPy=OL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sRowR-0001C6-Bx
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:14:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e03abb4-3f5d-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 10:14:13 +0200 (CEST)
Received: from MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::19)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 08:14:07 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:114:cafe::a) by MW4P222CA0014.outlook.office365.com
 (2603:10b6:303:114::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 08:14:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Thu, 11 Jul 2024 08:14:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 03:14:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 03:14:04 -0500
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
X-Inumbo-ID: 8e03abb4-3f5d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puGH4G53AV7NZulC0T/0jd7Qn0PjRt9hwva+Ne8H/ue2pD3fX1KLdt/YJgpv6xTCCzaVta3NW1npcqcnhkGnlGGKP7gQDb0k2gFpfcwOzhYvnp37s08xnyZzrUwWBZ3S/SLL48bZJVGuNxkGlJPdVIqLouDDAfe3t1Uz45b6WJRmrghlAzoXrVIfLhtEZdhNn2n0OShitR7+o89yYvVIPQqC44Uj3MAYBSYXVZpE4JcpwgHQaiajuzrWuL23eEeDt1xrHh4J183/Izm50H2NpkBmv00Gn587SI5JetNHzjsNgTHnE/EHzoieMU/C4yzDyKTnfTsDF0vfla2sMT6zaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiR1/TMEhAdDMhnuyhjRtLk8+P8/ns8GtS+E63zDiSc=;
 b=W7QtfD4prtZYAn5M30TivWCb1d8GJl8vjGvbeZlVtv4QLORdCDjZNNQMf1AZ4rUzgvuGdPgL69HCkMKvZJN8+E2T3AJwsw886CaW4H1hLkJUjOoBZoHkVr8uZK5gg8meykZtmjYQZgq0zjy3wTDaex1nXwslMnrynSFnTCe3zWmShXRTF8cpyN+x12kVUNhp0yKybQ715Xxdv1Ou25vUmB0tqKxkCTrysC5oy1PddGa0uLqNyWN6fFiQMt+kFVtYjyHyB1zbnea2+aH3vRqnEo6Pw0EI6Qx0CgdwmYLoRp+gJynQGCwoB9sljWrgDuTsvWoEKa7MdePbDMn4odiEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiR1/TMEhAdDMhnuyhjRtLk8+P8/ns8GtS+E63zDiSc=;
 b=Bw6YFFBRx7U7VxOjIYZjujXqgFgZW54PFs0zpI62hEPh0/mvJa6eFjeqsyqXQOKH/e0HwPt/vmBJL9KpSefmZplzvr9FvJxMJkhWKcYoDtfHEcdVGDNqyO8Xu5EiPuhP+eEiRNjp9qyLadY5Sl679LUtbwhk3gwdpURpyF+M5EQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <be1517ee-bd5c-42b0-8328-aa277680b935@amd.com>
Date: Thu, 11 Jul 2024 10:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] automation: Use a different ImageBuilder
 repository URL
To: Oleksii <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20240710093751.25154-1-michal.orzel@amd.com>
 <98fecf96-ab8e-4514-a3e9-a1f0b15519c1@citrix.com>
 <c26ee4258d9bc83ad69db3d4b4c10d1dc920c071.camel@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c26ee4258d9bc83ad69db3d4b4c10d1dc920c071.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: a6718781-ea66-4293-43f8-08dca1816f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXNpazd0OU5kaEpWeVgvOURDdm0xcWpLS3JvZnA5bEkrdUZCOEE1RThuRzF6?=
 =?utf-8?B?TUVvTEk3bkVaN3F0U21xZmY0NHFkZmYxTUFOZG44OEtqY0VYSlpnbzlpeitF?=
 =?utf-8?B?bnRVQlF1Wjg3YldIaU1hbTJxaDN0eXlwS0Q4WUd5R3NjaDk0NDBDelFFTDlL?=
 =?utf-8?B?eklRdTludHBBWm9BVWNxaVpRcUdUcm5nL0xYTi90NU9UN2w3M3NPUDVHVCtF?=
 =?utf-8?B?UnFQRVY3cXZCRGkzVUZQVDVZTTU2WVJaYXE5eWlxSW00a1p3WmloM3NqVjR0?=
 =?utf-8?B?UWxkUXo1QWc2Y1drbjI4VWMyYkE2Z2JMeDFmRXAvR0FrUU9GMG43UWE0RjQ5?=
 =?utf-8?B?L0FJVUNWanFUL1pqSUliQmFEQnJCalBCYzRUTXI1VERPZDRRTmxnL1lMUlN3?=
 =?utf-8?B?MGd6WWVacnpmUElySGhPMkNkc21DYjVQWUE0TEdHZlBTVzFnKzB2NEdLcU9G?=
 =?utf-8?B?SFNrYUk0c1dxVmxzU1JOdU40WHc2b0s1RHFsU1N1Q09PakVYMU9MMU1SNmhD?=
 =?utf-8?B?djRzK3Y0Sk1kSDBYVUhPeWVjSm9ucngzcXQwYnFwTWJDemhucis4VElGdXcz?=
 =?utf-8?B?bmRrQk0xeXRZOWpyak5qWjIwZDAwaEkrd1VtQkpnLzFsVC9oeUZzY1ZjRkFt?=
 =?utf-8?B?MTV2eTU0RmwxVkpSMGwvZmx4dVoyQTFqTllTSTk5TjBKZFZxeklQNGd0Szha?=
 =?utf-8?B?UHIxVkFwcmdUNVpmWTF4b3pnMEEycDNhRXBPeUNYTHBBbUJjcWdxUVFwamJp?=
 =?utf-8?B?Z05nWEtsTnZVdGhaeC90ZVkxeUErMHBLcW1PZyt6aDFiOWlET1piVkl4S21O?=
 =?utf-8?B?YXBYdUMvbng5QUYraFcwcWdPSFhsS0M5a2pJblZpZVY3MllOU2NjbWdZTld2?=
 =?utf-8?B?azk0MW11cStEVDlIRHN1NVQ1STJXRjZ0dnUxZHkxVzcydGgrQkxIU3ZCRXYw?=
 =?utf-8?B?VkF6bWE2YWdiSVJKQk5LVVdXNC9ubmw0VGF1aWUyamFIMktPN0dRa1FXVVFW?=
 =?utf-8?B?SkVoclZLSElzVE1CWkNReUxXSzdPNWovVzlsVERTcDNsdkFlRFJzdWNEZ1dz?=
 =?utf-8?B?aElDQzRCTTIwKzBwYUh0cVNwelQ2UEtJblhxVnl3OFhubXA3TWVlekVFaU00?=
 =?utf-8?B?K2FyZU9xcU92Lzl3ejdueE1KYjVpMURjbXBSdFZBNlZ6Ykk5UGFNa1hWSEdj?=
 =?utf-8?B?NzY4ZG9hTUt0NFJNak1WT3VFWTB3NFM4UHV4Z2Q0S2Q2WUhJUDlXNjJaMHoy?=
 =?utf-8?B?ZHQ3d0Y2eFRzSzNlVW05MGVWaC9Xa29SZVdtS0pBa3ZtdXdYcGdjbVYwcXpJ?=
 =?utf-8?B?N1FWR1JZcUMzV3ZRbDNVTDEyTmFWKzF1dUR0aUVSdFhGODFlaVE2MFFJT2FS?=
 =?utf-8?B?YkgyYnVPOE9VRytDaXQzUjN5dGRJM3ZFVXZPd1RGR3lrRHJ2c2NYMEdjOTc2?=
 =?utf-8?B?YjNJMTRxMTdjelpJTnhsUFhqUG00L2U4NXlLZmkzYWtQbDh5RkZ1V2VZK1dL?=
 =?utf-8?B?UVJaRzFuWGp0OTJ0RlJhVi9CT3lUK2JHOE1lblBXa1puWkdvQ1FJY2NDa2dK?=
 =?utf-8?B?OWZGcGttdWZZdjJDUDZHV2QvZDRQSmN4cWRaYjhRY1dxQ0pmcTBHUHFQR3ds?=
 =?utf-8?B?bndCSDkrVC9MY3JtQnhuK0lzZTBvNmcrWVh1aGRvVXlwNDc3WWdRRzlTdHpQ?=
 =?utf-8?B?anpiWEpTcXU1ZnVXRlgxMTNrelNNVU5DTExYTXF2OFdLZFB5aFRHMVZJdkpY?=
 =?utf-8?B?L0NIYlpvSzRLcVZ2YytlTXBLQW1BTi9kdXhYRjhGdkJuUVZ1MGdzT3ZDbzk1?=
 =?utf-8?Q?Slva41J3MI5yga6H4PjDs9tbqmBADXQaMX+HM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 08:14:06.8917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6718781-ea66-4293-43f8-08dca1816f55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382

Hi Oleksii,

On 11/07/2024 10:11, Oleksii wrote:
> 
> 
> On Wed, 2024-07-10 at 10:44 +0100, Andrew Cooper wrote:
>> On 10/07/2024 10:37 am, Michal Orzel wrote:
>>> Switch to using
>>> https://gitlab.com/xen-project/imagebuilder.git which
>>> should be considered official ImageBuilder repo.
>>>
>>> Take the opportunity to truncate the git history when cloning using
>>> --depth 1.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Given the current overhaul I'm (still) doing for CI in 4.19, I'd
>> suggest
>> taking this.
> 
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
> 
> But is it the same imagebuilders and only location is changed?
That's the same project but the repo under xen-project is more up-to-date and we decided
that it should be considered the official repo location.

You can check that it contains more commits.

~Michal

