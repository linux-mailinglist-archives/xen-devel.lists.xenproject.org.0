Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537012D80C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 11:42:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imEx4-0000yP-1i; Tue, 31 Dec 2019 10:40:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gg/0=2V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1imEx2-0000yI-Mg
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 10:40:36 +0000
X-Inumbo-ID: f879f184-2bb9-11ea-a0ca-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f879f184-2bb9-11ea-a0ca-12813bfff9fa;
 Tue, 31 Dec 2019 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577788833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=05n/JILtwNTkBGn25m6NxW95Ma3ymRli73wmUGzmiHQ=;
 b=VhiUrSEJ0vMOEng3pUdyFWu3Wy/AtkMJzeJokspY7QIZbcEvri6iCmqT
 nn1QJLAPbY09j/NHCXvPq52OO2PHdgzd9o0zGl9VtVEuNVH709XlYI0TA
 ivrPWkWvbw+DEM9DasBfw8pmVzRKYM0szUN3pGC5vg4/QqXuwULNXt5o8 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rm5dmA7Udius2266Czo2whLvr+rHjPpcMdMylruCAthurE5ECGOTy0i2HkjPdMP9tEs1CyKXIQ
 UmCDcYaaAxRu6qmhxGQzgeyi5kW1ZkYMJiwmVpAPzwdxT6xiBcVyDCExVlrXWig7QW0itNLkQ3
 7LXQAHmBIGhb6hRQy7Os9hROCmn5hF/A4hglN/KR99kPSSi8EKxcvBWGMGvZuiwa7ayhI+1oRH
 +xZ6t1VWcS53fFaWoLKkK4XjJ9AXkYupUsI+eK+oZusqdf7hT3hGeCxEjRxXF6P1m4ccx2ax29
 niQ=
