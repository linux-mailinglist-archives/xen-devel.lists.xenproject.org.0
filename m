Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C60545BEE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345790.571456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaY-0006f2-0r; Fri, 10 Jun 2022 05:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345790.571456; Fri, 10 Jun 2022 05:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaX-0006bx-Th; Fri, 10 Jun 2022 05:53:41 +0000
Received: by outflank-mailman (input) for mailman id 345790;
 Fri, 10 Jun 2022 05:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXaW-0006br-D7
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe08::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac076644-e881-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 07:53:38 +0200 (CEST)
Received: from AS8PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:20b:451::27)
 by HE1PR0801MB1801.eurprd08.prod.outlook.com (2603:10a6:3:7f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:34 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::40) by AS8PR07CA0006.outlook.office365.com
 (2603:10a6:20b:451::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.6 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:33 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Fri, 10 Jun 2022 05:53:33 +0000
Received: from 4d8bd2406cca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E9EAD5D-B003-4483-B4F1-2C988237D92A.1; 
 Fri, 10 Jun 2022 05:53:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d8bd2406cca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:26 +0000
Received: from AS9PR06CA0541.eurprd06.prod.outlook.com (2603:10a6:20b:485::13)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 05:53:23 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::3f) by AS9PR06CA0541.outlook.office365.com
 (2603:10a6:20b:485::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:21 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:18 +0000
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
X-Inumbo-ID: ac076644-e881-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OEa/BZaXGbLaZNjmpjNHaAMZqrvVjyMfucfnqcJtrCOEoF0UdDEVvsCtmkYumvqaDHQo5NhTvLAv1M1Q0Em9kVyZrYL/DleVGGAOHk5/HYfYRXHRdWjHkLQ74E9hhG2S9elAoH0LjJ3YYdF+JmKIs309rXjokWwEPGJk1ZHZAmL4x0QcQmTQoiJtiilOR5wsywacTToXwrT9T1n5brPdIGGR3nZFLJ0FJmLLDsbetAfRbHwLyr8MBLVLLzgFnkMxS0+6E5f18BEMF0O4pR//J2nDTT2fkhKDLto1lSCw4U7/IWk+eLQOyVG/rDvGTzIDVX7FfMFkKut/PM0t6Gl8Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GqWYxjtFiGnz9l9IDUqaGsYEe/uijkzfmw4+eeG2J8=;
 b=NtL6gi7H35TCXgBCjsISFn7QCZXQ1kYI0XwErZFGbT8BKzq6o9iKl4yxivX1ZtrgekaJhXcHDg1wROyIcY1dMumSg0mnzX+/kT/oGHkxNvEkZBairHxCnzGJcudt+GWKzK99oOOF4exktVWcjZRF9EuhulFKW77AopxbP8QcBn6BH4NnsTLfc372PpOGfNRrxnmYNenne5osJ8Kf2Q5/+dRCRUd4egIqpwjF8rM+tMj92L2VR+T/Jb8RH/qFDNkgUZrAcZnO3RdOCZUWid6Vo0kpiHSd5uyQe8DfwQ/GRpXQdAEZk9F623eF/RH55dHGbr1W+1kwwGcvDdev73c0WQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GqWYxjtFiGnz9l9IDUqaGsYEe/uijkzfmw4+eeG2J8=;
 b=H7kDaQnHuelvkONYGWxw/xGuuOd66aMCchzS/JQEvCIzMGscefQB+jR+v1hg/6cqG0SMG3wlpLovXW3o9mbf0U76q13fyVrT1kqwuB3VGkEcE9dcZ+sFR2ZzKLN8znXl3ytszVwB6APxaQCivbfdVofHq36XHUk08FBceE4akPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: da7725255b4d626e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdynS8saXlbP1IlhBhosd01ghIVnt5ETRt1D11PDb/TmGq6ae+qT0QDug38l0mu9G4FGdiNIInMeGRQC/uRbuRjGZLWn6YbvfO+OsRBnbo/VA+IUdGHnhLHxqNr524jzsLKP/aSY/bWDsu//Dc1GssPceJS6shg/LwZ3sieGg8evXFrk5GHSthQHXfARKXScwyaXg0Musr0ptN0P2nDcyiAVjnP/07RzUJIlQO91AcN9CCvKawkeg5iAnV8/DqSH5thuxgRzeXa0d7x4aDaq2rM48eGarQ5QE4lwPPGoT8Fcu7yEBGnvLq8rJ4WM658u2YCRX3KXFJJqYq03vKYmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GqWYxjtFiGnz9l9IDUqaGsYEe/uijkzfmw4+eeG2J8=;
 b=lrdY3Scj63RpTgQTQnjcSrSbSFUHaMG7r8fMuftJuuvdu/m7dShtVCyEqQEY4uYHj82oo8dcC15ZQtm2Qo9sJ7pYMhSKevN1VsKLy5LoR4LYNUkWcbUIV9SLW7rbzUCM7O/4X/cgQbtyLDUcvEtDb7i5JYMx/XOKz15DTdD8QbHWW76ooK8ddOxfpIiwjKXJ0MSOI5Ygewj4nWETbbnE834DGfRHWz4NuBSs/RTGA8zcTca07CDmn5BTy+yTpgsy3mECU5Zw+dR40qOW59JD7PNJl9VoOGEN0/ykdtD99ZzGraMhUrIdtUA5jC0PMBDgDGwMbR5wnyHC6i3Np1cspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GqWYxjtFiGnz9l9IDUqaGsYEe/uijkzfmw4+eeG2J8=;
 b=H7kDaQnHuelvkONYGWxw/xGuuOd66aMCchzS/JQEvCIzMGscefQB+jR+v1hg/6cqG0SMG3wlpLovXW3o9mbf0U76q13fyVrT1kqwuB3VGkEcE9dcZ+sFR2ZzKLN8znXl3ytszVwB6APxaQCivbfdVofHq36XHUk08FBceE4akPk=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v6 0/8] Device tree based NUMA support for Arm - Part#1 
