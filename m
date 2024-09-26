Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204419873B0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 14:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805415.1216496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stnjH-0005qz-HI; Thu, 26 Sep 2024 12:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805415.1216496; Thu, 26 Sep 2024 12:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stnjH-0005oW-E2; Thu, 26 Sep 2024 12:36:19 +0000
Received: by outflank-mailman (input) for mailman id 805415;
 Thu, 26 Sep 2024 12:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rGGY=QY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1stnjG-0005oQ-6f
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 12:36:18 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2408::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb451881-7c03-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 14:36:15 +0200 (CEST)
Received: from CH2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:610:5a::40)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 12:36:11 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::63) by CH2PR08CA0030.outlook.office365.com
 (2603:10b6:610:5a::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Thu, 26 Sep 2024 12:36:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 12:36:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 07:36:09 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 07:36:02 -0500
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
X-Inumbo-ID: eb451881-7c03-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjR+jEMaMD1b3c2GOlzI1V1cbpsE7poidy3ck7S9ZgLAnP2PpmqaEy4ZiPNKG4uBLNwoJ/lB+LBuwLFzVnTaJUL8Y2dAAemWWkVvvXybrFhRTyhF6eoKheLVweKjY4IULBrY2InGMYx5ujbFPAaH2GA4ynDYD3o9ZgMq9PD4bEBOUq+ihoXJn5fEkc2kdJK90c5C56YW3JWKrU3HbqXrvQ8AjfRyBwP85yv8nEOZwOpev/ol1wEY4DPVwYO7GW8XWD0kyeJwam0VcvtGGx7N3YahuUk/fsLWABZ+MNc3PzUgMk7lbai5aVatQZ5cSwrQY3PC7VFE8Nq2+79GiAOEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqt8yQpY7eJkVtkAsCyd+/WLRRQw+5JuiyQ5cX6j2F8=;
 b=du1NvIMZh4Jh5KBeBNQVMNXt3GqIL9rk47njpfp9j0u8WjLcZG3RNzac97TN7sOPFlh3aAekbB/q9p4Urk14r45rqMQSkXYaWwAkqGR1mFxyfxjCHfRBIWXBNiJQ48rybwMMCNhi6KkuS93hQJZTmo6wVaWRywt+r5dBqDe1RhNfLqnej+BqQ3Bbod8Xr5Btpf0A+r0UfERJHjSttNlQKTXSWY8YpcyXVZ4QBzIYqvT+6J/4C2wzfi+51frsbkdGLnHdRk4OYzJSsFWFO5xwbLMp5GEW8RML3yF+9f1W4RdeOKIpk1StEeAyMdCR4J4mgZlgRO1TiBnV/licG1+nJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqt8yQpY7eJkVtkAsCyd+/WLRRQw+5JuiyQ5cX6j2F8=;
 b=UaQVBTd6iDKVdaDvjZ8g2h2Vy1bcwBxc2/IWV9uBGgEEHAGz/FzxhbASitzmTiTrvQew1QBLp+Fff2QBP+4x2CSl3WNtoqB3KlyH7fbGrN8V86JxjEH7oDwbAQuwgNbY4OGzNXMmrqt3iy4Cch9R3vB07ElZOi9BJrIh9j4YhG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bf90fb6f-bbd3-4b72-9bbb-61cba58016e4@amd.com>
Date: Thu, 26 Sep 2024 14:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/livepatch: drop load_addr Elf section field
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
 <20240926101431.97444-2-roger.pau@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240926101431.97444-2-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: d84e62f3-77f6-42ca-2c68-08dcde27cdb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkhHVnV5Nk15YjVyOU5velhrYUpYeGdSdFVmUVBLdjRzcjZWR0pxb2dLSHdu?=
 =?utf-8?B?ZXh4bGwwbVVXSDVnRFg2OTY3dGx4RnYvbzBrVmE4dkZqbDF4bk0xNEdKSlFq?=
 =?utf-8?B?d01XVmxqV0txS0w5T3I2dFlGUm5tKzVLOUhGY2dFVWhYNVQrd1A3WFA3K2s3?=
 =?utf-8?B?WUplVWhncnh3MjZDVnJHTmxvaWVJMUN6Ny9wYXdFNTNYTmhhcnkzZDluYUJW?=
 =?utf-8?B?eis1V0NTKzZkazFBYkFmZ3A4dUYxQ2VKaEtYMW5ZY1BHWUVBbk9vZzJEVlFR?=
 =?utf-8?B?aUxIWVpuODkxODhBN2t3aVUwbWtacXQ3NHBoNnMwNmR3RXdWRVM1eTVxNjho?=
 =?utf-8?B?d2Uya05DaEFTZndDeExMR2FGVmJGQlJRZy9jb1dUaDhsbnFld0UzNm9lYzVu?=
 =?utf-8?B?V05oQXE1emJvbFZ1S1ZleVAvTEVGMFhraS9Ydm01aDhSTk03QTFmS3pTYjMw?=
 =?utf-8?B?L3VVSXFaMUNENUM4OGk1cFU3VHRiekhJQ21iY3M1S0cwaFhzQ2V2Sk1DOW0y?=
 =?utf-8?B?M1F4Y3NJd1NrUFdFTnZPcko5MFdwVnUxSlhlcVdOZ3pWY0hCUDFLb2pya1dy?=
 =?utf-8?B?REpUVVNuVmN3QUJyVnovRWdGVnZQcCs2NFBpeklFajJNRjg0eWdDejFRaUtF?=
 =?utf-8?B?bDBhQVV2YVU3b0ljSmo5aUVpZm0wd0ZQUFQ3YUl1cy85bTh5aS9obU82N0h1?=
 =?utf-8?B?dFg1dW85bWRHZTdUNWg4bkJFVFNXSG5XdHFRYW91aVcwOHh0UHZtbmxOcS8x?=
 =?utf-8?B?Tnc1QXY3OUlWNmVScjRSenpFNlZjVTNwSmMrK2tkTngrTS84MFU5aU1mMUVp?=
 =?utf-8?B?N0RiVmg1ZDRwMmd0K3NkVEJ3VytKc0pYU1BXYytaVHBkTTZvK0xuRG5sTTYv?=
 =?utf-8?B?Y1pGYlhjSE9pQ0Z3RDFsQnhCaXZZSmEvenRBNm5LMFVITVZ6QWtmQ0FpTDE0?=
 =?utf-8?B?dUVPL3Y1SGpuS1FVYkFjelp6U0pma1VzeWduNXhldHBMNFJrU0RVZkNHWk81?=
 =?utf-8?B?M0VPaUtNWmJ3aXNNdG5PSXhGbFN4RHA5VDlmanN5TmFhd3A5cHk5dmlGQ1FU?=
 =?utf-8?B?YlJKS3JSSUIvb2tHSFBwSmQ0MUlJL0tWNEsxRjkzemlGRGNwRzRZbU4wZHd5?=
 =?utf-8?B?RGFKbThZVXU4K01yUnZtbnJ3eGdnU2cxalZiV0xZRGlVVzNVdGZNbitXeFc0?=
 =?utf-8?B?aXdBRzMvdlFuYUg5bGhwNW84TmpvZS9YSXEydndidW83K0ovUlQyOW4zODNU?=
 =?utf-8?B?ODg4Zyt4N1hsNlora2h6ZWx6ckM2Ry9yekdaOHZUa1c3L0hLcnpCSUNiWjVX?=
 =?utf-8?B?SEN0RlpmdENCTFpmQVlUWFl2WGZCRGgwaW9ZY1RzN2JxWmRVS2l0Tjlpa2wy?=
 =?utf-8?B?dG5YN3hLZWVhVlZYdGVGWlRhUDBNZ2QrcERnZkNERGFpRXI4TzRmQmJEMTQz?=
 =?utf-8?B?WDFsZzYvUmdRdW5WL1RaWTJ1RWwxV0Q1OEh0VnZseHBtTW5Ja3VWaStHRmVR?=
 =?utf-8?B?VHRDVW5IQ1ZSSGF3Y2x5MmlOUFVTNWw1SjNUamRFZ3FIRUFYd3M2aVlYYzVH?=
 =?utf-8?B?SzN5ZTR5TWloZUthTXlQWGpYb1o4YWMvWkNzQk5hREUzUTVSdHVlVGloMHVE?=
 =?utf-8?B?MnF3YWlRdVIvT01CUDJrK21sTldzRlJUdEVRMFNRUUtSU1pjbmtta01kaHRH?=
 =?utf-8?B?dG01dDhadlZaaU5JeTdNNTNvdndaVDB1Nk53WFFKNDZOQzBKdFVzZnpXRzdL?=
 =?utf-8?B?dkRMR3grZ0U0QTQ2UGMzZllqM0Y0eG43YUJ6RVBVcnkzZ25XZ3ZpZGlGOE5E?=
 =?utf-8?B?OStpY3d4VFYzRlh4dy9ZNFF6eWU5R0QzS0QwM3VaZDlmNi9BRHRrS1NsVzNI?=
 =?utf-8?B?Z0JZMm5CWWxpSjB0VGFJSzVReUdRZXdWWEpLMnhwQ2Y4aEV1Um53UXh5RWZG?=
 =?utf-8?Q?DV8IYW7OMfO4LmhY/HtL0LKV0eMOdbiF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:36:11.5385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84e62f3-77f6-42ca-2c68-08dcde27cdb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429



On 26/09/2024 12:14, Roger Pau Monne wrote:
> 
> 
> The Elf loading logic will initially use the `data` section field to stash a
> pointer to the temporary loaded data (from the buffer allocated in
> livepatch_upload(), which is later relocated and the new pointer stashed in
> `load_addr`.
> 
> Remove this dual field usage and use an `addr` uniformly.  Initially data will
> point to the temporary buffer, until relocation happens, at which point the
> pointer will be updated to the relocated address.
> 
> This avoids leaking a dangling pointer in the `data` field once the temporary
> buffer is freed by livepatch_upload().
> 
> Note the `addr` field cannot retain the const attribute from the previous
> `data`field, as there's logic that performs manipulations against the loaded
> sections, like applying relocations or sorting the exception table.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
For Arm part:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal

