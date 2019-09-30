Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F5C1F50
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:40:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt4L-0003wZ-T3; Mon, 30 Sep 2019 10:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iEt4K-0003wL-W2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:38:17 +0000
X-Inumbo-ID: 68e53026-e36e-11e9-96ce-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 68e53026-e36e-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569839897;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IC1nCu2hdokWczROJgPu6c30MxmFc+IkxXWkthU4jCw=;
 b=DY0esaKJsgDd66JzoYyl6Qe+WBpXK4xVXv6b7VdjUG8yD8eiAXQFqzv6
 CpD9cIWnkpOg769+vpxri8Y4f/TM2dQuLChw17dXhpdbchtc9LMf/qxM1
 5HDSR7NvErIFE0frnFFw6GBB81B06jd3EBkFXNCk/JEfdGKlKd8xe9ANw M=;
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
IronPort-SDR: 965uypMZuvNsj+TF9KrT4hfkKLuK4Uv3kNbEhqw4E/ecsU/oK1/st3cXKthmAM5mjV2C6JB9zQ
 WRJIVhXskepROL257xdTPuuM1Xexk/tDPpdBntmvjqqdK4mwnwD8d9eqL/7b367TN92xv1oKv/
 Vn2y73AXlQEwNNzJ+ySXHFqdSyP3evWjG0FabPhMnOiAEStC6QgQqfOfhs9EK/WvLpH8kts/ZH
 ET1pX0/0Ojd1/BoNJ4WtUqfMRSE4l4Yxv8LPxMYbV2asbKOXSima0sKa9IO2bxYiatUxbHPJTB
 J08=
X-SBRS: 2.7
X-MesageID: 6248634
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6248634"
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
 <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
