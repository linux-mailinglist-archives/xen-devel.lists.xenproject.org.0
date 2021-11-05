Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6E446362
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222264.384357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyOO-0000pg-Su; Fri, 05 Nov 2021 12:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222264.384357; Fri, 05 Nov 2021 12:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyOO-0000mw-Ov; Fri, 05 Nov 2021 12:32:24 +0000
Received: by outflank-mailman (input) for mailman id 222264;
 Fri, 05 Nov 2021 12:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyON-0000mo-Gv
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:32:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c83d156-3e34-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:32:22 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-lSjUHJ7rPrmeIepn1VvHJg-1; Fri, 05 Nov 2021 13:32:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 12:32:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:32:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:20b:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 12:32:19 +0000
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
X-Inumbo-ID: 6c83d156-3e34-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eD3TE16l92CP4qd/opwvhY7rtYk3soAjAnhlGWqnci8=;
	b=QktXnAJlDVVkZKtenrzLDsHWX6DSuED/Hx7o7GgZl43734u+IH2aCPgZswJcRD7mwuZ411
	6+O2sex/hnyuW9LUk8HXFBDFVM6jBSve8cMyI2+yRCXPb+xqnI+Yix1tg0qIZQxBIexzLY
	N92yFarQpXS7Ev/6mF7+ADnOzTyvybs=
X-MC-Unique: lSjUHJ7rPrmeIepn1VvHJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6evdVd8b0/2GuxJZRcgSrT3jvoS3bVEdrh75B/I2OgHQnBTa+8o2djW+awmjNd546V4cxHSk6ILPTcK+kIyfnCWt4vs8e/CJjfnJmJY3pBudEhNUAmgrInKK5Ncql/mfgpwSpiJ7jKHsgZzqucF/j4RFnLa+/WeQ2oqd+bL0Ld8wiBXpk5TYgvq7gRmQ+ICTdFDAcE3ilJ3ql5+A0XMj/4TfrBMglq8o8a4G6KStHPFl4eKUrFaQBxrdqi45b5VRNa8YpRhlFD5bhtxWlfaxuSeKVlcrzttuQyYoBPSy3km2xGQmDObBVZ6Wum7AJuj7OUPxfldnLYvQ1CHzC74CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD3TE16l92CP4qd/opwvhY7rtYk3soAjAnhlGWqnci8=;
 b=A+TVSN2Dttn7XP5CmPVy2ZeIfb+W8Ulo6DTDcLeJ5ySuZkosvRMjmelSqXosLnIef4r38q27kDs5vWE4X0IJxfzdGVLnWWpzaiIu5bo5zb0M4t+VoMsf54v3ojIOmFsizxP4DbCya8kJ92W6aMPacAsCWllL7sVoGOnQCMgf0TojxzzbpgfieDWYd+drT1DnXFzV3M3D/XwyPbWtnst4ppLGy+WIuMbpCkMgOwFoEG8C/IOq5BvcIk1Hejx+bF2z52S1gVsrVYi164QxVUZo1wMkxIhniy+D2+/brw6xfYskwBJVFmuswq1xvepcq9s04TiX+4QG1A+WyYOMqRLA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
