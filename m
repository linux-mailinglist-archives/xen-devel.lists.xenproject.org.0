Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE69AF88B0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032833.1406258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXK-000592-JU; Fri, 04 Jul 2025 07:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032833.1406258; Fri, 04 Jul 2025 07:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXK-00057f-CL; Fri, 04 Jul 2025 07:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1032833;
 Fri, 04 Jul 2025 07:08:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaXI-0003s2-H7
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b30b95-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:39 +0200 (CEST)
Received: from SJ0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:33a::11)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 4 Jul
 2025 07:08:31 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::eb) by SJ0PR03CA0006.outlook.office365.com
 (2603:10b6:a03:33a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Fri,
 4 Jul 2025 07:08:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:30 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:27 -0500
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
X-Inumbo-ID: b5b30b95-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubgMt8oHzm/5fLKvnRz4RCTzGFd4DQofmzbccEYo7BTtsTI/GOnqtyn6k8pJYwYXM9FPpt/tT951Jd4U7oHT4mcqe1PynSr8bw0b8wEQlLosKRjHMSN64AKJR6EkV1/9AIzrDJzGGC+0qQnoEoVwVAKComR9zjZo4s4vP/N7GDHQD9+D8o20mRqPykss4/KVv6+JDLrgWAN7zn6kyYeuMEaV9Tdu9U30Mzs8Lfav2mr5uI2iqQjAp6+ZsI/PN+dvVP8lC2TrPJqSEitHwkeFcswaWbO2C44fLnvX/JAgs/tw+Xz0RXVFKF1R1nHgPzwoYqullzvD9I/1Mj3TNzeLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G+5bT3eRrrpVUf4HLwb5HttboSojZqEkeaNsKc1IPQ=;
 b=p6w1V72DlsqvqJ/LEigOzX2TxJbADraQB8CgF7j3pIrIDTinn7bDO9BuLwmMPDlJPn2WZUJu/V6iQHQsLlN3+Jdr/d0eXh922c3TCXUcyI0mXPirJxjwAg3g9VxdojIqVUg7wXQ+KI0znDrP245AzzLf4aPqVBqxySqT0ZcUX0oLlJvLA4TiEoTpVotmBQ2/EZQ7+IkFIYTf1sgEoNYqK2vMeWbWu2+Zxu/n7Q5E3wGx0Tuu5OF1PsJitYlLjGyY0MGZ+VZUDvxvO4TE61KGcxj1CZsaaqs3UA3rEsDs3hatIRa5ieB57LZV5ze3coul8uWnJfXMbcAzVpbhnGv/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G+5bT3eRrrpVUf4HLwb5HttboSojZqEkeaNsKc1IPQ=;
 b=Q+KE6tEeWFMJ/WAaxEANkkOb+kBnRb0KoRlEnrLXwl0DnN7U+M33rJsdxOjlzWOh8le8wJrDo13V70tuwPquzf9EBHPnuQZKe9G5kp4H/DaQeBtDHmdZWxgRDenHyHPg6fZd6Sdxy2bpieS9oxbUxVe6rCPm2razh/MJo9KrxQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 4/8] vpci: Hide extended capability when it fails to initialize
