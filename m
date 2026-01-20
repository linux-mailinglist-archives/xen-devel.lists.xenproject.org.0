Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMmvLSm0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCBA48223
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208981.1521107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCFJ-0005Df-JY; Tue, 20 Jan 2026 13:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208981.1521107; Tue, 20 Jan 2026 13:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCFJ-0005Az-GX; Tue, 20 Jan 2026 13:58:13 +0000
Received: by outflank-mailman (input) for mailman id 1208981;
 Tue, 20 Jan 2026 13:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viCFH-0005Ao-EZ
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:58:11 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b116760-f608-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:58:09 +0100 (CET)
Received: from BY3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:254::27)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 13:57:58 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::a9) by BY3PR05CA0022.outlook.office365.com
 (2603:10b6:a03:254::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 13:57:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 13:57:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 07:57:54 -0600
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
X-Inumbo-ID: 0b116760-f608-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AopPg9THoOIknOlQGWXAW54zCb3FNrS03PSctsnpUYWXOnti81C6jBxn1wtXtv6YH+Gy0DmEGwA9ldZj/5zrEzAXBo2Kt4pRQDdKb6rucJv7MLfHmeKGZP4T3620we1NeFzzFIUsH6TNLAv+0N81RWUm8A0Imn/3Vthr3b9S2PriqgD3LRNGdcFnipG+nyWe3pQ5/YElu1oa0B7CCgpLO80sRW6Cyf86zmpv+orVPjKInHY5Ra0uSWFaHVthDqPi3LHAph6FDSVLgNhb/Udjz0nAt6o3O7XvbvPhmLvh3YnbovDbDMxJXGT6tmfAiQLh7Yx0QrQ5jisfWTBbgLwOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8CGmBzqZv+YO4Pg8zzYB4tgZG4wHe2PlGGzoW7v3mo=;
 b=yZ9+vgcvoUV0d9OTUaHiGm8E/5n+WzKOu4lfFa89YnyQO8RlwN8megjZB3svnHDuhlmLqCP1FxWGRsJoboTl/dACWU8FNg7CtQLeQ/te0ff91w28gTL+VSNqs8zOiqbdnP3NKrY1Zyq90OGbI/rqZSpk6W32O8QCmFR4gtcPlYNGib29bPXBBwvB0igccQYDM6v9p7WlZMDruQbQ6QDpnYNp7TJB0lshawekxcPy1EtDVXic4SP2/UKjOlCfcGFRaESDUH/mUSYQGEbq8BUpTqUdLP3qIwTZOs4/sdMd4T6mAqVl1CZWzzXCleLeMCOJ7hozVle8WwAYi6JJuu+XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8CGmBzqZv+YO4Pg8zzYB4tgZG4wHe2PlGGzoW7v3mo=;
 b=5pJFx+s9WY8XHq4Kp4SwIh0q+odS/YVgSZGutdpZMiISq1MaD/WqmeeGVWOLH5QgulJI4GGIq1O+P4vDCZeUZkN/a7cuK2MRRqS6pklwo/S0y75Yw+eZcN7bKRHPhIY6u0AHFnWUCsmyCojAqJyM2QBnWNXNgdS1m8IK5wIU8Rg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 14:57:52 +0100
Message-ID: <DFTGWSL7X0C6.2ZON6LWRGQORW@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] x86/svm: Add infrastructure for Bus Lock Threshold
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
 <010b9a56-4e43-4813-b705-e34d8b4a67c5@citrix.com>
