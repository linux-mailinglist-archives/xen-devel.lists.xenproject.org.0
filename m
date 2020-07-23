Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34922B2B4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydLC-0005BK-AY; Thu, 23 Jul 2020 15:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJck=BC=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jydLA-00056E-Gy
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:41:00 +0000
X-Inumbo-ID: dea769f2-ccfa-11ea-873e-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dea769f2-ccfa-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7UI0hHLya70K0PAeXfMLlW0x1k8QQ9eQZMIPw88Lw=;
 b=Q2F+PNy1hpUD3317nn3uH1iusZuWpLnKyQxANt4RM+XKK3lJEV93iw1Op+IwNURRuitwdpdBvjZ6Dt+hrF8G6b6hj8r66gZtR9e6hJdE7ihA5nSfjhvpNhmD10eZBx92QwdlHvdAa37b+S1eYnd07fP9sofhGQwgcbkIISp0d9w=
Received: from AM6P195CA0041.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::18)
 by VI1PR08MB3551.eurprd08.prod.outlook.com (2603:10a6:803:79::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 15:40:41 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::32) by AM6P195CA0041.outlook.office365.com
 (2603:10a6:209:87::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Thu, 23 Jul 2020 15:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 15:40:40 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Thu, 23 Jul 2020 15:40:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59dfaee054a493f4
X-CR-MTA-TID: 64aa7808
Received: from c8f39d8aa697.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD59E5BD-0C97-4902-B05E-686EAAFE6466.1; 
 Thu, 23 Jul 2020 15:40:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8f39d8aa697.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jul 2020 15:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uoz46YLajRoIGS66MXUfUbCJQm0WKHFl+kM0IwKjIVU/o3DkCfNIH4gHcQTIynYGqIIciMdv2Omq6AtE8REetOJs3r62wg6ZdzIzyjBb81RvTwJfjIeFmPl6PuJ/zPxslpLveKVu4tMn7WMRvge2ko8HV5c3RNXUFnSKLJqe4rzll0v/rcCoad1BqseL9Auu26fGEmYNS7aY0DymH7Y8xxHreO4jXHJxdab6iujPlhw4nbA4crfAbA9FF/aePbgAJEl47Jx1ZIec6fqJ/59uGDXQtL184aQ+R2Kxk8lirxgM+mI7fGiiXdfs8zkM57oja1Lrw5ZKGi31bbHKpGyu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7UI0hHLya70K0PAeXfMLlW0x1k8QQ9eQZMIPw88Lw=;
 b=YbyVwSK3MoZYHu76vMOpc/+fCDNlF4Vu2eE/13Z0mMZ5D5VHcj1KfponYH8QjNarBWZtMZgDK1T/qFlMOuIc+8uYBESX/nSSbthpJDF+BXvNB8gj1IkM/dNR9ACwV/k4swaXmWSAhCZ+n6mXLgwufjfbMrWY1wqDVPkwG8JukTkwT0F+Yw/nounbkEQGCDlNH4P3GR0hMhvsgiFa05Q6E+gfbH8UfqSa7sfUtL4xhW4qmiDZwZSZ/kdG4zCg/JMBzElu13ilPeu/iWagTpFlVy6Jcw8SchmJQVIfPZpyZRyvS05fBp9CwMiJcop+e1Yi6GJvREhJ5WAFRfQ1Tam3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7UI0hHLya70K0PAeXfMLlW0x1k8QQ9eQZMIPw88Lw=;
 b=Q2F+PNy1hpUD3317nn3uH1iusZuWpLnKyQxANt4RM+XKK3lJEV93iw1Op+IwNURRuitwdpdBvjZ6Dt+hrF8G6b6hj8r66gZtR9e6hJdE7ihA5nSfjhvpNhmD10eZBx92QwdlHvdAa37b+S1eYnd07fP9sofhGQwgcbkIISp0d9w=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB3046.eurprd08.prod.outlook.com (2603:10a6:209:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 23 Jul
 2020 15:40:32 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 15:40:32 +0000
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 0/4] PCI devices passthrough on Arm
Date: Thu, 23 Jul 2020 16:40:20 +0100
Message-Id: <cover.1595511416.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To AM6PR08MB3560.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.140.106.54) by
 LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 15:40:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40658b5c-9ef3-4e1d-3e5e-08d82f1ec137
