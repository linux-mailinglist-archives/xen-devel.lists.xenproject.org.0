Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97B9A2AA6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821003.1234795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9t-0001iD-Qs; Thu, 17 Oct 2024 17:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821003.1234795; Thu, 17 Oct 2024 17:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9t-0001cU-NK; Thu, 17 Oct 2024 17:19:33 +0000
Received: by outflank-mailman (input) for mailman id 821003;
 Thu, 17 Oct 2024 17:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7jd=RN=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t1U9s-0007JO-52
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:19:32 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2408::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f71c1d23-8cab-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:19:29 +0200 (CEST)
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by DS0PR12MB7583.namprd12.prod.outlook.com (2603:10b6:8:13f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 17:19:08 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::5d) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Thu, 17 Oct 2024 17:19:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 17:19:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:19:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 12:19:02 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 12:19:02 -0500
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
X-Inumbo-ID: f71c1d23-8cab-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqPhtnWtyeq8ejdG0iy2u53JbKgz7WitO14SiC3WtBFDHX+snDUFTTHItEjJfiULlMiMHESif/I11R9AD3P1aVolK7hui10O70QmKlOCyo8jlao2hznu+v2uNwtONmjsYPgj17NU6oBZt4XBMj/ohIA0tsil5Qe0gykaDu65NESzdYcLuXF0swsrMVauLx53uF79sGCzyjqy1a5LcBimNKCl6IFPlWhvQMV+ji91UnGi7LVvLEWYk9hqp0k5bAw1OzvevhvcoVdL1YXYeyOlXMrYUZ6mIEcp9hP6bRwx9q58D/8lr7mCVcKVQ3aVPg02KB85OJZhS1DRUXxOBCGN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zaVyoOUYBX6WPASuaE/d8keX1X2ko5PNA11fHB6pyo=;
 b=a81lmu8FRsgGOadZhtQQl1UFRQhnRBZwSLq+xAHFSdHUx2GM0gL/MfSrEIlzgJi/GojdE+OlT66PEKrJ/5fSulO+yck8IdQD2MRxdPgI4iWc+l6lZL4mH13IvK/z6CXfIx1EuiofWBUYzR72yC3czj9w7dRV0in6qBxhxMpxD0Pehmc6Ebll85mW7utpejI/jylHGH8zGI0My0756IScbUqGkZEBizc5nFhyDu83vgyIHixL6sHxrEBvK6g3K7ZmUHTaHMhj7ZdUyY8808FaIOxraT98zyzA69jc5IMjslo4rWzPuXEY4mdVIHiFNhnY5SCXikSbyM+amie+Vetryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zaVyoOUYBX6WPASuaE/d8keX1X2ko5PNA11fHB6pyo=;
 b=b6ifowMXu7LAe0AmNI3huEfrYwCDT/4EPvJeAlDIAi8c0l7ddw2/jM5E+KObmseqfifQUSAuS+ilLJGa3DpxgWKUPujUxnk0PeI3T+Ex7SWu4ol47ouZR3HU68aJy8F2pg5URg/OUJHT7bvGCDn9qjKNAVPi+vLoa6vQiju8/mg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 2/3] automation: add linux argo test artifacts
