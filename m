Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97C511449
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314611.532766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyc-0001A5-SV; Wed, 27 Apr 2022 09:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314611.532766; Wed, 27 Apr 2022 09:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyc-00016O-OL; Wed, 27 Apr 2022 09:28:50 +0000
Received: by outflank-mailman (input) for mailman id 314611;
 Wed, 27 Apr 2022 09:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdyb-00015W-8G
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:28:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe06::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d3dad0-c60c-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:28:48 +0200 (CEST)
Received: from DB3PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:8::18) by
 DB9PR08MB6537.eurprd08.prod.outlook.com (2603:10a6:10:250::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Wed, 27 Apr 2022 09:28:38 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::76) by DB3PR08CA0005.outlook.office365.com
 (2603:10a6:8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:38 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 27 Apr 2022 09:28:38 +0000
Received: from f7af931dfd82.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8337183-C9E2-4605-9B2C-0756620C920D.1; 
 Wed, 27 Apr 2022 09:28:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7af931dfd82.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:28:32 +0000
Received: from AS9PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:20b:467::25)
 by PA4PR08MB6255.eurprd08.prod.outlook.com (2603:10a6:102:f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:28:30 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::17) by AS9PR06CA0126.outlook.office365.com
 (2603:10a6:20b:467::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:30 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:28:29 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:20 +0000
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
X-Inumbo-ID: 70d3dad0-c60c-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ipdc3e1RnMQb/YeZhjG0nay+i9AURQsGfGhypTtQTZBqjqeA9i1hApU0hUe9Wr3wPIucwiG1kkHWS1MsjeBCr7HDQiKOtwpcLkiDM3smNsap0Y8Lz3FbQ5u9Pvkd8muWFg2HT8M6Ro3RL8Qn890P9j0+1DiVkZcbzh1DUyjLvw2MaCOT11mLNZCJxpNRKUKJsRpuJWsisboguWkhyIajD2eO35+y2VeI1lodA1oTfiTHGh0EgBp3jAdNxNnUIo//x0LJ+aVBYk2ZP3xWcojfzYDPM0r026re0cG+0hSJull+TSY5/IhUxGsNFJHxQ8klTPCb4rab4qDFuBVUUKiiQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qA9JxuQq7jj4LbeGwyi4Yeymfcd0bnxAGCmwirOLIs=;
 b=UnGIenCDFTFWpHO9cAVCJmo83LymqJR/v3K80WDoRgcyFxDxBCp0lsblpqoyW0AzMz983963X7BfShy250GpM6w9j52N7/UGLWkTDV3cy6LAbm5a/ok/BB8xXlJ2FrPAoOAJ2EQTVQnuAae9sLT4TtMRVxgFYj1B24YSvI8n4pXiUNXQJoqXXQZ1NPIv9qg6UN/ZCtVruyorbzLgFGltGdUDulYwrrnXdau8xYDJcKFcB52c7gZZ+zTvp/f3QvikryY8ewUvLiOXh/7yZyVT3bkEOvXIAWj1dihIoXm6yWHBw7XduA7eyOB+kkBdog2LxTzJbZQ/UDHQqOrKvd8YNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qA9JxuQq7jj4LbeGwyi4Yeymfcd0bnxAGCmwirOLIs=;
 b=JZyVFCDJR6FeRXHZ3xmBdZYzD0/AjkKfeu91czzeGKit2Y5lZWkyCS1EWLxhvdhtEuyb35XASBV23ldIXbm+6IWuqh6OpK+fe4bgRX+WpyIJIO+lHNnB4RinTqQD+aWp9k7B7G1rU+wcF1DaUzSpRj4/tPMwYwm/Sxf5Y0KsuRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3ddfc275cec7f16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMXZ6FPmUhRUIoKeaT3JrAo8nAdFFV9SBwmfJP3MEhKo5LqfY7j/C1Jr0fQFO+K0frNx5ScqEL9QkS50SCTUMbktq7oSQGSHFtC3SI/ENmZHwWbVNNsn8jjEI92fSwTbYRXbAkGozf0nz0v4ihMSIvRzI0IqREswNB0hd5//mLq/iiktZ2CSztWATJ80F9YyoK532EAaDFuQ1a4jk1l89gmUdkZeQWIQ4cG2bDIUdjn8Z562eLfkyzl7kRldcRqP+F05pggqYp3HIWUzMakQUUMlNCRpmaQndVgcWemNaCGcNCt19Gp7vFjRNegBdVHsWwZR/pAph5hCjjlL8If2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qA9JxuQq7jj4LbeGwyi4Yeymfcd0bnxAGCmwirOLIs=;
 b=AGCRo13vVysLgQ6zELxmR1cV2W+kcH1WTsGqo+iCVRX+ef9bU5Dtnuae/zTT8BIHFBGfcSUivV1IIkSGKUkpDXC7adCruk76l78OQG2gnBmPFUSd6OywHR+JcMWRDHoNtk8XpognIlFFhkXBEH4BnsWau8ptyBpVFqVv9Ludv7INS/xoXXRD7jHDJkaJtY1Fq6fKpHoycxD09lkcW6CuuohgUXyG3BsJpwORvXQnAqaREGuvBEenlXtHIoA8zKFq36p6fOv6WSDy0aIncI1DkgGldgTFapsVo8iorr9gN7bBaFaZvTeNjKjgWRwbvKBsUKENxd1uHd8RF4S+z0OLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qA9JxuQq7jj4LbeGwyi4Yeymfcd0bnxAGCmwirOLIs=;
 b=JZyVFCDJR6FeRXHZ3xmBdZYzD0/AjkKfeu91czzeGKit2Y5lZWkyCS1EWLxhvdhtEuyb35XASBV23ldIXbm+6IWuqh6OpK+fe4bgRX+WpyIJIO+lHNnB4RinTqQD+aWp9k7B7G1rU+wcF1DaUzSpRj4/tPMwYwm/Sxf5Y0KsuRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 2/6] xen: do not merge reserved pages in free_heap_pages()
