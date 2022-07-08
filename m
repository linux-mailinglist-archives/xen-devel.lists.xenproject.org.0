Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3F56BBF1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363468.594011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pO0-0006xR-DZ; Fri, 08 Jul 2022 14:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363468.594011; Fri, 08 Jul 2022 14:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pO0-0006vJ-Ad; Fri, 08 Jul 2022 14:55:16 +0000
Received: by outflank-mailman (input) for mailman id 363468;
 Fri, 08 Jul 2022 14:55:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EO41=XN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o9pNy-0006vD-GK
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:55:14 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f78601f9-fecd-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:55:12 +0200 (CEST)
Received: from AM5PR0402CA0013.eurprd04.prod.outlook.com
 (2603:10a6:203:90::23) by PR2PR08MB4713.eurprd08.prod.outlook.com
 (2603:10a6:101:22::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 14:55:10 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::88) by AM5PR0402CA0013.outlook.office365.com
 (2603:10a6:203:90::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 14:55:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:55:09 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Fri, 08 Jul 2022 14:55:09 +0000
Received: from 86cda3d7a080.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17BC7FDF-488F-4B5D-8CA7-89AFB57836DB.1; 
 Fri, 08 Jul 2022 14:55:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86cda3d7a080.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 14:55:03 +0000
Received: from DB6PR0501CA0004.eurprd05.prod.outlook.com (2603:10a6:4:8f::14)
 by AM6PR08MB5287.eurprd08.prod.outlook.com (2603:10a6:20b:b0::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 8 Jul
 2022 14:54:59 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::e0) by DB6PR0501CA0004.outlook.office365.com
 (2603:10a6:4:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Fri, 8 Jul 2022 14:54:58 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 14:54:58 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 8 Jul 2022
 14:54:57 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 8 Jul 2022 14:54:55 +0000
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
X-Inumbo-ID: f78601f9-fecd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dj1O6EmXJOY+M8DnRPih7/dBxbFEv5B3XYg7ujizs2fjCIqtb3LnzdsSVemnfBzHL6Yi9CNL0niHVaEiQ+zA0C12VO9rQuHFxSPA/ZuVGtyVuXp2mRxW9Ju8q54UcZspvolWq0128s3FTHI8h9SMHc2Nx4gUvcbIVfj/z4B9cqO8gpt+zZeXt87qPsEnwU4UjbDpc1MCg+t8rm7VGZdApPaRokMII/U1TWvck73DoZNckrbYotVa8tdNbrq7Aukg3Gd83cCClLuCY8bq3dBQEUpldNWr7k2rgwY6Yjf2/iUnaRazm5GOnv0n8YcbSImhwdqrJ9pW/k2SKS7h3UM3pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj9rrheaoXEduUj4KYU6olJZRmwgTRCWkOezbyAQ/9k=;
 b=CdX08dIF1t+OzPMGHOfbdHfGyX/WB7XI0H7VPs4LGHzao3EgfdIgDO6GhyIN2Gx+f9HPOmwWhTaGCsgnpZFGcmI4/1N51NXElhNFFyVHqJWu6xWL285IFEbvy2AdD4oD1rj9bDdn+YjhHGon6nVMmwppwldtJwmOSOXX0THTAZtx/hJAtg51P9FD87xXeHb1ZCP99npRwUCLSwPE5PNf9es0jFIGq1AM2OhXNemFEtS1S/ga/c0FHIIfpgS6+M++BAOgzsmuljOdqGRSb8ElRnQ1rmyw/5TV++tfbgj7bTA4227KQAYQH+3s9BKdEg4pUGP4wLtFrXTrm7yIAHVkDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj9rrheaoXEduUj4KYU6olJZRmwgTRCWkOezbyAQ/9k=;
 b=NzhRyH8M8/Vk6H1saVsVIb3/LqOXl/CumRIz7VuSLwYeVM8hr4J8MgOUKPsHWpRImRbtVxMFcQ/aOTZuuK0ML38lcRO87fA2flpfW8+u4NWq6kOSXrm0GOUJHYoXjQpHIY9GOhpiGxaQl5duugOhvFeolgFPXcCjxSVW5xOgYnU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9e61ec64daefca6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i91Ow+/rBOw/ykikzC2hBDM1oCRvJLjx8E75C5oujeboLGSPZgbBDME85Bf5+FWUNy5ZhStPmt/dkaboWmymo7kbXycsUyZrQspZJkHch4r2vjKtpls0qwgmDgLIEOyX2U64r8ojQCuhFiL5L/fITZbLyfSo5asO4Ts1qThQKm5omcq8ur9GJJzpgWjul0MsRebxRa3kIigs7iQAfCefrw4/BA3b9UDZpgjTUkjpt1h9AJc4CfyLk7cx9KWvRJ8hS7h0gM5R+BDFbzC+UBvOYbBqEphPg0IIGtcjkHjkH4ORnlbTvRdsZesPV0zWoljb3I7zWN531iPG9j0iZ0uBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj9rrheaoXEduUj4KYU6olJZRmwgTRCWkOezbyAQ/9k=;
 b=cJkgh39BvCfHn8c5CfEkcNtG850YgYxJZ2tkMVEX8ZaTeA+CHiNEi3lV16c7aVV2EaW1BdjnFpiCzAJ/EC3TIZ5DJYim3vNXO/QEW/195eq9KTPusszT+igTLZPiAji9XBDYYuvUkb7EvN7fgApXfInFShY1Sxq2vbAg2w5HQU8R9olgdPqq5vqTiZSDbUsNmk4B/vvwtjFTN7iS97/93nrp/NgCP9+tLCNKjH5QBKcE9WKogr+yNSQx3t2MIUgx7MY+hAgnbZiGTol6y/QrfIl2lHanG1/y11HQl+0Xh4uYjVbibMD1DgDryFcwHnlg4qXu9Omc8J4WwqnswoRygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj9rrheaoXEduUj4KYU6olJZRmwgTRCWkOezbyAQ/9k=;
 b=NzhRyH8M8/Vk6H1saVsVIb3/LqOXl/CumRIz7VuSLwYeVM8hr4J8MgOUKPsHWpRImRbtVxMFcQ/aOTZuuK0ML38lcRO87fA2flpfW8+u4NWq6kOSXrm0GOUJHYoXjQpHIY9GOhpiGxaQl5duugOhvFeolgFPXcCjxSVW5xOgYnU=
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
Subject: [PATCH v2 1/9] xen/x86: introduce a helper to update memory hotplug end
Date: Fri, 8 Jul 2022 22:54:16 +0800
Message-ID: <20220708145424.1848572-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708145424.1848572-1-wei.chen@arm.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cf32518d-7d79-4408-aa33-08da60f1da9f
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB5287:EE_|AM5EUR03FT044:EE_|PR2PR08MB4713:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hveMIibSlmdUxpZQdFdSN1ID2n8hbNQCFqZxX7sIfjxj2bHHTlTYoVKCNOeHDAxxJhhvT7Sm74hjBBpPgVmNoY6klyq1Qy1pKsuYqYyEsFVvPsPyBr9bKtZiURzXC4nw1NNQH5C5QKGOQMNAZ4rH1LqcTrofYJbRjBInDqGN7guetAMSiQutWO5/ATu7ffZgIqZ6zmt4vHtSr60zQJx74a2DqhdKe/ML9rNg1tR+o3bGlbgR8P7Pob93nT8Se+Onib1hs42F62yf/plBIUJf5uO0NbkKuqFu0Un6WDSoJOw+AMemXIpuZCoGz5qMxLJKmok07+hal5P8WR5MJhaOM9h2VaPh4R9MTmfPXgFGDOGmytRL5N72ZleMUBGM4JgiyedXIOIjnNejGsopd+LOUKZy7ONenIHyN476ItB/vOALkHKOKo5GSQ8RIMz2vp9yv8NwHAGH5yV7+wcXepSZ/PwVqYw5YjupHZabwgSIAVO9PUgIfe7ohO61k+m1FSTDbwWOKHUeOBdyJN9ekxY7tb5cFMOzWvCXFSzAzDM6cdbTfUloVSwGXyqOhu2R+NrfCCDNliieRCfH3K+21EsfJVhYrouFTGycUSUHAAA3Kz8BYsdQ7NOM3+UVXnvBPncmfgYkyxAku5L0PC8BbtmPunoEJIBxBRPY2IJiLykrrUekUOzawLoPyj/Z0rCcP0j5EsCXqT0p1+4Jre3hAcyd2MPNRmR8YBsDO6tjkFE4fpt3+WoaJ1eY8mULarMz2p3eCDTxqwOXrqbE6BD8VDOgTzvKJVvw/dLPXc/9/Y+EKpODAyeOp6IQGLUzemh2LVdNU5FuaMER1MDgRq0Tf2WTXF1ih5dRce1nTIek2NUGaUQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(36860700001)(26005)(86362001)(81166007)(40460700003)(4326008)(70586007)(70206006)(356005)(54906003)(6916009)(40480700001)(316002)(82740400003)(2906002)(8676002)(47076005)(44832011)(426003)(186003)(1076003)(83380400001)(2616005)(15650500001)(336012)(478600001)(7696005)(82310400005)(41300700001)(6666004)(8936002)(36756003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5287
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01af82af-140f-44be-6046-08da60f1d3ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BFApOGkIxE6e4bK+H+FFgbS8NQCW8tQma9WkcikPtffSLzpgQoHbSty+nzzXPhE0HpyUzDNqIkTrT9N6B8thExrl+b3giQ37JZwK5IPwv4vabx/xrcSuBUmiqWd2nmzpLG24chuFbqIa0EgNMv8KUy5W7EqMEAPnviyWfc80pwa4ONN0UIAhjyCF5LWqNAbmu1i+z63W9ZDAx7Z2AKh7RwkWxsSE9sR1l/e+0x9838BRQouFsmMbrnS27XY6YdXvQUMCr8vTg1+3ExhsuDFGVT1JbLSZCDT1Nd9zmmpGXoVrfad36u+g6K2w8azCjyulAoK7zhmFojB3KUYVLxYmWUkl9sDM53gjCp97NutaQ0Ny92HIDcQfinZFpvfpPbZk7PhlUA1VU2xmKVKz6I6tiCYPgA/el3qi28PudjVv7jP4sUIiq/1uw1U1GCdACxLiRGPFNSbovvwCtqStCLltXDIaM0eLYzmn7ITdAuGfp8y3k8v4ftnAD+w2VniJLxzDW8/EmXblKSPStTYMF3OLJBCVxsxDw8Zb23lDSOdAqUWBxVOMh9eBHcQGOrvzMrlaitZBRzHqhci7V6cR584QtxV4He6iWeOjBcYIXyCv4PsC0Cf+FUtl7xu1knr4woCd73tVAweQwXTTSMRHiSLUgXyBlJ4n7wwmQJ1dR0KOP4n5OX6MfAoCwbrkwzykpJq2Y6iJ4C1hpX5y1EHRnc3fq9sjeyxNAgQp5jsf2eOyVQVxe9PEgW0rwolL+K6lF/kyQr/DavUk65mssngViy3GvE3vOfDj1GcNYkMXQza/4BZQwaC/EVvzSpg6E9sjvZm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(36840700001)(40470700004)(54906003)(2616005)(83380400001)(186003)(1076003)(47076005)(40480700001)(316002)(6916009)(426003)(8676002)(70206006)(336012)(36756003)(4326008)(70586007)(86362001)(82310400005)(478600001)(81166007)(44832011)(40460700003)(7696005)(8936002)(82740400003)(5660300002)(2906002)(6666004)(15650500001)(41300700001)(36860700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 14:55:09.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf32518d-7d79-4408-aa33-08da60f1da9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4713

x86 provides a mem_hotplug variable to maintain the memory hotplug
end address. We want to move some codes from x86 to common, so that
it can be reused by other architectures. But not all architectures
have supported memory hotplug. So in this patch, we introduce this
helper to replace mem_hotplug direct access in these codes. This
will give the ability of stubbing this helper to those architectures
without memory hotplug support.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Refine the commit message.
2. Merge v1 patch#9,10 into one patch. Introduce the new functions
   in the same patch that this patch will be used first time.
3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
   in this case, we can drop mem_hotplug_boundary.
---
 xen/arch/x86/include/asm/mm.h | 6 ++++++
 xen/arch/x86/srat.c           | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 07b59c982b..b3dfbdb52b 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -476,6 +476,12 @@ static inline int get_page_and_type(struct page_info *page,
 
 extern paddr_t mem_hotplug;
 
+static inline void mem_hotplug_update_boundary(paddr_t end)
+{
+    if ( end > mem_hotplug )
+        mem_hotplug = end;
+}
+
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index b62a152911..f53431f5e8 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -418,8 +418,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	memblk_nodeid[num_node_memblks] = node;
 	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
 		__set_bit(num_node_memblks, memblk_hotplug);
-		if (end > mem_hotplug)
-			mem_hotplug = end;
+		mem_hotplug_update_boundary(end);
 	}
 	num_node_memblks++;
 }
-- 
2.25.1


