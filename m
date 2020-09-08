Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA326127F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:17:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeR6-0003Ou-Aj; Tue, 08 Sep 2020 14:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjYd=CR=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kFeR4-0003Op-1I
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:17:26 +0000
X-Inumbo-ID: edce0b24-e787-47ce-8552-aff6ee5a4f3e
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edce0b24-e787-47ce-8552-aff6ee5a4f3e;
 Tue, 08 Sep 2020 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUfWRU8Los/WBQ4eb5Br22TUW16+XVD0AD7wtu2sX+w=;
 b=uMbKvPc0/ocr/jCl52rRWTQqAkfoSdOPMwTns/jBHtf7iFW3m9ivycxq+7TozfkKGUV7Ylb7WqftJaPpST3Bc9MJa922pqn+K+/2tjq3P+LYYk4SWtOCBvbBMLQ9XSOziFjN4gohcxrL+5vyo7Ew6C0rzBfPkZk/BlGTrBfCLb8=
Received: from AM6P193CA0077.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::18)
 by VI1PR08MB3725.eurprd08.prod.outlook.com (2603:10a6:803:b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 14:17:22 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::11) by AM6P193CA0077.outlook.office365.com
 (2603:10a6:209:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 8 Sep 2020 14:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 14:17:22 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 08 Sep 2020 14:17:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f51be746e120f6e
X-CR-MTA-TID: 64aa7808
Received: from 5e0adae3951c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C5387E7-1D06-4F50-ADD1-1D7E3B168C00.1; 
 Tue, 08 Sep 2020 14:17:12 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e0adae3951c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Sep 2020 14:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ho+o8XomJfTZEAZ9SkPZ0u9WowYA5jvcZvGiaHJxLy6+quklydyugM885o1x0qhFbeDRpn3MW5QrVRUecEgZ5buYaHATC0w+MltO+idTPVhCgpDYoYohWsg0j7BBsmQpUyHSio26qssRLC3o7EB3eFGIzQuPbxRXWvhCriACH9gjZK/J5VFychnxFTiTo33SyiJpaxgjAF8ktX/9vOlGjgBZ0xaUb2pzTjDKUAUxB9hCb4OxXlJtEKcV1QvJ/ULqMj9hM6ehdkcVNkpR5wM3BSZ4MdRx1NHoFgULZ9u4lZdJSap8mdb5q0C5s/vzljl5Mk/e273Q0uF0FZIsPpo7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUfWRU8Los/WBQ4eb5Br22TUW16+XVD0AD7wtu2sX+w=;
 b=K/aETcw7UI0QxhKx6Oe6ZQdkub22M6gTAzjXEbSnEEKolzejE1VWQZRVKEfOibPrBhBP4Fg/leto3jtfdALHj/zTxZMCzBIZYYn1LnE3NOpEzN6YpAqY/XYmBjL4kgQivg+AHAt95/x+nnwbDlPjuXsHGuHIBJ+4WVAxUJFcGf3FVqKT5s44poZSP2CzY2/uG5VVdjnIJHcap9wtaeNxsldQ5YV4jgIa7VBjYYi0shdITxyqjaDTz87BfVvWfeMVy66aF0QqyZTa1wXNhkPY5SDT5uW/EQrs9K5RK20HcOhJNXTWceBGo8O5ZoIZ0sk9rMGUbY9nStr8EQZaj0T5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUfWRU8Los/WBQ4eb5Br22TUW16+XVD0AD7wtu2sX+w=;
 b=uMbKvPc0/ocr/jCl52rRWTQqAkfoSdOPMwTns/jBHtf7iFW3m9ivycxq+7TozfkKGUV7Ylb7WqftJaPpST3Bc9MJa922pqn+K+/2tjq3P+LYYk4SWtOCBvbBMLQ9XSOziFjN4gohcxrL+5vyo7Ew6C0rzBfPkZk/BlGTrBfCLb8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4712.eurprd08.prod.outlook.com (2603:10a6:10:f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 14:17:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 14:17:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Arm64: fix build with gcc 10
Thread-Topic: [PATCH] Arm64: fix build with gcc 10
Thread-Index: AQHWhd9Vq9iCRBnsnkuk6dw8UeDDDqletaaAgAARjoCAAAKFAA==
Date: Tue, 8 Sep 2020 14:17:08 +0000
Message-ID: <75408287-B521-4EDD-91E5-46E398DA6BF3@arm.com>
References: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
 <F0DDBF49-93F2-4203-A62E-045DD2F4EA9E@arm.com>
 <e0362eb3-2e72-ea0d-bff5-e0b7ff54104f@suse.com>
In-Reply-To: <e0362eb3-2e72-ea0d-bff5-e0b7ff54104f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f87cf2f-bed3-42fd-41ef-08d85401e74d
x-ms-traffictypediagnostic: DBBPR08MB4712:|VI1PR08MB3725:
X-Microsoft-Antispam-PRVS: <VI1PR08MB372514A0434283C0FE95D6809D290@VI1PR08MB3725.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IUCRyA5AFTMAQjv5uBQXXX0bcPRobHie/MObS+TMDUMRQzRlBSXvXNgk4oZZ0Wb88ydDFCmw3GpPQ2dE4iRETnJqQk9AbxdBgkW38HL3QeUe9zQLRRF1r+bJb54Z2Fw34Vw2p5bCjpwZ+ytUpHphQ/N9KjBI5XwyE5sqCOyy2opp63zp6EN84mHSpq15EfqnU3ZQyk1vWXBXyTsodtHSSTLYPh55Pl9HPMvTgPxOnBICZz42q+56d8wWZVgTDmshMd7CgWgPOgxnJ3qF1FRqq7IdwtsVGiCWOjoDu529KsuiQReHLw5ecKb3MZG62bTuzYOWM8ytz6C9f8FrmrYt+w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(33656002)(26005)(91956017)(53546011)(6506007)(4326008)(66556008)(64756008)(66476007)(66446008)(76116006)(2616005)(5660300002)(2906002)(71200400001)(66946007)(316002)(6916009)(478600001)(54906003)(186003)(83380400001)(36756003)(6486002)(8676002)(86362001)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mP1iWNXSgoS5fcVKGWChKddMZqa9NKRvfngmtmvZRQSfITUWPPT6hL1hlntcbNXaX4qrYVoDr6hjDhseV4Jt2GpTUI9uNDzcdE5ndXCVkAnFqi164agbYD1Bqylqi87qmbvHtx3gvUZPR9vzK6Kqs8CoTFHDo/Vqe+rUwufL6D4TkA5NGbYi0q4fGp+5omJFSAdde+LqW5iWvuzx5iwuckVc2+AXBKsg28h8m5ZdkJSymRxbnaN+fOrYWMAWZon224nCjmdEeCq8g4qergxXN3PTetNK8SqGmR6Nw1FwDPBy+UpKJQlxFovX1pgVVg0o1WIZ57Wexh3uXOL8GBbb+VS49bAdE39Ufw2dvmw3S7g/CRTDgWcKPswhUgXuFeS2VZezxJcvlwBXI67uE4kpXz7gOelKJgMiT5e2XfqkTsOhtqRnurm1s3U7n7xOoJp0PAfEuKeuWBTLA2xcf867Ay5aaoBdxgnCPREdpP8TvikH5g2IjBCeXk4ILjFiRSxw7hfXiOAOSCTwuX1JJCGmTYOAFa2BLpJb2pYWLuc7YlXKKruyiC2l3y7LJxwDtZQhduLskJT35JOkHINyeRZ3pedSWcOX9JT3MfMLtQRkN5JEqOi8gZAN5I5380ApGeLjniKSVBEUHjOVQUmYRutUoQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CA065C3A918204F92E4D5517392727E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4712
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 26d7405d-6eab-4a20-994e-08d85401df53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLczIse14qccu3Lh+UPcqDw6hgsW7+d09KGqIFzlgQP+PoIZ/YwOs9K++T4TLtkLd52zFlJEuKkeB0bd543T2Ul6y/6O5EOnRTG+iayzRXjKMzgqvKTZBfIQpKNRjs7gsvFvFvsXFX+OOo720EzuqJUz0DmU94+K79avUafhbwpbG5NWLAs7OAfBW6RkNLP96nfJ4JOF2qEyFDl/6J1QqmE/qFielZQRnWXk5OCe7OGHKhidSlhObpC6hwO36Qzyhh4sSTLBzow+Pxmn6nMr31E9BmUyz3nQCSwn6MqXpUDLORPc/z2WblzzzxPiXlVGuzj8IlMGSRUCZRooouON8BM1do2dPbwGAQ3S/5me1SfL3+zD7i71yeKjLETC/I0/yNMM2SLaJKGPZKD24QDBkw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(2906002)(33656002)(4326008)(336012)(47076004)(83380400001)(6512007)(36756003)(186003)(5660300002)(82740400003)(82310400003)(81166007)(478600001)(26005)(316002)(6506007)(2616005)(36906005)(53546011)(86362001)(54906003)(6486002)(6862004)(356005)(8936002)(70586007)(8676002)(70206006)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 14:17:22.4576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f87cf2f-bed3-42fd-41ef-08d85401e74d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3725
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gOCBTZXAgMjAyMCwgYXQgMTU6MDgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wOS4yMDIwIDE1OjA1LCBCZXJ0cmFuZCBNYXJxdWlz
IHdyb3RlOg0KPj4+IE9uIDggU2VwIDIwMjAsIGF0IDEzOjUzLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IFdpdGggZ2NjMTAgaW5saW5pbmcgaXMgKG5v
IGxvbmdlcj8pIHRoZSBkZWZhdWx0IGZvciBjZXJ0YWluIGF0b21pY3MuDQo+Pj4gDQo+Pj4gU3Vn
Z2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vYXJjaC5taw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcmNoLm1rDQo+Pj4gQEAgLTEy
LDYgKzEyLDcgQEAgQ0ZMQUdTLSQoQ09ORklHX0FSTV8zMikgKz0gLW1jcHU9Y29ydGV4LQ0KPj4+
IA0KPj4+IENGTEFHUy0kKENPTkZJR19BUk1fNjQpICs9IC1tY3B1PWdlbmVyaWMNCj4+PiBDRkxB
R1MtJChDT05GSUdfQVJNXzY0KSArPSAtbWdlbmVyYWwtcmVncy1vbmx5ICMgTm8gZnAgcmVnaXN0
ZXJzIGV0Yw0KPj4+ICskKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MtJChDT05GSUdfQVJNXzY0
KSxDQywtbW5vLW91dGxpbmUtYXRvbWljcykNCj4+IA0KPj4gV2h5IG5vdCBhZGRpbmcgdGhpcyBi
ZWZvcmUgd2l0aCB0aGUgb3RoZXIg4oCcY2FsbCBjYy1vcHRpb27igJ0gPw0KPiANCj4gSSBlbGVj
dGVkIHRvIGdyb3VwIGl0IHdpdGggdGhlIG90aGVyIEFybTY0IHNwZWNpZmljIG9uZXMuDQoNCm9r
DQoNCj4gDQo+PiBBbHNvIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGhhdmUgYSBzZW50ZW5j
ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCB0aGUNCj4+IGVycm9yIGhhcHBlbmluZyB3aGVu
IHRoaXMgaXMgbm90IGFkZGVkOg0KPj4gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hYXJjaDY0
X2xkYWRkNF9hY3FfcmVs4oCZDQo+PiANCj4+IEJlY2F1c2Ugc29tZSBtaWdodCBuZWVkIHRvIGJh
Y2twb3J0IHRoaXMgdG8gb3RoZXIgWGVuIHJlbGVhc2VzIGlmIHRoZXkgc3dpdGNoIHRvDQo+PiBh
IG5ldyBjb21waWxlciAoYWx0aG91Z2ggaSBjb3VsZCBub3QgcmVwcm9kdWNlIHRoYXQgd2l0aCBY
ZW4gNC4xNCkuDQo+IA0KPiBJIGd1ZXNzIEknbGwgZ28gd2l0aCBKdWxpZW4ncyBzdWdnZXN0ZWQg
ZGVzY3JpcHRpb24gKHdpdGggc29tZQ0KPiBtaW5vciBhZGp1c3RtZW50cyBwZXJoYXBzKS4NCg0K
T2sgYnV0IHBsZWFzZSBtZW50aW9uIHRoZSBlcnJvciBzbyB0aGF0IGl0IGFwcGVhciBzb21ld2hl
cmUgOi0pDQoNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

