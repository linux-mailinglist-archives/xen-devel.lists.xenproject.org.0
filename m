Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54493109FE7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbT5-0006MF-Bc; Tue, 26 Nov 2019 14:05:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kHA=ZS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZbT4-0006M8-01
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:05:26 +0000
X-Inumbo-ID: b9994eb3-1055-11ea-a3a2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9994eb3-1055-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574777096;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pCCYrerrQ89bX3kOkjq8Pb6GY1ff8ghMS2/wWNYnu1s=;
 b=JZhR4nqElN5zxO6mxgk4Ptp1wkqeasER0rwRQ3GCAmwROKmmOPZsjZpm
 Zmm504lGiSBpVr6vumHWvoMUHlo6nP2r9CPSesl3Z2bFmca1I3YfuDjUp
 PtkhdX0qMrCq70yAXRp1kdy1bEpQ1HECd1zhBLcRttxBVwjziFQQIx404 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CAO3nf4iIWYHBGul97aM45dD9SV49RIu1HrVCG/j0+LEuV8pmrBgWzpJZ586qIwkGlUw/StQ3B
 U2JomupFFBQBOp0ucYtoqUviqI/MHQfCcw0l0XjrW6wByLvP5cD907a4sW1dObhb1P2pwUgzGn
 TlSQiCVDXEBT/Zl7UYL4MI9YX92jn+64rUDaYxc9GH/AUBjLJmtNQTzvurhKGHtQvFuFOqKn9P
 h7xHmMaTpIWvE2q995gOlr+iL3VTHufKnIrq2JePZYx9pIxHMrzewx0fgaCVNj7w2E7yVINI9i
 QHc=
X-SBRS: 2.7
X-MesageID: 9395955
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9395955"
To: "Durrant, Paul" <pdurrant@amazon.com>, Paul Durrant <pdurrant@gmail.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
 <cce5aa9a-6d3d-49ac-b633-21eaa1fcbd69@citrix.com>
 <fd50674c8f3c433093a92439c6778f8f@EX13D32EUC003.ant.amazon.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <98fc23c0-ece0-8d4d-fddd-1468f7c4e166@citrix.com>
