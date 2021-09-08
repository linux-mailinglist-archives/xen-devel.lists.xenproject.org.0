Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB951403760
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181626.328891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI5-0004Jb-Bf; Wed, 08 Sep 2021 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181626.328891; Wed, 08 Sep 2021 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuI5-0004GM-6M; Wed, 08 Sep 2021 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 181626;
 Wed, 08 Sep 2021 09:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuI3-0000bc-HI
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:47 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78803600-1be9-494b-9e7c-8c98769411dc;
 Wed, 08 Sep 2021 09:54:31 +0000 (UTC)
Received: from AM7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:20b:100::24)
 by PR2PR08MB4715.eurprd08.prod.outlook.com (2603:10a6:101:1d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:30 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::c6) by AM7PR02CA0014.outlook.office365.com
 (2603:10a6:20b:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:29 +0000
Received: ("Tessian outbound 7a08471b1ef6:v105");
 Wed, 08 Sep 2021 09:54:29 +0000
Received: from 3afc8c350cb9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BF624EC-5049-42E5-91B8-05FD44A495A4.1; 
 Wed, 08 Sep 2021 09:54:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3afc8c350cb9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:23 +0000
Received: from PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::28)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:19 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::6) by PR0P264CA0184.outlook.office365.com
 (2603:10a6:100:1c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:19 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:22 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:20 +0000
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
X-Inumbo-ID: 78803600-1be9-494b-9e7c-8c98769411dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9Xvps1nERdmkV37FMndb6oyhfDMDttEJab3tc9qnbU=;
 b=1H8cRACXBw54AoXOv2bne/IOQrNzoRv0sd/p/MJbAF88AnpkiVAXBPMUNkNf6C90X/04q6vQwpnX9Xg4ng8RMCtZiRR0U5Y/65h85Z5Eu4M71O9kmSmFUk011TbeEa5OyJPaz5fEO/ahpBd3heSrh6fz5JRpV1Kl1ZwD8Fz1eN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0110ddf03a380d5f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0twraB4bld5XI72+NKgCux4wCa47nDs3V13g+pTOdVQWU7vtAr2CXB9+S+rvaiOx40Jh9lRAVnfjmA9vha7fD+KFaTKBfR9eFFFOyNYTOhkbMkcCLe5kjT30IZwkJQaBF3S9gyOD5T0i30MfXw3Ij0pW0wljqE0mOikHrhtNO4F/7rilhGRw9jB1VsuFntWLhi70WuvifT+cesezQZm0+Gtf21QCkpbM41moDP299W3hTu+WNcqz8XcPjjDx7aovx/GaINPbVe1NGHjYFy5j5WHjdto8GbMMywE6e2I7Lp9LSRpcHrxDrIymJ0YAYrRf/NJqvrG0hJf1Ncw1kFptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q9Xvps1nERdmkV37FMndb6oyhfDMDttEJab3tc9qnbU=;
 b=X6dadGPLbA9nOHxzFsAjgNIUYzTwFTBWy9uXhLMA6vrznhcui89/S+m6zWW8bsvhN+3SwJ5nweeCNtkjIgG0SC34A1vbRITqGfyKxFpwrfsLzbcAppxmKRrHpDRfXDhXPP+uEiSHfBEI1HWX/oKrW/ICCdu1/oZN2bE+24UXfaNSMxWRgdUdiYtotC905KEhiyoj9i88P0xY3Vz3NrWarPqQme7OR6ZFIucis8Sqzct/uK3DzEpJDQt/DO5HA5O+546qTBpDBRNjcAyWzGOXEXqXOKWIzQA2MXSBU1q1v7IEuo4fM38bTF/o5P2nKySLYPRVcNY8nbBwAk1ZRK8VtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9Xvps1nERdmkV37FMndb6oyhfDMDttEJab3tc9qnbU=;
 b=1H8cRACXBw54AoXOv2bne/IOQrNzoRv0sd/p/MJbAF88AnpkiVAXBPMUNkNf6C90X/04q6vQwpnX9Xg4ng8RMCtZiRR0U5Y/65h85Z5Eu4M71O9kmSmFUk011TbeEa5OyJPaz5fEO/ahpBd3heSrh6fz5JRpV1Kl1ZwD8Fz1eN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v6 7/7] xen/arm: introduce allocate_static_memory
