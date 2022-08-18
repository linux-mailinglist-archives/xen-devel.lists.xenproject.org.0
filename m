Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A13598FF5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 00:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389821.626981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnc1-0008PT-SF; Thu, 18 Aug 2022 22:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389821.626981; Thu, 18 Aug 2022 22:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOnc1-0008NO-NH; Thu, 18 Aug 2022 22:03:37 +0000
Received: by outflank-mailman (input) for mailman id 389821;
 Thu, 18 Aug 2022 22:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pc6L=YW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oOnbz-0007Yg-Vy
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 22:03:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f9da80-1f41-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 00:03:31 +0200 (CEST)
Received: from DS7PR05CA0012.namprd05.prod.outlook.com (2603:10b6:5:3b9::17)
 by CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 22:03:25 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::1b) by DS7PR05CA0012.outlook.office365.com
 (2603:10b6:5:3b9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.7 via Frontend
 Transport; Thu, 18 Aug 2022 22:03:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 22:03:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 17:03:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 15:03:24 -0700
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 18 Aug 2022 17:03:22 -0500
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
X-Inumbo-ID: 97f9da80-1f41-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLsu5RsWMYLfa541kkXJj2GsJ5OwtlbJX3kaEUlazkYcxDN644W93jIeOGFFyLtBVvFDe0D67x9ldaUHa/oZ4IZ0FVEokjy9NmQNqmf5twKKXZakUjyOIWUAFpz6JbA8+AdgbSc5SbbR+4FyDnOmvbVyKLhW4RzhMkyLKhhZu7gtx9bt4HB50pB8dZfLcs1GbBSB5j9cFrZFKJv6ZXeFxzcbqFFkwa/13o46KnraJskZayneu0v1pvRg6rZDpeVyetufwOkpPzoXGpB/nOBLJMp8XLrpyLhcQX8MuFd2gpbvL9bC3nXEN6wTkHb6MTk06Ave6FVAEUGrdyQCfBMGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqeYyHiuYR8IH6I0fvnXauCrQj23ioNU/sf43Z2rqfs=;
 b=cQGHChUL3C5O4ITpZQ33mGKowthE2b0l26Ae2m2AykeYS3/9rtmqAHOQZQWpQwUHUOJA3r83KOawblpHEWZFFK61mawWloz6SiGN2qQbg2hPPS8ttJcpj7N+geWTZSIqZGT3CM3M19LplqbKA/0Tiv5tMVAM30PmjRSW+ZXAxhawTfk7/W9sFzhs9gdj+aWeJW93XeVdqsVpBEuLZewZZQTEeLxOr+BvHETzlVN8XOVxRH2SfwWAWo0zWoMHYQTDftnm6+8lZ8t/bGkVj3gg6OmoxbKkjoOmUHZUtmmexNP3s6+G8Qur/Fpz+SjEiN9WxClIn8spAbVuwyujhPgkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqeYyHiuYR8IH6I0fvnXauCrQj23ioNU/sf43Z2rqfs=;
 b=22HR4UxvSJQf03SISn8yOqYbng/+Cyp1+mSAkjtB0OOu4gm4IHml/tJ2yGA12zyxUXMkug5arKoDYnthqT5BNP+R1SR4KXm8GqODw+jcCBfEk7p74oZ+NMtbUb/G9weJjRz1RWjFBSn5d3XxkFCH4SpRm9IpfxLizg0Gp8BTPAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <wl@xen.org>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>,
	<roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 2/3] Add licenses under LICENSES
Date: Thu, 18 Aug 2022 15:03:19 -0700
Message-ID: <20220818220320.2538705-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 832d0ac6-1d34-4639-5ac7-08da81657944
X-MS-TrafficTypeDiagnostic: CY5PR12MB6322:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uj+GN7oDMbRHxicUXmdCt1LE0haTIjZHoxzf1l73fuZXprorXOJbwbe4TETQrbRavf6vOu2tZ3QXfDn8nQ3ruDw8/eTUIjy8ZWHOR8xN3nsMXNgUYMEIGWDnLQ4BLQ1gLrdvklP1TheM6ikGxDk3bHM/4//LVWIQ8AMbIxlPL5rT3gRIngGZ75+MhC5cM+qTITEZu2K0J1Ueeh6DEPIqfo3o2405M1Q9jygN7eD930dwsR3ENoIe0GuFc8EUERqbeTHSvn3v9NzexfVebPXbwAN+9zcFCBtwgzURwzUu1qDnborSpSKCo4CrzVv2ThpK4YwRRDQ44y3LMG0jQgxEHu+5E+ciejbxTvYnb8VQu0ft/hTz4bddsyN4xI/nEE/jPecnlxHkmY4/laPXdxQ7AGvIVAlnkZwKSQ8SZyGvWa1LkBvITAJ+P/XIQRIDynwpZ0jvaDAQeBbLQwOoo560uUTvr7XXSTB8iorTXZy0CYzLfBR0IoD7Brl96ysBkEFhsuF6GnkemHUL8oYVL9AMyKqvlMLPbRgmWWxvlREkl2ixGNdQK15OLp0/WWXgKo1mprg46t92u9UGRDJcAivv40ZwQ29PKBUW6pkEqYOrDDSOJgBnm1oLcXcz1nZZOtGr1LVuUZBMR41ECWlcs2graTQElrswwuP4RFxfuwXWUTeIkC386qaCx4hpSYlutjz4Jm/+yTNbURMNa2w9+etoGo30W+LY+Xs+so79OW0vnM9Hiej3ISC8l1YiOCY3fHqzN4Mnj63vf/jU4VKgiGw/Sp2tp9O90LXHjdDUmzYQ9HW3FApmzta1kOVGen/OMb98uUBwK5IZEXr5UfQH9VseJjtAJHu8eosHpeJ9UDwQjuOkEZE3XwfdZwdP3+5xg+/+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(40470700004)(36840700001)(46966006)(82740400003)(81166007)(186003)(336012)(2616005)(1076003)(36860700001)(426003)(47076005)(356005)(83380400001)(44832011)(70206006)(5660300002)(7416002)(8936002)(30864003)(70586007)(8676002)(4326008)(40480700001)(2906002)(82310400005)(86362001)(478600001)(966005)(26005)(40460700003)(6666004)(41300700001)(316002)(6916009)(19627235002)(54906003)(36756003)(2004002)(55084003)(36900700001)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 22:03:25.1455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832d0ac6-1d34-4639-5ac7-08da81657944
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322

