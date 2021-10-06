Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D2423C79
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202797.357814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4vt-0008CB-MP; Wed, 06 Oct 2021 11:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202797.357814; Wed, 06 Oct 2021 11:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4vt-0008AO-J4; Wed, 06 Oct 2021 11:17:57 +0000
Received: by outflank-mailman (input) for mailman id 202797;
 Wed, 06 Oct 2021 11:17:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY4vs-0008AI-Cp
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:17:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d5d81e-439e-4aff-9f94-b4646ef94a8f;
 Wed, 06 Oct 2021 11:17:54 +0000 (UTC)
Received: from AS9PR06CA0169.eurprd06.prod.outlook.com (2603:10a6:20b:45c::33)
 by AM0PR08MB4404.eurprd08.prod.outlook.com (2603:10a6:208:137::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 11:17:52 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::a) by AS9PR06CA0169.outlook.office365.com
 (2603:10a6:20b:45c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 11:17:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 11:17:52 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Wed, 06 Oct 2021 11:17:51 +0000
Received: from d3f23fa86b25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4A9FEC4-3A02-4411-BF40-B2FEF15183D0.1; 
 Wed, 06 Oct 2021 11:17:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3f23fa86b25.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 11:17:45 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6023.eurprd08.prod.outlook.com (2603:10a6:20b:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 11:17:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 11:17:44 +0000
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
X-Inumbo-ID: 62d5d81e-439e-4aff-9f94-b4646ef94a8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2PqoS9qf64W0dvbW9fTe7iTB30jPr0hswKZyn0Nll0=;
 b=gQj55cXBuT6WgRof4Yqua29GxKsQB/R3LRloZnVvsfMKuVSDvQ8jAC65S9xfPEAsKzvXB7IVAAre+X7WfytXonlI74JrsyxjWtxlmifJqcFX2eEA6WdQjVUPw4P+OxEgmTkg9WJh/hww1aIMmHgdxahR6ESVwJNbtqJ7sS3aaSo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3135a79f486a31a1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cs7W92OOtQQHtBAD7Nv0dii6hB5AXAEjY0XeoT8UxeeDGJ5dFip2v+A53kmFsfziPJ+mL7LrBPN2oT8Xf/WxRYV8EcqWeYSUENO9ksxmF5yHcrJiuiV0YxSRMJbNG/Tt814BmZlfEiUecZD+BjpRCVlOdhCnyeP9k4PSre8MF+r3yA4U0eK+t5V2tz8eFiMzYIgKRzGIV+bZYR+xUwpaPXabxYlK+AdMPRiYgrQkRilfPhuvnOWmsvpWYL0y87NU7g5pLok1sy/aX9C13Jun5ryTB2cz7xWZAz+RHRtvtFHJxwRff41Kh3e4VBjLumXsnhEjfF8pncDxnZ9o4Fj3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2PqoS9qf64W0dvbW9fTe7iTB30jPr0hswKZyn0Nll0=;
 b=BvT2MTyXlFmKW2w41fyTJwPb+IFicdyIUeIqJSz/1wXX5qBuDvgg8kUnhZ+us1yCNZiJjgWY+jBMsYikLOfCYttg/oeHRlnvJhOpw/4ssTK+b+iBEr/DOo3ubbofmvrIVi8cyNwYucAWQ05txJ0eOVriy9EqBreyzQ1xRCee6/k0g8TwcbkCguA/M9cGFQbuFzz5ATVNUWrVt3pouLk7wzLqXoXNgsPsfFQyIUOt4nwzE1Rc5hCw5fJbsh38AuReMv2yy71MSFHasUV8EM2yp6g+233hg2z4T4hiKAE4ruhPJsBBdOcoGVdNA9jSZrh6a3HA2JmGCtqCNxFm7yeUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2PqoS9qf64W0dvbW9fTe7iTB30jPr0hswKZyn0Nll0=;
 b=gQj55cXBuT6WgRof4Yqua29GxKsQB/R3LRloZnVvsfMKuVSDvQ8jAC65S9xfPEAsKzvXB7IVAAre+X7WfytXonlI74JrsyxjWtxlmifJqcFX2eEA6WdQjVUPw4P+OxEgmTkg9WJh/hww1aIMmHgdxahR6ESVwJNbtqJ7sS3aaSo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index:
 AQHXuRciClWhjFX7R0aQhsW/aixhyqvDkJEAgACf3oCAAL5hgIAAzJaAgAAXDgCAAALtgA==
Date: Wed, 6 Oct 2021 11:17:44 +0000
Message-ID: <BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
 <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
 <alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
 <8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
 <24925.33634.554859.2131@mariner.uk.xensource.com>
In-Reply-To: <24925.33634.554859.2131@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e7d31a71-6d2c-4005-a074-08d988baf01e
x-ms-traffictypediagnostic: AS8PR08MB6023:|AM0PR08MB4404:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB44044942D559A99976E0944EFCB09@AM0PR08MB4404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pYG0K8laRWkek3OH4F9TSEwEDGugPxZ9xYzA+bN9HqMVEL/EkWK1GlKRqQHPximqJdQ2YVAPvYLqQhnHvZEI+cLCvpC8c6fWlime0raNPkny78AR2Yu1JQPUAtaCXQp5LDluwWXrZI/HeDFYNW6CMKUQPEMp7cTwHhAiiBa3FdVdMdOJLVcQdsoZ8aUHXmRo2feIlupSM92/N3VHTGJbWGV6Bu1TGQOl0Z7f9K8RCmkaF1JuGSE4hGarOZe4R7Qp+Dv/5kkfSi2U24RgborCvgbt699PrziperxZ2IwB9JPkrBCm9HzHsrSh5UZ3oM+Ubdj8kODqodAoUJbRY1ZJbGCnVf3rsCcQ/HvnaDDbvcIAaTi9fzLWfmUFcBNxo7R/Dixa3gXNwUDQhvhGlxMqKHLF8NTUhFAB1mfeQwnV9XKYaEfhpD3LMCPl5aGKYUV9vUrmaqgVqO0lNZHdkn4jOa5QpewZsqOaYUiZ8TppTOVnCU4kOE9FK7kUvUE2RLnDm976syphLQB4RULCk83feklyVfUSDp7RDZea+TYxZHhF1uW6Q6sVU4a9pUT8ivI7si4CyyqqEfEJ4kDJiwUKYRaCo48/m6BocKVa33aM8WQduPbq3ZXSP+E3zv2VgRRXT/GhqPiTB2gUHGeSZ0XYWnxIXhTnpxo8bKtO42mPEdhYuRkyPI9vPI3IKxs6rqKYAgjgQ+8BdsLovQqQcTInw8B/4X5JrlJObVyW7RtU0TD8YPdl23T91aLJo9IXZYHw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(508600001)(6512007)(38100700002)(4744005)(66946007)(66556008)(66476007)(76116006)(64756008)(71200400001)(66446008)(91956017)(122000001)(2906002)(54906003)(6486002)(6916009)(316002)(36756003)(186003)(6506007)(8936002)(33656002)(4326008)(26005)(86362001)(8676002)(5660300002)(53546011)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <56B072043E7D724E85383B2E85EF6376@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d6c9c6c-48ca-4b04-295a-08d988baeb9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nPtoMiMx7/4G+Nz23xqO8be80E44JW0YuAzFNWIBFNiCjXhZ05uQSzc7+N01wMrSGlVC47nY+AifwV7gOv9znTeWe1B5W+0r7pJsaxsi53d5uy8hK8kTRTcw/jJDzZZnpSD++UG5f8kpy7IfkX61fhvHmQYulEq95er6Y4Rge6rCPlvgWx88xxvaFOf6Lvu2Gwv65hUJvHNpkcrCVwziSC1GAghM0UJrgXQ4RXOVf9QA8lg9CwwYF4TjYJEqk27hp9a6AscmIopDckOKur6O6lbPlK+FrcUnpMl2rQpXkrjnkCd1Z1mHSS+vy+iHELeNSAb2jup/HZOUtSYCwAEGckihryO5BGPELdeYEWtfIPK7+zQSE8/6x7EUpM+pP6mGi4y1yZtMTomZOiDWWvrEfPCZtDY7GmmbSF4vYuPu4uyBcXm7rFkrz83TY2fHa3C8Y7tQxFeIyKLIuWly1qaRIDF5/lTTjRnXXBAR+hHw9y7qxRdnitbAmUjVhb/i+K8kVkaIHvO15HSv0Es0QnPD5rpjrgI/aFdo9MyEwoQB8mnGLFimqsZjkD2EjZymNmqhGZ1CzXyRRFYUfVVeZOXf84tGIDi71FxyPMmTpqOtukDwlbXIjeIMZrbxkthlX7r4wHPoKlyqsvVwCDhHx6I3ngZm5iGJBGi/4ws2lj1+H53E7cNOYIg6Vm8XZpJruBjXwDtVQLCxx9R4wx0zx+nScw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(316002)(82310400003)(81166007)(4744005)(33656002)(26005)(70586007)(356005)(8936002)(8676002)(6486002)(107886003)(54906003)(6512007)(2906002)(336012)(36860700001)(6506007)(53546011)(47076005)(4326008)(86362001)(186003)(70206006)(508600001)(36756003)(6862004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 11:17:52.2399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d31a71-6d2c-4005-a074-08d988baf01e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4404

SGkgSWFuCQ0KDQo+IE9uIDYgT2N0IDIwMjEsIGF0IDEyOjA3IHBtLCBJYW4gSmFja3NvbiA8aXdq
QHhlbnByb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IFJhaHVsIFNpbmdoIHdyaXRlcyAoIlJlOiBb
UEFUQ0ggdjQgMTMvMTRdIGFybS9saWJ4bDogRW11bGF0ZWQgUENJIGRldmljZSB0cmVlIG5vZGUg
aW4gbGlieGwiKToNCj4+IGxpYnhsX2RlZmJvb2xfdmFsKGxpYnhsX2RlZmJvb2wgZGIpIGlzIGlt
cGxlbWVudGVkIGluIHN1Y2ggYSB3YXkgdGhhdCBpdCB3aWxsIGFzc2VydCANCj4+IGlmIGRiIHZh
bHVlIGlzIHRoZSBkZWZhdWx0LiBUaGVyZWZvcmUgd2UgaGF2ZSB0byBleHBsaWNpdGx5IHNldCBp
dCB0byBMSUJYTF9fREVGQk9PTF9GQUxTRSBmb3IgeDg2Lg0KPj4gDQo+PiBUaGVyZSBhcmUgdHdv
IG9wdGlvbiBlaXRoZXIgd2UgY2FuIGhhdmUgI2lmZGVmIG9yIHdlIGNhbiBtb3ZlIHRoZSANCj4+
IGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5hcmNoX2FybS52cGNpLCBmYWxzZSkg
dG8gY29tbW9uIGNvZGUuDQo+IA0KPiBXaGF0IGlzIHdyb25nIHdpdGggcHV0dGluZyBpdCBpbg0K
PiBsaWJ4bF9fYXJjaF9kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0DQo+IHdoaWNoIEkgdGhp
bmsgZXhpc3RzIHByZWNpc2VseSBmb3IgdGhpcyBraW5kIG9mIHRoaW5nID8NCg0KQXMgd2UgaGF2
ZSB0byBzZXQgdGhlIGFyY2hfYXJtLnZwY2kgdG8gZmFsc2UgZm9yIHg4NiBhbmQgQVJNIEkgdGhv
dWdodCBpdCBpcyByaWdodCB0byBtb3ZlIHRoZSBjb2RlIHRvDQpjb21tb24gY29kZSB0byBhdm9p
ZCBkdXBsaWNhdGlvbi4NCg0KQXJlIHlvdSBzdWdnZXN0aW5nIHRvIHB1dCAiIGxpYnhsX2RlZmJv
b2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5hcmNoX2FybS52cGNpLCBmYWxzZSnigJ1pbiANCmxpYnhs
X19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoKSBmb3IgeDg2IGFuZCBBUk0gZGlm
ZmVyZW50bHkuDQoNClJlZ2FyZHMsDQpSYWh1bA0KPiANCj4gSWFuLg0KDQo=

