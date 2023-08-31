Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3193D78E986
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593588.926633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe41-0008Q2-CN; Thu, 31 Aug 2023 09:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593588.926633; Thu, 31 Aug 2023 09:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe41-0008Mp-9S; Thu, 31 Aug 2023 09:34:09 +0000
Received: by outflank-mailman (input) for mailman id 593588;
 Thu, 31 Aug 2023 09:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3z-0006tw-NO
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c150e7-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:34:06 +0200 (CEST)
Received: from BYAPR07CA0055.namprd07.prod.outlook.com (2603:10b6:a03:60::32)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 09:34:02 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::df) by BYAPR07CA0055.outlook.office365.com
 (2603:10b6:a03:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:34:02 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:53 -0500
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
X-Inumbo-ID: 86c150e7-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5rfcn8oBGGqtRZdXq+8HGlnOWxEenXH1uhgKvfPZO9ya+B6TvmbWb3oG1AFVStZJgWFcG1ApPavH3H3CUUaN56e+RpvBT/DSeaya/G4rcg2YqxCM24vcfFCDba/VhRdVkLtCX7AUqVLQzcXZr30G7RUMFZYqaSsos9yjtQlMeV+JFs/nEl7ULR84bF9aWv5LRaZJqv3G6AtEPUkuguB4XsfrhUs2+xIeYbXLRnNBN8cT6O1mNCI9DK1O38OWdXs12QpSyKFr8OnPC9u9aW0ElGtDBnib66awzkM5zSjf/OKtducLycldkjMI9/sUvPtVqqvg+W5sTpTTHhQ5e52/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EChvqjBjhTXvURngM3ftgLfddBzxcirKgDs3+nIkeVY=;
 b=V+IxMdxeQNGFd/DUu3zeic00i1ja+zFUoj9G00pt74+wedolXWmmqNnC0YOhUHMIo17FZpNDZB/PisKiKvOZzNJ9Luv+MLyyOMcNcN8JU9gHnBK7K3xvuON4qHzi8inZMTr2sRbuiCE86uw4QkrvF4EJi75d/FUtV71N9j2CakVSbIsNYemRG5woM3RK13nZUJdWa1qa+9EzcYrIYZqBXg1jUDVieYLVlnFIE/CBpWHswAjIfLBrYVr9PIU47ZWUl/qX9/o3oAR9KF5RQGhEfLWRof3Ae1k+hE0DzeGxdFKy7BHCVb3l0faTuVsZv0qKzY14NCo86+f5nixZUk+xKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EChvqjBjhTXvURngM3ftgLfddBzxcirKgDs3+nIkeVY=;
 b=JhF4ZSu4+/z5dqUV07qtBD7ItTWY+u6G4OleybYKNShDquRHmStXVJVc9o3EyguC+/w44aDhucLlpQmwB4FAeINmvtI8QNeI50PQF/bcJk3gVC+1NfHUIoR+qCEsHsOtZgdb9waboPy+zYAJGA70vURlKCWVfS0oXvU4IEdr/xw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Akihiko Odaki
	<akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 06/13] virtio-gpu: Configure context init for virglrenderer
Date: Thu, 31 Aug 2023 17:32:45 +0800
Message-ID: <20230831093252.2461282-7-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831093252.2461282-1-ray.huang@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|DS0PR12MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c63b30b-12e2-48c6-2de0-08dbaa05695d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pcGdAYgEtb2TyyoQQWg3lcJW4c1rV2Qd3TrXaXTBcwiWUejwLjf0xlNIYx6+jHwLpHp7dpHIMgTC87VPALuacBGF5uMgEZcv29qcQqqRilrswpv6WMcm2aWgK+BC5TTD3e38/u5ON+OYhSYp0iFCH91s1IfyhTFNCcxHf9QJVF/aBvWUgLUeeQ/k0jmWWly3bC65JKWpVnCZN5vfCmDdH6pIToc9elIv1mBohf27bPRuf7koD0lp+2wDat83t554LSATPEju8CpdF2CoOoeZThanlP5FUMG0MoY6eQJCCSZHCICrCzrFTQWVp4M0F9Zycu3Dz40jMCMX2bOcTcYvpWMGTp/IeKzaBktf8rGUlwqIRS/TjPMF2tr9r88kdc0hmbgEWzdxqWNl4LRCEy9H0E5WWl/OLKNUhDN8FofpXGQktdL/eokKjXQFlweHJ76pgj/12KJ+UWQzzcXyQvpY574GTuUgYLgfZfw7D1lfMSY2vpsqmBF96Eozg1cfrKOnyUXjyN38VjOoi5YkzxtIqi0QTw0/05yyA5pepu0T53l8IyK7z1TpAj3wglVhLpD2ysMp8zhwjCXanLc5XpmXw/5IDMpQWtC/0tS16kngcu04K6+KYtSCs4Zx/0ZETKhIwfiLfBldLFvsSR4oaBvXaisiPcI0SbFHSq/AkytZuBw5Y9CODayMr+8HCE13yD/fgALOHUJtrw8f+jlECsnRwAaEuuIbH/RlRn25R1bQ+ZA2BscKOjfWysAy2fbsypsjWi/UhqUxnCSnRQs5pKFgrhYNTxYRaTlnoLL8cd0XvE4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(186009)(82310400011)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(36756003)(40460700003)(40480700001)(83380400001)(4326008)(41300700001)(86362001)(8936002)(5660300002)(7416002)(8676002)(1076003)(26005)(336012)(6666004)(16526019)(426003)(7696005)(2616005)(36860700001)(47076005)(82740400003)(110136005)(356005)(921005)(478600001)(4744005)(81166007)(2906002)(70206006)(70586007)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:02.0767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c63b30b-12e2-48c6-2de0-08dbaa05695d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653

Configure context init feature flag for virglrenderer.

Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

New patch, result of splitting
[RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature

 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index 98e68ef0b1..ff20d3c249 100644
--- a/meson.build
+++ b/meson.build
@@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                                        prefix: '#include <virglrenderer.h>',
                                        dependencies: virgl))
   endif
+  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
+                       cc.has_function('virgl_renderer_context_create_with_flags',
+                                       prefix: '#include <virglrenderer.h>',
+                                       dependencies: virgl))
 endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
-- 
2.34.1


