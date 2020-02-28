Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EA173E73
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:26:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7jMn-0004IQ-M2; Fri, 28 Feb 2020 17:24:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7jMl-0004IK-QJ
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 17:23:59 +0000
X-Inumbo-ID: 1a682d2e-5a4f-11ea-99ca-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a682d2e-5a4f-11ea-99ca-12813bfff9fa;
 Fri, 28 Feb 2020 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582910639;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jFS2vUmYDoufRvM5+gURO6oGFwJPr2Ym2RHt/xMRqZU=;
 b=eFW/tpt7af7yqDF6f34EX8xahl8G0GNM5trEYCycAsr9rHDrbxxmSHLW
 3+rmFztryOTvGdfI+BFbrvlVaHVu6X00uuOu6ZMAZ2L6ZILeWukWwxuqs
 c/BDPSx7N4w0uyRNvwzUJXDeDbPHsU6qoWOt30Wp9H6KteKPvKYUqHBpd U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IjBO+spkEYuERmuKTDbsg3lyg8LUBxzbG2RYe+nuSsA+iIwsB5q5QMvC8vI+RZ6HNcJ7xz4VQe
 IjTxYLLxIPsE7jXgwjJQTjJB8BE9oScXAlxcm4mnzsam8zrB+niyQtw3y5rxmAVSGbbtAFIQj+
 Hf0mRkvWAx/1XBhszzolJCigiSPd3U96Ka/9l2lFemqDLX/f6kFyi6M8QAijKwbT0QinPiam2K
 biZOQBxk193O9d0Y1r0O4kQ3jlylkYm6WoWQpfOda27zmr42XfAACcuntVAPrU5R8++Cd/+b8n
 Lkk=
X-SBRS: 2.7
X-MesageID: 13190808
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13190808"
Date: Fri, 28 Feb 2020 18:23:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228172351.GH24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-8-roger.pau@citrix.com>
 <aa482834-7454-9fcb-2aed-86f4c01b134e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa482834-7454-9fcb-2aed-86f4c01b134e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDY6MDA6NDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVXNl
