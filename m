Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DE4D5B65
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288717.489742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWD-0002NQ-UI; Fri, 11 Mar 2022 06:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288717.489742; Fri, 11 Mar 2022 06:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWD-0002Kl-KX; Fri, 11 Mar 2022 06:12:53 +0000
Received: by outflank-mailman (input) for mailman id 288717;
 Fri, 11 Mar 2022 06:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWB-0000Fh-3y
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ea25c8-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:50 +0100 (CET)
Received: from AM6PR10CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::21)
 by DB6PR0801MB1960.eurprd08.prod.outlook.com (2603:10a6:4:76::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Fri, 11 Mar
 2022 06:12:42 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::a4) by AM6PR10CA0008.outlook.office365.com
 (2603:10a6:209:89::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:41 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Fri, 11 Mar 2022 06:12:41 +0000
Received: from ffade54445f8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1368B86B-9193-41CD-8161-E823D5739779.1; 
 Fri, 11 Mar 2022 06:12:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffade54445f8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:34 +0000
Received: from AM6PR10CA0089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::30)
 by DB8PR08MB5401.eurprd08.prod.outlook.com (2603:10a6:10:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 06:12:32 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::d2) by AM6PR10CA0089.outlook.office365.com
 (2603:10a6:209:8c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.24 via Frontend Transport; Fri, 11 Mar 2022 06:12:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:29 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:27 +0000
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
X-Inumbo-ID: 46ea25c8-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umdxaC9M1LCNOYH4ZpD5ACrl2y60yzal5ReM8dSmiFw=;
 b=v1V6XNf72S4ItEfdsoAAHY49IK1Fuvm/OQIHJUjVWD1kviXgF8xHrxDV2aUzmBDZMB8HZ3R3ukUhKFSPmQCH8ew1vzGiVWyiAMEo2Hrb2krnTN37wWnoZ5SIKURokGfkK9pCoM+hL4gOM1muyNjFKdWUfTQlFQTRfYFi9uHBuQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a46b8f13a50568b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTzOncaUWmi+9/BwTptUX8m9Z5SjS4Ni5WKs/96YjHCwQh/r63kAEbtW2s40+3QbmIeKSWB1eb0Y75MjK7bwBHWfAEfFwKUvurMHHk3eFN3YxFd8lhYsh41xKxuhrOK2PKpdhZF62/c22ijG7l+FSvXfOISps5uOvcf4oz5AETnmpyLlTqqkckdcwsvk962GY1cWfNudm1RLOnU1t5TA5YByI3eOWcatQhwvijLVojQXR0r2NmVWJ53XMzLBwJnNfVwbxFoRjjyY/pnGdH3oKgXPjydN2mWVJh9CIkRE17e9B1hmtos7YJ+ap5S8cfZiCZcHZLf2Qi9QSCsFgCdfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umdxaC9M1LCNOYH4ZpD5ACrl2y60yzal5ReM8dSmiFw=;
 b=R7Ci329X43kgDR0HmX/5yjIkk7jFayhIQYVd7SqdjarX9yuKKZ5sqqI7rQM81ac7IdrQuqKvtAxk75k9Q9W8+GzrZ6Xd1qHy3ApzQhy0TzELqazUhQy5/exNmkznU3iFjsNHiGRENZDmpTzI+YEIOfbcgSgoWMopD93/hrQpt/bDgg3ItStFL/kr6fXOxu6KLwCybXIdMwqAe7VtoAIpqaNX/9Q+H+wi21y5VTfuiJgBYFK2HCXo/HHjjyeexcrkkHKT57H+CxckDtZXXssBJXJ412taxfoUKjGDt+YYORHYUjmInup78tLLHyXq6i2CnY47exnAoCFG1pDY+UDf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umdxaC9M1LCNOYH4ZpD5ACrl2y60yzal5ReM8dSmiFw=;
 b=v1V6XNf72S4ItEfdsoAAHY49IK1Fuvm/OQIHJUjVWD1kviXgF8xHrxDV2aUzmBDZMB8HZ3R3ukUhKFSPmQCH8ew1vzGiVWyiAMEo2Hrb2krnTN37wWnoZ5SIKURokGfkK9pCoM+hL4gOM1muyNjFKdWUfTQlFQTRfYFi9uHBuQg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 07/13] xen/arm: create shared memory nodes in guest device tree
