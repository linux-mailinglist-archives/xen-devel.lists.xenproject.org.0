Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C06566752
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 12:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360712.590156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8fPs-00037F-C2; Tue, 05 Jul 2022 10:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360712.590156; Tue, 05 Jul 2022 10:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8fPs-00033p-8Q; Tue, 05 Jul 2022 10:04:24 +0000
Received: by outflank-mailman (input) for mailman id 360712;
 Tue, 05 Jul 2022 10:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KYDQ=XK=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o8fPq-00033h-93
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 10:04:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65763c1-fc49-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 12:04:20 +0200 (CEST)
Received: from DBBPR09CA0006.eurprd09.prod.outlook.com (2603:10a6:10:c0::18)
 by PR2PR08MB4828.eurprd08.prod.outlook.com (2603:10a6:101:1d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 10:04:17 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::54) by DBBPR09CA0006.outlook.office365.com
 (2603:10a6:10:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Tue, 5 Jul 2022 10:04:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 10:04:16 +0000
Received: ("Tessian outbound 514db98d9a19:v121");
 Tue, 05 Jul 2022 10:04:16 +0000
Received: from 74025194f98e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6FC3227-28A7-49A0-A6CE-94EFA22EF21A.1; 
 Tue, 05 Jul 2022 10:04:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74025194f98e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 10:04:09 +0000
Received: from AM5PR0301CA0010.eurprd03.prod.outlook.com
 (2603:10a6:206:14::23) by AM6PR08MB3558.eurprd08.prod.outlook.com
 (2603:10a6:20b:4b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 10:04:00 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::bf) by AM5PR0301CA0010.outlook.office365.com
 (2603:10a6:206:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 10:04:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 10:03:59 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 10:03:43 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 5 Jul 2022 10:03:40 +0000
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
X-Inumbo-ID: d65763c1-fc49-11ec-a8e4-439420d8e422
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n9lcCIqjztMuK1iIqL/IvxZBIIa+UaxJXRkuZQ197aSaGNbk3ICRsvU0YuBjI7FTJCIQwWkQecxs5b76YpUP4kGXJMl3kwAiMXlztNQDvQKmVqPU9cGFnLcDL78snumwxH406ZzpKSOnaYznkLygWDMF5jIF2/FzH1dv++Hhq+RWS6w6uPGcSdPCwcIds5ihqt693am+5jxyhYR+GeR/Tol3buDcX8OSJo5nT0SLUxJi8c/++gJwxVaMfOzUQXg4cESP77oM0ZSGLcBu2dYDniz1+J+Oqja5AOcw+s07RzF/DICYK2wCzPWD/KnqSzrQCoSGwokbAC0RvAqA6mGPFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKPQDlzSmhq0Bdz4XcoxAsKDlVHZsxrn92qhJlKA72c=;
 b=ONz1+dPVXtVJ0rtZmxxpf+01lKvDzJsoIR/U9fB7M64c5+7rskXyy1hb7ZWrJevxqh6535h+WAHtMJGlp7tXedtb9hPLbLsTzIxxaIm1va6w9PpAOEF5OuoQwtBHZWz0YazbcI0Wc4BADiXbZ0TLL8tVxshomSznHIGxlwq2Y7N07f6Glduk7PaFIKHon9CjsvnEHwnxGoX3xCPVkYY2oJMeTIN7JxOunNVdsHU6EKOu8QTUf2QTy+Q3AMzh7uAOD+x7az8UleyuCixW49tonXUVlw0Oi8EsE/KaXlcmO1hbrWq0/GLDR8+KVpciLZrc7uyjw2V5X9N7KtTZnTjcRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKPQDlzSmhq0Bdz4XcoxAsKDlVHZsxrn92qhJlKA72c=;
 b=YRbSBeq2ILsZCkf7Anc3LNE/h5sjtlf6jB61TBHmWpS2d8uyYdXqRiSROsv5n0+Ns4PtydC2I9E0/+a3AU290nRK/6B2YvuJ4wJ5cl8BJ60ZibeNG4ngVOdns8qa/Kw1LIh3yl0gndwyUjn7npA9qwlrKk8rD0nK09F0tldBX1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcdaf3c7d758c7b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPesk1+1WfiYKYMcgLTA+PjNjj/HfeeF+CmPTxgq7uXjZaeA+8N/vFssjnzwn1IOTTlNZQYd68/y/XklnqiLLvrFajChtVQWOA/ig+nBHjMWWQdKaf23g2rUIOxQIBv+psnLy61rayQErDsUIvn4RsyQmo+I1FncvA6J36hv2Mg3SGYqMl1mZCb3SucLGh/xK2+slV7I3YR1IzWoWYck6MzbJE8j/GY9CNWUGl8Yw7N/79u+iB7GTh29XUwSgCtOmEHJKP5SVmhlsoqBUgtbSKlvAIX8sUWMe8aPiymZPCv1seNOEdKR2EXEcyPyQIaYeDE6R+XgskxoPbK/cUqBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKPQDlzSmhq0Bdz4XcoxAsKDlVHZsxrn92qhJlKA72c=;
 b=Ga9J379CChXBJYyqLJ2hy0KBAAQte1FDFBsPiH1391BCqlbn9cJTSFCBDUaMabbxkOsiimQB8SYZZcpdjZIllstbS9iPVAupMM1+z5+Mjr6EmbWPfudMd92iaHbt742D9uQXIS7TbKJbzZG9cVoiXQd4jha7XonX5njeIY4s5/DAhPsD82phHZzlIxbj8cN+4d0C/PvwKCUi2B5mESoHcTVgObS6gTF85L2LJYUrIAUOMzBNxtMV8/TDH/JY8FV5wVoZLde2IZvT9RiqmtVz2yJbayLh187l2ZTmnSOGhbz3GoxaWF75VY+WrEbQ0WYD8qP6fh/vA0Zv42JXRnMlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKPQDlzSmhq0Bdz4XcoxAsKDlVHZsxrn92qhJlKA72c=;
 b=YRbSBeq2ILsZCkf7Anc3LNE/h5sjtlf6jB61TBHmWpS2d8uyYdXqRiSROsv5n0+Ns4PtydC2I9E0/+a3AU290nRK/6B2YvuJ4wJ5cl8BJ60ZibeNG4ngVOdns8qa/Kw1LIh3yl0gndwyUjn7npA9qwlrKk8rD0nK09F0tldBX1g=
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
	Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3] xen/arm32: avoid EFI stub wchar_t size linker warning
Date: Tue, 5 Jul 2022 18:03:19 +0800
Message-ID: <20220705100319.1298197-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: ab4cdd91-317a-48b2-8a3f-08da5e6db899
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB3558:EE_|DBAEUR03FT021:EE_|PR2PR08MB4828:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C+zWwGp4K3bDyERm4jnjb3onsWIAKkolOgrat8Us2xsPOtab49SjMRCbW/K0ZMvXCuQm2F5Blw5bmZhXg2EYrjsJK/58S2CCII79SGartgAoz7F7RR3qf3GZk2iZ4GRd0nrK/8ZLMh6bVDKEFBDRoGv9vLuADRVmOMOojRC55eC+C5v8uEVIxMvdjxnvX6z2CSIAkcjRmMNAzpviQiDYStP7Sjkf8HxY6DIhkFFnvmdngcB0FCOpZ3qDs8lx0o2B0CV7Vj39OmawsuYFFsDwTL8gAsGg6gBD24GLgFNas6XSMStpoYdQSdQe5Hk44diqc+5LUQDFMda5m0mbIqJiddmndAoGmIjTQBBoGMekDbOG2m0T47bUJc6jysLxT2sTjwOQwmOtbAET8IERckD0Rv0BXa4qe6MFYA3a5IGrLXx+zP/1SOX7Z5RcHTsuPOaq+gciipnwbkV4TTWKGdrinUpUTg8gZ/mrGujd8QAWA67VssfhHhiIMEH94MFsUO5AG+ni9h8Uk5/uYAJ/3Huxqw0CFXKgZSUBRKAT6iXupf1+KKQiGEP0UbTVGHEg5aUne3yX4jEy7OvILcogMCFtOz0WAzFj/tZgzaLd6FYllQ3l3YmVtdu0tYBhO+O4GvMpi2A0P4JlO02ESmvbjDC7RHHnCjmEiWGTgRggcopdQv3R4NzcVpBmV687dMRlcck+pqrJv2HuSmmM/oJu1WVWG4+wuxZNG66lrPpd2ad++7MgjtTJWyrsHgDY5aJFGSy1J+YCG1OHSjPrl5qExY9diomLlR4n6s7DUg7r6AIzc39eWt6wQNNNOJvCGt7q+JblvNc8fRSOiYvoGy34EuOtAbvHU1MtDdMMA3e+t5whd60=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(478600001)(7696005)(356005)(40460700003)(70206006)(5660300002)(86362001)(44832011)(41300700001)(8936002)(2906002)(26005)(36860700001)(82740400003)(81166007)(6666004)(426003)(36756003)(336012)(47076005)(82310400005)(186003)(40480700001)(1076003)(2616005)(4326008)(70586007)(83380400001)(8676002)(316002)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3558
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae6aadc6-a369-4f3e-8b39-08da5e6dae49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOhFd3RYbJFr5xklPe49KoZ3n6T1Ddqa0R3ErwMKIoyAohr7bDNKqU78j0Qbn6c8LTC3ixr332MyNCqbuznbJVdxPpPujT1Q9MpD8qBOZdIZ1E2YMBXhZMfU0df6gT9khzCfo6MzQN1RndrmzZvox6Xw+/3h3G2MFGNAZhLCGffV33nX0CYETODXfqHrzEdE6L4/ZzOxvg3b4GblLRGFIf/rogNKT40t1laA99pi9UQcSk/RKJL0qpuoXCGJTq3jInufbKqyK2fByUDZPHOyBIe8fdbmpKLkeYWjfObZ46zXbR9mnPR0Kie8phhjRhzKTsPIF7JQ4+790Fu3GwrLBB/d6yamAE3yNmu4cek0ZevTsXcR+C5DyBhyz1GMph6atOfHpVnX2iNZY+85VNSqKrCPimMLzmvcIyKiydyognjM5I4RE3EiF2T8uPql9MSfeCoyaeyMFjOnU5lKemWRAWbNwNfxBBRe0nWSo79PsuiZXHG0lw4LS755ADOkcb5j14stGMHt3JcMmRdVBPjVAjfr+ZWCwRXs4E0QGZajpghVqozLeuEaUbB/x731sZwTR6as/W6kwxD9Xm5LbV/70a1dsmBlwm74oNIDkPPOyws2JaUWs4FKfu+Ds2CE+9W7hpDORwF7c0WsoUJtrYRxhSWE5xk7v3g7bVhPcK9Zt71g6veLqqMz30HGAou3eaFBIEej1eryiptvg1rQlker34v7fjsfOxH6qrSSs7vE+Duft0sIrr/0/nh8vYtpZXmk+Z2T1Hcm1J1c8vGHdlIjbjYEdk5YXZDIE4tZtgEUL+atYtQ7oxEByE91QG0e/PGg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(40470700004)(82310400005)(8676002)(4326008)(70586007)(70206006)(81166007)(1076003)(478600001)(186003)(6666004)(7696005)(41300700001)(2616005)(107886003)(54906003)(6916009)(82740400003)(83380400001)(316002)(26005)(47076005)(86362001)(426003)(336012)(2906002)(8936002)(36756003)(36860700001)(5660300002)(40480700001)(40460700003)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 10:04:16.7862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4cdd91-317a-48b2-8a3f-08da5e6db899
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4828

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

Xen need to keep "-fshort-wchar" in EFI code to force wchar to use
short integers (2 bytes) instead of integers (4 bytes), but this is
unnecessary for code out of EFI. So in this patch, we add
"-fno-short-wchar" to override "-fshort-wchar" for Arm architectures
without EFI enabled to remove above warning."

Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v2 -> v1:
1. Adjust title to add arm32 as prefix.
2. Update description to remove gnu-efi.
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


