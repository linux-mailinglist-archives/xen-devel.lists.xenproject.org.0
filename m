Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDD59B7D4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391097.628793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf6-0005Hg-4Q; Mon, 22 Aug 2022 02:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391097.628793; Mon, 22 Aug 2022 02:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxf6-0005FG-0u; Mon, 22 Aug 2022 02:59:36 +0000
Received: by outflank-mailman (input) for mailman id 391097;
 Mon, 22 Aug 2022 02:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxf3-0005FA-VC
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71a9c2ed-21c6-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 04:59:31 +0200 (CEST)
Received: from AS8PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:20b:127::25)
 by AM8PR08MB6610.eurprd08.prod.outlook.com (2603:10a6:20b:36a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 02:59:29 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::e0) by AS8PR04CA0140.outlook.office365.com
 (2603:10a6:20b:127::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:28 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 22 Aug 2022 02:59:28 +0000
Received: from df790794b7a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8828ABBF-7779-4997-85E8-B04C17BE5E06.1; 
 Mon, 22 Aug 2022 02:59:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df790794b7a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:21 +0000
Received: from AS9PR04CA0160.eurprd04.prod.outlook.com (2603:10a6:20b:530::28)
 by PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 02:59:19 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::2d) by AS9PR04CA0160.outlook.office365.com
 (2603:10a6:20b:530::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Mon, 22
 Aug 2022 02:59:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:07 +0000
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
X-Inumbo-ID: 71a9c2ed-21c6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BJW23nKz2tDwYUea0lSvFcZxTC/wZpFXFKCwSOLiMtriJx2WORVxUy1KISmjJc2BUVWopq5mkGPlbLL3Cw762UkIvBJBuG+PpZ2eaYoTtyrxLbOgVJ8nGWeP1NfS4a8PW92aiVAEH0aq6cjwSrwCf/ZJt2mbgq8d2UC6SfUh0n6JmtGsVPxQfBQ9fbQEfT3cZHg5Xou55nO4uWI5FCI3aV/A1PZ0U8x8+mazwsztTayB968/0FBvim8U1JixAS7pVM176LeWtwXMR5PrDelRWM/maZQuxjZ2vJY5Or/b5oLW48fmcmGo9e+PVd+8k05V9rBQ1k3h+UQbe9fKBvcfiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5hZqLJ4W32AChx70fAQAjmAprGclHcl5OXVtnplM5w=;
 b=KxZemPSOJnS5j2dPbsrYlAHlQYHUZtyhhPp5nCF6d1B4FV7eode4B1DXinkHsLfT782opqb1bpap3Btr1J/XRv8rJMoldYg9PtIlddpYseHY2JERj/QoGNnzsG93MVl1SF6MtZ9LnUjW4eKRycY+JleoUaROl9m8g/QsyTTRg9Wj2b+SngPNxM26TD3wU/Bl+VZJcVz+V055LXPw0HgPHZ3tb5AXKKjcrjexpy/O/9OwRlw+IhjkiQd/jbkzQU07s8bRD9fzXkBbY+vNd6HPQsAkZ/98GgR5eRU1nsVli1/s1mC1QTlDUZsCnIWKuf4+q18vF+8lUZBoUDto7sSYoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5hZqLJ4W32AChx70fAQAjmAprGclHcl5OXVtnplM5w=;
 b=beuT1ny9EWnm8HtJN9Ts+N2dT2jp+2icsSQZXunpZe9lY+jt5TQtz+Tq/aN/GnkCmtSJiaiJ/9Ti5TV1svJG/AUQ/JDk+Z3FkTW8kwjXIuZVCEi8IvDtJcn/IQS7b/63XThMw/1s225gv4DLbqohW9UqeMM5nKJ7pDSdnlF2P5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb90858ae4eff183
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1w8J3XLV8N2mRmiQDp0TUGqA1yoW8yH8BKo065q3SLc2mDqEGuyzezKNJyKzQXc1WfAxb2dwVLX3w/6L4r9ajaYhwvo3oZuNr7q7yM4Vk9qTEielgDHd3VVRqnzjUBRKXZG52nsRr2ndU1IXBQ583+mzHCsSw+72xIrzQCfonHJJHbIK7XkVv6Nt7SplpcTKlT5u5uw/LvQL7fnbCqbYsW0QwuOJXsKOrSJpaeDGPo+S09th4Ik1haB3VwaiKqMd3+HTJPQZabyyhGmguJcGLxfR/DIs7INDQ+8Fat3r/iPqRSji364Ajw+MiKPmRWtSIeBWYPdNKSuQNKkhTybNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5hZqLJ4W32AChx70fAQAjmAprGclHcl5OXVtnplM5w=;
 b=C8p+YZ7mPzzuoQNkepYLMqaur62KtEl279MCqcfHaTlDej5Lm6OUJFELslij3MZVV+R5YKtYDYfPEtbWSoy3MMitpmWNq3SjbogeZbgbYlNOjWmazNdn25OdCeaxjT7kCCcRQIr+Ckn0Z4nvqLcJI6kseQ8EYCrJwI7NDuFtbMhqYBClFuOTGD2P+qqeybb5tgPggfxAoTt7yeProj/JzK5JqvWOMqJEWOLmW+h+J1s9wzPTBY8d/+3kXGg73SYJRBWkrKpsyvSofB7pE4rzqkV61KMlUnf8xDh6PtkMhCp/ImekW2ZbrdpLf1IvskB0iS1ouvgaz/+IaRcM2go0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5hZqLJ4W32AChx70fAQAjmAprGclHcl5OXVtnplM5w=;
 b=beuT1ny9EWnm8HtJN9Ts+N2dT2jp+2icsSQZXunpZe9lY+jt5TQtz+Tq/aN/GnkCmtSJiaiJ/9Ti5TV1svJG/AUQ/JDk+Z3FkTW8kwjXIuZVCEi8IvDtJcn/IQS7b/63XThMw/1s225gv4DLbqohW9UqeMM5nKJ7pDSdnlF2P5g=
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
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/6] Device tree based NUMA support for Arm - Part#2
Date: Mon, 22 Aug 2022 10:58:04 +0800
Message-ID: <20220822025810.2240707-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 486b5eda-f48d-4b53-ff1c-08da83ea545f
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5593:EE_|AM7EUR03FT012:EE_|AM8PR08MB6610:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yGXN7hOYW3WbNYQLnw5GmnsLTj87ZV5T0k1OIuTHFyRJty1ZQ90GhjMY5REAF8QR3M3+saQNBeGwtaTPG4xZ/d5kIrjTnrQ4jOMc+l4QAdptd3jJXMCXplYGzZCFTrGTFNwB/h566B5wSQxm0hZxGoJRj2vnT/VEKGGqGcdHYR6Q9g1TirLd/6lVSsy/aRyVkjL0m7geDXaGMkWNp2lOqX2TQFLMXyxxPXnG3ZOfZBTImKDr2uZAV7we5pHHYJJSBrKK1bi8F6PrmQrjD2bU8PF11TjAPubKnku8PFaq/kEQjlCYHG5XTk5ib+xluVjQUfJ7d16OiuWzl9NwbJ0ZRdoBr0AUVpCCjdry+h6S4DBUPrpd4t+g7MaGp6gOfMZ3jFI/QLf0IfpbCiPNmNqQgC4pkBIXYgcz+F/v+hz/pNuV6ycI/6Sva9g0PV4ROT9XDS75rPncd2W1BBaY9OwLNJevl7XRE1vKiSfL1xiAK/EDpNYjZQ08puqeXkymIBrZzO0RjlVEskvpexVSEpff4B4ivhAkCs0VLUqJBcsMXjbmlsgiWP20MNobPQj6oz+XGUWV/rmYGczhV5KxugbauO92/xrg5gpkGD8aYJRVO2ihOMxrTvT/6F4bEUNn5YDD/LI8VBImJJjIKBEjAFjggOxMk+RiFS1hloRGmTKqB5u3OVYNYss9r2Aw+8qCAUhL4D/YTnGultWwxeo9AQ0qAM+nJWVL5IHr1NnAw9cy/WVWXbkQ+TB+ZYO2i2wor9x7dkZDOcSwIDUHAuW5zdg+gn/YewLUIjWAoRV0HX1GzEJDSOTYHbKQHoDCwYqZ+LRLCMgycoUzmEVwnMDvXXrsKOA3LZaMXvYLsiIXF2Q81isDJFebWtAlVnuxYHoUeuQy
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39850400004)(396003)(40470700004)(36840700001)(46966006)(8676002)(4326008)(316002)(54906003)(6916009)(70586007)(70206006)(82310400005)(40480700001)(40460700003)(5660300002)(8936002)(82740400003)(44832011)(36860700001)(86362001)(36756003)(81166007)(356005)(2906002)(478600001)(41300700001)(7696005)(6666004)(426003)(966005)(1076003)(336012)(186003)(47076005)(83380400001)(26005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba33ca07-6b29-4673-2d61-08da83ea4df5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Ule9ow/GU3Z2CLEUMO+MPBlTeHlvDn8DyONMaUIobnkdLrgqhPLJfIV87vXjoPV2weflwZR/1gjsJEFu3oTVqRkIak/Vo/PqwfxT7i5hpnmL3clLXrlrlJnhj23T/hZ8e2pfQlMfDAQjvNSvOvdHSPr+Es0dS2YPwdpMc31kp5wlvlCAw/7KzzWCyG9b1YtSZhEzn5BX2k1GqHMlkoXEe5M3a9fGaZxbShX3rInPkUHPaK305FfB8QKEAK+hiJtmwd5+NJeTCYBroQatJp/5hMi0iPnOZ0yK5g/AeJJWz3IhOGHWuBRENggEK7h30DTlPZUUnfwVJwJn4voeYfVL5Ze6Ua0A7JQDi9XvHfMcd/v2UwbDNmuBoJpnxOWlYkIKLOkSn9AH2vjEZhOokSUwVE2sG3QT1FI+0vlKm9drnz6ITtnJTXG5Cw50R4QwDvo699x4Z4rJtLWOrt28zZnqVeKWFICFIcULcRh/DkD3hwnKe2/txT8WlsKEGdv03KyHL65vY5oPBXATkoTR91D75slsFxS4lCObfQXIwnpsiN1EG91imf6upJVHvLMW5nfZSizVCJWcL6hX/ev477UiV8AOhauunT0lAe1zNjYfdDeRITQ9nPVi+jQykiMf0U/y6IsLKMfHDScAhNyXfUsyLdL7Rdaux8yaqKateARrXd13GKy1hkdubFEVly8HY2YjmHH+332KLWprsjvQ+xEW+voVhvTsJzF43uoCtrSrSYhCR5p8GWuYLdctu2wtAGvaRwx+Z0YXnxuQbpJxBbq4VDYM7os7n2FsZpaKFE0y15HU5LLJEVMfvk72axW23io
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39850400004)(376002)(396003)(46966006)(36840700001)(40480700001)(2616005)(82740400003)(83380400001)(36756003)(70586007)(54906003)(81166007)(316002)(6916009)(4326008)(70206006)(8676002)(26005)(107886003)(966005)(2906002)(82310400005)(36860700001)(86362001)(7696005)(186003)(336012)(426003)(47076005)(1076003)(41300700001)(6666004)(44832011)(478600001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:28.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b5eda-f48d-4b53-ff1c-08da83ea545f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6610

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v3)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA scan nodes codes from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 448 ++----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 313 ++-----------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 757 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  87 +++-
 14 files changed, 916 insertions(+), 775 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


