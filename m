Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B82B69BE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 17:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29113.58368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf3eW-0003uc-Qs; Tue, 17 Nov 2020 16:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29113.58368; Tue, 17 Nov 2020 16:16:20 +0000
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
	id 1kf3eW-0003uD-NU; Tue, 17 Nov 2020 16:16:20 +0000
Received: by outflank-mailman (input) for mailman id 29113;
 Tue, 17 Nov 2020 16:16:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kf3eU-0003u8-Pl
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:16:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c526d1d-3190-4609-bdb1-b0747e10aaa8;
 Tue, 17 Nov 2020 16:16:17 +0000 (UTC)
Received: from DU2PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:10:231::23)
 by DBBPR08MB4646.eurprd08.prod.outlook.com (2603:10a6:10:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:16:09 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::83) by DU2PR04CA0138.outlook.office365.com
 (2603:10a6:10:231::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 16:16:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 16:16:08 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Tue, 17 Nov 2020 16:16:07 +0000
Received: from fb6a45815400.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62FB1B25-6CC3-40A0-A0BE-EE6BF0EE9F15.1; 
 Tue, 17 Nov 2020 16:16:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb6a45815400.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Nov 2020 16:16:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:16:00 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 16:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/ssn=EX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kf3eU-0003u8-Pl
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 16:16:18 +0000
X-Inumbo-ID: 0c526d1d-3190-4609-bdb1-b0747e10aaa8
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [40.107.14.71])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0c526d1d-3190-4609-bdb1-b0747e10aaa8;
	Tue, 17 Nov 2020 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fASpjCsbyuVHI9z61R7qORpV7CHHXBCue/CIu4KnHA=;
 b=riLhm9ak5+HKd4za2uL+hJqmQ2H44HJK/W80bAFz9mVpBbgKqqGG+A7yWZBGURMr1szxTwF+EQMC3jTf7UAl6Xm8ZwMEFn0XdUmB3MLLmjI9RjwbM2cL9oY8mDvrWghvWW81pSlDfRAiqniSkqKoxhi++D1gRiXxapuoMapEsNI=
