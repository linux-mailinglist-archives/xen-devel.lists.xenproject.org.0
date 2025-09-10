Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AAB52087
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 21:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118707.1464387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwQ28-00016L-MH; Wed, 10 Sep 2025 18:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118707.1464387; Wed, 10 Sep 2025 18:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwQ28-000142-Hk; Wed, 10 Sep 2025 18:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1118707;
 Wed, 10 Sep 2025 18:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pHK=3V=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uwQ26-00013w-SE
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 18:59:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2416::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 373ff95b-8e78-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 20:59:04 +0200 (CEST)
Received: from DS7PR03CA0308.namprd03.prod.outlook.com (2603:10b6:8:2b::31) by
 BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 18:58:59 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::90) by DS7PR03CA0308.outlook.office365.com
 (2603:10b6:8:2b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 18:58:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 18:58:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 10 Sep
 2025 11:58:58 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Sep
 2025 13:58:57 -0500
Received: from [172.17.248.197] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 11:58:57 -0700
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
X-Inumbo-ID: 373ff95b-8e78-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMR9rjrEUCIV6jGLSI3N800XeFcdzOw4bWgwM78PBbbqncHK2GKPv9wuzovjwXuRfura3Piaxd4BKAlQ0Val2JJC/+3W6stN2wz7MllAsd+EnxvPRPbAvLsDVKZKC87g8osFj8VkCFZF09Qkwd8iCybH4vC1iSUDlTlCyMza9FOkNCds0fKPX2kxyP6nUuNK9sA4JM0tQmmFbri8k8aEZ0ZDt4bVFuHmXPuZYXT4pd8wxG7GCtkwbGH5UDDth4acUXV1fIPrAsSvnVg03+AmaWTvay4QUuMUUo/XUH5prsada+2QVfKDm9rGqdU/8LhWb19bpjEhBaJnm3oiQ3g6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ARLEM3ngR7nSo8f7KyFfxgKHL610BYYDyw90q456cw=;
 b=QIeQA9PrLIgeVyuZUmQNOSTWrZBdcgusj95p05dwaYA1JUUjyjY3BYIFQ06+1QfXiyf+DOcko6t2KDU8lVOCDCEKd1luPBp/+m3Qwjepolv0njRAI4PTZasKihD00rwDCMO2Rh3J8byGqpnuTl5q7qTt98/roiH40cq4YEQ5i90MT7l1/l3YMtRNmIcs546yY1W6wuFhnLUbrC6h9FR58e/cFW2MOc3NbIL8aoBdY7rOaiAoVXf+NX1Jz0Xv+ANHCYa83DrNWX26flPtu6GI9paVMGqBsjcHm/C/npSvMKsrIxK5UCVkhE2vswPCAJcRfTpVo6ShwGZSFlgWDWtZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ARLEM3ngR7nSo8f7KyFfxgKHL610BYYDyw90q456cw=;
 b=CrtKQegwKBMRgDBWBe/ZwAhHFURxwQgOY1m1eARr8i1HmFQyHnzjxrJEmdllPU7ZVsBAjsi6+8Z+8u3BgnZFMUrKjL+uDhznG7S0tzjvEe015WzU5aY9Eu/khrpZQkiJFL9AnSvFTimeHQ48ofQtpjt/0W5OQR8p5+CzHIH50Qc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
Date: Wed, 10 Sep 2025 14:58:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: domU reboot claim failed
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bf05df-3d36-4895-c9ff-08ddf09c1957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVZjZ244R21teEVGWWhnbHp0eVBvRkFHMXI2NzVpTGQvd3pLNEdKYzFUY1Rr?=
 =?utf-8?B?amJvN3JrNEJRTWRxVXZ6d0Q2Z2pJWUxsOU13VG5qMnFqZnJwdzFVLzNwNHZz?=
 =?utf-8?B?LzA3NHFuME9HSXpiMlFEbHg4MW1tWTloaTBoc01FMGxPMmg1REZQMTFIemZB?=
 =?utf-8?B?L29CRnE0RW1uNldhSGI2cytVSlFhRmhKVW54K0oyaW41NytKMzIydmw0NWpw?=
 =?utf-8?B?KzEwNUcrNjhuZmYrdW5PWnVlSWhuckJlY1lZaXdsOFRlSVlxNERQL2VEd1hz?=
 =?utf-8?B?Ump0Rm1mYkNCNW5sRjdlL2tUMEpXQW01WEFXNXI1MDFhUkVESjNqQm1zYWls?=
 =?utf-8?B?SWhiVjFacWc5SWQ3WU8wT0hUcWNaYVdFS3JyQlJESDhQNTdLNFZCa0UzNUhk?=
 =?utf-8?B?L2pqL21MbVUvV2k1QmNPbFBsM1FLZGQxN2lSSVZ2Qk5HRk1WNExOOWpaKysr?=
 =?utf-8?B?R0ZYYWFFNDVZQmpaNjhnVjdsVmNsMS91VUNtbTVSdnY1TU95bHVKblphMFBS?=
 =?utf-8?B?OUFHK1JaSUZZcG1yQ3dNTU43YjRZU2xGbkI3cmNiVE1mT3JyTjNFNG9ZeEhu?=
 =?utf-8?B?WVdhUlVvZ0d1OGkzY1hUc2h4YW5jRTlQcW9VUVpDNTJWOGQvVkZNZmoxRHBx?=
 =?utf-8?B?Y0FxUTdMQmlrVWRQQzFwQ2lsa0Zpd3plUWswVmRqSkExWkFhc0h6Q1lucGkv?=
 =?utf-8?B?QUM3aGpCMmptS0ZxWC8ySmtoYlFJMloyYUNMYWszN0xIdW5HeDdmV1VPZ3l2?=
 =?utf-8?B?bW03eDNFNFN1NlpEM2V5SVBwTVJHeWozcGE1RFRlN0NPQUgyNVRSSWVGdEti?=
 =?utf-8?B?cTJDRTZFay9pd29yL2dTeDE5UGVWRHlEVGd6MFJ6K000Z3BZWlh3TlBab1hQ?=
 =?utf-8?B?ZWg2OGcwYi9IR3NHVmptVVczNkg2YUFXRWhEcFR0UHhESzJERlYvUXRKYjZi?=
 =?utf-8?B?VWpGeUJUSWRSV2FucVo4TnFOZjlKb2d3MUJ2R2NwTnVYZ1NkYU9tMWdmNXRG?=
 =?utf-8?B?WEY5N1pybXhsUHRsYXp2eXhaVXJ5dk9lLzF0MDQ1OVBWRzFvdU1uYVFzQXJV?=
 =?utf-8?B?dldkTXVCOWM4ZGx6UC9TSXNMYWhZVjB6WDc1K2Uxa0trZURLSElWMlBJczdO?=
 =?utf-8?B?KzNKc0ZPZzlXQTlkaG9WRzhEdEgyUUUrYjRuclB1VS9JMnZVV2JyN3JGM2pM?=
 =?utf-8?B?UnJZTWNuTEFZNFArVmNtRGMvVExpY1RCZW5VK2VvSnMwayt6RnhBRGVFZ3Ir?=
 =?utf-8?B?cHNpQ2VXZ2ZlWndTVi82RVNYT0ZIb21XOFF2TFdBQ2cybW1wZnBLWkJHTnlE?=
 =?utf-8?B?dFc5R1l5T0VZOUQzelgrT2wwckJPV3E0RXBUMDRFbm10RFpYYjV0eUM3akhQ?=
 =?utf-8?B?dEhDMWdOSThmNHppZUdKRTJBc2xSRGY1MVZZV1NQWDRHS2c1NmZua3hQT2Ri?=
 =?utf-8?B?cUx2MnJxaHIyVjZuODQ2amYrNG9RaVcyV0hEVXB5OHhSVTlPWTFsZGY3Nm1T?=
 =?utf-8?B?dU14OEJieWNISTZPTlpkVUdGYWNwVXlkcndLV1pkaVB3eXJockg1S1VSQWpF?=
 =?utf-8?B?QVJtOTJFaXFzVWk2R0JqL1Y1VVhzUDdjZFB3QU1WaUNDaGlETHhCUlpBVDB2?=
 =?utf-8?B?Y1Z1bDVyc2FZZy96dGphaXVERTAwZTFQTHpVeFNlMkFVRWQ2MlZQSWNmVHZp?=
 =?utf-8?B?eFl1ZFRyMFN1cnNSZzBnaStXUFRZT2tzTkc1dHpxaElVZ3o0RUdkLzVhZW5u?=
 =?utf-8?B?a3pBVDVVY1RjakYxdW1kRXUxYlN0Z0IveWJrdkZyTWI0bnArYVI5WjBUemt0?=
 =?utf-8?B?RVRVdzY0MDZveTRUbDZvbmxxby8zQ1FKR21qNDlTaEZoZnZQSHJtUTNaNTBu?=
 =?utf-8?B?aTNOZEZlRUJ4VzFnQkQrb2UydXpzYTdLTUdUOUJsdXI0MUllME1VbnlpcGUr?=
 =?utf-8?B?ZlViZVIxc3VxUHR4Ui95OW5ZS29CcEtSUDBKL1VDMExPN09tbnErY1NyTmpM?=
 =?utf-8?B?UktWQzg0VWxsYi9IbFJtMjVVUms5TGZHajFZSXI2MDJaakZwZW1wTWNMNE5k?=
 =?utf-8?Q?toSP0O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 18:58:58.6430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bf05df-3d36-4895-c9ff-08ddf09c1957
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212

Hi,

We're running Android as a guest and it's running the Compatibility Test 
Suite.  During the CTS, the Android domU is rebooted multiple times.

In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
domainbuilder: detail: Could not allocate memory for HVM guest as we 
cannot claim memory!
xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't 
allocate low memory for domain: Out of memory
libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init 
failed: Cannot allocate memory
domainbuilder: detail: xc_dom_release: called

So the claim failed.  The system has enough memory since we're just 
rebooting the same VM.  As a work around, I added sleep(1) + retry, 
which works.

The curious part is the memory allocation.  For d2 to d5, we have:
domainbuilder: detail: range: start=0x0 end=0xf0000000
domainbuilder: detail: range: start=0x100000000 end=0x1af000000
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000000
xc: detail:   2MB PAGES: 0x00000000000006f8
xc: detail:   1GB PAGES: 0x0000000000000003

But when we have to retry the claim for d6, there are no 1GB pages used:
domainbuilder: detail: range: start=0x0 end=0xf0000000
domainbuilder: detail: range: start=0x100000000 end=0x1af000000
domainbuilder: detail: HVM claim failed! attempt 0
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000002800
xc: detail:   2MB PAGES: 0x0000000000000ce4
xc: detail:   1GB PAGES: 0x0000000000000000

But subsequent reboots for d7 and d8 go back to using 1GB pages.

Does the change in memory allocation stick out to anyone?

Unfortunately, I don't have insight into what the failing test is doing.

Xen doesn't seem set up to track the claim across reboot.  Retrying the 
claim works in our scenario since we have a controlled configuration.

Thanks,
Jason

