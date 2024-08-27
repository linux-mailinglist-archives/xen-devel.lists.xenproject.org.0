Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF7961A9F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 01:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784407.1193761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5e7-0000ew-VC; Tue, 27 Aug 2024 23:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784407.1193761; Tue, 27 Aug 2024 23:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5e7-0000dN-RW; Tue, 27 Aug 2024 23:30:43 +0000
Received: by outflank-mailman (input) for mailman id 784407;
 Tue, 27 Aug 2024 23:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ve6=P2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sj5e6-0000bD-FW
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 23:30:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2417::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e985c50-64cc-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 01:30:40 +0200 (CEST)
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Tue, 27 Aug 2024 23:30:34 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::9c) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Tue, 27 Aug 2024 23:30:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 23:30:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 18:30:33 -0500
Received: from [172.20.38.216] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 18:30:32 -0500
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
X-Inumbo-ID: 5e985c50-64cc-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymLInvb+FkeGt0tC7yp8QX31F2NSbbyQEhe6wC18NGcyO6r7LzagsNFLDXgLH8VJp/ob6sHMwO6D1nSSpMcoKB1zE5m0P287LryV9X/f9MKwD120cjJKoAJNtBsqfICBfCsXT1cZPl53P4gU8+IijL0tB1YZwI/Q/rBGjy71Z4J4cPUQYCRmEUbrfP/dvZVpIO+u/pU/CpRM9okM1EvR/HG2PPuIKodNwvP7X3qegL3SEwPAdyfixTENaVVbNqPIpPVn0c8mNpm+Yke92C7iMYHnaMRGcwxwjYQ68dYhRX8D4HY2rOYrpnz8X5pp+pZU3ZlSRlSvgVImN60GzfXS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INOrIyZO8CY39NcCWMaX/aB9X6CxLn4T4ltdcqwUqbk=;
 b=DoGk8gEG78Kk5QmtRLxuH1WZCTbqTg274rgdgz+t67Nsp8DBSIOumuvii+xwmxk6f0MZXordU6jz3gASFZGaR/7qkGNOtJYQVonYPuH5zevN706CkrFnEl6EC8IO/WrNQvCCvII15ueyKmFfkepZosC3d5XDUWm/KcUq2UNK9sVCVZ+pdRO8HOUQByzpuVHQS7sIdslVQSqSWPwj5ohkvxoI4Ekss3CkjmiE7owDpYIetp+e9cMFJXei6B9zkNT6jLmUPHsbjlf0ugzzwgGhfb2oc/FoeEfKCopGcfqi0lo8pQlTKH9KwA+Z+GUkxptizetdrUQSw7ctMq/2z1dc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INOrIyZO8CY39NcCWMaX/aB9X6CxLn4T4ltdcqwUqbk=;
 b=FrWoeTbLTjmxwGHwCpWTBOU3MWTgpadjti9e3+pgoPeONPnPkKy7hsPt5WfWKmlYwBNFn8Ctm75CSQZ3rgcYnhPEJj8QeV8BAYDEy7AknrNtsfpqqthsqi/1gdzax6ajsikiuiMaKfl29Hkgo80wv1yqeEqtNOrj/eQfDaR8UAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bb9fc13b-76a7-4109-98bb-725d903de3dd@amd.com>
Date: Tue, 27 Aug 2024 18:21:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/3] libxl: Probe QEMU for -run-with user=user and use
 it
