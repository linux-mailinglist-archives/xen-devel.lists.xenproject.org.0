Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2E991F7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 13:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0l65-0005sq-BF; Thu, 22 Aug 2019 11:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKi2=WS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i0l63-0005sf-M8
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 11:17:39 +0000
X-Inumbo-ID: 72f26a02-c4ce-11e9-add6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72f26a02-c4ce-11e9-add6-12813bfff9fa;
 Thu, 22 Aug 2019 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566472659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cdC/+XCF8A4lCfmd72kiRwi9Nh8c5EpDpeHakVk7NDc=;
 b=FGujj/NIbRVrRk3FnZbgSEMflogy4PJR83JLivyoqonUjXLwC9dVjPMd
 x8+hboRQ8cj4FTygybPO7pX/Yz006yS8sgbrEHgrra3Knsyd3pe7vkHzP
 j64uhNA+DWfCqJG0oJms19RBt59VItDdMbzOw4qXYtGyKEd4fBiviNSNb A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ahKcjPonF7nN3SGQWWXY8ZrFBzs8BrcW5o0qDNPXsGQWdKWxesJGJkVhIyaAjhiO9zqmHY6Jrr
 ySdPW0fAKug7ljQLWKcoUL96DZI92V1jQktjtSGyNpP5IKsO2lVjMtDdtGwoCQMTZCZT9eVQZd
 VdooDKlIP4KW/FcrO+zofrPkUXDY7nI4yzen8KuUrUfQut83PXC/IxdpPT6W2xAMhe1PqKXHBX
 61R8FHTxbVfDXI08lpyfLQB2fE8cPW1a/T6tNtxocCeyhLjKcJWT/zyeR/DrRaMEPOo0c3hzp5
 J+o=
X-SBRS: 2.7
X-MesageID: 4591279
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4591279"
Date: Thu, 22 Aug 2019 12:17:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822111730.GK1289@perard.uk.xensource.com>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
 <20190822102132.GJ1289@perard.uk.xensource.com>
 <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTE6MzY6MzJBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEJ1dCwgbm93IEkgbG9vayBhdCB0aGUgY29kZSBhZ2FpbiB3aXRob3V0IHlvdXIgcGF0
Y2ggYXBwbGllZCBJIGRvbid0IGFjdHVhbGx5IHNlZSB0aGUgcHJvYmxlbSBpdCBpcyB0cnlpbmcg
dG8gZml4LiBUaGUgZnVuY3Rpb25zIHhlbl9kZXZpY2VfW2JhY2t8ZnJvbnRdZW5kX3NldF9zdGF0
ZSByZXR1cm4gZWFybHkgaWYgdGhlIHN0YXRlIGJlaW5nIHNldCBtYXRjaGVzIHRoZSBleGlzdGlu
ZyBzdGF0ZSBhbmQgaGVuY2UgbmV2ZXIgZ2V0IHRvIHRoZSBsaW5lIHdoZXJlIHRoZSBzdGF0ZSBp
cyB3cml0dGVuIHRvIHhlbnN0b3JlLgoKTGV0J3Mgc2VlOgogICAgKiBzdGVwIDEgKGluaXRpYWwg
c3RhdGVzIGluIHhlbnN0b3JlIGFuZCBRRU1VKQogICAgICAgIHhlbnN0b3JlL2Zyb250ZW5kL3N0
YXRlID0gNAogICAgICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgPSA0CiAgICAqIHN0ZXAgMiAo
ZnJvbnRlbmQgY2hhbmdlcyBzdGF0ZSBpbiB4ZW5zdG9yZSkKICAgICAgICB4ZW5zdG9yZS9mcm9u
dGVuZC9zdGF0ZSA9IDUKICAgICogc3RlcCAzICh3YXRjaCBldmVudCByZWNlaXZlZCBieSBRRU1V
KQogICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpCiAgICAgICAgICAgIHN0YXRl
ID0gcmVhZCh4ZW5zdG9yZS9mcm9udGVuZC9zdGF0ZSkgKHN0YXRlPTUpCiAgICAgICAgICAgIHhl
bl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKHN0YXRlKQogICAgICAgICAgICAgICAgeGVuZGV2
LT5mcm9udGVuZF9zdGF0ZSAhPSBzdGF0ZSAgKDQhPTUpCiAgICAgICAgICAgICAgICAgICAgeGVu
ZGV2LT5mcm9udGVuZF9zdGF0ZSA9IHN0YXRlCiAgICAgICAgICAgICAgICAgICAgeGVuc3RvcmUv
ZnJvbnRlbmQvc3RhdGUgPSBzdGF0ZQogICAgKiBzdGVwIDQKICAgICAgICAjIHdhdGNoIGV2ZW50
IHRyaWdnZXJzIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpIGFnYWluIGJ1dAogICAgICAg
ICMgdGhpcyB0aW1lIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgPT0geGVuc3RvcmUvZnJvbnRlbmRf
c3RhdGUKClRoaXMgaXMgaG93IFFFTVUgd3JpdGVzIHRvIHhlbnN0b3JlIGFuIGlkZW50aWNhbCB2
YWx1ZS4KClRoYXQgYmVoYXZpb3IgbWlnaHQgYmUgYW4gaXNzdWUgaWYgdGhlIGZyb250ZW5kIGNo
YW5nZXMgdGhlIHZhbHVlIGFmdGVyClFFTVUgaGF2ZSByZWFkIGl0IGJ1dCBiZWZvcmUgUUVNVSB3
cml0ZXMgaXQgYWdhaW4uCgpBbHNvLCBpdCdzIG5pY2UgdG8gYXZvaWQgZXh0cmEgd29yay4KCi0t
IApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
