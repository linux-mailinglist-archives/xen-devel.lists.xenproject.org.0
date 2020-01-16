Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291F13F2EA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:39:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isA0D-0006fg-Tv; Thu, 16 Jan 2020 18:36:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isA0C-0006fb-5i
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:36:20 +0000
X-Inumbo-ID: 1138e8b0-388f-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1138e8b0-388f-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 18:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579199772;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2qib6dkyL34OitgPj6pQxPrWVhV95TAKqxU+JBAXIRM=;
 b=GLNs0esO3tIgSukj/nYhGvwEVQef7avIS0RttHYtcRW9f2IpuIvhhRtA
 Czl8Jv8Y6c4Ak/CHU2pF3KDNsD40wm7x2upuhHshXKbz4EG/k/+ptxqVY
 AguZkspU4Fm7WOGo+NHkWrOvYxA9H8qFoPwWjhjEWMi+FksxzEoprqpSE M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ixQnrD0tAzZxBmTlyIpEt5f8E6RtlH65LK1hjaR5/p3/lWghRaDYgJkWMiVrYZq+0mZl++5i+1
 k/SzVZmnC68ba2r/4tI4C/SfsVMRRlCQ3dnKgNpAUgQba85dfFzin81pLwMjUxAu1av3VTPmyA
 V2v4lyonr9NSLpoKvnYGcOOKGMVou8C6tLLFtYvbjqfPa1R35usGfSeIxdQu+2dwS0cKUddoU7
 xp3kxn4Ji7eGqV66ASX0ik+xqjgt6nD8AMmlkLSJg2eWZWBBZw9zcL+Y17HzcItrwgeZBxFxZM
 l2k=
X-SBRS: 2.7
X-MesageID: 11027650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11027650"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24096.44311.441643.264877@mariner.uk.xensource.com>
Date: Thu, 16 Jan 2020 18:36:07 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-5-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBUaGlzIGJyb2FkbHkgY29udGFpbnMgd2hhdCBJIGV4cGVjdGVkLCBidXQ6CgpQYXVsIER1
cnJhbnQgd3JpdGVzICgiW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRv
bWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQiKToKCj4gKyAgICAgICAgZm9y
ICg7Oykgewo+ICsgICAgICAgICAgICBpZiAoaW5mby0+ZG9taWQgPT0gUkFORE9NX0RPTUlEKSB7
Cj4gKyAgICAgICAgICAgICAgICB1aW50MTZfdCB2Owo+ICsKPiArICAgICAgICAgICAgICAgIC8q
IFJhbmRvbWl6ZSBsb3dlciBvcmRlciBieXRlcyAqLwo+ICsgICAgICAgICAgICAgICAgcmV0ID0g
bGlieGxfX3JhbmRvbV9ieXRlcyhnYywgKHZvaWQgKikmdiwgc2l6ZW9mKHYpKTsKPiArICAgICAg
ICAgICAgICAgIGlmIChyZXQgPCAwKQo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsK
PiArICAgICAgICAgICAgICAgIHYgJj0gRE9NSURfTUFTSzsKPiArICAgICAgICAgICAgICAgIGlm
ICghbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QodikgfHwKPiArICAgICAgICAgICAgICAgICAgICBs
aWJ4bF9faXNfcmV0aXJlZF9kb21pZChnYywgdikpCj4gKyAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICAgKmRvbWlkID0gdjsKPiArICAgICAgICAgICAg
fQo+ICsKPiArICAgICAgICAgICAgcmV0ID0geGNfZG9tYWluX2NyZWF0ZShjdHgtPnhjaCwgZG9t
aWQsICZjcmVhdGUpOwo+ICsgICAgICAgICAgICBpZiAocmV0ID09IDAgfHwgZXJybm8gIT0gRUVY
SVNUIHx8IGluZm8tPmRvbWlkICE9IFJBTkRPTV9ET01JRCkKPiArICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICsgICAgICAgIH0KCkkgdGhpbmsgdGhpcyBoYXMgYSByYWNlLgoKICBUaHJlYWQgQSwg
aW4gZG9tYWluIGRlc3Ryb3kgICAgICAgICAgIFRocmVhZCBCLCBpbiBjb2RlIGFib3ZlCgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNob29zZSBkb21pZCBWCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hlY2sgViBpbiByZWNlbnQgZG9t
aWQgbGlzdAoKICAgICBhZGQgViB0byByZWNlbnQgZG9taWQgbGlzdAogICAgIGRlc3Ryb3kgZG9t
YWluIFYgaW4gWGVuCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNy
ZWF0ZSBkb21haW4gViBpbiBYZW4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZSBjb25zdHJ1Y3RpbmcgVgoKVGhyZWFkIEIgaW1wcm9wZXJseSBjb25zdHJ1
Y3RzIGEgbmV3IGd1ZXN0IHVzaW5nIFYsIGV4cG9zaW5nIGFueW9uZQp3aG8gd2FzIHRhbGtpbmcg
YWJvdXQgViBhIG1vbWVudCBhZ28gdG8gYnVncy4gIFNvbWUgY29kZSBtaWdodCBldmVuCmZhaWwg
dG8gc3BvdCB0aGUgaW50ZXJ2YWwgd2hlcmUgViBkb2VzIG5vdCBleGlzdCBhbmQgY2Fycnkgb24g
dGFsa2luZwp0byB0aGUgbmV3IFYgYXMgaWYgaXQgd2VyZSB0aGUgb2xkIG9uZS4uLgoKSSB0aGlu
ayB0aGVyZSBhcmUgb25seSB0d28gcG9zc2libGUgc29sdXRpb25zOgoKICAtIENoZWNrIHRoZSBk
b21haW4ncyBlbnRyeSBpbiB0aGUgcmVjZW50IGxpc3QgKmFmdGVyKiBjcmVhdGluZwogICAgdGhl
IGRvbWFpbiBpbiBYZW4uICBUaGlzIGludm9sdmVzIGFjY2VwdGluZyB0aGF0IHdlIHdpbGwKICAg
IHJldXNlIHRoZSBkb21pZCBidXQgb25seSBmb3IgYSBkb21haW4gd2UgYXJlIGluIHRoZSBlYXJs
eQogICAgc3RhZ2VzIG9mIGNvbnN0cnVjdGluZywgc28gaG9wZWZ1bGx5IHdpdGhvdXQgYmFkIGNv
bnNlcXVlbmNlPwoKICAtIFRha2UgdGhlIHJlY2VudCBkb21pZCBsb2NrLgoKQWxzbywgaXQgc2Vl
bXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgY2hlY2sgdGhlIHJlY2VudCBkb21pZCBsaXN0IGlmIHdl
CmxldCBYZW4gY2hvb3NlIHRoZSBkb21pZC4gIE1heWJlIHRoYXQgY2FuIGJlIGluIGEgc3Vic2Vx
dWVudCBwYXRjaC4uLgoKVGhhbmtzLApJYW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
