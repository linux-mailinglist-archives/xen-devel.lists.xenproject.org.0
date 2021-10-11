Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A52428924
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205487.360801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr0J-0006sz-Ox; Mon, 11 Oct 2021 08:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205487.360801; Mon, 11 Oct 2021 08:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr0J-0006qE-Kb; Mon, 11 Oct 2021 08:49:51 +0000
Received: by outflank-mailman (input) for mailman id 205487;
 Mon, 11 Oct 2021 08:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZr0I-0006pw-84
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:49:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3075f3d8-2a70-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 08:49:48 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-FyuLNzFeNZ6BZPNH5BzT0Q-1;
 Mon, 11 Oct 2021 10:49:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 08:49:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:49:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 08:49:45 +0000
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
X-Inumbo-ID: 3075f3d8-2a70-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633942187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2QQlvL5PGwpU8KLyKuBWoy9AUUcpl/UuUJ2cFH1HIk=;
	b=UrQBXoGnDMvn3iR1pXY1pmuh2CSfyvIhf6nGtNAkydfEz3vupgnyIb89m2f3z5Her6cXhr
	4GlUUg9osht7l/K/vzj48OvyOl4PfG0HQNkCAw8zW5xi7D4kw1SVYy5QpB2EWfyCWN4R1/
	cibA3/o3RtpaajogXk/K8DDdp/Vvm6E=
X-MC-Unique: FyuLNzFeNZ6BZPNH5BzT0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjJ/l2crAUgDMqcr73hGOqVBtpP9mRWrkx5e0wq929I0zWkoQB+kXsi3oUz1NFv8wX4T+kY6FlpRmKARlja+8TFBCMCYQKZL51WKK/hyH/k4Rzpro6wLzkHOlwAWL8Oudb+TxMwp5o9rJLoWiTUrYjqe5emvbiLBD/NqGdlNKDFv++Y/+beTin0Tyi9To4GZ3t5xk2K8zarH+AiiFkWoC499T4wCPp4vv8SoWelEryVvwgPR5DHnuL0LHLu27sMgZ+6N1XCvo5HkuBcFre631iljH8mci8jVlwy5MWbs5jIqEZLrkGneragPZXh48wV5AOWEaKonqWKGAGs96nI0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2QQlvL5PGwpU8KLyKuBWoy9AUUcpl/UuUJ2cFH1HIk=;
 b=KpdpO/82nmpXnsqOmeKmyS94sFgmQ3jr7RlI9f3R5cA1ofEP/E8PL25ezbkAnoNkHamuLnjqI4TKHy0mOo+84raguWAUl2MfVgfGr8n47fULK9JxmLJlWLXlLd/HdV8QMAogKiYLVSk7AnU/R87+1B90a7h7+Cg/mVkYkctVt/CH9Sqz5ysC4a4C7qRECQ+BzlCFUrz9PZ0ta+mAWGxO5aqSlCFFXdgGFz7JogO1iuE5PiNZ2ea+PjvvBtkfIUY+1AnLbgCF7fk7BY9Fh4IWTM15dK+W+DhqG+qfU6S+KRy2DFqFHoGv+wx2csAXqtwLpBV8Y9dUP5fk5EFqDOdYuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] VT-d: Tylersburg isoch DMAR unit with no TLB space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
