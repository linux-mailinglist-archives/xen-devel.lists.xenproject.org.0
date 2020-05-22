Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4661DE25A
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 10:42:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3FC-0000Za-71; Fri, 22 May 2020 08:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aod8=7E=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jc3FA-0000ZV-H5
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 08:41:28 +0000
X-Inumbo-ID: 06684430-9c08-11ea-ab9a-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06684430-9c08-11ea-ab9a-12813bfff9fa;
 Fri, 22 May 2020 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ8mvoVssdd5lvUpx+KPlVr59eHE7C91DlklRpTWB9k=;
 b=QTFKlWyCVPAflAEl/bdlIl+jZ2FlyE/6tqdZqegTkinejwZ3cwkeDpv5fmO0Nna7QF/l7oz32+J77mXCoFPuT4KNjA+t3SL7xDhSV0UbQicviYsgirOfTB5AaA+RHzVeL3ps839bR0DTq9ARp8exYUSEAtgs5ghZl26X+9WqT9Q=
Received: from AM6P194CA0079.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::20)
 by VI1PR08MB4493.eurprd08.prod.outlook.com (2603:10a6:803:ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Fri, 22 May
 2020 08:41:25 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::26) by AM6P194CA0079.outlook.office365.com
 (2603:10a6:209:8f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Fri, 22 May 2020 08:41:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 08:41:24 +0000
Received: ("Tessian outbound cff7dd4de28a:v57");
 Fri, 22 May 2020 08:41:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 644b2724f829d406
X-CR-MTA-TID: 64aa7808
Received: from eed332ec7ed3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5D7C0D2-73ED-48A2-9468-439AB220F9C7.1; 
 Fri, 22 May 2020 08:41:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eed332ec7ed3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 May 2020 08:41:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc4wifgZLMYva5e5BQg2NxUzC4SiNDv9rinzkg57EP0mG1FHpYm2mMkmwwb+X8wE8QNn2FLCyTehGbIYV75ljQTEQ0Yq2KzuJBep1YXQUyvzgXFNT2ID8IXmU8o/TrPB90TvWisOsJy98HWxuMC2kxX6HqmFI1QUIJiM2LmTN1HkCTSFQBadhU1ZQTvwL3argeq+ivbSeoNbeleB/6jpGVoMbhQCEL87VQGiJ0QqTsiklkmrMhAvDhjp2ub5L/2qvb7TVOHSKaOsLRpxGR9M08RZxDCbY8wW9Xq99DWs1GXnLk0w8Ap+wrzsbyXmGKxO6EZAO1TBwJpK7ikgk1DHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ8mvoVssdd5lvUpx+KPlVr59eHE7C91DlklRpTWB9k=;
 b=UZ9KzEqCaNuuUN5Tn1X6+7ib69UDJh7dNmVVawulAWxCDS8ko8I6GoS/TldbtZGHnxLoAeZc3/NEUCxH9QGI4BUboa5KLHhG9P0l+fOoGLqseyaV3bmNlULx2PBXO5K58DTKubDOYn96cnRlq1PHvA0JhlPIqx27KpZ1L34X7Sl0Ui4atBwc+z+itI8lV9/psj7K3RlOdBQuyDTYfsARNfSU3bLA+uP9HxyUWxShJZXDS6lNDErAUCoUsG6YHwI8QMklBv33iKLtO0+RdbXk6EAWuni8aB5xJAlI5zYS1FmF/Uigrz4v2ZCo8xGhTU6UJs0kBpvpxrbGwVJiN5EM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ8mvoVssdd5lvUpx+KPlVr59eHE7C91DlklRpTWB9k=;
 b=QTFKlWyCVPAflAEl/bdlIl+jZ2FlyE/6tqdZqegTkinejwZ3cwkeDpv5fmO0Nna7QF/l7oz32+J77mXCoFPuT4KNjA+t3SL7xDhSV0UbQicviYsgirOfTB5AaA+RHzVeL3ps839bR0DTq9ARp8exYUSEAtgs5ghZl26X+9WqT9Q=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3644.eurprd08.prod.outlook.com (2603:10a6:10:4d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 08:41:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 08:41:18 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Topic: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Index: AQHWIr9BT1TmXNUg30iaUVp4td7OCaiz5AWA
Date: Fri, 22 May 2020 08:41:17 +0000
Message-ID: <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
In-Reply-To: <20200505092454.9161-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8c84307-16ee-4f66-7550-08d7fe2be972
x-ms-traffictypediagnostic: DB7PR08MB3644:|VI1PR08MB4493:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4493E898EB7237573BD8C85E9DB40@VI1PR08MB4493.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /4cPXOI7ZvPktb691ghgCxLqyk14aA4i7feVfz2g4Vpjry3BDth12LdI3KDSX1w3m8OnNrru33WGAaNHJiVTs/fA3sFZPHCSg8yeTUrpBwCx4bEmBsUtU6VRDsZWcCLOFHtjnkBEKFuVPLqD9WoT0El/CJnpPDrpyxzQqwFkEbLrAtRAKHUAQtDm0LRUf4P69fkK3I3M8ErHxjrjS7c7jvVi+s0/XPF8tdWCkGOBr9EIHhg8TyzzAZd5+vxV0wObYs1gVXQB0GkIxR4Wwbgw2OX5OoIXLzpVHIgC2R76X3h5tCuLLyVJocjHW1uJaw1J
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(316002)(54906003)(186003)(6506007)(26005)(2906002)(71200400001)(4326008)(478600001)(53546011)(36756003)(6916009)(86362001)(6486002)(8936002)(8676002)(33656002)(6512007)(66556008)(66476007)(5660300002)(66446008)(76116006)(2616005)(66946007)(91956017)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YLvyEfmfteBG5JP2w34F+tgyCGoHhC7TrfkEzSWfZdxam0P/x2B61U5pgqEWnEhsoPYNSLavbKI9N6XrFc15UjddHWcCPf+lxh8Mek/V/rft/I2RcaygsyQ7njNymYrwPE7d6WJM+LKBgHKTaGe6qK6wASeSwNMWeLt9+LBGjb3p2JBocl7xGcz+8AfqoiOjNlTYPXcVLddbkbKPWmBLVmIs+lVFgWXpNTGDhGXPPl9XoxHXF7Spzp8av4gYhS/1H4vF5ST5W60b2cIJ8jbUc+mY6Dbx6F6XAH0o72HQzhQjcuSpmNRC9Hdn20rNHoQMz+sHI7IT7xhauAyQV+kUzdXaZMj7DDBve0tQsNYZmTgOesq+j5umsp2L4AhoPEvWNESKI8Fi1J/sUphPOkYoa6HaGvuH7dBe85w9zJZqP/kOWDZmUpJFBxF8j5tpcrddmIuh1p1UFXZaIJpkxNmYw6cMv0zm2VIOhLNP98lzEtc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AC0A0E50451744D9EB9A66A23A5EB82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3644
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(36756003)(478600001)(6862004)(316002)(6486002)(36906005)(82310400002)(70586007)(6512007)(81166007)(82740400003)(54906003)(5660300002)(8936002)(6506007)(2906002)(356005)(70206006)(8676002)(186003)(26005)(53546011)(86362001)(336012)(2616005)(47076004)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e83e76d-02c6-4430-f06f-08d7fe2be549
X-Forefront-PRVS: 04111BAC64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJa49NdKfZmYvX1+UPqB7i3IO9R3XdKXgcXmDr48cuCiene3TRmAZWXfbmuOHd8zOWIfB6tQ8HuiFf4+HB+yzTrkWyT0Z4nBqTLco5ql2D8lgXLIAh0drpTHQNJt43wXMuJ0v05OQKPJBqUgGBo8uYGJFhBMIIjw+S+wTNhoa1MSocf6cinZfAen9xgHhG3SBTLRLdwNcFel5VT1P9soV+WFIvl/uP1SFwRxXSbZ3pbsRlAB28CZu+VKhWUpkIXsAgMs6nC6F7vjO3NYaJVTj+RaQ/i/gdgjIvdxmy1raJ8xoYuho7EUtV0abGf5rBr3BLcxiCTTH6jo0540Mx5Xztkpoc/91gNjDVbFaQK1ydAiaXSigTm68vuBvJcOEE1NQGKYg1ak7wJa/RwZz6EA8M5vHG7YI5+7AT0s4//sbK1XSNiNj45f8C22qjmYTk4krALNN07Kib+u/OxVDIYAEh/MmSGIIU95ZPf5qBiptMgK2V5l/anRvhglIkqEVhWH9XbodWP3M0odAQz6u/GyUQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 08:41:24.9326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c84307-16ee-4f66-7550-08d7fe2be972
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4493
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCkFzIGEgY29uc2VxdWVuY2Ugb2YgdGhpcyBmaXgsIHRoZSBmb2xsb3dpbmcgaGFzIGJl
ZW4gY29tbWl0dGVkIChJIGd1ZXNzIGFzIGEgY29uc2VxdWVuY2Ugb2YgcmVnZW5lcmF0aW5nIHRo
ZSBjb25maWd1cmUgc2NyaXB0cyk6DQpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJlIGIvdG9v
bHMvY29uZmlndXJlDQppbmRleCAzNzU0MzBkZjNmLi4zNjU5NjM4OWI4IDEwMDc1NQ0KLS0tIGEv
dG9vbHMvY29uZmlndXJlDQorKysgYi90b29scy9jb25maWd1cmUNCkBAIC00Njc4LDYgKzQ2Nzgs
MTAgQEAgZm9yIGxkZmxhZyBpbiAkQVBQRU5EX0xJQg0KIGRvDQogICAgIEFQUEVORF9MREZMQUdT
PSIkQVBQRU5EX0xERkxBR1MgLUwkbGRmbGFnIg0KIGRvbmUNCitpZiAgISAteiAkRVhUUkFfUFJF
RklYIDsgdGhlbg0KKyAgICBDUFBGTEFHUz0iJENQUEZMQUdTIC1JJEVYVFJBX1BSRUZJWC9pbmNs
dWRlIg0KKyAgICBMREZMQUdTPSIkTERGTEFHUyAtTCRFWFRSQV9QUkVGSVgvbGliIg0KK2ZpDQog
Q1BQRkxBR1M9IiRQUkVQRU5EX0NQUEZMQUdTICRDUFBGTEFHUyAkQVBQRU5EX0NQUEZMQUdTIg0K
IExERkxBR1M9IiRQUkVQRU5EX0xERkxBR1MgJExERkxBR1MgJEFQUEVORF9MREZMQUdT4oCdDQoN
ClRoaXMgc2hvdWxkIGJlOg0KaWYgIFsgISAteiAkRVhUUkFfUFJFRklYIF07IHRoZW4NCg0KQXMg
b24gb3RoZXIgY29uZmlndXJlIHNjcmlwdHMuDQoNCkR1cmluZyBjb25maWd1cmUgSSBoYXZlIG5v
dCB0aGUgZm9sbG93aW5nIGVycm9yOg0KLi9jb25maWd1cmU6IGxpbmUgNDY4MTogLXo6IGNvbW1h
bmQgbm90IGZvdW5kDQoNCldoaWNoIGlzIGlnbm9yZWQgYnV0IGlzIGFkZGluZyAtTC9saWIgYW5k
IC1JL2luY2x1ZGUgdG8gdGhlIENQUEZMQUdTIGFuZCBMREZMQUdTDQoNCldoYXQgc2hvdWxkIGJl
IHRoZSBwcm9jZWR1cmUgdG8gYWN0dWFsbHkgZml4IHRoYXQgKGFzIHRoZSBwcm9ibGVtIGlzIGNv
bWluZyBmcm9tIHRoZSBjb25maWd1cmUgc2NyaXB0IHJlZ2VuZXJhdGlvbiBJIGd1ZXNzKSA/IA0K
DQpCZXJ0cmFuZA0KDQo+IE9uIDUgTWF5IDIwMjAsIGF0IDEwOjI0LCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBwYXRoIHByb3ZpZGVkIGJ5
IEVYVFJBX1BSRUZJWCBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIHNlYXJjaCBwYXRoDQo+IG9mIHRo
ZSBjb25maWd1cmUgc2NyaXB0LCBsaWtlIGl0J3MgZG9uZSBpbiBDb25maWcubWsuIE5vdCBkb2lu
ZyBzbw0KPiBtYWtlcyB0aGUgc2VhcmNoIHBhdGggZm9yIGNvbmZpZ3VyZSBkaWZmZXIgZnJvbSB0
aGUgc2VhcmNoIHBhdGggdXNlZA0KPiBieSB0aGUgYnVpbGQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IFBsZWFz
ZSByZS1ydW4gYXV0b2NvbmYuc2ggYWZ0ZXIgYXBwbHlpbmcuDQo+IC0tLQ0KPiBtNC9zZXRfY2Zs
YWdzX2xkZmxhZ3MubTQgfCA0ICsrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL200L3NldF9jZmxhZ3NfbGRmbGFncy5tNCBiL200L3NldF9j
ZmxhZ3NfbGRmbGFncy5tNA0KPiBpbmRleCBjYmFkM2MxMGIwLi4wOGY1Yzk4M2NjIDEwMDY0NA0K
PiAtLS0gYS9tNC9zZXRfY2ZsYWdzX2xkZmxhZ3MubTQNCj4gKysrIGIvbTQvc2V0X2NmbGFnc19s
ZGZsYWdzLm00DQo+IEBAIC0xNSw2ICsxNSwxMCBAQCBmb3IgbGRmbGFnIGluICRBUFBFTkRfTElC
DQo+IGRvDQo+ICAgICBBUFBFTkRfTERGTEFHUz0iJEFQUEVORF9MREZMQUdTIC1MJGxkZmxhZyIN
Cj4gZG9uZQ0KPiAraWYgWyAhIC16ICRFWFRSQV9QUkVGSVggXTsgdGhlbg0KPiArICAgIENQUEZM
QUdTPSIkQ1BQRkxBR1MgLUkkRVhUUkFfUFJFRklYL2luY2x1ZGUiDQo+ICsgICAgTERGTEFHUz0i
JExERkxBR1MgLUwkRVhUUkFfUFJFRklYL2xpYiINCj4gK2ZpDQo+IENQUEZMQUdTPSIkUFJFUEVO
RF9DUFBGTEFHUyAkQ1BQRkxBR1MgJEFQUEVORF9DUFBGTEFHUyINCj4gTERGTEFHUz0iJFBSRVBF
TkRfTERGTEFHUyAkTERGTEFHUyAkQVBQRU5EX0xERkxBR1MiXSkNCj4gDQo+IC0tIA0KPiAyLjI2
LjINCj4gDQo+IA0KDQo=

