Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C2A67AD4A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 10:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483995.750483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbju-0005Mk-9N; Wed, 25 Jan 2023 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483995.750483; Wed, 25 Jan 2023 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbju-0005Ke-6U; Wed, 25 Jan 2023 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 483995;
 Wed, 25 Jan 2023 09:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbai-00012q-TC
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:57:12 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e8c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26026597-9c8e-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:57:03 +0100 (CET)
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:55:00 +0000
Received: from CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::9d) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:55:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT102.mail.protection.outlook.com (10.13.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 08:54:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 00:54:57 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:56 -0600
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
X-Inumbo-ID: 26026597-9c8e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxWAVTOBVOUjL5UYlCO84yiyrkTvRDA4n7XtfxX7eKRC8MRclmE72TUiQ89XDARHwfu6JOPXdbX6tJX8HDGcgXTczweqLEQMbQ8nX6YoakDdA75UmAb+Bg30WurKLvcUFESnb0b+1A1bmZTdw0HX5iCuYv492sohT6MZ1j7njzyjgxrChKD9WI+GH/iUaRHF4UDTwRNNcdbPQL0e1ZJuDkj01kNDs1pYKhdj9DQgvSseyhQO2KoEh5BH8aUvPkKpBcYsdZ4uN540yN7u4Qg//W3++7fpS3JYnmYxb0jZSSRCO+cEOfIjf6CtqDFU/k2n9uP9/tJu2r2cHc6yidOIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=jWjVVchFI7l5w6SpbKbyeHS6mytJWIg0DDoNnEVQQC9zpufPeYIHXUuNhUn1j4JkcAIIZYUZOsBzrUjt08VQSfgf26zZQkAozDX9as/3msijr5h7uooxShFra8i8mGaonREP/V2+oGIQw+mprs5NEmO7p0l6pTewCHswbqPmsOVqWR4qeEVVxT1gRZ8F3+TAJeiRRF8MEZaVVEODXnqpgNVA/T1VWDiSNi2lMWXIg3iTD7QAJjGVMFvhSSyhWSAGXlZujN7at6jvkAdadIEqf/geTt9HC8o/4/amiBmm5pEsAHFLI1HI/Pk/1riPyJxDWmYPpu0WlosHqORTnytQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=hlARu3HTkF23xk9tSeTT9xRxQfkJSimxcFiFQEte+F8SNvnUAEQspE8SuV6KvePw3BdgR47pQaBGTMsWy/zZfV0E3JioxFpxN70LvU5ZnLdc9kU/45ZryIujTGzi+CGmjGPnl/jDu7OGIsamavfPEbFdUlPjjhYJ/H4CSzqXf+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
	<berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v4 10/10] meson.build: enable xenpv machine build for ARM
Date: Wed, 25 Jan 2023 00:54:07 -0800
Message-ID: <20230125085407.7144-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT102:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: 781d4595-95aa-49c5-90cc-08dafeb1d692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8BA/G5jP91Ma0luh2+A2kdn49JOEazXISIIsHSdexkIRnaHxdVRTDfJH9iNXtJIaR0nZjBZjLliBn2SB2sFCekNvcqiLgQO6eVmlNzagJ/BHbVu3NsPbX5OWx7s31mPgwbZQpkid6EJfpPrILcnawNAM9J+3wqKc+UVQRq3uHDvyWfcyH+C2ARWEGONZ5sUi3l83vGItQQbqjTv37EVfAIjXzs9mr95+HiCD7p60pw/WYChj+LSdQpl3/CbUbqkc61pfYNQ42EMinhwSD4Izbl1JFPyqW2Lvaf4hf7/a6jmkgqh4BYPkJyQnqU2vOP1KH1jGWLBhfe+cQC0qApsXsVfZk7BE5nEzN+Rs3CVITzSXhdhIU7/Ct1WUfbGrqsS6ByvJX9eNkgYRyCdgjEeNJsYvidyv1gMFXJ6JpKNJ8cb1lC8SsWcKazBvSQNW85YAOTVmiMT+j9f4W/eYHPWw2rnAeT/gMrhiLtqJiXChdZon9obqEfW/XGOZoZqLObKnC6jWkEFjpwfw2LR4RJm/YK/EBWPy+Biv/MadKKsJtEAPfmwh1lXgyfHEaa/o4QB1Hc60GOw/tz4RIoT9uO7MyMDyqLDfL7o+uqZhAJEL+UVPreZ+A3IFAVcRXN/xUzg9Cttkoxjj5ROduik9EjYT2CQj8ki5+b4uy211qIwaCzEZh8E5kzdpBxZoA2wfA6md3nlWvEf5Y68tyfe+jkO2I8u6ZzFKt2ULlIwf4GoIwk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(36840700001)(46966006)(40470700004)(82310400005)(336012)(86362001)(356005)(5660300002)(8676002)(81166007)(426003)(40480700001)(6916009)(36860700001)(36756003)(47076005)(2906002)(4744005)(66574015)(8936002)(83380400001)(44832011)(26005)(70206006)(316002)(6666004)(186003)(1076003)(478600001)(41300700001)(2616005)(40460700003)(54906003)(82740400003)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:58.7223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781d4595-95aa-49c5-90cc-08dafeb1d692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097

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


