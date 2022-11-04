Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB3619451
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437469.691898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtne-0000dI-Rr; Fri, 04 Nov 2022 10:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437469.691898; Fri, 04 Nov 2022 10:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtne-0000bO-Oi; Fri, 04 Nov 2022 10:19:46 +0000
Received: by outflank-mailman (input) for mailman id 437469;
 Fri, 04 Nov 2022 10:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtdB-0001vd-82
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe62616-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:54 +0100 (CET)
Received: from DB3PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:8::41) by
 AM9PR08MB5921.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 10:08:51 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::3a) by DB3PR08CA0028.outlook.office365.com
 (2603:10a6:8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:50 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 04 Nov 2022 10:08:50 +0000
Received: from cf95ada5a01b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F94D1F2F-5D77-4783-AD72-315D7F3DCBBF.1; 
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf95ada5a01b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from AS8PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:20b:127::26)
 by GV2PR08MB8344.eurprd08.prod.outlook.com (2603:10a6:150:c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:41 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::c8) by AS8PR04CA0141.outlook.office365.com
 (2603:10a6:20b:127::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:41 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:37 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:37 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:34 +0000
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
X-Inumbo-ID: afe62616-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eDjEirHGu+btAIGZUxhGQ62kpA+tyYQoJwIWJwei/E8KLoK9NmsYzOM4cXpLw5MAU5Uj1sIEX0vUrkP9SKwRXs7fDC7GjBYjBXfMEatoq8DHcrQFKGF+aI0aXV68xHuA2gaZ4iwGxtQnDrurKmOJOgEf3sf/ynnFiB9nmu/C7jlbjjV9LMiz65Iao8Vp0Z4kkzfA0wkkAGYBDqxCkF9jlioB5ZlG1Z4Jw/qPWdalZynMIi6zNdXaz2paZc9adfpzZ+gv8zSaq6nFUkSVeg0YqmowLGRDISaHnZ2BBce6n6x+3A7FElEOQ6pns0DpU/FF97XIHuwNnPgItLBV+Mi58Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMfl5+3GdSMw3LrCIRYTsE7TNrypLt4CfBNsRud2G8c=;
 b=DgU1HGMhsPTUCOpdZTROseHWww2A3MAGcS7fH2EBLD8t+mB8Mdev89CFfpI3P5T4/csNnQbczKjcSCVtPdv80jNP6I0YGX3rCyxk3+al3iPl2sXCZRyvf7gZcLlmGY8C0El3A76gDAVAf0hiousdwZFZ1FvRaogMsQxr6e2LusAsKgkQupo7o7C6R4hp828JquKR48dbnCsZofocIPZgLakWz8uu1Cd0s4Ry+Ah+zD0uqBIbQMIbwp0vlWRZX3XMMonG5ikBoUoVb1ogRWO06cTlzLoLXMB86JRcPp5AOgfRcY+I3utFj61U+IJRq8v+QIMbDU65/AKhXYAEaLfS9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMfl5+3GdSMw3LrCIRYTsE7TNrypLt4CfBNsRud2G8c=;
 b=HoDHy0eJM5az/HUbzTHmEojHtdlO8zcdpirgv/BHfhSjHP6y7SPmXdUChRrlAEbRprOWxWhvgX8QOmilKhxft1tSKVcN/QPDUcVj8cATCNO3tG+aYfYrgiJjsmEK1s+YJoUeN6dbsWhAqw+9LaJ2dR5y7nm1uw8KXo5Ytdw7Odc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcda8abdaa1cd753
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqGjtyfsbyx/rE3GMZVK//3szsOcLNjMnbslH0JniCwHsYgc+EJAdMWQmkxW46CpX9QjjFnkB4LFSr2ZphwIC8lMoTc0OE7AUyhkAPDYFaTBv7qCwa+z6uJcruVIE/rw2+7ibJxW8SjM5+mhBJ5lFeBWJQ8/wrsLTLKPvSEe9c7bw9PfNTGZKuKEC78ZSYYDVVIg/ei7+G/s4uciD7wSXawfgWG2ugMdJDYXMPTnM6b2cAgCkloQlo/7peld0TXDMymdbqTo05jQu2+onuJW55Alic4+oB1OXHVaAkS4P9HOQDTPvz7zHLHVZ+IPpJxveEKZFdDocQw4I+AuwfglIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMfl5+3GdSMw3LrCIRYTsE7TNrypLt4CfBNsRud2G8c=;
 b=mB45yfV83gTxveVnhgXIxH/P9WFelYD/YkwuG6cczHpCyuPkbzdc9Icuk2luTbZR5YxBlCL22qjNB3m7P+mevTnIIqeSdbWCf/eE0LyyrOQmCMpBRxU4Aa2YrWV2NczUbpJzqKVj76MsyjDxqxvphtkr4i93l+knfou0MI8f76xvEy8Sid4zeObqnbkJ5xhnFMyZjm3cSEAqUie/ZuxfJIN37t1BujTlRtRY1qdhzEo4bxlmZxjCZXsuGFbZQbxmS0lx6woWlkz+lhSSFs5sMmRI8DDv/ftyWeHrVqDZp17m6GqqyAoiGt4EA/426LLFyzI0qge+NjYgXLlXRhvHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMfl5+3GdSMw3LrCIRYTsE7TNrypLt4CfBNsRud2G8c=;
 b=HoDHy0eJM5az/HUbzTHmEojHtdlO8zcdpirgv/BHfhSjHP6y7SPmXdUChRrlAEbRprOWxWhvgX8QOmilKhxft1tSKVcN/QPDUcVj8cATCNO3tG+aYfYrgiJjsmEK1s+YJoUeN6dbsWhAqw+9LaJ2dR5y7nm1uw8KXo5Ytdw7Odc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU enable/disable
Date: Fri, 4 Nov 2022 18:07:40 +0800
Message-ID: <20221104100741.2176307-11-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT025:EE_|GV2PR08MB8344:EE_|DBAEUR03FT040:EE_|AM9PR08MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff2786d-cd62-4a0d-739a-08dabe4c9258
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 13jkDVDXaYbfsA06061addFV6g/Rg+VOK1MJvJdrmZTetL1RBU/VMMrHfSnDcTW4c2zsRLK08s8+Qf6Phy6XRs2jqv9PEQK2fx4EfQKwrmEWUrQNr3jLfXdpD2amtx33tDqyOMTsPZBMQ0kIUSRpRTsvQWsmeleIzghyc3v7Vg93aQaPXTb/0OOLDzv3CBCTyfEaUrOyuq/Teh+2DmgZeo6y1cpBEgE9gXanivpUg4tRl4dHI3CFZNDJotwtRyWUG9yMEAuhw+ptNL+emjqD6i3Gop3Eq8RchKNKQZE8nBzRKfY5Bh9FY9CdYM+XKErw8vwvN/uVlIlRvOhjHJIeyTXsBZ2aWp9FP69Zw2crlOmA8lSVDZHJ4rcW0Q5ohkSUuYr5vMD8sLan5wYyb31UktgCGbVzRhYM7CPVEjbMAaMlKKx0TWq5kL8KulHSA7+ZxH7CEgmq4zJmmcoXN7k5Aq1GDAtIpZt9Y8GeLoZN+q0YSQc6JsSZDG5YiEJtHQmv6ptX4/PGac63/Mnf4ktJhitRD1EvlNorsAZBlUThwzOsLkj1Mk5ApGID8dl3kHBOzijcxaEdidki7lMSyfgh6Z+o8U0U6ijybxojDA/xxjUCzpDeKSp+Yon82fd8x6XvedpyyJVPgW2WDxMbFIzgcG67TIMJF/t0uCLz6WhDU7gKdbW9V57/2ZCWuutkiTBaOYDqsDFiSDRop0GjSatg0njBzrQVZDdMb+7AWLImP47F4DAZxx9qrlFKE9jjUeOPUXJVlMGGVtzhWpVbhCnorUcftGxHI2eZ0Cbd65pbPV2ghNI0S007WLYGxhYNRW40
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(356005)(2906002)(81166007)(82310400005)(40480700001)(40460700003)(36756003)(86362001)(41300700001)(70586007)(8676002)(70206006)(4326008)(336012)(2616005)(44832011)(7696005)(5660300002)(186003)(8936002)(478600001)(1076003)(6916009)(54906003)(6666004)(82740400003)(316002)(36860700001)(26005)(426003)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8344
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4729a15c-73ab-47b0-f3db-08dabe4c8cbc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T1tdgX0NflLlczCr1KI2Ky8HCij2Jeq6JLPZHGoAhU52/f0jixs1vvllVN5qlxafr0eP0WQbK7igMVbUWSSud3yzKxNuxIotElJCLpa89yZABzgcCE6bj2RlFQlUuUK1TkRX7meFyjLC60b/Z/uGkaWGHuWDYS8llGffdX+pl4Hh2Vi7ZAPpeKnkC3WW6djLtNHXoN8eRGfsY/1GFMmlT/iobovlTaQH2Oh61hlHZO+L4EsFXIKbwfj2+6wm/MZ/iyLFti7o0rfJT795iiVnjG0HkWz4iXU6wxI7jNqn9zylNMWdKGurJ/EFlzVyb+kiUGiO0E0SAlFfn7fiycCOys00kxw6kwmmg4XgT+gn2INSYHShXsqSSexMEU1yjNrfMX1RH2G2XNL6hvP76BaYLddUumR7jj07UZtSUFzDeTUT5SylFId3/cXusRN5Tr3rphdFLi2Af6/Jpvwmu1MEJYutVsp8Oe4PoPsf7+vZDJ9Gnh51tK3LtgJlS9UnKNiptn8qt+xp7DpIramnMFDEWOM+PCfds7qk0qt71YPnhOIHNz+OvEB4I0UtT2YP85YMJXsYCqOWVvbTSjXRSMM+Wmw6b1fobWTkGANZYiFLI4YSOkZMKf4rLYRJZh1oYc3e5AAMGsx6p7YhoPOu/zRfsY0H5U78e5hOcx4efJI0ZQYXXJpzfpKXdNzwZo5cCKpjtF9axJYBoRXeR9oR3EuP3NmGjJn1prLnMSIz3+GV26+X1tUF6NN67mUSC7eYbd88aksAxNXr9SePfvlFsfG30A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(186003)(336012)(7696005)(2616005)(1076003)(83380400001)(6666004)(426003)(36860700001)(26005)(47076005)(82740400003)(54906003)(44832011)(2906002)(40480700001)(40460700003)(316002)(8676002)(5660300002)(478600001)(8936002)(82310400005)(41300700001)(4326008)(70586007)(70206006)(6916009)(36756003)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:50.8408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff2786d-cd62-4a0d-739a-08dabe4c9258
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5921

From: Penny Zheng <penny.zheng@arm.com>

We need some helpers for Xen to enable/disable MPU in boot-time
and runtime. For MPU enable helper, we know that it's an
essential requirement of MPU system. But for MPU disable,
we need to use it for some special situations. For example,
in the progress of tranferring from boot-time to runtime,
we need to update the MPU protection regions configuration,
but we can't modify an MPU protection region if there is some
data accessed by Xen. But in boot-time all of Xen text, data
and BSS are in one MPU protection region, if Xen want to update
this protection region, above restriction will be triggered.
So in this situation, we need to disable the whole MPU to update
the protection regions.

In these helper, enable/disable MPU will also enable/disable
the D-cache. There are two reasons for it:
1. Make the function semantic be consistent with enable_mmu.
   For MMU systems, enable_mmu will turn MMU and D-Cache at
   the same time.
2. When MPU is disabled, the MPU background attributes will
   be used. On some platforms, the background will treat all
   memory as device memory. The access to device memory will
   bypass the cache, even if the C bit is enabled in SCTLR.
   To avoid this implicit behavior, we disable cache with MPU
   explicitly to tell user that when MPU is disabled, the
   memory access is uncacheable.

In this patch, we also introduce a neutral name enable_mm for
Xen to enable MMU/MPU. This can help us to keep one code flow
in head.S

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/arm64/head.S     |  5 +++--
 xen/arch/arm/arm64/head_mmu.S |  4 ++--
 xen/arch/arm/arm64/head_mpu.S | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 6c1a5f74a1..228f01db69 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -255,7 +255,8 @@ real_start_efi:
          * and protection regions for MPU systems.
          */
         bl    prepare_early_mappings
-        bl    enable_mmu
+        /* Turn on MMU or MPU */
+        bl    enable_mm
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
         ldr   x0, =primary_switched
@@ -313,7 +314,7 @@ GLOBAL(init_secondary)
         bl    check_cpu_mode
         bl    cpu_init
         bl    prepare_early_mappings
-        bl    enable_mmu
+        bl    enable_mm
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
         ldr   x0, =secondary_switched
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index fc64819a98..b542755bd2 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -217,7 +217,7 @@ ENDPROC(prepare_early_mappings)
  *
  * Clobbers x0 - x3
  */
-ENTRY(enable_mmu)
+ENTRY(enable_mm)
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -239,7 +239,7 @@ ENTRY(enable_mmu)
         msr   SCTLR_EL2, x0          /* now paging is enabled */
         isb                          /* Now, flush the icache */
         ret
-ENDPROC(enable_mmu)
+ENDPROC(enable_mm)
 
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
index f60611b556..5a1b03e293 100644
--- a/xen/arch/arm/arm64/head_mpu.S
+++ b/xen/arch/arm/arm64/head_mpu.S
@@ -68,3 +68,38 @@ ENTRY(prepare_early_mappings)
 
     ret
 ENDPROC(prepare_early_mappings)
+
+/*
+ * Enable EL2 MPU and data cache. Because we will disable cache
+ * with MPU at the same time, in accordance with that, we have
+ * to enable cache with MPU at the same time in this function.
+ * When MPU is disabled, the MPU background attributes will
+ * be used. On some platform, the background will treat all
+ * memory as IO memory. The access to IO memory will bypass
+ * the cache, even you have enabled the C bit in SCTLR.
+ * To avoid this implicit behavior, we disable cache with MPU
+ * explicitly to tell user that when MPU is disabled, the memory
+ * access is uncacheable.
+ */
+ENTRY(enable_mm)
+    mrs   x0, SCTLR_EL2
+    mov   x1, #(SCTLR_Axx_ELx_M | SCTLR_Axx_ELx_C)
+    /* Enable EL2 MPU and D-cache */
+    orr   x0, x0, x1
+    dsb   sy
+    msr   SCTLR_EL2, x0
+    isb
+    ret
+ENDPROC(enable_mm)
+
+/* Disable MPU system, including data cache. */
+ENTRY(disable_mm)
+    mrs   x0, SCTLR_EL2
+    mov   x1, #~(SCTLR_Axx_ELx_M | SCTLR_Axx_ELx_C)
+    /* Disable EL2 MPU and D-cache */
+    and   x0, x0, x1
+    dsb   sy
+    msr   SCTLR_EL2, x0
+    isb
+    ret
+ENDPROC(disable_mm)
-- 
2.25.1


