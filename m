Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC378182A0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656515.1024772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvm-0000PF-7D; Tue, 19 Dec 2023 07:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656515.1024772; Tue, 19 Dec 2023 07:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUvm-0000Lz-40; Tue, 19 Dec 2023 07:54:22 +0000
Received: by outflank-mailman (input) for mailman id 656515;
 Tue, 19 Dec 2023 07:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUvk-0008Dp-Ln
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d072f3d2-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:20 +0100 (CET)
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:54:16 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::cc) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:54:16 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:08 -0600
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
X-Inumbo-ID: d072f3d2-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGyQ9QcxwY3n6K6IakXpeu/21Qd6UvDxX/XAV7DlEn04T5HpycRMmtha8TOtj8qZYMacUB8OWQhj5tiHg3VIec/fsGbCulTcldVxfvhcL5mwN6H9WLix7+rQiDp9cFX+svvl3NDZX4tRXXqybG2gDLnOD2aitJ+axaGRvDn69ULZ/vpLdQw7jfViT0CjP0eiMhfPTDUjsu/pjHGaSTGSQeTrloPzXRwBvz6vXgmtBYhSSFwAIqyX3nCK1iAFIjFXRU822n0wzR9bz6T3Q4kHFyaxA8YVt2BLXJeqwrd7MESzhoPbqbE5jSGOGBIlgM4r489qEkU1kpXiIETSmlVkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXNMgYaYEEec9PYZqBz9D0HOmK6yHA694MJAAoZ2Ylc=;
 b=V02d+HLMsjM+vnBkQx3fKPZY3ELoqlHc8+VA1loIOC3xIFkrT8PXN5IChNNuCvQbJL91hpZcZDTL1nZG+vc0rdM5ssKvMcjmF8MApdN/aowjrqaVWYcBYahq2rgzE1BZoun+aBHZY2asbAXPlCfKQk4o+R8QjkZhFBlu/bhvsiNtFHUZS3zKLX635rnZ2171ishaLM5nQ1EAyKmUXuiN6wjad+fQp7nYzC7We7BoHtk0eBLPGpDTH1nbqlVtruCO+GujxiIBlA75KW3E32FhIZMWSrZOKjOETxKc1bWIf8hiw8SLW+IDhg/tSV/xSA0G53FXcz9HHYskRXJkk4jMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXNMgYaYEEec9PYZqBz9D0HOmK6yHA694MJAAoZ2Ylc=;
 b=hAUEG551Vm2MmavyONaJ7qpWk4rlocXpb8n3mQjBsvie+h8+/SKs9OqUKdTdK3Z0t8ICCqQzaU0RX+cXXChHUq7hcTFn8JVECkiiSK+FUjcRH+BQF6L5FFK4MLSht6p8eKuSP26enqCoZBEbo4AiqsLKvqikfG8WPKxfvCjXJ7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Antonio
 Caggiano <antonio.caggiano@collabora.com>
Subject: [PATCH v6 02/11] virtio-gpu: Configure new feature flag context_create_with_flags for virglrenderer
Date: Tue, 19 Dec 2023 15:53:11 +0800
Message-ID: <20231219075320.165227-3-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219075320.165227-1-ray.huang@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DM4PR12MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd061f2-5763-46b9-9e98-08dc0067b2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hEi40K5Yj/cvEb/bX2mxWH5rzyndN5KtrQlgR+KcM7ih2hhb0a3c5rIPkUWGT3S7Lod6I0ERn+f/WjXDDfq3VWU9HHPD2lPx3RzC8ACM1pLR+JVjNl3wxV8oRS2DQNLraKZpniznBHhw+/D9nQ47q90DEADVWs5RUu0vHtIBMfsx7gtNChnoP0DyOr3M2UkqjZ5td6nneqdXwZU7LCYeh+1HMekUdQO9LAS/2a47rMfQWKD/TADofAgXwfEVoQwtvTFOYk1lqkiNN+6Qbe1ezlFgyrEph4nWyaJfUPoZJ4T4G6xNMZMLqRjpiJ3hPROHZKNlb8W0gSOKKBg2Pd+SRAIg8WaCOkNtCHVPuGiq8ajMApHP/5t/mGhBGPKpV68GjOoj5y4uWHzu9B88uQ8aY0jFIZOaQcd38/KPrqKiDzELpbM0kZCbfuRUuEfol8JR29Ei5Ynf/fuuFf71f0DC3n3aOB86dN8Q1Uh7QeQosVDOfb3lC8vtjnTjdPoSPniM4ce9VvV5kEytT7p23egfEIICxklf2jvfyCxDqegNdOxqBfdvwKbQEOZ+CT+gkSRMG9AdpQJRJDUn+ORiF3TftFocMIdSJUB6I+egQp1+Kb4NYf2M9/WhAMMuqotAeAPxaE8vdgQRXbOcLs3ky+3QgKxy9Zq6K4HC62ELOybwXwP1pSHcfZAg6CopGjqj+1Qj5TeniPc4ewMa83foJ/1r0hU8ILwMH3JU/3+f9EmZ2OXARdwMUgNN0/Cfbmm9XshRSvYvJuamsJB5QJ/iULegMeFmBdmM0MGTn48pdbzJ3Zo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(86362001)(81166007)(356005)(36756003)(82740400003)(40460700003)(7696005)(6666004)(478600001)(41300700001)(70586007)(54906003)(70206006)(921008)(16526019)(336012)(26005)(1076003)(2616005)(47076005)(426003)(4744005)(2906002)(7416002)(110136005)(36860700001)(5660300002)(316002)(8936002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:16.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd061f2-5763-46b9-9e98-08dc0067b2da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246

Configure a new feature flag (context_create_with_flags) for
virglrenderer.

Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- Move macros configurations under virgl.found() and rename
  HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS.

 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index ec01f8b138..ea52ef1b9c 100644
--- a/meson.build
+++ b/meson.build
@@ -1050,6 +1050,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                          cc.has_member('struct virgl_renderer_resource_info_ext', 'd3d_tex2d',
                                        prefix: '#include <virglrenderer.h>',
                                        dependencies: virgl))
+    config_host_data.set('HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS',
+                         cc.has_function('virgl_renderer_context_create_with_flags',
+                                         prefix: '#include <virglrenderer.h>',
+                                         dependencies: virgl))
   endif
 endif
 rutabaga = not_found
-- 
2.25.1


