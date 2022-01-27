Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9C49DBF0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261222.452106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYf-0002a0-Fb; Thu, 27 Jan 2022 07:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261222.452106; Thu, 27 Jan 2022 07:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYf-0002Vd-8a; Thu, 27 Jan 2022 07:51:05 +0000
Received: by outflank-mailman (input) for mailman id 261222;
 Thu, 27 Jan 2022 07:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYd-0000Xj-6Y
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df22b873-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:51:02 +0100 (CET)
Received: from AS9PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:46a::33)
 by VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:57 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::9e) by AS9PR04CA0039.outlook.office365.com
 (2603:10a6:20b:46a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:57 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 27 Jan 2022 07:50:57 +0000
Received: from 64383953ffce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE18489E-133D-4068-9C1D-E88C7A94542E.1; 
 Thu, 27 Jan 2022 07:50:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64383953ffce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:50 +0000
Received: from AS9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:20b:462::14)
 by AM0PR08MB5284.eurprd08.prod.outlook.com (2603:10a6:208:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:49 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::4a) by AS9PR06CA0022.outlook.office365.com
 (2603:10a6:20b:462::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:47 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:45 +0000
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
X-Inumbo-ID: df22b873-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8CtSJ23GsJakIevRnNKBt0vBQ8CUngOOT5AcDXX548=;
 b=MUWYoiRlmLlGeKcBomXuCxRIRI0rJ9n1X8NHwTEFB5uo6gMXOBk2wctW/JB1MPitV3ru8dhKhQtv+bcrv9VYPzER2FZPoaeLhQHdQiA7pppRE709Kgq1iOydI0UkEl/H6mYx5z6TpxsQYoGiFEROCftXZM9uTtJjemN0Zptgrgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a3dd52fa7e5f5e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtlDUKZCSdazox97n0JYFSKN8IDFf9Rw6Ds8BBHbwG6JoXrsP6KS1SQ8rPVnV+EJHgirz3tEr7vZCkbXIuQFZ8RHYItknTns3/KK21xRV9NofofQGDAUhUbveRdjy8iaIhyJQ/Ab2Q9hU3COXV8GfoSG7IA2yy6Uczajagt0nCEZs7j0DII+oS7dM1CawzsweotiWwrvOEW9/MM0CHl9f6RnNLBUOd4KfLkI2+9xC8Xa4jAkpVUZuqMdyEXXFFeGWeKDvEXB6QzSUmDF1YkbXajwJryL/OHBePNPTW8R7e4s+ranuuRYq3S2N6JiVvzXKnj5CyjjbmEojwgWAfNtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8CtSJ23GsJakIevRnNKBt0vBQ8CUngOOT5AcDXX548=;
 b=f0icKa2Et5sF6boMTWRyKWqdExipo2uW6PX/GEwpNii3bpOCEF+DBFKsYrBhUELooRc5osHjQTB8A6G4z0KcQjaqd8OGXXe6VUMPGeN8pFIkc88Dt6MfVnPhakiLQ9/ziSAkG5NVXjqCCndOeEjpBZ/GUa6UOcctLDr+7VKOsLScT1Sy216eaOAjDosx4kUXXm1aTv9weFi3RAGQOD+UevA75oe8XPJ1lbCZBDrBKX2/SdplHLF9hPvlmmehf0ZY4eNfiZn0fDqbUpDiJyEq7wIxNf34PnZKC8U0nwLJ5495yQrC6mAtRB1kpHJBAD6FfSU0TThl0N+P4BfkRj8yOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8CtSJ23GsJakIevRnNKBt0vBQ8CUngOOT5AcDXX548=;
 b=MUWYoiRlmLlGeKcBomXuCxRIRI0rJ9n1X8NHwTEFB5uo6gMXOBk2wctW/JB1MPitV3ru8dhKhQtv+bcrv9VYPzER2FZPoaeLhQHdQiA7pppRE709Kgq1iOydI0UkEl/H6mYx5z6TpxsQYoGiFEROCftXZM9uTtJjemN0Zptgrgg=
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
Subject: [PATCH v5 10/11] xen/arm: if direct-map domain use native UART address and IRQ number for vPL011
Date: Thu, 27 Jan 2022 07:49:28 +0000
Message-ID: <20220127074929.502885-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: daccd649-5a00-4051-036a-08d9e169c108
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB5284:EE_|AM5EUR03FT023:EE_|VI1PR08MB3693:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3693F6E054A3E014B723B2A2F7219@VI1PR08MB3693.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ini/MalvR427+EcTDQvf8NVgUWbWdQqp6aiadtzQRcuTIf1pIaLU2vhoOHNMHb74f1UDbcTt7/0W3KFWk1apnhrNhLq6F6cJ2w6qcJW8bBtuut4dEP8HhEup6fTf7i9zbsTQ90sZgGd6aEWVGjGn3C5SST4NMCFXKChOfLrTueSvGPXhykliM2aXBJmYYcfGRA+P8u030oKbONVX/+WCRS7BbOuka4Lsv8mwERkISBcvqIW/RPAwT2yojPzZMqWoaT/nWPWI4jyvPEWZ9Fl/9A4t5nInJHK3itSJGXt1eOQaYrTojIjl9MnPZCwSTylQKEHpIMYg4EztK2rBuyRLVSUmx86hA4MiGRTf3kPCkoPzJHsUbpT9f+nxO8vurYQsmrE8+HHZNgqeYncuc/EhUunALsOD7casEsIeQLHj293xJZAIT6NVWTH/hcgzhpqj/jzI6RcOU+l5wwXzqVdUWA9kdK5V/Kylb4HaxSJ2yDUeHdb/PtC3ijYBOdmGYmD4pecDFXSYEkSfhgTZI5nvt76X29pJmXS610SnW7Wt3NbXwpmQNOyCCWYA45i7GmsM6rAVNk+PlDuoCewjIUNS7PAEd3SzOAiFyZJHxiaa0PYUX/+u+DxBktWYghqh3/c0iakfVjYqgdEt/NDFfwDUX32TyyKOeXw7t9QdF7BcHkHxXbDmhCEgRTdvrPM3vr43+DUbj6fJuzeWicSS9lUdhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(6666004)(70586007)(70206006)(426003)(336012)(8676002)(8936002)(5660300002)(4326008)(7696005)(508600001)(86362001)(316002)(54906003)(40460700003)(110136005)(356005)(44832011)(2906002)(81166007)(2616005)(1076003)(26005)(186003)(47076005)(82310400004)(36860700001)(83380400001)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5284
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0aaa8d1c-3a95-47ca-4149-08d9e169bc1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QzCHNVuQV6uzGxJSnVf2wn6H2kqcsiYMLgiaqW/P7xdyV25D5hcGK2TKgaW4zyJ3djgo4fO7RoQryCF76BKLhG4JZzkhLmDqEmPUOO3NVUfmqH5lXsJuW4EBbifhFZBSJfAeKJ1m2e/JPVcuB+UJuVOuPlca/0Jwvugw6SuH3P+40H/LFYT1kGCJ4U2kswVHyt9ny7EZumT1Xs2PfnGXG7BUwlXhnrpcEkI2KjpitvzyTf8A1oQ+PMxcyPR1NaoAi11cgdeGqlLbZsDtCg6xqMUJe7OEC1pziseXf7VVG8SOECKZ2qyes5OPfv0bbi0wlwNL0ySDlGA2uSHt5oe16luFBUpl1TzyLbO8bGbraFOWmNdk7RHMbjtgZ4kicb/gWzC03je4smBrjKoJpfDBzeSXkUmFBODujAW1OE/AA8c1N59HFokW1DjElG6unBqZUP8haWoT2Zb2NSHFsaCtqWSDzTH1YBHw3oE7d1X/jtpuQWB7EAP1mDgsw53/zl19AHYVejVSPY2wRd+SyduxEUioLD7RcoCNBdw8bPMgNQkFnrHmyRlX6/fshjAD0N4wfVEpQjFYgjOctLl6ftA5BMDowUGcsQTz1k01hkOv4rk8FYCQqyG7nt1Qx1LzlfOycjzk7Lh32sv/GxVYQDnhngy0KqARrU+8MRxG6/uNwgx30753B2GP+P8Nh7qCplB3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(36756003)(186003)(86362001)(1076003)(6666004)(26005)(2616005)(40460700003)(110136005)(316002)(47076005)(508600001)(44832011)(36860700001)(81166007)(5660300002)(336012)(70586007)(70206006)(8936002)(8676002)(4326008)(82310400004)(426003)(7696005)(2906002)(83380400001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:57.5354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daccd649-5a00-4051-036a-08d9e169c108
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693

From: Stefano Stabellini <sstabellini@kernel.org>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for direct-map domains.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than GUEST_VPL011_SIZE.
---
v3 changes:
- explain how the '27' was found for 'buf'
- fix checking before dereferencing
- refine comment message
---
v4 changes:
- refine comment message
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c       | 44 +++++++++++++++++++----
 xen/arch/arm/include/asm/vpl011.h |  2 ++
 xen/arch/arm/vpl011.c             | 60 +++++++++++++++++++++++++++----
 3 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cff2cb93cc..8be01678de 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -2415,8 +2416,12 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2426,14 +2431,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
 
-    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
 
     res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
@@ -3145,6 +3150,14 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
+    /*
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be done first.
+     */
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -3153,9 +3166,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -3200,15 +3210,35 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+             * set, in which case it'll match the hardware.
+             *
+             * Since the domain is not yet created, we can't use
+             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+             * be hardcoded.
+             * The logic here shall be consistent with the one in
+             * domain_vpl011_init().
+             */
+            if ( flags & CDF_directmap )
+            {
+                vpl011_virq = serial_irq(SERHND_DTUART);
+                if ( vpl011_virq < 0 )
+                    panic("Error getting IRQ number for this serial port %d\n",
+                          SERHND_DTUART);
+            }
+
             /*
              * vpl011 uses one emulated SPI. If vpl011 is requested, make
              * sure that we allocate enough SPIs for it.
              */
             if ( dt_property_read_bool(node, "vpl011") )
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         GUEST_VPL011_SPI - 32 + 1);
+                                         vpl011_virq - 32 + 1);
         }
 
         /*
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..43522d48fd 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
+#include <xen/serial.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
      * status bit has been set since the last time.
      */
     if ( uartmis & ~vpl011->shadow_uartmis )
