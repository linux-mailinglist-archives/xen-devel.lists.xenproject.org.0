Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA059B7D5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391103.628858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfM-0007FJ-KS; Mon, 22 Aug 2022 02:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391103.628858; Mon, 22 Aug 2022 02:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfM-0007B1-GS; Mon, 22 Aug 2022 02:59:52 +0000
Received: by outflank-mailman (input) for mailman id 391103;
 Mon, 22 Aug 2022 02:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxfK-0005Ul-G9
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c68fc70-21c6-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 04:59:49 +0200 (CEST)
Received: from AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12)
 by AS8PR08MB7768.eurprd08.prod.outlook.com (2603:10a6:20b:52d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 02:59:43 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::fe) by AM7PR04CA0002.outlook.office365.com
 (2603:10a6:20b:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:42 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 22 Aug 2022 02:59:42 +0000
Received: from e7aeab210a81.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D084C91D-0F7A-4119-8C83-74A196B3F60E.1; 
 Mon, 22 Aug 2022 02:59:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7aeab210a81.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:36 +0000
Received: from DB6P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::31) by
 PR3PR08MB5611.eurprd08.prod.outlook.com (2603:10a6:102:85::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Mon, 22 Aug 2022 02:59:32 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::71) by DB6P195CA0021.outlook.office365.com
 (2603:10a6:4:cb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:28 +0000
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
X-Inumbo-ID: 7c68fc70-21c6-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WVXdD2xsOpVipmihx/dXmjVu03+Mo5D8WL07WCQ+SZLZu+fvgNi9WpCjRihbAjMevNpUrSZ6MdwfEfQALipR1yk+uzYyhZgS75gZqMXKV1ngwUT0TYk13SSES3MFufRIQlocibUCIgEWB8em1wZyhnjA7CYD+sU+HMLG+IGqHmIOAxZuVANaskyJjijqRsWlwMvmg9Wh+yBbRtzWqFNLUCGnjSOMmHV2OKhZ80dz7HqxtjZhE8foLCnrBUKr3WgISu6LIw5KLP8rxqtoJhdcD3YEYroX6SybMwEG3mGQCVNaNRGg+sZIo1/b2fAJ2xQaphE/v2ZXrfUG5m1FQH7sCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoZMK5PjsMqjXL+DEkyIGxFZ6hqYHaW2vP69im58izw=;
 b=bflcjWhWmOAKgXKJltXLUvJULsLWqJeJGEuTuYa0W0M60J0mL4yaHuhN+zMO6tLo2EyxHGBClFOz64rd9HKjPnBesik7t+xOTm+19+sxEAaKC+BgeMOb+0eYzF7hJAfeBYpXFMFHs25eDaYXFgB4LfpLBrPbdKpv+nXCFJw0VXCy4rmLXuzPtXcLiDGx72FU1viOelw/iY1yIatowS5I08gmrntDr94otgaUxvF6kVK//DV0faLDVuYb8SV3Sj/fWGDysHu8Monlv9ipaEg12HgZ0jb8OJpsdhKb49nyYzDJIWjDHNdTDFYbaGYVIFMynKBVaZZM7qqI/Y20d8V3Zw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoZMK5PjsMqjXL+DEkyIGxFZ6hqYHaW2vP69im58izw=;
 b=H9C/V5Ped5WK7H1mgHeyK8ZXwFKxXbQvpA9NWozDg4ctzpfUE+kACDuuZYaggdWGjPhSOMKRzpql0COmrtXx8Imvd4xKkbWu/xEBKQ3IA1gEhB+bIoaOz1g+8pMIL/WzlBOuQXAbK0nCU3bjJwJ5OFvgYIfy8ekmKghdqhZ7kKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6447027a80cbd64
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buP/ClAO3ANRUDxcTdnqDEYYvFDlxqWfYda/CfuthUyAZ9eQ+Zk6nD4FEAMlBesgA0gZhRKMk6U+9tV1QWBf/UmOFvZ3A7VnZhrtUSBz/V3hYBLBzluUmwOj9mfwIgxzEAnY3A1lIDzfB3Cdw8LQEOkSLnMpTaeG/2re35holGV7aZyD/cnqplRE2MNSYdj5TR60IOZ+Uq+zu/Ml3kjq760uZpr8LBXtpVTMgB4tDeXU8CtujaVfcoqbnFBmC1zTX/+d9VCH+ix4AGXVqsKSr6b8LagX9JqNHHFX6QZKD8/RHNteRnjxEYVSpuSpNkRWcQxjFJmKZ/m5bMEx6L+Glw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoZMK5PjsMqjXL+DEkyIGxFZ6hqYHaW2vP69im58izw=;
 b=QHhqT1kaQY7R1xma8gp7h10FHPqCPXK3EONQx9xdxlL2usNsuwWfBberJ5HSYLtSHFqrV8u4hJM16cUpxj6+e+vUAemsAKB+Pm95B1JWwZkP0/PFVKzba5vklOS/9OPqW+gnTE2SrwjlPRYT4MeF86JMS+uxiV6eGAliKF7kubjobbRobtwk5DCUnmuaRdrLM9gq/E04MQqAMwoZcsNV88k3BNc+YqfbUQ72vsM4Fjw30BYkzgF7LZRE1smC2XtbPIrcX52aXuiVkQMO83+341g9FpPA3cuLxW7fSxiEu/Y1DjAXQxR37oNR9Ph6q58QocdCnrVgqsxORsSW0shCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoZMK5PjsMqjXL+DEkyIGxFZ6hqYHaW2vP69im58izw=;
 b=H9C/V5Ped5WK7H1mgHeyK8ZXwFKxXbQvpA9NWozDg4ctzpfUE+kACDuuZYaggdWGjPhSOMKRzpql0COmrtXx8Imvd4xKkbWu/xEBKQ3IA1gEhB+bIoaOz1g+8pMIL/WzlBOuQXAbK0nCU3bjJwJ5OFvgYIfy8ekmKghdqhZ7kKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Mon, 22 Aug 2022 10:58:10 +0800
Message-ID: <20220822025810.2240707-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822025810.2240707-1-wei.chen@arm.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 267cf3cd-156b-41e0-6b71-08da83ea5ce7
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5611:EE_|VE1EUR03FT041:EE_|AS8PR08MB7768:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sy7X2EJjsqnB0wonvW3D+59KWrZJ/If6lR8OjeRwEhqtdKk2YPYLCiZx8CytV/r+/AZdfIDhXuIhVux8ggt3aMDrsA1Z3qhC5VrD4VXsMexFvnRe2nBTGZRe+HjCQue7CFbOEdNlqphM6TsZWJXq/S/Ndt+1+CVOeJuKS8M6Oi7tStc6eXdneKLxvNCSUJI0qdcfz71PAHeE+VGgPjt0Ja4ryuSDaBNY+Aw1L7LDTu4Vy2ajnRhqrxolXI0hXchBkteqjJRaTf2Y+IwOqyxWSC0bw+Z17n6k1Bt3pZCGJm5JY9LG48V5PydVNt0MmO2u3RzSeYKnWegdRYJ5N6hs5Z6zg5z4BNvTAgY45mdKtn4XzWc7oUF/koeRkyee4AlF0LY23OFChtmgrBfOcFXdNrge1oAbjA61uQhX1ujl1erop/pjeEzF9s/h4MXnDMbirWKeXhl+0VX4PolA8XwM+Og5KXKTc6Gm5U1TnrrVT+hBBhkOBepZXWM0TC9+Ug36m1m8nc1QHbOS6oFEygK/a5WPPd6jcpbq+ExJ5eUn/itd8eXA0P83qntBS8HG3EY4p8GqQGLorVJoiJ+5WRDVkJjhEZdjp02WDR1HEhsvNLMdtvSVuHlCM3L1AH+wMtGgrcAA0qvojc6aSpmBcoXkILlsM8O46/KWuifar2S8NuWlooeEnTG4rkWhWiT7rMTV+HqyUNy7TRs9Q/6/rbtXeED2tiJzF/0yCnJFTxHyy8nEhYuPZtYPqUhT3hlFIVIW1T2HmlRE89VYkatX7I93JGdDPklnqD7RbGGuPel2UKE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39850400004)(396003)(40470700004)(36840700001)(46966006)(1076003)(36860700001)(82310400005)(478600001)(186003)(47076005)(336012)(426003)(83380400001)(2906002)(44832011)(5660300002)(36756003)(41300700001)(8936002)(4326008)(356005)(8676002)(81166007)(54906003)(82740400003)(6916009)(70206006)(70586007)(6666004)(7696005)(2616005)(40460700003)(316002)(40480700001)(86362001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffa2877c-546a-431f-0432-08da83ea5646
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gFYScmya/qTQQNDKRPjWsGpSP/wfCmwZ4gAOgmCWWpubfmtqrkN5iPSrAL/oB+oSCsJWSRGreF8dDnPULyG3Itk76AHYWjp1VOk8eeKRsdT3Sp5ERVvvwHyv1LeZ3tZUoHQv8PnUGTZqltALRsvmAJk8O/21ODheELXZ4xeBSPzeL9wDgkIfehlRer9Sw91fedQMcy9Y92Vb+bCmKzgRZmNLem3MzSgJKFM/wDbGRuwX8bYrzdBUuqN7LGWTv/d9lZSEdFzJll3zLGkj4ZnADrLxw37k7xhHJfi+xcsN1jGxSTz6B9w4nTakoHCNIzSJengzoj1dYDTgCd3HIRjwiRG9XWib73ovG2GgCLhhky0LSSGYqnVz62NmGrqGf/H9xJqb0IW4ddMgg/iJWqq4yx3uxYY510f737+WmpkonsFw4j6/UeQcspjpjKAg/vC+wMCo8fsGfF8r+3wu5t5ZJ6hlghdaIbzckYLjI49s4UG3K36FcGGSnzcsHPTA52C5wOK16oHThdiKcgvYPhYa6nq3FDz6GfIRsYKFLnuLPyzRQQ37ATRyQO5z5ZYOLZaiSRB1gFWVjzNgAyK4WbsVal8MANw9OAd3iBlmNNm6xOrxjsL1dXN8o6ZCNeRCswNSt3CoLoBB3jBHgfWO0Sc4mZjjbSBf4LzHoKFT6mLIfPrc/KWwPvuoaBVPY2RQMafX8Vht7U75F+fpBKz29fAXUziWDkgH7JJ2RKAYCIZQVEg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39850400004)(376002)(46966006)(36840700001)(6666004)(7696005)(107886003)(2906002)(41300700001)(82310400005)(5660300002)(40480700001)(44832011)(478600001)(86362001)(36756003)(26005)(6916009)(54906003)(316002)(4326008)(81166007)(336012)(186003)(1076003)(2616005)(8936002)(8676002)(70206006)(70586007)(36860700001)(426003)(47076005)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:42.9529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 267cf3cd-156b-41e0-6b71-08da83ea5ce7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7768

Current NUMA nodes number is a hardcode configuration. This
configuration is difficult for an administrator to change
unless changing the code.

So in this patch, we introduce this new Kconfig option for
administrators to change NUMA nodes number conveniently.
Also considering that not all architectures support NUMA,
this Kconfig option only can be visible on NUMA enabled
architectures. Non-NUMA supported architectures can still
use 1 as MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index b5c9de24ed..3363718b02 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


