Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C8CF7E3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 13:12:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHnMd-0007PC-5N; Tue, 08 Oct 2019 11:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHnMb-0007P7-Oz
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 11:09:09 +0000
X-Inumbo-ID: 0c6145d4-e9bc-11e9-97cc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c6145d4-e9bc-11e9-97cc-12813bfff9fa;
 Tue, 08 Oct 2019 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570532948;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LBI2KRsb+wohUF6L8eCdTr1bkjzx4AJ+GCkcsH3jXoU=;
 b=LvD2ZWsmxWMdppL9vmPeF+vsi8oLQGv5FPB2ql6nc8wiaBy1DtPNcBCs
 wOyzzosaMOimYY54H5WaXsXBaClA1zUlqkDoXBCxXZ/g/EOPimV127u6C
 jgYXVLjEENxlTU6L34z++JiWD1gRrhpv5d5Jk2+LUomtB6GZW1QNSPdLt k=;
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
IronPort-SDR: uJ39FKXxZsCixcBGhtB2/le8tp8PSGBAuxsUAfK9RXTV6EXt57Sd7dQxFayeXy0ZLne1nYfY0V
 KB9UxgGHhks+eINo4hLgzqSVm6Rq8CMfs4uq5oD1vt2M+nTUaYGKzWDwUX7T5zhH0aqjrLk2rz
 UFZIu3a4v32b25+rYYd+o+OxgPkCwAVzdnqMZGpiW9WaZWi8DZAuoWt0ugtDrLvIQqef6uUN+X
 /Fxy+PtgXcsKTfSfJtJ24A5z/p3332Qutau8ueXx5So7y6UFzfjFGtdy1j2rPdQaFCUqxayB91
 cP0=
X-SBRS: 2.7
X-MesageID: 6973484
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6973484"
Date: Tue, 8 Oct 2019 13:09:01 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008110901.GC66437@Air-de-Roger>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
 <20191008092344.GB66437@Air-de-Roger>
 <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMTE6NDI6MjNBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDguMTAuMjAxOSAxMToyMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwMzozMzo0M1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMi4xMC4yMDE5IDEyOjQ5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGhvc3RfbWFza2FsbCBtYWtlcyBpdCBzdGlj
