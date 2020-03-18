Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C722A1899D9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:47:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWBG-00030J-U7; Wed, 18 Mar 2020 10:44:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnqk=5D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEWBE-00030D-R0
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:44:08 +0000
X-Inumbo-ID: 64cddf34-6905-11ea-babf-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64cddf34-6905-11ea-babf-12813bfff9fa;
 Wed, 18 Mar 2020 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584528247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FiGMBTowFtV7r89OX39lqXOt/jWm/uUbRg7Psq/oNWQ=;
 b=I32HaopsyA5o1z6N8UhKPxtAeapd384I4DIfYlwNpQrpM2ODPJIqVlOz
 RhUQxCW1ddYdF2nncJ58Mc/3HJRN8uWBxP+ggpATs7mfYfDVFMEp77f+t
 6hST0XAHWczMwGYtCQhg7Hxj4S3qR5omJ0O7s6sQkK999Zs5/p2vW15Kj E=;
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
IronPort-SDR: 8r55597Rgf2ygKHXUSO4aFKq5cpg4R47U88ZkMXL7p0yTEtvTCjSvN4gxqU/KYJ+/wnOzbzef3
 hTsZMoyjWplPrsLJGPIHY+7XSVAJHyVBzfeFDvR3eAj/hcMQUQBoADc82jdldoWTYcBVqlt6rj
 wVr0l+j1FvZ8kGuPIf6apkDl+P6Fasv1yTtLWago6b2fMFxJlDCM5h1c9SzGBmoB5ONBrvFIGs
 ZcjrznE0oLNxJhYyIvRvRoqX0Gd9JtPwIyEf1mg3Yq14jjCnmITvhkBTQ7vM8kUAqANShXpIuz
 zO0=
