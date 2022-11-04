Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AC619431
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437423.691822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtco-0002me-1L; Fri, 04 Nov 2022 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437423.691822; Fri, 04 Nov 2022 10:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcn-0002kD-TC; Fri, 04 Nov 2022 10:08:33 +0000
Received: by outflank-mailman (input) for mailman id 437423;
 Fri, 04 Nov 2022 10:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcm-0002Y7-7S
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2492e6b-5c28-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 11:08:31 +0100 (CET)
Received: from DB6PR0501CA0013.eurprd05.prod.outlook.com (2603:10a6:4:8f::23)
 by AS2PR08MB9716.eurprd08.prod.outlook.com (2603:10a6:20b:604::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Fri, 4 Nov
 2022 10:08:29 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::57) by DB6PR0501CA0013.outlook.office365.com
 (2603:10a6:4:8f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:28 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 04 Nov 2022 10:08:28 +0000
Received: from b7207d4c6724.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A5F94E7-4458-4B9A-B377-937F2256D352.1; 
 Fri, 04 Nov 2022 10:08:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7207d4c6724.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:21 +0000
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by AS8PR08MB6437.eurprd08.prod.outlook.com
 (2603:10a6:20b:33b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:19 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::ab) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:19 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:16 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:14 +0000
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
X-Inumbo-ID: a2492e6b-5c28-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DcuOjZu+sXs8x3P8xHmd8WpIkprp03QJhbKSWHXEPR0aob9Z0fQSQ0Ok32jHQFnrJ1/f5vduviQceNoxk0H6IvSvg44LMSA03S7oZsOeYv7XTnDde/PSQPOpsDdKVN5gVvfWiwyOCz4YQZjp7ZC1KPjkuccJIfBQJC83eGSdemKWPBMRIxPGr0A3Gsks2VTtpwYoCKi36sRVg1qyC3yGkp9QimICWGtwEcs3cIcZdzrrUIDSRraSgJNLex/jHkEy2m/VVJz6gCjpEs949kxRrKKkRqhXDjCz5C/kVC6ZdGPIK+UKxFE/PriSuKWRHK1vkx/U54CG7ouL9JAHIVY+jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpCwe/YQuh8dExFgUjQ64iwotcXpfBD1fxeA2Xv10i4=;
 b=bh4GlclJbGbqS2LcpTMIx6kPQLdJzWvfdM8zme5aX+wQFi3iLgUS4/I5YrxxYqqnOwRGXoin/dpmpKxndpNWcFEqtmNFNWNBEXtV/Sf84rkRMHosd83xExRL7WAVvxnTfIMbcvTEyTjf6+aAzDSjdUkXFYzaqN7lM9Ze/eLfPV8K7t2E6FB98e0bDeR+nFAZ6pYbDGBy/9jPP7hcph42xbNFZtMloYn+tfrXrU/2QCHY/a3sM9Ocg8IFRZX1el4M5NV0e5kgno47PwefmNQgZG7prx2VKAOE9JLbaAt2sepDeSHr4sjcovV+zIgy2/kAALw4UuX1Erjc12Jc4hLs/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpCwe/YQuh8dExFgUjQ64iwotcXpfBD1fxeA2Xv10i4=;
 b=wpca2GX0/iw/Yy6Eg6//mcsB5ChVSPFBawhOfDf24XieeZHIFax6plSAPhEBJQoJG8ITdFE/rfCW0kbEcqdPfoynedZ8/3BMsfpGQitZYW04qESrHRPPH5iOoclFwzjRsryJAPNeRuX/Gi/O2xvYYMRLx4IeZnQWmIjpgPyfSsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f25cda0ec7c1063
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1zenx/ZRrnl1J615gNg0oEqTCZeEd0rCB1BRGty+DFfOXgFBOQ7powMloU5hhpny4VfWJjJYmrrsAKGO3sCGqoqNfcKQBNfMUroXw4BO+wPpLQk0w4WkRBMB5MG8uTsjZOAsB/eLFeSUIxRO/emQgREoRlDz7GL1Vn0nTTWWVM/E/FzeCrGORbprin02t1LlWi0CXzUz/5x/gYib+Dp0IvPh6wBGV+3kXZneNPJ+YmYMeQviyO0AbA18rQLO/J22uIK4caCByTwnw1DzVESu1VO+3DPBgUEJXixFRvp/YJCFa2C08vdJ94USg585yJjYf934CiSmOYAnMgg0HKtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpCwe/YQuh8dExFgUjQ64iwotcXpfBD1fxeA2Xv10i4=;
 b=VmDVTf2vYWOsmjj+Z3ZOUSoBFOULj7f/SRL0Xq+2CFOQ0PKkMGqoQXyPEiTRKaFKeMht4SW9gwvMyvefwEEAFJWcst4OUiF/AD7NSlYsVeykcgccs9Jr0Zv2vY63rsp/5MiHAXsX7TCAmqOMYww8r8htzKSqZEMOiHHD4wKY3PbWxidxOE86Hzh4gVH4y18+dJfSXlmgQW71YgTug0mFoKcpMSZbsWQMorZ6oJkljx9VWcfWTtutQgjbTiVjpyHZI9/wYBOixuF/mQtx2anpN9UxkLR0av0+YtZhR5aPchgLXcii17fNpoL/oi9N4TPI9V+6ZV+vOf87bD9HRkKeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpCwe/YQuh8dExFgUjQ64iwotcXpfBD1fxeA2Xv10i4=;
 b=wpca2GX0/iw/Yy6Eg6//mcsB5ChVSPFBawhOfDf24XieeZHIFax6plSAPhEBJQoJG8ITdFE/rfCW0kbEcqdPfoynedZ8/3BMsfpGQitZYW04qESrHRPPH5iOoclFwzjRsryJAPNeRuX/Gi/O2xvYYMRLx4IeZnQWmIjpgPyfSsg=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 03/11] xen/arm: disable EFI boot services for MPU systems
Date: Fri, 4 Nov 2022 18:07:33 +0800
Message-ID: <20221104100741.2176307-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT061:EE_|AS8PR08MB6437:EE_|DBAEUR03FT032:EE_|AS2PR08MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 169d4642-7c36-446c-35ac-08dabe4c8551
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 34qvEV9wGeLGeLvvUPLKo1q+sKqe9UlPIeI1vG2DPmIMyXA4JJqS72wQfZjkFdBZsCinr39sze20ILUMfJAP9Rumec4bdiHGCAz4uMI0U9+uRPpX30HdPo0B+4R3UclS4O7/WnzNjxg3xaxJHGazKri6SRWGqaLJ9ko5SB9Y5o/71OAU1pvfRTiO0iSVrcc6H0rT9ruwiKlqRzaT+OCLvcwOqDCrvXeH/6iE5A8zxyQMOZ+oVlviHj6xUuS++MbezRbhM3xkpnJ54f8bZpgT+xEBYvxwMUghZd5aEPt64+hW+yFcj1rVToQrPtsQtPBiojORHAsBZRjDidSgqdefHQaGzs4SYukBI6K5cpdRQFeKGF13TwmLKmC/KYOH7Zt3V2/S8lvCeaIfaZUl3OPI4I/gWIi2+7UgCNlkE3orohuls7b8k1kr3vqPUS4llpD0XSHVKHbKW3ByfgiP9vlg2O5Kq0N+RF1Pg6Fwg3SuF9p1Heqx6IhbgngYZzagSRPcW1kYn0/1OmkmxkCtD6nKhFzg5CdFLgNCk2pwwpo7xf7KMWj/JBWClrFHP9OlvkpvkDVpG/V/mDU/5geYbb/IAy5CEKfV4NJEGGXNzzb4UCehxSNUEGeqAHkAwHnpU30dbNR6mi6uZqH0+8x13XngEmZOC1ppvc7Zc6tTJ59bGLbNCWhyXuHPPIX29rk4ZKra3WuGBBxxY91Lj2eJmz9esbGoS0SrcRn2RxPGTZvEhXWY/KlPEuo9iM3Ag+fbhDWy/kMb4nv294WkHCr7CuHM15hSS9gnIy86FItCAUO+/1pkgfWXAjasWaE2Z9Dt6Obp
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(356005)(40480700001)(81166007)(36756003)(40460700003)(8676002)(86362001)(82310400005)(41300700001)(26005)(70206006)(4326008)(70586007)(2616005)(186003)(8936002)(5660300002)(44832011)(336012)(478600001)(1076003)(7696005)(54906003)(6666004)(6916009)(36860700001)(316002)(82740400003)(2906002)(426003)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6437
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d072631-f53e-4853-8683-08dabe4c7fa2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k20gR+J7k7Y17cHvbRcEt+sWUyet6eaCcgeg2Uf4mJx6CGO4jailjE3E4Ejsz57AFJ0OJq8Iu5Es6s0jTsABVeju8fpqYLUwaWcCTMklYJ+0OV9uhW3IkM+ehjOi2RJCkSOzViECysAn0gmnI64dq1Su4Z15uMIA/x2/GttGZCLyleKgTqCSC4ebbGgfRqchX+zU25EXOxF4uneej+4tEeEbfm/eUBGUpXxFRR6X00LATvvYLCNUNV1E+jBANxgWpFjqAJvn5LObbdO5p0bVQsCWlr5KClUYhfvmDyq3EdWoq4hiIOBM/cfHFM7JRV89Q2KXigc5pJACSpitqGmBBZ/xop4t0LbB4MV6PG3GqWVnKvJh6UNOf9mUzgUXEWfHi156SKHvxi6i4Lu7bXU85pkV4ssp1czU06TP5GtvPwD94vGKGppL29db3/RHjwfEuh8zkSHoM0ro/szgxlL7d8PgEuPt5hbjsFSMqZauqjUj5f92eTq1ctZ6aMo77bUoFFO7dQylb0XKuBu1o7zdAEUHnHZIPqaOfDo7J+k1pgAV5syHwrForsy+49kDDDA0WwEZH5YPePOA0Bvno7OC8KiorsLIhZCPjZzikqnMmZng9rHbedhLepA79tfRYxmErwgwrqMMAwDgnWexk1bj9+WWGDLQF5ZV4fZ9szerifP6NCI+HRaOHfQiItbAH/4mjl+G1G5SursabX0Pmsr8A+Cj87rrYQKr2Ay0xqyVJwz1EuTE91J6D8trw85h+X6sMOBBcvftBu8x79NPSAG+Sg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(54906003)(8676002)(70586007)(4326008)(70206006)(8936002)(6916009)(316002)(81166007)(41300700001)(40480700001)(47076005)(44832011)(26005)(107886003)(2616005)(6666004)(40460700003)(7696005)(5660300002)(82310400005)(478600001)(82740400003)(83380400001)(36756003)(426003)(1076003)(186003)(86362001)(2906002)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:28.9674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169d4642-7c36-446c-35ac-08dabe4c8551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9716

Current EFI boot services support of Arm64 could not
work well for Armv8-R64 system that only has MPU in
EL2. That is because EFI boot services may need some
relocation support or partial PIE/PIC support. But
these will not be supported in the initial stage of
porting Xen to MPU systems. So in this patch, we
disable EFI boot services support for Arm MPU systems.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig      | 2 +-
 xen/arch/arm/arm64/head.S | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..ad592367bd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,7 +7,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
-	select ARM_EFI
+	select ARM_EFI if !HAS_MPU
 	select HAS_FAST_MULTIPLY
 
 config ARM
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index ad014716db..ccedf20dc7 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -172,8 +172,10 @@ efi_head:
         .byte   0x52
         .byte   0x4d
         .byte   0x64
-        .long   pe_header - efi_head        /* Offset to the PE header. */
-
+#ifndef CONFIG_ARM_EFI
+        .long   0                    /* 0 means no PE header. */
+#else
+        .long   pe_header - efi_head /* Offset to the PE header. */
         /*
          * Add the PE/COFF header to the file.  The address of this header
          * is at offset 0x3c in the file, and is part of Linux "Image"
@@ -279,6 +281,8 @@ section_table:
         .short  0                /* NumberOfLineNumbers  (0 for executables) */
         .long   0xe0500020       /* Characteristics (section flags) */
         .align  5
+#endif /* CONFIG_ARM_EFI */
+
 real_start:
         /* BSS should be zeroed when booting without EFI */
         mov   x26, #0                /* x26 := skip_zero_bss */
-- 
2.25.1


