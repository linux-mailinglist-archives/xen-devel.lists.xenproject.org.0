Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55E9CC1C1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRNJ-0007OK-Ho; Fri, 04 Oct 2019 17:28:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihSl=X5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iGRNI-0007OC-FO
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:28:16 +0000
X-Inumbo-ID: 58e627fa-e6cc-11e9-96dc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e627fa-e6cc-11e9-96dc-bc764e2007e4;
 Fri, 04 Oct 2019 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570210095;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lUtunnrL5RFDWPSS0nbVoLnbRteyjchwMzUGe70r1VU=;
 b=Bn7pL3n9Zm15MLo1vtfg5k/YkTNRZut/2DXHV9/7Y26TMj42ycHqEQYp
 qgOLD1pluRpMo8zPJXZBIQ+cukfSytHurFTb/+JRZYIklXfvVrE8qAgmT
 ZrxtWlcazfUTrklXwUrLLFtNAsj6oAKMV+ormIpttrLYjPSbguUglk1ly A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oNVXnSR+zRdPtT/qsSvrgv4M71B7NWUfkCm0//C6UzGSptDecoQaFVe7Q8Dpy1F4P5PWKRkdgn
 annfTZ4C1Bq4H7JP/nnYA7nzNw0UJ3lY5Ds3ZrBA1XWJRFfrNyS+pCVk16q5YE9BeqD1q9w9WG
 paugSbL23ji91q5MOLxnUpnd89SxIq4on07e2qtdEvTaa3/+jkroGtWXS7k5/AEJ+Or244AgJS
 v7pMPPVh8DPoNWxglPxFizTSsp0Y6On/RUzdhlQAMICTcklLh+qjFGUEIiwuFF/KQWTyHi2HBM
 ylY=
X-SBRS: 2.7
X-MesageID: 6559150
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6559150"
To: Jan Beulich <jbeulich@suse.com>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
 <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
 <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f7f47cb5-a08b-ca08-93df-73427d94b847@citrix.com>
