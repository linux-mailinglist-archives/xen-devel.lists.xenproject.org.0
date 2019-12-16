Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E120A1201DF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 11:06:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ignBc-0006Fs-Mb; Mon, 16 Dec 2019 10:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ignBa-0006Fi-Dx
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 10:01:06 +0000
X-Inumbo-ID: f90b62ca-1fea-11ea-9377-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f90b62ca-1fea-11ea-9377-12813bfff9fa;
 Mon, 16 Dec 2019 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576490465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Udubv+mh784Wfj5jYqFizz1+it6295L89sXykBqrSjw=;
 b=PndUOeio7kv7JemJvDmLXMGKSCZj43EfvHNlGE2R3TmbGcSmRj3tugWz
 zdoVWEDl8FIC233N7nS5jntwviWeJSgr09EfrG5fC+j6fZV9J3M0sMaEN
 hgBAw0azBpVWGsoCQ0M592pB+1eOnQjyTan6IDrBuBykc2E29N7bsCeUk 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ipz+vnCGGbv/x6P0hZxrBgQ0AVfbBGbKE0n2+M12OFEiU871OIYj4DRmPsbUbbZeR1i6wT6sdS
 QIgkMO8ca4xvRChVb2Vk8EU4SFWCTr2Tn+bXJ7iBk24gQAq8ww01ZxH+/dW58JE+7mysZkvJxw
 JqXsyi4POshLBzq2urt8VWIHKdFI6ZZn7SdhILInKJ792KQFQwPwWDw5WTK/IPhv8mnUOIXyzp
 WaNjFkPhWl52Wykztl2ja6QunWrVQYogEyOcky+UsGP7/TUNRUTsIrLqFJaaCNVJYD8Y6RDoHL
 LOI=
