Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B234A874
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 19:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdHv4-0002Jf-Mu; Tue, 18 Jun 2019 17:29:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hUbn=UR=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hdHv3-0002Ja-44
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 17:29:17 +0000
X-Inumbo-ID: 98566a2b-91ee-11e9-8980-bc764e045a96
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe46::608])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98566a2b-91ee-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b/9Wevgldkl5GLf8FaLcwcK/kJ7xq0kttiebpz3R0Y=;
 b=nDB3X3tyM2rfHZjMjR53JePIYfZOhP7+QL0QH/b6yNZI+mzsmcFUkII8jAzWMO5kd75JLUReFUYoTqRf+NLdUTDlHte0tZRO3431yLmSxof97/4BTxP2hD1YalNTXNxdPUh8RwblEXg2AmGm/kdUXRHls4eCmXwIbUhqAExzI6w=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3017.namprd12.prod.outlook.com (20.178.30.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 18 Jun 2019 17:29:14 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 17:29:14 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] AMD/IOMMU: initialize IRQ tasklet only once
Thread-Index: AQHVF8jPhr+FpN4s4E2eROjC+FJKYKahxx4A
Date: Tue, 18 Jun 2019 17:29:14 +0000
Message-ID: <20190618172911.GB16087@amd.com>
References: <5CF14DA40200007800234108@prv1-mh.provo.novell.com>
In-Reply-To: <5CF14DA40200007800234108@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:5:f8::39) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ffdae1e-ff3c-4330-8496-08d6f4127bd8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3017; 
x-ms-traffictypediagnostic: DM6PR12MB3017:
x-microsoft-antispam-prvs: <DM6PR12MB30172A6EE369123F309C07D4E5EA0@DM6PR12MB3017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(396003)(366004)(376002)(199004)(189003)(68736007)(11346002)(99286004)(81156014)(52116002)(54906003)(316002)(76176011)(4326008)(86362001)(26005)(8676002)(4744005)(486006)(6506007)(6246003)(102836004)(386003)(8936002)(81166006)(6116002)(14454004)(36756003)(72206003)(478600001)(66066001)(1076003)(6916009)(5660300002)(3846002)(229853002)(476003)(6436002)(256004)(305945005)(71190400001)(71200400001)(2906002)(7736002)(446003)(33656002)(66446008)(66556008)(66946007)(64756008)(53936002)(6486002)(66476007)(25786009)(6512007)(2616005)(73956011)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3017;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eXo4ANZ7baqo8V0NeaepevKgV3jShaJsux+asO199bc19lqdL7KHwG54hQnPeQLoON8M+ADrC4fcT+cnvL3KPpoNkmVTmqySwauaiMtj5JK35rcJWjiLNPb6Jvu+x90jfTr4HCUd+tptfYh12fzr5lYnH6GFK0OAJ57WaF0SyBs3qjODf0hGWm7+M1X7PHJVcMhZ518fyynO+84R9Nh9ZM/ZCG/RCBtdWchv/U/z8F7odzz7gGRrgpH4nqI5Rj27ftkfKqUrYAT0ftc64PcCLGlNaRiTODtGGf3h3cqqtOHZTHj6DtHQFkkUn8WZ5L5kD6R67wVuJIGD3sxVfJPc7y3ULwOP1Y7hcctRE3rjUH53apQJsCMtuyiMJIod5z6WJp1bIBkcRPa6i2rqD6Cnp4siPCQu6AoOa2V9DHCLfrU=
Content-ID: <8AE08E6D0A2128468E797E79DAE3B549@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffdae1e-ff3c-4330-8496-08d6f4127bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 17:29:14.5998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3017
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: initialize IRQ tasklet only once
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDk6NTI6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+IAo+IERvbid0IGRvIHRoaXMgb25jZSBw
ZXIgSU9NTVUsIG5vciBhZnRlciBzZXR0aW5nIHVwIHRoZSBJT01NVSBpbnRlcnJ1cHQKPiAod2hp
Y2ggd2lsbCB3YW50IHRvIHNjaGVkdWxlIHRoaXMgdGFza2xldCkuIEluIGZhY3QgaXQgY2FuIGJl
Cj4gaW5pdGlhbGl6ZWQgYXQgYnVpbGQgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndv
b2RzQGFtZC5jb20+Cgo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4g
QEAgLTMxLDcgKzMxLDggQEAKPiAKPiAgc3RhdGljIGludCBfX2luaXRkYXRhIG5yX2FtZF9pb21t
dXM7Cj4gCj4gLXN0YXRpYyBzdHJ1Y3QgdGFza2xldCBhbWRfaW9tbXVfaXJxX3Rhc2tsZXQ7Cj4g
K3N0YXRpYyB2b2lkIGRvX2FtZF9pb21tdV9pcnEodW5zaWduZWQgbG9uZyBkYXRhKTsKPiArc3Rh
dGljIERFQ0xBUkVfU09GVElSUV9UQVNLTEVUKGFtZF9pb21tdV9pcnFfdGFza2xldCwgZG9fYW1k
X2lvbW11X2lycSwgMCk7Cj4gCj4gIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IGl2cnNfYmRm
X2VudHJpZXM7Cj4gIHU4IF9fcmVhZF9tb3N0bHkgaXZoZF90eXBlOwo+IEBAIC0xMDU2LDggKzEw
NTcsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUoc3RyCj4gICAgICBw
cmludGsoIkFNRC1WaTogSU9NTVUgJWQgRW5hYmxlZC5cbiIsIG5yX2FtZF9pb21tdXMgKTsKPiAg
ICAgIG5yX2FtZF9pb21tdXMrKzsKPiAKPiAtICAgIHNvZnRpcnFfdGFza2xldF9pbml0KCZhbWRf
aW9tbXVfaXJxX3Rhc2tsZXQsIGRvX2FtZF9pb21tdV9pcnEsIDApOwo+IC0KPiAgICAgIHJldHVy
biAwOwo+IAo+ICBlcnJvcl9vdXQ6Cj4gCj4gCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
