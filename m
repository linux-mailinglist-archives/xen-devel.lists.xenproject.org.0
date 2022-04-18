Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C859C504E38
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307056.522332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNp-0007zZ-J8; Mon, 18 Apr 2022 09:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307056.522332; Mon, 18 Apr 2022 09:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNp-0007rX-Dl; Mon, 18 Apr 2022 09:09:21 +0000
Received: by outflank-mailman (input) for mailman id 307056;
 Mon, 18 Apr 2022 09:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNNn-0007Zt-IQ
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 397f129c-bef7-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 11:09:18 +0200 (CEST)
Received: from AS9PR06CA0314.eurprd06.prod.outlook.com (2603:10a6:20b:45b::16)
 by GV2PR08MB8027.eurprd08.prod.outlook.com (2603:10a6:150:77::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Mon, 18 Apr
 2022 09:09:14 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::e7) by AS9PR06CA0314.outlook.office365.com
 (2603:10a6:20b:45b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:14 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Mon, 18 Apr 2022 09:09:13 +0000
Received: from 34f05a90a264.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 517773D1-31C0-4A4B-BE16-A9622B197C53.1; 
 Mon, 18 Apr 2022 09:09:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34f05a90a264.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:07 +0000
Received: from AS9PR04CA0099.eurprd04.prod.outlook.com (2603:10a6:20b:50e::22)
 by AM6PR08MB3768.eurprd08.prod.outlook.com (2603:10a6:20b:90::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:05 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::cd) by AS9PR04CA0099.outlook.office365.com
 (2603:10a6:20b:50e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:05 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:04 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:02 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:00 +0000
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
X-Inumbo-ID: 397f129c-bef7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKhGWgAz7VOd0X/bf4Vgu84CVR+pM2MueQtIIaIgjYw=;
 b=em5bSzYnov4JJhMJs5UnjOdhKnbfxDzdIgrxZXCiWpmzYDdl7L/RFfARfUH7AL/ZVZPLCGzpuZU8DFXrYwTKBncDdRMRCBkfKmPGDg17jrRoo5Lx5c0F+YC9xaSV4QOWUGAecgtRR/fU1FhYdUoQh2aPhEojNgskWFRxZ6MBKsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9baa8cfa302fb627
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9NxgDoGs2mP7ZgvvucXHIcAPQEgCXPKG/YM8/BIKG+9IPokoUmiemn2k083mD7+frthxfecocMB79REkFVY/7CcubbEGjXdgkZc5HjINpaC05//m14ZtWeMjscG7hPAwaPDcgrfmiXdWnp/J/jkqpXFGJT8WY/mene+eY+EdKvyDB9eBZMVpIqeRRFxfzim3nyzYxqqxSWeFXxTUQb9DNHE9ILWUkkBT3xTajhvetZunzFWSzM7IFSuX3075QPedjv49o9HUCWB3wQpZgF81B1ZU18Mpex4fk6YAwESWDkHYp94MY1SMdnS7BxjHC4lrb4Ahkgbyc5KB1ZsUZAV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKhGWgAz7VOd0X/bf4Vgu84CVR+pM2MueQtIIaIgjYw=;
 b=CYY9zLdZsWsiDOJG9eQzaAgmz2LqX+pvY0lvgJ/7hbS/FHEl0eYNqJNK25ElATPA2+SGC9JD4AXx2SUhU0foxh+kWaHe/BsfunLLb5CgazCQqmt/s5nK3XwRFJE2MXSSyadiRJDaYie9gysiVGQztYPTnHJZ9azRK1akpOnVPXbWYJcajFfkU29bfFNTPSVeFGmVbQg24XGPP7+BSi7/xqpAzgyTaDEVdB9sCHbpGdYogYnA5aJByCNChq7QS8DerKEcfvcNj9ML9GVmt6yYMUBbuk9BHJSszR2xjwhPBefoIvYrummHCTDj5hmmTPF3S376YOHvGzr7IjsXhLgYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKhGWgAz7VOd0X/bf4Vgu84CVR+pM2MueQtIIaIgjYw=;
 b=em5bSzYnov4JJhMJs5UnjOdhKnbfxDzdIgrxZXCiWpmzYDdl7L/RFfARfUH7AL/ZVZPLCGzpuZU8DFXrYwTKBncDdRMRCBkfKmPGDg17jrRoo5Lx5c0F+YC9xaSV4QOWUGAecgtRR/fU1FhYdUoQh2aPhEojNgskWFRxZ6MBKsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from x86 to common
Date: Mon, 18 Apr 2022 17:07:27 +0800
Message-ID: <20220418090735.3940393-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3bb0308f-f56b-40dc-a080-08da211b1bf6
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3768:EE_|VE1EUR03FT037:EE_|GV2PR08MB8027:EE_
X-Microsoft-Antispam-PRVS:
	<GV2PR08MB80273CA3D0DEA2745B4D6E9B9EF39@GV2PR08MB8027.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nPhU5GAwzl4cbqeWymZlcWm9ejTGEJ8V56FpA0XINtwGGCHrXAL+PbqIrcTu9CWrAJaZW5aU7ZFcUljnebPAE4PjMEYtDHoB3YHMY/lnMbxcBfHj9wdraJP0m+Qq/5JNmw9q8UezFwDX0o2ucD1bnRg2MkpEXeytqrx4s8lfdUQZEsmXUICwR/veaR0eQqOUj3R0IPM/KvFSXc+xTV8sg9ORUMzp8mEWU6+565d0Gy3sKGb+kH4fLWYkVAOZ0HLS9DCDTEcHloDoXCMpLfQlf8vlmZf3kdqb4/rXUVtcAyJjjPXoBtTXFCMqB+7lYXbb0j6lnVEM8kpfBDhkr1FntN87NzZalQl1pSDQCzdkf1A9qfCOifs/T2LiT8awt5xuiwpZRoKlABXNB+KlON+OkAqzu8+2JW/+C88gG6J8M+dGplROF5fsygLoHNZ8MBY3j6jL675kIutuj9+2M4UxJTox6lLudFTuoU9Bt/iSF5n7yM+Ky2jTkTCUHlEsab9iD0pyL3jRhb8uT3wnoA+TXSmX4pu2MmrmrfzmCkf3TzHN5tadiZ2aejQrLMA63lvp7wqcq3COxl2YMLM4OUFDUC1Lb54WCmeCcq5tl4krBAs/ikfH/ykMAiknLIThYg8X9UgZnj2ocvqRwaaFT18IMszNr3LDPTuiwi+70V4T30u2lxrIETZ4qfimpchSjQ7arEm/xJftuKNA+oYIbU+XsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(2906002)(40460700003)(70586007)(70206006)(44832011)(4326008)(8676002)(26005)(5660300002)(186003)(1076003)(86362001)(6666004)(8936002)(2616005)(7696005)(47076005)(356005)(508600001)(336012)(36756003)(82310400005)(36860700001)(426003)(54906003)(316002)(110136005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3768
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f4cbbba-1f71-490f-c943-08da211b163c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JbkXeTDt1x5JrTLySBhvZ5V7uZQE1YZnMnCLNy1uyC8+DddhDEF/nLr+cbsPEwu/K8ngd/bsGWNDGN0W4KOAQBC0Mg5zJKCtsP1+4tudkoWcSCLIwy7g0pGyW6xUrum49yYoZ5TFd8m7NjvWjkfFpOWTBZC8DqV1wvfR/FnCYrI/uc05ZT9dEmGuNgOxT3u46rDYF4StJi2hVAN5JgsGzLhF2UasX5vPXwXJLtpZnZSlZf7IikRXo7PGwUpTpJ33E34pJMqMw96sLFnI2YJODycjRjDKqA2xGheruOz6wsANx776bmLbmBjvJqdktNdv14ascrCtTEhmmatpCaf2nhkPrk2iEmZsvnnt0Arh/0Qhe1QSS28xhXYqcl0OM3Ux3RFtjoXKj9UA+7xQg6PlRbJKZhFseLi3x9jbeXTBE8R5f5OLocU9UMa2Lqv1t0eNsY9Mt3U4y7NYwNd6Bm2kWLoEa98Ijnu7gpkVRgB4DSbOnyDWF4cq4o4DwSzB9I04BeKDxSzyIzp4wJR3ucz7n2C0/WTD3SDO1KedPZHEa9AdkThBHwKIq6LZxs3vu1S9/93YmqD2g3Yl6PVda1DUcDABNQCCfEl5VEyEyxc62PmXsy8NptRfvyR/emePBbIKT4tRU3L/0WjHbS4oU7YN0j7Oo0X/tEm1QGRm/NVQJ+XWL7fOtFq7Q+qnRh1qoxGq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(26005)(86362001)(110136005)(2616005)(81166007)(36860700001)(186003)(7696005)(6666004)(336012)(5660300002)(44832011)(8936002)(508600001)(426003)(83380400001)(70586007)(450100002)(82310400005)(1076003)(2906002)(54906003)(4326008)(316002)(70206006)(8676002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:14.1921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb0308f-f56b-40dc-a080-08da211b1bf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8027

Most of the functions in x86 EFI stub.c can be reused for other
architectures. So we move them to common and keep the x86 specific
function in stub-x86.c.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Drop the copy of stub.c from Arm EFI.
2. Share common codes of x86 EFI stub for other architectures.
---
 xen/arch/x86/efi/Makefile               |  4 +--
 xen/arch/x86/efi/{stub.c => stub-x86.c} | 37 ------------------------
 xen/common/efi/stub.c                   | 38 +++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 39 deletions(-)
 rename xen/arch/x86/efi/{stub.c => stub-x86.c} (71%)
 create mode 100644 xen/common/efi/stub.c

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 034ec87895..5ca3a0b4a4 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -11,8 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
-obj-y := stub.o
+obj-y := stub.o stub-x86.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
-nocov-$(XEN_BUILD_EFI) += stub.o
+nocov-$(XEN_BUILD_EFI) += stub.o stub-x86.o
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub-x86.c
similarity index 71%
rename from xen/arch/x86/efi/stub.c
rename to xen/arch/x86/efi/stub-x86.c
index 9984932626..2cd5c8d4dc 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub-x86.c
@@ -1,7 +1,5 @@
 #include <xen/efi.h>
-#include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/lib.h>
 #include <asm/asm_defns.h>
 #include <asm/efibind.h>
 #include <asm/page.h>
@@ -45,11 +43,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
     unreachable();
 }
 
-bool efi_enabled(unsigned int feature)
-{
-    return false;
-}
-
 void __init efi_init_memory(void) { }
 
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
@@ -61,33 +54,3 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
 }
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
-
-bool efi_rs_using_pgtables(void)
-{
-    return false;
-}
-
-unsigned long efi_get_time(void)
-{
-    BUG();
-    return 0;
-}
-
-void efi_halt_system(void) { }
-void efi_reset_system(bool warm) { }
-
-int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
-{
-    return -ENOSYS;
-}
-
-int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
-    __attribute__((__alias__("efi_get_info")));
-
-int efi_runtime_call(struct xenpf_efi_runtime_call *op)
-{
-    return -ENOSYS;
-}
-
-int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
-    __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
new file mode 100644
index 0000000000..6e4f4de9af
--- /dev/null
+++ b/xen/common/efi/stub.c
@@ -0,0 +1,38 @@
+#include <xen/efi.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+
+bool efi_rs_using_pgtables(void)
+{
+    return false;
+}
+
+unsigned long efi_get_time(void)
+{
+    BUG();
+    return 0;
+}
+
+void efi_halt_system(void) { }
+void efi_reset_system(bool warm) { }
+
+int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
+{
+    return -ENOSYS;
+}
+
+int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
+    __attribute__((__alias__("efi_get_info")));
+
+int efi_runtime_call(struct xenpf_efi_runtime_call *op)
+{
+    return -ENOSYS;
+}
+
+int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
+    __attribute__((__alias__("efi_runtime_call")));
-- 
2.25.1


