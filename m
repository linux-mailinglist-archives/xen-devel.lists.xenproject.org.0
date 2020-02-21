Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5279168105
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:00:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59kv-00058k-HM; Fri, 21 Feb 2020 14:58:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j59ku-00058W-GO
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:58:16 +0000
X-Inumbo-ID: 9655a53c-54ba-11ea-8692-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9655a53c-54ba-11ea-8692-12813bfff9fa;
 Fri, 21 Feb 2020 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582297096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NjvaUAXDI0f41ldJDf/FLmjFfT0Hzsb/mVw32y22rm4=;
 b=VAml405rMWpTGh6uYMkyo2DYRf0KrkvS0e2Tja346Hh0pYdD4vVTrv/v
 mbPAKMlufVGjR67eIPMIwNIX1htWi19CjPti6SiCcdsOrD0L9hA6F9/3A
 coNkI5FNYi/baRehnCDF1AgYMmDMdHNw9mtBIcPgRo9pJInYEU5987fMZ 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +CVGVIz7T10IbW4Sorg3vmZpHO2yqyRilzMZqG03eezBqtkWdlhXa7IeL3SAHIgmUYLGoE8bRV
 FMMCCOhaDA0pe8hYsSOqtsEIXDgsSgSyUtQPA2w/CUnz8ovy51iAkXQXwmcW2aBbMZqwqrWi38
 YKXkOfCIa/8knz3B96Evj5vlBpsnPjj9t1q2R6DMGyiI5scn+Di26gQVz7BJO2JtK6X6yYkyWm
 /6gDBs2O2vY1G0StAU0pnS4QhjJ11F0NH/tB+nj7F+3AvnK41tnmGCRiXPjBrHMnHT1ICTc6eA
 eeU=
