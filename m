Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE928106B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1806.5548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOI3n-0002sY-C3; Fri, 02 Oct 2020 10:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1806.5548; Fri, 02 Oct 2020 10:13:07 +0000
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
	id 1kOI3n-0002s6-8J; Fri, 02 Oct 2020 10:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1806;
 Fri, 02 Oct 2020 10:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOI3l-0002rk-NA
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:13:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea134896-99d4-4d85-94f4-cd72f2d7c819;
 Fri, 02 Oct 2020 10:13:04 +0000 (UTC)
Received: from DB6PR1001CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::15)
 by DB7PR08MB3756.eurprd08.prod.outlook.com (2603:10a6:10:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 10:13:01 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::d) by DB6PR1001CA0029.outlook.office365.com
 (2603:10a6:4:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 10:13:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:13:01 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Fri, 02 Oct 2020 10:13:01 +0000
Received: from b62a67fa25e2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C40885B0-9C7E-438A-B0D7-C63B82DF1E75.1; 
 Fri, 02 Oct 2020 10:12:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b62a67fa25e2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 10:12:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5081.eurprd08.prod.outlook.com (2603:10a6:10:e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 10:12:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:12:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOI3l-0002rk-NA
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:13:05 +0000
X-Inumbo-ID: ea134896-99d4-4d85-94f4-cd72f2d7c819
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.41])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ea134896-99d4-4d85-94f4-cd72f2d7c819;
	Fri, 02 Oct 2020 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM2AM7ZoE/80Nc9Pbia61OrulRWXjE18A6I508xxGRA=;
 b=HIhLB9+eOGxfJwM0YBAieYmiZ5FRipDQe90CvBbiIpHwh2zIe0Y8D7qCFMGvjqeCKewMCTmucMGB14X9ThZ+ysjd2dYKLV2+UvM0ts/EkDIvm+KxrUv36QhJB/nmpcikllTkw2cJH1nOPhJHgZBBBqToivbjFFqAxCpCxiDc7lU=
