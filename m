Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48761435E69
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214273.372781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqB-0001QI-0R; Thu, 21 Oct 2021 09:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214273.372781; Thu, 21 Oct 2021 09:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUqA-0001OD-St; Thu, 21 Oct 2021 09:58:26 +0000
Received: by outflank-mailman (input) for mailman id 214273;
 Thu, 21 Oct 2021 09:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdUq9-0001O5-Vo
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:58:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e20e246-3255-11ec-8373-12813bfff9fa;
 Thu, 21 Oct 2021 09:58:25 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-Pj40-NccPdGmwrf4w8spvA-1;
 Thu, 21 Oct 2021 11:58:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 09:58:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 09:58:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 09:58:20 +0000
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
X-Inumbo-ID: 6e20e246-3255-11ec-8373-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634810304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNxaaOTDiAFX60qMVwLfMAPbo6sm/y2BMjhq80ooH2c=;
	b=bL+M7ndrNx3pu/ZO3Fm5pI5EpYVe2kxZRo9a3Mgb2PWWQnrqVtqMY9hpG3muOLeljH8UIz
	/RLwGD7DD5R8ZBNZM5vdk3J7uyWqTM67OELXv9nO0u5QTf1lqIqyaJfvO74lx5WoeTnLNP
	UIXNzHKHLWMRA7xyzolmCN5KlkNBwAQ=
X-MC-Unique: Pj40-NccPdGmwrf4w8spvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrFCDPx4YPNSAwIAoO+aaljJpzL9dZgnV0eFuWA2kXy6sI2WFR+pjwmU+hahBkYmBXWQv2vV/vmgoHni5vDndlUw+/0bA7Py9X0Ptlo/bgf/WaXTa0UVdKMo5t9RS+K29nhl2wHpmPe/D+S8sp4Qbi5dvfYs2o/cv69BPFmTW1EcdAm3DUIEk9DVDY3JffaAvkCYrLkhUyMzc5lRe8EddOESCLmF2s0DvAjAYtwMDMnkUcnHckv5cVz7az3+wZam+92SJkknfLHy3eKP6/mCDJgCyTruq+Lwjy94sOWf48bnl4aT9mB4kocGbayThpe5YGvi8fBfL3lI+JlHaPb1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNxaaOTDiAFX60qMVwLfMAPbo6sm/y2BMjhq80ooH2c=;
 b=BTULTezE0dM2iWBAJwfYSzz14lHmIvMLI/q47jfg0NbbNtatZivZvpIQuBjshtj5/BrrbRnmxwaVqDgphmwmrzvxK+E9o2INqTQh6lPVQu2lYJtwa00zJBrnHlz4X0eBRdc0uES7yYPkqHJ0JGzfZRqIoa9dD8YMZ6ZgknbCDiuY9GfKngabbsyAq1wLLGH4LYy0jJzkyoctX4jRUYbvCknlR9i5gTE9mNv0svY7RBNgKDo1yZ4y/tAr0vOjUCR3h7ZRiJvgNXPNv2pyjKQKN1+w37UTEz8gHBDqphAIi16lhXvw+/IG46qITm3hGTeenz+765Ih3U1EVvZHdH8i2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when ACPI
 tables are missing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Message-ID: <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