Date: Fri, 4 Jul 2025 15:07:59 +0800
Message-ID: <20250704070803.314366-5-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704070803.314366-1-Jiqian.Chen@amd.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|IA0PR12MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb27b58-80e8-4a2c-66fb-08ddbac99538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnBnV0tseS90ZkhnY3h3ZVo0ci9RWkpOMkxmLzFWbkxFZExNSzkrUVQ5TFJa?=
 =?utf-8?B?ZUhnYnVkMkxpRDljcklHcnFrWDlYeUpqSzFuM3RJaG1EV09pTE5XOGpYL2Js?=
 =?utf-8?B?MFJUUFNzMS9sc3Nqc1NhMFJsTU9VN01PSkF0cVh4SDlmVWhOU2NHT3R2SEhk?=
 =?utf-8?B?cUVPcStHaG9sSlE0UVNjN2swMjRCZmpQT2lON2wyaVlSZk8xWWtCaEZkdFRS?=
 =?utf-8?B?ZGkxUDJNeHFoSmxJSW1jZGxjRGZLdWVUZnRFYlVEQTFwcDhKMXlEVVlWbUpu?=
 =?utf-8?B?czNVQWpMTGN0aUdEM3NyWEtubXhJZjdNVzV1T2VHR0hWSXNVMjArNndsSFVt?=
 =?utf-8?B?cmRnTFhzT2FGVTV6c29QblI1cEdGZE0xcXVzNUt4UVl2eVIrUlA2VndtTklE?=
 =?utf-8?B?UDdMMW5Kd1FnRW1ncEJlVlhIeHJDZEtFZXY5T01seTN2akF6SVZFd2hDbXZ2?=
 =?utf-8?B?aERVYllWWXdEUCtTWVpxbmo4VU9QUkhPR296SS85Ny93ZTNoL2g2a2ZMdmxQ?=
 =?utf-8?B?Zm1BRjgxTEdyWW1ob0NyUmMwdWFxUllTbEZVMU1iNkZFUTFvTkRyOURoaVdN?=
 =?utf-8?B?cGNLSEMxNDd1SmF4OVpqbkwyMDZ2MFlYaXhUcWFIeDZBYk1PaitJWHVxRnNL?=
 =?utf-8?B?NUZmd00vSTN1aXJBSmpTSDRLM29lY3puS0Qrbmk4QUdaWXprRmFRV3lXQTdz?=
 =?utf-8?B?UXBmclhzanhOa1kwMnk5VlNRSWxCWW1OempnVFFlSXJjU3BsaG1TTTFpd0M4?=
 =?utf-8?B?VTQ1aHFMemhZbnRGcmRuWis3ZThRdVFDck1xcUVjQzZOYzgxTk1OcEU3blNm?=
 =?utf-8?B?NEk1bGs4RDJkWjdicjd1MEZqZVpEWEU1SkNVYVNjbDFMdU5UY0dsTXdyTmJX?=
 =?utf-8?B?MGduN2FSVTlWZzFFSmg4b29vdjgvRkp5NG41Z2NoRUlQUEhrMUxlZ0NpVmpu?=
 =?utf-8?B?M2p6cXFVbEFHZ3o1SDZRL2VoU1BMbWY5MzU1VEtZenhmcGdXSC9vYndzWTQ4?=
 =?utf-8?B?K3FGdlpTVkNkWTRYYi96OWI3NmZTM3l2L3RHOStvSWh6UDRjTjNPUXBQYTZi?=
 =?utf-8?B?a0ZLeVY1clZiQ2MwOGw3UE80ajFmdmZtUWIvL1ZGeEJ4NGQxTUVxYTJJZDk5?=
 =?utf-8?B?SkszVDA1Y1J0ckxYSVhjRlhXdGppd2Yvd3psWHdSNVpLc1hUQ2tMRlJLN2tH?=
 =?utf-8?B?OEEvSk5QbGxIMFlzUCsrbkNhUUhWTmZSOFFTSXo3VGY4WStGSU9qSzFwOWdz?=
 =?utf-8?B?eVZZV2lnRHJBYi9mRnpsd0kvRnhwUTNmZWRZcFM5cC9RRzJUcmVtSlZnUjh3?=
 =?utf-8?B?VmJBdHVKaUU5U2M2RjhFR0dvdTBXSGNFSk00TkpKaXk0UlZRK0RvWGpoOU40?=
 =?utf-8?B?NmRNSmVXZnc4NSt2cnRiK3JvaUYrUnUwYmpINllTek9QMDZtWG5lenF6bWQv?=
 =?utf-8?B?cG1BRlZGTHhnazlDNW0wNUNsNEZiQjB6ZDEyZFFsM0pLb3NCTWN5a2x2TlBk?=
 =?utf-8?B?RUdWUUhtQ2RYWllLTks3M3VyTW1pbXZsWUdlRkR3ZHd5cmhwdVdWZjNJMEJu?=
 =?utf-8?B?ZGxyWCttRWV3dzN2S3hQNUV4OGJsMW90Y3ZqTk5MTkZodnFMZjJFZVdiWStZ?=
 =?utf-8?B?VTBLd3Vka29FY3p5VUl2YWpmUmZIVzBrWFhBSFRCWUp5SlRsQnVzN05sbmRk?=
 =?utf-8?B?UmdraVlFN0duWFZYVCtobS9aWkN5ZjB5N0RPM0NJMGN2clgrTmJ6TGpOWC9B?=
 =?utf-8?B?VEIxaERXT1ZyOEJTclFYOHp4MHZsUXh1VmdVMDZ0cXdWUy9SbDFMUlg3bXFF?=
 =?utf-8?B?aml6QzFGNis2UmNKczBWRGJSV2RsMDQxZDd1ck1pM0JRdGlkSktTbXVWKzBJ?=
 =?utf-8?B?eXdwTlhzQnJFQUxuRTdNcWFIR0pOUDdOSnRLempLS2tYdzV2bTQ5V29rVGF1?=
 =?utf-8?B?RnMrbVB1aFlqbHFKRGJZeUkwS0xYUWhsZGRuemdBSkhBOHRKMk1uREdDT2s4?=
 =?utf-8?B?cGVqOWcyY0tmVjl2TzZlS2pjVGwyZ0tEZ3JXUlpnQnEyMDZtdEd4Q01tNG1z?=
 =?utf-8?Q?LjHFuK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:30.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb27b58-80e8-4a2c-66fb-08ddbac99538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745

