Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF7545BE8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345791.571467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaf-0006vs-FY; Fri, 10 Jun 2022 05:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345791.571467; Fri, 10 Jun 2022 05:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaf-0006sw-Bi; Fri, 10 Jun 2022 05:53:49 +0000
Received: by outflank-mailman (input) for mailman id 345791;
 Fri, 10 Jun 2022 05:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXad-0006br-LE
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b12a7e39-e881-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 07:53:46 +0200 (CEST)
Received: from AM6P193CA0110.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::15)
 by AS8PR08MB6840.eurprd08.prod.outlook.com (2603:10a6:20b:399::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 05:53:44 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::88) by AM6P193CA0110.outlook.office365.com
 (2603:10a6:209:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Fri, 10 Jun 2022 05:53:43 +0000
Received: from 76bfde828f41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3459B700-23A7-461F-9F45-6105FD6E087E.1; 
 Fri, 10 Jun 2022 05:53:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76bfde828f41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:37 +0000
Received: from AS9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:488::16)
 by AS4PR08MB7504.eurprd08.prod.outlook.com (2603:10a6:20b:4e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:35 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::53) by AS9PR05CA0022.outlook.office365.com
 (2603:10a6:20b:488::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:34 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:32 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:29 +0000
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
X-Inumbo-ID: b12a7e39-e881-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZhPrZZpN7382oTc0J/fANBBTf0rsSLYY9Z/cyCcrRI931oxcAqKfxPhhsXuuBtRRloHNgZqFD2weJmHKqE7FyEJbNRpuew+qrRzTCYHLRfgLHTUPZzRdbeAWWITj/aoZdpO2GV3iIfOhCxvMv2bbfPED+l511su9A+OAvfRT2GL4k7GdRFwxrYJ6Gq5kC58VpnzNZ6lO3LT/jUU7hMAu3wFGG1lrKcNHefl5xuGPiHbaALUDy4ISjsLFlg0UC2vG9Qy6Wfbz4+IU/a5ZAgixuxV2rdb3I3FzB+vRY+j0OjZehBK4UcvR0+0O2iBuvtGvX+R9MhBpxi6mTlxJ9eIs6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8kc1oeWJd8eJovTz7Jo1ZUCorNAUDwG0WrccA7BRjY=;
 b=hVtXnTU0ZVjnXiv7br87lV2lbiCjQ08X47hmuLncT9dKXuNmcNwqAGS9WoxMeY6sKgnkerUWQ7Kow8G9LM3WeJnl04igeJpOR3pdzUEwbqAr79UjoOC+nQ/5m5BMBK/TlesCBfDJiJYaL+6aoluNzA4tIb+xyUymNxvLge2QgsxAmOo4bwf7HttOiScqdtCqSDossytHggT/iOwME+C7tN2i9g61XCr742/Jr8762GqDO2y0+WdnKZ5WBb8D0ip5U8NEsXyRzOhXlB6CZeez9ZN41QiqTk5HzULL62+2ViKTrti6P+c+TC11JmGoWLq3WXeDc8fGSfRoONMLg/lkOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8kc1oeWJd8eJovTz7Jo1ZUCorNAUDwG0WrccA7BRjY=;
 b=0+KJEYJZO+wU4CSdXMR/nXQcvXRWrf5EdRNZdpOETzGMHaueKQZV3aMn7x9lrilHf6clCl5WEnbtCgFz/bULJt8jnnfIa2cjoE1P7tQdHuhsolAUMNkI956uZ7I7W6tQOfiGmZI2GfMMHJNM7/Y8sI1esBMWD5ObGu2YR97qrMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12ae1ba1e1c0f8a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdWSr5ELu63mkerJEd/A09nMapB1GsTJ2v+SGHQfZeIR4urHPQf46WeH0q/zzyUOMYjpbePDt+2F/YkjCHwWIPYyXRH4pdu+u89RV2XWnmRR43MwBqYogeMUSYtD+qEW71U6YzHxOXvHbLRA3+MXMXJg1xm2i2uY6ITlvupIkitze/qVpIoxH34pF/hs2h54Aqaqufhq+GiN2E3nPknUwKzqxz+sHLO5I8duDIfOH6DoV4Nn2YUoRutVCuo09D9K7cS+UxzAfU6Q0HIR+TZxZjreENDpryQF8DsXQldclo7/JBRKtijNmCQuXJPYVi2PnERzXGC8Tlm1K0kxNi0npA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8kc1oeWJd8eJovTz7Jo1ZUCorNAUDwG0WrccA7BRjY=;
 b=JDTfiuuTku9KXyoAJhp5kfeEoG364Idovu6rNyX/bef7ejYDZqy4cj/ZidA5r1g4E8ZoHjJbbLX5l4v50GuzzucljG9lhGhGeY9Uf4TDgKrbfoCLGL18UZAQ2cbOe8/6i4oOpUmUDeEHtdxrz449FiJWK2P7wZA6v7mv3+6Q6oZ1cru+3J64srHLOHy8jhwAFe0b7JZgCRgtBhY+fQJbGH2qavfbh/4mFpyA8ucIUMLfOpmxtSQlxYco5M+GJENU48p0NBHY63zJ03b1CaCZ/2QhqNdLcDT4N+74ZP0xR3cXjwfqGyP9Xl3Y/bYGZvwgycYhXut+gZca8qSEFo8RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8kc1oeWJd8eJovTz7Jo1ZUCorNAUDwG0WrccA7BRjY=;
 b=0+KJEYJZO+wU4CSdXMR/nXQcvXRWrf5EdRNZdpOETzGMHaueKQZV3aMn7x9lrilHf6clCl5WEnbtCgFz/bULJt8jnnfIa2cjoE1P7tQdHuhsolAUMNkI956uZ7I7W6tQOfiGmZI2GfMMHJNM7/Y8sI1esBMWD5ObGu2YR97qrMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 3/8] xen: introduce an arch helper for default dma zone status
