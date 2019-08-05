Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221881491
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huYlv-0007Uq-Or; Mon, 05 Aug 2019 08:55:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sKIu=WB=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1huYlu-0007Ul-Fn
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 08:55:14 +0000
X-Inumbo-ID: bac3f9c4-b75e-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bac3f9c4-b75e-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 08:55:12 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 08:55:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 08:54:09 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 08:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/ZOxSWVXAnBEBWnJHsR88ceuiDQmkdK3T0yPwM0ncmB3ZIFmduepgGpPQc2Wzk/0cMs8vOXmRRFl4kea0Lu6TKYdD6JYCCFFO4raqt2eey5PYvpS5/FOW+4VGLYWdQR8GgEJppo/uAwxjfsiYbbBFZF7am5kWIn8WuZGU+tNPizEJb9k/rAUImXENGOpgES3Iusl1BU3Uv2ktg7bmgCUno3qFMCOzSa5Svy/iWl1D4BEaLblAlf3pJJNICC0As9YsXyw/Qs2yfVAu2irpkeiZyXigrC1eeKu6/VS+stPRB+w5TZDCRVY/SVVW0mFxTcWy9X2O89rI27SRK10bOhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXH1JAOG9zPlgtSUuGPSr7gLA6ZmorhCOZBaQAqrNFI=;
 b=fN3evQZ4Q3lZhZRwIztYgskvLXYzG37kg8iujJDy0+Nuj7iA+fMW4jNe7PV3ixjS6scllbngZAJu4O0QfZB06ODxRamQ6WAz7IIt1sMtCX2Tttce/PIeccVSwzujl61yQGyvJtvXLatkBQjBNQdGrvharvueKODa+rWDAUfrGj7Yll1KA/z+wyYHhaEkHuHkerMoGLND1Wo1cuL0gsR8bLYAxOhPPbCaUd7SQ2D+jy4nQ3li15G1lkJqkxSGx2l1BLRcqbMCAHTl+VzLewtIpkSymGLoSTfo+FiWF69mYxEPH76At/SRW1YF/LE6r6nf2TGNrGcpzNjQ95S3368QnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Mon, 5 Aug 2019 08:54:08 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 08:54:08 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/spec-ctrl: Remove EAGER_FPU when PV/HVM is
 disabled.
Thread-Index: AQHVS2tXqqYTwX0oZ0GkAajAz6g26Q==
Date: Mon, 5 Aug 2019 08:54:08 +0000
Message-ID: <20190805085350.23309-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR06CA0093.apcprd06.prod.outlook.com
 (2603:1096:3:14::19) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b1a7ed5-ab47-491f-6d4a-08d7198279d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3394; 
