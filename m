Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEC6B63F0
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508897.783824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvH-0000B4-Dh; Sun, 12 Mar 2023 09:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508897.783824; Sun, 12 Mar 2023 09:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHvH-00008U-At; Sun, 12 Mar 2023 09:23:23 +0000
Received: by outflank-mailman (input) for mailman id 508897;
 Sun, 12 Mar 2023 09:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHvG-00008O-MY
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:23:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e89::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86ea1974-c0b7-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 10:23:21 +0100 (CET)
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by DM4PR12MB5069.namprd12.prod.outlook.com (2603:10b6:5:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:17 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::d7) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:23:17 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:11 -0500
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
X-Inumbo-ID: 86ea1974-c0b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg6UulKLXxxEkJmYPIx8qnWvni29p7FV9dj+DMb89W8MvZVM0fVyL50WnDpTPS6aA3cio6mkfFWtTf4/m2sqcepBHgpTRIs/dc298QRDzbRi9cOgL2GgMZX5VGD5y1hivDIKO/SKB0z9LUpcg6SWUyuBMDONJOw6hPCcmBAPN+5t6wX1xPbfdiRayJsbBTIEAchSZON2VHKpG92a4P38XQT6flvbJG+sIiV2PsnCjQXu3auKNlLyUq1GX1t3PYjHvxXER8EtQql0Y/6du9CC1mMgdtp+ZymChBWnMhCjz/iJLYQNWCM36oRqqiMB+GqwLNuKigftfRhtivbsOq+X9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2EhLkpJ5Bj+UqeV9Zo6yka7OKyWM7CAOQ4/btZiqTY=;
 b=N48ZSOGZYX9C8O++GVZ4OyIiftwVCPytmrAjHRmSsSDKpQSTbjqG8+2x/ABdOW5rb10AvBT9RUgiukGeJoZ3m66XrpcLNHElazThAShbEbYOILD2WW9pgjNcChr/aL+hs4pXJWtaLepvOtKk93h/vawdDEwkbGdFZi3vvhu4dLblBhm+kDKx215drCYS4ec8PpNiCz7OVvFdwGQvbcTrpWoH/i1K5MOK0uer8R2adJQ/mqLTdUIvrCo/K00BQ991In+6a4tqNe+FSPsP7g4cbinYyXLth/IH8MUx8afJQmOR6OhawrjdxvtOiMF26avjW/yj/NPW30WeKXuEowC3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2EhLkpJ5Bj+UqeV9Zo6yka7OKyWM7CAOQ4/btZiqTY=;
 b=x5qr/E6mebGROUi0TTmgiFTQPIHGG+tciZui3vEF7ox4oMScO5jdI8V7LYiJRZoeLy4y7/FAwmPUop/k6j7fVS2A1RyDrrt4s8x6gsWEI1suMV2bbQFtq0wkLHc0pcYEheoN5fAyGeNvnTWakmittTNOPxPfkPiY1HZ+94So7Tk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC QEMU PATCH 00/18] Add VirtIO GPU and Passthrough GPU support on Xen
Date: Sun, 12 Mar 2023 17:22:26 +0800
Message-ID: <20230312092244.451465-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|DM4PR12MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c271532-8421-43eb-f4a3-08db22db69d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S8A2564QMP9Yqtqu5dIclnI6VFn/vMn8EzVhEdBGZy41t7aam1KZf0Vyg4RJuJB89GvCm/3m4PsBClTzmMjkgYVMK0+xRffcrJjKMk8Dm/lDKNrIzrKlbdpHgzkIMPOodK7S4+NNBjvT4INMrnvrrUJell6rtHbRN4KaIygn6x2hvu+aOFiF3ume5/RaHrnIPVEnyazHZ0LMDdQdkfIBusYU4Fes6ApZuIFEGA41+2ScFwWSE2JcccLoOPL1FlQ3IVrxvV9pp3s4eUlrU4CDQL6wa/d8NrUbw9V7s3ra4fiRxuCGGNNdnn/fSHEa4NUX5Nq8tk+0hxMkTCNRwDqhJSkGpZUZ4U+kd9PnF2GbCfRy1Oq7QAjdVMuvVV3shhMPmwKbWFlIXj7I/7pweMqaV5b1GxlGNdhzh9ARQG3IlRem0ykn9zRpWq1w2syaHgP1IztwXBPsSzPgW0/aOLEyQ4iJ73/whnAEgkZ3L4i/a+2+wfvWmFkNhZLte0c0csxbg8WKTB34VmL+dHxzoaaweUHXK0qONpzOsNcCfIDk6cj31QxBLzH49RwnPCecYTQTu/yT9q1isqVV8R9Y1f5spX/G8H2+zh0TW9rEY/S4rYeBCoCthYsNW7aIjJrSG0MrNTve1Ql+2BzqartUk6EbMQCscwcqMvejUTcOL+ivmO6z3cTVaaVc9wRZV3MGniKIihph5+E4U8Mq+fvSPGcKqq8PdycoZAOFwCyAsywEWLPZ3pnZHMBvYUOf88Pi0kcHH9JR7/axzbUDkVhWmSUCC5wAbjfjDDugMsd7qN+n3zKvi+fIROLXegzSkts5MM9w
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(921005)(356005)(86362001)(36860700001)(82740400003)(81166007)(36756003)(2906002)(41300700001)(7416002)(8936002)(5660300002)(40480700001)(40460700003)(82310400005)(4326008)(83380400001)(1076003)(26005)(186003)(16526019)(336012)(66574015)(426003)(47076005)(316002)(110136005)(2616005)(54906003)(8676002)(70206006)(70586007)(478600001)(6666004)(966005)(7696005)(5930299012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:17.0044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c271532-8421-43eb-f4a3-08db22db69d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5069

Hi all,

We are working to introduce VirtIO GPU and Passthrough GPU support on Xen.

https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00714.html

Currently, only virgl for VirtIO GPU and Passthrough GPU on PV dom0 can
works on Xen. These series introduce more graphic support for Xen on QEMU
part.

1) Add Venus with QEMU for VirtIO GPU on Xen