Date: Fri, 11 Mar 2022 14:11:17 +0800
Message-ID: <20220311061123.1883189-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fca68a2e-c460-4a49-24d4-08da03262698
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB5401:EE_|AM5EUR03FT031:EE_|DB6PR0801MB1960:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB19604698C9475C8A3B4F5FA3F70C9@DB6PR0801MB1960.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NqVCI8Py2Tl/YEmEjbM6954+uln1tCMjbDp/6ADeJisYK8oJ7EcoiGKkeGSRfoO4/iFPhUWiaaj8z4mF4zFfbvXodW6SeVVRtZQR9zRkktFnQIbXz4pGK48vV8+rCpiWPGy7O10gFCm9LQczN6iVQzrN4Bk+KB4s8HbhC0ZCI4vCwCozyt8NejT9tLw9Fh24xCLswXjI0IBEU5fXX6Hiv8sG/O9/nTBAQeJ1nRWSJ5vHZQCGEngOpl9HWIt+6/NCxoIH0igMIfMjmuSi81ImD+qXV60dFlJUxwIipy8e27cORcB9Jhkq+wRYxEK/YeC2xSZ0LcilA0uMHQ+GIjEyU5Rvh9MIe0LbZ07sFuAhgCVrT3BsJ9KX/In9nyjXK6Qn0kY3LguED2WzU78oHnBB0lYgIczJr/MAldTzMGv0O55rkWw74TdfTQU6JUtm4JKXaUj3Lz1aMJUN/YyT6VjPmffqc16OvD6NEQT+W+5w/6NZkWO0mlHa/oV1iuSpFKCWlA47cwUxu1P7RTAcwzkD9ie6Mz16PIsqvLb80+tv3WQ8iY2n4a7fBpMdi1P6Sj7vYgbK+UsNlg93h8J0POouRdXEvZKEI2K3jn7qNsZYzoD9Ikk9PfHqIORFSDXaJWXKYHZul/IKCJXgsIlfKRezfAl+wcKSbP/YXHmgreIcBe/+njXQlB41KDkWhTtpp+I3gEnzdyW/8nTYDie1+/s8SA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(1076003)(7696005)(26005)(186003)(8676002)(5660300002)(6666004)(54906003)(70206006)(70586007)(316002)(36756003)(36860700001)(47076005)(82310400004)(508600001)(6916009)(2906002)(4326008)(336012)(426003)(8936002)(2616005)(86362001)(40460700003)(356005)(83380400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5401
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6bf2f15-1bfd-4e8a-a11d-08da03262088
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ea9hoodo56SHdeurQPQ31QV+IXccKAk9oHlcgXovKQNk9IVTybhuyolc7R2J4qbbCzluUu/o+vIS6k6l5UVfkCfozaRGDqMnMqMHiwt/re8NvUkGiTX+mZQ02UhaqYwQB58Kvcb3m9t7ohgNbjzXAS41MaACangvCzEqUU2fWmdVLSs72NGe+LvJ8s1EnFngn6Nzju4KrdVkA+heJGPv6w86FZs/Iv7rNgEwg7a7Ds93Gz+nMq3LF5alyCPX3Obf7//qUzPJDd0M90juyXt/XceZFegadwgdGnmF/3NdnWIlNFyxDg8oyzkajdUP/VB2byMe54wvD2EyFIgTYuZe40ju8TCN8ZOLXoTYyV5JZwfb0Dl95WwVN2xymaVCw+ktj08jllPPI5dmJqr6BCKvWKUti7RvCvNiqszBZk6s0uNBxLMyjQ5bX+uqnRfIql4PE42dOVG99huceBEXKpwHXRYPdVPef4mRzkk4RNlFwFez9pZYSdBWAPkdW9J+cAvpGQXA9+9sPJUgs6Yj5v3vvkbPo0GQYFtJaxormS2UJC99EsnRzFaDib5GJIJW86LhS2P571tG7sdkkcB0IcTrUw6A95em7PVGeIyi5pKmOd+zVDDCAzXfpzgXtMbfPGJpOSD7ZdIhE7ZSea5SwMa7j6EupK/LBhMKnorv51dABH3tQ61Ns7dX7cmlZfjalzvW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(6666004)(40460700003)(47076005)(8936002)(36860700001)(336012)(508600001)(4326008)(2906002)(81166007)(8676002)(7696005)(1076003)(82310400004)(83380400001)(36756003)(186003)(426003)(26005)(6916009)(2616005)(316002)(107886003)(70586007)(70206006)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:41.6710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fca68a2e-c460-4a49-24d4-08da03262698
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1960

From: Penny Zheng <penny.zheng@arm.com>

We expose the shared memory to the domU using the "xen,shared-memory-v1"
reserved-memory binding. See
Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
in Linux for the corresponding device tree binding.

To save the cost of re-parsing shared memory device tree configuration when
creating shared memory nodes in guest device tree, this commit adds new field
"shm_mem" to store shm-info per domain.

For each shared memory region, a range is exposed under
the /reserved-memory node as a child node. Each range sub-node is
named xen-shmem@<address> and has the following properties:
- compatible:
        compatible = "xen,shared-memory-v1"
- reg:
        the base guest physical address and size of the shared memory region
- xen,id:
        a string that identifies the shared memory region.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c       | 144 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |   1 +
 xen/arch/arm/include/asm/setup.h  |   3 +
 3 files changed, 148 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8cee5ffbd1..997df46ddd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -840,6 +840,28 @@ static int __init guest_physmap_add_shm(struct domain *od, struct domain *bd,
     return ret;
 }
 
+static int __init append_shm_bank_to_domain(struct domain *d,
+                                            paddr_t start, paddr_t size,
+                                            u32 shm_id)
+{
+    /* Allocate memory at first insertion. */
+    if ( d->arch.shm_mem == NULL )
+    {
+        d->arch.shm_mem = xmalloc_bytes(sizeof(struct meminfo));
+        if ( d->arch.shm_mem == NULL )
+            return -ENOMEM;
+
+        memset(d->arch.shm_mem, 0, sizeof(struct meminfo));
+    }
+
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].start = start;
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].size = size;
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].shm_id = shm_id;
+    d->arch.shm_mem->nr_banks++;
+
+    return 0;
+}
+
 static int __init process_shm(struct domain *d,
                               const struct dt_device_node *node)
 {
@@ -907,6 +929,14 @@ static int __init process_shm(struct domain *d,
                                     PFN_DOWN(gbase), PFN_DOWN(psize));
         if ( ret )
             return ret;
+
+        /*
+         * Record static shared memory region info for later setting
+         * up shm-node in guest device tree.
+         */
+        ret = append_shm_bank_to_domain(d, gbase, psize, shm_id);
+        if ( ret )
+            return ret;
     }
 
     return 0;
