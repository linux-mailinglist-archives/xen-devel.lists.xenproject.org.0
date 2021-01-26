Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B064303B27
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74846.134610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MD0-0001R1-Kg; Tue, 26 Jan 2021 11:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74846.134610; Tue, 26 Jan 2021 11:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MD0-0001QM-FG; Tue, 26 Jan 2021 11:08:30 +0000
Received: by outflank-mailman (input) for mailman id 74846;
 Tue, 26 Jan 2021 11:08:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4MCy-0001PP-Vi
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:08:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8301c828-1086-4441-8918-f37be9196020;
 Tue, 26 Jan 2021 11:08:27 +0000 (UTC)
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
X-Inumbo-ID: 8301c828-1086-4441-8918-f37be9196020
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611659307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+Y6GrmAeF2fUu0S/2qyh56Dq2QXhgtZ6gEzn+JGVP2c=;
  b=AeH72sl7330R05Zb+vniTzKJC8Qa8M/Teg/jYbM7HQvn/E+n2OUXX9AS
   SMdHqgeHvi9N9RmqfosoCTAJbXLn81TK+R6HsajvDwM313Nxewfx0JJWi
   T1HMSuKWCT7bMss3nbtLTtWHxIKH64GKMpgGP7ZAFAlciAG+E/Msko0Jd
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zF980WfHV/D3S2j3ukDxOhPLkEe8aVINO8mhmTZ0IMjvbUXYoDN6dewsTnpGKxNMyldQlVCRtx
 fJ3rc5BG28Gk3+nDl6QvGV+noI6LQmPkYlUc6VVnEoMYFGGhPJXvoptpN1VhRRvFSb3tJ+EgWj
 9ltb6Wm2PaP55Yoj6GevyOSmJzkue0KMOhokX01+jSMXieU5qbJ8Wqe7arRi9TBsD+nHAPqF/1
 89JvFLFHIkeRoBmR5tsr7JAmV/zKgjV4yKsL13SnOoF8onrItddTrEXdUOrGrnmZG6HqAmv94j
 7ZU=
X-SBRS: 5.2
X-MesageID: 37168647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="37168647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na/9RLEvdTAP00GtvEuGJPAnqPGSSqO/jbvSGICu70ugMbJadcIIQmPVic9cXvjFYZRIzBgeAJfs3jb2ToyFHiEE68PMp2alcAMdq7Lo+J+wu2FS7egW11z3w2henJWVPDIu+xjKtTj7DQl4/2V7ErceCV+NdacCUZTHUVpAZkXdocUXvE9Uhfd4wSpXMFiXhzYi/6+n8CpD2mnNAHrg9lGvoVqKVr984mdht24V8/XWQyv94Uv7GwCpojajTYY3OqkFwjNVtvqPvSrBzXG1CImOZZtYVDG1Py0afJRv+sgzSh2ckqcgBfKQCpdaQM1YJStrfvJpDnn/L1an4qeD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq1Aix58aH3zzkOd8rRntNDXU6045fRsfX+qmZVQiyo=;
 b=Z8ZKIM2ZHjJrdyhGyqA2NyO9gq4+rvZDuI2vht4Iay0XpAXyls1MOSjn65hiS8OBQkiFSfmOUctB39lOJHcAYiKjZUblynQIWdWLOMyDOswrDG9hPokmR9jiMSkUUTD43BlKK7EUcIEqZmWQI+7K0nZTrLWkZiqhzlVRvC2V713iVjfA5A+t0v192+gTIBgM3yVR6GqeEk3+zO7O17gtbYHLWedzdowNVovkYNOp8teD9o1A3EYhlpDJm0heYJsspeT5dj41yzTu1gVgKNWKwCdTRJ8iMO2oobLr5K8EaDwYcmHFDH3M3VHlZGhjnA50We3VVnyWDLz9AyabJgd1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq1Aix58aH3zzkOd8rRntNDXU6045fRsfX+qmZVQiyo=;
 b=E5TN671DOcdE5iaF8Z2GsayYieblEHUoMAUdAS0J90tYvnzOo/iyudTUKBIIfHKI0Z8y/4tzMa22bTEAnowD8/I4kR/HDmrVs6ZTQ7ZcwrjQvgiL7ubI1sxo5lD8k+8C8T19P6I0sayYBGh0vynEPUqSV8/QiJxw2fS1Tz9Hkmc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH 3/3] x86/vmsi: tolerate unsupported MSI address/data fields
