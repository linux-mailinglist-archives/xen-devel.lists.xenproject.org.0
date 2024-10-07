Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F669937D9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812393.1225124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtvo-0005SP-EJ; Mon, 07 Oct 2024 20:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812393.1225124; Mon, 07 Oct 2024 20:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtvo-0005QO-As; Mon, 07 Oct 2024 20:02:12 +0000
Received: by outflank-mailman (input) for mailman id 812393;
 Mon, 07 Oct 2024 20:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxtvm-0005QI-Vf
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:02:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08647281-84e7-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 22:02:09 +0200 (CEST)
Received: from SJ0PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:33f::29)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 20:02:05 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::34) by SJ0PR05CA0054.outlook.office365.com
 (2603:10b6:a03:33f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.13 via Frontend
 Transport; Mon, 7 Oct 2024 20:02:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 20:02:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:02:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:02:04 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:02:03 -0500
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
X-Inumbo-ID: 08647281-84e7-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVx3Ej7bhpb1xkaHR4cfPZP3YvbMSHSwDO1a9NFtekaXvp39JBm9OJSbRTrKZEjpChBANpPHQ40FmaIzfiQlucNMg8nX7vrR6og27KcGZRqrS0XYFmoWN3VFplF+K1kmTHW0pP57PDWDdqleiiSztx6PBL586Tx45O83iSyTY2bB03xYxhepriTl8vNEqTHarycHP3EGTg0cGN56+khoSFtHh/ik/+o6eYQs+Z3G6z55LozbEnFI8KuHMCKR1htS8Ep9WD0y8qOrRIc1hbUh0fZ35/iQQ3wQDSXx3k7SdeQxlWd1k50fY6rkePQrCqIvBjo2KJaDrOCNHPMCX8S6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvDiLvzIcbE3BKIWnhAdC7LU+eUaE8AcSFhnuIGATzM=;
 b=Hox2bAAz8iK1v4lG7LubZ8J1WH77ZVcqcZ9ok5pp9jk80Nac4QMoiKX4F8tjPO9J/NrOv0ERzeNzrF+Ci49sr1JIoJu+0umWrvjKL5uTWBu+HZzuBugZS//6ADcrPbxd4uHuLJ4PbmPdZ1pwBxLhMxXNqUR4NtJIiwPYhPFU6wxuBfkiMvwtO8jN2ivmQ8cAo0TD6a8430E/M+ZGe3S/5qqjmvNUDBx/U13B4TRGnBuA/hnx1EIkQI/s6c7BN00KSfGcQtwNZGnulf2rZOz4AYEhXRRj6xbeGc6QbxG0RuE9RdgsBSr3BDkZ5Sb9B9cK8AMNPDoyJzi2ZpSyleFnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvDiLvzIcbE3BKIWnhAdC7LU+eUaE8AcSFhnuIGATzM=;
 b=XEYaEcMnAVnKjNK/YaYBt/RZOQlNoEacn1cmGCNhxxTgnSp8+HLJVRT2Cad2nOMx+VBQFILKfK6YE9bPEFEsh09QocVgJOQ4We2mkg2qOiWdEEkgzDrEaTr0RAnqRMh7eOLIV5uQa5cS2SYu4fjyNS50+9Ob9j+ahGgtmrz0rg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9372d72c-c98d-495b-bc3c-8b81208f7cd5@amd.com>
Date: Mon, 7 Oct 2024 16:02:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/44] x86/boot: introduce boot module flags
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-11-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 34af617d-dc80-432a-b29d-08dce70aead4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNERWNwMjAyS0FWR0RNdDNlL0lSMVlTUFpJeFgzcXFoNXc1dU1xcEtwMXNn?=
 =?utf-8?B?NzhpaXlwbzUvVG05K0RNUW9WclRzRWc5UXVodXlnNVBqV2lsVWpBNWh2VmF2?=
 =?utf-8?B?Q3ExOE94K3VPYnovMCtWYUNjSzFHejhuRDNwS0V0MjUzZDNyc2Z5eDZreTZn?=
 =?utf-8?B?aStEUUdtQURnNG03ZzU5ZjNVdERyVjNpcm1wOTlTdGVkSXRBZUgwb2xSNlo4?=
 =?utf-8?B?OTZiRnlZR2FXamNjeFV4WWhERm5LVkFzbTlLbWFmMDc1UkVIRFdJTzVDVlQ4?=
 =?utf-8?B?N1lEaEF5WUt1N2dqY2FVQ29xVVpTN3cxZmFZTzJiVzNyTVp5cUM4QWpvNGlV?=
 =?utf-8?B?bnIyci82cC8wNVBmV0NXcGFRcUZ1WFd0US93Q29YNUh2OVIraUtBWHhzWGhk?=
 =?utf-8?B?dmF0WTdkRFVVbEhBdUUvZzBlL29zbWhhOVVlNThZd1FYREJ1dk1DSmM1ZXgy?=
 =?utf-8?B?alRhVU1kNFBNbjh3SFBoS2kzamFXdlAreWVmS0hOaU5nUCtXWHBtZDExZW9C?=
 =?utf-8?B?MzBHUTJ4R0NxcW0rcm5wbGR0YnRtMTRHK1FXdE9obURhaGgzNU9KeXFaUGky?=
 =?utf-8?B?RWRwT3UyL1k5UVF0Y1E0RDhXbXJQaGFHajh4aU1aTFl6amN6NlQrZzlIcE01?=
 =?utf-8?B?ME5CZS8vRm8xdXNFM3Nhem9ydzZjQ29EeXRJVEpQZGpaR2VBSW0vSC9RSFgr?=
 =?utf-8?B?RTF1UWNiemF3TGY3MHFJUWJMcTV0QUpjVzBHU2NOQVBzL1h0eWh2Y3pQM3NY?=
 =?utf-8?B?U2MvNEI2V0t3a1FLaVZBeGo1aHA2NjBZa3FhWVJqbzBZa3ExbEwwb3VHS2J5?=
 =?utf-8?B?TjV1UzBNbHYzdVROekhIUkdHcHhXYUYzN1grODhnelhmbUtIRFBXaUNaTGlp?=
 =?utf-8?B?QWJ5MUF0N3RRTVdacnhaS2FsMmpOM2R2dVZWMHloWldhRXB6YVg5bFhEWGtz?=
 =?utf-8?B?Q0FQcG1qdmZwZmIwRUpyQmNxNDRVc1JYWW5MNy9hNkczWUR0YWVoL0g4VFpM?=
 =?utf-8?B?OEIrdXlxY0ozMkdCanN6WTJZbE02RzVwSVYyRUcwYStvcVd0eGtFVDRsdnBi?=
 =?utf-8?B?bGl5OVBQS2tBVS9MSkN5emp4Y3ZobGRCbVdlVGxTSTdkTzdzeWtlR2p3WkQz?=
 =?utf-8?B?U2RjZ0tGNE51RXF2K1MzRVVrVVNTc2R6ZnhIeU50SlN1K1hTa2piQlVpQ29m?=
 =?utf-8?B?N3RuSS9nL1BDMkNvSTF3QUNOREgxSUhBc21KT1hZRWtzTUFpS1BUV2xQTWRK?=
 =?utf-8?B?aHRHT2JBQWhMMDZaSFc2UXJZdFo4aWo4bnFuVjZaYTd4ekJ5Y2ZWbDRZeXlk?=
 =?utf-8?B?bmlhYXYxT3Nock42ZFZZWDBYd2tPcW9hTEJBZUZJT1MramxIYzVNVVRlY3hp?=
 =?utf-8?B?NzNRT3hxR216ei9NeXJNLytGamlwci9BaHlaejNmSCtDdXp0U0tHMmNJR2pB?=
 =?utf-8?B?MWVPNDJxcmNMazFETXFja0E0NGVnVXJtdWxsUmZpSk1MUGczcG0zWjVTYWNt?=
 =?utf-8?B?aXljNjUyaS9QR3hpbnNkTTlnMStNSnMzOUhnSXdmakxPR3pINlova0V1M0Fv?=
 =?utf-8?B?OXQxQktqUWpScWg4QUdqYytLM0FVS3VPRklCQzhGOTFGK3VKQjZ0L0JmWVVK?=
 =?utf-8?B?M1I3QTdHZXBCb0hDMDdzNUhuZFlJY0U1L2R4Qnovdng0T0F2Vzc0aGgvREQz?=
 =?utf-8?B?QlY2WDVHMzJNOGlWd2NwcU1TSVpBeDhWNHhYVFczQnI2cWg5Z0xHczA1aW5x?=
 =?utf-8?B?dTd6RTc3VHk2eGV1ZjJQbEpzNEdBblNWaDFjRzBNSUVlekd3Tnk5WHlKZHpC?=
 =?utf-8?B?bkpPc0tXeHNCOWpQMFNZZDJtSVVjbUR5Y1JIS25TWXd4cGlzaGdRUVA4NEdr?=
 =?utf-8?Q?+sXvC5tz1665o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:02:05.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34af617d-dc80-432a-b29d-08dce70aead4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On 2024-10-06 17:49, Daniel P. Smith wrote:
> The existing startup code employs various ad-hoc state tracking about certain
> boot module types by each area of the code. A boot module flags is added to
> enable tracking these different states.  The first state to be transition by
> this commit is module relocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootinfo.h | 4 ++++
>   xen/arch/x86/setup.c                | 8 ++++----
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 6941a8975ea6..021ff0d93643 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -31,6 +31,10 @@ struct boot_module {
>        */
>       unsigned long headroom;
>       enum bootmod_type type;
> +
> +    uint32_t flags;
> +#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
> +

Stray newline.  Otherwise:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>   };
>   
>   /*