To: Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
 <20240827100328.23216-4-anthony.perard@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240827100328.23216-4-anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3267ce94-e8f0-4762-5939-08dcc6f03f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUo0cHBHdWFUUmFFVkg0ai94ZnJSZVF2TDNPZytIejBIT0YxU1ZoWlk4dSs5?=
 =?utf-8?B?ejFBdXcrWnZHRHF0SmZaNWRKU2NCRDkwcll5WXNoYXR0TFJCTkhkbUFiOU01?=
 =?utf-8?B?aWgyTGFNTXphUFJ0WE1TdVlEV09CcnhoSHZCbTRoalJpVlo0YUg3U3lEZ3lN?=
 =?utf-8?B?NHZnRUlQWExrd1pacjNHVFV1YWFiZXJzaHFLZmFwL3RRNFFmTk93TXR0elNF?=
 =?utf-8?B?VDZWWmpvMmhMemZ2RGJKRmZPb0lkcGtvdGNKaHZpbVYxQytBdStIQmxuZkFV?=
 =?utf-8?B?OTRIWU9Ic3haY01saUcwZWhvY3J6cG91M2RwbXZOcEdNMzNOeDlWY3BKbUlJ?=
 =?utf-8?B?czB4dnBBNlVrd2w5NFZqREUyZVk1WEFzTHJRLy94SURkTm5xdzdSU0x4bExQ?=
 =?utf-8?B?QUtrejhMOG5vbEM3aUJmUHVuVnl4UHB6ZmxQV242MFJ1QWJRZ3FhWEdXekZt?=
 =?utf-8?B?QTkrTk1SOXcrb0xEbGI4ZjVxT3pqcHJlSm9ydXZUcHczdnNjK0FkOVlpUElR?=
 =?utf-8?B?UWdxYzVZelBQYjA2U3lyTTRHN3JJUG5BZVNQOTFaQmxGQ2IrRXpuQ2gzNCtT?=
 =?utf-8?B?T2FleDBtNHFZcDNGVnF5YTJ3czAwbE50SU9yUVJLOFBvZ3dCOGdBK0NQQnkv?=
 =?utf-8?B?YURhcjliTnJjSjBnenplSm5YVHFDa3hMeG03eS9oVHJpNnppSkxuRFdTMnIr?=
 =?utf-8?B?dHE1S2lseFU5eWI1cWp2c1hhWS9ldEhqVEo3dHMzejltUGJmRGR4L0l5Y2VE?=
 =?utf-8?B?REkwdzhzM0kzQWJMQ3gwdEVrUVJvMk5UQlNQVi9zVEJVU0l1UytNY3VoNWJ0?=
 =?utf-8?B?T1lhUUJ0UkdMYml2aHFTN1Bya2xZZHJIYmtHZ044T1pEaGVKUEUwZTNBZVVs?=
 =?utf-8?B?RXZxN2tUQkJLQlk2YU82VkRZWmRyYVhXL1hKSm04WG5uTFh3bDM1TXVhWDR6?=
 =?utf-8?B?VlREbXFxQTJQSzJkRnFxaWdSRkc5Mk0vODg5TFBackorUGN6V3N2bUhFbm9T?=
 =?utf-8?B?NjZXSEhzMGNKeHRIOFJMMkw0dGIrZ1V5bks0bHlYK2o4Z3lCbGM3ckR2eS85?=
 =?utf-8?B?aHJGdExuQWZUWlVZUUlrMTBLdjNiakZwWllCbUU4WGhWbmVTUktnYlByUW8w?=
 =?utf-8?B?TDU0THhwRk5SWnl5aXAwNXB5RDI4aStBYWJoR1Nrbkh6TTNOTmNxZ0NTMVFa?=
 =?utf-8?B?bC90L1BXandMbjBjR1ErK3pFQmVKMTZHZjN2ZENveE9FeFZ0N2o4bjFhWWtq?=
 =?utf-8?B?eXFrR1pzeWhPY0ZUeThmMVVHRVJWcDI2eU1xQUpyZzhGbkNOdS9MdElCbWxq?=
 =?utf-8?B?T1FNOXdaNHFkdnpzdlhXYmhQcUk2MXZweHpmRUNuR2t1SkdhaEZ2bEN1S0dk?=
 =?utf-8?B?QW02NFE2c2VzOXNCM0RHVHJwQlpqS0tQWTZndU1USEhKMEhzQ3NRN01sdS9D?=
 =?utf-8?B?OWxlU3B5RlErdGgzdXByaDlneHdIZExVTGdLcjhsYkxiUkVOWXFpdzA4UzdO?=
 =?utf-8?B?R1E5UEhXbGZtU3lBWWQ3Smx2ZEU4emlid3R4TDZRZGQrclpoQ0ZINXFiMlNm?=
 =?utf-8?B?YnZPME1PczNjQU5KSkhSM0F6TmRqVjhVaFFKaUoycW9ON1RSbmlPWU9FMGJY?=
 =?utf-8?B?Z1hWSU5XRGY3cUtGREpEdFA3MGExUkZud0RiQndLMVNBK1g0V3l3WTFDZDRn?=
 =?utf-8?B?S3JyOGsyMGtqYVFlZzI1RXVHbUQ2RUdPZ3Y3Z3ZUclpzQWEzZXU0aTNVYWxx?=
 =?utf-8?B?VnBVZlljSGZ1MTRSaXduWTE3WGRNdHBUemlNL3A2bzJ3T3NpZlRKalFSVm5Q?=
 =?utf-8?B?UmlwUGt4SnN4ZlF5Z0VlenBXSXR4NHFaTXZXKzhoK0QzMDZyRUp5bkVjUVRu?=
 =?utf-8?B?Zmg5QW0yaEhoeDFwNFVYMTVrU3Qvc3ZrYWx1OGtqOEt4azhsc295T3lRNEI3?=
 =?utf-8?Q?OVp3yjSeFg9JiOisHRVAeWrzCyO53RBl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 23:30:33.7598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3267ce94-e8f0-4762-5939-08dcc6f03f77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336

On 2024-08-27 06:03, Anthony PERARD wrote:
> "-runas" is deprecated since QEMU 9.1 and will be remove in a future
> release.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