Date: Tue, 26 Jan 2021 12:06:06 +0100
Message-ID: <20210126110606.21741-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126110606.21741-1-roger.pau@citrix.com>
References: <20210126110606.21741-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0201CA0014.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ff21026-898a-48e6-8391-08d8c1eaad6a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059A958C8F65E2A437F99DB8FBC9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xGZWrheZrmWs/zaT/KDQPBQUhcW8qhuDj8ZtLcU4+iIGg7QKcBjfkUibedxo8b568DzWQ5txAPQnE65Upz42O/cBzcpXd3rtxWUEGZWfKxwRa/UhFxGpFGwYslCTG1ZNA+jlq078tlROlaFLiw2OUzaQQcatWam65b0BGA4U6PbGUihoK2+94bLuB4YKumNqQscmmTlYEii7u1FMkJRSJWff93FmXd0O1dSgjyMKypjSj1/HvCWqITu0jW9Bxg95oTccGsM5Yb6nRXBwYPDKVgxO1JRRsdwopDLtRREyy8Q7m0oU25anLadYHM1UuuWif1DFQ5XOwKw8yP4t/meCFESJ+opsZ6GZXgtHlV3bZLDvaEU/6YtxbdSlF6C+9R4DbOkEFLI0Hbz9AdaQKdGtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(186003)(83380400001)(478600001)(26005)(5660300002)(2906002)(66476007)(54906003)(16526019)(6496006)(6486002)(6666004)(956004)(8676002)(2616005)(86362001)(8936002)(36756003)(66946007)(6916009)(66556008)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OURheWZRREpzaFFnY1FkeTd5Tm5ULzBNdmdLd0ZBV05HU3h5bGZuTzF4MEZs?=
 =?utf-8?B?TmxuMkd1V0ZraGM2WHhsb0FBOHRWa2ZCQ2FmdDdHdm14ajNVYTJWQ1hBUlFB?=
 =?utf-8?B?VXg0aU5VajFCa21obkFIdGF4ckVlMlQxeXdKUG5VM05CN0pPSXNLMDNpYnRB?=
 =?utf-8?B?Wm9qdmk1b0ZROStTOTJGQ096aDJOaDk0S0ZsVStPREtJeVVKUXVZR2JnNGJZ?=
 =?utf-8?B?WTRCQjA5azk2NDd1alUxN2w4NWJpdmN3d2FIdTQ1dnRTckZlSVdVaDVFVmFU?=
 =?utf-8?B?MDgyMWV2dWFLb2ZGUkRJREIvMFpGOVdEeFhGS3V6cWYySVB5WDN2L0puUlZM?=
 =?utf-8?B?cWc5a3ZRQmJOSG1KY2tlYUdKMkNlTzR5ZEFXbEhrSzF2bjhLcXNlNXc0UVRP?=
 =?utf-8?B?TW5iV20xUnYvNWxkWnFubzVmcVZNZHhqS1lsb3lmL1V3dC9CMWFPQjRKQ3F4?=
 =?utf-8?B?STdYQ3RBNnA2dnhEcS9zci9kTDlBYUNLN2tlTk9yUWo2SCtSVHpicWdwOXE5?=
 =?utf-8?B?K1c3eGp2cjFmYWFGVUUrb1NLWnR1YXZBamF0QkdGb0Z4cVpNMUxlOXM0RzNa?=
 =?utf-8?B?NlhCQ1EzYTV1cHRMOXdnUnRqcDBHWDJTWkVoNU9IMGNNSVNlemFTWVlzTnFX?=
 =?utf-8?B?RHJoRFlWbHhBWllyVDdyS0VlakdJbzdWdFlQRzhlcHo3SnEvVEZsaldaSFhQ?=
 =?utf-8?B?RXBINGxRcldoUEtYeFc3bTdCbGErSGpsa3RaaGo3MG9aWkd1MXVCUzAwbUxm?=
 =?utf-8?B?MUtkVWFWczhONXVlT1JzY3J4eWtSZ08zR04xTjV6MUR6WUQ3N3JkaEsraUgy?=
 =?utf-8?B?TWcxV05URDVVdUxic053VXE5LzdqUEhXSllpY0htdFVkdTJRVFhTTUFJNUFU?=
 =?utf-8?B?bkV0S0ZaWFhTQWlQYmV5MnVuY3NSVUVNaHN4MlpVZXd0Z3ptMHoxbXh0MkVG?=
 =?utf-8?B?Wm5iZWtjalZhZk9nWVhWZTVTUExtbmQ3M3hQcmhqanhzMUNCY0tMQllGOTgr?=
 =?utf-8?B?TUxpNDlwTnJ3UDhCUzg0eCtEQjVLVEJGN1NSRlR2QUNLRCsyaW5kVFJnQ0Ro?=
 =?utf-8?B?QUFqQktZWmlFWmdDS0QvNzJzYnllR0RSQ3hoNnNadHJONjFBS0svZGNvU0cr?=
 =?utf-8?B?RUVOT1NmeCtMek9EdE9vY2NRQTArZUNPelYwanUwR0E4Uk9zT2UvV09nZ0Qx?=
 =?utf-8?B?VVZQcmxOL3E2Sk5Vc1FkaWhISDRSa1oxM2lLdktmeC81UjJvUVQxdEEyWmNY?=
 =?utf-8?B?Y0ducFZmeWY0d1NrenJpS3VhaHQ3UG9Lb1EvcjZUWXlLWVd6Wlk0elNTWVkw?=
 =?utf-8?B?S1R1RXY1WkliQ3QvV09PZ293UFpPZS9ON3dKV1ZhVm1oYnFidjdCVEwvcnRH?=
 =?utf-8?B?RFZYUS9zK3VCcHhGUXBUYUlJMGYrNlVBYWhvUWx6RW5wVlpwWDB1T2F3UmlL?=
 =?utf-8?Q?WBlRSf+1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff21026-898a-48e6-8391-08d8c1eaad6a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:08:15.0982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2O05zvtnXeGQSUwI4QHGFKgbVcnSBpBeWOC2R3h9doDwpqnCeanu/1h7s3ApR1F2s6HScc3W69S+Q+BkFkGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Plain MSI doesn't allow caching the MSI address and data fields while
