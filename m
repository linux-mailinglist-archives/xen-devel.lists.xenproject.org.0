Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5246C31A0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:39:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFVS-0004T1-1L; Tue, 01 Oct 2019 10:35:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFFVQ-0004Sj-0u
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:35:44 +0000
X-Inumbo-ID: 369dadfe-e437-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 369dadfe-e437-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ibZek01jD626bqhieD1LMq23ly+uZXI4Mn2w3qfGCg=;
 b=X/a1TYhoyOYpCDDHFX/4pnpamw4Csksh7cnilaqh5JkS8TZu2WD88WgX
 ihi+kHJ2tdKBk9YJWuDtS8TdekuF5IE2mZf1floZeiOBzcJAmYkDraZ27
 FWTIEQyd3nzreUqySgPbT9fJfMKCto/qIqee2xhzffzpMVOe8w3mh3IH6 g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ne2gUj9k3kuaymOfOwQ//8vZWtp+9Nr7pVpm9Etwx5Fmo9ReyREedAZBYB6J3kd5P+UUv42jOf
 A+t0jNGxBYbNRPepcoUM818s3ZnoCfMue5NYQNFxSrpuAsMyuO3E7fTlTXJpcuKRfn3NB04pfo
 s0oud5P6g50dyn1+moxn1PruVbHTIMJkmXWaKsaU/v1eOF7cq5OXXULrjnAmRDhCBbKPzdslxK
 xesttMbA2EEfBUrSDTKj21c6ljyI/KoSzqRidkHSK3qV8GxNFxr6FhEMTGbX6+eUp9I8zUMe+x
 kVs=
X-SBRS: 2.7
X-MesageID: 6587619
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6587619"
Date: Tue, 1 Oct 2019 12:35:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
Message-ID: <20191001103510.rtis3xfzw22ayre2@Air-de-Roger>
References: <20191001101259.53162-1-roger.pau@citrix.com>
 <C99AFD6E-47A3-4F39-9B0A-4F01163F2081@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C99AFD6E-47A3-4F39-9B0A-4F01163F2081@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxl: wait for the ack when issuing power
 control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTI6MTg6NDFQTSArMDIwMCwgQ2hyaXN0aWFuIExpbmRp
ZyB3cm90ZToKPiAKPiAKPiA+IE9uIDEgT2N0IDIwMTksIGF0IDExOjEyLCBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+IAo+ID4gKwlsaWJ4bF9hc3luY29w
X2hvdyAqYW9faG93ID0gYW9ob3dfdmFsKGFzeW5jKTsKPiA+IAo+ID4gCWNhbWxfZW50ZXJfYmxv
Y2tpbmdfc2VjdGlvbigpOwo+ID4gLQlyZXQgPSBsaWJ4bF9kb21haW5fc2h1dGRvd24oQ1RYLCBj
X2RvbWlkKTsKPiA+ICsJcmV0ID0gbGlieGxfZG9tYWluX3NodXRkb3duKENUWCwgY19kb21pZCwg
YW9faG93KTsKPiA+IAljYW1sX2xlYXZlX2Jsb2NraW5nX3NlY3Rpb24oKTsKPiA+IAo+ID4gKwlm
cmVlKGFvX2hvdyk7Cj4gPiArCj4gCj4gRG9lcyB0aGlzIHdvcmsgd2hlbiBhb2hvd192YWwgcmV0
dXJucyBOVUxMIG9yIGRvZXMgdGhpcyBuZWVkcyB0byBiZSBjaGVja2VkPyBPdGhlcndpc2UgVGhp
cyBsb29rcyBnb29kIHRvIG1lLgoKQm90aCBsaWJ4bF9kb21haW5fc2h1dGRvd24gYW5kIGZyZWUg
YXJlIHBlcmZlY3RseSBmaW5lIHRvIGNhbGwgd2l0aAphb19ob3cgPT0gTlVMTCwgYnV0IFRCSCBJ
IGhhdmUgbm8gaWRlYSBvZiBvY2FtbCwgc28gSSBqdXN0IGNvcGllZAp3aGF0J3MgZG9uZSBpbiBz
dHViX2xpYnhsX2RvbWFpbl9kZXN0cm95LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