Date: Wed, 27 Apr 2022 17:27:39 +0800
Message-ID: <20220427092743.925563-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427092743.925563-1-Penny.Zheng@arm.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 36b494a7-3363-4682-2fb8-08da28304f97
X-MS-TrafficTypeDiagnostic:
	PA4PR08MB6255:EE_|DB5EUR03FT055:EE_|DB9PR08MB6537:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB65375AB60748B8361E97C88FF7FA9@DB9PR08MB6537.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AWx/5t2DB2QmJrYK1Or6f3Y5sa0SXa6EFCN5YLjEx5KHn9BJdpQv38GHQlCMwbPVymr1F/ARdUQ+dm6aKyGntpSNm0x8YGSGc4XInMKb30T2kSUyZcx+d9uz8e3W/ab7hesVTDhiC+eveRzHPR+VFunHucfr0KdVryGqWmVzoB4Sc91AHSf74QcZDDCASXgXbZaOFl53LIFXygRhU/SKMWl+Q7ao6RQ1wDXs6lct1QJ/t3Yi0WFY7jbpA0PJY8ymDjKEPEtDL+yjDy1bX+BgzCAZM6BQ9cohni3qWdZ67EoB1BZ71pG5v/zr8oWZMnsvgSAF2ZdwTfldrLzBnYCJJFuzxrUhPaWAQvXZH7Z/iuQzr1rlsJ+C6tNIZqyXdWmc51nhk/9aV8TCz2aKM0ex1rWmbjbqjieQ+3GvzYNW2lcgjxqeauprjPCyvpJ3bORMF/I57VPQFrMiq+fe95HcGliDpMzZPH2nAMHXuLO8lV6gu61cHLxZJcZc8FzZbX2mCvQgMsYbzue+AW5MTm3z4zRzoc3zvsuya64UwXWyCXA3lqleaunvlHpeFUR8fXejnG77V8DrmvMvwe9oY5OaHmfd/O2G7CqUartwVEbHyAGAVhLtI9s7dva+QDTCDGzv/gjLqLCRAYxpp1zwj/AamuEPPY9aT30L3O85VXuBUM2rfOIJRlftYwk6+U2jmP+861xG3wgH91NilCfQiW2wDg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(4326008)(70586007)(356005)(83380400001)(70206006)(7696005)(2616005)(86362001)(54906003)(6916009)(316002)(47076005)(186003)(1076003)(336012)(426003)(81166007)(6666004)(508600001)(40460700003)(26005)(36860700001)(8936002)(2906002)(5660300002)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6255
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	663a81de-99b2-440f-259f-08da28304a57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HTwKq9JaZ7EHMetoVjuvKD/tQyU5DNbsuAvE3bSa6SjQqR9lCMIpttuUAKwyxZ5lBy36ZBCc3qxQuk4gNsSp+wnVq/udnYXLAHUP9I074S0RgFEXFkx5jBX1hFLUoHPE+aC1Y5EK0glRLPFdeNBDKSUpGKDzjSKTQfM28o+0XDJKi2gpzU4JfAhd2oO5GEzXjJJDejnYojUZm3uQx703f/a3SiEsSSXHJUwXBwJlfvcoBPw+P7dI5kTKgPjedF/YUUKca2vtZ6uYZnILMAihqFzrUQxQvxOU5OnRKqqNPgN6zoA/CPFJrCYt01pU1lb2x2L+WmleS7z0pVbgpijIkBqxFLAYQCTw8VtX2fAeLkOYdP+r3VZViq0NnIjoJh03PCRay3/pa7qMPdwrE6TdUBDxg/u9raVacGVh0BNXpd1RfCPugMdNbRa82taB2Njq2p7A7eawTYIPNzKFFO0zYwQ1xH8AdeaDkkIOEz2nLYNHY78PYGWDQkvWrwgfR+t3azZhinx/yzE6gXCKfutBEO/YH8LqesomMZplzWxE7frqmtpkPKl4fhIMcJ4t+7XHt8rq9TToKZcuZ7nbX4vBec69IkQc1BUjAnN505wEB99bqvhpDeRX/ogXJDQR/35C0ZvH0yzhzEG86JuisjruhN1qPpUkfhk5RI+GVkuglisiXRopNwu1PiYhtY0Fkhl5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(8676002)(70586007)(36860700001)(2906002)(4326008)(40460700003)(6666004)(86362001)(5660300002)(8936002)(508600001)(26005)(83380400001)(7696005)(2616005)(47076005)(6916009)(54906003)(316002)(1076003)(36756003)(336012)(426003)(81166007)(186003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:28:38.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b494a7-3363-4682-2fb8-08da28304f97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6537

There is a slim chance that free_heap_pages() may decide to merge a chunk
from the static region(PGC_reserved) with the about-to-be-free chunk.

So in order to avoid the above scenario, this commit updates free_heap_pages()
to check whether the predecessor and/or successor has PGC_reserved set,
when trying to merge the about-to-be-freed chunk with the predecessor
and/or successor.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- no changes
---
v2 changes:
- new commit
---
 xen/common/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index be501582a3..1f3ad4bd28 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1483,6 +1483,7 @@ static void free_heap_pages(
             /* Merge with predecessor block? */
             if ( !mfn_valid(page_to_mfn(predecessor)) ||
                  !page_state_is(predecessor, free) ||
+                 (predecessor->count_info & PGC_reserved) ||
                  (PFN_ORDER(predecessor) != order) ||
                  (phys_to_nid(page_to_maddr(predecessor)) != node) )
                 break;
@@ -1506,6 +1507,7 @@ static void free_heap_pages(
             /* Merge with successor block? */
             if ( !mfn_valid(page_to_mfn(successor)) ||
                  !page_state_is(successor, free) ||
+                 (successor->count_info & PGC_reserved) ||
                  (PFN_ORDER(successor) != order) ||
                  (phys_to_nid(page_to_maddr(successor)) != node) )
                 break;
-- 
2.25.1