the capability is enabled and not masked, hence we need to allow any
changes to those fields to update the binding of the interrupt. For
reference, the same doesn't apply to MSI-X that is allowed to cache
the data and address fields while the entry is unmasked, see section
6.8.3.5 of the PCI Local Bus Specification 3.0.

Allowing such updates means that a guest can write an invalid address
(ie: all zeros) and then a valid one, so the PIRQs shouldn't be
unmapped when the interrupt cannot be bound to the guest, since
further updates to the address or data fields can result in the
binding succeeding.

Modify the vPCI MSI arch helpers to track whether the interrupt is
bound, and make failures in vpci_msi_update not unmap the PIRQ, so
that further calls can attempt to bind the PIRQ again.

Note this requires some modifications to the MSI-X handlers, but there
shouldn't be any functional changes in that area.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmsi.c      | 93 +++++++++++++++++++-----------------
 xen/drivers/vpci/msi.c       |  3 +-
 xen/include/asm-x86/hvm/io.h |  1 +
 xen/include/xen/vpci.h       |  3 +-
 4 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index a2ac82c95c..13e2a190b4 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -715,32 +715,37 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
     return 0;
 }
 
-int vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
+void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev)
 {
+    unsigned int i;
     int rc;
 
     ASSERT(msi->arch.pirq != INVALID_PIRQ);
 
     pcidevs_lock();
-    rc = vpci_msi_update(pdev, msi->data, msi->address, msi->vectors,
-                         msi->arch.pirq, msi->mask);
-    if ( rc )
+    for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
     {
-        spin_lock(&pdev->domain->event_lock);
-        unmap_domain_pirq(pdev->domain, msi->arch.pirq);
-        spin_unlock(&pdev->domain->event_lock);
-        pcidevs_unlock();
-        msi->arch.pirq = INVALID_PIRQ;
-        return rc;
+        struct xen_domctl_bind_pt_irq unbind = {
+            .machine_irq = msi->arch.pirq + i,
+            .irq_type = PT_IRQ_TYPE_MSI,
+        };
+
+        rc = pt_irq_destroy_bind(pdev->domain, &unbind);
+        if ( rc )
+        {
+            ASSERT_UNREACHABLE();
+            domain_crash(pdev->domain);
+            return;
+        }
     }
-    pcidevs_unlock();
 
-    return 0;
+    msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address,
+                                       msi->vectors, msi->arch.pirq, msi->mask);
+    pcidevs_unlock();
 }
 
