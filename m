Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D949DC00
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261246.452150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzea-0006fl-L5; Thu, 27 Jan 2022 07:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261246.452150; Thu, 27 Jan 2022 07:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzea-0006cy-Ed; Thu, 27 Jan 2022 07:57:12 +0000
Received: by outflank-mailman (input) for mailman id 261246;
 Thu, 27 Jan 2022 07:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYn-0000Xj-Qx
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:14 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3f6d853-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:51:10 +0100 (CET)
Received: from DB8PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:10:100::44)
 by PA4PR08MB6270.eurprd08.prod.outlook.com (2603:10a6:102:f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 07:51:07 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::1a) by DB8PR06CA0031.outlook.office365.com
 (2603:10a6:10:100::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:51:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:51:07 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Thu, 27 Jan 2022 07:51:07 +0000
Received: from 128d14ed8f60.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1D87FAF-AB90-492D-BF3E-CC1231DCDE9F.1; 
 Thu, 27 Jan 2022 07:51:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 128d14ed8f60.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:51:01 +0000
Received: from DB6PR0301CA0059.eurprd03.prod.outlook.com (2603:10a6:4:54::27)
 by VI1PR0802MB2222.eurprd08.prod.outlook.com (2603:10a6:800:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 07:50:59 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::a1) by DB6PR0301CA0059.outlook.office365.com
 (2603:10a6:4:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:59 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:45 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:44 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:43 +0000
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
X-Inumbo-ID: e3f6d853-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yHBHWg0SsFunO7nPJhF8c2G7ELWbJA5oRhqIflaUA8=;
 b=d5P/qfrM/9H0c1aCeiyKnXDQLD/pMPtQh6bW+sCnHutFJxAlUvHA0Sr6zIu2dWM/E9C1zjyptQZrM4cUlMfXu/qzCuJT/ftV3P1ElTTJIaRYlG+2B2BWn+SHorAQsz/CTt3OWClQ2uIxCmM3CIrwyUkcMLivpS4qj5O7rC6aAtw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39d3dce02635785d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3sCeeX6iDBJI6JRgzm49UHKoypHB5xNFA5ArlfzerTNTbZGONzdjCjEbTe3kXju9T/7m8KUwn5dlpRYUgyIEDioR0QKQ2swJarc1FqXP7C7wyUekryhaGCzH89pymnTLdtqjw4dqw8cvOG4yeSfTgWibUXSuWCieqSbk3IU9uUncXUq1J+ll+4RInDlBzMKq75MGwz6D11gsNeUfs0kBvTluTFsdY16Bzva2izk8LtJuPJo4yu1GBOwe1abBG+SSnj7baS2rrOcrlufWFs8E30nx22Vdz4xtUGL+uweGnvYsOXePWIXklJXctN4tFJX61rH23xQ1bUiGE2miAw/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yHBHWg0SsFunO7nPJhF8c2G7ELWbJA5oRhqIflaUA8=;
 b=O9L7xqK44URBEBrI7W0Qde/MUSjgpziODkLAg//bEwR7V1OtUt+SMsX7a+HQPa/bgh5y/FHNBA7A+2QxVmAeXLDP+wnyjXr58ngc1ZJYXdaHCtWOmZ/mDtEOmz9e5WOZew7mJtS+mhAkmRoM5D23tF4O/Ut0vZmijQHncAnHkN3gdcyJ/b+M3HmaiTDLdflyqbzCp49kAcaSAxKujazbNQQc2aztkoAvJ96t2oc/8B5ipY2EVK8UMbMxIWDhba8GgaP0k9SSA8HZNdDy4VtsY4pC8AjDUET5ycweI8Nnze5NeEwWEeDmUQuwq5fvZfGGNYEd5OIcyNWrMXZRulHHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yHBHWg0SsFunO7nPJhF8c2G7ELWbJA5oRhqIflaUA8=;
 b=d5P/qfrM/9H0c1aCeiyKnXDQLD/pMPtQh6bW+sCnHutFJxAlUvHA0Sr6zIu2dWM/E9C1zjyptQZrM4cUlMfXu/qzCuJT/ftV3P1ElTTJIaRYlG+2B2BWn+SHorAQsz/CTt3OWClQ2uIxCmM3CIrwyUkcMLivpS4qj5O7rC6aAtw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v5 09/11] xen/arm: if direct-map domain use native addresses for GICv3
Date: Thu, 27 Jan 2022 07:49:27 +0000
Message-ID: <20220127074929.502885-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: efed1adb-c521-4815-ef8f-08d9e169c718
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2222:EE_|DB5EUR03FT045:EE_|PA4PR08MB6270:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB627061297A94B90654AC3A40F7219@PA4PR08MB6270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UHSm05SWqe5cZnsxOYaicIDqe7MbFoVXxlJMaDxOtW2CGj8ZVv7oT5WsjJgKKKAZbLTb1a4MOKOchBJtQXXpHjSxZnqKt+tMpo0Q+0Gu6nlAoARIxwm1nLwnekXbqlQdWKmqkSYjUw7IHmNfmdStgffWuMa0at3ur557V9W6Tk3s/928PvAG5ttz5kxkJQn03gnPm+HWoKnUXWYN6IWv9dkZbzDFCIAhhEbQ6Xmhp8AFYc8Zvwny0REdIw5MI6fZQ+6DXWfNbv1gzVksAuvJhg0eP/cYqqAKOQ37FCcRzPdsq1E6vVvvw9KZRch5eIj0XxXJmsPd1vAsLeUsFTT+uAEjY4DOFNM/IiQZ72//zTpJLQFMWhuKOmv4Gx3SB/xc9Aic9WAEKNXvKVb6pbD+AydvPJtfl48qUP7Ory3fHAjVoXzWwTuohYRZQB5kDXoiYu0bZG2W2qKi6kNCCSEJy722PFBQozbl4MjgbggkAC2XqjkoCmG/UPFMeJnDUnfR8PyyrivNJOuTjgPP3t+vF42A+W5T17HDA6OWfky3DLKMseyVMSVK213TqIbF0f0mh4IWWFR/LdZlxD4sb0D+XK3vbfbQVw9V65PpGn8pH1zXfc6B/cGBNUDQVQz10YuirMqWgmagFlvbv+UIvx0YHW7fGWW5BGmqLUOc0g9/7QDzPhGo8LnrRgpLkBjBFbsAACnGAeDbWH6botCS36AKsnEWzdWRZ6xT2NYQBp33WAP9xMzuAY7umVzsCH+d2sg/gDWyvRMr7L/zZeY6BWugeUsI2ZnJLwDuJATJGPsuoqQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(5660300002)(70206006)(110136005)(336012)(47076005)(26005)(2906002)(36860700001)(356005)(8676002)(8936002)(186003)(44832011)(54906003)(316002)(70586007)(81166007)(82310400004)(86362001)(1076003)(6666004)(83380400001)(508600001)(426003)(7696005)(36756003)(2616005)(4326008)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2222
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8d1dfc7-06d6-469d-64da-08d9e169c215
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LiusU4IMJP+U82I2H6B9Gz7naw78BbZem8nVuLktRFMH7Izd/lU+Tbx0HiEsobwwjMpivPUBBKJvWBVBfEjwWBS7ZrSQg4B+ht5IZhej+WfHR9wjciVHp6YoVyhDwKO2C4439w4tmLr4o/9n1WyUpjTuyYfhplcII0MlFdNfHnp0x8uaLHcva5CpBCwgph4niiUwDVWn3TVrCj9S2ZL3TdOwbID22ZOygc+b7x1wu9jnFGt6K/BasI7pwHI15YW1M7w22dndCqBhCNxw7EuONrYrjlhJEnl8vM07hBG3gLjt7VvnWhPWTkD5CB4Gxh2owsGZNfP3m2gvri8XsF2wYq7U3S8EXDnRdIyiTCEsxQX0+D10/OCpsj2lIYJPYiYG2UeyvbgRZoyf8zS+4uozWiP4MVSMRbsHqjr5IJgGzYXTynD6p5FfMnDqLVe1UV/mbPdNR4GpjX/iPeppLOAeFy7RrUMbjISOmtpDQTvTBF1cV52CSc4ov8l9RJljDqz9/orOAQnpVo3UG1ACKv393qOTBfR/N7lpD14Zf+RcRQTQ3V7wZMFTzoUrPhkNcEp5lmViXqmAo6VgegOU+NuMveR9FbmGz7PtkbpL0h3sM6UVwpWMdOfDvxI0YxTWpQOKbsxPtzOII0opigmSle1lgzA+d9o+7C1hESTsQgKi0WLaSKpqy2dgO89zyTor94Oc699lsi7SPEESpTwTYX4l6ehuAutxSlBALDM6d2TOzSMeSntmXpbyHKvBitIKgOue4Y7IxFbDY13yeQOLUBC5hQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(81166007)(44832011)(70586007)(36756003)(70206006)(2616005)(40460700003)(8936002)(4326008)(83380400001)(186003)(5660300002)(426003)(82310400004)(26005)(1076003)(336012)(8676002)(316002)(6666004)(110136005)(86362001)(54906003)(508600001)(7696005)(47076005)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:51:07.7595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efed1adb-c521-4815-ef8f-08d9e169c718
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6270

From: Stefano Stabellini <sstabellini@kernel.org>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domain which is using the host memory layout

Considering that DOM0 may not always be directly mapped in the future,
this patch introduces a new helper "domain_use_host_layout()" that
wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
for more flexible usage.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- comment fix
---
v3 changes:
- the comment on top of 'buf' to explain how 38 was found
- fix res getting overwritten
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- free 'reg' right way
- fix comment
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v4 changes:
- refine comment
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c       | 34 +++++++++++++++++++++++--------
 xen/arch/arm/include/asm/domain.h | 14 +++++++++++++
 xen/arch/arm/vgic-v3.c            | 26 ++++++++++++-----------
 3 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a01dc60b55..cff2cb93cc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2327,10 +2327,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
-    __be32 *cells;
+    __be32 *reg, *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
+    unsigned int i, len = 0;
+
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2350,13 +2356,25 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+    cells = reg;
+
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    for ( i = 0; i < d->arch.vgic.nr_regions; i++ )
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+
+    res = fdt_property(fdt, "reg", reg, len);
+    xfree(reg);
     if (res)
         return res;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index cb37ce89ec..848fec8a0f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,20 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) (d->arch.directmap)
 
