Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BF59B7D3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391101.628832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfA-00068r-Lx; Mon, 22 Aug 2022 02:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391101.628832; Mon, 22 Aug 2022 02:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfA-00063r-F9; Mon, 22 Aug 2022 02:59:40 +0000
Received: by outflank-mailman (input) for mailman id 391101;
 Mon, 22 Aug 2022 02:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxf8-0005FA-HA
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75378f5d-21c6-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 04:59:37 +0200 (CEST)
Received: from AS9PR06CA0768.eurprd06.prod.outlook.com (2603:10a6:20b:484::23)
 by AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:51d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 02:59:35 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::90) by AS9PR06CA0768.outlook.office365.com
 (2603:10a6:20b:484::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:35 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 22 Aug 2022 02:59:35 +0000
Received: from f217d9f7ff5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D3B2A87-4903-45DA-B033-9BB9D3D07F6E.1; 
 Mon, 22 Aug 2022 02:59:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f217d9f7ff5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:29 +0000
Received: from DB8PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:10:110::13)
 by DU0PR08MB8445.eurprd08.prod.outlook.com (2603:10a6:10:407::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 02:59:25 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::58) by DB8PR04CA0003.outlook.office365.com
 (2603:10a6:10:110::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:25 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:24 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:21 +0000
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
X-Inumbo-ID: 75378f5d-21c6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nQ38jlpXVX2Kl44PyhfXzx9OnsxPcHf/e07sdnn2BmNi7q8SR5QL9nD5rvGaLdek9VpRDjjQ9TSM0QBRHsPChvuig22plC2W1JVX4OG1gs/SJbLHbMriDIgoCC6t/uwSiuUjZvlikMdnjxk/T9dza4FagyE2pcxMot1mL1dLt0IXwsb6pT60ADOMnJGcnh3MsaeFVhXFFKZFdtbjByTtmvWnv7937AidmWvlxJP2xaKYDhfZsYmR/UYeTLmXiJbR4ngQQN8okztjrOWqqRacY8o1R+ZzN0uCjd5BWi5IboAX+cu0Xz3yKF2zsgu2jo8tIM4/ndKIpt4df0C4vC6O1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEp02Pxymk3veSHxg4lI7WcmCBI/fVSPn+8BlOkU1Dg=;
 b=JTfQZh8qvnncODRNTWIiWXLvuOQf09patZrABFlR3yrB7qbmxCJSEZY/+BFeOoO0Tbbb+m/VTcKl+21QUUVkDojj7pQX7CwcJBhLqtQ66UFvLjLo+aDRMDGDVlGCYHvaHidZQKyaC6lZMZA8Zx7e2Jl7JMeB+LmJUun9flyrUAKFSBrsebvKbvaZx8eXvWDex+laCiQXmtD02kSK+JtEiN002DxWPfylmnhgDnyrz+JgZTHAiH1hdeEiOvBLK8yfG7OOOa+m3U+yTPnQib6wmJULsNDUHPIA5R1CEeiaLeTFQcxpplF9bDRvuRiCfAkEOvfBo0YwnXg1Vs0a3/pvcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEp02Pxymk3veSHxg4lI7WcmCBI/fVSPn+8BlOkU1Dg=;
 b=EPZPPiijGNjNS17U3FVWeKQmcocq21lIAUaczmorehZa5mDGKC70yOHt7XhSbUjE3M9Xs7wdB5lQ9aVjCqNh2WelnCi0bl5CL49u+aGWgPGlObjDAFMOnX871LBn4KiKLjA2mbJ/gWpbLoORz219liX40uBoFsRHSoTJUcxrZjo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f0ab7db950507a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzg6ZSM3G1DoNYyZbYQ3zgWNeXVQ0OruKCEWKAYqE4AL0TSuVGeALo7krtbhbYt9H4GaFIofyaefGZjgGrF8IofBoJS0bpyxTkE4qeK1/TB8kYbHfMrzT1m3YRJ0MY2tP1mUjv18JRII2JrKd4k91K5gt1dekQL5RgwLaR6948gtTQG+uJ2bXxtul19dHB8tHYxNk/pqQdmhNpXr0ZX8vqxoFaaAFVQwMZptrqVFArq04SJdiflI/821FVrBkFkZ4w56xlOL+9q5Z0zrQOSvqij412fMukyv4vfD1sU4BiCh50WDyG92KrLVFKsXqXMfyC7UQLlGH9VC19Pjog8m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEp02Pxymk3veSHxg4lI7WcmCBI/fVSPn+8BlOkU1Dg=;
 b=aBC8j3tA8klF8/3b2CyL/LECzBPPDsZCDRY6jwR0Vhji0jztrkXcarPACIFG1uH9biRY8v6V3tljKbPqcPTaBjgHyMqk7+DZsqa46IAdYdyINm5FtfFD1UiJ/Nh5DZmY5RJMHwkCi3EKMPPRhMqObyv5Uo+XUydTtiUdUg6dgf2/lYyGpSDWfeoISlvMCCCDSWujhIZysWwjz11+yVuCl+b5iGCp1VwKMxUiOA3j4z+b2x+j9gxQTpORoCHfiLdsVre4pkgGeXOpSI1NuUZMAWO0mTwvCIjTxP3XeVQq1KO8sXzA3TTWmxpB/b5xgizE7gd/5icULdth4tzwMzvu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEp02Pxymk3veSHxg4lI7WcmCBI/fVSPn+8BlOkU1Dg=;
 b=EPZPPiijGNjNS17U3FVWeKQmcocq21lIAUaczmorehZa5mDGKC70yOHt7XhSbUjE3M9Xs7wdB5lQ9aVjCqNh2WelnCi0bl5CL49u+aGWgPGlObjDAFMOnX871LBn4KiKLjA2mbJ/gWpbLoORz219liX40uBoFsRHSoTJUcxrZjo=
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
Subject: [PATCH v3 4/6] xen/x86: use arch_get_ram_range to get information from E820 map
Date: Mon, 22 Aug 2022 10:58:08 +0800
Message-ID: <20220822025810.2240707-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822025810.2240707-1-wei.chen@arm.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 740445d7-2d91-407b-b478-08da83ea58a0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8445:EE_|AM7EUR03FT030:EE_|AS4PR08MB8241:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6d3dU3BBzh7g1lkD6i7T5ew8G8ckr7DcJPmX4APaO5+Mx3ql5YddyKbSdKPKKo6sgiHyfJwKwRijQS/0l88dMrIgOkYgnf2CkbJDeI6/yJhOdVWb0jqeeCin7AKBdv6eB0hOceW/5b1m/NlO37ZpPZpgQcD9t9gutYPCHsMzcffGKFVLaXcbAfq9eyEoyHFY78J4UqWXnhGrt7/WrNsRd41SaZC3GhsoHyEFsaC5dKzI6Qnlod+ONf+JIz0s46DmUuA4tT0EmmFnqC9B3TK4hLruO5aZZuurk27U9dtIamEf2tu28N/TFutcxsntPRIarbRGqQoLsQVymoMg/mlDCAya9ITArdIq0cnoq90VtWS0KhcZSlOb0OFY38KwiLbRftmitQ8bl3NIOqy2LFzj2+A0eGylJixE06u+0BDTVlOIKUrwer0vRzs23P+ak9gguBZbR2YIFms6DS2bkeAi2qegES+fUSgxGP6AerNTcGPftPZl6xgJs0h5VX20dnsu32ZST5dTNsGbpZY1glcMr+tV+XoqZjiGo2zezLPxnkzVAUiIhFTGwaLKZY55tp+SlBW6vIhFfMfG8EbODjTPpNByBLlmW7CjtGj6WUW1z5cxyQAcM6vhfCpxyfa6+9yu+tp1Ek+56MS8NMB9vo8ORIc/gUZdy02y0Sqxr2zd0PGLM2x9jJ4rWkr69Hz13NLqXfa27pd0/Rnbw1zo5ygQUv+ASGwqbRwkJCBxMlWI5+qK3S8TqMCv0jeLNYqZsA2QBndqxGKL9SepoyYQIWirjR72fYMpfnNBrHCL3QT4y6wMvhePeamQIyeW0o39CIgf
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39850400004)(36840700001)(40470700004)(46966006)(5660300002)(316002)(70206006)(70586007)(44832011)(41300700001)(40480700001)(82310400005)(8676002)(4326008)(6916009)(36756003)(54906003)(478600001)(8936002)(6666004)(2616005)(7696005)(26005)(2906002)(336012)(186003)(1076003)(83380400001)(426003)(47076005)(36860700001)(82740400003)(86362001)(356005)(81166007)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8445
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15656810-d46d-4b8e-65d0-08da83ea5233
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/wDGJc5z8husaA8p9s1AEyc1H84VsR6fAf7Y+5nn2TLocRofDmKie+f0ifZ75tQSSiXEl0NbS8MYMYktcutu1ke753Fj2pLwMWtRULNAX4Qct+FZsbmgHNMT8UVPU/nbYYySUHeNjSaZeSAJKiMDFQ3JzdvxTdjNNT2XI5rdNSJWzbb+tgil82l1bv84x83REXlk7SgMeIF3ECmk5Jb7zCVgBuw1tofpj3iqGljnRhsqIiXm9EArXTpqWA31/CvybdULVWR+q1upFLG1PHG7v4jJMM33E3Uep6voq6QEimzLhJk4+R+NsgWaINoIGsfXraY3f/WPrpjGT5/C6XNr/hDGGYKfCkfubpc9urlH6xWo9EZBdFAmRpNvgZMx3tYn4OHb8nvy4N2wtLvIR5p5BdMpid7HntWAhiv1n9X32msFsZiG/+F6RlMAO46GQZsqrPZ51C6aqxSsT2eM2JEj4mCM6Q2UWQrOBbPqDKV9Z/wcfRzr8doWAl3aHTe9k1BWABKjyzmVu1wzwRKedPOJz8morGPP6cPbx5s9FfVRq7rbMIGWBFAVGAr5IRi7NTOAp8rqV75Oo4V6y0FKjhF9LJg0MG6I6Oo5RhjfXAvuMgZr1BZo6/8qYMS2QyoRtGmx+UxMcErQCpq3MHAwvQdtrazqLuspVdvAOVgHe7MWcxF62IM9br0nCYJkSomkCY629RfUINJ3z8KUf5odvtWe93RymMYf5aLY8G155/icTJIMdql7Wyw0NGvn5RWP3gRh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39850400004)(376002)(346002)(46966006)(36840700001)(82310400005)(5660300002)(86362001)(107886003)(7696005)(2906002)(36860700001)(6666004)(26005)(41300700001)(478600001)(44832011)(8936002)(426003)(47076005)(336012)(186003)(1076003)(83380400001)(82740400003)(2616005)(40480700001)(70206006)(316002)(6916009)(4326008)(8676002)(36756003)(70586007)(81166007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:35.8234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740445d7-2d91-407b-b478-08da83ea58a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8241

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
 xen/arch/x86/numa.c    | 25 +++++++++++++++++++++++++
 xen/arch/x86/srat.c    | 18 +++++++++++-------
 xen/include/xen/numa.h |  3 +++
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 9a9090e99a..c28c7388e4 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -9,6 +9,7 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <asm/acpi.h>
+#include <asm/e820.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -96,3 +97,27 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
+
+/*
+ * This function provides the ability for caller to get one RAM entry
+ * from architectural memory map by index.
+ *
+ * This function will return zero if it can return a proper RAM entry.
+ * otherwise it will return -ENOENT for out of scope index, or return
+ * -EINVAL for non-RAM type memory entry.
+ *
+ * Note: the range is exclusive at the end, e.g. [start, end).
+ */
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= e820.nr_map )
+        return -ENOENT;
+
+    if ( e820.map[idx].type != E820_RAM )
+        return -EINVAL;
+
+    *start = e820.map[idx].addr;
+    *end = *start + e820.map[idx].size;
+
+    return 0;
+}
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 4c7f0c547e..6bebfb344f 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -428,18 +428,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
    Make sure the PXMs cover all memory. */
 static int __init nodes_cover_memory(void)
 {
-	int i;
+	unsigned int i;
 
-	for (i = 0; i < e820.nr_map; i++) {
+	for (i = 0; ; i++) {
 		int j, found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
+		/* Try to loop memory map from index 0 to end to get RAM ranges. */
+		found = arch_get_ram_range(i, &start, &end);
+
+		/* Index relate entry is not RAM, skip it. */
+		if (found == -EINVAL)
 			continue;
-		}
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
+		/* Reach the end of arch's memory map */
+		if (found == -ENOENT)
+			break;
 
 		do {
 			found = 0;
@@ -458,7 +462,7 @@ static int __init nodes_cover_memory(void)
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "NUMA: No NODE for RAM range: "
 				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
 			return 0;
 		}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index b779e68787..d64006483a 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -80,6 +80,9 @@ static inline __attribute_pure__ nodeid_t phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                 NODE_DATA(nid)->node_spanned_pages)
 
+extern int arch_get_ram_range(unsigned int idx,
+                              paddr_t *start, paddr_t *end);
+
 #endif
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


