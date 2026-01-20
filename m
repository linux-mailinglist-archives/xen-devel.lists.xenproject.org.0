Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLFhMfyzb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D548188
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209123.1521248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDec-0007go-1a; Tue, 20 Jan 2026 15:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209123.1521248; Tue, 20 Jan 2026 15:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDeb-0007fD-UG; Tue, 20 Jan 2026 15:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1209123;
 Tue, 20 Jan 2026 15:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viDea-0007MF-Qu
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:28:24 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6fbb0db-f614-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 16:28:22 +0100 (CET)
Received: from DS7PR03CA0248.namprd03.prod.outlook.com (2603:10b6:5:3b3::13)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:28:18 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::b8) by DS7PR03CA0248.outlook.office365.com
 (2603:10b6:5:3b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 15:28:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:28:16 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 09:28:14 -0600
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
X-Inumbo-ID: a6fbb0db-f614-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4r8vx7hdyFra6jZt8eu3Hx6RaDGT3fq3o3dt4sadqHXnkekjKe9fUboRRCCrKPeETGu1EXGVubrt8uBtteTIY1xmjSo8TiM6qo5TgwXag/cEvMTvJnCQn3xiDGZCAsIT24ULszKNSzyO7tZWEeuQ5/p2X0v25r8HE6YsqxDUPe5hCidSu2SudoF35VHeU0YI60SvLyI261Y6eQynF0AMQsWIsbpq9C953/MS9y8vZU29isyPQZ8AizFMW3N3SvTwpJt5xBSpHYAJb9SiKTIKtY33/Ih+VPMP/I6PJa/eXYf57pTWuc2AnTCxFoYao1XyOq3+ZWr+glbFu32u21WZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOuSx538KMBfkUxjrEMNsTmB1lgKlsAkuQAWP2CoswM=;
 b=XRPinwiCzWs54AHR6YybdjtdyOSKxd4nZd8FSLkLU2NBPcx7ppMM2Y7bA8qCJBK/kHKVX+0nnvqAs5+opFaIR3w98izFuT8eZhlMVE8rTSGL7EvZaSomiC5WKsSu6uNhDRJcshIexz19BuR/a5bEoHuZxfA4mTW7QQq16u5ngiYX9ToaAR7kn8xFNNqVnGEU37sngqzRtBFfKuhh0xp4Qbxgw1claRQFN4G8+gq6oljEg+dWVGXEGtLs2iRR54I/Rx6UGVJgI4vvKsZ8+VbBfv2R04r8onWeB6g/MEqf5o0H5RZ4uZFWzl9S1lQym8jEPIjklxk2eAebgb7XVoFQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOuSx538KMBfkUxjrEMNsTmB1lgKlsAkuQAWP2CoswM=;
 b=LbYx/mT6zXkqfHWVuTD9vQT+Bid5ACFeHOXJxGmfUN8/mAfwy9GKZkZIFIoWDBx3RwCG/lCjEfa/Sq3F92B08qzPJw9k9jKe/3qhgagpY+MHZD5gKO6sY80tGxZeylZtyKIiNIUp8EokPeEppMEgYtwa1PWMBHzv/dooL0MfUig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 16:28:13 +0100
Message-ID: <DFTITYPYGHMY.1096HGJFT1HNB@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
 <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
 <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
 <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
 <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
 <4ec779cb-3cbf-42cf-b744-80145d3cd54c@citrix.com>
 <48ccad85-8b6b-40ae-938e-b6ef9dae0ccf@suse.com>
In-Reply-To: <48ccad85-8b6b-40ae-938e-b6ef9dae0ccf@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: a0736131-fdd6-4b2f-cc92-08de58388848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU1wcTdhNmxZNWZ3NTFTRlhreEIrRU1XOFFlSWdJYU1KWWcydCs5b29UazNO?=
 =?utf-8?B?K25JY1NVK1pjcEpYbHRtN3R2RHY3bWExbVBvNS9XU2J5STgzcmMzcWdadDdR?=
 =?utf-8?B?L1dMUWEyTkhYVGtjK2Z1MVJlb0F6MlJkYWlXZyt5NS9tT2N0c3NSdEtaTVpl?=
 =?utf-8?B?UnNQYzlYYXRkMVZ0dldKYUtkeWxwOEQvYW9tbWtHbEtWemdjUFp3c000NWlo?=
 =?utf-8?B?Q2t3K1ZWZ0szNzViOTVCVmhYOGVsUmthbVNBdzRQQXpYN00yOHlTT0xJMUMx?=
 =?utf-8?B?eElqYldTVW4vRWtJa2Npd2ZWR0pmOTMxb1VzaDhwTDNqeGl2dFFubVI2VlA0?=
 =?utf-8?B?eUcvbDY0b1R6NWl6NU55bHA2VExFOHluSG1JbWxYeFc2NWpNSmE2ZHJOQlZJ?=
 =?utf-8?B?Q2o2VUc4NDFPMktlSlNabW00RUFwcTEwcGE0ZVJMU3JzYlg2ai9UZEdTVlBn?=
 =?utf-8?B?OHVVY2tJdU0raVMxVzFoUnplMU0yWDRvVVFnTGVLL3VIZG1vNEN3bExwamc4?=
 =?utf-8?B?T1JsTndITHNQVnljUitLLzJHRlZXc21uVldWQkxiRXpMS0lpMGdSdi9MRGJM?=
 =?utf-8?B?ZmhjNmdCMGVnR0NMdE1ZWjg4MXRKYzlsQXhTTUFaRkZWUUU5bDBvRjlGTkxG?=
 =?utf-8?B?akxhbGZqd3FHWnFZcS9VdUJQbWw3ZWpGS1MreDFUMkNEZGtyT25Jdi91eGNq?=
 =?utf-8?B?NmMzdUNkbm5BaXVsbENSMlZoK2FMQUZzd2pvVVFEakxLZTltRXNxRlBBVnFP?=
 =?utf-8?B?RC9QcHA3Mk52MnFhdFFFL282aGVSalRRb01lR3o4NHdNMkE2bzZTbFN1MS8v?=
 =?utf-8?B?czU4ZVZDQ1VwbTRUZit1ZXVEbU9hemxRMWZpaW04NEMxVFZKOHI4Q2V5SWxv?=
 =?utf-8?B?cXRrYzU4c29pU1YzS0lNOWdpNDFWcEN4RDhaMEZxckxGV21HMWV5NnpxRys2?=
 =?utf-8?B?QlZCektDWXZGTVhxYUwwVVhmUGNyNW9oZ2dXMzdxYmpBODgrbGppWUZlaFAx?=
 =?utf-8?B?N3VBRzJoVStILzNjYXJYSEJ6RHV6azdJbFUvNVdPOTEwWVRhcVdlUFlxdlAz?=
 =?utf-8?B?Q1NCVHVXSmFjaCtzTEszMjJGUXdxOFhpZURUcm9JcGEvVE1tenNiSWg3RkFt?=
 =?utf-8?B?eG14WWdJM3d5Vld4NDZ5QjdZWUo3bWo4eVdPSC8rV2ExM0tDcGcyUWF0TjdB?=
 =?utf-8?B?NzJ6TC8vOWxXQ2dET2VEYmxMWDJzb2k5dXdyb1VKRUM0WlhXZmJoSVBseEFO?=
 =?utf-8?B?ZmYxWGE0RjV3Wm5hNnptMk1JaWJBaGpIS3VkSGxiWW5SVzBVK1p4UUsxdC9z?=
 =?utf-8?B?K1VIV0d2d1ZDalA2S292andXY3NZaVpVZUl5UkxCV0NtTTBzSXduRVp3STdO?=
 =?utf-8?B?RE1MblpHRWFDaFp5VHNkTEtZTXVHcHU3TzZtYzZYbFRzaUhlc3RIYlMvZFdw?=
 =?utf-8?B?Sk1yM0VNR1U1SzJQOFMvNDRYZ0kxVnd1U1ZrSm5DZGd0T25RWFVSSE1MWmxL?=
 =?utf-8?B?VjFDUFY4ZFdEbDdkOTZWRWlMTlkwSXUxZklYRG1GNVBscGxjMXdzaXk0MnN6?=
 =?utf-8?B?d3JjVEZhdjJBZ1lWSFNtMmlsVnljUXpRNjR0bkUrYW1UV1hjcy84Y2hvbjY3?=
 =?utf-8?B?aVJvb0ZpRUhHaWxkemhYWWxib1l3bitsV3FYc0ZYQVNnVGt1d3pzeGN6bHFx?=
 =?utf-8?B?blRrV05QR0VzWWpmb0tneVNJU2ZLZm5vOHRkTEQ2VmRJUTM5RXBJbHNFbjV6?=
 =?utf-8?B?ZGRtSUxrdVlKTGtvMWZqWUZsNjVjc1IrVmdGRmgwbFFzNzQ3RHd4LzFMSWJM?=
 =?utf-8?B?ZU1PRVN5NFVoZkNUK21IRkFLL3NmKzNNUnpacDh3YWdvc1ZaTkNycU1kK1Rv?=
 =?utf-8?B?VW9pOTFCNStxY3dJelJqS1c4S2dtU3ZxRElxdHVQQnhSWU94WDhzSUVRR0hi?=
 =?utf-8?B?MGowSjRQREFrYTZpY2V1cVlsTUFEVGU1cExZdy95cHZmWEJkb0lrVkQybFZD?=
 =?utf-8?B?bzEyRkk1cWpHR1VoRTd3VzJsSUk2djk3VktzZDZxK2hmaVhlUG1Yck9iSVFP?=
 =?utf-8?B?L3Z6SzVYOE9zRGZha2FqRWdtZDBPdkpYajAyK0tHWFo3TmdNTVpQT0V4R3pN?=
 =?utf-8?B?d3Nqb3o2M3F5MVVzUnhGRWNXekpwWmpOeE5HWjBncDE0YW5aQTd0QklHV1Zq?=
 =?utf-8?B?NmJPZE1STzlXM2JWbHVweW9oazk0SjVNWWI1LzQ2bUVOd1orUnhLc09yK21j?=
 =?utf-8?B?dVJvOUJDeGNhOGRpVDAzanhkSVlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:28:16.0651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0736131-fdd6-4b2f-cc92-08de58388848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7C1D548188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 3:32 PM CET, Jan Beulich wrote:
> On 20.01.2026 15:26, Andrew Cooper wrote:
>> On 20/01/2026 2:16 pm, Jan Beulich wrote:
>>> On 20.01.2026 15:11, Andrew Cooper wrote:
>>>> On 20/01/2026 1:34 pm, Jan Beulich wrote:
>>>>> On 20.01.2026 14:29, Andrew Cooper wrote:
>>>>>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>>>>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>>>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEB=
P       |
>>>>>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>>>>> =20
>>>>>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>>>>>> +    {
>>>>>>>>> +        vmcb->_general3_intercepts =3D GENERAL3_INTERCEPT_BUS_LO=
CK_THRESH;
>>>>>>>> |=3D
>>>>>>>>
>>>>>>>>> +        vmcb->bus_lock_thresh =3D 1; /* trigger immediately */
>>>>>>>> Really?=C2=A0 The APM states:
>>>>>>>>
>>>>>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>>>>>> Fn8000_000A_EDX[29] BusLockThreshold=3D1), the VMCB provides a Bus=
 Lock
>>>>>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold cou=
nt. On
>>>>>>>> VMRUN, this value is loaded into an internal count register. Befor=
e the
>>>>>>>> processor executes a bus lock in the guest, it checks the value of=
 this
>>>>>>>> register. If the value is greater than 0, the processor executes t=
he bus
>>>>>>>> lock successfully and decrements the count. If the value is 0, the=
 bus
>>>>>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>>>>>
>>>>>>>> So according to the APM, setting the count to 1 will permit one bu=
s lock
>>>>>>>> then exit (fault style) immediately before the next.=C2=A0 This al=
so says
>>>>>>>> that a count of 0 is a legal state.
>>>>>>> But then you'd livelock the guest as soon as it uses a bus lock. Ar=
e you
>>>>>>> suggesting to set to 1 in response to a bus lock exit, and keep at =
0 at
>>>>>>> all other times?
>>>>>> I should have been clearer.=C2=A0 I'm complaining at the "trigger
>>>>>> immediately" comment, because I don't think that's a correct stateme=
nt
>>>>>> of how hardware behaves.
>>>>> In turn I should have looked at the patch itself before commenting. T=
he
>>>>> other setting to 1 is what makes sense, and what ought to prevent a
>>>>> livelock. The one here indeed raises questions.
>>>> Setting it to 1 here is fine.=C2=A0 This is the constructor for VMCBs,=
 and
>>>> *something* needs to make the state consistent with the setting we cho=
se
>>>> at runtime.
>>> But the setting at runtime is generally going to be 0
>>=20
>> First, we need clarity on what "Initialising as zero is invalid and
>> causes an immediate exit." means.
>
> +1

The exit is not an VMEXIT_INVALID, if that's your fear. Let me clarify:

The TL;DR is that the commit message is the unfortunate side effect of tryi=
ng
to remember why I did something a while ago and not remembering very well.

Initialy I had zero at both the initialiser and the reset. That doesn't get
very far until you notice the behaviour is a fault and not a trap, which th=
e APM
states as:

```
If the value is 0, the bus lock is not executed and a #VMEXIT to the VMM is
taken
```

Then in order to go past that boundary the reset must be set at 1, or the g=
uest
loops. The initialisation may start at either (though zero would be more
consistent).

I guess over time I just internalised a bit too much "I can't exec vmrun wi=
th
a counter of 0".

I'll send a v2 with the initialiser set to zero and an amended commit messa=
ge.

Cheers,
Alejandro

