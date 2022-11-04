Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE4619445
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437450.691888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtj9-0008Em-B3; Fri, 04 Nov 2022 10:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437450.691888; Fri, 04 Nov 2022 10:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtj9-0008Bb-7G; Fri, 04 Nov 2022 10:15:07 +0000
Received: by outflank-mailman (input) for mailman id 437450;
 Fri, 04 Nov 2022 10:15:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtdC-0001vd-7m
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b097bb3e-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:55 +0100 (CET)
Received: from DB6PR0301CA0057.eurprd03.prod.outlook.com (2603:10a6:4:54::25)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:52 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::21) by DB6PR0301CA0057.outlook.office365.com
 (2603:10a6:4:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:51 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 04 Nov 2022 10:08:51 +0000
Received: from 22eff781080b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C3E398E-A09B-4389-A9E5-D9739BE5DCC9.1; 
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22eff781080b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from AS8PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:20b:127::27)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:42 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::da) by AS8PR04CA0142.outlook.office365.com
 (2603:10a6:20b:127::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:40 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:37 +0000
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
X-Inumbo-ID: b097bb3e-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=V3ZI84t8WVOeWA6xyAcbkwF3iBj6VO7/bqg3+QK8MkjPl6MFappBM2YKQ21KaiIRVgx8Vj1E+gMI6kt6olwVyHkZFfbqI+RJsZadCM1+PpwKVXzUqE05xBqq1epSMsVVgR3ofiNXBU76O6Cfc2FeOZr66Hll3ldx3jn7HBte1xfx2S0d1GlywiE4rC00DQZ+iDXZTIOaL9VL9yHTsAL4l41+02yngT2fkSZAsDbA2oMvBfKHw/Vm1LII0gBR0FXQA81isDKeYk4Lb4+aHPvx2C3tqyWtO9pCj24gV4+s0Ez64rQafFpUmU5C+wj11TpehsH2+tuBpFzjeMkRlLA8DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU2PchcbobCINE1Reghr/rSLoGA3tFIJcSeA7caa+8c=;
 b=Ps0q4SG+8dViYEb73/yI63YJLRrXjdFOb4yuMMo6OeQY/ZR+L6rrZHK1yVQWg+JWuthEXO1TCk7Wq1b432uCFkr4rTo4Rzm7WyZR5G8UNyhmoCdvwV/GajP5EpIwGf4MkFAqmZ0cDeApw5Zfod7VAqUnlYi2cYkKwyAHDFt+ljvOymjjPwJtBtzj5LW46CIQi4atoTll41+mtRXZRit4fM5XUQIeHy4Tbptixlep3Try75Oe8daHyrWvJ6r8FY4iAvrXG+OCRswlSTvwnd1Hn5dtSaG/ab6pLzDmf8bB1j3FDDii5kplOqatxjB6S/+PH0xgIgNMxeWs5REIeV+wSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU2PchcbobCINE1Reghr/rSLoGA3tFIJcSeA7caa+8c=;
 b=i6yukU+NJPTYbyx32qnv+H4TIT5NYo6U+gKW81m3eX6CusiM2jY2B1p1LSXxlDXuEufrA9NVRfvQG/0OMPHeXzSqdrrwmOylIXrvFl4KfQoYTwhHq3PPw+Cahvv/zANIIBVIWuw9kVaTitXz0lnXcDBj0kq/SEp9hXjaF0QdoC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a05c98b201683dfd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irLl3wBBEqQ3cPGX7OkB0CW0Cg5rbgnOHYG5Unk8qqy62HOCImcSaV7t1uVF/+hLnxEBFhdREDGk848bKrEb30z9ikMXFNtdSv8UAnZ/XywBNXfBGwZ2k3INemY/DBlVLLViyDV57yu+S+WFhBcnuStOkh3Bhw+K4KTnKb91ZpT4pd3G6P+x/xG3ZXYYkTj7vlye2/wkJi/SFl73KzDZpnnNlUKN6O9/+nSuoa6gw44mh4PfGeOnddIXwHPkLdraWGuMKgfFd45sDCQ9pmZqk59DXhezVmmHYdBS9iSectEkz+qgX8uAAkU0jZM4fz4SP3iZkcjyGGMHcBmZdiri7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU2PchcbobCINE1Reghr/rSLoGA3tFIJcSeA7caa+8c=;
 b=T790q2uyZMvlJyYZsZFRmP14GPJvqnUeFp3gpTzz1IJG4LkdpHmX46cq/A3l8FSLeI6J0lgrxtp8DGjj+w/bTsUiYfxxmkK+kNjEdbpp4sAqmbdSkJC3uYh6Itfl6HZsHqtYd7FiIRE/T1lTewPnMpEAscOTW/IgqGEDGdnC1nZDAMe3tI66YsQoPFSQUTyfQHp7yfT0rXKkShV6KNHeIb5iTIljUQ8NE49CZgEh9yiKv9p+RcCRU4cKgJrfvp/4iMtu+iHwrRMrR8nR9BYGpt5+tHJ/Tdb2Af+wZQWwevlSJjQc05eLo1VmheGGkQKzuwVX+eL5tHDxscobIy5L8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU2PchcbobCINE1Reghr/rSLoGA3tFIJcSeA7caa+8c=;
 b=i6yukU+NJPTYbyx32qnv+H4TIT5NYo6U+gKW81m3eX6CusiM2jY2B1p1LSXxlDXuEufrA9NVRfvQG/0OMPHeXzSqdrrwmOylIXrvFl4KfQoYTwhHq3PPw+Cahvv/zANIIBVIWuw9kVaTitXz0lnXcDBj0kq/SEp9hXjaF0QdoC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v6 11/11] xen/arm64: add setup_fixmap and remove_identity_mapping for MPU