Message-ID: <a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
Date: Mon, 11 Oct 2021 10:49:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 335e824e-5846-4617-d425-08d98c94132a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638456DCD5B54C9D63FD3302B3B59@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ty6kfInFNpenGpUNziOXObqWe104GeyuUm+jvWTZ0xQUcJw6iw00SPqDrgvAvxOgwJ0UVbHdxfcxoza4DAzdK3cwY+aXYQeHVi1SSvGDYr8NCwyr0DXecwx5D5J2i5CYLSbDDkenN3Let2oPVZSN+RX2LxK570CNuWPK7lPhqOFT0nic2EUXc5++qJo+5LzkRvpjbc6aPOJKgAyGn+0UQIGe37yrrfmvuiKoFYlfjuvPgBYzJVthxiOvK7bII2X21x3whHkfFRQDkL41dRMOsr5L3PlYzGvyiGaVzPQ2eSJ3n6mGEfvNBWlbDqeF6wTfRUxDWksq59yDchJh9vc205kSZq5AjPESxrtk8KJm495nQy41LkOcmPMz6ffrmz/wOj94jb18hIDkhyl4p7U0VDUiclwy3UJJucYxFkB39L9TytumYDtdczcNrTuR0Xozl8wFCa+KADRhpHyOwafmtjwb0plUnhBXGrBERU69JBI1xgJLp3/Xd0rRnYjAm+fIO5Ki9CK40pnLZlNRXmRhwWldcNDAg9SV/2ryokQC1cdfuHUBJxo9QVtMJYEtWVSZfOBxuCFJovf5NyZoxB8Yn2ub5MO6uFMXIrMaFQqNF9UPm1eVqWOjUBlZNFUVnlozJP5oZLQsxPI+d5ikfrqx+tO4n0kuz3lWk/M4PSeFwZ47ykt6QOmdrIVycjfRyMc6MWYczvllh15yoRiPf+jMlCbS73EYP+n9j6xXlcNjrCEmGb/scwQsSrNvIcEEE78x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(31696002)(38100700002)(8936002)(31686004)(5660300002)(956004)(6916009)(36756003)(508600001)(2616005)(86362001)(83380400001)(66946007)(186003)(8676002)(26005)(316002)(54906003)(16576012)(6486002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWdsTGN2WjgyYytLME5yYXkyMm1CeHJRcHpMV0pDOHFYcU5YaDRsTG4wT0hz?=
 =?utf-8?B?ZW1Eb2tZR3F0RDdNb2JUZHJQUE02MWtmREZQUDBmTC9JUVFMdHJBalk4cjJ4?=
 =?utf-8?B?THlINjhONGNnbGNxZGFONGpUVXFsQzVMSDVoemlpMXM5eXZLQjdOOHZxR2Uz?=
 =?utf-8?B?VnRmbzMrTmkvT01mVEFqRld0UDdoTjdMbVJ6V08yRlVwVGNQMU5NT2lneUNl?=
 =?utf-8?B?L2YwZnlNQlFIUnd4MDRlSWpkemRLcDJKQnVNRDl3SWR2R0xUUTAzQmIrNEhj?=
 =?utf-8?B?UXl0VkptL3BMdVdKWlI4c3RiSDZXblZVeTBzWGVLUTI3cllUdE9JSmE2VURw?=
 =?utf-8?B?WmFoSVp3OW5uK203VXFwSFdFRDJZeDR1MklETjdPb2FyTG5xWGJRekNSZEVX?=
 =?utf-8?B?TWt6NjkvT3BWaW92alYxbm10Ujlza3VwZTh6eWlKMjRzY2pMbUtXUEVzNTZs?=
 =?utf-8?B?WHQrSmNOY0pDVk84c2l2bk5VVFhRbThFb2NuL3NteDlWdmpqVHlvRUhzRkxU?=
 =?utf-8?B?SkZqZ041eURWcVE0alFVRnR5MnVBZ3hIWU93dHVudGtzbmEzektEK0JOSWZj?=
 =?utf-8?B?djJKdkJleDh5MHl2T3RyakV3MkpEUUR4TEFqeHhsUVZhWnJzclNCNVVuS0ND?=
 =?utf-8?B?UFkrOUpoZCtmeDhaUjhHZlU4YXVqZ3o5dlRQaFhDb2dKbkw0NXRINm5LM1ZW?=
 =?utf-8?B?aUIyK0ZTQnBudWVxbVVxMGtVa3ZTbXZyb1c5UG5adUhUeU9mdjIyTGZWQ1o3?=
 =?utf-8?B?ZTJJMjRDNHJiYXFJbkRXeEpNdjdPbjk3UmEydnZWRGZQTDVaQ0pVbTIxd05C?=
 =?utf-8?B?c2NXUWZhT05uSFk0czVpakl1bFBsWFk0blBQNkZid0M0SkJkWklaOU1Ha29a?=
 =?utf-8?B?VUVSeWZVNHhKY0QrVzY3R1NoM2JJV3FTNDg1LzVldWhaNm8ydE1wY3JiYjZH?=
 =?utf-8?B?MGUvUlR3MHJLSllHY0xnT2xwNjdxK2JvdjlydDRmT0JkRVZ2bVdQUXp0ZUdY?=
 =?utf-8?B?LzRpTE1UbG1kNVFMWXBsbHBTSDlDSW0vNThYVWk4dkVPSmNGOWhlVjZ3Qy91?=
 =?utf-8?B?SGVmSHJveXBzVitDR20vRk1iamFKRzNndXR1WnorbkYvSkdwTVVvUmx0R1Mr?=
 =?utf-8?B?YTBORXM3dGUyTEhiN05hY2RINGRPTEVzT0x4VzBxY0hNU0dsS0F1dUdSNi9v?=
 =?utf-8?B?YTlGMUViVkw5NkNCSysza2Zyand0T2FTNHFoQmoranZMU1pUVWVSVXdlcCt6?=
 =?utf-8?B?L0J2aTBEWWo5OWc0MkhsTDhoWkZVMmVudzhEWEhoTjN6cmhyTHpIbTJiUTVz?=
 =?utf-8?B?a2ducktsNUt4WlZXNS9zQ1RaeEM0OHV2cW1BQ2N6VWlFUHRuVzB6YTl3TjNt?=
 =?utf-8?B?QnFMUG1vYkQ0VFJHUVFxWk92TUllbElBUlZzQlIwM3E2V0xQV1d5SHZoekN3?=
 =?utf-8?B?Rkd4cCsySVlKaThKOW8xdy9oWFpkWWF4c0l1bStsbzJRNHZJdCtsSTRDZTho?=
 =?utf-8?B?ZVlBZ3dLa1M4U3MvREZRKy9OTGl3K1V6VmdHSkFsakJMcFR2L2RGL3dRMUhN?=
 =?utf-8?B?ZmE2bmhYbHNmakdpdElMenFJOWVobXQrUzJoT2tSUU5GSG9oVVRLMXF1V2RN?=
 =?utf-8?B?NlpyQTRSZDdiaXpJZTY5OXBCZ0hwN0VmVVZQTEpQcE5CVklqVkFSZ3lXc1gy?=
 =?utf-8?B?ZkF2Z09md0xJa2I1SUFMZWVwSlN1U2h4UkxTTGEvSXI0MXd4MW1IbGVjWmt6?=
 =?utf-8?Q?IodNKQPncbSxpsmxqHku6WNukG2elj+gtx2oC3C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335e824e-5846-4617-d425-08d98c94132a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:49:45.4987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txe1SUxs5SygWkHpaPcFAQ7GPdqHj4HB8NHVHrH1vHfbcgYHDgyc15ZrrippiOYJHXi6qf7p2BYRPo9k5l0vDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

BIOSes, when enabling the dedicated DMAR unit for the sound device,
need to also set a non-zero number of TLB entries in a respective
system management register (VTISOCHCTRL). At least one BIOS is known
to fail to do so, causing the VT-d engine to deadlock when used.

Vaguely based on Linux'es e0fc7e0b4b5e ("intel-iommu: Yet another BIOS
workaround: Isoch DMAR unit with no TLB space").

To limit message string redundancy, fold parts with the IGD quirk logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: This requires MMCFG availability before Dom0 starts up, which is
     not generally given. We may want/need to e.g. (ab)use the
     .enable_device() hook to actually disable translation if MMCFG
     accesses become available only in the course of Dom0 booting.
RFC: While following Linux in this regard, I'm not convinced of issuing
     the warning about the number of TLB entries when firmware set more
     than 16 (I can observe 20 on the on matching system I have access
     to.)

I assume an implication is that the device in this case then may not be
passed through to guests, but I don't see us enforcing the same anywhere
for graphics devices when "no-igfx" is in use. Yet here I would want to
follow whatever pre-existing model ...

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -100,6 +100,7 @@ int msi_msg_write_remap_rte(struct msi_d
 int intel_setup_hpet_msi(struct msi_desc *);
 
 int is_igd_vt_enabled_quirk(void);
+bool is_azalia_tlb_enabled(const struct acpi_drhd_unit *);
 void platform_quirks_init(void);
 void vtd_ops_preamble_quirk(struct vtd_iommu *iommu);
 void vtd_ops_postamble_quirk(struct vtd_iommu *iommu);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -750,27 +750,43 @@ static void iommu_enable_translation(str
     u32 sts;
     unsigned long flags;
     struct vtd_iommu *iommu = drhd->iommu;
+    static const char crash_fmt[] = "%s; crash Xen for security purpose\n";
 
     if ( drhd->gfx_only )
     {
+        static const char disable_fmt[] = XENLOG_WARNING VTDPREFIX
+                                          " %s; disabling IGD VT-d engine\n";
+
         if ( !iommu_igfx )
         {
-            printk(XENLOG_INFO VTDPREFIX
-                   "Passed iommu=no-igfx option.  Disabling IGD VT-d engine.\n");
+            printk(disable_fmt, "passed iommu=no-igfx option");
             return;
         }
 
         if ( !is_igd_vt_enabled_quirk() )
         {
+            static const char msg[] = "firmware did not enable IGD for VT properly";
+
             if ( force_iommu )
-                panic("BIOS did not enable IGD for VT properly, crash Xen for security purpose\n");
+                panic(crash_fmt, msg);
 
-            printk(XENLOG_WARNING VTDPREFIX
-                   "BIOS did not enable IGD for VT properly.  Disabling IGD VT-d engine.\n");
+            printk(disable_fmt, msg);
             return;
         }
     }
 
+    if ( !is_azalia_tlb_enabled(drhd) )
+    {
+        static const char msg[] = "firmware did not enable TLB for sound device";
+
+        if ( force_iommu )
+            panic(crash_fmt, msg);
+
+        printk(XENLOG_WARNING VTDPREFIX " %s; disabling ISOCH VT-d engine\n",
+               msg);
+        return;
+    }
+
     /* apply platform specific errata workarounds */
     vtd_ops_preamble_quirk(iommu);
 
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -100,6 +100,69 @@ static void __init cantiga_b3_errata_ini
         is_cantiga_b3 = 1;
 }
 
+/*
+ * QUIRK to work around certain BIOSes enabling the ISOCH DMAR unit for the
+ * Azalia sound device, but not giving it any TLB entries, causing it to
+ * deadlock.
+ */
+bool is_azalia_tlb_enabled(const struct acpi_drhd_unit *drhd)
+{
+    pci_sbdf_t sbdf;
+    unsigned int vtisochctrl;
+
+    /* Only dedicated units are of interest. */
+    if ( drhd->include_all || drhd->scope.devices_cnt != 1 )
+        return true;
+
+    /* Check for the specific device. */
+    sbdf = PCI_SBDF2(drhd->segment, drhd->scope.devices[0]);
+    if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) != PCI_VENDOR_ID_INTEL ||
+         pci_conf_read16(sbdf, PCI_DEVICE_ID) != 0x3a3e )
+        return true;
+
+    /* Check for the corresponding System Management Registers device. */
+    sbdf = PCI_SBDF(drhd->segment, 0, 0x14, 0);
+    if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) != PCI_VENDOR_ID_INTEL ||
+         pci_conf_read16(sbdf, PCI_DEVICE_ID) != 0x342e )
+        return true;
+
+    vtisochctrl = pci_conf_read32(sbdf, 0x188);
+    if ( vtisochctrl == 0xffffffff )
+    {
+        printk(XENLOG_WARNING VTDPREFIX
+               " Cannot access VTISOCHCTRL at this time\n");
+        return true;
+    }
+
+    /*
+     * If Azalia DMA is routed to the non-isoch DMAR unit, that's fine in
+     * principle, but not consistent with the ACPI tables.
+     */
+    if ( vtisochctrl & 1 )
+    {
+        printk(XENLOG_WARNING VTDPREFIX
+               " Inconsistency between chipset registers and ACPI tables\n");
+        return true;
+    }
+
+    /* Drop all bits other than the number of TLB entries. */
+    vtisochctrl &= 0x1c;
+
+    /* If we have the recommended number of TLB entries, fine. */
+    if ( vtisochctrl == 16 )
+        return true;
+
+    /* Zero TLB entries? */
+    if ( !vtisochctrl )
+        return false;
+
+    printk(XENLOG_WARNING VTDPREFIX
+           " Recommended TLB entries for ISOCH unit is 16; firmware set %u\n",
+           vtisochctrl);
+
+    return true;
+}
+
 /* check for Sandybridge IGD device ID's */
 static void __init snb_errata_init(void)
 {


