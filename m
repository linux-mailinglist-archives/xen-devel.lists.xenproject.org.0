Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA812000F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 09:42:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igluj-00073i-Fx; Mon, 16 Dec 2019 08:39:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1iglui-00073d-6M
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 08:39:36 +0000
X-Inumbo-ID: 8869c3dc-1fdf-11ea-88e7-bc764e2007e4
Received: from m4a0073g.houston.softwaregrp.com (unknown [15.124.2.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8869c3dc-1fdf-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 08:39:27 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 08:37:07 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 08:27:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 08:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY6GgskKXuCaBbIZeJvKags6pqPl5eraqBNu+gF0ylC03IC44TQliUPL4beqHm3Kq4Rz7qEWDXmwB+BhznlxfR87p83vOq7yONYolp398D8PMSFBZH0UcyD1d0M/DkD0NxXZdXN6FnLvAXLpcQnOnLYE/SBybFaSipaxF8Z4JhmIEuNNS6CED2ytHxSpAjtpjWBCyu9LHGv/ecZbEDfqAQ4pn1K31QvJiRLRbFnIR6RekOt9O2GBA7ocGoMpM4EOt2OX+cT70AnfKfVOlZ4KeZe0EAc1eoXLGs1rV15LyDhYZB8BD4S8zQ0TkwkWFisM/4FgQMGsdG5DJ6PmBDo/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6L2Vs7QlE03Iuu6nNF7hqyEvjJcuW9ObG/tc/v1x3g=;
 b=QVhMqwlPpGFQzqQxQ5bxWb6bGN+t3xKsZ5waAJ5RhhSN+OD9EC31q34n42yKfdSMjRZx8cP5IxK9IAiqLKluIdr9ukOS1GKx9+jzJUTVChYi4mgd3s0aJYcm8y8sGRy/wkn/aacs3ssNnQUBVH4Y/RK09hSJ+tiMOhV91NQU3Rl8Wj9+njyvEwfyne6lIFUfpnykUL5d+h7YHin/spTmPqH7iX9guHW+Ew31Bm5T07EsIqH0soenLJQOLw4KBw4rORBfWO2AiZsVnWCMGFHW4xtu8hhC+28PdvRD9iNnVW/GE5a857Prh8WQcYbEIMWy0QPTiRcn0ZfglGuaLDElfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3156.namprd18.prod.outlook.com (10.255.138.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Mon, 16 Dec 2019 08:27:49 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 08:27:49 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVs+qzuwFrdBKM3kC0biftq9U4/g==
Date: Mon, 16 Dec 2019 08:27:49 +0000
Message-ID: <20191216082718.20922-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.24.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 042207b5-8a0e-4400-1470-08d78201d5d6
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB3156A0381C8B6A677AE6828CBE510@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(189003)(199004)(66946007)(64756008)(66446008)(2906002)(66556008)(6916009)(66476007)(36756003)(316002)(54906003)(8676002)(71200400001)(81166006)(52116002)(6506007)(2616005)(86362001)(5660300002)(1076003)(186003)(478600001)(81156014)(6486002)(4326008)(8936002)(6512007)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3156;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: thG1CIFdbEsuVxBX3x5VWAvUhDgdppnol6yL3roT1xXcmoetBD6e41hevtUdwF4+p1gPyAml/7NqGB1krI31nqHVfyAvBRK1sJzHYW0xwqYN+XnT0Gr7XCR97C4RMJv91vehAe4wP65psjXwDHNNmXOBSjotXUdKLaNUziHlExsQ+2Z9lNKRHmz3pr0CVd78itWYlDcW/4/6n1COnzv7/1V2mAB5qD7WrrmYko0KnFs4Vn8DX4srKevQOITdDNogUCA+OroVMVxMzCjla+eTDWb3716/pMOEnTJJiRJVNuRChWEQxgjbo52V+fl71PkVTzvnfntusJMMND/RXfgCF9tMr2jqarYofVo+afjesdk3qfcnk+t/9jZwtWMeJWHifNbDzlZC7Eswq1PvG3UY1+baoe6fCdG0dgA1mqJ80tr4n4prN2I651/C72Vb+fha
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 042207b5-8a0e-4400-1470-08d78201d5d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 08:27:49.4457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: US7bSNKo4TDljH/+tM3gXR2ZTOe/Wi8DDUd/mpg8ZhCjtArwn1faj9MgHumein3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2] Xen missing prompt log when exec-sp=off
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
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jin Nan Wang <jnwang@suse.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGEgaXNzdWUgd2hlbiB1c2VyIGRpc2FibGUgRVRQIGV4ZWMtc3AsIHhlbiBtaXNzZWQgYSBw
cm9tcHQKbG9nIGluIGRtZXNnLgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgV2FuZyA8am53YW5nQHN1
c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMTAgKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jCmluZGV4IDc5NzBiYTkzZTEuLjVlODZkZDA3ODIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC0yNDk1
LDE0ICsyNDk1LDE0IEBAIGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKiBfX2luaXQg
c3RhcnRfdm14KHZvaWQpCiAgICAgewogICAgICAgICBib29sIGNwdV9oYXNfYnVnX3BzY2hhbmdl
X21jID0gaGFzX2lmX3BzY2hhbmdlX21jKCk7CiAKKyAgICAgICAgLyogRGVmYXVsdCB0byBub24t
ZXhlY3V0YWJsZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdhcmUuICovCiAgICAgICAg
IGlmICggb3B0X2VwdF9leGVjX3NwID09IC0xICkKLSAgICAgICAgewotICAgICAgICAgICAgLyog
RGVmYXVsdCB0byBub24tZXhlY3V0YWJsZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdh
cmUuICovCiAgICAgICAgICAgICBvcHRfZXB0X2V4ZWNfc3AgPSAhY3B1X2hhc19idWdfcHNjaGFu
Z2VfbWM7CiAKLSAgICAgICAgICAgIGlmICggY3B1X2hhc19idWdfcHNjaGFuZ2VfbWMgKQotICAg
ICAgICAgICAgICAgIHByaW50aygiVk1YOiBEaXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJw
YWdlcyBkdWUgdG8gQ1ZFLTIwMTgtMTIyMDdcbiIpOwotICAgICAgICB9CisgICAgICAgIGlmIChv
cHRfZXB0X2V4ZWNfc3ApCisgICAgICAgICAgICBwcmludGsoIlZNWDogRW5hYmxlIGV4ZWN1dGFi
bGUgRVBUIHN1cGVycGFnZXMuXG4iKTsKKyAgICAgICAgZWxzZSAKKyAgICAgICAgICAgIHByaW50
aygiVk1YOiBEaXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJwYWdlcyBkdWUgdG8gQ1ZFLTIw
MTgtMTIyMDdcbiIpOwogCiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS5oYXBfc3VwcG9ydGVk
ID0gMTsKICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLmFsdHAybV9zdXBwb3J0ZWQgPSAxOwot
LSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