Date: Wed, 8 Sep 2021 09:52:48 +0000
Message-ID: <20210908095248.545981-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecfed280-6e87-429f-927b-08d972aea6ec
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:|PR2PR08MB4715:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB47156F4E6E7ED9018B5365F4F7D49@PR2PR08MB4715.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:644;OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1TxyTFqHUG3FWwPS6fkevvNE/gmvhc90TJ7+rEFAbKJ+HEy08xGdIwmdR9SwLc7eRazGAB8HveJVf5dh1UlzErAT+aniC/lek62ZqNEBDNEFrv4lKSGHxB8bJ7et/V2xDP9yKlfB5UwG7eGTNt/tUfPXJs51iwnP1J7jAPO88YHiDogaiqGMPZpARDQpvc3/SbOcDYBBmd+jlpvaoCeR1PLz7KgAUcr0kIZOdRJFDgBm1c07j8fhKMYgckNDdNnhT14DoxD0XTXVtVb9xIQ+s/gkR0uaeJktuGogs/LpBIb0e87WI2cpHIuQDAXC4Gyc6A2+ya8tFJ6VVjRApw1I/263PbWib/GT7AAuhJIfg8iobmN8D1JD5BoUaxBUYFzOhr7/8HhEyb/fIV3WZYT4pntE9++IlZMOJrBcC1ojGw205/RZ21UJqdBPKueR4x6TvVAja6eO63MI4+IKC5g6J1HXTTggbwmgQHy47DbouUrXKkdm7Ecpf8V/wR1JNzO/9VWSNBmaBFWcgZbkorYNGCyB9623jaPSIw0yh8AguY5ycoNSRVux85rza/qRFkjMSnPXwPSXpRr3wdUcFuvNSTyZsgTe6HP8U/ON6qWlCKzb8LgBb1dSPhLcR7ych3op0jjrwVFCo3ZzXZYR3c/CmycnkeOalTwGwoSMXiIVe5qExTu8HFJiGlLeNfnqcoSA9ETL+1P+Y/KYJbV6RHkXsw8GvlBZvrjNj6JiZY2bn/g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(26005)(8936002)(70206006)(70586007)(110136005)(54906003)(4326008)(186003)(2906002)(316002)(81166007)(82740400003)(7696005)(5660300002)(336012)(83380400001)(47076005)(6666004)(356005)(82310400003)(478600001)(36860700001)(8676002)(1076003)(2616005)(36756003)(426003)(44832011)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a1e78b6-238c-4d93-88ed-08d972aea083
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V3mU7NCkvMGrOPE7LXMqB7IInLn2g5kcbrhyRcuq3riN0jdwqdveK5w73qKRwz4rWyqrULvVVzjt1m9vNtAwC4F3ncCeeuJWSV5c0W3/ZsEpGide4yCQV7PL1Om33T6AaCOgX2l400zJw6h8fBZtoxOTXjBUpknXtHJpFLXqtfTtoWMVew+7+JHMVNIfFTqj0GmdccMnhrt2EIC1JORlXqAowMLNdVwAtyxHh48GbAT/PCOBL/4PfAEAqsuNeSAUL6xHKG1d2IHPCWnZqyd1XlFjuLIG0YJa7al6MDQHkzYZ9vdhZdCTXhp2lWI8nwBLaVEVlaa3KbGpXjPYILnGEuqOmoKipclnnev0n0zxZrwBpsXQ5ExB5U9Sa56dhtqefWu45g2sIgf/s7R0Q6jmF6UH0T8SYpCrvQbTooHbkeRjjAoCVxyZ54RfvwhtikZl7kcrDDaxHQNmjeUhImqj1nlzownv0qqKyY7ndAMvhQT5qIOEOEUWXGlLES46SRIZB5cT5ZQ+aFisMRUtc3goIg5CF9lJywIRGj514xa2yYNA7n5NpfmSclL9kRWbFBPVyCEYxy8KPOEnOcVLsONge94pHIUR+BbEDt3t+V0E3bEo+iTJR4kd+e7+Z/e5gMM12ikT4O3KrNXnE42kJEVPvQzG2QbGNo4yVB97hCWYf4KqTsms98JHsyMWjdn9Y3DIVvKmq9NkDKDSum4TuO6bsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(2616005)(186003)(336012)(82740400003)(426003)(83380400001)(107886003)(82310400003)(36756003)(47076005)(8676002)(70206006)(6666004)(26005)(70586007)(8936002)(478600001)(81166007)(36860700001)(2906002)(5660300002)(7696005)(44832011)(4326008)(54906003)(1076003)(316002)(110136005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:29.9214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfed280-6e87-429f-927b-08d972aea6ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4715

This commit introduces a new function allocate_static_memory to allocate
static memory as guest RAM for Domain on Static Allocation.

It uses acquire_domstatic_pages to acquire pre-configured static memory
for this domain, and uses guest_physmap_add_pages to set up P2M table.
These pre-defined static memory banks shall be mapped to the usual guest
memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
a new function guest_physmap_add_pages to cope with adding guest RAM p2m
mapping with nr_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 161 +++++++++++++++++++++++++++++++++++-
 xen/arch/arm/p2m.c          |   7 +-
 xen/include/asm-arm/p2m.h   |  11 +++
 3 files changed, 173 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 206038d1c0..b011cc4789 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -480,6 +480,162 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+static bool __init append_static_memory_to_bank(struct domain *d,
+                                                struct membank *bank,
+                                                mfn_t smfn,
+                                                paddr_t size)
+{
+    int res;
+    unsigned int nr_pages = PFN_DOWN(size);
+    /* Infer next GFN. */
+    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
+        return false;
+    }
+
+    bank->size = bank->size + size;
+
+    return true;
+}
+
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    const struct dt_property *prop;
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, gbank, bank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize, gsize;
+    mfn_t smfn;
+    int res;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                               &addr_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
+        goto fail;
+    }
+
+    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                               &size_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+
+    /*
+     * The static memory will be mapped in the guest at the usual guest memory
+     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+     * xen/include/public/arch-arm.h.
+     */
+    gbank = 0;
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
+
+    cell = (const __be32 *)prop->value;
+    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
+        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
+
+        smfn = maddr_to_mfn(pbase);
+        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
+        if ( res )
+        {
+            printk(XENLOG_ERR
+                   "%pd: failed to acquire static memory: %d.\n", d, res);
+            goto fail;
+        }
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        while ( 1 )
+        {
+            /* Map as much as possible the static range to the guest bank */
+            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
+                                               min(psize, gsize)) )
+                goto fail;
+
+            /*
+             * The current physical bank is fully mapped.
+             * Handle the next physical bank.
+             */
+            if ( gsize >= psize )
+            {
+                gsize = gsize - psize;
+                break;
+            }
+            /*
+             * When current guest bank is not enough to map, exhaust
+             * the current one and seek to the next.
+             * Before seeking to the next, check if we still have available
+             * guest bank.
+             */
+            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
+            {
+                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
+                goto fail;
+            }
+            else
+            {
+                psize = psize - gsize;
+                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                /* Update to the next guest bank. */
+                gbank++;
+                gsize = ramsize[gbank];
+                kinfo->mem.bank[gbank].start = rambase[gbank];
+            }
+        }
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+
+    kinfo->unassigned_mem -= tot_size;
+    /*
+     * The property 'memory' should match the amount of memory given to the
+     * guest.
+     * Currently, it is only possible to either acquire static memory or let
+     * Xen allocate. *Mixing* is not supported'.
+     */
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to allocate requested static memory for domain %pd.", d);
+}
+#else
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+}
+#endif
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2453,7 +2609,10 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &kinfo);
+    else
+        allocate_static_memory(d, &kinfo, node);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index eff9a105e7..6e01e83967 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1293,11 +1293,8 @@ out:
     return resolved;
 }
 
-static inline int p2m_insert_mapping(struct domain *d,
-                                     gfn_t start_gfn,
-                                     unsigned long nr,
-                                     mfn_t mfn,
-                                     p2m_type_t t)
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 6a2108398f..f885cc522b 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -300,6 +300,9 @@ int map_dev_mmio_region(struct domain *d,
                         unsigned long nr,
                         mfn_t mfn);
 
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t);
+
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
@@ -315,6 +318,14 @@ static inline int guest_physmap_add_page(struct domain *d,
     return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
 }
 
+static inline int guest_physmap_add_pages(struct domain *d,
+                                          gfn_t gfn,
+                                          mfn_t mfn,
+                                          unsigned int nr_pages)
+{
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
+}
+
 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
 
 /* Look up a GFN and take a reference count on the backing page. */
-- 
2.25.1


