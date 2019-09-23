Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E508BB788
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPsg-0001nA-SM; Mon, 23 Sep 2019 15:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sJPS=XS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCPse-0001n5-S3
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:04:00 +0000
X-Inumbo-ID: 5f3dd3d0-de13-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f3dd3d0-de13-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569251040;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Y4/NeUeZiErZGzqGIl4KpmJrqnjb26duKO/7w9nXdI=;
 b=NX5+xOlDb8X9nGPKA+sFQWGdE2vFDdFVl1xjarpKS8vqSVDwOHZvhUeT
 JkCXLRx7tWN58SAkhSgY+mQdSmPMo372XE6WQsg+S9VqjC3RmdhGYfqBl
 8+LB/YR204Mi5hJaSaYthTCs1VKGOAZ3fjFQNBvpAYv8hSGiUIGTvx6Oc M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Af8RCcOLXn+JKGfge5/ttaGXwR/JdsgHkehCcsZBOLpIG5YBxbEtmXvFYS0WBAJF8bGi50GgAL
 hslrKvAgB+Yd9wcO2m6DOt/hIsbOLvxYH6Y8WVI4HARiA5mV9yGJs/usLf1tjGWU4S9ZlA3kUv
 vDRlwV7+2zUQxxmZrpbK30hZqcDivSFceEmGK9OzSlmnpYlklyER8q/hLQvysvJziWY5rItvOr
 Zg1DwfQ/F+UHpj18dAN1sTcbjIqbED5bbXB4ieZleigA0AuDxKYIyV/OnDAWxooF1O3p6x6PDI
 +9c=
X-SBRS: 2.7
X-MesageID: 5933806
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5933806"
Date: Mon, 23 Sep 2019 16:03:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190923150356.GB1163@perard.uk.xensource.com>
References: <20190918115745.39006-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918115745.39006-1-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] xen-bus: only set the xen device frontend
 state if it is missing
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Mark Syms <mark.syms@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTI6NTc6NDRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEZyb206IE1hcmsgU3ltcyA8bWFyay5zeW1zQGNpdHJpeC5jb20+Cj4gCj4gU29tZSB0
b29sc3RhY2sgaW1wbGVtZW50YXRpb25zIHdpbGwgc2V0IHRoZSBmcm9udGVuZCB4ZW5zdG9yZQo+
IGtleXMgdG8gSW5pdGlhbGlzaW5nIHdoaWNoIHdpbGwgdGhlbiB0cmlnZ2VyIHRoZSBpbiBndWVz
dCBQVgo+IGRyaXZlcnMgdG8gYmVnaW4gaW5pdGlhbGlzaW5nIGFuZCBzb21lIGltcGxlbWVudGF0
aW9ucyB3aWxsCj4gdGhlbiBzZXQgdGhlaXIgc3RhdGUgdG8gQ2xvc2luZy4gSWYgdGhpcyBoYXMg
b2NjdXJyZWQgdGhlbgo+IGRldmljZSByZWFsaXplIG11c3Qgbm90IG92ZXJ3cml0ZSB0aGUgZnJv
bnRlbmQga2V5cyBhcyB0aGVuCj4gdGhlIGhhbmRzaGFrZSB3aWxsIHN0YWxsLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmsgU3ltcyA8bWFyay5zeW1zQGNpdHJpeC5jb20+Cj4gCj4gQWxzbyBhdm9p
ZCBjcmVhdGluZyB0aGUgZnJvbnRlbmQgYXJlYSBpZiBpdCBhbHJlYWR5IGV4aXN0cy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhh
bmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
