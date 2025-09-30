Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05FBADCCC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 17:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134323.1472256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cD7-0004HR-U6; Tue, 30 Sep 2025 15:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134323.1472256; Tue, 30 Sep 2025 15:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3cD7-0004Fz-R6; Tue, 30 Sep 2025 15:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1134323;
 Tue, 30 Sep 2025 15:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fONW=4J=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v3cD6-0004Fq-EC
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 15:24:12 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809f29dd-9e11-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 17:24:08 +0200 (CEST)
Received: from DS7P220CA0059.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::11) by
 BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:23:58 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::5) by DS7P220CA0059.outlook.office365.com
 (2603:10b6:8:224::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.18 via Frontend Transport; Tue,
 30 Sep 2025 15:23:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 15:23:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 30 Sep
 2025 08:23:54 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Sep
 2025 10:23:54 -0500
Received: from [172.18.5.186] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 30 Sep 2025 08:23:54 -0700
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
X-Inumbo-ID: 809f29dd-9e11-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2/o68SE1sKweYuDVAC2fB0UaXRri7uM3Ioe9iAdYTyrZFC7y/7d4A3vzjkB+I7gvOzmMtXz3q601ygCDeaNE3Rc0EHUP56fLjzwnKArIqHZiZtwn5hBLwpBWpDXoZHEsfsUVJH0SZZXjomi6q1cHtlmrVX96rW85KSBjqdGEgb7h4+NgumdHEmwqaxfF3x4Ph/oEICBtuHDzE/QOpiFmmT0cAWCvB9drQ8Xp/c/yHOJbxpSRdVZy3YIOZZvBv6fld6esg9IHW2HdD1U907pGV4u7wkGATCt/GS1UNOk0McuvYdLodOj+rb61zijW+9XBbJlBPa+M80ig0obEHyFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8+avBMTWF8BDTJ8mn4H08nFm+VIipi6dSyO1jFkMWE=;
 b=RjjfM/IZ9xJMw7t0XTEdrQ9+ClGi9bUZxha1Byb3TWmp1qgzBqZbJFUwYOAtzzSv8HeiTF9zH+8OrB6OO4urEHiQffRT3ZuIyneIGQlPI0E3R/C7M43zx1jUn2NJtYypyr3e2MDJFYJxTBEpL5RUIpzLVSwYvZAV3fuvrJrUghj0IUwf9dM1wTjU7lanxd8pH4v9Qn3raVzHMp7rFmYOyplpego/iXyPt0CQW9dpkTzG3KLo/Vt2Oe4mxF0L6wKys7+Wxg4Cv1vegN23HSNBKCNYv4fiRjP/Zgfr9YVfub4ur/9FwicdDAX5S/l+4pfWyudNn4fGL0FfvRVBHb19jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8+avBMTWF8BDTJ8mn4H08nFm+VIipi6dSyO1jFkMWE=;
 b=VrjKTcUJX/tL5SEV+/Q6VK1yVfS2zqD8Cw1EARFlMNVqQ6E6ROC7gzlJMjYMgLzzC+vxeoHA3BItsowCMpQIaBLN1XS9qZzC/i154nvSxiGK4RC5Q3Hc8lekbMkfH5LkGggsfbWCbE8Vs47n3NW+h+sECUj2/mpi638ZxRVTroQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1db69ecb-98a4-4135-aa9f-4cbb8bfb6d7f@amd.com>
Date: Tue, 30 Sep 2025 11:23:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/8] tools/configure: Introduce deps on json-c lib
 for libxl