Received: from DU2PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:10:231::23)
 by DBBPR08MB4646.eurprd08.prod.outlook.com (2603:10a6:10:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:16:09 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::83) by DU2PR04CA0138.outlook.office365.com
 (2603:10a6:10:231::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 16:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 16:16:08 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 17 Nov 2020 16:16:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf38d7dca9684757
X-CR-MTA-TID: 64aa7808
Received: from fb6a45815400.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 62FB1B25-6CC3-40A0-A0BE-EE6BF0EE9F15.1;
	Tue, 17 Nov 2020 16:16:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb6a45815400.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 16:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRRpY6cL/Ru0cbLL/CXrbjOGnZ1cylao0hsQbzhzQh8iVD6/PG1YGl9S2dCM4seYvnWzNKxNhVt9kLvIg/qNrnFEYup8VjJn8CX8fjMRw5O0LEEyMk9OE1PdRVyL0Zhprc1gskfljR4PHv/DuMg3IShwTeLL5qn/2BC7OHbjcazJxj99cYzLy4Uho98/E3gmw3x4B7/qmcAIlhFYEAqRfk8UoXk6ZqpXDplZT+olTYNX/DTjcrDm4nCxSiEL/5eW/W+RtlP2Nik8AtWeoKU3Fk1naiDL+In+f+1lccsTMd/7N07rGF5aD1BMfMvtjC1JKDKV//MRl28dC02THuPvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fASpjCsbyuVHI9z61R7qORpV7CHHXBCue/CIu4KnHA=;
 b=jRUsBqsqlZ2p41ATY1OXQlA4oKPxiIZxvGYeDMwb4Nou/I26oBKsfuC6x6k/ODbRPug5eZ1acHNEwzvfIPANfukSj/nRoKzNOF266c2HfRK6xhDOf+0fgpuixcozYIRhdYFUz+VI7/AsMWGPseiVjyBj96mZN4ZzEdojA+ZqwmI5pANgQ0H9h9WRMoR7zpDLipIabRowoXglrT1ndhEoMDp0ZPWX6ZTMi2dRBtWsJlsn5NnuSA+gM1cX9UJvWzUIqVfaXbZX0+aV5VLAUHLyiUf265fyyhA961luA9ha/OEqyUiezXb+d+kzeTJQb34Gn42vK5cT41q8HzboVoCBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fASpjCsbyuVHI9z61R7qORpV7CHHXBCue/CIu4KnHA=;
 b=riLhm9ak5+HKd4za2uL+hJqmQ2H44HJK/W80bAFz9mVpBbgKqqGG+A7yWZBGURMr1szxTwF+EQMC3jTf7UAl6Xm8ZwMEFn0XdUmB3MLLmjI9RjwbM2cL9oY8mDvrWghvWW81pSlDfRAiqniSkqKoxhi++D1gRiXxapuoMapEsNI=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 16:16:00 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 16:16:00 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Topic: [PATCH v3 3/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Index: AQHWvBO4hlySn5llrk6lgfFsXmzQpanMLQIAgABUtAA=
Date: Tue, 17 Nov 2020 16:15:59 +0000
Message-ID: <F2F25880-2407-479F-9BC0-1DBA7FD59F4E@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <efa0c2578a6aabb642b8f38257cf96a983944301.1605527997.git.rahul.singh@arm.com>
 <fe73928e-bf95-234d-c181-4904a13ad0a1@suse.com>
In-Reply-To: <fe73928e-bf95-234d-c181-4904a13ad0a1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 143fc315-eb85-47df-ab92-08d88b14178b
x-ms-traffictypediagnostic: DB8PR08MB5385:|DBBPR08MB4646:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB464634F21604E0904B859558FCE20@DBBPR08MB4646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ordUuHS0/ROgxyB9czjUmr9K7cEADmZVsZAOlg+YCw2ExjxSQY8BIfbvcWEktQ5ctCYZ7GgGc5VAwj6Wa8K+dLj4zPvad4cJFZNjNwmVEuwYoOKXHncM8iDwJIiLiJRLp5JB594yWZykJOzS/hBLqQGeg4h4KdLBxpjjKghlKmFUp60+jn8gWaeI++A0LlH958UJREc+hEebffT5aimcY/Rz2vUs2fqiQqVyA269HiwaIQPYLkeZxL74aQ0TDg4eHTWZISb84T79tvykRUKVqGsRVinQiEeSTmzLXowopeeo3/uceuRJE+0pGt2xthDcsIh5kckUBOF3JPopVpcp2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(186003)(26005)(6916009)(2906002)(54906003)(316002)(8676002)(66476007)(91956017)(8936002)(33656002)(64756008)(76116006)(6506007)(66556008)(66446008)(6512007)(66946007)(4326008)(53546011)(86362001)(5660300002)(478600001)(6486002)(83380400001)(71200400001)(2616005)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 D5pE7+uHwLcJFnH9FZYpAh3tv3vdM+GEYFYnhlbIH8PgGCTOY+5OF3bZgBY72x28IDBV0S1Ft+XkIKufLXAZUiBZph3MEDimxKfDU6lKPFkBqvThvA7z+AXH1tvG60hgFMQahh58eCYNSc3JUaZWXia3UM43O1oHLfgOp9gpl921dwzhmdZzSS0bPtqfItozQQRyHrTLrLR9OLJyJX3JjjTiz3jP6fCFFxpBgwrMY6GGc9DMPbCM/AIuOabDjkC0LcMKcUQrxcA8LTUJyhSGeRFK2u0jIJkSLYdh/QkRCty9toIMQEogQEO6oyC/9FV9ZksHUar2gNKb+vy4PZP8IrWZm1Uwyu1O5gQRWMAwx0NvS2a84Iisx51OJm+68DF+EZBafnEmhp7YqaEiV/OBjIYvPluqbA5u1kT3aksmevriUn2oR54X3OAZMDQx0qCFdT6yd+0CvhuTuwvdNH6aYMAse7aCatnnHrRHd7/x2kcaKEVV/G/iMlnhnGjC+HT07MdVtzbQTcrOWXfY+BMSKfM4urcBJVLwjPWwd3BV+ziL2nxLfMycfu2DDvkhgKgkRLAAsdZip3I58rOoJ8CuCgp3/DXEZZsqpWBkvIOv9MKjFrn4WMgyBJYbCh2u9SjlHmfCvmUq/FyiNQWYMXS2tGPurn94JTLC7U4tGQLVSbKjd6VQcImSI62avTVFSbLe4InC0kki3dEHpHLrFN61i9JUwxwqoSXXd2oXz73OULu8Ct5H4J10QaKlSqd6/rWFGe5zVPyJoaAb5h7IIPrlqQEJvuIrefE+N3+CQDzeKN6fiTAxZpwLAi4VLwfJp2w/Ig4P6N4Q4eAtz8hRog7pW3s/2K1lCaws6iYrD1lJzi9l6nloYoeFV47f0TyCLzrANLKSSyxA8KV/WtD2c9tKag==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ED3CC1ACE394A49A0EC231B54493D7E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6fcdc788-7e6b-40f1-44e3-08d88b1412ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	asbHoAuXdzjpKSB/i9CgJktl+CiXHOQjdaUlKhgMAfbXHo/T5P+zWBTw/evuaesIPnpLk0qPfbQCkPbp17UeNmkCIKmB0XTkffCFhKKzB6VGSDnp4dGjQhYyvkykx11uqpvN7zweQ33ebdxwOPYCvzuVoxANjKd+HGk0oVbb1L08n19w5/kxR8p+qUdidUYaOWnYLQWmDWymv2esJGWB5c/mNn18+lYwRKEtYtI0QqiZDBGJR25lTVZwqGZfVbI7nW4bilIvfyinm0tiwRZAOMotTgyXGvzdmLh8jWaTbbvvEUuxzZ2tJEN09nnxLQnpBYpHU6nfxXY9mXpdKbZZq66zqX/iJTz2WObqqTpITANhanmPJyL66C+o29YpK/4W9y/0ALuCBk/0zv+/QCgvTA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(53546011)(83380400001)(2906002)(26005)(478600001)(47076004)(6862004)(36756003)(186003)(33656002)(6512007)(316002)(82310400003)(8676002)(336012)(8936002)(6506007)(2616005)(5660300002)(356005)(54906003)(70586007)(81166007)(70206006)(4326008)(86362001)(82740400003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 16:16:08.3471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143fc315-eb85-47df-ab92-08d88b14178b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4646

SGVsbG8gSmFuLA0KDQo+IE9uIDE3IE5vdiAyMDIwLCBhdCAxMToxMiBhbSwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjExLjIwMjAgMTM6MjUsIFJh
aHVsIFNpbmdoIHdyb3RlOg0KPj4gSWYgbWVtLXNoYXJpbmcsIG1lbS1wYWdpbmcsIG9yIGxvZy1k
aXJ0eSBmdW5jdGlvbmFsaXR5IGlzIG5vdCBlbmFibGVkDQo+PiBmb3Igbm9uLXg4NiBhcmNoaXRl
Y3R1cmUgd2hlbiBIQVNfUENJIGlzIGVuYWJsZWQsIHRoZSBjb21waWxlciB3aWxsDQo+PiB0aHJv
dyBhbiBlcnJvci4NCj4+IA0KPj4gTW92ZSBjb2RlIHRvIHg4NiBzcGVjaWZpYyBkaXJlY3Rvcnkg
dG8gZml4IGNvbXBpbGF0aW9uIGVycm9yLg0KPiANCj4gUGVyaGFwcyByYXRoZXIgImZpbGUiIHRo
YW4gImRpcmVjdG9yeeKAnT8NCk9rLg0KPiANCj4+IEFsc28sIG1vZGlmeSB0aGUgY29kZSB0byB1
c2UgbGlrZWx5KCkgaW4gcGxhY2Ugb2YgdW5saWtsZXkoKSBmb3IgZWFjaA0KPj4gY29uZGl0aW9u
IHRvIG1ha2UgY29kZSBtb3JlIG9wdGltaXplZC4NCj4+IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0u
Y29tPg0KPiANCj4gSW4gcHJpbmNpcGxlIEknbSBva2F5IHdpdGggdGhpcyBub3csIGJ1dCB0aGVy
ZSBjb250aW51ZSB0byBiZSBhIGZldw0KPiBuaXRzOg0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0
aGUgY29kZSBJIHdpbGwgZml4IGFsbCBjb21tZW50cyBhbmQgd2lsbCBzaGFyZSB0aGUgbmV4dCB2
ZXJzaW9uLg0KPiANCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYw0KPj4gQEAgLTIz
LDYgKzIzLDcgQEANCj4+ICNpbmNsdWRlIDxhc20vaHZtL2lvLmg+DQo+PiAjaW5jbHVkZSA8YXNt
L2lvX2FwaWMuaD4NCj4+ICNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4+ICsjaW5jbHVkZSA8eGVu
L3ZtX2V2ZW50Lmg+DQo+IA0KPiBQbGVhc2UgaW5zZXJ0IHRoaXMgYWxvbmdzaWRlIHRoZSBvdGhl
ciAiI2luY2x1ZGUgPHhlbi8uLi4+IiBoaWdoZXIgdXAuDQoNCk9rLg0KPiANCj4+IEBAIC0zMTUs
NiArMzE2LDE3IEBAIGludCBpb21tdV91cGRhdGVfaXJlX2Zyb21fbXNpKA0KPj4gICAgICAgICAg
ICA/IGlvbW11X2NhbGwoJmlvbW11X29wcywgdXBkYXRlX2lyZV9mcm9tX21zaSwgbXNpX2Rlc2Ms
IG1zZykgOiAwOw0KPj4gfQ0KPj4gDQo+PiArYm9vbCBhcmNoX2lvbW11X3VzZV9wZXJtaXR0ZWQo
Y29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFBy
ZXZlbnQgZGV2aWNlIGFzc2lnbiBpZiBtZW0gcGFnaW5nLCBtZW0gc2hhcmluZyBvciBsb2ctZGly
dHkNCj4+ICsgICAgICogaGF2ZSBiZWVuIGVuYWJsZWQgZm9yIHRoaXMgZG9tYWluLg0KPj4gKyAg
ICAgKi8NCj4+ICsgICAgcmV0dXJuIGQgPT0gZG9tX2lvIHx8DQo+PiArICAgICAgICAgICAobGlr
ZWx5KCFtZW1fc2hhcmluZ19lbmFibGVkKGQpKSAmJg0KPj4gKyAgICAgICAgICAgIGxpa2VseSgh
dm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpKSAmJg0KPj4gKyAgICAgICAg
ICAgIGxpa2VseSghcDJtX2dldF9ob3N0cDJtKGQpLT5nbG9iYWxfbG9nZGlydHkpKTsNCj4+ICt9
DQo+PiAvKg0KPj4gICogTG9jYWwgdmFyaWFibGVzOg0KPj4gICogbW9kZTogQw0KPiANCj4gUGxl
YXNlIGRvbid0IGFsdGVyIHN0eWxpc3RpYyBhc3BlY3RzIGxpa2UgdGhpcyB0cmFpbGluZyBjb21t
ZW50DQo+IGJlaW5nIHByZWNlZGVkIGJ5IGEgYmxhbmsgbGluZS4NCg0KT2suDQo+IA0KPj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oDQo+PiBAQCAtMzgxLDYgKzM4MSw4IEBAIERFQ0xBUkVfUEVSX0NQVShib29sX3QsIGlvbW11
X2RvbnRfZmx1c2hfaW90bGIpOw0KPj4gZXh0ZXJuIHN0cnVjdCBzcGlubG9jayBpb21tdV9wdF9j
bGVhbnVwX2xvY2s7DQo+PiBleHRlcm4gc3RydWN0IHBhZ2VfbGlzdF9oZWFkIGlvbW11X3B0X2Ns
ZWFudXBfbGlzdDsNCj4+IA0KPj4gK2Jvb2wgYXJjaF9pb21tdV91c2VfcGVybWl0dGVkKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpOw0KPiANCj4gSnVzdCBGVFIgLSB0aGlzIHdheSB5b3UgZWZmZWN0
aXZlbHkgcHJlY2x1ZGUgYW4gYXJjaCBmcm9tDQo+IG1ha2luZyB0aGlzIGEgdHJpdmlhbCBzdGF0
aWMgaW5saW5lIGluIG9uZSBvZiBpdHMgaGVhZGVycy4NCj4gDQo+IEphbg0KDQo=

