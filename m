Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B72B3F1E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 09:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27758.56344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keaEq-0007nH-SV; Mon, 16 Nov 2020 08:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27758.56344; Mon, 16 Nov 2020 08:51:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keaEq-0007mr-PM; Mon, 16 Nov 2020 08:51:52 +0000
Received: by outflank-mailman (input) for mailman id 27758;
 Mon, 16 Nov 2020 08:51:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0FBZ=EW=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1keaEo-0007mk-VR
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:51:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d3e3575-4a59-497e-b464-98d8362d9b68;
 Mon, 16 Nov 2020 08:51:48 +0000 (UTC)
Received: from AM6P194CA0108.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::49)
 by AM4PR08MB2916.eurprd08.prod.outlook.com (2603:10a6:205:e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Mon, 16 Nov
 2020 08:51:44 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::21) by AM6P194CA0108.outlook.office365.com
 (2603:10a6:209:8f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 08:51:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 08:51:43 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Mon, 16 Nov 2020 08:51:42 +0000
Received: from e7f3bd0cd432.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAA221A0-2594-49A6-ADEC-E6205D5C1EB3.1; 
 Mon, 16 Nov 2020 08:51:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7f3bd0cd432.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Nov 2020 08:51:37 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM9PR08MB6275.eurprd08.prod.outlook.com (2603:10a6:20b:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:51:34 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0FBZ=EW=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1keaEo-0007mk-VR
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 08:51:51 +0000
X-Inumbo-ID: 3d3e3575-4a59-497e-b464-98d8362d9b68
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d3e3575-4a59-497e-b464-98d8362d9b68;
	Mon, 16 Nov 2020 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKYmLKYqGdZEvOq1i3pLAf2axgJ8kBGRgy5gWw0tUmw=;
 b=q/M0NJkCnqbjVj3Zj7AFyuOGTrW1r49D9bLFRi/jp2Yj6lqFJZHKHKRI5o+hzIM5AOOY/vnv65LjGbuhRPhbyYc+H8lTl69l6hcbm7F1omgj8XtOs8Zu9wxxb3lpTKMzqcg4RCYhqdxFGF33fxSC0zHJ6mXT9ZDnUCWGGksYOYY=
Received: from AM6P194CA0108.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::49)
 by AM4PR08MB2916.eurprd08.prod.outlook.com (2603:10a6:205:e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Mon, 16 Nov
 2020 08:51:44 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::21) by AM6P194CA0108.outlook.office365.com
 (2603:10a6:209:8f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 08:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 08:51:43 +0000
Received: ("Tessian outbound 814be617737e:v71"); Mon, 16 Nov 2020 08:51:42 +0000
X-CR-MTA-TID: 64aa7808
Received: from e7f3bd0cd432.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BAA221A0-2594-49A6-ADEC-E6205D5C1EB3.1;
	Mon, 16 Nov 2020 08:51:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7f3bd0cd432.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Nov 2020 08:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3I5X7xqGO+jMVDFItbXX6bROZ5rKC4Z3wz7RGJZGRqQkF8HOWSpdgUwWRq6hkrrsnnG+G3VKtF9qnaWQkztBlxn82+8LshJpiXooB5yhQHGKJ8YZkxhPuAITST4crVBBssBV/Oq2yxXQ7HjtVqyb6LM7jhXIS472bhcpS7uTdM/NU3zzMSjD2wEyxjap/hTt946iK8ztOPMbZUWii8kcwV4ItdB0eKMoRlUXGN+nIXkcdcRoAyY1d7prEqAVG/wvgLKEjBzcC6p/QOpqS2Z9mgN468cCEQs1hHWkjx5m9rO4QPDvzqD+KVEvmIXW5gs5b9AQqFml3bUJjgXUXU7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKYmLKYqGdZEvOq1i3pLAf2axgJ8kBGRgy5gWw0tUmw=;
 b=JEOoXo5qWVeUxZzrNxJQrzgkHAamhfMU9AKWjVl/HHWMuk8bcb2Gvv8/3ahT+QQ59JxJ/pPFmxtVyS5WXwf+kdX8b4gpLhDdj+8DvgMpyrVNBaGPTPa12FLlAg5pmVEWEW7bLLaP000gOSec7mgwNI69F22lXAvqAGqajEL6zRXKqkBTdi8Igy1Y9CONdSxZoiV690wngv6Bu1VQEJgt12vX4/CrgzdV85HUZUDyka7uV9VIi2bCIMP8Ac5DYv9pQC4dbUy4VO+lD61dDk2usMme1zhY1f+cpaNSl8n6HAhz6mVa0ZESMlFDDE7jg20c2tK/JSS8Qjgkq9a9MTAyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKYmLKYqGdZEvOq1i3pLAf2axgJ8kBGRgy5gWw0tUmw=;
 b=q/M0NJkCnqbjVj3Zj7AFyuOGTrW1r49D9bLFRi/jp2Yj6lqFJZHKHKRI5o+hzIM5AOOY/vnv65LjGbuhRPhbyYc+H8lTl69l6hcbm7F1omgj8XtOs8Zu9wxxb3lpTKMzqcg4RCYhqdxFGF33fxSC0zHJ6mXT9ZDnUCWGGksYOYY=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM9PR08MB6275.eurprd08.prod.outlook.com (2603:10a6:20b:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:51:34 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:51:34 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<Michal.Orzel@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
Thread-Index: AQHWu+mg+1214G0SPk6QUrcu7ikNvanKcouAgAAAzsA=
Date: Mon, 16 Nov 2020 08:51:34 +0000
Message-ID:
 <AM0PR08MB3747684AD1D674F3AB6FAE5F9EE30@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20201116072422.17400-1-michal.orzel@arm.com>
 <2F0882B0-7FBA-477C-88C2-FF0734E85F07@arm.com>
In-Reply-To: <2F0882B0-7FBA-477C-88C2-FF0734E85F07@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B95498B267D7BA44B5F7857EFA78283C.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d00c2b48-a0c8-4202-ec20-08d88a0cd789
x-ms-traffictypediagnostic: AM9PR08MB6275:|AM4PR08MB2916:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB291636CA7860A6DCA2EEC3E39EE30@AM4PR08MB2916.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VGISw3R5ea98JIQiF/1BI11UZ5m1l2qAivZkQtpwgEnUb8Sk37x2mKrXdozQElHVtdRGinxwy8MIfmfuHAU7+JdWJ6s2n6Oq6cL0ZZCceyx3aDlAyiy9jHubnhG4OTmStC7BLWeQaopUP5O0rdf8mBAXcVcMMjt9JHWs40sF9kHI/Anp5dOtORWoevUIDTJPbtbk4NsMdFk1cOGx6c2DCpmDR0ed7lBNpE3I/HzhpOKXoJRhTghaoCGixon2k/B7mwAUKcLzTShMSm4T1l1rFCWHod9aanAwEH7lmKoKv2UFNbIBllt6tRRQ4OZKBeME15xOEQaMLrGsoc0Jqe/FTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(66446008)(64756008)(66556008)(66476007)(66946007)(2906002)(76116006)(83380400001)(7696005)(186003)(53546011)(52536014)(5660300002)(33656002)(26005)(110136005)(54906003)(6506007)(316002)(8676002)(8936002)(55016002)(9686003)(71200400001)(86362001)(478600001)(6636002)(4326008)(19627235002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 L0WMfn4S5ELaTv0c8xhImjb4As27lCFOaTH7qZECAtSfsWs2hNx3vNgBJOolDlZedtPkNSf1dfRbJ1NEbCWupgri0HBrx3ExHJtS8zWRC7afS7VjgMOzslkn+LCNO27MZgkPKMzGtESdet1oEG3Wxaj9fb771OxRy79DmE2MIvHMyA+y2Aiu9rDU1cCTSsZCd1WyDSB9HWTRBpDeyUuzR6gCp8wwOgLIHYzxaM/OT2Ty8O7pDkbJqy/7tRVLL/J6WS5VeXSB2IXAqE6QD/qMvzfNi18lNG4J5aiP/9jKU4ucj+gD0m0C00AsGmElUb2GiKtm+wG591vFtpBnEWuiuCjGHW9FosbefsykswlFjiJy9qIbqb7areajCudezFF+/EfrAFCq8SbPClxW+bNBxLizQaabiAVfdHxeSwkTOMdpsZkfs+XbElNsIOBR9XLAORRWmL6jDMtxO/gCSls1sS1tzsa1v5ZiRdWylZiQ5fWOfYVzQ1bGcLE4vrR+VZs2ZdPqxnGTnO5XJNSh86zvqoDol7l7Vaq+geLPwH1xCmFNBK18a7VXmFFCTJo/DKJ3u+pytwETk3RPuvbLBPHeL2n7LAWsFjtnGIXHw6otzgw7hLVxl1eDMja/cJKoGxR47F26X5cQCUtVIf0ZVZi9OiKEQiraTV6dgdG7Wc63933BY+49nP2JC8KBfV423WoBYatbdPvDxRvgamd5AErIm+B/XP760aVaDOn3TG+h1RXtUwKyaDdhVg65WBqs8oJcc6QF0vtgmN4aHbNv0/xvOyWw2b7tmRHtO+ELgkLSEGoZB3AwvaIK52rAsAW4GkNWP04iEDxh5GLjXwxLbuwExmaOLYfF4lThQ91I4Cqmm79FKj72g/s5JrPXRw987m8zMH3NqZwoI3pEaS/nWw/Zuw==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6275
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1a4f990-472e-4c5e-1b42-08d88a0cd227
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6zHPFhLGXgwytWwjb6Bk+cNcY3l/V6hmD6TJf/CcnYUNWnql7VJQUdSRgeiio1sFLT26VmbyRCyb7QiC5W8QiTrBjHCSJrWaRNPwzYVj7NPhRsw0heP++Zv/iuCcjvsv0ddY/mqGXZj/zNh7fbonhBjU7LhWYiAG3H5BJFP4nhXQJCqtgNBzlbGTpdG6VtPeSgVoyi/nf2d0uLmYxe5xabQx98nl2NMyIFo+fmWKLwfZF3dWV7sxnOyBTimGzgY3hipw0IoOctCU3HTf5Y2KG4ws6QSPmV0XZpM0TV3m1x5Rj8UA2VUztQ7ogt0YW53RWCxCPBPyCvKwD37ikwhOIwWzQtIK0ngj9DP1tgDPl8+XTEMls2Dw3yneX7/SfL9YjCeloNAldHQBwg3lAl3QFw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(107886003)(336012)(47076004)(82740400003)(52536014)(5660300002)(81166007)(356005)(26005)(8676002)(6636002)(6506007)(53546011)(4326008)(86362001)(8936002)(186003)(7696005)(478600001)(316002)(19627235002)(70206006)(70586007)(36906005)(55016002)(9686003)(82310400003)(33656002)(83380400001)(2906002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 08:51:43.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d00c2b48-a0c8-4202-ec20-08d88a0cd789
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2916

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEJl
cnRyYW5kIE1hcnF1aXMNCj4gU2VudDogMjAyMMTqMTHUwjE2yNUgMTY6NDgNCj4gVG86IE1pY2hh
bCBPcnplbCA8TWljaGFsLk9yemVsQGFybS5jb20+DQo+IENjOiBvcGVuIGxpc3Q6WDg2IDx4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgVm9sb2R5
bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB4ZW4vYXJtOiBBZGQgd29ya2Fyb3VuZCBmb3IgQ29ydGV4LUE3Ni9OZW92ZXJz
ZS1OMQ0KPiBlcnJhdHVtICMxMjg2ODA3DQo+IA0KPiBIaSwNCj4gDQo+ID4gT24gMTYgTm92IDIw
MjAsIGF0IDA3OjI0LCBNaWNoYWwgT3J6ZWwgPE1pY2hhbC5PcnplbEBhcm0uY29tPiB3cm90ZToN
Cj4gPg0KPiA+IE9uIHRoZSBhZmZlY3RlZCBDb3J0ZXgtQTc2L05lb3ZlcnNlLU4xIGNvcmVzIChy
MHAwIHRvIHIzcDApLA0KPiA+IGlmIGEgdmlydHVhbCBhZGRyZXNzIGZvciBhIGNhY2hlYWJsZSBt
YXBwaW5nIG9mIGEgbG9jYXRpb24gaXMgYmVpbmcNCj4gPiBhY2Nlc3NlZCBieSBhIGNvcmUgd2hp
bGUgYW5vdGhlciBjb3JlIGlzIHJlbWFwcGluZyB0aGUgdmlydHVhbA0KPiA+IGFkZHJlc3MgdG8g
YSBuZXcgcGh5c2ljYWwgcGFnZSB1c2luZyB0aGUgcmVjb21tZW5kZWQgYnJlYWstYmVmb3JlLW1h
a2UNCj4gPiBzZXF1ZW5jZSwgdGhlbiB1bmRlciB2ZXJ5IHJhcmUgY2lyY3Vtc3RhbmNlcyBUTEJJ
K0RTQiBjb21wbGV0ZXMgYmVmb3JlDQo+ID4gYSByZWFkIHVzaW5nIHRoZSB0cmFuc2xhdGlvbiBi
ZWluZyBpbnZhbGlkYXRlZCBoYXMgYmVlbiBvYnNlcnZlZCBieQ0KPiA+IG90aGVyIG9ic2VydmVy
cy4gVGhlIHdvcmthcm91bmQgcmVwZWF0cyB0aGUgVExCSStEU0Igb3BlcmF0aW9uLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYXJtLmNvbT4NCj4g
UmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4N
Cj4gDQoNClJldmlld2VkLWJ5OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCg0KPiBDaGVl
cnMNCj4gQmVydHJhbmQNCj4gDQo+ID4gLS0tDQo+ID4gZG9jcy9taXNjL2FybS9zaWxpY29uLWVy
cmF0YS50eHQgICAgIHwgIDIgKysNCj4gPiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrKw0KPiA+IHhlbi9hcmNoL2FybS9jcHVlcnJhdGEu
YyAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+ID4geGVuL2luY2x1ZGUvYXNtLWFy
bS9hcm02NC9mbHVzaHRsYi5oIHwgMjkgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+
IHhlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oICAgICB8ICAzICsrLQ0KPiA+IDUgZmls
ZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQgYi9kb2NzL21pc2Mv
YXJtL3NpbGljb24tDQo+IGVycmF0YS50eHQNCj4gPiBpbmRleCA1NTJjNDE1MWQzLi5kMTgzYmE1
NDNmIDEwMDY0NA0KPiA+IC0tLSBhL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0DQo+
ID4gKysrIGIvZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQNCj4gPiBAQCAtNTMsNSAr
NTMsNyBAQCBzdGFibGUgaHlwZXJ2aXNvcnMuDQo+ID4gfCBBUk0gICAgICAgICAgICB8IENvcnRl
eC1BNzIgICAgICB8ICM4NTM3MDkgICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwN
Cj4gPiB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE3MyAgICAgIHwgIzg1ODkyMSAgICAgICAg
IHwgQVJNX0VSUkFUVU1fODU4OTIxICAgICAgfA0KPiA+IHwgQVJNICAgICAgICAgICAgfCBDb3J0
ZXgtQTc2ICAgICAgfCAjMTE2NTUyMiAgICAgICAgfCBOL0EgICAgICAgICAgICAgICAgICAgICB8
DQo+ID4gK3wgQVJNICAgICAgICAgICAgfCBDb3J0ZXgtQTc2ICAgICAgfCAjMTI4NjgwNyAgICAg
ICAgfCBBUk02NF9FUlJBVFVNXzEyODY4MDcNCj4gfA0KPiA+IHwgQVJNICAgICAgICAgICAgfCBO
ZW92ZXJzZS1OMSAgICAgfCAjMTE2NTUyMiAgICAgICAgfCBOL0ENCj4gPiArfCBBUk0gICAgICAg
ICAgICB8IE5lb3ZlcnNlLU4xICAgICB8ICMxMjg2ODA3ICAgICAgICB8IEFSTTY0X0VSUkFUVU1f
MTI4NjgwNw0KPiB8DQo+ID4gfCBBUk0gICAgICAgICAgICB8IE1NVS01MDAgICAgICAgICB8ICM4
NDI4NjkgICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+IGluZGV4
IGY5MzhkZDIxYmQuLjVkNmQ5MDZkNzIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL0tj
b25maWcNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+IEBAIC0yNDQsNiArMjQ0
LDI0IEBAIGNvbmZpZyBBUk1fRVJSQVRVTV84NTg5MjENCj4gPg0KPiA+IAkgIElmIHVuc3VyZSwg
c2F5IFkuDQo+ID4NCj4gPiArY29uZmlnIEFSTTY0X0VSUkFUVU1fMTI4NjgwNw0KPiA+ICsJYm9v
bCAiQ29ydGV4LUE3Ni9OZW92ZXJzZS1OMTogMTI4NjgwNzogTW9kaWZpY2F0aW9uIG9mIHRoZQ0K
PiB0cmFuc2xhdGlvbiB0YWJsZSBmb3IgYSB2aXJ0dWFsIGFkZHJlc3MgbWlnaHQgbGVhZCB0byBy
ZWFkLWFmdGVyLXJlYWQgb3JkZXJpbmcNCj4gdmlvbGF0aW9uIg0KPiA+ICsJZGVmYXVsdCB5DQo+
ID4gKwlkZXBlbmRzIG9uIEFSTV82NA0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIG9wdGlvbiBh
ZGRzIGEgd29ya2Fyb3VuZCBmb3IgQVJNIENvcnRleC1BNzYvTmVvdmVyc2UtTjENCj4gZXJyYXR1
bSAxMjg2ODA3Lg0KPiA+ICsNCj4gPiArCSAgT24gdGhlIGFmZmVjdGVkIENvcnRleC1BNzYvTmVv
dmVyc2UtTjEgY29yZXMgKHIwcDAgdG8gcjNwMCksIGlmIGENCj4gdmlydHVhbA0KPiA+ICsJICBh
ZGRyZXNzIGZvciBhIGNhY2hlYWJsZSBtYXBwaW5nIG9mIGEgbG9jYXRpb24gaXMgYmVpbmcNCj4g
PiArCSAgYWNjZXNzZWQgYnkgYSBjb3JlIHdoaWxlIGFub3RoZXIgY29yZSBpcyByZW1hcHBpbmcg
dGhlIHZpcnR1YWwNCj4gPiArCSAgYWRkcmVzcyB0byBhIG5ldyBwaHlzaWNhbCBwYWdlIHVzaW5n
IHRoZSByZWNvbW1lbmRlZA0KPiA+ICsJICBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZSwgdGhl
biB1bmRlciB2ZXJ5IHJhcmUgY2lyY3Vtc3RhbmNlcw0KPiA+ICsJICBUTEJJK0RTQiBjb21wbGV0
ZXMgYmVmb3JlIGEgcmVhZCB1c2luZyB0aGUgdHJhbnNsYXRpb24gYmVpbmcNCj4gPiArCSAgaW52
YWxpZGF0ZWQgaGFzIGJlZW4gb2JzZXJ2ZWQgYnkgb3RoZXIgb2JzZXJ2ZXJzLiBUaGUNCj4gPiAr
CSAgd29ya2Fyb3VuZCByZXBlYXRzIHRoZSBUTEJJK0RTQiBvcGVyYXRpb24uDQo+ID4gKw0KPiA+
ICsJICBJZiB1bnN1cmUsIHNheSBZLg0KPiA+ICsNCj4gPiBlbmRtZW51DQo+ID4NCj4gPiBjb25m
aWcgQVJNNjRfSEFSREVOX0JSQU5DSF9QUkVESUNUT1INCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2NwdWVycmF0YS5jIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jDQo+ID4gaW5kZXgg
NTY3OTExZDM4MC4uY2I0Nzk1YmVlYyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vY3B1
ZXJyYXRhLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4gPiBAQCAtNDI0
LDYgKzQyNCwyMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzIGFy
bV9lcnJhdGFbXQ0KPiA9IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgKDEgPDwgTUlEUl9WQVJJ
QU5UX1NISUZUKSB8IDIpLA0KPiA+ICAgICB9LA0KPiA+ICNlbmRpZg0KPiA+ICsjaWZkZWYgQ09O
RklHX0FSTTY0X0VSUkFUVU1fMTI4NjgwNw0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8qIENv
cnRleC1BNzYgcjBwMCAtIHIzcDAgKi8NCj4gPiArICAgICAgICAuZGVzYyA9ICJBUk0gZXJyYXR1
bSAxMjg2ODA3IiwNCj4gPiArICAgICAgICAuY2FwYWJpbGl0eSA9IEFSTTY0X1dPUktBUk9VTkRf
UkVQRUFUX1RMQkksDQo+ID4gKyAgICAgICAgTUlEUl9SQU5HRShNSURSX0NPUlRFWF9BNzYsIDAs
IDMgPDwgTUlEUl9WQVJJQU5UX1NISUZUKSwNCj4gPiArICAgIH0sDQo+ID4gKyAgICB7DQo+ID4g
KyAgICAgICAgLyogTmVvdmVyc2UtTjEgcjBwMCAtIHIzcDAgKi8NCj4gPiArICAgICAgICAuZGVz
YyA9ICJBUk0gZXJyYXR1bSAxMjg2ODA3IiwNCj4gPiArICAgICAgICAuY2FwYWJpbGl0eSA9IEFS
TTY0X1dPUktBUk9VTkRfUkVQRUFUX1RMQkksDQo+ID4gKyAgICAgICAgTUlEUl9SQU5HRShNSURS
X05FT1ZFUlNFX04xLCAwLCAzIDw8IE1JRFJfVkFSSUFOVF9TSElGVCksDQo+ID4gKyAgICB9LA0K
PiA+ICsjZW5kaWYNCj4gPiAjaWZkZWYgQ09ORklHX0FSTTY0X0hBUkRFTl9CUkFOQ0hfUFJFRElD
VE9SDQo+ID4gICAgIHsNCj4gPiAgICAgICAgIC5jYXBhYmlsaXR5ID0gQVJNX0hBUkRFTl9CUkFO
Q0hfUFJFRElDVE9SLA0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0
L2ZsdXNodGxiLmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IGFybS9hcm02NC9mbHVzaHRsYi5oDQo+
ID4gaW5kZXggY2VlYzU5NTQyZS4uNjcyNjM2MjIxMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL2FybTY0L2ZsdXNodGxiLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2FybTY0L2ZsdXNodGxiLmgNCj4gPiBAQCAtOSw2ICs5LDExIEBADQo+ID4gICogRFNCIElT
SCAgICAgICAgICAvLyBFbnN1cmUgdGhlIFRMQiBpbnZhbGlkYXRpb24gaGFzIGNvbXBsZXRlZA0K
PiA+ICAqIElTQiAgICAgICAgICAgICAgLy8gU2VlIGV4cGxhbmF0aW9uIGJlbG93DQo+ID4gICoN
Cj4gPiArICogQVJNNjRfV09SS0FST1VORF9SRVBFQVRfVExCSToNCj4gPiArICogTW9kaWZpY2F0
aW9uIG9mIHRoZSB0cmFuc2xhdGlvbiB0YWJsZSBmb3IgYSB2aXJ0dWFsIGFkZHJlc3MgbWlnaHQg
bGVhZCB0bw0KPiA+ICsgKiByZWFkLWFmdGVyLXJlYWQgb3JkZXJpbmcgdmlvbGF0aW9uLg0KPiA+
ICsgKiBUaGUgd29ya2Fyb3VuZCByZXBlYXRzIFRMQkkrRFNCIG9wZXJhdGlvbi4NCj4gPiArICoN
Cj4gPiAgKiBGb3IgWGVuIHBhZ2UtdGFibGVzIHRoZSBJU0Igd2lsbCBkaXNjYXJkIGFueSBpbnN0
cnVjdGlvbnMgZmV0Y2hlZA0KPiA+ICAqIGZyb20gdGhlIG9sZCBtYXBwaW5ncy4NCj4gPiAgKg0K
PiA+IEBAIC0xNiwxNSArMjEsMjEgQEANCj4gPiAgKiAoYW5kIHRoZXJlZm9yZSB0aGUgVExCIGlu
dmFsaWRhdGlvbikgYmVmb3JlIGNvbnRpbnVpbmcuIFNvIHdlIGtub3cNCj4gPiAgKiB0aGUgVExC
cyBjYW5ub3QgY29udGFpbiBhbiBlbnRyeSBmb3IgYSBtYXBwaW5nIHdlIG1heSBoYXZlIHJlbW92
ZWQuDQo+ID4gICovDQo+ID4gLSNkZWZpbmUgVExCX0hFTFBFUihuYW1lLCB0bGJvcCkgXA0KPiA+
IC1zdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2lkKSAgIFwNCj4gPiAteyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ID4gLSAgICBhc20gdm9sYXRpbGUoICAgICAgICAgICAgICAg
XA0KPiA+IC0gICAgICAgICJkc2IgIGlzaHN0OyIgICAgICAgICAgIFwNCj4gPiAtICAgICAgICAi
dGxiaSAiICAjIHRsYm9wICAiOyIgICBcDQo+ID4gLSAgICAgICAgImRzYiAgaXNoOyIgICAgICAg
ICAgICAgXA0KPiA+IC0gICAgICAgICJpc2I7IiAgICAgICAgICAgICAgICAgIFwNCj4gPiAtICAg
ICAgICA6IDogOiAibWVtb3J5Iik7ICAgICAgICBcDQo+ID4gKyNkZWZpbmUgVExCX0hFTFBFUihu
YW1lLCB0bGJvcCkgICAgICAgXA0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2lkKSAg
ICAgICAgIFwNCj4gPiAreyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
ID4gKyAgICBhc20gdm9sYXRpbGUoICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICsgICAgICAg
ICJkc2IgIGlzaHN0OyIgICAgICAgICAgICAgICAgIFwNCj4gPiArICAgICAgICAidGxiaSAiICAj
IHRsYm9wICAiOyIgICAgICAgICBcDQo+ID4gKyAgICAgICAgQUxURVJOQVRJVkUoICAgICAgICAg
ICAgICAgICAgXA0KPiA+ICsgICAgICAgICJub3A7IG5vcDsiLCAgICAgICAgICAgICAgICAgIFwN
Cj4gPiArICAgICAgICAiZHNiICBpc2g7IiAgICAgICAgICAgICAgICAgICBcDQo+ID4gKyAgICAg
ICAgInRsYmkgIiAgIyB0bGJvcCAgIjsiLCAgICAgICAgXA0KPiA+ICsgICAgICAgIEFSTTY0X1dP
UktBUk9VTkRfUkVQRUFUX1RMQkksIFwNCj4gPiArICAgICAgICBDT05GSUdfQVJNNjRfRVJSQVRV
TV8xMjg2ODA3KSBcDQo+ID4gKyAgICAgICAgImRzYiAgaXNoOyIgICAgICAgICAgICAgICAgICAg
XA0KPiA+ICsgICAgICAgICJpc2I7IiAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiArICAg
ICAgICA6IDogOiAibWVtb3J5Iik7ICAgICAgICAgICAgICBcDQo+ID4gfQ0KPiA+DQo+ID4gLyog
Rmx1c2ggbG9jYWwgVExCcywgY3VycmVudCBWTUlEIG9ubHkuICovDQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oIGIveGVuL2luY2x1ZGUvYXNtLQ0KPiBh
cm0vY3B1ZmVhdHVyZS5oDQo+ID4gaW5kZXggMDE2YTlmZTIwMy4uYzdiNTA1Mjk5MiAxMDA2NDQN
Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaA0KPiA+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oDQo+ID4gQEAgLTQ2LDggKzQ2LDkgQEANCj4g
PiAjZGVmaW5lIEFSTV9TTUNDQ18xXzEgOA0KPiA+ICNkZWZpbmUgQVJNNjRfV09SS0FST1VORF9B
VF9TUEVDVUxBVEUgOQ0KPiA+ICNkZWZpbmUgQVJNX1dPUktBUk9VTkRfODU4OTIxIDEwDQo+ID4g
KyNkZWZpbmUgQVJNNjRfV09SS0FST1VORF9SRVBFQVRfVExCSSAxMQ0KPiA+DQo+ID4gLSNkZWZp
bmUgQVJNX05DQVBTICAgICAgICAgICAxMQ0KPiA+ICsjZGVmaW5lIEFSTV9OQ0FQUyAgICAgICAg
ICAgMTINCj4gPg0KPiA+ICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ID4NCj4gPiAtLQ0KPiA+IDIu
MjguMA0KPiA+DQo+IA0KDQo=

