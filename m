Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E986C2D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 23:17:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvpkZ-0003Cg-PL; Thu, 08 Aug 2019 21:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvpkY-0003Ca-3J
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 21:15:06 +0000
X-Inumbo-ID: 95c76904-ba21-11e9-8813-c3b2c155ec45
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95c76904-ba21-11e9-8813-c3b2c155ec45;
 Thu, 08 Aug 2019 21:15:02 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gimTLhapPuoszROOlMpMVgC2i05OWZhvDRcK8x0OGMMQnfgzfII0pRIaA0WBnEuLYVCxJTGhnN
 eJxa4Ojn4xYPWAoDVA+Vf1owmGswwJ8ljXT+/Y46Sur+Ff1r3EMsV9hQCw2XBh1QCNmCts8sRK
 AoUTwG1uMgg1Vovr5OYpsQ0fotKp0mI+tfqBSzq7gtZALRWpiZkPwB1gI3NbGh3LQ4Je04f0+H
 xBEeEha3OQICHa4UJ4S16OJ49ijIrfeKQg8UfnpecZ07eoXuHThxT3GYKdy4gTJQjf7fMUnhy9
 QjI=
X-SBRS: 2.7
X-MesageID: 4063853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,363,1559534400"; 
   d="scan'208";a="4063853"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
Date: Thu, 8 Aug 2019 22:14:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAyMjoxNiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA4LzA4
LzIwMTkgMjM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA4LzA4LzIwMTkgMjE6NTks
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IEhpIEFuZHJldywKPj4+Cj4+PiBJdCBzZWVt
cyB0aGUgcHZzaGltIHBhdGNoZXMgaW4geGVuLXVuc3RhYmxlIHN0YWdpbmcgYnJlYWsgdGhlIGJ1
aWxkIG9uIG15IG1hY2hpbmUuCj4+PiBJIGNsb25lZCBhIGZyZXNoIHRyZWUgdG8gYmUgc3VyZSwg
aGF2ZW4ndCBjaGVja2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVzZXMgaXQ6Cj4+PiAw
NjBmNGVlZTBmYjQwOGIzMTY1NDg3NzVhYjkyMWUxNmI3YWNkMGUwIG9yIDMyYjFkNjI4ODdkMDFm
ODVmMGMxZDJlMDEwM2Y2OWY3NGUxZjZmYTMKPj4+Cj4+PiAtLQo+Pj4gU2FuZGVyCj4+Pgo+Pj4K
Pj4+Cj4+PiBbIC1kIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdCBdIHx8IC91c3Ivc3JjL25ldy94
ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtZCAt
bTA3NTUgLXAgLy91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+PiBbIC1kIC8vdXNyL2xvY2FsL2xp
Yi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0
YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAt
cCAvL3Vzci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+Pj4gWyAhIC1l
IGh2bWxvYWRlci9odm1sb2FkZXIgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xz
L2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIGh2bWxvYWRlci9o
dm1sb2FkZXIgLy91c3IvbG9jYWwvbGliL3hlbi9ib290Cj4+PiAvdXNyL3NyYy9uZXcveGVuLXVu
c3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1w
IHNlYWJpb3MtZGlyL291dC9iaW9zLmJpbiAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3Qvc2VhYmlv
cy5iaW4KPj4+IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4v
dG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2Nh
bC9saWIveGVuL2Jvb3QveGVuLXNoaW0KPj4+IGluc3RhbGw6IGNhbm5vdCBzdGF0ICd4ZW4tZGly
L3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pj4gbWFrZVs0XTogKioqIFtN
YWtlZmlsZTo1MjogaW5zdGFsbF0gRXJyb3IgMQo+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUnCj4+PiBtYWtlWzNd
OiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6
MjM3OiBzdWJkaXItaW5zdGFsbC1maXJtd2FyZV0gRXJyb3IgMgo+Pj4gbWFrZVszXTogTGVhdmlu
ZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+PiBtYWtlWzJd
OiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6
MjMyOiBzdWJkaXJzLWluc3RhbGxdIEVycm9yIDIKPj4+IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0
b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwo+Pj4gbWFrZVsxXTogKioqIFtN
YWtlZmlsZTo3MzogaW5zdGFsbF0gRXJyb3IgMgo+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+PiBtYWtlOiAqKiogW01ha2Vm
aWxlOjEzMTogaW5zdGFsbC10b29sc10gRXJyb3IgMgo+PiBUaGF0J3Mgd2VpcmQuCj4+Cj4+IERv
IHlvdSBoYXZlIHRoZSBmdWxsIGxvZz/CoCBUaGUgcmVhbCBmYWlsdXJlIHdhcyBzb21ld2hlcmUg
ZWFybGllciB3aGVyZQo+PiB4ZW4tc2hpbSBkaWRuJ3QgZ2V0IHN0YXJ0ZWQuCj4+Cj4+IH5BbmRy
ZXcKPj4KPiBIbW0gaWYgZm9yZ290IGFuZCB0aHVzIGZvcmdvdCB0byBtZW50aW9uIG15IGJ1aWxk
IHNjcmlwdCBkaXNhYmxlcyBzb21lIHN0dWZmOgo+IC4vY29uZmlndXJlIC0tZGlzYWJsZS1xZW11
LXRyYWRpdGlvbmFsIC0tZGlzYWJsZS1zdHViZG9tIC0tZGlzYWJsZS1kb2NzIC0tZGlzYWJsZS1y
b21iaW9zCj4KPiBDb3VsZCBiZSB0aGF0IG9uZSBvZiB0aG9zZSBkb2Vzbid0IHdvcmsgYW55bW9y
ZS4KClRoZSBvbmx5IGludGVyZXN0aW5nIG9uZSB3b3VsZCBiZSAtLWRpc2FibGUtcm9tYmlvcywg
d2hpY2ggZG9lcyBtYWtlCmNoYW5nZXMgaW4gdGhpcyBhcmVhIG9mIHRoZSBidWlsZCwgYnV0IGV2
ZXJ5dGhpbmcgSSBjaGFuZ2VkIHdhcyBpbnNpZGUKdGhlIHhlbi1kaXIvIGRpcmVjdG9yeSBzbyBz
aG91bGRuJ3QgaW50ZXJhY3QuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