-        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
+        vgic_inject_irq(d, NULL, vpl011->virq, true);
 
     vpl011->shadow_uartmis = uartmis;
 #else
-    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
+    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
 #endif
 }
 
@@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -626,6 +629,49 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    /*
+     * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
+     * where the hardware value shall be used.
+     * The logic here should stay in sync with the one in
+     * create_domUs().
+     */
+    if ( is_domain_direct_mapped(d) )
+    {
+        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
+        int vpl011_irq = serial_irq(SERHND_DTUART);
+
+        if ( (uart != NULL) && (vpl011_irq > 0) )
+        {
+            vpl011->base_addr = uart->base_addr;
+            vpl011->virq = vpl011_irq;
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Unable to re-use the Xen UART information.\n");
+            return -EINVAL;
+        }
+
+        /*
+         * Since the PL011 we emulate for the guest requires a 4KB region,
+         * and on some Hardware (e.g. on some sunxi SoC), the UART MMIO
+         * region is less than 4KB, in which case, there may exist multiple
+         * devices within the same 4KB region, here adds the following check to
+         * prevent potential known pitfalls
+         */
+        if ( uart->size < GUEST_PL011_SIZE )
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Can't re-use the Xen UART MMIO region as it is too small.\n");
+            return -EINVAL;
+        }
+    }
+    else
+    {
+        vpl011->base_addr = GUEST_PL011_BASE;
+        vpl011->virq = GUEST_VPL011_SPI;
+    }
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -661,7 +707,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
+    rc = vgic_reserve_virq(d, vpl011->virq);
     if ( !rc )
     {
         rc = -EINVAL;
@@ -673,12 +719,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
 out2:
-    vgic_free_virq(d, GUEST_VPL011_SPI);
+    vgic_free_virq(d, vpl011->virq);
 
 out1:
     if ( vpl011->backend_in_domain )
-- 
2.25.1


