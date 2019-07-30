Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82D7A32B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:37:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNb6-00022a-A6; Tue, 30 Jul 2019 08:35:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsNb4-00022V-IC
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:35:02 +0000
X-Inumbo-ID: eb8e4cb8-b2a4-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb8e4cb8-b2a4-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:35:01 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JYJ65E86F17nLfLI3FMQkSI6SJE40gw/lU00m++TpbiCnAKvexQQ6tVWyh/Di3Ue0gHbwM9vzP
 hduZ9Prh/rK4VCQyMQuW9kk2ERiynUFnA2d8hZnVXIvMq3DpPoqxl53wMB9OYvBbo1VwZz749l
 E37i5DZUt+uIREixyraTuKCoL3ZYBEPfCUhsjEMKURPGQAvNkoLL/4o+USUQksqOIKVupR+lxY
 c7Gt3XdvHfgby1iOMEoqnIqhi73OGO7IBUNRLeyvG8CvXRcnPLcAln+hqd2UZqXoey/WFvphYo
 zRQ=
X-SBRS: 2.7
X-MesageID: 3612175
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3612175"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH] xen: cleanup IOREQ server on exit
Thread-Index: AQHVRkPwYtwm6xiHKUyO/Ltn7zqYNKbi1qZg
Date: Tue, 30 Jul 2019 08:34:57 +0000
Message-ID: <709c0bad95d8471e8c821fceb83a9948@AMSPEX02CL03.citrite.net>
References: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: cleanup IOREQ server on exit
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
Cc: Anthony Perard <anthony.perard@citrix.com>, Igor
 Druzhinin <igor.druzhinin@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "mst@redhat.com" <mst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI5IEp1bHkgMjAxOSAyMDoyOQo+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+IENj
OiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IG1z
dEByZWRoYXQuY29tOyBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4K
PiBTdWJqZWN0OiBbUEFUQ0hdIHhlbjogY2xlYW51cCBJT1JFUSBzZXJ2ZXIgb24gZXhpdAo+IAo+
IERldmljZSBtb2RlbCBpcyBzdXBwb3NlZCB0byBkZXN0cm95IElPUkVRIHNlcnZlciBmb3IgaXRz
ZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+Cgo+IC0tLQo+ICBody9pMzg2L3hlbi94ZW4taHZtLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni94ZW4veGVuLWh2
bS5jIGIvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCj4gaW5kZXggZThlNzllMC4uMzBhNTk0OCAxMDA2
NDQKPiAtLS0gYS9ody9pMzg2L3hlbi94ZW4taHZtLmMKPiArKysgYi9ody9pMzg2L3hlbi94ZW4t
aHZtLmMKPiBAQCAtMTI0Miw2ICsxMjQyLDggQEAgc3RhdGljIHZvaWQgeGVuX2V4aXRfbm90aWZp
ZXIoTm90aWZpZXIgKm4sIHZvaWQgKmRhdGEpCj4gIHsKPiAgICAgIFhlbklPU3RhdGUgKnN0YXRl
ID0gY29udGFpbmVyX29mKG4sIFhlbklPU3RhdGUsIGV4aXQpOwo+IAo+ICsgICAgeGVuX2Rlc3Ry
b3lfaW9yZXFfc2VydmVyKHhlbl9kb21pZCwgc3RhdGUtPmlvc2VydmlkKTsKPiArCj4gICAgICB4
ZW5ldnRjaG5fY2xvc2Uoc3RhdGUtPnhjZV9oYW5kbGUpOwo+ICAgICAgeHNfZGFlbW9uX2Nsb3Nl
KHN0YXRlLT54ZW5zdG9yZSk7Cj4gIH0KPiAtLQo+IDIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
