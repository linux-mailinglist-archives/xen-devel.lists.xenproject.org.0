Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE0A6A879
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922181.1326097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGtI-0000QI-V2; Thu, 20 Mar 2025 14:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922181.1326097; Thu, 20 Mar 2025 14:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGtI-0000OP-SI; Thu, 20 Mar 2025 14:29:00 +0000
Received: by outflank-mailman (input) for mailman id 922181;
 Thu, 20 Mar 2025 14:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJiu=WH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tvGtH-0000Lp-MO
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:28:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f47a59-0597-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:28:56 +0100 (CET)
Received: from DS7PR03CA0099.namprd03.prod.outlook.com (2603:10b6:5:3b7::14)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 14:28:51 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::74) by DS7PR03CA0099.outlook.office365.com
 (2603:10b6:5:3b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 14:28:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 14:28:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 09:28:49 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Mar 2025 09:28:48 -0500
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
X-Inumbo-ID: a6f47a59-0597-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwPAO3ZqeLl03zrpEOEovTIxHhDZzQ6VUKacVfoEzX1Ex+cLzjBIXiMvqpou2fypQnBJ5k5Nbetx6FYelS995YsmPQq0qjCZuvw6BE5je+r/s6Vi4AD9J762wA/EnUaCGjrYFmS0gG0z8tDDPzGPh9nLiyd0gBHTLcUZ2k5uxxy46lXN46bX/FTfXohEhXvYhX5npVryY+BtG2Qnm+uwRA1ElfNU2VJ/piTAwHpbvMsSeuiTP/dJmGPI/KnYz0+F2a1mtL8Gn7ZYyTWlnp2nEjXRwkZGR4tPowkNPs9ORMZA4f5pugg2nMcjE5SxqgASQ4akLCHQrw9llgnpz+g9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un8giWv051B50ehq2Qqog9X1DpIqJ1bKk8Haauu/BsQ=;
 b=PbqUM04La5WFdx7a4O5rXcq7ecRo8Q8G2aCiDbz8zHjuoE7smSSuQkvJ07qD4aRJU+TERQ/lWqq0j1bjBhR+Ri5SYNGr2PAMQYXmHJq7ttx6e6xLiZEMm7qYi7g5oWDrsaPGMt8jijTuRMclOC4FSBltiJCUSTL5e7pEkhXN0IxKHzV+R4u0U4K4A00gORjfpUpew1uiQ2Nfu9y+9fanUawkm1w94l2yWApDIcB09dk+ZOS6FfXflwxYHiOy1G7U6q3BEy0EcfEdnra+MWk3b9z54rHy9GaCGS+ToK2GNB9Rd2C5fk6DTGV0/ojdmlKL5Q0sYJvARyJXCsMUjdinOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=un8giWv051B50ehq2Qqog9X1DpIqJ1bKk8Haauu/BsQ=;
 b=lfKJZvilgs5LkooB5JYhTjbB2zG/XgscVcgj7oOMQfEeru9vb6gCfvqy1k9JU9IX0yR++pjJfCyo/IfaNFKv7y8uI03YFZhWSTd2iQC4P2rSh8vFfBbpNcWXkKbd0pdDfYhj5DWybDdgEegkvApb+VRrvQV/huWra7nDwV9pwHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>
Date: Thu, 20 Mar 2025 10:28:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/2] 9pfs: add fstat file operation hook
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250320074924.8080-1-jgross@suse.com>
 <20250320074924.8080-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250320074924.8080-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: de6faf38-0a3a-4f00-d83f-08dd67bb88d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFVaY3NKUWxGRU4rNDhRUVg0V2tmVkxVd05TMFJTYkhMTDczTjFZWHI1aW82?=
 =?utf-8?B?dDJNazVGeUNMbHFFVk1KM3Y2NzVrVFg3VEowNyt5RmZPbUFuV2RBR29hcCtn?=
 =?utf-8?B?ait0Rk5YVEJaV3BVSG1BalJLSEIweVVBd3pxeDZCN29mNVU2RDJzVDBncDhQ?=
 =?utf-8?B?dTcrRjluVWdVQUxaYUE5cU9YVTlaekt0cTBYNUFSUGhDY1lYck9sRnF3bU5D?=
 =?utf-8?B?cWJIV2szbVlUcXpJSHRHQ3hwNTY0enpEREdxUGRTKzRiY3dtYThGbVV5UVV5?=
 =?utf-8?B?U2VzS2VYKzBiclFDSFlFakNsZC9xS3Y5VkFaZ0FOaXE1ckw5RUxPeWFzNFBO?=
 =?utf-8?B?b3JXeVRMNTBuZnZLQVlZRzJSbGovRjYwZGUwU01JUUIyVEpxVnpDaU5EUGMr?=
 =?utf-8?B?cFk2amYyVlFxT0M5VFNlRU8yMzFINXhCVk10YVEyUlk0U0tnVE9jbVFnZVRC?=
 =?utf-8?B?ai9SaklVeWJ3WFRCRktuSlgzc2dQc2dBUWd6ZXlGYWNpdUZ2V0tCMWFORHZR?=
 =?utf-8?B?WklBdmRNUkF3WEo1QjQzQzJVZitvV0pkblBJUDAzZjhuTG5kajBKVWpWT3Bo?=
 =?utf-8?B?Q3ZVcU1Pczg3UjlTbFVVVUgzSnZTZEl6SkVuY01oQUZxeFFuelRmc3I3NVlm?=
 =?utf-8?B?MXE4d1dhcFFGeEo0L0hKTXh0Y1dFN0k1S2lqZUs4S2lVZ0V1UDlTZEw1NzFt?=
 =?utf-8?B?VmdpcDdqYndMbkVRMllvVVZJQm5zUlBMUmp1T2IzVkJ5RDhJcWEzWGkraXJU?=
 =?utf-8?B?OWdBRFNqWENTOVVUQ3BXVFRxSWNXbmNEOUlwWjJYcDdqNSs2eSs5UEI1WXJT?=
 =?utf-8?B?ZHBVcDNwR25ZOWZxOVpibzhUbmVOS2hNTUxYMjZMNmY0MkFqdTJzMjlqSjVL?=
 =?utf-8?B?MTE5dTdWb0RGaEtIL1hBajUvWTB4MXBkbTRabE9UQTBDNlRGMVBNNEVkTklK?=
 =?utf-8?B?b0RINXhEcXdzQ3JGQlNPSlNNUDNKdnBLZXNDYzZQaTVyQ254azA4WUd6d1d5?=
 =?utf-8?B?UzJ1T0FYaG9tS2Z1YnM0amFCUDRZTTBlYUhxaCszdDk4OUp2cVR2TDIrdzFX?=
 =?utf-8?B?YXdrUnFEL2ovMEVQMVhKRzZqMEpNcGh5QklzK1FraU9meDBWUGQyVk4rOUha?=
 =?utf-8?B?dXJ6cXA3YjFuMHRhUEJnRm9BeG0vQTIyOWZLZlBiMmRja1gzNjhrcEF0c2JO?=
 =?utf-8?B?WmFuS0FMVTloVTFNcHh1WW5NL24rT05sNXRybitYRFkraUtNZ2tvdnVjc2Q1?=
 =?utf-8?B?VFVyYkdvL0FkWXh4bFBZUGxzckFQRkJPZlQyTmNzNytVZmliNUthaG1TWUtG?=
 =?utf-8?B?cm82L282MDcxTWxYeEhVRWwvUjFJeStpL0NHVkhJcEhUbVBwV1l2UDBDM2xw?=
 =?utf-8?B?Y3dkMS9FaHpkRzBEb3FyV3FZZjhWQ3RMUzh2Q2xCQXpFK1NiZDRnMnJPVEhk?=
 =?utf-8?B?UGNNcVpoQU5KNzNEUmIySHlmQThsSmY5MzQwbFRPYktnVVd6QTV0V2ttTHUr?=
 =?utf-8?B?L0cwTGFxZ0tQYkRHV1RzYzlvM0ZnWGJ3ZzFiejdVT0x2dktIRDkzOVYwK3o2?=
 =?utf-8?B?L1k1UWRSb0llcmpJcHBlMVpqSlIyMTEzUjFVMEgxallaRVZWSzlOdE1sUWNJ?=
 =?utf-8?B?dFdZVlRrUXJMa0lqRGNWL3czOGFmcVlGRTBPRDVsajNpQk9PRHUyelVSNEFV?=
 =?utf-8?B?WmdWTFFLTFJvcGtSN3BPM2JjbFFYY0FDWUF6em51NXA0OG1uVkMvcld2b1VN?=
 =?utf-8?B?OENNbDVPc28yQndsSXJyWmMwRzh5Sk4wdnFSdjBpaUhKWURCUkdUVkQ2bXFD?=
 =?utf-8?B?eHhuYzZESmlJQU95aVhNRXZsQnNuaktZV0c3ck1ra0RpdHJMUzk2cjBTZWJI?=
 =?utf-8?B?djROdUpyMGhGNnROWUVkcUxTeDVSc1cxUGR0OC8wUjl6bUlGR2tZOXZ1R0xj?=
 =?utf-8?B?bDVtYWY1b3I1NjNkeHhVbTNaOGozKzN3VUtXaUEwSVYrNHQyRFRaSVlDY0x1?=
 =?utf-8?Q?kS3z1iMkbiuiv+1mCQE5bTumg63k1U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:28:50.8220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6faf38-0a3a-4f00-d83f-08dd67bb88d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157

On 2025-03-20 03:49, Juergen Gross wrote:
> Add a file operations fstat hook to the 9pfs frontend.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const void *buf, size_t nbytes)
>       return ret;
>   }
>   
> +static int fstat_9pfs(struct file *file, struct stat *buf)
> +{
> +    struct file_9pfs *f9pfs = file->filedata;
> +    struct p9_stat stat;
> +    int ret;
> +
> +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
> +    if ( ret )
> +    {
> +        errno = EIO;
> +        return -1;
> +    }
> +
> +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
> +    buf->st_mode = stat.mode & 0777;

I think you want `|= stat.mode & 0x777` here.

Regards,
Jason