Date: Thu, 21 Oct 2021 11:58:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d2a24f-161a-4bc1-ca99-08d99479506a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37749C533F342D78A13DBF9CB3BF9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWHrmC08xXzWVmkj2hIXws/oPAKKF291R1esl2D2uH9+3OtU5lTI5XFvnzYNZezvmIJ+GQPrSr5utrDo9t8N+jDq9/l2AHIJ0eLnK6fEntFq7wMLgaQf6p5mKwLty4hbgLuBfk2gPRQhl0VIHoOyQ2Pvv1YlL9Y3VKUpKo/4j2Zq3vdGEk5NBaa2SspFq6BNUNxlBX26rrA10MDcj1BED30alO6Ta6JP6Psc6iauQ46Swr87K7TlWscNHRQYpkDG+aviaYuV2x/tshOlGK71xbfpR4ImABNokhZ8i5pnDe+j12iXF/WyAwJlf6H8fGuC53zCjWDncGAb9WXWx/BdVq6R9hTKDhNeLzchvamZyLQYtTqaEXXSAF7km0tZrPuYzJc6f3IGgYjSFRPC+eo3H9fR5di5Ozye7OjeBDpRjdeNvfbbubSQoGcdgfsg/IRFF+tRoFibybLt6jGMLj/Q7zcLXSf9uU+ZBoTNImhcEZFx9jKBhMW0Nj2tBYavvb4Nin0x3L+RljrBYH0UzcwezfdK6sdxjEgh3tsvMToUQhDA4pmYvcDpopx2VhgSqeUayIbcmL/nmwMG/kXULW8MXop/GW6c4oh+0vdYW7jLslMFrKa/PcSO+xEhZc8qqSzD0aqi1Y2WDkxoYBZlCSu3jvYowok+ZhEi0VSpdkV7IGRCpA/PiMpD5zvJ5+br8WfY63SR84CQP4XmPPSN4OwBCp24fD+3bsUs7awqH0tXvfyXPhewQMFwyNzZsVCJBCkp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(36756003)(16576012)(83380400001)(86362001)(6916009)(8676002)(8936002)(31696002)(31686004)(186003)(66946007)(66476007)(66556008)(26005)(38100700002)(54906003)(4326008)(6486002)(956004)(2616005)(508600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzhPMVJ6OGcwaCtDZmZrMTNJT0ErNWx4bFZTMTNaYTdBbnllV0t1VnpqSUZi?=
 =?utf-8?B?NmJtS09kU0VZQWlCK3kzL1BCUVlKeDRoQjlHcGFhNW5HQURNRjhaYjB5alIy?=
 =?utf-8?B?Vm95YlcycTNvam9CMmpZOTM2dzlIbndoaDFSZFRBQXlIK0dXQnVHVk1ueUFJ?=
 =?utf-8?B?NmJNVHVPTUJTTUVxV2dETkJReGdqWDcxakFlSHhmeXVNNkoyZVZVNXlrUUdh?=
 =?utf-8?B?ODBJdTVPVG5wZVdGQmJSN2NRaGpHbVd6L3pNNDFSeEkwcm9rK0lVN1N4U3V1?=
 =?utf-8?B?aTBzTW9vN1JSS2J3c0xwZDdFaTdDTFZ1OVZrTUw3ZXNYMGRmNVRJeUVjVDZ6?=
 =?utf-8?B?TG1WTXJjUzRXbWtBMndOS3JEeERGTWxmK21XZkZwT0ZwYUh5NzhBdkduSkZp?=
 =?utf-8?B?K1hlM0picTlYYSt6enJzNlpQVWhOK0F6ODhlM2QwU2p3R0prRm9XRGQyd0FB?=
 =?utf-8?B?OEQ1VlJ5M1BxRHFpWFdqZHNzVENpSkpocFJrVDVVakEzdWNGMythNmZqM0F1?=
 =?utf-8?B?ZGU2UEVINDM5cEhWRENtWE1PMGNXMnlxd0M2dkY2elo5NlVkdWJ1aVB1cm1w?=
 =?utf-8?B?d21VVlYwRll1RlZ6T1NhOUQwK2xyVmMxT29wNlFGbExHQUx0V1lkUFVEc1lx?=
 =?utf-8?B?OWhIR3lLNnZDekVYck5uK1I1ODB3WFV5UlFVbVVrb0Jvc2RsdExYZzliWTJS?=
 =?utf-8?B?OTRDenZsNTFubkZQd0RjbTZ3RFV6SDdKTlZkOFpZRkszUHhJTDJmc25RdFB2?=
 =?utf-8?B?VEF2ZjRyTFViSDIzSEVBeTdYZTJtSnF0V3lqTTJSdXlONUN6cEVuTmZVOTZj?=
 =?utf-8?B?ZTJzY3JXUUtYcG5tV1lQcnpyS1dlOE1EQ0Ewa3JJSjNwMm1pZVo0ZmMwQ2Nu?=
 =?utf-8?B?Z0g1M2FDVE0zS0ovSFg4ZW1UaE9SQlFtN0FTWFE1U1ZLaVB1YU9qOHpzRVhM?=
 =?utf-8?B?M09STE45c2JDZi9qVm9Mb2ZvenlnZk03TFJxRElJUU01N0toZERjU25UNnpL?=
 =?utf-8?B?WHNvK3B0Zmk3RjBQc2MyWEg2Sm9tQUFsL0lzRHNNYXRpejA2eW1TNGI4bXdQ?=
 =?utf-8?B?T3ZWR2M3aS9QL0loRGJPN0YrSlB0SnkvRU5lVU9Qbk9LQkpFK25Mb2Q0YzZu?=
 =?utf-8?B?bE1Kb3M0L3E2MnQ2NFIwS0JlMlpKdFFqTmVtYnllMEhwME03TWpnRDYwTnNJ?=
 =?utf-8?B?RlZkck8rcXFOUVhUOVRsdVZvLzd1bjE5UHBIUktzTFVWMmQ5TXpRQkdDS0tN?=
 =?utf-8?B?c2JEVnpUMDEzc1lvV0RVckhad1Q2MWpSUGV6NXZQeVdzVDBQM0ZKaldxNG0x?=
 =?utf-8?B?SThVS2RsZ3BtaHBtbkpvY2Z1eFg1di9vMlF5cU51R3JhcHQyOXBDQU9LTFor?=
 =?utf-8?B?RzdQK1dhajRBby8wVTZOUkpnNjNLak5kNE9MVlVjVEpBNGhHKzR1TG92czdn?=
 =?utf-8?B?bG1aQVRPb1BhNldHbWRWRlhYSU53NTNCMU5PbkFTelhHMlVIWHdMZHM4MVN6?=
 =?utf-8?B?dEw3NW96Sk80c3Jwb01ZWis4VGhubHlXT0FKTjRVTWhmMmJPQ3hHS3ltaFc4?=
 =?utf-8?B?Nkp4Z0daY0xwSmZicVh1SklzWDY0NFd4SVVKd1Znd1F0UzhENmtBYlZndjdo?=
 =?utf-8?B?MUsvTGE3eHRHbWJWOUJPTGU1dWk2VlVMdFgxV2JnR290bU5NQy80SnpNeTdN?=
 =?utf-8?B?OE1GVWRSQkU5Z2QrQXBibThicDJTN3pGVGxwNEs5aWNHb3NOa2JsdmEwRmky?=
 =?utf-8?B?SkFYcnBmMGxmdUtweHJReVE5SG9RYnpuR2hkRXk2UVdKckJGTmlwTUVGVjlD?=
 =?utf-8?B?TXhNK09jZE9UV3FYTEJoNXRxM3lOQjREUWVRcWVUNUN5NGZpbVVSUUM3aDRy?=
 =?utf-8?B?VlduZ0tjemk2cm5zVFdLRnJUYldJMFg1MFZ1Ym1tS0QwbzZnZytWSVl5VVFJ?=
 =?utf-8?Q?4c4e+K1ONf4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d2a24f-161a-4bc1-ca99-08d99479506a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 09:58:21.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
mode (physical vs clustered) depends on iommu_intremap, that variable
needs to be set to off as soon as we know we can't / won't enable
interrupt remapping, i.e. in particular when parsing of the respective
ACPI tables failed. Move the turning off of iommu_intremap from AMD
specific code into acpi_iommu_init(), accompanying it by clearing of
iommu_enable.

Take the opportunity and also fully skip ACPI table parsing logic on
VT-d when both "iommu=off" and "iommu=no-intremap" are in effect anyway,
like was already the case for AMD.

The tag below only references the commit uncovering a pre-existing
anomaly.

Fixes: d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the change here deals with apic_x2apic_probe() as called from
x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
similarly affected. That call occurs before acpi_boot_init(), which is
what calls acpi_iommu_init(). The ordering in setup.c is in part
relatively fragile, which is why for the moment I'm still hesitant to
move the generic_apic_probe() call down. Plus I don't have easy access
to a suitable system to test this case. Thoughts?
---
v2: Treat iommu_enable and iommu_intremap as separate options.

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -183,9 +183,6 @@ int __init acpi_ivrs_init(void)
 {
     int rc;
 
-    if ( !iommu_enable && !iommu_intremap )
-        return 0;
-
     rc = amd_iommu_get_supported_ivhd_type();
     if ( rc < 0 )
         return rc;
@@ -193,10 +190,7 @@ int __init acpi_ivrs_init(void)
     ivhd_type = rc;
 
     if ( (amd_iommu_detect_acpi() !=0) || (iommu_found() == 0) )
-    {
-        iommu_intremap = iommu_intremap_off;
         return -ENODEV;
-    }
 
     iommu_init_ops = &_iommu_init_ops;
 
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -777,11 +777,7 @@ static int __init acpi_parse_dmar(struct
     dmar = (struct acpi_table_dmar *)table;
     dmar_flags = dmar->flags;
 
-    if ( !iommu_enable && !iommu_intremap )
-    {
-        ret = -EINVAL;
-        goto out;
-    }
+    ASSERT(iommu_enable || iommu_intremap);
 
     if ( !dmar->width )
     {
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -41,6 +41,24 @@ enum iommu_intremap __read_mostly iommu_
 bool __read_mostly iommu_intpost;
 #endif
 
+void __init acpi_iommu_init(void)
+{
+    int ret;
+
+    if ( !iommu_enable && !iommu_intremap )
+        return;
+
+    ret = acpi_dmar_init();
+    if ( ret == -ENODEV )
+        ret = acpi_ivrs_init();
+
+    if ( ret )
+    {
+        iommu_enable = false;
+        iommu_intremap = iommu_intremap_off;
+    }
+}
+
 int __init iommu_hardware_setup(void)
 {
     struct IO_APIC_route_entry **ioapic_entries = NULL;
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -141,16 +141,10 @@ extern u32 x86_acpiid_to_apicid[];
 extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
+void acpi_iommu_init(void);
 int acpi_dmar_init(void);
 int acpi_ivrs_init(void);
 
-static inline int acpi_iommu_init(void)
-{
-    int ret = acpi_dmar_init();
-
-    return ret == -ENODEV ? acpi_ivrs_init() : ret;
-}
-
 void acpi_mmcfg_init(void);
 
 /* Incremented whenever we transition through S3. Value is 1 during boot. */