IFhlbidzIEwwIEhWTU9QX2ZsdXNoX3RsYnMgaHlwZXJjYWxsIGluIG9yZGVyIHRvIHBlcmZvcm0g
Zmx1c2hlcy4KPiA+IFRoaXMgZ3JlYXRseSBpbmNyZWFzZXMgdGhlIHBlcmZvcm1hbmNlIG9mIFRM
QiBmbHVzaGVzIHdoZW4gcnVubmluZwo+ID4gd2l0aCBhIGhpZ2ggYW1vdW50IG9mIHZDUFVzIGFz
IGEgWGVuIGd1ZXN0LCBhbmQgaXMgc3BlY2lhbGx5IGltcG9ydGFudAo+ID4gd2hlbiBydW5uaW5n
IGluIHNoaW0gbW9kZS4KPiA+IAo+ID4gVGhlIGZvbGxvd2luZyBmaWd1cmVzIGFyZSBmcm9tIGEg
UFYgZ3Vlc3QgcnVubmluZyBgbWFrZSAtajMyIHhlbmAgaW4KPiA+IHNoaW0gbW9kZSB3aXRoIDMy
IHZDUFVzIGFuZCBIQVAuCj4gPiAKPiA+IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFu
ZDoKPiA+IHJlYWwJNG0zNS45NzNzCj4gPiB1c2VyCTRtMzUuMTEwcwo+ID4gc3lzCTM2bTI0LjEx
N3MKPiA+IAo+ID4gVXNpbmcgTDAgYXNzaXN0ZWQgZmx1c2g6Cj4gPiByZWFsICAgIDFtMi41OTZz
Cj4gPiB1c2VyICAgIDRtMzQuODE4cwo+ID4gc3lzICAgICA1bTE2LjM3NHMKPiA+IAo+ID4gVGhl
IGltcGxlbWVudGF0aW9uIGFkZHMgYSBuZXcgaG9vayB0byBoeXBlcnZpc29yX29wcyBzbyBvdGhl
cgo+ID4gZW5saWdodGVubWVudHMgY2FuIGFsc28gaW1wbGVtZW50IHN1Y2ggYXNzaXN0ZWQgZmx1
c2gganVzdCBieSBmaWxsaW5nCj4gPiB0aGUgaG9vay4gTm90ZSB0aGF0IHRoZSBYZW4gaW1wbGVt
ZW50YXRpb24gY29tcGxldGVseSBpZ25vcmVzIHRoZQo+ID4gZGlydHkgQ1BVIG1hc2sgYW5kIHRo
ZSBsaW5lYXIgYWRkcmVzcyBwYXNzZWQgaW4sIGFuZCBhbHdheXMgcGVyZm9ybXMgYQo+ID4gZ2xv
YmFsIFRMQiBmbHVzaCBvbiBhbGwgdkNQVXMuCj4gCj4gVGhpcyBpc24ndCBiZWNhdXNlIG9mIGFu
IGltcGxlbWVudGF0aW9uIGNob2ljZSBvZiB5b3VycywgYnV0IGJlY2F1c2UKPiBvZiBob3cgSFZN
T1BfZmx1c2hfdGxicyB3b3Jrcy4gSSB0aGluayB0aGUgc3RhdGVtZW50IHNob3VsZCBzb21laG93
Cj4gZXhwcmVzcyB0aGlzLiBJIGFsc28gdGhpbmsgaXQgd2FudHMgY2xhcmlmeWluZyB0aGF0IHVz
aW5nIHRoZQo+IGh5cGVyY2FsbCBpcyBpbmRlZWQgZmFzdGVyIGV2ZW4gaW4gdGhlIGNhc2Ugb2Yg
c2luZ2xlLXBhZ2UsIHNpbmdsZS0KPiBDUFUgZmx1c2gKCkFyZSB5b3Ugc3VyZSBhYm91dCB0aGlz
PyBJIHRoaW5rIHRha2luZyBhIHZtZXhpdCBpcyBnb2luZyB0byBiZSBtb3JlCmNvc3RseSB0aGFu
IGV4ZWN1dGluZyBhIGxvY2FsIGludmxwZz8KCj4gKHdoaWNoIEkgc3VzcGVjdCBtYXkgbm90IGJl
IHRoZSBjYXNlIGVzcGVjaWFsbHkgYXMgdkNQVQo+IGNvdW50IGdyb3dzKS4gVGhlIHN0YXRzIGFi
b3ZlIHByb3ZlIGEgcG9zaXRpdmUgb3ZlcmFsbCBlZmZlY3QsIGJ1dAo+IHRoZXkgZG9uJ3Qgc2F5
IHdoZXRoZXIgdGhlIGVmZmVjdCBjb3VsZCBiZSBldmVuIGJpZ2dlciBieSBiZWluZyBhdAo+IGxl
YXN0IGEgbGl0dGxlIHNlbGVjdGl2ZS4KCkkgYXNzdW1lIHRoYXQgYmVpbmcgYWJsZSB0byBwcm92
aWRlIGEgYml0bWFwIHdpdGggdGhlIHZDUFVzIG9uIHdoZXRoZXIKdGhlIFRMQiBmbHVzaCBzaG91
bGQgYmUgcGVyZm9ybWVkIHdvdWxkIGdpdmUgdXMgc29tZSBtb3JlIHBlcmZvcm1hbmNlLApidXQg
SSBoYXZlbid0IGxvb2tlZCBpbnRvIGl0IHlldC4KCj4gPiBAQCAtNzMsNiArNzQsMTUgQEAgdm9p
ZCBfX2luaXQgaHlwZXJ2aXNvcl9lODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQo+ID4g
ICAgICAgICAgb3BzLmU4MjBfZml4dXAoZTgyMCk7Cj4gPiAgfQo+ID4gIAo+ID4gK2ludCBoeXBl
cnZpc29yX2ZsdXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiArewo+
ID4gKyAgICBpZiAoIG9wcy5mbHVzaF90bGIgKQo+ID4gKyAgICAgICAgcmV0dXJuIGFsdGVybmF0
aXZlX2NhbGwob3BzLmZsdXNoX3RsYiwgbWFzaywgdmEsIG9yZGVyKTsKPiA+ICsKPiA+ICsgICAg
cmV0dXJuIC1FTk9TWVM7Cj4gPiArfQo+IAo+IFBsZWFzZSBubyBuZXcgLUVOT1NZUyBhbnl3aGVy
ZSAoZXhjZXB0IGluIG5ldyBwb3J0cycgdG9wIGxldmVsCj4gaHlwZXJjYWxsIGhhbmRsZXJzKS4K
CkFjay4gSXMgRU9QTk9UU1VQUCBPSz8KCj4gPiBAQCAtMjU2LDYgKzI1NywxNiBAQCB2b2lkIGZs
dXNoX2FyZWFfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLCB1bnNp
Z25lZCBpbnQgZmxhZ3MpCj4gPiAgICAgIGlmICggKGZsYWdzICYgfkZMVVNIX09SREVSX01BU0sp
ICYmCj4gPiAgICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1hc2ssIGNwdW1hc2tfb2YoY3B1KSkg
KQo+ID4gICAgICB7Cj4gPiArICAgICAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAmJgo+ID4g
KyAgICAgICAgICAgICAhKGZsYWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwg
RkxVU0hfVkFfVkFMSUQgfAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBGTFVTSF9PUkRF
Ul9NQVNLKSkgJiYKPiA+ICsgICAgICAgICAgICAgIWh5cGVydmlzb3JfZmx1c2hfdGxiKG1hc2ss
IHZhLCAoZmxhZ3MgLSAxKSAmIEZMVVNIX09SREVSX01BU0spICkKPiA+ICsgICAgICAgIHsKPiA+
ICsgICAgICAgICAgICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCj4gPiArICAgICAgICAgICAgICAg
IHRsYl9jbGtfZW5hYmxlZCA9IGZhbHNlOwo+IAo+IFdoeSBkb2VzIHRoaXMgbmVlZCBkb2luZyBo
ZXJlPyBDb3VsZG4ndCBYZW4gZ3Vlc3Qgc2V0dXAgY29kZQo+IGNsZWFyIHRoZSBmbGFnPwoKQmVj
YXVzZSBpdCdzIHBvc3NpYmxlIHRoYXQgdGhlIGh5cGVyY2FsbHMgZmFpbHMsIGFuZCBoZW5jZSB0
aGUgdGxiCmNsb2NrIHNob3VsZCBiZSBrZXB0IGVuYWJsZWQuIFRoZXJlJ3Mgbm8gcmVhc29uIHRv
IGRpc2FibGUgaXQgdW50aWwKWGVuIGtub3dzIHRoZSBhc3Npc3RlZCBmbHVzaCBpcyBpbmRlZWQg
YXZhaWxhYmxlLgoKSSBkb24ndCBtaW5kIG1vdmluZyBpdCB0byBYZW4gZ3Vlc3Qgc2V0dXAgY29k
ZSwgYnV0IEknbSBub3Qgc3VyZSBJIHNlZQp3aHkgaXQgd291bGQgYmUgYW55IGJldHRlciB0aGFu
IGRvaW5nIGl0IGhlcmUuIFRoZSBvbmx5IHJlYXNvbiBJIGd1ZXNzCmlzIHRvIGF2b2lkIGNoZWNr
aW5nIHRsYl9jbGtfZW5hYmxlZCBvbiBldmVyeSBzdWNjZXNzZnVsIGFzc2lzdGVkCmZsdXNoPwoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
