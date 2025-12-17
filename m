Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A8CC9629
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 20:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189111.1510054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVwxU-0006wv-1C; Wed, 17 Dec 2025 19:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189111.1510054; Wed, 17 Dec 2025 19:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVwxT-0006vP-Ud; Wed, 17 Dec 2025 19:13:11 +0000
Received: by outflank-mailman (input) for mailman id 1189111;
 Wed, 17 Dec 2025 19:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upHg=6X=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vVwxS-0006vJ-Uw
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 19:13:11 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb4afd6-db7c-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 20:13:08 +0100 (CET)
Received: from BYAPR02CA0017.namprd02.prod.outlook.com (2603:10b6:a02:ee::30)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 19:13:03 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::6) by BYAPR02CA0017.outlook.office365.com
 (2603:10b6:a02:ee::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 19:13:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 19:13:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:13:02 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:13:02 -0600
Received: from [172.30.197.162] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 11:13:02 -0800
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
X-Inumbo-ID: 6bb4afd6-db7c-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpHYu2CP47hyQ/e9Lv83gFLLJwIyG8Lpf3wLuFKvjHDlH3ddMT0ldgncj/dNXuLLxD4J4i0LByaboMg3DWokNmdzM7Ucvzl1KtUB5tQ9/kAKkzm3cPYROcJxja1klwL6qadytBAuDoOyq8HnSeLz+2HOSn4lm70QbkIliRB5HphKbbLYRO3omWXpf70KbPlxLO64ys7NWfs13ztHEmvLwFXpRsrHJTxdahAm8tJbPrSj2xhAzB4MIv0B9L31Qz6hcVJY1mkxBjiRf814+coLquVWpb6RS3EfWFrHk9pHjqoAFJlBLZb2o+ow1Snx9+vEWKuk0cCwEADuW+0gujOZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93Pg54C/Zq8Vgoxm6nxTM7ENl42znJcO3e1OP/RpM2A=;
 b=hXnIrjnnL/uISMb/ssy4pc6NCZjcJRocwbdIGMuCnEEdz7OcwYvBPUAXGYIZawjfETcz1Zf9gHq5UqDVbU8blFHM5/UqkSWbkgLcOVetIfB7bUmuYvNxAOTNDHjIYL9XQ9kUxqeKAGYORc5Jdo4iMhC15KwUBzdZjHkec/YObNEG9f29vsapizskFU7ZgMOZ2sXzi3dt0arr7yDnqrwPLNPxkA6h4R0XV6HHHHcROFnMLf9aPJtObrJfDSR7Wj+lYG/ZJEWC3z0hWmJai92T/kouT1i4i3VaZe6fpC+SzirBtaFN4C2ek1JHUZuDcz4JA6TDUDSYY+ewJQbyrJEdHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93Pg54C/Zq8Vgoxm6nxTM7ENl42znJcO3e1OP/RpM2A=;
 b=cjfeJztoGyCRklG1ze2AhkFfoQ6QX3aatlkXygzqYZThaealXbhCXjNLhse8wTOcfdziVTgTpS92pzAmfIjTBrAHST+ZEY1uQTq1XBmg5paQ2tI5+uxJ27aBLs6rPujm1gzQRYRA9uN+1Y3ZVQcsSJbR3RJLij5O+uO0Za2N/+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9484bc26-35a9-4b5b-9563-762a06d88018@amd.com>
Date: Wed, 17 Dec 2025 14:12:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools/xl: Fix when config "cpus" is set, but "vcpus"
 is missing
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20251217172634.47487-1-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251217172634.47487-1-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2120e7c3-e1e7-4f67-611f-08de3da04cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDdKUTNtdkw5YmM4T0N1dlZMZ3BqeHFOaWhOM0h5Z2Z5MURPeU9BT25EUHhT?=
 =?utf-8?B?bEVSR3JFVUd0YVZtVGVaejNXajFKMHJzSjFRVmd5cG9DQW1OaVpacEU3cmJL?=
 =?utf-8?B?Y0FKKzZnNzh1VGU2dFBuVy9RdzlZN1ZvRjJBVktrTUYwMVZIdWVqeWRHb2dv?=
 =?utf-8?B?SnlXcmNlSXZQb1pLZ242WXhrRUxScDhNWWU0TE9CWDhFbEUwc2hwRGI0RlhN?=
 =?utf-8?B?czlxT2xiakFhMDd4Vy9aVkFoWlJ2ZmFUWFlFTmpMMW5HeW1NZmNOYk1Vc1ls?=
 =?utf-8?B?bEVqZ1Bvd0RDektKd1NFNlN6ZUxva0JoVWNiaWxFeXpCWEUyMmI3R0diRlRa?=
 =?utf-8?B?UlNoVS9qVyttcUlweTZBV2FqRVNZbGozSWE0YWJtMFFHMUprR2FXVTVTTXVx?=
 =?utf-8?B?RWYvOE9odlI4MWNGOGhKaE9qcWprdWFBNkdWMkVqK1lOZnBFTG1lN1dRRnhq?=
 =?utf-8?B?WTd2dFQrQi9PMFNpOWtLZFdlUUpxYldtOXBqVkJqZStWZFRaSlFnSEVtaEh2?=
 =?utf-8?B?eHdEYVNxeU1EWHB5UEZJWG1RTUhSM3VHTEgwcEY3ZG5ucllqeHpRcnB6ZFNt?=
 =?utf-8?B?NmRSdjZvRURzZ0MzaXZ0YjkvQ1lvODExR0IzUmZWN0VVOXgydEVramo3bm1z?=
 =?utf-8?B?cWdTd2QzWFhDbTcvU1M3UXZkNkFjb0RBME1sUzJ0WGdVVE1rcmpnKzZDWlhx?=
 =?utf-8?B?dXIrb0V3ZDVBNlhXZHdpWHFDbVp0QjNNV1dWdkk4UDhGR1cxc1VwYnIyR2Vv?=
 =?utf-8?B?b2xSU2JzVUFWT3JzSjVzWGlaRWc2ZmJoY281OHhZWHFtVlJFZ0RUdC9uU2tu?=
 =?utf-8?B?KzlTU0x5Nk5EWnVhZEhVK2R4bzlQcnNKVWVRKzRmU0JvYlpYdkkxWWhHZ1FQ?=
 =?utf-8?B?ZC9hemxpSksxOUNvb0xzWnhBY3JHZkhRNXRadWsxdmpzN0tnTFVBRDVzanRk?=
 =?utf-8?B?UHQvQzdQMW1RTWkyQWZzdzlManJSenpaNFZQVjJOV3hPYXZaSXl4UHpRYStv?=
 =?utf-8?B?azRQKzZQNDkyS1V6VXhURHJZeFM4OE5DQ0ZuSWFOcDJoSmNCQ3ZzVGUvOHM1?=
 =?utf-8?B?WVcvaWNnMXlreEZvQzdGRkdmaE9JVVkydUV1dnl5UjdURDU2bjB1ZHR5cHVF?=
 =?utf-8?B?VEV4bk04c09lcFFsMlNMb3B6WUJlOVQwRTIwSWRQOE41RGhUa0twalk4ZklD?=
 =?utf-8?B?OER5NlF1OTVaUVR1emJtVnBTMDJoYmZRNnJ5QjA3U2pjN0dQbkplbGNkUDF6?=
 =?utf-8?B?N3E1bnVnMFFvVzk4eVM3eHFybUVrMGlvUEN3SG94ZHlrVCtoRDM0VjlmNEhi?=
 =?utf-8?B?TEZLVlE2RVZiU1RMZXJwckRURFBkNDlnUHRQOUl2Q0N4UStJdmxjUnllOWhZ?=
 =?utf-8?B?L2pXN1NFYzNXQ0thOG52NUVkZ3dqb1NaYXU3dUtWZitEeEk4UDNyR1UxdS93?=
 =?utf-8?B?RTNOR1ptOHQzM29QWVY1cmdKcDV4WWpDUURBNzE2aUhtUVBmY1oyd1VqWGdC?=
 =?utf-8?B?aThpOEpvNkJJRzJvNENhWU4zeStNODFPaWhjWG85dTR1MStuVHRXbkkzbGZm?=
 =?utf-8?B?ZkZwaStHV0VzcU1iaE91dnB0KzJmNUdaUWpkT3FDd3ltaUJEa3lwR2I3YXYx?=
 =?utf-8?B?V1IxUUtxLzE4V0l5bmNKSlF0VlJEUU1LOXlFL0VVdkdWOE0wQXNQYTUwS0Zh?=
 =?utf-8?B?bzZTT2pZY04wZ1U5S0gvNGJTUHdNZktYcWp3ZXByRmNScG1mRkR1eDFqbVg3?=
 =?utf-8?B?bGNtd09QdHp6Q0pkeitZdUVFYWlVbDFTVVN0eXg4Q3drMHo4akhoWnZ3UTVG?=
 =?utf-8?B?K0theDh1ZDFuZDErdG5CckpFNGJnakVuR0x1Tk5yM0VrSG51LzdQTDZzZTg0?=
 =?utf-8?B?d2dBUzBhVU13b3VWZ29RU0tTRkFPazdoTkp2a09sWStqRk5wa1A4b1pRd20x?=
 =?utf-8?B?dUVMZTFuNFl6c0I1R1hlNG1MM2R3eGxQUFF5aHhtcmFnMXNNSDJOR2dBREJL?=
 =?utf-8?B?NUVUQkZwa2UrU3FLb2NYbmNWVHdtYnJxaXEvc2R5dFdZcHRTWFk4dVcvaWtE?=
 =?utf-8?B?RjBiZTloN3MwWnViTWhrazVKa2ZPQUF2dDRSRk5INmRIbkNMM05icFVrTWpv?=
 =?utf-8?Q?VDMU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 19:13:02.7044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2120e7c3-e1e7-4f67-611f-08de3da04cf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904

On 2025-12-17 12:26, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> If we start a guest with 'cpus="all"' and without 'vcpus' or
> 'maxvcpus' (or sets them to 0), we execute parse_vcpu_affinity() with
> `num_cpus=0`. This malloc "b_info->vcpu_hard_affinity" with a buffer
> of size 0, which is implementation defined, and we still initialise
> the "first" bitmap of this allocation, which mean we have a buffer
> overflow.
> 
> On Alpine Linux, this result in a segv when the buffer is being
> disposed of.
> 
> Since libxl will assume there's at least 1 vcpu, we default to 1 in
> xl as well. (libxl sets max_vcpus to 1 if unset, and allocate
> avail_vcpus if its size is 0.)
> 
> Link: https://gitlab.alpinelinux.org/alpine/aports/-/issues/17809
> Fixes: a5dbdcf6743a ("libxl/xl: push VCPU affinity pinning down to libxl")
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

