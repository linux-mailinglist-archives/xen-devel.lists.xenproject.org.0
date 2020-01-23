Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492B146BC5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:51:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudjb-00040c-9P; Thu, 23 Jan 2020 14:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iudjY-00040V-Uq
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 14:45:24 +0000
X-Inumbo-ID: fc690f41-3dee-11ea-be4b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc690f41-3dee-11ea-be4b-12813bfff9fa;
 Thu, 23 Jan 2020 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579790724;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eR9mzukznCm5Mc8+ukSs5S2nN+ZilQJZWtTonVfbPuI=;
 b=TqyA7/9CJo5lkETC5DxtqWUIdOggc/6afnxfe6aRsj33wHZS0OYPv3M3
 NopmOHOj3jUFPaEajTktXIKhLCIixNKL+fn82Hsq6+Vzrf/72wdqRgs8/
 oLVk7XTUeT/rQzxb6WE3lKN94S48kURCGH7CCF7lloYLTDiEOJWyx6yCB 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MjuHptGAnQTEqzuV8IC+cSb3BwCLrEFrUuYAUy0CM20TFBJDj2hjDojESIRPurIJfvxvLx60Ly
 UTm8PHdDWxNQq1DtBo3kMyyP1QEBvB6lAB29AUGO2VT2kHudrEaaTPU7LSKpv3tx0l//h323KH
 TCSH8wGa+0vjI8kUIGAsSyi0+zq+0JZ1mMuRyhhrSp1RTU6jyFUm8WQKteQ9sAVtsouCGNT3ZY
 mkmnFTIqdGYgOYAQvzR1frX9iuQ/7Apt/iv5Ov83AOAa2drxNPsIvahwWRd5JMp2u7oGEPygzK
 10I=
X-SBRS: 2.7
X-MesageID: 11345305
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11345305"
To: Julien Grall <julien@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
 <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
 <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <4afebff2-2239-44f8-ae82-7264595eda70@citrix.com>
