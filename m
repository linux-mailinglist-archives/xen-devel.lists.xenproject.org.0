Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C665AA668
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397240.637745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPR-0004dH-G1; Fri, 02 Sep 2022 03:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397240.637745; Fri, 02 Sep 2022 03:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPR-0004aS-DD; Fri, 02 Sep 2022 03:31:57 +0000
Received: by outflank-mailman (input) for mailman id 397240;
 Fri, 02 Sep 2022 03:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxPP-0004PQ-T4
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:31:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca575257-2a6f-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 05:31:54 +0200 (CEST)
Received: from AS9PR06CA0590.eurprd06.prod.outlook.com (2603:10a6:20b:486::14)
 by DU0PR08MB7836.eurprd08.prod.outlook.com (2603:10a6:10:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 03:31:52 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::3e) by AS9PR06CA0590.outlook.office365.com
 (2603:10a6:20b:486::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:51 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 02 Sep 2022 03:31:51 +0000
Received: from 82be5ef6c966.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5C52205-6D88-4297-B9DA-50E11D1A7228.1; 
 Fri, 02 Sep 2022 03:31:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82be5ef6c966.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:31:44 +0000
Received: from DB6PR0301CA0062.eurprd03.prod.outlook.com (2603:10a6:4:54::30)
 by GVXPR08MB7824.eurprd08.prod.outlook.com (2603:10a6:150:1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 03:31:41 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::3a) by DB6PR0301CA0062.outlook.office365.com
 (2603:10a6:4:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:40 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:37 +0000
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
X-Inumbo-ID: ca575257-2a6f-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=agV1RI+rH3UnYlnMqnFXqyiD/9Dxl8dDNni85XJOm/OWtF1LndI4VhYxmScicb4yLG/j3n/8QZNK2hDjoPV+p/33QvhYGN/rfnOoRG0dfkCQ626zr1B60bCTwDN2pr2zhruYgu6zZKH1gQ6UT8Lpc7FfqcOdC/xw3OynFVMttTi/YAJ7c49LhVFveLT5l7U9fhRd+mAAB5oBJU/5/f5w5cas3R8PYKd6F/IeYWBqtHiWPuBrB2lkLNugc07Hw6vhKYEkQpcBF+Nk9I9vlP30i5GiUo/D5rfdGYh8oZiyhKIMrmeTauXWH9r2gUmiXgEpfsc8m5Av0xf0e+3ESIbSRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNPp3mJZEp8qgDxT7NNCkedF3iq87kU7+nkKCUJRg9E=;
 b=d5NZzwk4A4OPfW4NaV+AWFrALwYBnYDbxNJstk7CgHSbcQXeg/nQ0wBpkrH4zr7JXOspQak0+N1ZmzbB1yXxg5elGs/qJ8sjYvNFJkLm5eGldldKx5mfh8lVECYRLHLY9vqaMITCFGOOs5YRezKfA6h8NP7HfK/iwNroqdMIr9g9nfarrKtQeF8Z1M/W7RbVmjpMbEZ1GcnRbZUw0DbA9frkSjLVaB3JRLJ+NUBbi2BXRoDTFD4PKBbI/VQjfbwFTkL5FS35FwneeAe/L11iuTJgpSu20RX3JBo6Jsg4a9/hFHIFc+WU+T+wN/48xIDiIHP9O1xoNPH6bXF2+TvGAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNPp3mJZEp8qgDxT7NNCkedF3iq87kU7+nkKCUJRg9E=;
 b=0MfFbPHdHJjrt/xT6qIRxyWCB8b47MycbH4BKMhmU4oI24yXvECilqzXvcplyWrr7gjP20bk4yw/LX98D7B+qBJg+7jXpSEHbAav5hduxuLBgNsUryv1gDrciOYhpPMTQODm1eZ63onqxNwX8UIimIXgElRiQgRkpzDZtejtbq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c5eb577714c7dcb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEuhdfV/wTOdEh0vI0nbjuCPzZgQ6qAYQXXh+JErdB1G2ggqmk7fvDi5eeGbCseJk45llG0RolrRoRR6K+tZFOgT+j2qurJgvH6lWR85QOCiGGTVWlNBOmnKAA7z9NoVmbzg8a/Gko+C92ddcmRRUKmODSgb07+hFuUEoCI/SuRJvo+PdmUTVENaqsJO941bBVb401Mx8DRe6tmy0i6ZegH1IrFqy1BZpbhW2R7/azWNOJ1PRwmHCcGMmHPHpxWki3sc/xOuKY0Mcs6nemW4SCQ27YLMl76oefDwDVuy3if9JfZgzShODhBGZtV8PhVNSgNAELwAuXa7fglXjbVRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNPp3mJZEp8qgDxT7NNCkedF3iq87kU7+nkKCUJRg9E=;
 b=Hd6NQa4aMB1TyrnTx6hq/0G89++DybxwM4DWF7qyc8Rxh8pgNTpVQ2WW85A9irueldnadGzYcxuwCw+BBdZK4wOjeDwwu0xVxhK1bc4IFQtWKr+teiGJQPEgZQVtSi66Ug/YyB6SBOWtwJfrmyYSYCGXsaYZa2pGkYSrMjVTTjP0LEHIc18wXrzJYndU99GvFY9OSydcamq33VXrcmGyOLQoIhGFCRMEX19GO1L7Yzy9ytW+GspkeK04f1VnhFJpuCmu0HetGHrtkVxiyHRm5A0oAjxU4fsUy6F5x9fxLD6B1YRbrZB+5Sl3A0j7IHiQ8Oc0t7ysgEF4MExBv9jTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNPp3mJZEp8qgDxT7NNCkedF3iq87kU7+nkKCUJRg9E=;
 b=0MfFbPHdHJjrt/xT6qIRxyWCB8b47MycbH4BKMhmU4oI24yXvECilqzXvcplyWrr7gjP20bk4yw/LX98D7B+qBJg+7jXpSEHbAav5hduxuLBgNsUryv1gDrciOYhpPMTQODm1eZ63onqxNwX8UIimIXgElRiQgRkpzDZtejtbq4=
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
Subject: [PATCH v4 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Fri, 2 Sep 2022 11:31:16 +0800
Message-ID: <20220902033121.540328-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 189b2cfa-822f-46c9-b182-08da8c93acf6
X-MS-TrafficTypeDiagnostic:
	GVXPR08MB7824:EE_|AM7EUR03FT004:EE_|DU0PR08MB7836:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u1KYr7qybhylkmenMlr/aA9ZI4QLFrCAVgvmQ0EaKKDDNV3eBnG4jrH0t9cG74bZSRQ4SY1y/LEhWCAXl/LWoWuTEjt8h3VZx/6JeSkVk3r8ylNxor0fkWCNnYJ4gBFfFJzYuKVOZvwb/oUvHnQDZgAFG2Cq1awzF6DhEtmX+O3osk9QZX1uxuWe409LsUPJphBUmWHiAuRKJWdfuivRwe/TB3XPcrFD//ghzh4VqfYv5xe96ChNlk4VGmypsQuy2uUbLRbKJT+fP0K5V3eYhwNqfQkBHLtaB2BYtVHnoCOXqrSeLO4Ra7R1x+o0WrXiPWZN3gSUaclBfwwnHQ3zzGneIgrXi+uI5aINXKt6ryZ2S+lK3aeRj3Itp4m3GpJuEDy6rsbjwxnqE047dT8Z63miLVMqD5GUMmN6RjEKzn/u8POvPP8vdWhMnKFRHF002S7rpilQ15aYzajVKjE25b+bK4HWnPZm9Wg1IkPEHzi1yMmV+aatK9SrhRR5Ajpn5UEKeDqZaMcdP0BapR34rBHvt6LkgXD7lTfb5LmdSwd2FT95JCzkMMG1ZrZ1arQ66d6prNRhnDB+fqKBQLfbUXuwiai0njkGk5KrBhOeFiKwSd4b2xx/uhwnjRBQrUWikITVxfhEAfJYI5EkIDQdHoJAxUm8BDkzM9QBiq2QJ3Ztr4uyMUyH73oG0Hb0FJeBwAkHl6tBcP+gE60Rps5UCOlcb2b+nh1wj0GdmWOv8O6UR1Z5m6PrUxR3pVilATQHaT9ZVLKC+qgA/JTcYIHkjvfotZemzGBJMNMPhaZSUQ9LVR6xF6vgBQtEEaMLE7EG
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(40470700004)(46966006)(36840700001)(36860700001)(6666004)(82310400005)(36756003)(8676002)(5660300002)(44832011)(2906002)(4326008)(83380400001)(8936002)(70206006)(70586007)(40460700003)(356005)(54906003)(6916009)(316002)(478600001)(41300700001)(40480700001)(81166007)(2616005)(26005)(186003)(1076003)(7696005)(82740400003)(426003)(47076005)(336012)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7824
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbdb8ee2-262e-4894-7b45-08da8c93a6bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t3QbMjI06yOZjneEKCU9tzb5ER4JNv1EdB3zcE8PxLDgFNmfF00y0Mxbc/KHS5d8goHSx+7iOxiQVPugiVEWjy0LjOkZFmMPla2LndhKZVjIQiZ2kWOA3B8n8ejORTyr/ALG+2H9q9fxCbk4+Tjhl1fTHSsgmsfZTDtMyZwwOyLXcW0s+tdUfdZ8K3R7El6x9td3R64teFXkWqwzN9qdiXNaImnjFdAk8cm14+Ay21/tMmd0h4o21nWl51Bf5PZS6LtvVCCNNT7PllH81/Epzz7+axTaSt6KKyLZNJarEtqYljTzzzUlZEJpV3ayWzcM8Syc2l8gNLvvHcJDu9uRG3uTEUDwGdvceUZNRNQTr300zuRySIEV4CE3E+r6bgtBAED7lMB3weesOmk3RglS5vFIFE+TuGToYu6a0JgmFlg8fGC/ygO1RLHCv9GJqwKrQQlVqI4bN8kub82p+ajrs9ns0w+GMCj7upG2KhOWjjzmhzyfUXzRBfiIS/SAlL4FxhQ3lwrX+cgkCzHrxKIcuDOCwPXFkzC4/G97AmWZRDVXQaJcFwGRZ6mHHlZZ5uxz9ubo6ufgwqn+dSQBbLlkfjvvyZkeq/u9vjfjr+BwtPiWS059kCIQiZq17GubVUYsbW3izGJhvw7SchUQ1KzhtTqd/6SBLYcsYNZFAQSU10pupWoOCm7EHSt50Bk/WCr/EgetgbfeQhlxz51fFPeob0SntKH3DAUidWNMVWh4vTuvuJrzgU2/MMffZqz0avg/8FVg7c1DlR+gHSXPAfITfw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(40470700004)(1076003)(426003)(47076005)(6666004)(2616005)(41300700001)(26005)(81166007)(86362001)(7696005)(40460700003)(36860700001)(83380400001)(336012)(186003)(82740400003)(40480700001)(36756003)(8936002)(5660300002)(4326008)(70206006)(70586007)(8676002)(2906002)(44832011)(478600001)(82310400005)(54906003)(6916009)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:31:51.5807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 189b2cfa-822f-46c9-b182-08da8c93acf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7836

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
index 627ae8aa95..a5bc7a78c9 100644
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
@@ -291,28 +310,21 @@ void numa_set_node(int cpu, nodeid_t node)
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


