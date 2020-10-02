Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F92810E4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1904.5750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIrB-0000YR-Hx; Fri, 02 Oct 2020 11:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1904.5750; Fri, 02 Oct 2020 11:04:09 +0000
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
	id 1kOIrB-0000Y2-Eh; Fri, 02 Oct 2020 11:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1904;
 Fri, 02 Oct 2020 11:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOIr9-0000Xx-Fz
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:04:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d75aed4-af75-4e70-b00d-73cd2cba7b0f;
 Fri, 02 Oct 2020 11:04:06 +0000 (UTC)
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 11:04:03 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::53) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 11:04:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 11:04:03 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 02 Oct 2020 11:04:03 +0000
Received: from f293c959b325.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 637136FA-FA8B-4DEE-AB7C-D9EE771DF13D.1; 
 Fri, 02 Oct 2020 11:03:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f293c959b325.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 11:03:58 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 11:03:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 11:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOIr9-0000Xx-Fz
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:04:07 +0000
X-Inumbo-ID: 3d75aed4-af75-4e70-b00d-73cd2cba7b0f
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7d00::626])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3d75aed4-af75-4e70-b00d-73cd2cba7b0f;
	Fri, 02 Oct 2020 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmvwajEXxGbQ5LSycLATrQubKMcuPuTfBR8p711VpQk=;
 b=V1oGIsNoTxFWEnANm1BCq3xa5Emm4ebVaLWnkCr/16pg+oecx37sOBXVV6YW6NuJkZvnhEJMAPDjp0oTzjwlKEr0iSWgJ6mYjw1+AASKGq4j37DcynPDl4G03ZDUlrxYtZNf2WE5Ro3jnPlmdIY3wX7gpkuBgy8qBs8+3Lkd8vc=
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 11:04:03 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::53) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 11:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 11:04:03 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 02 Oct 2020 11:04:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b901a574756df2a6
X-CR-MTA-TID: 64aa7808
Received: from f293c959b325.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 637136FA-FA8B-4DEE-AB7C-D9EE771DF13D.1;
	Fri, 02 Oct 2020 11:03:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f293c959b325.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 11:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn2KHq/UQdVcNDHF4XDuZ+kikLT2kSpT60bbFsQHbxr19C5xnbnha6UzhdRqYFeVITT2VCNlhD3kur5vQYZ6FXw27CDBCIJAeabNDN2QqapFVBQ5r9buIEHfV5LxfZHWNvX5p8cf+Zs1p6rngbJRE84hSOEXI653/bNLXaQwttwqASpiBUE/CsBJSrobQXMiourtE6s+6EDM++JMgR03lJr5aFrQ1aZarMkEeToTelO02onxpuvS0L4Bfm6Pjay1Matoms9KY7QWltma2qhmDjKpnokevpcA0nE/UWHEqlRsldI1ShriFO5EfoTkDts747MzMl814NinT4OfsUpVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmvwajEXxGbQ5LSycLATrQubKMcuPuTfBR8p711VpQk=;
 b=WKsTCc0cJesXVcekAaQJXUTfWHY3MUBt6Af/swam91JlwxyyRuH+hFcK1cJYSNcQhI5JhMjSTK0tgb5MTQtvQ7VPhzQEcgwPakGhbk6pJgsGBUnX4ETF5rKdDCP+M7+GB5xteidwhzXG7gx8NLltQ3XNyfeMJgScTMYVCLZSXuAoUUxC8WjtynLMVmm9ia3AYrZkZqxdWRmRFHT0f33+AIRYzAsipfYMrj7LVgCgrf6LRuX7ql7+rSKilNpmXDJZCX4KrMA1peS1b0V4dfZ64pT1Z6MOOW8D+j3K6TF8ynV/D1jqCqn2BVfGnz867aL9ahnrXTDaJeXMRBijLinstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmvwajEXxGbQ5LSycLATrQubKMcuPuTfBR8p711VpQk=;
 b=V1oGIsNoTxFWEnANm1BCq3xa5Emm4ebVaLWnkCr/16pg+oecx37sOBXVV6YW6NuJkZvnhEJMAPDjp0oTzjwlKEr0iSWgJ6mYjw1+AASKGq4j37DcynPDl4G03ZDUlrxYtZNf2WE5Ro3jnPlmdIY3wX7gpkuBgy8qBs8+3Lkd8vc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2566.eurprd08.prod.outlook.com (2603:10a6:4:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 11:03:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 11:03:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Thread-Topic: [PATCH v3] tools/libs/stat: fix broken build
Thread-Index:
 AQHWiQYtlvZlYAgRJ0WaZGJ4HThwo6ln+foAgBsWa4CAAMywgIAAGQiAgAAIpgCAAAJuAIAABycAgAAuo4CAAAj+AIAABWkA
Date: Fri, 2 Oct 2020 11:03:55 +0000
Message-ID: <4F380E40-9AEB-4579-ADF7-833CCB5C5D54@arm.com>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
 <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
 <8ddad01e-cf1a-7752-1371-a505fb26dc47@suse.com>
 <90a39759-63c1-28b9-f112-d8b3cc083565@suse.com>
 <558774ab-92cb-90ae-3936-4f9cc9d56fd0@suse.com>
 <5B52FDF2-18DA-4342-9280-0D497FAB6532@arm.com>
 <75346ac2-20f3-c868-4ac9-0d5a2e65d436@suse.com>
In-Reply-To: <75346ac2-20f3-c868-4ac9-0d5a2e65d436@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 227313b2-6193-4dc3-b9a0-08d866c2dfbc
x-ms-traffictypediagnostic: DB6PR0802MB2566:|PR3PR08MB5626:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB56261EA9ADCE74E3D03F06D19D310@PR3PR08MB5626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dHM4PRr1b+ReQJYgvch5AG1f0po4VauMxD9IeS2Uf0pivtTaTuoRYfR7hlzXTSwWFruds1yc8SIu/jiuJ+u6oxx+GrFhfOJP1sBuaI8Fbd7ZlOEltVAA2iLirsgx2WYTgl6Do0k2axU85Ga2prgAaPtNl5hf8CBRfcNw0nfyGA2O1tPiYl+v+QjazkGWM5Z7mUxpPnXcEMhbBLeAH38ods3GZXZXLON6X6AJpNlVZPBzXbJ9NcsfQgisLf7JfuVxohHODMyJqn03MQVVU1utCHKJFIiCOuwJTiWqh3XTw9YUAcleEqWxWUCACt4e4wzceW3btMs29JMAQwT9BDWUoA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(66574015)(6512007)(5660300002)(316002)(186003)(54906003)(4326008)(26005)(478600001)(2616005)(83380400001)(86362001)(36756003)(71200400001)(53546011)(8936002)(2906002)(91956017)(76116006)(66946007)(66476007)(64756008)(66446008)(66556008)(6486002)(6916009)(8676002)(6506007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 BYWG8fBE58JtkAruiqjEhDwr0dbVDjylT7vozU+fU5wDvmruZXT87Glvz1pxdzy5m6M2dW0472PEqgm99FuMhCCwmSAeUtMScYZ3ufONC3gZ4N3FvIKqEYIzV7VoX9i4cQRIXCSnuNLAOAxfJ95nSWuN3TaIR8CR+wezyWcpz35lVzHqVPpg8iswa4ZqH4as7Nvl/1pb+lBUFjBAj8jHPAwnKF5gKstGK2XEB1kLNbgd07wCF7b8QgqmyRiZ9f/62ZBVTHIPECUQzcQ65xOwDDc6LjTOPkfANJ2z7jFjpl6OTV6JzpeOzmX3+r42ZfFOJL/BROpADhKDc9xCHmH8yVKQwVd6j0pfnzdZu0T+uKWU7Ke4DUwFbeOnVLELKQ0m1AEwkG1/BYUxx+IwBcykY4DGt2pH1CRYezr3NwU5fJmD16KYYcdNKFdi11S/aJtdVIa9euwun9NwGEDYv6LkjKO5w5OKQ/l/YLKC5uIyWjqzIYQA+BBQ8jOzbmXCDwHttqdyj1fR7HwoAowmKk1PMwIz3Nn6SHNM03PWOIo0jJQ2oesABNwzp5/XAiMBtCSrSNTaaLsim7s7H/ZvoVwGe0QPu5ENrQzsweqjNU6LE285pUPO6GIo+amPbefiHCm0hqXN9OiAMYMNAow17Fjujw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFCFC14934BB4C449F31112CCDF70B4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2566
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19abe19b-fac5-4beb-af9a-08d866c2db3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fK2hBCBt/vFgRTBVfLPnYjnZakTeY4GUqOydWae9+lyophZZgTGynm4RHr26pmRuxtE6jbWgLQYGGPo0VLjmqBHsR0c6dNxz9xO8vANwuR6DcaHINsED5Qpw4lT4AGqU9dVmpJpba9TtlIlaUe9zb3lIb2lh9z9uysX4BPwIT9KG4HIoJfmrE2o+q5+unMXPu5JyizMpUu3JnIPNID2iuv3R4mD7qwbAFnew6hUJHb8gOwmfFhihQYf9IQrvKPICJd2zo2j+x9f3OWpgcKGMpcIfr0l3qN4bsX1Z5H68JCH3woCMrk8e3NklpL0xZ5r+e5toCrpLR+C2mfGcJTMFB01xV8oaPX3qs5MgTzZ5TzQQzmhR/UXTQvhQJOG45FYv9oickdSQddJwhVzt4mB4Cg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966005)(70586007)(70206006)(8936002)(4326008)(2906002)(478600001)(186003)(316002)(54906003)(356005)(86362001)(6862004)(66574015)(336012)(2616005)(53546011)(33656002)(82310400003)(83380400001)(6506007)(6486002)(26005)(81166007)(8676002)(5660300002)(36756003)(6512007)(82740400003)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 11:04:03.6221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 227313b2-6193-4dc3-b9a0-08d866c2dfbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMTE6NDQsIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4xMC4yMCAxMjoxMiwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+IEhpLA0KPj4+IE9uIDIgT2N0IDIwMjAsIGF0IDA4OjI1LCBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDAyLjEwLjIwIDA4OjU5LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDIuMTAuMjAyMCAwODo1MSwgSsO8cmdlbiBHcm/D
nyB3cm90ZToNCj4+Pj4+IE9uIDAyLjEwLjIwIDA4OjIwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+PiBPbiAwMi4xMC4yMDIwIDA2OjUwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+Pj4+PiBP
biAwMS4xMC4yMCAxODozOCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+IEhpIEp1
ZXJnZW4sDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPbiAxNCBTZXAgMjAyMCwgYXQgMTE6NTgsIEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IE9uIDEyIFNlcCAyMDIwLCBh
dCAxNDowOCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4+IE1ha2luZyBnZXRCcmlkZ2UoKSBzdGF0aWMgdHJpZ2dlcmVkIGEgYnVp
bGQgZXJyb3Igd2l0aCBzb21lIGdjYyB2ZXJzaW9uczoNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+
IGVycm9yOiAnc3RybmNweScgb3V0cHV0IG1heSBiZSB0cnVuY2F0ZWQgY29weWluZyAxNSBieXRl
cyBmcm9tIGEgc3RyaW5nIG9mDQo+Pj4+Pj4+Pj4+IGxlbmd0aCAyNTUgWy1XZXJyb3I9c3RyaW5n
b3AtdHJ1bmNhdGlvbl0NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEZpeCB0aGF0IGJ5IHVzaW5n
IGEgYnVmZmVyIHdpdGggMjU2IGJ5dGVzIGluc3RlYWQuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
PiBGaXhlczogNmQwZWMwNTM5MDc3OTQgKCJ0b29sczogc3BsaXQgbGlieGVuc3RhdCBpbnRvIG5l
dyB0b29scy9saWJzL3N0YXQgZGlyZWN0b3J5IikNCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBC
ZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+Pj4+PiANCj4+
Pj4+Pj4+IFNvcnJ5IGkgaGF2ZSB0byBjb21lIGJhY2sgb24gdGhpcyBvbmUuDQo+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+IEkgc3RpbGwgc2VlIGFuIGVycm9yIGNvbXBpbGluZyB3aXRoIFlvY3RvIG9uIHRo
aXMgb25lOg0KPj4+Pj4+Pj4gfCAgICAgaW5saW5lZCBmcm9tICd4ZW5zdGF0X2NvbGxlY3RfbmV0
d29ya3MnIGF0IHhlbnN0YXRfbGludXguYzozMDY6MjoNCj4+Pj4+Pj4+IHwgeGVuc3RhdF9saW51
eC5jOjgxOjY6IGVycm9yOiAnc3RybmNweScgb3V0cHV0IG1heSBiZSB0cnVuY2F0ZWQgY29weWlu
ZyAyNTUgYnl0ZXMgZnJvbSBhIHN0cmluZyBvZiBsZW5ndGggMjU1IFstV2Vycm9yPXN0cmluZ29w
LXRydW5jYXRpb25dDQo+Pj4+Pj4+PiB8ICAgIDgxIHwgICAgICBzdHJuY3B5KHJlc3VsdCwgZGUt
PmRfbmFtZSwgcmVzdWx0TGVuKTsNCj4+Pj4+Pj4+IHwgICAgICAgfCAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRvIHNvbHZl
IGl0LCBJIG5lZWQgdG8gZGVmaW5lIGRldkJyaWRnZVsyNTddIGFzIGRldk5vQnJpZGVnLg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gSU1ITyB0aGlzIGlzIGEgcmVhbCBjb21waWxlciBlcnJvci4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IGRlLT5kX25hbWUgaXMgYW4gYXJyYXkgb2YgMjU2IGJ5dGVzLCBzbyBkb2lu
ZyBzdHJuY3B5KCkgZnJvbSB0aGF0IHRvDQo+Pj4+Pj4+IGFub3RoZXIgYXJyYXkgb2YgMjU2IGJ5
dGVzIHdpdGggYSBsZW5ndGggb2YgMjU2IHdvbid0IHRydW5jYXRlIGFueXRoaW5nLg0KPj4+Pj4+
IA0KPj4+Pj4+IFRoYXQncyBhIG1hdHRlciBvZiBob3cgeW91IGxvb2sgYXQgaXQsIEkgdGhpbms6
IElmIHRoZSBvcmlnaW5hbCBhcnJheQ0KPj4+Pj4+IGRvZXNuJ3QgaG9sZCBhIG51bC10ZXJtaW5h
dGVkIHN0cmluZywgdGhlIGRlc3RpbmF0aW9uIGFycmF5IHdvbid0DQo+Pj4+Pj4gZWl0aGVyLCB5
ZXQgdGhlIGNvbW1vbiBnb2FsIG9mIHN0cm5jcHkoKSBpcyB0byB5aWVsZCBhIHByb3Blcmx5IG51
bC0NCj4+Pj4+PiB0ZXJtaW5hdGVkIHN0cmluZy4gSU9XIHRoZSB3YXJuaW5nIG1heSBiZSBzaW5j
ZSB0aGUgc3RhbmRhcmQgZXZlbiBoYXMNCj4+Pj4+PiBhIHNwZWNpZmljIGZvb3Qgbm90ZSB0byBw
b2ludCBvdXQgdGhpcyBwb3NzaWJsZSBwaXRmYWxsLg0KPj4+Pj4gDQo+Pj4+PiBJZiB0aGUgc291
cmNlIGRvZXNuJ3QgaG9sZCBhIG51bC10ZXJtaW5hdGVkIHN0cmluZyB0aGVyZSB3aWxsIHN0aWxs
IGJlDQo+Pj4+PiAyNTYgYnl0ZXMgY29waWVkLCBzbyB0aGVyZSBpcyBubyB0cnVuY2F0aW9uIGRv
bmUgZHVyaW5nIHN0cm5jcHkoKS4NCj4+Pj4+IA0KPj4+Pj4gSW4gZmFjdCB0aGVyZSBpcyBubyB3
YXkgdG8gdXNlIHN0cm5jcHkoKSBpbiBhIHNhZmUgd2F5IG9uIGEgZml4ZWQgc2l6ZWQNCj4+Pj4+
IHNvdXJjZSBhcnJheSB3aXRoIHRoZSBhYm92ZSBzZW1hbnRpY3M6IGVpdGhlciB0aGUgdGFyZ2V0
IGlzIGxhcmdlciB0aGFuDQo+Pj4+PiB0aGUgc291cmNlIGFuZCBsZW5ndGggaXMgYXQgbGVhc3Qg
c2l6ZW9mKHNvdXJjZSkgKyAxLCByZXN1bHRpbmcgaW4gYQ0KPj4+Pj4gcG9zc2libGUgcmVhZCBi
ZXlvbmQgdGhlIGVuZCBvZiBzb3VyY2UsIG9yIHRoZSB0YXJnZXQgaXMgdGhlIHNhbWUgbGVuZ3Ro
DQo+Pj4+PiBsZWFkaW5nIHRvIHRoZSBlcnJvci4NCj4+Pj4gSSBhZ3JlZSB3aXRoIGFsbCBvZiB3
aGF0IHlvdSBzYXksIGJ1dCBJIGNhbiBhbHNvIHNlZSB3aHkgc2FpZCBmb290IG5vdGUNCj4+Pj4g
YWxvbmUgbWF5IGhhdmUgbW90aXZhdGVkIHRoZSBlbWlzc2lvbiBvZiB0aGUgd2FybmluZy4NCj4+
PiANCj4+PiBUaGUgbW90aXZhdGlvbiBjYW4gYmUgZXhwbGFpbmVkLCB5ZXMsIGJ1dCBpdCBpcyB3
cm9uZy4gc3RybmNweSgpIGlzIG5vdA0KPj4+IGxpbWl0ZWQgdG8gc291cmNlIGFycmF5cyBvZiB1
bmtub3duIGxlbmd0aC4gU28gdGhpcyB3YXJuaW5nIGlzIG1ha2luZw0KPj4+IHN0cm5jcHkoKSB1
bnVzYWJsZSBmb3IgZml4ZWQgc2l6ZWQgc291cmNlIHN0cmluZ3MgYW5kIC1XZXJyb3IuIEFuZCB0
aGF0DQo+Pj4gaXMgbm90aGluZyBhIGNvbXBpbGVyIHNob3VsZCBiZSBhbGxvd2VkIHRvIGRvLCBo
ZW5jZSBhIGNvbXBpbGVyIGJ1Zy4NCj4+IEkgZG8gYWdyZWUgdGhhdCBpbiB0aGlzIGNhc2UgdGhl
IGNvbXBpbGVyIGlzIGRvaW5nIHRvIG11Y2guDQo+IA0KPiBJdCBpcyBwbGFpbiB3cm9uZyBoZXJl
LiBSZW5kZXJpbmcgYSBQb3NpeCBkZWZpbmVkIGZ1bmN0aW9uIHVudXNhYmxlIGZvcg0KPiBhIGNv
bXBsZXRlbHkgbGVnYWwgdXNlIGNhc2UgaXMgaW4gbm8gd2F5IGEgbWF0dGVyIG9mIHRhc3RlIG9y
IG9mICJkb2luZw0KPiB0byBtdWNoIi4gSXQgaXMgYSBidWcuDQoNCkFncmVlLg0KDQo+IA0KPj4g
V2UgY291bGQgYWxzbyBjaG9vc2UgdG8gdHVybiBvZmYgdGhlIHdhcm5pbmcgZWl0aGVyIHVzaW5n
IHByYWdtYSAod2hpY2gNCj4+IGkgcmVhbGx5IGRvIG5vdCBsaWtlKSBvciBieSBhZGRpbmcgYSBj
ZmxhZyBmb3IgdGhpcyBzcGVjaWZpYyBmaWxlIChidXQgdGhpcyBtaWdodA0KPj4gaGl0IHVzIGxh
dGVyIGluIG90aGVyIHBsYWNlcykuDQo+PiBBbGwgaW4gYWxsIHRoaXMgY3VycmVudGx5IG1ha2Vz
IFhlbiBtYXN0ZXIgYW5kIHN0YWdpbmcgbm90IHBvc3NpYmxlIHRvDQo+PiBjb21waWxlIHdpdGgg
WW9jdG8gc28gd2UgbmVlZCB0byBmaW5kIGEgc29sdXRpb24gYXMgdGhpcyB3aWxsIGFsc28NCj4+
IGNvbWUgaW4gYW55IGRpc3RyaWJ1dGlvbiB1c2luZyBhIG5ldyBjb21waWxlciwNCj4gDQo+IEEg
dmFyaWFudCB5b3UgZGlkbid0IG1lbnRpb24gd291bGQgYmUgb3BlbiBjb2Rpbmcgb2Ygc3RybmNw
eSgpIChvcg0KPiBoYXZpbmcgYSByZWxhdGVkIGlubGluZSBmdW5jdGlvbiBpbiBhIGNvbW1vbiBo
ZWFkZXIpLiBUaGlzIHJvdXRlIHdvdWxkDQo+IGJlIHRoZSBvbmUgSSdkIHByZWZlciBpbiBjYXNl
IHRoZSBjb21waWxlciBndXlzIGluc2lzdCBvbiB0aGUgYmVoYXZpb3INCj4gYmVpbmcgZmluZS4N
Cg0KVHJ1ZSB0aGlzIHBvc3NpYmxlLCBldmVuIHRob3VnaCBJIGRvIG5vdCBsaWtlIHRvIG1vZGlm
eSB0aGUgY29kZSB0aGF0IGRlZXBseQ0KZm9yIG9uZSBzcGVjaWZpYyBjb21waWxlci4NCg0KPiAN
Cj4gWW91IGRpZG4ndCB0ZWxsIHVzIHdoaWNoIGNvbXBpbGVyIGlzIGJlaW5nIHVzZWQgYW5kIHdo
ZXRoZXIgaXQgcmVhbGx5IGlzDQo+IHVwIHRvIGRhdGUuIEEgd29ya2Fyb3VuZCBtaWdodCBiZSB0
byBzZXQgRVhUUkFfQ0ZMQUdTX1hFTl9UT09MUyB0bw0KPiAiLVduby1zdHJpbmdvcC10cnVuY2F0
aW9uIiBmb3IgdGhlIGJ1aWxkLg0KDQpUaGF04oCZcyB3aGF0IGkgbWVhbnQgYnkg4oCcYWRkaW5n
IGEgY2ZsYWfigJ0sIGFzIHlvdSBzdWdnZXN0IHdlIGNvdWxkIGFsc28NCm1ha2UgaXQgZ2xvYmFs
IChhbmQgbm90IGxpbWl0IGl0IHRvIHRoaXMgZmlsZSkuDQoNClRoZSBjb21waWxlciBJIGFtIHVz
aW5nIGlzIHRoZSBvbmUgZnJvbSBZb2N0byBHYXRlc2dhcnRoIChyZWxlYXNlIGNvbWluZyBpbg0K
b2N0b2Jlcik6IGdjYyB2ZXJzaW9uIDEwLjIuMCAocmVsZWFzZWQgaW4ganVseSAyMDIwKS4NCg0K
Q2hlZXJzDQoNCkJlcnRyYW5kDQoNCg0K

