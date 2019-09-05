Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE72A9C95
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mjg-0005rk-2w; Thu, 05 Sep 2019 08:03:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5mje-0005rf-DO
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:03:18 +0000
X-Inumbo-ID: 9cfd1352-cfb3-11e9-abc1-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cfd1352-cfb3-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XzLZizWe5rjebi7OjUDa++SzmwHsm1OGPs51xJv8js=;
 b=Zf3UcqfawobskvSP3eNF2lS24FpwUfmgX8WdZmI7NdVuaDOjF4KZNWc91CfcVwtzupLYGrOpUv5jBidKVi/CnXEmIxP1ni/QobMRRcPyQsP6EwQ7Ee+HELBThcKQHbHIh3z2T1zJjdGOL8Jf2oifSiARE4mSU2ZAEBgM6l7tf6Y=
Received: from VI1PR08CA0181.eurprd08.prod.outlook.com (2603:10a6:800:d2::11)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:105::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.20; Thu, 5 Sep
 2019 08:03:13 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0181.outlook.office365.com
 (2603:10a6:800:d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Thu, 5 Sep 2019 08:03:13 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14 via Frontend Transport; Thu, 5 Sep 2019 08:03:11 +0000
Received: ("Tessian outbound 108f768cde3d:v27");
 Thu, 05 Sep 2019 08:03:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa9fe063c0c87870
X-CR-MTA-TID: 64aa7808
Received: from 8f4bea9db805.1 (cr-mta-lb-1.cr-mta-net [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDF04F06-5FC4-4E0A-BD20-1DF15697B04E.1; 
 Thu, 05 Sep 2019 08:02:58 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f4bea9db805.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Sep 2019 08:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvtOmCyYrjlZUsU1yAzuXz7zZz1J9XPr4NZ25QOOG8giihbmDyBIZH1yVoqSXHH+/G7SL71AzwRUIhW4m9cFuFWyjaoQCWz0arPS/E8/WXnvjk+QxQPAg7Q7Esuq/cvUa1bpIM/UjLncXVgDfihPbQjhnfJWrYxd8t/z7OpbLwod13X9+YYTHNbeZZiwTM8B5bQWEX3VC2S6gEjac8OBmaPoXBCFz7AU0SHQNUxjoDRLU6n4OCfZ4NYMekq2BPFdqbHQpKpGyL2Nj5RqB9MD0p7Tx9/E2s350sMXB3eTzSePTZTx4D2il1fGN0ujqBUCLkcgRO3jV0gBlUxwH9SApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XzLZizWe5rjebi7OjUDa++SzmwHsm1OGPs51xJv8js=;
 b=LQZegjWYohwfvas74HCdikgbgKIdIDFt8itRKLSI5/TPlwdn4FNWsPR/di9NhjV0RNY/Qm8sUo42JRm40MQgr2+9ElYYdIP1mTVVtGx1D1uMOTdsaJ+hJi2vaVgBKalN7ytgnO8toZBIFN7WL3PX+s3iuN3mbCnNdBK7pc+WfhFgG3w5p3Tz/dY4vpNiLTP0e7AIQ3xzzBrSCTpnD754zkwlA5x7s/uq777Ni7uE/70v9HTTf6ZumzH+iI5syt42QM0WzX/jw6C/gTbhlbfKEE9JlgHQ9cEDXA0SARvLZIuz5malEUWTZnAMa8e4pZPotK3yxQEObiyu2Qfsnur4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XzLZizWe5rjebi7OjUDa++SzmwHsm1OGPs51xJv8js=;
 b=Zf3UcqfawobskvSP3eNF2lS24FpwUfmgX8WdZmI7NdVuaDOjF4KZNWc91CfcVwtzupLYGrOpUv5jBidKVi/CnXEmIxP1ni/QobMRRcPyQsP6EwQ7Ee+HELBThcKQHbHIh3z2T1zJjdGOL8Jf2oifSiARE4mSU2ZAEBgM6l7tf6Y=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2207.eurprd08.prod.outlook.com (10.172.12.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 08:02:56 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::1d01:b946:4c97:21eb]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::1d01:b946:4c97:21eb%6]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 08:02:56 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/altp2m: Add hypercall to create a new view and
 set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqccvdUA
Date: Thu, 5 Sep 2019 08:02:56 +0000
Message-ID: <20093bb2-ec61-7119-ab05-6690748a4977@arm.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
In-Reply-To: <20190902081118.31001-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 414f164a-2b5b-4821-9a45-08d731d77f38
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2207; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2207:|AM7PR08MB5335:
X-Microsoft-Antispam-PRVS: <AM7PR08MB533587508E27AD9AFC9243B080BB0@AM7PR08MB5335.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 015114592F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(86362001)(76176011)(66476007)(476003)(66556008)(31696002)(11346002)(4326008)(25786009)(53936002)(8936002)(14454004)(386003)(6506007)(53546011)(2616005)(6486002)(102836004)(66946007)(229853002)(446003)(6512007)(31686004)(52116002)(36756003)(54906003)(66066001)(64756008)(186003)(7736002)(71190400001)(71200400001)(256004)(305945005)(6246003)(14444005)(8676002)(4744005)(110136005)(5660300002)(316002)(478600001)(81156014)(81166006)(6116002)(3846002)(7416002)(486006)(99286004)(44832011)(6436002)(2906002)(66446008)(26005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2207;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: WhSh8VYtugENJy1sixJYWDrth7pk6xf3NW0LaGossAxTaP+THnMD7/usWZIBU+rkaiZ7cDyLfH/1B0qba1Yk+EZ3iGzokECjt4CQk+O3EFd36K8LJ5Hsa5kyzDAiNDr43fMDvSVekGas5LXTmCaDeWPUieALcnZKw7uVptuctJjpUVpQF818RM2C+MS+c8PxNzvyoHaK+/iVGXrgqbljRe89GhqDnAUj9SMHDiP4ZazBBMIsTnGSTBxCjxKU70Qo4fbMkLmRZ8dMmF/Fx58sg8Z/oIIuflPn1egTJqIryC0AAyTpsvKoW3/SHgtpQxPNGdk2+yqLLC0OknFeeraHNb4Ckp74kNYrqryIfGzFWww8k8OcGOt4D3JULCb1QHX+PlXRkFIsmkvgsVHq6Atak4UKv+xbDqGNTG/OoAWzoII=
x-ms-exchange-transport-forked: True
Content-ID: <68E7DF823DFA374CBE7D9D2BD417E47C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2207
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(2980300002)(189003)(199004)(11346002)(63370400001)(2616005)(436003)(126002)(476003)(31696002)(86362001)(2501003)(23676004)(2486003)(36906005)(70206006)(31686004)(7736002)(14444005)(99286004)(316002)(70586007)(486006)(446003)(63350400001)(229853002)(6512007)(107886003)(6246003)(6486002)(110136005)(54906003)(3846002)(478600001)(26826003)(14454004)(50466002)(26005)(4326008)(47776003)(336012)(36756003)(66066001)(76176011)(2906002)(4744005)(8936002)(102836004)(305945005)(6506007)(386003)(186003)(356004)(5660300002)(81166006)(8676002)(81156014)(6116002)(22756006)(25786009)(76130400001)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5335;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a2f1f003-d8e3-4cc1-a993-08d731d775ad
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5335; 
NoDisclaimer: True
X-Forefront-PRVS: 015114592F
X-Microsoft-Antispam-Message-Info: azXhALV2NChl91XGH9FUFtlhUYKvYG1siPTaZLGTjSk8i5nzNjVyhW2WBnmKW0StW43dTMTNxFd6Mjy5QbgD5G8c2lutTgk4butgfNimuE9J72df56cdbxBZYHZ0+i4tmQbjennohgvzx2ngwGebf/c+lAHyPU4rCCWgB8GGjCmJavqcJymIU9TQ5ZBIqSak/uhBqEPRmzVKAjlj+dRCL2fI9E311fIT0VHwiOzh3AIbfstHsPFyHcw6PGUBvh/tEEB+W5MW7S4IpYq/BLoavb0OMV/tXJQYkK5V0zhiWWOtKRGw3cw9h+bCjDE1pCVP0CCz/Ay34y5K+v1VwZHB91Jl2U0gCDSKA1e0uW0ACGh+pYBz2NCTS41I3M4BWFll4Eb8s7DQZx6rMTH5KlgzphlUHsfBK5DvLuJ/L6tF9ko=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2019 08:03:11.7269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 414f164a-2b5b-4821-9a45-08d731d77f38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 nd <nd@arm.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDAyLzA5LzIwMTkgMDk6MTEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3Rl
Og0KPiBCeSBkZWZhdWx0IHRoZSBzdmUgYml0cyBhcmUgbm90IHNldC4NCg0KV2hpbGUgYWx0cDJt
IGlzIGN1cnJlbnRseSBvbmx5IHN1cHBvcnRlZCBmb3IgeDg2ICh0aG91Z2ggSSBhbSBhd2FyZSBv
ZiANCnNvbWUgcG9ydCBmb3IgQXJtKSwgdGhpcyBwYXRjaCBleHRlbmRzIGFuIGludGVyZmFjZSB0
aGF0IGlzIG1lYW50IHRvIGJlIA0KYXJjaC1hZ25vc3RpYy4gU28gd2hhdCBkb2VzICJzdmUiIHN0
YW5kcyBmb3I/DQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29w
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQo+IGluZGV4IGM2Y2QxMmY1OTYu
LjkyNGQ5NDdlNzggMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29w
LmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPiBAQCAtMjQ0LDYg
KzI0NCw3IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV92aWV3IHsNCj4gICAgICAgLyogQ3JlYXRl
IHZpZXcgb25seTogZGVmYXVsdCBhY2Nlc3MgdHlwZQ0KPiAgICAgICAgKiBOT1RFOiBjdXJyZW50
bHkgaWdub3JlZCAqLw0KPiAgICAgICB1aW50MTZfdCBodm1tZW1fZGVmYXVsdF9hY2Nlc3M7IC8q
IHhlbm1lbV9hY2Nlc3NfdCAqLw0KPiArICAgIHVpbnQ4X3Qgc2V0X3N2ZTsgLyogYm9vbCB2YWx1
ZSAqLw0KDQpEbyB3ZSBleHBlY3QgbW9yZSAiZGVmYXVsdCIgdG8gYmUgb3ZlcnJpZGU/IEl0IG1p
Z2h0IGJlIHdvcnRoIA0KY29uc2lkZXJpbmcgdG8gaW50cm9kdWNlIGZsYWdzIHJhdGhlciB0aGFu
IHdhc3RlIDgtYml0cyBwZXIgbmV3IGRlZmF1bHQgDQp0aGF0IGNhbiBiZSBlbmNvZGVkIGluIDEt
Yml0Lg0KDQpDaGVlcnMNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
