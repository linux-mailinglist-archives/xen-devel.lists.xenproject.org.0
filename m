Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3676575F83
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368114.599301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIqd-0008Cz-Mq; Fri, 15 Jul 2022 10:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368114.599301; Fri, 15 Jul 2022 10:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIqd-0008AG-J8; Fri, 15 Jul 2022 10:47:03 +0000
Received: by outflank-mailman (input) for mailman id 368114;
 Fri, 15 Jul 2022 10:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJOH=XU=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1oCIqc-0008A3-Hd
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:47:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742883ed-042b-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 12:46:59 +0200 (CEST)
Received: from AS9PR06CA0764.eurprd06.prod.outlook.com (2603:10a6:20b:484::18)
 by PA4PR08MB6157.eurprd08.prod.outlook.com (2603:10a6:102:e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 10:46:49 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::bd) by AS9PR06CA0764.outlook.office365.com
 (2603:10a6:20b:484::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Fri, 15 Jul 2022 10:46:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 15 Jul 2022 10:46:48 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 15 Jul 2022 10:46:48 +0000
Received: from 10096d9e19d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5E590E2-AAF3-477A-A09A-9ADFF792A8E7.1; 
 Fri, 15 Jul 2022 10:46:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10096d9e19d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jul 2022 10:46:41 +0000
Received: from AS8PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:311::23)
 by GV1PR08MB7682.eurprd08.prod.outlook.com (2603:10a6:150:61::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Fri, 15 Jul
 2022 10:46:40 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::f9) by AS8PR05CA0018.outlook.office365.com
 (2603:10a6:20b:311::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Fri, 15 Jul 2022 10:46:39 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 10:46:39 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Fri, 15 Jul
 2022 10:46:38 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Fri, 15
 Jul 2022 10:46:37 +0000
Received: from a015977.shanghai.arm.com (10.169.188.38) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 15 Jul 2022 10:46:35 +0000
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
X-Inumbo-ID: 742883ed-042b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WLZKzkvyJEmMQrkyjiSiyLQC94kONBpsD/4YlDSpsjG5COF0aBje1zvfhizukdmr2Umsqu9pRDa9pFVo0mVCpdARTp1Ozn8F19w5P/WU3HUfN8Gw1t9Fv8ya4cHlrWEQUWJk5BLE8ip6N+MHojHj/tM2sGuBJqEQRsBpa9BiZnEflmQYdagi1m+arCHsMvTsqmSv4/Esd5Kx9Z2JBhG1pDkv0sTZV2NVVkznzHdhorAY2Pe3FCsK4p4CdYINYywLOzbpgQaQ27nnadAuztlDxrMOK5IDTxaA4cnGeSxX0mLlpxZQyd0/7JVEDJFGpjjXGH7f/cOiN4WnEpfj1dDfcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be62q+eqSPIlABcw9yzXa9Ay/ADAWlWUIE8vacmfxBo=;
 b=evcSwLdbMHeElTF1UDGeK46ka1vgPmvZ+aI5aXxP5Y3XxWwIuweL/DGgj+WUDR/bRpoyA3k3uacKKj40jFk6rvWBeEQgx2uAlGCydr1hz7aM/ERDMgQO/Boi/vcOlTYp69du70rDWsZxHu2cattuzRuTAKXgBtbssyleD57TBZlaJb25yzU2iT+RYkkmRjzJ6fL+rl7agBSVOMlliw1MhYe9cTTF/JEWYNDR6OYCXtT6P2lTLrO6lHxLjxTU4oTIgD/8NOEv6Fh6nKmbXE4B6hqLlXA9YCHfSCvYCMJwcq+DcK9S8VpOXc52Ho7KU6nTat0IcaKA+9baorgjCQyLrw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be62q+eqSPIlABcw9yzXa9Ay/ADAWlWUIE8vacmfxBo=;
 b=YMvk2BNN8OuHnaq+to4XkScH4s27AIABcK8lNxN4fgWZ6YQQxhkChFYPxwDb5nstofMK99icqE/37jtHWsgp+CmdW8KM7ghYASX91ONhY/y3UhcMgMIcghGAdoE+86dnfyJ7Fxg1ByZjsesrOWwBbGPE4e1fNEANSZZN4klxoF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85b31f4851c6721a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOC2GatxIcjXdx2iR8xsmi88/DFQ6IxbEQmJ7jlRxCWyYP5/V6To/KRokjsM596yCbd0vTYp9k/SvnpdDtg/BCsNHlNCQzzVNCjYqoxfvv2jcDBUdDnhpexxWNB0BYrPvmr7QPzNAVs2WJkDZIONkhaKV5UD+RZ7a8w6Kg9zz3UZ5kiRAGU4fvGUNFHn1oNCrIXij0pin0dghzclorfjRARbGi0Wx/em959DlrSTnJt0DZfMRkE9t2HD/UePdyfdBVZZgrdk6t8JWwye/KaHWvotjdBXOEtHiSOry5/zEtYCTqJtgtqyymsJJ/TUuG6J2pYh+PYYMfYhDO8U3BnDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be62q+eqSPIlABcw9yzXa9Ay/ADAWlWUIE8vacmfxBo=;
 b=ehA43hgOaky8UXBEkgmVfvqMzoi81CQa6PXBSBiIFZ9labHug4cY7n4cy7ihJRUI7NTngb0rEvRSpK4ABTh5diD89K0uYF4dRM4QbNE1LoOxpERuHbBnSq58VfmwWsC+U5RtrYH7cNPgrgQJNUvTfT6RwrLt1GXzQ9MvdUj1Ntr9G7rQluZy4hJ8KVz/V+xU09upQdjS/XZY4SOS0ZsBoZ3fo0+oO1IHghPSeZmOYkg5V54wVeS2W1EFdXqFbO3+mDb3AX9TwjlfJJkRPB8ePON5+v9i3lLQpWFBaWs23UT38VXabPBUdjB96PPhb5jRqk7wPuAz/Lja5pDiRYJMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be62q+eqSPIlABcw9yzXa9Ay/ADAWlWUIE8vacmfxBo=;
 b=YMvk2BNN8OuHnaq+to4XkScH4s27AIABcK8lNxN4fgWZ6YQQxhkChFYPxwDb5nstofMK99icqE/37jtHWsgp+CmdW8KM7ghYASX91ONhY/y3UhcMgMIcghGAdoE+86dnfyJ7Fxg1ByZjsesrOWwBbGPE4e1fNEANSZZN4klxoF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Hongda Deng <Hongda.Deng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Hongda Deng <Hongda.Deng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/vgic-v3: fix virq offset in the rank
Date: Fri, 15 Jul 2022 18:46:20 +0800
Message-ID: <20220715104620.3929121-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4c028a7e-0f56-476f-1174-08da664f5206
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB7682:EE_|VE1EUR03FT050:EE_|PA4PR08MB6157:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c2g8wCF+01WILBQI35qmUDrcRpymUfKbEZwL9Q8nqGX35+4jKgQ/4nTOr+dNvbn4vVx+iYfDikYk683uzn+plk9rZ+J8vzyKzcAtQ2YwNGeulQNbTjgi1ncqVQrHNN+STJxezjLKtgTZ3JzWLAgc9kLxGgSVw1AJN+V2g8M7OUblxdxsWdInPaI4O1+QNMmFqP2OphIY1JpURXzfz4VX8H6fZwXSwzKI8GrtpcGwo6tCBsklOyDXlQJK8Ov2IDdOjz+S1F2uEO5mSvE6Ol2S77QEfZ+deZynUh6Cu9MM0nIXGmZvfKxADgQU9dnEo9ZSX0AWwGSEvZvhF6mT7/XjaMBmkY8hjazPS5FlhTULTeItpo+2Ukt49RzUCqaGUIVo1LME6lgsnUhqDD0s1OIto5xZr68ubCTfEbLHHz4JZl9LdCnSgpXbW2arU4dTyEoJgFXDRkxjqYdXGcgK7hcUw1QqwXnBLFD+VgAGzwwIbRPdBFNJ3eHKARDIDhx2nj+F35PRuy6YI9eUI53KWC9uJ6b/GChzxdskI44KsDsWkYFGVcuuWrr5C5Gp1zVDjql5AH61FRzlpWp6MxsTf8+bl3WFfiguIxMd6IVxORgL+V6zSOdSPBTt6rpj7txAnei3kGkm94c0jJki7Td8+jy3ozq/Sm8lZjfIv9McMrIYz6IVYvzsWcuDY6ixCtwIe7BeUUZCvyjXFrkYCXd/e79VVj3T3DEkHFG06WamWt56ZJeTBDM32bF0wWpHvn8xNKDIgAHRTDLuMbwsiNhtjX6Br5c0p5p8aw1rqUKfDpqAj3TXXiQwTbipHj3QNv9jTL/5ut7s2hCmzeduB2kFdw6WITudWdXKIXr+wUaCkDEzRiM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(26005)(41300700001)(82310400005)(8676002)(356005)(2616005)(478600001)(5660300002)(7696005)(6666004)(8936002)(2906002)(40460700003)(36860700001)(426003)(1076003)(47076005)(86362001)(81166007)(36756003)(186003)(82740400003)(83380400001)(70206006)(4326008)(70586007)(336012)(54906003)(316002)(6916009)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7682
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b496153-4e76-4fb1-7581-08da664f4c30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikAiAC+8b4IOyTwDxBt+R25ehjsNTK6VGBc9uBQpu99YUUi+oe0xI8HRq2O7olobc52VdAoKHqQHINaqfEInw4y037IdZhAjKCbRIsPlAtxAILz+cmrFeHJjHKRPqE84wwRwkCmiyhXgjGad5b7WF+mq0EBSuhSBa7e5I/SkfO7Tr/jCiKcPZAikAZtcT5URkR/H1vzRJXz50NFCs/4ut94Qk8oK7vhfX4o9CLGlUL8HUMcbUpRw/+Y5qjcGk9u8NjURBENqOcwZDzDDTLqvSJLMSKQNVxMY5OxDUpzqCZKZOJjMPxT2xp0SP/WQB+qxL4dtbWYJUKAUKoTSpQTCZvYwJIXUT1AsDeEf5Wlg8hD9p3EW35nB+zSKuvDLjkthrN9ex+UgjY89MpCpWDPNqffwDpKtSe783LPIZuFi1VuE7Gw395D3n1Ms25rpuhRObuna7AbWPcV2SeEBDT9DhyJGuMY1yAr2VIBFTBps5q/YquiPr2kCD59f9okw8R3T2Re54qLVUL/3XCmRoJ8ga2drkTcoGct8MbeEBNBXzjNaav7wLlQQ0+PWKTpbqm0dCdvqOwEde4X8OuPn8met61kki/dpotO3Ur80iUfQtcGnb3RGduDOEQ0jv78lWKKWnmr+h5zjZc+eV8ZNfA3Pj0SQJDObLYEWd0JzKANjkvnDBxbSK3vL/ldtMR6N1RzKVvX5Aalz+HF08Z0MmwEz04x9vw6J4awUMecbwe21TDh/+Fe6XStaGkbybXvvV/1SyOQbgl5tTFwbvG/j8ONePydnM9+m7d7YX3WiQaPgX764vvC4tLQhdoqe6zYRLa3d
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(40470700004)(4326008)(86362001)(82740400003)(36860700001)(70586007)(40460700003)(81166007)(83380400001)(8676002)(70206006)(82310400005)(2906002)(5660300002)(336012)(40480700001)(107886003)(7696005)(2616005)(8936002)(47076005)(186003)(316002)(426003)(54906003)(36756003)(478600001)(41300700001)(1076003)(26005)(6666004)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 10:46:48.9860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c028a7e-0f56-476f-1174-08da664f5206
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6157

When vgic performs irouter registers emulation, to get the target vCPU
via virq conveniently, Xen doesn't store the irouter value directly,
instead it will use the value (affinities) in irouter to calculate the
target vCPU, and then save the target vCPU in irq rank->vCPU[offset].
But there seems to be a bug in the way the offset is calculated when
vgic tries to store irouter.

When vgic tries to get the target vcpu, it first calculates the target
vcpu index via
  int target = read_atomic(&rank->vcpu[virq & INTERRUPT_RANK_MASK]);
and then get the target vcpu via
  v->domain->vcpu[target];

When vgic tries to store irouter for one virq, the target vcpu index
in the rank is got via
  offset &= virq & INTERRUPT_RANK_MASK;
finally it gets the target vcpu via
  d->vcpu[read_atomic(&rank->vcpu[offset])];

There is a difference between them when gets the target vcpu index in
the rank.

Here (virq & INTERRUPT_RANK_MASK) would already get the  target vcpu
index in the rank, so we don't need the '&' before '=' when calculate
the offset.

For example, the target vcpu index in the rank should be 6 for virq 38,
but vgic will get offset=0 when vgic stores the irouter for this virq,
and finally vgic will access wrong target vcpu index in the rank when
it updates the irouter.

Fixes: 5d495f4349b5 ("xen/arm: vgic: Optimize the way to store the target vCPU in the rank")
Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index e4ba9a6476..7fb99a9ff2 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -135,7 +135,7 @@ static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
     ASSERT(virq >= 32);
 
     /* Get the index in the rank */
-    offset &= virq & INTERRUPT_RANK_MASK;
+    offset = virq & INTERRUPT_RANK_MASK;
 
     new_vcpu = vgic_v3_irouter_to_vcpu(d, irouter);
     old_vcpu = d->vcpu[read_atomic(&rank->vcpu[offset])];
-- 
2.25.1