Date: Thu, 23 Jan 2020 14:45:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMy8yMCAyOjQyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjMv
MDEvMjAyMCAxMTozMiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMjIvMDEvMjAyMCAxMToy
NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMi8wMS8yMDIwIDExOjE5LCBT
ZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+IE9uIDIyLzAxLzIwMjAgMTA6MTQsIEp1bGllbiBHcmFs
bCB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMjIvMDEvMjAyMCAxMDowMSwgU2VyZ2V5IER5
YXNsaSB3cm90ZToKPj4+Pj4+IE9uIDIwLzAxLzIwMjAgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+Pj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+
Pj4+IHYyIC0tPiB2MzoKPj4+Pj4+Pj4gLSBSZW1vdmUgaHZtbG9hZGVyIGZpbHRlcmluZwo+Pj4+
Pj4+Cj4+Pj4+Pj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24sIGhvdyBhYm91dCBh
ZGRpbmcgWEVOVkVSX2RlbmllZCB0bwo+Pj4+Pj4+IHJldHVybiB0aGUgImRlbmllZCIgc3RyaW5n
LCBhbGxvd2luZyBjb21wb25lbnRzIHdoaWNoIHdhbnQgdG8gZmlsdGVyCj4+Pj4+Pj4gdG8ga25v
dyBleGFjdGx5IHdoYXQgdG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5n
IHlvdQo+Pj4+Pj4+IGhhZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hv
dWxkIHRoZW4gcGVyaGFwcyBiZQo+Pj4+Pj4+IGV4dGVuZGVkIHRvIG1ha2UgdmVyeSBjbGVhciB0
aGF0IHRoZSBjaG9zZW4gc3RyaW5nIHNob3VsZCBub3QgbWF0Y2gKPj4+Pj4+PiBhbnl0aGluZyB0
aGF0IGNvdWxkIHBvdGVudGlhbGx5IGJlIHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+
Pj4+Pj4+IHN1Yi1vcHMuKQo+Pj4+Pj4KPj4+Pj4+IEkgaGFkIHRoZSBmb2xsb3dpbmcgcmVhc29u
aW5nOgo+Pj4+Pj4KPj4+Pj4+IDEuIE1vc3QgcmVhbC13b3JsZCB1c2VycyB3b3VsZCBzZXQgQ09O
RklHX1hTTV9ERU5JRURfU1RSSU5HPSIiCj4+Pj4+PiBhbnl3YXkuCj4+Pj4+Pgo+Pj4+Pj4gMi4g
RmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxldGUgc29sdXRpb24sIHNpbmNl
IGRlbmllZAo+Pj4+Pj4gc3RyaW5nIGxlYWtzIGVsc2V3aGVyZSB0aHJvdWdoIHRoZSBoeXBlcmNh
bGwgKFBWIGd1ZXN0cywgc3lzZnMsCj4+Pj4+PiBkcml2ZXIKPj4+Pj4+IGxvZ3MpIGFzIEFuZHJl
dyBoYXMgcG9pbnRlZCBvdXQgaW4gdGhlIHByZXZpb3VzIGRpc2N1c3Npb24uCj4+Pj4+Pgo+Pj4+
Pj4gT24gdGhlIG90aGVyIGhhbmQsIFNNQmlvcyBmaWx0ZXJpbmcgc2xpZ2h0bHkgaW1wcm92ZXMg
dGhlCj4+Pj4+PiBzaXR1YXRpb24gZm9yCj4+Pj4+PiBIVk0gZG9tYWlucywgc28gSSBjYW4gcmV0
dXJuIGl0IGlmIG1haW50YWluZXJzIGZpbmQgaXQgd29ydGh5Lgo+Pj4+Pgo+Pj4+PiBXaGlsZSBJ
IGFtIG5vdCBhIG1haW50YWluZXIgb2YgdGhpcyBjb2RlLCBteSBjb25jZXJuIGlzIHlvdSBpbXBv
c2UKPj4+Pj4gdGhlIGNvbnZlcnNpb24gZnJvbSAiZGVuaWVkIiB0byAiIiB0byBhbGwgdGhlIHVz
ZXJzIChpbmNsdWRlIHRob3NlCj4+Pj4+IHdobyB3YW50cyB0byBrZWVwICJkZW5pZWQiKS4KPj4+
Pgo+Pj4+IFRoaXMgaXMgbm90IHdoYXQncyBoYXBwZW5pbmcgaGVyZTogdGhlIGRlZmF1bHQgaXMg
c3RpbGwgIjxkZW5pZWQ+IiAoYXMKPj4+PiBwZXIgcGF0Y2ggMSk7IGJ1dCBwYXRjaCAyIG1ha2Vz
IFhFTlZFUl9leHRyYXZlcnNpb24sCj4+Pj4gWEVOVkVSX2NvbXBpbGVfaW5mbwo+Pj4+IGFuZCBY
RU5WRVJfY2hhbmdlc2V0IHRvIHJldHVybiAiPGRlbmllZD4iIGluc3RlYWQgb2YgdGhlIHJlYWwg
dmFsdWVzCj4+Pj4gd2hpY2ggY2F1c2VzIHRoZSBVSSAvIGxvZ3MgaXNzdWVzLgo+Pj4KPj4+IEkg
d2FzIHJlZmVycmluZyB0aGUgU01CaW9zIGZpbHRlcmluZy4uLiBJIGRvbid0IHRoaW5rIGRvaW5n
IGEgYmxhbmsKPj4+IGZpbHRlcmluZyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaW4gdGhlIGh2
bWxvYWRlciBmb3IgdGhlIHJlYXNvbgo+Pj4gZXhwbGFpbmVkIGFib3ZlLgo+Pgo+PiBBcG9sb2dp
ZXMgZm9yIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGNvbnRleHQuIEJ1dCBJIGRpc2FncmVlIGFib3V0
Cj4+IGh2bWxvYWRlci4gUmV0dXJuaW5nICJkZW5pZWQiIGZyb20geGVuX3ZlcnNpb24gaHlwZXJj
YWxsIHRvIGd1ZXN0cyBpcwo+PiBvbmUgdGhpbmcsIGJ1dCBodm1sb2FkZXIgYW5kIFNNQmlvcyB0
YWJsZXMgYXJlIHBhcnRzIG9mIHRoZSBoeXBlcnZpc29yCj4+IGFuZCBwdXR0aW5nICJkZW5pZWQi
IHRoZXJlIGlzIHNpbXBseSBhIHRlcnJpYmxlIHVzZXIgZXhwZXJpZW5jZS4KPiAKPiBJIGFtIG5v
dCBnb2luZyB0byBjb21tZW50IG9uIHRoZSB1c2VyIGV4cGVyaWVuY2UgYmVjYXVzZSB0aGlzIGlz
IHVwIHRvCj4gYW5vdGhlciBiaWtlc2hlZGRpbmcuIFRoZSBxdWVzdGlvbiBpcyB3aGljaCBzdHJp
bmcgd2lsbCB5b3UgdXNlPyBXaHkgYW4KPiBlbXB0eSBzdHJpbmcgb3ZlciBzb21ldGhpbmcgZGlm
ZmVyZW50Pwo+IAo+IEhvd2V2ZXIsIGlmIGFuIGFkbWluIGhhcyBjb250cm9sIG92ZXIgdGhlICJk
ZW55IiBzdHJpbmcsIHdoeSB3b3VsZCBoZQo+IGV2ZXIgd2FudCB0byBmaWx0ZXIgaXQgaW4gaHZt
bG9hZGVyPyBXaHkgY2FuJ3QgaGUganVzdCByZXBsYWNlIHRoZSBvbmUKPiBpbiBLY29uZmlnPwoK
TW9zdCBhZG1pbnMgZG9uJ3QgY29tcGlsZSB0aGVpciBvd24gdmVyc2lvbiBvZiBYZW4uLi4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
