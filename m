Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D900F447F0D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223310.385972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk31T-0004LB-Hl; Mon, 08 Nov 2021 11:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223310.385972; Mon, 08 Nov 2021 11:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk31T-0004IJ-Ee; Mon, 08 Nov 2021 11:41:11 +0000
Received: by outflank-mailman (input) for mailman id 223310;
 Mon, 08 Nov 2021 11:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk31S-0004ID-5S
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:41:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0d226bf-4088-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 12:41:03 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-N2Uxjqz9O4G22Et3yls_cg-1; Mon, 08 Nov 2021 12:41:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 11:41:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:41:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:206:1::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 11:41:00 +0000
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
X-Inumbo-ID: c0d226bf-4088-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636371663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Je3ZuwZHXVzWG6CFZQALmUn2ZcQA7SOnGDosdRm7aM=;
	b=arYeOU+pIiUQetWmWU54WIFzmC/WzeEf23dzIJiCJUvLCJEThfHzQxUQoKhDMnCm2O4mSk
	m37v/VsVVi68mNLVzaDaCQ0Nnsdtfq5zzvCgSwd+4aqwyZEf6UWAModhPqCw+YpN78QXNP
	RBX20Epk7gspJXuPVwCZNeDcMQZGoaM=
X-MC-Unique: N2Uxjqz9O4G22Et3yls_cg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+dlogZdqE0E9IuhklLBKixSextERHqwAF69C5ypVIe51up8rMf3dFexIJQ61PkdpyoKJO9almCejM8+KNX2Wa9lOPM3LoG/ofgSjoDHDCwhRnL1OOL/AK5Lrwo3TAkT8Zs/ibQ73hYUuNSuvQpB9Gn7FK5RIDVKvts0c9Hn5xA425cdTuT1VTYxtasjv4VucCv44L00WzxXAdJci1ebekPChslaGrq8Y0q+waB35P1vOViCDZBMV9tj3tCVG+GfygplKwQb2cKiXaGdHD3FZi91qDLC4zuyw0A+SEGs0CoiSC/LR4U9NfVwSuMlP3sru9lTKqb0VQkHNqs8jnRs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Je3ZuwZHXVzWG6CFZQALmUn2ZcQA7SOnGDosdRm7aM=;
 b=LPsTvARuhT9KJdbdHyonfuuAzmcG1Jr5jmDeRal/XEsu/tSHQBjZid9opm33FMiAJokNpZS2BTYLJmDa3K5zxCZiGZ9pKLsbxbiVSdsq9mRYRUeTF0zT4f9tMBlYDMJ/5+el4tXqDMIbEWkp95elWgLXMVl4GZSeQcAaY02IuoB06BvrYMH5X0Xtht5+XXCQFNVwDiSK+wX3ptmhtq1wKX9UBkinHBlupaEIKc9TLNv+GXwsTKIxi7EBugkqtXRunqX/M32xgK/UmLKWF1adbIVWEP9jUgPnd8ViXFdqLhKCnhgXsJHuQdSUk9mEYrbj1InziS+pIgOpOpH2FwoQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c006378-964b-3e48-4fe0-4df88e3131e5@suse.com>
