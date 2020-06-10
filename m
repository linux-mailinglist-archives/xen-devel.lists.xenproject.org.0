Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC381F501C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 10:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jivrv-0005aY-H0; Wed, 10 Jun 2020 08:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SM/B=7X=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jivru-0005aT-2h
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 08:13:54 +0000
X-Inumbo-ID: 5220ed66-aaf2-11ea-bb8b-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5220ed66-aaf2-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 08:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1lUd0mBH8NH2GMK08sYwVZHSjihZl4gaqzUJnbKQGq+C7HUYNCssoiS9xDb4iJjw10VZTTapwnbNDVdwS0NPDicpXAlbzmZ5xhDIhHy7EsRrJy6cN12GY1kMs/Llyif1iyaf6rgoZgDuV1myrvInAX2XDU3L670PpHmoEwreT4mCYijE8WEczLHjuh0zTfw+ldiEDIYds1LeJmE6M7HGsRNRT7FfCaZYGwYI9CCXcWBGA01k4OLq2YLrbdcwbR5mlCyUJyQFQ9PV8//Ptucs55XHg+mEDLUb+yFoQOA6oETWaX8kxnasaKD/uNyxlkTU+F0INkgA+nSU18DEqvexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TwK/ut+YbiyazEYFH6b+5m1I4PttqHJCwvPUKUZFFY=;
 b=Fbkpc8rsfSzjhUlQwVim3XdQ6wjdNhVpd484DpsFWZAXEkT2K3IJOtEBwANUnUORfRDnQWqmiEbqRkowTaF8InaL5/I7dp/OOrBWUEuZ45mFhyWCV80zuvsJJqaGGBIaJY5XgE7JhLYr7gFcegM1BAK2MNjbFGxzo218u1r1An5cKFLe8ZobMHIXPkC63V12cK+6EnuV5+8kA6mem3BNaCQqeUFttp0C2a1I5uqsSdak5xmt8/fcUyk3JHRLHOZQX5V2qKXbezxP0dwuKSFUIKQ9aV3nAxPpqwcbmrUPQ1YAN3jriWdO4/I3tG6afX1ik/ybt52f8MDjNcnwR3zPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TwK/ut+YbiyazEYFH6b+5m1I4PttqHJCwvPUKUZFFY=;
 b=fr3A2qU++Ki22WD8FNIsqEKd7Zxba6VZrOr8KxuyoR7zKnXS5vn2+z/ah1PAdrO9zqVI+5WDMnAWg0n2tRrivzypNkMoyt/RIzo51BRGBMEqYDEOG51Wi6cGUWrCcl1GzVYvj5xBTg+g4ImaCVrElI9e/FY9tQqsYBB4kTfwN8Nwhsqpp6Ep4T1Mzy++bCUiT23EoL0eQZInTtfWNHWVVNoLsWOC92lf/cd60qhE+e/QS0qHEEx+eSPiKlT/spdLv4CutYmIc+WHoWooP2R4rFSV4r+TeqDlF0+193h3gBXTyJDZD8EDHxduMkRwOQgHtzRMX0UwMae1rP5u6/w1vA==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB6384.eurprd03.prod.outlook.com (2603:10a6:800:193::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 10 Jun
 2020 08:13:51 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 08:13:51 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: HYPERVISOR_console_io + CONSOLEIO_write needs COPY_flush_dcache
Thread-Topic: HYPERVISOR_console_io + CONSOLEIO_write needs COPY_flush_dcache
Thread-Index: AQHWPv8SOx/IaSMb+EOuO5msEU03SQ==
Date: Wed, 10 Jun 2020 08:13:50 +0000
Message-ID: <912a84d1-ca47-9c37-06e7-28bebe696b4d@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d43f555-cda5-4cd9-0c0c-08d80d163580
x-ms-traffictypediagnostic: VI1PR03MB6384:
x-microsoft-antispam-prvs: <VI1PR03MB6384ABCBA3DE27E67A490CDDE7830@VI1PR03MB6384.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w7Y+df7maVGUnXcje2hdrMjYYjdJRpBK1WKbwrSGNDLvkrmF1ewrcc0hcysew8MXkf1TqA+fftwxiuuz+lM5n0Nhoo2+QDaUO3yYFygv3tupItoOK9Yq7g43695ZnP6b7It8883oALgmQkkp/BRIsbCmDi7n0jew4MTHMwlZV+Fw6d5IoUnme/iKi/+/yIoQwNryjpHbVfx7Z47KxyjVGp10MObiIS+lf9FbZRPU7aCnV2NC1YWrL30/3ecngSUl6djegKjOsLi1loUDbAYkXj4NNxxQ3Zge0VllfQBZ+AF8HTZu/tTDtVT8UocZmft7A0tstGnAosMXFAXmyCzHpQ23sMdtc3J1FyTa9vtDSnA/t/83y6VVqpF7o+OvxFaJtQo1ANRpqANgpl09NCDOLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(186003)(76116006)(6486002)(6512007)(66946007)(66446008)(66476007)(64756008)(5660300002)(66556008)(2906002)(86362001)(31696002)(91956017)(31686004)(36756003)(316002)(6916009)(71200400001)(6506007)(2616005)(4744005)(8936002)(83380400001)(478600001)(966005)(8676002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tJIjFpBr5P7shyLHanPGPYWU7WUAtelOwgrHfs12/y70PrDtT7pXA3/BzEkU1T10tI0Rz6XrxfRISWszeZ9w3ZpGcu0BtmuUHu1BgnNpsqY0GzoPdXWAGM0taa5byBS/zkc67jETlbwpVWg+aly/r+P2D+gfLWQI7fyhKZBuweKGbHexht9waEHJt+enHiLVGHhEqKnuYQ2LeeNvUUpdgwIR3BCnSWg9H2A2ggYv9I9UUuRoBLY+ZC8k+uHQV580Ue/qbkvJUFxpwD8fR3v+ij2G5uuhK6FSxemTaUPKGqt0qmwr8qNB4ke9B0twOEx/HAOj1B04ALLPW402UWEGaF3lmPyA22zo/i2bh7zprfunC2I52zQsdO2VBqdiXZE8tKZmoaD+/3M2IjX7TY7GjHwdFh/kdXsRg5Zak63oPKTXxf57dpl4fHfq4PEm0ASYCyq6oS+ydxPykSmPc9FSZ3qM6cugkfnn/8o3/kohDOk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <43305C13D7EF0B45B1D39B593EE930A4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d43f555-cda5-4cd9-0c0c-08d80d163580
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 08:13:50.9032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEwnQW5Q89iS2fWhhYzicFfRacQIaD9s+sLICqw6i+ex9Ck29RpLiJgdkSAhyJ7gXblS9mTnUWJB1FGufCNLHjEDWYAY4c7dJ5xZzx+L9mwIZTkIr+YcNWsjmHQnah2O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6384
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

SGVsbG8sDQoNCldoaWxlIGFkZGluZyBzdXBwb3J0IGZvciBwYXJhLXZpcnR1YWxpemVkIGJsb2Nr
IGRldmljZSBpbiB1LWJvb3QNCg0KSSBmYWNlZCBhbiBpc3N1ZSB3aXRoIEhZUEVSVklTT1JfY29u
c29sZV9pbyArIENPTlNPTEVJT193cml0ZS4NCg0KSSB0cmllZCB0byB1c2UgdGhlIGh5cGVyY2Fs
bCBkdXJpbmcgTU1VIHNldHVwIHN0YWdlIHdoaWxlIGVuYWJsaW5nIGRhdGEgY2FjaGUNCg0Kb24g
YXJtNjQgcGxhdGZvcm0gKGUuZy4gZGF0YSBjYWNoZSBpcyBub3QgeWV0IGVuYWJsZWQpIGFuZCBz
YXcgaW4gZ3Vlc3QncyBjb25zb2xlDQoNCmVpdGhlciBvbGQgZGF0YSBvciBzb21lIHNvcnQgb2Yg
Z2FyYmFnZS4gUHJpbnRpbmcgY29uc3RhbnQgc3RyaW5ncywganVzdCBsaWtlIG1pbmktb3MNCg0K
ZG9lcyBvbiBib290LCB3b3JrcyBhcyBleHBlY3RlZC4gU28sIGxvb2tpbmcgYXQgdGhlIFhlbiBj
b2RlIFsxXSBpdCBzZWVtcw0KDQp0aGF0IHdlIHNob3VsZCBjb3B5IGd1ZXN0J3MgYnVmZmVyIHdp
dGggQ09QWV9mbHVzaF9kY2FjaGUgc2V0IGluIHRoaXMgY2FzZQ0KDQphcyAodXN1YWxseT8pIHRo
aXMgaHlwZXJjYWxsIGlzIHVzZWQgaW4gZ3Vlc3QncyBjb2RlIHdoaWNoIGRvZXNuJ3QgaGF2ZSBh
bnkNCg0Kb3RoZXIgbWVhbnMgdG8gcHJpbnQgeWV0LCBlLmcuIGVhcmx5IHByaW50ayBjYXNlLg0K
DQpJZiBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBpc3N1ZSBjb3JyZWN0IHRoZW4gSSBjYW4gcHJv
YmFibHkgcHJlcGFyZSBhIHBhdGNoLg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQpbMV0g
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2Ry
aXZlcnMvY2hhci9jb25zb2xlLmM7aD01NmUyNDgyMWIyZjhkMmI5YmZiOTlkMmFjYjcyMWIwNjI3
NzgzNGNlO2hiPXJlZnMvaGVhZHMvbWFzdGVyI2w1OTcNCg0K