+/*
+ * Is the domain using the host memory layout?
+ *
+ * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
+ * To avoid any trouble finding space, it is easier to force using the
+ * host memory layout.
+ *
+ * The hardware domain will use the host layout regardless of
+ * direct-mapped because some OS may rely on a specific address ranges
+ * for the devices.
+ */
+#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                   is_hardware_domain(d))
+
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 65bb7991a6..144089a7b6 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * Normally there is only one GICv3 redistributor region.
      * The GICv3 DT binding provisions for multiple regions, since there are
      * platforms out there which need those (multi-socket systems).
-     * For Dom0 we have to live with the MMIO layout the hardware provides,
-     * so we have to copy the multiple regions - as the first region may not
-     * provide enough space to hold all redistributors we need.
+     * For domain using the host memory layout, we have to live with the MMIO
+     * layout the hardware provides, so we have to copy the multiple regions
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
      * However DomU get a constructed memory map, so we can go with
      * the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
+                                       GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1669,10 +1670,11 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( domain_use_host_layout(d) )
     {
         unsigned int first_cpu = 0;
 
@@ -1695,10 +1697,10 @@ static int vgic_v3_domain_init(struct domain *d)
         }
 
         /*
-         * The hardware domain may not use all the re-distributors
-         * regions (e.g when the number of vCPUs does not match the
-         * number of pCPUs). Update the number of regions to avoid
-         * exposing unused region as they will not get emulated.
+         * For domain using the host memory layout, it may not use all
+         * the re-distributors regions (e.g when the number of vCPUs does
+         * not match the number of pCPUs). Update the number of regions to
+         * avoid exposing unused region as they will not get emulated.
          */
         d->arch.vgic.nr_regions = i + 1;
 
-- 
2.25.1