Date: Mon, 8 Nov 2021 12:40:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2.1 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
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
X-ClientProxiedBy: AM5PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:206:1::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe329fe9-0a49-4a65-df51-08d9a2aca319
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333413D6E9CBF9C6FC4F39CB3919@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GvRM6oevltFVv6R8GjGH8wjanx4b8sGOmwbZQtWYNLW9w6TCyLmB4xY9c+q2zUONOPyKycaWotwVd7QIaZK0zUJecZKQGCDAYTWMWrUPJt93Ze2OwxNRfW0JID9LhcCOKVMIjIjtkxgLO6AaOiCKypCO5oJRo80IlVh7niDhm1mHV1roxvm1JyHWREataB4gDuFHH3WovwHBLEhWR+YcM9zsR6JxO9ppaxXesRN8tTY0nBrD1vKRURuLVSxQFOwiK5B5YY0I/YAo4uBcNzloMd3eioeIcZndDvypqsflcLkZAK/gvcYel//T5nqGWtApuVz4Ds386d7mcW4NvEnATBPctC3MLlqQKyKeb4dRcfLMBmDK4xoS/d4daxrQx3F56JElfk49QY2kS9a1qzhb4pQuo7S2Ai396jdhS9VxNoNe2GqqIs79xAJFKVmMEAjXNomAazVNwXjedUWOd5mThI3sgBPIY3FtL31MtwK6lmMENaDCM+KeMyHwQia0Qn/nJgRLqqsgrhmclIBIXChiM/MfrANg9u1Z9ovyVEqO5h9iPRu0MrYXr6mFsS8yNeRBx6lS2GmU5oaO2iqbOuARw/AtoRL5R9EwoaaV1gNM1iQC2ij/wsIV4DWRTiykqziIKceZr3/eCqAGetaRBidqFF/SE981gw+DbqWoMrqlu7gGL4epdK5jox1KYTSXcwdRtSZjfDL1K9WNix3XFhskikT43OmZVCqsiry8gjrtvvsGD1sIwH7T929VXblO1xK4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(26005)(38100700002)(66946007)(186003)(2906002)(31696002)(16576012)(316002)(83380400001)(6486002)(54906003)(4326008)(86362001)(8936002)(6916009)(8676002)(508600001)(31686004)(5660300002)(2616005)(956004)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC9NWUtSSStIb2kzVHpkd3pWM25nc2R3cytTRktYOEJTMm5DSnFGTWRXZDdM?=
 =?utf-8?B?MXpEbkppTzBERkdZQ3BHNHVXMnhNZHZVcTFyU21XdVMvOGhpY0pCSzFFaXdO?=
 =?utf-8?B?WVlmWFozaUU2cXhGZkFrU0FjbVZ3L3haeXFHZ0hpMGowVlBFRmY5WmNaUXdY?=
 =?utf-8?B?ZDhZT1JGRkJGS0tQNElMZnBvVkhkSEJ0Qmc1bURmQ2k1QnluL2FMTFlSOUxr?=
 =?utf-8?B?NDBUMHR3TVVoSGphSTZHampLVkkwTzcra3NoUVBpTlNFcDJPMUtEOFdXSjFn?=
 =?utf-8?B?aDFwbWtKQzRFK3QzUCtMSHJqVUF6ZEpNSU0zTmR0VStOWWFHTjBZdzhtZlhB?=
 =?utf-8?B?WktRVGJ0SVZaZGM2WTFVWHJia1hhN0JjVlhxYXdaREwzbGtmVG5Fc0RsU2x5?=
 =?utf-8?B?OEZPWFpmTm53TS9abjZTUE5GSHljblppdis0M3R2enYwUVR2OC9EcTVSUTJo?=
 =?utf-8?B?NzMzbHNGd0ZmTE9OM2ZuWldXR1E3MmVIK0ZBVHQ3cHRKaFJ1dUpQLzUvaS9v?=
 =?utf-8?B?UU9jVm9RTXEzUW1JRGxkdEdVdXdFREsreHQ2cXp5Mi9MWmVvbGVYL0lnTDIz?=
 =?utf-8?B?SjJaTHZyMTZ6WVBFeHhzaXZudjBvTldWVTY2aFZYYWpGZnY1bEY5RWg3bnZz?=
 =?utf-8?B?ZUJQN2VVQnlqRUZybUtmUUlyQnIvRDRCZ2FBMGtwMjhyYngvc0V1S3hiTEpx?=
 =?utf-8?B?QXFORHlxTDd2c2RnS3NYNldlUit3YlJQS1FBNk00SGpSWVAzZFNiaDBjbE5X?=
 =?utf-8?B?YzNLNVAxM2hOenVmK1RENGxpSVpEWWdLTFNIOHYzbXRlSzZzbW16dnpHRjF2?=
 =?utf-8?B?eGRrRnR3VlcyWnZHeFI0YU9YOHp1eFdMSTd5dDVlTXZqYXlXcHNpS25BSnM5?=
 =?utf-8?B?UTJQcjRaZ2tBUy9NazdGcFFsS3BlemY2VWZtK0NISFlCcnRlU3BNMlUvanNC?=
 =?utf-8?B?Y3pXajJQWUlvQXlGekNEUWw1OFRkd2UzTGFJeXdQVk5PN2JaaGk5aWsrWVlv?=
 =?utf-8?B?dlVjTW9yeThYR2RMNHRpSWlLMEpQa2FqYU1zampqbHYxOXdCSS9GVUFNQmU0?=
 =?utf-8?B?eFJiWktzZXpoQ0ZBeEVENzFDaXhuZVlQYitWY0tnaHJ4dnJUYjl5YlFzSjda?=
 =?utf-8?B?WUREMDNrUTRtWEYyeTBjaUlPRXIzSzZrUzBQY1NHbjN6VWg1RzcyWndTZjhG?=
 =?utf-8?B?S0RGRWM4SGMxeWtSdTdLN0V0WHdUMDYweWcwbHEyYml1eVpKZzBiN203TWt6?=
 =?utf-8?B?R0RSeUxtWFJVcTIySHlaOUx2dFpPTXZTM0IvdGdSdkppaEU2VU9LWDIyVEY5?=
 =?utf-8?B?WU5DY21JNnA2U2plOWFmdURJN01TckFpUmRFN2kwa0JhcVNjS1d1VXk1ejFL?=
 =?utf-8?B?NVRoQ2RWN3piS1hibXpETDBPM1l4eTk3bDVHZFFJek5BcEpOTVJaK25SaFNH?=
 =?utf-8?B?RGZSWHlUSEhjdkl1bFo2eWNMbWdLbE5tUVNxMG9sclRzRnQxbTYxaWNsUXpY?=
 =?utf-8?B?dkd5WU9aRXhTZFpYOEpBTHZvMFVBVGRTS0xWY2lXdzg0YVdrSlc4em5LTjhn?=
 =?utf-8?B?QVhOTFB6REs4RWRBMm8xdVNMR0paRC9nYTZDYisvL2FnSzRwenNObnZPOE9L?=
 =?utf-8?B?ellxWnRsWUdNbElzSWhuUmVFeTRYZUJkZ0JabDlEcXZBUmhpYTVPM05zMXhC?=
 =?utf-8?B?c2FRTE1nV3J5UGpSaEZnUjVjU29RL0F2RFA0WnRvaUhrQWVKbG53aVJVYnpn?=
 =?utf-8?B?Y29nMmo1eFNlejF1TjRZWE1scjcyZ1hLSDBnWG5DcnRhZ1ovbjE3enhJTFk3?=
 =?utf-8?B?TkNlc2ZRK0hZSkthS0FZeU9rdXlJclh0RS9zaVp4VkhtYTZjOVdSN3lnNkh5?=
 =?utf-8?B?S3ZwaS9KS24vM3kwcE9wcGhacDV1OFU4a3ZrdGh6RTdiWCtnMFBxSlVSdXFJ?=
 =?utf-8?B?WXltVExTemI0U0VYWUdYTmhwTElpREs0KzZOSWJGMEx6a1dYU0FtNEc5ZE93?=
 =?utf-8?B?VkxFK2tTQ1QyQmJKZEZOUEVpRkNkSkpnSzJwd29HSEtOR0Z1SUlGTVRMSW9S?=
 =?utf-8?B?dHgzb1BGVmdSMXFXamZuOHNhbDV6MDA2NkRHcm5SSk1DK1hCK0cvd1pmSEdt?=
 =?utf-8?B?dzRCQjhYSEsveXE4S053dGlJVVIvZXBXUkE5QzQ1bksvSFlWamtIV21waU9l?=
 =?utf-8?Q?6Mnph9oJz94bZxIXYj2cN60=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe329fe9-0a49-4a65-df51-08d9a2aca319
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:41:00.4961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQyb/6jzK1Eowe1GrrTpQJqTn9juWDwCokWB+/QgiJX2MXNQ1yGCBLhqOLDhxwyZJfnQtYPQqPKi+Sf3/4Ojgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

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
@@ -759,8 +759,6 @@ int __init acpi_boot_init(void)
 
 	acpi_mmcfg_init();
 
-	acpi_iommu_init();
-
 	erst_init();
 
 	acpi_hest_init();
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1666,6 +1666,13 @@ void __init noreturn __start_xen(unsigne
 
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
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -44,14 +44,17 @@ bool __read_mostly iommu_intpost;
 
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


