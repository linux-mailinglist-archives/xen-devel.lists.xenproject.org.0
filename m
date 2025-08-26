Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE5B3743D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095132.1450279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uq-0007J0-BO; Tue, 26 Aug 2025 21:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095132.1450279; Tue, 26 Aug 2025 21:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uq-0007Ex-4A; Tue, 26 Aug 2025 21:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1095132;
 Tue, 26 Aug 2025 21:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0uo-0006z4-Qg
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2415::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e779fd-82c0-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 23:09:12 +0200 (CEST)
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 21:09:08 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::52) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 21:09:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 21:09:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 14:09:06 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:06 -0500
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
X-Inumbo-ID: e9e779fd-82c0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mtnb+36F+PKJCuv41WOE5CV/4oQCwPSayAGOZ8oI5Yh1OlQudsn0olfTU4QcjxXYS+cNlm58CUJ2b7HM1o9vCGceOb/AlDIQQKYHgerjfqA+dyEztwp56ood7wZq0qUaLvTa8VfuZ7yWWuMoPYp73Yi1Y6huZByLpCurvshBD0g4e8hzxEDXsym/67zoz5gJGHYiKsmhb3fSIPPpWZ0myPMDo0RtsCBEJ5oC1VEXFQX7U9Te+p1udnVmxn52dcdJ+j5vcvrczJgwkRYOfagvAizJeICStMwi1Wx4JDpC1keQqo1++6zRF+eG07ns6x4inO9gwfD5DWwAu+PJKicllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx6d34oYfnXViK0Sv04HljBO4lYFdDa8TSdzHSfLUho=;
 b=Cb/LMQ0jEpvfn86xykziFoXXjU2d1AL95lv/uzrgXYo8/cj04bwPAgaFzjK76LEuw8byc6lFYDVvqWwD81QezrVAc74USoc6WNg7Zp9KCSZjyKOo0GAkFIJKvnB3VMCIRCBTQyntvzmbL10sn7S6D/yFPui6nvSHXH4dx1sZgNPQTMKuACkg8lq/v+La5Z07HkIXP8hP6awHaMCGlQ9/5aHqhB2dmx8oXrX3wLmB3sXriqf5oit1JukF/Rzwvxw0NsGMCjsl8mNiAk/zeACjnt9yW3zvdXvy9m+S06LfPm/BlRRjezZuHWDUoGCFVCHaR5dANuxIvktujmzzqtFoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx6d34oYfnXViK0Sv04HljBO4lYFdDa8TSdzHSfLUho=;
 b=CnxE2YWXq/dvxv0uXd0wRjXzhElL2Olbh7mECBQtoEne2E/StuUwuopfUijWe9ebh24n3dKiieokfEcQUaHwCfbFQhq74chNLaocnLaKU9Xsd2Xhw7S/SmZ1QrhmgtYJ6k0hhl48FMSoZxiW4o8viBqfVjeYXLgQpZeHnK5cadM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 5/8] tools/init-dom0less: Use introduced to determine no-enhanced
