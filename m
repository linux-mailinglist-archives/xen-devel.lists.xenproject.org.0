Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE5619432
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437422.691810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcl-0002UU-MM; Fri, 04 Nov 2022 10:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437422.691810; Fri, 04 Nov 2022 10:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcl-0002SG-J8; Fri, 04 Nov 2022 10:08:31 +0000
Received: by outflank-mailman (input) for mailman id 437422;
 Fri, 04 Nov 2022 10:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtck-0001vd-01
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:30 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09b4265-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:28 +0100 (CET)
Received: from AS9PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:48b::6)
 by AM9PR08MB6228.eurprd08.prod.outlook.com (2603:10a6:20b:281::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:25 +0000
Received: from VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::a4) by AS9PR04CA0082.outlook.office365.com
 (2603:10a6:20b:48b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT044.mail.protection.outlook.com (100.127.144.96) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:25 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 04 Nov 2022 10:08:24 +0000
Received: from a8366c43495b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E23B5F10-A394-4F13-BA05-81FAF60814B2.1; 
 Fri, 04 Nov 2022 10:08:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8366c43495b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:17 +0000
Received: from DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) by GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 10:08:14 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::cf) by DUZPR01CA0048.outlook.office365.com
 (2603:10a6:10:469::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:14 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:11 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:09 +0000
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
X-Inumbo-ID: a09b4265-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FjX6YFn4xc/Td7GImH03KebydO2lw/Wrig0M+qT+aA9qnSGjTmaawSNv0m0Doeb3jMksV3RCJSueE1ohbJXdCvUW+vKu7EGW4TARM53VK61XSQDsr7Dd1GmKbQkwwZ63L8Q53NzB+Jvid9dVj078+NK6ETZsISd0kDhRnqTd4O8U99NCaB4Rz7My0eWfH2ahudWnJ7Nw3t0rMalxtLYNqpOWEUFzePCCUcv/gkNd3Azep/zcFCGW/NSHYRuCHL7ayUusiT7qg/8dBZECvlpO/Dm6nuXGy4CqQ1jWhRL3LXw7jMyb9eC7Ksj6msJuZgAaeNQ0LPZQDV75baq+0OQBhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reeaGX3EiLTIfCDe2q9RPtUHzXscDNeSvv8TUOZS8iM=;
 b=KKxYlS+KN/ff30NLgqizaUO3WWfXj6/CfwfUJ9NeDNkQtWIkMYWAgCZ035GUJfjTIkHam+X/saCC/dTCLVyPldodP/DmHR1j4p/QgvwVLvBMf+de12QjtEI+Ls3uxAYgMDGZtsPYuCATZ71M4el9AcCvYRnCk1DB8CPC3pLSfpvlS42axfaI7E/hKCKYk8KIWq8/ZMuL7E5oK+rBctXi3rsv/6NPiGBcGfvd7Up6UDP7dEdXYKvioH1rsIjKCIif2/nAmFgV4xecwFQeF7vfxkooIP+wQskuDgF5jUoCmgG+DWofFoXheCR7uxVZ1XjD3qfBtFHNmb+pZCHVi1ld8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reeaGX3EiLTIfCDe2q9RPtUHzXscDNeSvv8TUOZS8iM=;
 b=n4+bIqiG3ev8yXXFutTOt6ETwqAxtszi+UoACwLzQdeZqNOtN7SIyEzqdYl0RRMG3c7T6sUCRyy7li4OvKs4oczwBxkf/Vum9JV97pkzNWEblbRCr4XKaV+5yDFOkt/PpdD1nf0aQLFVkPfwCAALtZYIG+rNL0vm8hXVGf1R+DI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9604aab51f58af20
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QryrmDIHPerhyhj81+cEwRBX00PuMHDxNJRZlPJIJfFLgwxrGuC4OzssXzB5Yvn1j06YY2lNa2zRTYZAtEpYYPOK5CCLFzYVhi+nqO68Xyf9u8vMRQWlUHvYqGvxYFnBHkD1UhiBXB1PnhfnmDl8mCecHs38s72TVfPkLzj2b/gl1l1+edpURBEV0AvDpHA11ilUIB0ZH0D9udpF5hiHCZdYwWnZSEbw3u/6H484eboMI6ZYpaKoyKQq2myVO6V/WJsPdXR4K6iMGwVd86mH4NtwUaN0ThSF8PEvsacInvnFlfpkht1uAza1gnE2On+McjmaNgoVshVu+2DzCGXBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reeaGX3EiLTIfCDe2q9RPtUHzXscDNeSvv8TUOZS8iM=;
 b=RBTN2rQOqqOUo7eH7Skc3laky9AOMjCIPOWA3OBhlgATm5SOko1en7YhCzXywcrzsC26c4yzral8RInv2BD7B94EK6OTtKluMLFpuXIkJEYoh5oFCI94GEctg3LV9BoWC+c9VWiVjLTY6LzK6cCYnJfLxb4B4RPghPdK7HNfnpJS0wTZJmKU5zf+1d+3DT5ZBpNq6upGSk7NTmeGIPCCVrZi8M0EQt6MHXxYlOp6vMfJ5Vss5Hz5G67aATu5sTvieLpbwsu+to/r5iTQMeKn4d70Q6C6mCImvWW/isOCPElM+T843hXaNiSYPrdCDB6J+o5B6tneUh0k1lD756BMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reeaGX3EiLTIfCDe2q9RPtUHzXscDNeSvv8TUOZS8iM=;
 b=n4+bIqiG3ev8yXXFutTOt6ETwqAxtszi+UoACwLzQdeZqNOtN7SIyEzqdYl0RRMG3c7T6sUCRyy7li4OvKs4oczwBxkf/Vum9JV97pkzNWEblbRCr4XKaV+5yDFOkt/PpdD1nf0aQLFVkPfwCAALtZYIG+rNL0vm8hXVGf1R+DI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 01/11] xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
