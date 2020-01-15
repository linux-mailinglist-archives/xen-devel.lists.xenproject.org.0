Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73613C2BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 14:28:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irieX-0004Ro-Ls; Wed, 15 Jan 2020 13:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irieW-0004Rj-60
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 13:24:08 +0000
X-Inumbo-ID: 4d8c23b8-379a-11ea-8540-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d8c23b8-379a-11ea-8540-12813bfff9fa;
 Wed, 15 Jan 2020 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579094646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zPUdUv75MF68aWfdYq1I5qCvLesXefkQhDLMFt5TkVg=;
 b=TWpr//7L6sPM0Sae7+8e3NiDqyyR0wx3vjLBU4eKcWY784TFfM5hhx14
 noCQKKwdcf8U79PeaF1LNQgpNPdvIQOuvPFbzce8TI71AiFGix/QxBRGA
 kxBQ/gNuaJGc+msJnRnvoLtAjuePA3H8dn8wKFMafsZdY6NysuVyUm+/I o=;
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
IronPort-SDR: T57aPsggZbYPx2MsxOpcH6JSHLlnebuzXT32I+lHc19ddoHB18FR6MZOsTImMhzOT789nNtW2V
 PEj4Ap/RrmV+pFcc06oeWH0n2s69h6HXNNPofNxJeRC7Aa/c32fhcwZ5nCPs0PwhrzTCjYT7g1
 CTkp5fiRsUEZs8I1YReYHEpZKR2nQD0cDZkR1H2l9yxDBTUcdAgz8B2wfl/3RzuRmt/C/b1gli
 /XQ/UuZ0OiGbixqC0FbJga+uumJTl3F+oOoSdhJzHscgO2ozOT3pJE5hYjLsUdE9KdLzE9r7Yd
 ++E=
