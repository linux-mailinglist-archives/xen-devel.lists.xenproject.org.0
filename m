Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE86275FC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443093.697548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4B-0002Fp-54; Mon, 14 Nov 2022 06:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443093.697548; Mon, 14 Nov 2022 06:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT4B-0002EH-0q; Mon, 14 Nov 2022 06:35:35 +0000
Received: by outflank-mailman (input) for mailman id 443093;
 Mon, 14 Nov 2022 06:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT49-0000jp-Kx
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:35:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89c19741-63e6-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 07:35:32 +0100 (CET)
Received: from DU2PR04CA0357.eurprd04.prod.outlook.com (2603:10a6:10:2b4::32)
 by PAXPR08MB7466.eurprd08.prod.outlook.com (2603:10a6:102:2b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:31 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::5e) by DU2PR04CA0357.outlook.office365.com
 (2603:10a6:10:2b4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:30 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 14 Nov 2022 06:35:30 +0000
Received: from d7949b411b9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61DC6679-4E7B-4400-8EA8-17C810EE16A2.1; 
 Mon, 14 Nov 2022 06:35:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7949b411b9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:35:24 +0000
Received: from FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::7) by
 AS8PR08MB6646.eurprd08.prod.outlook.com (2603:10a6:20b:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:35:19 +0000
Received: from VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::3c) by FR3P281CA0079.outlook.office365.com
 (2603:10a6:d10:1f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT027.mail.protection.outlook.com (100.127.144.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:35:18 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:17 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:35:17 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:35:14 +0000
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
X-Inumbo-ID: 89c19741-63e6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KQEFoFyNuQprUxMtixpzxTQR31dmGvno4As4t+1mvBXxzoMHPdHz5g10t80MRSI7D6G8MKffVT7dlH8GGj55fjMNYU4oa9eY0ZdNAQPDyGUkYVvkH+HY7WEBxAEaHSZJHXPX0gFHXMQ7mxHG3LEXL4OWokxH3vreVa8US2Wdzxq6Zs3ugrGoqHtn1Gr3zjxJxktGfysz7/Mu5Qn/MjRgTBFtCNC7SaxPpR2rs9Ei2KRHkoLJ9/5+m4s2gUEktXHRdzo+I3X19N0GyrsfHnsnYjdPXikyXnq18t8BteJHxHq3m4Q5N7ljGNqgGnGHfxJ4eTi0yljsPlOYf6dRGsm1lA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEU5rsHGyAZiILfC21Y3SzOiZY3jP1U/4HF25Ob+mHw=;
 b=R0CLcffvyJqv9n2ZOPHDAcmQl10zgEJAZAOadM8bSm/QODF1yduiR8Yc0Wby7XgWaNKa5YEH4ohz+lXQ1k+MtSLsDwi9cbUvHZa0+ldQnYmisk8pv9x1seiwJWOTlI2B1N6xXG95CySILbSTqF+oMmjyB4TZhD9bMxVikEQJj84szMJW+LJkfiFr+kmyOFLpI0BVa5Muo1ZDIdgz2fCKbeT0KBpqdHE5waWoo2SPOZvyULHTZS7/ertZfZG30lTLFkXgx1esXn7mVWovJOixJZxJswtsML6gEBm1qmDDGScLcyMoy2pf3KQnc8xL0mBxqsbcq8JqJlJRKtNQOGkzAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEU5rsHGyAZiILfC21Y3SzOiZY3jP1U/4HF25Ob+mHw=;
 b=8mmH1M4P/tHrP9rd9dxkbnIGoAzu42OKRThp60cpM9kJ3JqQ2eZJaF/C9cXED067/ga4f8mTQtg0P/xD9FEf3IMg3hXnWwVE/aNtCjvN0BJmdsNLyyAedRgs777ZYkDoPuNx2+PYiWA0hcPwl7Lt1FUyY0FZeqtPPEs8jQXOI44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65785e3cdb1d72b9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb4DXNcZGP9lUuO4OMcYHXCL40/YBrU30S6h1gF/EmnrG5a0tm532CO2vuCNa8njjP+EKr3UsVQTZnY4eP8xxzPakcuCb8GXViD9o9RtnOQiX8SIA72KHN5/shT/ZgZmzIyi1NFdqDga2z45a54gbG8zMxywR0ff7toBLJ3GTtHwWBgQ1oZQJ3NOJoi6PElHOoN+fTdgBQGyi9s72PqZ+Lf3mNDbOMEch4x8SlCiI1brSzRMNAlVGwxPII6Ckpi2TaMACre/6UwmdIbN7Lb9LbdYeLdah15bVbG8R/IzIoJ0LhWVJr8e7sw3jPrvp8rA5G33yldJ1AYs6R3AS82dBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEU5rsHGyAZiILfC21Y3SzOiZY3jP1U/4HF25Ob+mHw=;
 b=jg/Y+MGXUSlhVxVn2tP0QLzeXv0LWfJgfbOMkQmKrBsV5gmKa134q3qdqGvdN5byOTwn4xuC11d0HkV5YIYzKlV1YBKCJHdMySQXe99cjI3CO+PyqKmL4Wx4nyQF8S9cwIuh9AX34H6HYKDh3HXtqQ3yRvl2MC5Jl1QhDXOSvXxnHQvHXEMaukzXk9xanyurqCQpN/2dnpjqTAI7C2qy+T018u8S45Hdpzle2+KtqSJ91H2yGOUqVjNoCE+kV0g4ajgN1eIkUkUcxJgmCzYu0hHNLifPXuGRCwfblxkJQHWwX+lYqON33UnQWWiO+WmBJ8qReZAK4a1M6eACjEQn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEU5rsHGyAZiILfC21Y3SzOiZY3jP1U/4HF25Ob+mHw=;
 b=8mmH1M4P/tHrP9rd9dxkbnIGoAzu42OKRThp60cpM9kJ3JqQ2eZJaF/C9cXED067/ga4f8mTQtg0P/xD9FEf3IMg3hXnWwVE/aNtCjvN0BJmdsNLyyAedRgs777ZYkDoPuNx2+PYiWA0hcPwl7Lt1FUyY0FZeqtPPEs8jQXOI44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Mon, 14 Nov 2022 14:34:51 +0800
Message-ID: <20221114063451.473711-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT027:EE_|AS8PR08MB6646:EE_|DBAEUR03FT008:EE_|PAXPR08MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 858dc4d3-0cd8-47a1-81da-08dac60a6d15
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dUPtLgPW0M5YrRPDGV1SqxQxHX4miwdOeVMkPlEpS3GAg/+1Dr9we/nwG2T5Li9ZnYuq4ENFF8gcJlaiIaf62UCgZmen6gmPl/xnjcUJKaU4C+gHveYFtM3985uEoraXpxDvgA7hiY8YwqZKXOfgRHUubGpGU7BNcghEz+D/v6f1LjNEJkk9iLSe1hJ3yivv0uGtCZr6s7ky8G15b+3w5i6PsY7HATg4lZXuyDqc8/4727nGfchHu2t1fQACDG2wt80PXcQRY430nEBFhuAmx35FnoNKr9BK6H5Cz7frAA9trkwjRKbr2mOj1HJst3gPVlE4mFLor1o8IqIWYJ8yrFyJVQ+JVnhV/BunKbkHAgLCiQh9quCaEDxkWbje4EUw9JbZC57upWMWgrGrpO0iDO6Oa0KneR3BH8rNTjycVTX5Y6kQtMLdbKoiX+zgGmBWJaoU7XBjW6D3yKK6jRW7dDSg+3GujksBoHnAWJ57O5to4JtN/c5BjNjZLN2deSFKf4RihLIjzHHAMV7IgIvaRMCpBylUEXi+sGvQs4LUMYE2LeWehWiUDCNjxLNvtGCGRjc3lUNIpmQLOoqoqqYeA33cwrDnAuQeRUy9jHq0p4IcNImRuE/63ZD4DCcrRz21yN1aCc8ytqbU6fLbFxMFzEbUKEOO6ZtviF455tlRG4JXsY9D85+MTwJxZZsOTNgXJoTRuaCL6ffZ1XHBiHbWaRc0HPF+5FMjLs+Uje314oync6ORz/wR28Fik8J8Ha0o9k3JPKpO9CFZuH+mDhLJnAlhJQxzI4JqWKlpfXwTIoQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(70586007)(70206006)(4326008)(8936002)(5660300002)(41300700001)(83380400001)(44832011)(8676002)(40460700003)(40480700001)(86362001)(82740400003)(36756003)(81166007)(82310400005)(356005)(478600001)(54906003)(7696005)(6666004)(47076005)(26005)(316002)(6916009)(426003)(1076003)(186003)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6646
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	434985c3-4fa4-4246-966c-08dac60a65c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y5bxqbmcslUJVOUVo1J2T0wmN0ReR5TnzgwPiLEX11Zv/DlSYVXX5QiFtbxCQMsAjn7bB6fvQakqBth+iZamHoYsZX8Vz91IN8c1gGJklGlOfHImW9hhM7bSTGiI+kOHKJ22xAAOt5nVN7TICBqBrm3H3RY5pkiAtpoQS5gANfuZVCLvzKAg16Swy6NkYJP3NqAoQa9t7XXlkDtrS/5a024uJu8ULuESbu86lg/Oq4gZyv7BuoFiRQMpTV8jBkXzORBE3++YMQwItVGwhovlCGIQNYRlCHk22NxOYLINVgfRxQy3B7sTI1UdcmcdcqOH1G/B7c60GdFNV/q2ZxarCEPyZCzXE5KZKp+b5lNZENrwKgg5XdxJ18M+hF/3P7q/0LhQA3fpjISYXuSeyV8Ep1dCM/5MENFJXII4dQPjTHwhA5l9BwxpM+KL6tCkIdYIeUCsBNTMqh/iET4ERGBdHjeFmi4NCk+KSGrnWqmE4eMGKRoIMcv5J6IsM7GZ8TmFvu8PQGApygnOqOoySdkjAKN4J08sGI2SIWA/Jp91L/pDq1Wv93oacTVsIZBOT2zX4OG0fUZvxM/XJ35pHt4T8UyS702opaPIt6yvwDndq+f/TN/oXCVEVbDxEwdm5bftjIzPCyWgcngIhedpnwOK5ltJdQH5yo6MFQf8A7n+ITnWiM/2XDaySX5Tbg44ddB4fmK7kcbEesTciO1ONYaR02mAppi3ZRiS283SDrZgrFBlOxFJHgRhWmS+m6SDTw/UhOaYHivcIDlGP2w3D5taMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(426003)(7696005)(47076005)(6666004)(83380400001)(107886003)(186003)(336012)(1076003)(26005)(2616005)(40480700001)(81166007)(82740400003)(36860700001)(2906002)(5660300002)(8936002)(44832011)(478600001)(8676002)(70586007)(70206006)(54906003)(41300700001)(316002)(4326008)(6916009)(82310400005)(36756003)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:35:30.8445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 858dc4d3-0cd8-47a1-81da-08dac60a6d15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7466

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v7 -> v8:
1. No change.
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04ecaf7769..71a5f837b3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