Date: Fri, 4 Nov 2022 18:07:31 +0800
Message-ID: <20221104100741.2176307-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT061:EE_|GV2PR08MB8121:EE_|VI1EUR03FT044:EE_|AM9PR08MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f472e3f-3336-4640-d16b-08dabe4c831b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Cn3NFNZE7IuUWzWayiPfjCJucr+1gvi0ZqxZuFZ82eaXOb7N6MCTeEXEHT/2tHVGaoytRVSgottPyI8XFzez3iplRvQm52npF2NkUZXa3SGnB9zhubs6oc18iA7hxBPY5zn5ZTczmQZ+hcJkvkQprPNlkQRCv0UygeTw3vqJ+vPI8sXreh3GePZ9aRFdaZvn7mg4uzCJjWCQFOZqWBqFqZSyFZQYehbdIpqQe29p1vLamf+C0BdXGR8NVF76TQRWX5rDEkUqyDo4e1FbX68BPakFEAF8lKSoVeqEz9rNG3DYrAu1ZsIcnNBNPiohdueaV2qPA4bOLUrEaU5TAxK+3qAZKk/Yqyb0eKDljkTJQqcDIaU4Kf9J0rB45kVdA5foMMhTB9Ehhmx3ikgvgf8N7kdLaYPMtS8z24bgoUAzm/snfQVvOtLjxnIC4g65JxoU4UQFZ7BuLesw7uJyLT7KXWyqtvLJSk58gjEcJMJXI+R0bbJoB0dJIb9cdr/c82kmwSEvgfSmWZ58vR10iH2PSX1mGVnkTpjrG+Z3aCZp2YY2DO+ZpkwudBaZRiBiWsebbBdQaWbUWGrZY3RxnO/vCUIZaUGdpkdfA6XEwZfDUu6+FIDPf7c/2AWxHy0Lvmuw22KZL6WK6aLeB3QAMWQ/NGywNLotpyErn09xvqKHHj4BbxoJftp7lwuvsvk7qXX4Sd7Bp7OoHp5MtpETv5YIWQV73z5FwVtjJRXW3hT/rl7VhmyRTi5CooN9TZoWdGyq7Eff0DPZXgLyj/4+IdQjHsyAj8w95mjidwc1/Yc9joYtVVrWr/ORg673TcTc+sW2
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(44832011)(4744005)(36860700001)(8676002)(6666004)(7696005)(2616005)(40480700001)(47076005)(36756003)(26005)(2906002)(86362001)(4326008)(40460700003)(336012)(82740400003)(478600001)(186003)(426003)(83380400001)(1076003)(356005)(316002)(70586007)(70206006)(8936002)(54906003)(41300700001)(82310400005)(6916009)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8121
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c91730ec-9a8f-466b-3e98-08dabe4c7ce3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QWRnNANmZNlm7n4CmmgB79XA+2jmMrjfINuwtIlX0JUbpzK3Y3LAeRPo/S+YQDdYy1vnf6roXzNebR1835vno+p/XEz+eTxRPZvJw12BgkQ8S2CNmPIiGrJUMmBVl/AzZfmsH/7CwSoNXGcUozFPH8ABWkBYK8gcmd9OZq5/GPyPqWXDZiHEgeojL+fJzrEfHBWM8+uK8BkOQexTqJgF+A9tefTMRTJBD8faJo9VEFLrUSiGr4j7zO3OgY37zV5oYJ7YR2slEnsupzixXuxJd9vUFhexCS6AcP25bwxcV1Kqw+UI4966RlifnOcwZJLela+MKzuwtf1BeteoCGo1zQUaZ5ZSwmUZssQThJd4eDou+Dp6agQL5YaTGGpuyF8PX7CgtY1fRXrI38bDNRZHg97id4RhMA2xHD+vzUJikICrcEmxsMBrou3OA2G8R5IANYYnP5Sh6qsge78TRjZgO09DUNngXNoArGX0Oepu6z50wIPCxdxKiFZpX+gsxR/umW8mS6AY7Vwns9MyjJ+ssdFcx8OdysvHJLrD0ja4uCyNMM+Mk8za5HQu6QG+9F4/7JX03gTukteBUNbqi0ao2Wu27nUBq7CadvKWnsYZWskyZ4JnCUBIv/ro/l+P6jKBcFX3Z02ERREi3FPoh7iFC0CPLvJryhUZLEoRuMkT9yB3ILSXwYLO9EpuZq+KL4sQyoGz3U4aIgXbqxxogzi+I3rNbYn/JMHdF/w5uSwWF5QY3N6s0lK9qtwwmteyXQ71Q4Xvab9AFch2KmVfqf1U8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(47076005)(2906002)(426003)(8676002)(86362001)(40480700001)(40460700003)(36756003)(4326008)(70586007)(70206006)(26005)(81166007)(41300700001)(82310400005)(36860700001)(82740400003)(316002)(2616005)(5660300002)(44832011)(186003)(6666004)(8936002)(336012)(1076003)(4744005)(54906003)(107886003)(6916009)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:25.1839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f472e3f-3336-4640-d16b-08dabe4c831b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6228

These two variables are stale variables, they only have declarations
in config.h, they don't have any definition and no any code is using
these two variables. So in this patch, we remove them from config.h.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/config.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8a..25a625ff08 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -172,8 +172,6 @@
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
 #ifndef __ASSEMBLY__
-extern unsigned long xen_phys_start;
-extern unsigned long xenheap_phys_end;
 extern unsigned long frametable_virt_end;
 #endif
 
-- 
2.25.1


