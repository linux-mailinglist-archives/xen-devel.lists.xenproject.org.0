Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E45AA66D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397274.637801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxRC-0007gz-Gn; Fri, 02 Sep 2022 03:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397274.637801; Fri, 02 Sep 2022 03:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxRC-0007dv-DQ; Fri, 02 Sep 2022 03:33:46 +0000
Received: by outflank-mailman (input) for mailman id 397274;
 Fri, 02 Sep 2022 03:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxRA-0007di-PM
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:33:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2052.outbound.protection.outlook.com [40.107.105.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0afe8b-2a70-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:33:43 +0200 (CEST)
Received: from DB6PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::33)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 2 Sep
 2022 03:33:33 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::f2) by DB6PR1001CA0047.outlook.office365.com
 (2603:10a6:4:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 03:33:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:33:32 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 02 Sep 2022 03:33:32 +0000
Received: from 0e3dc0218c6c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9538F91C-8A56-411F-9D50-1A773DCEACCE.1; 
 Fri, 02 Sep 2022 03:31:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e3dc0218c6c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:31:39 +0000
Received: from DU2PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:10:2b0::7)
 by DU0PR08MB9485.eurprd08.prod.outlook.com (2603:10a6:10:42e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 03:31:37 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::f5) by DU2PR04CA0152.outlook.office365.com
 (2603:10a6:10:2b0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:37 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:36 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:32 +0000
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
X-Inumbo-ID: 0b0afe8b-2a70-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BHd3v98F/ipf2sT9NsZUumCVVyyXFr5C7EGbHuwqbHMz4kKWwd1Ifl72BKzUmGVV8KInScXqmR78Knha0caaXL+soHx0Je1SjX2Ob9HvcI+ys5TLeBqFk5YcM7+w+dY41SE7tYSPhFMKTOZI2v3CtwfydSKtKNLEKF44WeyKuVZjA7fPeUmmDj2dYfJcvqZBUn4lX7rR7jfQbshDcXglYBAnIepvJLmowT1wTaq66ut1Yn/Qjic+rDtGVxYU4jzJpCXMBSqz50EUccTTJYqBDLuhHBH6j+KTaaGCkiTRmFVYwGIGcKRPCcDas3x9vXhPVmQkjFZvIXYdgoLJqFOB3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VAVx52p6Yh/LWjBjGGqSO3vbeOOd24PcskvC7LHRjs=;
 b=Q5aAhu0jbExBDIticqNp/Q4WB0jL2Z1hsoTUnSMDIIRBoOoyAc1bRyZncvE8l+12AMq7w8yqW9YWY2VYaQbsejObYImrmogP2rNNFtxFtkwmiwmNSbgC2Qcqd2NdUEpKM+K9Ep7n/MlQ1xKlreVgPkhi/RIrCPhmMM8s0Q3o417xnrHXQQZx6BudnXFJEdAMpipzrCnepfcflXHVKxBO276Rur9lqNc8hjur3EYrmi1jKzp/KnWSRgp84B2RwE0aQ94yDNZaaj79tH7sR7XreH1P9ynPXWPfvQEsDDcjKIoesER61ZaUluONnohInJNycwJSmEbMwNlJg7PFPBGkVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VAVx52p6Yh/LWjBjGGqSO3vbeOOd24PcskvC7LHRjs=;
 b=b1V/Equoqm5DnJbJKTmmH9cbdtT5d+qupnpoyuTnYh//qAfWikZFeNZRA46BjZXxx0xMCPQxnFnysFHjTukGp+kbrONMNsKhoKaik5IN0saMg8R9ZepOTuBOVc6xxiBJ1ccqud0ATMkKqs0Pqu+JW/OOPs1+CsQePMWZPHrZUl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a70ef03438a3fe76
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcx7COpjreTj92MH7V37Nk46FR040gFrHtjyg5gSGMh7ToB0uMUWqlsSfbGk2P8ovdsPypBcSQmeUnhHf1RIm41cvVOg/PLokpDkrczLkQHD0zgCLudLMkz8cJnM2US+LmwDxRxcGQAewmxuRd2DJyYjemvK1skbY7shX1z2lpYQtF+TqL2Cj9s9N9uulLivJgJyr6Ls5eFHDMz2UVKgE5j0nd737nNcRxlMVWpHVB4g+5wB/vL9WDwjIKUS02gtHqQGdrM8tk6arAGlfJuSGPBe86U3OlF2YCed9hv3HXT5bGcLSRKMSkFjBRCU0QlvZMtlu4H8d2cMvI1fJ+ViJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VAVx52p6Yh/LWjBjGGqSO3vbeOOd24PcskvC7LHRjs=;
 b=bzRNfXAlXndlY2BsGY5fu3/YtHa4TrLfvFSflpI77lRFUb2jh44BoenmQZW9DwEu14v8JLbUuxKelQxv65nShLz41F25r35GLGIibA1LzKU/X2+Y12oFbgWiqi3EXnfxi0bM2KSN03xT9Yv7H4FpzTpxXnhus/KB1VBftKo+gnZcHjrftkvNMEXYgw+HhPfBKqcKrokfwwMF3wv2Zs4poYeouiFmfwjRPahRw2udkiEXFsTWR/g5kq+M6awrjVIybPESob5ptTvbtjsnuyGnJGFdHZXuQVXY34ztE9LX3T0SQm2zNXJNa4H8HQ3IwVSxtxwzLD4TjH9Ug5McTjDacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VAVx52p6Yh/LWjBjGGqSO3vbeOOd24PcskvC7LHRjs=;
 b=b1V/Equoqm5DnJbJKTmmH9cbdtT5d+qupnpoyuTnYh//qAfWikZFeNZRA46BjZXxx0xMCPQxnFnysFHjTukGp+kbrONMNsKhoKaik5IN0saMg8R9ZepOTuBOVc6xxiBJ1ccqud0ATMkKqs0Pqu+JW/OOPs1+CsQePMWZPHrZUl4=
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
Subject: [PATCH v4 0/6] Device tree based NUMA support for Arm - Part#2
Date: Fri, 2 Sep 2022 11:31:15 +0800
Message-ID: <20220902033121.540328-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 08a6fd14-1fe5-480c-8633-08da8c93e93d
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9485:EE_|DBAEUR03FT013:EE_|PAVPR08MB9842:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kO7uM++LGD32DzGHPQTJ3umSHZem21fHIPBB+aL3nVbnNpo5Su6wcVC0FIy8j1E5gKi69psmIR+S3CdSpyx68R7tWy/ZqpngDcTqoWC8T/yqggGxv/pnDb9jmrbBF9Zk9OSjcV3ZVFNlun1zFFdXiEIxrwAoBzW765S97hbPqk8XsQTqQI8ygjeN44FJvfAGyJ31x4W7RBZmwvhhppecE7iZaqAlJoF6c/OyOwFCpektoAjvIExmEYF+OzcAX5I1X5bpKE0N+N8iTEomHAp9QjwNyLrTfcF+kCp6uJ2pJEhiq+cGxJiwZOHioi9pGGQHMlOdnn4mJQ9TItPtWEE6wqEuIeMtK3qG9m8q8CZcBg60hQKX0xWHEMoDStzl0O8R2Dy6M2GB46f6a3iumGlWHOgaFcDYEtNMPMA1kpcvVgFGE5Pecf3+9wbMVnAwZfDmglMHDOYtqjyrZWJp/0HNZs5JAlwR2/gExZKCT+JoYA0Z5rVai5sIO8KJb6FDj2sLzewCAmuQ6+bJCA3fAy1utYrCKHMYq2d8YQMADfqJTfVSG6SVnOnNGDWp3Vy7Ckj94AoTchPNA4DMRwYJfvyHaTYyPfj5hAlY40EKAhQ40fqkOWFIUtBipGygcL37aR+dM4O1ANU5+2W4HNjY39cnYYMke/5pOKplfzvafok7edSDYJSPADBNxV2Bf14MXXOo3A0LU9vpr9xZBIu0F+Vzk+Wr2/TlO9W1O7BeGrUxEMkUmo3SO0utUmYNnnnnS1ALJ5ur2/0O951fGZnMLdWxQCdnFsE4BG0a2YEOCtqbbHAzPDC7NU5H4nStlIhLEYYrWqJfFvSTT6XtQcdVkRCrGlDyd34rvJCN1mYYROq6zZvxQ4NsPzLWTG7Qe6lAgVz6
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(82740400003)(478600001)(40460700003)(40480700001)(1076003)(36756003)(186003)(44832011)(36860700001)(966005)(2616005)(5660300002)(8936002)(2906002)(316002)(6916009)(54906003)(86362001)(70206006)(70586007)(81166007)(356005)(4326008)(8676002)(47076005)(6666004)(26005)(426003)(336012)(83380400001)(7696005)(82310400005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9485
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f93732fb-5f5b-4407-ec6a-08da8c93a4be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1g3JVWF5p27VWimiFUgqJI8Gzzp9CqZx7XLjNo7MjjTF5tEdTdhOedgraIK0AQpE02BNbHAOLkR94MUZRdtmLHT7Xa+uZ6lyvsHGhoHJgDfSq2VJxP1Ss7qsPIStVBOrFXgpruXB6Nv81zt0EDCMbOiOidG8Cmrpx6s61h3cnbfPenk/3bmycM15nag8eFp33hpzKJlgmNze7dTTBpcw5t9C2l+WTWS34JaityFcfWWQUCMP7A9ZWtOSKSTYb5womrkIbVmHd91695SUatOsHG3hYXBWAUghMxJPm0KTLNJdJh6YQkjgrsuKcuFNLnmlqgJPLXiSipQ6L6X3xp+J0f2dz3bDRNFw3MsuLNA7v6UJjswC2DJJmBNoxdYcozY+DAQ04jUzP0dYE0FecGeOLg/LTcL6/Y07fDzNLZRWYDYhvwOADZRHmhob06OrtnOxOUNQ9z+iHQb3aavFDtM/9vCVFGIxZhpLCCDcQGBEDRrug4tf1YAQ48S2H6epHxyaUfOZGVcjpivLRa/PCwmlKAqapYF61jGeQFeRQsra1Ru1uWC75CwiMmipdfS9NBVFBzlIFRI/wWrC/KV2Y4zUXMHUOZA8TToPa2rBurtZqWeY/MjBu+Y73vTQaowDQu3mHn067laU2U1EUyWW1TwhSMnOanBqI9/hMA7HV5Cc5ihgrOcDSv/dU21JP+XgQXIT+vpdbHJx740ZEtxUGUrxZ2678T0jFH5ffsamahzz16FOKPTV6HiUu3GwWXalfDJfy5SPHBcTrcToDPWfhJjpV7kaB9MS+b5zTrmse+DZhIGt3w336ZISBl+3u972kNkrqrbKyNXMjjggJm3Tn8WT8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(8936002)(40480700001)(82310400005)(81166007)(54906003)(1076003)(26005)(316002)(36756003)(6916009)(82740400003)(41300700001)(2906002)(4326008)(7696005)(8676002)(70206006)(40460700003)(966005)(107886003)(426003)(478600001)(83380400001)(336012)(47076005)(86362001)(70586007)(6666004)(36860700001)(186003)(5660300002)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:33:32.7394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a6fd14-1fe5-480c-8633-08da8c93e93d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v3)

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
v3 -> v4:
 1. Add init_as_disable as arch_numa_disabled parameter in the patche
    where use it.
 2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
 3. Restore compute_hash_shift's return value to int.
 4. Remove unnecessary parentheses for macros.
 5. Use unsigned int for proper variables.
 6. Fix some code-style.
 7. Move arch_get_ram_range function comment to header file.
 8. Use bool for found, and add a new "err" for the return
    value of arch_get_ram_range.
 9. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
10. Use bool as return value for functions that only return
    0/1 or 0/-EINVAL.
11. Move mem_hotplug to a proper place in mm.h
12. Remove useless "size" in numa_scan_nodes.
13. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
    between node id and architectural node id (fw node id).

v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

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

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA scan nodes codes from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 438 +-----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 311 ++-----------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 759 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/drivers/acpi/Kconfig         |   1 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  97 +++-
 15 files changed, 917 insertions(+), 775 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


