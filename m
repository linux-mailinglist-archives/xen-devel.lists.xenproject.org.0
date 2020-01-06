Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF493131356
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 15:08:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioSx6-0000et-Nx; Mon, 06 Jan 2020 14:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HznK=23=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ioSx5-0000eo-CJ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 14:01:51 +0000
X-Inumbo-ID: 15c6fc28-308d-11ea-ab0c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15c6fc28-308d-11ea-ab0c-12813bfff9fa;
 Mon, 06 Jan 2020 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578319311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5cJInDdCyQPt0zeYdJmCcmrPcUZ+FZcJglc9PtAzA8k=;
 b=Qs8NqIRtDjI8vLKegP+bduri878LgqoBL/ybCI2Jkzg3gw2q3gdzLCdG
 ap441FJ5qhtdp+AX2dl0RnQbuWO7P/Uq7cpPw5uxFbyd2QX8lCme4jLJQ
 POVrJbXKQdTp6/9b9eZz9hVqClsL2HJq+eoYA0kr91Ro0bMQ0jUheMnrj Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7l/pZwGFRy9ERfIh13QGlcFvjiGL1nPIDa3A4iRzu//g+UZSTap0qL/u01+g0kFa8oW/cCjE2m
 tzdXOuAboXdu4TWPyh7zAvY3c9cVT2BghOqwB9THqpN7DD5fS6fkQHjqbGm5v82r3kW/79NDx/
 GjprRHuY6I/q+8jBjccptLVbCvYQNsw47GKuIZLl7O7qUlqOdvT0EBDrBJOIU4h4l4Kf14SJPR
 fHRKACVIOJVTY/IEWyXM70azLWvlt+kkW+j+N/RLRYjM16MOEXid3+ua2+U1bIIzfg71KoZjB/
 b+E=
X-SBRS: 2.7
X-MesageID: 10481978
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10481978"
Date: Mon, 6 Jan 2020 14:01:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200106140147.GI1267@perard.uk.xensource.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <20191217105901.68158-3-anthony.perard@citrix.com>
 <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 2/6] xen: Have Kconfig check $(CC)'s
 version
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

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDU6NDI6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMTIuMjAxOSAxMTo1OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vS2NvbmZpZwo+ID4gKysrIGIveGVuL0tjb25maWcKPiA+IEBAIC00LDkgKzQsMjYgQEAK
PiA+ICAjCj4gPiAgbWFpbm1lbnUgIlhlbi8kKFNSQ0FSQ0gpICQoWEVOX0ZVTExWRVJTSU9OKSBD
b25maWd1cmF0aW9uIgo+ID4gIAo+ID4gK3NvdXJjZSAic2NyaXB0cy9LY29uZmlnLmluY2x1ZGUi
Cj4gPiArCj4gPiAgY29uZmlnIEJST0tFTgo+ID4gIAlib29sCj4gPiAgCj4gPiArY29uZmlnIEND
X0lTX0dDQwo+ID4gKwlkZWZfYm9vbCAkKHN1Y2Nlc3MsJChDQykgLS12ZXJzaW9uIHwgaGVhZCAt
biAxIHwgZ3JlcCAtcSBnY2MpCj4gPiArCj4gPiArY29uZmlnIEdDQ19WRVJTSU9OCj4gPiArCWlu
dAo+ID4gKwlkZWZhdWx0ICQoc2hlbGwsJChCQVNFRElSKS9zY3JpcHRzL2djYy12ZXJzaW9uLnNo
ICQoQ0MpKSBpZiBDQ19JU19HQ0MKPiA+ICsJZGVmYXVsdCAwCj4gCj4gV2h5ICJpZiIgYW5kIGEg
Mm5kICJkZWZhdWx0IiBsaW5lIGhlcmUgYnV0IC4uLgo+IAo+ID4gK2NvbmZpZyBDQ19JU19DTEFO
Rwo+ID4gKwlkZWZfYm9vbCAkKHN1Y2Nlc3MsJChDQykgLS12ZXJzaW9uIHwgaGVhZCAtbiAxIHwg
Z3JlcCAtcSBjbGFuZykKPiA+ICsKPiA+ICtjb25maWcgQ0xBTkdfVkVSU0lPTgo+ID4gKwlpbnQK
PiA+ICsJZGVmYXVsdCAkKHNoZWxsLCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNo
ICQoQ0MpKQo+IAo+IC4uLiBqdXN0IGEgc2luZ2xlLCB1bmNvbmRpdGlvbmFsIG9uZSBoZXJlPwoK
Y2xhbmctdmVyc2lvbi5zaCByZXR1cm5zIDAgd2hlbiBDQyBpc24ndCBjbGFuZywgYnV0IGdjYy12
ZXJzaW9uLnNoCmRvZXNuJ3QgY2hlY2sgaWYgQ0MgaXMgZ2NjLCBhbmQgcmV0dXJucyBhIGJvZ3Vz
IHZhbHVlcyBpbnN0ZWFkLgoKZS5nLjoKCiQgLi9jbGFuZy12ZXJzaW9uLnNoIGNsYW5nCjkwMDAw
CiQgLi9nY2MtdmVyc2lvbi5zaCBjbGFuZwo0MDIwMQoKPiBXb3VsZG4ndCBib3RoIGJldHRlcgo+
IGhhdmUgYSAiZGVwZW5kcyBvbiBDQ19JU18qIiBsaW5lIGluc3RlYWQ/IFRoaXMgd291bGQgdGhl
biBhbHNvCj4gcmVzdWx0IChhZmFpY3QpIGluIG5vIENPTkZJR19DTEFOR19WRVJTSU9OIGluIC5j
b25maWcgaWYgYnVpbGRpbmcKPiB3aXRoIGdjYyAoYW5kIHZpY2UgdmVyc2EpLCBpbnN0ZWFkIG9m
IGEgYm9ndXMgQ09ORklHX0NMQU5HX1ZFUlNJT049MC4KCkl0IHNvdW5kcyBhdHRyYWN0aW5nIHRv
IHJlbW92ZSB2YXJpYWJsZXMgZnJvbSAuY29uZmlnLCBidXQgaXQgaXMgZXF1YWxseQphdHRyYWN0
aW5nIHRvIGFsd2F5cyBoYXZlIGEgdmFyaWFibGUgc2V0LiBJdCBjYW4gYmUgdXNlZAp1bmNvbmRp
dGlvbmFsbHkgd2hlbiBhbHdheXMgc2V0ICh3aXRob3V0IHJpc2tpbmcgaW52YWxpZCBzeW50YXgg
Zm9yCmV4YW1wbGUpLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
