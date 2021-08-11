Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E043E8EAE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165706.302879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVy-0004Iq-Eg; Wed, 11 Aug 2021 10:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165706.302879; Wed, 11 Aug 2021 10:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVx-000419-OQ; Wed, 11 Aug 2021 10:31:13 +0000
Received: by outflank-mailman (input) for mailman id 165706;
 Wed, 11 Aug 2021 10:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTc-0000BQ-JN
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:28:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 658d4b88-1517-46cd-a6ad-d99637b41d30;
 Wed, 11 Aug 2021 10:26:11 +0000 (UTC)
Received: from DB6P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::19) by
 VI1PR0802MB2605.eurprd08.prod.outlook.com (2603:10a6:800:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:04 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::24) by DB6P192CA0009.outlook.office365.com
 (2603:10a6:4:b8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:26:03 +0000
Received: ("Tessian outbound efa8a7456a86:v101");
 Wed, 11 Aug 2021 10:26:03 +0000
Received: from a56e96869bed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF6DD913-B5AD-4DAA-A8DD-F819D57CC6B8.1; 
 Wed, 11 Aug 2021 10:25:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a56e96869bed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:57 +0000
Received: from DB6PR0301CA0073.eurprd03.prod.outlook.com (2603:10a6:6:30::20)
 by DBBPR08MB4489.eurprd08.prod.outlook.com (2603:10a6:10:cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:53 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::a7) by DB6PR0301CA0073.outlook.office365.com
 (2603:10a6:6:30::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:42 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:40 +0000
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
X-Inumbo-ID: 658d4b88-1517-46cd-a6ad-d99637b41d30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuwOyUAAWxazKiZukmts/nvTo8jdjdFUnue+r03ghW0=;
 b=WNQkYnDitYguyNwSUDkR8e/riYJEGzGBQSHPjqpZFGcZOBBDa+EDnv7l9wENaMDFO2ke09n7v8NKOdKont+gpSrd++PDzNw5eM8B3TmO5D+Nlw3TBh088zYwE8ET+Pgzj7skEan+DLCMONkeNKyEemfjwbgc+o7mEjpq+VZwFU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ade92c257371a15
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWz7lD1N9MQ+vVh0silXrGdk4dkzb+sv/sKRZi/Oc8ActucMqYVNJuY8SsylyG7I6CqTNwYksyo0WJ4FvTx9vudi1JfRYrYXwogCYsVunAg7ucsREZm3co+Ievb++H/0DIcSgv3YAJCi2VFd9AzOELH3gANF/2qcHp3M0ST/C0YOBqpkmdj8T8McknI7dasI1BspiBuxWiqDCVgBaN1gfhIdLMrYEQnzHETxsh5JKqjvXNeWl6sK0rx0/lRYMIt+uV9SYtGYErObHfi6hYAm/g4joG3fu3IGiv/Vz3Y4+X/TfQvpCiB6RKn4/oU3sgl4l/nHKR90UnorCr4kMi8pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuwOyUAAWxazKiZukmts/nvTo8jdjdFUnue+r03ghW0=;
 b=CGeSRkQuzWPv7F/djCsVS5t4UmEY/gXGpiieNVb5QApommbSef1GK6PKpM0jeRAkW4D0lOGxM3TkOH+WbBDARBa1J9Nf0MK7/To/kMBK3JoQr8rrdWFIl7Loj9UACSpwFQwmBuk+ZyEe9U+zx6zcQm5PmP9kd/mrsQaLe2nbp0T8aGJNEy4HPiF9NTCPRtGIqNcPPRuI+wsj2P/daz7ZLBRVrqKuIIo8w3ScDlUDEYUhV4mZvp+VZFNExkco8SKgQCMq4hbwV5JPz/VrTA9TPyhS1q6m7prLLshbzYfT9T8EIW2B9kz2PC77qyvkYN16QlRh/qVGfSYgLCkYxw944Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuwOyUAAWxazKiZukmts/nvTo8jdjdFUnue+r03ghW0=;
 b=WNQkYnDitYguyNwSUDkR8e/riYJEGzGBQSHPjqpZFGcZOBBDa+EDnv7l9wENaMDFO2ke09n7v8NKOdKont+gpSrd++PDzNw5eM8B3TmO5D+Nlw3TBh088zYwE8ET+Pgzj7skEan+DLCMONkeNKyEemfjwbgc+o7mEjpq+VZwFU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 29/40] xen/arm: implement Arm arch helpers Arm to get memory map info
Date: Wed, 11 Aug 2021 18:24:12 +0800
Message-ID: <20210811102423.28908-30-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3143298d-8e71-4901-e29d-08d95cb26c3f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4489:|VI1PR0802MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2605C51A7C5C1529054FBF2F9EF89@VI1PR0802MB2605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:82;OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BlK9ImNVQoWJUeHxG+MREZIj4864o+A8iVQP0q4pN85VY6TEeh/DsD09p3zwz3IVO2DDgg93DcFEsuMIN0XJ/5JkA43qjCr0XSPZMcSm2fX648zMmFJ4PNyqbw72NWP43UgO67k+L0uQweLhY4WeZjHI+wzQfYkL+FsKcy7f88a2j94FPlqmnLDhI3SQAbEyy76IsK3ApRJxsHgRwX7xir6W1aODv2HsOg+bxqLsvHklfwAAcSwTwF+KoxFs5CzeH4gfoRybcjid1uxzsOrCkvyo82JkEs3RmvA6rnc8nptXQ1VZTBSCMBXDBpEdLXm3dMmonprfawaMpUnY1GyOOJ50Y1tBKbUq9dwwchCa7YOZa3Bp3DCPGbtOZRu25INVVeIHZauDcfVbvI5Kcmb5FCgVvx0dFULdZHAyMVSyDz/5tu+S9mc6vhq5VGlfAkBbl0DTlPOpgRyQK4Sr9Fq0qurRglQpI6DrQl9gbjKpIYPEFwL3SnpoQUtGeBvrj0woOBH7bazHQ/Se1tYL70r5FXybEIWBphksNB8QGCcYIZJaRn6M6Hk4RxPLpq4Y/SIQnHMoz8UyPcO3evvGVpR2SS6GDRZi5sEo2P0/M2NsLaenKDBl13hVqxkJo5Y2efBG4BZOLgJq/36zWadEqiA73rhzl2fr+ukJxHoPoH907eODWildMJf2B3nlW2KDUdaHW4LUR86BHh1CDBY08G2QB/Jmz0CFuQNAbdRezmx7fGeeJj/HeAEIeuAUZGDALQuZ49OHuYOzxlpKb9OvKrJyr+gZhCprmv+kv+w3/eYR4PQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(2906002)(82310400003)(36756003)(81166007)(356005)(70206006)(2616005)(8676002)(44832011)(70586007)(82740400003)(86362001)(8936002)(83380400001)(5660300002)(7696005)(336012)(47076005)(1076003)(110136005)(4744005)(316002)(36860700001)(6666004)(26005)(186003)(4326008)(34070700002)(426003)(478600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4489
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec689fee-a26e-4c3a-6524-08d95cb2661a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVOnSUFiAQ+vvvJSOd2PTqquSYIKvJ5OzGZU7rykaBQL5VBZztowL7f5HfM/8UfHcTlMQqlXENgw2Farpw9bBV7mTvPx9nuhRtx0Sj9Jt5vcUXAiiz5M+8dbThGlhvK1v0ph0oLFsoMat3g4sa23/Xu1gRLd4uIHk6Fs1Fx7TwQfWYEe9uzM1OP504Gl70H2acZ7RaEWsufjZKNbUFjGqO+0b5rhmSqFdvzi9E1xR6LCxhnM0PX1TLP86J+2GyxHs3RqMyLSAOmPWL2lV8PtPQVnYsqF44WEwm1jahStk1AhMPyXqb/M/9G2Z+FAPEiUInNs9tHqaVXOeGmdQgBYJBLwfZJaRj8TlOfFAaZKb8BVmDZPOkkaJ9uG+0BCB/mhvdh61S3WOXdOEuAuJ92TISa1U6her1E/o1XPHtxHU9rZTJtUswrfNPXUWITRnwSJtZnlUD0iWzpvSZaXKV3hBFrBKqERPZaHT4j+5VAqYlWepf4faJW3O5I2gfZ/0+SX1gD69g3N0VksXdqlrd+R+lfd9cCgclYjOGl2HsGhu5OVFr6fucdLJbrPGeacAjzlpltOh+xfA5sQ3vyg6K7QYukmWUGgRTem80b4BP7hU7Fgn9SOCoJaMbnqE3OgbS0x8H7NuMQ2xrzAHwRLa7Q7i/bpeM9vPvk2EpiOK08NtV5dSqzYjV/DQ+ErTMEDYeSwaoBjmxZg/ALhpro8LnQuOLHk1t/86r+SaRU4wR2324Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39850400004)(346002)(36840700001)(46966006)(2616005)(426003)(36860700001)(44832011)(336012)(47076005)(82740400003)(70206006)(5660300002)(316002)(83380400001)(70586007)(186003)(81166007)(2906002)(1076003)(4744005)(110136005)(4326008)(82310400003)(6666004)(26005)(478600001)(86362001)(7696005)(8676002)(36756003)(8936002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:03.9596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3143298d-8e71-4901-e29d-08d95cb26c3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2605

These two helpers are architecture APIs that are required by
nodes_cover_memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index f61a8df645..6eebf8e8bc 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -126,3 +126,17 @@ void __init numa_init(bool acpi_off)
     numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
     return;
 }
+
+uint32_t __init arch_meminfo_get_nr_bank(void)
+{
+	return bootinfo.mem.nr_banks;
+}
+
+int __init arch_meminfo_get_ram_bank_range(int bank,
+	unsigned long long *start, unsigned long long *end)
+{
+	*start = bootinfo.mem.bank[bank].start;
+	*end = bootinfo.mem.bank[bank].start + bootinfo.mem.bank[bank].size;
+
+	return 0;
+}
-- 
2.25.1


