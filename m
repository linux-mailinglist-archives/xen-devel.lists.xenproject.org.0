Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296D1F673F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLnC-0000L8-GU; Thu, 11 Jun 2020 11:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjLnB-0000L2-M3
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:54:45 +0000
X-Inumbo-ID: 574b3416-abda-11ea-b509-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 574b3416-abda-11ea-b509-12813bfff9fa;
 Thu, 11 Jun 2020 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ2ChDTNRET6s9KJ+UND5sMicc5rHbMBhQiA5d/sSak=;
 b=4DRD2HNnIvku7agDZuF/A1VzStnirN5IxuHR6OUa9i08MdBZHTh2X/3fTzpOexhDHDTc0dze5X4p1SC9tEl/y4FazrREKUO8a8mPz4XbUoZ8VAGr3L1s0df8rwbNpMrQAUIXLWFq0XhCEUF+UmtdzLKI/0/cen8uBnzpnduEOAk=
Received: from AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36)
 by DB6PR0802MB2215.eurprd08.prod.outlook.com (2603:10a6:4:86::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 11:54:43 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::5a) by AM6P194CA0095.outlook.office365.com
 (2603:10a6:209:8f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 11:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 11:54:42 +0000
Received: ("Tessian outbound 56dbe829191e:v59");
 Thu, 11 Jun 2020 11:54:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1c8ba8c26184782
X-CR-MTA-TID: 64aa7808
Received: from 948674cc2d29.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 812D42BC-0F96-44E7-8A5F-4BA69DBA2F56.1; 
 Thu, 11 Jun 2020 11:54:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 948674cc2d29.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 11:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQMYAGiyMHhW8SK1wBZYxHqt5qsvcZftngtz7doD3GWJubVXbqr3pqK198VfzeU8lY52MTC011rlqDu/LKDIzNhsZHU2jTL23gu+T+zVWMnycPZ4FuDHz34nIbzGaZ4F68HkTNek4d3OlUKSDHk0qAyo/oUZ17zPCz45HTvYZPFv7NFzAgyFmU9jXuC7SXpW3FUT3vAdow2HDZ2j/b91zbwO+b0+Sibr+AzaJXP0B6UfkscMnBkjOLZVONCjDU2qQF/ZXQ3HfAP6C3d1H+To8v31lSuYaY1idBuKqUO3qc/SJKUz93s6VVk2lbf8ovV06n8t9o7Iu5Bdghv1aYHzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ2ChDTNRET6s9KJ+UND5sMicc5rHbMBhQiA5d/sSak=;
 b=dWDT/rIkSaC4YAuGezi8qy2hFMF0I2TbSrI0NxCM0jGr1M2PDvZ+hUxn+kOzLHukQzj0OJ291VWk7KdU1SLi0Bz+BaBErNbL+/UIhdTS/N8CRDxlFEHpj/dAF2qg+3Kater/mDXAaH1G7DCxW4M03PN14CKL4LmIcmo3P/MgoXTo4K/CmKhQT4NsK3rHwq+PY68T2OblB8Ya5Zsv5NhnnIKZBfRnP91TanngOkkY5V5rmJehI3keHTqpLjDyf82L2z+ApTtaJknvJM6eUUyqjdHsWfGbm102Kf1G8HRlzkZt1/OxwDrJD5V9PQwCrV0H7o83UC4eTWmA6YHu+Nxl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ2ChDTNRET6s9KJ+UND5sMicc5rHbMBhQiA5d/sSak=;
 b=4DRD2HNnIvku7agDZuF/A1VzStnirN5IxuHR6OUa9i08MdBZHTh2X/3fTzpOexhDHDTc0dze5X4p1SC9tEl/y4FazrREKUO8a8mPz4XbUoZ8VAGr3L1s0df8rwbNpMrQAUIXLWFq0XhCEUF+UmtdzLKI/0/cen8uBnzpnduEOAk=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7SPR01MB5.eurprd08.prod.outlook.com (2603:10a6:5:12::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21; Thu, 11 Jun 2020 11:54:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 11:54:34 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/boot: use BASEDIR for include path
Date: Thu, 11 Jun 2020 12:54:14 +0100
Message-Id: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN6PR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:805:66::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by
 SN6PR08CA0019.namprd08.prod.outlook.com (2603:10b6:805:66::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 11:54:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a8c6960-879b-4583-35c2-08d80dfe3a82
X-MS-TrafficTypeDiagnostic: DB7SPR01MB5:|DB6PR0802MB2215:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB22156F7C3FE952360247607B9D800@DB6PR0802MB2215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;OLM:2201;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EnlSHrmHudPfgmsk2qQVjFmnYYpYbTDi2kCZcbU6yAMAjAlqJpECRYrL1W3QRUfdrHCg/BZ73V54lVN1pdJTyU66cLNSX+w3yFz7CuznlarVwujhFGvA5W9k/n36W0eiBEx0iZj2ZGsOMXuy2STu28iwSmlBmgwfom6nVpxtD1JPe0nOh3hh8JO2jEINi/2nJCwwcS1YKMq0zSyO3qxeMEKo75EPFYz/gHLnE5eMZB5dVDqIUzDSV9x28CDcm3fnJyjAyuf8ryWmqnI8o2MWchL8hSAZY4vtACFWlDNbHcxKwN1oFeXKq3AJ+iStVGKcb7uvt1SjxBvZ50qu1WOiPsNOIOJUR1QyM8aFfTNc2OyHENZK6BjNRybXxwzsm+JH
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(83380400001)(4744005)(6486002)(36756003)(8676002)(5660300002)(8936002)(44832011)(4326008)(2616005)(186003)(54906003)(6666004)(2906002)(316002)(478600001)(956004)(66946007)(16526019)(86362001)(66556008)(6916009)(26005)(66476007)(7696005)(52116002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cZD1cuUdd9EaQmRe9kKiuWa9GdeOcq4aBEMm/SvLbavtaXEX969XInr3K7WLAnknohkDyVrSm2TI1r7zNdm+KX4NjI1eD7Jrl3Tl4L7nv32TxLr4ECt0BPmZzxt7vrqfEqCUOlrQD0pO9x+hiaO4rwV34vEbi9nmycery/m+z6S3caa35qHyg37yb9Gib4k5b5ZOC4nduPnek+jklpHsskTPitgd6b+bFGEYZD/jPUUkdxJDarkCg3z7k0tkvuAQwssZ8fYoYtf2RbMvkWOBnX7ityZUMbjWxJx6L1YhOUEgjmtI5u0IUXT85S4fq2xqWDWeyz89OCUN7MBYXMVaZsU1Ssg4HJydncy2RcjubTqX7IpkSHDEV4EtDabZS3M8zZV8s1hVH5RZ2cI1GpypegUgs/I8YhH9M0ZIGP2ZgaDmrQCYsM306ZDMmDSgsYqzvYzDfuD/8fDXJbPd7FkGrJun5cMV4RRcTEv/DZhZum2VpZCUECMNNfA7588VSCEs
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7SPR01MB5
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(82740400003)(316002)(4326008)(82310400002)(47076004)(6486002)(4744005)(8936002)(2616005)(44832011)(956004)(336012)(86362001)(54906003)(26005)(6666004)(186003)(5660300002)(81166007)(8676002)(70206006)(36906005)(356005)(16526019)(2906002)(107886003)(36756003)(83380400001)(6916009)(478600001)(7696005)(70586007)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9de26957-d966-4a92-f91a-08d80dfe3594
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFO35f5Zc02mgGaI4gpVMkXAoECClB2HghzfTZw/xs0uuaA2lg4chIpqOplvYVCQ/sPpqrqKQi9qS6HfjkzpAt9qwrU78vi9x3h+md4PJw4PhfT53ZOp7X67+Rt521lEtk6lk9eh3FNVME/Z4kaBCjT4qPNzDc3dmrPzjiH15ANXhGaQn6PmcHOxoaQ1l6qYRF2iS2nqyrd0SPv/X2fKeDfwrG075FXnINWPsTyonqvyETHONoqNEiE2SGXDhnB3v6y2R/85Gh/LZUI+k95Ye+C+Trpr6XjDoY1PJU/EeA51YVV1773D0XSzRaf36CadVG0C715nGTCdV4mVgMRfNV7Afa6eygsQoEp3Kjj51yKj9qo4CaZGFc5hVfX9NPwgvOf1i36rl8Sb8QNaxh/4CQ0iidgpYX4DwKF4s5K7hY8VIIsngSoMYeKUM/V+BxYM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 11:54:42.6178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8c6960-879b-4583-35c2-08d80dfe3a82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2215
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, nd@arm.com, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use $(BASEDIR)/include instead of $(XEN_ROOT)/xen/include for the
include path to be coherent with the rest of the Makefiles.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/boot/build32.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
index 5851ebff5f..8cd5403926 100644
--- a/xen/arch/x86/boot/build32.mk
+++ b/xen/arch/x86/boot/build32.mk
@@ -5,7 +5,7 @@ include $(XEN_ROOT)/Config.mk
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 CFLAGS += -Werror -fno-builtin -g0 -msoft-float
-CFLAGS += -I$(XEN_ROOT)/xen/include
+CFLAGS += -I$(BASEDIR)/include
 CFLAGS := $(filter-out -flto,$(CFLAGS)) 
 
 # NB. awk invocation is a portable alternative to 'head -n -1'
-- 
2.17.1


