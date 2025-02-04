Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B1A2763C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 16:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881696.1291857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfL2Z-0005Op-Rq; Tue, 04 Feb 2025 15:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881696.1291857; Tue, 04 Feb 2025 15:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfL2Z-0005MG-Oa; Tue, 04 Feb 2025 15:40:43 +0000
Received: by outflank-mailman (input) for mailman id 881696;
 Tue, 04 Feb 2025 15:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVl2=U3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tfL2X-0005M8-PE
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 15:40:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2009::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 629e09cc-e30e-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 16:40:39 +0100 (CET)
Received: from SJ0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:a03:39c::33)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 15:40:34 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::55) by SJ0PR03CA0358.outlook.office365.com
 (2603:10b6:a03:39c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Tue,
 4 Feb 2025 15:40:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 15:40:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 09:40:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 09:40:32 -0600
Received: from [172.22.239.230] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 09:40:31 -0600
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
X-Inumbo-ID: 629e09cc-e30e-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/70+YoqajjbHlrfJNSm2/dUHEI0fiJibrUEImtqJhJcoMAo3irU6BznTCvEWwrQojg2ZviCmatrB8ITP5sbOO0IZu590CgNNPTlwpJ3YgHdcojAQoWf21UWiPvM+4cutRQPRjNmPBQ4OrTOZ/vmygO/FR9Ge+Eeh5O7a9aIZ0Fe/sTdHclRGSyk32u9geEVv/yYFqhUKTZ1/Joyo/fsLHQYcGiSqaSOZDuNFdZqbrWrLhDceOlp22CkJQR4a90msC99IutI3AA8xjclOvFiT9AwlSfvKbEswtmRvI8SBvxnx6A7I3cGq838YMUYqshEw8g/7Un7ObnVmnTG2Y980g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQcLdlKW0icFyAbjXxqit7HfY/4al4fiiHxm+ExMnSA=;
 b=I+VlucHhvzDbDmNzMCMZE9XsFpHxzZZwNdDlDXeckCjOdDzZh6O7+t4Zli6Ahti2percvwkqq2VM9STVB6wetIkIuhm9gkYvjyul7uetXHhhj6uL9OtKCk10xDJNpsp9QSbVCpeKtgw7YQfjiKabDrOSs5EqbLT0A1k2UE+4u2PTzHLxJoHq53AL2E/dDFBxbpNQceOK47c17rzP2zz7YyhpV8vADiA/2OPbQ12K1HkZtvZo/swN/EycpdxBsuvibk/x41Y8ru+x+EiGoXFwRVWb66Au+pwnwws7OTAsDSTnMllTEXkglJi2gK6T0WZ4pfHjCRyrEh0aBGleC3JDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQcLdlKW0icFyAbjXxqit7HfY/4al4fiiHxm+ExMnSA=;
 b=sBU+m3hnQZ6QHKioqpGnTqZQKJDVdSgA8D9x/iZpLrAXzjNQq4pISb6R2XX8VildgIt8NKGdM53xZ7eRHUfAOiJbj+jiJDg+sgML9EerK8qN2vz4smjRrLI3lXVm9CaHGbTqo0ItBWYhRwVOkQgMTVRPcepF/IXHM0D+PHmNlgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <95e997d0-2b5c-411a-adac-246bfd1780de@amd.com>
Date: Tue, 4 Feb 2025 10:40:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] x86/hyperlaunch: add capabilities to boot domain
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-16-dpsmith@apertussolutions.com>
 <108bc55e-cde6-4a2e-ada2-571c4d72bfa5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <108bc55e-cde6-4a2e-ada2-571c4d72bfa5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf47489-5438-4ae5-641d-08dd45324348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Smw3ZU1Hc0JPV1QxdjBJeGN1L3VyaEk2aUJlSGFoL3VYVGQ0TkV1bExZR2dT?=
 =?utf-8?B?VGhyWERSQTdZSkdFa0xUNFkvU21Qa0tRd21mSDZkMGQ1b1haQVdXRENUWnRx?=
 =?utf-8?B?dU9CWDMwcnpKUXpBZENteU5zT2h1OHlxbTdaMHJpYkkrdkNxTFROUngvTGs4?=
 =?utf-8?B?WDdPMlJ5YVdmaFFqQjlmYzRwNGdTSkpXcngrLy91allSUlVsd2FOQ3RaaXhP?=
 =?utf-8?B?dlIvUFlFTVNYc3dnQXB0T1dnS2MrMHViNDQ1K3VBTmRPSzVCMDBjSWRJb283?=
 =?utf-8?B?TzMxRUx4ckxxaS95RUpiN0hlS1pTSWo5Wk03d2hBTUh4SGRWTnQxc0dWaFEw?=
 =?utf-8?B?b1hjMG5WbURlejhCVGVVcU5HUWhscHFSbG9pcWFvdUVTaEhQQ0VUdGFjc0pV?=
 =?utf-8?B?Z1AyVC9aQkJYM2JjRUExUEU0N203Mmt5OWt2Tk5saGd5SEV0VldZeXliMjFT?=
 =?utf-8?B?QjBjODNJT1lNc29oMFBtRFd5VjMzMUhjTGZ2RG1kT2pBUWEwWTlIYW5nQUJq?=
 =?utf-8?B?bDJSV1Z4VmZFWFNVSUpPeUF4R3BLcFM3T1ZheDRSK1hJNWcrTW5ZdVRjV0xX?=
 =?utf-8?B?cjhvT0FhOWcvRGU3b1VySFVSTDMvb3NyN3YzLzZqc3ZMTjYzaWNCc1F4dXdH?=
 =?utf-8?B?QWtHRXNwZjhJWUJ3NXgvbnpyYXVRMGcrZlpjU1ZpVHU2bkdiMXNqeTNDQnB1?=
 =?utf-8?B?RVFhZFlIVkt4Z2U0dWRCc1BhWXdEeU9VUUxkdm5nK1RKZldWenFpMTVXWmE2?=
 =?utf-8?B?d2R2eGRpU0JSK2d1WmNKTVExclNHOUlRSjZmZ0dSTXBSdTVUNTN0NmNRZlJQ?=
 =?utf-8?B?TVF4UURQM09tZ1laNDZKb08xMm83dEs4UzdJd2FjSFViVGtFenRtYkRVY2NC?=
 =?utf-8?B?S1pMK3lQeWppaGFWTlpsSEtpZzR4VFVJSlpYNHYvTnhLb2E3UElVTm85RDUw?=
 =?utf-8?B?QlZGbGtsK2RyeVlDVitsRnhOWThBYTVZa1hsNWo5WHJSbnkxMjNaQzh3RnFp?=
 =?utf-8?B?YVNra1hGbFg0MWRIQnR2eVh2dVhsdTNXZ3E2RmFKb0FROVpuVWNOa1dkMTBu?=
 =?utf-8?B?TVN6MEVRd3RRdlo1RlZlb0xFKytaUEdUaGZMY2lMWHc3MWp1bldtbXhLY2Y0?=
 =?utf-8?B?R0cwRDIwZExmY2ZrRSsxVy92VEU4by84Z1BhVGZ3ZXY1SUVtZFFkMzJvTE1w?=
 =?utf-8?B?bEQyVU9QOVlTYlU4R1hpRTJDNDNhZnVoZ1VEMUs5Ris3bWdmMk9vU2FjMHM0?=
 =?utf-8?B?VXJzOVNvaDJhdjlGMmgxNHRzZ3BnUlhOTitrWDZTWURWaUdvZWpIZEtldmZ3?=
 =?utf-8?B?ZFM4QzdJRUMvVm16T2xqY29ZZTlIN1JrUVM0NTNZb2syT0VlTy9zMGZteGpZ?=
 =?utf-8?B?cTJxTE9uNkRwYXdyWlJGQmtSWm1nQXg0L3NhVmJKeUhDNnhlY2lEOWZJNndE?=
 =?utf-8?B?TkVKbVlXbjRnUWxncjZSRy96dDMvRm5JNVpDaTJ3ZUs4QWdwS3dxUzVSVm16?=
 =?utf-8?B?Z3NEeS9VeUhERFRDZHNVSmt0SHVzdk9VRXhBZW1NSytRcncvQTNrdmVYYmFR?=
 =?utf-8?B?VnNCdXJyZzdLcmtlUFZLMngxZGZsNHB4SXJyRVVDbHN0Vkw3T2RTcFUrKzJm?=
 =?utf-8?B?dzUvRjNoYTY1aUF5Ly9NeVBpQUo1OWxFVVdSSWFOU1ZjdE1aM3I1UmJZMGhP?=
 =?utf-8?B?Q1pzRndNckEydmx4VE51L290YjVOekRoVlBtMHpNb3hsYWlmWWJCZTdIb1Zi?=
 =?utf-8?B?akxaNzZXdXN1MVl2L3ZncEh1eERmTTF3WUt1VHgrRHgzOTNyNU5tU1gyVHFW?=
 =?utf-8?B?Y0Q3VWdUL2dCQ0hSQ011M0Vsd3JzVlh4SjhWeFR3MzJYd3hjcEt2cnRXejlr?=
 =?utf-8?B?MXVSVEc4MVFNNSs4bnNITGFyTkYrN25yVDdZZ29zbk1xQkJ4TkZnNks5Wi9F?=
 =?utf-8?B?U0V1OXFUWklSdHNpL2RNR0NDVjBqQUk4RksvVWh0cWpZNzMvMjFDM1BHS0hq?=
 =?utf-8?Q?g5O6tdwsLL/Aql/WYOof75LbgtTx1w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:40:33.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf47489-5438-4ae5-641d-08dd45324348
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857