X-SBRS: 2.7
X-MesageID: 14602968
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,566,1574139600"; d="scan'208";a="14602968"
Date: Wed, 18 Mar 2020 10:44:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200318104402.GC4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-17-anthony.perard@citrix.com>
 <e6d21a42-7a74-6ecd-4224-e093d289ee67@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6d21a42-7a74-6ecd-4224-e093d289ee67@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 16/23] xen/build: introduce
 if_changed and if_changed_rule
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDQ6NDU6MzZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBUaGUg
aWZfY2hhbmdlZCBtYWNybyBmcm9tIExpbnV4IGNhbiByZWNvcmQgdGhlIGNvbW1hbmQgdXNlZCB0
byBidWlsZCBhCj4gPiB0YXJnZXQgdGhlbiBjb21wYXJlIGl0IG9uIHJlYnVpbGQuIFRodXMgaWYg
YSBjb21tYW5kIGhhcyBjaGFuZ2VkLCBmb3IKPiA+IGV4YW1wbGUgZHVlIHRvIGludHJvZHVjaW5n
IG5ldyBmbGFncyBpbiBDRkxBR1Mgb3IgZHVlIHRvIHVzaW5nIGEKPiA+IGRpZmZlcmVudCBjb21w
aWxlciwgdGhlIHRhcmdldCB3aWxsIGJlIHJlYnVpbHQuCj4gCj4gQXMgdG8gdXNpbmcgYSBkaWZm
ZXJlbnQgY29tcGlsZXIgLSBJIHN1cHBvc2UgdGhpcyBtZWFucyAiYSBjb21waWxlcgo+IHdpdGgg
YSBkaWZmZXJlbnQgZXhlY3V0YWJsZSBuYW1lIiBoZXJlPyBXaGF0IGFib3V0IG1lIGhhdmluZywg
c2F5Cj4gZ2NjLTUgaW4gdXNlLCBhbmQgdGhlbiB1cGRhdGluZyBteSBzeXN0ZW0gc3VjaCB0aGF0
IGEgNS4yIGJhc2VkCj4gY29tcGlsZXIgb2YgdGhpcyBuYW1lIHdvdWxkIGJlIHVwZ3JhZGVkIHRv
IGEgNS40IGJhc2VkIG9uZSBvZiB0aGlzCj4gc2FtZSBuYW1lLiBJZiB0aGlzIG5ld2VyIGNvbXBp
bGVyIGhhcyBiZXR0ZXIgY2FwYWJpbGl0aWVzICh0aGF0IHdlCj4gd291bGQgd2FudCB0byB1c2Ug
aWYgYXZhaWxhYmxlKSwgd291bGQgdGhpcyBvciBhbnl0aGluZyBlbHNlIHRyaWdnZXIKPiBhIHJl
YnVpbGQgdGhlbiB0b28/CgpJIHRoaW5rIEkgc2hvdWxkIGhhdmUgd3JpdHRlbiAiY29tbWFuZCBs
aW5lIiBpbnN0ZWFkIG9mIGp1c3QgImNvbW1hbmQiLgpXaGVuIHdyaXRpbmcgYWJvdXQgImRpZmZl
cmVudCBjb21waWxlciIgSSB3YXMgbW9zdGx5IHRoaW5raW5nIGFib3V0IEdDQwp2cyBjbGFuZywg
bm90IHJlYWxseSBhYm91dCB2ZXJzaW9ucy4gSSB0aGluayBMaW51eCBoYXMgc29tZXRoaW5nIHRo
YXQKZGV0ZWN0cyB3aGVuIHRoZSBjb21waWxlciB2ZXJzaW9uIGNoYW5nZXMsIGJ1dCB0aGF0IG1h
eWJlIHRvIG9ubHkKdHJpZ2dlciBrY29uZmlnLCB0byByZWdlbmVyYXRlIHRoZSAuY29uZmlnIGZp
bGUuCgpCdXQgYXMgeW91IHNheSwgaWYgdGhlIG5ld2VyIGNvbXBpbGVyIGhhcyBiZXR0ZXIgY2Fw
YWJpbGl0aWVzLCBhbmQgdGhlCipGTEFHUyBhcmUgY2hhbmdlZCwgdGhlbiB0aGF0IHdvdWxkIHRy
aWdnZXIgYSByZWJ1aWxkIGlmIG90aGVyCmRlcGVuZGVuY3kgaGFzbid0IGNoYW5nZWQuCgpJJ2xs
IHRyeSB0byByZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlLCBhbmQgY29weSBzb21lIGRvY3VtZW50
YXRpb24gZnJvbQpMaW51eCwgc2luY2UgaXQgaGFzIHNvbWUgZm9yIHRoaXMuCgo+IAo+ID4gLS0t
IGEvLmdpdGlnbm9yZQo+ID4gKysrIGIvLmdpdGlnbm9yZQo+ID4gQEAgLTYsNiArNiw3IEBACj4g
PiAgKi5vCj4gPiAgKi5kCj4gPiAgKi5kMgo+ID4gKy4qLmNtZAo+ID4gICoub3BpYwo+ID4gICou
YQo+ID4gICouc28KPiAKPiBJIGFkbWl0IHRoZXNlIGVudHJpZXMgYXJlbid0IHNvcnRlZCB2ZXJ5
IHdlbGwsIGJ1dCBhbnl3YXkgLSBob3cKPiBkaWQgeW91IGVuZCB1cCB3aXRoIHRoaXMgaW5zZXJ0
aW9uIHBvaW50PyBUaGVyZSBhcmUgZW50cmllcwoKSSBiYXNpY2FsbHkgcHV0IGl0IHdpdGggdGhl
IG90aGVyIGRlcGVuZGVuY3kgZmlsZXMsICouZCBhbmQgKi5kMi4KCj4gc3RhcnRpbmcgd2l0aCAu
IGF0IHRoZSB2ZXJ5IHRvcCBvZiB0aGUgZmlsZS4gKEFzIGFuIGFzaWRlLCBJCj4gd29uZGVyIHdo
eSBpdCdzICouZCBhbmQgKi5kMiByYXRoZXIgdGhhbiAuKi5kIGFuZCAuKi5kMiAuKQoKSSdsbCBt
b3ZlIC4qLmNtZCB0byB0aGUgdG9wIGFuZCBpZ25vcmUgdGhhdCAuZ2l0aWdub3JlIGlnbm9yZSBt
b3JlCnRoYW4gbmVjZXNzYXJ5LgoKPiA+IC0tLSBhL3hlbi9NYWtlZmlsZQo+ID4gKysrIGIveGVu
L01ha2VmaWxlCj4gPiBAQCAtNTIsNyArNTIsNTcgQEAgZGlzdDogaW5zdGFsbAo+ID4gK2lmbmVx
ICgkKGZpbmRzdHJpbmcgcywkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkpLCkKPiA+ICsg
IHF1aWV0PXNpbGVudF8KPiA+ICtlbmRpZgo+IAo+IFRocm91Z2hvdXQgdGhlIGFib3ZlLCBjYW4g
dGhlIHVzZXMgb2YgPSBwbGVhc2UgYmVjb21lIGNvbnNpc3RlbnQ/Cj4gUHJlZmVyYWJsZSBhbGwg
d2l0aCBhIGJsYW5rIG9uIHRoZSBsZWZ0IGFuZCAtIHVubGVzcyB0aGVyZSdzIG5vCj4gdmFsdWUg
Z2V0dGluZyBhc3NpZ25lZCAtIG9uZSBvbiB0aGUgcmlnaHQsIHBsdXMgOj0gcHJlZmVycmVkIG92
ZXIKPiA9IHdoZXJlIG5vdCBwcm9oaWJpdGVkIGJ5IG90aGVyIGNvbnN0cmFpbnRzIChub25lIGhl
cmUgYWZhaWNzKS4KCkknbGwgdHJ5LgoKPiA+IC0tLSBhL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNs
dWRlCj4gPiArKysgYi94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQo+ID4gQEAgLTIsMTEgKzIs
MzAgQEAKPiA+ICAjIyMjCj4gPiAgIyBrYnVpbGQ6IEdlbmVyaWMgZGVmaW5pdGlvbnMKPiA+ICAK
PiA+ICsjIENvbnZlbmllbnQgdmFyaWFibGVzCj4gPiArc3F1b3RlICA6PSAnCj4gPiArZW1wdHkg
ICA6PQo+ID4gK3NwYWNlICAgOj0gJChlbXB0eSkgJChlbXB0eSkKPiA+ICtzcGFjZV9lc2NhcGUg
Oj0gXy1fU1BBQ0VfLV8KPiA+ICtwb3VuZCA6PSBcIwo+IAo+IE5pdDogVG8gZml0IHdpdGggdGhl
IHRocmVlIG9uZXMgYWJvdmUgc3BhY2VfZXNjYXBlIHlvdSB3YW50IHRvCj4gYWRkIHR3byBibGFu
a3MgaGVyZS4KCldpbGwgZG8uCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
