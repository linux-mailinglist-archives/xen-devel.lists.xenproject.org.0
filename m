Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E58CB13FC
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 22:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182231.1505137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5gX-0005ne-9f; Tue, 09 Dec 2025 21:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182231.1505137; Tue, 09 Dec 2025 21:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT5gX-0005m9-6d; Tue, 09 Dec 2025 21:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1182231;
 Tue, 09 Dec 2025 21:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT5gV-0005m3-Ld
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 21:55:51 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2555cc2-d549-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 22:55:50 +0100 (CET)
Received: from SJ0PR13CA0227.namprd13.prod.outlook.com (2603:10b6:a03:2c1::22)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 21:55:39 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::c) by SJ0PR13CA0227.outlook.office365.com
 (2603:10b6:a03:2c1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 21:55:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 21:55:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 9 Dec
 2025 15:55:38 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Dec
 2025 15:55:37 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 13:55:37 -0800
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
X-Inumbo-ID: d2555cc2-d549-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOpIMYflyva+HnDTm+iyy9PeIAThhHikZB4uytRQbQLZikwb+5xzPHqhTuSZqW/iWG6HGOav4YcNiQzbPw1hHo/kz/lfxDr6UchPDmcb4kGx/ZhvCVKAcnPtstGEnmuNbcn0c3pnQJ5ZZx9zXyOPUWxOYhohM5SVQ8/pnrMrWb2j2UrG7AOIR7zwiaG31ma0KZGbe/CIwdbKVzViV4ZWqVodwKcIK/W7wen58d1nbhCB9XXZ4MnradugBr45ocwIRgq1g48u8UgG2QPkajJ8dHqqv0o7lVg2Ko9uLcd87VD22E64jpYSS1fkUfTuuL+Ootd8trVSJ1Y64pyUnWLziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljPcFsM1w6z3CzY33a53vnO6kqU6x5YfFzdVBmB98a4=;
 b=Qy+5L8wbIYWCAGVBwBuVZogGJbYoL/5/E3p9DP+LgmW/7fBSMF6tS9OpocsoJepjJMO9dIID/K0jaS57VHtuUMZvefHrUfS/KYFS1k98bK7PekNCdmIjIgax3b35Brl0mHei4vAju4HVaeVqXExkVGBoqqPB0z457ExuemmD89D6Ei28azChzIKRyn72QdZ/QouFuTvqNveP2m6QeaNDnxX1ViPtFvFneQ2CvQIDVBAGzAJyD0ZAm4u8qf98hp3jWxn8aLo9ipSbjQtD6CV59BcurehxE5X3IPcREbLvrw3CL5J/Eg2kPMwTllVEzQ2sFu+9Ep5US6pHoSV07uwXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljPcFsM1w6z3CzY33a53vnO6kqU6x5YfFzdVBmB98a4=;
 b=1Hvif3Zhi6t9F+QWsqL0DNvc5qyeUOMK4oK75eVrTq1lgmlE67v/c17OsW0pJQEAsNPM2rS+P+zhEt/iuP9G0QqRCYwEviDXo/pdc7mlEdABW83HnMIRPnsiUyeaQe9yZfEy2GzvJlRT+nsIAeqce6S2v1FtOFg37XY4Zx2QkLU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <049bb40b-13f6-4b5c-9105-aeac03680f86@amd.com>
Date: Tue, 9 Dec 2025 16:55:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
 <32f54604-706b-4377-b59a-b287ef1afb3a@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <32f54604-706b-4377-b59a-b287ef1afb3a@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: b35a3b26-b9d3-4e21-0661-08de376db0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUxoOGhjM0R6eEwxbklVQ0NwNDRZQzJTZjUvYWdsZmFUOUlVOFRCTXJLM0Vp?=
 =?utf-8?B?OXdyWEp5dktmMm1lS3dBeVpsTmFXRlBzWnVKZGxEdTNBOXpZUUZ2WDRDbkpm?=
 =?utf-8?B?eUxKZnQ2K2o0bE14Z2lnVnRMR1dxZjdVaGxSMUhjdm5OeG9SeHp3ZmNpRy9i?=
 =?utf-8?B?OGFndng4dytvOUNER1ZLL3cyNHlYU1p3SWxmZjZWN1h6TEI3TVU4SExUSmFU?=
 =?utf-8?B?VFc1SDhMWERpQXRMSS9xcFJRalJ6clJqN3h2L2ZlVFRuNzdQUm5xdEd5Wnp0?=
 =?utf-8?B?R3lrZU1LYXlJRHZmU2J4MUdCNk9JSkZoakhiODgybW5wTFFrMG4xL2RYeG45?=
 =?utf-8?B?S3NjTjBKdUJadHhsUDRHN1lBc01CYk5mNklPNEVkQm5lRXhVQ1hHTlZIVW9L?=
 =?utf-8?B?Q0VSZHdVc3JDL2xxdzNySllEUzVkeGUyMHgwQkU0UEExYitBQlpaSkw5OWR0?=
 =?utf-8?B?NGtqTEJCa1lETmVqRnhQSXYyTmdoRE9tVVh4RXlUR0YyNDIwN2hvN1hodE5X?=
 =?utf-8?B?SmQwUUxJbXgyT0ZaYytRREdnOHgyaElTa0d2UTE5QmhKa3ZsaThNOTYyZTVG?=
 =?utf-8?B?UkltUWVHN3A3eEM5aXlPMHBpU2RmOUxkVDZDZFFrOTF2QWdCSlRHb0hLMUNF?=
 =?utf-8?B?OHpKaDZ4VGhLM0QxRSsrcUhydWJxQStFUkI3T0FKV2tHUVNnV09ERFNPa0xS?=
 =?utf-8?B?M21FRWNUTG1DL0tYZFQrR3J5dzFGQ3NmalR0NEZ0aFdMRWtxM1ZLY1pwRFBE?=
 =?utf-8?B?RmtCZ2ZKTDVLK002TzkvSTJkV09yamtWdjBiSzdFd3lyamlHY0pTcmNRc0NC?=
 =?utf-8?B?VlZmVThoRzVnYVhJdWVmc1BJOEhYajBPYmpjZGl2ZkduRm5BbTNYQlp1R0lE?=
 =?utf-8?B?VDZmVGQ5bnNkRldCaWR3VFE3dHdGRFJuRzgzUWpYOS9IRmJ1Y2ovRHNMNTF2?=
 =?utf-8?B?THVMVDMzZjgxQXpnREpZd0NMM3pzSit5eWZEZmFjM1VHdzJsM2FjVnlWd0R2?=
 =?utf-8?B?MnR1emI0OHI1clNFdHl0SzJqMjRvSUd2S0VDQmR0MG12cE9kWEtSWXZjdGlm?=
 =?utf-8?B?YWQ4enA4MTB6OE9ScGJUUEhaWWlSY29Lbm13Zkc3VE96RnY5aHJZRUZ4RnF0?=
 =?utf-8?B?R0oxdkt0NmFjMkw0TkRNZmlIWkV6dWtwaXoxZVdJRFVBbTVqa0hPelh6RzZx?=
 =?utf-8?B?Q0laWHlTOUp3Wkw4aDNGUllJbUlIb3paUjlpdldCNjRaUjUydGR6VHRwUERo?=
 =?utf-8?B?RWtyV3VJeC9Kd253Mml1d3h4c3J0MWE3OTJxelZET1dkcXJRaGFkWmpiQmxK?=
 =?utf-8?B?dGZOWm5YZnFJdFpKT0lxa09JcHBKdFhKbzV4YmxCdUVOSjR3L3pQcE15YWtK?=
 =?utf-8?B?T2ZHQk05OTA1YUJTWjY0NmVCSmsrZkFjT2xZbGhhaERNeVYzWFQ2Y3dsdXVT?=
 =?utf-8?B?NDh5TXcrWTc4aUxRZFVyQVhYNFVYVnM3RGtsV0FaVmNQWWJLdHkzM1UvUWNG?=
 =?utf-8?B?R3orZmNBbUd6aDdoTGFDaWJSYVJlZnNLd0N1SDhkWjRLRVNDcFlaUVQreE44?=
 =?utf-8?B?VVJPWi9IcUpRTDI4TXFjRzdxejA4cHJjTlhBQkdmWldHWmJuaHRqZUJFZy9r?=
 =?utf-8?B?MS9iNzN1UW9ycXEvV2JvbENpenJZYTFoMG55MjJXRTlNbnBveTEvTjE2K3FH?=
 =?utf-8?B?MmtnaVZELzBOWXBqQmJUQ2hieHJiSUIrbko2RW9OOGUxV0d1ZXVWbEFES2JT?=
 =?utf-8?B?aUFBVVk5VFRiUWtSS1RFYUordFBMMnF0Q1N0S3dsb1RYdVRKOW5CdkI2eEd2?=
 =?utf-8?B?NGt1U0xodGVMTmdzTks2eWdzTWJ1Y04zT0c5QWZRTjlHRm5iTHhNNlBDLzZC?=
 =?utf-8?B?KzI4RlpkTGZacEJYLzF1dUVacDNLOGJPVlpzMEh4MVBSeGNJRzg1UVdXT25Z?=
 =?utf-8?B?UlRxUlBiU2U0M0srVXQ5WnByZjZFRCswOWRKemZQOWF5L0NQY0Rnc3NXblhM?=
 =?utf-8?B?enBkT3ZLb3dlSHRuQ3hUSjN6VUZ2VzJvU21INm1HVVdWZXR3Tk5uSmtpMmVv?=
 =?utf-8?B?allMaUVNdUpuUk5UMjhFM08zVlBZQ2hCVEFiWDY2REZ1NWRiSG9nQjhoOXZm?=
 =?utf-8?Q?IaEM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:55:39.1525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b35a3b26-b9d3-4e21-0661-08de376db0f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

On 2025-12-08 03:46, Jan Beulich wrote:
> On 05.12.2025 23:40, Andrew Cooper wrote:
>> On 05/12/2025 10:28 pm, Jason Andryuk wrote:
>>> When linking to create xen-syms, add --gc-sections to garbage collect
>>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>>
>>> We need to add KEEP() to the linker script in assorted places to retain
>>> appropriate data - especially the arrays created therein.
>>>
>>> Something is off though.  In a test where memory_add() is unreachable,
>>> it is still included.  I'm not sure, but I am wondering if it's the
>>> alternatives somehow keeping a reference to it.
>>
>> Yes, .altinstructions contains relocations against the origin patch
>> site, which will cause it to appear to be referenced. The same will be
>> happening with a bunch of other sections.
> 
> We will need to derive helper section names from base section ones. See
> e.g. HAVE_AS_SECTNAME_SUBST as introduced by "common: honor
> CONFIG_CC_SPLIT_SECTIONS also for assembly functions", controlling the
> use of the --sectname-subst asssembler option, to in turn be able to use
> %S in section names (available from gas 2.26 onwards).

I tried to add your patch and change ALTERNATIVE to:
".pushsection .altinstructions.%S, \"a\", @progbits\n"
but it fails to build.  One example:
./include/xen/compiler.h:62:21: error: invalid 'asm': operand number 
missing after %-letter
    62 | # define asm_inline asm __inline
       |                     ^~~
./arch/x86/include/asm/pdx.h:13:5: note: in expansion of macro ‘asm_inline’
    13 |     asm_inline goto (                               \
       |     ^~~~~~~~~~
./arch/x86/include/asm/pdx.h:22:5: note: in expansion of macro 
‘PDX_ASM_GOTO’
    22 |     PDX_ASM_GOTO(skip);
       |     ^~~~~~~~~~~~

".pushsection .altinstructions.%%S, \"a\", @progbits\n" ends up creating 
section ".altinstructions.%S" which doesn't helpful.

Is %S expected to work with inline asm, or only standalone?

Regards,
Jason