Date: Thu, 17 Oct 2024 10:18:27 -0700
Message-ID: <f8abd08a2c3f9e52a166359b0f4c1ecf4c8d1a73.1729183051.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1729183051.git.victorm.lira@amd.com>
References: <cover.1729183051.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS0PR12MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0b346e-ae11-4431-ebf7-08dceecfccb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e73IPiKkOsAWd0wIc0wYdx8kaotxC92KFjJXmNQuBSnqZ7LnhL3SsNnNT72K?=
 =?us-ascii?Q?lfS79nunwYOsSlrZ3AJ5oKNJ551ymVSE2nHSKs0rWlI5pICJeWrMSK7pfar3?=
 =?us-ascii?Q?JzLhm177a2zctEHVIQ0rUxcNyHxic2qQAK7POK65WLJxJkrGbiwi81lIUYAb?=
 =?us-ascii?Q?+8DXgKdAYe7Evae+H1y/i9VGCdBAFfH1bKHNApdhUnRWiCCeufcejagrk/JT?=
 =?us-ascii?Q?oz0c0nejOTFP1GzvL/qA9n3mwUXZzI+X33z2JiC9tYOgf2dMW1W2fGdsFVy+?=
 =?us-ascii?Q?46/1jpGK1hNBwcnUBW3EnoOhRZlLIi1wbgza8aH99W502/PCP/xsI14Vt0hx?=
 =?us-ascii?Q?PW0E+RhSxCLdvu10sbgvH3+nCHqrAZ/PABWHDu5OR5syj35BxSDpSy1uoCCd?=
 =?us-ascii?Q?KKisXAlhwnLzo6YJeg6QqLujjC7LzjCHV7VszwhqRzAI6Kp47eue/+G28vUo?=
 =?us-ascii?Q?q42xQ5qbmWovaYBDucnmg79N6w+hSC6lzNd+vtbM8YUdkzfcrWGHO/pyngVV?=
 =?us-ascii?Q?fBkb3TEj2xQVS36eAVvvRXca93ZnibeV1vNpUZ7BUd+Zeb+Qjo76NiVZsUsv?=
 =?us-ascii?Q?sjvVU7Sg9sr6AZp96DVB3wIxTOlTpcyK+/ck2JP4nrKyYwLKHfA0ey9v4z/5?=
 =?us-ascii?Q?4Ej6r7LcSGOtdxszQZjYdoPjkDDuWu47coBFePaKfV8qVmdplfVpeuHBtNee?=
 =?us-ascii?Q?aipDKA5OZ2UFbwKh9KA6v7OYyIBB1yCwqMw2gMgz4xP+7lVH29CoofZ9BndI?=
 =?us-ascii?Q?3dERV1iei7mONmGT619P2WxTArfgiSmVTIEqen/Wia0EhbrrkGeTQju6T6GM?=
 =?us-ascii?Q?NQQykkPEj56Mn3fz3aHoTnbcMh1TVSIiXdngzGDcK4JS12pQJHfg5i9URUt8?=
 =?us-ascii?Q?zvmrFckaTQlw+QDUCkq3Uu9RGPRCpHdJmYcXa9kulK+kwSMbmVV987FVjtoN?=
 =?us-ascii?Q?GZnlAR/TA36BAHfZekveXjjSIowVbiuC8Sdi9lZ34e0qAvUjwCblqWZFA2Q0?=
 =?us-ascii?Q?elt9ItMOe2TNJfYDpUEZuELG/JNh8USGce6V4aEY86n9ddblkfhcITm1nv2o?=
 =?us-ascii?Q?5DsjhJD7wiO8qzleTIjQgSkFI8jACmCIOlrk/5gH5MD1ctF/nUksnOjHWNH4?=
 =?us-ascii?Q?vQhKZrxN//rzuzzkBHC7dd6ulHpTjAJ/2KaDbFmesToMcPT99kjKtLB6lyfl?=
 =?us-ascii?Q?fnSwfgET9P80soMtoh1qgNjodQG7NwLzzyiJ3EIdnN0fUqA234BX6cXMVa4d?=
 =?us-ascii?Q?Jl+kLr8ODb4WSOy62Fn0TYHUXWC7JoIZqUMwVDWIjtsC0W5YS9L8uFGGSMbE?=
 =?us-ascii?Q?ew+kLw39KijdNXOGymHzX+j2pPoS5+3ArdCpy2g83393pF1SEjB8C5rsKogC?=
 =?us-ascii?Q?9bQ2Gds=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:19:03.8683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0b346e-ae11-4431-ebf7-08dceecfccb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583

From: Victor Lira <victorm.lira@amd.com>

Add dockerfile for building container image that holds test binaries for
Xen Argo test on Linux 6.6.56 x86_64

