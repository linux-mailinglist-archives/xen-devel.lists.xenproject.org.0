Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36C12B60B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 18:09:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikt4F-000502-C1; Fri, 27 Dec 2019 17:06:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikt4D-0004zv-RQ
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 17:06:25 +0000
X-Inumbo-ID: 35e28a1e-28cb-11ea-9c67-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35e28a1e-28cb-11ea-9c67-12813bfff9fa;
 Fri, 27 Dec 2019 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577466384;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=jSnHm+tkxWsnEkrFx05nADliwa6Xpegqc4C01rL3KsI=;
 b=Y+s/iikWV8NJ5ELWA4H7oPUD605HzoKqOgd8BQTrtqOXpw8GzxS+vP/7
 C9MvoeWdI+NvKXsrfg1+I1v5PU/s3Z3Tut9LxACrTX9LbJkBR77HrDXa6
 bNjMKdbZ+A26RhJYBb5yeyLviKVHF8tDtesN2wRk5R828GIBtjCWEdyad A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CAiz7CTcSIVXxVkweojdGpPkcnNhluIN94q4SlFYLBnrkz+AJ85GKfkpr0odTR8pplPWw4fGj0
 tj08SWVw1MrLVdf+1enx4/Aezr43RTA5EtLYJ1kXiGwhQYTMojqgZ6Ax/6YWkdkPKYR3yuQB3t
 UMLglADU0AWRNe6VLG02UVLFLv4h2tixAd2dThpiLX3YmKqV46WOOExJ/F2H2aiBCnIg+tjmjw
 zCXxW0QWClf7IR+2Mt19OEdrr7iq7fOzHi29U9m+3tWaVcUJ6JwSwIlhkrCL9Rnc0iePJxVhL5
 yaM=
X-SBRS: 2.7
X-MesageID: 10355303
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10355303"
To: Andy Smith <andy@strugglers.net>, <xen-devel@lists.xenproject.org>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>
References: <20191202082222.GW32576@bitfolk.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <62ef8718-fc48-cd5c-93f6-83c3d43862c6@citrix.com>
Date: Fri, 27 Dec 2019 17:06:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191202082222.GW32576@bitfolk.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] livepatch-build: What does getting no output from
 "readelf -wi xen-syms" usually mean?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMTIvMjAxOSAwODoyMiwgQW5keSBTbWl0aCB3cm90ZToKPiBIaSwKPgo+IEkndmUgYmVl
