Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF0CADC0A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180958.1504055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe77-0007M1-47; Mon, 08 Dec 2025 16:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180958.1504055; Mon, 08 Dec 2025 16:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe77-0007KN-1D; Mon, 08 Dec 2025 16:29:29 +0000
Received: by outflank-mailman (input) for mailman id 1180958;
 Mon, 08 Dec 2025 16:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vSe75-0007KF-EL
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:29:27 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f62561c-d453-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 17:29:25 +0100 (CET)
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 16:29:21 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::c) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 16:29:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 16:29:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 10:29:20 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 08:29:17 -0800
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
X-Inumbo-ID: 0f62561c-d453-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjclh8VP4+uYDPC/6rkIyY0z+dDjfZAmziBW/ednjWVwh3koXbam/8OtAXfimdIu4P5Yjz8Z2QkpI/t0ErZIaiqZc0s77Hd72UTtS5P5tWBAsWve6N4HBbGyea5xtbJnftaks7kdYU23lK4kTlWWbtVT/9tbT+v0wQ573xlNf+xyGgNqxraH8QlEp1z9frjNYRd9I5Xgf2MqZeg+BGl/PfG1/k2PygT4+kvHBc247jLgdyIVMJmvtBuk8akOySvMN6aWEhOuDMkBlTGuk37k16WcZOtJ8dAxJc7Hcn0XGnl3y60mdoFglS3JPW2urjEoTBvR3uAE1a+w9ZFhPx9Z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ez4eHZ3lhJQS4MeN+gO2lFxSdkxYehtXSkZmCMncJM=;
 b=ewLQhbdEzt/JV1q/0RPhMld6x1lTwVqM1BV5sM/bNxjx5dxoT3sqruQ/+optgaFW34Rr4hv5gdLxPr+PJxjvDXnMfyT72ygLdtYnHSJHFMP+QHFJLyzd6sYufgqLaS+nfjHRPh29YjIlWP29e3J/A/dEkAmfhRG6TQH3Qog/ftLjSE3N+CJF2t8fgmc26U6JnegKbjI/ssVo3cLHSE9svXgm+IohATlxAuQWUks07+YUPueunKcfyhpyKOVjB+4/mY2/+4tt4y7tHqv1TcQ8hpo5D0C4QZpl1RqMRkgomDv44p/VIBQ7UzHK/GUC5ESsiUY291JYq04zSoR+dDmxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ez4eHZ3lhJQS4MeN+gO2lFxSdkxYehtXSkZmCMncJM=;
 b=fU8EALd4dDzQkQ2lDol2oA+8daXztcIqFXwxyCHoiCQUboB++ZynVZM4qY/9N4SekQ+pI+gm7zAvwtIU/Csqxabi9Z2wRLC6ome9VpxWifLpBiYO1dpiIkkIdJ93u7HZiKJZE/ocT4iksn40Q3FgPjbjfUe97Eim6r4nkacwKm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <010a775a-995f-4612-830c-b51d50230aff@amd.com>
