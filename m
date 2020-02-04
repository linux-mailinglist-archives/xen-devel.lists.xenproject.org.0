Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7F151F87
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:35:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz23O-0005IO-H9; Tue, 04 Feb 2020 17:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz23N-0005IJ-AW
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:32:01 +0000
X-Inumbo-ID: 3fa2fce2-4774-11ea-8396-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fa2fce2-4774-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580837520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bM/vUPgC4UEjhx/w0f+JaW9RBBgMiRJz3fhjUhUxaq4=;
 b=TxXKSbMU9F7Jy9/zvj5Hv8ZKt6hW74fKMmXFocxX4/u2RqTlhuN9xc5I
 jz/2prd2NSjGpODnXtd94xFWX5BxIVSLjmVZOY5JKBxR5OrBm3wFSk4vh
 cPcEhOcsb/aJVvXVxlDpZzk1ZktmyI/eJXnW21FH852cz/x2Z9U8ww3dl g=;
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
IronPort-SDR: D8TCiz0cl7Lj+yxBTK0+qfO7CnHggOGnt/NVcntH58Vq2ZXPV6gXWQDqQ1+7ZgKhXBCdqyuBMp
 1lzQtjs6YsUiH9Dt5SRe1e6w7wozevkeqPgDlhP+z8QlJP6+ZPrb/4ITn3TkVoBg44OAOSXZ5s
 HlYmidduJCxgp4FBJq8Ut1rgxTYG8oi//R84uVTLUzvSKjT4XvgEU7U0VnoMRJfLztjrYeO/80
 qTwv66tRog1ERszetCoMWP+6R9wOIqRqnjUw6YCrRGxqWw/SE1pgGjLHHSm67LXqFl5XAZS7y7
 158=
X-SBRS: 2.7
X-MesageID: 12305360
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12305360"
Date: Tue, 4 Feb 2020 18:28:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200204172851.GN4679@Air-de-Roger>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
 <1580830825-18767-3-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580830825-18767-3-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: report correct frequency of
 Xen PV clocksource
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDM6NDA6MjVQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhlIHZhbHVlIG9mIHRoZSBjb3VudGVyIHJlcHJlc2VudHMgdGhlIG51bWJlciBv
ZiBuYW5vc2Vjb25kcwo+IHNpbmNlIGhvc3QgYm9vdC4gVGhhdCBtZWFucyB0aGUgY29ycmVjdCBm
cmVxdWVuY3kgaXMgYWx3YXlzIDFHSHouCj4gCj4gVGhpcyBpbmNvbnNpc3RlbmN5IGNhdXNlZCB0
aW1lIHRvIGdvIHNsb3dlciBpbiBQViBzaGltIG9uIG1vc3QKPiBwbGF0Zm9ybXMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpXaXRo
IG9uZSBuaXQgYmVsb3cuCgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvdGltZS5jIHwgMTcgKy0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNoL3g4
Ni90aW1lLmMKPiBpbmRleCA3ZTdhNjJlLi45NTg0MGM0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni90aW1lLmMKPiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4gQEAgLTU2NywyNyArNTY3
LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSBfX2luaXRkYXRhIHBsdF90
c2MgPQo+ICAgKi8KPiAgc3RhdGljIHVpbnQ2NF90IHhlbl90aW1lcl9sYXN0Owo+ICAKPiAtc3Rh
dGljIHVpbnQ2NF90IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KHZvaWQpCj4gLXsKPiAtICAgIHN0
cnVjdCB2Y3B1X3RpbWVfaW5mbyAqaW5mbyA9ICZ0aGlzX2NwdSh2Y3B1X2luZm8pLT50aW1lOwo+
IC0gICAgdWludDY0X3QgZnJlcTsKPiAtCj4gLSAgICBmcmVxID0gMTAwMDAwMDAwMFVMTCA8PCAz
MjsKPiAtICAgIGRvX2RpdihmcmVxLCBpbmZvLT50c2NfdG9fc3lzdGVtX211bCk7Cj4gLSAgICBp
ZiAoIGluZm8tPnRzY19zaGlmdCA8IDAgKQo+IC0gICAgICAgIGZyZXEgPDw9IC1pbmZvLT50c2Nf
c2hpZnQ7Cj4gLSAgICBlbHNlCj4gLSAgICAgICAgZnJlcSA+Pj0gaW5mby0+dHNjX3NoaWZ0Owo+
IC0KPiAtICAgIHJldHVybiBmcmVxOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW50NjRfdCBfX2luaXQg
aW5pdF94ZW5fdGltZXIoc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2UgKnB0cykKPiAgewo+ICAg
ICAgaWYgKCAheGVuX2d1ZXN0ICkKPiAgICAgICAgICByZXR1cm4gMDsKPiAgCj4gLSAgICBwdHMt
PmZyZXF1ZW5jeSA9IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KCk7Cj4gKyAgICBwdHMtPmZyZXF1
ZW5jeSA9IDEwMDAwMDAwMDBVTEw7CgpZb3UgY2FuIGluaXQgdGhpcyBmaWVsZCBiZWxvdyBhdCBk
ZWNsYXJhdGlvbiwgc2luY2UgaXQncyBhIHN0YXRpYwp2YWx1ZS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
