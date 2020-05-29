Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC731E7930
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebAF-0000S4-Lf; Fri, 29 May 2020 09:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jebAE-0000Rz-KJ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:18:54 +0000
X-Inumbo-ID: 69d3e97c-a18d-11ea-81bc-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d3e97c-a18d-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGD1SjqY/6jwHOi5VOo/3XKg6aWSbbIKOPJKUtL0VVs=;
 b=u/FriGkMOLgf6UGd2lIFjzBaKaOSwLguTP1t3rMpDZ8UsH9+u/4waMmh1rZaG1X2J5j2EwMkxI3hlAYI5HfomCYihwnHN6kVGCW+TkGxGdjx0m+qvVYEyuDgWOyIuBQr3jdtCDybG49NoUz8BgxTBZhiT1EfNnraeIGMrN/xxq4=
Received: from AM4PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:205:1::47)
 by AM6PR08MB5159.eurprd08.prod.outlook.com (2603:10a6:20b:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Fri, 29 May
 2020 09:18:51 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:1:cafe::68) by AM4PR07CA0034.outlook.office365.com
 (2603:10a6:205:1::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.8 via Frontend
 Transport; Fri, 29 May 2020 09:18:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 09:18:50 +0000
Received: ("Tessian outbound 952576a3272a:v57");
 Fri, 29 May 2020 09:18:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 505691475dd5c9ea
X-CR-MTA-TID: 64aa7808
Received: from c7f750dd4e4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65A5B446-ACA6-421B-8FDE-25D56F574876.1; 
 Fri, 29 May 2020 09:18:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7f750dd4e4a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 09:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAkIfupaHfSZ91GnZFva5MF57dSkNfcj+OH22S08Mo85DYWQdg5LPHFrjA4uO6T0xVKtXUtJl+F4tzezjF5sMoY+o/FE39ckP1TLXA5OhEVcW3No2Uvdqj5WhrUEk3HAUmvVJpUkV40XgpbGl5WVbkb4dKd3OTw0KbfYMnRgYFbR2Zp78RsNhUCyKdCnnxO+MWSAi9mSCyTPbBQZTLP0J6ApdVxyIQJXbmJ4eX69crIM7Znbz0yZKzsg4h3vxWLg0R6i+F7abEuUgkE3YxQ60YPhrpUyZKi3iyUhvyTof6dpK2R/YEyfXshQwE8ZmR4szJMcKjiZ47zXeyR9W9kmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGD1SjqY/6jwHOi5VOo/3XKg6aWSbbIKOPJKUtL0VVs=;
 b=Y9uif/bwriynOYJ9CLbGb1RPIFHVtN5tCQ+SDHTUVFf0WWxknXHnDJG7o9rh2DJ+B1xPN6XP4Nf99UxYsct84KA6niXnVNAE+GoQgOdM9tpHX6YUt1OGqFjVIZi9ZoYqYg9A0vfJIVMWt4O/TPl2IBUZJLM55Dd6Tq8qQ+cM8D6Ka+lhRCKUTNGaNMELSg3+GX+9sr5ns9a4LZe/eGH0syQeOTs1uwZIFlCNxsxcUQTX0GU2RsmXghCJlrS6QYzakiDWfUeCnJLd2kGgivHkWiK+IMhlc3x7e0YVP7WSiNvd38UaFM8YIpUaYAM5kBR1LIC3JtqLVuPLPU93gW24jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGD1SjqY/6jwHOi5VOo/3XKg6aWSbbIKOPJKUtL0VVs=;
 b=u/FriGkMOLgf6UGd2lIFjzBaKaOSwLguTP1t3rMpDZ8UsH9+u/4waMmh1rZaG1X2J5j2EwMkxI3hlAYI5HfomCYihwnHN6kVGCW+TkGxGdjx0m+qvVYEyuDgWOyIuBQr3jdtCDybG49NoUz8BgxTBZhiT1EfNnraeIGMrN/xxq4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3915.eurprd08.prod.outlook.com (2603:10a6:10:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 09:18:42 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 09:18:42 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADfWQCAAAi2gIAACV6A
Date: Fri, 29 May 2020 09:18:42 +0000
Message-ID: <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
In-Reply-To: <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6059383-2905-451c-decc-08d803b14d1c
x-ms-traffictypediagnostic: DB7PR08MB3915:|AM6PR08MB5159:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5159FD6309FE29AFD9782F5B9D8F0@AM6PR08MB5159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uXVEWg7/sFJgzOwP0d9XBaRVNE5IRiFUXCM80k5zo2F1chhPttLXv4zz7k5A/g2lc2nyBFgSvnUbw6vcUhgGGBvnC5moQ21Rm9FtHMGwbsNHV13LLRICp0ucvsrzH64nG15b3jNJn1wHhkCf7K8bekpHmcV1Lhf4KjHZKSFF4p0lcL66AcDGWW1vLU0Gi8tenge7cesorjT3p3aVLZwLULvaWpwjXWVlyZ2mk9gjQ5srdcU69KW7++dsKtJ9r33w2ySPSelCIv/nZYz0NIjMNis/6LhEJ7oMrDEuO/YYPIxx015PdcQS8oFJ+DAVBvAB
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(6506007)(53546011)(2616005)(316002)(54906003)(7416002)(6916009)(33656002)(8936002)(4326008)(8676002)(36756003)(6512007)(6486002)(66946007)(76116006)(91956017)(66476007)(186003)(66446008)(83380400001)(86362001)(66556008)(64756008)(2906002)(71200400001)(478600001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SCGY5A6LEutY4O0Jp8BxAfqtNgf/wc6k9knZ3z6XMzDLs4Ih574BDz5IhNob/7sDMi5sMERoEYBP60oXqLWLS7zVAJU1r0WGMVy/MMVeTm2U3RyyLi6iLh3rB9V/Ns8M/FncTzPIEnr0C5XaPkdwSwmsKc5lstVFODSwRZZ3CDrdzYwCemeCpEqT0yqtA3YtBdlw7lsgnsCOQk0hIbzK9CbE3vfMnup3sS6mc86J/2IvDAxj9IVsmG43dSM5B61VZUF88Qyur7zaZM2x0H5C3DEirLvP88P3jJgT4RKqD1+swNL1/N2GdoELfAbUw+uDxcJSI02DgBRA5q7uNOk72v8b5tPMNo1wSWgR/GjCtC1eBGKQ6qbWWUxhnnv5wIyXuryEHNs4dGVdggCfqkT9qrTVw3KOupuNv0WJ5+KWZyNA39fvosyfORKToi49nAUYDYSCW99zl3c5/tQDxOb70jgjtUgBSnjKMuYUK5ikQQLexPLvI9qrwZc6SjeNcJT1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <49B9AB3CD18B8E449DA9095043D4CB6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3915
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(336012)(478600001)(2616005)(70206006)(186003)(6862004)(70586007)(2906002)(26005)(5660300002)(6512007)(316002)(53546011)(36906005)(6506007)(54906003)(83380400001)(33656002)(8936002)(82310400002)(356005)(4326008)(86362001)(47076004)(81166007)(6486002)(8676002)(36756003)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 056d050f-79c3-4a73-1963-08d803b147f7
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iq5FKOpityPdMBpl65NRmPiQa0BwqpDkUFbvoaB3iMLTJOc2pJoZJd5CumEz38Bsc+fmCvwPRBJ5OUMHp/Zfjmt2IKEDY/NAyJXIhD/5OBo+7gJW/dPXs3TxF6h2Qmf88VBjAYZvKR2VbkT+SijHWf2kgGGQcTaO/VbiLLCeyLPwo+N+M8I5zd/SWm+JDzAYAF+eNkrc8ISDAI4xbJZ+r5FpP5OsimoCdRYESAaXI3JVObQ1qYkl4COc6bEsFGpRgooX94QHluSIT62ZiQ5nwVUI1Cz+CXG63MtkRvOyP/k1C/i02R4ifXCpaeJVvIGVFafssGkRNmzI/vYEJV6rTT8pXGFH43Qt8V5yibuq0hhiILeOmhb09dCLD24obLO08ijxFRL473hdJy8fCf4g7g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 09:18:50.9678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6059383-2905-451c-decc-08d803b14d1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5159
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
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLA0KDQo+IE9uIDI5IE1heSAyMDIwLCBhdCAwOTo0NSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI5LjA1LjIwMjAgMTA6MTMsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMjggTWF5IDIwMjAsIGF0IDE5OjU0LCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiBBRkFJQ1QsIHRoZXJlIGlzIG5vIHJlc3Ry
aWN0aW9uIG9uIHdoZW4gdGhlIHJ1bnN0YXRlIGh5cGVyY2FsbCBjYW4gYmUgY2FsbGVkLiBTbyB0
aGlzIGNhbiBldmVuIGJlIGNhbGxlZCBiZWZvcmUgdGhlIHZDUFUgaXMgYnJvdWdodCB1cC4NCj4+
IA0KPj4gSSB1bmRlcnN0YW5kIHRoZSByZW1hcmsgYnV0IGl0IHN0aWxsIGZlZWxzIHZlcnkgd2Vp
cmQgdG8gYWxsb3cgYW4gaW52YWxpZCBhZGRyZXNzIGluIGFuIGh5cGVyY2FsbC4NCj4+IFdvdWxk
buKAmXQgd2UgaGF2ZSBhIGxvdCBvZiBwb3RlbnRpYWwgaXNzdWVzIGFjY2VwdGluZyBhbiBhZGRy
ZXNzIHRoYXQgd2UgY2Fubm90IGNoZWNrID8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgc286IFRoZSBo
eXBlcnZpc29yIHVzZXMgY29weV90b19ndWVzdCgpIHRvIHByb3RlY3QNCj4gaXRzZWxmIGZyb20g
dGhlIGFkZHJlc3NlcyB0byBiZSBpbnZhbGlkIGF0IHRoZSB0aW1lIG9mIGNvcHlpbmcuDQo+IElm
IHRoZSBndWVzdCBkb2Vzbid0IG1ha2Ugc3VyZSB0aGV5J3JlIHZhbGlkIGF0IHRoYXQgdGltZSwg
aXQNCj4gc2ltcGx5IHdvbid0IGdldCB0aGUgaW5mb3JtYXRpb24gKHBlcmhhcHMgdW50aWwgWGVu
J3MgbmV4dA0KPiBhdHRlbXB0IHRvIGNvcHkgaXQgb3V0KS4NCj4gDQo+IFlvdSBtYXkgd2FudCB0
byB0YWtlIGEgbG9vayBhdCB0aGUgeDg2IHNpZGUgb2YgdGhpcyAoYWxzbyB0aGUNCj4gdkNQVSB0
aW1lIHVwZGF0aW5nKTogRHVlIHRvIHRoZSB3YXkgeDg2LTY0IFBWIGd1ZXN0cyB3b3JrLCB0aGUN
Cj4gYWRkcmVzcyBtYXkgbGVnaXRpbWF0ZWx5IGJlIHVubWFwcGVkIGF0IHRoZSB0aW1lIFhlbiB3
YW50cyB0bw0KPiBjb3B5IGl0LCB3aGVuIHRoZSB2Q1BVIGlzIGN1cnJlbnRseSBleGVjdXRpbmcg
Z3Vlc3QgdXNlciBtb2RlDQo+IGNvZGUuIEluIHN1Y2ggYSBjYXNlIHRoZSBjb3B5IGdldHMgcmV0
cmllZCB0aGUgbmV4dCB0aW1lIHRoZQ0KPiBndWVzdCB0cmFuc2l0aW9ucyBmcm9tIHVzZXIgdG8g
a2VybmVsIG1vZGUgKHdoaWNoIGludm9sdmVzIGENCj4gcGFnZSB0YWJsZSBjaGFuZ2UpLg0KDQpJ
ZiBJIHVuZGVyc3RhbmQgZXZlcnl0aGluZyBjb3JyZWN0bHkgcnVuc3RhdGUgaXMgdXBkYXRlZCBv
bmx5IGlmIHRoZXJlIGlzDQphIGNvbnRleHQgc3dpdGNoIGluIHhlbiB3aGlsZSB0aGUgZ3Vlc3Qg
aXMgcnVubmluZyBpbiBrZXJuZWwgbW9kZSBhbmQNCmlmIHRoZSBhZGRyZXNzIGlzIG1hcHBlZCBh
dCB0aGF0IHRpbWUuDQoNClNvIHRoaXMgaXMgYSBiZXN0IGVmZm9ydCBpbiBYZW4gYW5kIHRoZSBn
dWVzdCBjYW5ub3QgcmVhbGx5IHJlbHkgb24gdGhlDQpydW5zdGF0ZSBpbmZvcm1hdGlvbiAoYXMg
aXQgbWlnaHQgbm90IGJlIHVwIHRvIGRhdGUpLg0KQ291bGQgdGhpcyBoYXZlIGltcGFjdHMgc29t
ZWhvdyBpZiB0aGlzIGlzIHVzZWQgZm9yIHNjaGVkdWxpbmcgPw0KDQpJbiB0aGUgZW5kIHRoZSBv
bmx5IGFjY2VwdGVkIHRyYWRlIG9mZiB3b3VsZCBiZSB0bzoNCi0gcmVkdWNlIGVycm9yIHZlcmJv
c2l0eSBhbmQganVzdCBpZ25vcmUgaXQNCi0gaW50cm9kdWNlIGEgbmV3IHN5c3RlbSBjYWxsIHVz
aW5nIGEgcGh5c2ljYWwgYWRkcmVzcw0KICAtPiBVc2luZyBhIHZpcnR1YWwgYWRkcmVzcyB3aXRo
IHJlc3RyaWN0aW9ucyBzb3VuZHMgdmVyeSBjb21wbGV4DQogIHRvIGRvY3VtZW50IChjdXJyZW50
IGNvcmUsIG5vIHJlbWFwcGluZykuDQoNCkJ1dCBpdCBmZWVscyBsaWtlIGhhdmluZyBvbmx5IG9u
ZSBoeXBlcmNhbGwgdXNpbmcgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzDQp3b3VsZCBub3QgcmVh
bGx5IGJlIGxvZ2ljIGFuZCB0aGlzIGtpbmQgb2YgY2hhbmdlIHNob3VsZCBiZSBtYWRlIGFjcm9z
cw0KYWxsIGh5cGVyY2FsbHMgaWYgaXQgaXMgZG9uZS4NCiANCkJlcnRyYW5kDQoNCg==

