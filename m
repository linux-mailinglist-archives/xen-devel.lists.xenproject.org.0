Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D25F545BEC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345797.571522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXar-0008TM-Qe; Fri, 10 Jun 2022 05:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345797.571522; Fri, 10 Jun 2022 05:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXar-0008QN-Ii; Fri, 10 Jun 2022 05:54:01 +0000
Received: by outflank-mailman (input) for mailman id 345797;
 Fri, 10 Jun 2022 05:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXap-00078y-PJ
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:54:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b845b981-e881-11ec-8b38-e96605d6a9a5;
 Fri, 10 Jun 2022 07:53:58 +0200 (CEST)
Received: from AS8P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::10)
 by VI1PR08MB4605.eurprd08.prod.outlook.com (2603:10a6:803:b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:55 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::57) by AS8P250CA0005.outlook.office365.com
 (2603:10a6:20b:330::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:54 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Fri, 10 Jun 2022 05:53:54 +0000
Received: from 1999e13fadf9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9987A261-D355-4830-9504-45351C5B4B42.1; 
 Fri, 10 Jun 2022 05:53:49 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1999e13fadf9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:49 +0000
Received: from AS8P189CA0046.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::18)
 by AS4PR08MB8189.eurprd08.prod.outlook.com (2603:10a6:20b:58c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:47 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::b4) by AS8P189CA0046.outlook.office365.com
 (2603:10a6:20b:458::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:46 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Fri, 10
 Jun 2022 05:53:45 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:42 +0000
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
X-Inumbo-ID: b845b981-e881-11ec-8b38-e96605d6a9a5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RSVIpQUx1tl/m9VdJg0XDqCj+cd4tn+v1vWc2aYLBXa6/ry1po+IZjsRUb4vugi56uBDPM97cnaYAPoWYUiRC5DtL2wZY4y6iaKkKGhARjq4LY7exhbXT7eB4l+2cXT3cJKIOPgeSEw1oAFuMZpw6uBZaJwQNPLhgxeHXcHhHJxj53hj6YVAj4vfqRwCr4iybCOgkZgTduxQbC9Xv3QcYIxvhUmo28SkidtMfaZry241YHiy715T6if/Jb/sqJb2GtW281SqYFUf94kcmY7EKS4KObXNgqZs2pdp4emedLYQpYG5nyeDbnvAqgFiXziH9QdSmJvUyapfTTcYPUhtHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icfZOJNrOUgyvQFQOa5zeweNoNaUqNft+ccqz7fu4Hk=;
 b=i6oV6X1KQUDMbeGvH/6/rEv5ZEhgVJtA8CUaf3xpVNcwDfHEAbx8RyBn23UtHmzPG5sl/g7wKheHxiCBwLVrGWtUczVdJWiFKHkbbVORJWn/iakZD/pf9jPgn5rgjdkuTWTbcPiX+ZgUAesnx5Wi7OPxjc6vz5T8FDCi5jyPRwJz/95CAwYBRDUKbwAZ3TTj0JBMuln4l16SCnD27zEYAH5F2NL+PCld2Cmvb6zfxLdO2Oe79kx12dH7PjzTN3P0f7pGCKhv49J17HLLIdLF7jsN1BGuk+FciiwMn9rnf2lDLQLb9He5fcaNMm9zg/GzpsdaFMSzKraqacIZbjZ3cQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icfZOJNrOUgyvQFQOa5zeweNoNaUqNft+ccqz7fu4Hk=;
 b=IXHWE6tgM+8wMbmyXFlMd495zvSMJSpPu2j3WLNA9KNWGATxprI8379rlxOVMImimKRQjP3JgBB0Z0KoXp7qXyDfnILgy5zOiOa/tKVZtAbMmmcxKx+Vi9b/6rwenjzKZ6v2PJEaEhlh00So/9zz1LbBiWJL0eIUYxC5T31XvtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 145405ea45d947d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj0p+OqyJaBp7/y8TKdRAQlMUXvIOKL22h76y0Vfz9WPJK9oaBEevWYb4FlfPQctlNcNHkxVAfi4cEZpsuHi0tK5ALNMElR3zemG47cb/yG4KgvNgOwC7RWY4F1NXuIZLaeD9EtALxC+l5VA9pBdtda6rtwr+CIoTjEG7npwOhc4BGJ9IJC0dd0lUXV4h0PoNe7iobYK/3oZ8vDOlABHEiuCzYEBHQovF8OuMbqFuvMiHZDjQ0IysPJWvWsuRG+MJO5nKMgifo7i1BZtvA5huTMYmiEks93k5VBARmS/qmqwy/KQuPMIQ5leIHzgWrm30W5RvKnXmeqBfrmwb6lirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icfZOJNrOUgyvQFQOa5zeweNoNaUqNft+ccqz7fu4Hk=;
 b=GnINzBG0yJVGck0YXndGJiklYSOB2WoHwc//vjE7sznUID/AfH1WYPOJeMWRpQFHp8JB/xmdF4q6R+zH8EsIbgHYSEvD+fEpQrI0pkHyhb2oOFi9fS3N0AzS32fXO36lAKPYv7r6L/vTG0twwolbIEuLHux0+XEH4SMVHIMD0fOh72GczuNenhLRmQ0v1M98zXfqBjDnmA/dF+6+GLxuquiD+11u5F7Y3Bwy5UaTEM6e5fxFlHFJJ7NeatNL7VWAsIefXFhlVWPX6txv+bRA9q0pBuUcuUFKB9/uL0YqO70rKCw6tRjd4IVYHubxDCv9Dbo5NqiFdQZsAEIp76qS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icfZOJNrOUgyvQFQOa5zeweNoNaUqNft+ccqz7fu4Hk=;
 b=IXHWE6tgM+8wMbmyXFlMd495zvSMJSpPu2j3WLNA9KNWGATxprI8379rlxOVMImimKRQjP3JgBB0Z0KoXp7qXyDfnILgy5zOiOa/tKVZtAbMmmcxKx+Vi9b/6rwenjzKZ6v2PJEaEhlh00So/9zz1LbBiWJL0eIUYxC5T31XvtU=
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
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 7/8] xen/x86: add detection of memory interleaves for different nodes
Date: Fri, 10 Jun 2022 13:53:15 +0800
Message-ID: <20220610055316.2197571-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 567ad5cc-a726-446f-5c48-08da4aa59aac
X-MS-TrafficTypeDiagnostic:
	AS4PR08MB8189:EE_|VE1EUR03FT006:EE_|VI1PR08MB4605:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB460594C6E68E76CD7761A6B69EA69@VI1PR08MB4605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eCmcb8RlSzoSzOWYuBdV/hRNswM3Bl82ssDPaZ367co89FIZDxaCEqRNxYuxJsGlnzy6zPYs727fjel4LmbiqWIdjhHZwawj1SR7z0Fo0Kx/BDFPUIiFF2mg9S2GJWtOF4WsuD5pl3SxbKWaJcWWQNkG3RuKiOHM9EMGasFgn7KceQoFHJccJUo74PEXNVwyoEbQvi3urUdr0OIvYoPCOC55FbXiOVLgptImo8932I3q9v/BDLaqsIuEwb4VUU8q3PtBm6TGXfoZA3qvVu9zeyTOjioIaYOlN+5fW4w7aQBQTi8upu04jcShckgETcW9XKv7iEH+tX1t3eeUcEsLuXWBp5ZL4WfAKLmSz3t0lJfsFPHK8jyvGbgKaCmj8UqRJUckFbb/QYGUHIr/0a1wuD68B2fiJ7g7KZPHzPV6K6wkzRywLLI0wR/vzQiHXx7s4QgHCdbBBCE2Ej09I+v6RGgiKfSsiDf/N1gADBwVrmmJ376X7J1xXocYRqP9PoSrbnh7eEu+luN9nf90oORUBNe9xtALmNZxYqifJ1CbSTnKg1VMyzFOtLj8cnTQSMs3JOydw0+73Saa0vSSwwuzfnaU0cTEY+iBYhjBZC2QJA4Eci4IMan0s1K/NAcmjdD33LpoGK4/O+ODfcFzAdFh/LfcB4NmW26mC+VJh7BidnZn2H40Qiflkal5MH9qujn+gxVMau+o4KZt1RwASDW7Vg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(70586007)(2906002)(83380400001)(70206006)(4326008)(7696005)(8676002)(6666004)(8936002)(336012)(316002)(426003)(54906003)(6916009)(356005)(44832011)(81166007)(36756003)(2616005)(508600001)(86362001)(1076003)(186003)(82310400005)(5660300002)(40460700003)(36860700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8189
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30777c25-eee9-41d7-5437-08da4aa595c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2WsY2wNBMaejaDQW3xuqkc1miFDjgA14kpnzbCQdciLZM+4rlYBErH0HA5sZnr99bXZ7pCiE6aiFP94x69NVpc99WR+FIN1+DZkmbPyLYORNyXOIZvWUPQr6nsJJYK0RNcT+vBEen2hqnLbMo/5XY60pkWIuJlfuJVSXIGTDuXwTkURHGhBm8rx5IfNDZbvKSNn+tp84wWtffjCTirPS25oa/dxUbeIwL7KhtJHV8KwoDC2YT2OqAklg2kPnrnnVigHiTQiHTqJcs5guMJKpZfbO7J1T8ZMCpLx9/+qVTOs9XzjTjMQcChv8fDQSh4yZf9dDRqr0L/uE8YyVhuj0mXCKjPjY/Pn2xdasQ6JjykC2ymeddS+H3yE4F0bVDP3WfUcxzCdwvHieXAwfkdWXczTTOyxPsuSB4OGKuU2Z83fNqmGmIC76zeZbg2xw3XZRL20Q0q7iSpIh+C1eAB71CMzzKI5rwKY1B9Ow+HeimFP4Wxqfab6ZHUw69UeB6YKOsPtQ8l1bHejiiV9uuK1GJ+S9GapSeH/MF9dLNWDLv0Okpo7qHTcGOVUO7HiEXJhKp1ClqQiK5/Va28LZYx23zYkeYsX/x13VJAJukDuKJeGfgp0XK0M6JNw/9UkaFIuiNTXTxpfJxrFuihP4Iqamb2NiPLNRluGes1BuM1ivdaZcJRqIeB6KqojeXryjuF93
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(8676002)(70586007)(8936002)(26005)(4326008)(81166007)(508600001)(5660300002)(44832011)(36860700001)(40460700003)(47076005)(426003)(336012)(2616005)(2906002)(316002)(83380400001)(36756003)(82310400005)(186003)(1076003)(6916009)(54906003)(6666004)(86362001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:54.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567ad5cc-a726-446f-5c48-08da4aa59aac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4605

One NUMA node may contain several memory blocks. In current Xen
code, Xen will maintain a node memory range for each node to cover
all its memory blocks. But here comes the problem, in the gap of
one node's two memory blocks, if there are some memory blocks don't
belong to this node (remote memory blocks). This node's memory range
will be expanded to cover these remote memory blocks.

One node's memory range contains other nodes' memory, this is
obviously not very reasonable. This means current NUMA code only
can support node has no interleaved memory blocks. However, on a
physical machine, the addresses of multiple nodes can be interleaved.

So in this patch, we add code to detect memory interleaves of
different nodes. NUMA initialization will be failed and error
messages will be printed when Xen detect such hardware configuration.

As we have checked the node's range before, for a non-empty node,
the "nd->end == end && nd->start == start" check is unnecesary.
So we remove it from conflicting_memblks as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5 -> v6:
1. Use comma to replace dash for [start, end].
2. Add Rb.
v4 -> v5:
1. Remove "nd->end == end && nd->start == start" from
   conflicting_memblks.
2. Use case NO_CONFLICT instead of "default".
3. Correct wrong "node" to "pxm" in print message.
4. Remove unnecesary "else" to remove the indent depth.
5. Convert all ranges to proper mathematical interval
   representation.
6. Fix code-style comments.
v3 -> v4:
1. Drop "ERR" prefix for enumeration, and remove init value.
2. Use "switch case" for enumeration, and add "default:"
3. Use "PXM" in log messages.
4. Use unsigned int for node memory block id.
5. Fix some code-style comments.
6. Use "nd->end" in node range expansion check.
v2 -> v3:
1. Merge the check code from a separate function to
   conflicting_memblks. This will reduce the loop
   times of node memory blocks.
2. Use an enumeration to indicate conflict check status.
3. Use a pointer to get conflict memory block id.
v1 -> v2:
1. Update the description to say we're after is no memory
   interleaves of different nodes.
2. Only update node range when it passes the interleave check.
3. Don't use full upper-case for "node".
---
 xen/arch/x86/srat.c | 139 ++++++++++++++++++++++++++++++++------------
 1 file changed, 101 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 8ffe43bdfe..3d02520a5a 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -42,6 +42,12 @@ static struct node node_memblk_range[NR_NODE_MEMBLKS];
 static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
 
+enum conflicts {
+	NO_CONFLICT,
+	OVERLAP,
+	INTERLEAVE,
+};
+
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(paddr_t start, paddr_t end)
+static
+enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
+					  paddr_t end, paddr_t nd_start,
+					  paddr_t nd_end, unsigned int *mblkid)
 {
-	int i;
+	unsigned int i;
 
+	/*
+	 * Scan all recorded nodes' memory blocks to check conflicts:
+	 * Overlap or interleave.
+	 */
 	for (i = 0; i < num_node_memblks; i++) {
 		struct node *nd = &node_memblk_range[i];
+
+		*mblkid = i;
+
+		/* Skip 0 bytes node memory block. */
 		if (nd->start == nd->end)
 			continue;
+		/*
+		 * Use memblk range to check memblk overlaps, include the
+		 * self-overlap case. As nd's range is non-empty, the special
+		 * case "nd->end == end && nd->start == start" also can be covered.
+		 */
 		if (nd->end > start && nd->start < end)
-			return i;
-		if (nd->end == end && nd->start == start)
-			return i;
+			return OVERLAP;
+
+		/*
+		 * Use node memory range to check whether new range contains
+		 * memory from other nodes - interleave check. We just need
+		 * to check full contains situation. Because overlaps have
+		 * been checked above.
+		 */
+	        if (nid != memblk_nodeid[i] &&
+		    nd->start >= nd_start && nd->end <= nd_end)
+			return INTERLEAVE;
 	}
-	return -1;
+
+	return NO_CONFLICT;
 }
 
 static __init void cutoff_node(int i, paddr_t start, paddr_t end)
@@ -275,10 +306,12 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
+	struct node *nd;
+	paddr_t nd_start, nd_end;
 	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	int i;
+	unsigned int i;
 
 	if (srat_disabled())
 		return;
@@ -310,44 +343,74 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bad_srat();
 		return;
 	}
