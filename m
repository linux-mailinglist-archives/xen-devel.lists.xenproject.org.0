Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A12162C55
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 18:16:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j46RE-0001pf-CB; Tue, 18 Feb 2020 17:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cswy=4G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j46RD-0001pa-5s
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 17:13:35 +0000
X-Inumbo-ID: fe3a12dc-5271-11ea-aa99-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe3a12dc-5271-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582046014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0BvwBRNTXma65l2IIZmRZ970ObDzi8Fvq8bKxKHlcn4=;
 b=BbVd7Wjpfh1cH4F0ghd4L+l4mMGX+ApdTJ26FFsKztyJU/dTcgwY7eLY
 3wnQsq6PNvmeZy/s+GdzVbEzQQtZNuGlMUrBnMKeCyjomlCtXOmaagwNZ
 k9Y8Q9/Kqoo2iUbtJB/XB0Hf6dKVoVBDmRG11+HROCfSY2XkV3WEswzdY U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MrI2tIVE4D0vv7Y20F7mjlqOiN3ELitKxHz9C3xkyDx88vY7cWoqE3Tmo0B/mFH7Tj/zMbNjUx
 ytUPF2aWeuXpz+qkOXDGunNrMPH7s2merAYRetcxu3rjy/fGsqMDPqPzYuOGv5opxYE2Cjvgys
 3LyH+NIjiXbSIHrCUTPgnaOJ5Hc1StEKJtgueIaxHWUaYRed+fWAtK4ME79uN3AiWCWKrrMEBa
 JyAQUqozDbDGXYzIzzkq95Z/KC/1N57wXwhBwGBr4fJDv00x4LY/ULn8IzwyakTfAshAir+1/j
 BnU=