Date: Fri, 10 Jun 2022 13:53:08 +0800
Message-ID: <20220610055316.2197571-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 654e81c0-f079-4865-cf77-08da4aa58dc3
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5758:EE_|VE1EUR03FT038:EE_|HE1PR0801MB1801:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1801EEB56418BEB2C252A16F9EA69@HE1PR0801MB1801.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5uBIWaJohpCQqQ/wBpLiLxBfKVmL2N/SMPv9Z+Buy5VEy7zJTxRxlYZOYDh93Fbdi49HqtfWhge0JxCQzSsWKruNk53LNOCrkGbXA8c6YvnlElGIcxvSo/QLp5qvpunRmUDwfIoYIiBrcxyGTyuTedE4GhGziTCRbrytdA9aTnaiGY0jBO40kWOJMY4kqoAGWWBr8B1EJ+9KqFJ0B8ebozdgnZ2r2aPREKoyLYZQ9ATrfZBl7xjtMdOA/DOO0WDMKnVrtSgqHAG1F5VaUKIxaqRUrO14WkXJuCIJB0SSbuOZSt2i+R8I1MBusp1vc4fiGsFNKGMgdLEyvf/fVqhJ6RFfQAU+kXnU+v7KLOe/AhWgRImuGmpsgfV8C30oWQ+tz+qSKDCJHY+l8qO/dapqsujDQS3T25iyfAEy1+56OlTk/n3pfBp07qVE15rj5cUc91KGkeDTjCb78z+5EDsymRz8qU/NJCTnzBpN/MaHGulcnrFtvEH5MD+mwVg8u7FVXbbGCLjwDOSs/+kmXaXrIkL1s/SGeN0KIAEKuSCZTQa5piyIMcIxIz9s6Xxu4nb7tdeoA+IIggFJXTlaOXjf9dEhs1oDziol5Wo0mIV3fk3U/ov9Axd79dm/xN/z99sIQBrHL317Fc6GsfirMrZZbPFzj612h5u4heUrRp4xs7ArZ4Yj1O+WhgCutOlZBQmKsududutPFROcXwcRERUuJVC7Y6OZH+P2JYkWljLM3PRvUmyLWln7iyp2semNEt8ZWNULV5wrh7iM8HouRQsoMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(40460700003)(6666004)(6916009)(47076005)(4743002)(26005)(2616005)(7696005)(82310400005)(86362001)(1076003)(36756003)(316002)(54906003)(36860700001)(4326008)(70206006)(8676002)(2906002)(44832011)(70586007)(508600001)(426003)(186003)(336012)(83380400001)(81166007)(8936002)(356005)(5660300002)(17413003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46ff949d-8338-417e-ba4e-08da4aa58772
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jpg0ZRzCEZui8NKyIJdHsTQrLsVWANXgFSAmNyNAryAhJPIyCKzNiaky8TI1lBfPcHSJllXQPOap2+e3R0taBpNPpy5eMmV+ylyUNES20/Vyi7a2R19QDZ1sksWdxLYq68z+Qs152U1iwMUHR+rbJLcdf8IzKTqck9TtRd0sAnoZKt/crQcVPhn1O2eGSAfa9IdfXlufevMKEeQY5XuNrO8tHh5IELOW9F+7FEVbXf+k5RQ+pAP6XmVxc2niPOE0n0r09fIGaTI1RKWKLxv3o3hoN8+DAPs/NqiH0wYvGoMRO+A6cD6Zn98TTvhTPr95z21CUieytFiR1j3HeP6qrehs26aNe4n3Te5gmnULDML3mo/pXLVMQC0lXK+eJ/5UwGv5t0/4pF8SmtE+UECBTI6VpkU8Jvg88pDmWjt5Lj0HGSmyhnSY9f/vEMyH5kzgq8mn7yE2eGjm6Hrezw7P0v4zORvJGqpFiRe50f87QRXH3hP15bJJ0SaFWeVyB+mCCntvIEv1MYbkw7uQm4L15pNyIXcf4lmE1DiDy/1YdJM5LdZfYmnj3uSN1bbHZkAFIMhx/0XnpOHJ5OOs1O4wnjdGo064h8un/KdIAdkRNXF/oNZC8a724MeMqTRJGtDE0P68QI3psJ/sjQppWF2FcJAtHTVRywSsYoRDnXi/b+e9yxlEmswCfAzjiZ/aFi5YvpLCGT21XvjKIaSv5Xt5SBnYuzfRjUWiMqb9dB3TbU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(508600001)(316002)(54906003)(2906002)(70206006)(70586007)(40460700003)(6916009)(26005)(7696005)(86362001)(44832011)(5660300002)(6666004)(36756003)(107886003)(4743002)(82310400005)(47076005)(36860700001)(8936002)(81166007)(186003)(336012)(8676002)(426003)(4326008)(2616005)(1076003)(21314003)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:33.3732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 654e81c0-f079-4865-cf77-08da4aa58dc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1801

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series.
2. Move generically usable code from x86 to common.
3. Add new code to support Arm.

This series only contains the first part patches.)

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

