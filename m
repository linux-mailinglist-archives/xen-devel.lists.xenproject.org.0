Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB522A958C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 12:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20665.46698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb05N-0004dl-TG; Fri, 06 Nov 2020 11:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20665.46698; Fri, 06 Nov 2020 11:39:17 +0000
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
	id 1kb05N-0004dM-Pq; Fri, 06 Nov 2020 11:39:17 +0000
Received: by outflank-mailman (input) for mailman id 20665;
 Fri, 06 Nov 2020 11:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kb05L-0004dH-Qj
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:39:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 404dd992-ce7a-455d-87e4-24f62a031e9a;
 Fri, 06 Nov 2020 11:39:13 +0000 (UTC)
Received: from AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) by AS8PR08MB5879.eurprd08.prod.outlook.com
 (2603:10a6:20b:293::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:39:11 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::50) by AM5PR0201CA0016.outlook.office365.com
 (2603:10a6:203:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 11:39:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 11:39:11 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Fri, 06 Nov 2020 11:39:11 +0000
Received: from 71d6e79502fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C87B25A5-CEFC-4C17-B3CF-5A832CB80560.1; 
 Fri, 06 Nov 2020 11:39:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71d6e79502fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 11:39:05 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3612.eurprd08.prod.outlook.com (2603:10a6:10:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:39:02 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:39:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kb05L-0004dH-Qj
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 11:39:15 +0000
X-Inumbo-ID: 404dd992-ce7a-455d-87e4-24f62a031e9a
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7e1b::62e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 404dd992-ce7a-455d-87e4-24f62a031e9a;
	Fri, 06 Nov 2020 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRDW/i0phvQTSU4Q6CHFQWkeO7MHwgx2OhI37mAXgyk=;
 b=cBqxGCJyJFVtt6rIBEPzVAEzxUpTeRlDo5acHQa+9zL1ISAmW3em7d/1Co+4bDxMx9AOHQIMV6U0696pYOQ6uNipegQRADy5T+TIAZCTXIrkCTFXFCZKPPjzH6Bjt7DR2OSQ0ogQYOZt5Spd1+SEi4/SCzcsP0EIhg2SGvDtk6Q=
Received: from AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) by AS8PR08MB5879.eurprd08.prod.outlook.com
 (2603:10a6:20b:293::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:39:11 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::50) by AM5PR0201CA0016.outlook.office365.com
 (2603:10a6:203:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 11:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 11:39:11 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Fri, 06 Nov 2020 11:39:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c91ddf8c5f3d831
X-CR-MTA-TID: 64aa7808
Received: from 71d6e79502fb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C87B25A5-CEFC-4C17-B3CF-5A832CB80560.1;
	Fri, 06 Nov 2020 11:39:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71d6e79502fb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 11:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9XmDt02WHGOtOyVzNcEXR6+f7QlsKNJxi59yT2FV52ZFUA0Gay2yh/APMEWa7yESAU86EVXmvhzgacPQzpqp6n/mXoPibi+0WADmQ79KVndJ7w/emLu0O7YF835XXcsFyucTjyC2WO6T89jcp/lh17gG0iLfnDsRz0LziHgHahXSL3BvuMrliF44yuWJ7RblDEtk3Ro1iu0FGG44iGVqpxMdKzqUCdQH/XCIAqCkbZXP5wit4GSe6jScsEq4MJa6mQ7pRI58Mgd69bxqfJTa8KO7A3kSnurZItYDl0ohXnVsFHbYMeCaTjGKAMvupdGirraLAsddDzuLh7tRcOgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRDW/i0phvQTSU4Q6CHFQWkeO7MHwgx2OhI37mAXgyk=;
 b=drKT0EadZvRwaUzZ97Bkxa1nfMIChiT288O4ZvCRPwzHowNAbpgHTR77O4uzNAihC3aVCgjuVK2xvuusYLSGqVfgoFpPx+7qt6Fen2vlembsVJbZ50tPshRQVwWzHxWP9/bnlK5P6G7+HCU1VvnXp+4aVRL/tl3dxYYPkP9ot9WSarqVfS9U1flcLFcc56hCz/g0XCzecg/7D0DRBNnvfz+hxtWu3VE9z8bzgcxWsozKq/dM9dSn3ZDA9+JEA4jD2RWEQ8u98AqX9eMB5ARNqUJvJACi0sRkUf5P89D+NNaiUKNY7WAPE3SAPfzakYke4ly6UQ9V3eX1q68FDtoTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRDW/i0phvQTSU4Q6CHFQWkeO7MHwgx2OhI37mAXgyk=;
 b=cBqxGCJyJFVtt6rIBEPzVAEzxUpTeRlDo5acHQa+9zL1ISAmW3em7d/1Co+4bDxMx9AOHQIMV6U0696pYOQ6uNipegQRADy5T+TIAZCTXIrkCTFXFCZKPPjzH6Bjt7DR2OSQ0ogQYOZt5Spd1+SEi4/SCzcsP0EIhg2SGvDtk6Q=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3612.eurprd08.prod.outlook.com (2603:10a6:10:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 11:39:02 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 11:39:02 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Topic: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Index: AQHWsfqN+EzmE5QdE0+RqIeW6dAkbKm62JSAgAAmToA=
Date: Fri, 6 Nov 2020 11:39:02 +0000
Message-ID: <1E1E5368-9936-43AD-8A76-9EC3FD1C1C9E@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
 <9c3c43c3-241d-4cea-cbad-4184523450c3@suse.com>
In-Reply-To: <9c3c43c3-241d-4cea-cbad-4184523450c3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d954e88-92f0-4124-7e11-08d88248949c
x-ms-traffictypediagnostic: DB7PR08MB3612:|AS8PR08MB5879:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB58792AF80DB3720A53EDF537FCED0@AS8PR08MB5879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cbcQy2g99mXXVjWVNN6ZTOZBByMONfzc1fLyuRmkruW22biH+ufYoYgwO5mvsPQ++UauT6EcWqGvy4ed8ZxK2RyTxWsrvBFaCP4ZIRR5DCIjt+/zKs2pjlySz37VvdKAvn4d3YFXAY18E+2AhZvxHl+j3KVeTcOBg37uuahnvNUfe/rZUo7vE9huBFd8raC9/M+Xo4QS8tZvLJOgEvhPmwz8uS8XP2bIGIgW6a43R5zP8d7uTgQcuYF9q0rgaYMhPn6a09yV+8kNnplT0qGJN8CfJeTnp2kEy1912pC1qW8fHYecKtr/qwDkTknBBq1L5DNGMTalKNLQnlA47y3Rzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(6486002)(8676002)(316002)(2906002)(6512007)(55236004)(5660300002)(54906003)(186003)(83380400001)(2616005)(6916009)(91956017)(478600001)(33656002)(66556008)(76116006)(66446008)(6506007)(4326008)(66476007)(86362001)(64756008)(8936002)(66946007)(26005)(71200400001)(36756003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 RfjmWaf+QbVfmJR/ufxJqfOdcbTRTFgEOPAfucSyIPnXHHVEVNndJMXlChsbuiHLMJGsozKUu0p19B/R7mqnxWKpxEAb733J15QoPQlU2ROFMC1HTpghAmEDCXenfhb5bDZ6si9Xr4oieIHzqkmyqHLr4JRoaDOBC47PQUs8yCFxHZCJLnt0k8RYIq0JLqA4O+tk8c0g9MOorR7cUQzjs0DDKi6+8EQYwHnm5NMZrLcOON1pfoUcE3QZVPEvhZ0sXel39TJQgW56x8kZ65xdqOh64kUloDZ+21lxQWOufRradDKL7aNXe5O5MW9RtJpLu5b9VMA6C0FTll3c7Kp+uLBCYHRE/yrN6ASLuyFjSZjDP3w4LX3B0Ug4758W70ASKWtd+x9djT4NyxGMOXISSjJ7Ocy7a3duokdefjHREU/qpeUga55KBRc6ww6K68oCwzvUFZz0/kN25PjN/8utL9DSnP7i9xRUPEHmbDSEQr0K2nhgs7Yit3HgyB8JzC9ygoCpbkn2+3AGd+eqcoEGFiByOGbVJWHoPFpyVD/tFevdibiBoNoXb9nwaj3oaeOs+n0waPRe/vmEVdXM9fvU/XuO8aoP04MZtSjRNpfRz1BmFT8JIj151sOjj3th4Z8seLimOR1T0ncjd3HDUAQ4rw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <43D2D71CAABFAC489BB8F746AB8F1678@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3612
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	630840be-be0e-45a1-6262-08d882488f6d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tgBgswvesXwykXB7/OkWUsdqYkzR1qo8lJz9B7cI5Bj0RrIXfrVsaIwdIlUWzXBtt3JeTJpySoUkPBLYhRmWfsnhgLtpj7VKkHSom0WW3Duv6WlswAvt2+NNUrnbHY4/XsMk2ZS4J6ESDtig6/SAr3whgIOHY50eZ5hI3ya0PPyQhWyRK9x7aWepzHGJtL6YB7UsmL63qKmhpoJqxTx20o3S+YOU4qaqcTfR2UzTgDknmHcpNxiPMW7r/V8+1ud43SEDInMNKu0gYWfNOsUGbpsG6w1XGFFEGEN4Q5iDDXw4vmyx6/BaYICBeYYX7aLcfNC7k0PmYkcyJo6EZ/nRlgNx0hxki3X91ydCNrCW48PPv+wTk3VYGzZGYZ45ppHQDTpFieaDQ1se+QO/OhDzAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(82740400003)(356005)(6486002)(81166007)(186003)(82310400003)(336012)(83380400001)(47076004)(5660300002)(70586007)(70206006)(2906002)(26005)(6862004)(478600001)(86362001)(36906005)(54906003)(8676002)(6512007)(316002)(33656002)(53546011)(4326008)(55236004)(6506007)(36756003)(2616005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 11:39:11.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d954e88-92f0-4124-7e11-08d88248949c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5879

SGVsbG8gSmFuLA0KDQo+IE9uIDYgTm92IDIwMjAsIGF0IDk6MjEgYW0sIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4xMS4yMDIwIDE2OjU5LCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+IElmIG1lbS1zaGFyaW5nLCBtZW0tcGFnaW5nIGFuZCBsb2ctZGly
dHkgZnVuY3Rpb25hbGl0eSBpcyBub3QgZW5hYmxlZA0KPj4gZm9yIGFyY2hpdGVjdHVyZSB3aGVu
IEhBU19QQ0kgaXMgZW5hYmxlZCwgY29tcGlsZXIgd2lsbCB0aHJvdyBhbiBlcnJvci4NCj4gDQo+
IE5pdDogSXMgaXQgcmVhbGx5ICJhbmQiLCBub3QgIm9y4oCdPw0KDQpPayB5ZXMgSSB3aWxsIGZp
eCBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPj4gQEAgLTE0MTgsMTIgKzE0MTcsNyBAQCBzdGF0aWMg
aW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBk
ZXZmbiwgdTMyIGZsYWcpDQo+PiAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApDQo+PiAg
ICAgICAgIHJldHVybiAwOw0KPj4gDQo+PiAtICAgIC8qIFByZXZlbnQgZGV2aWNlIGFzc2lnbiBp
ZiBtZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUgYmVlbiANCj4+IC0gICAgICogZW5hYmxl
ZCBmb3IgdGhpcyBkb21haW4gKi8NCj4+IC0gICAgaWYgKCBkICE9IGRvbV9pbyAmJg0KPj4gLSAg
ICAgICAgIHVubGlrZWx5KG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkgfHwNCj4+IC0gICAgICAgICAg
ICAgICAgICB2bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwNCj4+IC0g
ICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0K
Pj4gKyAgICBpZiggIWFyY2hfaW9tbXVfdXNhYmxlKGQpICkNCj4+ICAgICAgICAgcmV0dXJuIC1F
WERFVjsNCj4gDQo+IFdoaWxlIGlpcmMgSSBkaWQgc3VnZ2VzdCB0aGlzIG5hbWUsIHNlZWluZyBp
dCB1c2VkIGhlcmUgbGVhdmVzIG1lDQo+IHNvbWV3aGF0IHVuaGFwcHkgd2l0aCB0aGUgbmFtZSwg
YWxiZWl0IEkgYWxzbyBjYW4ndCB0aGluayBvZiBhbnkNCj4gYmV0dGVyIGFsdGVybmF0aXZlIHJp
Z2h0IG5vdy4gTWF5YmUgYXJjaF9pb21tdV91c2VfcGVybWl0dGVkKCk/DQoNCk9rIEkgd2lsbCBt
b2RpZnkgYXMgcGVyIHlvdXIgc3VnZ2VzdGlvbi4NCj4gDQo+PiBAQCAtMzE1LDYgKzMxNiwxOCBA
QCBpbnQgaW9tbXVfdXBkYXRlX2lyZV9mcm9tX21zaSgNCj4+ICAgICAgICAgICAgPyBpb21tdV9j
YWxsKCZpb21tdV9vcHMsIHVwZGF0ZV9pcmVfZnJvbV9tc2ksIG1zaV9kZXNjLCBtc2cpIDogMDsN
Cj4+IH0NCj4+IA0KPj4gK2Jvb2xfdCBhcmNoX2lvbW11X3VzYWJsZShzdHJ1Y3QgZG9tYWluICpk
KQ0KPiANCj4gSnVzdCBib29sIHBsZWFzZSBhbmQgSSB2ZXJ5IG11Y2ggaG9wZSB0aGUgcGFyYW1l
dGVyIGNhbiBiZSBjb25zdC4NCg0KT2sgSSB3aWxsIGZpeCBpbiBuZXh0IHZlcnNpb24uDQo+IA0K
Pj4gK3sNCj4+ICsNCj4+ICsgICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdp
bmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuDQo+PiArICAgICAqIGVuYWJsZWQgZm9yIHRoaXMg
ZG9tYWluICovDQo+IA0KPiBQbGVhc2UgY29ycmVjdCBjb21tZW50IHN0eWxlIGFzIHlvdSBtb3Zl
IGl0Lg0KDQpPay4gDQo+IA0KPj4gKyAgICBpZiAoIGQgIT0gZG9tX2lvICYmIHVubGlrZWx5KG1l
bV9zaGFyaW5nX2VuYWJsZWQoZCkgfHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB2bV9l
dmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0KPiANCj4g
WW91J3ZlIHNjcmV3ZWQgdXAgaW5kZW50YXRpb24sIGFuZCBJIGRvbid0IHNlZSB3aHkgLi4uDQoN
Ckkgd2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gKyAgICAgICAgcmV0dXJuIGZh
bHNlOw0KPj4gKyAgICBlbHNlDQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICt9DQo+IA0K
PiAuLi4gdGhpcyBjYW4ndCBiZSBhIHNpbXBsZSBzaW5nbGUgcmV0dXJuIHN0YXRlbWVudCBhbnl3
YXk6DQo+IA0KPiAgICByZXR1cm4gZCA9PSBkb21faW8gfHwNCj4gICAgICAgICAgIGxpa2VseSgh
bWVtX3NoYXJpbmdfZW5hYmxlZChkKSAmJg0KPiAgICAgICAgICAgICAgICAgICF2bV9ldmVudF9j
aGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgJiYNCj4gICAgICAgICAgICAgICAgICAhcDJt
X2dldF9ob3N0cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpOw0KPiANCj4gSW4gdGhlIGNvdXJzZSBv
ZiBtb3ZpbmcgSSdkIGFsc28gc3VnZ2VzdCBkcm9wcGluZyB0aGUgdXNlIG9mDQo+IGxpa2VseSgp
IGhlcmU6IFRoZSB3YXkgaXQncyB1c2VkIChvbiBhbiAmJiBleHByZXNzaW9uKSBpc24ndA0KPiBu
b3JtYWxseSBoYXZpbmcgbXVjaCBlZmZlY3QgYW55d2F5LiBJZiBhbnl0aGluZyBpdCBzaG91bGQg
aW1vDQo+IGJlDQo+IA0KPiAgICByZXR1cm4gZCA9PSBkb21faW8gfHwNCj4gICAgICAgICAgIChs
aWtlbHkoIW1lbV9zaGFyaW5nX2VuYWJsZWQoZCkpICYmDQo+ICAgICAgICAgICAgbGlrZWx5KCF2
bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykpICYmDQo+ICAgICAgICAgICAg
bGlrZWx5KCFwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkpOw0KPiANCj4gQW55
IHRyYW5zZm9ybWF0aW9uIHRvIHRoaXMgZWZmZWN0IHdhbnRzIG1lbnRpb25pbmcgaW4gdGhlDQo+
IGRlc2NyaXB0aW9uLCB0aG91Z2guDQoNCk9rIEkgd2lsbCBtb2RpZnkgYXMgcGVyIHlvdXIgc3Vn
Z2VzdGlvbi4NCj4gDQo+IEphbg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