Date: Fri, 4 Nov 2022 18:07:41 +0800
Message-ID: <20221104100741.2176307-12-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT025:EE_|VE1PR08MB5823:EE_|DBAEUR03FT007:EE_|AM7PR08MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9ddcbc-d674-4385-ff3c-08dabe4c92c6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7QkbjbAL+qsXYi457l8M8GrsH5MkOnpQf9GF+wvUmiqISHtmaQifYF5mYNfqOfDUayVn4KRvn2XZU49P3shImUqhMrHqC4kz1gaSUJ6K1+qyeJJCsf0HQ/lXW1mrTw8rgxIoCPim9xpO7MBEDnxqJpBoSrikQK1vvwjoSwhpx8M6NZ4SxsiJfvv1mfBM46EHRnY9cp8tuoMNOUOTSfKzXSFqtyXqZadZTPlNLHehB1WxIfBcB5aQrgIHEzRQB3q3X8xcXa5T22PvXMRZMEj4uvEfunTpGNzfBbpYnuL9woxBNX7z2najXYOd1Yz6W8PNK6pVFUMELP2CAsJIK9hC46tBjXNka07Hybmmaj8dKnyWHXI9xYod5qhDL/TfPXzd0oUTzOGMkS302rHExZolSRnLev9Vppw4249MnVJr9toghbEL420pknkrwBGISN13nxmzUNS89Jy+fiU+qzMN5ym4xmyThKiwzq/gE5CB4gTXRuDrNK+2p6X3zOXkOob506LQ2DAH/S/E5iyb3UKd0rG6DPftXSBfSGR8WksciWe9LUO8zC51zFV9UbYqxyGiYzOvdu0ghvP2PKukUerKQ5MvYTBDKRDyfcCcqjzS/QRiClLxxioZNpWo06tEULuvSx+3OerFWBszn2zJtEIIH9KU8oX8HCoLzPtXAWBi+w0y4jggOSmsL7ukvBMxZINwotlkA4+uXAh5n5PwaDphUuVoV39hCz9nGmeBLWIVkh7kNlaBRBZC2ypu9c5qWiBI2C6qDpyxk/ERrFqJFN/XmOnbkbmJr5TzBFJZZOXu2E47F0HrkvH9md7bY6bMaP8A
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(70206006)(36756003)(356005)(40480700001)(81166007)(82310400005)(86362001)(40460700003)(82740400003)(316002)(7696005)(70586007)(4326008)(6916009)(6666004)(54906003)(478600001)(44832011)(1076003)(336012)(186003)(2906002)(8676002)(5660300002)(83380400001)(8936002)(426003)(2616005)(47076005)(26005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94bec33c-1055-47e4-0ec7-08dabe4c8d7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkPojLnNEy9Q7T+tbBRWCZR5ekBk2+Tr56cooq1Fz3EhpBEKKW61WAwP84zD05CXk0YRnMd8llhfaxQzuepyIAcTQa5wAe08wfMnvPBzNKZ/9ZpXsf4KcsPXb2Kh9Sip6UoP8GxfThxNYQD3uOp52h0G7DD+885m1GCs8ODYJXO32zhS+/TlzLYL/vADT8Q4A1RMSdSD4WNgnQ7XX4s6oew6P9lHy/vvgv1BS2jioWHaCN+5mN8dkfEnARz1vxwkcsRji/tfn/I1yC43ES8KTaAj7WpxLwc2p7mKuCdV3AwKxkciKeZDDUCqhZedLhD+fvo/S1Ut0M+YeMsxkUnMxmkh2thB/aU+1VkEMQQKrEqfMIPvVcKLXb1vh0OAiXr66AkSeyZxEVlklsoInJR+lUkakVdzQJNrWqBQFCyUqJHsSns0LQ5BOoo0ABCjUm2nkUv42cMUbMn6v3vTSbHyThWAzWMHTVbZQoKGTyxFTAbsxuY21/o9u1t3gGrNN9fAbOXu1xhC1N2mT7X0IyixYr0sUmnAUqwHRh73RQI57XOBXg+vC/MapvtrURAZbq82SLNeLrT8pWDJeJddT8kgz7zlhtEaGnpFq8WHDTzDcEPVHePFlpExJt3+kDSBtn6fUla6xHhMntnZ/dqNA0IWHX22f8ZmsXPE6nE7V9yNpUYCktw28wO0dOiepjInFqAOTzBjB0ghpkn7w8h6yRX/cL+YPCdD00TPd+Ze1tQ6dd3GVDGL7kvIW40vK2lkpr0tWDPhAtEhXEDpLX5ydu/RNA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(7696005)(26005)(6666004)(2616005)(44832011)(478600001)(70586007)(336012)(426003)(47076005)(40460700003)(5660300002)(83380400001)(1076003)(186003)(36756003)(8676002)(4326008)(70206006)(82740400003)(316002)(54906003)(82310400005)(81166007)(86362001)(8936002)(6916009)(2906002)(41300700001)(36860700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:51.5653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ddcbc-d674-4385-ff3c-08dabe4c92c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400

From: Penny Zheng <penny.zheng@arm.com>

setup_fixmap and remove_identity_mapping are two functions that
are used in Xen boot-time code flow. We implement these two
functions for MPU system, in this case, the code flow in head.S
doesn't need to use #ifdef to gate MPU/MMU code.

In MMU system, setup_fixmap is used for Xen to map some essentail
data or devices in boot-time. For MPU system, we still have this
requirement, we map the early UART to MPU protection region when
earlyprintk is enabled. This also means PRINT can't be used after
turning on MPU but before setup_fixmap. This restriction is the
same as MMU system.

For remove_identity_mapping, we just need an empty function to
make head.S code flow happy.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/arm64/head_mpu.S                 | 49 +++++++++++++++++++
 .../arm/include/asm/platforms/fvp_baser.h     |  4 ++
 2 files changed, 53 insertions(+)

diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
index 5a1b03e293..336c0a630f 100644
--- a/xen/arch/arm/arm64/head_mpu.S
+++ b/xen/arch/arm/arm64/head_mpu.S
@@ -20,13 +20,20 @@
 /*
  * In boot stage, we will use 1 MPU region:
  * Region#0: Normal memory for Xen text + data + bss (2MB)
+ * Region#1: Device memory for EARLY UART, size is defined
+ *           by platform's EARLY_UART_SIZE
  */
 #define BOOT_NORMAL_REGION_IDX  0x0
+#define BOOT_DEVICE_REGION_IDX  0x1
 
 /* MPU normal memory attributes. */
 #define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
 #define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
 
+/* MPU device memory attributes. */
+#define PRBAR_DEVICE_MEM        0x20    /* SH=10 AP=00 XN=00 */
+#define PRLAR_DEVICE_MEM        0x09    /* NS=0 ATTR=100 EN=1 */
+
 .macro write_pr, sel, prbar, prlar
     msr   PRSELR_EL2, \sel
     dsb   sy
@@ -69,6 +76,48 @@ ENTRY(prepare_early_mappings)
     ret
 ENDPROC(prepare_early_mappings)
 
+/*
+ * In MMU system, setup_fixmap is used for Xen to map some essential data
+ * or devices in boot-time. In order to be consistent with MMU system, we
+ * inherit the function name for MPU system.
+ * setup_fixmap of MPU system will:
+ * - Map the early UART to MPU protection region when earlyprintk is
+ *   enabled (The PRINT can't be used after turning on MPU but before
+ *   setup_fixmap).
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(setup_fixmap)
+#ifdef CONFIG_EARLY_PRINTK
+    /* Map early uart to MPU device region for early printk. */
+    mov x0, #BOOT_DEVICE_REGION_IDX
+    ldr x1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    and x1, x1, #MPU_REGION_MASK
+    mov x3, #PRBAR_DEVICE_MEM
+    orr x1, x1, x3
+
+    ldr x2, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr x3, =(CONFIG_EARLY_UART_BASE_ADDRESS + EARLY_UART_SIZE - 1)
+    add x2, x2, x3
+    and x2, x2, #MPU_REGION_MASK
+    mov x3, #PRLAR_DEVICE_MEM
+    orr x2, x2, x3
+
+    /*
+     * Write to MPU protection region:
+     * x0 for pr_sel, x1 for prbar x2 for prlar
+     */
+    write_pr x0, x1, x2
+#endif
+
+    ret
+ENDPROC(setup_fixmap)
+
+/* Stub of remove_identity_mapping for MPU systems */
+ENTRY(remove_identity_mapping)
+    ret
+ENDPROC(remove_identity_mapping)
+
 /*
  * Enable EL2 MPU and data cache. Because we will disable cache
  * with MPU at the same time, in accordance with that, we have
diff --git a/xen/arch/arm/include/asm/platforms/fvp_baser.h b/xen/arch/arm/include/asm/platforms/fvp_baser.h
index 9450a411a9..acde3541a1 100644
--- a/xen/arch/arm/include/asm/platforms/fvp_baser.h
+++ b/xen/arch/arm/include/asm/platforms/fvp_baser.h
@@ -11,4 +11,8 @@
 #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
 #endif
 
+#ifdef CONFIG_EARLY_PRINTK
+#define EARLY_UART_SIZE   0x1000
+#endif
+
 #endif /* __ASM_ARM_PLATFORMS_FVP_BASER_H__ */
-- 
2.25.1


