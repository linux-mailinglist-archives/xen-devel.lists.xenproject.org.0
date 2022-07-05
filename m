Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A900A566214
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 05:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360569.589995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Zet-0006nh-Ro; Tue, 05 Jul 2022 03:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360569.589995; Tue, 05 Jul 2022 03:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Zet-0006kX-O6; Tue, 05 Jul 2022 03:55:31 +0000
Received: by outflank-mailman (input) for mailman id 360569;
 Tue, 05 Jul 2022 03:55:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KYDQ=XK=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o8Zer-0006kR-V8
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 03:55:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dcd3c70-fc16-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 05:55:27 +0200 (CEST)
Received: from FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::7) by
 AM9PR08MB5908.eurprd08.prod.outlook.com (2603:10a6:20b:283::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 03:55:15 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::91) by FR0P281CA0059.outlook.office365.com
 (2603:10a6:d10:49::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.14 via Frontend
 Transport; Tue, 5 Jul 2022 03:55:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 03:55:14 +0000
Received: ("Tessian outbound 9336577968ca:v121");
 Tue, 05 Jul 2022 03:55:14 +0000
Received: from fadf4f114b18.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09C9B92A-8659-4A7D-9506-86A1EB6A933D.1; 
 Tue, 05 Jul 2022 03:55:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fadf4f114b18.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 03:55:07 +0000
Received: from AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15)
 by GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 03:55:05 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::89) by AS8PR04CA0100.outlook.office365.com
 (2603:10a6:20b:31e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 03:55:05 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 03:55:04 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 03:55:02 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Tue, 5 Jul
 2022 03:55:01 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 5 Jul 2022 03:54:59 +0000
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
X-Inumbo-ID: 4dcd3c70-fc16-11ec-a8e4-439420d8e422
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UsWcEnwZP5ccP64KsoSl3RX6y93hYFoXNprOLo2B0VNyAoKiql6acXB4aMOBSBUQa15ptGdnjw7v/nF0UoQu3ZntvT8BBxBPRVWe26g74fLbrQ7iqv6gBvcxCs5chdLcqvLfsDh1luXe9hrPvF9Af0sKfvY+xOBSSoIjAPXgqQmrBt0yv6ReDJQQ2a2kHFs6WCOXwWX5IyPD1F96Vm9pAkFSshEJ5NKQYRRJlcP0Ov6cv+bgZR8ddE6ymGhMPJMXz1hGlbug6AWLO6zvvkAHYC/XagdagQf3HebZytyjx/8hVahas/SaAekoASRSWpKdmnkXI0aB1ZzyyYH7Yjjzsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCNgL82vvpvMhUKH+UpBlIWZvx2UQsTDzMawIRgWGXE=;
 b=ZiDxvrrz5aUCUAhNiCiATlaHeRNiH9virJ/FDF3e2hu43IbvAf5YSBl2A2Mf05RMJSSJTCbLsD6noskGfuThY7yu2BIw0nsHq+dHjKvSE7BDRLFjGo3NJ9SNKx7vBSNTHZjgCOzbKA5dhuqpcwPaeeAexqk2AQwoC7LI6oWHxpymCP9UWIn+SWfCww2U0MkCSy1SZk17Uf1sEwm26s+x5ozP+5UP/1Ffs302qgY4ZGg6QLZVxMiZ6kPLQ/rBLLuiiGwRy8QXUADFwioERfdGrCVX8sw9Dkj2PPeSO2yoNv1hxjev4m6hVhpR8fGCamP/OTeLjwRBt30pytfFQ2Zb+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCNgL82vvpvMhUKH+UpBlIWZvx2UQsTDzMawIRgWGXE=;
 b=tEs+b6m1coqJ3ci3XnmwrizFUcLkAP2GS820mzjXexGukS/ww6wBiypouXXV/3Wbz/nZUj6Bm/NtLwL9k4e/5XS2Eh+swgT4g1IpxbKcOMRGHIL7Wj8ZhzYgYWXybqpHpmi0h7BHPf4Cu//rHgA/DQ2MJWXj9qNCNaR+iK2q7/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1199e168e6bcea46
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcmSBiTvoWAIVFcP03wJBY2Gkpf3TpOgsDcwzSQuXK9kA/4KBX5w5TJcgqv0bNpcPbk9qnwaw9EuDAshG3CBIiU3T5kdjUNpcJpDBHldqEzyNAr77teGnM3rq/cjMoEDWzYU0XIEJ/PPSr6GixDXoikYJpQbkYSnNfwjJByoPn9UXfJntfOHJdAYlAksYE1ILKE7CV2XngisfuMQemBT3m1bNdKg+qZLWAm0+jyV/isCJu+OtPYE1vGcYsov55eSHpTAGy1zPgwHstCqdBBtYstt1mIlfUodXWUKVsPpu7qGVepe6U4OrBV3FqMcP6T3JOqrJwmYQyfMdX79R3/ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCNgL82vvpvMhUKH+UpBlIWZvx2UQsTDzMawIRgWGXE=;
 b=TpsMadVopi1qyMIraZ1S1U+6gJh3ru1ezeB+XpKkEIvUIgdHWrkBvd4apiRig6NjiECkU3ME6iuyM7Rfuh6VVh541uMYooMrpGDRGOL+Z9/Dtb87BeFr+254oDO0H+qZMXRGTWnHT8aV1J0/L/JG8e7rnJhs/4l/ZX8XCw6OTOyNzIpbyxFMTpIRQhcJyo97mzgqJ5w1huDhVemHqi9DtcPptjS/6Q2mY76eFRQyMTyZogfc28fYdpH641hNtWuk9gc+96yq5f9WAdNzt/8tFry/jtJxP7IYkKIWA+DUjuSNkgxK5h8BzWsZcqC0QH4pLF5DgMOOShGBKhz5nwR8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCNgL82vvpvMhUKH+UpBlIWZvx2UQsTDzMawIRgWGXE=;
 b=tEs+b6m1coqJ3ci3XnmwrizFUcLkAP2GS820mzjXexGukS/ww6wBiypouXXV/3Wbz/nZUj6Bm/NtLwL9k4e/5XS2Eh+swgT4g1IpxbKcOMRGHIL7Wj8ZhzYgYWXybqpHpmi0h7BHPf4Cu//rHgA/DQ2MJWXj9qNCNaR+iK2q7/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] Xen: fix EFI stub wchar_t size warning of arm32 building
Date: Tue, 5 Jul 2022 11:54:05 +0800
Message-ID: <20220705035405.1283032-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 94c7a73e-c2aa-45c9-e28b-08da5e3a2b06
X-MS-TrafficTypeDiagnostic:
	GV2PR08MB7955:EE_|VE1EUR03FT004:EE_|AM9PR08MB5908:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CImdu/B4mcBL74VnspvYbFLXIZ36gA+286T2+Nfz/YkL1Ys5ax2z8sJPyNPz5yp0QAHOX/1pjjIjqp5umhFXpnfIzGGUtkcJuazurosnpvoRFc/0zGWWsGyaoBt+cgZdSd/1VXs2fiIOYKHVi+eRVGesPDU1SK3eaHzigBbjFAmnQVQKGL9AiRg3E4R5II7wYj5w5Pl3LJdm9f+Yl3I1gpuSBFqiJ+9q5kJvu2SywO87HVRd6g8pS4dUJfQQiW/CQPHpe1EkMU5lun1T72s8huyM8nlW4yO+1ZqjQXrPPZXzv0w9794KX0KR407cQOO+YffaHKv8MLT3HYCTbGBgSqcEBly6cTzFqJD0IeysHC2sxNHVd8ed35G521gsUKvkk2vinS2Gw3/fWiWMbtBPv1JZBShJ1xj/HxyWj3alZT09tqLLwLQVanc3EtEQqW6k7SVM+3ENRihhVVlXa4oo1nbBkr71YkMi/STQlKFg2u+2GJPzXZEQSG8/ReQXxZACVvptjAxEvu8vt618Pwf5JL6UEEZkYyk+VBOdJJ38tQiTYraXMgh3QCFgFBBoZ0YnFtbQC/5y3Rwe3Ll4cW7uj+M3LWf69QPbfZUDMhlg1nWqioIoaL1eJsD+Ron/iONYfT3S5WvENpGoHasC/7DKgVAoPhdX8XUxHhyB64BoVZ7nrCo7U+a8AVTN6WefZr2Uujz627ZXD7/uaPSOgtJdfLsFvy3BYfzZYvuL1cNk/8JHNC8g7ei1fWqccct+DYTlg2v1PaHkakrVef8njdkARXWK0MBXDl/R9tN+Iyf2UEHm6IUXnY+IFYwaDJxf3iGVBmDXvMKmXr2XumJ6adJJmvzFFKaesPgxTdUFD3VdoPI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(40470700004)(36840700001)(46966006)(36860700001)(5660300002)(70206006)(4326008)(8676002)(54906003)(40460700003)(70586007)(82310400005)(316002)(86362001)(6916009)(82740400003)(81166007)(26005)(1076003)(2906002)(2616005)(36756003)(41300700001)(6666004)(356005)(478600001)(8936002)(186003)(44832011)(426003)(47076005)(83380400001)(336012)(40480700001)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7955
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	511b4197-87ae-44be-9deb-08da5e3a24f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oRgwbgkJVBNTjdkdZCncOX012e1ijWOlk47u9c9vdRqFg4wmAOzgqsFhB4aFGejMUkS5lpLwQkrR3kLM+gYDVvJLfNrA0QJhPq7UhORJJM2u1jl/bpBkl3kWOvPJNLFFjdHCOd7GOcrLHRt8MxtIQwfCOsJuAQ7FqnsinsYnkxm95vlFi2ivypCD4+WjfkbK4Xm+RWoJM4GSmffNQBbWVMXS5QfBpoZrd1mU+ic3vJqqq2DvVA3pXFFqzR45UXREcy8/QX15uSbdaFZ3pWDNZAMqoeHepPa7zwqDJA96/AuAoOu5prqEZ78r9PuwYPMXDu5yLEKg+elpC2NyFGpy73xQZo2Ttg95ufpRkqkHfH6hdQ7073VMgtcFcqwnQpqqb9dOhzAYmHeh0R616gDPTZ1skQmV5ftjZ51dW1qsCIa4hwGg35YBq47J/ODejYyuirDuQq+AFLqyF5Z7A83lB07hAiY8vrIEpgPVQVvJ6mmk7K+PaYcc0KmAc/KaRTN+mkfxxQ15ypq1EfJ+7jew4o8pEnyFXbfxM+oCHk75Y4MWPCtwHNNl2GoCumueDqmbuIFoeIjXUgUnYAfM6rRE7mK2QbsZGOcKO1D3UvHL01aeq9Af9i4hJjKeOyA8aWj6jqBKK86V7gM7nHzE29/6Vu+2aMj23IO1cPQJEMH9ylEo2oRZiCJFzhB9eJn0QOAgzuoQV2sdFFCcHvT8J4BbWg4upTAC6rrfcRwGIbtembkO94UNrR4/HxlUilR4Qvt5/3h+B8CLIx6eZiwf31m2upFagm4GxlxZ3KqJGya8Mb4r7lndsIyH11dnk++bc9l1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(70586007)(316002)(70206006)(54906003)(8676002)(4326008)(36860700001)(81166007)(82310400005)(83380400001)(40460700003)(6916009)(82740400003)(36756003)(426003)(5660300002)(47076005)(40480700001)(8936002)(478600001)(336012)(41300700001)(44832011)(7696005)(2906002)(86362001)(6666004)(1076003)(107886003)(186003)(26005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 03:55:14.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c7a73e-c2aa-45c9-e28b-08da5e3a2b06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5908

Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
is using stub.c of EFI common code for EFI stub functions. But
"-fshort-wchar" CFLAG will cause a warning when build stub.c
for Arm32:
"arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
wchar_t values across objects may fail"

This is because the "-fshort-wchar" flag causes GCC to generate
code that is not binary compatible with code generated without
that flag. Why this warning hasn't been triggered in Arm64 is
because Arm64 does not use wchar type directly in any code for
parameters, variables and return values. And in EFI code, wchar
has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
CHAR16 has been specified as unsigned short type in typedef, the
"-fshort-wchar" flag will not affect CHAR16. So Arm64 object
files are exactly the same with "-fshort-wchar" and without
"-fshort-wchar".

We are also not using wchar in Arm32 codes, but Arm32 will embed
ABI information in ".ARM.attributes" section. This section stores
some object file attributes, like ABI version, CPU arch and etc.
And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
but for object files without "-fshort-wchar" is 4. Arm32 GCC
ld will check this tag, and throw above warning when it finds
the object files have different Tag_ABI_PCS_wchar_t values.

As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
to use short integers (2 bytes) instead of integers (4 bytes).
So keep "-fshort-wchar" for Xen EFI code is reasonable. In this
patch, we add "-fno-short-wchar" to override "-fshort-wchar" for Arm
architecutres without EFI enabled to remove above warning.

Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use CONFIG_ARM_EFI to replace CONFIG_ARM_32 to gate
   "-fno-short-whar".
---
 xen/arch/arm/efi/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index dffe72e589..bd954a3b2d 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -9,4 +9,7 @@ else
 # will not be cleaned in "make clean".
 EFIOBJ-y += stub.o
 obj-y += stub.o
+
+$(obj)/stub.o: CFLAGS-y += -fno-short-wchar
+
 endif
-- 
2.25.1


