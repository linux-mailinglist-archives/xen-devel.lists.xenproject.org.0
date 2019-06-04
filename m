Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1B34FD5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 20:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYEAa-0006tX-8V; Tue, 04 Jun 2019 18:28:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYEAX-0006tS-Vo
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 18:28:22 +0000
X-Inumbo-ID: 875abe4e-86f6-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 875abe4e-86f6-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 18:28:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y80ozPPz2Ix4YM+yC6K8jSSVd9K1++Y8q/dK8Eig86LfSzxIXZm/Z9A/hJuYFYyvBh3nfKi2h3
 olkDNYR6ytxN2ePT/TbFDTSO5J26JrTBTD6bd2Y/opx1g4Zf7xfxgTNv3N7+FCWPIIllFdvB5A
 e2JjChJ1qSSt8uc2LC94BD7VVy9eS8MEXz4zvyf6mzQILSe7D47SK4ZWdJXIptIhe/CPJcbizR
 KfNeNxaAVDPNbU/04HggRQ9kUeTD5f3QQT3QhSUyAbBcTmg8bHo/MU+lvEZrKP1835m7Kpp7z6
 GJU=
X-SBRS: 2.7
X-MesageID: 1309613
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1309613"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.47139.259170.371610@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 19:27:47 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906041059430.14041@sstabellini-ThinkPad-T480s>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
 <23798.45032.193051.369884@mariner.uk.xensource.com>
 <alpine.DEB.2.21.1906041059430.14041@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbcWVtdS11cHN0cmVh