Date: Mon, 8 Dec 2025 17:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>
References: <be5ac1646fca57c2cc5838d367955bf849c4858c.1764584967.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <be5ac1646fca57c2cc5838d367955bf849c4858c.1764584967.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8ebef7-4e54-40c8-d82f-08de3676f0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0F0YWhRL29uajBzSllwSmw5Uzk5MHE5VXZ3ai8zbm8yVlJWdm5nUjBCdGlt?=
 =?utf-8?B?OUV2ZXlrM3dVbWxJbzFGWXlJdmZEL1hXOXN4NDBaUlZkVUkvUnc0NTg0YVZB?=
 =?utf-8?B?Wmp2T1ZVVittYTZpc04wRWQvNjVLZlZUWlpTcFlHOEw5L0JHUEYvRHJPdCta?=
 =?utf-8?B?RUpkTThaNnRjNFBEVDBZWVU5S1pJaDdLbE82bUFtOXR5VzZVNVJpVTBQOWJO?=
 =?utf-8?B?dWErQnBIVkVUUXVGUHNldm4rdnpIemlqQlg4dS9PSzFZR2svUnJuNHlFaWJY?=
 =?utf-8?B?N1VDdjd4dkIwWFFVV1dLS1FJQVhvNFFtQWQvNTRaWEROZmRwSnRqbjZMSWJw?=
 =?utf-8?B?Y2cxeWppTDBZRzFoRjRHZytnbXEvOENadmR6R3JkaWd5QWFycjlBd0N2MnJH?=
 =?utf-8?B?UTQvRUwveDFMdzlMdE9kKzNXM0ZNaExRRlF4RWkxSGYydWRISmxxVFk5bm1z?=
 =?utf-8?B?cnNxOXZvYlVqQUlLWVdIVG1wL3dZYXp6OGRoeXl6Wk5WKzRiMDVKRTNtL3N4?=
 =?utf-8?B?Y285OGlEckxiRE5ZMnQwQnlPZDk4d3dHcnMrZE8zazFIalQ1QlczMHRidm0w?=
 =?utf-8?B?Z3RzUEpWa1BUM1dXalRrLzlKU0JITG1GblRkZVVoMVY3UVhvVENLcjlMcGs0?=
 =?utf-8?B?NTBxRFM1aWpDVkExYlNNbzVqcUI1SGpUN3BqMzE3QUFFalR3VXlnQ0pUc1dK?=
 =?utf-8?B?ZGJEQng2bGtRakNoZzQycUNvUUxkaEpJOHpOWWFYSUtwTFJzWU1LTDJwK2kr?=
 =?utf-8?B?UU03ajBjdUV2T1VDYkZBVjlmQkFkNFBZNzJ3QmNFZzhncW9jWFhCb0JTbEY0?=
 =?utf-8?B?SEY1bzY3STgydGFnS3UxenNkNGdhOXNGZGFNN3EwT2x3d0ZXa0lnM0tvWDBZ?=
 =?utf-8?B?UUdjTFZrdnR3VUxsaTlaSFlPdnRFODJtbUl2Ry8wUk1nZU8zekozOW9DWnhl?=
 =?utf-8?B?dXkzdk96TTlwSUVPUkJNTFR0Q2FwM1ZPSFBlaDRCVDBvd3JMczBteWdQaXpr?=
 =?utf-8?B?MzZuTGVXN1VueFJzd016aU1ac3NiZkpoTHpYNzZBQ1dTa1AyV1NXSldkL2Nl?=
 =?utf-8?B?Y3piV1J0UEJYdWVMMHJNc2hXd0FqY1hnQzVETDNjcDJ3Q2h6THIxMjNXdDQx?=
 =?utf-8?B?NjJUS3dKRVBKNEJaZDR5VW54OHZ0cnc4YTIrTlBReFlsemF0cUY0SXc5NWtz?=
 =?utf-8?B?SDJ4bm9sTkdZMitURnZOdTh4aEJpc24yV2kxVnFTaWcxZnVGL0hrK3lBQWJL?=
 =?utf-8?B?RjVPOTNXeTdUYXpSNEV6UTdqTWw2aVNTR3REZFRDZzMxYkN6Tkt6dEp1bk1s?=
 =?utf-8?B?R3IzaWhNQVpyU1FqQkx4MmVnOFpkUHdpS0xaTDg3RFlIS1BoSGluamVvUmxG?=
 =?utf-8?B?L1VxMEJMM0JSMHp4ZEVySmxRK3N4YS8rcU5XN21YV1dHTlpOQ2szcjVPM2tB?=
 =?utf-8?B?TEVhcVU4OUVIYnhuQ1BJdFcvdG1JRElpb2NXbTBXTXpJTEZaaGRPakN5R3I0?=
 =?utf-8?B?VG1QdVIvOVhDQWdRWFh6QjFCWkxDUWkwMm9DN3ArTWlBT3I3WTBrRTIwZWd5?=
 =?utf-8?B?d1hWVWxqenV0R2g3Qkc3b3FqZU85RlBpaDJPNVhnVENmelNJRjdkUXNjRXVY?=
 =?utf-8?B?Q3VvbnhrVVJtSU9tZUF2ejhnQktjSjZST3Eyajh4SmVGcWpISGdvbW9mcm9X?=
 =?utf-8?B?ZzdOWEI2dXdrQm1KT2RtZjA2RGtpcE1SaWlVdVFaL003YzhLT2RLY2RCM2xx?=
 =?utf-8?B?dzhwWHUxZlhYTEFNK1dDVFhFWmhGMjVldmxQT0ZGcmRkR1dGbCs0VTM5cUFW?=
 =?utf-8?B?TXBTM0dUaXhtbnVoVHdQdG4vRXhIWHViallwODVHV09SODdkVXJwVjJoT0E4?=
 =?utf-8?B?SkduSmJOb01ZRjVSTW9WZjN6NDdPMyt0c01heGZCajRGQjIrMkE3eDVYNFNm?=
 =?utf-8?B?QVJvMUVKajAxNXZNNDNEa0Vud3B3aEJBTFdET1d4RUV4TWYzOXpQM21VamNZ?=
 =?utf-8?B?eWVqclduUzlRYXpVOEx2NHdvOHNEYlgweUpDTzlHY0JmT2hFNUZYeXFhdFJa?=
 =?utf-8?B?bWxvRnpERy8rbC9OMitFbExCalB1VDM4SjNSdjNIOEQrbGJSbTFuZTZKUDZz?=
 =?utf-8?Q?gyIw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 16:29:20.7777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8ebef7-4e54-40c8-d82f-08de3676f0e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099



On 02/12/2025 10:27, Oleksii Kurochko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Move x86's free_domain_struct() to common code since it is shared between
> architectures.
> 
> Move the x86 version of alloc_domain_struct() to common code as most of the
> logic is architecture-independent. To handle the remaining architectural
> differences, introduce arch_domain_struct_memflags() for x86-specific
> allocation requirements.
> 
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> [Introduce an arch-specific function instead of using a weak function]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


