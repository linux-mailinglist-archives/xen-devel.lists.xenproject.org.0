Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB15415DE7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193893.345486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNW7-0000WE-UX; Thu, 23 Sep 2021 12:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193893.345486; Thu, 23 Sep 2021 12:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNW7-0000Of-NS; Thu, 23 Sep 2021 12:07:55 +0000
Received: by outflank-mailman (input) for mailman id 193893;
 Thu, 23 Sep 2021 12:07:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNUa-0006xV-S6
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6adcd31b-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:36 +0000 (UTC)
Received: from AM5PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:206:14::15) by HE1PR0802MB2315.eurprd08.prod.outlook.com
 (2603:10a6:3:ce::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:34 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::16) by AM5PR0301CA0002.outlook.office365.com
 (2603:10a6:206:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:34 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 12:04:32 +0000
Received: from 3124b1183ca6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E577C1D4-DFD8-4C86-913D-901855A7A0C2.1; 
 Thu, 23 Sep 2021 12:04:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3124b1183ca6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:14 +0000
Received: from AS9PR06CA0113.eurprd06.prod.outlook.com (2603:10a6:20b:465::30)
 by AM6PR08MB4982.eurprd08.prod.outlook.com (2603:10a6:20b:e9::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:13 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::85) by AS9PR06CA0113.outlook.office365.com
 (2603:10a6:20b:465::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:50 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:49 +0000
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
X-Inumbo-ID: 6adcd31b-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFMSX7kfVCjWvqyxLu5Vopy2J4u9k63suSpDv1EU3iI=;
 b=mn8H/P0wlD9W4Jjhm6SuLAFA+LdS15mS+hUtfQigrl9Yts9BL3i7VQeqrW1eWizJFmvif0G3GboqudQGZ8YMUO27lZCcw84IdRkzis+24AEa4MBO8jEevjLdPTsbkYtRw0A940gObTlww3VUs4jnuap5469FyB6y8q6x1rjyQHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc0074091b2e4c39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAvzdiKhJ693OkRMHlVbdKjkCvpQqnRLT6umZKZl4gzY5GPJ4judYzgsEt87afVGs7iPOZFELC1EQgkbcsD/uUSdMZg62DL9fevfwijPi8bzmP6GKx7nTkytANjuo6T8MDbT74TcqKHlq4IQQZTj5lESsSiSXF8ZdiJDysR5X1QwPJvoeofZ+GcGhKNsFuDrbtZtL+ThNl/WibyY1DiCfa9LQ60xz/7na0dgkudxZBiVcWTuiLhcfuwJrh2IDaW1ieqTeZk5TxDvOy2gkPvgixGy5s9Ih1fjWydiiHujuSHJawJgfrJG5dqkqxVfnvHXsV6ZHtFBhMcFyRTVBPXPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZFMSX7kfVCjWvqyxLu5Vopy2J4u9k63suSpDv1EU3iI=;
 b=A3gipSIHHCKy+RvocsRbvcCiAKQ7Z3Fh4jfItJV+Osbx37N8YpzCedezpB8RXsKL2PY/J/CPLlNe2r/y8kF2sMiDXQ9PTDcXjlle2TumoYrkh6kOD5q32EhQ/WqVQqoVFHgH8P+HKP14kuFer+Pm8hiCHphmfNsp1IAU5lOsGhA2wJ2hkm3ljCy2o8JWAdD7K5YBNQ6shrpd2KcZmgjuc21PNvauvM7qP/GK28wLkvU2qsYhF7C5zbS1f1fNnFFrfW2rkn6z4Jx4YlIMyrUaflWtVTYpice/s9P27umo5KEo/qX9ZEGWrXLwbGDPd1PNiqcri7P6qPRhcoSMLBY96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFMSX7kfVCjWvqyxLu5Vopy2J4u9k63suSpDv1EU3iI=;
 b=mn8H/P0wlD9W4Jjhm6SuLAFA+LdS15mS+hUtfQigrl9Yts9BL3i7VQeqrW1eWizJFmvif0G3GboqudQGZ8YMUO27lZCcw84IdRkzis+24AEa4MBO8jEevjLdPTsbkYtRw0A940gObTlww3VUs4jnuap5469FyB6y8q6x1rjyQHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 19/37] xen/x86: promote VIRTUAL_BUG_ON to ASSERT in
Date: Thu, 23 Sep 2021 20:02:18 +0800
Message-ID: <20210923120236.3692135-20-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8764a4c3-746d-4754-faaa-08d97e8a4e6a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4982:|HE1PR0802MB2315:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB23150F08B3FCFB201DDBA2139EA39@HE1PR0802MB2315.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n8uxqib7f3ru9cUC2VMn0teeR+5V9e0wem/w0c57WFvwf1l/SyZJRIW0Dg/7zm53LaR/pcIZsn2Tnaff0C0cJ47u9d4MdTwPjH7H+nLY1LJ8r9gE0aZHouhvOMHJOEwSBFqXt7WjB++sdUPDhzS03liZ4V5XcrHVCLIO/1IAqmOxam1bTK6raMBcNTLQbtj6ocCi2aXfuFxdDWD6YFdhPMpY7Kt9K+dZNlpo1vGTYeLKtBVs6+d/2x8I3hLL4RGQWi4Hj4Nb6NPN11FnY6nxxD/ubQFNpDTHU6KWrqkSJXt+LHBnNtGs3Fuy7c0HhTrRIPKn9VimDTzNv/HsAjtZK+m1T3arofcjAuyjjDYLBWF06y0q160cCttwzNrWlX7/mptMwt75GcvdPlphDEq5x9XRcdr8qzLSifyRwd2T+bLBVYmY0mXcqe8bJ1x8MoWAkhg520TSVc0UjU15L53GY89g6aC8qxVFS1mhomC7T26tWEBLrpmglW/uqh948cseTv/scQso89ujPeLQPDwDGgfxZsv47Jj08kYwNIh3YqLt4IzImTJOGLSmA44yzSmMweQHRBh4vDV/CPt/NjQbLEkdrNp2FTZMQ5q+sn76gvjkoRIreYp/NTVvLy4Yyn6/w0hpDyvGUveBVJJM14euZulpflNu4X8pdVZxVlQvI4j+KjhokNSmIE0Mmm6aNvDnuJqofZKXfmOWZ0Kjky5h3QbYIPAJNftcBaZNb6fJ9CU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(1076003)(7696005)(426003)(86362001)(186003)(508600001)(36756003)(36860700001)(336012)(2616005)(47076005)(83380400001)(4326008)(82310400003)(70206006)(110136005)(70586007)(6666004)(2906002)(8936002)(81166007)(356005)(5660300002)(316002)(8676002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4982
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95e6c592-b26b-4360-cead-08d97e8a4241
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6S0QU/gT8VHvkWiuYcfU76N1/0d2aYlyMVvOKqFKbPdwQBE6TpzSTYBTtklh1EIm19zFU4x5pjuC1m2rMTCxkjC8ZKL/bkdCaVkBKnAm7KF2+gBBqhg6VyfYCMxY0ncBjGrvWjbT21Y4A8gqsie/+dGsmybFAgmTy0Wc6aABgwOJhzwUdNYbn/cE6eyJBPILtuq/1I4zvLrWUO0DFqhovwyV8xoUdhTUor/0G2SoW3aSt/vKwK38WvCVZJfFx8kfspTv+68oGbt1Q7ROaggcg+R3PklA3+YrM3N1tCrleHHf8kJGF1+hTsfHhQrGC/xYt1lQB8y9yaRids/S/fX1Yq4xuBlVj2DoCnPxvSa/ukXVsHDW+paMWDav7wedjCNJHrie5Ta7TR7FoLxtV9XHUFqYxEvcNU2dh2pwgbwhgip9xFlfyNnfQqCm+cBBNuEYbc3tc6daBs6HVzUoem6M37mzY+TEeexY+rnOe+p9PfoS05EqOiZ5LD+7E2Y8yC8M/PIZqkbX0s9+z6oHCyh46jRKfSp6Bf5WWgMsOmWtkjs366KeSBPUo2I+5Onb46grMqaeeyvsZl9jiGabLVrj8tYuJ1oFqePhfzExHKWmOaBzMk6eD1j0CBrKxz2/NQ0K7I96wlVnPVfaWRqeYFGULIyLYohUzlHRHYdU9e0D/vp3uv4IQ4iRHXxgrS02tvwK9kpTE0Cxr++OBN0eamgpjA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(36756003)(7696005)(26005)(8676002)(6666004)(82310400003)(4326008)(44832011)(336012)(426003)(83380400001)(2906002)(86362001)(508600001)(81166007)(1076003)(70586007)(5660300002)(36860700001)(2616005)(8936002)(316002)(70206006)(47076005)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:33.5327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8764a4c3-746d-4754-faaa-08d97e8a4e6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2315

VIRTUAL_BUG_ON that is using in phys_to_nid is an empty macro. This
results in two lines of error-checking code in phys_to_nid are not
actually working. It also covers up two compilation errors:
1. error: ‘MAX_NUMNODES’ undeclared (first use in this function).
   This is because MAX_NUMNODES is defined in xen/numa.h.
   But asm/numa.h is a dependent file of xen/numa.h, we can't
   include xen/numa.h in asm/numa.h. This error has been fixed
   after we move phys_to_nid to xen/numa.h.
2. error: wrong type argument to unary exclamation mark.
   This is becuase, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT in VIRTUAL_BUG_ON to enable the two
lines of error-checking code. And fix the the left compilation errors
by replacing !node_data[nid] to !node_data[nid].node_spanned_pages.

Because when node_spanned_pages is 0, this node has no memory.
numa_scan_node will print warning message for such kind of nodes:
"Firmware Bug or mis-configured hardware?". Even Xen allows to online
such kind of nodes. I still think it's impossible for phys_to_nid to
return a no memory node for a physical address.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/xen/numa.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 51391a2440..1978e2be1b 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -38,7 +38,7 @@ struct node {
 extern int compute_hash_shift(struct node *nodes, int numnodes,
 			      nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
+#define VIRTUAL_BUG_ON(x) ASSERT(!(x))
 
 extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
@@ -75,7 +75,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 	nodeid_t nid;
 	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
 	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid].node_spanned_pages);
 	return nid;
 }
 
-- 
2.25.1


