Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693E24B799
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 12:59:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iHl-0006WV-Lh; Thu, 20 Aug 2020 10:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WowR=B6=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1k8iHk-0006WQ-3v
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:59:08 +0000
X-Inumbo-ID: 6ce8b697-8a98-46f9-8c42-dd1b67a77d90
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ce8b697-8a98-46f9-8c42-dd1b67a77d90;
 Thu, 20 Aug 2020 10:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJK7pf4pY504nOT08575pkYv6VE7TKPG2DEhBwtnAA=;
 b=QmIjjB8dWpq1xPb2DK/3qoK3EuzVQIhBv7Yd3DFPsgdrB/SOj5mWt1BqIXRSWB5i6uzabDa6QcECmMUiaupoX+86o2ZrT/4edTdmMVjKmFHw3Q72Knpo8NNmSPLDISnzeyu2a+XxADh12ZquqqiWmZ0mFrUshNbOdjz26H0w5MM=
Received: from AM5PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:203:69::18) by AM6PR08MB4037.eurprd08.prod.outlook.com
 (2603:10a6:20b:a5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 20 Aug
 2020 10:59:03 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::4b) by AM5PR0202CA0008.outlook.office365.com
 (2603:10a6:203:69::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Thu, 20 Aug 2020 10:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 10:59:02 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Thu, 20 Aug 2020 10:59:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be0569d494e28231
X-CR-MTA-TID: 64aa7808
Received: from 1bfab684ef99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59F825ED-436C-469E-B1EA-54C24C4563D0.1; 
 Thu, 20 Aug 2020 10:58:25 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1bfab684ef99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Aug 2020 10:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnG22vCK3y5mY4vtOG/1NzX6jgKeghbY/BGS+bifS6KA9jXrubB5DgI8JbnqqQdPi3yNUUPjSvg21aNCSCSUnptxj+2B61TOn/u4z9CgWGBLfFwuwi3Oki149OP6/fmfVYxec6b1+odv6GQinabj4Nv3M6oGoiYbWUGhyTpZBQvGuaJvD2lE3vc94T06Wu39wjLxyJRjBmhxpDTTpF7t+NZZDlVUhQupq+wqxbgVdcb26fxvZmoWHzXnPWT/yEoEB0rb1Dnlnzv/AFM9qMBF9SSEjf/oSo/zilAfXnPGiO8vCWi9hgNc7fqboEA4NyFZrdsaYQzd359H9F8j578+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJK7pf4pY504nOT08575pkYv6VE7TKPG2DEhBwtnAA=;
 b=jP8M7XPFXapsLvFZIseREVIe5NB1iaPKMn5W2wsPWxsuNt+WoUIlEf6Z+suaQHZkwxgZithE5RUOncAScQIym+Lbv6D283NAseD7CkeKA0ygHAzorhJp309PsXJSuad5BtDOONlcpz0yJaxdDkaNm/jC7Q6Yv+Y8qfp/sj6h3Dw78viLAlvIjXuFnJaxMoQ6+MAnpkf2SDCCIU0Mxha0Z1Mp7V/U1Rs/wqPYz7/b9Cp/f6dn+0mBpBQa5Zj1y5hgzIZSKEaD6pnfBIorHEyJVDlDRQ8GwjUb2TyQ3sHhK2oQ85y/6ih8W+QJynfvy5tsLmkRDW3j6iFqtKx0+e9XHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJK7pf4pY504nOT08575pkYv6VE7TKPG2DEhBwtnAA=;
 b=QmIjjB8dWpq1xPb2DK/3qoK3EuzVQIhBv7Yd3DFPsgdrB/SOj5mWt1BqIXRSWB5i6uzabDa6QcECmMUiaupoX+86o2ZrT/4edTdmMVjKmFHw3Q72Knpo8NNmSPLDISnzeyu2a+XxADh12ZquqqiWmZ0mFrUshNbOdjz26H0w5MM=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3111.eurprd08.prod.outlook.com (2603:10a6:209:48::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 10:58:23 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 10:58:23 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] tools/hotplug: Fix hostname setting in vif-nat
Date: Thu, 20 Aug 2020 11:58:20 +0100
Message-Id: <689b543715a858ad0fb0c1d849dd8ec70b3d20be.1597920095.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1597920095.git.diego.sueiro@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::22) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by
 LO2P265CA0130.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3283.18 via Frontend Transport; Thu, 20 Aug 2020 10:58:22 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a45d2cff-db3e-4ebc-dfce-08d844f80cca
