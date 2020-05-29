Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFF31E7F4B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefSI-0003Y5-P0; Fri, 29 May 2020 13:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jefSI-0003Xz-12
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:53:50 +0000
X-Inumbo-ID: d1e03c3e-a1b3-11ea-9947-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1e03c3e-a1b3-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMIjrEr3uCgbOYxLbUKqsqpRsbEK6b9/AtTsdYEBkMs=;
 b=VnkAwLWOVkffEjVhw3xWuwxMNLJVu67zGVFlnv9Rl0VH6GK7GKex/Vi4oHVHs5O0xq/RdNnY1+Htpd7zlf1FT1wI4OJ/ffyil17fjn8Ur7wFC8JCXqJoRFbDQzCelSezKY+49HJXumQW1CX36dibGtUsJJW36cgp5GRTfDU2+Z0=
Received: from DB8PR03CA0008.eurprd03.prod.outlook.com (2603:10a6:10:be::21)
 by DB8PR08MB3994.eurprd08.prod.outlook.com (2603:10a6:10:a6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 13:53:45 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::ce) by DB8PR03CA0008.outlook.office365.com
 (2603:10a6:10:be::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 13:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 13:53:45 +0000
Received: ("Tessian outbound b157666c5529:v57");
 Fri, 29 May 2020 13:53:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9234978a896f37d
X-CR-MTA-TID: 64aa7808
Received: from 40103269d7fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A06A3E5-2B8E-4F71-9F85-3E409D9B2B90.1; 
 Fri, 29 May 2020 13:53:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40103269d7fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 13:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxWXa0mneM3Fnb35ZPNFEVkhOvynO4OJzKJQ4DXE/dDRGmXygo1tzJjyav/B4rYvOnKsuCeT4sMYjWc/zKCD7yZrzYfqGpeDlF0mZMoVLHAaRmDPmU0zhPLS/Qurs1R/WO7hDn+KeD2A365CRhoKa4n5WoZLlZbmUr7kYqr4EQMwe252IqdrSDIYXmJxvJjYmREBJmmA+KWp9dHKpSK5Hnv3EmjjQ7jMgSGo7j1lKpqC1jD+9KDgn3cKXp10UIzBII1wfvwCWCetsAWr6zH+ZG2i2+oni7FBVoiYr9ImgkJ1W11JqgoVXWHiusa3bN6SYOY2yeUqxIfkUDpuuyWZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMIjrEr3uCgbOYxLbUKqsqpRsbEK6b9/AtTsdYEBkMs=;
 b=LsvoApdtYG0F/s6GMfmtuwkOrUuz6FOMkN6OypOMbDzplCPeDqvtZuhrPbE06xWoh5eVzzB8INYW938MtUTe2GVh1sn4eWXrJi527cdI2dlOyFCzZYfLuEEQs407BZlLS7Zxui5owMbVwvolj1e8Wi6qL8Oxml0boLRPcaRDrqEFH+gBBSIqIUNiylogsIZC8vKnTirKoAqnns9X8wWUyDzLabPeo8rJzf0aTdYMM3Iga76hv4RgBoCL33YhL8F+j7yy5QyTxexntpKkzvDRRjfQeP/KEHmSMws1Q7AIt4AvGKFe6ESI+hFmvUdg6qUSMnEhfW7kxqJOn32fjOemgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMIjrEr3uCgbOYxLbUKqsqpRsbEK6b9/AtTsdYEBkMs=;
 b=VnkAwLWOVkffEjVhw3xWuwxMNLJVu67zGVFlnv9Rl0VH6GK7GKex/Vi4oHVHs5O0xq/RdNnY1+Htpd7zlf1FT1wI4OJ/ffyil17fjn8Ur7wFC8JCXqJoRFbDQzCelSezKY+49HJXumQW1CX36dibGtUsJJW36cgp5GRTfDU2+Z0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3034.eurprd08.prod.outlook.com (2603:10a6:5:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 13:53:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 13:53:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADfWQCAAAi2gIAACV6AgAACdoCAAEpYAA==
Date: Fri, 29 May 2020 13:53:35 +0000
Message-ID: <B04DCD98-E475-49C8-8540-68BE1DB96AF5@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
 <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
 <20200529092716.GK1195@Air-de-Roger>
In-Reply-To: <20200529092716.GK1195@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ab2c8d4-e042-478e-49fb-08d803d7b485
x-ms-traffictypediagnostic: DB7PR08MB3034:|DB8PR08MB3994:
X-Microsoft-Antispam-PRVS: <DB8PR08MB3994A9869F4BD7EEE199942B9D8F0@DB8PR08MB3994.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tnPm61UnNyC82NFd3xuo3JoULrHdDm103D0Hb+/dU6r3WJXLbRn9eb6qd0fEpdDpO/RJO0PxWiJbYGPszOZ1Ooo0FwZ+4QAv4e/v/hu5TavjLGgWdqBnk72jv6YtXzBVAqOi/UpQjmIX5kHnmbiInAi2Rr3F2gnEcyjm3LQBKxBpXjNu+oCfeQA92DHPcz/R20ri+t+enFILuTQ3Y7ZCLH8zWr4UirrFCZhHXJPezliKkuQRQMNYJI6j5JV3apDO9RWWeUfyhhy3V64GhjgCyTSMy4QjOdXAxeKZWYF9YE+rFFRH2MBQ1G4C3o7RID3CFft2tZHZoHxpwBcZxZNxsA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(2906002)(54906003)(6916009)(7416002)(2616005)(64756008)(186003)(86362001)(478600001)(66476007)(66556008)(66446008)(91956017)(66946007)(76116006)(316002)(4326008)(8936002)(6486002)(8676002)(6512007)(33656002)(36756003)(83380400001)(71200400001)(53546011)(26005)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AQgPYolQrC+yb7Jd+kFk3UNYo4qDi9VPH++KKj+0CtsG3HUi2PeTK6E+OXGEQy+h5qObIevUe29uPQ8ZlkDSnUUrg5BxAiiIIygUU8HkS66SACeL22H0iDcEbDe1B602bNoneZzjuxTyXUiZ9p/5AlnMBEeVNZcdlkFfgJEVkqYJKNghCWQn+HRUSqsH+a4ywV8qCWo6LrYW7g1uFGKUbylVwukSKS6a6y1FT0+Nl2Md/yiokvSYl1duZD5yPiL/Q+012VkcCfM+RDCb30RI9IV8BY5WPA5eNDUnyOtMqdvWLJSKkeWV8b/1TnnQUqpNg0Y4RN+VSAqHuC8xxlXY/Yn3K2oKtnBAU7Z35obUjpOwv0b8mC4Kj1FHSg+kI9YBJ1P31aDQIX+aPivlFe5+kCXzTlEQxTGiT+JBNfe0tS2+k+n2wau/hp/RMwbSbEm3RpMfA3fEbzVRxFBcaUl05xw/nHaI5xPHRMnD/sT2pXAOnP3KAjX8wAK7IJVX9xbL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <69788FAB475F1E43A72E0D9EC3E1010A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3034
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(2906002)(86362001)(6512007)(6486002)(54906003)(316002)(81166007)(4326008)(70586007)(6862004)(6506007)(70206006)(186003)(8936002)(82310400002)(26005)(53546011)(356005)(478600001)(47076004)(82740400003)(5660300002)(36756003)(8676002)(336012)(2616005)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d6c95d69-2704-4b65-859f-08d803d7ae8e
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wra8en0buN3eN3jUUupdW1vX7bKIyrk6xpqSayu3hmOew70Xr87Hye6zL87OxLRzbHME4qnMCCdT6qvs98GYvTiTkfwje9udC6AA1OF2wEHkoe9DhN9KlLyJMPBl1UaYXEuQqfuTbYolK0mDP98bM3P7cCDl/vWNMDijWhgx82n7K37JRFS2KyA0JVZpamrVVzbddKgHOfZAxeIpOslKoW22ZAl4Ohw23VaQD+iUI54OmZBS8bsPiJw3lWtwvMheTnOL6A+rBvRrJUkWy7bRH9wJEzz6MK8tgsR57d14qon1Sq40SoZ8TMXZvEsluS0nbKzNk9iT9bbqvYkfvO0gm/FAbNB/+fThikCnN74tA0shyoJu58/jDWTh6ekUHMwxwfKkApu8oNThxXLDm7qjuw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 13:53:45.4311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab2c8d4-e042-478e-49fb-08d803d7b485
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3994
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjkgTWF5IDIwMjAsIGF0IDEwOjI3LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlckB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTWF5IDI5LCAyMDIwIGF0IDA5OjE4OjQyQU0g
KzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiAy
OSBNYXkgMjAyMCwgYXQgMDk6NDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gMjkuMDUuMjAyMCAxMDoxMywgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4+Pj4+IE9uIDI4IE1heSAyMDIwLCBhdCAxOTo1NCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiBBRkFJQ1QsIHRoZXJlIGlzIG5vIHJlc3RyaWN0aW9uIG9u
IHdoZW4gdGhlIHJ1bnN0YXRlIGh5cGVyY2FsbCBjYW4gYmUgY2FsbGVkLiBTbyB0aGlzIGNhbiBl
dmVuIGJlIGNhbGxlZCBiZWZvcmUgdGhlIHZDUFUgaXMgYnJvdWdodCB1cC4NCj4+Pj4gDQo+Pj4+
IEkgdW5kZXJzdGFuZCB0aGUgcmVtYXJrIGJ1dCBpdCBzdGlsbCBmZWVscyB2ZXJ5IHdlaXJkIHRv
IGFsbG93IGFuIGludmFsaWQgYWRkcmVzcyBpbiBhbiBoeXBlcmNhbGwuDQo+Pj4+IFdvdWxkbuKA
mXQgd2UgaGF2ZSBhIGxvdCBvZiBwb3RlbnRpYWwgaXNzdWVzIGFjY2VwdGluZyBhbiBhZGRyZXNz
IHRoYXQgd2UgY2Fubm90IGNoZWNrID8NCj4+PiANCj4+PiBJIGRvbid0IHRoaW5rIHNvOiBUaGUg
aHlwZXJ2aXNvciB1c2VzIGNvcHlfdG9fZ3Vlc3QoKSB0byBwcm90ZWN0DQo+Pj4gaXRzZWxmIGZy
b20gdGhlIGFkZHJlc3NlcyB0byBiZSBpbnZhbGlkIGF0IHRoZSB0aW1lIG9mIGNvcHlpbmcuDQo+
Pj4gSWYgdGhlIGd1ZXN0IGRvZXNuJ3QgbWFrZSBzdXJlIHRoZXkncmUgdmFsaWQgYXQgdGhhdCB0
aW1lLCBpdA0KPj4+IHNpbXBseSB3b24ndCBnZXQgdGhlIGluZm9ybWF0aW9uIChwZXJoYXBzIHVu
dGlsIFhlbidzIG5leHQNCj4+PiBhdHRlbXB0IHRvIGNvcHkgaXQgb3V0KS4NCj4+PiANCj4+PiBZ
b3UgbWF5IHdhbnQgdG8gdGFrZSBhIGxvb2sgYXQgdGhlIHg4NiBzaWRlIG9mIHRoaXMgKGFsc28g
dGhlDQo+Pj4gdkNQVSB0aW1lIHVwZGF0aW5nKTogRHVlIHRvIHRoZSB3YXkgeDg2LTY0IFBWIGd1
ZXN0cyB3b3JrLCB0aGUNCj4+PiBhZGRyZXNzIG1heSBsZWdpdGltYXRlbHkgYmUgdW5tYXBwZWQg
YXQgdGhlIHRpbWUgWGVuIHdhbnRzIHRvDQo+Pj4gY29weSBpdCwgd2hlbiB0aGUgdkNQVSBpcyBj
dXJyZW50bHkgZXhlY3V0aW5nIGd1ZXN0IHVzZXIgbW9kZQ0KPj4+IGNvZGUuIEluIHN1Y2ggYSBj
YXNlIHRoZSBjb3B5IGdldHMgcmV0cmllZCB0aGUgbmV4dCB0aW1lIHRoZQ0KPj4+IGd1ZXN0IHRy
YW5zaXRpb25zIGZyb20gdXNlciB0byBrZXJuZWwgbW9kZSAod2hpY2ggaW52b2x2ZXMgYQ0KPj4+
IHBhZ2UgdGFibGUgY2hhbmdlKS4NCj4+IA0KPj4gSWYgSSB1bmRlcnN0YW5kIGV2ZXJ5dGhpbmcg
Y29ycmVjdGx5IHJ1bnN0YXRlIGlzIHVwZGF0ZWQgb25seSBpZiB0aGVyZSBpcw0KPj4gYSBjb250
ZXh0IHN3aXRjaCBpbiB4ZW4gd2hpbGUgdGhlIGd1ZXN0IGlzIHJ1bm5pbmcgaW4ga2VybmVsIG1v
ZGUgYW5kDQo+PiBpZiB0aGUgYWRkcmVzcyBpcyBtYXBwZWQgYXQgdGhhdCB0aW1lLg0KPj4gDQo+
PiBTbyB0aGlzIGlzIGEgYmVzdCBlZmZvcnQgaW4gWGVuIGFuZCB0aGUgZ3Vlc3QgY2Fubm90IHJl
YWxseSByZWx5IG9uIHRoZQ0KPj4gcnVuc3RhdGUgaW5mb3JtYXRpb24gKGFzIGl0IG1pZ2h0IG5v
dCBiZSB1cCB0byBkYXRlKS4NCj4+IENvdWxkIHRoaXMgaGF2ZSBpbXBhY3RzIHNvbWVob3cgaWYg
dGhpcyBpcyB1c2VkIGZvciBzY2hlZHVsaW5nID8NCj4+IA0KPj4gSW4gdGhlIGVuZCB0aGUgb25s
eSBhY2NlcHRlZCB0cmFkZSBvZmYgd291bGQgYmUgdG86DQo+PiAtIHJlZHVjZSBlcnJvciB2ZXJi
b3NpdHkgYW5kIGp1c3QgaWdub3JlIGl0DQo+PiAtIGludHJvZHVjZSBhIG5ldyBzeXN0ZW0gY2Fs
bCB1c2luZyBhIHBoeXNpY2FsIGFkZHJlc3MNCj4+ICAtPiBVc2luZyBhIHZpcnR1YWwgYWRkcmVz
cyB3aXRoIHJlc3RyaWN0aW9ucyBzb3VuZHMgdmVyeSBjb21wbGV4DQo+PiAgdG8gZG9jdW1lbnQg
KGN1cnJlbnQgY29yZSwgbm8gcmVtYXBwaW5nKS4NCj4+IA0KPj4gQnV0IGl0IGZlZWxzIGxpa2Ug
aGF2aW5nIG9ubHkgb25lIGh5cGVyY2FsbCB1c2luZyBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMN
Cj4+IHdvdWxkIG5vdCByZWFsbHkgYmUgbG9naWMgYW5kIHRoaXMga2luZCBvZiBjaGFuZ2Ugc2hv
dWxkIGJlIG1hZGUgYWNyb3NzDQo+PiBhbGwgaHlwZXJjYWxscyBpZiBpdCBpcyBkb25lLg0KPiAN
Cj4gRlJULCB0aGVyZSBhcmUgb3RoZXIgaHlwZXJjYWxscyB1c2luZyBhIHBoeXNpY2FsIGFkZHJl
c3MgaW5zdGVhZCBvZiBhDQo+IGxpbmVhciBvbmUsIHNlZSBWQ1BVT1BfcmVnaXN0ZXJfdmNwdV9p
bmZvIGZvciBleGFtcGxlLiBJdCdzIGp1c3QgYQ0KPiBtaXhlZCBiYWcgcmlnaHQgbm93LCB3aXRo
IHNvbWUgaHlwZXJjYWxscyB1c2luZyBhIGxpbmVhciBhZGRyZXNzIGFuZA0KPiBzb21lIHVzaW5n
IGEgcGh5c2ljYWwgb25lLg0KPiANCj4gSSB0aGluayBpbnRyb2R1Y2luZyBhIG5ldyBoeXBlcmNh
bGwgdGhhdCB1c2VzIGEgcGh5c2ljYWwgYWRkcmVzcyB3b3VsZA0KPiBiZSBmaW5lLCBhbmQgdGhl
biB5b3UgY2FuIGFkZCBhIHNldCBvZiByZXN0cmljdGlvbnMgc2ltaWxhciB0byB0aGUNCj4gb25l
cyBsaXN0ZWQgYnkgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mby4NCg0KWWVzIEkgZm91bmQgdGhh
dCBhbmQgSSBhbHNvIHdvbmRlcmVkIHdoeSBydW5zdGF0ZSB3YXMgbm90IGluY2x1ZGVkIGluIHRo
ZSB2Y3B1X2luZm8gaW4gZmFjdC4NCg0KPiANCj4gQ2hhbmdpbmcgdGhlIGN1cnJlbnQgaHlwZXJj
YWxsIGFzIHByb3Bvc2VkIGlzIHJpc2t5LCBidXQgSSB0aGluayB0aGUNCj4gY3VycmVudCBiZWhh
dmlvciBpcyBicm9rZW4gYnkgZGVzaWduIHNwZWNpYWxseSBvbiBhdXRvIHRyYW5zbGF0ZWQNCj4g
Z3Vlc3RzLCBldmVuIG1vcmUgd2l0aCBYUFRJLg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0K

