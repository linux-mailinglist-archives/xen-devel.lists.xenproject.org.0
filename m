Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAB5AA66B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397243.637779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPf-0005cr-Ko; Fri, 02 Sep 2022 03:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397243.637779; Fri, 02 Sep 2022 03:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPf-0005Ye-Gc; Fri, 02 Sep 2022 03:32:11 +0000
Received: by outflank-mailman (input) for mailman id 397243;
 Fri, 02 Sep 2022 03:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxPd-0004Wz-C7
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:32:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d266de92-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:32:08 +0200 (CEST)
Received: from AM7PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:110::28)
 by GV2PR08MB8654.eurprd08.prod.outlook.com (2603:10a6:150:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:32:04 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::f2) by AM7PR04CA0018.outlook.office365.com
 (2603:10a6:20b:110::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 03:32:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:32:03 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 02 Sep 2022 03:32:03 +0000
Received: from 8e115e350a08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C8400A7-3BB1-4017-8661-2C108810F8C9.1; 
 Fri, 02 Sep 2022 03:31:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e115e350a08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:31:56 +0000
Received: from DB6PR0601CA0042.eurprd06.prod.outlook.com (2603:10a6:4:17::28)
 by AS8PR08MB6408.eurprd08.prod.outlook.com (2603:10a6:20b:33a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 03:31:55 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::77) by DB6PR0601CA0042.outlook.office365.com
 (2603:10a6:4:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:54 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:53 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:50 +0000
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
X-Inumbo-ID: d266de92-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CPEs1MKbh+DII0mmCVBppGkLwQBgm2/lNzzemOeMh9zte5bUZnBfAToU4pyVyHT5k8MoXFDwtpjTFCLElKx00Lqr3tmxvJxd7AlcrvTZMMKopc2yOutCbTe0L6QMgGoIUQtSeI/Fu0K8o4hqJNI7soBj+lU2Zd2SgHnMewbjsc++dfHwplTQHa1B3QblSkO/YC+f/rSKjVCXEtoWtjzY+ddJ8ZwCW5wQdGTfvF5SjTtQx20757MbjwIWbP4cHD+rmse+TAJrxLMSiCoNpRbv56Yp/Cuq1ywQ4Z0WazgbfnB6f1URkufo6gLzs7X8LelxCprtcMRRY9d/as2eIf3MRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rJl4bvG5P28lwjcobHRthLqJO4TGcF+IiJpvc5pSCc=;
 b=KjS+Y4JBXjVMR+zj4B8apvGn2LM9O0df2zZ24bubCg7+BRdtqNTlS+WfsWkIPfIAbTPpGdLjTqWxM0nClU7yMOT8/H7o5JWC0IUOYxLQvL917/uaLQetqxFTVZQq3FgR3Po7aXfykw+SlBkCnVHRjCzi9ZtH5fJSpU1JV2mhyHYuvug3cddCITuhIEDHFXcqeribfEneAz0Pu7D95wW8R2Sq+t9PFh/64owa82mWAJ/IRpno3vzWNXXvvVkS1LDzv6F4cMvqS2XfHAetQQ/niXVGGW5SXoDYA1hIadFhvxRGJERGqz2CDzMz+0cCoSDGPXIHhaVuTzDxLhF/ALZGog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rJl4bvG5P28lwjcobHRthLqJO4TGcF+IiJpvc5pSCc=;
 b=pFsHmGgXz70xM0s3NjthVPY4iEMALG6drVaeHkyBCJxRn6ULtHl7DgSIy2tNP7/5/Jb2eMSCxTfL7WnWH4r/WlFTacSiw7ebJn6RkmV9jFzYeiasBCnXQUmJFquG8Kdtkxbi+IArLB8AIaqApNE5G5OInI02sUjfrd1JBxm7C5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64f1dc2d78702d66
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSb16J0qk+WGanEemGGPWMJwfm7bqVKfU2TWwMSGwQGeBgJr5Q9rrAtDJ/nGiJIPtWRoiWTWUBG4htrMlU6LXnhrGuq5V4jq/9NjBsWQDLZlnykYTFDgbfiOCgz1Dg2l4nCY8rO/tGl7T+XhwhKb9z2K8UGL9VEs8tPyY8uVckd7WOwpTYleWXUs2vI1wBOJUWYOXDCeEoUfsO/glaN93cRcT9EanLzQXf2MSvEgsknzQmMMUKWCZa2ZvmHNJFarewCNIrYZEisGGk3tcpdStTmEC+PnkRd2KsLG00F23H5gJLvApUUH0ixE3/i0Cb7u5vdBxu0djf0nfNUk0gZ4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rJl4bvG5P28lwjcobHRthLqJO4TGcF+IiJpvc5pSCc=;
 b=BErJhvOWOIxxJqIugDufA+2j01Opx7TVqeMRS+xrwVykWgHWRWW1Ht1Hwp9vUN9y50y12M/W6Oe04ffj7aeBdDE3wRfC2/sZZSlqiRCu5lB6h5wZoKJLw1dK/X6TBGMxohcqksn+QuooLbGtYtN0VFUtct4nDP9wfHC6WW3ulcPD21l9iA/L5AHlGajK28iW1qlcs8GEuvIZnXwUKbryhLYqJa2Odi4T3r+xWf1LMWMcRsQRxwxqO3fydPPyO/RdUs5+Tv2jXMn8+hfQG6qqcZ1xJHbKOZ5zNZHb45oYVWJxbmBXmr4Dvm55xMw0XCDLtPUu7m7nMoCmwIWKUxORSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rJl4bvG5P28lwjcobHRthLqJO4TGcF+IiJpvc5pSCc=;
 b=pFsHmGgXz70xM0s3NjthVPY4iEMALG6drVaeHkyBCJxRn6ULtHl7DgSIy2tNP7/5/Jb2eMSCxTfL7WnWH4r/WlFTacSiw7ebJn6RkmV9jFzYeiasBCnXQUmJFquG8Kdtkxbi+IArLB8AIaqApNE5G5OInI02sUjfrd1JBxm7C5Y=
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
Subject: [PATCH v4 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Fri, 2 Sep 2022 11:31:19 +0800
Message-ID: <20220902033121.540328-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 134fc4bf-528a-49ae-cf80-08da8c93b430
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6408:EE_|AM7EUR03FT042:EE_|GV2PR08MB8654:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dc2gxTi0hNBktT0/Xs1KZ1DqFMpyt5bEu2ey2GWmgx2bUlD5TUw50p1U5dSWXXIaxZVZoQ9hN2kwtqGqDmAaIXtSLthm/uNJA3YAFWBi4vHbePv0rZPfh4HFOsnwbgV/2h0DVbsUi730KousR/rJln2rvWaqSozRkp5XGdsq60Kyb/HdmLeu4Fqx4lpzmpafiT4vF/HEoGTCgggAH6p4eZT3PS7sEhpzJ1v5qgp8TCNPD6RWU3HJrlm8ftLs/YL2gUfqOvQuGvXIDAVJYa/gdqstveJnTLPIT54/f3d/Na5ghfaBCilbY94v9xBCdqi3ELyQ5u6gW0uhq2o1zwo9I58cg3+iMWtQpCIB/TC8LEeC6TLKTdLUGcNQJPGs9Atrc1+aAIjbsKY0gFh7RrEK7DkhPuUT3gu7a8eeAN9O6HBPo7wTxchzX9peeURa/MoU38fO0I0ZOH/2VYClF8RHrQt+Oez2eUEO5p5X5/YEQwf2C9Sk+NIwwFSe+6Rpnp2OJ0CyvlVmhf3EnCEdqCYB8O8Hjq2PKVk15i18rfkrFB5AG1W3k9gkM2TWeFU8EGshZ1CoHYrPERC9zleG9C1FW1Tfjzsa/tlTdG37gIU5iO1jM5aGoGT3LjrzKI1IBIsBX7sDa4TE1Ncp3FiL59pt4+M75HuNQDCt+gChN6nA8/PJ9jqb64yvaGFkh9PUETQOmLbcWvNBfrTPUMQLWA+1Q926KXvMgq3y09E92sQ7zTAwNvyyuZoXqV6zh7r57U6JBowZHFNvGOy79vWxqdHYEkiAADAQ2KwtaqiiIuY9zPzsDFDN9bYcpY6429opIkxE
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(40470700004)(46966006)(36840700001)(8936002)(81166007)(83380400001)(5660300002)(54906003)(86362001)(6916009)(36756003)(2616005)(316002)(186003)(1076003)(336012)(82310400005)(82740400003)(47076005)(36860700001)(70586007)(478600001)(40460700003)(26005)(426003)(41300700001)(8676002)(70206006)(40480700001)(7696005)(2906002)(44832011)(4326008)(356005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6408
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98dfe6f1-1628-4130-e3b8-08da8c93aeee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1WxNT/DJCfJMK/orD/kszvu/Pkvd9JhI0xj0JLvHPW2Ahd52oRnSJNIANq+s0jeRYSTkYSPE/ackDbAn1PWzz3+3RJoRpbmHdzxZ81DVkWXAlWyn606q5smLc+Gw1cWvCUCK52eQ8ThXOf6AZTbw/8BjOiLZV4NxOFDuTcQKu5IO60YYYIevSD6PpegOwe0s0uJp2H2qqMVmFS6x/ermw4BRkI84McK7C9m65L74gnxljqrblyHvUAXZy0qYE0H/TdXkukOB8uFSdqOH9fdxtz5ZhNpF/NLLJEVx0X1zaOAadNydK9cv4WFM/GcTM4stRx39RT0ih1TepEj/uhGwIkPvAa1C+89xVTplXYDH0Lwmh5+kWz9iV19gDbpzUYEVvhH4rfzQ8tz89ZBgl1UNlyhM3dwuL1txcyVpimjiKGsXGInAhrCQYmnQ7cvRO/BMmwAhfiWzj93IXUa2yh6DSw1opeHK4gQgMQ+DP8VkpY/iHsrJiAaQ2DCmF+Z/BXvVAmEuspDm+/Eywz7w/jgkWPy01AF1R5x8dYnnRbPQggxDb9ua2oQ1ZQTcaWFDo4JkdXh4PTmgr00hmJqvHiNSo3xH9HNzzMFhG3rBe8WvcCRsOp2GQX4VIXl+7khQ4j60LxbdbLNK18z40kxUCIQfU3oxmKouP896xbQFPv8qb238PMe7v+GYRxXfGgeHOEjsbeSTq5ewE0IsGmzID5tvN8H/8+tAB30pDuJrnDe9cBKCvaJImLVDjOKJmT1dUdpoFdDxINCBINpjl/lTbu38Sg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(186003)(2906002)(2616005)(36756003)(44832011)(83380400001)(82740400003)(336012)(47076005)(82310400005)(1076003)(5660300002)(426003)(8936002)(316002)(36860700001)(70206006)(70586007)(4326008)(8676002)(107886003)(7696005)(6666004)(6916009)(81166007)(41300700001)(86362001)(54906003)(40480700001)(26005)(40460700003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:32:03.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 134fc4bf-528a-49ae-cf80-08da8c93b430
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8654

The sanity check of nodes_cover_memory is also a requirement of
other architectures that support NUMA. But now, the code of
nodes_cover_memory is tied to the x86 E820. In this case, we
introduce arch_get_ram_range to decouple architecture specific
memory map from this function. This means, other architectures
like Arm can also use it to check its node and memory coverage
from bootmem info.

Depends arch_get_ram_range, we make nodes_cover_memory become
architecture independent. We also use neutral words to replace
SRAT and E820 in the print message of this function. This will
to make the massage seems more common.

As arch_get_ram_range use unsigned int for index, we also adjust
the index in nodes_cover_memory from int to unsigned int.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3 -> v4:
1. Move function comment to header file.
2. Use bool for found, and add a new "err" for the return
   value of arch_get_ram_range.
3. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
v2 -> v3:
1. Rename arch_get_memory_map to arch_get_ram_range.
2. Use -ENOENT instead of -ENODEV to indicate end of memory map.
3. Add description to code comment that arch_get_ram_range returns
   RAM range in [start, end) format.
v1 -> v2:
1. Use arch_get_memory_map to replace arch_get_memory_bank_range
   and arch_get_memory_bank_number.
2. Remove the !start || !end check, because caller guarantee
   these two pointers will not be NULL.
---
 xen/arch/x86/numa.c    | 15 +++++++++++++++
 xen/arch/x86/srat.c    | 30 ++++++++++++++++++------------
 xen/include/xen/numa.h | 13 +++++++++++++
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 90b2a22591..fa8caaa084 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -9,6 +9,7 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <asm/acpi.h>
+#include <asm/e820.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -93,3 +94,17 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= e820.nr_map )
+        return -ENOENT;
+
+    if ( e820.map[idx].type != E820_RAM )
+        return -ENODATA;
+
+    *start = e820.map[idx].addr;
+    *end = *start + e820.map[idx].size;
+
+    return 0;
+}
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 4c7f0c547e..bd9694db24 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -428,37 +428,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
    Make sure the PXMs cover all memory. */
 static int __init nodes_cover_memory(void)
 {
-	int i;
+	unsigned int i;
 
-	for (i = 0; i < e820.nr_map; i++) {
-		int j, found;
+	for (i = 0; ; i++) {
+		int err;
+		unsigned int j;
+		bool found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
-			continue;
-		}
+		/* Try to loop memory map from index 0 to end to get RAM ranges. */
+		err = arch_get_ram_range(i, &start, &end);
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
+		/* Reach the end of arch's memory map */
+		if (err == -ENOENT)
+			break;
+
+		/* Index relate entry is not RAM, skip it. */
+		if (err)
+			continue;
 
 		do {
-			found = 0;
+			found = false;
 			for_each_node_mask(j, memory_nodes_parsed)
 				if (start < nodes[j].end
 				    && end > nodes[j].start) {
 					if (start >= nodes[j].start) {
 						start = nodes[j].end;
-						found = 1;
+						found = true;
 					}
 					if (end <= nodes[j].end) {
 						end = nodes[j].start;
-						found = 1;
+						found = true;
 					}
 				}
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "NUMA: No NODE for RAM range: "
 				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index af0abfc8cf..38be7db960 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -81,6 +81,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * otherwise it will return -ENOENT for out of scope index, or return
+ * -ENODATA for non-RAM type memory entry.
+ *
+ * Note: the range is exclusive at the end, e.g. [start, end).
+ */
+extern int arch_get_ram_range(unsigned int idx,
+                              paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


