Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F456BBFB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363521.594110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pRP-0004f5-8z; Fri, 08 Jul 2022 14:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363521.594110; Fri, 08 Jul 2022 14:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pRP-0004ck-5v; Fri, 08 Jul 2022 14:58:47 +0000
Received: by outflank-mailman (input) for mailman id 363521;
 Fri, 08 Jul 2022 14:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pRN-0004bj-KU
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:58:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7613dd7c-fece-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:58:44 +0200 (CEST)
Received: from DB6PR0201CA0031.eurprd02.prod.outlook.com (2603:10a6:4:3f::41)
 by DB6PR0801MB1911.eurprd08.prod.outlook.com (2603:10a6:4:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 14:58:41 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::46) by DB6PR0201CA0031.outlook.office365.com
 (2603:10a6:4:3f::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:58:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:58:41 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Fri, 08 Jul 2022 14:58:41 +0000
Received: from 7241878d3249.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7DF909BE-0E3F-4986-AFC6-960F5D47B902.1; 
 Fri, 08 Jul 2022 14:54:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7241878d3249.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:54:58 +0000
Received: from DB8PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:10:be::30)
 by DB6PR08MB2934.eurprd08.prod.outlook.com (2603:10a6:6:19::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 14:54:56 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::76) by DB8PR03CA0017.outlook.office365.com
 (2603:10a6:10:be::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:54:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:54:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:54:55 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:54:52 +0000
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
X-Inumbo-ID: 7613dd7c-fece-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QMou85lCaf58mIlTfoDIiyXjii8iYEQrOXzs9fBIMqKrvdIMk7pJVkvmYRQVyB5cDz+br4BV8N+EEiyRJ8TquBRNYmPv/SAgGdKmIx1KEr/lTJ0dvazjRXXhdBt6p1Hk/gGL49vMa7DG26pRz1Pq6jgiDEgHmXHNFpgvjo8EUlIrIcbpQBUidKVt7jsmlOzNeplSzLnoDdpiQTBGucvBODvWwKSq9YVb1/5Cl9/0mclTWNZM5LRJZUU4QifWJ/55v3ClEGATvDQtqfoeY+JFnv0W7UOZXUh3l7FXEb52ZdXwE69EQGdbmUrb+4ZuRXTNRJTchJarqYr3B6S15qmXqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHdkOUdoAVcxQX9QxLdCraDOgBH9hRS+7Zn54KEbq5g=;
 b=fh+tpEv7u0u2zz/n6pUwfBTdVXez6DCNTzPDqbEBK6XY3TWM1JTKLlTCoDcKBds7b/SmTQhsQ9Ym+1dB6iR5J9AKpJ5sUsoCK9NnXbYXYlEUZLSWj2T/lSnarHlAlliGQA/0goMPs9qm0YI+R48Wwxo1H+SLTTKCtKyEr5XdEoO2PRlJFn7/F/Y83V4ncgmgnVcEpt0Q6NQbw6YWHnd6xYNTFhPC3/kp/TGVtdVvZkNHHDWd3u/v5fN35WJRZy9dxeo6Xhv2k/zEjCIugpmE/gai9bNgaaHw9fUVJKFkk+AK+Gqx9VNHVY5IAjuRbbxRrUpEoY339RvTQaflHh2+oA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHdkOUdoAVcxQX9QxLdCraDOgBH9hRS+7Zn54KEbq5g=;
 b=fk10K9XcduIAlrPzChNjkLT3h+8n///fPnEdtrhiRDluY4PIuVMhHan4WnJrmOhBLkO9zWthdq/CVN+cnpBk7gtII9I8v7EPMU7SSdKvB7s4PExezcV96ZOxtD/Q0NpwX0sR3D74/iVhthczYVQzNwe4UcjcAw95yceR6D4jykY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37d6a05c52907ce5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWIqIs+9Q1tfaPSoeHq6GxdhV94Uw9960sOavN8VnDpqCDaAWo0Df5WCWqu6+tOsK6yfrBmFa/Va/U2DddUZnwsY0SmtndF3ZXmtmDdnno94JvLUBqBwti3yYlXW51X8tJuQeVGJ6dwJPgagLy9mw5tUdTmvQuk3gbc4W6xQ/ejqIPQxsEVAqRR4V3kzgzvVgvb+E/dRP9S/SnBsoDFKiUWQWIxW8k5QTIaPCjgp7bGrO+Zpj9SAjbvPzIuO19lg5lyEEFAs+aZU6RM3G0rC11C4DEDW5rDcyApYmIngLZew0PEaw/zxDlx6ANUial0INiqLsKyn0JmaoA4s+ZCOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHdkOUdoAVcxQX9QxLdCraDOgBH9hRS+7Zn54KEbq5g=;
 b=D9lLSZqKW6L+0hF3+lFtYotiQMpDX0ed6e5MA1Uzdsweu8im1XLhZ2I+IPQ/B7PbFK4MrKVu+y1+BY1+qMz2lM6b4rfqe3ARDeijcoQ0D3OKEOpzsDBqU4bL0VLI7tMql28ISdCaKQqkqQgKHvistp6L/HAJpnEzcuuy+Zl6UNyI6vwJ0ZEgbXwIqgdr7Vmgl01Xa2JhLFpcOnRoSu0v0HeVufN5SCewxKoWQ8zyXpTYQClHYjZWGyV/1cdR3j3MSBiALQAdJIPZx01mL1gcfw4cgWueSLxXl/5EMsI4hXQ5XTrlrPwVAoDZg2br8pFjuNgEFZWAoN93pEE0xODYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHdkOUdoAVcxQX9QxLdCraDOgBH9hRS+7Zn54KEbq5g=;
 b=fk10K9XcduIAlrPzChNjkLT3h+8n///fPnEdtrhiRDluY4PIuVMhHan4WnJrmOhBLkO9zWthdq/CVN+cnpBk7gtII9I8v7EPMU7SSdKvB7s4PExezcV96ZOxtD/Q0NpwX0sR3D74/iVhthczYVQzNwe4UcjcAw95yceR6D4jykY=
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
Subject: [PATCH v2 0/9] Device tree based NUMA support for Arm - Part#2
Date: Fri, 8 Jul 2022 22:54:15 +0800
Message-ID: <20220708145424.1848572-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 871981d6-262f-40f2-e894-08da60f258bf
X-MS-TrafficTypeDiagnostic:
	DB6PR08MB2934:EE_|DBAEUR03FT054:EE_|DB6PR0801MB1911:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a4VBiwR7yvLaMu2mNRhGw02XqjiRMiWQGpmFkhvLabC6h/RjfbACvnWDRUJDql8vj4L17cQukSlBWy1V1hRz2zEtTaVPqiaZNlbuqAjSU6dtfERuih7Hl31VSqAdumlrjImJHMY4+VnmQDbJGpVtUXMdHb2isQ3yYF0JtztaQtLaOR70Y/x8qrp4dEv1hauErcdSDxSuMNA7OMV4/4z6Zm/tlopG7V81w4oirhdJ+6VXczo+5QKPRBtLDOQCPb3PtMp8JWe0LIUsD2407M0PuvJir72XUYlbhYWPlNqW+qV4h2AbZIS6SJe/ogtwxAw03SDKwvXcZjyZOaEIXRBpNUZxXpVRH1M9PdawvCka0TqcEu79Wc7Kj0MTxTbCVK80ETjK4JzTcAR55B6+hmfkPBHwVQOC3RAFiFBKLoRy6tGtjVKO77NnMq/eummdF4//3QoPCVu1gUDKJHFoFnoTT2sxRu/2IddtibR+alxnwvomBOrdbhDN8C3leneQSjJ/R/UF3amjTXU+MZdBzr2KGYiA7t8WC499qAh1pfCl3GM9xZMlJHDc/GcN0qXJLiULUjNPVfkhXeqsydl9cW0Fi9NQqcCBA9qTPjh4fYux/gynJCG4iBKjIOCIoXNm7oVqlpHj8EcmtsybyZu5FzGKN+lPjdmohPoz7awR17em03ejlfDYpMTBeLUTFcfIdEgFLGYJwOKdlu0wK+j8MjBVrCvXjHasRqKWDWzGwGdVTluoaW8ZaE8yIAEcWfi2HxI1GdpUK8smcjFI558ze/d9j8h+Um+qJtRSMvQACG9kzfq1qv82w96Oa521fLxCvE/p2djO1r+LcTrX5lnrVrGLdcM1hhWdYExTHLzv60nhDQuJUv3GOz8C8i/WiVoTFV8JnL7dxZsbaCm4PJHyQF+U/zX1saDwdmPMb7uk9cO9yNo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(40470700004)(5660300002)(4326008)(26005)(6666004)(82740400003)(81166007)(44832011)(70206006)(6916009)(70586007)(8936002)(966005)(316002)(41300700001)(356005)(54906003)(8676002)(7696005)(86362001)(36756003)(1076003)(336012)(83380400001)(478600001)(47076005)(186003)(40460700003)(2616005)(82310400005)(36860700001)(40480700001)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2934
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe7e85f4-4e51-4d4d-c72e-08da60f1d26d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+4wysT8m6ldIoVL1CX0Xw2X0Vwj1Q1Ohx5JN3Qmh5wPecUH7ZWERSkl/ZRfgYrVqEi8w4+/nUO3Lz4ULqdiHQOO+b4wg0iTivUtdh9Psvq6EPmyD4i66nxQ8NhkH/MOf7QV8J3byyNo2fqclQedqtpwTvrQCB5xT3+lsdYPKMovblKr9NWa8npXCHmB9FUVg8ZlDnF++gV/bK1xoAC6diBXmfvzjCnuWclmFZDiWM8fZAddKrbHVu/tuGVeOtPBbSOjO3MV+RoJKtGqfQRmERwzDpnSaZPMGvFWlPKfb+izYHfXgIrRc+dmdkbC8KHBNyxEjsATlMEvXKddO4Hn1fs/vubcljnW2E/VvfIWnd8JW9llx7hQA7XadlrsGyhZZ5jrlj1LV+Kq2z5vp2BbsJ6EHkskIqAYM4byGEPDij7Zpm+65HxV58rz4gHmAVbHBzlUp0Nh4KPtx7VNjtv4pq0mt0iNEj8CNeqtEIcltpTkY+OoPrYuloCGibqwruCW0vrRDrkzHO162A/o2fmYHWFF1iMoQxR99OTWPK+y0Z8Tb+ymslFkZDTzWF+GWEzJN4X9JqoRHF9vaDnAYZLDD6P88Xk4tF74DL/nPTUxihSOD3mvKwaB6A3fzffFUvH3D/QkdqauCzEh9AH3Mq8mDCtU/0sNZP8jsEBPYTn4AtKFjAsTM6oYcg7KzQ82Eg3H+U1YRHfO8dZlZE48BUVr1KNINqH7svhhYsULwhAkn/muqeH6LJ8y6X42SLJWaRfakzRIDl4wQoKAqjduyy8zIQP6uSdpngGjdwh8d9JXxLyL9rCkKA1nYCYYcajgYCn3gn5BD+FLQoRmtRop/f01HRKtMO5//i/3FD577kgHdMfRxSp6cUo+eGeYlfqbW1CHne6HdficN428ifnsXsGs2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(40470700004)(36840700001)(46966006)(186003)(107886003)(40480700001)(2616005)(1076003)(47076005)(316002)(54906003)(82310400005)(8676002)(6916009)(36756003)(83380400001)(336012)(70206006)(426003)(44832011)(70586007)(86362001)(4326008)(36860700001)(7696005)(966005)(478600001)(81166007)(5660300002)(2906002)(6666004)(40460700003)(26005)(82740400003)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:58:41.3514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 871981d6-262f-40f2-e894-08da60f258bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1911

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v2)

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

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (9):
  xen/x86: introduce a helper to update memory hotplug end
  xen/x86: Use enumerations to indicate NUMA status
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_memory_map to get information from E820 map
  xen/x86: move NUMA scan nodes codes from x86 to common
  xen/x86: rename bad_srat to numa_bad
  xen: rename acpi_scan_nodes to numa_scan_nodes
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   6 +
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 446 +-----------------
 xen/arch/x86/setup.c             |   3 +-
 xen/arch/x86/srat.c              | 310 ++-----------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 746 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  92 +++-
 11 files changed, 902 insertions(+), 777 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


