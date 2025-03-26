Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C5A71A1A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927988.1330750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSaP-0005Pg-9Q; Wed, 26 Mar 2025 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927988.1330750; Wed, 26 Mar 2025 15:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txSaP-0005OB-6I; Wed, 26 Mar 2025 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 927988;
 Wed, 26 Mar 2025 15:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=weB+=WN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1txSaN-0005O2-9c
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:22:31 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2408::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20344842-0a56-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 16:22:28 +0100 (CET)
Received: from BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 15:22:25 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::61) by BN9PR03CA0954.outlook.office365.com
 (2603:10b6:408:108::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Wed,
 26 Mar 2025 15:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 15:22:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 10:22:23 -0500
Received: from [172.17.183.194] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Mar 2025 10:22:22 -0500
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
X-Inumbo-ID: 20344842-0a56-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKENBsX9FN22O4oemm/KyMPJGB5rcHcGL5Zskhde3KzZhzZtRznitqOOQP1CfuqmFh37NDPitaBx9I/xe+Y3aujklv7b0HpQhdyPZS81SKuBIf5zbqBZv9Qa7kq8oB3RJiiCTyvzQeG9dAfwTbkj18EHZl645gNaTPfUp5+5IhK1wnKpqVnBjdNHTU0z3ZYCwMgiR4dadkjiX8MgaI08OG0jW9L1Ipfy4w+WvncOoHM9H/5uwtxeY3WVat7r9WinQ9LxnUedWnxWN8Ko3amE0RHVuwy7KyPzs10Ouk3CxLN5ukSCIcOU5WeYE7klbtiegmN/td/NMApUBU9KutozxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HcFrx0oZtkP19/8w9pYXkXqsDdtxO9sm4MWHkXrNpo=;
 b=H0+WgEBCHckd0+v4uZpyUZligVqpGtasW7HJ8xWoVk4GOGLHuQnK1xi20snw6KjX73wF1vGbO+0rrULzBY+bNRcsxHMKk23McluBzIhHpRsAt/42EfsM/davUj3o4lSWSkKbJ6/Eczzx050PvgDyDnsCoqm18Hy8X0NN4GNJ46oa+dSNE+BaC/Yt4ezBqGMBmb1di1KPIYqb+6L5n284KgiRP08gC9t5h46Am53Q6eshpuJ6kD2pv9M+tgLl0qvjLOoIBbsYSZT5Db6N4AQY77Wtlx363rDzOLPA8lHjC/t7mQ9jkIQhWniUrk4VK3Dpgkfubz7vWIKSik7lqG5zJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HcFrx0oZtkP19/8w9pYXkXqsDdtxO9sm4MWHkXrNpo=;
 b=aHJa96G/hWZAmtEbnzbieGJ/V6xxfPws5O+PJDxohqkqGiPZdUdCmudoDqakOKfFZ2XLrZP3A7TViLDNUvk0BSgYWFo0FTDDHqEW08ZJm89MUv5MQrh71enrI/PuBK9nJRLsl7wsli8ZFONgNCrCdxGQwDJn13It5l/NQRHHxfo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b553b51d-179c-4999-8632-6d78474affc2@amd.com>
Date: Wed, 26 Mar 2025 11:22:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/19] xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-14-Penny.Zheng@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250326055053.3313146-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: cca5f992-7714-443f-3d7e-08dd6c7a02e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjVaTkpSZEZtWHNlbEtsVmdTWnErcnZRd2xuUUZMdVpvMzR2U29GRk1BNm1i?=
 =?utf-8?B?RVVpaWlLWXZYdmlsMDM1aFVnampOTnowZ29RZzVBNUhWRlhRakg3SjlhYW5M?=
 =?utf-8?B?UDJzTmpISklldjVNUWZtNTVyMXoyREZnV3NEUVpFY1NnK0VmM1U2dE9NU2Ja?=
 =?utf-8?B?ZUI3QXRWVUVzdjVJZjdYSGk2QlcvVWUveDlGdVI3RmZTMEhsMU5yZXBDWldH?=
 =?utf-8?B?NE9LUnhSZ3dKbElyTHR3ck4veCttNndjZkFJMk91RkZ0UW1MUzBGcWdxL0dn?=
 =?utf-8?B?L3JjcVRUN3IyMDk1bjhydzJteUs0WjdSUUNjbWYxbmpIMkllckcwZUFaUzh4?=
 =?utf-8?B?bWx0ZUNoajZtSEI0eW9IVENIMmdLVjlkY2p1Q1FpNVJNRHZZWTJ3S1Nzc0M3?=
 =?utf-8?B?RGdNRXJ4WHJ3Z1pLbG5qL0thVEU2ZTZWVzdGNnNXa2lEOXh5WENIS0ppUkhh?=
 =?utf-8?B?SXg5OW5aMGNpZHQ0R2lVYkovZEJUUHpMWkllckpuK1RXZEZwY1pyZ3VRYm9H?=
 =?utf-8?B?NzcxREtRcTY1MnI4WGltMkNWckRUYmVjSzBmWW8xZVRNMFh1ajZpVW16YXo1?=
 =?utf-8?B?QWJmNmlySDFOM0pkdkw0cU9mZkxyditpKzhKeGpyUkFNUCtOdXl2RXlMUGNC?=
 =?utf-8?B?NDVpc084cGxoemhGeFFZd1pZSDJ5OWxvc09oZzNMQ3ltOTg1YytNTEdkcm51?=
 =?utf-8?B?VEd4MHFGdHMzZGVkbUY2RkY0OS9Qdk1BY0FRNy9CdEJLZzV5MnNSRDZCOE9Z?=
 =?utf-8?B?UlVoalZ3UVRpdDhjOWUxd3ZRemhkd2NYRkYvUE1jTjN1OVdRd2V1N21TUUhY?=
 =?utf-8?B?MkdCU2dmMlQyMlFNLzhsREt3bXlXM3hBeFFlNFNEcDQvS05jZmtSWmJYMGd5?=
 =?utf-8?B?TUV0dTdHUndtak5HNkx3K0JFUS9IdmxvZ0huRnJwak15Zkx5OFIvSmFiY1A3?=
 =?utf-8?B?ZGx3bnV2MzV6a0ozekZJRSt1WmdWZnhMb0NWUjk5cldkL2grRHBKRzdDNUV0?=
 =?utf-8?B?bUZnaWg3MmxFUmNYekpOQkhnbS9EVjEyNmlBenBTZ2ZITlNqZWZVL0hLTGpR?=
 =?utf-8?B?U0V0b1ltaTZRdytUNndMNTNvUWI2NXd4cXY4aVVZbWpFSjNUMG8zbHRSV08v?=
 =?utf-8?B?VnZrSUZTMmNKNHVHVEJlek9BZ2RjSWswTnIwUnlpNVp2MkRqdnlFTHdMV0ZQ?=
 =?utf-8?B?ZmVsUzJqanJKZHdKTWZROHlDSGtjejV6UVV6QytsMTU0aDB4VThSTEd2VUVa?=
 =?utf-8?B?TnpSOVk3UERBUDVyOStSSUpKY3JIZ0NmWnVWQS8yUkg5R05NVGkvaXJzSVJK?=
 =?utf-8?B?bkNSa1N5b0RnNHYrVnVmZmFmeFJpMEcwczRlcWp4Wk44WUs0K1RvOUkwSDVR?=
 =?utf-8?B?MlE0VnI2aUQ5MEo0Y3g3S3FPQWpsWHJUcTBlTHJBUjlkZEtvampWOFdoclkz?=
 =?utf-8?B?dnExYzBSQ0tLbXVKTHV1ZlFlUXRtbWRrWGJaaDVQbXFBdWc0UnRIYWl1Qnla?=
 =?utf-8?B?VS9ma2lKUnF0Q2Z6QmFvODEvMVY3Mi9OanhiV09RUlVEaXdQUGNnV3plNzJK?=
 =?utf-8?B?WkN6cjBLcDUzOFcwbWtVVVNBalk5RmU2eGx6bDR2V2ZjL0RoVXNEdzlTQmda?=
 =?utf-8?B?SkhLZXA1RHFjRGp2dS9pdDY1WU1NZHE3NEpkUkZ2bFgzN1Via1p6eFNGVXpX?=
 =?utf-8?B?WThWbU9Ra0srcDI0cEdzcEZlRUtxczRZMTJJY1N3V01hWnVVUXRwdFpaa0tp?=
 =?utf-8?B?VVhvOVArWGFPbENuTXFQeFJ3bXJHREdudEZtaXMrZkxLdkFrNjR0WlBHbUkr?=
 =?utf-8?B?OUl2Z1IzZEVvU3IydXIyd2ZrbXE4S3NtaFhIc01nRW5SSFc0ZWc5U1ZQSFRD?=
 =?utf-8?B?a1VLV2U4U3dPMTVGSFJYYmEwRXBackE5TDVtT2w5cXZ5YndENTRwS3JaOVVW?=
 =?utf-8?B?K1dHbzZoZHdnN2w4VXlQOVg1V3BqMkxGSEFQSDlrVm1OdjlHWG4xK09uRVo0?=
 =?utf-8?B?eEtMbmorVlN0K3JDSndJbjlIOU5xb1ZmWUVqb0VWNFlWdFB3VGlUcU00dGxu?=
 =?utf-8?Q?Gc9tq3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:22:24.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca5f992-7714-443f-3d7e-08dd6c7a02e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314

On 3/26/25 01:50, Penny Zheng wrote:
> Function sched_adjust_global is designed for XEN_SYSCTL_scheduler_op, so
> itself and its calling flow, like .adjust_global, shall all be wrapped.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

For arinc653 only:
Acked-by: Stewart Hildebrand <stewart@stew.dk> #a653

