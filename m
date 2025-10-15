Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E234CBE046B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 20:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143950.1477522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96dl-0001Bv-4l; Wed, 15 Oct 2025 18:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143950.1477522; Wed, 15 Oct 2025 18:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96dl-000198-1u; Wed, 15 Oct 2025 18:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1143950;
 Wed, 15 Oct 2025 18:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v96dj-00018y-GQ
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 18:54:23 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c60c7f0-a9f8-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 20:54:21 +0200 (CEST)
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by CY5PR12MB6381.namprd12.prod.outlook.com (2603:10b6:930:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 18:54:15 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a6) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.5 via Frontend Transport; Wed,
 15 Oct 2025 18:54:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 18:54:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 11:53:48 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 11:53:47 -0700
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 11:53:47 -0700
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
X-Inumbo-ID: 5c60c7f0-a9f8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRj8Ro9nOJ0r4j/0zRazg1TEurZO2UvvJMDo6x5EXWEnZkLZKVaJstb1w33Ex8QfOyWgtNxGQfWN6l56s6CUsU5T+gRCtzZU+dmc/UebiepWzmdxdHZ0BL6qJs3zs6MrYk0Fxxy9dnOaH+n6eVp558DkFbOsiKbaruitQ+uAifm6VIp0l/yEw3btHU/wqifTIC0HoMPk5fyBXsevz//dhGbcq6H9BTUsNXxpDlazwJxURn/ca3VJMpvt+iqvLpBT9qA0iPSDHxEi1lYESsaC3m7dpG4iMo0ycQ72fYZTep0ARlvGp2DfUsWChWCSf5n6q28m2pZUkn07YnCoqv2qTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFKkKxJeSrAcxMUxHHrIcZmCjf+NXShrXJAO+vyBYcE=;
 b=tiKxj+wHc20X4gztjCJLx9xbes9LMIrQ2cgYfQYsIQUZD5EH0oWdCug/0oUwblurLrz+TK0fBBfwXbbS8WidOEMoGw394YbDhGOG/77vAbP/soXFjJfyFOKCi4/dBnPjkIY6NRV/4LKC0c0QJ9K5/ocAhTU/HHyRSZezpmG4uDdpdkveqEKRZBa7kpM6Ir4Z5BOu6KQKyqTKMK/WuP6hsL/4FCZ1ToDnu3g87k1JDGHZuMCNpwWIkeKc0sek9/dMDUMGbCGOjViZ00RuJwycEDhdbnrk0YQgxCzxco7Uad9E2Z5djWEuUmqWipWXQYTUEz7rtbXHvDi6WxvZ5xWfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFKkKxJeSrAcxMUxHHrIcZmCjf+NXShrXJAO+vyBYcE=;
 b=Q5pka4BAbZ32EOqRV7g3iYDEqrSUmDr5iOsOPYWsVXHO3lGJYWQTSCIKiUaWFCsjFKaJpHeM/3Vr6UoiFVkZ5pA5cIdIr6hD3ZYOi9MJhPf1CeoVTuIRwE+hOs4chGPLOvzHS28i9jbrFSgOzBldr1ZI0djv3OmfO3TP/YY983I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a84817a2-0201-4760-ad50-7e89b76e0c52@amd.com>