+
+	/*
+	 * For the node that already has some memory blocks, we will
+	 * expand the node memory range temporarily to check memory
+	 * interleaves with other nodes. We will not use this node
+	 * temp memory range to check overlaps, because it will mask
+	 * the overlaps in same node.
+	 *
+	 * Node with 0 bytes memory doesn't need this expandsion.
+	 */
+	nd_start = start;
+	nd_end = end;
+	nd = &nodes[node];
+	if (nd->start != nd->end) {
+		if (nd_start > nd->start)
+			nd_start = nd->start;
+
+		if (nd_end < nd->end)
+			nd_end = nd->end;
+	}
+
 	/* It is fine to add this area to the nodes data it will be used later*/
-	i = conflicting_memblks(start, end);
-	if (i < 0)
-		/* everything fine */;
-	else if (memblk_nodeid[i] == node) {
-		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-		                !test_bit(i, memblk_hotplug);
-
-		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
-		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
-		       node_memblk_range[i].start, node_memblk_range[i].end);
-		if (mismatch) {
-			bad_srat();
-			return;
+	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
+	case OVERLAP:
+		if (memblk_nodeid[i] == node) {
+			bool mismatch = !(ma->flags &
+					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
+			                !test_bit(i, memblk_hotplug);
+
+			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
+			       end - 1, node_memblk_range[i].start,
+			       node_memblk_range[i].end - 1);
+			if (mismatch) {
+				bad_srat();
+				return;
+			}
+			break;
 		}
-	} else {
+
+		printk(KERN_ERR
+		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
+		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
+		       node_memblk_range[i].start,
+		       node_memblk_range[i].end - 1);
+		bad_srat();
+		return;
+
+	case INTERLEAVE:
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
-		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end);
+		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
+		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
 		bad_srat();
 		return;
+
+	case NO_CONFLICT:
+		break;
 	}
+
 	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		struct node *nd = &nodes[node];
-
-		if (!node_test_and_set(node, memory_nodes_parsed)) {
-			nd->start = start;
-			nd->end = end;
-		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
-		}
+		node_set(node, memory_nodes_parsed);
+		nd->start = nd_start;
+		nd->end = nd_end;
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-	       node, pxm, start, end,
+
+	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+	       node, pxm, start, end - 1,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
 	node_memblk_range[num_node_memblks].start = start;
@@ -396,7 +459,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
+				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
 	}
-- 
2.25.1