X-MS-TrafficTypeDiagnostic: AM6PR08MB3111:|AM6PR08MB4037:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4037BA33987C88E0B9444E50925A0@AM6PR08MB4037.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7Wow+Aiid845N+KhYCF8DjGahxTHpKeKCVUGws7Esi4Fvm00NUmHZXiO9gIF2RWaJMYffMYn54WZgLzFO4KOLhPUPtwAjYiFSklfewmXjZ+3BfytyMtotbucxgSEosT/pTNMMPZV/BpBqvS/BCDtcK1GLDJw4I/cJ+QoLOHcVwy8ypOw85rrdaWqepDrmfjcZLT0aNqfS2NWhK4uyxtR+B2w3SqE+EhHQRR/naxmgXX7f9Gp8/puuxT68vJK6aBF4u6CNpx7P8h8TlbDxaQZDWrZRM8hnkwaDbl1WQkwigcXU8bCd6pbthQE+zqGB/XnQ2U3n8TNMUXMkZOHuTgwAMNEgD3t6eWVVHXRNYRAs2d99+Xln4jOBQZbKGV8okPa
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(86362001)(54906003)(66556008)(7696005)(66476007)(83380400001)(5660300002)(4744005)(26005)(66946007)(44832011)(8936002)(316002)(36756003)(6916009)(52116002)(2616005)(16526019)(186003)(6486002)(66574015)(956004)(2906002)(8676002)(478600001)(4326008)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PIcaxSTnqLGkk6vm9NlBpi6BpvRtsTy/IqXP0W+aOXOviS9anJfDNLjMnUIEd0gyv9UPmaQ5POhsvPWNyGZR5kD91+bMmdP727FAoL24Ffb4djz2sI/NVFCDWG7PyCVi2yPkb85m3XFh4j+bz1GbJC0XMHWKf2qSTOl21oEfwMqnkGwBh5cut8pDXhn+38bCI/uKNlK4W7rC26J+uugjSx+oppRzN56k5iiakpgFrOYXXoAPx5mAU2rr+WHH9n3ejX3yA7SROcphSqlUNL52RjhjfZgs1tuyBQghB3alrI0KxAycEIEr8kVliMkiCSWOhGd5vRJn8zNA5SD1HOr6TQW4Sx0sTAJPnh69j0mqaAWyn3UwrvwZjHPRi6cYazFM8M4Y//lfs5raVl7pnnfvjOmMXZXTtQH/Y0pLX32wNxdHsBJvJcZ1+k7GkRqgNSaijb/LgO2w9kvmP/lUXNSKbF2ohSXUJyU5XvMAMm+zED953ptaJUnTHq425FDRH1PfBkBkPtUDK/JlUePnBXgavkAf0RcTyX5kBG9L/bxqlYtdBliluAWCRB5UCmm5/rf7ZxFt1jQVCQVYETttCgSp5656xkV1M5f9DoayWuB2mw276KGM3CVBahHlsI99v6wNZHg/PWNJmnEAm4ufCJ8gxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3111
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90b72c69-e103-4e40-e8c3-08d844f7f4f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvp7jWEAMTl46GhByX+RX8y5mnTSln9P66tiiLjhbm3ibbIdY+Qxw5oxQaKiuPdLkS0dou5IhEHNQLGF3JjK3h6jejnajA3il+LMJJOsouHDgAj3cxMV2hAUeTlQ1vW9H0cL0lAV6bjtmXkbyRZSlA1zz5+LapwlIyRgBC88DHRGQwtsrTMpFPNwnx8/ORI+/pXS0x5TnGp6N3paWVZe4LpMRF0E7aYechL7VLfzCqJRaVS2B8Hno8RLGh1fMmxKtapR2vLvjjQY5hjplr/ppeDJsqoEKdIglcW1Pn16KcslEs2RrlcmKrv/DaBc4U5mthqrFCFImEq9SgrWYAlV5XPQ1pHS/it7HhzlPQ8za0bV8raRdz/YzepiMau7tujmvAuVxjDYZBOVuCpX62FG82DrjVZ0sbDFct9IQyQo56Qhnbtx3OZ72VvYuMbLF/Rl
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(6916009)(956004)(2616005)(82310400002)(26005)(4326008)(8676002)(5660300002)(316002)(70586007)(81166007)(36906005)(70206006)(44832011)(356005)(86362001)(478600001)(83380400001)(82740400003)(2906002)(54906003)(8936002)(6486002)(66574015)(4744005)(7696005)(47076004)(336012)(186003)(36756003)(16526019)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 10:59:02.8356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45d2cff-db3e-4ebc-dfce-08d844f80cca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4037
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Setting the hostname is failing because the "$XENBUS_PATH/domain"
doesn't exist anymore. To fix this we set it to dom$domid

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 tools/hotplug/Linux/vif-nat | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
index a76d9c7..2614435 100644
--- a/tools/hotplug/Linux/vif-nat
+++ b/tools/hotplug/Linux/vif-nat
@@ -85,7 +85,7 @@ router_ip=$(routing_ip "$ip")
 # Split the given IP/bits pair.
 vif_ip=`echo ${ip} | awk -F/ '{print $1}'`
 
-hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
+hostname=dom$domid
 if [ "$vifid" != "1" ]
 then
   hostname="$hostname-$vifid"
-- 
2.7.4


