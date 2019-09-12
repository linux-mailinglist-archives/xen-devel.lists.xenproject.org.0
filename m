Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A493CB0E3C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NXD-00047g-OX; Thu, 12 Sep 2019 11:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8NXC-00047b-6m
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:45:10 +0000
X-Inumbo-ID: c583b67e-d552-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c583b67e-d552-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568288709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3u7uzzImDOoyDfqvkbFbBgRMi0Be+omF5sr0aHi4ahQ=;
 b=aNBrXIVStIZDcKaLdFqZ8kpzvG3yuQjol3qIep1bT34cBVjihMNjBH03
 TqsOAv4n2XnhVrhsGi4YGLrhJDbk1Nw3cwxXNJfgCCGBxg2eq5iU5g8pk
 N/eueDS4YThRXO4RCCC3pngL1l3g0+XVa/kefUYCc8NBka2thm7DoSqe2 k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +BkDgZkuQBvv76aA17uhur85MK0neYoEdt4wSBC2hbEUY+6rtHDu4cTrDNpictc0OcphOHGzQa
 DrC8PcmsfxAFaRXWDnDEKfP7DSdc5hXwgNt9iCg25NnvjaVI0eyJtubb272Icne6HhRG7NO0NT
 yYuzoLoIuzYWZSM6f6ZtzHH2WAw5ojuxcBxzdObqyOmckHxGYyx1JI2JUX8QvmG23CbSFxMEKg
 98GJN0pI1Xc3nGEFRrpG8HuiipA3j9skaEwigsRnW881ENOB0k1gjU0yDsQ+GAv0AcRPH/M3cK
 Z6I=
X-SBRS: 2.7
X-MesageID: 5673782
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5673782"
Date: Thu, 12 Sep 2019 13:45:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912114502.ietnlugtxmazfgzi@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <30619001-ca6c-0450-a0bb-4d71687b281a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30619001-ca6c-0450-a0bb-4d71687b281a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/9] x86/HVM: refuse CR3 loads with reserved
 (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjQ6NDFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgYml0cyAxMSBhbmQgYmVsb3cgYXJlLCBpZiBub3QgdXNlZCBmb3Igb3RoZXIg
cHVycG9zZXMsIHJlc2VydmVkCj4gYnV0IGlnbm9yZWQsIGJpdHMgYmV5b25kIHBoeXNpY2FsIGFk
ZHJlc3Mgd2lkdGggYXJlIHN1cHBvc2VkIHRvIHJhaXNlCj4gZXhjZXB0aW9ucyAoYXQgbGVhc3Qg
aW4gdGhlIG5vbi1uZXN0ZWQgY2FzZTsgSSdtIG5vdCBjb252aW5jZWQgdGhlCj4gY3VycmVudCBu
ZXN0ZWQgU1ZNL1ZNWCBiZWhhdmlvciBvZiByYWlzaW5nICNHUCgwKSBoZXJlIGlzIGNvcnJlY3Qs
IGJ1dAo+IHRoYXQncyBub3QgdGhlIHN1YmplY3Qgb2YgdGhpcyBjaGFuZ2UpLgo+IAo+IEludHJv
ZHVjZSBjdXJyZCBhcyBhIGxvY2FsIHZhcmlhYmxlLCBhbmQgcmVwbGFjZSBvdGhlciB2LT5kb21h
aW4KPiBpbnN0YW5jZXMgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpMR1RNLCBqdXN0IHR3byBjb21tZW50cyB3aGlj
aCBhcmUgbm90IHJlbGF0ZWQgdG8gZnVuY3Rpb25hbGl0eSwgc286CgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gQEAgLTEwMDQs
NiArMTAwNCwxMyBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9jdHh0KHN0cnVjdCBkb21hCj4g
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICB9Cj4gIAo+ICsgICAgaWYgKCBjdHh0LmNy
MyAmIH4oKDFVTCA8PCBkLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRyKSAtIDEpICkKPiAr
ICAgIHsKPiArICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJIVk0lZCByZXN0b3JlOiBiYWQg
Q1IzICUjIiBQUkl4NjQgIlxuIiwKCmdwcmludGsgd291bGQgYmUgbW9yZSBuYXR1cmFsIGhlcmUg
SU1PLgoKPiArICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBjdHh0LmNyMyk7Cj4gKyAgICAg
ICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOwo+ICsgICAgfQo+ICsKPiAgICAgIGlmICggKGN0
eHQuZmxhZ3MgJiB+WEVOX1g4Nl9GUFVfSU5JVElBTElTRUQpICE9IDAgKQo+ICAgICAgewo+ICAg
ICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwgImJhZCBmbGFncyB2YWx1ZSBpbiBDUFUgY29udGV4
dDogJSN4XG4iLAo+IEBAIC0yMjkwLDEwICsyMjk3LDE5IEBAIGludCBodm1fc2V0X2NyMCh1bnNp
Z25lZCBsb25nIHZhbHVlLCBib28KPiAgaW50IGh2bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFs
dWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIpCj4gIHsKPiAgICAgIHN0cnVjdCB2Y3B1
ICp2ID0gY3VycmVudDsKPiArICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOwo+
ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiAgICAgIHVuc2lnbmVkIGxvbmcgb2xkID0g
di0+YXJjaC5odm0uZ3Vlc3RfY3JbM107Cj4gIAo+IC0gICAgaWYgKCBtYXlfZGVmZXIgJiYgdW5s
aWtlbHkodi0+ZG9tYWluLT5hcmNoLm1vbml0b3Iud3JpdGVfY3RybHJlZ19lbmFibGVkICYKPiAr
ICAgIGlmICggdmFsdWUgJiB+KCgxVUwgPDwgY3VycmQtPmFyY2guY3B1aWQtPmV4dGQubWF4cGh5
c2FkZHIpIC0gMSkgKQoKSSB3b3VsZCBjb25zaWRlciBpbnRyb2R1Y2luZyBhIG1hY3JvL2lubGlu
ZSBoZWxwZXIgZm9yIHRoaXMsIHNpbmNlCml0J3MgYWxyZWFkeSB1c2VkIHR3aWNlIGluIHRoaXMg
cGF0Y2guCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
