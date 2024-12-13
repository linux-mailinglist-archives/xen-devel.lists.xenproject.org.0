Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6969F0B9A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 12:47:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856625.1269187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM48s-0002Al-Ki; Fri, 13 Dec 2024 11:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856625.1269187; Fri, 13 Dec 2024 11:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM48s-00028o-Ho; Fri, 13 Dec 2024 11:47:34 +0000
Received: by outflank-mailman (input) for mailman id 856625;
 Fri, 13 Dec 2024 11:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzCF=TG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tM48r-00028i-Hq
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 11:47:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2412::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085d713f-b948-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 12:47:31 +0100 (CET)
Received: from DS7P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::15) by
 DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Fri, 13 Dec 2024 11:47:24 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::d9) by DS7P220CA0008.outlook.office365.com
 (2603:10b6:8:1ca::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.18 via Frontend Transport; Fri,
 13 Dec 2024 11:47:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 11:47:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 05:47:24 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 05:47:21 -0600
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
X-Inumbo-ID: 085d713f-b948-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiGocDun8H1dOntdG6WgeUR2/XzSGUPHiEF4Jw//R7rp1Y9xvzuPRdHK/7dULqPuIUmISpsVI84xEQR0Z45scjI/5PBgHqy9fwiDfOW0YAsxcK7LDPFBoUgrD0NNxGtXqZySNrwCPtLzRvw0v8irfPwUsoO1Rr/sF/+kfjrp8+mdRpFwHEtpwSuOeSET1dR4jtTZ2C0Q1MfpH8FBJD610jcGxVVGwXz5MRIwddIzpj3CagR8KmrFgRHzvXTFgw7f2RfVpZnGXdjI+oRJzTbKDAYgp9d9ZL4bvcDx1LjZzwsJ6DyBGiwnXSPclnjsj7Sl1ySD77tT3eY+QjB9M7yObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4gkhHjeOW+EXymXd/7PefBvELrnzXP5XWlm4IfBqo0=;
 b=m3ZeAZkDI22ncWeXm51ADJ612UhWIDWLt5W/RMzMnKg3mkf1r2Uym5o+rfZZeW+mfs7XlSQOrykYEg4Je7lRLrkaUT2gYGMv5h+YFATz4K5yVlovrnHnDGUNQqxZphoz/JEADG7whPhb0cZjm50zsBzj0lvIS18VkazXjOxiE55iW42BYeOiIhL4eMeX+uM5F5LpUbITi7a2cSde5epNO+hvs6idBfaF5MNNKZSQZhUbxRrpv8gLPYVH7JeklziegIsKS8e29i2AXgY69hTLyIinaww2CRAsw2yJ/JIbn2kPXi5lX+/6qlRpJErfI0g93r6SBmFedyLHG/cv/fiK3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4gkhHjeOW+EXymXd/7PefBvELrnzXP5XWlm4IfBqo0=;
 b=kJe2UYuveE+G2R5YMpRnJ+Or1/9NOPbchMBglFHWaA17uGfF3N+H7iraPx7/Pj47oOV6WQAsHCVfvvlQU6Stvx6Hgd6gvZ/Ir2xPpHIILRDAeyN7LfUDl9wwobiTe1NO8fAx5GZlQGXVDlV5OyItkHu7FPL+L7ENH2eH3eFwr/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <daeb7503-2427-4cd8-be65-152f308ec7d2@amd.com>
Date: Fri, 13 Dec 2024 12:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
 <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
 <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech>
 <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
 <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
 <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com>
 <CAG+AhRUFHH10daDvaqyhomCO6Yzyk4AUE_6E-53NmZU5auC9PQ@mail.gmail.com>
 <CAG+AhRVPiyG+mTQSF80ZEN5CsVW+0W0Y97d-Atrit9g2nO9-HQ@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRVPiyG+mTQSF80ZEN5CsVW+0W0Y97d-Atrit9g2nO9-HQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: db396f19-5947-46ed-77e9-08dd1b6be95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnlUT3d5UXFHWnB4VVRmTllKNXoxZXBWK0FNZ3NVTUxyMmdMTkNYODRjY2N1?=
 =?utf-8?B?U2ZwSDh1NHE3NjVkdXZhU05xSkxTM2Urem5NVEZxOUJNaFZBVk9tbW0zS1Nr?=
 =?utf-8?B?L1NTZmY0d24zaTA3eWk2MlVCczd4NEZVTGlMLzNaUUVpbk1kMzlHN0Z4Qnds?=
 =?utf-8?B?SS9Kbks3UDB0RjJaRzA2ekszbWd2MFJMa2NxNUVaRCtaZTlVMTVTMzNna1NX?=
 =?utf-8?B?RzVyUTNwNVZDQnIyUmZZVkRhdVlzVi9UTENhMWE3SEVmZkR6Sy9zT3U3ZENs?=
 =?utf-8?B?SUdHY2RYSXNINUo2dDJ0cktpL0FJbVZQQmdDOHB2ZThBWVE3S1ZpQ2JnV2xX?=
 =?utf-8?B?UnlRS0FSeXR6OU82a2s2R0szSDNrempxcUJ0d1VZUTVwaTZUTmFQOWQrNTYy?=
 =?utf-8?B?d0REaUhYYW9LZHVQV1hnUmZIY2VZTk9ZMGdyWnZiYmlMVXF4emtPWGhrUnJs?=
 =?utf-8?B?bWtKRWRJMEI4WjlkTDY4SDBRcm9xYmRrdW9obExrMkcyTmNTN0Y4K1FUcFlW?=
 =?utf-8?B?Q0NrZHNaWEx4RDljM1VmNkF4WW9EWVZZTzAxSDdPby9hVWpscW9ZTGNkenhF?=
 =?utf-8?B?MW1UUERqa0JGUkJVZGkxSGFMdFRrZStqYUhrb01BTDRIQ096VXFwcnFiVWlP?=
 =?utf-8?B?bHBNSUtON2tGbWZkanc0S0s1SlEzcXM0d2VtVGRtb1gzaUVNV2pWVEJFdlpN?=
 =?utf-8?B?cmFEa0VtTXVJV1NJSlMzQWxSQjNobE1TcjlNbURmdllQeFdGazBVWHZRT1p4?=
 =?utf-8?B?bDRBUXlNaXo3RnJqenAzcm1QdDhuVGc4b0xxdFAvOXhMQ0tDVlF0dVN2L0pn?=
 =?utf-8?B?V3pHNms2aGZOV3NxRmZsQkI0K055bUhYUUlpNUk4SHVPSERIbS9GeDNoRTl3?=
 =?utf-8?B?dXBwc2l3SXN3WTNBRlRHTS9MYkY0L09lMmlWT2U3bW14OHVWbFc3OXgrRjFm?=
 =?utf-8?B?aUVRaHYzNUxtS0hXbVdYTjFhejhHOFFxRUNJZjYvdXdBOWd0RHRMcmVOajk5?=
 =?utf-8?B?WXZwWUkrVC90T3Y3eVFsdXVvcDhhcVBXV0hzTGRVWjdIT2lCTHUvYlZrNXF1?=
 =?utf-8?B?MFpvdENiQjBqVTNncGFkQjhLQkhVUXd0UXE0ZXZBU1NVVHppUkU3K2VzMEVX?=
 =?utf-8?B?UUdxVjZRaVpEVTJHbEY3K0QrRVZiaGNtdWNBUjVhNGRVZlB0WVdMOEg5cms0?=
 =?utf-8?B?QlVEVUFobUUrMFZXaHdTV3JTTTZ4MURJeEpzbUplUjdkZjMzOHJKSkdOWG05?=
 =?utf-8?B?MjJGZVZLUW1jd1M2di9vT0RDNDQ3SmxSWGs3a281UExxcUkxVkh4ZGVmamQx?=
 =?utf-8?B?aE9FRmhDYnNvOU02QlNOTzFSY25ZV0QwQUhOZ0FUSW0rTmlzVCsxY2dpYll1?=
 =?utf-8?B?c2NkMUxyNTdXZFNBcjkrZ2RUMXhldDZDY2RMcEFtcFk2dm9kZjZTWmoxZEo2?=
 =?utf-8?B?YVUycEJOSklrZVZXTUpIbjFqalNvTVpxMjZFVDVlSWVPL2QxNmFmelVNc0Nv?=
 =?utf-8?B?ZlFISFdyUkxWME9rdzNYTDJaYnVycHliTDZzWWVJRTI1NTVhNWRMZEI0VFNC?=
 =?utf-8?B?S3BTR2ZvZmZRT1Ezc21ka1NZYU9iVmR1Qmk3cVp2WnE3VStPRnIvdjFZQzJN?=
 =?utf-8?B?NDlSd0YzUzhHS1NDU21IRytyYlRYWmZpMG1QTUhhNW1TMm85c3pxUXNDQnMz?=
 =?utf-8?B?MTBaUzRpa1U0RWttMlV2MGpQNlNCY0Y1ekNhdE4wTCtHWGhFOWxMVGRTZnBk?=
 =?utf-8?B?MlViT2NjTXN0d0FJQUE2ZTczcGIxall4dHpqTTRsZzFnSWxCSmdxK1dDSzk5?=
 =?utf-8?B?Umx2dk44b09WOVJjVnNvdy9KaTFFWllaRko2Nm9HVllTdWhQZk9XZzNBOENY?=
 =?utf-8?Q?t/7iHVQAJ1IxX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 11:47:24.6052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db396f19-5947-46ed-77e9-08dd1b6be95d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268



On 13/12/2024 12:33, Carlo Nonato wrote:
> 
> 
> Using paste.debian:
> 
> https://paste.debian.net/1339647/

1. Issue I mentioned with prefixing with double underscore
2. Generic helper should not be named ext_regions
3. s/skip_size/min_bank_size/

And still you need to convince others about 128MB limit because I'm not sure.

Imagine, that our kernel+dtb+ramdisk is > 128MB and your first bank is 128MB. With your
solution this would fail. Now, imagine that you sort your banks and start with the biggest
one. You don't care about its size. It's the biggest one so if it does not fit, then that's not
your problem.

~Michal


