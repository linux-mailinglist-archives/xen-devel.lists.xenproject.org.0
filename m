Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125A14309B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itaWV-00022z-BZ; Mon, 20 Jan 2020 17:07:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itaWU-00022u-Gj
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 17:07:34 +0000
X-Inumbo-ID: 57927361-3ba7-11ea-b9a8-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57927361-3ba7-11ea-b9a8-12813bfff9fa;
 Mon, 20 Jan 2020 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579540051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N0OxTA52ssjTCDvzRD97284G34p1qK0aZQgg2wzhO2s=;
 b=aYwvTHQMqUJBnYr0bbTtSgl3kwHFNQzXvhO0ZDY/byLdGE6+xOt/R7/X
 8kogiO/4GcYkmpsaJQKVSjAdD1f8eMarg55zsvOsTBE0wT3vc5YbA1hp5
 rzOvb876kTIXghWijZBmoDHT6V0QlsjYjW5R5A0Uk9wYWE+W+cc9p1jZK 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oL9Pz3BYcziFhy+l3l+05wXt5Z1YJgRuzvhfJrEGBTQZ+oOmFwNWgR0YXwdud6R8xTMFi8DGxZ
 UbxtNjjEDmis3PqZDcQbd8VWdH3wnyqU3cCF2roYLD49f1YstuaZ/CMlhVKeesHZxz6k6Shf/M
 4DGhn1HcEUttaxM80UN8FRgumQkPuWS06DKkaIEPlsaff7uE2N0X4xWCYC+i47WVpmJGbhxdMX
 nMMfGNga/HhH+qVC203abcwFN5nlDhGXh+2wD3vnXq2oPmvLhWHz2Txfi0RkMWlJiLsmcKF9tU
 MhQ=
X-SBRS: 2.7
X-MesageID: 11537364
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11537364"
Date: Mon, 20 Jan 2020 17:06:58 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120170658.GE11756@Air-de-Roger>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
 <20200120160732.GC11756@Air-de-Roger>
 <a3b70e5b-d017-c934-ea84-46e3d653905f@suse.com>
 <20200120163727.GD11756@Air-de-Roger>
 <53c44379-50a6-4a82-62b3-69029375b6ea@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53c44379-50a6-4a82-62b3-69029375b6ea@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
 KevinTian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDU6NDE6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDEuMjAyMCAxNzozNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgSmFuIDIwLCAyMDIwIGF0IDA1OjE1OjIyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIwLjAxLjIwMjAgMTc6MDcsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4+
PiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAwNDo0MjoyMlBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4g
Pj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ID4+Pj4gQEAg
LTE0OTMsMTggKzE0OTMsMjggQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0
cnVjdAo+ID4+Pj4gICAgICAgICAgaWYgKCBmaW5kX3Vwc3RyZWFtX2JyaWRnZShzZWcsICZidXMs
ICZkZXZmbiwgJnNlY2J1cykgPCAxICkKPiA+Pj4+ICAgICAgICAgICAgICBicmVhazsKPiA+Pj4+
ICAKPiA+Pj4+ICsgICAgICAgIC8qCj4gPj4+PiArICAgICAgICAgKiBNYXBwaW5nIGEgYnJpZGdl
IHNob3VsZCwgaWYgYW55dGhpbmcsIHBhc3MgdGhlIHN0cnVjdCBwY2lfZGV2IG9mCj4gPj4+PiAr
ICAgICAgICAgKiB0aGF0IGJyaWRnZS4gU2luY2UgYnJpZGdlcyBkb24ndCBub3JtYWxseSBnZXQg
YXNzaWduZWQgdG8gZ3Vlc3RzLAo+ID4+Pj4gKyAgICAgICAgICogdGhlaXIgb3duZXIgd291bGQg
YmUgdGhlIHdyb25nIG9uZS4gUGFzcyBOVUxMIGluc3RlYWQuCj4gPj4+PiArICAgICAgICAgKi8K
PiA+Pj4+ICAgICAgICAgIHJldCA9IGRvbWFpbl9jb250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwg
ZHJoZC0+aW9tbXUsIGJ1cywgZGV2Zm4sCj4gPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBidXMsIGRldmZuKSk7Cj4gPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKPiA+Pj4+ICAK
PiA+Pj4+ICAgICAgICAgIC8qCj4gPj4+PiAgICAgICAgICAgKiBEZXZpY2VzIGJlaGluZCBQQ0ll
LXRvLVBDSS9QQ0l4IGJyaWRnZSBtYXkgZ2VuZXJhdGUgZGlmZmVyZW50Cj4gPj4+PiAgICAgICAg
ICAgKiByZXF1ZXN0ZXItaWQuIEl0IG1heSBvcmlnaW5hdGUgZnJvbSBkZXZmbj0wIG9uIHRoZSBz
ZWNvbmRhcnkgYnVzCj4gPj4+PiAgICAgICAgICAgKiBiZWhpbmQgdGhlIGJyaWRnZS4gTWFwIHRo
YXQgaWQgYXMgd2VsbCBpZiB3ZSBkaWRuJ3QgYWxyZWFkeS4KPiA+Pj4+ICsgICAgICAgICAqCj4g
Pj4+PiArICAgICAgICAgKiBTb21ld2hhdCBzaW1pbGFyIGFzIGZvciBicmlkZ2VzLCB3ZSBkb24n
dCB3YW50IHRvIHBhc3MgYSBzdHJ1Y3QKPiA+Pj4+ICsgICAgICAgICAqIHBjaV9kZXYgaGVyZSAt
IHRoZXJlIG1heSBub3QgZXZlbiBleGlzdCBvbmUgZm9yIHRoaXMgKHNlY2J1cywwLDApCj4gPj4+
PiArICAgICAgICAgKiB0dXBsZS4gSWYgdGhlcmUgaXMgb25lLCB3aXRob3V0IHByb3Blcmx5IHdv
cmtpbmcgZGV2aWNlIGdyb3VwcyBpdAo+ID4+Pj4gKyAgICAgICAgICogbWF5IGFnYWluIG5vdCBo
YXZlIHRoZSBjb3JyZWN0IG93bmVyLgo+ID4+Pj4gICAgICAgICAgICovCj4gPj4+PiAgICAgICAg
ICBpZiAoICFyZXQgJiYgcGRldl90eXBlKHNlZywgYnVzLCBkZXZmbikgPT0gREVWX1RZUEVfUENJ
ZTJQQ0lfQlJJREdFICYmCj4gPj4+PiAgICAgICAgICAgICAgIChzZWNidXMgIT0gcGRldi0+YnVz
IHx8IHBkZXYtPmRldmZuICE9IDApICkKPiA+Pj4+ICAgICAgICAgICAgICByZXQgPSBkb21haW5f
Y29udGV4dF9tYXBwaW5nX29uZShkb21haW4sIGRyaGQtPmlvbW11LCBzZWNidXMsIDAsCj4gPj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF9w
ZGV2KHNlZywgc2VjYnVzLCAwKSk7Cj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCk7Cj4gPj4+Cj4gPj4+IElzbid0IGl0IGRhbmdlcm91cyB0
byBtYXAgdGhpcyBkZXZpY2UgdG8gdGhlIGd1ZXN0LCBhbmQgdGhhdCBtdWx0aXBsZQo+ID4+PiBn
dWVzdHMgbWlnaHQgZW5kIHVwIHdpdGggdGhlIHNhbWUgZGV2aWNlIG1hcHBlZD8KPiA+Pgo+ID4+
IFRoZXkgd29uJ3QgKGFmYWljdCkgLSBzZWUgdGhlIGNoZWNraW5nIGRvbmUgYnkgZG9tYWluX2Nv
bnRleHRfbWFwcGluZ19vbmUoKQo+ID4+IHdoZW4gaXQgZmluZHMgYW4gYWxyZWFkeSBwcmVzZW50
IGNvbnRleHQgZW50cnkuIFRoZSBmaXJzdCBvbmUgdG8gbWFrZSBzdWNoCj4gPj4gYSBtYXBwaW5n
IHdpbGwgd2luLgo+ID4gCj4gPiBSaWdodCwgdGhhbmtzLCBJIGZpbmQgYWxsIHRoaXMgY29kZSBx
dWl0ZSBjb25mdXNpbmcuIElmIHRoZSBpb21tdQo+ID4gY29udGV4dCBpcyBhc3NpZ25lZCB0byBh
IGRvbWFpbiwgd29uJ3QgaXQgbWFrZSBzZW5zZSB0byBrZWVwIHRoZQo+ID4gZGV2aWNlIGluIHN5
bmMgYW5kIGFsc28gYXNzaWduIGl0IHRvIHRoYXQgZG9tYWluPwo+ID4gCj4gPiBTbyB0aGF0IHRo
ZSBvd25lciBpbiB0aGUgaW9tbXUgY29udGV4dCBtYXRjaGVzIHRoZSBvd25lciBvbiB0aGUKPiA+
IHBjaV9kZXYgc3RydWN0Lgo+IAo+IEZvciBicmlkZ2VzIC0gbm8sIEkgZG9uJ3QgdGhpbmsgc28u
IEZvciB0aGVzZSAiZmFrZSIgKHBvc3NpYmx5IHBoYW50b20sCj4gcG9zc2libHkgcmVhbCkgZGV2
aWNlcyBhdCAoc2VjYnVzLDAsMCkgSSBkb24ndCBrbm93IGZvciBzdXJlLCBidXQgLSBhcwo+IHRo
ZSBjb21tZW50IEknbSBhZGRpbmcgc2F5cyAtIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgdGFrZW4g
Y2FyZSBvZiB3aGVuCj4gd2UgZ2FpbiBwcm9wZXJseSB3b3JraW5nIGRldmljZSBncm91cHMgKGF0
IHdoaWNoIHBvaW50IGlmIHRoaXMgImZha2UiCj4gZGV2aWNlIGlzIGFjdHVhbGx5IGEgcmVhbCBv
bmUsIGl0IHNob3VsZCBiZSBwdXQgaW50byB0aGUgc2FtZSBncm91cCkuCgpZZXMsIHRoYXQncyB0
cnVlLiBBbHNvIGFzc2lnbmluZyB0aGUgcGNpX2RldiB0byB0aGUgZ3Vlc3QgY291bGQgYWxsb3cK
dGhlIGd1ZXN0IHRvIGFjdHVhbGx5IGludGVyYWN0IHdpdGggaXQsIHdoaWNoIGlzIG5vdCB3aGF0
IHdlIGFjdHVhbGx5CndhbnQuCgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