a3kgYWNyb3NzCj4gPj4+IGFzc2lnbiBhbmQgZGVhc3NpZ24gY2FsbHMsIHdoaWNoIG1lYW5zIHRo
YXQgb25jZSBhIGd1ZXN0IGZvcmNlcyBYZW4gdG8KPiA+Pj4gc2V0IGhvc3RfbWFza2FsbCB0aGUg
bWFza2FsbCBiaXQgaXMgbm90IGdvaW5nIHRvIGJlIGNsZWFyZWQgdW50aWwgYQo+ID4+PiBjYWxs
IHRvIFBIWVNERVZPUF9wcmVwYXJlX21zaXggaXMgcGVyZm9ybWVkLiBTdWNoIGNhbGwgaG93ZXZl
cgo+ID4+PiBzaG91bGRuJ3QgYmUgcGFydCBvZiB0aGUgbm9ybWFsIGZsb3cgd2hlbiBkb2luZyBQ
Q0kgcGFzc3Rocm91Z2gsIGFuZAo+ID4+PiBoZW5jZSB0aGUgZmxhZyBuZWVkcyB0byBiZSBjbGVh
cmVkIHdoZW4gYXNzaWduaW5nIGluIG9yZGVyIHRvIHByZXZlbnQKPiA+Pj4gaG9zdF9tYXNrYWxs
IGJlaW5nIGNhcnJpZWQgb3ZlciBmcm9tIHByZXZpb3VzIGFzc2lnbmF0aW9ucy4KPiA+Pj4KPiA+
Pj4gTm90ZSB0aGF0IG90aGVyIG1hc2sgZmllbGRzLCBsaWtlIGd1ZXN0X21hc2tlZCBvciB0aGUg
ZW50cnkgbWFza2JpdAo+ID4+PiBhcmUgYWxyZWFkeSByZXNldCB3aGVuIHRoZSBtc2l4IGNhcGFi
aWxpdHkgaXMgaW5pdGlhbGl6ZWQuCj4gPj4KPiA+PiBJIHRha2UgaXQgeW91IG1lYW4gYSBndWVz
dCBhY3Rpb24gaGVyZSwgYXMgUEhZU0RFVk9QX3ByZXBhcmVfbXNpeCBpcwo+ID4+IHNwZWNpZmlj
YWxseSBhYm91dCBzZXR0aW5nIHVwIHRoZSBhY3R1YWwgaGFyZHdhcmUncyBvbmU/Cj4gPiAKPiA+
IFJpZ2h0LCBvciBhbnkgcGF0aCB0aGF0IGNhbGxzIGludG8gbXNpeF9jYXBhYmlsaXR5X2luaXQg
KGllOiBRRU1VCj4gPiByZXF1ZXN0aW5nIHRvIG1hcCBhIFBJUlEgdG8gYW4gTVNJWCBlbnRyeSB3
aWxsIGFsc28gY2FsbCBpbnRvCj4gPiBtc2l4X2NhcGFiaWxpdHlfaW5pdCkuCj4gPiAKPiA+PiBU
aGlzIGhhcHBlbnMKPiA+PiBxdWl0ZSBhIGJpdCBsYXRlciB0aG91Z2gsIGkuZS4gLT5ndWVzdF9t
YXNrYWxsIG1heSBuZWVkIGV4cGxpY2l0bHkKPiA+PiBzZXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUg
YXMgeW91IGNsZWFyIC0+aG9zdF9tYXNrYWxsLiBGdXJ0aGVybW9yZSAuLi4KPiA+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMKPiA+Pj4gQEAgLTE1MDQsNyArMTUwNCwxMCBAQCBzdGF0aWMgaW50IGFz
c2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwg
dTMyIGZsYWcpCj4gPj4+ICAgICAgfQo+ID4+PiAgCj4gPj4+ICAgICAgaWYgKCBwZGV2LT5tc2l4
ICkKPiA+Pj4gKyAgICB7Cj4gPj4+ICAgICAgICAgIG1zaXh0YmxfaW5pdChkKTsKPiA+Pj4gKyAg
ICAgICAgcGRldi0+bXNpeC0+aG9zdF9tYXNrYWxsID0gZmFsc2U7Cj4gPj4+ICsgICAgfQo+ID4+
Cj4gPj4gLi4uIGRvaW5nIGp1c3QgdGhpcyB3b3VsZCB2aW9sYXRlIGFuIGFzc3VtZWQgcHJvcGVy
dHk6IEl0IG91Z2h0IHRvCj4gPj4gYmUgZmluZSB0byBhc3NlcnQgYXQgZXZlcnkgZW50cnkgb3Ig
ZXhpdCBwb2ludCB0aGF0IHRoZSBwaHlzaWNhbAo+ID4+IG1hc2thbGwgYml0IG9mIGFuIE1TSS1Y
LWVuYWJsZWQgZGV2aWNlIGlzIHRoZSBsb2dpY2FsIE9SIG9mCj4gPj4gLT5ob3N0X21hc2thbGwg
YW5kIC0+Z3Vlc3RfbWFza2FsbC4KPiA+IAo+ID4gSXMgdGhpcyBzdGlsbCB2YWxpZCBhdCB0aGlz
IHBvaW50LCBldmVuIHdpdGhvdXQgbXkgcGF0Y2g/Cj4gPiAKPiA+IFRoZSBoYXJkd2FyZSBkb21h
aW4gc2hvdWxkIGhhdmUgcGVyZm9ybWVkIGEgcmVzZXQgb2YgdGhlIGRldmljZSwgc28KPiA+IHRo
ZSBzdGF0ZSBvZiB0aGUgbWFza2FsbCBoYXJkd2FyZSBiaXQgc2hvdWxkIGJlIHRydWUsIHJlZ2Fy
ZGxlc3Mgb2YKPiA+IHRoZSBwcmV2aW91cyBzdGF0ZSBvZiBlaXRoZXIgdGhlIGd1ZXN0X21hc2th
bGwgb3IgdGhlIGhvc3RfbWFza2FsbAo+ID4gYml0cy4KPiAKPiBCdXQgYSByZXNldCBfY2xlYXJz
XyB0aGUgaGFyZHdhcmUgbWFza2FsbCBiaXQgKGFsb25nc2lkZSB0aGUKPiBlbmFibGUgb25lKS4K
ClJpZ2h0IHlvdSBhcmUsIEkgd2FzIGNvbmZ1c2luZyB0aGUgcmVzZXQgc3RhdGUgb2YgdGhlIG1h
c2thbGwgYml0IGFuZAp0aGUgcGVyLWVudHJ5IG1hc2sgYml0LgoKPiA+PiBJLmUuIEkgc2VlIHRo
ZSBmb2xsb3dpbmcKPiA+PiBvcHRpb25zOgo+ID4+Cj4gPj4gMSkgeW91ciB2YXJpYW50IGFjY29t
cGFuaWVkIGJ5IHVwZGF0aW5nIG9mIHRoZSBoYXJkd2FyZSBiaXQsCj4gPj4KPiA+PiAyKQo+ID4+
Cj4gPj4gICAgICAgICBwZGV2LT5tc2l4LT5ndWVzdF9tYXNrYWxsID0gcGRldi0+bXNpeC0+aG9z
dF9tYXNrYWxsOwo+ID4+ICAgICAgICAgcGRldi0+bXNpeC0+aG9zdF9tYXNrYWxsID0gZmFsc2U7
Cj4gPj4KPiA+PiBsZWF2aW5nIHRoZSBoYXJkd2FyZSBiaXQgYWxvbmUsIGFzIHRoZSBhYm92ZSB0
cmFuc2Zvcm1hdGlvbgo+ID4+IHdvdWxkbid0IGNoYW5nZSB3aGF0IGl0J3Mgc3VwcG9zZWQgdG8g
YmUgc2V0IHRvLAo+ID4+Cj4gPj4gMykKPiA+Pgo+ID4+ICAgICAgICAgcGRldi0+bXNpeC0+Z3Vl
c3RfbWFza2FsbCA9IHRydWU7Cj4gPj4gICAgICAgICBwZGV2LT5tc2l4LT5ob3N0X21hc2thbGwg
PSBmYWxzZTsKPiA+Pgo+ID4+IGFsb25nc2lkZSBzZXR0aW5nIHRoZSBiaXQgaW4gaGFyZHdhcmUg
KGlmIG5vdCBhbHJlYWR5IHNldCksCj4gPiAKPiA+IFRoYXQgc2VlbXMgbGlrZSB0aGUgYmVzdCBv
cHRpb24gSU1PLCBzaW5jZSBpdCdzIHRoZSByZXNldCBzdGF0ZSBvZiB0aGUKPiA+IGRldmljZSwg
YW5kIHNob3VsZCBiZSB0aGUgZXhwZWN0ZWQgb25lIHdoZW4gYXNzaWduaW5nIGEgZGV2aWNlIHRv
IGEKPiA+IGd1ZXN0Lgo+IAo+IEFzIHBlciBhYm92ZSAtIG5vLCBpdCdzIG5vdC4gV2UgbWFzayBp
bnRlcnJ1cHRzIGluIGhhcmR3YXJlCj4gKHRocm91Z2ggaW5kaXZpZHVhbCBtYXNrIGJpdHMgaWly
YykgYmVjYXVzZSBwY2lfcHJlcGFyZV9tc2l4KCkKPiBnZXRzIGludm9rZWQgYnkgRG9tMCBhaGVh
ZCBvZiBnaXZpbmcgdGhlIGRldmljZSB0byB0aGUgZ3Vlc3QsCj4gd2hpY2ggaW52b2x2ZXMgc2V0
dGluZyB0aGUgZW5hYmxlIGJpdCAoYW5kIGhlbmNlIHVubWFza2VkCj4gaW50ZXJydXB0cyBjb3Vs
ZCB0cmlnZ2VyKS4KCkknbSBhZnJhaWQgSSdtIGEgbGl0dGxlIGJpdCBsb3N0LiBTbyBpZiBwY2lf
cHJlcGFyZV9tc2l4IGdldHMgY2FsbGVkCmJlZm9yZSBhc3NpZ25pbmcgdGhlIGRldmljZSBpdCBt
ZWFucyB0aGVyZSdzIGEgY2FsbCB0bwpQSFlTREVWT1BfcHJlcGFyZV9tc2l4IGRvbmUgYnkgZG9t
MD8KCkkgc29tZWhvdyBhc3N1bWVkIHRoYXQgd291bGQgb25seSBoYXBwZW4gd2hlbiBkb20wIGlz
IGFjdHVhbGx5IHVzaW5nCnRoZSBkZXZpY2UsIGJ1dCBub3QgYXMgcGFydCBvZiBhIG5vcm1hbCBm
bG93IHdoZW4gdGhlIGRldmljZSBpcyBqdXN0CmJlaW5nIGFzc2lnbmVkIHRvIGd1ZXN0cyB3aXRo
b3V0IHRoZSBkb20wIHVzaW5nIGl0IGF0IGFsbC4KCklzIHRoZXJlIHNvbWUgZG9jdW1lbnRhdGlv
biBhYm91dCB3aGF0IGRvbTAgaXMgZXhwZWN0ZWQgdG8gcGVyZm9ybQp3aGVuIGFzc2lnbmluZyBh
bmQgZGVhc3NpZ25pbmcgZGV2aWNlcyB0byBndWVzdHM/CgpHaXZlbiB0aGF0IGFzIHlvdSBjb3Jy
ZWN0bHkgcG9pbnQgb3V0IG1hc2thbGwgaXMgdW5zZXQgYWZ0ZXIgZGV2aWNlCnJlc2V0LCBJIGZl
ZWwgdGhhdCBvcHRpb24gNCBpcyB0aGUgYmVzdCBvbmUgc2luY2UgaXQgbWF0Y2hlcyB0aGUgc3Rh
dGUKb2YgdGhlIGhhcmR3YXJlIGFmdGVyIHJlc2V0LgoKPiAKPiA+PiA0KQo+ID4+Cj4gPj4gICAg
ICAgICBwZGV2LT5tc2l4LT5ndWVzdF9tYXNrYWxsID0gZmFsc2U7Cj4gPj4gICAgICAgICBwZGV2
LT5tc2l4LT5ob3N0X21hc2thbGwgPSBmYWxzZTsKPiA+Pgo+ID4+IGFsb25nc2lkZSBjbGVhcmlu
ZyB0aGUgYml0IGluIGhhcmR3YXJlIChpZiBub3QgYWxyZWFkeSBjbGVhciksCj4gPj4gcmVseWlu
ZyBvbiBhbGwgZW50cmllcyBiZWluZyBpbmRpdmlkdWFsbHkgbWFza2VkICh3aGljaCBvdWdodAo+
ID4+IHRvIGJlIHRoZSBzdGF0ZSBhZnRlciB0aGUgaW5pdGlhbCBtc2l4X2NhcGFiaWxpdHlfaW5p
dCgpKS4KPiA+Pgo+ID4+IEluIGFsbCBjYXNlcyB0aGUgb3BlcmF0aW9uIHdvdWxkIGxpa2VseSBi
ZXR0ZXIgYmUgZG9uZSBieQo+ID4+IGNhbGxpbmcgYSBmdW5jdGlvbiB0byBiZSBwdXQgaW4geDg2
L21zaS5jLgo+ID4gCj4gPiBNYXliZSBuYW1lIGl0IHBjaV9yZXNldF9tc2l4X3N0YXRlPwo+IAo+
IFRoZSBjb21tb24gbmFtaW5nIHBhdHRlcm4gaW4gdGhlIGZpbGUgc2VlbXMgdG8gYmUgdG8gc3Rh
cnQgd2l0aAo+IG1zaV8gb3IgbXNpeF8sIHNvIHBlcmhhcHMgYmV0dGVyIG1zaXhfcmVzZXRfc3Rh
dGUoKT8gSSBjb3VsZAo+IGxpdmUgd2l0aCB5b3VyIHN1Z2dlc3RlZCBuYW1lZCB0aG91Z2guCgpJ
IGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBlaXRoZXIsIGFkZGVkIHRoZSBwY2lfIHByZWZp
eCBiZWZvcmUKbW9zdCBnbG9iYWwgZnVuY3Rpb25zIGluIHRoZSBmaWxlIHNlZW0gdG8gZG8gc28s
IG1zaXhfIHByZWZpeGVkCmZ1bmN0aW9ucyBzZWVtIHRvIGJlIG1vc3RseSBzdGF0aWMuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
