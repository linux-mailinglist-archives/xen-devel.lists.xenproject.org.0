Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6A424B7A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:01:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iKB-0007Re-Jo; Thu, 20 Aug 2020 11:01:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WowR=B6=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1k8iK9-0007RQ-Sg
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:01:37 +0000
X-Inumbo-ID: 915d5284-91a4-4f62-b267-8eb7ee2737b6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 915d5284-91a4-4f62-b267-8eb7ee2737b6;
 Thu, 20 Aug 2020 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjycY1NYkgo1wh82XjE9VDeZgdK5y5E7vxVDBjDZIzQ=;
 b=fmOo/5If9OMBi04cbybCysB8/paYSjmVuUbCjiXBz/9NLryrszWppNa9sb7SqQ/gIQ0Phgce/xiser0mXv8I5Wct+j0foZRmP0prCY44IYUH4OOui+TvawhSP8ow455vg5owHjpW1nL/9Q8e7k4lkIYVSq5EkBR6eczyilg79ic=
Received: from MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::23)
 by AM0PR08MB4497.eurprd08.prod.outlook.com (2603:10a6:208:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 11:01:34 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::47) by MR2P264CA0059.outlook.office365.com
 (2603:10a6:500:31::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 11:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 11:01:34 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Thu, 20 Aug 2020 11:01:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2860f0c3cf0fcdcd
X-CR-MTA-TID: 64aa7808
Received: from 8be6e5a9f9d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 722BA6CF-3497-455C-971D-B3E476A41201.1; 
 Thu, 20 Aug 2020 11:01:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8be6e5a9f9d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Aug 2020 11:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOP/ysMGA3sPkx086uKd6Rs55XW2s/46lFzx4RAm0ewhghOJEn2PWVjHp5XE1eGCg7S8bzQVrEs9N7+nVInIEK2kYJCBjJATyRrM4t0WIdEVE2+CkezBnbqgXWiodXGCGW665skkRTcgYdSrr2v2Dh325qE5ltOR3mUuTmnT9w+YtO9hlCOJQOHc4c8r1KLMz0ljGJZx9OJZKc69d1rw/JpUnSSwcte5O5U2W7AXuD2+lboyDn2deJOL3AjpbNVpp79Mf7VeLXIhcucLEPlpSfGpKqG/WuNqvXXXMlENMjvTJpeBC5e0OjuOE9W5F6PXcyrAsSVqf34wMQjaz5URng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjycY1NYkgo1wh82XjE9VDeZgdK5y5E7vxVDBjDZIzQ=;
 b=V/MUU8yn3uLpU82JZhKuWhasAbJ4uiEuGykl17omBH/C8umT+kmclwbcYiGMoLACJTuCJ6PQ9SFXxVL3Nj/rEMKgPkejqKaEOqHKkAW+6rqgF7C4eYGBh3iYvvmd+6VU90dndN/IZuYQuVBgaySJ9YvZmO0rktt+HR3ozIzvGOT9ABwiVd3JNeyflzirm3T8brA+xEPmFz0cen5GlCX/FAtGqpbpybJm8JbIxIAm+S6+aCyfDIPoEbPN3FBqRKBiGR1+vZtbBKFFU/uhdXWEd/b+2DK/zbqxPr50m1VRr9vhDNNXhoG6KwNmqHEeWMrIW5jUcMsmqyz7iEJC8JN/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjycY1NYkgo1wh82XjE9VDeZgdK5y5E7vxVDBjDZIzQ=;
 b=fmOo/5If9OMBi04cbybCysB8/paYSjmVuUbCjiXBz/9NLryrszWppNa9sb7SqQ/gIQ0Phgce/xiser0mXv8I5Wct+j0foZRmP0prCY44IYUH4OOui+TvawhSP8ow455vg5owHjpW1nL/9Q8e7k4lkIYVSq5EkBR6eczyilg79ic=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3111.eurprd08.prod.outlook.com (2603:10a6:209:48::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 11:01:19 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 11:01:19 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] tools/hotplug: Extend dhcpd conf,
 init and arg files search
Date: Thu, 20 Aug 2020 12:01:11 +0100
Message-Id: <c4fc61f8e5549565a853c5cd2371e68a9f48a258.1597920095.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1597920095.git.diego.sueiro@arm.com>
References: <cover.1597920095.git.diego.sueiro@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by
 LNXP123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 11:01:19 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9aa263c3-2f34-4dea-b2c7-08d844f866f1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3111:|AM0PR08MB4497:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB449784E8A6C8FB362E1AD73C925A0@AM0PR08MB4497.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UMvJYLzNEUn5rTqHRUyLFWuRjtNmOaqFQZwh3SUeKE5n9mVND4ipQ5buB6RAYAYQNe8NuViHv9eXPEApr8zIihQH6zUUm0wS/2SyLqSvwrplMC4EPelzwzgcFFUWAD5FELfyQ7nK2vfupbcKjATRglyovr4agOQH62QjUsSSZas0yFB4iAOQ1s36474WdwVk08zEj4e+SNLSXwYsIyxqOgUsPBCstdtlG3wVLf9T/VN8QgWycNU6kUc8Dlv5In0/lT5va8R1QEayAGMqhbqDt5v9ZJ8a10g9f1q441OO0LZJL4NM76efmTaLIkwoM8Q1auiyujLqasese72hxBXRsQiQc4XqPzMQzSzSp6p0nDttw75udLGmpR1Pgdx5Gvb9
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(6486002)(2616005)(16526019)(186003)(4326008)(2906002)(6666004)(956004)(478600001)(8676002)(83380400001)(7696005)(66476007)(66946007)(26005)(5660300002)(54906003)(66556008)(86362001)(36756003)(6916009)(52116002)(8936002)(316002)(44832011)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Rc9EB1WDBBBzkDUddZVPAhBH/oBaEB+eaq5BCa89xv7UTRtC/UR7QlWf51nuK64N/ZABCco5hrnDceMv3Yehjqp48zMmM6O2hsgZ0fAi4CrKcm+wZ7ZNWUk/CQg4wYO0oIY4ipsgmY2iXJpgX4M7lU1NJEg6bdKgw07mgzhypKqk6HY6qBGLm5HNdzvMiwWMxaDFt+WUqC2ZP7q2g/i/dfVWn08Ebkis+U4P3aydqqV0r5Y0pP8g6J/LeGkCPBMqy+45qKtp4H0DgaZAGDdJobownbF3o2NkMBvb2xBUp2jH3oAEmQOuRIY3jRkmKVWu5fkWbjK0E3M1E1kQCDuqNhMvQ48RmGAF3r/Pwb0wYwB6xbuuOTO0DXpyixap8ieacOD+rnbrPdLM2WTx7DbDI0avIUjsQnBqUAKApvGumfdCGUJY546jH36wr7Jdafhwt2ZYJ0kN4jqbLcecvWYkiYp4sxrDkgH9HJJqueBSa7n3516iMzZfES6U00Waid/GiBdinf5hzldgGPEEgHrrNRidLuW6psw8axOu0bVQG44I/BARSNrw8LYACf1h52ZRbfzPWpOOPkpElfCN6j0zMqfTBBCnwyWX7Oj/W/xbUaNbMV7aR/RxWmjJ1UhyNurrAOPNZm06GR/Q0+cb84PVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3111
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2171fc1-605f-421a-3fc1-08d844f85e1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0eJMnwMoYWN8guiWlC61pduEOnMwYg6fLVqVtD/1bQ6nhAh+baiyQ2pvvWmLhFUryDN7b+2KMxcdC1g6gxBUQ57QiUxz5eKq60eVOi3Puu+TTZGYDGHh231vhdYsW4Dta5N52OpEwlp09G2FcszL9eX4D3bEkHlxUF8R3kEXB7ldNgGt08RzBrpWoA9mLtYirB9xLIyyZK9Q4aijzKWqcGN3S7GnoOLml619PHsCSaYC2dOBmJAdEh2uFYWuMbCMBxp1HSCpkVWbvE3nJB+5wnhR9se5poyMKgxrHM1+Su4rSsCZBgvF+jtUXKwrJxruiEFe352erqEq0YuFbZrR1zdeuN9YpDhGmqzOwDUVyv0BlkBBwga6RNae/vLod6X0IyHLQxzhy5567sy96mFIevIO5W/Ezs/Xfgi5wb30nkCcyBuD0nE+GPfrzJnsoFQJ
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(36756003)(81166007)(8676002)(6666004)(8936002)(2616005)(83380400001)(54906003)(6486002)(6916009)(2906002)(356005)(956004)(478600001)(82740400003)(26005)(47076004)(44832011)(7696005)(336012)(4326008)(16526019)(36906005)(70586007)(316002)(70206006)(5660300002)(82310400002)(186003)(86362001)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 11:01:34.1501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa263c3-2f34-4dea-b2c7-08d844f866f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4497
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

Newer versions of the ISC dhcp server expect the dhcpd.conf file
to be located at /etc/dhcp directory.

Also, some distributions and Yocto based ones have these installation
paths by default: /etc/init.d/{isc-dhcp-server,dhcp-server} and
/etc/default/dhcp-server.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 tools/hotplug/Linux/xen-network-common.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 8dd3a62..be632ce 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -64,18 +64,18 @@ first_file()
 
 find_dhcpd_conf_file()
 {
-  first_file -f /etc/dhcp3/dhcpd.conf /etc/dhcpd.conf
+  first_file -f /etc/dhcp/dhcpd.conf /etc/dhcp3/dhcpd.conf /etc/dhcpd.conf
 }
 
 
 find_dhcpd_init_file()
 {
-  first_file -x /etc/init.d/{dhcp3-server,dhcp,dhcpd}
+  first_file -x /etc/init.d/{isc-dhcp-server,dhcp-server,dhcp3-server,dhcp,dhcpd}
 }
 
 find_dhcpd_arg_file()
 {
-  first_file -f /etc/sysconfig/dhcpd /etc/defaults/dhcp /etc/default/dhcp3-server
+  first_file -f /etc/sysconfig/dhcpd /etc/defaults/dhcp /etc/default/dhcp-server /etc/default/dhcp3-server
 }
 
 # configure interfaces which act as pure bridge ports:
-- 
2.7.4