In-Reply-To: <010b9a56-4e43-4813-b705-e34d8b4a67c5@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 319e291d-fda1-4934-5ec0-08de582beacb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFRxbzNwbUdIakRlcEFEK2pISG4rSTR2dG1YeUhNWVI1bkxlTWU5b0pzam9Y?=
 =?utf-8?B?NVVnMVJSaFhOVkt6bjZBZzNuSVdmS3ZyV0U2WUNaTm5WRXRFYVBTUlh1ZkFQ?=
 =?utf-8?B?c2NzcXJyQ2FBck15TE9UY1R6cWNMMmo3dlUvdjQ3N3k1eWQ5UlpySEZIOE1D?=
 =?utf-8?B?cFJ2MzlabkE4RkVNZ0tQRk9ueHU4dDMreEN3QVg3Q2poa05XalhRNWVSWDls?=
 =?utf-8?B?WmRaK2pvNFJNUGw1ZWh1dHVDaUNkbDNJcG9DdTJESHJSTVBGSm1XbDRERlgx?=
 =?utf-8?B?cHRiN01WUTdWYXBaRm5WajRZVFQvQjA0YjRhRVduREdqSVJDZG1zTXZiYU9m?=
 =?utf-8?B?bHRwK0grc2IwdnFwT0J1THFyWCtSZUdlc25XSlpsMzBnMDhZREtrWi9SVkFy?=
 =?utf-8?B?a3Vha3VSRCtjNk5yTU1SL0VWTVJhdHlBTE9MVVFPd29vaW1ZWWNvTFhQUkd0?=
 =?utf-8?B?b0RSWVptbWhCeU90U29UZjYxWThRa3hid3AxY1hSTDhLTU9HVkRrcDVHMHNJ?=
 =?utf-8?B?dHFycTh4QnpiNDk2eDlidVIvT2Y4UHZvSGtIOUQwVm1ZamFISWdNc1V2TGty?=
 =?utf-8?B?THcrZGJCMDZKVXBKMVlCd3htMDh2QjVyaHcvNjEzdlRXcmc2RmxZditQcm44?=
 =?utf-8?B?dXR3RTNRekJXemR6MmNwSk9OZTNoMEEyM1p1TWFTVTgrT2g2UjBzNzNLaDFL?=
 =?utf-8?B?Z1ZzUU9tamkxMVJrTUpydGdxMGt3Z0c0QVhDRENRS2tyV05ER2YzakpmeFlU?=
 =?utf-8?B?SHpVNllaVnl5azhRYjdETXVxeUZJbGVMTHZlVW1iV283QVBiZ1NTZDRCNGUr?=
 =?utf-8?B?L3NEcjZPMFpQcVEwNERCeElZcnRYOTRSWU9lSDZJb092NFlpaWNKSHNCd0dH?=
 =?utf-8?B?ZkhvK0Nsb3RiZnVrNFQ2NEE0ZnltVFVHVkRHQ1ZzMXNOZGZkbDcyNW5yUzRa?=
 =?utf-8?B?ajE2QmJsb09obHFTbjVoSmVtLzVDTk93RjRiNFN1RE5maHVBVDNEZWdJb29T?=
 =?utf-8?B?RzNxZmlyYmxPd3Q0LzVmeHo5c2lMSjVPRzBkUU9wTnNITHVWUEdOUUFKc3Vh?=
 =?utf-8?B?eTFnOE5vWDFjK0lJdlFLdWJ1Z2NQTzRmelplQkw1b2kxOHRUWU9jdVNhQ3ZZ?=
 =?utf-8?B?Z2dWMFptUm1zSGova0VFWXdJeVkxRE9oMkg0U3NrUHBCbDJoTUt6a09BRFRJ?=
 =?utf-8?B?aDlYRjJxeGg4eGV5YUx6clBGODFibEtteWR5SThwUi9XKzIyOEVQUlpvSlhz?=
 =?utf-8?B?b1BCa2lweGV1VFpuYUxYejI2MFVmU1JtdUhUYmk0QkxqRDF2ZjBGT01YYTd1?=
 =?utf-8?B?ZGN3M2JWc3V4MXRVU2NiSTQ0L1hmTDcwVTFGemU2RjhGZjBXWDcwVHlFVTBa?=
 =?utf-8?B?Q3RsYUdVMXpNaERGL05JdjdsT1pNOEE4aWZHRFZ1TUpDOC80aTRvSUU2SEh1?=
 =?utf-8?B?bjJaK1ZwdkhhTm9RWjN5aW9ITTdHRG4waTg0aSs4YkpQMWg4Wk85MW4vMnVV?=
 =?utf-8?B?am5tdkZFZC80T2tqNkk0Zno4VGtRbzdkL3ZaOElNWE9VVzhvaXRkbGVGbk9Y?=
 =?utf-8?B?cW1GNUxEN1RiaFJBMU9KUStFUmk5a1VsNHZHYksxZ1ZHelJYaW9JSTRweTVw?=
 =?utf-8?B?RkVzbFNBZWs3YThmQ2ZZYWFuY1p4QThQWHZuakc0MXJjYTBLTTRPOXhtZE1q?=
 =?utf-8?B?WDBlaHZXRXEvak1nRzUzY01qWXJKdWE4K0xtd1Q3MXRmOXNacTR5TVBFSUhp?=
 =?utf-8?B?NVM3SE1NY21CTlpHdmdpa0NzaGVzSW1SWGtXTTdCZWQwSUovV1lDTGt1LzlO?=
 =?utf-8?B?emExQk5hSXRuQ25iVi9xakN4NDVFL3ZzUFpncUNpamk5U0g2cFlRTlV5RjQ4?=
 =?utf-8?B?WW5ZaWhQSjJYRXlFZis5a1Z4S3NNUE04b0J2L2VjclRta2tjVWJqSmwxd21J?=
 =?utf-8?B?d0laTFp5MGRlY2VWNEFhaDdWRjFyVEJSNUhJNjBNdnVKbC9WbFpZcjdJbjRM?=
 =?utf-8?B?OFlOWFV0QXVEWkxnZXc0VlZCR2N2ekJ6cHBaMWZNMS9yYWxMWHhMcDUzdXdB?=
 =?utf-8?B?VW43U0JkRjZZcFlKTDkxTlNLTSs3ZGZ0Z0tONkFHZkh3OEpSQTV6eElWQkl3?=
 =?utf-8?B?ZzZKQXJva2FhckxIcUo2WHRseVFiclZDWEtsTENWcWVLZU9jazFFOEQyTG1Q?=
 =?utf-8?B?SXJJTTVnNHJoaHZzNG9seWRXR1J5d2Q0R3BYZEtZcGN3NnRJdkxwODdGdERr?=
 =?utf-8?B?cmpNMmFYd1RsMzRCd3pZQzRLQVpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:57:57.8469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 319e291d-fda1-4934-5ec0-08de582beacb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6DCBA48223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 2:12 PM CET, Andrew Cooper wrote:
> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
>> index ba554a9644..85e194f247 100644
>> --- a/xen/arch/x86/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/hvm/svm/vmcb.h
>> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>>      GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>>  };
>> =20
>> +/* general 2 intercepts */
>> +enum GenericIntercept3bits
>> +{
>> +    GENERAL3_INTERCEPT_BUS_LOCK_THRESH =3D 1 << 5,
>> +};
>
> Abbreviating thresh like this not great.
>
> For the intercept, it can probably just be called BUS_LOCK.=C2=A0 There's=
 no
> other form of such intercept.
>
>> =20
>>  /* control register intercepts */
>>  enum CRInterceptBits
>> @@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
>>      VMEXIT_MWAIT_CONDITIONAL=3D 140, /* 0x8c */
>>      VMEXIT_XSETBV           =3D 141, /* 0x8d */
>>      VMEXIT_RDPRU            =3D 142, /* 0x8e */
>> +    VMEXIT_BUSLOCK          =3D 165, /* 0xa5 */
>
> VMEXIT_BUS_LOCK for consistency.
>
>>      /* Remember to also update VMEXIT_NPF_PERFC! */
>>      VMEXIT_NPF              =3D 1024, /* 0x400, nested paging fault */
>>      /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
>> @@ -405,7 +411,8 @@ struct vmcb_struct {
>>      u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
>>      u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
>>      u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
>> -    u32 res01[10];
>> +    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
>> +    u32 res01[9];
>>      u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
>>      u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
>>      u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
>> @@ -489,7 +496,10 @@ struct vmcb_struct {
>>      u64 nextrip;                /* offset 0xC8 */
>>      u8  guest_ins_len;          /* offset 0xD0 */
>>      u8  guest_ins[15];          /* offset 0xD1 */
>> -    u64 res10a[100];            /* offset 0xE0 pad to save area */
>> +    u64 res10a[8];              /* offset 0xE0 */
>> +    u16 bus_lock_thresh;        /* offset 0x120 */
>
> bus_lock_count, which is basically it's APM name anyway.
>
>> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/a=
sm/hvm/svm.h
>> index a6d7e4aed3..14fe4abf96 100644
>> --- a/xen/arch/x86/include/asm/hvm/svm.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm.h
>> @@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
>>  #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
>>  #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>>  #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>> +#define SVM_FEATURE_BUS_LOCK_THRESH 29 /* Bus Lock Threshold */
>> =20
>>  static inline bool cpu_has_svm_feature(unsigned int feat)
>>  {
>> @@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int fe=
at)
>>  #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE=
)
>>  #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
>>  #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL=
)
>> +#define cpu_has_bus_lock_thresh cpu_has_svm_feature(SVM_FEATURE_BUS_LOC=
K_THRESH)
>
> We actually discussed this on the x86 call just yesterday.=C2=A0 This wan=
ts
> an svm infix to match the others, and the thresh suffix can be dropped.
>
> I can fix all of these on commit.

Fine by me. Is that an implicit R-by?

Cheers,
Alejandro