Date: Wed, 15 Oct 2025 14:53:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 6/6] github/coverity: switch to building with
 json-c instead of yajl
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-7-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251015134043.72316-7-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|CY5PR12MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fcf552-9821-4261-3e2e-08de0c1c3d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWFvRFpmbFZrZ3dGY0wwYjhNVSt5V0FBTWR2b1Y2ZktYdG9xNUt4UFlMNXY4?=
 =?utf-8?B?UmVSYTJPQk84a3hHZlhtYkNxN1FJeTBHWkxCRmZ4ZWlVbTgvMmJZaERmQWov?=
 =?utf-8?B?bDQyb3RpKzdMYVcrNmdHQVJwTFMzcjI4RXg1S01XQ0M1emxZVDBJZXIvU29M?=
 =?utf-8?B?T0JEKzZaR1lnY2VMVldHcHUyejJWVjd0dlgxQjc5Z1F4MFFaNkJtOXZqUEdJ?=
 =?utf-8?B?TklnOWJyUVEvS3lQdXZyWXE5MnNxSzQ3N2VBcVB4WkJwQVlCaW96VStmVStI?=
 =?utf-8?B?cDVYbUZLTXU4UCt2VnJYc2xHcE5RQWg2bGt3R1BubDRYb29DZFFva3cyTHUy?=
 =?utf-8?B?VEUxdTV3ZVZuUmdrcFpzR0xGa21ZRXJsek55ZTE1aTNvRGVxcnBFeFB5Q2dT?=
 =?utf-8?B?TXg1bERrRG1seUUwMTcrQnpOVGZzRzZjS3V0Z2I3SG5FKzZ5N0IrZ2l3TmFL?=
 =?utf-8?B?WHFvZG5SZUxqUjZmYmZybHNHZmZZK1ZuaGVsZkljbEY3aXB4T1FWU3VVdzQ3?=
 =?utf-8?B?M0xrZ1A5QXVOQ1hwM1Zzc0JiRUtiaDZwQUtWWnUzTnBlUjRsK3NPVHNlQ0JS?=
 =?utf-8?B?OWlYWUdPRVFucDAvOVovNCs0K2J5MVZWU1Z6UXVtcDF1VkVUbkpPK1FRVW5K?=
 =?utf-8?B?Ty9ySUY5emdiWjY4TzBRMDhVY3ZMa1IrT2xBc3Uxa3ZQT3NvejN3VUpSMkZj?=
 =?utf-8?B?WXZHRDJKSXVWSzQ5Qk41aVl4RFhRZ3o4VmN1d2ZNQ05JRTJidXBwamtJL2E4?=
 =?utf-8?B?Wi9iclp3V3h5ZWErOUhWa2VaRUdXbWNsS1FGb2Y1MWFWNi9qUlpMTE5valoy?=
 =?utf-8?B?a0ZUVzRYZWxmaDQ3UW1Td3FjVUF0dFloMlBuaExTbTZQQnU1R1JEdmZaUGp0?=
 =?utf-8?B?Yk9adDlYVEpVVytOUnlNL1Z0NjV1Mk0yQkFDbDl4KzhFeSt0SGhackswZXlU?=
 =?utf-8?B?YStDam1zWmFEMjJUMWtQM3VlS0N2OGd6Y0lybVdiaTRjenJCWnRVdzAyQlNK?=
 =?utf-8?B?c0d1Ujl3djlST0RRdW4rMGpyZ2QzaGdoMzA5eGtOUnQ4bnpZWlhXQi9HaGVL?=
 =?utf-8?B?RVpWZ1BuTld0MnhXYmlsQ0pVc2JGbXdLZ2Q0czFKckxnS05oeE12QnkwZzFQ?=
 =?utf-8?B?N3JJY2loNFRxRXowRyt6ZUFGM1lxdnRtd29RWHJBbEdteHFUWmIrWkJ6emxj?=
 =?utf-8?B?cS9pcE1LS3Q3VzBjeUV2SGxjUlJRS3QzYThwYUxaTWtRNC9BbzM1eEFUdFVh?=
 =?utf-8?B?VnBHYVNhSm5hWFBlSnV6YnFNNjNNOXBlUFlTVFpKdUJPSlMxaElXOWxoSDBF?=
 =?utf-8?B?aFhxTTZiRFJnbkgxZGw4bXpDeTd6dENIMDBkZnlpZDZmUUhqM3BKZFNtMWdD?=
 =?utf-8?B?K1YvSmJodzJUcjNyQkJvQnhjWFYrK0p0Rk9HNHF2azdrQlYvWnphcmNvKzBH?=
 =?utf-8?B?azZ1bWNDL2FoSWI2OVBrdGJTajRnMkVpSWhmT2M1OUpYdzZqM0Z4c1FQTm1G?=
 =?utf-8?B?ZnI5RmdZcjBxR3NoUS9tbzhUeDJ2ZXY2Mjg1U052YU5aeFN4T1F3SDkxZ1RV?=
 =?utf-8?B?eVdURnR5ZGQxWG8vTnVWTFZjSE51d21hUzh6K3piZ1VOVjN6SCtkQ2cvSWwy?=
 =?utf-8?B?YmFDR2lIZ0dvbDhIbHJjQ1gwbHYxYjRQZFZWdHl6a2kyMjdYMGE2N2pmczdm?=
 =?utf-8?B?OFQ4amhUemtWOFF5dFU1aVFvbVRhT0pDSWdDQ001OU13QUNEcC9OZm0zR0NZ?=
 =?utf-8?B?ZVRFdS83ZlFzOUlGUE9YMXduT3Mvd3FuS2dtVmtzRnBwVDNwNHE4dy9rRWRZ?=
 =?utf-8?B?aXhNeXVvMTg5STJIL3M4L1VQVE1pUjlpa3FZb2RVVGdPSml4cktuTFBoV2VJ?=
 =?utf-8?B?ZUJSVE1ENTFveUFYdkdDMnZ0cGNlVVJlT3NPYUJGcGpRTktpaFpERlE0UE9o?=
 =?utf-8?B?djhlNktYbG1zbVBsM0llQnp4NENVOEd5cFlSN3JvMVdxWGpmR3lrQ2RJNXFF?=
 =?utf-8?B?MStuNlM5ZzcvdTJ1VEZWMkNmZHZjTHo5UWVCeW9JWjRmUnJJbEJubDA5M1o4?=
 =?utf-8?B?dkpiWkhFTXNranJQaEkxMCtHMFJvZ3pwZVo1U1VLYnZCY0VGS21VMEdqSkJk?=
 =?utf-8?Q?Jk7M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:54:15.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fcf552-9821-4261-3e2e-08de0c1c3d14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6381

On 2025-10-15 09:40, Roger Pau Monne wrote:
> Switch the json library used by the Coverity runs.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