Date: Mon, 30 Sep 2019 11:38:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDkvMjAxOSAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDkuMjAxOSAw
NzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2hlbiBzd2l0Y2hpbmcgc2NoZWQgdW5pdHMg
c3luY2hyb25pemUgYWxsIHZjcHVzIG9mIHRoZSBuZXcgdW5pdCB0byBiZQo+PiBzY2hlZHVsZWQg
YXQgdGhlIHNhbWUgdGltZS4KPj4KPj4gQSB2YXJpYWJsZSBzY2hlZF9ncmFudWxhcml0eSBpcyBh
ZGRlZCB3aGljaCBob2xkcyB0aGUgbnVtYmVyIG9mIHZjcHVzCj4+IHBlciBzY2hlZHVsZSB1bml0
Lgo+Pgo+PiBBcyB0YXNrbGV0cyByZXF1aXJlIHRvIHNjaGVkdWxlIHRoZSBpZGxlIHVuaXQgaXQg
aXMgcmVxdWlyZWQgdG8gc2V0IHRoZQo+PiB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkIHBhcmFtZXRl
ciBvZiBkb19zY2hlZHVsZSgpIHRvIHRydWUgaWYgYW55IGNwdQo+PiBjb3ZlcmVkIGJ5IHRoZSBj
dXJyZW50IHNjaGVkdWxlKCkgY2FsbCBoYXMgYW55IHBlbmRpbmcgdGFza2xldCB3b3JrLgo+Pgo+
PiBGb3Igam9pbmluZyBvdGhlciB2Y3B1cyBvZiB0aGUgc2NoZWR1bGUgdW5pdCB3ZSBuZWVkIHRv
IGFkZCBhIG5ldwo+PiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4gb3JkZXIgdG8gaGF2
ZSBhIHdheSB0byBpbml0aWF0ZSBhCj4+IGNvbnRleHQgc3dpdGNoIHdpdGhvdXQgY2FsbGluZyB0
aGUgZ2VuZXJpYyBzY2hlZHVsZSgpIGZ1bmN0aW9uCj4+IHNlbGVjdGluZyB0aGUgdmNwdSB0byBz
d2l0Y2ggdG8sIGFzIHdlIGFscmVhZHkga25vdyB3aGljaCB2Y3B1IHdlCj4+IHdhbnQgdG8gcnVu
LiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBhbnkgb3RoZXIKPj4g
Y29uY3VycmVudCBTQ0hFRFVMRV9TT0ZUSVJRIGV2ZW50cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogRGFyaW8gRmFn
Z2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiB4ODYgYW5kIGFwcGxpY2FibGUgY29tbW9uIGNv
ZGUgcGFydHMKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4g
SG93ZXZlciwgLi4uCj4KPj4gK3N0YXRpYyB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoKHN0cnVj
dCB2Y3B1ICp2cHJldiwgc3RydWN0IHZjcHUgKnZuZXh0LAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc190aW1lX3Qgbm93KQo+PiArewo+PiArICAgIGlmICggdW5saWtlbHko
dnByZXYgPT0gdm5leHQpICkKPj4gICAgICB7Cj4+IC0gICAgICAgIHBjcHVfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCBjcHUpOwo+PiAgICAgICAgICBUUkFDRV80RChUUkNfU0NIRURfU1dJVENI
X0lORkNPTlQsCj4+IC0gICAgICAgICAgICAgICAgIG5leHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBu
ZXh0LT51bml0X2lkLAo+PiAtICAgICAgICAgICAgICAgICBub3cgLSBwcmV2LT5zdGF0ZV9lbnRy
eV90aW1lLAo+PiAtICAgICAgICAgICAgICAgICBwcmV2LT5uZXh0X3RpbWUpOwo+PiAtICAgICAg
ICB0cmFjZV9jb250aW51ZV9ydW5uaW5nKG5leHQtPnZjcHVfbGlzdCk7Cj4+IC0gICAgICAgIHJl
dHVybiBjb250aW51ZV9ydW5uaW5nKHByZXYtPnZjcHVfbGlzdCk7Cj4+ICsgICAgICAgICAgICAg
ICAgIHZuZXh0LT5kb21haW4tPmRvbWFpbl9pZCwgdm5leHQtPnNjaGVkX3VuaXQtPnVuaXRfaWQs
Cj4+ICsgICAgICAgICAgICAgICAgIG5vdyAtIHZwcmV2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90
aW1lLAo+PiArICAgICAgICAgICAgICAgICB2cHJldi0+c2NoZWRfdW5pdC0+bmV4dF90aW1lKTsK
Pj4gKyAgICAgICAgc2NoZWRfY29udGV4dF9zd2l0Y2hlZCh2cHJldiwgdm5leHQpOwo+PiArICAg
ICAgICB0cmFjZV9jb250aW51ZV9ydW5uaW5nKHZuZXh0KTsKPj4gKyAgICAgICAgcmV0dXJuIGNv
bnRpbnVlX3J1bm5pbmcodnByZXYpOwo+PiAgICAgIH0KPiAuLi4gSSBkb24ndCByZWNhbGwgaWYg
dGhlcmUgd2VyZW4ndCBjb21waWxlciAoY2xhbmc/KSB2ZXJzaW9ucyBub3QKPiBhbGxvd2luZyAo
b3IgYXQgbGVhc3Qgd2FybmluZyBhYm91dCkgdXNlIG9mIHRoaXMgZXh0ZW5zaW9uLgoKV2hpY2gg
ZXh0ZW5zaW9uPwoKPiBJJ20KPiBoYXZpbmcgZGlmZmljdWx0eSB0aGlua2luZyBvZiBhIHdheSB0
byBmaW5kIGEgcG9zc2libGUgZXhhbXBsZSB1c2UKPiBlbHNld2hlcmUgaW4gb3VyIGNvZGUsIHBy
b3ZpbmcgdGhhdCB0aGlzIGlzbid0IHRoZSBmaXJzdCBpbnN0YW5jZS4KPiBIZW5jZSBJIHdvbmRl
ciB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBhdm9pZCB1c2Ugb2YgdGhlCj4gZXh0
ZW5zaW9uIGhlcmUuCgpHaXRsYWIgY2FuIGdpdmUgdXMgdGhlIGFuc3dlciBlYXNpbHkuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