Date: Fri, 10 Jun 2022 13:53:11 +0800
Message-ID: <20220610055316.2197571-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 47c9265c-cf71-4ae8-95dc-08da4aa59435
X-MS-TrafficTypeDiagnostic:
	AS4PR08MB7504:EE_|AM5EUR03FT005:EE_|AS8PR08MB6840:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6840747E142CCB16140BD8D29EA69@AS8PR08MB6840.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fbiTxNa6aM5OvhUis7UUUpVekG4Q6/YHB9uFTPfq+9v9TngHu8CzqjixKf6e2Gk1MiGUD1P8/0gcpt9UB9Fmi8VWtV/opVc+HzFy6mO28Q0GxYgw2P8fjSQXCk6WTro1rOedxXDYI/rpLvE+TVLozpSZBNf5dHEdxWIC/IqV7Xu2fsEWdtk0XjJ+ik0ZDoltBo/ZhV6/h0Xl0geWBvMSvwCo0ahzNO5ruBLo73EXo/dFJLDQX0bi/NW9dkJxOgvptjorcaXjyxK80Kzm1IMMVZLjvd9Q9FJVC/TzWgUPZ58rQBzu6kk8MTRZZPduyY5jVbduZxXEIuO6N0nvMeSAbIj/+OgW8l41ALFGJwrIQ2oDd8QUXPDNOAmf4QGFNm669LALeJVtO6ZX4CCnQv4RV49NwcXlc3VvEOa6GwIA8BxQuekZjlkkzsKq3QwyZ51OAXXVvsXwSTui8JpkKTv+4uv08tPMAQMP8Z7yiEweGCsbCEd0tEFEVQlgyNkaSml4DJDVatEcp+k6aMWp1nA59Zw4WUL330tFpuY88+efbp16zcKEQ1QYlIWhYHfFh9tBEXATqY7MnJvBA2LV+jHw1/A8MZ4i2spJNsLhfk6u29bd63PI1P/yyVNJONEzOQxC+cX5PFaqR4q9Ze6KQgFOcifr9j+8mTgTb9ft4hqUN/qGXOCmnhb/Sj20z63aXZKUEorIk4GkSf6iULHAk0n+vw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(83380400001)(70206006)(2906002)(8676002)(81166007)(70586007)(5660300002)(4326008)(44832011)(36756003)(6666004)(26005)(356005)(7696005)(86362001)(82310400005)(186003)(426003)(336012)(2616005)(47076005)(508600001)(1076003)(6916009)(40460700003)(36860700001)(8936002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7504
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ec99269-d152-4322-c201-08da4aa58eb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k+lmuKGde+qM+fa4M0Wf+4XTO95RzCAithceKtq/pl6bKJnM1oLLQuSMU2T8YqBy5zzfMAxDe5bXP9YY3ACUxgs8oKrNKsnRPBdvyKPK089rFR/dIxcJCp1RQnQfHzOnGyhGR24Zz/3ryP3gMtymK3c2+IR5EHCjNPLD5Lu3DDTjW5eOSjAXSf+zMHBNVLH5tmQvx6vCpbjoAHxIyMI+erkmPhUBLnOIjp0Uf7SeK5b0z1LPeWSC4Kj2gOABHftvIx8TebDaCRUHhzhk+fHk3kCngVjpxAI7iltXOq4rTvIDOolQRU4r5dw5Ej/mCzKVzCCPLwhizFysDp71SpmztvHmR7JxfK7peZyrbQFlgNdsXExFcMNy41dsbApHNid0FqMLjnjDVpL3/7tvlWoSpoYwGpfo9FSLurgw5Xw0juOCNmaX0XmPQXKw0QKVGDOwIV3XYiuOvLsXXpzj0Qg72V1WY8ieRe0n2CJUWVOCx0kpWm9NGPzuOmXl3aT8XJT/6HrkhhfeFHjasDIGB2PDeDtO9bioR1KhPhzXRn4Kq7FbahAGmiX43S010aCphXok+th363E5hmFKTXDqGvnxelpE4wK3/fuF5jrtkTIC2+A38Qeh69mxE8fxGDH1AvNCqT/YadJ+yjERn9ys3UyoExH3UahRgTz0PercIgvZus52WZxMjVCjLhBD/05Jb3hu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400005)(83380400001)(2906002)(36860700001)(40460700003)(81166007)(6666004)(26005)(7696005)(36756003)(4326008)(54906003)(508600001)(316002)(6916009)(5660300002)(8936002)(426003)(336012)(186003)(8676002)(2616005)(1076003)(70206006)(70586007)(47076005)(86362001)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:44.2320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c9265c-cf71-4ae8-95dc-08da4aa59435
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6840