X-MS-TrafficTypeDiagnostic: AM6PR08MB3046:|VI1PR08MB3551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3551E8BD490298B87B5B5CFEFC760@VI1PR08MB3551.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: U1G5NgpUVFmEizU3FcScqC3tnXkBXzj6CN/0hFrgjsUFpWADOOq5Dj86j3GKfABwqqw+5ZC25kzUGJy8jWoMnOgHsNReYcz5TO5+C837dLIQlZaH16dXXS5ZuPLsQlqHHHV8t8V/yTo/pp1/s5N1/U+y3sUCZeI/r/5jrdwxFBbANarpmSd7ShTzYY31/Ea2+uN15YoXzXZ7aj1FdI7xJ8jfJ3okRVVZPCZyxAhfsCmbIRvaYCTd61YtkuibOrbv0WvApuXl8AVoKt0AhL7+scI5GlQ5EPjOGwlwfQQoyPKd+JkF2FFHtzdipFka4p37hhxC3jLfceDT4m5YH1/rJSsdugbJxbWRp7Slti5n+cXjltJQGo+tWbJC/o3SO9fA
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(2616005)(956004)(86362001)(6506007)(4326008)(8676002)(6666004)(186003)(8936002)(16526019)(26005)(36756003)(83380400001)(44832011)(2906002)(54906003)(478600001)(5660300002)(66946007)(6486002)(66556008)(6916009)(316002)(52116002)(66476007)(6512007)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: oHop37iqaDBAyVOB/WLWGB6iyeXNkdGpMDsSOGicRg3/YYu5XOyjtfS281H9PRJBNomlsT/X6eIbphEIM7abZVEqkHblPDQEGhODxp0yHK3fxpRrI3JIkKEBLh/p1vO+Ypw+6IJvPixyxVLUYlIoVoZHOqETMGKDonjhrFwovK3birWSEfywlfUA4lrDeTtIGPf/aJ7pb4wS3DBNb1zkEdnvuWPRkdyTMSKoqQAWdSZxvdUz4nTj8JfxyLi6c5L9KTpFMvfASIpjEasjvNRDn/zTU/OqKS0MoQLYwmTGpgkPb5JQgy1GzdqJH/cBbaKEi4wSPz7UKujAosVwBpQJDCczWDD8zYxK4omvSkoSmnN9wk8FZTFBLZoantbOaOeBbvK6/GGr9qpgQ9cXDDUxBmtfj/sLk8+FwM65hTT7xOHzCpSNxHPjXPQeig8r0MGpBrGPQNCmztFGl7F8GmqRZ6U/vWHaBu12CdXnZ3Ej2YuyI7cmy95MYYP2FoEsy3zs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3046
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5a815f7-b485-42b3-2674-08d82f1ebbe6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vm2vVu/M/f9FP4n+VWC0/Sl3jeNxjLbauwWT3KF3szzuw55QuaWKXY5tmakH03RbJtmDOILI5lzsWvNtKtEJedE4JqLD97spr8RIY8KRZLe/xnxiywAjSZsEVbFlnpmzUqitXw30AcQHbb1jbSENjYq1jn8IBdTo6HQ8KMG+QfQo3i4hN4qqkGGgRW6zrgt+rosT4lljHVXjxpzbrtwSt4CDqU+daYtOZXSNmHZB5C8tNqc/GtBwk3i0btRF94YsP1WR9gqb+EOteVBsB4Ls4m6tN20kYE4r1hNF//uxbERXn855rm0Bx+sD1CMS2u0S6p6ZpGX3WuHOdovP5WbrZ9tDtNgLKVjUtYivQFfTeAP/5BrBBnuQtR85MaqD7tBy/1tYuiIZMVzt0GPhmwX2aqDrxQvYM2/RjZ2H7WeOJLdZxX7Xk/VWCvzExMXaaq1m
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(83380400001)(36756003)(478600001)(2906002)(186003)(16526019)(26005)(6666004)(6506007)(44832011)(2616005)(956004)(336012)(6486002)(82740400003)(70206006)(70586007)(107886003)(6512007)(54906003)(8936002)(316002)(36906005)(47076004)(356005)(81166007)(8676002)(5660300002)(86362001)(82310400002)(6916009)(4326008)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 15:40:40.9442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40658b5c-9ef3-4e1d-3e5e-08d82f1ec137
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3551
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
Cc: rahul.singh@arm.com, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Bertrand.Marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Following up on the discussion on PCI devices passthrough support on Arm
design proposal.Please feel free to give you feedback.

