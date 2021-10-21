Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D0436109
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 14:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214372.372893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdWnV-0001PY-OR; Thu, 21 Oct 2021 12:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214372.372893; Thu, 21 Oct 2021 12:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdWnV-0001NV-K4; Thu, 21 Oct 2021 12:03:49 +0000
Received: by outflank-mailman (input) for mailman id 214372;
 Thu, 21 Oct 2021 12:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=El98=PJ=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1mdWnT-0001NK-UV
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 12:03:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0fcaefa-3266-11ec-8376-12813bfff9fa;
 Thu, 21 Oct 2021 12:03:45 +0000 (UTC)
Received: from DU2PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:10:28d::30)
 by DB7PR08MB3675.eurprd08.prod.outlook.com (2603:10a6:10:4c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 12:03:43 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::26) by DU2PR04CA0205.outlook.office365.com
 (2603:10a6:10:28d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 12:03:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 12:03:43 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Thu, 21 Oct 2021 12:03:43 +0000
Received: from 277b236c3d15.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60EE2AE5-89E6-478A-8EEB-4F02B7B90E78.1; 
 Thu, 21 Oct 2021 12:03:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 277b236c3d15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Oct 2021 12:03:36 +0000
Received: from AM6PR0502CA0060.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::37) by DBBPR08MB4283.eurprd08.prod.outlook.com
 (2603:10a6:10:c3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 12:03:34 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::90) by AM6PR0502CA0060.outlook.office365.com
 (2603:10a6:20b:56::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 12:03:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 12:03:33 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 21 Oct
 2021 12:03:26 +0000
Received: from hongda-OptiPlex-7070.shanghai.arm.com (10.169.190.17) by
 mail.arm.com (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Oct 2021 12:03:24 +0000
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
X-Inumbo-ID: f0fcaefa-3266-11ec-8376-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeBrb25lkUg4ZFd7p9e/6q189g93hVFhDDKIOKHGx14=;
 b=WKPGnI9v+DRX5b2jSEJk0vlAaH63EUnSikruaPeKfhtNl37Af1cenhYApyPQY4iVjqIW+hw3Cdag5bYyqqkEnzqmC7Yn1/Rj9dEXL9T4ZiK800HylOTHfRyceeJybz8BXzABn4O9d7DmJlRIejONm1/ZAuPLyo6V5Wxi1DTgE+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfb73327011297c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTjoFus6SmyY9CzXQSh0V0seL8OVCh/57mPp3nhfwDD7unX4UyTktilUWdEjzJBn9+aV0f2rY02E2KF5jzGgO6rivk4+HWYWX341hGuaZtSGQ0yS+tNMsSkFgqnhIbHZir2dHhJFcjoP0CDD/4SbHLHGUSLA6nKWGekiEBUqxmyiAtMudy1AiurYi1Dl2I3iZOXFtueMAsXCHpwcFQVgUZ+JusJVsxJzTVykzXfLskvUdrmjYh2IVKIaMP5xYgnmqfN1YrPnb2XLm/A+I79HqTN/UtUXJqNkYyF9COONAmMkfI2ZBCtLyEsxw09PWaBeUbCXn8u/LctCIPUVyQ8cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeBrb25lkUg4ZFd7p9e/6q189g93hVFhDDKIOKHGx14=;
 b=Mx39xC8Fbi9miECHtGsA+hf99+pVJHNsiS0JS5l4pBLUMrWPV0w9xbcotIjvueHE4XaE85iM5uFkJtfKUfh2NDPpw2WOc9I/QytzPMnC/MK/M2WPj0S7rvks2BpxlAH5IPrrUnptWqy1iYnQ3G88Yyh9iQWJo9Xlch7tUpEigjayYgfeXITvDtSalujkOeWS+6c3xr5iVQciL/OqhRUI7SwMMdTZ/mKVPxnyzowp0zqZ9Q2uz5Ohn5qsI9JatqGMMxTVjK2jqQkupXIpjKHvdhGoATjFqwiAD+jVqJkQNF3ZNBhuTai4lrQVgvoiUk6rGxdVa5Y/BgSF4YmO1ybVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeBrb25lkUg4ZFd7p9e/6q189g93hVFhDDKIOKHGx14=;
 b=WKPGnI9v+DRX5b2jSEJk0vlAaH63EUnSikruaPeKfhtNl37Af1cenhYApyPQY4iVjqIW+hw3Cdag5bYyqqkEnzqmC7Yn1/Rj9dEXL9T4ZiK800HylOTHfRyceeJybz8BXzABn4O9d7DmJlRIejONm1/ZAuPLyo6V5Wxi1DTgE+c=
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
Subject: [PATCH v4] xen/arm: vgic: Ignore write access to ICPENDR*
Date: Thu, 21 Oct 2021 20:03:19 +0800
Message-ID: <20211021120319.2394-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd7fddb-13d0-4789-44a5-08d9948ad407
X-MS-TrafficTypeDiagnostic: DBBPR08MB4283:|DB7PR08MB3675:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB367583354CDE56728B73F513E6BF9@DB7PR08MB3675.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HkydOcgx5QVwjzQfXA614k5VHslUMlvw/3oEQwPnmTLnEeBiuuxoy4Du+CsPRbT5aAxpslwhOgAH7I+2iSxP1GNzIYCod/muCMWP4fn/adv+pnrpWTgSygqujYoriYEYmvJdFCmLvv2f6i7YY+AQxQociO6Kw2sGQov2vOQ7yV5K+v146kkwCTiUiH5VC5X4Ug5V78WVYQHZkmsQlh+0hl4zb2KMbFbnqNpdlg2Ixc1pQBmrhrWxVZThZg4AYS8jFC2Mc/VTeZKbIrTXrSrJL3AiAxgzx/lkPoemI2WB9VBRGjSMJEaBOllX2mqxi8DQbPTFrKIo+jaXHTxdjJZseToar363oR6Fo2ga8eM0TPLV23A2aGft91i1pOqAgs2GSFwG88JCIcIYlhkh7+bImCD1EdH0Gm6iwtrXG/+oTQjcZmMvFlzGrNTqJnZjtqJYPfyMO/pvdMF/itTaW8M94rHfFKSCiKsSNv7Ap9ABl/oNcb+hb9KshpWKca3I7BbcsFYfih0os2uBSt/ETscIqYUm2fCRswJ+4un3vqctzhzV0TN/wmjxVxElCQ8oRwOVavp3YVQWV74FZDDkEufCDDIazte0bmAX/45LESbvstdDpaN13eY49FLeTKFkx17BSVlYh5IB22b7b+6ZZtjhhAA1tu+Nfx8yZpCWyquOJAZD/XVZg854drgBeCilcL1iYO5wcFd8dK8Qfs0E98nkNThAu5xH4zYRQQocpP/zRwphWoCDlmYx2OotSvTUkdkzycjW7Csmcl2F/z5Ejmsm8xW8+ANADr0fe2eMSL88vCeocHfuuxunxahUdZGwPnUg
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(508600001)(47076005)(7696005)(2906002)(6666004)(966005)(86362001)(83380400001)(26005)(336012)(5660300002)(82310400003)(54906003)(110136005)(8676002)(8936002)(316002)(1076003)(70206006)(36860700001)(2616005)(4326008)(81166007)(70586007)(426003)(356005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4283
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e91ccd5-8f8b-477f-0987-08d9948ace8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gd7Ewwkd/4cOTEETAiQMT2Rn6zAZhfyOAly3LXZBYiosPMpbdpgxxfZypyZ7tee/KhoI6ell7rtQ0xuelaujBaF4giZk3dHzj/R4WnQ/0BkF9S2VarTINpIIoxDof9Vp42rpfmmf3AcMM4NjAhxET359ZkRHqTWKRz+KaS2I4PF34OzlRMWqJ1IqL8ACMbb00icQCLbPc/cxIOQadFgO0D/Zpii8wMxRKG7SedquaHCcR5mYRi/H+f7LDC8kXmmFMsWKDCxu3Tkohrv+SwdeuYnWBZjHiggN5QSZW/h37o5ZvdgnP2hIJT2tmjvURMRLPX+7VFn3zHN++CYporrbOnNiMGoIa6Y1oumEUWtsNrIySKBzW9+w4zKhLIo5PYAS9OnSW/e6R7d50QrTsFvkzWI7qi7QnE1QdXGSWqBJDAwlxxHZiv/8fh7oHRh8MAQVBE23D6jN6Gmv4D2Cp4Ho+Hl3Yfceu9jkO5MgVyMmo8Uz8UNn4rgyQpX6USKpAvsqCAJ7xTTmoSqgwUp2JZ3ROo+70WLOcgva8ino3/tIgIFlgBHl+m+pCd0rRINlGpeyXyHAwjpmC3a+BWHIi9sW42ED97uzSa7WT7yMTneUzjqUwYO2gyF1zgG1Vj0+R3B5CXaRFXJu+wJs4TtZJWdVgMG6PMo3TPvrFtTcUif+e1xVmZlDeRIrgEpxMKWCgI4UGlGh/krFOb2cGkkdKXwM8nXT5vJe7wF3NM0s7nDjL6KLYxdgAULC3upenx46sdghj1JVH8OOi7nqN5KFfBIDf61RLKrP4yUdzUNMBrOwDng=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(86362001)(54906003)(70586007)(8676002)(316002)(1076003)(81166007)(6666004)(426003)(2616005)(110136005)(47076005)(4326008)(83380400001)(2906002)(36860700001)(186003)(966005)(5660300002)(8936002)(7696005)(508600001)(82310400003)(36756003)(336012)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 12:03:43.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd7fddb-13d0-4789-44a5-08d9948ad407
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3675

Currently, Xen will return IO unhandled when guests write ICPENDR*
virtual registers, which will raise a data abort inside the guest.
For Linux guest, these virtual registers will not be accessed. But
for Zephyr, these virtual registers will be accessed during the
initialization. Zephyr guest will get an IO data abort and crash.
Emulating ICPENDR is not easy with the existing vGIC, this patch
reworks the emulation to ignore write access to ICPENDR* virtual
registers and print a message about whether they are already pending
instead of returning unhandled.
More details can be found at [1].

[1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274

Signed-off-by: Hongda Deng <hongda.deng@arm.com>
---
Changes since v3:
 *  Commit message modification
 *  Change "goto write_ignore_32" to "goto write_ignore" to avoid double
    checking dabt.size
 *  Delete data.size check in vgic_v3_rdistr_sgi_mmio_write to avoid
    double check in __vgic_v3_distr_common_mmio_write for SGI
 *  Declare flags, p, v_target within the loop to reduce their scope
 *  Use the same vgic_get_target_vcpu(v, irq) to get v_target for SPI,
    PPI and SGI
 *  Code principle modification
Changes since v2:
 *  Avoid to print messages when there is no pending interrupt
 *  Add helper vgic_check_inflight_irqs_pending to check pending status
 *  Print a message for each interrupt separately
Changes since v1:
 *  Check pending states by going through vcpu->arch.vgic.inflight_irqs
    instead of checking hardware registers
---
 xen/arch/arm/vgic-v2.c     | 10 ++++++----
 xen/arch/arm/vgic-v3.c     | 17 ++++++++---------
 xen/arch/arm/vgic.c        | 28 ++++++++++++++++++++++++++++
 xen/include/asm-arm/vgic.h |  2 ++
 4 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..589c033eda 100644
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
+        goto write_ignore;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..65bb7991a6 100644
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
+        goto write_ignore;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
@@ -986,11 +988,8 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
                                                  info, gicr_reg, r);
 
     case VREG32(GICR_ICPENDR0):
-        if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
-               v, r);
-        return 0;
+        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
+                                                 info, gicr_reg, r);
 
     case VREG32(GICR_IGRPMODR0):
         /* We do not implement security extensions for guests, write ignore */
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 8f9400a519..83386cf3d5 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -726,6 +726,34 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
     }
 }
 
+void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
+                                      unsigned int rank, uint32_t r)
+{
+    const unsigned long mask = r;
+    unsigned int i;
+
+    for_each_set_bit( i, &mask, 32 )
+    {
+        struct pending_irq *p;
+        struct vcpu *v_target;
+        unsigned long flags;
+        unsigned int irq = i + 32 * rank;
+
+        v_target = vgic_get_target_vcpu(v, irq);
+
+        spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
+
+        p = irq_to_pending(v_target, irq);
+
+        if ( p && !list_empty(&p->inflight) )
+            printk(XENLOG_G_WARNING
+                   "%pv trying to clear pending interrupt %u.\n",
+                   v, irq);
+
+        spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 62c2ae538d..e69a59063a 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -298,6 +298,8 @@ extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
                         enum gic_sgi_mode irqmode, int virq,
                         const struct sgi_target *target);
 extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq);
+extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
+                                             unsigned int rank, uint32_t r);
 
 #endif /* !CONFIG_NEW_VGIC */
 
-- 
2.17.1


