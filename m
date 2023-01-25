Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2C67ACF2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483962.750442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZs-0001KP-5M; Wed, 25 Jan 2023 08:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483962.750442; Wed, 25 Jan 2023 08:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZs-0001HF-1H; Wed, 25 Jan 2023 08:56:20 +0000
Received: by outflank-mailman (input) for mailman id 483962;
 Wed, 25 Jan 2023 08:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbZq-00012q-9c
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe5b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f8427dd-9c8e-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:56:14 +0100 (CET)
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:54:20 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::d7) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:54:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:19 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:18 -0600
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
X-Inumbo-ID: 1f8427dd-9c8e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3/Kh3JJFa2tw0RwGwSINvgrPgcX3x+Q9W3Djxo/clwYnAphGAPG0ALItJODsGgor8DIKx//qaU+8CNO8a+aPyrTS/0dDXmxLgsAlcmTGRx2UIC1z0tPuUySowXD3RYy3Rz54NL8wLt+PLr1DzBdrkIsBo2hKy5nBt154/94Hu+fEHPGerIKlRt+8lyM5ld0v18EDexL3jON2zPFIOzJDNV6Sr7QZRqSBg5F417xz/doLuApffw+yDYrV26mvJDdzNTqLlJL3GSjbsOP/ldkcVb4208zJ2pMpRMFfKs3g9NE6QAOsUxKZT0216ePOgb+CKMIRZ3MYsl6T9+etZcLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fses6GPjSDeO1Rg1V/rPgyl+4LoVZw/rTYn2KGu2M1M=;
 b=lrwHhrNHLdbtpk263ufDE+TbQMZS/JWr7KKufVct5fbmUTMvBR46mXUPwuIYzhKWcvJt7CkAvMe7nxuvoy/R/cSd6Dlbp88B7I1FW8ZUNUQh6XcfL5UCiUf8+nXJB3nwcDNvOus3RCSSXMtg4wmhSmfjuo1hDpqF08/LIpUtCrChZUHUbJ+nYzF3nZvWyY25T+4iypB5tJ3OlmkkLTHdox37av3OglRYbv6NRpejfQXLvZH3l21T8kOleAxppELKejf4Ofa5TxZRIkhHtna2Y72ZBGdgD/aGo/v8KLSyS4goKH4qF5nm1d6bXYH8PMM4ig2Wwz/f6mOa/IMokL658Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fses6GPjSDeO1Rg1V/rPgyl+4LoVZw/rTYn2KGu2M1M=;
 b=ipTINMEqsjL8Xi7RvBb70hIHY6k1H7G4ch7LKt8gprRn+hpFqa1Wzepnr2G3oTJ4HbQXLPTeeLOmnnzenHS+QYkG2Nq6Uy5zPRPQJtMsDO08ztqzLV07XsOwTGC/9MtbymrdvunoCvyVTjQaV82mwMUyjAL04iUlOskeMdZU/qQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>
Subject: [QEMU][PATCH v4 00/10] Introduce xenpvh machine for arm architecture 
Date: Wed, 25 Jan 2023 00:53:57 -0800
Message-ID: <20230125085407.7144-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|DM6PR12MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcc5be2-42bc-4f46-ff0b-08dafeb1bf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	da4g3wEWlfXMyhYj3QlmYfiSAVVJaZOBOraNWQ6m6glAY2rR4l6IIOVq/STE3zW+ryhUk1AsQU5OZw7pQ2IovRMTgIZbu+NZAk4mFxv/5sNvAnUKg10wfHrMdL850LHWTJG/F9m36ooPjDdMOm5s0/qBvGtmj9dHHAJ4nbKyWBhTBj7temYYJHz+Pp5jNRo6tuxzcg7sCSOVZpzqrTiq3Q98pJP9t3OTGH0OKihsUH8GGkeNX/rATYzy76fcMKETOg6V5QJb/22DEHXJrn4JBin/la6/x5dNXRG8Ky3p10+K3PB6GWtu8b4PJP0Ccs883mgog/vC7ola6CmC23I7W1Bnc3ofzaTPuTj290R6B+ye/W9Hx531UkuX+KCmXwf4lzNkujNJMY3+Ut73TWZPyqmkY11NgK1yuwLMZb8DnN+8ZBcpLOHrbhlFy93S0qQjz6/tPX8l8P10W4FQWL8P7rayb4FzpRgYkw9LTjqcz2RVJZrAwvUXZX4i2ogWqX+aW+QX2jSLrRAxQx5vetMVvKq/80BogI+naoKmLR/a0ltPqbc62yEOxj/JLK12ZsRi1xf5dMw0AvcKuhniBrriKMN6rpgJyqZsu0QxQgfX5lAYaI5dgxyAG6gjlStF5ZlkLyzdMGJc21wEZ/5AZ0W1ntaB7rFVqPbjZ/nImU8tmohrxWY6sYYFqP2+rg1qG/3PQw5ixd5OLOXmTs2oPJdnUiIAlkOGxONzqVQSPjO3My4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(426003)(336012)(54906003)(47076005)(6916009)(2616005)(478600001)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(356005)(2906002)(86362001)(41300700001)(82740400003)(81166007)(26005)(5660300002)(4743002)(316002)(40480700001)(40460700003)(6666004)(44832011)(4326008)(82310400005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:19.8315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcc5be2-42bc-4f46-ff0b-08dafeb1bf55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
This series add xenpvh machine for aarch64. Motivation behind creating xenpvh
machine with IOREQ and TPM was to enable each guest on Xen aarch64 to have it's
own unique and emulated TPM.

This series does following:
    1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can
       be used for aarch64.
    2. We added a minimal xenpvh arm machine which creates an IOREQ server and
       support TPM.

Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
moving old code to new place which was not QEMU code style compatible.
No new add code was added.

Regards,
Vikram

ChangeLog:
    v3->v4:
        Removed the out of series 04/12 patch.

    v2->v3:
        1. Change machine name to xenpvh as per Jurgen's input.
        2. Add docs/system/xenpvh.rst documentation.
        3. Removed GUEST_TPM_BASE and added tpm_base_address as property.
        4. Correct CONFIG_TPM related issues.
        5. Added xen_register_backend() function call to xen_register_ioreq().
        6. Added Oleksandr's suggestion i.e. removed extra interface opening and
           used accel=xen option

    v1 -> v2
    Merged patch 05 and 06.
    04/12: xen-hvm-common.c:
        1. Moved xen_be_init() and xen_be_register_common() from
            xen_register_ioreq() to xen_register_backend().
        2. Changed g_malloc to g_new and perror -> error_setg_errno.
        3. Created a local subroutine function for Xen_IOREQ_register.
        4. Fixed build issues with inclusion of xenstore.h.
        5. Fixed minor errors.

Stefano Stabellini (5):
  hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
  xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
  include/hw/xen/xen_common: return error from xen_create_ioreq_server
  hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration
    failure
  meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (5):
  hw/i386/xen/: move xen-mapcache.c to hw/xen/
  hw/i386/xen: rearrange xen_hvm_init_pc
  hw/xen/xen-hvm-common: Use g_new and error_setg_errno
  hw/arm: introduce xenpvh machine
  meson.build: enable xenpv machine build for ARM

 docs/system/arm/xenpvh.rst       |   34 +
 docs/system/target-arm.rst       |    1 +
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  184 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1084 +++---------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  889 ++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   97 +++
 include/hw/xen/xen_common.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1363 insertions(+), 1017 deletions(-)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

-- 
2.17.0


