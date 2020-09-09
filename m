Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B511B262E9C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:37:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzLF-0000iu-EG; Wed, 09 Sep 2020 12:36:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rxpi=CS=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1kFzLE-0000ip-LW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:36:48 +0000
X-Inumbo-ID: 7917fa1a-4399-47ff-bffc-4342690d7ee6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7917fa1a-4399-47ff-bffc-4342690d7ee6;
 Wed, 09 Sep 2020 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQhQSBd+zyOcko0gnIGa8KrVyolNQndWmjqfwG4y5Hs=;
 b=uuO3+comgJY11uvJfs7GW2AgHGjGTIhmv0clSSngma3C+s8yt8QmkcCbK0S1t8ieENOBccGYL/G8IyR0sTm/UfMQOi86KNINp0M22/NPEmPrOrEM9y7nLf2p2WHmINvvQN0kO2DwwbK8pXZbbDjyGAuvwRtC7h0B73euGVeKHgc=
Received: from AM6P195CA0065.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::42)
 by AM5PR0801MB2116.eurprd08.prod.outlook.com (2603:10a6:203:31::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 12:36:45 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::1b) by AM6P195CA0065.outlook.office365.com
 (2603:10a6:209:87::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 9 Sep 2020 12:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 12:36:45 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Wed, 09 Sep 2020 12:36:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d85f182aca9b6b3b
X-CR-MTA-TID: 64aa7808
Received: from f26efae7fd6c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0826D7D6-DD1E-49D0-9C97-DA2776F09565.1; 
 Wed, 09 Sep 2020 12:36:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f26efae7fd6c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Sep 2020 12:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3l+Na3pX/RtjSi1nTr2OY9fJEvYCkjf7ZiO4Nj8+xGlpcAF4rOAWkTKFqa+6YQSrVI6zPMEy/dWtahR/lxTF8MYXxbNk5ouqZjwqb6Q7o2DWkva551SjOJakeKcu8uzq6wWLM6HflgO88jl6yyG+lRXS//WNuW0ODr0+9i/j9cko6cEZy7MYDPZHF0ZRr0GVFxAf5i03UNj+SJBXwQixvwEg89JvsJJ65CUk0hwEInVihxC0Om/lfcdj4uaABRN0bdf8PDe0M0Jf1jBGS8D0/48VCLq4vDoTdByCxjRZqYEMxV4j5ZmufQ46jiGq3L4ksKNY7tLoiAcDBbiOyOiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQhQSBd+zyOcko0gnIGa8KrVyolNQndWmjqfwG4y5Hs=;
 b=LU6AixTDktRu6/Fakpk8CT3KTubKtuu60yu0ZgfCQc+qDL2kg4VSJd/VwAMe7/EdSc02HcyffWw7WVy66E3800ipYCRJluQcsmFV62r7CtXFpqI2NdtCtOwvD3+RbaBF4dlKGNkqP36TQ/lhwJoknNB6eJOb4LKU05fJ6Y2AtImZ+k0rLR1sa0qVqTwJm0KuDEzwlBNMG4QELwWeAOBIQ2W8dMtaFYGmWIw7qVRAbconClerUbHEWPjgyLHp5ixyEEKi31scjsKs/QzxKOVCMLpodj5IPlI8URnM+7y+5Js4p1BwYzgdTCBCFlvX9x7mwGf9tQGwx+Rt7QW3PZRiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQhQSBd+zyOcko0gnIGa8KrVyolNQndWmjqfwG4y5Hs=;
 b=uuO3+comgJY11uvJfs7GW2AgHGjGTIhmv0clSSngma3C+s8yt8QmkcCbK0S1t8ieENOBccGYL/G8IyR0sTm/UfMQOi86KNINp0M22/NPEmPrOrEM9y7nLf2p2WHmINvvQN0kO2DwwbK8pXZbbDjyGAuvwRtC7h0B73euGVeKHgc=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3302.eurprd08.prod.outlook.com (2603:10a6:209:41::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 12:36:11 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 12:36:11 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Date: Wed,  9 Sep 2020 13:35:56 +0100
Message-Id: <401e31a2c521a34502461336b4e65468e7394e01.1599654067.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::34) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by
 LO2P265CA0238.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 12:36:10 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9be160f7-d5e2-4234-dccc-08d854bd032b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3302:|AM5PR0801MB2116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2116EEA0EAE2AC37982B866A92260@AM5PR0801MB2116.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WxcG8IlsEbraXovs3r9OqFglV19/vzF3AdpQV+kwghvCyBznuIEYu1nLD7pUJmctTw/DK7O4ItYA0M0O80hHvCAbG472tOZycY/BaaQbcusA1+wzRNawo63eCgB9i5llDviaHXEGJWkETf4shTLU8WlWFmphtiw0A4l/v9Ye1s+9zoM50sa1lH8x7QnurDhx+5b2WcBwoTCheBcIMASXmBChkRa1ljH3bWV7AtnGQH7qvcxYkPrRvzfqUDr9GEGtOxkuxQ5HTJTlxjplxbSQcelH6T3jE09SYLi+WgPow62m/P8VekXpg7TfRM/8h1jH3rb/NezrKc0OI9bHrytXog==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(478600001)(956004)(6666004)(4326008)(5660300002)(6486002)(6916009)(36756003)(44832011)(83380400001)(8936002)(86362001)(2616005)(16526019)(66476007)(66946007)(66556008)(26005)(186003)(52116002)(316002)(7696005)(8676002)(54906003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6KTKe8G7r0RMIRBOnHCQolXMsiZv0DyVg4lRDbsF0FjiOnQU0csfV2uDacLrHS6SNVnTDD/HD4inUzv2sHNlseuoqOXGa7TsyUjMuk6/7H1/QJdM7NgfyKKPxGJRplVkeLIs86VSeQ9J0nFPkgMxzeJPJ1eq5ddmjDedT9b9Ui90iz31d6uA//HzFmOhuxL4nnv3zlejWyhMFVC05miIPPtRQAvPZ6qXqyrKGqe5ZoGu7PNjI5ZLQGtQ/nNAzoLWbMCJpTfc1jnnu6sZ5+7+vCPkP3LtJx/BFtOYf29LLmhFd7TMT6VF5fkpzrW1vCLMzJKZE5ofSM5Iw3fiSae6/ht8T13PScat2U0P3oCAzXPFF5lzfQqj3jkHCB7mm0jNAr6NFIcztyqff0edk3/HOBaP4185M0HeY0UTDNccKvZdqE0m6axqKQ5pmyokj08BaR5PLKuCQpXxpzaypBLSfHwaA7wPJV+lNebYUwwTNYlAuhSGJV+MGut9xSwIx2qK0n6GqmjDb0TMtsb1rDDuLoaJKdM1qeyKimLS8ynhspvkamTK9cYykimkwMOMI+tfGB8+Ci5afoAfvgwxbagPNfp1dvg4KO9NuCEYvdGH+XXV/VR8bf99k2VRXc8n3y4Hf5HvsdWUAY5asMUDS6ROKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3302
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 16f9e42d-2601-46ad-02cd-08d854bceea8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgdpDaOE0SGPhDC8KkSvwv8rv1w/eIQGWmePExxF961surBUGJK/ijkuweRj1kTNrfmh/ylcZ0WUo6zV4SiHvpBb35Wbw9RsOcUCqrKv2oCgpJWEiSt0vs38D++Fu2FQ26EeZc9zd8+jY73N8uoczdxNZ90MTcmBgzGOIKm99D/bD3WNUIJP5ZtEFL1WymjyUM0lx4YevR3WxjjXAtvkH2J4OxHsHmtRwn0jZav9xCLqD2osdvm0eguCt7f6TG2fHIoHioplGsrqw+2cIaniG9jyr2bP6mle/yPNspF++9rRGHCkbhCfSnduX0RK67m0EfespuAei9Nz6ZxHYmOLs+3i1A9N3TIBeAwD/LBsWFLWRoTANCkS5Xf11z4drSZMzF5NDth2RmgKD8Ktt3+fcg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(478600001)(2906002)(6666004)(956004)(26005)(54906003)(336012)(70586007)(36756003)(316002)(4326008)(186003)(6486002)(16526019)(70206006)(83380400001)(86362001)(82310400003)(2616005)(44832011)(8936002)(82740400003)(356005)(8676002)(36906005)(81166007)(7696005)(6916009)(47076004)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 12:36:45.0973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be160f7-d5e2-4234-dccc-08d854bd032b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2116
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

If dhcp.conf is a symlink pointing to dhcp.conf.real, using 'mv'
creates a new file dhcp.conf where cp will actually modify
dhcp.conf.real instead of replacing the symlink with a real
file.

Using 'cp' prevents some mistakes where the user will actually
continue to modify dhcp.conf.real where it would not be the one
used anymore.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
Changes in v2:
  - Update commit message
  - Simplify the code when removing the temp file.
---
 tools/hotplug/Linux/vif-nat | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
index 2614435..fd34afb 100644
--- a/tools/hotplug/Linux/vif-nat
+++ b/tools/hotplug/Linux/vif-nat
@@ -95,12 +95,11 @@ dhcparg_remove_entry()
 {
   local tmpfile=$(mktemp)
   sed -e "s/${dev} //" "$dhcpd_arg_file" >"$tmpfile"
-  if diff "$tmpfile" "$dhcpd_arg_file" >/dev/null
+  if ! diff "$tmpfile" "$dhcpd_arg_file" >/dev/null
   then
-    rm "$tmpfile"
-  else
-    mv "$tmpfile" "$dhcpd_arg_file"
+    cp "$tmpfile" "$dhcpd_arg_file"
   fi
+  rm "$tmpfile"
 }
 
 dhcparg_add_entry()
@@ -109,11 +108,11 @@ dhcparg_add_entry()
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
 
@@ -121,12 +120,11 @@ dhcp_remove_entry()
 {
   local tmpfile=$(mktemp)
   grep -v "host $hostname" "$dhcpd_conf_file" >"$tmpfile"
-  if diff "$tmpfile" "$dhcpd_conf_file" >/dev/null
+  if ! diff "$tmpfile" "$dhcpd_conf_file" >/dev/null
   then
-    rm "$tmpfile"
-  else
-    mv "$tmpfile" "$dhcpd_conf_file"
+    cp "$tmpfile" "$dhcpd_conf_file"
   fi
+  rm "$tmpfile"
   dhcparg_remove_entry
 }
 
-- 
2.7.4


