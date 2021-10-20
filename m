Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F5C4348B2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213776.372101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8Ya-0001Hi-OO; Wed, 20 Oct 2021 10:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213776.372101; Wed, 20 Oct 2021 10:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8Ya-0001Ft-Kp; Wed, 20 Oct 2021 10:10:48 +0000
Received: by outflank-mailman (input) for mailman id 213776;
 Wed, 20 Oct 2021 10:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOn5=PI=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1md8YZ-0001Fn-S3
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:10:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a3c7332-bf90-4079-bea1-394b53564784;
 Wed, 20 Oct 2021 10:10:44 +0000 (UTC)
Received: from AS9PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:46a::23)
 by DBBPR08MB6105.eurprd08.prod.outlook.com (2603:10a6:10:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 10:10:42 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::e5) by AS9PR04CA0058.outlook.office365.com
 (2603:10a6:20b:46a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 10:10:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 10:10:41 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 20 Oct 2021 10:10:41 +0000
Received: from 0a7e79187a79.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CEC86D9F-CB6D-4F6C-89CE-056E4C97ADFA.1; 
 Wed, 20 Oct 2021 10:10:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a7e79187a79.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 10:10:35 +0000
Received: from AM6PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:20b:b2::16)
 by HE1PR0801MB2091.eurprd08.prod.outlook.com (2603:10a6:3:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 10:10:33 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::c4) by AM6PR08CA0004.outlook.office365.com
 (2603:10a6:20b:b2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 10:10:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 10:10:32 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 20 Oct
 2021 10:10:31 +0000
Received: from hongda-OptiPlex-7070.shanghai.arm.com (10.169.190.17) by
 mail.arm.com (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 10:10:29 +0000
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
X-Inumbo-ID: 4a3c7332-bf90-4079-bea1-394b53564784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDANhBkc8QVomqkcXiK4L7RcGe5Epnl8Ui8zqFtlpS0=;
 b=5cktR1FRD/cYJ8lkrgYX8RwaEoelCobwvl35mjArdxJnJU1k5jv1dwQNRlOb3753M8xibPtkUYshPmDkBXqOGDXixijVEEijAcEs6DqSDqHHLZ7/651eajfk2cmEDZw8xUu+6rl11+LmhbMjM4g2lwZKn7l7EUKQv73z4+M7abk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10458c9cf0127461
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq6jn29Qe3uNyaOJlVfdZ2SArrEmqocEZIEom+oUO0rgFwmaKotEk21yHzylTEFcMoDZUIDrTjQkQaaIHF1EapUSH4jbTD9XCrSPVxpkSHNXzM4H2kazRwni/Qg/dlEk/sDN1GY9xldpigF6Wi+wQAAT0Li7YMz6dzfEpxplrnEc4+Gph04hDY66zfKDy2tI/6Jeiwyk1P3trwEqBHDjzNpt6NotZTIFiEE/W0d/ZnE4XP6zWBUSCg1gH9NzJyOXuoRkO7j1QMBjmmfxlDoeSZY1wPuSp1o6/hUVylleDZs8hrX79falVyre3w4LdnCAqPkq3k4V04+JTVIyBc42dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDANhBkc8QVomqkcXiK4L7RcGe5Epnl8Ui8zqFtlpS0=;
 b=bNUoF2Wum/p/0KBqexyk1y7SgrSyovMExdI9KBW4XQCEzV31K3qmh+sFu5GdZZiv1d7se8q40uzcYNAr2EJtiJtHvrnFnmwlKZ6nFuDMugVi5qdxVKYSaZpVu+joZ7ASQhbsJlcFLxpvmasxV74rkuQZ1NGaLqRTCqjiL8/Exo1selmbtJDXqwJ/pvuSSPgcH6E090EQvCKz+q03Z0rg43ylA9NoA+TNLNfhPA1EW09HvS3IOZv1bMgTPN1Yh7XYwblQLnvcuDYWn6cT/ZT8XLb+TeVb1hRTRk9g07JTgKLpBo/AWVoD7IYQ3/iUxG3USkfiKT5mclIyF8nobQjeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDANhBkc8QVomqkcXiK4L7RcGe5Epnl8Ui8zqFtlpS0=;
 b=5cktR1FRD/cYJ8lkrgYX8RwaEoelCobwvl35mjArdxJnJU1k5jv1dwQNRlOb3753M8xibPtkUYshPmDkBXqOGDXixijVEEijAcEs6DqSDqHHLZ7/651eajfk2cmEDZw8xUu+6rl11+LmhbMjM4g2lwZKn7l7EUKQv73z4+M7abk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Hongda Deng <Hongda.Deng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <Hongda.Deng@arm.com>
Subject: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
Date: Wed, 20 Oct 2021 18:10:21 +0800
Message-ID: <20211020101021.9793-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3526b82-e820-41ad-0b7c-08d993b1df78
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2091:|DBBPR08MB6105:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB61058BEF30EB3624FAE35CA1E6BE9@DBBPR08MB6105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5H0WkS0ajXlOvtauoU/cCbpztD3V/99oL3j+RqxFQ49H9hbd/2vsM9JRK/tQTdysaOtqkLJfXTAa9ZAgXTilo/qkQkzVFQPk/1fHkrmHd+2wPgOSyeQ7eSgUIRR8KDOIFYsWZS2tJXjPSII/70srQ+2BYWEGDi+xSB6y0fskJRQeI2bTh50MPFEW5T6XDziQOfI+dnrbPNzQ981JKoURnRnXklhD4JxsPhJ1A3bh1YYSowhA/Q+QbFwmjaUR8z+UYhqHgU+PVvvHUV84zKI5EX7zdRV+0wwJ81n9gA8ol0r44v5PW5wsHvtkV9LBNimi9zTogYFE23s3el1MPGg8t95kZR4N2JjUbaB50iOqNBPrIhLh1NwII8kmqvN4bkGbCQWJ72XbQ6rLiFRrY+FDJNYnoyHTY4VCrHvNNjdkoXxHdrpkmzPA3nFwDG3zXpT9qHBP1dZK69Flnx5dZ42dRKGWOS9ArEeWrEDxLuD+FC+ZA3lpsO1LM2X4A+HJ+eJJt5i4oXvf4xVfOGxwfDvBbBhRqDUvEn4/cBya28hSJcJjSclJnBC4QuqluaPkwSSL+OkYkUZNtwS6G07bQi54k0v9JYBvpao3S+2qlwyEjE85jxL2H3H2eEdYDcMB2knhsFzyCILPn2E+gRypYyxm01rjVMeuk1oa7E5zG1WZFNULc6Sw2Zk/UrxkU9yL3fczwXd8M+XwncfpWAWJ4WIkmhG/uYr8fWcYl2N1+xmPhta2e7R16BpwnBYS3L52ER+JY676px/2h0Mcd69c/hH5quYEOAopm93W67NLAvICYfg7KEtyZb+T2YlZKbFvkj0P
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(70586007)(70206006)(186003)(26005)(7696005)(110136005)(6666004)(966005)(54906003)(508600001)(86362001)(36756003)(8936002)(316002)(1076003)(2616005)(426003)(8676002)(81166007)(4326008)(356005)(83380400001)(82310400003)(36860700001)(2906002)(47076005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2091
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1d089a1-72d6-4c44-5e0a-08d993b1da07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozfNYeKkboAcp1XSHua6lV7jQDlrc3ohJou0/GhSMK2SbZsyiTJS9ZuFsb7DVtQSBw0t3j1ALA7o732HYnwosOur5SHKPhXLADWL4bENO3DjnuGBfD3K6aVJvTXqvYK31tXZAxYJgsHTjnNR9Hm9iD0x+VjVcyQGdnfHFu0waynD0PSoHRdS+6eE8M9sc0PSl+WyBD6XRr1c4JpGPPI+zFPEB7UTvDBRt0zJdjhcjGAW1XaCts5+jXHc99Gk70VaIJMY5jVIlZLVSOLHUzPfY7Je9f6I5JiXiqQADITYH4qbxH47gWOR+6sA7mgbeYdm21ziziI5OSEGByg4y4T78NIClUanOoUN7e9Ba48kHCqjdyiQOuvNrRSrozkFE/J0yp2GbNcla7DmHFiUPStWbt7Hy2RM5NY7e/Dnjrd5U05E1fONSZzik0S2SNJ/n+VPzLUpAM8E9nUzosIM2oNH/VOM3IepT2Ztvx0D+BhxhX8ju3TEREeOOe2ni5RIDbLplCy5RAWyL4yUDNC3yS+qBQchSoaTXvzYuYTM/TRdNgBCLFQret08q8+csPXNp8JpLsWqXPTHksBCt9zqic79PPPw4G7KKpFlFvnSzArIlKCLPROZ7a0KbossfrmMnVm429SUEIRKREbtCvAVl+6liLdV7kvCyPK93pPUkGlVUUluj1Zm7AQ1zJvms3/eq58yhUcTSTSb6QGldZ5/VUQgjhPdnQLrMM4o8KPxY9qeJ4Q1f2uR+e1ADfsISCcl/hEPxV9oKiaiUvtomFbcDNJ3MM6r882WM8BaBn6EJ3Zynmw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(8676002)(26005)(81166007)(70586007)(36860700001)(110136005)(336012)(316002)(54906003)(1076003)(186003)(4326008)(86362001)(8936002)(2616005)(426003)(966005)(7696005)(508600001)(6666004)(70206006)(47076005)(2906002)(82310400003)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:10:41.6247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3526b82-e820-41ad-0b7c-08d993b1df78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6105

Currently, Xen will return IO unhandled when guests access GICD ICPENRn
registers. This will raise a data abort inside guest. For Linux Guest,
these virtual registers will not be accessed. But for Zephyr, in its
GIC initialization code, these virtual registers will be accessed. And
zephyr guest will get an IO data abort in initilization stage and enter
fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
we currently ignore these virtual registers access and print a message
about whether they are already pending instead of returning unhandled.
More details can be found at [1].

[1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274

Signed-off-by: Hongda Deng <hongda.deng@arm.com>
---
Changes since v2:
 *  Avoid to print messages when there is no pending interrupt
 *  Add helper vgic_check_inflight_irqs_pending to check pending status
 *  Print a message for each interrupt separately
Changes since v1:
 *  Check pending states by going through vcpu->arch.vgic.inflight_irqs
    instead of checking hardware registers
---
 xen/arch/arm/vgic-v2.c     | 10 ++++++----
 xen/arch/arm/vgic-v3.c     | 16 ++++++++--------
 xen/arch/arm/vgic.c        | 36 ++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/vgic.h |  3 ++-
 4 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..7c30da327c 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -481,10 +481,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
-               v, r, gicd_reg - GICD_ICPENDR);
-        return 0;
+        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
+
+        goto write_ignore_32;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..4913301d22 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -817,10 +817,12 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
-               v, name, r, reg - GICD_ICPENDR);
-        return 0;
+        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
+
+        goto write_ignore_32;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
@@ -987,10 +989,8 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     case VREG32(GICR_ICPENDR0):
         if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
-               v, r);
-        return 0;
+        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
+                                                 info, gicr_reg, r);
 
     case VREG32(GICR_IGRPMODR0):
         /* We do not implement security extensions for guests, write ignore */
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 8f9400a519..0565557814 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -726,6 +726,42 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
     }
 }
 
+void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
+                                      unsigned int rank, uint32_t r)
+{
+    const unsigned long mask = r;
+    unsigned int i;
+    unsigned long flags;
+    struct pending_irq *p;
+    bool private = rank == 0;
+    struct vcpu *v_target;
+
+    for_each_set_bit( i, &mask, 32 )
+    {
+        unsigned int irq = i + 32 * rank;
+
+        if ( private )
+            v_target = vgic_get_target_vcpu(v, irq);
+        else
+            v_target = vgic_get_target_vcpu(d->vcpu[0], irq);
+
+        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+
+        p = irq_to_pending(v_target, irq);
+
+        if ( unlikely(!p) )
+        {
+            spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+            continue;
+        }
+
+        if ( !list_empty(&p->inflight) )
+            printk("%pv trying to clear pending interrupt %u.\n", v, irq);
+
+        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 62c2ae538d..abcaae2969 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -298,7 +298,8 @@ extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
                         enum gic_sgi_mode irqmode, int virq,
                         const struct sgi_target *target);
 extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq);
-
+extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
+                                             unsigned int rank, uint32_t r);
 #endif /* !CONFIG_NEW_VGIC */
 
 /*** Common VGIC functions used by Xen arch code ****/
-- 
2.17.1


