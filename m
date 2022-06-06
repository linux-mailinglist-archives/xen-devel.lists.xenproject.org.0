Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57A53E03F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342286.567397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43v-0000Iw-45; Mon, 06 Jun 2022 04:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342286.567397; Mon, 06 Jun 2022 04:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43u-0000Fc-Um; Mon, 06 Jun 2022 04:09:54 +0000
Received: by outflank-mailman (input) for mailman id 342286;
 Mon, 06 Jun 2022 04:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny43s-0007op-UE
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:09:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 833f7a36-e54e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 06:09:52 +0200 (CEST)
Received: from AS9P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::9)
 by AM6PR08MB4950.eurprd08.prod.outlook.com (2603:10a6:20b:ea::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 04:09:49 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::1c) by AS9P250CA0003.outlook.office365.com
 (2603:10a6:20b:532::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:48 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Mon, 06 Jun 2022 04:09:47 +0000
Received: from 762fe3f51f72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BCC5203-6EFE-4C16-91A0-14043C0652B0.1; 
 Mon, 06 Jun 2022 04:09:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 762fe3f51f72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:41 +0000
Received: from AS9PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:20b:462::34)
 by VI1PR0801MB1759.eurprd08.prod.outlook.com (2603:10a6:800:5b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:39 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::49) by AS9PR06CA0012.outlook.office365.com
 (2603:10a6:20b:462::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:38 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:39 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:36 +0000
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
X-Inumbo-ID: 833f7a36-e54e-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fxYbdHYa8asQcYDJv0n2fVU+OsXbw9xW4PW5kpexPlTjug+wJiIgWQTWtC7ZARpJFE+NgwUz35lJrQ0H5L5kGYAlh2h2TMCpPSS7e20NiHW8aaqM1/ZYL+47NhE8JeQF9t+C9yKj+612Vfwd67oopkYn+iqOBZgdNDUjv7Be4RK+OfHQk1og6Z3mkfI2saC6u6IR8EXGvll3y1MjKdl3P5p1IqSopGdhDtM7maw69GW/N+irPeic9O/hJmUw4cR4YSozsMFkpzznwSSqiOheSnYc4JZ1fxo+JYR2yo6T2iv8v5u5skqRct4mNObQ3lTZ7+53EFsFCuLc+597ElsZAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=BOQv2qYshyelR5e2vEGcmCaURjDz3T08zosgXAkocUCFgVYSWqa4+6qkLFdWSWABCgkdejDzAdWbQUnXx9Ce35f0jGyM1vs8G2GYo2qeApYr8c6ZvuLsDY25kRNhwcnHmc1lM/E5lLVULX4icsIBe8AC6VSZHj4y6pjY/CdCnaUBidm5lMTumI5JDpIFvRag0RXcsB7RG4tdWb2IU+u/OsMyJGam7ikCBWtnScEXVpqfV55bVrokeUOUehkNY16HN7Xkx8l+BdWxjIzfjWAs8qRG4pvRAaT4BtSCQ12QII3PAm59gxB6y5z57Z4gKgM44PjpSyy0GM3hxxsFPiaa8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=xW/j8+qFLv8pbDzYo4QwzKcXANDdkeC8bfXuRdxT0o/OknYKjgm0i2JML5RLV2JHdZXnDC9L0tvS6OsmKPsDQ/iCpFANwMvgbW2Ot0NCbU8pZl0yriaqSl6nU93aeEskWDQ7jxxNxgsxJYf9pBLDkv6yRrHB8U2YSHimlA3h5iQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 647a2828cfb7d5e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGDXm5uZphA3M0atgeqP/kup1VWg4qjSqU/GwAG1xy8TL/flRgnjwFqSF9H+xIiI23PPaWT6BckQQC0Nmb9jVnv7kDk+NInItLn4+V/7+RXHuFN8k0ASq/bdKYwq80S9aB81hwiaRpCbkU/JncQVWZqtyUo1LPY/0+d8Qv3Xha9GugXUgf+COoPu0WYIRu6gM5b3EIIhHlNqCJRuzp2CGPja1YCGn9wUEYapD1WPR7n1Zjo1/WdTQUFvl1dzV6lvLT7JZ1rw4YIZTZmBlT60a7VRKNqxrWN5lt7kHB9RT+mGbiTPotVtwb77ZY5OHBcQOGpODg6vJlyZFPe9/q7GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=T5xhqDadgerMt7tCG34LjGOA8sX5b5dvKN6Q1auOE35DUX5uoh9CIFEsov8VxfVwQZAJp44hCcr9mwf6OdqclTJS1f0r5PUssY8pVj7za9OT8XYaGXhdeibDsa+Y1i4Sn9/qfTKFzJbTvSaHDaJSgK0nBGjfulSpV69ggjrT3ADqEtwL8oTJ1/tllJVIJQlDoh6RFMMbKIHC+jmFmifEiAw1Jvr+s8Esgi+EzxJa1ElG7w76CiX9mWHiJz0c3nGTSVCOrp4Og8ZgfUrT5sS8vMd3+pwqiJoHOgySNEMbwdW28IsRqwk8yQ/IbMalPwwCPb3iMdmLyxngQhxAUC0Vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=xW/j8+qFLv8pbDzYo4QwzKcXANDdkeC8bfXuRdxT0o/OknYKjgm0i2JML5RLV2JHdZXnDC9L0tvS6OsmKPsDQ/iCpFANwMvgbW2Ot0NCbU8pZl0yriaqSl6nU93aeEskWDQ7jxxNxgsxJYf9pBLDkv6yRrHB8U2YSHimlA3h5iQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v5 4/8] xen: decouple NUMA from ACPI in Kconfig
Date: Mon, 6 Jun 2022 12:09:12 +0800
Message-ID: <20220606040916.122184-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cebca336-03f6-4e7c-fa4d-08da477265a8
X-MS-TrafficTypeDiagnostic:
	VI1PR0801MB1759:EE_|VE1EUR03FT037:EE_|AM6PR08MB4950:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4950CB4DB9AB639DDEB928D29EA29@AM6PR08MB4950.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MQ4rVsW4luiQfddiP0f1Ce7HXL+Rh6ViUwEFg0Wyunh9AaiVqNccENb0c+3y0q4/1/oLXP4l5We/qHkUe1VmRuIF/lKaoD7HOiJC+NZktkLCZSrcdH1FDcnK8ItYKgImMvBt/Lz/lg1NqwMj787crkETEg/cBQ1QpMAonAVumHLZFhGq6Rv6bO6fNwKdk6wv1Twq1OKHBinG6ZUYKSyx5qzWq8gvyJ0DuqOjGvGf9DrYOIP78z6j7z2PirAIzJApRyeIU4fK6ltX8i5cCNBr9rPlQlNJcEd9phVQzIahm76+/X2ZZpX1gJoRgiCDUmctvIU95cEinY5jHHhVNDHIUnzNfzhOiSTYLfmz1ie2v1+P7Upp/vhdYsBFlg8EBGdjZIe0aGSBTfqtUkOah5QUv2UO1BncYH56lAn77OjkZfM1UArhRywplEVBL+xh20UZf/1FoPbAO4eerDOqVUxEL9PwLsblDyp/eOYAVZmbyi7q/kFazAm2dPukub6I5ykS+3rGFZqpvdLgXwVCGxGks68zc9NObdfREYO7Y/UUSO06u/9sREBEDfOUyAwEq+wT2TK3SDQI/X+e1mroFUoGajLv1mARBRUJQQ8MfVkwRa8Hmqejz36kuHvbMjiHsq/R60fvGeHckAYYjcr4OvFmP4f0GNQMop868C71+Vaj8An8tJHl/GUDRm7j/3urVk+k
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(508600001)(6666004)(82310400005)(47076005)(7696005)(36860700001)(86362001)(4326008)(5660300002)(36756003)(2906002)(70206006)(70586007)(186003)(8676002)(2616005)(8936002)(44832011)(1076003)(83380400001)(54906003)(356005)(6916009)(426003)(26005)(316002)(81166007)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1759
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80b6b823-920b-4ad5-9223-08da47725fb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULd/RJRei9xnfDZisnjm1y5kdwVyj7kzFlnZxYoyl4Tvhe5uAvwAgwZ/E8kwi73DZpBbQQlbBkb/eJ+U20f2UFitKVdHw5TDXBtc77EffQwkFshlEhBoRD01quTWSKghN0EKHHyxUX+pv+q5LMo0nTUfC2/BR0kQa5k3066z3RvOBgggkvXAqMsXpx8Jgw257EtWb7XGEEDitXgjr3E0cPQvrHTXL6dd+h28S4rR85ePo4DkGXqMamp7eXXuxx3waFLJda4DZSYqv1WUQXO2nQl522Ud8lcmPDIxH/Fyty5MaDUPLYq8G+o81Tifcv4wOSwz/tOP/wAk2ZgCXRkZ6IB4UtHSCnpFl1rMlkS1evBrb2ozZrl8Z1bqe+hAPzi5QuBbLUoiDZLkXAlghAf4WdStbzvWtnnfEETUVTIQLCKWNcSx2o30yxvM2F0jUa8Vo5Sq+JkxQfiFLmEqgEO2fFdkSMFYFIhgVkdsvM8Kae/1bNLB5jIpjul+92SwtXbjWasl5+mgS/FpYkbr09Df9xr7bUF5kWECnHtb3a0NAGfW+BMcSUWCPWygj+XkT876zHagbZTx95MboODySpPUZIk/RFlPEwTSDaEeokBYaiHISviDemFv6Jk8z+9ZwVySpnYV9d4ykrOUZxXGhCtxMA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(7696005)(1076003)(6666004)(2616005)(26005)(2906002)(54906003)(86362001)(426003)(5660300002)(83380400001)(186003)(44832011)(336012)(8936002)(36756003)(316002)(81166007)(82310400005)(70586007)(4326008)(70206006)(6916009)(8676002)(36860700001)(47076005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:48.2635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebca336-03f6-4e7c-fa4d-08da477265a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4950

In current Xen code only implements x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In a follow-up patch, we will introduce support for NUMA using
the device tree. That means we will have two NUMA implementations,
so in this patch we decouple NUMA from ACPI based NUMA in Kconfig.
Make NUMA as a common feature, that device tree based NUMA also
can select it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
no change.
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/drivers/acpi/Kconfig          | 3 ++-
 xen/drivers/acpi/Makefile         | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc864..1e31edc99f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
@@ -26,7 +27,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index de20642524..07bcd15831 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d61..d65add3fc6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -70,6 +70,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index b64d3731fb..e3f3d8f4b1 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -5,5 +5,6 @@ config ACPI
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
-config NUMA
+config ACPI_NUMA
 	bool
+	select NUMA
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 4f8e97228e..2fc5230253 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -3,7 +3,7 @@ obj-y += utilities/
 obj-$(CONFIG_X86) += apei/
 
 obj-bin-y += tables.init.o
-obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
 
-- 
2.25.1