X-SBRS: 2.7
X-MesageID: 10905049
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,379,1571716800"; d="scan'208";a="10905049"
Date: Tue, 31 Dec 2019 11:40:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20191231104022.GG11756@Air-de-Roger>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMDU6Mzc6MzhQTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDU6MjAgUE0gSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiBNb24s
IDMwIERlYyAyMDE5LCAyMDo0OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDExOjQzIEFNIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+ID4+IEJ1dCBrZWVwIGluIG1pbmQgdGhh
dCB0aGUgImZvcmstdm0iIGNvbW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4gPj4gd291bGQg
c3RpbGwgbm90IHByb2R1Y2UgZm9yIHlvdSBhICJmdWxseSBmdW5jdGlvbmFsIiBWTSBvbiBpdHMg
b3duLgo+ID4+IFRoZSB1c2VyIHN0aWxsIGhhcyB0byBwcm9kdWNlIGEgbmV3IFZNIGNvbmZpZyBm
aWxlLCBjcmVhdGUgdGhlIG5ldwo+ID4+IGRpc2ssIHNhdmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4K
CklNTyB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiB0aGUgZm9yayBjb21tYW5kIHNob3VsZCBiZSB0
byBsZWF2ZSB0aGUKb3JpZ2luYWwgVk0gcGF1c2VkLCBzbyB0aGF0IHlvdSBjYW4gY29udGludWUg
dXNpbmcgdGhlIHNhbWUgZGlzayBhbmQKbmV0d29yayBjb25maWcgaW4gdGhlIGZvcmsgYW5kIHlv
dSB3b24ndCBuZWVkIHRvIHBhc3MgYSBuZXcgY29uZmlnCmZpbGUuCgpBcyBKdWxpZW4gYWxyZWFk
eSBzYWlkLCBtYXliZSBJIHdhc24ndCBjbGVhciBpbiBteSBwcmV2aW91cyByZXBsaWVzOgpJJ20g
bm90IGFza2luZyB5b3UgdG8gaW1wbGVtZW50IGFsbCB0aGlzLCBpdCdzIGZpbmUgaWYgdGhlCmlt
cGxlbWVudGF0aW9uIG9mIHRoZSBmb3JrLXZtIHhsIGNvbW1hbmQgcmVxdWlyZXMgeW91IHRvIHBh
c3MgY2VydGFpbgpvcHRpb25zLCBhbmQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlvciBpcyBub3Qg
aW1wbGVtZW50ZWQuCgpXZSBuZWVkIGFuIGludGVyZmFjZSB0aGF0J3Mgc2FuZSwgYW5kIHRoYXQn
cyBkZXNpZ25lZCB0byBiZSBlYXN5IGFuZApjb21wcmVoZW5zaXZlIHRvIHVzZSwgbm90IGFuIGlu
dGVyZmFjZSBidWlsdCBhcm91bmQgd2hhdCdzIGN1cnJlbnRseQppbXBsZW1lbnRlZC4KCj4gPgo+
ID4gIElmIHlvdSBmb3JrIHRoZW4gdGhlIGNvbmZpZ3VyYXRpb24gc2hvdWxkIGJlIHZlcnkgc2lt
aWxhci4gUmlnaHQ/Cj4gPgo+ID4gU28gd2h5IGRvZXMgdGhlIHVzZXIgcmVxdWlyZXMgdG8gcHJv
dmlkZSBhIG5ldyBjb25maWcgcmF0aGVyIHRoYW4gdGhlIGNvbW1hbmQgdG8gdXBkYXRlIHRoZSBl
eGlzdGluZyBvbmU/IFRvIG1lLCBpdCBmZWVscyB0aGlzIGlzIGEgY2FsbCB0byBtYWtlIG1pc3Rh
a2Ugd2hlbiBmb3JraW5nLgo+ID4KPiA+IEhvdyBpcyB0aGUgbmV3IGNvbmZpZyBkaWZmZXJlbnQg
ZnJvbSB0aGUgb3JpZ2luYWwgVk0/Cj4gCj4gVGhlIGNvbmZpZyBtdXN0IGJlIGRpZmZlcmVudCBh
dCBsZWFzdCBieSBnaXZpbmcgdGhlIGZvcmsgYSBkaWZmZXJlbnQKPiBuYW1lLiBUaGF0J3MgdGhl
IG1pbmltdW0gYW5kIGl0J3MgZW5vdWdoIG9ubHkgaWYgdGhlIFZNIHlvdSBhcmUKPiBmb3JraW5n
IGhhcyBubyBkaXNrIGF0IGFsbC4KCkFkZGluZyBhbiBvcHRpb24gdG8gcGFzcyBhbiBleHBsaWNp
dCBuYW1lIGZvciB0aGUgZm9yayB3b3VsZCBiZSBoYW5keSwKb3IgZWxzZSB4bCBjb3VsZCBjb21l
IHVwIHdpdGggYSBuYW1lIGJ5IGl0c2VsZiwgbGlrZSBpdCdzIGRvbmUgZm9yCm1pZ3JhdGlvbiwg
aWU6IDxvcmlnbmFsIG5hbWU+LS1mb3JrPGRpZ2l0Pi4KCj4gSWYgaXQgaGFzIGEgZGlzaywgeW91
IGFsc28gaGF2ZSB0byB1cGRhdGUKPiB0aGUgY29uZmlnIHRvIHBvaW50IHRvIHdoZXJlIHRoZSBu
ZXcgZGlzayBpcy4gSSdtIHVzaW5nIExWTSBzbmFwc2hvdHMKPiBidXQgeW91IGNvdWxkIGFsc28g
dXNlIHFjb3cyLCBvciB3aGF0ZXZlciBlbHNlIHRoZXJlIGlzIGZvciBkaXNrLUNvVy4KPiBUaGUg
Zm9yayBjYW4gYWxzbyBoYXZlIGRpZmZlcmVudCBvcHRpb25zIGVuYWJsZWQgdGhhbiBpdCdzIHBh
cmVudC4gRm9yCj4gZXhhbXBsZSBpbiBvdXIgdGVzdC1jYXNlLCB0aGUgZm9ya3MgaGF2ZSBhbHRw
Mm0gZW5hYmxlZCB3aGlsZSB0aGUKPiBwYXJlbnQgVk0gZG9lc24ndC4gVGhlcmUgY291bGQgYmUg
b3RoZXIgb3B0aW9ucyBsaWtlIHRoYXQgc29tZW9uZQo+IG1pZ2h0IHdhbnQgdG8gZW5hYmxlIGZv
ciB0aGUgZm9yayhzKS4gSWYgdGhlcmUgaXMgbmV0d29ya2luZyBpbnZvbHZlZAo+IHlvdSBsaWtl
bHkgYWxzbyBoYXZlIHRvIGF0dGFjaCB0aGUgZm9yayB0byBhIG5ldyBWTEFOIGFzIHRvIGF2b2lk
Cj4gTUFDLWFkZHJlc3MgY29sbGlzaW9uIG9uIHRoZSBicmlkZ2UuIFNvIHRoZXJlIGFyZSBxdWl0
ZSBhIGxvdCBvZgo+IHZhcmlhdGlvbiBwb3NzaWJsZSwgaGVuY2UgaXRzIGJldHRlciB0byBoYXZl
IHRoZSB1c2VyIGdlbmVyYXRlIHRoZSBuZXcKPiBjb25maWcgdGhleSB3YW50IGluc3RlYWQgb2Yg
eGwgY29taW5nIHVwIHdpdGggc29tZXRoaW5nIG9uIGl0cyBvd24uCgpQYXNzaW5nIGEgbmV3IGNv
bmZpZyBmaWxlIGZvciB0aGUgZm9yayBpcyBpbmRlZWQgZmluZSwgYnV0IG1heWJlIHdlCmRvbid0
IHdhbnQgdGhpcyB0byBiZSB0aGUgZGVmYXVsdCBiZWhhdmlvciwgYXMgc2FpZCBhYm92ZSBJIHRo
aW5rIGl0J3MKcG9zc2libGUgdG8gZm9yayBhIFZNIHdpdGhvdXQgcGFzc2luZyBhIG5ldyBjb25m
aWcgZmlsZS4KCj4gPgo+ID4gQXMgYSBzaWRlIG5vdGUsIEkgY2FuJ3Qgc2VlIGFueSBwYXRjaCBh
ZGRpbmcgZG9jdW1lbnRhdGlvbi4KPiAKPiBJdCdzIG9ubHkgYW4gZXhwZXJpbWVudGFsIGZlYXR1
cmUgc28gYWRkaW5nIGRvY3VtZW50YXRpb24gd2FzIG5vdCBhCj4gcHJpb3JpdHkuIFRoZSBkb2N1
bWVudGF0aW9uIGlzIHByZXR0eSBtdWNoIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEknbQo+IGhhcHB5
IHRvIGFkZCBpdHMgY29udGVudCBhcyBhIGZpbGUgdW5kZXIgZG9jcyBpbiBhIHBhdGNoICh3aXRo
IHRoZQo+IGFib3ZlIGV4dHJhIGluZm9ybWF0aW9uKS4KClBsZWFzZSBhbHNvIGRvY3VtZW50IHRo
ZSBuZXcgeGwgY29tbWFuZChzKSBpbiB0aGUgbWFuIHBhZ2UgWzBdLgoKVGhhbmtzLCBSb2dlci4K
ClswXSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC4xLmh0bWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
