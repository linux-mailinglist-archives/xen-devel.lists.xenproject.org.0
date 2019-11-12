Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15954F8BF0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 10:36:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUSZ1-0005rr-DH; Tue, 12 Nov 2019 09:34:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EDdg=ZE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iUSZ0-0005rm-NE
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 09:34:18 +0000
X-Inumbo-ID: 98ac8448-052f-11ea-a21a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98ac8448-052f-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573551257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ypOR4K0q88tvlLyeH0cOti4nonE0GFKZ/HDvroJ3kew=;
 b=XzsW9zzfkuFmmL9n1cyWuFIyfO3DTGTFWVOMBR4Myh6DmrgBVF7QXacq
 YTjI+h0khqMEUJT+SHpnr3XCIEysdb2Io/NVdgrsFuz7r5Ig7z22S4m/e
 HaMQ9v7ZWVniQuCCQ+SLZetuZcEyqgATFbG4SC6FxkMQgA61+NgGFzTfP M=;
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
IronPort-SDR: k3d7ClC63+dBAw2o0gx4DJHLzJi9B/U7urUTPkfNWw/9SgXEGk7PtwDyaXPw5Ee+OEwgIZaNs2
 0qVwp90ruzXytC67PUdHwIWuwCwsuCW6nfEgqj1u86QwTKiu1JKUDOmMcNELGwid12iTuUDRY/
 GBZxRfWvh+YN9jv1/ZO3NBY4SqgF18uu0mHT3Eyl4lgy5Dy/qp+/kPjKfMirM4GuFK90dXF4Yz
 VPk5l2Xn00LxFP3digdd9CSQqDR+NlxBXNLMNad0ZLmkrA9LUU5kReO7u5+VmbBm0yuiY9u+4K
 1lc=
X-SBRS: 2.7
X-MesageID: 8589901
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,295,1569297600"; 
   d="scan'208";a="8589901"
Date: Tue, 12 Nov 2019 10:34:06 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191112093406.GA72134@Air-de-Roger>
References: <20191110092506.98925-1-roger.pau@citrix.com>
 <20191110092506.98925-3-roger.pau@citrix.com>
 <812c72dc-c713-9038-5e63-68f3c0b29be6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <812c72dc-c713-9038-5e63-68f3c0b29be6@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] x86/ioapic: fix
 clear_IO_APIC_pin write of raw entries
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 SergeyDyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTA6NTY6MjFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMTEuMjAxOSAxMDoyNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gY2xl
YXJfSU9fQVBJQ19waW4gY2FuIGJlIGNhbGxlZCBhZnRlciB0aGUgaW9tbXUgaGFzIGJlZW4gZW5h
YmxlZCwgYW5kCj4gPiB1c2luZyByYXcgcmVhZHMgYW5kIHdyaXRlcyB0byBtb2RpZnkgSU8tQVBJ
QyBlbnRyaWVzIHRoYXQgaGF2ZSBiZWVuCj4gPiBzZXR1cCB0byB1c2UgaW50ZXJydXB0IHJlbWFw
cGluZyBjYW4gbGVhZCB0byBpc3N1ZXMgYXMgc29tZSBvZiB0aGUKPiA+IGZpZWxkcyBoYXZlIGRp
ZmZlcmVudCBtZWFuaW5nIHdoZW4gdGhlIElPLUFQSUMgZW50cnkgaXMgc2V0dXAgdG8gcG9pbnQK
PiA+IHRvIGFuIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUgZW50cnkuCj4gPiAKPiA+IFRoZSBm
b2xsb3dpbmcgQVNTRVJUIGluIEFNRCBJT01NVSBjb2RlIHRyaWdnZXJzIGFmdGVyd2FyZHMgYXMg
YSByZXN1bHQKPiA+IG9mIHRoZSByYXcgY2hhbmdlcyB0byBJTy1BUElDIGVudHJpZXMgcGVyZm9y
bWVkIGJ5IGNsZWFyX0lPX0FQSUNfcGluLgo+ID4gCj4gPiAoWEVOKSBbICAgMTAuMDgyMTU0XSBF
TkFCTElORyBJTy1BUElDIElSUXMKPiA+IChYRU4pIFsgICAxMC4wODc3ODldICAtPiBVc2luZyBu
ZXcgQUNLIG1ldGhvZAo+ID4gKFhFTikgWyAgIDEwLjA5MzczOF0gQXNzZXJ0aW9uICdnZXRfcnRl
X2luZGV4KHJ0ZSkgPT0gb2Zmc2V0JyBmYWlsZWQgYXQgaW9tbXVfaW50ci5jOjMyOAo+ID4gCj4g
PiBGaXggdGhpcyBieSBtYWtpbmcgc3VyZSB0aGF0IG1vZGlmaWNhdGlvbnMgdG8gZW50cmllcyBh
cmUgcGVyZm9ybWVkIGluCj4gPiBub24gcmF3IG1vZGUuCj4gCj4gLi4uIHdoZW4gZmllbGRzIGFy
ZSBhZmZlY3RlZCB3aGljaCBtYXkgZWl0aGVyIGhhdmUgY2hhbmdlZCBtZWFuaW5nCj4gd2l0aCBp
bnRlcnJ1cHQgcmVtYXBwaW5nLCBvciB3aGljaCBtYXkgbmVlZCBtaXJyb3JpbmcgaW50byBJUlRF
cy4KPiAKPiA+IFJlcG9ydGVkLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJp
eC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiAKPiBXaXRoIHRoZSBhYm92ZSBhZGRpdGlvbiAob3Igc29tZXRoaW5nIHN1YnN0
YW50aWFsbHkgc2ltaWxhcikKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IE9mIGNvdXJzZSB0aGUgYWRqdXN0bWVudCBpcyBlYXN5IGVub3VnaCB0byBkbyB3
aGlsZSBjb21taXR0aW5nLgoKVGhlIGFkanVzdG1lbnQgTEdUTSwgcGxlYXNlIGRvIGl0IGF0IGNv
bW1pdCB0aW1lIHVubGVzcyB0aGVyZSdzCnNvbWV0aGluZyBlbHNlIHRoYXQgcmVxdWlyZXMgYSBy
ZXNlbmQgb2YgdGhlIHNlcmllcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
