Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BEB53CA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:16:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH2A-0005KA-A1; Tue, 17 Sep 2019 17:12:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH28-0005Jp-3t
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:12:56 +0000
X-Inumbo-ID: 636c42b0-d96e-11e9-961c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 636c42b0-d96e-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740375;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=6ieX/JpdCMiuRnBsnu0BET6Boagc2bkJikzZ4lTwq/g=;
 b=K3hEVgcnbRqXO/NHfbnB1K3UkoL7DchX1tu1P6nfLdmuwFVZy8ng4092
 390L8ZI/tYdmbK5OERO4bODiVrUw1Z+H2rLzmNmTTmFcY+XjhWz3my06F
 Pg/EYXkAOD97RveW41qtNZst5a4LIYZXn32rD2vn5VRFr4AZzZWniGwgk w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xWioj486t0us3KRPr4yC4FkJd+sjkwzandUH1I9WmxFepFSevqCs551yoYK5d9pSkqA7+ZPvXt
 eKqSDL0/XIzVm1pxPdokIet/ILXMnoBI1xLruPnOsabtKid0kR5w/XSU2XL9aJnmd8I0j04LUr
 gle9+FaOxrPPxxHRrRcnUTjIBhFH52DZ9yZ9ocHabwBub9nr+EzoL+QeXQDeUk0IuPdmNJDzvg
 Uhd/43qCcvELDolbIzL8x0l8ApqOGXe7t8yYrAUyGtDstbZCc3+qFF7ki+gvdh8uHYvPq4u9H0
 z1s=
X-SBRS: 2.7
X-MesageID: 5992556
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5992556"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5140.237379.137650@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:12:52 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-23-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-23-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 22/35] libxl: Use aodev for
 libxl__device_usbdev_remove
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDIyLzM1XSBsaWJ4bDogVXNlIGFvZGV2IGZv
ciBsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUiKToKPiBUaGlzIGFsc28gbWVhbiBsaWJ4bF9f
aW5pdGlhdGVfZGV2aWNlX3VzYmN0cmxfcmVtb3ZlLCB3aGljaCB1c2VzCj4gbGlieGxfX2Rldmlj
ZV91c2JkZXZfcmVtb3ZlIHN5bmNocm9ub3VzbHksIG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8gdXNl
Cj4gaXQgd2l0aCBtdWx0aWRldi4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
