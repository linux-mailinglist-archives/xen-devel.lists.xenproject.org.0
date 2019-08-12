Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEA8B027
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:52:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQbL-0000KP-Ta; Tue, 13 Aug 2019 06:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mJ6=WJ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxQbJ-0000K9-Js
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:48:09 +0000
X-Inumbo-ID: 4613f4ee-bce8-11e9-8285-1fe07684fe8c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4613f4ee-bce8-11e9-8285-1fe07684fe8c;
 Mon, 12 Aug 2019 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565604141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=trdbwpS/4FHfuHrqKmoK5uWNaamMw7k8C5sNKA6SahY=;
 b=Y7ZjuJ+BPLwj0D8afF0KBL6sgTMdVg6kFxLRPaiM8v3LDDkGKLTD0dSY
 fqMj9e2Dmrp8AWvdJfVEfSUSIlaQA9w8HizipU5ecNC707f/YZO02gKx3
 hn5Qj8FEM68iXKsjI/draNK74AhvPKgN8wKKKBkIIgxSDPEHCaDoYRJmw M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=PermError smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: PermError (esa4.hc3370-68.iphmx.com: cannot
 correctly interpret sender authenticity information from
 domain of Paul.Durrant@citrix.com) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: E4A/XZyE4UWC5CSfx7L4YmruGeL75EzT9ALaj8JMuuUrnkwuz6nYYSs190VkZLVB3wOryZrTlI
 s0Vr35lVwzC8abm6sUC5js4QBDuhTLGxZhkSmhlQgWnG7y/59yBrY8GPAwHxVqR0lwxW+PYt49
 vXHmEgc3g60t1tFd7sae1S14ZHlgV0wQJgAaFT1RcptG6JfqL0LrXMWSpFBvY5kLdQNpwBY3Vo
 JcRsxuoFOyhE0CwMav6m9kF75sVtEUVfxy0j5Mu/3I55ErR/ROxhziiIwzMGt5R0NR4wqUmmNX
 6To=
X-SBRS: 2.7
X-MesageID: 4344587
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4344587"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "'jgross@suse.com'" <jgross@suse.com>
Thread-Topic: [ANNOUNCE] Xen 4.13 Development Update
Thread-Index: AQHVSIJOz1gs9jaa4UaBKsLRatS09qb3WK8Q
Date: Mon, 12 Aug 2019 10:02:16 +0000
Message-ID: <e0adcca433344777b5216a0a392769bb@AMSPEX02CL03.citrite.net>
References: <20190801160048.11031-1-jgross@suse.com>
In-Reply-To: <20190801160048.11031-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: "luwei.kang@intel.com" <luwei.kang@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>, "puwen@hygon.cn" <puwen@hygon.cn>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "chao.gao@intel.com" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiANCj4gPT09IHg4NiA9PT0NCj4gDQo+ICog
IFBWLUlPTU1VICh2NykNCj4gICAtICBQYXVsIER1cnJhbnQNCj4gDQoNClJlYWxpc3RpY2FsbHkg
SSdtIHVubGlrZWx5IHRvIGdldCBiYWNrIHRvIHRoZSBoeXBlcmNhbGwgaW50ZXJmYWNlIGFueSB0
aW1lIHNvb24uIFRoZXJlJ3MganVzdCB0b28gbXVjaCBncm91bmR3b3JrIHRvIGxheSwgc28gcHJv
YmFibHkgYmV0dGVyIHN0b3AgdHJhY2tpbmcgdGhpcyBmb3Igbm93Lg0KDQogIFBhdWwNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
