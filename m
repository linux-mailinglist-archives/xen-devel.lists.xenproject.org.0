Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91CB287E2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084142.1443577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un2AG-0002KY-TH; Fri, 15 Aug 2025 21:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084142.1443577; Fri, 15 Aug 2025 21:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un2AG-0002Jf-PS; Fri, 15 Aug 2025 21:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1084142;
 Fri, 15 Aug 2025 21:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un26Z-0005Bt-Mv
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2412::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f35b78c0-7a1f-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 23:36:49 +0200 (CEST)
Received: from BN8PR15CA0044.namprd15.prod.outlook.com (2603:10b6:408:80::21)
 by CH1PR12MB9694.namprd12.prod.outlook.com (2603:10b6:610:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:36:44 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:80:cafe::f) by BN8PR15CA0044.outlook.office365.com
 (2603:10b6:408:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 21:36:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.0 via Frontend Transport; Fri, 15 Aug 2025 21:36:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:36:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:36:43 -0700
Received: from [172.23.255.54] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:36:42 -0500
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
X-Inumbo-ID: f35b78c0-7a1f-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZPDV7AlRw8JJfPyDabV9Rz1Zyzy4g/7qEG3PoZdiYs0fUsCtksORk2Ns4A8Z6kh5/WRDbWc3M96rtn25EUFDRl0GY0sKksBF3up/JJqK4B3XLPreEnT/rDG2+gpc8HRmrxvSrlNnms0BuIrVlfceX42wlhYg/FILY/l0pcAi2hy7JsjB0LksYsk25htl08qpEEi2HWpQ5Ao64GDERRPotTpZDZBlVfpIpnIIbjMfwSWE07GRP8LwVjecye+Fa2LHMjcyl8wozQfjPOEb0sK/9NF261vSx/IUipoOmUtbpeelFYoR2Q77YX8pNwoSHKzEI0jK74dr11/RKxgsqIS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASkSUggCy20SnPNHIlAX2QNa1664ZTX5T6E9cv2J31c=;
 b=O7aDyxKJiqkvUn7CCVYCW8Vff5k5/6u6T+fsrOBFXqXCwLqH4jHYKzjRZCgcU8D53K2gS0eetAIu9HAr1oDxH4/O+VNsDOzRO5Uh2DQI1n8ufFdpm+J87V50nOxEICRwrHGSVzYpUssxYPJKAm1f1xEpEBvip9wganJ5fdSKA/iQkL0fRFJI3jTG8UlwLjyGsDc1T4gE11Gi/w2RbvzCR0QHb8DjlcTDHqmlF6I+bMQhH3UvDwP+z3kXXsa9LqL5dEgDncIvgyzcrJPCHs48ACMfK3os34frWcei/2TiIlxGGvgqCtYGBeA8Z/BLf9pG6mCi+kMvP621IG7IH3WMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASkSUggCy20SnPNHIlAX2QNa1664ZTX5T6E9cv2J31c=;
 b=PotvdN1dJQZ4/zKEYE+jPKKhd85N8gtuoLJDfv8rAJDot+5im078RlPXNSkUkZAnBixiIrqfLhYeQ7/MmH+xsYNWEOwW9gDx2T1zL5H/Y0ZETcFHpWyivTq6Hto6G+mClBuurZb2XwMrNo3Eo/M9KnPZuM4862BJ8YrnPy9JPtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f5bf8d33-7686-4a08-a8e4-09ec64522d55@amd.com>
Date: Fri, 15 Aug 2025 17:36:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen/xenbus: remove quirk for Xen 3.x
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20250815074052.13792-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250815074052.13792-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH1PR12MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c29260-3f89-44f3-2806-08dddc43d42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEdSdGRTUkg5TWM1M204bWxvOFFWT1hHZ2tsbnIvVDZJUFFtMDZDMnpkNkNp?=
 =?utf-8?B?T05jUVdaR3RFOGY4V29vc2w2YWJGdExCVnpnZTRMODRFL0k0NVNKR2luL3Rz?=
 =?utf-8?B?bEhhK1ZlU3NwVDZXZ1oyenNwNzJFK2QwckNkYWtTUldVUG91REk0cGsxMHl5?=
 =?utf-8?B?SjU5WFF4WmRyVUZxbHVOVFJveHVsY1J1eTVyRlRHQUxQbVFiTE1XZkhtSmV6?=
 =?utf-8?B?M0IyVG1XM1M4TEg5ZEpYaUEvc3ZoT0ZmaVBuY3V2L0NobFoyMDhsRXdKMkdB?=
 =?utf-8?B?OGFmalhjRU9QeU9oTXFseGw5LzN6TGF6c0l0ek1qOVplSWE1anpMSVdIalBn?=
 =?utf-8?B?UDd3ZzhDMFZGUTU2ZHhDekRZRjd3T1VvZTFKdXA1enRoSU0vQ3dpTUNDUDQx?=
 =?utf-8?B?bVlOakxKTlhrNkZtZk5teEFQTkNvRXVvWUNuaGZTQkZCdkJKc3UrUEp3V1Ey?=
 =?utf-8?B?MURzeTUvaldvbGw0TDRJV2ZzOUJNMCtDMzMvQVhOc3NiNFR6MTNFZFlFMDli?=
 =?utf-8?B?dWFyd3FRL3RqZS9TbnNudGRROXMzS0NUWnRQcUd4Unphb3krRUhadHp3a25Q?=
 =?utf-8?B?RjhsWWtWL0pDWWVaU2tLVHdHVm9XZ2xRM3FtTVYxeFM5V09VcGluRlpnVkl6?=
 =?utf-8?B?VkNWTDI4aDBQZ3BCR0o4TVNlWGFqQjF3QTRVU2ZIZEVBcnBNQnlPY0lrWWlX?=
 =?utf-8?B?Z0h3YWlvZDd6T2RQREl0MVFSYXhBeDVaMXQ2b1ZiLy8wMkh0NW1TaXRIazlr?=
 =?utf-8?B?Y0p0L1dQVkk5d1lVZ1U0N3Z4TTViUXpYWWtNb2JobzQydEp3S1d5YnJ2Smt0?=
 =?utf-8?B?Z29yeWhxdGV6STAyaGQzU1ZSbHNLRmU1YmZiT2MvU1NLWlJ6RDdJZHR6RDdh?=
 =?utf-8?B?SVpML3diMWMrZWRVd2k5VWNFZlQ2Q0swMHQ5aFZRWXhLaElIY1dYellleVgz?=
 =?utf-8?B?VTRzR0I3Y0QrSGN5QmNvMlJibk52U1Y4d2lpTis2TTF2RUJidXg5KzVxNC9l?=
 =?utf-8?B?MGRQdUZ1RXdiOUhQR21hcUtTcjhUMDdyeWp3bGRUL1RyN24xZUwxQmpxUDdu?=
 =?utf-8?B?WXQ0SlhFQU44NmxmNlhPRmxnVWk4N2VvNitoSWpQK3pKczYxOE83bUpWRCtL?=
 =?utf-8?B?cS9qVWxHSm9oenJpZVZqRDZqRnpUZzJwUWtXOFM2UTRqWUVhVENzdVdnNnla?=
 =?utf-8?B?UE9FemJ3SWkvYVFXRjZIVzA4OFBKR1k3bVJXQmZDZWR5dlFKQnFaZzlNdDZo?=
 =?utf-8?B?cm92cFNGS0hDTG1BWFFVYjg5UjRNSzIydml6a3pPRzNhN0NxTWVyZ1d5d1JO?=
 =?utf-8?B?UFRmT3F4eXU1dWdzM3I3T2RROWVML3k5SlRLS0Jjdk5LT1dOeENITDByenRT?=
 =?utf-8?B?clFFOHQ3NUlvR3M4TG5aNXZ3ZktFTzhEa3EvclRpYkdGVHN1UXVQelBYdFhL?=
 =?utf-8?B?bmlCdU5HQTVNOXoybCttUnhKMHZZM2dqcUMyY3pMMDNVN2hwb2laSDlrWUdi?=
 =?utf-8?B?bEJieXdXbDBsbGc1Rk14N1p6cDl3MU1hengwSFR1ckY2QVQvSkVWOEw5Y0dS?=
 =?utf-8?B?T1lzbEI4MlduWFJsRno4Z1lESVcyUElSc1I4bWE0T1MvSm9EbG9jZHAzaUNt?=
 =?utf-8?B?SmpkeHloNnBNLytqZjJkZWU4MWQrT2M3NytqQ0JhUWYvbGtSZnJUK0JOMExw?=
 =?utf-8?B?bC94NjRXalhpTHBhTEFZblF5UmJ4ZEY2Y2cxK0ViWU5FRjBydzlxcVY1cjlM?=
 =?utf-8?B?UnIxdmJhZkw0bWtXQVNaNVdHbHlQaGVPVm0vcHl3cWlsSVhTY09IMzU3MXdn?=
 =?utf-8?B?d2Vad3pjMGFleXFJM0RWb2JXUk0vRzI5azUzblVXRUZrSXhjWlY5eGhEc2hZ?=
 =?utf-8?B?QkpwVHJsckVpN2Nydnd0OHh1M1NZNW41eE5UWVF3aW4wQldqSG5GamtIY1Rk?=
 =?utf-8?B?UFlyNlA4KzIrcmZWM2VVbWwvNW1YZFdEMC81Zmhhb2d2dkZ2dTJYSDdCczFC?=
 =?utf-8?B?eGhXODh2MFlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:36:43.6565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c29260-3f89-44f3-2806-08dddc43d42b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9694

On 2025-08-15 03:40, Juergen Gross wrote:
> The kernel is not supported to run as a Xen guest on Xen versions
> older than 4.0.
> 
> Remove xen_strict_xenbus_quirk() which is testing the Xen version to be
> at least 4.0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