On 2025-02-04 06:13, Jan Beulich wrote:
> On 26.12.2024 17:57, Daniel P. Smith wrote:
>> Introduce the ability to assign capabilities to a domain via its definition in
>> device tree. The first capability enabled to select is the control domain
>> capability.
> 
> Hmm, and not at the same time another one to select "hardware domain"?

Dan has an un-submitted patch that adds in hardware domain.  Related, I 
was preparing a dom0less patch that adds control, hardware, and xenstore 
capabilities.

I've included it below.  To keep them aligned, it creates a new common 
public header with defines for the capabilities.

Regards,
Jason

commit 5d329e6ef7128a4999b28de6745810c595a7f9e8
Author: Jason Andryuk <jason.andryuk@amd.com>
Date:   Fri Jan 31 14:50:53 2025 -0500

     xen/arm: Add capabilities to dom0less

     Add capabilities property to dom0less to allow building a
     disaggregated system.

     Introduce bootfdt.h to contain these constants.

     Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
     ---
     There is overlap with hyperlaunch.  The numeric values are the same.
     Hyperlaunch doesn't expose the values in a public header as done here.
     Is this to be expected for dom0less?  It seems most of dom0less 
isn't in
     a header, but just in docs.

     Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
     domain-level capabilities.

diff --git a/docs/misc/arm/device-tree/booting.txt 
b/docs/misc/arm/device-tree/booting.txt
index 4346953a71..2cd99f9b79 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -167,6 +167,17 @@ with the following properties:
      Refer to docs/misc/cache_coloring.rst for syntax. This option is 