biBsb29raW5nIGludG8gbGl2ZSBwYXRjaGluZyBmb3IgdGhlIGZpcnN0IHRpbWUuCgpDQydpbmcg
bGl2ZXBhdGNoIG1haW50YWluZXJzLgoKPgo+IFN0YXJ0aW5nIHdpdGggYSA0LjEyLjEgYnVpbGQ6
Cj4KPiAkIGNkIH4vZGV2Cj4gJCBscyAtbAo+IHRvdGFsIDgKPiBkcnd4ci14ci14IDMgYW5keSBh
bmR5IDQwOTYgT2N0IDI1IDE2OjExIHhlbgo+IGRyd3hyLXhyLXggNiBhbmR5IGFuZHkgNDA5NiBE
ZWMgIDIgMDE6MTYgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzCj4KPiAodGhlcmUgaXMgYWxyZWFkeSBh
IDQuMTIuMSBoeXBlcnZpc29yIGJ1aWx0IGluIC94ZW4gYW5kIGlzIHdoYXQncwo+IHJ1bm5pbmcg
b24gdGhpcyBob3N0IHdpdGggYnVpbGRfaWQKPiBiMThhZjc3NGI1NmIwYzk4Y2ZhNjk0MGE3MjVi
YTJiYTI2MDY2OTI5KQo+Cj4gJCBjcCAtYSB4ZW4geGVuLWxwdGVzdAo+ICQgY2QgbGl2ZXBhdGNo
LWJ1aWxkLXRvb2xzCj4gJCAuL2xpdmVwYXRjaC1idWlsZCAtaiAxIC1zIC9ob21lL2FuZHkvZGV2
L3hlbi1scHRlc3QveGVuLTQuMTIuMSAtYyAvaG9tZS9hbmR5L2Rldi94ZW4tbHB0ZXN0L3hlbi00
LjEyLjEveGVuLy5jb25maWcgLXAgLi9scHRlc3QucGF0Y2ggLW8gbHB0ZXN0IC1kIC0tZGVwZW5k
cyBiMThhZjc3NGI1NmIwYzk4Y2ZhNjk0MGE3MjViYTJiYTI2MDY2OTI5Cj4gQnVpbGRpbmcgTGl2
ZVBhdGNoIHBhdGNoOiBscHRlc3QKPgo+IFhlbiBkaXJlY3Rvcnk6IC9ob21lL2FuZHkvZGV2L3hl
bi1scHRlc3QveGVuLTQuMTIuMQo+IFBhdGNoIGZpbGU6IC9ob21lL2FuZHkvZGV2L2xpdmVwYXRj
aC1idWlsZC10b29scy9scHRlc3QucGF0Y2gKPiAuY29uZmlnIGZpbGU6IC9ob21lL2FuZHkvZGV2
L3hlbi1scHRlc3QveGVuLTQuMTIuMS94ZW4vLmNvbmZpZwo+IE91dHB1dCBkaXJlY3Rvcnk6IC9o
b21lL2FuZHkvZGV2L2xpdmVwYXRjaC1idWlsZC10b29scy94c2EzMTAKCkFzIGEgbm90ZSwgWFNB
LTMxMCBpc24ndCBzYWZlIHRvIGxpdmVwYXRjaC4KCldoaWxlIChpbiBnZW5lcmFsKSB5b3UgY2Fu
IGJ1aWxkIGEgbGl2ZXBhdGNoLCBhcHBseWluZyBpdCBpcyBub3Qgc2FmZQpiZWNhdXNlIHRoZSBi
ZWZvcmUvYWZ0ZXIgbG9naWMgaXMgbm90IHN5bW1ldHJpYyB3aXRoIGhvdyByZWZlcmVuY2VzIGFy
ZQp0YWtlbi4KCkRlcGVuZGluZyBvbiB0aGUgZXhhY3QgaW50ZXJhY3Rpb24gb2YgYXBwbHlpbmcg
dGhlIGxpdmVwYXRjaCB3aXRoCnBhZ2V0YWJsZSBkZWZlcnJhbCBvcGVyYXRpb25zIChWTSBzdGFy
dCxtaWdyYXRlLHNodXRkb3duLCBvciBsYXJnZQpxdWFudGl0aWVzIG9mIHBhZ2V0YWJsZSBjaGFu
Z2VzLCBlLmcuIGEgZm9yaygpIHN5c3RlbSBjYWxsKSwgeW91IGNhbiBlbmQKdXAgd2l0aCB0b28g
ZmV3IG9yIG1hbnkgcmVmZXJlbmNlcyBkcm9wcGVkLsKgIFRvbyBmZXcgZ2VuZXJhbGx5IHJlc3Vs
dHMKaW4gYW4gdW5raWxsYWJsZSB6b21iaWUgZG9tYWluLCB3aGlsZSB0b28gbWFueSB3aWxsIGhp
dCB2YXJpb3VzIEJVRygpcwppbiB0aGUgTU0gY29kZSBhbmQgdGFrZSB0aGUgc3lzdGVtIGRvd24u
Cgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Cj4g
UGVyZm9ybSBmdWxsIGluaXRpYWwgYnVpbGQgd2l0aCAxIENQVShzKS4uLgo+IFJlYWRpbmcgc3Bl
Y2lhbCBzZWN0aW9uIGRhdGEKPiBFUlJPUjogY2FuJ3QgZmluZCBzcGVjaWFsIHN0cnVjdCBzaXpl
Lgo+Cj4gU28gaXQgc2VlbXMgaXQgY29tcGxldGVkIHRoZSBpbml0aWFsIGJ1aWxkIHdpdGhvdXQg
ZXJyb3IgYnV0IGxvb2tpbmcKPiBhdCB0aGUgbGl2ZXBhdGNoLWJ1aWxkIHNjcmlwdCBpdCBydW5z
IHJlYWRlbGYgbGlrZSB0aGlzOgo+Cj4gJCByZWFkZWxmIC13aSBscHRlc3QveGVuLXN5bXMKPiAk
Cj4KPiBGb3IgbWUgdGhpcyBwcm9kdWNlcyBubyBvdXRwdXQuIEkndmUgcHJvYmFibHkgZG9uZSBz
b21ldGhpbmcgc2ltcGxlCj4gd3JvbmcuIERvZXMgdGhhdCBpbmRpY2F0ZSBzb21lIHNpbXBsZSBt
aXN0YWtlIGluIG15IHByb2Nlc3M/CgpNeSBzYW1wbGUgd29ya2luZyBjb21tYW5kIGxpa2UgaXM6
CgouL2xpdmVwYXRjaC1idWlsZCAtcyAvbG9jYWwvLmxpdmVwYXRjaC13b3JrZGlyIC1jCi9sb2Nh
bC8ubGl2ZXBhdGNoLXdvcmtkaXIveGVuLy5jb25maWcgLXAgL2xvY2FsL3hlbi5naXQveGVuL2xp
dmUucGF0Y2gKLW8gb3V0IC0tZGVwZW5kcyA4NDM1ODBlZmMyMjE4M2I0NDEwODM5OGI5YWVjOTdk
OTlkYTJjMjllIC0tZGVidWcKCndoaWNoIGxvb2tzIHRvIGJlIGVxdWl2YWxlbnQgdG8geW91cnMu
CgpXaGF0IGRvZXMgYGZpbGVgIHNheT8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