The build produces the following:
- xen-argo.ko       Linux kernel module
- lib/libargo*      Linux shared library
- argo-exec         Linux user test program

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 .../tests-artifacts/argo/6.6.56.dockerfile    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 automation/tests-artifacts/argo/6.6.56.dockerfile

diff --git a/automation/tests-artifacts/argo/6.6.56.dockerfile b/automation/tests-artifacts/argo/6.6.56.dockerfile
new file mode 100644
index 0000000000..a8e199ad3b
--- /dev/null
+++ b/automation/tests-artifacts/argo/6.6.56.dockerfile
@@ -0,0 +1,95 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.18
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV LINUX_VERSION=6.6.56
+ENV USER root
+
+RUN mkdir /build /artifacts
+WORKDIR /build
+ENV BUILDDIR=/build/
+ENV COPYDIR=/artifacts/
+ENV ARGO_SHA="705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+ENV ARGOEXEC_SHA="d900429f6640acc6f68a3d3a4c945d7da60625d8"
+
+RUN apk --no-cache add \
+  \
+  musl-dev  \
+  build-base \
+  libc6-compat \
+  linux-headers \
+  bash \
+  git \
+  curl \
+  flex \
+  bison \
+  elfutils-dev \
+  autoconf \
+  automake \
+  libtool && \
+  \
+  # Prepare Linux sources
+  curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
+  tar xJf linux-"$LINUX_VERSION".tar.xz && \
+  cd linux-"$LINUX_VERSION" && \
+  make ARCH=x86 defconfig && \
+  make ARCH=x86 xen.config && \
+  ./scripts/config --enable BRIDGE && \
+  ./scripts/config --enable IGC && \
+  ./scripts/config --enable TUN && \
+  cp .config .config.orig && \
+  cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
+  make ARCH=x86 olddefconfig && \
+  make ARCH=x86 modules_prepare && \
+  \
+  # Build Linux kernel module for Xen Argo
+  cd "${BUILDDIR}" && \
+  git clone \
+      --depth=1 --branch=master \
+      https://github.com/OpenXT/linux-xen-argo.git && \
+  git -C "${BUILDDIR}/linux-xen-argo" switch --detach "${ARGO_SHA}" && \
+  make -C "linux-${LINUX_VERSION}" M="${BUILDDIR}/linux-xen-argo/argo-linux" \
+      CFLAGS_MODULE="-Wno-error" KBUILD_MODPOST_WARN=1 && \
+  cp "linux-xen-argo/argo-linux/xen-argo.ko" "${COPYDIR}/xen-argo.ko" && \
+  \
+  # Build Linux libargo shared library, applying fixes to build in Alpine
+  cd "${BUILDDIR}/linux-xen-argo/libargo" && \
+  sed -i "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" configure.ac && \
+  sed -i "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" src/libargo.h && \
+  sed -i "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" src/libargo.h && \
+  autoreconf --install && \
+  ./configure  --prefix="${COPYDIR}" CPPFLAGS="-I${PWD}/../argo-linux/include" && \
+  make && \
+  make install && \
+  \
+  # Build Linux user program, modifying for xilinx argo test
+  cd "${BUILDDIR}" && \
+  wget "https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/recipes-openxt/argo-exec/argo-exec/argo-exec.c" && \
+  sed -i "s|#include <xen/xen.h>||" argo-exec.c && \
+  sed -i "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" argo-exec.c && \
+  gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
+      -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
+      -L"${COPYDIR}/lib/" \
+      -o argo-exec argo-exec.c -largo && \
+  cp argo-exec "${COPYDIR}" && \
+  \
+  # Clean up
+  cd /build && \
+  rm -fr linux-"$LINUX_VERSION"* linux-xen-argo argo-exec.c && \
+  \
+  apk del \
+  \
+  musl-dev  \
+  build-base \
+  libc6-compat \
+  linux-headers \
+  bash \
+  git \
+  curl \
+  flex \
+  bison \
+  elfutils-dev \
+  autoconf \
+  automake \
+  libtool
--
2.25.1


