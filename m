Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB458103F14
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 16:41:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXS3w-0005Jc-UE; Wed, 20 Nov 2019 15:38:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mm6R=ZM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iXS3w-0005JX-7y
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 15:38:36 +0000
X-Inumbo-ID: d02065f2-0bab-11ea-b678-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d02065f2-0bab-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574264314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q4cQ/IEwn90EKgMaEUYZoywzlLWnxhr8D/zbZJc7Sno=;
 b=Cg4Jiy8aFjyDs5yuCArUhACqjQvkEDyH507t9vbgo8kcfSxfXzSLO/gk
 uDzVaa2JhhNyASJ7z0VRlELqllGveLMmJRIBib5jF0CIR4UDRxiO7UOL2
 RRK3xmwz6WExi/ftzb/qNV56ayLa4uIOQOprezA005iX/6fnQzfsAueX9 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G61FxiAVsGhQ9E+e0u1ih7Vz0zZiPp0xf+UlfprhxZNfwqgw3HOd16hEteTqL/mXa42vhrQDBo
 iXx0mR9RafRBGuiAA9vzwXw/jeB4qHux/H0WJNpkSSztSBC9aQUf68oLruS78uKxZCHj2/7UNo
 xkALqH7SYSRs9WKUDew2A+eIJjEflTQ4Opnfk5Tri6Lsfmmw4wvoiVLOn/bC864YZFKJnXcrHz
 gWdSewjwc8FvdXxTGb+UvmTTTRfn5WoYgKPsgdwE1H1OLjH0X/1K0Orryr5AEcgpOqGb4EN4ll
 2oU=
X-SBRS: 2.7
X-MesageID: 8959617
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="8959617"
Date: Wed, 20 Nov 2019 15:38:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20191120153831.GF1425@perard.uk.xensource.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-32-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011160552.22907-32-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [RFC v5 031/126] xen: introduce ERRP_AUTO_PROPAGATE
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul
 Durrant <paul@xen.org>, armbru@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDc6MDQ6MTdQTSArMDMwMCwgVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJsb2NrLmMg
Yi9ody9ibG9jay94ZW4tYmxvY2suYwo+IC0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jCj4gKysr
IGIvaHcvYmxvY2sveGVuLWJsb2NrLmMKPiBAQCAtOTE1LDE1ICs5MDMsMTUgQEAgc3RhdGljIHZv
aWQgeGVuX2Jsb2NrX2RldmljZV9jcmVhdGUoWGVuQmFja2VuZEluc3RhbmNlICpiYWNrZW5kLAo+
ICAgICAgICAgIGdvdG8gZmFpbDsKPiAgICAgIH0KPiAgCj4gLSAgICBkcml2ZSA9IHhlbl9ibG9j
a19kcml2ZV9jcmVhdGUodmRldiwgZGV2aWNlX3R5cGUsIG9wdHMsICZsb2NhbF9lcnIpOwo+ICsg
ICAgZHJpdmUgPSB4ZW5fYmxvY2tfZHJpdmVfY3JlYXRlKHZkZXYsIGRldmljZV90eXBlLCBvcHRz
LCBlcnJwKTsKPiAgICAgIGlmICghZHJpdmUpIHsKPiAtICAgICAgICBlcnJvcl9wcm9wYWdhdGVf
cHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsICJmYWlsZWQgdG8gY3JlYXRlIGRyaXZlOiAiKTsKPiAr
ICAgICAgICBlcnJvcl9wcmVwZW5kKGVycnAsICJmYWlsZWQgdG8gY3JlYXRlIGRyaXZlOiAiKTsK
PiAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAgICB9Cj4gIAo+IC0gICAgaW90aHJlYWQgPSB4ZW5f
YmxvY2tfaW90aHJlYWRfY3JlYXRlKHZkZXYsICZsb2NhbF9lcnIpOwo+IC0gICAgaWYgKGxvY2Fs
X2Vycikgewo+IC0gICAgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIGxvY2FsX2Vy
ciwKPiArICAgIGlvdGhyZWFkID0geGVuX2Jsb2NrX2lvdGhyZWFkX2NyZWF0ZSh2ZGV2LCBlcnJw
KTsKPiArICAgIGlmICgqZXJycCkgewo+ICsgICAgICAgIGVycm9yX3ByZXBlbmQoZXJycCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGNyZWF0ZSBpb3RocmVh
ZDogIik7CgpUaGVzZSB0d28gbGluZSBjb3VsZCBiZSBqb2luZWQgbm93LgoKPiAgICAgICAgICBn
b3RvIGZhaWw7Cj4gICAgICB9CgpBbmQgdGhlcmUgYXJlIG1vcmUgaW5kZW50YXRpb24gaXNzdWVz
IGxpa2UgdGhhdCBpbiB0aGUgcGF0Y2guIEl0IHdvdWxkIGJlCm5pY2UgdG8gZml4LCBidXQgb3Ro
ZXJ3aXNlIHRoZSBwYXRjaCBsb29rcyBmaW5lOgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
