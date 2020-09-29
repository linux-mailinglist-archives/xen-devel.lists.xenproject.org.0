Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB827C402
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.35.178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDX8-00083D-Ua; Tue, 29 Sep 2020 11:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35.178; Tue, 29 Sep 2020 11:10:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDX8-000821-Le; Tue, 29 Sep 2020 11:10:58 +0000
Received: by outflank-mailman (input) for mailman id 35;
 Tue, 29 Sep 2020 11:10:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kNDX6-00081H-F4
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3c84c3a-9ed9-41cf-a4cd-e46b3b0a77c6;
 Tue, 29 Sep 2020 11:10:53 +0000 (UTC)
Received: from DB6PR0501CA0004.eurprd05.prod.outlook.com (2603:10a6:4:8f::14)
 by AM6PR08MB4518.eurprd08.prod.outlook.com (2603:10a6:20b:b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:10:51 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::ea) by DB6PR0501CA0004.outlook.office365.com
 (2603:10a6:4:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 11:10:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:10:50 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 29 Sep 2020 11:10:50 +0000
Received: from 4c72f0eee717.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11FEBA59-EF8C-44AE-9B42-CE2CA217966C.1; 
 Tue, 29 Sep 2020 11:10:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c72f0eee717.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Sep 2020 11:10:13 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 11:10:11 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:10:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kNDX6-00081H-F4
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:56 +0000
X-Inumbo-ID: c3c84c3a-9ed9-41cf-a4cd-e46b3b0a77c6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.79])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3c84c3a-9ed9-41cf-a4cd-e46b3b0a77c6;
	Tue, 29 Sep 2020 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibCHE4+jSnvlz5Rsnu55g75oNhtwChMB8neQAThfUeA=;
 b=mUN5fhLV6kt8tkyJBUx811+UKpR+DoggTRBpjAe7buqutCuTDW3DKnfHl8tb6dYKK4R3bHmSv3Zohfi5CqDEmk6Fx0iPGe6bF1TfJrjGOLzN4KClUqEb8loXG0KeIeqjtRFOmRhOh5cWjcgu+Dlt1dOYwojwx15zg5wBRbfnY/Y=