bS00LjExLXRlc3RpbmcgdGVzdF0gMTM2MTg0OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBJIGFn
cmVlIHdpdGggeW91IGl0IHdvdWxkIGJlIGRlc2lyYWJsZSB0byB0ZXN0IGJvdGggTElWRVBBVENI
IGFuZAo+IG5vbi1MSVZFUEFUQ0gsIGFuZCBJIHVuZGVyc3RhbmQgYWJvdXQgbGltaXRhdGlvbiBv
ZiByZXNvdXJjZXMgYW5kIHRlc3QKPiBtYXRyaXggZXhwbG9zaW9uLgo+IAo+IEdpdmVuIHRoZSBj
aGFuY2UsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGhhZCBhbiBleHBsaWNpdCB0
ZXN0Cj4gYWJvdXQgTElWRVBBVENIIHJhdGhlciB0aGFuIGEgImhpZGRlbiIgZW5hYmxlbWVudCBv
ZiBpdCB3aXRoaW4gYW5vdGhlcgo+IGRpZmZlcmVudCB0ZXN0LiBPciBtYXliZSBqdXN0IGNhbGwg
aXQgb3V0IGV4cGxpY2l0bHksIHJlbmFtaW5nIHRoZSB0ZXN0Cj4gcnVuIHRvIHFlbXUtdXBzdHJl
YW0tbGl2ZXBhdGNoIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIEluIGFueSBjYXNlLCBJJ2xsCj4g
bGVhdmUgaXQgdG8geW91LgoKSSB0aGluayBtYXliZSB5b3UgaGF2ZSBtaXN1bmRlcnN0b29kID8K
ClRoZSB0aGluZyB0aGF0IHRyaWdnZXJzIHRoaXMgYnVnLCBoZXJlLCBpcyAqY29tcGlsaW5nKiBY
ZW4gd2l0aApDT05GSUdfTElWRVBBVENIICpkaXNhYmxlZCouCgpTbywgaW4gZmFjdCwgaWYgaXQg
aXMgYSBoaWRkZW4gYW55dGhpbmcsIGl0IGlzIGEgaGlkZGVuICpkaXMqYWJsZW1lbnQKb2YgYSBm
ZWF0dXJlIHdoaWNoIGlzIGRlbGliZXJhdGVseSBvbmx5IGNvbXBpbGVkIGluLCBhbmQgb25seSB0
ZXN0ZWQKb24sIHRlc3RzIG9mIHRoZSB4ZW4tKiBicmFuY2hlcy4KClRoYXQgKmRpc2FibGluZyog
dGhpcyBmZWF0dXJlIHdvdWxkIGNhdXNlIGEgcmVncmVzc2lvbiBpcyBzdXJwcmlzaW5nLAphbmQg
SSB0aGluayB0aGlzIGlzIG9ubHkgdGhlIGNhc2UgYmVjYXVzZSBYZW4gb25seSB3b3JrcyBieSBh
Y2NpZGVudApvbiB0aGVzZSBib3hlcyA/ICAoQ29uc2lkZXJpbmcgdGhlIGRpc2N1c3Npb24gb2Yg
QVJNIEFSTSB2aW9sYXRpb25zLikKClRvIG1ha2UgaXQgYW4gImV4cGxpY2l0IiB0ZXN0IGFzIHlv
dSBzdWdnZXN0IHdvdWxkIGludm9sdmUgY29tcGlsaW5nClhlbiBhbiBhZGRpdGlvbmFsIHRpbWUu
ICBJIGd1ZXNzIHRoYXQgd291bGQgYWN0dWFsbHkgYmUgY2hhbmdpbmcgc29tZQp0ZXN0cyBvbiB4
ZW4tKiBicmFuY2hlcyB0byBhIHZlcnNpb24gb2YgWGVuIGNvbXBpbGVkICp3aXRob3V0KgpsaXZl
cGF0Y2guICBSaWdodCBub3cgd2UgYnVpbGQKCm1vc3Qgb3RoZXIgYnJhbmNoZXMKICAgWGVuIGFt
ZDY0ICB3aXRoIFhTTSAgIG5vIGxpdmVwYXRjaAogICBYZW4gYXJtaGYgIG5vICAgWFNNICAgbm8g
bGl2ZXBhdGNoCiAgIFhlbiBhcm02NCAgd2l0aCBYU00gICBubyBsaXZlcGF0Y2gKCnhlbi0qIGJy
YW5jaGVzCiAgIFhlbiBhbWQ2NCAgd2l0aCBYU00gICB3aXRoIGxpdmVwYXRjaAogICBYZW4gYXJt
aGYgIG5vICAgWFNNICAgd2l0aCBsaXZlcGF0Y2gKICAgWGVuIGFybTY0ICB3aXRoIFhTTSAgIHdp
dGggbGl2ZXBhdGNoCgpXaGF0IHdpdGhvdXQtbGl2ZXBhdGNoIGJ1aWxkIHNob3VsZCBiZSBhZGRl
ZCB0byB0aGUgeGVuLSogYnJhbmNoZXMgPwpBbmQgaW4gd2hpY2ggdGVzdHMgc2hvdWxkIGl0IHJl
cGxhY2UgdGhlIGV4aXN0aW5nIHdpdGgtbGl2ZXBhdGNoCmJ1aWxkcyA/ICBTaG91bGQgSSBqdXN0
IHBpY2sgb25lIG9yIHR3byBhcHBhcmVudGx5IGF0IHJhbmRvbSA/CgpOQiB0aGF0IEkgZG91YnQg
dGhlIGxpdmVwYXRjaCBtYWludGFpbmVycyBoYXZlIG11Y2ggb2YgYW4gb3BpbmlvbgpoZXJlLiAg
V2Ugd291bGQgbm9ybWFsbHkgZXhwZWN0IHRoYXQgY29tcGlsaW5nIGluIGxpdmVwYXRjaGluZyBt
aWdodApicmVhayBzb21ldGhpbmcgYnV0IHRoYXQgY29tcGlsaW5nIGl0IG91dCB3b3VsZCBiZSBm
aW5lLiAgU28gdGhlCmN1cnJlbnQgc2l0dWF0aW9uIGlzIGdvb2QgZnJvbSB0aGF0IHBvaW50IG9m
IHZpZXcgYW5kIHdlIG1pZ2h0IGV2ZW4Kd29ycnkgdGhhdCBjaGFuZ2luZyBzb21lIG9mIHRoZSBl
eGlzdGluZyB0ZXN0cyB0byBub3QgaGF2ZQpsaXZlcGF0Y2hpbmcgY29tcGlsZWQgaW4gbWlnaHQg
bWlzcyBzb21lIGFjdHVhbCBsaXZlcGF0Y2gtcmVsYXRlZApidWdzLiAgTXkgbm9ybWFsIHByYWN0
aWNlIGlzIHRvIHRyeSB0byBlbmFibGUgYXMgbXVjaCBhcyBpcyByZWxldmFudAphbmQgbWlnaHQg
YnJlYWsgdGhpbmdzLgoKQnV0IHdoYXQgd2UgaGF2ZSBoZXJlIGlzICpub3QqIGEgbGl2ZXBhdGNo
LXJlbGF0ZWQgYnVnLiAgSXQgaGFzCm5vdGhpbmcgdG8gZG8gd2l0aCBsaXZlcGF0Y2guICBJdCBp
cyBqdXN0IHRoYXQgYnkgbHVjaywgY29tcGlsaW5nIFhlbgoqd2l0aCogbGl2ZXBhdGNoaW5nIHNv
bWVob3cgbWFza3MgdGhlIHJhbmRvbSBmYWlsdXJlLCBwcmVzdW1hYmx5IGJ5CmNoYW5naW5nIGV4
YWN0IG9yZGVyaW5ncyBhbmQgdGltaW5ncyBvZiBtZW1vcnkgYWNjZXNzZXMgZXRjLgoKRG9lcyB0
aGF0IG1ha2Ugc2Vuc2UgPwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