Date: Tue, 26 Nov 2019 14:04:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fd50674c8f3c433093a92439c6778f8f@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgMToyNiBQTSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgo+PiBTZW50OiAyNiBOb3ZlbWJlciAyMDE5IDEyOjMyCj4+IFRvOiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGdtYWlsLmNvbT47IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
b20+Cj4+IENjOiB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFN0
ZWZhbm8gU3RhYmVsbGluaQo+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1Cj4+IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlCj4+IER1bmxhcCA8R2Vv
cmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsg
SmFuCj4+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIXSBkb21haW5fY3JlYXRlOiBob25vdXIgZ2xvYmFsCj4+IGdyYW50L21hcHRy
YWNrIGZyYW1lIGxpbWl0cy4uLgo+Pgo+PiBPbiAxMS8yNi8xOSAxMTozMCBBTSwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+Pj4gT24gV2VkLCAxMyBOb3YgMjAxOSBhdCAxMzo1NSwgUGF1bCBEdXJyYW50
IDxwZHVycmFudEBhbWF6b24uY29tPiB3cm90ZToKPj4+Pgo+Pj4+IC4uLndoZW4gdGhlaXIgdmFs
dWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBjb25maWd1cmVkIGxpbWl0cy4KPj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
Pj4+PiAtLS0KPj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4+PiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+
Pj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPj4+PiBDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPgo+Pj4+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+Cj4+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPj4+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+Pgo+Pj4+IEFmdGVyIG1p
bmluZyB0aHJvdWdoIGNvbW1pdHMgaXQgaXMgc3RpbGwgdW5jbGVhciB0byBtZSBleGFjdGx5IHdo
ZW4gWGVuCj4+Pj4gc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1dCBJIHJl
YWxseSB0aGluayB0aGlzIGNvbW1pdAo+PiBzaG91bGQKPj4+PiBiZSBiYWNrLXBvcnRlZCB0byBz
dGFibGUgdHJlZXMgYXMgaXQgd2FzIGEgYmVoYXZpb3VyYWwgY2hhbmdlIHRoYXQgY2FuCj4+Pj4g
Y2F1c2UgZG9tVXMgdG8gZmFpbCBpbiBub24tb2J2aW91cyB3YXlzLgo+Pj4KPj4+IEFueSBvdGhl
ciBvcGluaW9ucyBvbiB0aGlzPyBBRkFJQ1QgcXVlc3Rpb25zIGlzIHN0aWxsIG9wZW46Cj4+Pgo+
Pj4gLSBEbyB3ZSBjb25zaWRlciBub3QgaG9ub3VyaW5nIHRoZSBjb21tYW5kIGxpbmUgdmFsdWVz
IHRvIGJlIGEKPj4+IHJlZ3Jlc3Npb24gKHNpbmNlIGRvbVVzIHRoYXQgd291bGQgaGF2ZSB3b3Jr
ZWQgYmVmb3JlIHdpbGwgbm8gbG9uZ2VyCj4+PiB3b3JrIGFmdGVyIGEgYmFzaWMgdXBncmFkZSBv
ZiBYZW4pPwo+Pgo+PiBUaGlzIHdvdWxkIGJlIGEgYml0IGVhc2llciB0byBmb3JtIGEgInBvbGlj
eSIgb3BpbmlvbiBvbiAob3IgcGVyaGFwcwo+PiBhbHRlcm5hdGUgc29sdXRpb25zIHRvKSBpZiBt
b3JlIG9mIHRoZSBzaXR1YXRpb24gd2VyZSBvdXRsaW5lZCBoZXJlLgo+Pgo+PiBJcyB0aGUgcHJv
YmxlbSB0aGF0IHRoZSBwZXItZG9tYWluIGNvbmZpZyBpcyBhbHdheXMgc2V0LCBhbmQgZG9lc24n
dAo+PiB0YWtlIHRoZSBoeXBlcnZpc29yLXNldCBjb25maWcgaW50byBhY2NvdW50PyAgV291bGRu
J3QgaXQgYmUgYmV0dGVyIHRvCj4+IG1vZGlmeSB0aGUgdG9vbHN0YWNrIHRvIHVzZSB0aGUgaHlw
ZXJ2aXNvciB2YWx1ZSBpZiBpdCdzIG5vdCBzZXQ/Cj4+Cj4+IEluIGZhY3QsIGl0IGxvb2tzIGtp
bmQgb2YgbGlrZSB0aGluZ3MgYXJlIHNjcmV3ZWQgdXAgYW55d2F5IC0tIHRoZQo+PiAiZGVmYXVs
dCIgdmFsdWUgb2YgbWF4X2dyYW50X2ZyYW1lcywgaWYgbm8gdmFsdWUgaXMgc3BlY2lmaWVkLCBp
cyBzZXQgaW4KPj4geGwuYy4gIElmIHRoYXQgd2VyZSB0aGUgYmVoYXZpb3Igd2Ugd2FudGVkLCBp
dCBzaG91bGQgYmUgc2V0IGluIGxpYnhsLmMuCj4+Cj4+IEJ1dCBpdCBkb2Vzbid0IHNlZW0gbGlr
ZSBpdCBzaG91bGQgYmUgdGVycmlibHkgZGlmZmljdWx0IHRvIGdldCBhICJ1c2UKPj4gdGhlIGRl
ZmF1bHQiIHNlbnRpbmVsIHZhbHVlIHBhc3NlZCBpbiB0byBYZW4sIHN1Y2ggdGhhdDoKPj4KPj4g
MS4gUGVvcGxlIHdobyBkb24ndCBkbyBhbnl0aGluZyB3aWxsIGdldCB0aGUgZGVmYXVsdCBjdXJy
ZW50bHkgc3BlY2lmaWVkCj4+IGluIHhsLmMKPj4KPj4gMi4gUGVvcGxlIHdobyBzZXQgdGhlIHZh
bHVlIG9uIHRoZSBYZW4gY29tbWFuZC1saW5lIGFuZCBkb24ndCBzZXQKPj4gYW55dGhpbmcgaW4g
dGhlIGd1ZXN0IGNvbmZpZyBmaWxlIHdpbGwgZ2V0IHRoZSBYZW4gY29tbWFuZC1saW5lIHZhbHVl
Cj4+Cj4+IDMuIFBlb3BsZSB3aG8gc2V0IHRoZSB2YWx1ZSBpbiB0aGUgY29uZmlnIGZpbGUgd2ls
bCBnZXQgdGhlIHZhbHVlIHRoZXkKPj4gc3BlY2lmaWVkIChyZWdhcmRsZXNzIG9mIHRoZSBnbG9i
YWwgc2V0dGluZykuCj4+Cj4+IElzIHRoYXQgdGhlIGJlaGF2aW91ciB5b3UnZCBsaWtlIHRvIHNl
ZSwgUGF1bD8KPiAKPiBJIHRoaW5rIHRoZSBvcmRlciBzaG91bGQgYmU6Cj4gCj4gSWYgc2V0IGlu
IHhsLmNmZyA9PiB1c2UgdGhhdCwgZWxzZQo+IElmIHNldCBpbiB4bC5jb25mID0+IHVzZSB0aGF0
LCBlbHNlCj4gVXNlIHRoZSBjb21tYW5kIGxpbmUvZGVmYXVsdCB2YWx1ZQo+IAo+IEkuZS4gdGhl
IHVsdGltYXRlIHZhbHVlIHNob3VsZCBiZSBzZXQgaW4gWGVuIChhbmQgcG9zc2libHkgb3ZlcnJp
ZGRlbiBieSB0aGUgY29tbWFuZCBsaW5lKSBhbmQgbm90IGhhcmRjb2RlZCBhdCBhbnkgb3RoZXIg
bGF5ZXIuCj4gCj4gVGhlcmUgaXMgYWxzbyB0aGUgaXNzdWUgb2YgbGltaXRzIGJ1dCBJIGd1ZXNz
IHRoZSByYXRpb25hbGUgdGhlcmUgc2hvdWxkIGJlOiBJZiBhIHZhbHVlICppcyogc3BlY2lmaWVk
IHRoZW4gaXQgc2hvdWxkIG5vdCBleGNlZWQgdGhlIHZhbHVlIHNldCBpbiBYZW4uCj4gCj4gRG9l
cyB0aGF0IHNvdW5kIHJpZ2h0PwoKU28gcGFydCBvZiB0aGUgaXNzdWUgaGVyZSBzb3VuZHMgbGlr
ZSBhIHRlcm1pbm9sb2d5IGlzc3VlLiAgSXMgaXQgdGhlCmNhc2UgdGhhdCB0aGVyZSdzIGEgZGVm
YXVsdCAibWF4IiwgYW5kIHlvdSB3YW50IHRvIHJhaXNlIHRoZSBkZWZhdWx0CiJtYXgiOyBpcyB0
aGF0IHJpZ2h0PwoKQnV0IHRoZSBkb2N1bWVudGF0aW9uIGFjdHVhbGx5IHNheXM6CgoiU3BlY2lm
eSB0aGUgbWF4aW11bSBudW1iZXIgb2YgZnJhbWVzIHdoaWNoIGFueSBkb21haW4gbWF5IHVzZSBh
cyBwYXJ0Cm9mIGl0cyBncmFudCB0YWJsZS4iCgpXaGljaCBtYWtlcyBpdCBzb3VuZCBhIGxvdCBt
b3JlIGxpa2UgYSAibWF4aW11bSBtYXgiIC0tIGkuZS4sIHRoYXQgYW55CmRvbWFpbiB3aGljaCBp
cyBjcmVhdGVkIHdpdGggYSB2YWx1ZSBoaWdoZXIgdGhhbiB0aGlzIHNob3VsZCBmYWlsLgoKIC1H
ZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
