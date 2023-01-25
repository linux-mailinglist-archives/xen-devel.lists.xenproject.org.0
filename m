Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D067ACBD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483905.750385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQN-0003aY-Qz; Wed, 25 Jan 2023 08:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483905.750385; Wed, 25 Jan 2023 08:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQN-0003VP-Dp; Wed, 25 Jan 2023 08:46:31 +0000
Received: by outflank-mailman (input) for mailman id 483905;
 Wed, 25 Jan 2023 08:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbQK-0001qZ-MC
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c193687c-9c8c-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:46:27 +0100 (CET)
Received: from DM6PR05CA0049.namprd05.prod.outlook.com (2603:10b6:5:335::18)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:45:03 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::bd) by DM6PR05CA0049.outlook.office365.com
 (2603:10b6:5:335::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 08:45:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:45:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:45:01 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:45:00 -0600
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
X-Inumbo-ID: c193687c-9c8c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfg9uFbvX1/0e14oGpq+1K2b9EWGcTTpXqCO+WKfrAV0uvy/DOcdCq9KCT7LngqSGtSZEDa0PzpSN94IVhoRQ8CM6OsRdkY9xYo7fRS5nzJouRVbX9eLLCs3KUsNxtFrjd16IQbkbku9r53OYcBqTLMJQIkI/YrHXlIpGJyQOJXCjwGbw1VdkCalKTwXQNLRVXm30cYfob3MnDHFpBGYEkbY5rBwEqdlFPm82phkxr6AYCdXK3wdP7HDdNddVJxGlFF1rADDiCigXWeEZbVUNYyC4Z1gBWqjExV/R6L36nkG6trRkNb7olQHDXWvE8v58cviU1k5QE5In6B6myzXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=MvnEVCvleSxLhbqfIp7SB78q35wMCpcm0KlSSe4zP4KvG6A2bsGVEiEi9EfRI+kkgw1FM00DWfiVZ2PleejTg+MFWXjxDbx0h2HXsGmhHPhn+ZZpFdriU/7ziVN0iNt96wVPC/+JHON0lxdVZVlTBZj7PwZ5Gy4NHQAbgfbFQkcjUdppwpB72ApTtNnqQYWHE6wbkP9/xMdyVf598u3+hMRmz7mq44WtdMRIsfmLerfEGySw2+SD5F7YM3iHt8DlYpaHSDNGdoIYWVKCoJfcLzn3c935y1MAnsaP7Ik1jSnF2K90UsxDgd6qD/loPE3enUvG3kgN6cr2FztHL/pFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=DTkjj+xqDyjsf3389KNNx6xqUwuT5FttfA8WRl8QKr+zswooVD+S4P87UlDmWECG4JOkqJbeHXlOC6Vug1Fm0i5Hi4NmcT7eCmWtt7uIS6/hmhaHwolyNzv6K0LNdlDvm8wlm6ZtZim9Hp1h9pzFdl82FKM7p8GAEU3bm006WVg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
	<berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v3 10/10] meson.build: enable xenpv machine build for ARM
Date: Wed, 25 Jan 2023 00:43:56 -0800
Message-ID: <20230125084356.6684-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT005:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abb656f-ac22-4400-7d39-08dafeb07351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nuaeDtjyRP8hHVUv/smR+2PIkN4yrogeGguf8oOIcfyKBgjr498jP9iqETLQ6XCYj/WXgixBguhxkxOMsFxZaUlS9nBBUBzI56+o4hW21wToyVnLuKUAuTfJlgtV83qNjIWwkdn/jzeourv0rclO0tVHrIQPoRWtY+r5DvJ4p6tLn+W5uJibN8xeb/vS/ft30u9QeSnCBFqNsrsDiBxGRV4cz3P0tVhi/kibpqVU7PzKmhEkYfbGKAfnCc3IJ01WsVSk0gdATn+eHUrxgaOwsXVjMTqOVvX0xPdH6ViVqL/LNTdYyH1+wqYML9NCIWpOeh7sU2nFW0T9xdKA91+9kpkqrKQGlaiqSmdCuynV0T43axoKSJFP6BkYwpfFZabeFN8+EZAl76d3+/ze4ZK7KpFpwcAQIEPUsjPHmNwPC7veYeidQ8Ei9gBhiTc1jG1i3to1CbgmwXTqmqySbnG9mdpSmsZqUE/PcbCqV4M3NW85p49WQjJpLL+/LAYL/isjNtXsKmF54lCVK6gsSXu7Te+5/I8cwfTPen2upytfVOBH+3DHr4P0stUiXvsuB5et+RRVE0NrsEBu3lJPSuBCr25U/bJQ87/nzReOGqJvEb3HOomzbJsSccqU0jWVh26oycx0Czh52tbohET7fMryOJLSlxvK3IuWzOP/OHGW8cSzl4NWWlA9yRhRJyiTpvNEvkFN0Fts9OrsrNtidRfwnvbM50rAzHuWNC5+t3jJmGI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(6916009)(2616005)(478600001)(66574015)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(356005)(4744005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(316002)(40480700001)(40460700003)(6666004)(44832011)(4326008)(82310400005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:45:02.7984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abb656f-ac22-4400-7d39-08dafeb07351
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 693802adb2..13c4ad1017 100644
--- a/meson.build
+++ b/meson.build
@@ -135,7 +135,7 @@ endif
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
-- 
2.17.0


