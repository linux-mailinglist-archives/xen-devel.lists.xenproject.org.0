Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510523466F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:04:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Ui6-0003Tp-2k; Fri, 31 Jul 2020 13:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1Ui4-0003Ti-9S
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:04:28 +0000
X-Inumbo-ID: 5cc41b9e-d32e-11ea-8e30-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc41b9e-d32e-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRMB0UR5j8DpixaHREdiqCaJRQTn1wXeZcoLQkXzj7I=;
 b=HlgN/ZuZ/ATXm8hxiGmHVuRKXkyTky2S+gJ5HvbhgZy2H/+mofskzEnrqw79XnUQpX1HWGZ3CnyoYAiMyt0ex5x60285APdn3iDGYKRc2F0k4DQucGVfX8mpoyMZDPUqXVOaOLrcvluvxhGW79GYpN4zCRCBwa/OiI1rMuZ3Ma8=
Received: from AM6PR05CA0033.eurprd05.prod.outlook.com (2603:10a6:20b:2e::46)
 by VI1PR0801MB1933.eurprd08.prod.outlook.com (2603:10a6:800:8d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Fri, 31 Jul
 2020 13:04:25 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::fa) by AM6PR05CA0033.outlook.office365.com
 (2603:10a6:20b:2e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 13:04:25 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Fri, 31 Jul 2020 13:04:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4a38bd26bfdfdcc
X-CR-MTA-TID: 64aa7808
Received: from 496eed6af33a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FE1641A-1070-4EB2-A6B0-F642C035AE34.1; 
 Fri, 31 Jul 2020 13:04:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 496eed6af33a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 13:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI0VS157I9mAVK8QkcwYAO/Y3Hh8L9hKdD+8x/vp746bQvHSIXhKCD7H6v9k6Sqf0yaxfT/72mTeXL1llC43t4eI8RX/6v1/lcj1KVGDERPGdAcGeugRwOntMOpVspvmC2PzeFtNckRSJAZkEe4KsxT6WKVS18/uCjYUe63eFW/Q7jYO5kTOGwr9f0UUDTjRyTOmzRnFvTEs05ZBYBvEeIwta23mNiZSPCIc0V59xTR6kPVhr8Z4qq0R6Di4COGPR49JB3RMDuAJhgvgnO7ei9PZwCog7uq8z0BZIsCs1EF8LP5yf5wwFElxOvLmt+4vX3TaIE5L8K92fRz21AEYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRMB0UR5j8DpixaHREdiqCaJRQTn1wXeZcoLQkXzj7I=;
 b=Z8m14NpC6SlVKyp6FtbuongFnMaH79E5/J7l2rB+YKYEZDYbTRMkuaRYp+XUK6/CvPHG3/xmFTp2iCobBYzqku5PpMdk6zqj1NchPCRr/McTuNoCKSB92XOj/FOOfmGWVvwghIf5JUJOeNdiAW93b6LOgzigyvcpS8/2ukwVdmETBc6kba6H/3sScNhGjFioNdlxTNRJFZR8iyomAc53xqzH999hzszP5lh2J6Yw199AklJ8vBmiVfBuZMNSz8ipyEvfHY/S4SgoxIuzkMbaWnjx+Qs8iFfnbb1cG6AOvq2T/2fCop5aNLDkfedDRKqplQbEGCD+Br+mLUnd1Z6rLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRMB0UR5j8DpixaHREdiqCaJRQTn1wXeZcoLQkXzj7I=;
 b=HlgN/ZuZ/ATXm8hxiGmHVuRKXkyTky2S+gJ5HvbhgZy2H/+mofskzEnrqw79XnUQpX1HWGZ3CnyoYAiMyt0ex5x60285APdn3iDGYKRc2F0k4DQucGVfX8mpoyMZDPUqXVOaOLrcvluvxhGW79GYpN4zCRCBwa/OiI1rMuZ3Ma8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 13:04:17 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:04:17 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
Thread-Topic: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
Thread-Index: AQHWZp4EjLyFAMhDcEetGvqId62N/akhqPWA
Date: Fri, 31 Jul 2020 13:04:17 +0000
Message-ID: <5DD7E100-D146-4853-A1CA-168DA1802C7A@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-2-julien@xen.org>
In-Reply-To: <20200730181827.1670-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: da39a358-0ab7-4ae8-12ea-08d83552404b
x-ms-traffictypediagnostic: DB6PR08MB2694:|VI1PR0801MB1933:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB193355787E3FF4F9E5AD83659D4E0@VI1PR0801MB1933.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ipYbNwJxfr9/S2rTwtnpct/+T81tTe1O/QYr+xrKUHPstzedcywww/j/5Dw2tidhwG5rlUH7G3HIOjwjD5hyKphLl8Ls27By8rgG7mXN4v092ZoLYK/jRwwHolm+7muoKRttFS32pU/y2necrp9lcC+y2CJW1YIueRaMYx1q16sToKQ0IfH6bPyKrGAF8UAdtkGyy1UJjX2mGJ4l0PjqvnlSTPYKB4N7yZi0xk5wf7P//JKlBBHcFSgkMp7iv5ojWBtZ9ZuAyAIcuw10YFyFLpvnWV45E9osP/ACp+UpeXjlEhDF0/4mFGLL0WNXFwxj
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6512007)(4326008)(6486002)(8676002)(8936002)(33656002)(5660300002)(6916009)(86362001)(2906002)(54906003)(7416002)(64756008)(478600001)(316002)(186003)(36756003)(66476007)(6506007)(53546011)(91956017)(66556008)(2616005)(66946007)(71200400001)(83380400001)(66446008)(26005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9XpIu7+8RtWpr97yqqEs2SGf1hOZ1cIb0P/LciYClfDtLYu9tMb+xIkU8S2jReTX+WIUlMdw9J0LStFbbgQTNxPgjPQNEB74J0a43R3riiJx8e5bu4yMHFlP8zHFyEMmr3VrxCKQFyR7IW67L6cAFWy3PsHdUE2gwM5LnYhbrcr7dPSt5gxhkjlnkBqXqq1sTeiIchs56mjFHptW8yFckE7+vSf7TdzkcVn7WHDwXovHCPBrCWyQBWaGSqEWbDfS5CHsGV7gysgyaWYeYPJYMDXtb1v50lWMWOe84p9cedImO2I+Z4qAgRe76/IT7lL2J8qJPW9/PolTED44g75zBm88LmqV4MKivb4ZKbZhqGIlIOk0oepfgAYTuRDhYqXd/UJ6/ptB+ikYlHzts309Wsy6BJihO+HGa3fg7aMEx3L+GoMlMfpNrGtQkpOfoeyVvg3u70cx+xcIVIk400QmDYFovouoUjIC7RN1h1ZUa4sCfJFacFPyfapNk0stwWr5mFbSjpax+OFFwc5ee9SG5rDffuchQZUz/yt8oblHHzpJCnZYFWVL2hGk5DU5vThh3jV1xLXFZKus16xXsgzaPUJna0yLo0UJd5/KhlQSnqL9KzOgcwj2nHA1qOx53sgJn4iogJXkTOQdKNskV6AABA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E6953D5205C4442A4B26DC8AD5222A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 09d77118-7aca-4978-a6fc-08d835523ba6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orNgZTfn5+jihPmUtQYNR5bkW/FPaDY+xd+P+BAS5WSTtLdeCKalwiKNN2rm8sHfFEDg2aRwC06O9j/CoEhFNiyOvLbhrHDzWimxZVzL+tjl5xk9iUjmoerKW/Jft/feMzxfIuuX2+d3IFQdeSi6Itzf37aHA0QvMwTCN4uBfaXX8gefHrl3A7YSV9c8Ngg1gyJG7VxuzMRuPcFc8dVdAyaBxekmFax1V0yqcUNxmGmgmR60KnsyhrxgZw1H/ImA3jaXPSep9j2P/ujJRkex3BwdvyGrf6w0DdjCJSE0B5NsCSiV4w+yv9D2dZUtSK1No5SlzWvZWCM7HSMPkFB4egCLFMT5KVCyKlMic3hgHvseoj6w4d7CTxYjqqgKbHKmNyujkXUpuUJk9UAQ6xd8Gw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(33656002)(8676002)(82740400003)(2906002)(70586007)(186003)(356005)(36756003)(8936002)(2616005)(5660300002)(81166007)(54906003)(82310400002)(316002)(6512007)(36906005)(336012)(70206006)(6506007)(6486002)(83380400001)(53546011)(6862004)(478600001)(4326008)(86362001)(47076004)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:04:25.4588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da39a358-0ab7-4ae8-12ea-08d83552404b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1933
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMzAgSnVsIDIwMjAsIGF0IDIwOjE4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBZGQgZW1hY3MgbWFnaWNzIGZvciB4ZW4vZ3Vlc3RfYWNjZXNzLmggYW5kDQo+IGFz
bS14ODYvZ3Vlc3RfYWNjZXNzLmguDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpNb3N0IG9mIGZpbGUgaW4gWGVuIHNvdXJjZSBjb2RlIHNlZW0gdG8gaGF2ZSBh
IHdoaXRlIGxpbmUgYmVmb3JlIHRoZSDigJxlbWFjcyBtYWdpY3PigJ0uDQpJZiB0aGlzIGlzIHNv
bWV0aGluZyB0aGF0IHNob3VsZCBiZSBlbmZvcmNlZCwgaXQgc2hvdWxkIGJlIGRvbmUgaGVyZS4N
Cg0KSWYgbm90IHRoZSBjaGFuZ2Ugc2VlbXMgb2sgOi0pDQoNCj4gDQo+IC0tLQ0KPiAgICBDaGFu
Z2VzIGluIHYyOg0KPiAgICAgICAgLSBSZW1vdmUgdGhlIHdvcmQgIm1pc3NpbmciDQo+IC0tLQ0K
PiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0X2FjY2Vzcy5oIHwgOCArKysrKysrKw0KPiB4ZW4v
aW5jbHVkZS94ZW4vZ3Vlc3RfYWNjZXNzLmggICAgIHwgOCArKysrKysrKw0KPiAyIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0X2FjY2Vzcy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdF9hY2Nlc3Mu
aA0KPiBpbmRleCAyYmUzNTc3YmQzNDAuLjNmZmRlMjA1ZjZhMSAxMDA2NDQNCj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdF9hY2Nlc3MuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0X2FjY2Vzcy5oDQo+IEBAIC0xNjAsMyArMTYwLDExIEBADQo+IH0pDQo+IA0KPiAj
ZW5kaWYgLyogX19BU01fWDg2X0dVRVNUX0FDQ0VTU19IX18gKi8NCj4gKy8qDQo+ICsgKiBMb2Nh
bCB2YXJpYWJsZXM6DQo+ICsgKiBtb2RlOiBDDQo+ICsgKiBjLWZpbGUtc3R5bGU6ICJCU0QiDQo+
ICsgKiBjLWJhc2ljLW9mZnNldDogNA0KPiArICogaW5kZW50LXRhYnMtbW9kZTogbmlsDQo+ICsg
KiBFbmQ6DQo+ICsgKi8NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9ndWVzdF9hY2Nl
c3MuaCBiL3hlbi9pbmNsdWRlL3hlbi9ndWVzdF9hY2Nlc3MuaA0KPiBpbmRleCAwOTk4OWRmODE5
Y2UuLmVmOWFhYTNlZmNmZSAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2d1ZXN0X2Fj
Y2Vzcy5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ndWVzdF9hY2Nlc3MuaA0KPiBAQCAtMzMs
MyArMzMsMTEgQEAgY2hhciAqc2FmZV9jb3B5X3N0cmluZ19mcm9tX2d1ZXN0KFhFTl9HVUVTVF9I
QU5ETEUoY2hhcikgdV9idWYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplX3Qgc2l6ZSwgc2l6ZV90IG1heF9zaXplKTsNCj4gDQo+ICNlbmRpZiAvKiBfX1hFTl9HVUVT
VF9BQ0NFU1NfSF9fICovDQo+ICsvKg0KPiArICogTG9jYWwgdmFyaWFibGVzOg0KPiArICogbW9k
ZTogQw0KPiArICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPiArICogYy1iYXNpYy1vZmZzZXQ6IDQN
Cj4gKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbA0KPiArICogRW5kOg0KPiArICovDQo+IC0tIA0K
PiAyLjE3LjENCj4gDQo+IA0KDQo=