In current code, when Xen is running in a multiple nodes
NUMA system, it will set dma_bitsize in end_boot_allocator
to reserve some low address memory as DMA zone.

There are some x86 implications in the implementation.
Because on x86, memory starts from 0. On a multiple-nodes
NUMA system, if a single node contains the majority or all
of the DMA memory, x86 prefers to give out memory from
non-local allocations rather than exhausting the DMA memory
ranges. Hence x86 uses dma_bitsize to set aside some largely
arbitrary amount of memory for DMA zone. The allocations
from DMA zone would happen only after exhausting all other
nodes' memory.

But the implications are not shared across all architectures.
For example, Arm cannot guarantee the availability of memory
below a certain boundary for DMA limited-capability devices
either. But currently, Arm doesn't need a reserved DMA zone
in Xen. Because there is no DMA device in Xen. And for guests,
Xen Arm only allows Dom0 to have DMA operations without IOMMU.
Xen will try to allocate memory under 4GB or memory range that
is limited by dma_bitsize for Dom0 in boot time. For DomU, even
Xen can passthrough devices to DomU without IOMMU, but Xen Arm
doesn't guarantee their DMA operations. So, Xen Arm doesn't
need a reserved DMA zone to provide DMA memory for guests.

In this patch, we introduce an arch_want_default_dmazone helper
for different architectures to determine whether they need to
set dma_bitsize for DMA zone reservation or not.

At the same time, when x86 Xen is built with CONFIG_PV=n could
probably leverage this new helper to actually not trigger DMA
zone reservation.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Acked-by.
v2 -> v3:
1. Add Tb.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone.
v1 -> v2:
1. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time.
2. Use a macro to define arch_have_default_dmazone, because
   it's little hard to make x86 version to static inline.
   Use a macro will also avoid add __init for this function.
3. Change arch_have_default_dmazone return value from
   unsigned int to bool.
4. Un-addressed comment: make arch_have_default_dmazone
   of x86 to be static inline. Because, if we move
   arch_have_default_dmazone to x86/asm/numa.h, it depends
   on nodemask.h to provide num_online_nodes. But nodemask.h
   needs numa.h to provide MAX_NUMANODES. This will cause a
   loop dependency. And this function can only be used in
   end_boot_allocator, in Xen initialization. So I think,
   compared to the changes introduced by inline, it doesn't
   mean much.
---
 xen/arch/arm/include/asm/numa.h | 1 +
 xen/arch/x86/include/asm/numa.h | 1 +
 xen/common/page_alloc.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 31a6de4e23..e4c4d89192 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+#define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
 /*
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index bada2c0bb9..5d8385f2e1 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ea59cd1a4a..000ae6b972 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_want_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
-- 
2.25.1