Date: Tue, 26 Aug 2025 17:08:44 -0400
Message-ID: <20250826210847.126015-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c153865-c21f-4867-01f1-08dde4e4cbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DevOs+34sWBhz5ldjCTN7HZvZ+G1EeQE/xeAtdylv54kotTyIeNV1cOFAt8m?=
 =?us-ascii?Q?4lyTro8mkN1r4Df9v3v38gJuqlVeMkqjawUnlasE+AyiAk3aXpyGn8fEf4TL?=
 =?us-ascii?Q?AbkdB7XHOUDySWeR82ccmQ1AQGnmaQpNdbhlr9L3Y1rx2LzvT5UQj+Rj4bdP?=
 =?us-ascii?Q?VykLPM2359czOK1zz+ZaHJUMEA/tW1GnvTdpLdDEDbHcW3rC0ev1HoZGsCfp?=
 =?us-ascii?Q?Xk+XoEQs1zZNoOHlEYil/42CV1+0vIVln0DS7cw9JithWa8fwGwv9EhBo2qi?=
 =?us-ascii?Q?w+C0n2tmtbYQ+N4K2+oYN1HORfm/dfjj/X1fAmPDCsRTmz/TVhJb8hnsPzF3?=
 =?us-ascii?Q?RtlqvwDMtrA8MuJGTZ2lC3RNoAZyin2YAkjWtuBjmg7h5QzDJlFpCOvltE0v?=
 =?us-ascii?Q?FMNWHYWNQg3glhgVaksJH7nrKlpFlMc21p0arZ3iLMRfyZrHCiDiY/H6AcXX?=
 =?us-ascii?Q?4ub+KlX7iHWhfWTFlqwMq27pbmGW1R7/jnt8ihI23F01MwWOHoNOPAEgAv7y?=
 =?us-ascii?Q?wqPSMDHGuCpusP0migT3Wy2xBIlAAy+ZcZWPNWs0D0i3tUB26bsz1I/NsgMa?=
 =?us-ascii?Q?rqKJXtDqS33GtYowS7xOEw5xicbrBOPpp9lQY5HoHDYQw+ZbZIt90FJ5wkKW?=
 =?us-ascii?Q?d/nZqMZA71eq3riNUtl4p0C4lC0Oe8G5YyP3p4n1Pt7iRj/ifSS5tLXP457z?=
 =?us-ascii?Q?DfG/SECyL461ZwFn7GgCaT8Zq9XCMeXnrPU4agFyHQseY8vWPnL6sJqhedCe?=
 =?us-ascii?Q?I716Gx+st5rNBtKHMfQN6dUAUx+nUhR9ASlupzL4YCAJAHCG5Wkn6LNUCi+P?=
 =?us-ascii?Q?ma1DtQitI2SenY8499O3YNBSIrxlP8O8LQB5+h4HBsYZkQrXfefucSr+EOCQ?=
 =?us-ascii?Q?rz9bm9Kb7nKrarml6yuOw+yxIWNzWBBzHO15lDDyd5NTx5VtRLBYLMQGx88i?=
 =?us-ascii?Q?pZn53SGU0vkaXHRlx9NMQhdLY1wNkPQ7Y80MjgLKVZ+bLtrJ1hXYEyi+xt3k?=
 =?us-ascii?Q?ye/7PUgfAu/oAaUAbBhoTfxjB6g71Y6lrE2+Rg3T74lfCuCvd/9Am5N82c18?=
 =?us-ascii?Q?/4412iCYnhNkRQtQ7txcrtqLT/ed3t4yUHnp825KQ3qIHuTO0N8LjHITJ2R6?=
 =?us-ascii?Q?+kptYHq+zXV8hPY6UjpLswyCUBvsOvxfkagRGeeKFMqNS2D5+B0idwHRQsPu?=
 =?us-ascii?Q?FTKWMZrWWNw2KnRb0Xd9TQS8qOyqw1ILoiBrDy7dh+ddGomZlJNookkgQ12x?=
 =?us-ascii?Q?D8etVd5aV+qblQbtXBQaZZasJ7areUtR2+U5vFdDgOkKRCO0Ru83NXiBBw85?=
 =?us-ascii?Q?+lFLAoSDypOYFXI7BRp2KrPWLQS2xVbDRaPnjbbfUseCdL9Wq9DmZr4ad/ZU?=
 =?us-ascii?Q?+vSD5KqDoeCMdMCAW2meChkqiUsu6hTuB9uIn4D8tFYQtiJPZeg5ATtps7cY?=
 =?us-ascii?Q?aFDGTdBtoUUcsoirVcWmhGL9rKC3XVdynncznSjd9KKpRoKS7qdlvAR/0hs1?=
 =?us-ascii?Q?Qm9c7LeVey8ifLtMXwWpiDpxXogwtfLQZKzU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:07.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c153865-c21f-4867-01f1-08dde4e4cbea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272

A hardware+xenstore domain will not be able to read HVM params, and
init-dom0less reads HVM_PARAM_STORE_EVTCHN to determine whether or not
a domain has xenstore.

xenstored had a similar issue, and it just tries to map a domain's
reserved grant, GNTTAB_RESERVED_XENSTORE, to see if it is accessible.
If successful, xenstored introduces the domain.  Use the existing
introduced state to determine if init-dom0less should try and read the
param.  If already introduced, initialization (and reading the
HVM_PARAM) is skipped.

This allows for running init-dom0less from a xenstored+hardware domain.
It relies on the local socket xenstore connections being considered
privileged.

oxenstored has not been updated, so the exist code remains for backwards
compatibility.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
New
---
 tools/helpers/init-dom0less.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index eb793c7aab..a4de40aeac 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -309,16 +309,20 @@ static int configure_xenstore(libxl_dominfo *info,
 
 static int init_domain(libxl_dominfo *info)
 {
-    uint64_t xenstore_evtchn, xenstore_pfn = 0;
+    uint64_t xenstore_evtchn = 0, xenstore_pfn = 0;
+    bool introduced;
     libxl_uuid uuid;
     int rc;
 
-    rc = configure_xenstore(info, &xenstore_evtchn, &xenstore_pfn);
-    if (rc)
-        return rc;
+    introduced = xs_is_domain_introduced(xsh, info->domid);
+    if (!introduced) {
+        rc = configure_xenstore(info, &xenstore_evtchn, &xenstore_pfn);
+        if (rc)
+            return rc;
 
-    if (xenstore_evtchn == 0) {
-        return 0;
+        if (xenstore_evtchn == 0) {
+            return 0;
+        }
     }
 
     libxl_uuid_generate(&uuid);
@@ -332,7 +336,7 @@ static int init_domain(libxl_dominfo *info)
     if (rc)
         err(1, "writing to xenstore");
 
-    if (!xs_is_domain_introduced(xsh, info->domid)) {
+    if (!introduced) {
         rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn,
                                  xenstore_evtchn);
         if (!rc)
-- 
2.50.1