We are submitting the code that we developed to get the early feedback. PCI
passthrough support on ARM is not fully implemented in this patch series for
that reason we are not enabling the HAS_PCI and HAS_VPCI flags for ARM.

We will work on design document that we submitted for feedback on mailing
list and we will submit the next design document to address all the comments.

This patch series is based on v1 of the design document that we submitted for
review. Any comments in the design will be addressed in the later version of
the design document and will subsequently implemented in the code in next
patch series. 

PCI passthrough support is divided into different patches:

Discovering PCI Host Bridge in XEN:
- PCI host bridge discovery in XEN and map the PCI ECAM configuration
space to the XEN memory.

Discovering PCI devices:
- In order to support the PCI passthrough, XEN should be aware of the PCI 
devices.
- Hardware domain is in charge of doing the PCI enumeration and will discover
the PCI devices and then communicate to the XEN via hyper call to add the
PCI devices in XEN.

Enable the existing x86 virtual PCI support for ARM:
- Add VPCI trap handler for each of the PCI device added for config space
access.
- Register the trap handler in XEN for each of the host bridge PCI ECAM config
space access.

Emulated PCI device tree node in libxl:
- Create a virtual PCI device tree node in libxl to enable the guest OS to
discover the virtual PCI during guest boot.

This patch series does not implemented the following features. Following
features will be implemented in the next version of the patch series.
- MSI support for interrupt.
- ACPI support for PCI host bridge discovery within XEN on ARM.
- SMMU modification to support PCI devices.
- Use already defined config option "pci=[]" in place of new "vpci=ecam" config
option to create VPCI bus.
- Map the assigned device PCI BAR values and interrupt to the guest when device
is assigned by xl during domain creation.Currently we are using "iomem=[]"
config options to map the value to the guest.

Rahul Singh (4):
  arm/pci: PCI setup and PCI host bridge discovery within XEN on ARM.
  xen/arm: Discovering PCI devices and add the PCI devices in XEN.
  xen/arm: Enable the existing x86 virtual PCI support for ARM.
  arm/libxl: Emulated PCI device tree node in libxl

 tools/libxl/libxl_arm.c             | 200 ++++++++++++++++++++++++++++
 tools/libxl/libxl_types.idl         |   6 +
 tools/xl/xl_parse.c                 |   7 +
 xen/arch/arm/Kconfig                |   7 +
 xen/arch/arm/Makefile               |   2 +
 xen/arch/arm/domain.c               |   4 +
 xen/arch/arm/pci/Makefile           |   4 +
 xen/arch/arm/pci/pci-access.c       | 101 ++++++++++++++
 xen/arch/arm/pci/pci-host-common.c  | 198 +++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c | 131 ++++++++++++++++++
 xen/arch/arm/pci/pci.c              | 112 ++++++++++++++++
 xen/arch/arm/physdev.c              |  42 +++++-
 xen/arch/arm/setup.c                |   2 +
 xen/arch/arm/vpci.c                 | 102 ++++++++++++++
 xen/arch/arm/vpci.h                 |  37 +++++
 xen/drivers/passthrough/pci.c       |   7 +
 xen/include/asm-arm/device.h        |   7 +-
 xen/include/asm-arm/domain.h        |   5 +
 xen/include/asm-arm/pci.h           |  97 +++++++++++++-
 xen/include/public/arch-arm.h       |  32 +++++
 20 files changed, 1094 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/arm/pci/Makefile
 create mode 100644 xen/arch/arm/pci/pci-access.c
 create mode 100644 xen/arch/arm/pci/pci-host-common.c
 create mode 100644 xen/arch/arm/pci/pci-host-generic.c
 create mode 100644 xen/arch/arm/pci/pci.c
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

-- 
2.17.1


