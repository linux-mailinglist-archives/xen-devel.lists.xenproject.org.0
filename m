Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80112A002
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 11:11:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijh7I-00079p-N5; Tue, 24 Dec 2019 10:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3nNa=2O=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijh7H-00079k-Sd
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 10:08:39 +0000
X-Inumbo-ID: 55209710-2635-11ea-88e7-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.127]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55209710-2635-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 10:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnDvpTAZ+cKTCph7FgU/bKEBHXsezqCA62SfYyQoyyCCUwZK+Q0GsNxPKqL/+ubL2NRk13eGvM3U3bfcTRzwIDgXXmbI9I6JyrdZzxW33expvEZw60bCi7sLsC+46L+3IYmLhUs4hIFhs4sAcZ7XvZBKpfviK2cKS3f9Ze5Xdw//9BoM4GiG31fdPLy15d7SfO8svPKbsA6JF1miY9sOpoCZoQEX7yFpgO55lbUYNjSqygp0SR2JGVy75kohP/gkl/EOeh6bW9leHw98kpU3a8d0QRUjfgcaGo8p5H4qy+PdYczbbdY/pA+Ciq5H+4PQpbz7pF56ZhwwD97LBnBTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+R38GSF+s1oA/2Py9mHbVnf1aEt6aLRdhWXhILuK/Y=;
 b=DZofxpgHr9PnogR14CWUuOMzYJ4SG2oCi7oOy6i3D7I6TZV9k0clT8FLjfUR3qS+p7TfqHtepzBAuOoH8ycdirGR48ORmZEfwEUjNLk0DKbmT9LzEjEc2Dx4w//31tHNId533kyqt6OCFNGNX9HDEWggDpgWvAIDPWTx+73Sevds78FbCr4LfkJ/04vZ1vDVr6mckP8BxJ/1s5qCw7OOT5lQgx1TqDG8IeswhKYX5Kq4LUBpuRIg3F9iVlBkTKhsGS+Xr+KKz+ojQ/T+hdcmitM+4GPDDcAw/opX/8SMpwnICDx4txbToJSB/U9oOnJesmmzB+jM+cIOi9MrYeF1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+R38GSF+s1oA/2Py9mHbVnf1aEt6aLRdhWXhILuK/Y=;
 b=U+RI2Fcd8g66YgoP/OHDXQ3oJhdpCv0k/INASVuDjeLBw4nVEY4jYImgFjXzfKCKdzZQGTvBj6VMfaTWENO1eoI5XAVK2zQEKY6+x86SHpemMg7lD2QodT7L9FNV7bvYtddx1gWYHNboOrSVQWza3qNCLuUbER+Ggj3OXx5U2RA=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4099.eurprd02.prod.outlook.com (20.177.110.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Tue, 24 Dec 2019 10:08:28 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 10:08:28 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
Thread-Index: AQHVuZnpQDt7SsmM9ECzADswn1jViafI7WQAgAAjkgA=
Date: Tue, 24 Dec 2019 10:08:28 +0000
Message-ID: <ef48f9b8-0eb9-160d-9524-c312445257e4@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-3-aisaila@bitdefender.com>
 <d9a3c8a4-f089-adf8-2129-41e7422b514c@citrix.com>
In-Reply-To: <d9a3c8a4-f089-adf8-2129-41e7422b514c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5a497ac-4c54-42d8-1c85-08d78859389b
x-ms-traffictypediagnostic: AM0PR02MB4099:|AM0PR02MB4099:|AM0PR02MB4099:
x-microsoft-antispam-prvs: <AM0PR02MB40996E22A311AE20203FBEA3AB290@AM0PR02MB4099.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(316002)(66556008)(64756008)(66446008)(66946007)(71200400001)(5660300002)(66476007)(36756003)(478600001)(53546011)(4326008)(6506007)(186003)(26005)(81156014)(52116002)(54906003)(110136005)(81166006)(2616005)(31686004)(6486002)(86362001)(31696002)(6512007)(8676002)(558084003)(8936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4099;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FurqUn6bPuqwBcXnNQJIfDOc7M4E4f48yQTds7hkV9VQX8uFyyKD4vArID61U/YJPlwzWXX9cm6iis5ryt1qcCNLILhKqb7E3jy4cmrhl2OmC+POv8iCAE7sQzwzXQQEpNHKsKUQUiX5n+uU9HpNG83/ttRNdjcUfpSoXOkQXWFnxwLCnK5E20fMUTSJASj13MjN03m0EHYxr/MfvFUFkeiezdeB6+K48+m+AG+4BbqGfQ+899Nv/2kH8hctFwOAbd3YnEt/w2yM4IrSNCdHW5FmadhrmeNPbF+KJegOMS4Ak0h5JKH1AuVQFAZoEWNtY48QruUboQfBrSp2Xu5psnHznMHMsagIcxjIvryhjXq+ftV10vFFb4XXHqFzeVHdzG03GvjhfWo1+R1QzGSU3m6BXl0MLNS/+6GK/oyj+EQkHSIOjuW7TR2l/fAQZgns
Content-ID: <8A036AE7FB19F14A840EB1CDBC87BC01@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a497ac-4c54-42d8-1c85-08d78859389b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 10:08:28.1359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZLL8IbAg7w1ba4lirMEPgDqsb3khwJmPMoqJ+M9NpDfG0B9YpaNlHwaA3D9Cb9359pyqOcxz/2ASHYYDEve1U543niHZHUIx/5R2SfSMVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4099
Subject: Re: [Xen-devel] [PATCH V6 3/4] x86/mm: Pull out the p2m specifics
 from p2m_init_altp2m_ept
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI0LjEyLjIwMTkgMTA6MDEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDEyLzIz
LzE5IDI6MDQgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPiANCj4gV2h5Pw0K
PiANCg0KVGhpcyB3YXMgYSByZXF1ZXN0IGZyb20gSmFuLg0KDQpBbGV4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
