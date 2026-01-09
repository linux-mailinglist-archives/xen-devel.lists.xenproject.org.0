Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CBD0A50C
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198742.1515566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCKq-0005Jj-E3; Fri, 09 Jan 2026 13:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198742.1515566; Fri, 09 Jan 2026 13:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCKq-0005HT-BO; Fri, 09 Jan 2026 13:15:24 +0000
Received: by outflank-mailman (input) for mailman id 1198742;
 Fri, 09 Jan 2026 13:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1veCKo-0005HM-F0
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:15:22 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6c6701-ed5d-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:15:19 +0100 (CET)
Received: from CH0PR04CA0059.namprd04.prod.outlook.com (2603:10b6:610:77::34)
 by LV2PR12MB6016.namprd12.prod.outlook.com (2603:10b6:408:14e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 13:15:15 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::29) by CH0PR04CA0059.outlook.office365.com
 (2603:10b6:610:77::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 13:15:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 13:15:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 07:15:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 07:15:14 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 05:15:13 -0800
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
X-Inumbo-ID: 3e6c6701-ed5d-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOhkKfafFbPjfUszG0sXbZ6gFNyaZZxA7hsP3CQvdhj3pOiI/0pHeo4M/Sv9+Pra0Bex4QkVTzDlsQQ+kN1sW6kJsFyr3LaTNPT9gZCkCQwnZ1mn+oqUP+izjuQRde5Uj3p6jh4asaIUpUDHgijKKi3Q2B/BkLA77OVlKH+qQjQIeMQuMLjd3PHzy0VmltPUkYhKEHxixpB7vZaaBLeSesrNRWgCXS5RAHIee2QtW76BAmIjFUsWpYtzi16esH+rEYSsibE6VP28YHKO0gtzFn60tDEz9nUWFYQrywpmKa4dC11s6S7C5glD0Lb1Fa1rKNgqTpFVAMPP/5a5kOunZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u4j0eVqzsyHEcdV/QAGnaH1kJdOdx0WpRzV6JBzlow=;
 b=JR/0GVADUbC/EXbZCOvdY+L1Slg357sChpHkQO9Q9bPi8SW9cqRlBIsq81UoD3vk/qdARt2VKNg/oKfXKJ/hKseVgwKh42myQf8R2Vlj9rLLrz6MGZWmX8Lsrv494wklKfKeEPBdr78iBDZWIu2Nz5muVxqL39LPSXiOIslsM5I26mP+U18sUhAHUICCV8FCSus53roUH/IGLlgHsYXNswLl3M7HYhEznva6+b7Z/BB/a0n4lnmeuyiJ0dFCfODGiJ05ISQ10PFnkQRzQwINNJDe5I5r/IgGRAckxPEAwc0itAAAmuPeajWeofezhDKEs5wxvRKSBRmmwO0WLtyVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u4j0eVqzsyHEcdV/QAGnaH1kJdOdx0WpRzV6JBzlow=;
 b=uLkO6bDqFAm+9xAWnNv9NQ4ij+yVbiQfgpFxnw0/qZyiirUdgJD4sP6x+xTtmhG2ep6p4zomTpoYxB9I2fH3Rz1wHgSSFZvC8kSkHAjDeRG6uJ4QXxt/WjkZbJ0qkMA9K6V0t8YHkEKCE1+1ICAtQ1CAVGCVaGIBCAwNUA8ILbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <ef8e0260-28f5-4226-8a0a-84ab30d05fdd@amd.com>
Date: Fri, 9 Jan 2026 14:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
 <1d7f2183bd01df92445bf37ddc9d41f8bfa0ccdb.1767803084.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1d7f2183bd01df92445bf37ddc9d41f8bfa0ccdb.1767803084.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|LV2PR12MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 837d2a5e-3ba2-46fa-b850-08de4f8120e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3BUUnNxL1U1Q0ZTVGozejVrbEFBalExZjNiY2VGS1RibnhYSEo1M2VpZ2RY?=
 =?utf-8?B?N2MzWjZ4M1dFUEZTZzJpZWR5Y1g4VmxQRlNaa3dQVHc1OWN6RXRsYld5ZHRr?=
 =?utf-8?B?dHd2TXZjdENsR2VPSEVEK0xiNzBzSjhWYkVwNEx6R0MrUGZ2dGhZUUNSK1lw?=
 =?utf-8?B?RUdIRm9DRkFHM3BXWmJUajZQTDUzdE9RbUVWdk53Sjh0MG9DSngwTGc0Ti80?=
 =?utf-8?B?UmtMNWd5WkIxTHRGUnh3UHNjZ01wakJMblN6R2JsRlhjUHlqZ0s3TXE2M3Ns?=
 =?utf-8?B?UGc4ZlNyUmVOaXlvQWQ4dXVUUHRWRCs5cjdCUnVBb2EvN2hEZG4rbWIyUDZJ?=
 =?utf-8?B?SHVnR0k2Z3l1UUNJajRLYmZhZmMzb2x5ZXBHMTVhdXpRRGJuenREbWw1WXVS?=
 =?utf-8?B?MzVIN0ZyYlk3REJEdnRpeHhjUGNFV2Qvc3Q5eVAzcjZJMEFqSVFja1Q1S25s?=
 =?utf-8?B?dk5KeE5FTVpzZTlNSTJtSllMV01BYWM5Tm1YQzZhRjNIUm5zZ1oxS1pKVlJP?=
 =?utf-8?B?SnltUzduZXYrZWgvY3VqQlRJUjJYaGtyRnJwV3hLMmd0RU9VT3FJZlZMaUFs?=
 =?utf-8?B?ai8zSzRPY0pCTnh1WDV4M3d3dVEwRTRlbzd6VjJsUzY0ZWJ6MDk3aUpRSERh?=
 =?utf-8?B?cXkzQWFteDd0WDBMWlM4WmlWNnVyWHdwc0l2U3dlRTRjemNXRXEvZVpVZUU5?=
 =?utf-8?B?NnJ2aDdRSGRGbWRxQVVWa3NpUEJMTU13WlRrS0E5NUVqYys2aTdZN0VKMVNU?=
 =?utf-8?B?c3hYSWxsSDE2MU0vZEJFNVBEek5hMjkwNURja2UyTVZBdE9ObjRnWkt0M3NF?=
 =?utf-8?B?Nzl1ZmJRL3ZsNEZJVERndFlxNmdSMW5WZU9vTllDL3plR2YxQ1NZSzRVa0g3?=
 =?utf-8?B?Rmk1NVhkYU9KZFdyUG5mRWZFS3ZVbnJNRkdjYk1jSVpmSDJkNTEwRis5bWUw?=
 =?utf-8?B?TTBTVEFYcUNha2VEdk5wQy9DZmdIc3I1T2lxL0dWdExVSTNpT0MrTm40a2xy?=
 =?utf-8?B?SnlER0IvOHFBSldseWFwYjVpV0krZU5saWRlYmo4TkpjSWZWTGxnb0lLbGh6?=
 =?utf-8?B?M0REemtsMHM3L2NvQ1RsdDd5ZmdQRHJMUDd5NGhHUng5Y0M0TUxaOVI3MFJq?=
 =?utf-8?B?MnFJS0puZFZENlBqUHpuMDEzMW9JaEF4TXRZYng1RG5hZ3FPZmpOaUVGUzFV?=
 =?utf-8?B?L1hQOEhKYlloQmVuaHErVXo1QVFrVjFZQmVsZE1yT2o3a1Z2dDUvTkZldElD?=
 =?utf-8?B?V2V3VmliamlQK3pTN3JvWkYxUEQ5OHA1aHdvZXlHSElWUUZJTmN2Y1BlWXZ3?=
 =?utf-8?B?QmxiNkVjUktjTEJjN3o5dGRNUFJ1YUdkL0hsTGs0M3hmSXVxdEpDQS9XSWN0?=
 =?utf-8?B?WTVNa0RrRC84VldjTkdDZ2hxUG1hMEcrZ1A4ZGhMMFhmMi94bEpSN0d4WnpP?=
 =?utf-8?B?NFQ4ajM0VS81YjlKMDBHSWtyUERWMEE0YkIrTitWWWRNcVhoQVBXS3FwVlM3?=
 =?utf-8?B?c21Ra2hORXhEUkpyT3pSRXhCblZqWG0xMG53UHhRcksvOEx1aHRrT3AxNEp6?=
 =?utf-8?B?OHhvMXBPc0NSQkRZUlpheWFIRCttOEoyQVVoQUZIUlBTZ3E3eS9oUXVId2ts?=
 =?utf-8?B?YlBUMWNkc3pSOTkyT2N2TUQxcUlNQXFYWFlmUnA2RFNhVS9DY2UwL2RuVmdU?=
 =?utf-8?B?UGt1OTVZZUFCZnFlejJzS0RTVG9kbGdoZGpzdFF2aURISDcvSXd6ekFQbjkv?=
 =?utf-8?B?bHNDOUZkS2FHMEwrcEVwckpEQS9zNjg3R2VReUZtNlZYVGxXTHJTa051NFZi?=
 =?utf-8?B?eS9FNE5rZVUxOFQ2U2FGRXE3MGoxcTl5TGtzMkpGcVdYUWxnUVlUSkNNK1Zr?=
 =?utf-8?B?MWExNER0MmJ5T0hocFhEZVFSSm9hM0c2SmMyRTEzajdSRnI5dkx1a3FXNWE4?=
 =?utf-8?B?NDFBVG1sZm5sZ0JWYWI4SFovYXNVaUhud1BCa3UvR3VvYVNRbktyaEhzVDNs?=
 =?utf-8?B?K1I0U0w2UWRNZ2VhY0dyZkttM2VNTndnOFJlRkx5L1Bwa0ZicVBxT2RLNE4w?=
 =?utf-8?B?eXpPTTYvKzdBZDlKejhlaEJjZkV2eitMZXNyeFpuc0FDanJzV05UV25reld6?=
 =?utf-8?Q?oax8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:15:15.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 837d2a5e-3ba2-46fa-b850-08de4f8120e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6016



On 07/01/2026 17:28, Oleksii Kurochko wrote:
> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
> exceeds one page, which requires allocating two pages and led to the
> introduction of MAX_PAGES_PER_VCPU.
> 
> To remove the need for MAX_PAGES_PER_VCPU, the vgic member of NEW_VGIC's
> struct vgic_cpu member private_irqs is changed to a pointer to struct
> vgic_irq.
> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes
> in the case when CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y, compared to 3840
> bytes (without these changes and with CONFIG_ARM_64=y) and 4736 bytes
> (without these changes and with both CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y).
> Note that all numbers are based on defconfig with the mentioned options
> enabled or disabled as specified.
> 
> Since the private_irqs member is now a pointer, vcpu_vgic_init() and
> vcpu_vgic_free() are updated to allocate and free private_irqs instance.
> 
> As struct vcpu now fits into one page, drop MAX_PAGES_PER_VCPU.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Michal gave his:
>   Acked-by: Michal Orzel <michal.orzel@amd.com>
> But wrote to MAX_PAGES_PER_VCPU in this patch, so probably he would
> like to look at how it was done.
Looks ok, you can retain the tag.

~MichaL