X-SBRS: 2.7
X-MesageID: 10129775
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10129775"
Date: Mon, 16 Dec 2019 11:00:58 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20191216100058.GM11756@Air-de-Roger>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMTA6NDg6MDJQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gTm93IHRoYXQgdnRzY19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQg
YnkgdnRzY19sb2NrIHdlIGNhbgo+IHNpbXBseSB1cGRhdGUgaXQgdXNpbmcgYSBzaW5nbGUgYXRv
bWljIG9wZXJhdGlvbiBhbmQgZHJvcCB0aGUgc3BpbmxvY2sKPiBlbnRpcmVseS4gVGhpcyBpcyBl
eHRyZW1lbHkgaW1wb3J0YW50IGZvciB0aGUgY2FzZSBvZiBydW5uaW5nIG5lc3RlZAo+IChlLmcu
IHNoaW0gaW5zdGFuY2Ugd2l0aCBsb3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVl
bXB0aW9uCj4gaGFwcGVucyBzb21ld2hlcmUgaW5zaWRlIHRoZSBjcml0aWNhbCBzZWN0aW9uIHRo
YXQgd291bGQgaW1tZWRpYXRlbHkKPiBtZWFuIHRoYXQgb3RoZXIgdkNQVSBzdG9wIHByb2dyZXNz
aW5nIChhbmQgcHJvYmFibHkgYmVpbmcgcHJlZW1wdGVkCj4gYXMgd2VsbCkgd2FpdGluZyBmb3Ig
dGhlIHNwaW5sb2NrIHRvIGJlIGZyZWVkLgo+IAo+IFRoaXMgZml4ZXMgY29uc3RhbnQgc2hpbSBn
dWVzdCBib290IGxvY2t1cHMgd2l0aCB+MzIgdkNQVXMgaWYgdGhlcmUgaXMKPiB2Q1BVIG92ZXJj
b21taXQgcHJlc2VudCAod2hpY2ggaW5jcmVhc2VzIHRoZSBsaWtlbGlob29kIG9mIHByZWVtcHRp
b24pLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgIDEgLQo+
ICB4ZW4vYXJjaC94ODYvdGltZS5jICAgICAgICAgIHwgMTYgKysrKysrLS0tLS0tLS0tLQo+ICB4
ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgIDEgLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IGluZGV4IGJlZDE5ZmMuLjk0
NTMxYmUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2RvbWFpbi5jCj4gQEAgLTUzOSw3ICs1MzksNiBAQCBpbnQgYXJjaF9kb21haW5fY3Jl
YXRlKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZkLT5hcmNo
LnJlbG1lbV9saXN0KTsKPiAgCj4gICAgICBzcGluX2xvY2tfaW5pdCgmZC0+YXJjaC5lODIwX2xv
Y2spOwo+IC0gICAgc3Bpbl9sb2NrX2luaXQoJmQtPmFyY2gudnRzY19sb2NrKTsKPiAgCj4gICAg
ICAvKiBNaW5pbWFsIGluaXRpYWxpc2F0aW9uIGZvciB0aGUgaWRsZSBkb21haW4uICovCj4gICAg
ICBpZiAoIHVubGlrZWx5KGlzX2lkbGVfZG9tYWluKGQpKSApCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4gaW5kZXggMjE2MTY5YS4uMjAy
NDQ2ZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L3RpbWUuYwo+IEBAIC0yMTMwLDE5ICsyMTMwLDE1IEBAIHU2NCBndHNjX3RvX2d0aW1lKHN0
cnVjdCBkb21haW4gKmQsIHU2NCB0c2MpCj4gIAo+ICB1aW50NjRfdCBwdl9zb2Z0X3JkdHNjKGNv
bnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAg
ewo+IC0gICAgc190aW1lX3Qgbm93ID0gZ2V0X3NfdGltZSgpOwo+ICsgICAgc190aW1lX3Qgb2xk
LCBuZXcsIG5vdyA9IGdldF9zX3RpbWUoKTsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5k
b21haW47Cj4gIAo+IC0gICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnZ0c2NfbG9jayk7Cj4gLQo+IC0g
ICAgaWYgKCAoaW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCApCj4gLSAgICAg
ICAgZC0+YXJjaC52dHNjX2xhc3QgPSBub3c7Cj4gLSAgICBlbHNlCj4gLSAgICAgICAgbm93ID0g
KytkLT5hcmNoLnZ0c2NfbGFzdDsKPiAtCj4gLSAgICBzcGluX3VubG9jaygmZC0+YXJjaC52dHNj
X2xvY2spOwo+ICsgICAgZG8gewo+ICsgICAgICAgIG9sZCA9IGQtPmFyY2gudnRzY19sYXN0Owo+
ICsgICAgICAgIG5ldyA9IChpbnQ2NF90KShub3cgLSBkLT5hcmNoLnZ0c2NfbGFzdCkgPiAwID8g
bm93IDogb2xkICsgMTsKCldoeSBkbyB5b3UgbmVlZCB0byBkbyB0aGlzIHN1YnRyYWN0aW9uPyBJ
c24ndCBpdCBlYXNpZXIgdG8ganVzdCBkbzoKCm5ldyA9IG5vdyA+IGQtPmFyY2gudnRzY19sYXN0
ID8gbm93IDogb2xkICsgMTsKClRoYXQgYXZvaWRzIHRoZSBjYXN0IGFuZCB0aGUgc3VidHJhY3Rp
b24uCgo+ICsgICAgfSB3aGlsZSAoIGNtcHhjaGcoJmQtPmFyY2gudnRzY19sYXN0LCBvbGQsIG5l
dykgIT0gb2xkICk7CgpJJ20gbm90IHN1cmUgaWYgdGhlIGZvbGxvd2luZyB3b3VsZCBiZSBzbGln
aHRseSBiZXR0ZXIgcGVyZm9ybWFuY2UKd2lzZToKCmRvIHsKICAgIG9sZCA9IGQtPmFyY2gudnRz
Y19sYXN0OwogICAgaWYgKCBkLT5hcmNoLnZ0c2NfbGFzdCA+PSBub3cgKQogICAgewogICAgICAg
IG5ldyA9IGF0b21pY19pbmNfcmV0dXJuKCZkLT5hcmNoLnZ0c2NfbGFzdCk7CiAgICAgICAgYnJl
YWs7CiAgICB9CiAgICBlbHNlCiAgICAgICAgbmV3ID0gbm93Owp9IHdoaWxlICggY21weGNoZygm
ZC0+YXJjaC52dHNjX2xhc3QsIG9sZCwgbmV3KSAhPSBvbGQgKTsKCkluIGFueSBjYXNlIEknbSBm
aW5lIHdpdGggeW91ciB2ZXJzaW9uIHVzaW5nIGNtcHhjaGcgZXhjbHVzaXZlbHkuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
