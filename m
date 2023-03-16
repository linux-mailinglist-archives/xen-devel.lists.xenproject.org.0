Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2D6BCCBE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510480.788186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckov-0007nz-IR; Thu, 16 Mar 2023 10:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510480.788186; Thu, 16 Mar 2023 10:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckov-0007lh-EK; Thu, 16 Mar 2023 10:26:53 +0000
Received: by outflank-mailman (input) for mailman id 510480;
 Thu, 16 Mar 2023 10:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zev1=7I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pckot-0007lb-LF
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:26:51 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e83::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f2fb990-c3e5-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 11:26:50 +0100 (CET)
Received: from DS7PR03CA0284.namprd03.prod.outlook.com (2603:10b6:5:3ad::19)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 10:26:46 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::78) by DS7PR03CA0284.outlook.office365.com
 (2603:10b6:5:3ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33 via Frontend
 Transport; Thu, 16 Mar 2023 10:26:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.18 via Frontend Transport; Thu, 16 Mar 2023 10:26:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Mar
 2023 05:26:45 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 16 Mar 2023 05:26:43 -0500
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
X-Inumbo-ID: 0f2fb990-c3e5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bO4PA2JB8wrYw9DbV8TifN0Jhw0tah6DB6uEiNDXdQH6RPQUDkkqPjOfuPxVFw0KVWGTQjGpNfA4doLi6lvlalVPxgvAJpRfSvyXU0LcYXYU1vgaQKkBcvDP4Qbge7yf2y/dxW6Mi8YduwjtyIum0shiniDXfrgpWjjmKAG1zrzU4O/IPbTxYT4WypaJW1ObumQaHi8i13gIETeTiJHe86vcKhttfc4MZ8992nSERay2Mh0mR7QRoXdOMct/3gkXILUWWT8D6zGjGjwSaJ/jMhvGSX8eeQyISetGKkooR3mlce9wGnKuPY8FUO1o8zOkgvMxmydV7JIwf/gAKbMSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqjSEeKLQh14yeaCPgTnilyQ2L9726uHpVLBKd6gwpQ=;
 b=LWvYDWywNOfUAaAsGhxgJaqgbDT+YzpgeV5VHiSUbnhHnyKeYVov1+5MmfJ2f3AvHoTVIjPpvhUEpPDghSKlwESSHesmMCakEqze1lpj4yvLoU5L72XEHz+GyijtMsv13qDt834fliLaci1YW4d5avfkQTucOJLIVQ7gvvbW6lGqTHUp/MhLD0vdb4qupsPd3x+P1YA6jT5u/5gbfGgNOe5jLsUVsF6j8AF09iCGcUAq9gY/brNDjJPXTOxo7w0AH5OYGmYYUL1W6bXGUBuw0DvgOEyoYvHjCqtXRYN3jB4repBTR8cB7DUmd39OXNpnUIU4a8jI2Mq7R/CIH45msg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqjSEeKLQh14yeaCPgTnilyQ2L9726uHpVLBKd6gwpQ=;
 b=f0M23aVdidQTqUbkmjRBxwYdpTfdlKUcnqIblGJHabBdQ8Vjf72cr/QyqmctzBUlyQ6pzVv0PzLCWwWGHug4tUBirWxJpboMaplmom875kh+RymTgfk7q2F1Q8rv9hYgGM/CbjU5/kXWs6NvofZvfx7IUtUA7euduZCBJv3QuKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/console: Skip switching serial input to non existing domains
Date: Thu, 16 Mar 2023 11:26:35 +0100
Message-ID: <20230316102635.6497-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT018:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c371420-2bff-4c2d-f7b6-08db2608f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ggav0ZVf4yDY/8mh+x6etC3qz2TDyyaNsNQRd5n5qO6jv6dSdqijJTJleCOAqEVNIwCNW/X49nTinnqevvJb0LrcNQ/gqk50SmXeaZRjbu+ndabbxMV1yIHQTl5qpIIClNUeU3gNxaZgzcNtiANiXNAZHojFSusFqQhEiZJdZbRqrBjQKIpUpwHCRlc6tZDAl3M4tmIUTsCKHvorVggyvrNwncz8/F0p2dxMQ+6iZYwni31i1UDGI9CbJjmXE9caslnYFsR+FEAwous9Jw6a10XyqG0K4QnHYvxG3a9OoLd6XsCLQpeo5lnoVUrwpERvSNXzG4M42bBezg/wbDpWE9bA+io8gvIc57zZ9rNYDhqaZ7XG6X2r6YvUrCuxyX8lGA7jbojTMeH6BE/fI8M3aB5aKq1C3s39itffuLOeMkIppp3IFvrPpN4w58xSVAcdnQs20UEsMtkzscQEs/wtIiNnXF4Cahb1xMZyPi1/q00Zc2nMATPtXrEDa8UJ5DvaxaGC33oQAkrCCkRZtkeqXrM9G1vEmTIYR7knzIA2j7UeaC9cpC647//0QJbgEgvjyuSUm3c9/GAA7Graeu9mEviTgFPt+q++YCtrsUg2jc6ZfP6LZk7x0Qn8NTnJr+fYoXJlccr3+TkPnwUFyHXK05th8AFq59Iqinb3IaWAFK1ZfYf+CwUPq7SYIwKp6R8PmgDC7FbuB/FQDr61AwfulGctYLYLPkpoFQQywboZ61o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(36756003)(8936002)(2906002)(44832011)(82740400003)(86362001)(5660300002)(356005)(41300700001)(81166007)(36860700001)(70206006)(8676002)(478600001)(70586007)(6916009)(83380400001)(82310400005)(40460700003)(6666004)(4326008)(47076005)(40480700001)(426003)(54906003)(26005)(2616005)(316002)(336012)(1076003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:26:46.0283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c371420-2bff-4c2d-f7b6-08db2608f1c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797

At the moment, we direct serial input to hardware domain by default.
This does not make any sense when running in true dom0less mode, since
such domain does not exist. As a result, users wishing to write to
an emulated UART of a domU are always forced to execute CTRL-AAA first.
The same issue is when rotating among serial inputs, where we always
have to go through hardware domain case. This problem can be elaborated
further to all the domains that no longer exist.

Modify switch_serial_input() so that we skip switching serial input to
non existing domains.

For now, to minimize the required changes and to match the current
behavior with hwdom, the default input goes to the first real domain.
The choice is more or less arbitrary since dom0less domUs are supposedly
equal. This will be handled in the future by adding support in boot time
configuration for marking a specific domain preferred in terms of
directing serial input to.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - was: xen/console: Handle true dom0less case when switching serial input
 - use a more generic approach to handle all non-existing domains
---
 xen/drivers/char/console.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e8468c121ad0..d843b8baf162 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -490,7 +490,24 @@ static void switch_serial_input(void)
     }
     else
     {
-        console_rx++;
+        unsigned int next_rx = console_rx + 1;
+
+        /* Skip switching serial input to non existing domains */
+        while ( next_rx < max_init_domid + 1 )
+        {
+            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
+
+            if ( d )
+            {
+                rcu_unlock_domain(d);
+                break;
+            }
+
+            next_rx++;
+        }
+
+        console_rx = next_rx;
+
         printk("*** Serial input to DOM%d", console_rx - 1);
     }
 
-- 
2.25.1


