Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9989D05977
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 19:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198028.1515311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdurO-0008Kv-Pi; Thu, 08 Jan 2026 18:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198028.1515311; Thu, 08 Jan 2026 18:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdurO-0008Ic-MT; Thu, 08 Jan 2026 18:35:50 +0000
Received: by outflank-mailman (input) for mailman id 1198028;
 Thu, 08 Jan 2026 18:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vdurM-0008IW-CR
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 18:35:48 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d735ee63-ecc0-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 19:35:45 +0100 (CET)
Received: from SJ0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:a03:2ef::24)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 18:35:39 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::87) by SJ0PR03CA0199.outlook.office365.com
 (2603:10b6:a03:2ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 18:35:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 18:35:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 8 Jan
 2026 12:35:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Jan
 2026 12:35:35 -0600
Received: from [10.71.192.102] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 12:35:34 -0600
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
X-Inumbo-ID: d735ee63-ecc0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USCcS3GJ6yoKuzdz25QYXGQrilKSiHGvyi98X5U70Tun08j2yBy+8UkrtpkEy9LFm+C63GUGRvq8enY4gTwCfJndVKvm8Oc2wzpS68857b4zENUDByZAi28M72tPrzYfSslndvi6Bf5Dn0PANSvp1RHUifudxmyeko7Gqys+43oG98/W1FLNn8YlH3Q/vwawJihGeHlTGMle7VNIm+jCPOz0cwaJS6wwapKvaA1jEc6kTNslqhDIWbyB+kpGZxo+RoM/c93VcOjC3Yug1XsFOv72d4yKB2ZTkNgMYPlR22e7xAEejV3UjbzSK3dlWwEqkYOsiyPDGsZBRcXrA3Rc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMa7OHhEIpfTV5Ox3qtzkLjeGIYIhXEHeOt5+S4Je3c=;
 b=ZsnHPA89W8ZiSzA4gb7suTYzAD3oP3cf1i26EhRtT9YJ0OLwearUFxVywR4+DjczwCy2Ci66XyVCO7153X8xv05g9jhel5D8AjNqaSxgWpPhKtkiczRqXlSqHhg2uha8aYy6p2BZlA6gSxRNwl45E4J72eSB0wp6uuFewHke+5eZtpl55TIyqYEJKMdNcJNPFOje5PTMKMNolmHC7fDjtFR+BElv3fYhhLpMnbS8cPAZSt2byDw/1+ZG8Ks1/KJrEwXF1KDGjyZEzHY4EAZeAzKu0sW7LTp2sHBitgckz5aihwFRCPowV0eDAmqBWKjvpKAc+UeRTt2Oi+37x0dfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMa7OHhEIpfTV5Ox3qtzkLjeGIYIhXEHeOt5+S4Je3c=;
 b=Zehz5pF2Z1kd9HsooRgo5LQkmuR4zQG5hGKJfHf4NeSu4CDl3odRmw9kTFC6b3rfUThuEf3A9Yt+2wB8b+prdGX42Jtr2Akpule4VFFzCMgPoSN2yTCwOQotLxnmsUr6dws+Q6x5ICzherUZZ4ZMEB+ovvaXvCnmgZXb/icbi2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3c3ffd55-9f1e-4322-b3fa-99c50da552c5@amd.com>
Date: Thu, 8 Jan 2026 18:35:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm: Use secure hypervisor timer in MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Wei Chen" <wei.chen@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-6-harry.ramsey@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260105113503.2674777-6-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|BY5PR12MB4273:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e1748c-03d0-4eeb-aa4b-08de4ee4b8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVJxL3IrZUtla1I4UFhBTXNwcktJbTdDWHA2b0trZWV2bHJUSTJZNEJleHA0?=
 =?utf-8?B?WE5WQUJWam1JK0hwanVwNzVwQ29teTQyYnh3aHNMSHRYVERCZExFVjA0TGtE?=
 =?utf-8?B?bzczeW1STEQyaEZGbHRVcndqS2JuMHNxTUd5TnRJMHR1eXNEN2dyb2FOYkt3?=
 =?utf-8?B?Z3FKNGZ3ZE9zZVgwNkZWcU5IV0dwYzYvVERuWllrQ3g3WTEzZkRzTjRlY01X?=
 =?utf-8?B?Z29CbjhTY0Y0Vi9lU2RLMzMzR1UwWFVVV0VwVWlDMzA5NlovS09ySnMvT3Vx?=
 =?utf-8?B?dCt4NVc2Ty82bDQ0RkJvQk1vbWI0ZDhnbDBpUlVqVGVtdklTa1NQZTJjYUpz?=
 =?utf-8?B?TTlGYjZlNlpQTE10RXR1N2ZpMzJnTFdtREQwaUplMklDcnVIMnREUTRuMTJW?=
 =?utf-8?B?bFVYdjdtRFdRYUs2UlhhS2hNU2hMbWZEbEhKYWJUWkEzSm51WFdvQXZSS0hu?=
 =?utf-8?B?ME9WdmhCQ1NVRWNFelB3VkIra2kvV2t0V0RQWnExaXBxbkJrU1F2dVczTk9T?=
 =?utf-8?B?Z3JGTVVNR2NhS0s1OTZEN1JGZHFJcHNMYW8vUGl4NXZIcng5SVdQeWV1dG9K?=
 =?utf-8?B?dElyMkhHcWl3TFFabWFYTG4wcXp4WEhjSzZpdjBiaEtyREJVUjZKVjdRdTRC?=
 =?utf-8?B?T2MyREhaamN1TytoQk4rZ3ZSR2Yzak0yYllqanB0ZXdZYS93cUlUbnRTQUxE?=
 =?utf-8?B?NjExMC8yd1dCeHUyVkVVTDJ1aTBBZmpmNTFJcE1WS3BwaFZua29nRDRwdCtC?=
 =?utf-8?B?WXRuSURLN3lKR0NpU1pMVUZ6Y3pTenBRUmk0OE1XOGFUeU5DSFg2TXhzNndh?=
 =?utf-8?B?ZDJjcTZtNnVoc05vWW1qaUFHQmhCK29qVFhva3NuWFMrN1pxVUxyNENFSko3?=
 =?utf-8?B?NVl4dWhBTWxZeEhpWUZYYjFXNTZOUGNmYmtaUUlLa01PdVRxdGNTek5GWFNK?=
 =?utf-8?B?NGhVdE5ha01mMlVCQTdnZlFtcnhGYVoyaTFBWjBwd01BZm9raGsvUjlSbjFx?=
 =?utf-8?B?d3krY3prWUR5WkVrQkx0L0VJd2NHTmxpVXN2THByYTFUWEpaRUcxWEUvR252?=
 =?utf-8?B?WVdwMHJjWFdxUjc4OXR5azVra1pBU2pVcFZpclNwM3F6cEpaQjhqTCtxaUVi?=
 =?utf-8?B?K1o3Y2lrTGFxcTNEY2NxWE9jNTd3aXFkL2EzVEU5ejdxQVV0bEJIV1lTWmNK?=
 =?utf-8?B?dU1uVDJiT2JUdG1WTlJMdmVwckpUREFWMzV2Vmd3RSs2dWVUckJPNHdLMHdK?=
 =?utf-8?B?QTk3ZDlCM3BGeVBwSXVpenJnMjZQdS9JTVpZNUdOS3Z6SjE5YndoaCtJeXV4?=
 =?utf-8?B?Z09OeTUvdFFiak1jTlYyd2Ftc2k3NWF2cEw1ZjlWR09lSkgrM1ZUOVRWTXZi?=
 =?utf-8?B?TTB3TWhBRngrVlo2NzZYMVpzdzh1bkdVdVBLQ3V3dEswNXc2MUI5WUFNYXdp?=
 =?utf-8?B?ajRxcmdFQUVXYm5WOFpLVHorNnhpTytuRnJOd1RpMTV5MldMZWRTY1F3UXBs?=
 =?utf-8?B?RTNicFpnNVdMSUdnQXJ2KytIMTRXR0RETjFDdmhxeUZtVUZuMXRLOEkrZ0lm?=
 =?utf-8?B?ckx6T0ZXR05vOEppNGpzRzFxSXVicnVjY3pCTHZ3NE9WaldDb2ZBS214Wkhh?=
 =?utf-8?B?Nm1jNlFZdUJkUzVaZlhXNlBydkRmRG1vYVU2bjdZblRYSzR5ZEpaNUN3a0VK?=
 =?utf-8?B?c0FpSlB2akJjZFUybDUwUDhib1lneWhnT25XMFpQMzlwY254SFlrZHh6azZE?=
 =?utf-8?B?c0tkdFBwNk9YenpYS2p0dWNjQy9NclM2VDVwa1NOU21ySGJYOEllN1VFTTZP?=
 =?utf-8?B?RTJlRHJjZ0NSVEdLNGVyYlZ1blFzbXZ6TVQ1eHdGbm5kUkNoYjlQcWI1Nk94?=
 =?utf-8?B?TlA1RFRxUG5VbndIZzJjZlZranBTU2xMeERCM1dKb3ViQnB5OStSMnZ3cHMv?=
 =?utf-8?B?ZlU3Qi9TcFp5UXpURHNWUUNXR0NqVXlkMWxUQ2YrU0tOdXltemxqbDRzc2s5?=
 =?utf-8?B?OG4xUWNVbEVxM2JUU01hK0lPaXJLZzh5Mkl6SGo4WDBKK0xMa3NiVzFKVTVu?=
 =?utf-8?B?eThtNCtrOU5TY0hzWDJMVUlvS3k5dkVXY3Jvc2pQQkhHSmdCVituWUw1VTUy?=
 =?utf-8?Q?vB28=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:35:39.4588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e1748c-03d0-4eeb-aa4b-08de4ee4b8f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273

Hi Harry,

On 05/01/2026 11:35, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> As MPU systems only have one secure state, we have to use secure EL2
> hypervisor timer for Xen in secure EL2.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