Received: from DB6PR0501CA0004.eurprd05.prod.outlook.com (2603:10a6:4:8f::14)
 by AM6PR08MB4518.eurprd08.prod.outlook.com (2603:10a6:20b:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:10:51 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::ea) by DB6PR0501CA0004.outlook.office365.com
 (2603:10a6:4:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 11:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:10:50 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 29 Sep 2020 11:10:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5472b697c2c29a0
X-CR-MTA-TID: 64aa7808
Received: from 4c72f0eee717.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 11FEBA59-EF8C-44AE-9B42-CE2CA217966C.1;
	Tue, 29 Sep 2020 11:10:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c72f0eee717.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Sep 2020 11:10:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDBhofVybdGp1EnsVVs3ZoLjQzSGarOFFMSZn0ICd+A6orgMmT5c29xT+zfmnzDqrXNVANNjQkYy3jOKqPWmaKRp1jhsrhr5oXjzpu6Qd7uFkeTlBckkEZI4FKAIGngLa7T1QARUlYQ7wEoXMjCuefw9w0j/Onqjr1OuY2yOJ8fbwf0U+5I/4UmJ0SmQGTF8dTVxOpXMSZMmz80M9DM8o825KmnWb/hgN3PJUTXVXWkC4O8iU7uDEvYg3xR4De6l8mGyZAT9wq3wTY0AuTFKoMgZqbGe3whqmY2236AbkWg1BdjIh4gSwMkVgrRUeLUYHzxjwyzO/UBH6PJJoq0j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibCHE4+jSnvlz5Rsnu55g75oNhtwChMB8neQAThfUeA=;
 b=D09pNS8GA4cG/yvHK2eoYJ8tVHpKNBrBPq8/yQZsdqqok8UgbMI4OOApri32cuwlqDkFNmIvckiAE+N5xgw7lr1ECx4aR0FWRs7DqzoPR77zYhEFQMJDGvh/rOI/OPEbnZOHL0MCLk33RNTwuQioeslh6tAyB1kBGXHr7MrgCL1ZAK/Bvu6wwxc2I/TnEBD+MVIu07Qs9ofMeX/WFo1/i9+3Hi6LfxsOWwx/5MD0bQo5HgzLZD2KO2WlopFz7In0rRTzPq0h4SQ6JrvzkGggB/0e7j9xdv/sVmtzPDJy0Oqso7pEPVzktLTYnYtwltLpVLCSE4wfWdEDDnNGEewMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibCHE4+jSnvlz5Rsnu55g75oNhtwChMB8neQAThfUeA=;
 b=mUN5fhLV6kt8tkyJBUx811+UKpR+DoggTRBpjAe7buqutCuTDW3DKnfHl8tb6dYKK4R3bHmSv3Zohfi5CqDEmk6Fx0iPGe6bF1TfJrjGOLzN4KClUqEb8loXG0KeIeqjtRFOmRhOh5cWjcgu+Dlt1dOYwojwx15zg5wBRbfnY/Y=
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 11:10:11 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:10:11 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
	"ehem+xen@m5p.com" <ehem+xen@m5p.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
Thread-Topic: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
Thread-Index: AQHWlEeqTjM+UnBm00C6Ass2V2ltOKl/ePwA
Date: Tue, 29 Sep 2020 11:10:11 +0000
Message-ID: <D668E983-B026-49C1-9FF2-2D45E1B80D02@arm.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-2-julien@xen.org>
In-Reply-To: <20200926205542.9261-2-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 720f931a-5fd5-4586-e8df-08d864685339
x-ms-traffictypediagnostic: DB7PR08MB2987:|AM6PR08MB4518:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB45185D2D3998EEE463F1ACADFC320@AM6PR08MB4518.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kUuY4dc8VeZLaRuCKqB3gj69y4vTJ7eKyGDSUa/sUTh8PwLUFEqlBsy56yWxqe+Dn7SFJ3pno45zKArfd6snwEfv5hB3it9/vZxymHBCCxsCfdM6AFURrE538jGN5STsF4HNoyXL41OI8KHdnZkAirhDixtC5hekRVCz6pvaONJ0KDi25lASdxhVlIXc3wruJA7vFmOTkM1vIAHRY6z0MN4VsmUI9YW/YFoX57ZKmBLsUSWMiRsTHcJ32dNhozBTxwRSNGUQrYGx+OM+ipTaPPEBOUGGz8TvThkhJ5R1Juero13MZbSz+2Pn8fU0E90W/zdef4JAZq2fuICCjkwtlWIlovpBCGez4YbJbZShXcIE5hNSXbAi2qMu8gRjzIQr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5702.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(66556008)(76116006)(6506007)(5660300002)(7416002)(54906003)(6512007)(83380400001)(71200400001)(186003)(26005)(55236004)(53546011)(91956017)(2906002)(4326008)(36756003)(86362001)(66946007)(64756008)(66476007)(66446008)(8936002)(478600001)(8676002)(33656002)(6916009)(2616005)(316002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Ov7p/XFBI3Co92kBQ+DTtoif4igbqG2kuLiiaLvh9oDqRx6S5Fq95gtIvTflyXmr9GBxLl02X4t+NJQIsRmsLbM3hCoPRCAvnFuCrip3wZP/kkW4ZHAITK41DohXug1CPgyfVYSDsokzOJn59Bir82kV0TiGwJl7qKM36BR+jb6qQ5qWP5SeCm5VObG3Gq75j0Oy5FV9Xgi2SD+bHPvBsb2gOVnxYr2sJfvLRoI8OoyhzEadGm3cnDtPDD5KYEm+5i/7jLPvJMzwFCGiO2kfosalQWpoafTFkeSWGQA4aBj56cm0hUor04C86jOw2Rg/cxJU196/ReLdKlZbOv97mYfcapykLH+slHUZrtQeTra+a0zTr4YCFDuNc+vqH5LOjxvcS6gzbtDlAxZwFN00OQTK2TjBxu85Wj2KXUMf5Yn3CcRHkWjO79Uci5Ok2SkRyloJBdJjlTEkBOxscqE8JcKCPB0JX0FkIWtItRY/eC8L/f5uRYxJmaPx71S2PzgRI+J+JknVITsqIMrtZha1BpTgNqh83avIy7IKMds2pkWRhyun4JuUGGJYYinFQY8RHlv90nJIcOQb1/6jp69AnIBdqH8UYGBWj44xZD8FnSASrNm527H/fzOGeR9JegiwdwtUwPvT8zb/jIYulPuHkA==
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7FD80E0DE215EA4AB383DDF7B3B3F48D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2987
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc079551-3848-4f54-0c15-08d864683bab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67NUZKvMILBzHmygwsivsdW7XVJ0nlqQs+F0y8PFciG5aHDMgFfZ9e6xDcoaLO4Tpj/zs2boOh+xVVafx4SYluu3Drhw2DcjZqNjhmUr0xwzGsjVbDCNRf+Ii5IjOVqp/nCb9vmQCNb7eQcKhbLLeHtOayFctXspmQ9fZTqEaFcyVUZfQadINZXDP1ehK3WllJptqxSBL77fFWXbyfcP5Z2r964lHlnkNXxem6irEu8mCc2206E/TqDJhVqtiLDOZzrfI89DXSVjE9Nk9fEXbicw9GosGq9GUrfs/kdyQMxTVsFIWJXE7Kch6PDSNO8OeKNPqBR6TZYRpP7gcgwyestuqLZBYnwUMU1qUPw/d/uzZRH29XbPlJsPra7Y5F3xLAvYe4Jgky/G6eAGKTh74mWgoWq4DHGQ5ZDG/230OW4AV5hQzG8CG2z6jsaxCl4S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39840400004)(136003)(346002)(376002)(46966005)(5660300002)(107886003)(82310400003)(47076004)(6486002)(8676002)(70586007)(70206006)(478600001)(83380400001)(6512007)(86362001)(356005)(54906003)(316002)(2906002)(26005)(81166007)(36756003)(186003)(6506007)(53546011)(55236004)(8936002)(2616005)(336012)(4326008)(33656002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:10:50.8535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720f931a-5fd5-4586-e8df-08d864685339
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4518

Hello,

> On 26 Sep 2020, at 9:55 pm, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
>=20
> Currently, the former are still containing x86 specific code.
>=20
> To avoid this rather strange split, the generic helpers are reworked so
> they are arch-agnostic. This requires the introduction of a new helper
> __acpi_os_unmap_memory() that will undo any mapping done by
> __acpi_os_map_memory().
>=20
> Currently, the arch-helper for unmap is basically a no-op so it only
> returns whether the mapping was arch specific. But this will change
> in the future.
>=20
> Note that the x86 version of acpi_os_map_memory() was already able to
> able the 1MB region. Hence why there is no addition of new code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> xen/arch/arm/acpi/lib.c | 10 ++++++++++
> xen/arch/x86/acpi/lib.c | 18 ++++++++++++++++++
> xen/drivers/acpi/osl.c  | 34 ++++++++++++++++++----------------
> xen/include/xen/acpi.h  |  1 +
> 4 files changed, 47 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
> index 4fc6e17322c1..2192a5519171 100644
> --- a/xen/arch/arm/acpi/lib.c
> +++ b/xen/arch/arm/acpi/lib.c
> @@ -30,6 +30,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long siz=
e)
>     unsigned long base, offset, mapped_size;
>     int idx;
>=20
> +    /* No arch specific implementation after early boot */
> +    if ( system_state >=3D SYS_STATE_boot )
> +        return NULL;
> +
>     offset =3D phys & (PAGE_SIZE - 1);
>     mapped_size =3D PAGE_SIZE - offset;
>     set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> @@ -49,6 +53,12 @@ char *__acpi_map_table(paddr_t phys, unsigned long siz=
e)
>     return ((char *) base + offset);
> }
>=20
> +bool __acpi_unmap_table(void *ptr, unsigned long size)
> +{
> +    return ( vaddr >=3D FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
> +             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
> +}
> +
> /* True to indicate PSCI 0.2+ is implemented */
> bool __init acpi_psci_present(void)
> {
> diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
> index 265b9ad81905..77803f4d4c63 100644
> --- a/xen/arch/x86/acpi/lib.c
> +++ b/xen/arch/x86/acpi/lib.c
> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long siz=
e)
> 	if ((phys + size) <=3D (1 * 1024 * 1024))
> 		return __va(phys);
>=20
> +	/* No arch specific implementation after early boot */
> +	if (system_state >=3D SYS_STATE_boot)
> +		return NULL;
> +
> 	offset =3D phys & (PAGE_SIZE - 1);
> 	mapped_size =3D PAGE_SIZE - offset;
> 	set_fixmap(FIX_ACPI_END, phys);
> @@ -66,6 +70,20 @@ char *__acpi_map_table(paddr_t phys, unsigned long siz=
e)
> 	return ((char *) base + offset);
> }
>=20
> +bool __acpi_unmap_table(void *ptr, unsigned long size)
> +{
> +	unsigned long vaddr =3D (unsigned long)ptr;
> +
> +	if (vaddr >=3D DIRECTMAP_VIRT_START &&
> +	    vaddr < DIRECTMAP_VIRT_END) {
> +		ASSERT(!((__pa(ptr) + size - 1) >> 20));
> +		return true;
> +	}
> +
> +	return (vaddr >=3D __fix_to_virt(FIX_ACPI_END)) &&
> +		(vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE));
> +}
> +
> unsigned int acpi_get_processor_id(unsigned int cpu)
> {
> 	unsigned int acpiid, apicid;
> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 4c8bb7839eda..100eee72def2 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -92,27 +92,29 @@ acpi_physical_address __init acpi_os_get_root_pointer=
(void)
> void __iomem *
> acpi_os_map_memory(acpi_physical_address phys, acpi_size size)
> {
> -	if (system_state >=3D SYS_STATE_boot) {
> -		mfn_t mfn =3D _mfn(PFN_DOWN(phys));
> -		unsigned int offs =3D phys & (PAGE_SIZE - 1);
> -
> -		/* The low first Mb is always mapped on x86. */
> -		if (IS_ENABLED(CONFIG_X86) && !((phys + size - 1) >> 20))
> -			return __va(phys);
> -		return __vmap(&mfn, PFN_UP(offs + size), 1, 1,
> -			      ACPI_MAP_MEM_ATTR, VMAP_DEFAULT) + offs;
> -	}
> -	return __acpi_map_table(phys, size);
> +	void *ptr;
> +	mfn_t mfn =3D _mfn(PFN_DOWN(phys));
> +	unsigned int offs =3D phys & (PAGE_SIZE - 1);
> +
> +	/* Try the arch specific implementation first */
> +	ptr =3D __acpi_map_table(phys, size);
> +	if (ptr)
> +		return ptr;
> +
> +	/* No common implementation for early boot map */
> +	if (unlikely(system_state < SYS_STATE_boot))
> +	     return NULL;
> +
> +	ptr =3D __vmap(&mfn, PFN_UP(offs + size), 1, 1,
> +		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
> +
> +	return !ptr ? NULL : (ptr + offs);
> }
>=20
> void acpi_os_unmap_memory(void __iomem * virt, acpi_size size)
> {
> -	if (IS_ENABLED(CONFIG_X86) &&
> -	    (unsigned long)virt >=3D DIRECTMAP_VIRT_START &&
> -	    (unsigned long)virt < DIRECTMAP_VIRT_END) {
> -		ASSERT(!((__pa(virt) + size - 1) >> 20));
> +	if (__acpi_unmap_table(virt, size))
> 		return;
> -	}
>=20
> 	if (system_state >=3D SYS_STATE_boot)
> 		vunmap((void *)((unsigned long)virt & PAGE_MASK));
> diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
> index c945ab05c864..5a84a4bf54e0 100644
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -68,6 +68,7 @@ typedef int (*acpi_table_entry_handler) (struct acpi_su=
btable_header *header, co
>=20
> unsigned int acpi_get_processor_id (unsigned int cpu);
> char * __acpi_map_table (paddr_t phys_addr, unsigned long size);
> +bool __acpi_unmap_table(void *ptr, unsigned long size);
> int acpi_boot_init (void);
> int acpi_boot_table_init (void);
> int acpi_numa_init (void);
> --=20
> 2.17.1
>=20
>=20

Regards,
Rahul


