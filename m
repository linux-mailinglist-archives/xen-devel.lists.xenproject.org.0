Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF116E2B1B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 22:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521244.809697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnQ3L-0005XL-GU; Fri, 14 Apr 2023 20:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521244.809697; Fri, 14 Apr 2023 20:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnQ3L-0005VA-DW; Fri, 14 Apr 2023 20:29:51 +0000
Received: by outflank-mailman (input) for mailman id 521244;
 Fri, 14 Apr 2023 20:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWbr=AF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pnQ3J-0005V4-DI
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 20:29:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17de211a-db03-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 22:29:46 +0200 (CEST)
Received: from DM6PR07CA0116.namprd07.prod.outlook.com (2603:10b6:5:330::13)
 by BY5PR12MB4872.namprd12.prod.outlook.com (2603:10b6:a03:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 20:29:42 +0000
Received: from DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::5f) by DM6PR07CA0116.outlook.office365.com
 (2603:10b6:5:330::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 20:29:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT076.mail.protection.outlook.com (10.13.173.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.36 via Frontend Transport; Fri, 14 Apr 2023 20:29:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 15:29:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:29:40 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 14 Apr 2023 15:29:39 -0500
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
X-Inumbo-ID: 17de211a-db03-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXhrPKkMhMSjz5keQA/NtMClm2k2hhg1wfPIwEO1NR+jZoYaCvG7G31xOB75KTGCrasNtXdSvSHQu1yYCmthwSmlNITtf40zgF+9CczKQx/Ujb6WZCLrMOkXz2hSpki3MgUR2kUqQ8iH4JxvVJqyG9FrdhSdK5X9MJhzlXuZrDUzaRQsbxRzV9L+ZRKZVQXHycvLiELKlb/3ZPGuKaij9H7weeycZyWHIdQFSgRnN2OPok48aKuZqEI01bqXurLNpImW6lggACG5jYOzfon9ivaIQL0dEgze08TvFFPxWnwoRnJbturdTuJbKWVfnvBngGDAvaifKoTE22mFDatDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0EKJQP7OWmfg5VAzpren4WzVtEYFxSHbvtw0gR2VGo=;
 b=HsHMi9KuqLZdofWyOgOBaNJ4IrtavDQOf2vnIXeYzOiz+xwVf6dD2gU7m69LSXp0AGw7vJZYiR5MC61UkTLfYMBnQWggv9rIRVrGUId6WKEwN4HCkg3nP/iusRj+6oAyFE5BVJyybnH+Al4rPWyXKrHSbma9GSjf152573rDBKMypdZheeuNdwhwVtNqaoCtV7NGY6lbBdkhaDoDsyMbbQi4xFVp7OZhJPkdOE5ThbkYqi9hYUToQ+wVcpHYy0F8mmMtGDd5NaBAgW+yl3rZk8opY5278tncFotNDqaJcma6Wv+ls2/nP9og0dCVu9/npCbwW/mdZgfHVO9tuSKOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0EKJQP7OWmfg5VAzpren4WzVtEYFxSHbvtw0gR2VGo=;
 b=01WKDi/kq5QAueNfmo2zGUNTAh2jl0ldPYlzH8TLj++pmg7k7mKZZBZnngM6uN3YegI9mVmcLZQMMzUNZH63hK3nS+FiHgDZpGgZi2FW85aA+Ou5BTURsKAKp++m6/GeGw97S2w3Gms8uJs7+8KrG+bBqjGdJXshE86vcz2x3yg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/vpci: initialize msix->next
Date: Fri, 14 Apr 2023 16:29:32 -0400
Message-ID: <20230414202932.293688-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT076:EE_|BY5PR12MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: d09ac933-e66a-406b-242e-08db3d26fa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dLpsv8G6C/YO8AhtPchbkjVjJgKWwIzYFhnbxg1FoPXFDpHqhDgkMJVifFlGPT7lZC71BQgkiMOr2oGihiH0uFlRUSPWLj7aBBEF/DqBAo0lA9+R/gScBY2YABbj6jMgpQvS95wfm7jM1hF6CSHRb6PuQbJWZncrvqDtQJeJ8f/SsIDox5FNIZy377Rxd866315KscGkyH1dHCmaeUw6SU6K7oewAk5ze6Zw47BECCcmYrE//uH5y8aWS40Vp2u2ETqZtOojC7CjcYEFFVoqVbI2xwT9O8pgjghFKlBMfpjdGWptN9lmuQqHS6j5Cr9brmHQwzxp+kppU1QzltAm4vXyGxXJZ3WuxHejcBEQLarfnnwuA6xwQa7hDt0eE1cKApHDQZAvs+mNGOgjP0ZG9Y8TFozb25TM9cC76dkOqWFoFP5rf0QQ5zO4zz+FjMaskShUYhacxjtUPNAKCNR4izD/aOyxBOTJb2E02/0SZaigd6CF8e32qVQK6nz2WNutZIRrsNthBwedWMn9yIuWtVP9iKjLz4BJ5hd8vPUEf/LbKP0wYwf/rngak22SN+h84BGLy7Ol/F5nCfqge7OIrTWBju2t+mIbwkBIDfZ/gQ/gB2Fr6elQui+4yd0s07U/QdjJCDS3Y60wb8rY9xI6sIoxsWDM7Y4GqWBV0JlO46Jg2gyLXgrdted+f0roWW87tznLJSRj+UeVZ3iZNPgEgdJARv9yAEWHKO2idE9Ew10=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(186003)(1076003)(6666004)(2906002)(4744005)(26005)(41300700001)(2616005)(426003)(336012)(82310400005)(40460700003)(478600001)(36756003)(47076005)(54906003)(4326008)(6916009)(70586007)(70206006)(356005)(86362001)(44832011)(5660300002)(316002)(81166007)(8676002)(40480700001)(82740400003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 20:29:42.0433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d09ac933-e66a-406b-242e-08db3d26fa56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872

The list was not being initialized, which could result in a crash in
vpci_remove_device if no list items were added.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/msix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586a4..1b98c3c10a64 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -678,6 +678,8 @@ static int cf_check init_msix(struct pci_dev *pdev)
     if ( !msix )
         return -ENOMEM;
 
+    INIT_LIST_HEAD(&msix->next);
+
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
                            msix_control_reg(msix_offset), 2, msix);
     if ( rc )
-- 
2.40.0


