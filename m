Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3624B7A0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iJE-0007MP-9S; Thu, 20 Aug 2020 11:00:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WowR=B6=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1k8iJC-0007MF-Oh
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:00:38 +0000
X-Inumbo-ID: 2a0ba58a-9411-49d5-84d5-6d52ace01ebe
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a0ba58a-9411-49d5-84d5-6d52ace01ebe;
 Thu, 20 Aug 2020 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNKPwqJpwUyVgt1gJW++t2rufxR2av2yxpDsmw1ZMKI=;
 b=cRRcrNpZv9Dk+nt9aTJ8lir6CkaKd/0A/mRZu+zFCBnf0sNaSVkt0NIucgNe24rZQIk+lblwrcDN7fBBpCEdo8FG6oVClTAMY+CbOWYMm2IiiCvKxHgU8EtU7VN3dG2p95AJI8Ha8MrmrtS0lsuK/+vRy8Wwrw/iny4SQ+u4R1A=
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AM0PR08MB4131.eurprd08.prod.outlook.com (2603:10a6:208:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 11:00:35 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::9) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 11:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 11:00:35 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Thu, 20 Aug 2020 11:00:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee6fdea2d99db592
X-CR-MTA-TID: 64aa7808
Received: from 8be41c3b1887.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F433E4F7-5B65-4AEF-8D55-279508319E77.1; 
 Thu, 20 Aug 2020 11:00:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8be41c3b1887.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Aug 2020 11:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxfjOqiCKLw0kTZ3Ze0k7X2Kw58LBwMWnmP9ihnA/ravabd2Qbb1P934UBGOa3/GOKnwRngcR5nignltn596WOVLbv+qg1Kso8k/HAVOGOzUh9uDwTkKDoHhOtkzZOHUhT0RSP57uQJxDldZ0NDGwjBhkQHWGDILXOVE2aPiveT3ZpJR34yzT4R6Hzn0mcTDXli6g73aZHf/h8yYBAaek/nFKoIXQ+JNvzptvdC2JkG3jdqd8QD/eCMx21swHWcfL9Wke1X2tuAf2dZPeiphE9s+rz2OXOHDo7nH/DkkdVjpV+d+CsqQ5TCPu7aJ2DjxlJH2vUh3qp9lplEW5TOFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNKPwqJpwUyVgt1gJW++t2rufxR2av2yxpDsmw1ZMKI=;
 b=jG9YfdkfheWthJ9iM9lPmkT0FcnxmNV2g2S68ygpx4FwH1/gOOJDp/rgDQJroPBQTtnfX50is/J4DI5EEDygAUeyIEDY6RAu/A+UdYRdNH1dGNZRdQQ7dtUw1z3kY2LZ7KU7NuTMtx3o0YpROlmhGbvT6RZua/Q+Rh/JMON4a/AMg3zCeUqoK+N/maPdI0mQjBkim3vZ7VeC7XvrZj4P0hdxx1kNHvtR9qTkKo0+RBzpPMGB2ZHEo7cFmk7KdE6WqfsvirHywekYpzFAXHAHxCcqFm8485rO1ymL/T35FZigjpraWsuUqFRFm/T8NT2JRJzpG7BxoW0ViuwnAB+5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNKPwqJpwUyVgt1gJW++t2rufxR2av2yxpDsmw1ZMKI=;
 b=cRRcrNpZv9Dk+nt9aTJ8lir6CkaKd/0A/mRZu+zFCBnf0sNaSVkt0NIucgNe24rZQIk+lblwrcDN7fBBpCEdo8FG6oVClTAMY+CbOWYMm2IiiCvKxHgU8EtU7VN3dG2p95AJI8Ha8MrmrtS0lsuK/+vRy8Wwrw/iny4SQ+u4R1A=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1937.eurprd08.prod.outlook.com (2603:10a6:203:4b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 11:00:26 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 11:00:26 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Date: Thu, 20 Aug 2020 12:00:23 +0100
Message-Id: <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1597920095.git.diego.sueiro@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by
 LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 11:00:26 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d7f42ec-be64-4e6d-b5ba-08d844f843aa
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1937:|AM0PR08MB4131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4131FFBC714CE315D147A5F9925A0@AM0PR08MB4131.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:418;OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2gRHFmTKoG5/Gcb05CmLKtWoV7+MxaK3CIOgokkURlB7I+aTFTpJB4OY1N7Up3qSYJGh3WufAeqwfqYlAfFtxreWq+fKGvT75uWLOmpdSwbaj9VmygI3Xivx+rO9aUNASKVV5ExJtV3NAnTWWBaHI9vG4W0cE8zhO3Ti/SSHETS3OYGlDcZbJV1lSU3Akoi1KsnCY/RU3YB/EiGMG6KBtPXVNRz3iNMNzuycnFua1AaB+BOKkEJvWos6waBo7834tg9jDlM5mjXNFJj/T94lAaaW+qwSKmTH2AmfDSXv9xpwy3RyQW5NN+/+4X6fLe450CPkD+hbtGoxkkwB45vrjPsYoGqKz5v6T3h3qa27yXWIsd6R7bJkQydqWnDj7Shs
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(6486002)(6666004)(2906002)(478600001)(66946007)(83380400001)(54906003)(16526019)(8676002)(5660300002)(44832011)(956004)(2616005)(316002)(6916009)(66476007)(186003)(66556008)(26005)(36756003)(7696005)(86362001)(4326008)(52116002)(8936002)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: L+HynnngJ558APZyCqP1Eczaif70nS+U398hNicOOM1DyO/xaWEgm8bm0hvfgdc/nckHR1rHqLEcRT4IGzAGwR9RAns4wXcflw55xNDG6ahwvSngXmUr44VVC5O6sas3otysik0h4hLuRU3afrc1KIwxITXqLId81Af8aT6bgjYzQkVvg98a0Fd9HSWAi48lZu3k6vTlKA2XvI+dionsu6AYXfMeoVME4bNPGGoI9Tdg1m/ISsVV0/vvcDLU808mCakg+SQHPQtJgFL4lBh5bYYoW6p3u4u+1naHqZwFv+Z4wz/Md5UM6QtxSWpephmNfGuCxfQA0aThSmrInmPhT7J8o0gbfYRYDwYvz8Xa/mS7NBGUZQampTvc3vVUb+dGaOSdBveHDm3u3RdAJwGBUETUTFx+lp3ulOBNMTpptxE638Ud2GwX16zSzwv0592eFGmzwVcQyhd8NaRy0Ypje3dxKYpXTrQstcznHDxK7LHopjkFIwjVzrpEnjz6v4zI4KI6zCsTC/9g+Ey5hQqdjq8CgVk0ae+dlqd+2dQT5GFy81TfcQcpOD7PDCblT1JGkvX06TelzUpcaOQBp2GtwD7sa+YLBnF6tu9FEmGe1KzyP5S6P1yMi+0QRHVxhmkIiRzHEKCypoNzGK74zReIuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1937
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3ec01056-9856-43bb-e8e6-08d844f83e7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Po7NrxkkTv54NI3WjMvluYNjj9k6vI+VB/iTuPkT6gOfK9psWPUMak0odndeoeUV4H204qBs8PyQCjvZoSv6u2CmZSRy2o5MTRtmO61a+cwYVIG6kZ9G7GM99PV2LnbFhZT115kRCGPmFnZkYLbBqJR324WbTrfizTiytWGRDzqAFUUc0jVqI0TnYdWaTWi07ljaxApkOUGlHBGM4FA4KMDlJ5RJinmgF5U93qf5f3o63zohJV57xjlrwKjnzIm86B4dYmevty3031EqtOPRkszfg0yrJXGFNARyiEGoNM4lkXYc7bcuVNZ6KBUiQRGgYCIMxNlzKZqMGmpipcrAn3XezaJlA3wMbBxLOnGxF4UZh40+HISMxs/x+5OaqSyJllLQY8nfLY59TqYxUfl9c/2kT0P4zt0+MZrzyFqgLH7rWGsyy94xZZvVNwy689hM
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(70586007)(6666004)(83380400001)(36756003)(5660300002)(2906002)(6916009)(82310400002)(8936002)(8676002)(86362001)(70206006)(356005)(7696005)(16526019)(82740400003)(478600001)(54906003)(81166007)(316002)(6486002)(2616005)(47076004)(336012)(26005)(186003)(44832011)(956004)(4326008)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 11:00:35.0694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7f42ec-be64-4e6d-b5ba-08d844f843aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4131
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

Copy temp files used to add/remove dhcpd configurations to avoid
replacing potential symlinks.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 tools/hotplug/Linux/vif-nat | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
index 2614435..1ab80ed 100644
--- a/tools/hotplug/Linux/vif-nat
+++ b/tools/hotplug/Linux/vif-nat
@@ -99,7 +99,8 @@ dhcparg_remove_entry()
   then
     rm "$tmpfile"
   else
-    mv "$tmpfile" "$dhcpd_arg_file"
+    cp "$tmpfile" "$dhcpd_arg_file"
+    rm "$tmpfile"
   fi
 }
 
@@ -109,11 +110,11 @@ dhcparg_add_entry()
   local tmpfile=$(mktemp)
   # handle Red Hat, SUSE, and Debian styles, with or without quotes
   sed -e 's/^DHCPDARGS="*\([^"]*\)"*/DHCPDARGS="\1'"${dev} "'"/' \
-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
   sed -e 's/^DHCPD_INTERFACE="*\([^"]*\)"*/DHCPD_INTERFACE="\1'"${dev} "'"/' \
-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
   sed -e 's/^INTERFACES="*\([^"]*\)"*/INTERFACES="\1'"${dev} "'"/' \
-     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
   rm -f "$tmpfile"
 }
 
@@ -125,7 +126,8 @@ dhcp_remove_entry()
   then
     rm "$tmpfile"
   else
-    mv "$tmpfile" "$dhcpd_conf_file"
+    cp "$tmpfile" "$dhcpd_conf_file"
+    rm "$tmpfile"
   fi
   dhcparg_remove_entry
 }
-- 
2.7.4