X-SBRS: 2.7
X-MesageID: 12803828
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="12803828"
Date: Fri, 21 Feb 2020 15:58:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221145807.GD4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <0e0dd272-5303-08c6-7aae-23cc796ce563@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e0dd272-5303-08c6-7aae-23cc796ce563@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDM6NTI6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxNTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDIxLCAyMDIwIGF0IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIxLjAyLjIwMjAgMTU6MjYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDAyOjM2OjUyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4+PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPj4+Pj4+IEhpLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMC8wMi8yMDIw
IDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+Pj4+PiBBbGxvdyBhIENQVSBhbHJl
YWR5IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPiA+
Pj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGluIGFsbG93aW5nIHJlYWQgbG9ja2lu
ZyBhIHJ3bG9jayB0aGF0J3MKPiA+Pj4+Pj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAo
aWU6IENQVSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+ID4+Pj4+Pj4gYWNjZXNzZXMg
aXMgcmVxdWlyZWQgYXQgbGVhc3QgZm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPiA+Pj4+Pj4+
Cj4gPj4+Pj4+PiBJbiBvcmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2Nr
LCB0aGlzIGFsbG93cyB0byBzdXBwb3J0Cj4gPj4+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNv
IHJlZHVjZSB0aGUgd3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4gPj4+Pj4+PiBz
aWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0
aGUgb3RoZXIgdG8KPiA+Pj4+Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBt
b2RlLiBOb3RlIHRoZSB3cml0ZSByZWxhdGVkIGRhdGEKPiA+Pj4+Pj4+IGlzIHVzaW5nIDE2Yml0
cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+ID4+
Pj4+Pj4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4K
PiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNv
bmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4gPj4+Pj4+PiA2NTUzNiwgSSB0aGlu
ayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPiA+
Pj4+Pj4+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0
dXJlcyBzdXBwb3J0IGF0b21pYwo+ID4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBpbnRlZ2Vy
cy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21p
YyBvcGVyYXRpb25zIG9uIDY0LWJpdCBpbnRlZ2Vycy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4+ICAgc3Rh
dGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4gPj4+Pj4+PiAg
IHsKPiA+Pj4+Pj4+IC0gICAgLyoKPiA+Pj4+Pj4+IC0gICAgICogSWYgdGhlIHdyaXRlciBmaWVs
ZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+ID4+Pj4+Pj4gLSAgICAg
KiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xlYXIg
aXQuCj4gPj4+Pj4+PiAtICAgICAqLwo+ID4+Pj4+Pj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NL
RUQsICZsb2NrLT5jbnRzKTsKPiA+Pj4+Pj4+ICsgICAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVs
ZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5LiAqLwo+ID4+Pj4+Pj4gKyAg
ICBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykp
KTsKPiA+Pj4+Pj4+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAhPSAxNik7Cj4gPj4+Pj4+
PiArICAgIHdyaXRlX2F0b21pYygodWludDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4gPj4+Pj4+
Cj4gPj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVzZSB0byBjYXN0IGFuIGF0b21pY190KCkg
ZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPiA+Pj4+Pj4gd291bGQgYXQgbGVhc3Qgd2Fu
dCB0byB1c2UgJmxvY2stPmNudHMuY291bnRlciBoZXJlLgo+ID4+Pj4+Cj4gPj4+Pj4gU3VyZSwg
SSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+ID4+Pj4+Cj4gPj4+Pj4gV2lsbCB3
YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVk
IHVwb24KPiA+Pj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPiA+Pj4+
Cj4gPj4+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZpZWxkIHNwZWNpZmll
ciBoZXJlLiBBIGNhc3QgbGlrZQo+ID4+Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUs
IGFuZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPiA+Pj4+IGVuZGlhbiBwb3J0IGF0
dGVtcHQgdG8gZmFsbCBpbnRvLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+
ID4+Pj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBiZXR0ZXIg
d291bGQgYmUgaWYgaXQgd2FzCj4gPj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4gPj4+Cj4gPj4+IFdo
eSBkb24ndCB3ZSBsZWF2ZSB0aGUgYXRvbWljX2RlYyB0aGVuPwo+ID4+Cj4gPj4gQmVjYXVzZSB5
b3UgbmVlZCB0byBpbnZva2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIHRvIGNhbGN1bGF0ZSB0aGUgdmFs
dWUKPiA+PiB0byB1c2UgaW4gdGhlIHN1YnRyYWN0aW9uLiBJJ20gbm90IG1lYW5pbmcgdG8gc2F5
IEknbSBlbnRpcmVseQo+ID4+IG9wcG9zZWQgKHNlZWluZyBob3cgbXVjaCBvZiBhIGRpc2N1c3Np
b24gd2UncmUgaGF2aW5nKSwgYnV0IHRoZQo+ID4+ICJzaW1wbGUgd3JpdGUgb2YgemVybyIgYXBw
cm9hY2ggaXMgY2VydGFpbmx5IGFwcGVhbGluZy4KPiA+IAo+ID4gV2VsbCwgd2UgY291bGQgYXZv
aWQgdGhlIHNtcF9wcm9jZXNzb3JfaWQoKSBjYWxsIGFuZCBpbnN0ZWFkIHVzZToKPiA+IAo+ID4g
YXRvbWljX3N1YihhdG9taWNfcmVhZCgmbG9jay0+Y250cykgJiAweGZmZmYsICZsb2NrLT5jbnRz
KTsKPiAKPiBXaGljaCB3b3VsZCBtYWtlIG1lIHN1Z2dlc3QgYXRvbWljX2FuZCgpIGFnYWluLgoK
SSdtIGNlcnRhaW5seSBub3Qgb3Bwb3NlZCB0byB0aGF0LCBidXQgaW4gb3JkZXIgdG8gZ2V0IHRo
aXMgcmVncmVzc2lvbgpmaXhlZCBJIHdvdWxkIGFyZ3VlIHRoYXQgc3VjaCBhdG9taWNfc3ViIGlz
IG5vIHdvcnNlIHRoYW4gd2hhdCdzCmN1cnJlbnRseSBkb25lLgoKSSBjYW4gbG9vayBpbnRvIGFk
ZGluZyBhbiBhdG9taWNfYW5kIG9wZXJhdGlvbiB0byBhbGwgYXJjaGVzLCBidXQgdGhpcwppcyBs
aWtlbHkgdG8gdGFrZSB0aW1lIGFuZCBJIHdvdWxkIGxpa2UgdG8gZ2V0IHRoaXMgc29ydGVkIHNv
b25lcgpyYXRoZXIgdGhhbiBsYXRlci4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
