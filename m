Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9421C1082
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 11:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUSLP-0000Hn-Uv; Fri, 01 May 2020 09:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rha=6P=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jUSLP-0000Hi-8M
 for xen-devel@lists.xen.org; Fri, 01 May 2020 09:52:31 +0000
X-Inumbo-ID: 77b3e9b4-8b91-11ea-b9cf-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77b3e9b4-8b91-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3g1FoEufwcGPWv0JcEVYzL/MA9QpcMUjeENsLHfKxo=;
 b=8i9izFGk5CchLfno1vkazkgZMUK8G18DZiYtQUamjcF4JkTdX5oX9zJlFtAiU2GU/OY8yS8EzIEBWqkiSkcGi0hWyH6w3VVvhIimRaVeGEB+wm0Fjzbni3yWZRhCMImDqBcdxygSUvtm5h+S8cM0SRCXy3qJsEzXDOCBCs3TGFg=
Received: from AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) by AM5PR0801MB1891.eurprd08.prod.outlook.com
 (2603:10a6:203:4a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 09:52:27 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::b6) by AM5PR0402CA0008.outlook.office365.com
 (2603:10a6:203:90::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 09:52:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 09:52:26 +0000
Received: ("Tessian outbound ff098c684b24:v54");
 Fri, 01 May 2020 09:52:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4399fab4997e21a8
X-CR-MTA-TID: 64aa7808
Received: from 30ff47e8bea2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5453799-1394-4DA7-B33D-7D3F797429A8.1; 
 Fri, 01 May 2020 09:52:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30ff47e8bea2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 May 2020 09:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn/kzQFEZ24EDNQdGUr+gOj40C43wpB84XyUR4cY2ovubb6YOoahSj52oNMXm505pSLQFPRa/t4NjOd9SXu6vFJquXuWzw66hYy2aR+W9XApHbt0BCCIve/8vh7tTnrKNavlJn6SXZWfLjwtVQkKkByz6TgZ+uwv37Pp0I1XEHI3WDW8Jv52jSPqM+bOYPp0MNG92nxvfh6sCHaKiFowiojbH4nGx/KRqCqN6o9ro6SKLlsib0pxWRbq6X1DjGoRaksl7X6QP18+CcSlQzGrWQTVWodlqKuHPVVN1AB0jxvUOn4ajM/Z/PoZgt/VZr+FSdK59KIsKBNKvfj+6FaG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3g1FoEufwcGPWv0JcEVYzL/MA9QpcMUjeENsLHfKxo=;
 b=INQ/HWL2apDmSCDTwaarDI3d+YRTs977e51nAap4eOGzY95ruxUVN2V4HqsVmAc6hAnkVPEcLvZG9OM0cFK4BQmN4Tvp6uCIYcUxDziLk1C2WKSEV0NeXbAxR2HiCB+AsnIkajdkPqWwJukRUBjzSjkCiG0cEytLOLHnirCektnn1mpkBne2uPY8dN6reAaqEn+feE/GndU4atXuOhsHAmZFOsa5kSqopqy4FOJZvXRMjEVVAYT7v/RAlNygTCZhFkCvg1nnLAk24DBk48s7ZEyN67stp0HObmLLgKEiCMCDztV7D1mnd1KSmwD9mJwE2LrPYaxR70e8AZ5/ZHCzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3g1FoEufwcGPWv0JcEVYzL/MA9QpcMUjeENsLHfKxo=;
 b=8i9izFGk5CchLfno1vkazkgZMUK8G18DZiYtQUamjcF4JkTdX5oX9zJlFtAiU2GU/OY8yS8EzIEBWqkiSkcGi0hWyH6w3VVvhIimRaVeGEB+wm0Fjzbni3yWZRhCMImDqBcdxygSUvtm5h+S8cM0SRCXy3qJsEzXDOCBCs3TGFg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3402.eurprd08.prod.outlook.com (2603:10a6:10:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 1 May
 2020 09:52:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 09:52:19 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Samuel P. Felton - GPT LLC" <sam.felton@glacier-peak.net>
Subject: Re: Question...
Thread-Topic: Question...
Thread-Index: AdYffIk+nIOwP7iTQLuOs3KZB2G7LwAIaoMA
Date: Fri, 1 May 2020 09:52:19 +0000
Message-ID: <907FA58B-240E-45E6-B452-9094531F715E@arm.com>
References: <f017c46e427a45ecab00c1c59413658c@glacier-peak.net>
In-Reply-To: <f017c46e427a45ecab00c1c59413658c@glacier-peak.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: glacier-peak.net; dkim=none (message not
 signed) header.d=none;glacier-peak.net; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f6957d1-03d3-4729-4d2d-08d7edb55af8
x-ms-traffictypediagnostic: DB7PR08MB3402:|AM5PR0801MB1891:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB189126BDEBC83A8C8F244ED99DAB0@AM5PR0801MB1891.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RZVqBSgu0Me+xvUPkbqJBUp0fTDrEQZydHHn71YkVZlUvCVC5r+NBWviiWEXFWOt5GnlZdd80POnLQz6loPLe4MjA5d/av99dficvXyel6SXQHxPBVcqCwbUXM5Z1Y8Yh/E3vfF2arvYR5hOpEU8Sc77/QGLcqctXGPmwFk2WOj5KK1FmkkaIbQnW4ucdx19irnRoSDqwfqN12K3ViPE9ubjnfBlV5nALBZZGjSH8BrN8+L3Ripw3hBDiUJ93ugcTUF+ffZPKq5UFUUHb6sgVVTil8FKMWFx55HFymKVnODnR39HZnlbWhwTUtdL2l8lc4E5ywXGPj8FZPIq93icH8eSrpbHdCB5vXJcwWeWzSKebKCHVaQz6TXmDicBf2WDqFEHpkDNQ7jiXI7mWbNNASQpkY5H4Mi7snkN5+o+wxR/EtXbWMbedC8ZEwUxe+4Y
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(6512007)(53546011)(316002)(91956017)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(4326008)(33656002)(5660300002)(478600001)(71200400001)(2906002)(6506007)(36756003)(6916009)(86362001)(26005)(2616005)(7116003)(186003)(6486002)(8676002)(8936002)(3480700007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nLHSkLm1it5hlp3at8uHZFyWkW9tqJB2a8uC2QYCnNtvck+AeuqAm1NOrmw068v0wor/oA2Rg2XnFafrdUzCAf9lxrWqfeyKjyFDLPBz4+XO+nN8mi20WTVYZLIodF9F3uTxs5Kdns3QIlNH8u0fWsrwpjybVf//LjdnIF5ycNJcNeaj1ovskFuY3JoYVbSn8E0gAyn2M4HfBKZhqWc8ysqQ3qsFbS5J7/8nrGOflMv8IHDAd+U4tCUpQTumPNz1EDJubaHapmmS/hYowcfKzuRn3yh0DU827T++2l1shWcvWLuJsIH2Ztc6G7klWFvQV0Z1DO4+dVZJIyGBJHh1KL+5xeXQG0AnQQCBGtc7CM1keR4kp1ZHMfY4KjDiy4/GpWa3KYymG3VRE4wBOjqBd5BpmxnpBC46K/aoj0HQto0B27HqRGxbkH1DcC/iNumnDKHiM2EmAEwhtTYFi4RL0gpDUXhgazYpjFfGoU81uX5x3/Sn5Qe9Lxq6qarjQFC6VXyVJBQHrsm+XQJ1k7P6xBP6fwVan0kKg1/YaT8+CE+nx0msyQOJySJ+Y1gWQAwxpISgD5ZpPoCKJh83NHz0olBYK0MlTRZ6LGREYBdsoOWAb7JR3tIvIdD5rUPlNa0LZuOu30jz6kN6bMaPzI73tgtL7syRuVwXOvb4x3akVGK8O6p9tvTbea8dNUtcxO93uM00YfpfLEulgTVm0m9pPuIM+/RSrdUHv6ST7ISDQoGVXW1x85FSl2tI6HJpJW5Yzykd5gWx0KT/xnvuGj5DRKbmVz4LAxRvNgm3XXN1HVE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6497289C45E86B438EC4D9F881E44126@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
Original-Authentication-Results: glacier-peak.net;
 dkim=none (message not signed)
 header.d=none;glacier-peak.net; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(47076004)(7116003)(86362001)(36756003)(82740400003)(8676002)(5660300002)(70206006)(186003)(2906002)(3480700007)(53546011)(6506007)(70586007)(26005)(33656002)(316002)(8936002)(2616005)(36906005)(336012)(81166007)(6486002)(4326008)(478600001)(6862004)(82310400002)(6512007)(356005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5019afeb-037d-4e29-96a1-08d7edb556c6
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBy58Dn/q/bWRC7EEDcioF5TMrSmA7L35YarnXXxFf0g+tPRo79VVACIvJCwvAQQu6D/Ets8n9aTdDXevOLqKx2RMXHuKJjvaNUDqAmR8dP9YeDzHRW974pPlpbCdE+ZR0J2+ovtc57d+e5PLlr3o1XBdWSr2t3VXZIIya5cjJiTvy2hhhSN/RwyrBgGg8I8wTimuPHibIsaCn3qbGjiS6pEz7TN7bqLlMljR2DEBgCfCJmUPgB8hPlqiIpJGnOTgUPBJs/lge66rSyXvUIyRtIwSq8O8kO3G8wHyqIVB8h4ouB95vhyTu4++6RDxhHUJohier8gD9z3rCXhg/CRbqJX9VsP1xv9ucDOv/MOtaCmab6/Re9WaGcAvSPh5nJJb/7wpRCk4He6rikU+guiVJ5ejJXRlAbd0oS9KqNcSL4nDGb+d++PN8oF3l47ziqO9tucELWk8kVu7IDMYpHHnVsNaAz027JRfXLknzpOHqDKGF4FsUYN9ls9cC7AtnCfPniat13G2iHpgtfVB2tKXw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 09:52:26.6266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6957d1-03d3-4729-4d2d-08d7edb55af8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1891
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
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU2FtdWVsLA0KDQo+IE9uIDEgTWF5IDIwMjAsIGF0IDA2OjU5LCBTYW11ZWwgUC4gRmVsdG9u
IC0gR1BUIExMQyA8c2FtLmZlbHRvbkBnbGFjaWVyLXBlYWsubmV0PiB3cm90ZToNCj4NCj4gU28s
IEnigJltIHRyeWluZyB0byBnZXQgYSBYZW4gRG9tMCBhbmQgRG9tVSwgYm90aCBydW5uaW5nIFVi
dW50dSAyMC4wNCBMVFMgdXAgb24gb3VyIGJyYW5kLW5ldyBHaWdhYnl0ZSBUaHVuZGVyWDIgQVJN
NjQgYm94LiBJIGNhbiBnZXQgVWJ1bnR1IHVwIGFuZCBydW5uaW5nLCBidXQgYWZ0ZXIgaW5zdGFs
bGluZyB0aGUgWGVuIGJpdHMsIGl0IGRpZXMgYWZ0ZXIgdGhlIFVFRkkgbGF5ZXIgbGF1bmNoZXMg
R1JVQi4gSSBoYXZlbuKAmXQgYmVlbiBhYmxlIHRvIGdldCBhbnkgbG9nZmlsZXMgYmVjYXVzZSBp
dCBkb2VzbuKAmXQgZ2V0IHRoYXQgZmFyLiBOb3RoaW5nIHNob3dzIHVwIG9uIHRoZSBzZXJpYWwg
cG9ydCBsb2cgZWl0aGVyIOKAkyBpdCBqdXN0IGhhbmdzLg0KPg0KPiBIYXMgYW55b25lIG92ZXIg
dGhlcmUgYmVlbiB0cnlpbmcgdG8gZ2V0IGEgc2ltaWxhciBzZXR1cCBydW5uaW5nPyBBbSBJIG91
dCB0byBsdW5jaCBmb3IgdHJ5aW5nIHRoaXMsIG9yIGlzIHRoZXJlIHNvbWV0aGluZyBJ4oCZbSBt
aXNzaW5nPyBBbnkgaGVscCBhdCBhbGwgd291bGQgYmUgYXBwcmVjaWF0ZWQuDQoNCkkgYW0gY3Vy
cmVudGx5IHBvcnRpbmcgWGVuIG9uIGFuIE4xU0RQIGFybSBib2FyZCB3aGljaCBpcyBhbHNvIHVz
aW5nIGEgRURLMi9ncnViIHNldHVwIGFuZCBJIG1hbmFnZSB0byBzdGFydCB4ZW4gZnJvbSBncnVi
IGFuZCB0aGVuIHN0YXJ0IGRvbTAgcHJvdmlkaW5nIGEgRFRCLg0KDQpNeSBncnViIGNvbmZpZ3Vy
YXRpb24gbG9va3MgbGlrZSB0aGlzOg0KbWVudWVudHJ5ICd4ZW4nIHsNCiAgICB4ZW5faHlwZXJ2
aXNvciAkcHJlZml4L3hlbi5lZmkgbG9nbHZsPWFsbCBndWVzdF9sb2dsdmw9YWxsIGNvbnNvbGU9
ZHR1YXJ0IGR0dWFydD1zZXJpYWwwIGRvbTBfbWVtPTFHDQogICAgeGVuX21vZHVsZSAkcHJlZml4
L0ltYWdlIGNvbnNvbGU9aHZjMCBlZmk9bm9ydW50aW1lIHJ3IHJvb3Q9L2Rldi9zZGExIHJvb3R3
YWl0DQogICAgZGV2aWNldHJlZSAkcHJlZml4L24xc2RwLmR0Yg0KfQ0KDQpDb3VsZCB5b3Ugc2hh
cmUgeW91ciBncnViIGNvbmZpZ3VyYXRpb24gPw0KDQpCZXJ0cmFuZA0KDQo+DQo+IElmIHRoaXMg
ZG9lc27igJl0IHdvcmssIEnigJltIGdvaW5nIHRvIGhhdmUgdG8gZ28gdG8gRnJlZUJTRCBhbmQg
Qmh5dmUgYmVjYXVzZSBJIGtub3cgc29tZW9uZSB3aG8gaGFzIHRoYXQgd29ya2luZy4gSeKAmWQg
cmF0aGVyIHVzZSBMaW51eCB0aGFuIEJTRCBmb3IgdGhpcyBhcHBsaWNhdGlvbiwgdGhlcmUgYXJl
IG1vcmUgZHJpdmVycyBzdXBwb3J0aW5nIHRoaXMgaGFyZGF3YXJlLg0KPg0KPiBUaGFua3MsDQo+
IH5TYW0NCj4NCj4NCj4NCj4NCj4gPGltYWdlMDAxLnBuZz4NCj4gUGhvbmU6ICsxIDIwNiA3MDEt
NzMyMSBleHQuIDEwMQ0KPiBFbWFpbDogaW5mb0BnbGFjaWVyLXBlYWsubmV0DQoNCklNUE9SVEFO
VCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMg
YXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBu
b3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJz
b24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0
aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

