Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504D459012
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228897.396128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpA99-0002aM-DE; Mon, 22 Nov 2021 14:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228897.396128; Mon, 22 Nov 2021 14:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpA99-0002Ya-9y; Mon, 22 Nov 2021 14:18:15 +0000
Received: by outflank-mailman (input) for mailman id 228897;
 Mon, 22 Nov 2021 14:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq3Z=QJ=dornerworks.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1mpA97-0002YT-GF
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:18:13 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0608.outbound.protection.office365.us
 [2001:489a:2202:d::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 032bc74d-4b9f-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:18:10 +0100 (CET)
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::16)
 by BN3P110MB0324.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.17; Mon, 22 Nov
 2021 14:18:04 +0000
Received: from BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ac43:aa11:ae5e:da54]) by BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ac43:aa11:ae5e:da54%6]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 14:18:04 +0000
Received: from ubuntu.localdomain (199.249.2.50) by
 PH2P110CA0004.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:127::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 14:18:01 +0000
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
X-Inumbo-ID: 032bc74d-4b9f-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Tff+k1E8Qzt12yzg+o5Ty+QQPxwcXf5aBje8giDUwZZ5fY6YQd4SvRglkBlr3AJEFGipTpoJSqRcbn6h8U6R952za+ltSd0cC2TlIQoE88oz23HdosYROMJJ0hFAue+VdF4/BxDK4406FG/O65GI1xlJ18YHJryE20635h5S83ow69IulMXUOdXrxYnkfVI4LImeWzdOEERJTlRaeVF91MyA+4LlD6GuLLlQYEF/E8S9yTMR3Un2CajreJg6zo7GFMHNfu/OUim1pIQzlvDJ9fVRbiXC1UB14C1dA50aA+ai0s5XoSpvagEHu7txpfa/O7qJCC2Uo7Pwmx9bsB22Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+wwxSaM/p67+xzHXK1NFB4qBtEeoJZo0Pj3cb0rZgI=;
 b=TSDDeAZRSA2qGh7/XPaIBd95cdqVbhjuNuzMKdOdGqVNYLu/QhJGo0xMAHYwK+oFBJXTGsklsXxPCvlcSXy/nkLT6t+DZM6kI/8hlmtJKjkNvs+ZzwWCCqfSRlwHIF+/OTUcAWt/IONmBq1CR4Ih8aYQaZmsTHjs2nnhMcQRbvl2WFWww4VPsXcmaN05tmNJ+VhFhFZRXb289FEtewdnC1GwM78LNeKPbbNWIeT1beN6Qp4HJHl3hmp8n0+9QeGfVSXJGbPl4M3BwfuWzsk0MeD30I0qp7RVzDW3D7cOp9alOwLUZCR3pnAq21chBfqBgDVcT+5LeZWroI9xKKS9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+wwxSaM/p67+xzHXK1NFB4qBtEeoJZo0Pj3cb0rZgI=;
 b=fSA3uriLV4u6lc0GqlBTamCJaSS3blVStr8Omep07RAFy9TseCWa/jAOkmffmWY0w2SNrIFitqSaqVrL+ufl1vE1na65R/nV4KPXRebqf0BYe/TYH8EfovauN2xOB2VHTyV/pm9BpBFf/K0YEpe+I9tatmWsCSIMLVvzr+gZvKKkHV1Wm/ekPOEZX2bY7Yd+gH6r85fibp0qhhXyHSsfp2SvVApPYvS+GEeWO/pdB+rCaGFh1ZARE3U9E4cWNtkjDYbapB1m0/YV56zZ6HlgDNzdFp2NxrEr6fELEB/wKp6R+L0F86rJoFksuXn/VvExJ+R35yb/PXjb3ZMry3X/1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: xen-devel@lists.xenproject.org
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Date: Mon, 22 Nov 2021 09:17:42 -0500
Message-Id: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.34.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH2P110CA0004.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:127::17) To BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:40b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39db825f-7ef6-4967-fb0f-08d9adc2e5a0
X-MS-TrafficTypeDiagnostic: BN3P110MB0324:
X-Microsoft-Antispam-PRVS:
	<BN3P110MB032464E5A87864B6577F44DA8C9F9@BN3P110MB0324.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJ6By+yHnsm6fukni5uio5gWQzcBSNgMBEmMmucqYJiod1Zh/5qR/NknagDzZitbmYJq2c6B47NNbcufamYs71m+qexiC3Cjf1xJU1kFaQN40DjiJ4CXGNdlxMoRc/we2h2YdEU1J/qxCTKpraPVOpiEebhwdfvoVn3buaTJBC9SMxf1QqfBxAsAMdkJSxp1OlFC8t4X13bnAkhpb+7zE4CxDnSkvW+zfq4gO9/+lKeMhLiAxzmBD2i1d07AuFJiqgj9jm01u9msTItLsjxY6kv4QZZ5yuiyvkwIAabWrrKD8CG988SBvpNsrZBhDAmckAKKlAq6Igkx7IwPDcTzhO4qcu4q+raVSIMwRTgDBmcQrHQ1x9q3LcjNMwmXzYCVI7A2DI7pFoSs6f8FBeHygSTN+W5PxI8oJhc49yENhWYyzdUK/TP7iFaH6eVi+Lj7hNEuYyRxWIVGTasBXhTX/mOPJffRR5O33ggc5RRrnzd/CHPMraTI7qGd9glSR0LjFci+pwc66ovOFNz1TWaVfCUCsk6lRZ+0bik9c7uohhPVRTZYMHH/CPc52uOyMS8NjiBbGNdq++fvxEWc7i1BhsW6IWj4EBMhz2pqZTGLlhLHCLd0Tb5W9mhgiXko2gp9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39830400003)(396003)(136003)(376002)(4744005)(66946007)(2616005)(508600001)(956004)(66476007)(36756003)(5660300002)(6486002)(6916009)(316002)(66556008)(1076003)(54906003)(86362001)(52116002)(6512007)(38100700002)(83380400001)(38350700002)(8936002)(6666004)(186003)(2906002)(44832011)(26005)(6506007)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BXKV0KyLI5weT6JMiR+4C2B4RWagfw4VVYJYR03z872gOl+lvPSXg5T14UK53+P6wWZyTSNp3YJlV67gUSp6TZ6lr3FAOIJIiTxpF44aLgO9HmxL5G3AwrCi/gfrpnmv4pBAsnG5hr46dEfZP69bv1VjX5MuCtmfLSDuBzidlst9SGRUZWeBqk7DgYFZiqpdT0uX6e/wxoeaW/E5UpeJjWr+JfI9sirzSK73Yln78YO/B0aLKxFcgmOvwk9NPhYTQuK5/FX97JuoKHDQFIkBQ2WnBla1RJBuFlCOHJkBYyZnx6IphMWq1vF95eKGNP7QBCJxseOEWcztN/Vtif+kaGK1LHaoi89S+eC/g5lEJJX8TgmaFthsvsnk5hBYPkYPUS5iEX0DJURuQKKdLEd57FnatNsg1gsBb2aki87PevM78AyEms0hGQePtfpYI9GaWve2Z8EyULvFM7f7EEj2GaaZSWxBub/1JjCZWPN3VTknGk9aX4E2U7TolRvemNEQuJTn4J0dM2ixOw5ZdGTPmupornh3yYwvmWayfT+VhJLmhkrRWBELwK6fI/x7huV0B4iCrlSsqI8CSWNchxnKPzrTBteQ5rrBSVdIdpefCBDxpJtSbNr7KP+/0LWvIPB0qB8a5uYd6oF/LExFv3WhW9KyYOBeOm/wvBTsY3E0fA1jyUtj3FcObCYZx/UMk5iopiHO+NbrMt+jBU3CFn329w==
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db825f-7ef6-4967-fb0f-08d9adc2e5a0
X-MS-Exchange-CrossTenant-AuthSource: BN3P110MB0484.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:18:04.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0324

Josh works at another company now

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4956db1011..fc8b2c1169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -221,7 +221,6 @@ F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
 
 ARINC653 SCHEDULER
-M:	Josh Whitehead <josh.whitehead@dornerworks.com>
 M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
 S:	Supported
 L:	xen-devel@dornerworks.com
-- 
2.34.0