X-SBRS: 2.7
X-MesageID: 10956390
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10956390"
Date: Wed, 15 Jan 2020 14:23:58 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200115132358.GM11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <7d9e9668-3b21-46c6-5428-b6e9394bb8fe@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d9e9668-3b21-46c6-5428-b6e9394bb8fe@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMTI6MzY6MDhQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTUvMDEvMjAyMCAwOTo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDA3OjM2OjIxUE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4+IElmIElUU0MgaXMgbm90IGF2YWlsYWJsZSBvbiBDUFUgKGUuZyBpZiBydW5u
aW5nIG5lc3RlZCBhcyBQViBzaGltKQo+ID4+IHRoZW4gWDg2X0ZFQVRVUkVfTk9OU1RPUF9UU0Mg
aXMgbm90IGFkdmVydGlzZWQgaW4gY2VydGFpbiBjYXNlcywgaS5lLgo+ID4+IGFsbCBBTUQgYW5k
IHNvbWUgb2xkIEludGVsIHByb2Nlc3NvcnMuIEluIHdoaWNoIGNhc2UgVFNDIHdvdWxkIG5lZWQg
dG8KPiA+PiBiZSByZXN0b3JlZCBvbiBDUFUgZnJvbSBwbGF0Zm9ybSB0aW1lIGJ5IFhlbiB1cG9u
IGV4aXRpbmcgZGVlcCBDLXN0YXRlcy4KPiA+Pgo+ID4+IEFzIHBsYXRmb3JtIHRpbWUgbWlnaHQg
YmUgYmVoaW5kIHRoZSBsYXN0IFRTQyBzdGFtcCByZWNvcmRlZCBmb3IgdGhlCj4gPj4gY3VycmVu
dCBDUFUsIGludmFyaWFudCBvZiBUU0Mgc3RhbXAgYmVpbmcgYWx3YXlzIGJlaGluZCBsb2NhbCBU
U0MgY291bnRlcgo+ID4+IGlzIHZpb2xhdGVkLiBUaGlzIGhhcyBhbiBlZmZlY3Qgb2YgZ2V0X3Nf
dGltZSgpIGdvaW5nIG5lZ2F0aXZlIHJlc3VsdGluZwo+ID4+IGluIGV2ZW50dWFsIHN5c3RlbSBo
YW5nIG9yIGNyYXNoLgo+ID4+Cj4gPj4gRml4IHRoaXMgaXNzdWUgYnkgdXBkYXRpbmcgbG9jYWwg
VFNDIHN0YW1wIGFsb25nIHdpdGggVFNDIGNvdW50ZXIgd3JpdGUuCj4gPiAKPiA+IFRoYW5rcyEg
SSBoYXZlbid0IHNlZW4gc3VjaCBpc3N1ZSBiZWNhdXNlIEkndmUgYmVlbiBydW5uaW5nIHRoZSBz
aGltCj4gPiB3aXRoIG5vbWlncmF0ZSBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSB2VFNDIG92ZXJo
ZWFkLgo+ID4gCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5k
cnV6aGluaW5AY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBUaGlzIGNhdXNlZCByZWxpYWJsZSBo
YW5ncyBvZiBzaGltIGRvbWFpbnMgd2l0aCBtdWx0aXBsZSB2Q1BVcyBvbiBhbGwgQU1ECj4gPj4g
c3lzdGVtcy4gVGhlIHByb2JsZW0gZ290IGFsc28gcmVwcm9kdWNlZCBvbiBiYXJlLW1ldGFsIGJ5
IGFydGlmaWNhbGx5Cj4gPj4gbWFza2luZyBJVFNDIGZlYXR1cmUgYml0LiBUaGUgcHJvcG9zZWQg
Zml4IGhhcyBiZWVuIHZlcmlmaWVkIGZvciBib3RoCj4gPj4gY2FzZXMuCj4gPj4gLS0tCj4gPj4g
IHhlbi9hcmNoL3g4Ni90aW1lLmMgfCA4ICsrKysrKystCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+ID4+IGluZGV4IGU3OWNiNGQu
LmY2YjI2ZjggMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+ID4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+PiBAQCAtOTU1LDEwICs5NTUsMTYgQEAgdTY0IHN0aW1l
MnRzYyhzX3RpbWVfdCBzdGltZSkKPiA+PiAgCj4gPj4gIHZvaWQgY3N0YXRlX3Jlc3RvcmVfdHNj
KHZvaWQpCj4gPj4gIHsKPiA+PiArICAgIHN0cnVjdCBjcHVfdGltZSAqdCA9ICZ0aGlzX2NwdShj
cHVfdGltZSk7Cj4gPj4gKwo+ID4+ICAgICAgaWYgKCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVf
Tk9OU1RPUF9UU0MpICkKPiA+PiAgICAgICAgICByZXR1cm47Cj4gPj4gIAo+ID4+IC0gICAgd3Jp
dGVfdHNjKHN0aW1lMnRzYyhyZWFkX3BsYXRmb3JtX3N0aW1lKE5VTEwpKSk7Cj4gPj4gKyAgICB0
LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0aW1lKE5VTEwpOwo+ID4+ICsg
ICAgdC0+c3RhbXAubG9jYWxfdHNjID0gc3RpbWUydHNjKHQtPnN0YW1wLm1hc3Rlcl9zdGltZSk7
Cj4gPj4gKyAgICB0LT5zdGFtcC5sb2NhbF9zdGltZSA9IHQtPnN0YW1wLm1hc3Rlcl9zdGltZTsK
PiA+PiArCj4gPj4gKyAgICB3cml0ZV90c2ModC0+c3RhbXAubG9jYWxfdHNjKTsKPiA+IAo+ID4g
SW4gb3JkZXIgdG8gYXZvaWQgdGhlIFRTQyB3cml0ZSAoYW5kIHRoZSBsaWtlbHkgYXNzb2NpYXRl
ZCB2bWV4aXQpLAo+ID4gY291bGQgeW91IGluc3RlYWQgZG86Cj4gPiAKPiA+IHQtPnN0YW1wLmxv
Y2FsX3N0aW1lID0gdC0+c3RhbXAubWFzdGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGltZShO
VUxMKTsKPiA+IHQtPnN0YW1wLmxvY2FsX3RzYyA9IHJkdHNjX29yZGVyZWQoKTsKPiAKPiBJIHRo
aW5rIGluIHRoYXQgY2FzZSBSRFRTQyBtaWdodCByZXR1cm4gc29tZXRoaW5nIGJlaGluZCBwbGF0
Zm9ybSB0aW1lCj4gd2hpY2ggaXMgbm90IHJpZ2h0IEkgZ3Vlc3MuCgpUaGUgVFNDIGFuZCB0aGUg
cGxhdGZvcm0gdGltZSBhcmUgY29tcGxldGVseSBpbmRlcGVuZGVudCBmcm9tIFhlbidzClBvViwg
eW91IGNhbiBoYXZlIGEgcGxhdGZvcm0gdGltZSBub3QgYmFzZWQgb24gdGhlIFRTQyAoaWU6IFBJ
VCwgSFBFVApvciBQTSksIGFuZCBoZW5jZSB0aGVyZSdzIG5vIGRpcmVjdCByZWxhdGlvbiBiZXR3
ZWVuIGJvdGguCgpUaGUgVFNDIGlzIHVzZWQgYXMgYSB3YXkgdG8gZ2V0IGFuIGFwcHJveGltYXRl
IHBsYXRmb3JtIHRpbWUgYmFzZWQgb24KdGhlIGxhc3QgcGxhdGZvcm0gdGltZSB2YWx1ZSBhbmQg
dGhlIFRTQyBkZWx0YSBiZXR3ZWVuIHRoYW4gdmFsdWUgYW5kCnRoZSBjdXJyZW50IFRTQyB2YWx1
ZSwgSSBhc3N1bWUgdGhhdCdzIGRvbmUgYmVjYXVzZSByZWFkaW5nIHRoZSBUU0MgaXMKbXVjaCBj
aGVhcGVyIHRoYW4gcmVhZGluZyB0aGUgcGxhdGZvcm0gdGltZS4KCkFzIGxvbmcgYXMgdGhlIHBs
YXRmb3JtIHRpbWUgYW5kIHRoZSBUU0Mgc3RhbXBzIGFyZSBib3RoIHVwZGF0ZWQgYXQgdGhlCnNh
bWUgdGltZSBpdCBzaG91bGQgYmUgZmluZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