When vpci fails to initialize a extended capability of device, it
just returns an error and vPCI gets disabled for the whole device.

So, add function to hide extended capability when initialization
fails. And remove the failed extended capability handler from vpci
extended capability list.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Comment left over for the situation that "capability in 0x100 can't be removed case"
from Jan in last version, need Roger's input.

Jan:
Can we rely on OSes recognizing ID 0 as "just skip"?
Since the size isn't encoded in the header, there might be issues lurking here.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v6->v7 changes:
* Change the pointer parameter of vpci_get_previous_ext_cap_register()
  and vpci_ext_capability_hide() to be const.

v5->v6 changes:
* Change to use for loop to compact code of vpci_get_previous_ext_cap_register().
* Rename parameter rm to r in vpci_ext_capability_hide().
* Change comment to describ the case that hide capability of position
  0x100U.

v4->v5 changes:
* Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
* Rename vpci_ext_capability_mask to vpci_ext_capability_hide.

v3->v4 changes:
* Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header)
  (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
* Modify the commit message.
* Change vpci_ext_capability_mask() to return error instead of using ASSERT.
* Set the capability ID part to be zero when we need to hide the capability of position 0x100U.
* Add check "if ( !offset )" in vpci_ext_capability_mask().

v2->v3 changes:
* Separated from the last version patch "vpci: Hide capability when it fails to initialize".
* Whole implementation changed because last version is wrong.
  This version gets target handler and previous handler from vpci->handlers, then remove the target.
* Note: a case in function vpci_ext_capability_mask() needs to be discussed,
  because it may change the offset of next capability when the offset of target
  capability is 0x100U(the first extended capability), my implementation is just to
  ignore and let hardware to handle the target capability.

v1->v2 changes:
* Removed the "priorities" of initializing capabilities since it isn't used anymore.
* Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
  remove failed capability from list.
* Called vpci_make_msix_hole() in the end of init_msix().

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/vpci.c    | 88 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  5 ++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a91c3d4a1415..8be4b53533a3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -165,6 +165,92 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
     return 0;
 }
 
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, pos, 4); r;
+          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
+                                       : NULL )
+    {
+        uint32_t header = (uint32_t)(uintptr_t)r->private;
+
+        ASSERT(header == (uintptr_t)r->private);
+
+        pos = PCI_EXT_CAP_NEXT(header);
+        if ( pos == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_ext_capability_hide(
+    const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
+    struct vpci_register *r, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( offset < PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    r = vpci_get_register(vpci, offset, 4);
+    if ( !r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)r->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            r->private = (void *)(uintptr_t)0;
+        else
+            /*
+             * The first extended capability (0x100) can not be removed from
+             * the linked list, so instead mask its capability ID to return 0
+             * and force OSes to skip it.
+             */
+            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));
+
+        spin_unlock(&vpci->lock);
+        return 0;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    if ( !prev_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
+    pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
+    prev_r->private = (void *)(uintptr_t)pre_header;
+
+    list_del(&r->node);
+    spin_unlock(&vpci->lock);
+    xfree(r);
+
+    return 0;
+}
+
 static int vpci_init_capabilities(struct pci_dev *pdev)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
@@ -204,6 +290,8 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
             if ( !is_ext )
                 rc = vpci_capability_hide(pdev, cap);
+            else
+                rc = vpci_ext_capability_hide(pdev, cap);
             if ( rc )
             {
                 printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 27b4f44eedf3..3b6963133dbd 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -448,7 +448,10 @@
 /* Extended Capabilities (PCI-X 2.0 and Express) */
 #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
 #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
-#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
+#define PCI_EXT_CAP_NEXT_MASK		0xfff00000U
+/* Bottom two bits of next capability position are reserved. */
+#define PCI_EXT_CAP_NEXT(header) \
+    (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xffcU)
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
-- 
2.34.1