X-SBRS: 2.7
X-MesageID: 12811861
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12811861"
Date: Tue, 18 Feb 2020 17:13:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200218171330.GA2193@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
 <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
 <20191213121832.GH1155@perard.uk.xensource.com>
 <a4a398d4-f3f2-a0b4-678c-4586c0b4024f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4a398d4-f3f2-a0b4-678c-4586c0b4024f@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH 6/8] xen: Move CONFIG_INDIRECT_THUNK to
 Kconfig
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDU6NDM6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTMuMTIuMjAxOSAxMzoxOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBG
cmksIERlYyAxMywgMjAxOSBhdCAxMjoxMzo1M1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiBPbiAxMi4xMi4yMDE5IDE5OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L0tjb25maWcKPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcK
PiA+Pj4gQEAgLTMyLDYgKzMyLDkgQEAgY29uZmlnIEFSQ0hfREVGQ09ORklHCj4gPj4+ICAJc3Ry
aW5nCj4gPj4+ICAJZGVmYXVsdCAiYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIgo+
ID4+PiAgCj4gPj4+ICtjb25maWcgSU5ESVJFQ1RfVEhVTksKPiA+Pj4gKwlkZWZfYm9vbCAkKGNj
LW9wdGlvbiwtbWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcikKPiA+Pgo+ID4+IEknbSBub3QgaGFw
cHkgdG8gc2VlIGNvbnN0cnVjdHMgbGlrZSB0aGlzIGFwcGVhci4gVGhleSBsZWF2ZSBhCj4gPj4g
IiMgQ09ORklHXy4uLiBpcyBub3QgZGVmaW5lZCIgaW4gLmNvbmZpZyBmb3Igbm8gcmVhc29uIHdo
ZW4KPiA+PiB0aGUgZXhwcmVzc2lvbiBldmFsdWF0ZXMgdG8gbi4KPiA+IAo+ID4gRm9yIHNvbWUg
cmVhc29uLCB0aGlzIGRvZXNuJ3QgaGFwcGVuLiBJZiAkKENDKSBkb2Vzbid0IHVuZGVyc3RhbmQg
dGhlCj4gPiBvcHRpb24sIHRoZSBDT05GSUdfIGRvZXNuJ3QgYXBwZWFyIGF0IGFsbCBpbiAuY29u
ZmlnLgo+ID4gCj4gPiBJIGd1ZXNzICIjIENPTkZJR18uLi4gaXMgbm90IGRlZmluZWQiIGNvbW1l
bnRzIGFyZSBvbmx5IHVzZWZ1bCBmb3IKPiA+IG9wdGlvbnMgdGhhdCBjYW4gYmUgc2VsZWN0ZWQg
YnkgdXNlcnMsIHNvIEtjb25maWcgd291bGQga25vdyBub3QgdG8gYXNrCj4gPiB0aGUgdXNlcnMg
YWdhaW4uIFNvLCBmb3IgIm9wdGlvbnMiIHRoYXQgYXJlbid0IGZvciB1c2VycywgdGhlIGNvbW1l
bnQKPiA+IGRvZXNuJ3QgbmVlZCB0byBleGlzdC4KPiA+IAo+ID4+IFRoaXMgbWF5IG5vdCBtYXR0
ZXIgbXVjaCB3aGVuCj4gPj4gY29uc2lkZXJpbmcganVzdCBvbmUgc3VjaCBsaW5lLCBidXQgaXQg
d2lsbCB3aGVuIHdlIGdhaW4KPiA+PiBkb3plbnMgb3IgaHVuZHJlZHMuIEZvciBvcHRpb25zIHdp
dGhvdXQgcHJvbXB0cyBJIHRoaW5rIHRoZQo+ID4+IGRlZmF1bHQgc2hvdWxkIG9ubHkgZXZlciBi
ZSBzZXQgdG8geSAob3IgbSwgd2hpY2ggd2UgZG9uJ3QKPiA+PiB1c2UpLiBUaGUgYWJvdmUgd291
bGQgdGhlbiBiZSB3cml0dGVuIGFzCj4gPiAKPiA+IEkgdGhpbmsgS2NvbmZpZyBkZXZlbG9wZXJz
IGhhdmUgYWxyZWFkeSBkb25lIHRoZSB3b3JrIGZvciB0aGF0IDotKS4gU28KPiA+IHRoZSBjb25z
dHJ1Y3QgZGVmX2Jvb2wgeSBpZiAkWCBpc24ndCBuZWVkZWQuCj4gCj4gU28gSSd2ZSBjaGVja2Vk
IC0gaW4gTGludXggdGhlIGxvbmdlciBjb25zdHJ1Y3QgaXMgbmVlZGVkLCB3aGlsZSBpbgo+IFhl
biBpdCBpc24ndC4gSSBjYW4ndCBjdXJyZW50bHkgZXhwbGFpbiB3aHkgdGhpcyBpcywgYnV0IEkg
dGFrZSBpdAo+IHRvIG1lYW4gdGhhdCB3ZSdyZSBhdCByaXNrIG9mIGdldHRpbmcgdGhlIHN0cmF5
IGV4dHJhIGxpbmVzIGVtaXR0ZWQKPiB3aGVuZXZlciBzb21ldGhpbmcgaW4gb3VyIEtjb25maWcg
ZmlsZXMgY2hhbmdlcyBpbiBhIHdheSB0cmlnZ2VyaW5nCj4gdGhlIHNhbWUgYmVoYXZpb3IgYXMg
b2JzZXJ2ZWQgaW4gTGludXguCgpXaGljaCB2ZXJzaW9uIG9mIExpbnV4PwpEaWQgeW91IHRlc3Qg
d2l0aCAiZGVmX2Jvb2wiIGFzIHRoZSBzb2xlIGl0ZW0gaW4gdGhlIGNvbmZpZyBlbnRyeT8KQW5k
IGlzbid0IGEgZGVwZW5kZW5jeSBvZiBhbm90aGVyIGNvbmZpZz8KClRoYW5rcywKCi0tIApBbnRo
b255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
