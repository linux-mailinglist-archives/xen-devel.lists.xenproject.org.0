Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EDC56BBF9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363482.594099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOX-0001bT-Nw; Fri, 08 Jul 2022 14:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363482.594099; Fri, 08 Jul 2022 14:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pOX-0001YP-HB; Fri, 08 Jul 2022 14:55:49 +0000
Received: by outflank-mailman (input) for mailman id 363482;
 Fri, 08 Jul 2022 14:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pOV-0007Ai-BG
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b8db247-fece-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 16:55:45 +0200 (CEST)
Received: from AS9PR06CA0351.eurprd06.prod.outlook.com (2603:10a6:20b:466::17)
 by HE1PR0801MB1785.eurprd08.prod.outlook.com (2603:10a6:3:81::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 14:55:34 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::42) by AS9PR06CA0351.outlook.office365.com
 (2603:10a6:20b:466::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:33 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Fri, 08 Jul 2022 14:55:33 +0000
Received: from 561225665f87.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54305FD9-A266-49F2-A9C8-21E68CE62572.1; 
 Fri, 08 Jul 2022 14:55:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 561225665f87.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:26 +0000
Received: from DB6P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::20) by
 AM6PR08MB5096.eurprd08.prod.outlook.com (2603:10a6:20b:ee::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 14:55:23 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::12) by DB6P192CA0010.outlook.office365.com
 (2603:10a6:4:b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:55:14 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:11 +0000
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
X-Inumbo-ID: 0b8db247-fece-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nVNsbL1FSLwPNF9QeRA22t26kaw/nWGND0g4sNK9/4wR6D5pNDV2vt2cnKyoYweOanoHld04OFoCr8ncY5t1AvBj/ukmkg50RibvUv2ihJ+D7uDvsGTmPXlX0rMejj4EdKXk63a0zEEOumoSutZKDofyT8q/bZCwecVQOd5O7JNYKw+z0UPmgkVCnNuElWN8bPh7uO6Zlk/DFGsICtOUG5kKmOW7tN2eEIU2tokJC4Kh9caY2pv2ynNc9rnoEUCAAGTrQAjJj6PxzEKGFk/SV+SRMK64x1Y1HO6MTezwV/23KuQ0MKSih1+PWG6r9BQOm3j91+Owwoj5AzrwVJ978w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJcku4B3Sy8ii3n55n/z+fUNLo1qJfxiNfc00q729Dw=;
 b=l3r4HAsnK/PBLTht73V8h7d6IoFIYIKJ+hHdqrTYIXZ+6AnYOZryzZVyqeztEcitiVKsLHX9BBhEd/nrO2BuAMu3wfNm97vxDZj4JcUZuE98XaYoCA6FyV9mHziIFwrXNofwgpl/hYYOjpLGIPURP7AaFpGqoUPRVPR/pWCMyoIn7uDJAnUdkdaw0rFeGk+2gmo87PJd+AZDJ4I4LTiC4jOV9gUs7hHCBHT5dhuejKainkQhzk22WNRyvkEzusUmwMwj9LxmWPkIb4MhKI+nJ+kUskPbopb7KVVKjRStpB/A+AE61Xlut0/zDYNt6/wJPaNB6we7cQGmDUjkXfzpuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJcku4B3Sy8ii3n55n/z+fUNLo1qJfxiNfc00q729Dw=;
 b=Hb6SQmaVh++q7O/4Eelh2dLWPZV+gfha2bkBYSY9g8WOK5Oo+WjIixyjGTgvr2CAvyFU8OFef3MrRQHG48MDxH5ldZkzl+tkuiANFBcdYJbWx/4TvGUQRCoynP8vJsUDoxlkYz1CvEBcUhKYXbbK10LNNjL69mVLZ7wobJlrNI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d1a122662ef9862
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc9Pkx3O0+GJjsdOW+pEqPl8Godm0dhrZK77vovOeG5Mtt2FQY5bQJeinEitlTqhpQoVGIv4eDKmnK0T0jgjl3Gt6zF/z8J/S67euF4v1jiBHgfIwiQbHQN6Aeo0p/wH34KMDOGM8NwHt0TAIr8y/dWVxu5yicfU/voTpyhBltIJ9xRrLdu/DbsCYBVws0kxtxg18tXI3+pLhc/86a4fidcdpeadPSTA0HU1V+I+6IgPQoKtaqz5Dmzw7+B2lYCnicbDkAP1TAEsR2Jp3LTDtN21YTR+oXB3d03th5KrFEYWztMVQ2fA4m4BBGy0UBKVrOf1p72N35nWYKlegj2DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJcku4B3Sy8ii3n55n/z+fUNLo1qJfxiNfc00q729Dw=;
 b=PGsB/YYMa/6bDgVLIUQfxjE4cIW+ERafdSyopYyX0Ga2+h5datoqhntYC046wJI54Z2wVcZBGHhd3iC0gE0dcpvIhjIFmz/IF0x/2Gt3YCJjK1+k966NLeeD/c9fPqlJysrvizf0qpNbWDEv1JLvJwWhi5sapvYhaDI2VGFBgvN9zqBy9clvTm5/Pw2bQcZ8otKwdWQIdp50t52smSFlLVmQUfoqN4dbYHHHDazVEnz41ZlMk+9+i+lvHeTRiwubqh9YndXB8A+ipgHxJ2H6+MeTmNDBm3/pxk0e78AGlBOMOTbtf4jVzC4yAPkrhaAk8aNX7BY7bC2NgsgyhCGOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJcku4B3Sy8ii3n55n/z+fUNLo1qJfxiNfc00q729Dw=;
 b=Hb6SQmaVh++q7O/4Eelh2dLWPZV+gfha2bkBYSY9g8WOK5Oo+WjIixyjGTgvr2CAvyFU8OFef3MrRQHG48MDxH5ldZkzl+tkuiANFBcdYJbWx/4TvGUQRCoynP8vJsUDoxlkYz1CvEBcUhKYXbbK10LNNjL69mVLZ7wobJlrNI0=
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
Subject: [PATCH v2 6/9] xen/x86: move NUMA scan nodes codes from x86 to common
Date: Fri, 8 Jul 2022 22:54:21 +0800
Message-ID: <20220708145424.1848572-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 754677fb-9a43-4b30-5624-08da60f1e8f2
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB5096:EE_|AM5EUR03FT004:EE_|HE1PR0801MB1785:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6MrmC9oHO4NMqJXm0J1L06Ap6h8koLIkYn2AGzhbgJsGY09awhOvCMvsGU0MQdokll97Mux+hXwKi+QkX6UxuB5i7uc+3IDRV7Qequd+o/zRCjH6PgPNJKh7VVw7m5Zg71FRJeEGlawK31+C0P9LEBptydsjbCO6rtgvf5ssdZVEwHdHfIQ5Qm5lu7ilXnf41l+tHSU3q1dt3x3Og9/cBq7iIZ061y2szMluB8Iy+EFsWMUYeAVQlR0fWde+zkriZNBbMwhsyNdjSqjXvtiP1lsvpoXmW5T6SfRPlPWGCtJdzkyyymTSb/Zrj1Y7iRkN3GdhptO71ky/nZq77NAvgRm86c2rCYn8LLTSpG5xbAb1dGzOmKfB3hrRUi5c2HWExT6axzyO2JvuV5rmd5mRGL/og6M24Qz/sD3xxHfiG8vmorPysF+7LTWliCcW7cp8C0tcdmrnKhrZ/uwa97sU8DGpsOc4wcRdqZvooBNfquSa3WRuhIAMhM0kgC22JjWNM+N+2FOn3TxFpQ7RkmWzbUO2oIMnQozapd1voWKzlhOy9YsWS+SfQP664JMJH9R9SEOqsK6UrEWE7M2JaUwa6AMs/aT8of4xpRDKlkgJOQAUUxjyRV0YtBMeiXmezwA3tRoyeDCptYG9vZG5Cl+2ifY4ZwFpZrdMC78Nv1b5OWlCDkFGjoQbzgk7o//vFySZubgqMPeOm0AR76/T/9/uS1sek/bheei63OHsrgl/VheBF5+UfudteVzijFWkIkbDuNAMXHpz4qQAVsWsOQyPAK6KFMiZ8ompwYdK/+qSTWxy4nbvElKI9ECr0cFDK/15cTME9vW5OPKmV/R12Jc/fezE1QzAsSangR7c5f+OO7M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(40470700004)(36840700001)(46966006)(186003)(40480700001)(70586007)(7696005)(70206006)(426003)(47076005)(336012)(2616005)(8676002)(6916009)(36756003)(1076003)(4326008)(54906003)(26005)(8936002)(5660300002)(83380400001)(40460700003)(316002)(86362001)(82310400005)(30864003)(2906002)(6666004)(44832011)(41300700001)(478600001)(36860700001)(356005)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5096
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e28d4ec3-8ebc-4fb1-5e84-08da60f1e27a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcZP1jXz6MdoKLNGA2Sy5cX3PzuDiWdCOB0Z9aGSRExDIgfkDDk3lPQ2zzGc5EHPPsGYFpD7J8bAah1AJ0916hjZ+FWN0wLu4lisDx1l27AULXQWnbM5VoD8/MWhmaFX9nOtDDUnRQiqDpDsF+XWCE40TKw4p5gsDvuOvSAVDxnkSB5m6MboDbdnNdlcX9rxPp+g5GBZiEBHZOJJlI4+2xXFgKOBkxfLSQvzDbMlY6DMoBy6m4AIVbl4fGtPwcbgvQWaqtcxmWda01LkWHB/ydUkFxsEaDPeuqqF4RfFaxUYmUog+7P03fd1fwLJjTO6YLkV3NTx132nmc3yJP3zragj3V8/tas5uVAOkzv1mUnUAH+DRaq0EBs0GH37OBtK1f5QchWCWY15sy214hNuuxV3nHezSgLR5k757zAI/Kd6W84fBwHFX6ifM/oj+86uulCxnP8+nShZXd//+VMk+9IHADLE00r/bDxEFKVhkepU5h10U3x3ghdAurS716WqcRejagMBAtA8CcIXC9V3L8tbaXmYLEPERKAPlq37y1Ul++nKryeRShUo0Fok/EcPyGrr8pdLZ1x5f0kc0umUYaqrwH4hJ/PmOIfdxXRFe74im13HW0Q/Mjcj9AaPxA/oEdOPEf+la4C1c07mJUwZMPyJ3HgpmtMIJ380qCaFpETTKGZehDcCTr3Mn1EqJO4mVMWu+uby+fk+EQ9bmEKpF6AC74D0m2/74DBRq5awJhSkvJ6sFH2lPMRLVu53LjKKRyupm8mIYKTRojsZ0hfFHZQQ6qpCL8Z8UCXABsPx3DXN/K77GdEd7ryo54WXS2eJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(40470700004)(46966006)(36840700001)(8936002)(36756003)(2906002)(82740400003)(41300700001)(426003)(70206006)(5660300002)(336012)(8676002)(44832011)(4326008)(186003)(47076005)(83380400001)(6916009)(86362001)(30864003)(2616005)(7696005)(316002)(478600001)(26005)(107886003)(40460700003)(70586007)(36860700001)(81166007)(82310400005)(6666004)(1076003)(54906003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:33.7146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 754677fb-9a43-4b30-5624-08da60f1e8f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1785

x86 has implemented a set of codes to scan NUMA nodes. These
codes will parse NUMA memory and processor information from
ACPI SRAT table. But except some ACPI specific codes, most
of the scan codes like memory blocks validation, node memory
range updates and some sanity check can be reused by other
NUMA implementation.

So in this patch, we move some variables and related functions
for NUMA memory and processor to common code. At the same time,
numa_set_processor_nodes_parsed has been introduced for ACPI
specific code to update processor parsing results. With this
helper, we can move most of NUMA memory affinity init code from
ACPI. And bad_srat and node_to_pxm functions have been exported
for common code to do architectural fallback and node to proximity
converting. For those NUMA implementations haven't supported
proximity domain to node map. A simple 1-1 mapping helper can help
us to avoid the modification of some very valuable print messages.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
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
---
 xen/arch/x86/include/asm/numa.h |   3 +-
 xen/arch/x86/srat.c             | 288 ++----------------------------
 xen/common/numa.c               | 307 ++++++++++++++++++++++++++++++++
 xen/include/xen/numa.h          |   7 +
 4 files changed, 328 insertions(+), 277 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index d8960743d4..eeb431cdb7 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -10,6 +10,7 @@ typedef u8 nodeid_t;
 extern int srat_rev;
 
 extern nodeid_t pxm_to_node(unsigned int pxm);
+extern unsigned node_to_pxm(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
@@ -22,8 +23,6 @@ extern void init_cpu_to_node(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 5bc9096a15..9ae81afdff 100644
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
+void __init bad_srat(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -259,7 +171,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	numa_status = numa_acpi;
 
 	if (opt_acpi_verbose)
@@ -294,7 +206,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	numa_status = numa_acpi;
 
 	if (opt_acpi_verbose)
@@ -306,12 +218,9 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	struct node *nd;
-	paddr_t nd_start, nd_end;
-	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	unsigned int i;
+	int ret;
 
 	if (srat_disabled())
 		return;
@@ -322,15 +231,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
 		return;
 
-	start = ma->base_address;
-	end = start + ma->length;
 	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			      ROUNDUP(ma->base_address + ma->length,
+			      PAGE_SIZE));
 
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
+	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
+			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
 		bad_srat();
 		return;
 	}
@@ -344,129 +252,10 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
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
+	ret = numa_update_node_memblks(node, pxm, ma->base_address, ma->length,
+				       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);
+	if (ret)
 		bad_srat();
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
-		mem_hotplug_update_boundary(end);
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
-		int j, found;
-		paddr_t start, end;
-
-		/* Try to loop memory map from index 0 to end. */
-		found = arch_get_memory_map(i, &start, &end);
-
-		/* Index relate entry is not RAM, skip it. */
-		if (found == -EINVAL)
-			continue;
-
-		/* Reach the end of arch's memory map */
-		if (found == -ENODEV)
-			break;
-
-		do {
-			found = 0;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = 1;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = 1;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "NUMA: No node for memory map range: "
-				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
-			return 0;
-		}
-	}
-	return 1;
 }
 
 void __init acpi_numa_arch_fixup(void) {}