Received: from DB6PR1001CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::15)
 by DB7PR08MB3756.eurprd08.prod.outlook.com (2603:10a6:10:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 10:13:01 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::d) by DB6PR1001CA0029.outlook.office365.com
 (2603:10a6:4:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 10:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 10:13:01 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 02 Oct 2020 10:13:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 573baf49a94c395d
X-CR-MTA-TID: 64aa7808
Received: from b62a67fa25e2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C40885B0-9C7E-438A-B0D7-C63B82DF1E75.1;
	Fri, 02 Oct 2020 10:12:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b62a67fa25e2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 10:12:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwMKlqNfS1Qf2g3MwXhKbTeWFdtG7BEdpZ6LEqsQESGCrtOijtuvcb0MH8wufWiHgt+X0LbR4ezCEoc9EJQDt0pCtWlEcnteoYyBLYhUAUc6ffHNcW1S3/ehogRRpwOq53Ox8Bdxxe/Iin6cHdRILwNSM0DiCTwzilvl/mPFBBpc69QSHkfkPN86F2YHoWctjPY1VvnJ3kCm2ox//zHXIk/FSJ3GKJCv9Zgb+PBrqasb8EIasG8VrcoNCO+b+TegFYmpxiUwULk2Pz9IyL8UfIgZkLNiQ5CSVeMwSVnkf2NEYHbdukAGmY1EerGqewzB+Wsa3uJo6AGSv7K9iWDCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM2AM7ZoE/80Nc9Pbia61OrulRWXjE18A6I508xxGRA=;
 b=TS8Ww+Tdd1CzwmYHrvFVwaSZDYcNAdTvavfX33v6IlbHrSmfI8lPL3bqcqwvW4hM6Uays9QlOka0U+N8y45O5Z647oYbSa65Xj1zRm8T8M45Dj1+nRL2zVqvjh7v+gFC8Lkmbz6CJaT3cZ61XzUFZVl5Ngmhvuug0Xg8oheZtiyng9wxQzmy/jjvrO8OS9Tu8wfuGcxjF86wlQJ27BgKALQbO+7wew3NWyKmYUH5/aS4FdGAqAz7tETwZmgSvM/ru4Ha8B7LfJrHuE9APkSSe64xG8drOgjUg5unp+N/auebKngK+IfmFU5TF7Ih27ZCahV+UsM+D130YmpZgaoMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM2AM7ZoE/80Nc9Pbia61OrulRWXjE18A6I508xxGRA=;
 b=HIhLB9+eOGxfJwM0YBAieYmiZ5FRipDQe90CvBbiIpHwh2zIe0Y8D7qCFMGvjqeCKewMCTmucMGB14X9ThZ+ysjd2dYKLV2+UvM0ts/EkDIvm+KxrUv36QhJB/nmpcikllTkw2cJH1nOPhJHgZBBBqToivbjFFqAxCpCxiDc7lU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5081.eurprd08.prod.outlook.com (2603:10a6:10:e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 10:12:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 10:12:22 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Thread-Topic: [PATCH v3] tools/libs/stat: fix broken build
Thread-Index:
 AQHWiQYtlvZlYAgRJ0WaZGJ4HThwo6ln+foAgBsWa4CAAMywgIAAGQiAgAAIpgCAAAJuAIAABycAgAAuo4A=
Date: Fri, 2 Oct 2020 10:12:22 +0000
Message-ID: <5B52FDF2-18DA-4342-9280-0D497FAB6532@arm.com>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
 <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
 <8ddad01e-cf1a-7752-1371-a505fb26dc47@suse.com>
 <90a39759-63c1-28b9-f112-d8b3cc083565@suse.com>
 <558774ab-92cb-90ae-3936-4f9cc9d56fd0@suse.com>
In-Reply-To: <558774ab-92cb-90ae-3936-4f9cc9d56fd0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93f184e1-37e8-4a63-401d-08d866bbbe79
x-ms-traffictypediagnostic: DB8PR08MB5081:|DB7PR08MB3756:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB37563BEB7EEB4D5A5CD7C2F29D310@DB7PR08MB3756.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wZQ2UKbqlvEq3QK69HqcV7XV/ODdPgx7HKqH6HHWLhAsTNf+sC/UovURphrvKW1YGgCfQHH05lRJ5HW7IxU0/ULLwEDG3gFJ7hG5/oM4PsIs6GgYjypILgRtwIOvJ/l6WOF+iLg4BT7V18jHx5THQIkC5Fyqqp1bFg5elOxphmbG7GWUHljajPeKXyO63EL+T0b67jmFri2DChvNn5UwbYD71j0PGNsn4YZmf5HtFDdGq6nYbWkd0IomM8UbhHrVJPIo+Imrt/zOmA/HE/dW9hLy8qbrdJCO3+wcV76/t23sLAK2Pz/VlRX8jiTLR2x8pvFxzFAj3szki7cK7/rgWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(71200400001)(86362001)(8676002)(186003)(6486002)(478600001)(2906002)(64756008)(66446008)(66556008)(2616005)(4326008)(66946007)(6506007)(66476007)(53546011)(6916009)(26005)(6512007)(33656002)(54906003)(36756003)(83380400001)(66574015)(5660300002)(316002)(8936002)(76116006)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 5l9647iNfr9lUEF76/PJQ0/Z/X3Vit9Fk4ysy0CAFv52wnLTsTzR1bUZxESS3+4Cy3KwAzCv8kuUVaHzkVNej+IJQ6xzipGFN6cSwpRmOjzw44iuotwDeraM7g/AGNh5nkkyN4aqcLLWCOZSv78P3bHZLSB8d6M74OZgVBSDs95+UhKy1elN+u6+xEttuEJXRSNKLe8fSiPmHL2I0oHTZZ+OARAQn6HiUwZR9nw8xst59jGta1Jsr0fskiEolo7Qqvg1oBsZkcSO6jhGNS3fPHQekOQb4oMkCEjeDg6EfiyUtPFT8AXUfr6rO5IlGUenYUnPn/FJchxzsfz6H1p7SICx9uyGc0EsElLHkgGARpkj9f4bfz6nOZ63514RK5wYWBaNijJ7Nao0E5vgBSeBTbslQyndVhXdHE0XrtNid3uPduyrsXEwi0Ep6OaN0H/LqWMyFTrScYAf55diF6QtjL8ZnPI7mV0ViL8SDmLRyb5G84kHH25+iZtImILleuE6pYgtlZEUuTf1YcVlS/Vrr/5GOELyv4lMG0DVuAeu5jbIAsKBM+NAVyrlbtmeh2pyHfM5rrV1EzuwZBibYL3RcsfMfFYLBq8D0RSs3Z3YTzKnQdALyXwzMdOAwpm724sQFvS50FTsYfCJU2vuAJRk9Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1213323E79DFF4E8EBDD5A3AE0F9270@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5081
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78465c39-d35a-4b4e-6d12-08d866bba74d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wg8iegOOmhicraXPl8sNLmeZo5XPeTCvl4NbRa/Q/aBGUxLWPtOW7ymyD8tSya6SC1yeUGRFw2afJXqx4lvsbw0jR09GBCNkGo+t2CkVedcb3cxZGGq8FaZb5Ki1T0oJiYP0osOQ7LjVvwrcy7Y2J86V9HA6xzyF0VoZyNBvaPk1d9yECgyShto0Lj7BYiHQoRCCkTMVmt2PgkiWjjRJIvN9BbHk3GwJqCbdLJ+j186psIqWizhUm7zAXKCygjKhOpjKquWdrM1KUFs1X2dTyObo5swK0vRYCwRn43LBP1jaHM40KSJJAJUF/64xRWkeSg3EHa2cnMomLxiRP5RApASxCWrAXBpJXCYxTvFIU8k6caZQtcFAgM33LiIiYAlW7u+FcD2QvNC4CNIOhFh7uw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966005)(83380400001)(478600001)(47076004)(82740400003)(70206006)(54906003)(26005)(356005)(70586007)(81166007)(316002)(2906002)(2616005)(6862004)(6486002)(33656002)(66574015)(8676002)(5660300002)(4326008)(6512007)(6506007)(82310400003)(336012)(86362001)(36756003)(8936002)(186003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 10:13:01.3400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f184e1-37e8-4a63-401d-08d866bbbe79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3756

SGksDQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMDg6MjUsIErDvHJnZW4gR3Jvw58gPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4xMC4yMCAwODo1OSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+PiBPbiAwMi4xMC4yMDIwIDA4OjUxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+IE9u
IDAyLjEwLjIwIDA4OjIwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDIuMTAuMjAyMCAw
Njo1MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+IE9uIDAxLjEwLjIwIDE4OjM4LCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4+IEhpIEp1ZXJnZW4sDQo+Pj4+Pj4gDQo+Pj4+Pj4+
IE9uIDE0IFNlcCAyMDIwLCBhdCAxMTo1OCwgQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFy
cXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+
Pj4+IE9uIDEyIFNlcCAyMDIwLCBhdCAxNDowOCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gTWFraW5nIGdldEJyaWRnZSgpIHN0YXRp
YyB0cmlnZ2VyZWQgYSBidWlsZCBlcnJvciB3aXRoIHNvbWUgZ2NjIHZlcnNpb25zOg0KPj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiBlcnJvcjogJ3N0cm5jcHknIG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIGNv
cHlpbmcgMTUgYnl0ZXMgZnJvbSBhIHN0cmluZyBvZg0KPj4+Pj4+Pj4gbGVuZ3RoIDI1NSBbLVdl
cnJvcj1zdHJpbmdvcC10cnVuY2F0aW9uXQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBGaXggdGhhdCBi
eSB1c2luZyBhIGJ1ZmZlciB3aXRoIDI1NiBieXRlcyBpbnN0ZWFkLg0KPj4+Pj4+Pj4gDQo+Pj4+
Pj4+PiBGaXhlczogNmQwZWMwNTM5MDc3OTQgKCJ0b29sczogc3BsaXQgbGlieGVuc3RhdCBpbnRv
IG5ldyB0b29scy9saWJzL3N0YXQgZGlyZWN0b3J5IikNCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiANCj4+Pj4+
PiBTb3JyeSBpIGhhdmUgdG8gY29tZSBiYWNrIG9uIHRoaXMgb25lLg0KPj4+Pj4+IA0KPj4+Pj4+
IEkgc3RpbGwgc2VlIGFuIGVycm9yIGNvbXBpbGluZyB3aXRoIFlvY3RvIG9uIHRoaXMgb25lOg0K
Pj4+Pj4+IHwgICAgIGlubGluZWQgZnJvbSAneGVuc3RhdF9jb2xsZWN0X25ldHdvcmtzJyBhdCB4
ZW5zdGF0X2xpbnV4LmM6MzA2OjI6DQo+Pj4+Pj4gfCB4ZW5zdGF0X2xpbnV4LmM6ODE6NjogZXJy
b3I6ICdzdHJuY3B5JyBvdXRwdXQgbWF5IGJlIHRydW5jYXRlZCBjb3B5aW5nIDI1NSBieXRlcyBm
cm9tIGEgc3RyaW5nIG9mIGxlbmd0aCAyNTUgWy1XZXJyb3I9c3RyaW5nb3AtdHJ1bmNhdGlvbl0N
Cj4+Pj4+PiB8ICAgIDgxIHwgICAgICBzdHJuY3B5KHJlc3VsdCwgZGUtPmRfbmFtZSwgcmVzdWx0
TGVuKTsNCj4+Pj4+PiB8ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPj4+Pj4+IA0KPj4+Pj4+IFRvIHNvbHZlIGl0LCBJIG5lZWQgdG8gZGVmaW5l
IGRldkJyaWRnZVsyNTddIGFzIGRldk5vQnJpZGVnLg0KPj4+Pj4gDQo+Pj4+PiBJTUhPIHRoaXMg
aXMgYSByZWFsIGNvbXBpbGVyIGVycm9yLg0KPj4+Pj4gDQo+Pj4+PiBkZS0+ZF9uYW1lIGlzIGFu
IGFycmF5IG9mIDI1NiBieXRlcywgc28gZG9pbmcgc3RybmNweSgpIGZyb20gdGhhdCB0bw0KPj4+
Pj4gYW5vdGhlciBhcnJheSBvZiAyNTYgYnl0ZXMgd2l0aCBhIGxlbmd0aCBvZiAyNTYgd29uJ3Qg
dHJ1bmNhdGUgYW55dGhpbmcuDQo+Pj4+IA0KPj4+PiBUaGF0J3MgYSBtYXR0ZXIgb2YgaG93IHlv
dSBsb29rIGF0IGl0LCBJIHRoaW5rOiBJZiB0aGUgb3JpZ2luYWwgYXJyYXkNCj4+Pj4gZG9lc24n
dCBob2xkIGEgbnVsLXRlcm1pbmF0ZWQgc3RyaW5nLCB0aGUgZGVzdGluYXRpb24gYXJyYXkgd29u
J3QNCj4+Pj4gZWl0aGVyLCB5ZXQgdGhlIGNvbW1vbiBnb2FsIG9mIHN0cm5jcHkoKSBpcyB0byB5
aWVsZCBhIHByb3Blcmx5IG51bC0NCj4+Pj4gdGVybWluYXRlZCBzdHJpbmcuIElPVyB0aGUgd2Fy
bmluZyBtYXkgYmUgc2luY2UgdGhlIHN0YW5kYXJkIGV2ZW4gaGFzDQo+Pj4+IGEgc3BlY2lmaWMg
Zm9vdCBub3RlIHRvIHBvaW50IG91dCB0aGlzIHBvc3NpYmxlIHBpdGZhbGwuDQo+Pj4gDQo+Pj4g
SWYgdGhlIHNvdXJjZSBkb2Vzbid0IGhvbGQgYSBudWwtdGVybWluYXRlZCBzdHJpbmcgdGhlcmUg
d2lsbCBzdGlsbCBiZQ0KPj4+IDI1NiBieXRlcyBjb3BpZWQsIHNvIHRoZXJlIGlzIG5vIHRydW5j
YXRpb24gZG9uZSBkdXJpbmcgc3RybmNweSgpLg0KPj4+IA0KPj4+IEluIGZhY3QgdGhlcmUgaXMg
bm8gd2F5IHRvIHVzZSBzdHJuY3B5KCkgaW4gYSBzYWZlIHdheSBvbiBhIGZpeGVkIHNpemVkDQo+
Pj4gc291cmNlIGFycmF5IHdpdGggdGhlIGFib3ZlIHNlbWFudGljczogZWl0aGVyIHRoZSB0YXJn
ZXQgaXMgbGFyZ2VyIHRoYW4NCj4+PiB0aGUgc291cmNlIGFuZCBsZW5ndGggaXMgYXQgbGVhc3Qg
c2l6ZW9mKHNvdXJjZSkgKyAxLCByZXN1bHRpbmcgaW4gYQ0KPj4+IHBvc3NpYmxlIHJlYWQgYmV5
b25kIHRoZSBlbmQgb2Ygc291cmNlLCBvciB0aGUgdGFyZ2V0IGlzIHRoZSBzYW1lIGxlbmd0aA0K
Pj4+IGxlYWRpbmcgdG8gdGhlIGVycm9yLg0KPj4gSSBhZ3JlZSB3aXRoIGFsbCBvZiB3aGF0IHlv
dSBzYXksIGJ1dCBJIGNhbiBhbHNvIHNlZSB3aHkgc2FpZCBmb290IG5vdGUNCj4+IGFsb25lIG1h
eSBoYXZlIG1vdGl2YXRlZCB0aGUgZW1pc3Npb24gb2YgdGhlIHdhcm5pbmcuDQo+IA0KPiBUaGUg
bW90aXZhdGlvbiBjYW4gYmUgZXhwbGFpbmVkLCB5ZXMsIGJ1dCBpdCBpcyB3cm9uZy4gc3RybmNw
eSgpIGlzIG5vdA0KPiBsaW1pdGVkIHRvIHNvdXJjZSBhcnJheXMgb2YgdW5rbm93biBsZW5ndGgu
IFNvIHRoaXMgd2FybmluZyBpcyBtYWtpbmcNCj4gc3RybmNweSgpIHVudXNhYmxlIGZvciBmaXhl
ZCBzaXplZCBzb3VyY2Ugc3RyaW5ncyBhbmQgLVdlcnJvci4gQW5kIHRoYXQNCj4gaXMgbm90aGlu
ZyBhIGNvbXBpbGVyIHNob3VsZCBiZSBhbGxvd2VkIHRvIGRvLCBoZW5jZSBhIGNvbXBpbGVyIGJ1
Zy4NCg0KSSBkbyBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSB0aGUgY29tcGlsZXIgaXMgZG9pbmcg
dG8gbXVjaC4NCg0KV2UgY291bGQgYWxzbyBjaG9vc2UgdG8gdHVybiBvZmYgdGhlIHdhcm5pbmcg
ZWl0aGVyIHVzaW5nIHByYWdtYSAod2hpY2gNCmkgcmVhbGx5IGRvIG5vdCBsaWtlKSBvciBieSBh
ZGRpbmcgYSBjZmxhZyBmb3IgdGhpcyBzcGVjaWZpYyBmaWxlIChidXQgdGhpcyBtaWdodA0KaGl0
IHVzIGxhdGVyIGluIG90aGVyIHBsYWNlcykuDQoNCkFsbCBpbiBhbGwgdGhpcyBjdXJyZW50bHkg
bWFrZXMgWGVuIG1hc3RlciBhbmQgc3RhZ2luZyBub3QgcG9zc2libGUgdG8NCmNvbXBpbGUgd2l0
aCBZb2N0byBzbyB3ZSBuZWVkIHRvIGZpbmQgYSBzb2x1dGlvbiBhcyB0aGlzIHdpbGwgYWxzbw0K
Y29tZSBpbiBhbnkgZGlzdHJpYnV0aW9uIHVzaW5nIGEgbmV3IGNvbXBpbGVyLA0KDQpDaGVlcnMN
CkJlcnRyYW5kDQoNCg==