Date: Fri, 4 Oct 2019 18:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTAuMjAxOSAx
NToxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYvMDkvMjAxOSAxNToyOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBAQCAtMTA2OCw4ICsxMDY3LDI5IEBAIHN0YXRpYyB2b2lkICogX19p
bml0IGFsbG9jYXRlX3Bwcl9sb2coc3QKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIElPTU1VX1BQUl9MT0dfREVGQVVMVF9FTlRSSUVTLCAiUFBSIExvZyIpOwo+Pj4gIH0KPj4+
ICAKPj4+ICsvKgo+Pj4gKyAqIFdpdGhpbiBpdnJzX21hcHBpbmdzW10gd2UgYWxsb2NhdGUgYW4g
ZXh0cmEgYXJyYXkgZWxlbWVudCB0byBzdG9yZQo+Pj4gKyAqIC0gc2VnbWVudCBudW1iZXIsCj4+
PiArICogLSBkZXZpY2UgdGFibGUuCj4+PiArICovCj4+PiArI2RlZmluZSBJVlJTX01BUFBJTkdT
X1NFRyhtKSAobSlbaXZyc19iZGZfZW50cmllc10uZHRlX3JlcXVlc3Rvcl9pZAo+Pj4gKyNkZWZp
bmUgSVZSU19NQVBQSU5HU19ERVZUQUIobSkgKG0pW2l2cnNfYmRmX2VudHJpZXNdLmludHJlbWFw
X3RhYmxlCj4+PiArCj4+PiArc3RhdGljIHZvaWQgX19pbml0IGZyZWVfaXZyc19tYXBwaW5nKHZv
aWQgKnB0cikKPj4+ICt7Cj4+PiArICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJz
X21hcHBpbmdzID0gcHRyOwo+PiBIb3cgYWJzb2x1dGVseSBjZXJ0YWluIGFyZSB3ZSB0aGF0IHB0
ciB3aWxsIG5ldmVyIGJlIE5VTEw/Cj4gQXMgY2VydGFpbiBhcyB3ZSBjYW4gYmUgYnkgbmV2ZXIg
aW5zdGFsbGluZyBhIE5VTEwgcG9pbnRlciBpbnRvIHRoZQo+IHJhZGl4IHRyZWUsIGFuZCBieSBv
YnNlcnZpbmcgdGhhdCBuZWl0aGVyIHJhZGl4X3RyZWVfZGVzdHJveSgpIG5vcgo+IHJhZGl4X3Ry
ZWVfbm9kZV9kZXN0cm95KCkgd291bGQgZXZlciBjYWxsIHRoZSBjYWxsYmFjayBmb3IgYSBOVUxM
Cj4gbm9kZS4KPgo+PiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gcmVuYW1lIHRoaXMgdG8gcmFkaXhf
dHJlZV9mcmVlX2l2cnNfbWFwcGluZ3MoKSB0bwo+PiBtYWtlIGl0IGNsZWFyIHdobyBjYWxscyBp
dCwgYW5kIGFsc28gcHJvdmlkZSBhIGhpbnQgYXMgdG8gd2h5IHRoZQo+PiBwYXJhbWV0ZXIgaXMg
dm9pZC4KPiBJJ20gbm90IGhhcHB5IHRvIGFkZCBhIHJhZGl4X3RyZWVfIHByZWZpeDsgSSdkIGJl
IGZpbmUgd2l0aCBhZGRpbmcKPiBlLmcuIGRvXyBpbnN0ZWFkLCBpbiBjYXNlIHRoaXMgcHJvdmlk
ZXMgZW5vdWdoIG9mIGEgaGludCBmb3IgeW91cgo+IHRhc3RlIHRoYXQgdGhpcyBpcyBhY3R1YWxs
eSBhIGNhbGxiYWNrIGZ1bmN0aW9uLgoKSG93IGFib3V0IGEgX2NhbGxiYWNrKCkgc3VmZml4P8Kg
IEknbSBsb29raW5nIHRvIG1ha2UgaXQgb2J2aW91cyB0aGF0IHlvdQpjb2RlIHNob3VsZG4ndCBz
aW1wbHkgY2FsbCBpdCBkaXJlY3RseS4KCkEgImRvXyIgcHJlZml4LCBpbiBwYXJ0aWN1bGFyLCBw
cm92aWRlcyBubyB1c2VmdWwgaW5mb3JtYXRpb24gdG8gdGhlIHJlYWRlci4KCj4+PiBAQCAtMTA4
MiwxMyArMTEwMiwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdF9vbmUoc3Ry
Cj4+PiAgICAgIGlmICggaW50ciAmJiAhc2V0X2lvbW11X2ludGVycnVwdF9oYW5kbGVyKGlvbW11
KSApCj4+PiAgICAgICAgICBnb3RvIGVycm9yX291dDsKPj4+ICAKPj4+IC0gICAgLyogVG8gbWFr
ZSBzdXJlIHRoYXQgZGV2aWNlX3RhYmxlLmJ1ZmZlciBoYXMgYmVlbiBzdWNjZXNzZnVsbHkgYWxs
b2NhdGVkICovCj4+PiAtICAgIGlmICggZGV2aWNlX3RhYmxlLmJ1ZmZlciA9PSBOVUxMICkKPj4+
ICsgICAgLyogTWFrZSBzdXJlIHRoYXQgdGhlIGRldmljZSB0YWJsZSBoYXMgYmVlbiBzdWNjZXNz
ZnVsbHkgYWxsb2NhdGVkLiAqLwo+Pj4gKyAgICBpdnJzX21hcHBpbmdzID0gZ2V0X2l2cnNfbWFw
cGluZ3MoaW9tbXUtPnNlZyk7Cj4+PiArICAgIGlmICggIUlWUlNfTUFQUElOR1NfREVWVEFCKGl2
cnNfbWFwcGluZ3MpICkKPj4gVGhpcyBpcyBzdGlsbCBnb2luZyB0byBjcmFzaCB3aXRoIGEgTlVM
TCBwb2ludGVyIGRlZmVyZW5jZSBpbiB0aGUgY2FzZQo+PiBkZXNjcmliZWQgYnkgdGhlIGNvbW1l
bnQuwqAgKFRoZW4gYWdhaW4sIGl0IG1heSBub3QgY3Jhc2gsIGFuZCBoaXQKPj4gdXNlcnNwYWNl
IGF0IHRoZSA2NE0gbWFyay4pCj4+Cj4+IFlvdSBhYnNvbHV0ZWx5IG5lZWQgdG8gY2hlY2sgaXZy
c19tYXBwaW5ncyBiZWluZyBub24gTlVMTCBiZWZvcmUgdXNpbmcKPj4gSVZSU19NQVBQSU5HU19E
RVZUQUIoKSwgb3IgcGVyaGFwcyByb2xsIHRoZSBjaGVjayBpbnRvIHRoZSBtYWNyby4KPiBJIGNh
biBvbmx5IHJlcGVhdCB3aGF0IEkndmUgc2FpZCBpbiByZXBseSB0byB5b3VyIHJlc3BlY3RpdmUg
djYgcmVtYXJrOgo+IFdlIHdvbid0IGNvbWUgaGVyZSBmb3IgYW4gSU9NTVUgd2hpY2ggZGlkbid0
IGhhdmUgaXRzIGl2cnNfbWFwcGluZ3MKPiBzdWNjZXNzZnVsbHkgYWxsb2NhdGVkLgoKUmlnaHQs
IGJ1dCB0byBhIGZpcnN0IGFwcHJveGltYXRpb24sIEkgZG9uJ3QgY2FyZS7CoCBJIGNhbiBwaWN0
dXJlCmV4YWN0bHkgd2hhdCBDb3Zlcml0eSB3aWxsIHNheSBhYm91dCB0aGlzLCBpbiB0aGF0IHJh
ZGl4X3RyZWVfbG9va3VwKCkKbWF5IHJldHVybiBOVUxMLCBhbmQgaXQgaXMgdXNlZCBoZXJlIHVu
Y29uZGl0aW9uYWxseSB3aGVyZSBpbiBtb3N0IG90aGVyCmNvbnRleHRzLCB0aGUgcG9pbnRlciBn
ZXRzIGNoZWNrZWQgYmVmb3JlIHVzZS4KCj4gWW91IGFsc28gc2VlbSB0byBiZSBtaXhpbmcgdXAg
dGhpcyBhbmQgdGhlCj4gZGV2aWNlIHRhYmxlIGFsbG9jYXRpb24gLSB0aGUgY29tbWVudCByZWZl
cnMgdG8gdGhlIGxhdHRlciwgd2hpbGUgeW91cgo+IE5VTEwgZGVyZWYgY29uY2VybiBpcyBhYm91
dCB0aGUgZm9ybWVyLiAoSWYgeW91IGdvIHRocm91Z2ggdGhlIGNvZGUKPiB5b3UnbGwgZmluZCB0
aGF0IHdlIGhhdmUgbnVtZXJvdXMgb3RoZXIgcGxhY2VzIHV0aWxpemluZyB0aGUgZmFjdCB0aGF0
Cj4gZ2V0X2l2cnNfbWFwcGluZ3MoKSBjYW4ndCBmYWlsIGluIGNhc2VzIGxpa2UgdGhlIG9uZSBh
Ym92ZS4pCgpUaGUgZXhpc3RpbmcgY29kZSBiZWluZyB0ZXJyaWJsZSBpc24ndCBhIHJlYXNvbmFi
bGUganVzdGlmaWNhdGlvbiBmb3IKYWRkaW5nIHRvIHRoZSBtZXNzLgoKSXQgYXBwZWFycyB3ZSBo
YXZlOgoKMXggYXNzZXJ0IG5vdCBudWxsCjE0eCBibGluZCB1c2UKM3ggY2hlY2sKCndoaWNoIGlz
bid0IGEgZ3JlYXQgc3RhdGVtZW50IGFib3V0IHRoZSBxdWFsaXR5IG9mIHRoZSBjb2RlLgoKU2Vl
aW5nIGFzIHdlIGFyZSBwdXNoZWQgdG8gdGhlIGRlYWRsaW5lIGZvciA0LjEzLCBiZWdydWRnaW5n
bHkgQS1ieQoocHJlZmVyYWJseSB3aXRoIHRoZSBfY2FsbGJhY2soKSBzdWZmaXgpLCBidXQgSSdt
IHN0aWxsIG5vdCBoYXBweSB3aXRoCnRoZSBvdmVyYWxsIHF1YWxpdHkgb2YgdGhlIGNvZGUuwqAg
QXQgbGVhc3QgaXQgaXNuJ3QgZ2V0dGluZwpzdWJzdGFudGlhbGx5IHdvcnNlIGFzIGEgY29uc2Vx
dWVuY2UgaGVyZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
