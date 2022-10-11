Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C55FB154
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419581.664406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGn-0005iq-72; Tue, 11 Oct 2022 11:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419581.664406; Tue, 11 Oct 2022 11:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGn-0005er-0J; Tue, 11 Oct 2022 11:17:57 +0000
Received: by outflank-mailman (input) for mailman id 419581;
 Tue, 11 Oct 2022 11:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDGl-0005JI-9X
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:17:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5998eeba-4956-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 13:17:54 +0200 (CEST)
Received: from AM6PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::19)
 by AS8PR08MB8135.eurprd08.prod.outlook.com (2603:10a6:20b:560::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:52 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::1f) by AM6PR10CA0006.outlook.office365.com
 (2603:10a6:209:89::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:51 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Tue, 11 Oct 2022 11:17:51 +0000
Received: from d152a0e8dd55.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F4013E8-57F7-4C57-A676-F8F9298A5C85.1; 
 Tue, 11 Oct 2022 11:17:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d152a0e8dd55.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:44 +0000
Received: from AS8P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::21)
 by GV2PR08MB9423.eurprd08.prod.outlook.com (2603:10a6:150:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 11 Oct
 2022 11:17:42 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::c0) by AS8P189CA0002.outlook.office365.com
 (2603:10a6:20b:31f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:39 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:36 +0000
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
X-Inumbo-ID: 5998eeba-4956-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GhSS5lDHhdDXM7DG+/VSMazfSzMFJltIrlB7XAynjkQswYHd4ksEmsPo9WRsBAZSxQFUKH1v/6HAKWFsKhJSWTAEaV3pCWqy8EW5ylw1ySXcADp09o5DoQLZGwb9LaZMeTLumoEXnXxteQgdIEd2aGtUjLDX2BTGcl3sQFyAbuOy+z1LFbHcwVbZ0RR2J4TJFaghGnvTjhCvZZrW8/+q4DrkfoK733fqq6B5/uEaK6zzQDkkXaQLyZj3RpWr7BIfep3OvI7thkL0kR8BobFYDi+a3H/y7dAfR02pl8Xtnui8ys+B47LXABF6s1ScuKGL4b6YccO47nxlOyZmAwmZqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XBiCXCtEfLqbQyP7SqA0jieOjNJeHMOSZh9sQ5Tpuo=;
 b=MQmWw3RUUPzE+uAfvT3ZmWxPeRPlnwrcjnF8rhkTMNcfEVqvnvL+avqxwXOwdd2l+74XZqGDL7VoDsXSJtdVl8IQPDKDCFTjdlcQ+j38c8ksaKKsAEQ+9cjiQnEnW6DPOSGJi87ZtiSvRl1XFsXmcCUXHlWKMkdauDhqMh97yLkzrV08bO2w2+T4ut48Sk/oB5CC3hSsSnhxqBcqlsLZosYN2vZUd+q5QVFfQXymLmbHL+DUSvk+DzvUlWiEKD2pIESb8X/33puq0oZQpSYu+OQD7bV2Hg/YiHzCQ/ftotaH2a/5BiaM+JgMVShQo3mf59XBKwx4giCpEsWwYR6PHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XBiCXCtEfLqbQyP7SqA0jieOjNJeHMOSZh9sQ5Tpuo=;
 b=4FmyHll2jSn9fjneyzvV4xolXxgfMExxkArW030z7KQcpxuP3XmmJWkEarmcVQuDZ1pwf64Z6yq5PW+XnYD23hW+AkEnE0Nsug+U99f+fefqmSHY6MWMgfFsXXkJsxq+/5E65UlKfDZZsIlN8acne89YKdKEK59NQJG2uqhtSu4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e01e321f1b19aa4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIiMjHAic+mbjwL8pZuVzIbLhytSPnzScRBszNZ19nNj+E5Rj/ywJTiaIl6EdVGq91J+4ti78Z6NWoHwgweUwyibFv6irn+iiWjPtQnPykfyOeikbowpFORryAtX148WIl0r2x3YBxV4Axyjh5ZnlVt61/4DhiLdQSaC80GlnQ5tvtm2svU8BFDUPLJLJm5VMhA9CgUy69rTQssI7grluK2uXOSbgkcxtv/otg+OHm5G+CTTKNJ3IDb9dI7HL7rNnLPsvt88CoSfW3RsJuiXBoHUkeloIKSanIDoZd2QznK/xLxYTwMJfCAgKqbqinrj4E9M5xvykdW8f35dK2gRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XBiCXCtEfLqbQyP7SqA0jieOjNJeHMOSZh9sQ5Tpuo=;
 b=e3jOmNdW4KjqxdRH6GJpouchLXO8J3IormgSl51/IiWp7FZm/vWpG2gLpOpDtiRS8LG4Jdsj6xKzyW0pXz966hNH5alOG3RMvdvmCGXmfbsphGC0kEVJ0Dz+9ww06xQSedNss/it70mngjyhzpQIlxWKorEZFOsBEhCDpMdbw/AuMokE+b/TgY70TS9OKwldg+g2O1fFsq5oW34v7B0aPyCQFl8BmM+lTHc3ymPksnnMSJ0mlYvtkvjPG6gVHqcvvKmIW5vHaStVDlLH6XAZrVSX35hpO7ETBJzCRTWJx1x/hQWssTOrYHthkkOzm+jkVjIzpXEA3s5Xbiip0eRHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XBiCXCtEfLqbQyP7SqA0jieOjNJeHMOSZh9sQ5Tpuo=;
 b=4FmyHll2jSn9fjneyzvV4xolXxgfMExxkArW030z7KQcpxuP3XmmJWkEarmcVQuDZ1pwf64Z6yq5PW+XnYD23hW+AkEnE0Nsug+U99f+fefqmSHY6MWMgfFsXXkJsxq+/5E65UlKfDZZsIlN8acne89YKdKEK59NQJG2uqhtSu4=
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
Subject: [PATCH v6 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Tue, 11 Oct 2022 19:17:06 +0800
Message-ID: <20221011111708.1272985-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011111708.1272985-1-wei.chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT026:EE_|GV2PR08MB9423:EE_|VE1EUR03FT060:EE_|AS8PR08MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7c771b-ac8f-44b9-51ac-08daab7a3c96
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zpH6AGOs/6ddNjWEremKs5Syk0BWtaHP4/KjrnSpzRXnVjQuXGNMxeOoFLU2EgJ35pT13ppq0GbW7FmkquKTHvJNNR+Sw3IQZTmTx4jJxf00DtBK655vfFdjH0DkDOkmhtYLACkH+AObSxt8ztmPTH9nuNY7WR1bmJucQeBiTIkbHKJjxXT+tyaZBlzh4omLjY3UXyT4hp1UDp74OBmK1MGgb2qZuRnInsdAgX8kc0vDnw4OJvPFVZPHQjGxGTBhSZkPET3WGb/nQ0KKWs448PqHdnK9p215nP/06ZyTsUJcE+avEhYs+LdzxHEq/6UQ1K4xNEAnqnNMkmT+nSq4YAyKKyIWIs79NQ/G6TYd9y30X0VJrmJfYZoqoaQ13FEGxibnCHlBIUFDkhzUVKGEPGKSplwJOXj/Dl2l2IE2ivZdeU6WGwlTulZ0GyUxkhQvFBypv7GCzUi5p1EUedYtabn2T+VoHUZoxcUwPcsF2BSPB/2ZtYz3BdYvwnm/+ESUpjaVLOq+GEpK1zYl7Uzx83HGMFqJ0tFeq0KUYXA8D+gcwXHbQgrUwXmajyla2PY4ssaAD1Hk41v3U2sWQ+AV+scdTVTZehXVTljX9W0N5MC1dSwrLuJpqQysSMoTZT7JRpFF7mC1zn8ciXmFdAPkZQzlxgqwZFx252GoPanq1J9FZG60gi/CpWA8pvY+kz07csFHACyJdo7+hp1EB63tGK1YAsBwheci2y9xqAjXzJBCtkC2xjKSSdF5cYs4jtSDc45YbOe/xNMvjrHI/6S3tqaq1YUUBiwNNKl+JKO6glB2wOQlssk/mrSri5eaNEMY
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(5660300002)(316002)(336012)(44832011)(2906002)(41300700001)(8676002)(4326008)(70206006)(356005)(86362001)(40460700003)(82740400003)(81166007)(2616005)(478600001)(186003)(70586007)(7696005)(1076003)(6666004)(26005)(426003)(47076005)(36756003)(36860700001)(40480700001)(54906003)(6916009)(83380400001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9423
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e765b3d5-b519-4d96-87d4-08daab7a3698
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bjC7W6qcW0UayCWBXtlTUAwFsd/QvLS2baxkLS/ElnyC01U9eV2detlS7THDxYd6oCLxl8/8+hGZqSHXaqmrg8q/swiYfQfMgtBl2J3gJdaZ9U1T9akcxfB0GUVefDqpcx1A34rBaFSsNSkbA+DJrWH92VCRHDChKs2kVn7zRZZXrbmryTKLS4z31WxkaWbIco2p+oX1w6X3EgG4drrQI5iONeE7wnyLXfQAjoWCHA23TcTWZfDGQqmLuG0jzJ2iWFoekriiJOLn8HGuLmFHv/pDrK4yLoiY/Aycs0qjBnhhOU3SgUC1kuYn7rpcinuUp1fKJcmf9EOdmLFs2IwdKT+EjhNLNUc80gkvEJcK6whVLO2BY6cCvODATdIX7K1rmnCNghEJIORRtXNLCIbo3rAfGLyLBbXBD7Xa/fjFlrWhW9+pBSgyHcw0ZM6i9/oQbcuN9HKCJLVB1J9SpfDil7i4Nu7AX13liVPpOZKyD/xUAk9bgkY5hrx33zs7yRqQIS5MTPwbp0YtfIwvs5gP/jP2OzLMH2jjS0nbVs4FTQk4X/JpiP0Yf4ubH5Ti1cmEIUUQhAaGz14JiLGfWzw522Vc8Ll2ZSrj0KTzn8Bv237Iq619+xt5XGTRmc5/QdqrDN0Eep39NjpzD1c+HF5N54uvku7X9pS9iQSN145yTNN+38YV8Aj9HeYhUI0WCgnYhLag2thRDQCz33Cf4w1wibRVbVtusoMHtlyrTiwaeoOSG2KEFPZlXMXctBirTvQduR583KAKEvcelQRkATFL1A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(7696005)(26005)(82740400003)(70206006)(40480700001)(316002)(8676002)(86362001)(4326008)(70586007)(36860700001)(81166007)(40460700003)(36756003)(83380400001)(186003)(1076003)(6666004)(82310400005)(478600001)(2616005)(6916009)(2906002)(54906003)(47076005)(336012)(426003)(5660300002)(8936002)(107886003)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:17:51.5784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7c771b-ac8f-44b9-51ac-08daab7a3c96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8135

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5 -> v6:
1. No Change.
v4 -> v5:
1. Add Rb.
2. Adjust the code comments.
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
index ce507dac9e..1a108a34c6 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -452,37 +452,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
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
+		/* Reached the end of the memory map? */
+		if (err == -ENOENT)
+			break;
+
+		/* Skip non-RAM entries. */
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
index 04556f3a6f..9da0e7d555 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -80,6 +80,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * Otherwise it will return -ENOENT for out of scope index, or other
+ * error codes, e.g. return -ENODATA for non-RAM type memory entry.
+ *
+ * Note: the range is exclusive at the end, e.g. [*start, *end).
+ */
+extern int arch_get_ram_range(unsigned int idx,
+                              paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