Date: Fri, 5 Nov 2021 13:32:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU ACPI
 table parsing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0161.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b873c24-d10c-4b83-bc46-08d9a0584f83
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848B3F3423BCD1195A58650B38E9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lCRgs9ToYOeIyJ6z/18rDA0igNGeweNkzniOVaaOMVHXrzNs4wpLGsxzhv6lqfJ1kja/R34s8agGIyX9tmW74esPxHDqbsGz5CRUUiSSbaQD0TaHm1uVSPWgM06lNApf8+t0nIBk8S7DiGbmfU0ficGN3JIVJaol5MwDuZBnZT3frlVW8Zo5noMyqyzPaajAt0gh5naUOjBfS0OHO3dE2C7A1p7lomnL651OOFgErIfe7RK1WguPG22s5ZPiZdKzZUjCHGobv2hp5/pwYr9lBVaxEIEB+OB3BTDtb4u0bRe57i+ThJ7HMGAZEPJomDfp2Y9IBRxn/BTLs958anmHR1C1c90qesT54VaxZeIKAbYPFt5v3poHGBS/mrecfdJQkycscx6tz00SqvucR+EHI2/ZdeCk3yDXLG+H4SEtShRReQCKLnu4TO5NMJe48hmPcsDcKeseHl+pcTz4UjuNvdIWRPUSOm50iL0pct3AiWnNteH09lLFnNw7TqZ+0MmRBL4SqW7e5aUfZSY7bfNL7iWxsmmBMZN8vjX0twFmfwlnuvW1RW6DQormUmpz+Sj53ANJKFQsOcmyAW8K4Lo5oWmNKuOmUDEFHz0MNNXLo6BJDuOk0Qj5qJjs5vV8wO4LiBwQmTBSSTzcqRcms0DmPeXUPo/8nt/7mSmp2zG6XFq18mbeVlr1kBPlbhEneF1fiLDaLPqvOdR3Vtbzk8VgcMaad7LmcEqed19NPjiYBzg1/Tgq641bAovVPAKqwi0m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6486002)(36756003)(66556008)(4326008)(38100700002)(31696002)(26005)(5660300002)(66476007)(66946007)(8936002)(86362001)(83380400001)(16576012)(316002)(31686004)(54906003)(8676002)(956004)(2616005)(6916009)(2906002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3d6YkpPU3FEdnIwWFZBRFVudk1EQXIxOVJNVEpzTE1YZzdpUjhnNmtvR1I5?=
 =?utf-8?B?Qm9nTWw3TjlWMEZxczBHUzhXb0VJeXN6WXU3K0ZUUGlnWEdhVXZCek5DWSt4?=
 =?utf-8?B?M1N6SzAzeVFQVnhLaSs3a09UUXlZc0lmWTBXV1dTNDBXTGtPVVZMMks3enZH?=
 =?utf-8?B?Q09SYjE1bzNrRUxGRlg1cmR5L0g5T0xVaHhwOEtpTXM0RmVMSG53OGFXNEF2?=
 =?utf-8?B?OXRDbTc4djNHMWFrUHl0Tll3cnRwb25MNVdJOWxYTEt1WnVUbzNxUHcvUjAx?=
 =?utf-8?B?M1lVbm9UY2tCUVhTMzVwaFkzc0ZDeFlpbzRpT01ueG82Rk1QOTJaY05pbTFo?=
 =?utf-8?B?VUcxVFdlaCtzRDJXVWhjRXlTY0g5OWwxTHBDZktIaVNwWEpKZDdwMkxld1BC?=
 =?utf-8?B?ckF5YStNMEo3aHdYcGJZNXFEekhuOGYvbXFKb0dpQ3g3NDBIMUlFYVk1Qm9R?=
 =?utf-8?B?M0lLQ2crZTYvaHpjeThOSjZvS29HeG1pM3VtVjRYQ29Pdmh3dXN4czVZc29D?=
 =?utf-8?B?Q2NvZ0RVK2cyWjhiai80N1AvbzY4VVhwYlE2NmNpbmV0K2RpdEttUTlJUjl5?=
 =?utf-8?B?dG1LRlRiVTgxVUFxQzd1N3FBckhuSHYreldhQW4vYXdJS3RWWVhjS0lhNnBj?=
 =?utf-8?B?aERodFcvMnZEVTNrOUhuT1NNdThRNHhXVyt3bUY5S2xiNFJSRi9Ebi85WE5I?=
 =?utf-8?B?cXRuQ1hRTmtXM2pBQVZVTk45RlJaNXNPYzAxMWRPd1FwRHRGR3JlcjhNSUtB?=
 =?utf-8?B?ckRhWndJK0VUMzZNdFZlYVZuVmNkOG95djVweEtlbXFEWDFqNlRFRUhzRjMv?=
 =?utf-8?B?ZVpxenQxcGU4VkdLSTZEZkNRT3grY1pneFVqa1lqT3hwQUxmL2hYcnJZeDBM?=
 =?utf-8?B?MFRhL3pXb3VtRmpucEJJTmtWandYbEJQcXFSaWlHOTJXTFlaUU50OHhDeXRp?=
 =?utf-8?B?OTc5WGlEeFRQUXpoZk51OWZDaFNhNmRKcnNUY0dDTExrY3diQkp1eW4wNDVU?=
 =?utf-8?B?UWZQS0w4NUJPcnZzbUE3MFZHQkZXTWZWVmZOK2R3K1J3YmQzQlJ1RHAzS0Qv?=
 =?utf-8?B?cElDTlpCSXIzcmU4dUI1OGJySjdEMUZTY2FuK3MyYWt6M1NFTG52OGF2WmZL?=
 =?utf-8?B?RnMwYnZZT0ZFL1VkV0pKNmxoSU83VllPNVdhQVh3c1RYTkJBR0NFUnMyelJm?=
 =?utf-8?B?RlZJNHVweFVNV0RjQzJvMld4Ky9VRVJyRU9KcUxwbFpnRXIrTFRrNGdhNWFz?=
 =?utf-8?B?WCtQcDEyYmVWZm1wVVpvK29VU05qRGpZdXZaTUhTTU5GaGcxcTB4ZmFTNXl4?=
 =?utf-8?B?c1FOcnZ6L2c5ZUYxc09sVnBHL2dCTCt3Q04xUlJ5NUlwakdCRWVhZXRtbnNS?=
 =?utf-8?B?UkpNdHZRY2RLWC9ZWHc4SFVPbWxiN2dvVngxNmJYclJ0a1JVRWdYTjd2bnBG?=
 =?utf-8?B?SHBsdXFmSldYY05wZFBkeUhKQ0xIZ3BRd3AzSmZldkljN3ZGQkRua2JrTG5B?=
 =?utf-8?B?MDNEa0JkUmRyZnBmTWl4T0RIQXNnZ2Z3MXVDalpvbjdPS0dtZDZrNlFDRFJk?=
 =?utf-8?B?WUhmWkI3T204WWRwM2hVbFZOSjNpSGc5TmNZS2svS1Rab2JhU1pRR1VtT3Z3?=
 =?utf-8?B?MDFIVTlNSmdzNTZzeVludW82dHB0Qk9aUFZHK1dUL2dhM3gwSE9EMmNETFdV?=
 =?utf-8?B?RDJQMFE0U25DWXExK2FsbTBvMEQvSnF6M0lYdlVNSE51dnNZUlZjK0I0ZEVy?=
 =?utf-8?B?YmVaZmhpZmgxbWNYNFZQUERCSGpkZFRLeXVyd1Vmd0tENmExQmY1U3hqM0tz?=
 =?utf-8?B?anZnam5KMVk5dUc3cWRIV0VWM1NkQVFoa2R4eUVDQUpHQnJ4Zm9QU1krU2Vh?=
 =?utf-8?B?UE90c3JKa05WVXpsVTBFTC9tenUzcWpVdDkrN3hmanFORXhxTFhDY3kyRVZP?=
 =?utf-8?B?SldQTjFDay9ob084aUhKMFZjWmZPSG9HQWxVcTFsa3hjd2FJNjFVQUcvWXZk?=
 =?utf-8?B?dTQ4cGJ0aElTOUVhR09vTVR3eG1jRGtiY1V2MjZhcFZ0WTdMKzRiMmpsY2hX?=
 =?utf-8?B?Wm50WlJHaVROY1BnNWROQTM3czNjU2VPcEk4RDhFVnE0Y0pFMTY5UEdvZFc2?=
 =?utf-8?B?VTZFWWtoK3ZZaXJmTGp0TFVqUnIzUTJMaE5mUTkwb01hY3l6Smlwc1kwZHZt?=
 =?utf-8?Q?tKLRkWV8fdAyt17U5iPkTgI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b873c24-d10c-4b83-bc46-08d9a0584f83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:32:20.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4H0iw0fLFKKcTCqwIEOUP7SzwULCOOO2khwePjCMSzrVUs2shQS67PBtUq/toNtxbm4+eBaOXp1+0sf5Gfdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
when ACPI tables are missing") deals with apic_x2apic_probe() as called
from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
affected: The call needs to occur after acpi_iommu_init(), such that
iommu_intremap getting disabled there can be properly taken into account
by apic_x2apic_probe().

Note that, for the time being (further cleanup patches following),
reversing the order of the calls to generic_apic_probe() and
acpi_boot_init() is not an option:
- acpi_process_madt() calls clustered_apic_check() and hence relies on
  genapic to have got filled before,
- generic_bigsmp_probe() (called from acpi_process_madt()) needs to
  occur after generic_apic_probe(),
- acpi_parse_madt() (called from acpi_process_madt()) calls
  acpi_madt_oem_check(), which wants to be after generic_apic_probe().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Based on code inspection only - I have no affected system and hence no
way to actually test the case.
---
v2: Don't move generic_apic_probe() invocation, instead pull out
    acpi_iommu_init() from acpi_boot_init().
---
4.16: While investigating the issue addressed by the referenced commit,
      a variant of that problem was identified when firmware pre-enables
      x2APIC mode. Whether that's something sane firmware would do when
      at the same time IOMMU(s) is/are disabled is unclear, so this may
      be a purely academical consideration. Working around the problem
      also ought to be as simple as passing "iommu=no-intremap" on the
      command line. Considering the fragility of the code (as further
      demonstrated by v1 having been completely wrong), it may therefore
      be advisable to defer this change until after branching.
      Nevertheless it will then be a backporting candidate, so
      considering to take it right away can't simply be put off.

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -757,8 +757,6 @@ int __init acpi_boot_init(void)
 
 	acpi_mmcfg_init();
 
-	acpi_iommu_init();
-
 	erst_init();
 
 	acpi_hest_init();
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1699,6 +1699,13 @@ void __init noreturn __start_xen(unsigne
 
     dmi_scan_machine();
 
+    /*
+     * IOMMU-related ACPI table parsing has to happen before APIC probing, for
+     * check_x2apic_preenabled() to be able to observe respective findings, in
+     * particular iommu_intremap having got turned off.
+     */
+    acpi_iommu_init();
+
     generic_apic_probe();
 
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",