x-ms-traffictypediagnostic: BY5PR18MB3394:
x-microsoft-antispam-prvs: <BY5PR18MB3394AB10C2D2326835B3FD6BBEDA0@BY5PR18MB3394.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:95;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(199004)(189003)(68736007)(53936002)(6436002)(99286004)(186003)(107886003)(4326008)(25786009)(486006)(2616005)(476003)(54906003)(316002)(5640700003)(71200400001)(102836004)(5660300002)(52116002)(66066001)(71190400001)(256004)(1076003)(6916009)(6512007)(86362001)(26005)(6486002)(478600001)(14454004)(66446008)(2906002)(50226002)(64756008)(6116002)(3846002)(66946007)(66476007)(66556008)(2351001)(2501003)(36756003)(8936002)(7736002)(6506007)(386003)(8676002)(81156014)(81166006)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3394;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x+wQbwJtlVsE4rGYxVk7ZQpsdW9KNoCDrBUpS58i/o+BcPz9xMTEIPbgm29GhfoJ6iE3sYsvru1gdejEuFx5FRMLNdeJjQHhLFuAWN1lhZEemMyPjaHNMaDr+LAEp1P9nLN6WfFlgOsKNYUf4UUYppK0SpP9WgBnhZiWmFLPtF1s5DdhejLDdzVTcvCttpiY9b+STleWuCGak7gVZx2Rvm7xHynoODNvFutSFHYly2AdNUdREfbdRo06JYCs14CM3o8sqebPKhlEEhO4D8fgyBfQlPBDVG0xEXu1Kw5KB7IbhMwIVKRCl9MLie/xRJdBjR7S/Vi/aqX69hTGcL+CIjFN1bpkCwFbtlgev+PGGizm5hRYG4FTEsfS63IWS5TyXXMvpAPhd6WGmWWPGiNkbU/wAhkvwLWgclplxqw7EvI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1a7ed5-ab47-491f-6d4a-08d7198279d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:54:08.1317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3394
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v1] x86/spec-ctrl: Remove EAGER_FPU when PV/HVM
 is disabled.
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Jin Nan Wang <jnwang@suse.com>, Jan Beulich <JBeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY29tbWl0IGFjM2Y5YTcyMTQxYTQ4ZDQwZmFiZmZmNTYxZDVhN2RjMGUxYjgxMGQ6CiAgICBG
b3Igb25lLCAibm8teGVuIiBzaG91bGQgbm90IGltcGx5ICJuby1lYWdlci1mcHUiLCBhcyAiZWFn
ZXIgRlBVIiBtb2RlCiAgICBpcyB0byBndWFyZCBndWVzdHMsIG5vdCBYZW4gaXRzZWxmLCB3aGlj
aCBpcyBhbHNvIGV4cHJlc3NlZCBzbyBieQogICAgcHJpbnRfZGV0YWlscygpLgoKU28gd2hlbiBz
cGVjLWN0cmw9cHY9b2ZmLGh2bT1vZmY7ICBFQUdFUl9GUFUgc2hvdWxkbid0IGJlIGRpc3BsYXkg
aW4gbGluZXM6CkN1cnJlbnRbV3JvbmddOgooWEVOKSAgIFN1cHBvcnQgZm9yIEhWTSBWTXM6IEVB
R0VSX0ZQVSBNRF9DTEVBUgooWEVOKSAgIFN1cHBvcnQgZm9yIFBWIFZNczogRUFHRVJfRlBVIE1E
X0NMRUFSCgpleHBlY3RhdGlvbjoKKFhFTikgICBTdXBwb3J0IGZvciBIVk0gVk1zOiBNRF9DTEVB
UgooWEVOKSAgIFN1cHBvcnQgZm9yIFBWIFZNczogTURfQ0xFQVIKLS0tCiB4ZW4vYXJjaC94ODYv
c3BlY19jdHJsLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3Ry
bC5jCmluZGV4IDQ2OGE4NDc1OTguLjVmNTE5NDA2ZmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTEyOCwxMiAr
MTI4LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NwZWNfY3RybChjb25zdCBjaGFyICpz
KQogICAgICAgICAgICAgb3B0X21zcl9zY19wdiA9IHZhbDsKICAgICAgICAgICAgIG9wdF9yc2Jf
cHYgPSB2YWw7CiAgICAgICAgICAgICBvcHRfbWRfY2xlYXJfcHYgPSB2YWw7CisgICAgICAgICAg
ICBvcHRfZWFnZXJfZnB1ID0gdmFsOwogICAgICAgICB9CiAgICAgICAgIGVsc2UgaWYgKCAodmFs
ID0gcGFyc2VfYm9vbGVhbigiaHZtIiwgcywgc3MpKSA+PSAwICkKICAgICAgICAgewogICAgICAg
ICAgICAgb3B0X21zcl9zY19odm0gPSB2YWw7CiAgICAgICAgICAgICBvcHRfcnNiX2h2bSA9IHZh
bDsKICAgICAgICAgICAgIG9wdF9tZF9jbGVhcl9odm0gPSB2YWw7CisgICAgICAgICAgICBvcHRf
ZWFnZXJfZnB1ID0gdmFsOwogICAgICAgICB9CiAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFy
c2VfYm9vbGVhbigibXNyLXNjIiwgcywgc3MpKSA+PSAwICkKICAgICAgICAgewotLSAKMi4yMi4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