applicable
      only to Arm64 guests.

+- capabilities
+    Optional.  A bit field of domain capabilities for a disaggregated
+    system.  A traditional dom0 has all all of these capabilities, and a
+    domU has none of them.
+
+    0x1 DOMAIN_CAPS_CONTROL  - A privileged, control domain
+    0x2 DOMAIN_CAPS_HARDWARE - The hardware domain - there can be only 1
+    0x4 DOMAIN_CAPS_XENSTORE - The xenstore domain - there can be only 1
+
+    The default is no capabilities.
+
  - vpl011

      An empty property to enable/disable a virtual pl011 for the guest to
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 9f24463ebd..bb49142d24 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -12,6 +12,7 @@
  #include <xen/sizes.h>
  #include <xen/vmap.h>

+#include <public/bootfdt.h>
  #include <public/io/xs_wire.h>

  #include <asm/arm64/sve.h>
@@ -1236,6 +1237,18 @@ void __init create_domUs(void)
              d_cfg.max_maptrack_frames = val;
          }

+        if ( dt_property_read_u32(node, "capabilities", &val) )
+        {
+            if ( val & ~DOMAIN_CAPS_MASK )
+                panic("invalid capabilities (%"PRIu32") overflow\n", val);
+            if ( val & DOMAIN_CAPS_CONTROL )
+                flags |= CDF_privileged;
+            if ( val & DOMAIN_CAPS_HARDWARE )
+                flags |= CDF_hardware;
+            if ( val & DOMAIN_CAPS_XENSTORE )
+                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
+        }
+
          if ( dt_get_property(node, "sve", &val) )
          {
  #ifdef CONFIG_ARM64_SVE
diff --git a/xen/common/domain.c b/xen/common/domain.c
index c170597410..dbeda908be 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -701,6 +701,10 @@ struct domain *domain_create(domid_t domid,
      /* Sort out our idea of is_hardware_domain(). */
      if ( flags & CDF_hardware || domid == hardware_domid )
      {
+        if ( hardware_domain )
+            panic("Can't set %pd - %pd is already hardware domain\n", d,
+                  hardware_domain);
+
          if ( hardware_domid < 0 || hardware_domid >= 
DOMID_FIRST_RESERVED )
              panic("The value of hardware_dom must be a valid domain 
ID\n");

diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
new file mode 100644
index 0000000000..4e87aca8ac
--- /dev/null
+++ b/xen/include/public/bootfdt.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Xen Device Tree boot information
+ *
+ * Information for configuring Xen domains created at boot time.
+ */
+
+#ifndef __XEN_PUBLIC_BOOTFDT_H__
+#define __XEN_PUBLIC_BOOTFDT_H__
+
+/* Domain Capabilities specified in the "capabilities" property.  Use of
+ * this property allows splitting up the monolithic dom0 into separate,
+ * less privileged components.  A regular domU has no capabilities
+ * (which is the default if nothing is specified).  A traditional dom0
+ * has all three capabilities.*/
+
+/* Control/Privileged domain capable of affecting other domains. */
+#define DOMAIN_CAPS_CONTROL  (1 << 0)
+/* Hardware domain controlling physical hardware.  Typically providing
+ * backends to other domains.  */
+#define DOMAIN_CAPS_HARDWARE (1 << 1)
+/* Xenstore domain. */
+#define DOMAIN_CAPS_XENSTORE (1 << 2)
+#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | 
DOMAIN_CAPS_HARDWARE | \
+                              DOMAIN_CAPS_XENSTORE)
+
+#endif /* __XEN_PUBLIC_BOOTFDT_H__ */


