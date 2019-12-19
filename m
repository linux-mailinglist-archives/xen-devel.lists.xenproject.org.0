Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182441267C6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:15:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihzLR-0004L6-Hr; Thu, 19 Dec 2019 17:12:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ynai=2J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihzLP-0004L1-LV
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:12:11 +0000
X-Inumbo-ID: ac8d4e3c-2282-11ea-a1e1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac8d4e3c-2282-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 17:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576775522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ep8UXAsd4K+oC+/gdJuoEGO7j3iePmRAKdvVWB3Oexs=;
 b=gcYCXaH69WRkSJNEUP/s7RC4vp24qPtu8ioiukFnNbva+36Xv3m5Vqis
 4Mdcq32ZHSORvyfYF8ct4tqymNZXe6+WCFwYmc++kIxpUfEgEU+qXetuS
 9XMX1Kvzicwy886VTem7cyphqEUk6vipRpwokaRdQkbI2ShcfXu8nvRZ+ M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C/Uc1CxRoO/StAj6gDMRmXGepf7lb/2OiltBcLreHUDcZH3VSxzZgTyMEexVpN7iYEd2Dh+FoE
 JY7wg6zebXZw8I2wzVOg0dpfPr9qNP9nvzYYSvkudOsKaffbeO1Ki5jTe2CLoRR8EuP+ju6qEZ
 qDNng1W1r5jftOlT3u9J8XdBQrEj4MsvifWTR0ZW5AfO5mDEItoP8mBxLu+w1QGK8kECNLzcPp
 aRZRh5NaQfCvY1/sTy4bFRR5f7a4VPDylZXn4w0hVtn5ZGeAkGHCVea0e5mlyijWdI6SS6W5VO
 Xak=
X-SBRS: 2.7
X-MesageID: 10365051
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; d="scan'208";a="10365051"
Date: Thu, 19 Dec 2019 17:11:58 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191219171158.GF1267@perard.uk.xensource.com>
References: <20191216143451.19024-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216143451.19024-1-pdurrant@amazon.com>
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
 qemu-block@nongnu.org, Julien Grall <jgrall@amazon.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDI6MzQ6NTFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEl0IGlzIG5vdCBzYWZlIHRvIGNsb3NlIGFuIGV2ZW50IGNoYW5uZWwgZnJvbSB0aGUg
UUVNVSBtYWluIHRocmVhZCB3aGVuCj4gdGhhdCBjaGFubmVsJ3MgcG9sbGVyIGlzIHJ1bm5pbmcg
aW4gSU9UaHJlYWQgY29udGV4dC4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgeGVuX2Rldmlj
ZV9zZXRfZXZlbnRfY2hhbm5lbF9jb250ZXh0KCkgZnVuY3Rpb24KPiB0byBleHBsaWNpdGx5IGFz
c2lnbiB0aGUgY2hhbm5lbCBBaW9Db250ZXh0LCBhbmQgbW9kaWZpZXMKPiB4ZW5fZGV2aWNlX2Jp
bmRfZXZlbnRfY2hhbm5lbCgpIHRvIGluaXRpYWxseSBhc3NpZ24gdGhlIGNoYW5uZWwncyBwb2xs
ZXIKPiB0byB0aGUgUUVNVSBtYWluIHRocmVhZCBjb250ZXh0LiBUaGUgY29kZSBpbiB4ZW4tYmxv
Y2sncyBkYXRhcGxhbmUgaXMKPiB0aGVuIG1vZGlmaWVkIHRvIGFzc2lnbiB0aGUgY2hhbm5lbCB0
byBJT1RocmVhZCBjb250ZXh0IGR1cmluZwo+IHhlbl9ibG9ja19kYXRhcGxhbmVfc3RhcnQoKSBh
bmQgZGUtYXNzaWduIGl0IGR1cmluZyBpbgo+IHhlbl9ibG9ja19kYXRhcGxhbmVfc3RvcCgpLCBz
dWNoIHRoYXQgdGhlIGNoYW5uZWwgaXMgYWx3YXlzIGFzc2lnbmVkCj4gYmFjayB0byBtYWluIHRo
cmVhZCBjb250ZXh0IGJlZm9yZSBpdCBpcyBjbG9zZWQuIGFpb19zZXRfZmRfaGFuZGxlcigpCj4g
YWxyZWFkeSBkZWFscyB3aXRoIGFsbCB0aGUgbmVjZXNzYXJ5IHN5bmNocm9uaXphdGlvbiB3aGVu
IG1vdmluZyBhbiBmZAo+IGJldHdlZW4gQWlvQ29udGV4dC1zIHNvIG5vIGV4dHJhIGNvZGUgaXMg
bmVlZGVkIHRvIG1hbmFnZSB0aGlzLgo+IAo+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KCj4gVGVzdGVkIGFnYWluc3QgYW4gSFZNIGRlYmlhbiBndWVzdCB3aXRoIGEg
UUNPVzIgaW1hZ2UgYXMgc3lzdGVtIGRpc2ssIGFuZAo+IGFzIGEgaG90LXBsdWdnZWQvdW5wbGdn
ZWQgc2Vjb25kYXJ5IGRpc2suCgpBbmQgSSd2ZSBydW4gYW4gb3NzdGVzdCBmbGlnaHQgd2l0aCB0
aGUgcGF0Y2guCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