To: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-2-anthony@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250929120756.46075-2-anthony@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2e105d-ef17-4f29-f3b7-08de00356029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEJwWHFXUGdidEpXcUZXVS9FSS9GZ2RPUzd4Tm1QRDZ5VDcwNVhHNm1PVi9C?=
 =?utf-8?B?Q2FLRlVuVkZQcWNOcHFsN3BVSTJ4VjBmTGMvQW5wSkRseUc4WURvT0dFV1Zq?=
 =?utf-8?B?eWgvL3ozeGlXV2tDM1BxL1R0b2dUakNGSzF1V2tOOHBhNit0THZER0gzUlR0?=
 =?utf-8?B?eWduUWJxc0Z1WEdCWENHb0QvUFJCNWpDVHZJU0RTcGY3c3B3YmhnaTRpUnhl?=
 =?utf-8?B?UWN6NUlmcWIyTituKzIwWkhKN2VsdGMzbWpaNENFUEZYb1JkRk15N2VDUUlU?=
 =?utf-8?B?NGoxNDJKNXY0RnAvV1BEN1ZHa1BUTnlCWktYM281UU5QcEJYeVRoYU9NU1d3?=
 =?utf-8?B?OEw3alhSMHl5dFFPVFpHcVpTTXlnd3BvaUx5ZUM5VVdpRzZSak0vNmRjVVYr?=
 =?utf-8?B?L3VuY0xoMUxPY0hLd2prSUk5cEhLVVZXRzRqMS9iQlgveU1Yb3g0S3VnQjBO?=
 =?utf-8?B?YVRQT1g0WjhWbUZpU3pYc3RaZHZEdzJxTWpZZ3N4M2tZR2lhSklmay9NWGJI?=
 =?utf-8?B?dS9veHdraFl4VTh0NWEwRTZpdjdzUXJTMzVxclphQjF3N3BIRkFUb216QTlx?=
 =?utf-8?B?S21QUUk0RHZsMkRFZGxBUEJvWUlOU0J3RW4zT1hFMUNDcFBERXJKdFdvL00w?=
 =?utf-8?B?ZUd1UlZCa3JMaXBjV0NGNi8vRXRuNXg4VStFK0QrUnJ5S1UxUnZiOHlaL1ZP?=
 =?utf-8?B?c3BHS0xIVS9pRElzcVNsOUQwQTRvbE9NY0hoK0pESWdsYlM2V2owbkVKSFN6?=
 =?utf-8?B?bVhqVzNqVW9aY1JJOVJpamwxcktrZ25qREE3TUw0TWhIWEtGMEFYNVd6TEpM?=
 =?utf-8?B?RWJTL1pyV2gzTFZaRVlmbnRRU0E1cWlqeFJUZXcyTGxlcjZJNFIrUlRKbFhD?=
 =?utf-8?B?NU1HR1dwaDlzYmtsaG8ycXh0WjkwR1JDTUpwaUlYOEtPd2ZrRjhCc1Y5WGt0?=
 =?utf-8?B?TUNWRlA0M2YrbmRkajhpbWtxS1VkTjNidXBmbDB1NnhZY2lDdXBCalVxeCtm?=
 =?utf-8?B?dEZWcEVwWUN3WGRaMU5VRmtaQTlxTDgvaUplYnFpUWxIRmZHSkVoRXFmbFhN?=
 =?utf-8?B?aURoNlJGZ25ramw2V0k4SFZhaVNuSXUrNXBRSXpGbTJqT2psY0haWDh2a04y?=
 =?utf-8?B?M1FyeVZ1aFhlMnNpSzdmS2F0UVJFU3ZIa2s0a2pJUEZscnBYVXN3UnVJaWdU?=
 =?utf-8?B?L01lSWgvMktiNHFKZlY5ZmMwYVRHalo4REhVa2FPVW9FU1ZSdTg0eVkyUEFE?=
 =?utf-8?B?QlBwandwUWhwcGNHSU4yVUlLOXFJV0s0eXN4SUw3K3I3SkE2S0VjTUdqdjE4?=
 =?utf-8?B?OXJZdG90aEtpU29GSzgvWkxSTDFyTnpYZGZVSGpWb01XQzNsMDNOZGRKN29S?=
 =?utf-8?B?dDMyYTU2N0l2VTE0RGZUN1NicUxPaEVyUkhBZm80Tkt3eFlpMW5POFo0Ykxx?=
 =?utf-8?B?a091MVozbk80ZGhRYmJodUgyODMyNlhwbTVoWEVKZWNFa2Q1TDRDclE3S3lL?=
 =?utf-8?B?K3crYWZzazl3R0grSDgrSkwvU0hGdTFxTld1NUtvMys2M3czQXZ0eHpLSFZM?=
 =?utf-8?B?Y1lOZTRoUmVnRWdHYlZla040U042TSsxSjdFS3Nqc2pqQis5dnJwbnc2S05T?=
 =?utf-8?B?ell4Rk1FRklHWnlqYjJocFZwckZoQUlYemFCZmpFM3lCUExEVUw4SjU2MEZL?=
 =?utf-8?B?WUNrWmdiWkN5Q2ZOYVdQWU1tWDFxL215MnZrVm5HanZqWkFiWHdVS29BcG5v?=
 =?utf-8?B?ZWhLcld2Z1hiQkNDQi9uejkxNUFiRzgvTzgyL0dxWEdsbkRUTkcyS2ZScHov?=
 =?utf-8?B?dHpiN0MzemptdU1oWW8rNEZmcGhRdEVIZy9vWjlnZFB4dmw2Y2RCc3AweEZi?=
 =?utf-8?B?My9pSHJES1diMU5MZ1o2ekdUMURnWjc5bzh0UHJMbjBZNGE0NGk1MXdBanNi?=
 =?utf-8?B?ejF6clBEanFnQUhQT2ZBeDdEL29ZWGRnYWMvMktoZWMrQ2tza2VRRkhncXJW?=
 =?utf-8?B?QkJUcTQwTGtodW9URUxRdGE2UWZWc2paNTUwdEVNZEU4ODNNcThuY3REbVEx?=
 =?utf-8?B?UEE2OGtuMWY1ZHc4U0JXcDQrdldxZFpCUTNtUkJUSjBTbStRZnFNMGoyTm9n?=
 =?utf-8?Q?DLz4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:23:57.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2e105d-ef17-4f29-f3b7-08de00356029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523

On 2025-09-29 08:07, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> To replace yajl.
> 
> Introduce XEN_JSON_LIBS variable, to be able to remove "-lyajl" later.
> 
> As a first step, the variable will have both or only -lyajl. Then
> commit "configure: Use json-c by default, fallback to yajl" will make
> a change to only have one or the other once the code is ready to build
> with only json-c.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

