Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17956BBF4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363471.594044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOH-0007yd-H6; Fri, 08 Jul 2022 14:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363471.594044; Fri, 08 Jul 2022 14:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOH-0007vF-Ck; Fri, 08 Jul 2022 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 363471;
 Fri, 08 Jul 2022 14:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOF-0007Ai-CM
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01da2c41-fece-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 16:55:29 +0200 (CEST)
Received: from FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::22)
 by DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:55:26 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::3c) by FR3P281CA0070.outlook.office365.com
 (2603:10a6:d10:4b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.13 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:25 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Fri, 08 Jul 2022 14:55:25 +0000
Received: from 31d9462c680e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A78CC50-9495-420C-98C8-2FB08507F2EA.1; 
 Fri, 08 Jul 2022 14:55:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31d9462c680e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:18 +0000
Received: from DB9PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:1da::20)
 by VI1PR08MB4511.eurprd08.prod.outlook.com (2603:10a6:803:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 14:55:06 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::46) by DB9PR05CA0015.outlook.office365.com
 (2603:10a6:10:1da::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:06 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:05 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Fri, 8 Jul
 2022 14:55:03 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:01 +0000
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
X-Inumbo-ID: 01da2c41-fece-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nwcj3sou0jYGFwTRilG6ZVxUBERKYDYiUsijrH3EKwp5hlgtX6gvhf/Sya1dxPkz+yL1xIOmmzYwml47SR7rER1FTFqH2wumJsUtXM3p03iLTF3mjmwGGRHVegbeE4PcbJ6cgjO7LFXEdIcekAmgmtCdr3c3LfDXt+MFmgrdAem/uW0iM8xu0ZaM8fo2C7I7jtt1wiQ5gyv2FuwNMmGTJseWXzKoXNS+oHOtKmZj8a7Ar8fRs8PGPPJSfftYaYygXa5bwrti4GyEnSi5jFF7Ujy6THXfbMc0VQPeigbFgtx3CoJ8LKMH/vSKpoZW5wpA3IA6SwbOoFi7hyQc/mvV6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rp+JDYzWrvvbuy8ZPNrJYoe9iSuHHdiEXdj+bJMmS4=;
 b=VOj0Buys+rflBeHYNVCjdrFf9RBsk9BH7M2W+pBMsDZKeyMrJL6KqxBtlKsPD++Tg53GrpF+Q6A8JjeJ8pGG0yrTjlbkNGS1QEhkXKn/sNWacntV4CbGAJM3jh5mMLEOWLEZpVRURPt1saKqla+L+1vaauy3pnhrjBrfXcv+H7Ib8yWWO/PFJD+tYP30KfZG2CNo+n01LkdJ0gei6tt+9CZOSGW9zG1+RNEBRvbWBwGLgANdKL6FB5XsRvK8afAqB2XZA1e3fKhbEBUcXlgZBQDVHnSGv6UMdwIpmzPYOfZuqWDfRHq6kIuThw28TXKCsfJAHFsZVpxnHbNsuS9Nkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rp+JDYzWrvvbuy8ZPNrJYoe9iSuHHdiEXdj+bJMmS4=;
 b=NuzlkyGE5WN5hNskc657a6o1ZBVeO3f9DbA/+Oi/2cHzv/sC3FivNGHhPavH17y8CJYsupRnec2Sjz1FfIw/KgPq1qd33RUG/4r65Rz+QJzH7kIRQDfSU301ZxxT1BNsVL+n5dDUlxQHiL9eRTX6VQ+Bzm2U3oQs0DVZbI9D3H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06c9b3aeb875b9c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHakffQVIBqwEqU/rcqsZkv3OfKzeTVRJv8lNDqXsht+LDyfETVM2mrj45TRm0hqp9mXbNLIEWmjZEJ74dU360KQMfkE22aT0DpQOrH0ATZ5YNdk/uZ+paHvp2sWHRS3nabyqeAawRrMwsk3aqvHKWDBenSD3UgK+vXw+BYYZCM/NZgAOU4R5bFc7JPaEFLD5NoRAzzxddYVZSjJkgT20WRGKZnfNz5VASdHkV4tcisXDkCo2sWNGbcIP2uzBXB6vfojHMXzjT8M4VnmW4EQAcP1GyFQ7urkBqmrLg23ZjNQ+FzsXSyFeLiaAiEsDGSTOo3PKmOXpM/4p2wwc9MRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rp+JDYzWrvvbuy8ZPNrJYoe9iSuHHdiEXdj+bJMmS4=;
 b=XDDHBLczuF5YjM+by/18qz9RC+vlYB5pBh6p+M3Dv5Bv2Abj87WjP04g7Wwm65/29lbxmczOddzA89RvB9f8P6ymQXR4SzDwL58IWU15C+G995J/1NRrGppYKU1D07IMWVz7XBnCwlfxw212ZEpOOKc1765MulMKXmo9picKR4ZDOn4TzMZf0Vnyj4H62PFBEs29tn31kLPXYY/2pbPfeyNgCOLTB8rnkRACHVDw2iH8tfie84D6XizLtOGT2MkVOYLvBRyDhT4cY9L/CtkMJVHepKiEJn+Osav3BptywzZKoNvb9I/3EkLuCYaIJvyD60Gc9gU/AM4h3pGX0uIShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rp+JDYzWrvvbuy8ZPNrJYoe9iSuHHdiEXdj+bJMmS4=;
 b=NuzlkyGE5WN5hNskc657a6o1ZBVeO3f9DbA/+Oi/2cHzv/sC3FivNGHhPavH17y8CJYsupRnec2Sjz1FfIw/KgPq1qd33RUG/4r65Rz+QJzH7kIRQDfSU301ZxxT1BNsVL+n5dDUlxQHiL9eRTX6VQ+Bzm2U3oQs0DVZbI9D3H0=
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
Subject: [PATCH v2 3/9] xen/x86: move generically usable NUMA code from x86 to common
Date: Fri, 8 Jul 2022 22:54:18 +0800
Message-ID: <20220708145424.1848572-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 49745b58-c02d-4413-75e0-08da60f1e43b
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4511:EE_|VE1EUR03FT033:EE_|DB9PR08MB7179:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RYfULEEnsTM3mRQbRcX7hbjDdR0ym+QHsG2fxbH8o3XDHC/psvaQ2wA7UPPgXBxYFRXbCCKN6+10vpmF5H6BIObZ6AmMmsKLFm2FIwc4Gb3BqoM4gt5BBXNGOvwh7C9D9A49LV29OK50IxYDTceu0wRCrdVVPO1lOZmnlRH28ag0sgb8PGf9o2J09D8UX82qmwgyd44oH2EE7kO1FuVsnSk2NG3zYo8ad9JOzUGgrSEWnZLBOzoHzo4tyu67wvNBQSBjAm/5l05c0XJBB9y7QlewqHH/TtT9mTBwNhhRTi45/gEUA+xVJAn5RFYRv4HIth42f8BVp1qi+xu5O0GVs0R2lwpdYz81sohcosMIkR0a1xLn36yKCnkJG4lmEAGbw4EabA8HXIIl8rAA9PH2RF146ibgJVGeIe5lQdNLPgmBUAmrIJAwjvc4yaB+361VhrmKsV7VEdcynRstI2AswASJlzghoE47dEkxpoNnYaqFkzRNQy4xJo/F0Xmb25s4DbZ/rxPNmWXgc51CWTEds9RFTJxrU1hB/YbWzpdnYb+OQZ3hdzcDQJ1DzLuhPM8JCLcmcHLGXQ6RSs6T17uaDBDLnLKBgLdgSKX70NIxSQKTEVEMZu4VFP+kTGh0dgqAtfXgOwJQnk+fFPUWEe3H+a13TqzYZzun6M8QIdcr6pgO35edNCIRjQBX7FoowzufRD97urRUtQRLvyAbXjbgR5K91PTToWI1Cj76Y/+xSFDPgPbr19O/fenwu+3XNPxBGhMIqEkY6yNn2EOgojvEMYsutSvdOgqarMipsmOTPFsxttjAojZLhzKMM8/jIhiHEhuxG0FtQwbvz+cCN1lknF7TH07FBwZh7U00EwRVmD8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(46966006)(36840700001)(82310400005)(70206006)(6916009)(83380400001)(4326008)(81166007)(70586007)(316002)(426003)(1076003)(186003)(2616005)(8676002)(41300700001)(356005)(26005)(478600001)(82740400003)(54906003)(47076005)(6666004)(86362001)(30864003)(40480700001)(2906002)(40460700003)(36860700001)(7696005)(44832011)(5660300002)(336012)(36756003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c29c1cd3-efcf-4b6c-7b36-08da60f1d88b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8trM9A6Nu5O9y6dvk0Ca8Wh6MbhqUE/kcoJ5j8pAN8TONw9lZ9FiGtCWXfMIEgUgpHGzmwtlpSYjm2AYwxlcpzCQov2n21wByu4DiG1DwHT++OeLDdwJbMxeVL3Fy4XJCHeiNaWMsN5VHu13dlXzDBHqkMbLUrw3uTwsviU+FfNMvvBGXtDcYyFGZp9FclPkQgSV9VVm0ZLmb6FVrSRSbChtnCq7AaSCzN0MmtmtcTWx56aAp5pgJFP+EljoprDEE3okmd8Sxg9kroTxa4QMVRPdHWN5FHzpzlDDTlYQgvKhdederetOfVn6mSWQ/YLZNewFvhRcevUb0TeMJiyMzO+5llrxY/tZ/kRdi8oy6jHF+63NUmclRL52KJZ7/f3g00vt22giPrBXPTbFYV424F46AQUpCWRBYqT3IghhMAFCa6ikRHvDgtG7kC6/BQ7iWElsFjXEb29GFMpG4EtuKnVSBLpY6aehXLrDEsRTNnX13LKc3xYKH6szs3GN1R/TodMrD/HVLCFRD+hOZtlDUoLlXzwnm0KRyY8lfaOEB+hnHCrA620wGqfz8PiJ/omYTvVCV8Fj24hDisJdQ1hClV8+Hq+89LaXRDaxaKHCLj3R/0XXjoXObUGTEJLJgT/2KydplLMu+tLAeuizJSa3FkO+k8pNI1NDQc63FwYOcrNTLOCygDu3kghVDPzmVmKf6pW0ZrFrZ8QUN13rLeiwGt4OWGJY1hYCOjO5qrc+8H+Na5KVRPm+JHtKbCCF+uueeZbIXnqCySmpA1CXL3JBWUrXcug5BbPFOLGaoGT4rZ9PjgdJtr8bRYKOG/8N26Sq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(40470700004)(107886003)(316002)(1076003)(36756003)(40480700001)(30864003)(82740400003)(6666004)(5660300002)(86362001)(6916009)(44832011)(2616005)(83380400001)(54906003)(8936002)(478600001)(47076005)(336012)(4326008)(8676002)(26005)(36860700001)(70586007)(7696005)(186003)(81166007)(426003)(82310400005)(41300700001)(2906002)(70206006)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:25.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49745b58-c02d-4413-75e0-08da60f1e43b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7179

There are some codes in x86/numa.c can be shared by architectures
to implement NUMA support. Just like some variables and functions
to check and store NUMA memory map. And some variables and functions
to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As we have moved phy_to_nid to xen/numa.h, we don't need a
separate MAX_NUMNODES in asm/numa.h. Now all architectures
can use the same MAX_NUMNODES in xen/numa.h. The conditional
macro can be removed.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/numa.h  |  64 -----
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 431 +-----------------------------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 439 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  74 ++++++
 6 files changed, 515 insertions(+), 495 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index ee8262d969..d8960743d4 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,81 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
-
-/* Enumerations for NUMA status. */
-enum numa_mode {
-	numa_on = 0,
-	numa_off,
-	/* NUMA turns on, but ACPI table is bad or disabled. */
-	numa_no_acpi,
-	/* NUMA turns on, and ACPI table works well. */
-	numa_acpi,
-};
-
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_enabled_with_firmware(void);
-extern enum numa_mode numa_status;
 
 extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 0777a7518d..193314dbd9 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,12 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
-
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-enum numa_mode numa_status;
 
 bool srat_disabled(void)
 {
@@ -59,267 +34,6 @@ bool __init numa_enabled_with_firmware(void)
     return numa_status == numa_acpi;
 }
 
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( numa_status != numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_status == numa_off ? "NUMA turned off"
-                                   : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt,"off",3) )
-        numa_status = numa_off;
-    else if ( !strncmp(opt,"on",2) )
-        numa_status = numa_on;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_status = numa_on;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-        numa_status = numa_no_acpi;
-#endif
-    else
-        return -EINVAL;
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -368,146 +82,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..bc6a2ded14
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,439 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+#include <asm/acpi.h>
+
+struct node_data node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+int memnode_shift;
+static typeof(*memnodemap) _memnodemap[64];
+unsigned long memnodemapsize;
+u8 *memnodemap;
+
+nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+enum numa_mode numa_status;
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      int numnodes, int shift, nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    int i, res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static int __init extract_lsb_from_nodes(const struct node *nodes,
+                                         int numnodes)
+{
+    int i, nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
+    memnodemapsize = (memtop >> i) + 1;
+    return i;
+}
+
+int __init compute_hash_shift(struct node *nodes, int numnodes,
+                              nodeid_t *nodeids)
+{
+    int shift;
+
+    shift = extract_lsb_from_nodes(nodes, numnodes);
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%d\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    int rr, i;
+
+    /*
+     * There are unfortunately some poorly designed mainboards around
+     * that only connect memory to a single CPU. This breaks the 1:1 cpu->node
+     * mapping. To avoid this fill in the mapping for all possible
+     * CPUs, as the number of CPUs is not known yet.
+     * We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static int numa_fake __initdata = 0;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        u64 x = 1;
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz/2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes,0,sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i,
+               nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( memnode_shift < 0 )
+    {
+        memnode_shift = 0;
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_ACPI_NUMA
+    if ( numa_status != numa_off && !acpi_scan_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_status == numa_off ? "NUMA turned off"
+                                   : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+    /* setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt,"off",3) )
+        numa_status = numa_off;
+    else if ( !strncmp(opt,"on",2) )
+        numa_status = numa_on;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_status = numa_on;
+        numa_fake = simple_strtoul(opt+5,NULL,0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+#ifdef CONFIG_ACPI_NUMA
+    else if ( !strncmp(opt,"noacpi",6) )
+        numa_status = numa_no_acpi;
+#endif
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each(page, &d->page_list)
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..db0e524a0e 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,78 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        (cpu_to_node[cpu])
+#define parent_node(node)       (node)
+#define node_to_first_cpu(node) (__ffs(node_to_cpumask[node]))
+#define node_to_cpumask(node)   (node_to_cpumask[node])
+
+struct node {
+    paddr_t start, end;
+};
+
+extern int compute_hash_shift(struct node *nodes, int numnodes,
+                              nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+/* Enumerations for NUMA status. */
+enum numa_mode {
+    numa_on = 0,
+    numa_off,
+    /* NUMA turns on, but ACPI table is bad or disabled. */
+    numa_no_acpi,
+    /* NUMA turns on, and ACPI table works well. */
+    numa_acpi,
+};
+
+extern void numa_add_cpu(int cpu);
+extern void numa_init_array(void);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern bool numa_enabled_with_firmware(void);
+extern enum numa_mode numa_status;
+
+extern void numa_set_node(int cpu, nodeid_t node);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern int memnode_shift;
+extern unsigned long memnodemapsize;
+extern u8 *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&(node_data[nid]))
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


