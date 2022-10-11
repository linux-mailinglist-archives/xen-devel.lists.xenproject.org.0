Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548E5FB16A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419639.664461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDPv-0002Hi-US; Tue, 11 Oct 2022 11:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419639.664461; Tue, 11 Oct 2022 11:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDPv-0002FJ-Qn; Tue, 11 Oct 2022 11:27:23 +0000
Received: by outflank-mailman (input) for mailman id 419639;
 Tue, 11 Oct 2022 11:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDHb-0005JI-Dk
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:18:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c9da8f-4956-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 13:18:44 +0200 (CEST)
Received: from AS8PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:20b:312::12)
 by PAXPR08MB6431.eurprd08.prod.outlook.com (2603:10a6:102:157::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 11:18:42 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::85) by AS8PR04CA0037.outlook.office365.com
 (2603:10a6:20b:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 11:18:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:18:42 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Tue, 11 Oct 2022 11:18:42 +0000
Received: from 6c97752c028a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D66A348E-1FB8-413A-943A-806BE4E632C8.1; 
 Tue, 11 Oct 2022 11:17:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c97752c028a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:31 +0000
Received: from FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::19)
 by AM8PR08MB5617.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:30 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::35) by FR0P281CA0079.outlook.office365.com
 (2603:10a6:d10:1e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:29 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:28 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:26 +0000
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
X-Inumbo-ID: 77c9da8f-4956-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JPxNdC5RT7RQwy3YaHeh5xp1o5z7Qkbb+l5pj2a+Fk300Gs7h9aEgWZbUXG9t6bUsPZQ0LBl1vfY7uxTqP1IZMxP170YKTklMBlvTsLRqh2MRYHfoIlg3nnaBEqG1OrnoNNaqDZF29NgF/5HSKCFCIPBiKu9bJt3CpDwmFSNo1GgHIgbn5tC+ZSuLVUVuIo7hP5ErVMV1Ccxso4rqaY6/YVhs2suwqi8ne6be9U+sCCThsjv4FGS13DC8FFhUlVUNRE6YPy30lwnNkIyLhYHs4FP8hWYj+Wv2bTb3c0KiNweWX0NxBBB3UMulMDhdUXfW3OQBnxr86Mdl3U50AWJTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap0di6Khvem8tyXcEgez0sUBnboUdmih2D7MHTKX98U=;
 b=HnKafNJ/8Q99uwCPL+vU3Mp3ejLjaRTK1BCXwqFptI05UQZ0oOrwQ0xWVoW9+i3sEM7IdOoXPu7pplTZU7qdEyK+5/Mj0w0QzRGaFFHw1Xabhtal63ZX1uM1D5lTmIjWeje/Nl1HWxdS3sQKFqmWZVDnwVJR/C+0t8MyHmmgmaqmGqfabmGOXS8SB0rYc+CAhCmJzRyjx0s6EAuLSNaQGi7EPlIkmpf4lmp2wFalYM63xbALWDFPep/7IHIEKaR2un0r8VfEIk0nTbOrQjF3RZ4y2XTttc+QoB2UFLxkdjdQQB807EmXvGzpgrffk6poOVjxCjQxQVd1+tG1kXRPLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap0di6Khvem8tyXcEgez0sUBnboUdmih2D7MHTKX98U=;
 b=cUslA7IH2Ya8h2D8+lWnU2leL5n0Bd3OqrDl+oj63z/S0RUBzVTjtmdhTfVrly2PG3u+Rt1pj0sJceKqyO/X3Z047U7JOOZEvzvVBb3ttpTYm28lRqtvHJK2zddB17Jv7WYfQSM28jJV3IAVNDWR/LUrx5pQLxQ+xvHkea16vFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3e15ecbbd01f2b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1JqgZwjOGTIHmnd9VdUhTyGiFxvNOeENwMzPlLcFSRvH2eln6stqA0lvAB+ls44tcQvEY65DCvzzfPl2GOdKpN/QLwQqfFobpk+Ve2fRVH4JhIiD+eiSJh/KcUsC8u11W59vOu+Py/5KVCvoyA3zfot7ekoEpnshSkSI0PyPQKZ2KoWKkGYnk3Fn78cJQvnCQ9Aq/cHXYZ6v/kWFEFP0132i3f/QUdPgizyTlvt7myjbcRDp6bGCcFKA77Wc37DivIsP4zISB2KOEpyzkRjSBDOO7RsDVIWruMuSwZ3sYzZIJjXtIpYf8O6dtvzf2ZixMEjqTZTgx+4agXmd4IsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap0di6Khvem8tyXcEgez0sUBnboUdmih2D7MHTKX98U=;
 b=FY8ehMI2ElLo0B3C/szZ9hhbsqxOE6y2epKUdXVYLU7GVXuxXOmCKo5CeIGJXXuyU2O3hG8JuLmWpsbr8TntdbAghpZtyN9lATx7vKgpW8vtmzEJst5aiHBr6Tg+li7a0OzOwjf07qkGujJdn/nxSc2j+lxm+h78o5VLyIJEr5dkOE9GTY2NNky2yGXglyrsxqDmoOlfaaHINS/dGlmWfFH5vRFvFqHfiQyL7ABba7MP2FLQu5aqu+WxlNTEg+KAhVOO1469qNdxi0ZJytRBgkxWKmK4JlKQbGNtMHNIxCTnU3w7ZGAqrQ6kcxDVTkX271SMTN18Kol+WKObaALM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap0di6Khvem8tyXcEgez0sUBnboUdmih2D7MHTKX98U=;
 b=cUslA7IH2Ya8h2D8+lWnU2leL5n0Bd3OqrDl+oj63z/S0RUBzVTjtmdhTfVrly2PG3u+Rt1pj0sJceKqyO/X3Z047U7JOOZEvzvVBb3ttpTYm28lRqtvHJK2zddB17Jv7WYfQSM28jJV3IAVNDWR/LUrx5pQLxQ+xvHkea16vFk=
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
	<wl@xen.org>
Subject: [PATCH v6 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Tue, 11 Oct 2022 19:17:03 +0800
Message-ID: <20221011111708.1272985-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011111708.1272985-1-wei.chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT040:EE_|AM8PR08MB5617:EE_|AM7EUR03FT056:EE_|PAXPR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cffe94f-17ac-40a9-3d36-08daab7a5afe
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oSABmc7VCUyomQZl3ZnYTe/VPSe4Izlyf9kSE7yQvve75dejXyN46T2Arg4y8D1Ka/8ckjkGxriXpiZO9aspNBmsGoZkgFee4LqViBQlzFGRRyKBMlBYGKMKFM9H2xrw05B3Ddg/+vjapgqwEmEuLJszzYgcECb6kX66K2P720Vyldcaz2V1PGhuosgVRzqwRaD4oqJ/7dbZAUQf9ls9rnqHL9MoPSuq9+ptB9AlUB3dQwrYHL/+vYBFhIhI+d40W/7gJ0GMt3WYKK0ubb8T7Li+l7dgbsdWcvCg6L/k4csevri2/HMrKNLXX3dwOxSXSQ7D6Bco8KSUJvBxLHveFVBW1KPgQcpDimzEb6HwDFzyUUZQ1Rp1j4szv7IUJXONfaBguBh8Xb6N7gH5WMeeSal6kt+h61O0OjVqSP8Pak0AlaRYz2VPCI1GarsUotR5pYSwbeFFWMh/T32wkwM0GdQEElUUNpPKbWa4EcOMJ+xipkx0Y9DrwZQ+BlDjUV9fvSWcnJM6a7U9cw5edN08vDYQtwnDBrwT5M8atXrEcJqUrrzN8BBzVznJHlwX44FYVSn3+UIdRmOZbBWaCk5DXZN0y5qakKElqXPVoc+oqPbB+7fW/L1pQej/fZEQNFMhjSgQBt/x6PWkk0VE7lAblyqDOu0FJraVX65l7j3OJXNxPg1E12PVMsHsAZEfk5l9/UECM5dYaL/2GkiGTMtMCpBy8i8p0zvL2NZD8+8t2v1acYgINsvfadkHB6XmLeqPHTf982Rtn4EwPcwcCsOp3ioQ9VdTX83iFCVHKtANMzhRMOCxvpPljvht5Li6oOJh
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(86362001)(81166007)(356005)(36860700001)(82740400003)(36756003)(2616005)(336012)(426003)(83380400001)(40480700001)(44832011)(40460700003)(2906002)(478600001)(7696005)(26005)(6666004)(1076003)(186003)(8676002)(8936002)(70206006)(47076005)(82310400005)(70586007)(316002)(6916009)(54906003)(4326008)(41300700001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5617
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e694e78-ebd8-4466-708b-08daab7a2f92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Rtuta59U8Zr+DjFSbbI8O08TCLDx22qlagG96HoI+UVABXATTtmFgs0a4St30HguNCbrAWXeRcKoLQlEKANsxPhBgzvQhQXl7BXcHarQjS8xImH8na3BfHPwlnFPwu27UPuTspav6C1sjR66AUopQgwk1kWKiqPM2PmR2uF0G/TYp6gi8h6A1GwFcENudSSYOb08krOSynbO2Ncw8f+RBsleSfdiUkgW7cS5G2KtQSIZHLFPrg9ESrssLqjcrExTmEDTjCnMZI2NxiCVfkF6q4y5UJcJvVKA8Grl9RvI5WbczZloX2aXo0j/UoVGR9Sz0MZPVvpHtE9aD/HPv4OYjBmlxKTFjXzL/Ahn5NaU3ELCn9oo5buGS0QJYyiofIO2qtCBT2/w6E5yP5/DJ7+etQYhqeVYEL5pq7ckTgZ8ylOEHJMyOA/o+TCclTfUVV4ef0QBwDWAOugudPlgzty8VB6239w+u3bJSQTTijE50sjZeU2GaqG9YYE6egxtAzeVJcgyA8QZ/yMJTtYLJJoR//NVY0np6hnpAuetRsHjIQqtyAMeR/phkN760QG7u7vi+BFoED2A5BDn88b9vOXUhglcgsV2Mn9z+BsM8oaB76aqrNxj/KSAqzwJbAzr0iwnF/B5btPOyjxoFEwZDmJPFSUWWPMZNkKiIqNIkaaN1hwt8xc6rKJAcZMbJk2ZHV9JxVnVsM2HVZaau1NHtDknpHBe6zV0jM8j8LKIfNBAiSGo2v/cCH61JNR2pxzyts06JQIOuEktidLC4PhirEWIQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(26005)(7696005)(40460700003)(41300700001)(2616005)(8936002)(186003)(1076003)(6666004)(36756003)(426003)(82310400005)(8676002)(336012)(83380400001)(478600001)(316002)(54906003)(6916009)(81166007)(44832011)(5660300002)(47076005)(4326008)(70206006)(70586007)(86362001)(36860700001)(2906002)(40480700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:18:42.6692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cffe94f-17ac-40a9-3d36-08daab7a5afe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6431

acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
Other NUMA implementation may not need this switch. But this switch is
not only used by ACPI code, it is also used directly in some general
NUMA logic code. So far this hasn't caused any problem because Xen only
has x86 implementing ACPI NUMA, but now Arm is implementing device tree
based NUMA. Accesssing acpi_numa directly in some functions will be a
block of reusing NUMA common code. It is also difficult for us to replace
it with a new generic switch, because it is hard to prove that the new
switch states can guarantee the original code will work correctly.

So in this patch, we provide two helpers for common code to update and
get states of acpi_numa. And other new NUMA implementations just need
to provide the same helpers for common code. In this case, the generic
NUMA logic code can be reused by all NUMA implementations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v5 -> v6:
1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
   can be set to -1 by users. So acpi_numa < 0 does not mean
   a broken firmware.
v4 -> v5:
1. Use arch_numa_broken instead of arch_numa_disabled for
   acpi_numa < 0 check. Because arch_numa_disabled might
   include acpi_numa < 0 (init failed) and acpi_numa == 0
   (no data or data no init) cases.
v3 -> v4:
1. Drop parameter from arch_numa_disabled, the parameter will be
   introduced in later patch where use it.
2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
v2 -> v3:
1. Drop enumeration of numa status.
2. Use helpers to get/update acpi_numa.
3. Insert spaces among parameters of strncmp in numa_setup.
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/numa.h |  5 +++--
 xen/arch/x86/numa.c             | 38 ++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..237f2c6dbf 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
-
-extern int srat_disabled(void);
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 322157fab7..1c3198445d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 bool numa_off;
 s8 acpi_numa = 0;
 
-int srat_disabled(void)
+int __init arch_numa_setup(const char *opt)
 {
-    return numa_off || acpi_numa < 0;
+#ifdef CONFIG_ACPI_NUMA
+    if ( !strncmp(opt, "noacpi", 6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+        return 0;
+    }
+#endif
+
+    return -EINVAL;
+}
+
+bool arch_numa_disabled(void)
+{
+    return acpi_numa < 0;
+}
+
+bool srat_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
 }
 
 /*
@@ -294,28 +313,21 @@ void numa_set_node(int cpu, nodeid_t node)
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
-    if ( !strncmp(opt,"off",3) )
+    if ( !strncmp(opt, "off", 3) )
         numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
+    else if ( !strncmp(opt, "on", 2) )
         numa_off = false;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
         numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
     }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
 #endif
     else
-        return -EINVAL;
+        return arch_numa_setup(opt);
 
     return 0;
 } 
-- 
2.25.1


