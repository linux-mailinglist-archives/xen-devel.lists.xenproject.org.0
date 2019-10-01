Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FFC390D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFK4J-00080o-Cx; Tue, 01 Oct 2019 15:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFK4H-00080G-Jy
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:28:01 +0000
X-Inumbo-ID: 0c9e9622-e460-11e9-9703-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 0c9e9622-e460-11e9-9703-12813bfff9fa;
 Tue, 01 Oct 2019 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569943681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XyQItPE2hoGwPb/tCGclGuAoDavjwqvl+p3+VJAGDIc=;
 b=SG/enfj1F5SzfCZZAXLyLIKrHt+9U6+IOebnwXfQB8SIyZDOGUEweZ9b
 XGbWEz2WaN75HEq9mssY5eMtI2FoazT8dCfN5xIi1hFT5XiRaW7EsW2eV
 h/nNqZhenAlGpqA9fGYwmvHN1+Czx82CzYchttStL2IUUi3k0Rk1ZyAWx k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NTE8bparcp06bShWb2D/qQpvq+yTO7RUUwD5nLB54DnTd/R4kFH16cBKhTwyHjXNF+sHSZR02j
 RUwjvXwEXzXCubnTAxMW6X92B56Y+o3SbEEdIoAPNAeZx7ZsN8nrTyluTpZZyvdmS7QuHn17DY
 sZaTWtYbqpsHT6fXeeyvC9fD+QK5+zwiuycdcKmcJ2ODbRIKAG06cCQjjBvZu/SFwXQfFg1EpK
 bJSotZOMWgkLCIocd9QJ34VZIfT+AhWDzjG7avQeHdO8Yxj/TrMN7pUm9C11QSccVouSKeXoBY
 MDU=
X-SBRS: 2.7
X-MesageID: 6321003
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6321003"
Date: Tue, 1 Oct 2019 17:27:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20191001152734.ttikfrtxk3jemlb5@Air-de-Roger>
References: <20191001152233.55491-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001152233.55491-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDU6MjI6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+ICtpbnQgbGlieGxfZG9tYWluX3JlYm9vdChsaWJ4bF9jdHggKmN0eCwgdWludDMy
X3QgZG9taWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jb3Bf
aG93ICphb19ob3cpCj4gIHsKPiAtICAgIEdDX0lOSVQoY3R4KTsKPiArICAgIEFPX0NSRUFURShj
dHgsIGRvbWlkLCBhb19ob3cpOwo+ICsgICAgbGlieGxfX3hzd2FpdF9zdGF0ZSAqcHZjb250cm9s
Owo+ICAgICAgaW50IHJldDsKCkZvcmdvdCB0byBgc3RnIHJlZnJlc2hgIGJlZm9yZSBzZW5kaW5n
IGFuZCB0aGlzIGRpZG4ndCBnZXQgY2hhbmdlZCB0bwpyYy4gSSBjYW4gc2VuZCBhIG5ldyB2ZXJz
aW9uIG9yIHRoaXMgY2FuIGJlIGZpeGVkIG9uIGNvbW1pdCBJIGd1ZXNzIGlmCmV2ZXJ5dGhpbmcg
ZWxzZSBpcyBmaW5lLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
