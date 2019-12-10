Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FF11864F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 12:30:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iedfq-0005Fu-4K; Tue, 10 Dec 2019 11:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czbI=2A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iedfo-0005Fp-LW
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 11:27:24 +0000
X-Inumbo-ID: 08decdea-1b40-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08decdea-1b40-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575977243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tUC4eA5Nyboawm85fT747hHsr0DL/gSfovcFMbk7+pE=;
 b=dwv/jnFaJLOrFMWgfJ85UgwT39HFqu05fL3CccClcFtl264qMokE+KWx
 5iQXKwDs5gBvMIOilyPNCHc08feM02IoWrZNOrcdIt7iG0oBCbRYbIyNm
 WtKCef1DJyuWCa7aT77As4+BHXON0POEgBl/b5BT+E83ShchubeEBkxry w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nXOcsY0Pt+xf/qTuGVWNFNsbaqaEwdl4FNa1UmNjQiZPJPNQ+9rjkuFmNla+vXxbcWAGKepql8
 c8bHGkoYm2zn/1XwINWxljwPUkfL+VS17uRdYc+GRJJDNw5BD0TEpb1EllXJW74c2gUmL5EKqU
 MicjIW3cxXWeMEXgdy+Iytiez1hVGck06p7bWVqhxyDohPZ3eOn5aOKcAvr+04oC+A5PNj8KGX
 skek1oJ3rDyBq0Nlu6BVyQjB81FOyrztBfIM78TlTkcIAqQsjPBWV1RBPtGDl5jVWAZGTp+bHh
 qr8=
X-SBRS: 2.7
X-MesageID: 9805719
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9805719"
Date: Tue, 10 Dec 2019 12:27:14 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191210112714.GH980@Air-de-Roger>
References: <20191209201444.33243-1-natechancellor@gmail.com>
 <bf13410c-b62e-d82f-6351-ee49d7964fe7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf13410c-b62e-d82f-6351-ee49d7964fe7@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: Adjust indentation in
 xlvbd_alloc_gendisk
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 xen-devel@lists.xenproject.org, Nathan Chancellor <natechancellor@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDg6MTU6MjJBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwOS4xMi4xOSAyMToxNCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiBD
bGFuZyB3YXJuczoKPiA+IAo+ID4gLi4vZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYzoxMTE3
OjQ6IHdhcm5pbmc6IG1pc2xlYWRpbmcgaW5kZW50YXRpb247Cj4gPiBzdGF0ZW1lbnQgaXMgbm90
IHBhcnQgb2YgdGhlIHByZXZpb3VzICdpZicgWy1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbl0KPiA+
ICAgICAgICAgICAgICAgICAgbnJfcGFydHMgPSBQQVJUU19QRVJfRElTSzsKPiA+ICAgICAgICAg
ICAgICAgICAgXgo+ID4gLi4vZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYzoxMTE1OjM6IG5v
dGU6IHByZXZpb3VzIHN0YXRlbWVudCBpcyBoZXJlCj4gPiAgICAgICAgICAgICAgICAgIGlmIChl
cnIpCj4gPiAgICAgICAgICAgICAgICAgIF4KPiA+IAo+ID4gVGhpcyBpcyBiZWNhdXNlIHRoZXJl
IGlzIGEgc3BhY2UgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGlzIGxpbmU7IHJlbW92ZQo+ID4gaXQg
c28gdGhhdCB0aGUgaW5kZW50YXRpb24gaXMgY29uc2lzdGVudCBhY2NvcmRpbmcgdG8gdGhlIExp
bnV4IGtlcm5lbAo+ID4gY29kaW5nIHN0eWxlIGFuZCBjbGFuZyBubyBsb25nZXIgd2FybnMuCj4g
PiAKPiA+IFdoaWxlIHdlIGFyZSBoZXJlLCB0aGUgcHJldmlvdXMgbGluZSBoYXMgc29tZSB0cmFp
bGluZyB3aGl0ZXNwYWNlOyBjbGVhbgo+ID4gdGhhdCB1cCBhcyB3ZWxsLgo+ID4gCj4gPiBGaXhl
czogYzgwYTQyMDk5NWU3ICgieGVuLWJsa2Zyb250OiBoYW5kbGUgWGVuIG1ham9yIG51bWJlcnMg
b3RoZXIgdGhhbiBYRU5WQkQiKQo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVp
bHRMaW51eC9saW51eC9pc3N1ZXMvNzkxCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNl
bGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
