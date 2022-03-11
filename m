Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1F4D5B6B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288710.489677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYVz-0000JS-4e; Fri, 11 Mar 2022 06:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288710.489677; Fri, 11 Mar 2022 06:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYVz-0000GX-0b; Fri, 11 Mar 2022 06:12:39 +0000
Received: by outflank-mailman (input) for mailman id 288710;
 Fri, 11 Mar 2022 06:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYVx-0000Fh-8t
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e508a72-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:35 +0100 (CET)
Received: from DB6PR0301CA0014.eurprd03.prod.outlook.com (2603:10a6:4:3e::24)
 by DU2PR08MB7270.eurprd08.prod.outlook.com (2603:10a6:10:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 06:12:32 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::84) by DB6PR0301CA0014.outlook.office365.com
 (2603:10a6:4:3e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:31 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 11 Mar 2022 06:12:31 +0000
Received: from 1ad56a869f2f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 875CF326-78E1-410B-B6BF-F90B7F3BCA75.1; 
 Fri, 11 Mar 2022 06:12:25 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ad56a869f2f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:25 +0000
Received: from AM6P193CA0085.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::26)
 by AM6PR08MB4133.eurprd08.prod.outlook.com (2603:10a6:20b:ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Fri, 11 Mar
 2022 06:12:23 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::f1) by AM6P193CA0085.outlook.office365.com
 (2603:10a6:209:88::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:16 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:12 +0000
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
X-Inumbo-ID: 3e508a72-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjd0pcH7ozHk3VDSlSokBSzHTlMY1j1l8m/2mk3WqSg=;
 b=DmhPXjw758sy9rxwSWVWGLnny5SXk3oCf9q8p+wAHt5l+50+VWB+ui0sJZb4AtP8wlePs0dPvc/ghwHadl9w1ctKX+Mw4gNxU/QzXiXOogxq60NItugc1dhX2E93cahGKiK3NF2IAw/jNMiamOTyaIRTuxIllHvQ0C3C72Wz5gQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c6a9fa71984e4f1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGyhsi3QuCqAosuWtKxzwRl4UbYa6hV0HSiEIWfOZRW8Ww23wdy6uMvv5NROqaVPTFGyGucyEN0Gzj0atY21nouWyR/FlAjc25VTm8Xdih//8zbyWrEkyx3ncFCKrs2mpSY7Z9YsPtA8S6OgYJJl1ez0CTO8St3nSSOJ3gdk8mSztvNDjMF4BWfA3INp0DeLuV8niMURUcKuUtdA35JPvI7h4f9HBg70CcqPZnHEyw7NS3FRw8ySuuEOjJbrg+RFISO+GiMJtZE9jGebb0jEDD2CKpsQ2hw74x/ropKTPwC+xqAHqN0I3noVCLbvsTSTwKQmgISImta7Y9hJru+J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjd0pcH7ozHk3VDSlSokBSzHTlMY1j1l8m/2mk3WqSg=;
 b=bQqJZ97SwLM9ZcL/sALB0xTsekeMYV17Gxf7RhmKDFSlnuUeR9dxFcHmbYUeATCd+2JQOxR3a/DPOWBoPX5doWvjgA2OFjO53l2IAfgqwHnsWAguqYhcUKXpCLeR2yUpvf3TagPvFGQXCz/cbTvMlsp+3RS26pO855N6xy87IarkBObe2hLIU2Srhp3PhNo8bfvcY3+EeQ8Rn/47XHubJs2cqXiweC7Am1nSgGUTTiATJmLpmFvOq7ZZBmAm6fJeZnmNMEZkb5Tdk4SFZxd6sVx7yBqfIG+99UTwBjo/UV5bovZuTxl88GE+nV4T0fXQszMssaJ6oWtxKuAn8sugsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjd0pcH7ozHk3VDSlSokBSzHTlMY1j1l8m/2mk3WqSg=;
 b=DmhPXjw758sy9rxwSWVWGLnny5SXk3oCf9q8p+wAHt5l+50+VWB+ui0sJZb4AtP8wlePs0dPvc/ghwHadl9w1ctKX+Mw4gNxU/QzXiXOogxq60NItugc1dhX2E93cahGKiK3NF2IAw/jNMiamOTyaIRTuxIllHvQ0C3C72Wz5gQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Date: Fri, 11 Mar 2022 14:11:12 +0800
Message-ID: <20220311061123.1883189-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 513da211-a7df-49b6-41bf-08da032620b1
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4133:EE_|DB5EUR03FT047:EE_|DU2PR08MB7270:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB727042E4FF24D05CF8713E4DF70C9@DU2PR08MB7270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P/hsLU3xNMcr1w4ZnHynUL0R+VLd0/7EHAHcPJo8FHCncdq2R2mM1HcZJEuu0XvQKkSydmhMkoWdtZRaNM0M0QEM/xuMMbw0PvCOUXCkg/3F9hSmrELWjZ4YUymG4/2KpW5o8pvkzYW2X4CVewpW5830+HjgT+Mvq/S3hSX+UcWhcO9SwjGbrW5tjP38xpq9MgRWPvZGdaKk7n5sRWw3hdSi5WXotYFg2jFSY/jwek6hyMSj+b3/Ga8HtVQscuGNxJa46AVw9a9luKEmyKuCXljYi0k+KC88PfT5fa1GsSQMdvA44d+aLl7HQk2V/WeWtzlGJ5uFFqAt3NEjhx7EOlShRBgaXuekSEUIGnEl4OrxyN7HkD9u9hd+w4pBqbh1wLqOaFKS5g1vpvzbOm/ZPlCUYPirT1qGzXrpyLhPZ9pjVzMBT9JPXx7dKv8oMQXcaXhYUevxY0/gTEfgQh98se0x/sHyiKkVrur3iorPyFa08iiovXxCbwmyI1wlgXMHzNyYPeLgFCy/inmzn0p0PQeYE9sEFlLb6xtEgX29FNfpgkIW/QE83bXhGCaGUJ6f580ykQ9Js/4paSvoWt3EE6CWAYMSF5x+wBMUjjwT7HvtqpbhWsv0yLNVZizxBERgBTBv5DbPw1LvRq9rmGjGVYpD1NXZFoAUgCcNFX1vBI329AT4tjLFTREUZ/dHAV6HuSrthkZGiK48cwYTLpLVTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(1076003)(2906002)(36756003)(8936002)(316002)(6916009)(186003)(83380400001)(2616005)(86362001)(26005)(81166007)(36860700001)(356005)(70206006)(70586007)(7696005)(4326008)(8676002)(47076005)(336012)(508600001)(426003)(40460700003)(82310400004)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4133
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92d2a486-5316-4327-fd24-08da032618af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	laOn+NenWd6aZySIAVlfu2OLrjgF574+x3sceZzFKlProsyp1sCzFX4AdcUMGUQh7TkO63Wh2P2F3OF1bXItM0PSKei486Sxs+bhX7sj2+F3tgndTiu5dBbwh5Zj6RxWETj+EJg1gpFqM7NZuLmLvBVzi0D0/kFmH1LfeZvPVCS96oTVBXZ/Exz3fRnck4/JYVGdSomYtI3yzfw1rI3E3ijIR0OxWmZgLsXEQy7nGSdcLLCWFgGaC/NRaAaspSSNAM8PFszpr6BSazo79oBTt0tfaeHfb4OnTThUF8u5M2X6eD+F7PZTMjcKvRu2FaUCY25Jtd4GFmSDuMqyQfJpiNewYO2rmq9ZM0PIn4miLm8Qm99kBCIHlLZQvEiFK4lJ3BmCEn3AGQq8Rj2N8t1njE+Zbe9kNnW5OhZcm7aXn610s4lrFk8QYD3deFXVwy1X8Y543QvBlx3oXbf7CL+pTPoKV8ew/nMWIXdVP0MpIU5tQLvvsLIuohN5WVw5HM7zciSrUwAesH3zfMHt8j0khC25KCwBBReA+CQGf8MPzdWWIsnpUz8TXuuOR+SS+EeRDgLQPoSS84WYK/IZKhnpNgKcA69sdN9RpfOTLpWY8t9iGFkbZVePf8yNrT5tUx+fCsq6XGgx/NrxAsqH0EIRAjGG+d+eeXb1hvwmKz0KJjtK2g4p10jiHoprkz4E2DBp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(6916009)(70206006)(70586007)(8936002)(5660300002)(86362001)(2906002)(8676002)(316002)(82310400004)(4326008)(47076005)(81166007)(54906003)(36756003)(7696005)(83380400001)(426003)(1076003)(186003)(336012)(26005)(508600001)(36860700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:31.8474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513da211-a7df-49b6-41bf-08da032620b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7270

From: Penny Zheng <penzhe01@a011292.shanghai.arm.com>

In case to own statically shared pages when owner domain is not
explicitly defined, this commits propose a special domain DOMID_SHARED,
and we assign it 0x7FF5, as one of the system domains.

Statically shared memory reuses the same way of initialization with static
memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).

We intends to do shared domain creation after setup_virt_paging so shared
domain could successfully do p2m initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/Kconfig              |  7 +++++++
 xen/arch/arm/domain.c             | 12 ++++++++++--
 xen/arch/arm/include/asm/domain.h |  6 ++++++
 xen/arch/arm/setup.c              | 22 ++++++++++++++++++++++
 xen/common/domain.c               | 11 +++++++----
 xen/common/page_alloc.c           |  5 +++++
 xen/common/vsprintf.c             |  9 +++++----
 xen/include/public/xen.h          |  6 ++++++
 xen/include/xen/sched.h           |  2 ++
 9 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..c54accefb1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -106,6 +106,13 @@ config TEE
 
 source "arch/arm/tee/Kconfig"
 
+config STATIC_SHM
+       bool "Statically shared memory on a dom0less system" if UNSUPPORTED
+       depends on STATIC_MEMORY
+       default n
+       help
+         This option enables statically shared memory on a dom0less system.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..1ff1df5d3f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -44,6 +44,10 @@
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
+#ifdef CONFIG_STATIC_SHM
+struct domain *__read_mostly dom_shared;
+#endif
+
 static void do_idle(void)
 {
     unsigned int cpu = smp_processor_id();
@@ -703,7 +707,7 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
-    ASSERT(config != NULL);
+    ASSERT(is_shared_domain(d) ? config == NULL : config != NULL);
 
 #ifdef CONFIG_IOREQ_SERVER
     ioreq_domain_init(d);
@@ -712,12 +716,16 @@ int arch_domain_create(struct domain *d,
     d->arch.directmap = flags & CDF_directmap;
 
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
-    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
+    if ( (rc = iommu_domain_init(d, is_shared_domain(d) ? 0 : config->iommu_opts)) != 0 )
         goto fail;
 
     if ( (rc = p2m_init(d)) != 0 )
         goto fail;
 
+    /* DOMID_shared is sufficiently constructed after p2m initialization. */
+    if ( is_shared_domain(d) )
+        return 0;
+
     rc = -ENOMEM;
     if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
         goto fail;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index c56f6e4398..ea7a7219a3 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,12 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) (d)->arch.directmap
 
+#ifdef CONFIG_STATIC_SHM
+extern struct domain *dom_shared;
+#else
+#define dom_shared NULL
+#endif
+
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..f6a3b04958 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -855,6 +855,20 @@ static bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }
 
+#ifdef CONFIG_STATIC_SHM
+static void __init setup_shared_domain(void)
+{
+    /*
+     * Initialise our DOMID_SHARED domain.
+     * This domain owns statically shared pages when owner domain is not
+     * explicitly defined.
+     */
+    dom_shared = domain_create(DOMID_SHARED, NULL, CDF_directmap);
+    if ( IS_ERR(dom_shared) )
+        panic("Failed to create d[SHARED]: %ld\n", PTR_ERR(dom_shared));
+}
+#endif
+
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
@@ -1022,6 +1036,14 @@ void __init start_xen(unsigned long boot_phys_offset,
     apply_alternatives_all();
     enable_errata_workarounds();
 
+#ifdef CONFIG_STATIC_SHM
+    /*
+     * This needs to be called **after** setup_virt_paging so shared
+     * domains could successfully do p2m initialization.
+     */
+    setup_shared_domain();
+#endif
+
     /* Create initial domain 0. */
     if ( !is_dom0less_mode() )
         create_dom0();
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3742322d22..5cdd0b9f5b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -643,11 +643,14 @@ struct domain *domain_create(domid_t domid,
 
     rangeset_domain_initialise(d);
 
-    /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
-    if ( is_system_domain(d) && !is_idle_domain(d) )
+    /*
+     * DOMID_{XEN,IO,etc} (other than IDLE and DOMID_shared) are
+     * sufficiently constructed.
+     */
+    if ( is_system_domain(d) && !is_idle_domain(d) && !is_shared_domain(d) )
         return d;
 
-    if ( !is_idle_domain(d) )
+    if ( !is_idle_domain(d) && !is_shared_domain(d) )
     {
         if ( !is_hardware_domain(d) )
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
@@ -663,7 +666,7 @@ struct domain *domain_create(domid_t domid,
         goto fail;
     init_status |= INIT_arch;
 
-    if ( !is_idle_domain(d) )
+    if ( !is_idle_domain(d) && !is_shared_domain(d) )
     {
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f8749b0787..e5e357969d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2616,6 +2616,11 @@ struct domain *get_pg_owner(domid_t domid)
 
     switch ( domid )
     {
+#ifdef CONFIG_STATIC_SHM
+    case DOMID_SHARED:
+        pg_owner = rcu_lock_domain(dom_shared);
+        break;
+#endif
     case DOMID_IO:
         pg_owner = rcu_lock_domain(dom_io);
         break;
diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index b278961cc3..a22854001b 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -359,10 +359,11 @@ static char *print_domain(char *str, const char *end, const struct domain *d)
 
     switch ( d->domain_id )
     {
-    case DOMID_IO:   name = "[IO]";   break;
-    case DOMID_XEN:  name = "[XEN]";  break;
-    case DOMID_COW:  name = "[COW]";  break;
-    case DOMID_IDLE: name = "[IDLE]"; break;
+    case DOMID_IO:     name = "[IO]";     break;
+    case DOMID_XEN:    name = "[XEN]";    break;
+    case DOMID_COW:    name = "[COW]";    break;
+    case DOMID_IDLE:   name = "[IDLE]";   break;
+    case DOMID_SHARED: name = "[SHARED]"; break;
         /*
          * In principle, we could ASSERT_UNREACHABLE() in the default case.
          * However, this path is used to print out crash information, which
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..2e00741f09 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -612,6 +612,12 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_SHARED is used as the owner of statically shared pages, when
+ * owner is not explicitly defined.
+ */
+#define DOMID_SHARED         xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 24a9a87f83..2fb236f4ea 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -618,6 +618,8 @@ static inline bool is_system_domain(const struct domain *d)
     return d->domain_id >= DOMID_FIRST_RESERVED;
 }
 
+#define is_shared_domain(d) ((d)->domain_id == DOMID_SHARED)
+
 #define DOMAIN_DESTROYED (1u << 31) /* assumes atomic_t is >= 32 bits */
 #define put_domain(_d) \
   if ( atomic_dec_and_test(&(_d)->refcnt) ) domain_destroy(_d)
-- 
2.25.1


