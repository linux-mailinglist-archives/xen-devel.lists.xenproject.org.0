Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32F5BE189
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409251.652262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJS-0004vi-7j; Tue, 20 Sep 2022 09:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409251.652262; Tue, 20 Sep 2022 09:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJS-0004ua-2p; Tue, 20 Sep 2022 09:13:06 +0000
Received: by outflank-mailman (input) for mailman id 409251;
 Tue, 20 Sep 2022 09:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJQ-0003bZ-Nj
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:13:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dc82d88-38c4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:13:02 +0200 (CEST)
Received: from AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) by PA4PR08MB6080.eurprd08.prod.outlook.com
 (2603:10a6:102:ec::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:12:59 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::dd) by AM5PR0201CA0022.outlook.office365.com
 (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:59 +0000
Received: ("Tessian outbound e2c58cd9a6bb:v124");
 Tue, 20 Sep 2022 09:12:59 +0000
Received: from 86f48fc60ca1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98B58C8C-9476-46E4-A7F6-04BA9459D56F.1; 
 Tue, 20 Sep 2022 09:12:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86f48fc60ca1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:51 +0000
Received: from AS4PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::7)
 by AS1PR08MB7513.eurprd08.prod.outlook.com (2603:10a6:20b:480::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Tue, 20 Sep
 2022 09:12:49 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d4:cafe::c6) by AS4PR09CA0020.outlook.office365.com
 (2603:10a6:20b:5d4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:47 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:44 +0000
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
X-Inumbo-ID: 6dc82d88-38c4-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nq4YxcUPvqC9L9lbtC/sFjbC+8P/iYDAyDoq2vySjP19EL73YDQT0roWnMSPA8tMuup9lYNipAHx9Kik3OlIgXcnDWNDLBQtqjAxeWtNtcFklWZyJPBnTQ0Aq05Js+K+GDVBrBj8U0vZ6pwXuJzbrNCT9DPGXfYdrg3Mwhuke3DUYKioj0CO1t3VEdA4we8pX4POxlfEUi2OUavHh9LtntqIHYBVqh55xmm8xf4UD5KedU5kiecB1dbUCd76lpUkbnuLTPHwrVF+63setSRCSwZkEdfPPIa8jNqntFt2zn9+iJwJuX/9y7EbcrSEIoTIyv5Zy+iqDhBRJHaSIrPXrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ9ttdNAWIlD5SlMp8AY0fSp90/hwL0jgfa+S1mSp7c=;
 b=cZjwldeEkNIycaXgJ6qQu5gdOndwqHotPJqLBdr9X9ZmtsMOjuaWhC43Bh/DyqxKcvm0+K1cOFFCb+DOz0oVj/PReznpiYdtaRXdrLI3zZ3tkS+HXWGA1coeJ7BwfUbvajUK1SKI8vDyUGv9Oc1IPI1e2ri/QwsGSN+7q0BSRvTSZ/gAQIKP2dA96hOXwozeJB7+m/BfZrRYNoAtXA+M+24jmaQakI4W+9On8xNXJ66aulMw+PQv4L3iHG5qgNnyUoYh5GzMsh+Brxc3WrMKd1hruZmvPnTP6kYI0xY7vbZF01gdF1t6jSbSgRmQYn1j3hVD4TKyUbmnFiJTOqan1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ9ttdNAWIlD5SlMp8AY0fSp90/hwL0jgfa+S1mSp7c=;
 b=H/CPQ9jGZ2Rwg7FDJIHJWII6jJwIFCWx0kYqVdFmXYFD1FErfSUR/dHEmR02XWCvv4K4BSmD9UzIEVaklOQUiJ8rai/ocNZOLpM3Q0X69zAhovglw7kovH/TBasKJ4sJBk49XDZgr7X7Aje5mbufmQezem+bPDk/VawnQdS+hYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 232754b9b07e5599
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OObadKc35yJg0Q7VxTahQvRDmflQlrDPE/wmQVsqWEmTXcFmjn4rv25Qo3sYmMKlgK7Gm4zJ2wzzNExiI03CxBfzFNcOH+caD0kQnZ8+vhdt/JIO0W/m6/EylrJVvQkg7dpYRoTWkBCmdQA3x+CPjvD2Onxj21Sf2S1gnOkrS94QfBFl64PAFrOKO6eCFcttBBRUFkH8jIo7nMViEF480Id5wM1bsxGsLSj6kiC7ZfJ77K6lI2WxHTuQiRbrj04vafAjhU0ZOP2VywynEE0cS+qEJfDJro8BU+6ZF4RsAh/qLnoPqUG+nCNmsHtQEtYcZ491QnjhpKbULAJUsVYX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ9ttdNAWIlD5SlMp8AY0fSp90/hwL0jgfa+S1mSp7c=;
 b=E/j/B+T1r3347Hc9Yc9hDedFxGo6FtYfUJFbHmJrpfEqf1ZsmGSpkP0JwDxC67LkeH0Fc1oeGgGuXbLZ+Soe6YZKoszqVpjhxOPNg7wTIOcb9zvpQ1dm9Faj4VJtoxvd9oCzEXX2M29xBBxdag6K4DPj5T5NOLCqBCdNsg3wgFHTEmVIpYF71RU03trNjjHxPtZCp9hAYBAo5GrXmFkwdSGgC6PFm2sDrD4kWFZzxSqgC5y3+BI5U7hJZ5uaMcJ3LAzUdC12VHQhf/YtqyKJ7uF/oOg7tGl+RLFJIu1Jf4qXPb8RdqRNQCu3XedR5Ifu2ZSsYm4JunnfwkNFl9168w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ9ttdNAWIlD5SlMp8AY0fSp90/hwL0jgfa+S1mSp7c=;
 b=H/CPQ9jGZ2Rwg7FDJIHJWII6jJwIFCWx0kYqVdFmXYFD1FErfSUR/dHEmR02XWCvv4K4BSmD9UzIEVaklOQUiJ8rai/ocNZOLpM3Q0X69zAhovglw7kovH/TBasKJ4sJBk49XDZgr7X7Aje5mbufmQezem+bPDk/VawnQdS+hYk=
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
Subject: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to common
Date: Tue, 20 Sep 2022 17:12:17 +0800
Message-ID: <20220920091218.1208658-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT006:EE_|AS1PR08MB7513:EE_|AM7EUR03FT012:EE_|PA4PR08MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 496dd1d4-4cbe-4335-46b3-08da9ae85015
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 chqDDM2I4nuKLvQgEpw2qyP2gj5Oyt4hYq7dEhMd+SqLrDz6TJvlZxADoFsD4nKuj0RO4LZwnguy04dChzsVN6dxZyVLOTwYxwcTtnh980Ghy1QzcQl+jJpvzfoPIqIFkIfjSO5GNAPYjAWemHovAS4DWD/hMJtebVMhCK3fCMHE/Re0KuD2bmyO0d1w0Cdd9hcaVyyCN92zsCfCMl9cK6+NlGz/DH3uhPi84TCDQ6Gz3BEYw4dKGI/V9LnnWknWg85OAuOtDy6AIjsFrnQhq2SbE+epOCZka3xVjw5L9K3Kw2Rs3JIy4qLwLc9yqZIv3ETO6NmwLqi/jGX2hLdykOERM/oOLt4V71a1aAIkQZa9NYrASZMt+3Xo3+l4ZahH+6yHrrVOdcMtDko3uUlwIxZjCEkMk7hhYCdXuteUKjVR5VyApDfkZUz2JUQFTL7nd6hR+fK24ymMeOnjl9ATuhofeLEuQfM19qnhIG9jJUk70YJWzvyUCXwv7PGMtqkrgqS4pdiisFBT5JEmYsOGRF6XNLiM2jqkdk725zHLybQPhcj/8UMjX1+lBSvjVLtl4I6LYvA6F9xFDuEWZyF7cbkrSadU00Hl27PvV2RoRi7sEAO9haJc13Gd62sUSZRmyUBzsTs6X5RxpBxwhlqmerDde1NV479wGBxt4JyzduU6K6MBapaAaoJF4PcLhGykX5MekuAL5B9myRK+b0WhUPinc4baSpVFgBFLriQ8eoNL9jUOny0MoOvOHsPbeFFg32QyhteQ+GJ/VCiVNR5/+MlkDSYHmwzUjepps+9K6sRqUb/lOwTEPAB0o9qGpVM1
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(26005)(7696005)(2616005)(81166007)(30864003)(2906002)(82310400005)(478600001)(5660300002)(356005)(36860700001)(40460700003)(82740400003)(36756003)(86362001)(44832011)(426003)(336012)(1076003)(186003)(6666004)(47076005)(40480700001)(41300700001)(83380400001)(4326008)(70586007)(8936002)(6916009)(54906003)(70206006)(8676002)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7513
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2d9a43b-be2a-4a3c-f497-08da9ae849fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JXP6B562PzOfzq6tHeXbngaUlhGfc034gDSrPQuPkT8oNxzEOFxlKtoW1thN9kXaHC5X7YX/KakJmbCbf+MP9nZQgxnq3uXxctGy7/luCJ5JxR5Oq8xNZnlE5klLnnsCchIfGrG6YZbJDmCK8GfGgkm1Lx/5eTLB7wnQvons0apKeeavI81XUiB9vvO0PIMMkSadev2P8I0n2Wfu2zkkbFJbJ+QRLBBRuL3uqrUXhZO/oXwPRlO2BXaaK8XMjW1fy/Pr7NMI4cRd8TP7WWR33O0wfdLc7NLWxFbX2vlqFD2i6mWoJULRcVoo9dDO0ar+nURuOMTQsZHyF7WM0u0Q2Ua0DFsU10UBQHmzuKQ2nQztsaNRZwLTFGhNtduyIpkpTPNNG1L3uSi8YWcynYaSePFSlXWoaH5Qouzzkja+MQ3c8s95IMslBZ8BD/Gyd0XlF0Ouvhd1q/TBCA7d0qdEeFqCnfeAApzsqyU/PpKlcgswGG5G1uT5hCJvHNWat7WU8CuQ66OEEfHYkVUKdOlrqTxJpZTOIg3g8ppog+92N2++PwE9JhIs4QN5wOjYo1bDenj8GtJ9U0q3T4q13V3DYrSrvQGE/ic2zq4i90PTc/GnGTdn3n0Pxd7NyITkVhSWWHP4upuQiXDKmZU0TWRrqp5A8hyJ1zo1RTsphJa8y6c/WZQCI+ULktfyctgJO3WYU9DTU96iQQQ5UBilhv/uym7BxFgMvYFVAmNdvUF6It5Q7Kuzzwe1jDLg9bx5NIjUt/QPPPx+aU9I4RxzBEUHRw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(6916009)(54906003)(336012)(83380400001)(426003)(81166007)(86362001)(2906002)(316002)(478600001)(36756003)(26005)(40480700001)(107886003)(7696005)(6666004)(36860700001)(41300700001)(1076003)(2616005)(186003)(47076005)(40460700003)(82310400005)(82740400003)(5660300002)(4326008)(44832011)(8936002)(70586007)(8676002)(30864003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:12:59.2227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 496dd1d4-4cbe-4335-46b3-08da9ae85015
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080

x86 has implemented a set of codes to scan NUMA nodes. These
codes will parse NUMA memory and processor information from
ACPI SRAT table. But except some ACPI specific codes, most
of the scan codes like memory blocks validation, node memory
range updates and some sanity check can be reused by other
NUMA implementation.

So in this patch, we move some variables and related functions
for NUMA memory and processor to common as library. At the
same time, numa_set_processor_nodes_parsed has been introduced
for ACPI specific code to update processor parsing results.
With this helper, we can reuse most of NUMA memory affinity init
code from ACPI. As bad_srat and node_to_pxm functions have been
used in common code to do architectural fallback and node to
architectural node info translation. But it doesn't make sense
to reuse the functions names in common code, we have rename them
to neutral names as well.

PXM is an ACPI specific item, we can't use it in common code
directly. As an alternative, we extend the parameters of
numa_update_node_memblks. The caller can pass the PXM as print
messages' prefix or as architectural node id. And we introduced
a CONFIG_HAS_NUMA_NODE_FWID to prevent print the mapping between
node id and architectural node id for those architectures do not
have architectural node id. In this case, we do not need to retain
a lot of per-arch code but still can print architectural log
messages for different NUMA implementations.

mem_hotplug also has been accessing by common code, except x86,
other architectures like Arm will also want to implement memory
hotplug in future. We export mem_hotplug to common will not bring
any harm for Arm and we also can reduce some per-arch helpers to
access mem_hotplug.

As asm/acpi.h has been removed from common/numa.c, we have to
move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v4 -> v5:
 1. Introduce arch_numa_disabled for acpi_numa <= 0 in this patch.
 2. Remove the paramter init_as_disable of arch_numa_disabled.
 3. Fix typo "expandsion".
 4. Add const to proper varibales.
 5. Fix Indentation for l1tf_safe_maddr.
 6. Remove double blank lines.
 7. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
 8. Use bool for nodes_cover_memory return value.
 9. Use a plain "int ret" to record compute_hash_shift return value.
10. Add a blank line before the function's main "return".
11. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.
v3 -> v4:
1. Use bool as return value for functions that only return
   0/1 or 0/-EINVAL.
2. Move mem_hotplug to a proper place in mm.h
3. Remove useless "size" in numa_scan_nodes.
4. Use unsigned int or const for proper variables.
5. Fix code-style.
6. Add init_as_disable as arch_numa_disabled parameter.
7. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
   between node id and architectural node id (fw node id).
v2 -> v3:
1. Add __ro_after_init to proper variables.
2. Rename bad_srat to numa_fw_bad.
3. Rename node_to_pxm to numa_node_to_arch_nid.
4. Merge patch#7 and #8 into this patch.
5. Correct int to unsigned int in proper places.
6. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
7. Drop helpers to access mem_hotplug, we export mem_hotplug
   from x86/mm.c to common/page_alloc.c
v1 -> v2:
1. Add code comment for numa_update_node_memblks to explain:
   Assumes all memory regions belonging to a single node
   are in one chunk. Holes between them will be included
   in the node.
2. Merge this single patch instead of serval patches to move
   x86 SRAT code to common.
3. Export node_to_pxm to keep pxm information in NUMA scan
   nodes error messages.
4. Change the code style to target file's Xen code-style.
5. Adjust some __init and __initdata for some functions and
   variables.
6. Merge two patches into this patch:
   1. replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
   2. replace "SRAT" texts.
7. Turn numa_scan_nodes to static.
---
 xen/arch/x86/include/asm/acpi.h |   1 -
 xen/arch/x86/include/asm/mm.h   |   2 -
 xen/arch/x86/include/asm/numa.h |   3 +-
 xen/arch/x86/mm.c               |   2 -
 xen/arch/x86/numa.c             |   5 +
 xen/arch/x86/srat.c             | 311 +++---------------------------
 xen/common/Kconfig              |   3 +
 xen/common/numa.c               | 322 +++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c         |   2 +
 xen/drivers/acpi/Kconfig        |   1 +
 xen/include/xen/mm.h            |   2 +
 xen/include/xen/numa.h          |  11 +-
 12 files changed, 368 insertions(+), 297 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 5c2dd5da2d..c453450a74 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 0fc826de46..95ff71a83a 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -474,8 +474,6 @@ static inline int get_page_and_type(struct page_info *page,
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
-extern paddr_t mem_hotplug;
-
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 6c87942d43..2ca3475271 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -10,6 +10,7 @@ typedef u8 nodeid_t;
 extern int srat_rev;
 
 extern nodeid_t pxm_to_node(unsigned int pxm);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
@@ -22,8 +23,6 @@ extern void init_cpu_to_node(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index db1817b691..68f9989e1f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,8 +157,6 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
-paddr_t __read_mostly mem_hotplug;
-
 /* Frame table size in pages. */
 unsigned long max_page;
 unsigned long total_pages;
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 6cf5c323af..d4448fc333 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -46,6 +46,11 @@ bool arch_numa_broken(void)
     return acpi_numa < 0;
 }
 
+bool arch_numa_disabled(void)
+{
+    return acpi_numa <= 0;
+}
+
 /*
  * Setup early cpu_to_node.
  *
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 1603c415fd..26bf898d0b 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -24,10 +24,6 @@
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
@@ -35,19 +31,6 @@ struct pxm2node {
 static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 	{ [0 ... MAX_NUMNODES - 1] = {.node = NUMA_NO_NODE} };
 
-static unsigned node_to_pxm(nodeid_t n);
-
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
-static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
-
-enum conflicts {
-	NO_CONFLICT,
-	OVERLAP,
-	INTERLEAVE,
-};
-
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -110,78 +93,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static
-enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
-					  paddr_t end, paddr_t nd_start,
-					  paddr_t nd_end, unsigned int *mblkid)
-{
-	unsigned int i;
-
-	/*
-	 * Scan all recorded nodes' memory blocks to check conflicts:
-	 * Overlap or interleave.
-	 */
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		*mblkid = i;
-
-		/* Skip 0 bytes node memory block. */
-		if (nd->start == nd->end)
-			continue;
-		/*
-		 * Use memblk range to check memblk overlaps, include the
-		 * self-overlap case. As nd's range is non-empty, the special
-		 * case "nd->end == end && nd->start == start" also can be covered.
-		 */
-		if (nd->end > start && nd->start < end)
-			return OVERLAP;
-
-		/*
-		 * Use node memory range to check whether new range contains
-		 * memory from other nodes - interleave check. We just need
-		 * to check full contains situation. Because overlaps have
-		 * been checked above.
-		 */
-	        if (nid != memblk_nodeid[i] &&
-		    nd->start >= nd_start && nd->end <= nd_end)
-			return INTERLEAVE;
-	}
-
-	return NO_CONFLICT;
-}
-
-static __init void cutoff_node(int i, paddr_t start, paddr_t end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
-static __init void bad_srat(void)
+void __init numa_fw_bad(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -241,7 +153,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -254,12 +166,12 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	pxm = pa->proximity_domain;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -277,7 +189,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -290,11 +202,11 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -306,32 +218,27 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	struct node *nd;
-	paddr_t nd_start, nd_end;
-	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	unsigned int i;
 
 	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
 		return;
 
-	start = ma->base_address;
-	end = start + ma->length;
 	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			      ROUNDUP(ma->base_address + ma->length,
+				      PAGE_SIZE));
 
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
+	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
-		bad_srat();
+			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+		numa_fw_bad();
 		return;
 	}
 
@@ -340,136 +247,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		pxm &= 0xff;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
-	/*
-	 * For the node that already has some memory blocks, we will
-	 * expand the node memory range temporarily to check memory
-	 * interleaves with other nodes. We will not use this node
-	 * temp memory range to check overlaps, because it will mask
-	 * the overlaps in same node.
-	 *
-	 * Node with 0 bytes memory doesn't need this expandsion.
-	 */
-	nd_start = start;
-	nd_end = end;
-	nd = &nodes[node];
-	if (nd->start != nd->end) {
-		if (nd_start > nd->start)
-			nd_start = nd->start;
-
-		if (nd_end < nd->end)
-			nd_end = nd->end;
-	}
-
-	/* It is fine to add this area to the nodes data it will be used later*/
-	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
-	case OVERLAP:
-		if (memblk_nodeid[i] == node) {
-			bool mismatch = !(ma->flags &
-					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-			                !test_bit(i, memblk_hotplug);
-
-			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
-			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
-			       end - 1, node_memblk_range[i].start,
-			       node_memblk_range[i].end - 1);
-			if (mismatch) {
-				bad_srat();
-				return;
-			}
-			break;
-		}
-
-		printk(KERN_ERR
-		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start,
-		       node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case INTERLEAVE:
-		printk(KERN_ERR
-		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case NO_CONFLICT:
-		break;
-	}
-
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		node_set(node, memory_nodes_parsed);
-		nd->start = nd_start;
-		nd->end = nd_end;
-	}
-
-	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
-	       node, pxm, start, end - 1,
-	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-
-	node_memblk_range[num_node_memblks].start = start;
-	node_memblk_range[num_node_memblks].end = end;
-	memblk_nodeid[num_node_memblks] = node;
-	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
-		__set_bit(num_node_memblks, memblk_hotplug);
-		if (end > mem_hotplug)
-			mem_hotplug = end;
-	}
-	num_node_memblks++;
-}
-
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	unsigned int i;
-
-	for (i = 0; ; i++) {
-		int err;
-		unsigned int j;
-		bool found;
-		paddr_t start, end;
-
-		/* Try to loop memory map from index 0 to end to get RAM ranges. */
-		err = arch_get_ram_range(i, &start, &end);
-
-		/* Reached the end of the memory map? */
-		if (err == -ENOENT)
-			break;
-
-		/* Skip non-RAM entries. */
-		if (err)
-			continue;
-
-		do {
-			found = false;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = true;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = true;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "NUMA: No NODE for RAM range: "
-				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
-			return 0;
-		}
-	}
-	return 1;
+	if (!numa_update_node_memblks(node, pxm, ma->base_address,
+				      ma->length, "PXM",
+				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
+		numa_fw_bad();
 }
 
 void __init acpi_numa_arch_fixup(void) {}
@@ -525,59 +310,9 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use discovered information to actually set up the nodes. */
-int __init numa_process_nodes(paddr_t start, paddr_t end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	if (acpi_numa <= 0)
-		return -1;
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		uint64_t size = nodes[i].end - nodes[i].start;
-
-		if ( size == 0 )
-			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
-static unsigned node_to_pxm(nodeid_t n)
+unsigned int numa_node_to_arch_nid(nodeid_t n)
 {
-	unsigned i;
+	unsigned int i;
 
 	if ((n < ARRAY_SIZE(pxm2node)) && (pxm2node[n].node == n))
 		return pxm2node[n].pxm;
@@ -594,8 +329,8 @@ u8 __node_distance(nodeid_t a, nodeid_t b)
 
 	if (!acpi_slit)
 		return a == b ? 10 : 20;
-	index = acpi_slit->locality_count * node_to_pxm(a);
-	slit_val = acpi_slit->entry[index + node_to_pxm(b)];
+	index = acpi_slit->locality_count * numa_node_to_arch_nid(a);
+	slit_val = acpi_slit->entry[index + numa_node_to_arch_nid(b)];
 
 	/* ACPI defines 0xff as an unreachable node and 0-9 are undefined */
 	if ((slit_val == 0xff) || (slit_val <= 9))
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..d20129959c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -49,6 +49,9 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
+config HAS_NUMA_NODE_FWID
+	bool
+
 config HAS_PDX
 	bool
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 83f4c8cc94..5d9e1989c4 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -13,6 +13,21 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+static nodemask_t __initdata processor_nodes_parsed;
+static nodemask_t __initdata memory_nodes_parsed;
+static struct node __initdata nodes[MAX_NUMNODES];
+
+static unsigned int __ro_after_init num_node_memblks;
+static struct node __ro_after_init node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t __ro_after_init memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+enum conflicts {
+    NO_CONFLICT,
+    OVERLAP,
+    INTERLEAVE,
+};
+
 struct node_data __ro_after_init node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -36,6 +51,311 @@ bool numa_disabled(void)
     return numa_off || arch_numa_broken();
 }
 
+void __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+    node_set(node, processor_nodes_parsed);
+}
+
+bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+    unsigned int i;
+
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        if ( nd->start <= start && nd->end >= end &&
+             memblk_nodeid[i] == node )
+            return true;
+    }
+
+    return false;
+}
+
+static enum conflicts __init conflicting_memblks(
+    nodeid_t nid, paddr_t start, paddr_t end, paddr_t nd_start,
+    paddr_t nd_end, unsigned int *mblkid)
+{
+    unsigned int i;
+
+    /*
+     * Scan all recorded nodes' memory blocks to check conflicts:
+     * Overlap or interleave.
+     */
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        *mblkid = i;
+
+        /* Skip 0 bytes node memory block. */
+        if ( nd->start == nd->end )
+            continue;
+        /*
+         * Use memblk range to check memblk overlaps, include the
+         * self-overlap case. As nd's range is non-empty, the special
+         * case "nd->end == end && nd->start == start" also can be covered.
+         */
+        if ( nd->end > start && nd->start < end )
+            return OVERLAP;
+
+        /*
+         * Use node memory range to check whether new range contains
+         * memory from other nodes - interleave check. We just need
+         * to check full contains situation. Because overlaps have
+         * been checked above.
+         */
+        if ( nid != memblk_nodeid[i] &&
+             nd->start >= nd_start && nd->end <= nd_end )
+            return INTERLEAVE;
+    }
+
+    return NO_CONFLICT;
+}
+
+static void __init cutoff_node(nodeid_t i, paddr_t start, paddr_t end)
+{
+    struct node *nd = &nodes[i];
+
+    if ( nd->start < start )
+    {
+        nd->start = start;
+        if ( nd->end < nd->start )
+            nd->start = nd->end;
+    }
+
+    if ( nd->end > end )
+    {
+        nd->end = end;
+        if ( nd->start > nd->end )
+            nd->start = nd->end;
+    }
+}
+
+bool __init numa_memblks_available(void)
+{
+    return num_node_memblks < NR_NODE_MEMBLKS;
+}
+
+/*
+ * This function will be called by NUMA memory affinity initialization to
+ * update NUMA node's memory range. In this function, we assume all memory
+ * regions belonging to a single node are in one chunk. Holes (or MMIO
+ * ranges) between them will be included in the node.
+ *
+ * So in numa_update_node_memblks, if there are multiple banks for each
+ * node, start and end are stretched to cover the holes between them, and
+ * it works as long as memory banks of different NUMA nodes don't interleave.
+ */
+bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size,
+                                     const char *prefix,
+                                     bool hotplug)
+{
+    unsigned int i;
+    paddr_t end = start + size;
+    paddr_t nd_start = start;
+    paddr_t nd_end = end;
+    struct node *nd = &nodes[node];
+
+    /*
+     * For the node that already has some memory blocks, we will
+     * expand the node memory range temporarily to check memory
+     * interleaves with other nodes. We will not use this node
+     * temp memory range to check overlaps, because it will mask
+     * the overlaps in same node.
+     *
+     * Node with 0 bytes memory doesn't need this expansion.
+     */
+    if ( nd->start != nd->end )
+    {
+        if ( nd_start > nd->start )
+            nd_start = nd->start;
+
+        if ( nd_end < nd->end )
+            nd_end = nd->end;
+    }
+
+    /* It is fine to add this area to the nodes data it will be used later */
+    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
+    {
+    case OVERLAP:
+        if ( memblk_nodeid[i] == node )
+        {
+            bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
+
+            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+                   mismatch ? KERN_ERR : KERN_WARNING, prefix,
+                   arch_nid, start, end - 1,
+                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
+            if ( mismatch )
+                return false;
+            break;
+        }
+
+        printk(KERN_ERR
+               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
+               prefix, arch_nid, start, end - 1, prefix,
+               numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case INTERLEAVE:
+        printk(KERN_ERR
+               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+               prefix, arch_nid, nd_start, nd_end - 1,
+               prefix, numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case NO_CONFLICT:
+        break;
+    }
+
+    if ( !hotplug )
+    {
+        node_set(node, memory_nodes_parsed);
+        nd->start = nd_start;
+        nd->end = nd_end;
+    }
+
+
+#ifdef CONFIG_HAS_NUMA_NODE_FWID
+    printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, prefix, arch_nid, start, end - 1,
+           hotplug ? " (hotplug)" : "");
+#else
+    printk(KERN_INFO "NUMA: Node %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, start, end - 1, hotplug ? " (hotplug)" : "");
+#endif
+
+    node_memblk_range[num_node_memblks].start = start;
+    node_memblk_range[num_node_memblks].end = end;
+    memblk_nodeid[num_node_memblks] = node;
+    if ( hotplug )
+    {
+        __set_bit(num_node_memblks, memblk_hotplug);
+        if ( end > mem_hotplug )
+            mem_hotplug = end;
+    }
+    num_node_memblks++;
+
+    return true;
+}
+
+/*
+ * Sanity check to catch more bad SRATs (they are amazingly common).
+ * Make sure the PXMs cover all memory.
+ */
+static bool __init nodes_cover_memory(void)
+{
+    unsigned int i;
+
+    for ( i = 0; ; i++ )
+    {
+        int err;
+        bool found;
+        unsigned int j;
+        paddr_t start, end;
+
+        /* Try to loop memory map from index 0 to end to get RAM ranges. */
+        err = arch_get_ram_range(i, &start, &end);
+
+        /* Reached the end of the memory map? */
+        if ( err == -ENOENT )
+            break;
+
+        /* Skip non-RAM entries. */
+        if ( err )
+            continue;
+
+        do {
+            found = false;
+            for_each_node_mask ( j, memory_nodes_parsed )
+                if ( start < nodes[j].end
+                    && end > nodes[j].start )
+                {
+                    if ( start >= nodes[j].start )
+                    {
+                        start = nodes[j].end;
+                        found = true;
+                    }
+
+                    if ( end <= nodes[j].end )
+                    {
+                        end = nodes[j].start;
+                        found = true;
+                    }
+                }
+        } while ( found && start < end );
+
+        if ( start < end )
+        {
+            printk(KERN_ERR "NUMA: No node for RAM range: "
+                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
+            return false;
+        }
+    }
+
+    return true;
+}
+
+/* Use discovered information to actually set up the nodes. */
+static bool __init numa_process_nodes(paddr_t start, paddr_t end)
+{
+    int ret;
+    unsigned int i;
+    nodemask_t all_nodes_parsed;
+
+    /* First clean up the node list */
+    for ( i = 0; i < MAX_NUMNODES; i++ )
+        cutoff_node(i, start, end);
+
+    /* When numa is on and has data, we can start to process numa nodes. */
+    if ( arch_numa_disabled() )
+        return false;
+
+    if ( !nodes_cover_memory() )
+    {
+        numa_fw_bad();
+        return false;
+    }
+
+    ret = compute_hash_shift(node_memblk_range, num_node_memblks,
+                             memblk_nodeid);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR
+               "NUMA: No NUMA node hash function found. Contact maintainer\n");
+        numa_fw_bad();
+        return false;
+    }
+    memnode_shift = ret;
+
+    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+    /* Finally register nodes */
+    for_each_node_mask ( i, all_nodes_parsed )
+    {
+        if ( nodes[i].end == nodes[i].start )
+            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
+
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    }
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] == NUMA_NO_NODE )
+            continue;
+        if ( !nodemask_test(cpu_to_node[i], &processor_nodes_parsed) )
+            numa_set_node(i, NUMA_NO_NODE);
+    }
+
+    numa_init_array();
+
+    return true;
+}
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -257,7 +577,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_NUMA
-    if ( !numa_off && !numa_process_nodes(start, end) )
+    if ( !numa_off && numa_process_nodes(start, end) )
         return;
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..80447a341d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,8 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+paddr_t __read_mostly mem_hotplug;
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index e3f3d8f4b1..6f33d1ad57 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
 
 config ACPI_NUMA
 	bool
+	select HAS_NUMA_NODE_FWID
 	select NUMA
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index a925028ab3..9d14aed74b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -147,6 +147,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+extern paddr_t mem_hotplug;
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 5c7abdb050..a87cdc45b4 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -11,6 +11,7 @@
 #define NUMA_NO_DISTANCE 0xFF
 
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
@@ -42,10 +43,11 @@ extern void numa_add_cpu(unsigned int cpu);
 extern void numa_init_array(void);
 extern void numa_set_node(unsigned int cpu, nodeid_t node);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
-extern int numa_process_nodes(paddr_t start, paddr_t end);
+extern void numa_fw_bad(void);
 
 extern int arch_numa_setup(const char *opt);
 extern bool arch_numa_broken(void);
+extern bool arch_numa_disabled(void);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
 static inline void clear_node_cpumask(unsigned int cpu)
@@ -93,6 +95,13 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
  */
 extern int arch_get_ram_range(unsigned int idx,
                               paddr_t *start, paddr_t *end);
+extern bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size,
+                                     const char *prefix,
+                                     bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 #endif
 
-- 
2.25.1