---
Part1 v5->v6:
1. Use comma to replace dash for "[start, end]".
Part1 v4->v5:
1. Remove "nd->end == end && nd->start == start" from
   conflicting_memblks.
2. Use case NO_CONFLICT instead of "default".
3. Correct wrong "node" to "pxm" in print message.
4. Remove unnecesary "else" to remove the indent depth.
5. Convert all ranges to proper mathematical interval
   representation.
6. Fix code-style comments.
Part1 v3->v4:
1. Add indent to make ln and test to be aligned in EFI
   common makefile.
2. Drop "ERR" prefix for node conflict check enumeration,
   and remove init value.
3. Use "switch case" for enumeration, and add "default:"
4. Use "PXM" in log messages.
5. Use unsigned int for node memory block id.
6. Fix some code-style comments.
7. Use "nd->end" in node range expansion check.
Part1 v2->v3:
1. Rework EFI stub patch:
   1.1. Add existed file check, if exists a regular stub files,
        the common/stub files' links will be ignored.
   1.2. Keep stub.c in x86/efi to include common/efi/stub.c
   1.3. Restore efi_compat_xxx stub functions to x86/efi.c.
        Other architectures will not use efi_compat_xxx.
   1.4. Remove ARM_EFI dependency from ARM_64.
   1.5. Add comment for adding stub.o to EFIOBJ-y.
   1.6. Merge patch#2 and patch#3 to one patch.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone
3. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
4. Merge the interleaves checking code from a separate function
   to conflicting_memblks.
5. Use INFO level for node's without memory log message.
6. Move "xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
   phys_to_nid" to part#2.
Part1 v1->v2:
1. Move independent patches from later to early of this series.
2. Drop the copy of EFI stub.c from Arm. Share common codes of
   x86 EFI stub for Arm.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI and remove help text
   and make CONFIG_ARM_EFI invisible.
4. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time for
   arch_have_default_dmazone.
7. Update commit messages.

Wei Chen (8):
  xen: reuse x86 EFI stub functions for Arm
  xen/arm: Keep memory nodes in device tree when Xen boots from EFI
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of memory interleaves for different nodes
  xen/x86: use INFO level for node's without memory log message

 xen/arch/arm/Kconfig              |   4 +
 xen/arch/arm/Makefile             |   2 +-
 xen/arch/arm/bootfdt.c            |   8 +-
 xen/arch/arm/efi/Makefile         |   8 ++
 xen/arch/arm/efi/efi-boot.h       |  25 -----
 xen/arch/arm/include/asm/numa.h   |   6 ++
 xen/arch/x86/Kconfig              |   2 +-
 xen/arch/x86/efi/stub.c           |  32 +-----
 xen/arch/x86/include/asm/config.h |   1 -
 xen/arch/x86/include/asm/numa.h   |   9 +-
 xen/arch/x86/numa.c               |  32 +++---
 xen/arch/x86/srat.c               | 157 +++++++++++++++++++++---------
 xen/common/Kconfig                |   3 +
 xen/common/efi/efi-common.mk      |   3 +-
 xen/common/efi/stub.c             |  32 ++++++
 xen/common/page_alloc.c           |   2 +-
 xen/drivers/acpi/Kconfig          |   3 +-
 xen/drivers/acpi/Makefile         |   2 +-
 18 files changed, 199 insertions(+), 132 deletions(-)
 create mode 100644 xen/common/efi/stub.c

-- 
2.25.1