Add the individual licenses under a new top-level directory named
"LICENSES". Each license file includes its related SPDX tags.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 LICENSES/BSD-2-Clause       |  32 +++
 LICENSES/BSD-3-Clause       |  36 +++
 LICENSES/BSD-3-Clause-Clear |  41 +++
 LICENSES/GPL-2.0            | 359 +++++++++++++++++++++++++
 LICENSES/LGPL-2.0           | 487 ++++++++++++++++++++++++++++++++++
 LICENSES/LGPL-2.1           | 503 ++++++++++++++++++++++++++++++++++++
 LICENSES/MIT                |  30 +++
 7 files changed, 1488 insertions(+)
 create mode 100644 LICENSES/BSD-2-Clause
 create mode 100644 LICENSES/BSD-3-Clause
 create mode 100644 LICENSES/BSD-3-Clause-Clear
 create mode 100644 LICENSES/GPL-2.0
 create mode 100644 LICENSES/LGPL-2.0
 create mode 100644 LICENSES/LGPL-2.1
 create mode 100644 LICENSES/MIT

diff --git a/LICENSES/BSD-2-Clause b/LICENSES/BSD-2-Clause
new file mode 100644
index 0000000000..da366e2ce5
--- /dev/null
+++ b/LICENSES/BSD-2-Clause
@@ -0,0 +1,32 @@
+Valid-License-Identifier: BSD-2-Clause
+SPDX-URL: https://spdx.org/licenses/BSD-2-Clause.html
+Usage-Guide:
+  To use the BSD 2-clause "Simplified" License put the following SPDX
+  tag/value pair into a comment according to the placement guidelines in
+  the licensing rules documentation:
+    SPDX-License-Identifier: BSD-2-Clause
+License-Text:
+
+Copyright (c) <year> <owner> . All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/LICENSES/BSD-3-Clause b/LICENSES/BSD-3-Clause
new file mode 100644
index 0000000000..34c7f057c8
--- /dev/null
+++ b/LICENSES/BSD-3-Clause
@@ -0,0 +1,36 @@
+Valid-License-Identifier: BSD-3-Clause
+SPDX-URL: https://spdx.org/licenses/BSD-3-Clause.html
+Usage-Guide:
+  To use the BSD 3-clause "New" or "Revised" License put the following SPDX
+  tag/value pair into a comment according to the placement guidelines in
+  the licensing rules documentation:
+    SPDX-License-Identifier: BSD-3-Clause
+License-Text:
+
+Copyright (c) <year> <owner> . All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+
+3. Neither the name of the copyright holder nor the names of its
+   contributors may be used to endorse or promote products derived from this
+   software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/LICENSES/BSD-3-Clause-Clear b/LICENSES/BSD-3-Clause-Clear
new file mode 100644
index 0000000000..e53b56092b
--- /dev/null
+++ b/LICENSES/BSD-3-Clause-Clear
@@ -0,0 +1,41 @@
+Valid-License-Identifier: BSD-3-Clause-Clear
+SPDX-URL: https://spdx.org/licenses/BSD-3-Clause-Clear.html
+Usage-Guide:
+  To use the BSD 3-clause "Clear" License put the following SPDX
+  tag/value pair into a comment according to the placement guidelines in
+  the licensing rules documentation:
+    SPDX-License-Identifier: BSD-3-Clause-Clear
+License-Text:
+
+The Clear BSD License
+
+Copyright (c) [xxxx]-[xxxx] [Owner Organization]
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted (subject to the limitations in the disclaimer
+below) provided that the following conditions are met:
+
+ * Redistributions of source code must retain the above copyright notice,
+   this list of conditions and the following disclaimer.
+
+ * Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+
+ * Neither the name of [Owner Organization] nor the names of its
+   contributors may be used to endorse or promote products derived from
+   this software without specific prior written permission.
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED BY
+THIS LICENSE. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
+NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
+OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
+OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
new file mode 100644
index 0000000000..ff0812fd89
--- /dev/null
+++ b/LICENSES/GPL-2.0
@@ -0,0 +1,359 @@
+Valid-License-Identifier: GPL-2.0
+Valid-License-Identifier: GPL-2.0-only
+Valid-License-Identifier: GPL-2.0+
+Valid-License-Identifier: GPL-2.0-or-later
+SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
+Usage-Guide:
+  To use this license in source code, put one of the following SPDX
+  tag/value pairs into a comment according to the placement
+  guidelines in the licensing rules documentation.
+  For 'GNU General Public License (GPL) version 2 only' use:
+    SPDX-License-Identifier: GPL-2.0
+  or
+    SPDX-License-Identifier: GPL-2.0-only
+  For 'GNU General Public License (GPL) version 2 or any later version' use:
+    SPDX-License-Identifier: GPL-2.0+
+  or
+    SPDX-License-Identifier: GPL-2.0-or-later
+License-Text:
+
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/LICENSES/LGPL-2.0 b/LICENSES/LGPL-2.0
new file mode 100644
index 0000000000..957d798fe0
--- /dev/null
+++ b/LICENSES/LGPL-2.0
@@ -0,0 +1,487 @@
+Valid-License-Identifier: LGPL-2.0
+Valid-License-Identifier: LGPL-2.0+
+SPDX-URL: https://spdx.org/licenses/LGPL-2.0.html
+Usage-Guide:
+  To use this license in source code, put one of the following SPDX
+  tag/value pairs into a comment according to the placement
+  guidelines in the licensing rules documentation.
+  For 'GNU Library General Public License (LGPL) version 2.0 only' use:
+    SPDX-License-Identifier: LGPL-2.0
+  For 'GNU Library General Public License (LGPL) version 2.0 or any later
+  version' use:
+    SPDX-License-Identifier: LGPL-2.0+
+License-Text:
+
+GNU LIBRARY GENERAL PUBLIC LICENSE
+Version 2, June 1991
+
+Copyright (C) 1991 Free Software Foundation, Inc.
+51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
+
+Everyone is permitted to copy and distribute verbatim copies of this
+license document, but changing it is not allowed.
+
+[This is the first released version of the library GPL. It is numbered 2
+because it goes with version 2 of the ordinary GPL.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to
+share and change it. By contrast, the GNU General Public Licenses are
+intended to guarantee your freedom to share and change free software--to
+make sure the software is free for all its users.
+
+This license, the Library General Public License, applies to some specially
+designated Free Software Foundation software, and to any other libraries
+whose authors decide to use it. You can use it for your libraries, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish), that you receive source code or can get it if you want it, that you
+can change the software or use pieces of it in new free programs; and that
+you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These
+restrictions translate to certain responsibilities for you if you
+distribute copies of the library, or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You
+must make sure that they, too, receive or can get the source code. If you
+link a program with the library, you must provide complete object files to
+the recipients so that they can relink them with the library, after making
+changes to the library and recompiling it. And you must show them these
+terms so they know their rights.
+
+Our method of protecting your rights has two steps: (1) copyright the
+library, and (2) offer you this license which gives you legal permission to
+copy, distribute and/or modify the library.
+
+Also, for each distributor's protection, we want to make certain that
+everyone understands that there is no warranty for this free library. If
+the library is modified by someone else and passed on, we want its
+recipients to know that what they have is not the original version, so that
+any problems introduced by others will not reflect on the original authors'
+reputations.
+
+Finally, any free program is threatened constantly by software patents. We
+wish to avoid the danger that companies distributing free software will
+individually obtain patent licenses, thus in effect transforming the
+program into proprietary software. To prevent this, we have made it clear
+that any patent must be licensed for everyone's free use or not licensed at
+all.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License, which was designed for utility programs. This
+license, the GNU Library General Public License, applies to certain
+designated libraries. This license is quite different from the ordinary
+one; be sure to read it in full, and don't assume that anything in it is
+the same as in the ordinary license.
+
+The reason we have a separate public license for some libraries is that
+they blur the distinction we usually make between modifying or adding to a
+program and simply using it. Linking a program with a library, without
+changing the library, is in some sense simply using the library, and is
+analogous to running a utility program or application program. However, in
+a textual and legal sense, the linked executable is a combined work, a
+derivative of the original library, and the ordinary General Public License
+treats it as such.
+
+Because of this blurred distinction, using the ordinary General Public
+License for libraries did not effectively promote software sharing, because
+most developers did not use the libraries. We concluded that weaker
+conditions might promote sharing better.
+
+However, unrestricted linking of non-free programs would deprive the users
+of those programs of all benefit from the free status of the libraries
+themselves. This Library General Public License is intended to permit
+developers of non-free programs to use free libraries, while preserving
+your freedom as a user of such programs to change the free libraries that
+are incorporated in them. (We have not seen how to achieve this as regards
+changes in header files, but we have achieved it as regards changes in the
+actual functions of the Library.) The hope is that this will lead to faster
+development of free libraries.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code
+derived from the library, while the latter only works together with the
+library.
+
+Note that it is possible for a library to be covered by the ordinary
+General Public License rather than by this special one.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library which contains a
+   notice placed by the copyright holder or other authorized party saying
+   it may be distributed under the terms of this Library General Public
+   License (also called "this License"). Each licensee is addressed as
+   "you".
+
+   A "library" means a collection of software functions and/or data
+   prepared so as to be conveniently linked with application programs
+   (which use some of those functions and data) to form executables.
+
+   The "Library", below, refers to any such software library or work which
+   has been distributed under these terms. A "work based on the Library"
+   means either the Library or any derivative work under copyright law:
+   that is to say, a work containing the Library or a portion of it, either
+   verbatim or with modifications and/or translated straightforwardly into
+   another language. (Hereinafter, translation is included without
+   limitation in the term "modification".)
+
+   "Source code" for a work means the preferred form of the work for making
+   modifications to it. For a library, complete source code means all the
+   source code for all modules it contains, plus any associated interface
+   definition files, plus the scripts used to control compilation and
+   installation of the library.
+
+   Activities other than copying, distribution and modification are not
+   covered by this License; they are outside its scope. The act of running
+   a program using the Library is not restricted, and output from such a
+   program is covered only if its contents constitute a work based on the
+   Library (independent of the use of the Library in a tool for writing
+   it). Whether that is true depends on what the Library does and what the
+   program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete
+   source code as you receive it, in any medium, provided that you
+   conspicuously and appropriately publish on each copy an appropriate
+   copyright notice and disclaimer of warranty; keep intact all the notices
+   that refer to this License and to the absence of any warranty; and
+   distribute a copy of this License along with the Library.
+
+   You may charge a fee for the physical act of transferring a copy, and
+   you may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+   thus forming a work based on the Library, and copy and distribute such
+   modifications or work under the terms of Section 1 above, provided that
+   you also meet all of these conditions:
+
+   a) The modified work must itself be a software library.
+
+   b) You must cause the files modified to carry prominent notices stating
+      that you changed the files and the date of any change.
+
+   c) You must cause the whole of the work to be licensed at no charge to
+      all third parties under the terms of this License.
+
+   d) If a facility in the modified Library refers to a function or a table
+      of data to be supplied by an application program that uses the
+      facility, other than as an argument passed when the facility is
+      invoked, then you must make a good faith effort to ensure that, in
+      the event an application does not supply such function or table, the
+      facility still operates, and performs whatever part of its purpose
+      remains meaningful.
+
+   (For example, a function in a library to compute square roots has a
+   purpose that is entirely well-defined independent of the
+   application. Therefore, Subsection 2d requires that any
+   application-supplied function or table used by this function must be
+   optional: if the application does not supply it, the square root
+   function must still compute square roots.)
+
+   These requirements apply to the modified work as a whole. If
+   identifiable sections of that work are not derived from the Library, and
+   can be reasonably considered independent and separate works in
+   themselves, then this License, and its terms, do not apply to those
+   sections when you distribute them as separate works. But when you
+   distribute the same sections as part of a whole which is a work based on
+   the Library, the distribution of the whole must be on the terms of this
+   License, whose permissions for other licensees extend to the entire
+   whole, and thus to each and every part regardless of who wrote it.
+
+   Thus, it is not the intent of this section to claim rights or contest
+   your rights to work written entirely by you; rather, the intent is to
+   exercise the right to control the distribution of derivative or
+   collective works based on the Library.
+
+   In addition, mere aggregation of another work not based on the Library
+   with the Library (or with a work based on the Library) on a volume of a
+   storage or distribution medium does not bring the other work under the
+   scope of this License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public
+   License instead of this License to a given copy of the Library. To do
+   this, you must alter all the notices that refer to this License, so that
+   they refer to the ordinary GNU General Public License, version 2,
+   instead of to this License. (If a newer version than version 2 of the
+   ordinary GNU General Public License has appeared, then you can specify
+   that version instead if you wish.) Do not make any other change in these
+   notices.
+
+   Once this change is made in a given copy, it is irreversible for that
+   copy, so the ordinary GNU General Public License applies to all
+   subsequent copies and derivative works made from that copy.
+
+   This option is useful when you wish to copy part of the code of the
+   Library into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+   it, under Section 2) in object code or executable form under the terms
+   of Sections 1 and 2 above provided that you accompany it with the
+   complete corresponding machine-readable source code, which must be
+   distributed under the terms of Sections 1 and 2 above on a medium
+   customarily used for software interchange.
+
+   If distribution of object code is made by offering access to copy from a
+   designated place, then offering equivalent access to copy the source
+   code from the same place satisfies the requirement to distribute the
+   source code, even though third parties are not compelled to copy the
+   source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+   is designed to work with the Library by being compiled or linked with
+   it, is called a "work that uses the Library". Such a work, in isolation,
+   is not a derivative work of the Library, and therefore falls outside the
+   scope of this License.
+
+   However, linking a "work that uses the Library" with the Library creates
+   an executable that is a derivative of the Library (because it contains
+   portions of the Library), rather than a "work that uses the
+   library". The executable is therefore covered by this License. Section 6
+   states terms for distribution of such executables.
+
+   When a "work that uses the Library" uses material from a header file
+   that is part of the Library, the object code for the work may be a
+   derivative work of the Library even though the source code is
+   not. Whether this is true is especially significant if the work can be
+   linked without the Library, or if the work is itself a library. The
+   threshold for this to be true is not precisely defined by law.
+
+   If such an object file uses only numerical parameters, data structure
+   layouts and accessors, and small macros and small inline functions (ten
+   lines or less in length), then the use of the object file is
+   unrestricted, regardless of whether it is legally a derivative
+   work. (Executables containing this object code plus portions of the
+   Library will still fall under Section 6.)
+
+   Otherwise, if the work is a derivative of the Library, you may
+   distribute the object code for the work under the terms of Section
+   6. Any executables containing that work also fall under Section 6,
+   whether or not they are linked directly with the Library itself.
+
+6. As an exception to the Sections above, you may also compile or link a
+   "work that uses the Library" with the Library to produce a work
+   containing portions of the Library, and distribute that work under terms
+   of your choice, provided that the terms permit modification of the work
+   for the customer's own use and reverse engineering for debugging such
+   modifications.
+
+   You must give prominent notice with each copy of the work that the
+   Library is used in it and that the Library and its use are covered by
+   this License. You must supply a copy of this License. If the work during
+   execution displays copyright notices, you must include the copyright
+   notice for the Library among them, as well as a reference directing the
+   user to the copy of this License. Also, you must do one of these things:
+
+   a) Accompany the work with the complete corresponding machine-readable
+      source code for the Library including whatever changes were used in
+      the work (which must be distributed under Sections 1 and 2 above);
+      and, if the work is an executable linked with the Library, with the
+      complete machine-readable "work that uses the Library", as object
+      code and/or source code, so that the user can modify the Library and
+      then relink to produce a modified executable containing the modified
+      Library. (It is understood that the user who changes the contents of
+      definitions files in the Library will not necessarily be able to
+      recompile the application to use the modified definitions.)
+
+   b) Accompany the work with a written offer, valid for at least three
+      years, to give the same user the materials specified in Subsection
+      6a, above, for a charge no more than the cost of performing this
+      distribution.
+
+   c) If distribution of the work is made by offering access to copy from a
+      designated place, offer equivalent access to copy the above specified
+      materials from the same place.
+
+   d) Verify that the user has already received a copy of these materials
+      or that you have already sent this user a copy.
+
+   For an executable, the required form of the "work that uses the Library"
+   must include any data and utility programs needed for reproducing the
+   executable from it. However, as a special exception, the source code
+   distributed need not include anything that is normally distributed (in
+   either source or binary form) with the major components (compiler,
+   kernel, and so on) of the operating system on which the executable runs,
+   unless that component itself accompanies the executable.
+
+   It may happen that this requirement contradicts the license restrictions
+   of other proprietary libraries that do not normally accompany the
+   operating system. Such a contradiction means you cannot use both them
+   and the Library together in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library
+   side-by-side in a single library together with other library facilities
+   not covered by this License, and distribute such a combined library,
+   provided that the separate distribution of the work based on the Library
+   and of the other library facilities is otherwise permitted, and provided
+   that you do these two things:
+
+   a) Accompany the combined library with a copy of the same work based on
+      the Library, uncombined with any other library facilities. This must
+      be distributed under the terms of the Sections above.
+
+   b) Give prominent notice with the combined library of the fact that part
+      of it is a work based on the Library, and explaining where to find
+      the accompanying uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the
+   Library except as expressly provided under this License. Any attempt
+   otherwise to copy, modify, sublicense, link with, or distribute the
+   Library is void, and will automatically terminate your rights under this
+   License. However, parties who have received copies, or rights, from you
+   under this License will not have their licenses terminated so long as
+   such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+   it. However, nothing else grants you permission to modify or distribute
+   the Library or its derivative works. These actions are prohibited by law
+   if you do not accept this License. Therefore, by modifying or
+   distributing the Library (or any work based on the Library), you
+   indicate your acceptance of this License to do so, and all its terms and
+   conditions for copying, distributing or modifying the Library or works
+   based on it.
+
+10. Each time you redistribute the Library (or any work based on the
+    Library), the recipient automatically receives a license from the
+    original licensor to copy, distribute, link with or modify the Library
+    subject to these terms and conditions. You may not impose any further
+    restrictions on the recipients' exercise of the rights granted
+    herein. You are not responsible for enforcing compliance by third
+    parties to this License.
+
+11. If, as a consequence of a court judgment or allegation of patent
+    infringement or for any other reason (not limited to patent issues),
+    conditions are imposed on you (whether by court order, agreement or
+    otherwise) that contradict the conditions of this License, they do not
+    excuse you from the conditions of this License. If you cannot
+    distribute so as to satisfy simultaneously your obligations under this
+    License and any other pertinent obligations, then as a consequence you
+    may not distribute the Library at all. For example, if a patent license
+    would not permit royalty-free redistribution of the Library by all
+    those who receive copies directly or indirectly through you, then the
+    only way you could satisfy both it and this License would be to refrain
+    entirely from distribution of the Library.
+
+    If any portion of this section is held invalid or unenforceable under
+    any particular circumstance, the balance of the section is intended to
+    apply, and the section as a whole is intended to apply in other
+    circumstances.
+
+    It is not the purpose of this section to induce you to infringe any
+    patents or other property right claims or to contest validity of any
+    such claims; this section has the sole purpose of protecting the
+    integrity of the free software distribution system which is implemented
+    by public license practices. Many people have made generous
+    contributions to the wide range of software distributed through that
+    system in reliance on consistent application of that system; it is up
+    to the author/donor to decide if he or she is willing to distribute
+    software through any other system and a licensee cannot impose that
+    choice.
+
+    This section is intended to make thoroughly clear what is believed to
+    be a consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+    countries either by patents or by copyrighted interfaces, the original
+    copyright holder who places the Library under this License may add an
+    explicit geographical distribution limitation excluding those
+    countries, so that distribution is permitted only in or among countries
+    not thus excluded. In such case, this License incorporates the
+    limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+    the Library General Public License from time to time. Such new versions
+    will be similar in spirit to the present version, but may differ in
+    detail to address new problems or concerns.
+
+    Each version is given a distinguishing version number. If the Library
+    specifies a version number of this License which applies to it and "any
+    later version", you have the option of following the terms and
+    conditions either of that version or of any later version published by
+    the Free Software Foundation. If the Library does not specify a license
+    version number, you may choose any version ever published by the Free
+    Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free
+    programs whose distribution conditions are incompatible with these,
+    write to the author to ask for permission. For software which is
+    copyrighted by the Free Software Foundation, write to the Free Software
+    Foundation; we sometimes make exceptions for this. Our decision will be
+    guided by the two goals of preserving the free status of all
+    derivatives of our free software and of promoting the sharing and reuse
+    of software generally.
+
+NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+    FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
+    OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+    PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+    EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
+    ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH
+    YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+    NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+    WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+    REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
+    DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
+    DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY
+    (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+    INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF
+    THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR
+    OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest
+possible use to the public, we recommend making it free software that
+everyone can redistribute and change. You can do so by permitting
+redistribution under these terms (or, alternatively, under the terms of the
+ordinary General Public License).
+
+To apply these terms, attach the following notices to the library. It is
+safest to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least the
+"copyright" line and a pointer to where the full notice is found.
+
+one line to give the library's name and an idea of what it does.
+Copyright (C) year name of author
+
+This library is free software; you can redistribute it and/or modify it
+under the terms of the GNU Library General Public License as published by
+the Free Software Foundation; either version 2 of the License, or (at your
+option) any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public
+License for more details.
+
+You should have received a copy of the GNU Library General Public License
+along with this library; if not, write to the Free Software Foundation,
+Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the library, if
+necessary. Here is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+the library `Frob' (a library for tweaking knobs) written
+by James Random Hacker.
+
+signature of Ty Coon, 1 April 1990
+Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/LICENSES/LGPL-2.1 b/LICENSES/LGPL-2.1
new file mode 100644
index 0000000000..27bb4342a3
--- /dev/null
+++ b/LICENSES/LGPL-2.1
@@ -0,0 +1,503 @@
+Valid-License-Identifier: LGPL-2.1
+Valid-License-Identifier: LGPL-2.1+
+SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
+Usage-Guide:
+  To use this license in source code, put one of the following SPDX
+  tag/value pairs into a comment according to the placement
+  guidelines in the licensing rules documentation.
+  For 'GNU Lesser General Public License (LGPL) version 2.1 only' use:
+    SPDX-License-Identifier: LGPL-2.1
+  For 'GNU Lesser General Public License (LGPL) version 2.1 or any later
+  version' use:
+    SPDX-License-Identifier: LGPL-2.1+
+License-Text:
+
+GNU LESSER GENERAL PUBLIC LICENSE
+Version 2.1, February 1999
+
+Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this
+license document, but changing it is not allowed.
+
+[This is the first released version of the Lesser GPL. It also counts as
+the successor of the GNU Library Public License, version 2, hence the
+version number 2.1.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to
+share and change it. By contrast, the GNU General Public Licenses are
+intended to guarantee your freedom to share and change free software--to
+make sure the software is free for all its users.
+
+This license, the Lesser General Public License, applies to some specially
+designated software packages--typically libraries--of the Free Software
+Foundation and other authors who decide to use it. You can use it too, but
+we suggest you first think carefully about whether this license or the
+ordinary General Public License is the better strategy to use in any
+particular case, based on the explanations below.
+
+When we speak of free software, we are referring to freedom of use, not
+price. Our General Public Licenses are designed to make sure that you have
+the freedom to distribute copies of free software (and charge for this
+service if you wish); that you receive source code or can get it if you
+want it; that you can change the software and use pieces of it in new free
+programs; and that you are informed that you can do these things.
+
+To protect your rights, we need to make restrictions that forbid
+distributors to deny you these rights or to ask you to surrender these
+rights. These restrictions translate to certain responsibilities for you if
+you distribute copies of the library or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You
+must make sure that they, too, receive or can get the source code. If you
+link other code with the library, you must provide complete object files to
+the recipients, so that they can relink them with the library after making
+changes to the library and recompiling it. And you must show them these
+terms so they know their rights.
+
+We protect your rights with a two-step method: (1) we copyright the
+library, and (2) we offer you this license, which gives you legal
+permission to copy, distribute and/or modify the library.
+
+To protect each distributor, we want to make it very clear that there is no
+warranty for the free library. Also, if the library is modified by someone
+else and passed on, the recipients should know that what they have is not
+the original version, so that the original author's reputation will not be
+affected by problems that might be introduced by others.
+
+Finally, software patents pose a constant threat to the existence of any
+free program. We wish to make sure that a company cannot effectively
+restrict the users of a free program by obtaining a restrictive license
+from a patent holder. Therefore, we insist that any patent license obtained
+for a version of the library must be consistent with the full freedom of
+use specified in this license.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License. This license, the GNU Lesser General Public
+License, applies to certain designated libraries, and is quite different
+from the ordinary General Public License. We use this license for certain
+libraries in order to permit linking those libraries into non-free
+programs.
+
+When a program is linked with a library, whether statically or using a
+shared library, the combination of the two is legally speaking a combined
+work, a derivative of the original library. The ordinary General Public
+License therefore permits such linking only if the entire combination fits
+its criteria of freedom. The Lesser General Public License permits more lax
+criteria for linking other code with the library.
+
+We call this license the "Lesser" General Public License because it does
+Less to protect the user's freedom than the ordinary General Public
+License. It also provides other free software developers Less of an
+advantage over competing non-free programs. These disadvantages are the
+reason we use the ordinary General Public License for many
+libraries. However, the Lesser license provides advantages in certain
+special circumstances.
+
+For example, on rare occasions, there may be a special need to encourage
+the widest possible use of a certain library, so that it becomes a de-facto
+standard. To achieve this, non-free programs must be allowed to use the
+library. A more frequent case is that a free library does the same job as
+widely used non-free libraries. In this case, there is little to gain by
+limiting the free library to free software only, so we use the Lesser
+General Public License.
+
+In other cases, permission to use a particular library in non-free programs
+enables a greater number of people to use a large body of free
+software. For example, permission to use the GNU C Library in non-free
+programs enables many more people to use the whole GNU operating system, as
+well as its variant, the GNU/Linux operating system.
+
+Although the Lesser General Public License is Less protective of the users'
+freedom, it does ensure that the user of a program that is linked with the
+Library has the freedom and the wherewithal to run that program using a
+modified version of the Library.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code
+derived from the library, whereas the latter must be combined with the
+library in order to run.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library or other program
+   which contains a notice placed by the copyright holder or other
+   authorized party saying it may be distributed under the terms of this
+   Lesser General Public License (also called "this License"). Each
+   licensee is addressed as "you".
+
+   A "library" means a collection of software functions and/or data
+   prepared so as to be conveniently linked with application programs
+   (which use some of those functions and data) to form executables.
+
+   The "Library", below, refers to any such software library or work which
+   has been distributed under these terms. A "work based on the Library"
+   means either the Library or any derivative work under copyright law:
+   that is to say, a work containing the Library or a portion of it, either
+   verbatim or with modifications and/or translated straightforwardly into
+   another language. (Hereinafter, translation is included without
+   limitation in the term "modification".)
+
+   "Source code" for a work means the preferred form of the work for making
+   modifications to it. For a library, complete source code means all the
+   source code for all modules it contains, plus any associated interface
+   definition files, plus the scripts used to control compilation and
+   installation of the library.
+
+    Activities other than copying, distribution and modification are not
+    covered by this License; they are outside its scope. The act of running
+    a program using the Library is not restricted, and output from such a
+    program is covered only if its contents constitute a work based on the
+    Library (independent of the use of the Library in a tool for writing
+    it). Whether that is true depends on what the Library does and what the
+    program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete
+   source code as you receive it, in any medium, provided that you
+   conspicuously and appropriately publish on each copy an appropriate
+   copyright notice and disclaimer of warranty; keep intact all the notices
+   that refer to this License and to the absence of any warranty; and
+   distribute a copy of this License along with the Library.
+
+   You may charge a fee for the physical act of transferring a copy, and
+   you may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+   thus forming a work based on the Library, and copy and distribute such
+   modifications or work under the terms of Section 1 above, provided that
+   you also meet all of these conditions:
+
+   a) The modified work must itself be a software library.
+
+   b) You must cause the files modified to carry prominent notices stating
+      that you changed the files and the date of any change.
+
+   c) You must cause the whole of the work to be licensed at no charge to
+      all third parties under the terms of this License.
+
+   d) If a facility in the modified Library refers to a function or a table
+      of data to be supplied by an application program that uses the
+      facility, other than as an argument passed when the facility is
+      invoked, then you must make a good faith effort to ensure that, in
+      the event an application does not supply such function or table, the
+      facility still operates, and performs whatever part of its purpose
+      remains meaningful.
+
+   (For example, a function in a library to compute square roots has a
+    purpose that is entirely well-defined independent of the
+    application. Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must be
+    optional: if the application does not supply it, the square root
+    function must still compute square roots.)
+
+   These requirements apply to the modified work as a whole. If
+   identifiable sections of that work are not derived from the Library, and
+   can be reasonably considered independent and separate works in
+   themselves, then this License, and its terms, do not apply to those
+   sections when you distribute them as separate works. But when you
+   distribute the same sections as part of a whole which is a work based on
+   the Library, the distribution of the whole must be on the terms of this
+   License, whose permissions for other licensees extend to the entire
+   whole, and thus to each and every part regardless of who wrote it.
+
+   Thus, it is not the intent of this section to claim rights or contest
+   your rights to work written entirely by you; rather, the intent is to
+   exercise the right to control the distribution of derivative or
+   collective works based on the Library.
+
+   In addition, mere aggregation of another work not based on the Library
+   with the Library (or with a work based on the Library) on a volume of a
+   storage or distribution medium does not bring the other work under the
+   scope of this License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public
+   License instead of this License to a given copy of the Library. To do
+   this, you must alter all the notices that refer to this License, so that
+   they refer to the ordinary GNU General Public License, version 2,
+   instead of to this License. (If a newer version than version 2 of the
+   ordinary GNU General Public License has appeared, then you can specify
+   that version instead if you wish.) Do not make any other change in these
+   notices.
+
+   Once this change is made in a given copy, it is irreversible for that
+   copy, so the ordinary GNU General Public License applies to all
+   subsequent copies and derivative works made from that copy.
+
+   This option is useful when you wish to copy part of the code of the
+   Library into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+   it, under Section 2) in object code or executable form under the terms
+   of Sections 1 and 2 above provided that you accompany it with the
+   complete corresponding machine-readable source code, which must be
+   distributed under the terms of Sections 1 and 2 above on a medium
+   customarily used for software interchange.
+
+   If distribution of object code is made by offering access to copy from a
+   designated place, then offering equivalent access to copy the source
+   code from the same place satisfies the requirement to distribute the
+   source code, even though third parties are not compelled to copy the
+   source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+   is designed to work with the Library by being compiled or linked with
+   it, is called a "work that uses the Library". Such a work, in isolation,
+   is not a derivative work of the Library, and therefore falls outside the
+   scope of this License.
+
+   However, linking a "work that uses the Library" with the Library creates
+   an executable that is a derivative of the Library (because it contains
+   portions of the Library), rather than a "work that uses the
+   library". The executable is therefore covered by this License. Section 6
+   states terms for distribution of such executables.
+
+   When a "work that uses the Library" uses material from a header file
+   that is part of the Library, the object code for the work may be a
+   derivative work of the Library even though the source code is
+   not. Whether this is true is especially significant if the work can be
+   linked without the Library, or if the work is itself a library. The
+   threshold for this to be true is not precisely defined by law.
+
+   If such an object file uses only numerical parameters, data structure
+   layouts and accessors, and small macros and small inline functions (ten
+   lines or less in length), then the use of the object file is
+   unrestricted, regardless of whether it is legally a derivative
+   work. (Executables containing this object code plus portions of the
+   Library will still fall under Section 6.)
+
+   Otherwise, if the work is a derivative of the Library, you may
+   distribute the object code for the work under the terms of Section
+   6. Any executables containing that work also fall under Section 6,
+   whether or not they are linked directly with the Library itself.
+
+6. As an exception to the Sections above, you may also combine or link a
+   "work that uses the Library" with the Library to produce a work
+   containing portions of the Library, and distribute that work under terms
+   of your choice, provided that the terms permit modification of the work
+   for the customer's own use and reverse engineering for debugging such
+   modifications.
+
+   You must give prominent notice with each copy of the work that the
+   Library is used in it and that the Library and its use are covered by
+   this License. You must supply a copy of this License. If the work during
+   execution displays copyright notices, you must include the copyright
+   notice for the Library among them, as well as a reference directing the
+   user to the copy of this License. Also, you must do one of these things:
+
+   a) Accompany the work with the complete corresponding machine-readable
+      source code for the Library including whatever changes were used in
+      the work (which must be distributed under Sections 1 and 2 above);
+      and, if the work is an executable linked with the Library, with the
+      complete machine-readable "work that uses the Library", as object
+      code and/or source code, so that the user can modify the Library and
+      then relink to produce a modified executable containing the modified
+      Library. (It is understood that the user who changes the contents of
+      definitions files in the Library will not necessarily be able to
+      recompile the application to use the modified definitions.)
+
+   b) Use a suitable shared library mechanism for linking with the
+      Library. A suitable mechanism is one that (1) uses at run time a copy
+      of the library already present on the user's computer system, rather
+      than copying library functions into the executable, and (2) will
+      operate properly with a modified version of the library, if the user
+      installs one, as long as the modified version is interface-compatible
+      with the version that the work was made with.
+
+   c) Accompany the work with a written offer, valid for at least three
+      years, to give the same user the materials specified in Subsection
+      6a, above, for a charge no more than the cost of performing this
+      distribution.
+
+   d) If distribution of the work is made by offering access to copy from a
+      designated place, offer equivalent access to copy the above specified
+      materials from the same place.
+
+   e) Verify that the user has already received a copy of these materials
+      or that you have already sent this user a copy.
+
+   For an executable, the required form of the "work that uses the Library"
+   must include any data and utility programs needed for reproducing the
+   executable from it. However, as a special exception, the materials to be
+   distributed need not include anything that is normally distributed (in
+   either source or binary form) with the major components (compiler,
+   kernel, and so on) of the operating system on which the executable runs,
+   unless that component itself accompanies the executable.
+
+   It may happen that this requirement contradicts the license restrictions
+   of other proprietary libraries that do not normally accompany the
+   operating system. Such a contradiction means you cannot use both them
+   and the Library together in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library
+   side-by-side in a single library together with other library facilities
+   not covered by this License, and distribute such a combined library,
+   provided that the separate distribution of the work based on the Library
+   and of the other library facilities is otherwise permitted, and provided
+   that you do these two things:
+
+   a) Accompany the combined library with a copy of the same work based on
+      the Library, uncombined with any other library facilities. This must
+      be distributed under the terms of the Sections above.
+
+   b) Give prominent notice with the combined library of the fact that part
+      of it is a work based on the Library, and explaining where to find
+      the accompanying uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the
+   Library except as expressly provided under this License. Any attempt
+   otherwise to copy, modify, sublicense, link with, or distribute the
+   Library is void, and will automatically terminate your rights under this
+   License. However, parties who have received copies, or rights, from you
+   under this License will not have their licenses terminated so long as
+   such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+   it. However, nothing else grants you permission to modify or distribute
+   the Library or its derivative works. These actions are prohibited by law
+   if you do not accept this License. Therefore, by modifying or
+   distributing the Library (or any work based on the Library), you
+   indicate your acceptance of this License to do so, and all its terms and
+   conditions for copying, distributing or modifying the Library or works
+   based on it.
+
+10. Each time you redistribute the Library (or any work based on the
+    Library), the recipient automatically receives a license from the
+    original licensor to copy, distribute, link with or modify the Library
+    subject to these terms and conditions. You may not impose any further
+    restrictions on the recipients' exercise of the rights granted
+    herein. You are not responsible for enforcing compliance by third
+    parties with this License.
+
+11. If, as a consequence of a court judgment or allegation of patent
+    infringement or for any other reason (not limited to patent issues),
+    conditions are imposed on you (whether by court order, agreement or
+    otherwise) that contradict the conditions of this License, they do not
+    excuse you from the conditions of this License. If you cannot
+    distribute so as to satisfy simultaneously your obligations under this
+    License and any other pertinent obligations, then as a consequence you
+    may not distribute the Library at all. For example, if a patent license
+    would not permit royalty-free redistribution of the Library by all
+    those who receive copies directly or indirectly through you, then the
+    only way you could satisfy both it and this License would be to refrain
+    entirely from distribution of the Library.
+
+    If any portion of this section is held invalid or unenforceable under
+    any particular circumstance, the balance of the section is intended to
+    apply, and the section as a whole is intended to apply in other
+    circumstances.
+
+    It is not the purpose of this section to induce you to infringe any
+    patents or other property right claims or to contest validity of any
+    such claims; this section has the sole purpose of protecting the
+    integrity of the free software distribution system which is implemented
+    by public license practices. Many people have made generous
+    contributions to the wide range of software distributed through that
+    system in reliance on consistent application of that system; it is up
+    to the author/donor to decide if he or she is willing to distribute
+    software through any other system and a licensee cannot impose that
+    choice.
+
+    This section is intended to make thoroughly clear what is believed to
+    be a consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+    countries either by patents or by copyrighted interfaces, the original
+    copyright holder who places the Library under this License may add an
+    explicit geographical distribution limitation excluding those
+    countries, so that distribution is permitted only in or among countries
+    not thus excluded. In such case, this License incorporates the
+    limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+    the Lesser General Public License from time to time. Such new versions
+    will be similar in spirit to the present version, but may differ in
+    detail to address new problems or concerns.
+
+    Each version is given a distinguishing version number. If the Library
+    specifies a version number of this License which applies to it and "any
+    later version", you have the option of following the terms and
+    conditions either of that version or of any later version published by
+    the Free Software Foundation. If the Library does not specify a license
+    version number, you may choose any version ever published by the Free
+    Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free
+    programs whose distribution conditions are incompatible with these,
+    write to the author to ask for permission. For software which is
+    copyrighted by the Free Software Foundation, write to the Free Software
+    Foundation; we sometimes make exceptions for this. Our decision will be
+    guided by the two goals of preserving the free status of all
+    derivatives of our free software and of promoting the sharing and reuse
+    of software generally.
+
+NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+    FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
+    OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+    PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+    EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
+    ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH
+    YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
+    NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+    WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+    REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
+    DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
+    DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY
+    (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+    INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF
+    THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR
+    OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest
+possible use to the public, we recommend making it free software that
+everyone can redistribute and change. You can do so by permitting
+redistribution under these terms (or, alternatively, under the terms of the
+ordinary General Public License).
+
+To apply these terms, attach the following notices to the library. It is
+safest to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least the
+"copyright" line and a pointer to where the full notice is found.
+
+one line to give the library's name and an idea of what it does.
+Copyright (C) year name of author
+
+This library is free software; you can redistribute it and/or modify it
+under the terms of the GNU Lesser General Public License as published by
+the Free Software Foundation; either version 2.1 of the License, or (at
+your option) any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
+for more details.
+
+You should have received a copy of the GNU Lesser General Public License
+along with this library; if not, write to the Free Software Foundation,
+Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA Also add
+information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the library, if
+necessary. Here is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+the library `Frob' (a library for tweaking knobs) written
+by James Random Hacker.
+
+signature of Ty Coon, 1 April 1990
+Ty Coon, President of Vice
+That's all there is to it!
diff --git a/LICENSES/MIT b/LICENSES/MIT
new file mode 100644
index 0000000000..f33a68ceb3
--- /dev/null
+++ b/LICENSES/MIT
@@ -0,0 +1,30 @@
+Valid-License-Identifier: MIT
+SPDX-URL: https://spdx.org/licenses/MIT.html
+Usage-Guide:
+  To use the MIT License put the following SPDX tag/value pair into a
+  comment according to the placement guidelines in the licensing rules
+  documentation:
+    SPDX-License-Identifier: MIT
+License-Text:
+
+MIT License
+
+Copyright (c) <year> <copyright holders>
+
+Permission is hereby granted, free of charge, to any person obtaining a
+copy of this software and associated documentation files (the "Software"),
+to deal in the Software without restriction, including without limitation
+the rights to use, copy, modify, merge, publish, distribute, sublicense,
+and/or sell copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
-- 
2.25.1


