Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9F545BE9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345793.571483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXak-0007GV-5N; Fri, 10 Jun 2022 05:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345793.571483; Fri, 10 Jun 2022 05:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXaj-0007E0-Uz; Fri, 10 Jun 2022 05:53:53 +0000
Received: by outflank-mailman (input) for mailman id 345793;
 Fri, 10 Jun 2022 05:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXai-00078y-J7
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe05::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4239899-e881-11ec-8b38-e96605d6a9a5;
 Fri, 10 Jun 2022 07:53:51 +0200 (CEST)
Received: from AM6PR0502CA0070.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::47) by VI1PR0801MB1646.eurprd08.prod.outlook.com
 (2603:10a6:800:4f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 05:53:49 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::ee) by AM6PR0502CA0070.outlook.office365.com
 (2603:10a6:20b:56::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:48 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 10 Jun 2022 05:53:48 +0000
Received: from 804bed6f1c78.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 975C0AF7-5E0E-4CDA-8934-36219FB31A39.1; 
 Fri, 10 Jun 2022 05:53:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 804bed6f1c78.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:41 +0000
Received: from AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12)
 by AM0PR08MB5377.eurprd08.prod.outlook.com (2603:10a6:208:181::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 05:53:39 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::c6) by AS9PR06CA0062.outlook.office365.com
 (2603:10a6:20b:464::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:38 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:37 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Fri, 10
 Jun 2022 05:53:36 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:33 +0000
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
X-Inumbo-ID: b4239899-e881-11ec-8b38-e96605d6a9a5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qkw7hl/cegNtumNBTnTQZtKSLnHzVtsTz9jcwCVvSIZ8l4zSwSl94lWGuFoIS5FyjHEOeG4ZJoSrWdzWGNZ5BNI87NZyLmS6tjw2oQS3QeBR8M+op/x0FJQV6uEvHo0RhzD0c2pDFobH5ynMxkwdckU+ANJeVU+ASCDZK9tdo04lHYQrZFbtFePWWNNi77Pq7cXCmP5l+ABq4UTeHA/IOGaCMt8uREZaLK9lckFvuRql/gBPed8jyIeSMX9HotKdAmnrphYTVAJEmiIgFoRY6xBJBRRcXAQbzk77YXWVKr7O8uoPX+Z0XryurcmBQsvC6VGn4fagLis4VGEEBO+7gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=DDH4CSW3KpTePMHY66Qk0u8QK8dgjmQ23fNrn+xE+aXgW8gXGSqbL9BHrzpkNynnqwGG2GiQAOd1Z1/IpN20hHTw9RkUmUXZFAbcB8xXtjsd2MRokoGwClUYv1+QV8DvDiUjTgqvC/omPAtTSUYjgabBOu6c7TsAitjMj2+5lKOaWnVDV+xVVelpMQHqMRxLsjCOSrhiIjV5AWdo7p3aQJOiKmqs9A4jlMHpwvGKuymx2lDnmvtqS3sFWFDqnUn0TcnPqiizitzZnG+SK4OjwyAsbzn0fxePuFomiwV4Nbu/OTdLFMUk9iZCzPO9zXzsY4Ve041mKqznQmiCEduPNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=Qv4apFVaZkv+VSmHCPKx5/+7nhDz+GteI+zxPZD5xyqtLUNmP2qtOVjosfjmmeSqLbnD72wvcLt34JJbW9gEkJArYuKVmcgjFXHA6xqhS+kWTTyBGzlGWMNqiYgBD3QF5Z2nZsZfUDz+9xtxNUeqbG3PR3quBPcPY6lPIZ3imgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7530664715039b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDZuDwLte6/pZpfGuvFpUbNpggKC5G/TRJlJO1W+ZwTKbZaREaIr2mGaSFVC2CznA/84gBTUuMNmSnJGwLUe/5RoDYBGIjn2WK/eWelUJar91XUti8G/inXYC1rgQeyMITO3uxOjSe+SGUm4ehVwwBXUAwOHSbz08awa/PIzibD5AA1MC+gRh7x/S90OnZTZSkl/U1eQvxE++30cVBZF/4Pu8ylfMApWWQtj2vsfOlYVW48O6bkcsFjsAR34N6asaBcoHvYWMA0BG8p+HZPhAb8BhLvfFPW0MP5G6wFy6AjYVDsIk6mVdsd0u1RRsXix3T9LZURRqsoieIRwZOAqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=i50GP0jxKwPGNu5rc1ItaH2BYqD9L32lcaCWE7uBxv7s1XKpdG0RZ7CK+KfaduRnVRnRFj5JkhNoMOlwcwLi1DaUWhXr76lKUYTRg6yH56P024LO2/u0BGflpALLpDDBNkgQB+1C/UCdrn+Bft9JQOIaTYS4TRtd2CSMSKmA6VV7cAXwweO5dJ6EJkTioOlVblNnuGCao+cTHeAyQ3vsi9CHTQ//eRsFqNjfqGUEvhoqIQqkgFloUYbhknbGNZ1FY558XVs47hx7BkBn6jQ2OzzK52hdiHfdi3RLbmVZFDNdQ7HvjZ6uJVwEph3kTO4AtUoQlz58pBr5gcEZd5wNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9wUoq3XTl/aE5RFIP3KDTc2vdcTUcKiAanOp0Qrrhc=;
 b=Qv4apFVaZkv+VSmHCPKx5/+7nhDz+GteI+zxPZD5xyqtLUNmP2qtOVjosfjmmeSqLbnD72wvcLt34JJbW9gEkJArYuKVmcgjFXHA6xqhS+kWTTyBGzlGWMNqiYgBD3QF5Z2nZsZfUDz+9xtxNUeqbG3PR3quBPcPY6lPIZ3imgU=
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
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v6 4/8] xen: decouple NUMA from ACPI in Kconfig
Date: Fri, 10 Jun 2022 13:53:12 +0800
Message-ID: <20220610055316.2197571-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: c2be363b-4279-4ca3-4005-08da4aa596d0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB5377:EE_|VE1EUR03FT044:EE_|VI1PR0801MB1646:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1646C093D1E21E43FBDF14ED9EA69@VI1PR0801MB1646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8ZnsLLGNhQt1a+6E/sppjADgD2EnCramADmjMwGQi5sbZHizMgD+9WibPkeRz8tpH2mqqK07A/1adKuK4uhjDuJTlEX1Q9Ib2dAXV/ck0nrrvpztUohb4mSovuCivW9H66NM2xCNuW0Qhou03VZ7OME0XG7P9fCr8YiNFWcVY/qRn+ml2svNoKDLDL248eKqUomQvLQ2gJZNXO7ed/n6gOrOvZFK3H9Rj4sO0sXmMeD0wOIDb2sibsaetaxQGvicRurY4nOtSCL0gmiPtadkYFUoCR2i6PAhTDNtEZkIv9P+Lrlj8IiInlpd7XkEzaw1ROrrb6Q8Mwgz2YajSrojK75KMlxW3Hgo5mdVX45/rRveMk73k6nOsiDGGZeCQKQNURip0Tv8BPgd1H9KjMfSkDBbYksZh02aDdztKsIzLAjGRHjim0kRmrFeCWZxfJujtpYBClNU3dUoxFXmUPoLgzAbJRG8+ip9ynSWD3566yLya5rriv6gsHVZYJk/s/cLebaXAqvrFC6rrjBE0HpKbq4MP5sL0DzHBBsYcbgpJ8ojrONA5G6dTvU9grICSXd17IwtMdV45CaaO6TDlUKnYzGqnohaRsESATfDmcxaRsoCkhk+irhjG/8lTV04H7Fm4qZgl9F9F4kczSGI82YduPx3oiY1OZ0xWQtvFMNam+Y4Q7u11KRrpRP6sIN2rZbMy9KPjorH5JqE6U3+ZHJ0tA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(47076005)(316002)(36860700001)(8676002)(5660300002)(36756003)(4326008)(81166007)(82310400005)(356005)(70206006)(70586007)(8936002)(6666004)(508600001)(44832011)(83380400001)(426003)(86362001)(54906003)(26005)(1076003)(7696005)(186003)(6916009)(40460700003)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5377
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c48b166-d269-48eb-b6bf-08da4aa590b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	twtASVrJGitsdj1N1hpRc0RY20BcGr3VmpD/uujJSGgLv47CvJAXxtsfvgKn5qRpOsM3uHamm9VpskIUmQ+IaR6UUfzSJ2BXM4ssBP+/3Rr01Qlv5knbFf/45R1NjyOB/Ft/pKQ1A5J1uEDncO37fvnbccguLFvCgy4iUVdLN0O2Cd2zACDvo5Iw7gEBJvN1uS0qE8x6WQJfigNRSF7gtfGeItA6yyjijMe5ppXbgzsFr5SnspWka+W421X49+I+Ad1fkQkxYB9kypK2i7kmyVfF9LtwF9baPrhJUtl1qp8y9rh+LleDNUz0EVsvquDe3dR4c9qeb8PuJxQi74fXf2azJ81t/eU0pWBvUqSmdPPwuoba3cyn01tiDc0iW4E13d7IWP4g2huklbxhx6JR1Pg2i0WeHu9iGx/0gpYPCq5eFDn2ZiQO3kEs0SCHIG3xTyyk3g4H7tJVvj7kxEZ1jfM+9ZlCDwqHZBzLwhH5rUkQ1qU5r+SnEPVBJuc8cZao7U5EejtdMsxwcWpOGT4yWaSrv3PqXXuTo0B9Xkuzy/qIOmYADUFk9kINpwHSq9pBW9QusNsdEtxQ+ELPHc+vRiLhhRBnVdJmyRW2YW8HHz/Dk4Fj+9xOBUAPJ7909ZP84VSMd7Uq0YgnHyLr3tpwlvfQPm3Y4lfbyfv70Il80BGCqTeS9XNJWs20n77Ykq3G
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(508600001)(8936002)(2906002)(4326008)(81166007)(8676002)(70206006)(82310400005)(70586007)(40460700003)(44832011)(36860700001)(5660300002)(54906003)(316002)(6916009)(26005)(83380400001)(2616005)(7696005)(47076005)(6666004)(1076003)(36756003)(426003)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:48.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2be363b-4279-4ca3-4005-08da4aa596d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1646

In current Xen code only implements x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In a follow-up patch, we will introduce support for NUMA using
the device tree. That means we will have two NUMA implementations,
so in this patch we decouple NUMA from ACPI based NUMA in Kconfig.
Make NUMA as a common feature, that device tree based NUMA also
can select it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
no change.
v2 -> v3:
Add Tb.
v1 -> v2:
No change.
---
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/drivers/acpi/Kconfig          | 3 ++-
 xen/drivers/acpi/Makefile         | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc864..1e31edc99f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
@@ -26,7 +27,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index de20642524..07bcd15831 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d61..d65add3fc6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -70,6 +70,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index b64d3731fb..e3f3d8f4b1 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -5,5 +5,6 @@ config ACPI
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
-config NUMA
+config ACPI_NUMA
 	bool
+	select NUMA
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 4f8e97228e..2fc5230253 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -3,7 +3,7 @@ obj-y += utilities/
 obj-$(CONFIG_X86) += apei/
 
 obj-bin-y += tables.init.o
-obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
 
-- 
2.25.1


