Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B594429DAB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 08:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206766.362415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maBDt-0000Sp-R5; Tue, 12 Oct 2021 06:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206766.362415; Tue, 12 Oct 2021 06:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maBDt-0000QJ-Mg; Tue, 12 Oct 2021 06:25:13 +0000
Received: by outflank-mailman (input) for mailman id 206766;
 Tue, 12 Oct 2021 06:25:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBHH=PA=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1maBDs-0000QD-ED
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 06:25:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc608d6d-0264-4bb9-954c-d33cef620ceb;
 Tue, 12 Oct 2021 06:25:09 +0000 (UTC)
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by PR3PR08MB5659.eurprd08.prod.outlook.com (2603:10a6:102:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 06:25:07 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::49) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 06:25:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 06:25:06 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Tue, 12 Oct 2021 06:25:06 +0000
Received: from ea4fc242f4cb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B457C24-88F5-4AC4-BCC8-3935B5889CB1.1; 
 Tue, 12 Oct 2021 06:24:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea4fc242f4cb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 06:24:59 +0000
Received: from AM6PR10CA0058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::35)
 by AM8PR08MB5746.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 06:24:56 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::aa) by AM6PR10CA0058.outlook.office365.com
 (2603:10a6:209:80::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Tue, 12 Oct 2021 06:24:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 06:24:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 06:25:02 +0000
Received: from hongda-OptiPlex-7070.shanghai.arm.com (10.169.190.17) by
 mail.arm.com (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Oct 2021 06:25:00 +0000
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
X-Inumbo-ID: bc608d6d-0264-4bb9-954c-d33cef620ceb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiQbNkgxehEJ/Kbs58zs0bM/XHm9TcEKA9+pvY3XQmM=;
 b=HppvwCbpz3DJjQom08scRu5lWxKK1TEkDojwQlcDi4bim9jSzkBxlwC86Ai9QvXbw4Ct7yQbiLvGNUhMVzF+dWnHdAm2/mb7dIIhq4OiajTLdcw6GhiC9Bb2k8LhCR+Xl17hBv9GnuOcaTz/w+dQoYewb7Ch4uzSnJptvb3UknE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7235164e07cb982
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH7zQajXq+ZRrX5fhy5aZNB/RHofn4lcKclQkOc46YWX8jOfC8b+JVmb/QTOcIvXjPFcDhQ4FYLRAyXc5ZOLUfXqoO2J19Qfpmhnt116uSESpIAl2+tjHotYJ6hKnFesdicVPC72Z6VRG068kp7B6g9oWe09ClHDl+K1Lic/KUGU9gHYhXzwwPDbyexPzSwF1Fagt4CWNWuqSez8YY5LOeFObPoaKtdo3kVv/v7r9cIbQNcYLJf+3gMP6I/OcrDMU7EVNegYuXIazARN4Rd0ND1KlcyHMx+8Q0bxL2aeuPOCEq5w/XgW6cuM6tlHRpQzLmqlKdc7n/+ZK9/onPUQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiQbNkgxehEJ/Kbs58zs0bM/XHm9TcEKA9+pvY3XQmM=;
 b=G3CgCwDUz4US4xYWerCWbeeMrpgLpDMFlwMguMaTPV779I7kQOYSvHAtZLE1YtIapaNIuu3WFzjgIiHbIA7jtNll9tiCDG4wuuIKti7KZKG7n29A9h2X65rooV1H61Hgo66E0e0Icajn5+zIcTxZFIAH5t3Y+jY3VWIIoj7VEfFAGwMesJPu8XhHrdM1ci1Rbqw5eUVePeMOliwkmanjomVF6lNsYrBZN1VUbhsrAUYbFOm0XywWafEVScmPK1fVDFXeDEjURba2BhUKY55IAFHcMaNSZ/PAsIqhTMcPwgAC6TxivWdKl+j6wiwZTP4ma+st5/KIOwvY8Ie/Nj24LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiQbNkgxehEJ/Kbs58zs0bM/XHm9TcEKA9+pvY3XQmM=;
 b=HppvwCbpz3DJjQom08scRu5lWxKK1TEkDojwQlcDi4bim9jSzkBxlwC86Ai9QvXbw4Ct7yQbiLvGNUhMVzF+dWnHdAm2/mb7dIIhq4OiajTLdcw6GhiC9Bb2k8LhCR+Xl17hBv9GnuOcaTz/w+dQoYewb7Ch4uzSnJptvb3UknE=
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
Subject: [PATCH v2] xen/arm: vgic to ignore GICD ICPENRn registers access
Date: Tue, 12 Oct 2021 14:24:49 +0800
Message-ID: <20211012062449.30966-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99273ac2-3d74-4863-b9aa-08d98d4908a5
X-MS-TrafficTypeDiagnostic: AM8PR08MB5746:|PR3PR08MB5659:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB565994A0678B49E2CAA168F2E6B69@PR3PR08MB5659.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AY6xDQl4wOqYR8/yDOkp7+50z16Lldkq4fkm4QnaeDpUucC+38gA1rZ9O6XCOEq5btHhlA8x5Rp+Pyg7ClMHwd900qozC4mqhQb45NjTRDl5xFv84HRTthd8svmQw3QngxZA/CwJ/aUV/l4uKauTx+poZxSMM2VaqTXUSQOeDLcK30AiJiDxq41b+fpQ2kZbpKghzqPPoRvoE1LhNDqjD665NDNeoj9uSnZTivVBp3R1h9xX4HpzzS+rdDgnJsrTYLjuXGmWYc3wHZukYjDBP/U/ZuOITg+rz0QFxVFnwxejLsXu9sDO/iyai2heGomTJCwEN1YjDQvJSoTTPIzbJaXTRppbLIA1eWi4kME/Huk/ALo5cfAnKnQujd7058egLhHUWFldv8NDHD1RPDHBv3KDrJ98MvszRK5nRA2ebfHoTS3oC7+i8Ri0hFFyct1AEpkKIKAG1PNPxkOIkCJwyhMa6+moIIea0js/DpQihSxkAMaEaYcGjfyWp44KUsWxBOHy2AVpsVL9DlzEugXvChN/xTkjefsOzRnnX6uvQBhBCVlLjVuIF28VGrsOeCmBd2eT3X8s+zZ/9lmzj5apbi4PJwMIpeKtpYKTcEbmeSPf8XsxTAYQRQf827cRNEyCU0OkF4d/3Y0oQdOUlcfk0vxnG3wvHSGmZez1I1gDl/ISOZR/FhCEK3JsBNckJM2ZqEp+klOVdtR1PRhoAcjMslWSY/muPBPKm8G90dhn81jInEuMgw0KlQGEsYeM/HDlD5xB3ky4delIwSaFabUjKmaNzzZnaZp9yjcKvV6M3UiC6sqs2+lr30dcBTFeHX5h
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(966005)(316002)(54906003)(110136005)(81166007)(7696005)(508600001)(6666004)(356005)(26005)(2906002)(86362001)(47076005)(4326008)(83380400001)(36756003)(8936002)(8676002)(36860700001)(70206006)(70586007)(1076003)(82310400003)(426003)(336012)(2616005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5746
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	139193c6-eb4d-4bc3-d8d5-08d98d49023a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	stqtYa25Cq8a9nCvXInCgEHMR3uzyldPoEuA7uIP9OkSfU8Te/lrTgibQ06FaByWJOGEUEYXsHrVQhJAHVWBuC8NWWtEvq+q0cSgw/qZKtXbICkNeLFUFCfjyGYL0EcYTV9bWQhudP8uQZG53PZJMYyKaEoBvia430P7V2adWX91brdqPupJgsLR50Ms5yGHKD4btCYWE5ReToFUgm27htpiLeNQQMzAo1vAB6YvfiVKYissudyjNCzlXO9ohys/JviwIt/1D/YfIf1MAq7M/U/RJCBN0dLX7HlTZCkXdY0aHDBwfEWBHD5os7p+ZBgpjUWwsBQh5kwDReEBMHWuUMScnaF6nvrP7B9bce5Yo3EPLJaKiEXvFCBOSQ7rM/Immj4nN4ypuhxmBmZUPLgg/6cNnH/Dth6ncXw6CNd62KURru7kzIi6vq6UuUe+G8vtbpdJFjuSPknm7AMn47wI3TffqKJNm3QCqECOQ+itDXK6jd6BEyUy5t6kY7vphRx8tnwCNUQbGO180cnv/kTSROochl0Qz8iY5e8QzZzP+Gy5MIiVhYV4ICcAxpGDedyEKiViguedYNRmG7BD8oFiBwCPPfVJbbkRyRITsVoAvdUvfhTABeKwTkZ897TnprA4liIwp9pHJL1IZ3TJJY3Nvumt/kS04jr/QhmmqhsT+Ekg+tXAPeVb5MvcWKlU7SvKQyJqua4cNCS0SD9WHV/mUCIdWM0aVNdjJG6ter+wTUCieCNrN+QzrlDaxl9MQnglQMrFJx/RQmwbscXJ8ZH6Ow==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(70206006)(70586007)(86362001)(36860700001)(36756003)(82310400003)(47076005)(1076003)(8676002)(966005)(426003)(2616005)(8936002)(5660300002)(26005)(2906002)(186003)(508600001)(336012)(7696005)(110136005)(316002)(54906003)(83380400001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 06:25:06.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99273ac2-3d74-4863-b9aa-08d98d4908a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5659

Currently, Xen will return IO unhandled when guests access GICD ICPENRn
registers. This will raise a data abort inside guest. For Linux Guest,
these virtual registers will not be accessed. But for Zephyr, in its
GIC initialization code, these virtual registers will be accessed. And
zephyr guest will get an IO data abort in initilization stage and enter
fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
we currently ignore these virtual registers access and print a message
about whether they are already pending instead of returning unhandled.
More details can be found at [1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
msg00744.html

Signed-off-by: Hongda Deng <hongda.deng@arm.com>
---
 xen/arch/arm/vgic-v2.c | 26 +++++++++++++++++++++++++-
 xen/arch/arm/vgic-v3.c | 40 +++++++++++++++++++++++++++++++---------
 2 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..d7ffaeeb65 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -480,11 +480,35 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
         return 1;
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    {
+        struct pending_irq *iter;
+        unsigned int irq_start;
+        unsigned int irq_end;
+        uint32_t irq_pending = 0;
+
         if ( dabt.size != DABT_WORD ) goto bad_width;
         printk(XENLOG_G_ERR
                "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
                v, r, gicd_reg - GICD_ICPENDR);
-        return 0;
+
+        irq_start = (gicd_reg - GICD_ICPENDR) * 32;
+        irq_end = irq_start + 31;
+        /* go through inflight_irqs and print specified pending irqs */
+        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
+        {
+            if ( iter->irq < irq_start || irq_end < iter->irq )
+                continue;
+
+            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
+                irq_pending = irq_pending | (1 << (iter->irq - irq_start));
+        }
+
+        if ( irq_pending != 0 )
+            printk(XENLOG_G_ERR
+                   "%pv: vGICD: ICPENDR%d=0x%08x\n",
+                   v, gicd_reg - GICD_ICPENDR, irq_pending);
+        goto write_ignore_32;
+    }
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..243b24e496 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -816,11 +816,35 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
         return 1;
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    {
+        struct pending_irq *iter;
+        unsigned int irq_start;
+        unsigned int irq_end;
+        uint32_t irq_pending = 0;
+
         if ( dabt.size != DABT_WORD ) goto bad_width;
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
                v, name, r, reg - GICD_ICPENDR);
-        return 0;
+
+        irq_start = (reg - GICD_ICPENDR) * 32;
+        irq_end = irq_start + 31;
+        /* go through inflight_irqs and print specified pending irqs */
+        list_for_each_entry(iter, &v->arch.vgic.inflight_irqs, inflight)
+        {
+            if ( iter->irq < irq_start || irq_end < iter->irq )
+                continue;
+
+            if ( test_bit(GIC_IRQ_GUEST_QUEUED, &iter->status) )
+                irq_pending = irq_pending | (1 << (iter->irq - irq_start));
+        }
+
+        if ( irq_pending != 0 )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: ICPENDR%d=0x%08x\n",
+                   v, name, reg - GICD_ICPENDR, irq_pending);
+        goto write_ignore_32;
+    }
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
@@ -978,19 +1002,17 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
     case VREG32(GICR_ICFGR1):
     case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
     case VREG32(GICR_ISPENDR0):
-         /*
-          * Above registers offset are common with GICD.
-          * So handle common with GICD handling
-          */
+        /*
+        * Above registers offset are common with GICD.
+        * So handle common with GICD handling
+        */
         return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
                                                  info, gicr_reg, r);
 
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
-- 
2.17.1


