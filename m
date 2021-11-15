Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE544450708
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225953.390321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmd1O-00035K-P2; Mon, 15 Nov 2021 14:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225953.390321; Mon, 15 Nov 2021 14:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmd1O-00032n-LV; Mon, 15 Nov 2021 14:31:46 +0000
Received: by outflank-mailman (input) for mailman id 225953;
 Mon, 15 Nov 2021 14:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmd1M-00032h-Pr
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:31:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f5e891-4620-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 15:31:43 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-JceHiDKyMuWuQXLK2WTLPg-1; Mon, 15 Nov 2021 15:31:42 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3459.eurprd04.prod.outlook.com (2603:10a6:208:1b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 14:31:40 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 14:31:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:206:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Mon, 15 Nov 2021 14:31:40 +0000
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
X-Inumbo-ID: c0f5e891-4620-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636986703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ine1KUir3OUHo3fP4t5NdeCpmkGsNbT1SwSgaiuSkCs=;
	b=XMaEw9ZLcIZQDo5peNKoJ5LqYI7UoWLrszmtZ5VjiX06UhC5lgC5LIDDdH3Wr05ORvsstZ
	GMV1VIrBkoHxks5a3999kxhhJOm6LGpgFhfiz9bzbJWo3HQWngKXAGRxQBM9nJqjJwVEgJ
	p6SLiKnfvg35ckG/8V/oeOATM56nl4k=
X-MC-Unique: JceHiDKyMuWuQXLK2WTLPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7wZhrRiijNmykD2AXZ5XqH2dnBnYlvA0pASTzun795SRMSsHNOp4Jws0/yWQyzkE2hc4aQc90NzzogECEbtKf7900scBfeSMAJDLrNdVPdnCLTE2wLQGe+ldTJ5vwe+B9RgXxOs9t9xzhIM3JOIisMtEj8AVrw7vXWilX575F7LTC3TVJlawabZ5Tee9S4QMqFlUtwcSX9MGe9esQdMVBwPRzmaNAS1Xkts+/YsCzSZmqh/S0aF2SE3X2od4D6SLdnZXFVi81uf9PRCe3MwXVFgLax7h/jyj5Kv5o4h5UIsG96DEJi1HWyJYICLmwiptp5MXWMcpWg+zMkdDQNmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ine1KUir3OUHo3fP4t5NdeCpmkGsNbT1SwSgaiuSkCs=;
 b=JUR8bAfp1Cd3l2Rwy9hdciSW43OOMJYI17DUJExywDF5/Sg+ImCIC87fZVfjL0BDdZqaUa+ld/OIluScXYWNslLjjZY3+orNfzZjc/cpR2T6mjg4edBWje5s/vrk0AGhE3imz1ZMN0rOvLq5uRXe46aKMkrSAE9jbw+mE8g2s6F2HjyCmmU4atgzHfqTuEIRLo44oA4K9Yebi1wrPHzGgxRgOuWjXzME0yINfXNMoLQSGtX9rGWz8sZRUUx11Lrvbsy1nkjGt+vM7KkD319FTSIA4Ijdh5EH+K9Sv0iWCs9zuhIrxuKGrHhcwokcziZu1BcVM8tVZyEzR0/Esv83Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
Date: Mon, 15 Nov 2021 15:31:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2.2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Language: en-US
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 796fc401-d501-4c51-c4b6-08d9a844a389
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3459:
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB345956A698F40B654B518653B3989@AM0PR0402MB3459.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bBt/QujRj8aBpquLU6I6D2MAUaO5Rmmkl7hMBlAXYp3RQfwxxHLIcZmMHOAEO1wy7PSVI1cGDpR9O4e7rpPMVO/LgmexE2cb9rBAdjG2d+C7XJyjHTq9BfJcnYT89MqH/6pM1vti26g6KL8/X+RRUsnIo5zfMQYiSADPPhF9JVTyBzNWxO2v4kMjeqmovYOoigRopH54RlkxjlEN0hZoSkytMdRKuyFIhgoQ8YXFXzdyXGK3hrFFE3uj8tRm0Fnkp6wHoB1tGSLWs9TfIb0tCqOkQ6t5ivhRuW4bKsgwI/mWOgA5aBqb/l7byBVc3rbUU3v7h++WbyOrmRaEqooUjheKhvOptV9WpQUFKPkOvR3Q3OOu3n+dBQ3HXIhmGEUdxjfu3DWJdXD721X+J9G7L3Cu2ynoBCmeIc8mWfq7VEa8mZmukbnuB0Ucb3Hu976oydSS1fk06ZKLbTLOoDzYsjim1Ta8lqeG9zY64b0V4S5bk1vv49HQkK1sQBXbL41i5OmWY45Znbh3eEoYUKlvcojV6xQfMXMjMLghTqEIE+BWSbEYvi19zKtjgiN9KOVOvG42eh+mdAMTzn/6qI2pDFPMYi/bg6bWDxGIya6orzSB4rWylQvKKGGo4H+1PEQ5acAKaubgnSoFCLH3LvHMNao/CJAeEaEHbIvVucwMhBWG7LM54hj9EM58YrlWtip5UdB8NZewExxTpdvzJ1ory5zY6l5Tflz1wnN/QNFuko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(16576012)(38100700002)(31696002)(6486002)(186003)(508600001)(83380400001)(66946007)(66476007)(26005)(8936002)(86362001)(4326008)(31686004)(8676002)(2616005)(956004)(66556008)(36756003)(6916009)(316002)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2tJK3ZPWGVaNlNkZjY4cDhVS0d3dU1PdndHZzRBQnM0a1JrcnN6VlpELzB3?=
 =?utf-8?B?S2cvSmhTN2xYZ2pyUEtSbGFyZDZLRDNvTUltU0hhVGV5WTdTS3YvM2pvRGFv?=
 =?utf-8?B?WWN0WTJ0c1MzR3pTMVViOC9FcjdFL0F3em9qMFFKUDE3SWRQeDltNXhuK0NL?=
 =?utf-8?B?UTJHSUVTREtXNkNSSWlBakRwc1pYYTFqcFJwU3JCMkR4UGE4cjFXVE9qQ0Uy?=
 =?utf-8?B?cDYvYWdEZTFFUm9FZFFpVjJjS0FaWGxZc0U4clhpc0xwdEtWbmM5aHduc1J0?=
 =?utf-8?B?c0N1dWZ3TWF4eTBxeUhwWXp4YlhYM080RHpma0dPZ2NuVmZyYjhNREtDc3c2?=
 =?utf-8?B?aHZTM2FXUjBMUXVUMzMvc2k0ZU5tQ3A0ZVRPMzVtU29BY1J4RmpLQ3lWa3FO?=
 =?utf-8?B?VGdwNUw3YTNMVnFrb3RPTXNsbjVvUmxaM0dReFArbDNUcnpyUGxEUitMU29r?=
 =?utf-8?B?b3lDeURmY3ZTeVl4OGlMdkMzaDd4OWp5Z0dTQVlGa1kvUG4vME1XZHZFV2Vp?=
 =?utf-8?B?aEVnZnlOUnRTNGpRUHZmSkszdXhkbXRZK3ZLYnBUU0NHWVhvWEVSVkdjMTRO?=
 =?utf-8?B?QVN0RnFrNEJWWjJyK2IrMzlBNDMwZXgzK1krU1hNZmRqMlB5YlpzQ2tNNE4z?=
 =?utf-8?B?MVRSRnNuR3kyaHdqNEVTY0UvbGtvcFI2VDFBNlBMTTB0bGR2elNISmtQRTQw?=
 =?utf-8?B?dEQ3eExXRUVhUUFLU0RVUHBZWHo1K1hheXVSWm1LeUp6YUluYjJ0TEplNzVH?=
 =?utf-8?B?T1hoT0dMQVV3YTM3U1grRlJheDJweUROT05zeU5URUJEbThubERhQUNob29l?=
 =?utf-8?B?Z1Nrd2lZZS9QN1FsZjkwRkc4VCtUUzdGMDlEa0tVRE9VL21TNFZ2RmdYZ3B5?=
 =?utf-8?B?Mk1Wb2ZQcG1EWGNlZEl0TjR1cVgyeHo4STc1R292K05odHQwUG15SDV6Zzh2?=
 =?utf-8?B?OWEvTDF3UlpKZEJha08rdTB4a1lodHBoOHJFRzBCdjVxTUY2VEJ5d1MrQnJB?=
 =?utf-8?B?enRMNlFRMi9oRHdTbThCYklMckQ1UkgwKzVCVDNyUDNKRUJqR25oaGFTUm8v?=
 =?utf-8?B?bzliTHRBWVZZQk9nL2tHb2ZhTW5DUWs5NmRKbDBES01GdVFlQUN5Wm0xMjBl?=
 =?utf-8?B?ZlVGV2E1bUVEbVA0d3FDQUkyamphaUhwdlpoL3ZTL05haUtTMXlYaSt5WmNN?=
 =?utf-8?B?ZEU5Q2oremc1NWdtR0s0SkJLTHo1SGMvQkIwM296WmRVcUJhMWI5TnowTTdj?=
 =?utf-8?B?VENTZlFWaVV6TDlqU09zS0lEMzUzNzd4QUxkNEFoem95UFhlVUJnc1ROblBp?=
 =?utf-8?B?d2kydklERjNGNjNTZmExMmRtSUFGb3g5MDRwMGdsODZUV3ZqSGk1dVdDQ2lG?=
 =?utf-8?B?RGd2ekI1Ui9wcUtzc3gzWXhJS3pKNTRrTW9SdmRBUDN0d0t5UTJ1WUk4UWpp?=
 =?utf-8?B?dlhGTERYZ0FGMXpsTmVheGpicGQrZUg5Q0dGeDZsK1NLZzVHNzY4M0lvdXNB?=
 =?utf-8?B?VWtuTmxMV3MzT244U1FiTCtZSStLZGd0L2dTRFR0bDNNSzhqTEEyQ3F2Z0FZ?=
 =?utf-8?B?U01CVzRhSGNOVzVkRVRYd3BQQlNQa3J0UnZFeDJsLzZOUndsZFMzdUlsQk53?=
 =?utf-8?B?RWxiUkpRNXc3enROZEtPaDhPejF0Z3N0UUNTSjhpNW9sREpyQ1FjWTd3cFRR?=
 =?utf-8?B?SlRCY1JaalhHMmUwV0FZRE9IemFGMEQyUkYxbHFub09xanFieEMydkZna29z?=
 =?utf-8?B?YnBSR1RvKzhjL2d6K1FMNm9MTEJkb2VkZzdVV0ozVm1MODZPekY0Tm5Tb1lN?=
 =?utf-8?B?Q3JMc0t5MTVPVVZRVVdFenVoMWh3N1I4QS9YL1VsSVhHaWg3Yi8xMEFOTGdC?=
 =?utf-8?B?aTcrMVRLSUtQV3pPVzRsR3JWcURFVXVHVGNvY3R3WkRlYitUWHpZdTZ5OEhD?=
 =?utf-8?B?QTFVekJ1cWpzZmV2S1lDcmFYQUtkWVU5OSthSXF2NTRNU3Zlc2hhNVlsemkx?=
 =?utf-8?B?L2czcHU1VEhSL1B4bE1wNThma25pb21nNkhNNExBYkNpMVJlYlNGUlJpTnIy?=
 =?utf-8?B?WFlIeVB0Rm9mZW1PUXZrS2dTSUpPa3FRclBMYWFMWDNFa0JkZWdVSWZzWGcv?=
 =?utf-8?B?c1BuYnJvOHJxRjFrWGxnU1ZLeUU0NndSZ200QTdjQUVvNDVIUEpBVEpzV2V1?=
 =?utf-8?Q?xZh/nWWn7Y7GrrPCyyaM2XM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796fc401-d501-4c51-c4b6-08d9a844a389
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 14:31:40.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwSqGXOoUpldQ39zGHoamlbJJjYpK9m3WAArZZWzEXWvigKuPkRQw6ZFXGsG7pssN/n6FpgqSG4U1jgiwP4WZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3459

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
v2.2: Move generic_apic_probe() again, but only past acpi_iommu_init().
v2.1: Respect acpi_disabled in acpi_iommu_init().
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
@@ -1700,15 +1700,30 @@ void __init noreturn __start_xen(unsigne
 
     dmi_scan_machine();
 
-    generic_apic_probe();
-
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
     xsm_multiboot_init(module_map, mbi);
 
+    /*
+     * IOMMU-related ACPI table parsing may require some of the system domains
+     * to be usable.
+     */
     setup_system_domains();
 
+    /*
+     * IOMMU-related ACPI table parsing has to happen before APIC probing, for
+     * check_x2apic_preenabled() to be able to observe respective findings, in
+     * particular iommu_intremap having got turned off.
+     */
+    acpi_iommu_init();
+
+    /*
+     * APIC probing needs to happen before general ACPI table parsing, as e.g.
+     * generic_bigsmp_probe() may occur only afterwards.
+     */
+    generic_apic_probe();
+
     acpi_boot_init();
 
     if ( smp_found_config )
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -43,14 +43,17 @@ bool __read_mostly iommu_intpost;
 
 void __init acpi_iommu_init(void)
 {
-    int ret;
+    int ret = -ENODEV;
 
     if ( !iommu_enable && !iommu_intremap )
         return;
 
-    ret = acpi_dmar_init();
-    if ( ret == -ENODEV )
-        ret = acpi_ivrs_init();
+    if ( !acpi_disabled )
+    {
+        ret = acpi_dmar_init();
+        if ( ret == -ENODEV )
+            ret = acpi_ivrs_init();
+    }
 
     if ( ret )
     {


