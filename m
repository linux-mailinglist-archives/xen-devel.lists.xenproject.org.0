Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310651E65F9
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKQy-0002YR-7Z; Thu, 28 May 2020 15:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLP3=7K=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeKQw-0002YL-Hg
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:27:02 +0000
X-Inumbo-ID: acf59f2a-a0f7-11ea-81bc-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acf59f2a-a0f7-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXajeLJr1xURQlu89ETkH/wIRtkinyHgRZNQgmvzHY0=;
 b=f3Rc9bbT7hHyQakROP1GYVNnpJ6RJKs1257em44lSO10gsKE/nPavSvsxBSJZPDuG9rAtFeKauQfw1PtrcgsZyMqQKm4Gn/6FIYMpt6MVwVx+NjxFk9d7fFfsbm8MxLcrfoDANubMEai6SuBD8Vlq4uwF5q8A7pWsRfP/FfzPxw=
Received: from AM6P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::26)
 by AM6PR08MB5031.eurprd08.prod.outlook.com (2603:10a6:20b:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 15:26:59 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::91) by AM6P194CA0013.outlook.office365.com
 (2603:10a6:209:90::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Thu, 28 May 2020 15:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Thu, 28 May 2020 15:26:58 +0000
Received: ("Tessian outbound 9eabd37e4fee:v57");
 Thu, 28 May 2020 15:26:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1738221c2e6404f
X-CR-MTA-TID: 64aa7808
Received: from a50bca964cc9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A98372F-679D-4263-B54C-7274E3E5BB74.1; 
 Thu, 28 May 2020 15:26:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a50bca964cc9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 May 2020 15:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJjlTUJWpswE6Jr6HeGueszjp6sZUixOSfWn0qBlB+cbxgZ3OrdwBLn8cfm/4C24A1Ii7mJYr4x4iC7UxYBq7/DktGeXZaf5hasL3syixkVJtx4Kdym4YIN5KS+fpL3vVTw9GGB0xZmUz4gl6OrqWAvJ3dGchpG9BaCnft3R3VfB98wZlA/kSSPow1x1JAiI2b6c40C5cOvH9TDTDaUtxXmm0WvXptGW0EhqbVUC08fVXPL2dGCfce1M6PiQq6XV8BFpmBnvcZgG9ECJfO6YjS0LK9l1o1vgEfO6eFkXdj5T3+JAiKTvYQp7CMm/zYz8FlnEA0x0FFwW2BEwRtQL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXajeLJr1xURQlu89ETkH/wIRtkinyHgRZNQgmvzHY0=;
 b=NyLTvQpKpWK1vLpgzSbsXeMeuDDvrIph8eLskaKukneuBI36+NX3E/sLL0M5Wc/uPSRTiEWjrGvyKxqGGW/tUNS1ykWYr+XAZwLxDbgxekx5d3KeHtRFTPwUY3Z9WjzQs0IoqrpUe2O4Cy44MC9Pv1cSznaTw668T7VObVoZTFhmt2UjrgVzC2zeAiWMjkuMezWfTdtgfCIL8sJlsBDucCcuG0AsTbArLTJTV0jOnZ0Nb/AhLsvXgG2fgzAVFmAV39E4BJPC0tyvD0YBaNQ+1kkMXPx8QNAx7cPU7dqs0JZ0eX5TH7W13uO3MgsHpF62WdKT5Sp5CWyGpEgysJuz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXajeLJr1xURQlu89ETkH/wIRtkinyHgRZNQgmvzHY0=;
 b=f3Rc9bbT7hHyQakROP1GYVNnpJ6RJKs1257em44lSO10gsKE/nPavSvsxBSJZPDuG9rAtFeKauQfw1PtrcgsZyMqQKm4Gn/6FIYMpt6MVwVx+NjxFk9d7fFfsbm8MxLcrfoDANubMEai6SuBD8Vlq4uwF5q8A7pWsRfP/FfzPxw=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3211.eurprd08.prod.outlook.com (2603:10a6:5:27::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 15:26:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 15:26:57 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH 0/1] Runstate error with KPTI
Date: Thu, 28 May 2020 16:25:30 +0100
Message-Id: <cover.1590675919.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0017.namprd07.prod.outlook.com
 (2603:10b6:803:28::27) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by
 SN4PR0701CA0017.namprd07.prod.outlook.com (2603:10b6:803:28::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Thu, 28 May 2020 15:26:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c03affa-5090-499c-b6df-08d8031b902d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3211:|AM6PR08MB5031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50310DEABA005D52FCC0B90A9D8E0@AM6PR08MB5031.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KxA3f1ayDrtZfjjN5N6KdwKM02pLOOosadVn7BZhIF5ktVAs50qfcQJ/vdPOkS9Q9mzOWSUnGQv8NVIo2bPHM08YYIdUs1LJPsb9BslN7CjuMnB9I7dCXXZrirBxJh7402xiL5/YHZJMUlfHQsOdhI24J0n5v/PB5wAAzT5m97Ln7EtfkShoNpyvRCY852q93D95nawdtCRYPDuQfalFGowp7MvInyCb2dcynsjJtk9VCNg8k941h7t0MDiDaZRqrvovE+4smIvkOY1zku6a1i5RdL3fGPqmWEn4ukMvO8jlR1eI+R2MwWusfWSodndB6pg5S+s5NVuTnB+vwUtNgnW0cm7CBZe8wS+arZWuHBY3DrBK04vV1vRr2eIcZsa0hQ2wIXSDvjT9FnJnE+nDL+u5nldliC8/JOORmk7Wl4hJIEQuLvHhtIXEOLsegbIWkL3yCq8ZiGoPR0OBhy3bybkgEHs7OxZsS4ykgEfaDHU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(36756003)(66946007)(316002)(6666004)(54906003)(478600001)(966005)(186003)(44832011)(956004)(66476007)(66556008)(7696005)(52116002)(2906002)(2616005)(16526019)(5660300002)(26005)(8676002)(7416002)(4326008)(8936002)(86362001)(83380400001)(6916009)(6486002)(136400200001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: to284wEs8iTwH1sCE2czj8ie8+vihx8DAjR7PEZZSdsu3K8EibaW34cLyCHnyKipwyrwFC0LGnwaXTbO5ZD3wqLEzPuepQt5padGN2bIQmAvAQdEn1QlLGHCvK1qgJsvuhLXNRI3VEaFnGIPYRcxyTfteyrw+MZbvsm6zHbbsBKvaAenDu3flaPiBX79PdzT5e7RXy8QrZ1hAw7z642IN1IDX8wkhjzhZnsf/0wq4j1hljg1ta869YSKCJQcolIjdAeM/jng1sH6nudfe2Sh3JqH0ZBWetWfO+4D4jvgBjC+QDE5h+Qrd/XYLlzJFMuODowfG/1qTFEkE2+OYRzPCuwF8A7O/AegOhW9Dvh/Fk3qTbk4uNpQe9/wqTDhnGHKC30BOQrgeKCDNU2im0QNizm4EinzxNrTsPYi5wObuK428JnxwCLcEM6rMgGt37whcixRqoHFOmgtsPHmDeMdjDpIhiI/R26ZsOKNCRf6Us8ZPPgEa3DfPCqDdGNNq6+i
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3211
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(478600001)(70586007)(86362001)(966005)(16526019)(186003)(26005)(336012)(8676002)(2906002)(956004)(2616005)(82740400003)(316002)(4326008)(47076004)(6486002)(54906003)(107886003)(36906005)(44832011)(82310400002)(81166007)(356005)(70206006)(6666004)(36756003)(8936002)(7696005)(83380400001)(6916009)(5660300002)(21314003)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 84dbb719-acbd-46b3-f4d4-08d8031b8f3a
X-Forefront-PRVS: 0417A3FFD2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCg4+YFveXLo5UWRk0rpVILqUEgr84lq0LOR81lGtU4FE9/70szAPQTR4BcSz4z1Q7AC0F7oxfb2mmUtjZvh/FHQ/aZbbV/1gjqvpHjm3/mSexkNB331kIzZql/nFPbahBw8jczTrg3IwvHYQPTnFJwc0CSdcmJnkNRKb9Eug6gs430ZzCHDohgmSqjUqqsuFd8vabe/VtvY4Gd7gXER9JXw6cjCuTmfblZqp2ix+GNtAn35DBbu2MfQ5sDag0u6EUUGpKBJd3bKOVLn4mVbFh7oLKeKzfrJVMWZ5Xksdys6YcsAahDY7fhazv0d74QDk76W2DqphmsgdUCQULY15+q1jVFGBIqPitGfId5bQKc+f+z1OBdFiqhJeioFdaIHcolubdvofOkUjgalwjHO4Wdi2oWIOYZgRwPoIOAEtfsXN3bmQ7EAsX6W9ErA8ZdY1U7TIwe6rKP9KjtdDYWkGDCNcnksF7BI8SxFkC8w4XoeP372yCwRcXvrcbwUJG9co/qpywW2GxphJDt6U13lww==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 15:26:58.9641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c03affa-5090-499c-b6df-08d8031b902d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following patch implements a solution to the bug occuring on Arm
with Linux with KPTI enabled during a context switch from user mode:
(XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0

This is an answer to the discussion started here:
https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg00735.html

and a modification of the patches submitted here:
https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html

This is submitted as an RFC as the solution is only working on Arm and I
would need some help for the x86 implementation.
On x86 this needs at least a solution to implement an equivalent of
get_page_from_gva (see #error in domain.c) and implementation of the
different runstate_update functions.
Any help or suggestion on that would be nice.

I also added some XXX in different places as part of the code of the
original patch I started from are not completely clear to me.

Bertrand Marquis (1):
  xen: Use a global mapping for runstate

 xen/arch/arm/domain.c   | 32 +++++++++-------
 xen/arch/x86/domain.c   | 51 ++++++++++++++-----------
 xen/common/domain.c     | 84 ++++++++++++++++++++++++++++++++++-------
 xen/include/xen/sched.h | 11 ++++--
 4 files changed, 124 insertions(+), 54 deletions(-)

-- 
2.17.1


