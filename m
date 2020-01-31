Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618F14EB95
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 12:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixUE3-00007Z-IH; Fri, 31 Jan 2020 11:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhvM=3U=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ixUE2-00007U-42
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 11:12:38 +0000
X-Inumbo-ID: 95dc3c0c-441a-11ea-8bb7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95dc3c0c-441a-11ea-8bb7-12813bfff9fa;
 Fri, 31 Jan 2020 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580469158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qfF8oVOo7ctviCi6mg6F9BGnSJ7daqD7vdkZGyymZFw=;
 b=Nu1w+N6cQnDFEAwkd6SJdgp707fa0svJtFBygJyniK4YmlUXVYX0blEv
 xIyGWablKUL5mA50iGoeB15I10bxfXvPlyx0S9pdkLFKRYX/d0aFDyabh
 sA0/w7GqdPVM+NIonwZFHHb12COMCbPOE5QgZpjs6P1Uu3+AhSFZZNY7Y c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vDZIIl5/+JntewELYHJ9/JSdMe3F98V9bYxcBFBFej6UsoUtpFkt+XGuM9/sFQ5N6YsjSgN/g5
 fuxvZflgXWtiiUuFPyen+4T8WGJMrZjOFHMki16w6fHAwwZ11jPscj53yaC2K7kw6U5qV+kPeM
 rrEaSIHNG0f1LPsCSECmVQpQgEuKlQ1NGZZ1d9eL/U5Ff90C/GOTx2EwnJQBZ8NWkfi/smZtqo
 irVUeS70VZzILi6pxAArbgEAeLw/75owOBfpW4gv6EtQYoaTFqFoUI/TQSpqthjUfG3aoJcf/h
 jho=
X-SBRS: 2.7
X-MesageID: 11734366
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,385,1574139600"; d="scan'208";a="11734366"
Date: Fri, 31 Jan 2020 11:12:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <jgrall@amazon.com>
Message-ID: <20200131111222.GT1288@perard.uk.xensource.com>
References: <20191216143451.19024-1-pdurrant@amazon.com>
 <20191219171158.GF1267@perard.uk.xensource.com>
 <b2762e84-1cc4-649c-9b53-8754678525f6@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2762e84-1cc4-649c-9b53-8754678525f6@amazon.com>
Subject: Re: [Xen-devel] [PATCH] xen-bus/block: explicitly assign event
 channels to an AioContext
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
 qemu-block@nongnu.org, Paul Durrant <pdurrant@amazon.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMTA6MjI6MTRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFudGhvbnksCj4gCj4gT24gMTkvMTIvMjAxOSAxNzoxMSwgQW50aG9ueSBQRVJB
UkQgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAxNiwgMjAxOSBhdCAwMjozNDo1MVBNICswMDAwLCBQ
YXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IEl0IGlzIG5vdCBzYWZlIHRvIGNsb3NlIGFuIGV2ZW50
IGNoYW5uZWwgZnJvbSB0aGUgUUVNVSBtYWluIHRocmVhZCB3aGVuCj4gPiA+IHRoYXQgY2hhbm5l
bCdzIHBvbGxlciBpcyBydW5uaW5nIGluIElPVGhyZWFkIGNvbnRleHQuCj4gPiA+IAo+ID4gPiBU
aGlzIHBhdGNoIGFkZHMgYSBuZXcgeGVuX2RldmljZV9zZXRfZXZlbnRfY2hhbm5lbF9jb250ZXh0
KCkgZnVuY3Rpb24KPiA+ID4gdG8gZXhwbGljaXRseSBhc3NpZ24gdGhlIGNoYW5uZWwgQWlvQ29u
dGV4dCwgYW5kIG1vZGlmaWVzCj4gPiA+IHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVsKCkg
dG8gaW5pdGlhbGx5IGFzc2lnbiB0aGUgY2hhbm5lbCdzIHBvbGxlcgo+ID4gPiB0byB0aGUgUUVN
VSBtYWluIHRocmVhZCBjb250ZXh0LiBUaGUgY29kZSBpbiB4ZW4tYmxvY2sncyBkYXRhcGxhbmUg
aXMKPiA+ID4gdGhlbiBtb2RpZmllZCB0byBhc3NpZ24gdGhlIGNoYW5uZWwgdG8gSU9UaHJlYWQg
Y29udGV4dCBkdXJpbmcKPiA+ID4geGVuX2Jsb2NrX2RhdGFwbGFuZV9zdGFydCgpIGFuZCBkZS1h
c3NpZ24gaXQgZHVyaW5nIGluCj4gPiA+IHhlbl9ibG9ja19kYXRhcGxhbmVfc3RvcCgpLCBzdWNo
IHRoYXQgdGhlIGNoYW5uZWwgaXMgYWx3YXlzIGFzc2lnbmVkCj4gPiA+IGJhY2sgdG8gbWFpbiB0
aHJlYWQgY29udGV4dCBiZWZvcmUgaXQgaXMgY2xvc2VkLiBhaW9fc2V0X2ZkX2hhbmRsZXIoKQo+
ID4gPiBhbHJlYWR5IGRlYWxzIHdpdGggYWxsIHRoZSBuZWNlc3Nhcnkgc3luY2hyb25pemF0aW9u
IHdoZW4gbW92aW5nIGFuIGZkCj4gPiA+IGJldHdlZW4gQWlvQ29udGV4dC1zIHNvIG5vIGV4dHJh
IGNvZGUgaXMgbmVlZGVkIHRvIG1hbmFnZSB0aGlzLgo+ID4gPiAKPiA+ID4gUmVwb3J0ZWQtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IEkgY2FuJ3QgZmlu
ZCB0aGUgcGF0Y2ggaW4gUUVNVSB1cHN0cmVhbS4gQXJlIHdlIG1pc3NpbmcgYW55IGFjay9yZXZp
ZXcgZm9yCj4gdGhpcyBwYXRjaD8KCk5vLCBJIGp1c3QgbmVlZCB0byBwcmVwYXJlIGEgcHVsbCBy
ZXF1ZXN0LiBJdCdzIGluIG15IGxpc3Qgb2YgcGF0Y2ggZm9yCnVwc3RyZWFtLCBzbyB0aGVyZSB3
aWxsIGJlIGEgcHVsbCByZXF1ZXN0IGF0IHNvbWUgcG9pbnQgYmVmb3JlIHRoZSBuZXh0ClFFTVUg
cmVsZWFzZS4KCkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