@@ -522,58 +311,7 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	/* Only when numa_on with good firmware, we can do numa scan nodes. */
-	if (!numa_enabled_with_firmware())
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
+unsigned node_to_pxm(nodeid_t n)
 {
 	unsigned i;
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
index bc6a2ded14..e3b66c54b5 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -14,6 +14,21 @@
 #include <xen/softirq.h>
 #include <asm/acpi.h>
 
+static nodemask_t __initdata processor_nodes_parsed;
+static nodemask_t __initdata memory_nodes_parsed;
+static struct node __initdata nodes[MAX_NUMNODES];
+
+static int num_node_memblks;
+static struct node node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+enum conflicts {
+    NO_CONFLICT,
+    OVERLAP,
+    INTERLEAVE,
+};
+
 struct node_data node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -32,6 +47,298 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 enum numa_mode numa_status;
 
+void __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+    node_set(node, processor_nodes_parsed);
+}
+
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+    int i;
+
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        struct node *nd = &node_memblk_range[i];
+
+        if ( nd->start <= start && nd->end >= end &&
+             memblk_nodeid[i] == node )
+            return 1;
+    }
+
+    return 0;
+}
+
+static
+enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
+                                          paddr_t end, paddr_t nd_start,
+                                          paddr_t nd_end, unsigned int *mblkid)
+{
+    unsigned int i;
+
+    /*
+     * Scan all recorded nodes' memory blocks to check conflicts:
+     * Overlap or interleave.
+     */
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        struct node *nd = &node_memblk_range[i];
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
+static void __init cutoff_node(int i, paddr_t start, paddr_t end)
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
+int __init numa_update_node_memblks(nodeid_t node, unsigned pxm,
+                                    paddr_t start, paddr_t size,
+                                    bool hotplug)
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
+     * Node with 0 bytes memory doesn't need this expandsion.
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
+    /* It is fine to add this area to the nodes data it will be used later*/
+    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
+    {
+    case OVERLAP:
+        if ( memblk_nodeid[i] == node )
+        {
+            bool mismatch = !(hotplug) != !test_bit(i, memblk_hotplug);
+
+            printk("%sNUMA: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+                   mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end - 1,
+                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
+            if ( mismatch )
+                return -EINVAL;
+            break;
+        }
+
+        printk(KERN_ERR
+               "NUMA: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
+               pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return -EINVAL;
+
+
+    case INTERLEAVE:
+        printk(KERN_ERR
+               "NUMA： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+               pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return -EINVAL;
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
+    printk(KERN_INFO "NUMA: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, pxm, start, end - 1,
+           hotplug ? " (hotplug)" : "");
+
+    node_memblk_range[num_node_memblks].start = start;
+    node_memblk_range[num_node_memblks].end = end;
+    memblk_nodeid[num_node_memblks] = node;
+    if ( hotplug )
+    {
+        __set_bit(num_node_memblks, memblk_hotplug);
+        mem_hotplug_update_boundary(end);
+    }
+    num_node_memblks++;
+
+    return 0;
+}
+
+/*
+ * Sanity check to catch more bad SRATs (they are amazingly common).
+ * Make sure the PXMs cover all memory.
+ */
+static int __init nodes_cover_memory(void)
+{
+    unsigned int i;
+
+    for ( i = 0; ; i++ )
+    {
+        int j, found;
+        paddr_t start, end;
+
+        /* Try to loop memory map from index 0 to end. */
+        found = arch_get_memory_map(i, &start, &end);
+
+        /* Index relate entry is not RAM, skip it. */
+        if ( found == -EINVAL )
+            continue;
+
+        /* Reach the end of arch's memory map */
+        if ( found == -ENODEV )
+            break;
+
+        do {
+            found = 0;
+            for_each_node_mask( j, memory_nodes_parsed )
+                if ( start < nodes[j].end
+                    && end > nodes[j].start )
+                {
+                    if ( start >= nodes[j].start )
+                    {
+                        start = nodes[j].end;
+                        found = 1;
+                    }
+
+                    if ( end <= nodes[j].end )
+                    {
+                        end = nodes[j].start;
+                        found = 1;
+                    }
+                }
+        } while ( found && start < end );
+
+        if ( start < end )
+        {
+            printk(KERN_ERR "NUMA: No node for memory map range: "
+                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
+            return 0;
+        }
+    }
+    return 1;
+}
+
+/* Use the information discovered above to actually set up the nodes. */
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+{
+    int i;
+    nodemask_t all_nodes_parsed;
+
+    /* First clean up the node list */
+    for ( i = 0; i < MAX_NUMNODES; i++ )
+        cutoff_node(i, start, end);
+
+    /* Only when numa_on with good firmware, we can do numa scan nodes. */
+    if ( !numa_enabled_with_firmware() )
+        return -1;
+
+    if ( !nodes_cover_memory() )
+    {
+        bad_srat();
+        return -1;
+    }
+
+    memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
+                                       memblk_nodeid);
+
+    if ( memnode_shift < 0 )
+    {
+        printk(KERN_ERR
+               "SRAT: No NUMA node hash function found. Contact maintainer\n");
+        bad_srat();
+        return -1;
+    }
+
+    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+    /* Finally register nodes */
+    for_each_node_mask( i, all_nodes_parsed )
+    {
+        paddr_t size = nodes[i].end - nodes[i].start;
+
+        if ( size == 0 )
+            printk(KERN_INFO "SRAT: node %u has no memory\n", i);
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
+    numa_init_array();
+    return 0;
+}
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 6d02204991..564add430c 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -52,6 +52,7 @@ extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 extern bool numa_enabled_with_firmware(void);
 extern enum numa_mode numa_status;
 
+extern void bad_srat(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
@@ -90,6 +91,12 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 
 extern int arch_get_memory_map(unsigned int idx,
                                paddr_t *start, paddr_t *end);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern int numa_update_node_memblks(nodeid_t node, unsigned pxm,
+                                    paddr_t start, paddr_t size,
+                                    bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 #endif
 
-- 
2.25.1