-static int vpci_msi_enable(const struct pci_dev *pdev, uint32_t data,
-                           uint64_t address, unsigned int nr,
-                           paddr_t table_base, uint32_t mask)
+static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
+                           paddr_t table_base)
 {
     struct msi_info msi_info = {
         .seg = pdev->seg,
@@ -749,7 +754,6 @@ static int vpci_msi_enable(const struct pci_dev *pdev, uint32_t data,
         .table_base = table_base,
         .entry_nr = nr,
     };
-    unsigned vectors = table_base ? 1 : nr;
     int rc, pirq = INVALID_PIRQ;
 
     /* Get a PIRQ. */
@@ -763,18 +767,6 @@ static int vpci_msi_enable(const struct pci_dev *pdev, uint32_t data,
         return rc;
     }
 
-    pcidevs_lock();
-    rc = vpci_msi_update(pdev, data, address, vectors, pirq, mask);
-    if ( rc )
-    {
-        spin_lock(&pdev->domain->event_lock);
-        unmap_domain_pirq(pdev->domain, pirq);
-        spin_unlock(&pdev->domain->event_lock);
-        pcidevs_unlock();
-        return rc;
-    }
-    pcidevs_unlock();
-
     return pirq;
 }
 
@@ -784,25 +776,28 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, const struct pci_dev *pdev,
     int rc;
 
     ASSERT(msi->arch.pirq == INVALID_PIRQ);
-    rc = vpci_msi_enable(pdev, msi->data, msi->address, vectors, 0, msi->mask);
-    if ( rc >= 0 )
-    {
-        msi->arch.pirq = rc;
-        rc = 0;
-    }
+    rc = vpci_msi_enable(pdev, vectors, 0);
+    if ( rc < 0 )
+        return rc;
+    msi->arch.pirq = rc;
 
-    return rc;
+    pcidevs_lock();
+    msi->arch.bound = !vpci_msi_update(pdev, msi->data, msi->address, vectors,
+                                       msi->arch.pirq, msi->mask);
+    pcidevs_unlock();
+
+    return 0;
 }
 
 static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
-                             unsigned int nr)
+                             unsigned int nr, bool bound)
 {
     unsigned int i;
 
     ASSERT(pirq != INVALID_PIRQ);
 
     pcidevs_lock();
-    for ( i = 0; i < nr; i++ )
+    for ( i = 0; i < nr && bound; i++ )
     {
         struct xen_domctl_bind_pt_irq bind = {
             .machine_irq = pirq + i,
@@ -822,7 +817,7 @@ static void vpci_msi_disable(const struct pci_dev *pdev, int pirq,
 
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev)
 {
-    vpci_msi_disable(pdev, msi->arch.pirq, msi->vectors);
+    vpci_msi_disable(pdev, msi->arch.pirq, msi->vectors, msi->arch.bound);
     msi->arch.pirq = INVALID_PIRQ;
 }
 
@@ -857,14 +852,22 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
     int rc;
 
     ASSERT(entry->arch.pirq == INVALID_PIRQ);
-    rc = vpci_msi_enable(pdev, entry->data, entry->addr,
-                         vmsix_entry_nr(pdev->vpci->msix, entry),
-                         table_base, entry->masked);
-    if ( rc >= 0 )
+    rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
+                         table_base);
+    if ( rc < 0 )
+        return rc;
+
+    entry->arch.pirq = rc;
+
+    pcidevs_lock();
+    rc = vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->arch.pirq,
+                         entry->masked);
+    if ( rc )
     {
-        entry->arch.pirq = rc;
-        rc = 0;
+        vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
+        entry->arch.pirq = INVALID_PIRQ;
     }
+    pcidevs_unlock();
 
     return rc;
 }
@@ -875,7 +878,7 @@ int vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
     if ( entry->arch.pirq == INVALID_PIRQ )
         return -ENOENT;
 
-    vpci_msi_disable(pdev, entry->arch.pirq, 1);
+    vpci_msi_disable(pdev, entry->arch.pirq, 1, true);
     entry->arch.pirq = INVALID_PIRQ;
 
     return 0;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 65db438d24..5757a7aed2 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -85,8 +85,7 @@ static void update_msi(const struct pci_dev *pdev, struct vpci_msi *msi)
     if ( !msi->enabled )
         return;
 
-    if ( vpci_msi_arch_update(msi, pdev) )
-        msi->enabled = false;
+    vpci_msi_arch_update(msi, pdev);
 }
 
 /* Handlers for the address field (32bit or low part of a 64bit address). */
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 9453b9b2b7..3d2e877110 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -130,6 +130,7 @@ static inline void msixtbl_init(struct domain *d) {}
 /* Arch-specific MSI data for vPCI. */
 struct vpci_arch_msi {
     int pirq;
+    bool bound;
 };
 
 /* Arch-specific MSI-X entry data for vPCI. */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 5295d4c990..9f5b5d52e1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -160,8 +160,7 @@ int __must_check vpci_msi_arch_enable(struct vpci_msi *msi,
                                       const struct pci_dev *pdev,
                                       unsigned int vectors);
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev);
-int __must_check vpci_msi_arch_update(struct vpci_msi *msi,
-                                      const struct pci_dev *pdev);
+void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev);
 void vpci_msi_arch_init(struct vpci_msi *msi);
 void vpci_msi_arch_print(const struct vpci_msi *msi);
 
-- 
2.29.2


