Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8A8C9A66
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 11:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725930.1130229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zPM-00027L-8N; Mon, 20 May 2024 09:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725930.1130229; Mon, 20 May 2024 09:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zPM-00024S-5g; Mon, 20 May 2024 09:34:16 +0000
Received: by outflank-mailman (input) for mailman id 725930;
 Mon, 20 May 2024 09:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s8zPL-00024H-1n
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 09:34:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e049fb8-168c-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 11:34:13 +0200 (CEST)
Received: from PH7PR03CA0010.namprd03.prod.outlook.com (2603:10b6:510:339::27)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 09:34:10 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::86) by PH7PR03CA0010.outlook.office365.com
 (2603:10b6:510:339::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 09:34:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 09:34:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 04:34:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 04:34:08 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 04:34:07 -0500
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
X-Inumbo-ID: 1e049fb8-168c-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXdyfhaiQSbCTHxXkezrk8yl0V9AUuU0gQgZLDejXTIUOFjY5gApSdz1dQIxcvotlHQht5n++kP/WBPLHMUHgBqrlc+SvHrMBsbg1FtVgZbCyisNWLKktSV/hutgjQJPBhiYU3cAM87UOonSCM3RPJvYWmLJNAmb+mPF48Kn0c6Gbw8Ukbm07ojJFk+4EqMNA/8EJ87RSgNqRxE3XdEYIRZEM8GuzDVe1RjlLkZvCBCbEWsMFplYpVxuoCwCS5AQv5Nr2lLPR7A1LL1Fp1ALH4Ixxu0fb2r9n8AvBdALkUSmvHd23R/6qUhzDLHOGWSZiS9H1opCN68vwYefoXt7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRPgyXaN7jDhKyEUc9RkqWThbOrdnnjunqUkZ37rzbw=;
 b=mdg0KW+S72sQEPn0uG6xfiTKEDpPanutwSA3KewvZR1g9zMfQUD1to+E7O7+tuuU+aEbb5c5za9V3t4FDOokUm1Bx8QM5BS32RE175LT6DHWgwsxfzhfXzFH9v/3bt1tQDhS9cKI7fE5zSMJItrRVZkagfsMtgVG4t4MShvSRyIhPBDvQcureTUkjqi+eXXQ56f0pEbP3w7VTuMd0eqd8B2mlL0HUPLV/Q8CgR/xwcKZo3+TRoZltPoSfX1hBuFikLQb4cshC2JkCQMiGp1ggdSAsPfBZUrBq8EiDgREMgl9pD5OW6ya2/W7FRlyCZVu3kdoFmNBB5kRUAvl1ZKzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRPgyXaN7jDhKyEUc9RkqWThbOrdnnjunqUkZ37rzbw=;
 b=yC/iBOCfyogkxNQTlnLjsfNxsPF653VwvR6gcFdCCVpZTCEZICAG0B/DBmGVNzia3bVvII9g87AFwfXubCaGwWQMhTZXWMrbazlJvgrJAYN5EaeRNNq4VW0GlCJcD+hfxLMHJo6eNwEQmMdcc66/E0tx+Mz2QEz9LFK7inIZqm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f2a5d401-86f0-46bb-9f3f-87200d4107d1@amd.com>
Date: Mon, 20 May 2024 11:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/arm: Parse xen,shared-mem when host phys
 address is not provided
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-5-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b6d9bc-7696-4f1f-83e1-08dc78b0007a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXlwZVFGMlFxenFpNzNQS2kzS3BLZEFySEo4SjZ0VXlpS3o5czcyVzBTVGdx?=
 =?utf-8?B?MXcwMEtxelR3VEFUeW9KclhzQi9wdjBmQXdDdHNWd3FRd1N5TTNzc3ZpUngx?=
 =?utf-8?B?a3BTRzQwMDdNQUVTNkdlYXNlMEIxaFlKcjcvZytBUEFNYnRreUdnV1hocTQx?=
 =?utf-8?B?Z1BnS1ZPcUZIOW1HblJib3FyQU5ldHFEZFgxUXhNZlhCcUVNRzBiOFZnYXpL?=
 =?utf-8?B?TzdGaUJEZW1odnFLNDRRalVWQWtCd05vSjVXWWdlalovQUNCT2VFWm5GTEwv?=
 =?utf-8?B?bms1aS93T01PazJkZGl4WFVaMXlxQ2JwNUxLcjU3dTFaSUtpOUdjTnVFMW03?=
 =?utf-8?B?c1FwT0paTVFUYVBEa2x1ckxpeVgvMzZrdnJTYkpmdDk1aU1DT2lTbzVadGVQ?=
 =?utf-8?B?UmNmalQwaDhuSXZLNzQrUllNanQ2elM2NkIwYmNWcUdQaitoVWVRZloxWCtX?=
 =?utf-8?B?RXlzMHFpckFXQVBIUEI0b1ZSQy9ad2VKYVBKZThjSTlpcmZFK2Izb2t3VUxY?=
 =?utf-8?B?RzVVYnZuOGZPT0hNSHYwOEMwZXpHOTZib2JJUVNSOXhOWG9zRUszSmE5TlZ5?=
 =?utf-8?B?M1F1N3huZ2MxdCtFTGdOUjJYWkZQYlliUzFKamEvTCtZSXRZSnhjOG90SzFu?=
 =?utf-8?B?SHRldkg3bSs5WVJ1c01LZWI0SkU3QzZ0d2N5UzhOUGtNZ085ZkI4bmp5SGNC?=
 =?utf-8?B?dCtMcG1OQ0JkL21WSDRYOTNKazJ4NDkxMWx6b2VIcHZudm5zTjdHcWxLQXdl?=
 =?utf-8?B?bnVKK0FINXFXS0VhMG5hd0RTb2JiTUkrSzk4cHE4R2NQUkpIU09ycUFZbnRU?=
 =?utf-8?B?aW12SSs0TzVWVUVsM0E4cHB5dzhkcjc0Qy9XQzBiMGJmVDI0ZG8zT1Uvb0I5?=
 =?utf-8?B?RW8weG4vdUZkcllkUGlPeHM4OWtYR0w4NGlvci9lcmo5dkFSQXRMSjliK3Vr?=
 =?utf-8?B?K1pnbkhGZERVVXo0OHQ3VWJlbFlhSHBaaittK3dSdGVpU21QVkNaNXBLSk9V?=
 =?utf-8?B?UEJzR3VKb2c3REtvVElnTHFMTzBqSm1KRGpPL3MvSHdxZGV6aUNQQllPNHlu?=
 =?utf-8?B?WGJKV1k5R2lQT1BxUjQ4Y1Q5cHRhNzVobDJkM3A0ekc5dmpnNzhidkZqUVpU?=
 =?utf-8?B?TWNvbmNlR01yLzFhQmFJUlg0OGNmM05tR0ZORUJSaE9kQUJVcER0QkNSb2Fr?=
 =?utf-8?B?cEFWUFBWNHZNaDNyeFdlc1Rmbk9BN2FESEtsWWYrdkw4SWMzWUxOWGNEcWRR?=
 =?utf-8?B?cXdtRjJ4RU5pVUY2Q3FCRi85TVlxOWVZSmdVb25LN0pFdExzUkJBdGtLNFVV?=
 =?utf-8?B?TC8xMzFSeC9valM4VTF6RWRESi9lZHg4UGwzd0N0WkhsMDlvZnRCOW1qbUt5?=
 =?utf-8?B?c1FUWkh5aXZSM3dnZ09DdGZjdGxUUE9PTUlETUdMS20yL0tKR3o2cXZEdG9k?=
 =?utf-8?B?NnlFdWhwQXlxRzI5VDZFdG1YS044Y1lTdFUzUnpmTWJpMGh0K01uME1uU3Av?=
 =?utf-8?B?NHZyTjh0ZTV6SXd6S3ZzbHA2WEdtMlljQW5mSll1RzRtSEZ6N0RpSU5Xdm9a?=
 =?utf-8?B?bFdUM091a1d5T0NLOFdRaklHSFRMSzhMRGRDUksveWkwd01ic1FFVmFaSlI0?=
 =?utf-8?B?ZFhZUCtsWjVad09GK0Y2RC92czFIMG5sZnZKZUVXaHVkbGNRbklKajdxaUFI?=
 =?utf-8?B?clpnMkFjaHByL3JKNkdMR0R3MmJEMVJlQmlZaDhteUM4T0RUd0hJb2NiVmpC?=
 =?utf-8?B?bWhOZFozMWRvZUNQZWNrL05pY3lKZkV0TCthS0lpVlVCN1JhRjVvRnJuK05H?=
 =?utf-8?B?ZE4wZEhUYlB0U2k1M1pEbkxnMHArUlB4bmNaYmlqOWVNR0Y1WndZTHl1bW5s?=
 =?utf-8?Q?zyiBnRHZnCD0C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 09:34:09.6280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b6d9bc-7696-4f1f-83e1-08dc78b0007a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> Handle the parsing of the 'xen,shared-mem' property when the host physical
> address is not provided, this commit is introducing the logic to parse it,
> but the functionality is still not implemented and will be part of future
> commits.
> 
> Rework the logic inside process_shm_node to check the shm_id before doing
> the other checks, because it ease the logic itself, add more comment on
> the logic.
> Now when the host physical address is not provided, the value
> INVALID_PADDR is chosen to signal this condition and it is stored as
> start of the bank, due to that change also early_print_info_shmem and
> init_sharedmem_pages are changed, to don't handle banks with start equal
s/don't/not/

> to INVALID_PADDR.
> 
> Another change is done inside meminfo_overlap_check, to skip banks that
> are starting with the start address INVALID_PADDR, that function is used
> to check banks from reserved memory, shared memory and ACPI and since
> the comment above the function states that wrapping around is not handled,
> it's unlikely for these bank to have the start address as INVALID_PADDR.
> Same change is done inside consider_modules, find_unallocated_memory and
> dt_unreserved_regions functions, in order to skip banks that starts with
> INVALID_PADDR from any computation.
> The changes above holds because of this consideration.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Note:
This patch will need rebasing since it does not apply cleanly on staging.

~Michal