Antonio Caggiano made the venus with QEMU on KVM platform below, patch 1 to
11 are inherited from his original work to support the features of
context init, hostmem, resource uuid, and blob resources for Venus. We have
rebase the support to the latest version.
https://www.collabora.com/news-and-blog/blog/2021/11/26/venus-on-qemu-enabling-new-virtual-vulkan-driver/

But on Xen, it still needs to add "-mem-path" function in the QEMU. Because
it requires the memory-backend-memfd support. Please check patch 12 to 16.

With the Venus supported on Xen, we can enable Zink + Venus for OpenGL
rendering on guest domU as well.

2) Add Video hardware accelerate support for virgl

Please check patch 17, that adds get_drm_fd callback to let guest know
hardware accel codec is used.

3) Enable Passthrough GPU on Xen PVH dom0 in QEMU

Please check patch 18, that translate host irq to gsi for PCIe Passthrough
on PVH dom0.

Below are the screenshot of these functions, please take a look.

Venus: https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link
Zink: https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link
Passthrough GPU: https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link

Repositories
Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen

Thanks,
Ray

Antonio Caggiano (8):
  virtio-gpu: Handle resource blob commands
  virtio-gpu: CONTEXT_INIT feature
  virtio-gpu: Unrealize
  virtio-gpu: Resource UUID
  virtio-gpu: Support Venus capset
  virtio-gpu: Initialize Venus
  meson: Enable virglrenderer unstable APIs
  virtio-gpu: Handle set scanout blob command

Chen Jiqian (1):
  xen: translate irq of host pci device to gsi

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

Honglei Huang (2):
  virtio-gpu: fix hw-display-virtio-gpu.so undefined symbol
    virtio_gpu_virgl_resource_unmap
  virtio-gpu: Add video hardware accelerate support for virgl

Huang Rui (4):
  softmmu: Fix the size to map cache with xen for host virtual address
  hw/i386/xen/xen-hvm: Introduce xen_ram_block_check function
  softmmu: Add ram block check to map the xen ram memory
  softmmu: Enable qemu ram allocation with fd for Xen

Robert Beckett (1):
  virtio-gpu: make blob scanout use dmabuf fd

 hw/display/meson.build                      |   2 +-
 hw/display/trace-events                     |   1 +
 hw/display/virtio-gpu-base.c                |   7 +-
 hw/display/virtio-gpu-pci.c                 |  14 +
 hw/display/virtio-gpu-virgl.c               | 326 +++++++++++++++++++-
 hw/display/virtio-gpu.c                     | 101 +++++-
 hw/display/virtio-vga.c                     |  33 +-
 hw/i386/xen/xen-hvm.c                       |  15 +
 hw/virtio/virtio-pci.c                      |  18 ++
 hw/xen/xen-host-pci-device.c                |   3 +-
 include/hw/virtio/virtio-gpu-bswap.h        |  18 ++
 include/hw/virtio/virtio-gpu.h              |  28 ++
 include/hw/virtio/virtio-pci.h              |   4 +
 include/hw/xen/xen.h                        |   1 +
 include/standard-headers/linux/virtio_gpu.h |   2 +
 meson.build                                 |  11 +
 softmmu/physmem.c                           |  12 +-
 17 files changed, 559 insertions(+), 37 deletions(-)

-- 
2.25.1


