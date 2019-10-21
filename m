Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CDDE8F5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 12:04:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMUUe-0002Um-26; Mon, 21 Oct 2019 10:00:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMUUc-0002Ug-OW
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 10:00:50 +0000
X-Inumbo-ID: a82535e8-f3e9-11e9-9448-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a82535e8-f3e9-11e9-9448-12813bfff9fa;
 Mon, 21 Oct 2019 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571652049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vRQYSyUkaLUt11qLtYwiLIxKMDIyKLo7eiD35u/nN0s=;
 b=K3QNbfYPRFJqKhc/WFgy57myazlzWe0DWOUUY95vxnAKRQhCYvqsFaxS
 MajBpjb0YVryxo90t9z+w0dYw09/DlKiZj0n7IIZuzom82RlCpc2ccyH1
 k+lJhRd6RB4FSnsiaRSkvlWjJ7/icwXUw11N0+FjwQg47WqgtUI43c7mv Y=;
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
IronPort-SDR: lyDcHOuI/1C4Xu9/Wv/J9CeG/l3rjKDa+LL93HF0iVn1HQDl9DDW5wWHfEj7MViEjgDppXfkkC
 V9f0+0/YiWw8sQ57iNFAjlCK+FMwX4OgVGlePbF6JdKnjtii7xhb187JymmSq3msocCt0ZkTBn
 J6eT9xKmqzavPmhFVU/JzHOGsXoOr1dJwFUixAMdjn7wZhvZupjLAqQwAqudJHuK9SVxYwV6Qa
 gTr47tK2cEiHyQCSEGtP79kQa6KYEnS9FI6SyE9juk7tkcv8yq4KpOXGTHRaIEIsSE1+dVUsEc
 1as=
X-SBRS: 2.7
X-MesageID: 7484420
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7484420"
Date: Mon, 21 Oct 2019 12:00:38 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191021100038.GG17494@Air-de-Roger>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-9-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930150044.5734-9-liuwe@microsoft.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-next v2 8/9] x86: be more verbose when
 running on a hypervisor
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDQ6MDA6NDJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgICAgICB8IDUgKysrKysKPiAgeGVuL2Fy
Y2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgfCA2ICsrKysrLQo+ICB4ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDIgKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
Cj4gaW5kZXggMzA0NTNiNmE3YS4uODE2MWIyNmM1YSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlz
b3IuYwo+IEBAIC00Myw2ICs0MywxMSBAQCBib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkKPiAg
ICAgIHJldHVybiAhIWhvcHM7Cj4gIH0KPiAgCj4gK2NvbnN0IGNoYXIgKmh5cGVydmlzb3JfbmFt
ZSh2b2lkKQo+ICt7CgpJIHdvdWxkIG1heWJlIGFkZCBBU1NFUlQoaG9wcyk7Cgo+ICsgICAgcmV0
dXJuIGhvcHMtPm5hbWU7Cj4gK30KPiArCj4gIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQo+
ICB7Cj4gICAgICBpZiAoIGhvcHMgJiYgaG9wcy0+c2V0dXAgKQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gaW5kZXggMGVlMTFiMTVh
Ni4uY2Y1YTdiOGUxZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAgLTY4OSw2ICs2ODksNyBAQCB2b2lkIF9faW5pdCBu
b3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ICAgICAgaW50IGksIGos
IGU4MjBfd2FybiA9IDAsIGJ5dGVzID0gMDsKPiAgICAgIGJvb2wgYWNwaV9ib290X3RhYmxlX2lu
aXRfZG9uZSA9IGZhbHNlLCByZWxvY2F0ZWQgPSBmYWxzZTsKPiAgICAgIGludCByZXQ7Cj4gKyAg
ICBib29sIHJ1bm5pbmdfb25faHlwZXJ2aXNvcjsKPiAgICAgIHN0cnVjdCBuczE2NTUwX2RlZmF1
bHRzIG5zMTY1NTAgPSB7Cj4gICAgICAgICAgLmRhdGFfYml0cyA9IDgsCj4gICAgICAgICAgLnBh
cml0eSAgICA9ICduJywKPiBAQCAtNzYzLDcgKzc2NCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJu
IF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAgKiBhbGxvY2luZyBhbnkg
eGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBtZW1vcnkuICovCj4gICAgICBrZXhl
Y19lYXJseV9jYWxjdWxhdGlvbnMoKTsKPiAgCj4gLSAgICBoeXBlcnZpc29yX3Byb2JlKCk7Cj4g
KyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSBoeXBlcnZpc29yX3Byb2JlKCk7Cj4gIAo+ICAg
ICAgcGFyc2VfdmlkZW9faW5mbygpOwo+ICAKPiBAQCAtNzg5LDYgKzc5MCw5IEBAIHZvaWQgX19p
bml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gIAo+ICAgICAg
cHJpbnRrKCJYZW4gaW1hZ2UgbG9hZCBiYXNlIGFkZHJlc3M6ICUjbHhcbiIsIHhlbl9waHlzX3N0
YXJ0KTsKPiAgCj4gKyAgICBpZiAoIHJ1bm5pbmdfb25faHlwZXJ2aXNvciApCj4gKyAgICAgICAg
cHJpbnRrKCJSdW5uaW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX25hbWUoKSk7Cj4gKwo+ICAjaWZk
ZWYgQ09ORklHX1ZJREVPCj4gICAgICBwcmludGsoIlZpZGVvIGluZm9ybWF0aW9uOlxuIik7Cj4g
IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gaW5kZXggMzgzNDRlMmU4
OS4uYTdkNzViZjljZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5o
Cj4gQEAgLTM2LDYgKzM2LDcgQEAgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpOwo+ICB2b2lk
IGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7Cj4gIHZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lk
KTsKPiAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKTsKPiArY29uc3QgY2hhciAqaHlwZXJ2
aXNvcl9uYW1lKHZvaWQpOwo+ICAKPiAgI2Vsc2UKPiAgCj4gQEAgLTQ1LDYgKzQ2LDcgQEAgc3Rh
dGljIGlubGluZSBib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0K
PiAgc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkge30KPiAgc3RhdGlj
IGlubGluZSB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkge30KPiAgc3RhdGljIGlubGlu
ZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHt9Cj4gK3N0YXRpYyBpbmxpbmUgY2hhciAq
aHlwZXJ2aXNvcl9uYW1lKHZvaWQpIHsgcmV0dXJuIE5VTEw7IH0KCkkgdGhpbmsgeW91IHdhbnQg
YW4gQVNTRVJUX1VOUkVBQ0hBQkxFIGhlcmUsIHNpbmNlIGh5cGVydmlzb3JfbmFtZQpzaG91bGRu
J3QgYmUgY2FsbGVkIHVubGVzcyBYZW4gaGFzIGRldGVjdGVkIHRoYXQncyBydW5uaW5nIGFzIGEg
Z3Vlc3QsCndoaWNoIGNhbiBvbmx5IGhhcHBlbiBpZiBDT05GSUdfR1VFU1QgaXMgc2VsZWN0ZWQu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
