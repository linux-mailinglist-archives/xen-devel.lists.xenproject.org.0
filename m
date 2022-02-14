Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1C4B4038
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271071.465418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvQ-0007a1-Ch; Mon, 14 Feb 2022 03:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271071.465418; Mon, 14 Feb 2022 03:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvQ-0007Rd-5I; Mon, 14 Feb 2022 03:21:16 +0000
Received: by outflank-mailman (input) for mailman id 271071;
 Mon, 14 Feb 2022 03:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvO-0007B5-CV
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:14 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe09::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 285dd3ec-8d45-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 04:21:12 +0100 (CET)
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by VI1PR0801MB2015.eurprd08.prod.outlook.com (2603:10a6:800:8b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 03:21:09 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::c2) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Mon, 14 Feb 2022 03:21:08 +0000
Received: from c0aeb5dd910e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FE714F8-BF9D-4F72-BD1C-88F2E3E17C2C.1; 
 Mon, 14 Feb 2022 03:21:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0aeb5dd910e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:01 +0000
Received: from AM6PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:20b:b2::22)
 by AM6PR08MB4834.eurprd08.prod.outlook.com (2603:10a6:20b:c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:20:59 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::ac) by AM6PR08CA0010.outlook.office365.com
 (2603:10a6:20b:b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:20:59 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:02 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:20:56 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:59 +0000
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
X-Inumbo-ID: 285dd3ec-8d45-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d0zlUHuPGVdtqU2Zxo5Ydvr8hkysX87Lzm7MZgBpwE=;
 b=GIQPPv+IoohPF5PVyWHV8YnIOtdHsMpzbP7sneM/6n0t2gU2ANA+H4QVKzcsFNcOPIW8jM5P1EnMGGkg/Epgth6l03fXaDiKC4neO6HKMNf589CHR1vipPaD2Sqk/bKVyzcWntQmu8lCJAwyp5kaAMbdBGwese4+uP1C+PbBh6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c811310ce51801b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjn970oYqCajI24+Nn48qG+Gg/BAG6Jow34nhBv28T0fwmm5KuHgh8Np6JEZpL1d7w9CkJUArqCAoH/4JTVhdbcJhlOfmlrWuhLSY82PMy6Qy/7eN1IcKuGi87nyBprdNLnOwWe+kUpnmxEgDVTsspWgn171IL+EmwP+G6ckTGKuoQxAqRsm3K0PhKxuaPPbyN72f9Z3sBl7TiOWY8uzkezfkbLsXJfJmMX8if4EOfu/ANz+kd3IKxeenQSVGuDdt5ArUVRXowlvIs2oNOyeFT3ejpRT/ucc7IZDH/Qaa35wWxCkOyGWEENQag9aOfcYJ/+Keyn/TPJoL/VLPeFi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d0zlUHuPGVdtqU2Zxo5Ydvr8hkysX87Lzm7MZgBpwE=;
 b=YeCTwQp3olGEcJtgzoRwU2Q9eYUdkqd9ahcMkVYoNqH20iuFBFb3ctA80tNoKI2SF4+YoXysi21VFfFi4X2o0fwJmQdZwm8wI9xXmzr8eyCu5HpTjG1gr/KS1ryVrBQ93OrAL+y67LTcUHEUzHzMfZCdr5jsrCs3KFG4FsntVtLvriHUTfr+mNfmgOkIYE+ZRmd5oRwfleIA8jxPwzZv1HySCEy0u90OHzi6x6r84ewQ4ulwiXA6qn0OsI5EIvYSaWb4PUm2jXNgNa1X3sNwiy5jpGlq4oVowytP/UhsCY/QgLALlt+LTibk6/AlsUBTwTPq/6V5mos8YlmxBIGyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d0zlUHuPGVdtqU2Zxo5Ydvr8hkysX87Lzm7MZgBpwE=;
 b=GIQPPv+IoohPF5PVyWHV8YnIOtdHsMpzbP7sneM/6n0t2gU2ANA+H4QVKzcsFNcOPIW8jM5P1EnMGGkg/Epgth6l03fXaDiKC4neO6HKMNf589CHR1vipPaD2Sqk/bKVyzcWntQmu8lCJAwyp5kaAMbdBGwese4+uP1C+PbBh6o=
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
Subject: [PATCH v6 02/11] xen: introduce CDF_directmap
Date: Mon, 14 Feb 2022 03:19:47 +0000
Message-ID: <20220214031956.3726764-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 7c63ec18-bcc2-488a-3a00-08d9ef690af3
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4834:EE_|DB5EUR03FT006:EE_|VI1PR0801MB2015:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB20155156AE9701850C9E962DF7339@VI1PR0801MB2015.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:213;OLM:213;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p3bzuHgkvDc1pwwpyCUAydWwVYR+bobpg7XCrCpxjVrHtjTFIhaA8rI4lwpJHgToCDYv+7B/CAVxpLYae8uszExuvK7H/UhD+9XHXqy2TqT+6JMMheCMoUGWVPFLXLptWdhY7dOlCE5WsS+YXd1HNrKIXfWCvkkH4bCuZqBJDO1C2yggH/FzmMRsn0atMpbLozGfkWQHdxkZCR8GCM1dtgprgPxRlrr6cW2Z6sWyC2b55p18Icvxykfh2whzTU36wTlrh2uLPBPbmzEBCXonSVctUNj9QiAeI5yE8YE3c0uPXorgjQLcRF0B/vXW7WF//dopxFuDrcdgmFihyklewQ0dRI5xjVKTHkQj3MsGHc/6h/NO8spyWAHy9xGnxf8ciDlREInzXnx7jcT81CXhNyaS8A+xAb8LS/ozcWVskEn+6AliJ9A++6YOfWsqnaHX0mFbsU8e9729BXK/7QBATr14pLBjraL00t3w6zWGz3Om7k3UGIpCHwK36cvixImVzmARLlJ/RivQeNK7jIkSjJWDNxnR0qXpSbRRCKeX4Wj/k4EN2sRaMNjK2Jil+yHCABntLPT2quBAQ77z4oqbQMk3fxGF6/4Bw/I9/jGf1l9767mYXFtpCaAzX6e3scwqxYMW06vi2ClW2D+Z8bt/ZtTQ9s394VZDfkEDjuwFNU6mzFhU9tVB3BN5EvHR8lL1lrdqDBAnxpnQ4MBPbgM/TLEmIKp+8qlZUjTKiLZpmCo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(26005)(7696005)(186003)(44832011)(36860700001)(508600001)(336012)(426003)(6666004)(2616005)(36756003)(83380400001)(1076003)(47076005)(82310400004)(356005)(8676002)(81166007)(316002)(54906003)(110136005)(70586007)(70206006)(4326008)(2906002)(8936002)(5660300002)(40460700003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4834
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8e73cd8-c584-4be0-41a5-08d9ef690568
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SpDAuX+OUEqdbZcTcSxXLcGF9ML5ITITA48pBInlhM4aqO/KAVkOpM3BHCUw2u6TlzxcmLzTeoMK6izIVRUz4GDOlTmDt/QXm62ogBtYly2T05qxjaILjIyRASEux211gg/0Zw6Yq3cD0EqmLih1+rgEsx5ZBB7qyxb4rKvtYtBKm43thhc+txKuegzS8YCeSVqTEQbwNBd+KOKZPmgTjorNlshY9A4bfL/tREiS7RDKulZLsCyCfaZ57iwlJ9oetxOZgHCJNL7qVVzzxEIBsQDCCs60ZZMr1e9DBZfFTXTRECXE+0x8IKbUpCbtqM2d/G5AVJ4AwjQ321uLjfbtT6E/sIxlnqq24DRnztK6SNUGGSk/E8CPPEjUppPbnXkNZLuclguiZN38MX84na140hefxNNNoTRsE2kvO2mFk2sp+JGTZ1HJ6mfiMS7y0rXIDTrYOvvlGMHFCUb75AjyDo3SrNAusg2c4AyW1gtLcofFQta437pvpONlAzyvPq+IHD+raNaIwkKOFuSEQZt/RJuubCv2X0Jo5mEDGVVISmTcyHPVMBT/yX4mm7EDyscPkQneuFzKy19SkUEYkkZtke/xsTzlsdZjp+JQRS/Zir7WAl3RiYeCq8cmac3wu9f9IXIu9bqIiorFcQZ2MvEoHA1aOYXPvJN5Mnh+NixaVek=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(86362001)(70586007)(110136005)(54906003)(36756003)(4326008)(70206006)(316002)(8676002)(508600001)(5660300002)(81166007)(6666004)(8936002)(186003)(26005)(83380400001)(7696005)(36860700001)(44832011)(2906002)(47076005)(82310400004)(426003)(1076003)(2616005)(336012)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:08.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c63ec18-bcc2-488a-3a00-08d9ef690af3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2015

From: Stefano Stabellini <sstabellini@kernel.org>

This commit introduces a new arm-specific flag CDF_directmap to specify
that a domain should have its memory direct-map(guest physical address
== host physical address) at domain creation.

Also, add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.

For now, direct-map is only available when statically allocated memory is
used for the domain, that is, "xen,static-mem" must be also defined in the
domain configuration.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2 changes
- remove the introduce of internal flag
- remove flag direct_map since we already store this flag in d->options
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
---
v3 changes
- move flag back to xen/include/xen/domain.h, to let it be only available for
domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
---
v4 changes
- introduce new internal flag CDF_directmap
- add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.
- expand arch_domain_create to include internal-only parameter "const unsigned
int flags"
---
v5 changes
- remove const constraint
---
v6 changes
- comment and coding style fix
- protect CDF_directmap with #ifdef CONFIG_ARM
---
 docs/misc/arm/device-tree/booting.txt |  6 ++++++
 xen/arch/arm/domain.c                 |  5 ++++-
 xen/arch/arm/domain_build.c           | 14 ++++++++++++--
 xen/arch/arm/include/asm/domain.h     |  5 +++--
 xen/arch/x86/domain.c                 |  3 ++-
 xen/common/domain.c                   |  2 +-
 xen/include/xen/domain.h              |  7 ++++++-
 7 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4..a94125394e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -182,6 +182,12 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- direct-map
+
+    Only available when statically allocated memory is used for the domain.
+    An empty property to request the memory of the domain to be
+    direct-map (guest physical address == physical address).
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 92a6c509e5..8110c1df86 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
 {
     int rc, count = 0;
 
@@ -708,6 +709,8 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+    d->arch.directmap = flags & CDF_directmap;
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0fab8604de..6467e8ee32 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3029,10 +3029,20 @@ void __init create_domUs(void)
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
+        unsigned int flags = 0U;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
+                panic("direct-map is not valid for domain %s without static allocation.\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
         if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
@@ -3058,7 +3068,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, 0);
+        d = domain_create(++max_init_domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
@@ -3160,7 +3170,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged);
+    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9b3647587a..aabe942cde 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,8 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+#define is_domain_direct_mapped(d) (d)->arch.directmap
 
 struct vtimer {
     struct vcpu *v;
@@ -89,6 +88,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..9835f90ea0 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -722,7 +722,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
 {
     bool paging_initialised = false;
     uint32_t emflags;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index a79103e04a..3742322d22 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -659,7 +659,7 @@ struct domain *domain_create(domid_t domid,
         radix_tree_init(&d->pirq_tree);
     }
 
-    if ( (err = arch_domain_create(d, config)) != 0 )
+    if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index cfb0b47f13..24eb4cc7d3 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -31,6 +31,10 @@ void arch_get_domain_info(const struct domain *d,
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
+#ifdef CONFIG_ARM
+/* Should domain memory be directly mapped? */
+#define CDF_directmap            (1U << 1)
+#endif
 
 /*
  * Arch-specifics.
@@ -65,7 +69,8 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config);
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags);
 
 void arch_domain_destroy(struct domain *d);
 
-- 
2.25.1