@@ -1237,6 +1267,115 @@ static int __init make_memory_node(const struct domain *d,
     return res;
 }
 
+#ifdef CONFIG_STATIC_SHM
+static int __init make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       struct meminfo *mem)
+{
+    unsigned long i = 0;
+    int res = 0;
+    int reg_size = addrcells + sizecells;
+
+    if ( mem->nr_banks == 0 )
+        return -ENOENT;
+
+    /*
+     * For each shared memory region, a range is exposed under
+     * the /reserved-memory node as a child node. Each range sub-node is
+     * named xen-shmem@<address>.
+     */
+    dt_dprintk("Create xen-shmem node\n");
+
+    for ( ; i < mem->nr_banks; i++ )
+    {
+        u64 start = mem->bank[i].start;
+        u64 size = mem->bank[i].size;
+        u32 shm_id = mem->bank[i].shm_id;
+        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
+        char buf[27];
+        const char compat[] = "xen,shared-memory-v1";
+        __be32 *reg, *cells;
+       unsigned int len;
+
+        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
+        if ( res )
+            return res;
+
+       len = reg_size * sizeof(__be32);
+        reg = xmalloc_bytes(len);
+        if ( reg == NULL )
+            return -ENOMEM;
+        cells = reg;
+
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+
+        res = fdt_property(fdt, "reg", reg, len);
+        xfree(reg);
+        if (res)
+            return res;
+
+        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+
+        res = fdt_property_cell(fdt, "xen,id", shm_id);
+        if (res)
+            return res;
+
+        res = fdt_end_node(fdt);
+        if (res)
+            return res;
+    }
+
+    return res;
+}
+#else
+static int __init make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       struct meminfo *mem)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
+
+static int __init make_resv_memory_node(const struct domain *d,
+                                        void *fdt,
+                                        int addrcells, int sizecells,
+                                        struct meminfo *mem)
+{
+    int res = 0;
+    /* Placeholder for reserved-memory\0 */
+    char resvbuf[16] = "reserved-mem";
+
+    if ( mem == NULL )
+        /* No shared memory provided. */
+        return 0;
+
+    dt_dprintk("Create reserved-memory node\n");
+
+    res = fdt_begin_node(fdt, resvbuf);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "ranges", NULL, 0);
+    if ( res )
+        return res;
+
+    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
 {
     struct meminfo *ext_regions = data;
@@ -2974,6 +3113,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                d->arch.shm_mem);
+    if ( ret )
+        goto err;
+
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ea7a7219a3..6df37d2c46 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -110,6 +110,7 @@ struct arch_domain
 #endif
 
     bool directmap;
+    struct meminfo *shm_mem;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 7a1e1d6798..b6ff04889c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -27,6 +27,9 @@ struct membank {
     paddr_t start;
     paddr_t size;
     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
+#ifdef CONFIG_STATIC_SHM
+    u32 shm_id ;     /* ID identifier of a static shared memory bank. */
+#endif
 };
 
 struct meminfo {
-- 
2.25.1


