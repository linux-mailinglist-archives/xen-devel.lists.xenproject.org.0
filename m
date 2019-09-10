Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5DAE770
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 11:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7cti-0004uA-2P; Tue, 10 Sep 2019 09:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7cth-0004u4-7K
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:57:17 +0000
X-Inumbo-ID: 5e05a0b8-d3b1-11e9-ac1a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e05a0b8-d3b1-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568109435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uDVecZc3Tf6wlRQdcpNVZIWq4jBUZ3LJ7SKKnfvsV6I=;
 b=IoT3+YFiUuIPUAdvAn/U87TjIPj0O3bk3B6Rq1GMEFow0LEyaRupRqZL
 kUAqFAN3OHRx7WaBWJYK8EX1oYILtbMpRp27Ij5+Vjv8I1o0lYJfWl+Q+
 tqV7bUnlhYb2f5osqvmUHnz4fH78i+OyZH+8pC1JByXg/k2bsZTmx8nR9 Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ndfyN5A4FEqCxTo12ZWzk6Vh74VH9ncc7yeXileOzzkFcPBLJcTu2L+Hx+Eij/jVR6Totyktbo
 /puktinZY7Xi2/ctPmAOm4SGQm9Ok6B2oPYEKZ2E1RBW6MZ2bTjkyOgM6D4kpmd8QkOKsf2zW8
 HcLllxnXNI36yTcVwxkpwHgBc43osydTbJMiTGSIMIl+6kPCGS28Sm9qR20I1XFnRfLaeAUP4Z
 ZrjJdb2X0byYWybsGlCd8BaY66f/SKpNKvGpBd6KUIkJvVaidBRkc4R2wlOyoNOY+WzyF3jxqa
 VQ8=
X-SBRS: 2.7
X-MesageID: 5551045
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5551045"
Date: Tue, 10 Sep 2019 11:57:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190910095705.ck7kij2pxq7yfzco@Air-de-Roger>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
 <20190910092912.s2seglrzng22zhjm@Air-de-Roger>
 <3d8def41-e192-6d3a-066d-33d0585a66f7@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d8def41-e192-6d3a-066d-33d0585a66f7@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTA6MzU6MjZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMC8wOS8yMDE5IDEwOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6NTE6MjRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiA3YTAgaXMgYW4gaW50ZWdlciBmaWVsZCwgbm90IGEgbWFzayAtIHRha2luZyB0
aGUgbG9naWNhbCBhbmQgb2YgdGhlIGhhcmR3YXJlCj4gPj4gYW5kIHBvbGljeSB2YWx1ZXMgcmVz
dWx0cyBpbiBub25zZW5zZS4gIEluc3RlYWQsIHRha2UgdGhlIHBvbGljeSB2YWx1ZQo+ID4+IGRp
cmVjdGx5Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgo+ID4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4+IENDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+Pgo+ID4+IEV2ZW4gUm9tZSBoYXJk
d2FyZSBoYXMgN1swXS5lYXggc3RpbGwgYXMgMCwgYW5kIHRoZXJlIGlzIG5vIHNlbnNpYmxlIHJl
YXNvbiB0bwo+ID4+IHNldCBtYXhfc3VibGVhZiBoaWdoZXIgYXQgdGhpcyBwb2ludCwgc28gdGhp
cyBpcyBvbmx5IGEgbGF0ZW50IGJ1ZyBmb3Igbm93Lgo+ID4+IC0tLQo+ID4+ICB4ZW4vYXJjaC94
ODYvZG9tY3RsLmMgfCAxMyArKysrKysrKystLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gPj4gaW5kZXggMWU5OGZj
ODAwOS4uMzVhZDhjYjUxYyAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMK
PiA+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiA+PiBAQCAtMjE4LDExICsyMTgsMTYg
QEAgc3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwK
PiA+PiAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAoKGxldmVsbGluZ19jYXBzICYg
TENBUF83YWIwKSA9PSBMQ0FQXzdhYjApICkKPiA+PiAgICAgICAgICB7Cj4gPj4gICAgICAgICAg
ICAgIHVpbnQ2NF90IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Cj4gPj4gLSAgICAg
ICAgICAgIHVpbnQzMl90IGVheCA9IGN0bC0+ZWF4Owo+ID4+IC0gICAgICAgICAgICB1aW50MzJf
dCBlYnggPSBwLT5mZWF0Ll83YjA7Cj4gPj4gIAo+ID4+IC0gICAgICAgICAgICBpZiAoIGJvb3Rf
Y3B1X2RhdGEueDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04p
ICkKPiA+PiAtICAgICAgICAgICAgICAgIG1hc2sgJj0gKCh1aW50NjRfdCllYXggPDwgMzIpIHwg
ZWJ4Owo+ID4+ICsgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAgKiBMZWFmIDdbMF0u
ZWF4IGlzIG1heF9zdWJsZWFmLCBub3QgYSBmZWF0dXJlIG1hc2suICBUYWtlIGl0Cj4gPj4gKyAg
ICAgICAgICAgICAqIHdob2xlc2FsZSBmcm9tIHRoZSBwb2xpY3ksIGJ1dCBjbGFtcCB0aGUgZmVh
dHVyZXMgaW4gN1swXS5lYngKPiA+PiArICAgICAgICAgICAgICogcGVyIHVzdWFsLgo+ID4+ICsg
ICAgICAgICAgICAgKi8KPiA+PiArICAgICAgICAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92
ZW5kb3IgJgo+ID4+ICsgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5E
T1JfSFlHT04pICkKPiA+PiArICAgICAgICAgICAgICAgIG1hc2sgPSAoKCh1aW50NjRfdClwLT5m
ZWF0Lm1heF9zdWJsZWFmIDw8IDMyKSB8Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICgo
dWludDMyX3QpbWFzayB8IHAtPmZlYXQuXzdiMCkpOwo+ID4gV2h5IGRvIHlvdSBzZXQgdGhlIGhp
Z2ggYml0cyBvZiB0aGUgbWFzayAoNjM6MzApIHdpdGggdGhlIG1heCBzdWJsZWFmPwo+IAo+IDYz
OjMyCj4gCj4gPiBBY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50IEkgaGF2ZSBiaXRzIDYzOjMwIGFy
ZSByZXNlcnZlZCwgYW5kIHRoYXQKPiA+IHNlZW1zIHRvIG1hdGNoIHRoZSBleHBlY3RlZCBDUFVJ
RCByZXR1cm4gdmFsdWUsIHRoYXQgbGlzdHMgQ1BVSUQKPiA+IEZuMDAwMF8wMDA3X0VBWF94MCBj
b250ZW50IGFzIHJlc2VydmVkLgo+IAo+IFllcywgYnV0IHJlc2VydmVkIGRvZXNuJ3QgbWVhbiAi
d2lsbCAjR1AiLsKgIEFzIEkgc2FpZCBvbiBJUkMsIHRoaXMgTVNSCj4gKmlzKiB0aGUgdmFsdWUg
d2hpY2ggZ2V0cyBmb3J3YXJkZWQgaW50byBhIENQVUlEIGludm9jYXRpb24sIGFuZCBzZXR0aW5n
Cj4gbWF4X3N1YmxlYWYgdG8gMHhkZWFkIGRvZXMgd29yayBmaW5lLgo+IAo+IFRoZSBwb2ludCBo
ZXJlIGlzIHRoYXQgaW4gdGhlIGZ1dHVyZSwgb24gaGFyZHdhcmUgY2FwYWJsZSBvZgo+IG1heF9z
dWJsZWFmPTIgYW5kIGJlaW5nIGxldmVsbGVkIHRvIG1heF9zdWJsZWFmPTEsIHRoZSB2YWx1ZSBv
YnNlcnZlZCBpbgo+IENQVUlEIHNob3VsZCBiZSAxLCBub3QgMC4KCk9oLCBhbmQgdGhhdCdzIGZy
b20gSW50ZWwgc3BlY2lmaWNhdGlvbiB3aGljaCBkb2VzIGluZGVlZCBsaXN0CkZuMDAwMF8wMDA3
X0VBWF94MCBhcyByZXR1cm5pbmcgdGhlIG1heCBzdWItbGVhZiwgYW5kIHRoZSBleHBlY3RhdGlv
bgppcyB0aGF0IEFNRCB3aWxsIGZvbGxvdyBzdWl0LgoKPiBUaGUgbGF0dGVyIGlzIHdoYXQgdGhl
IGN1cnJlbnQgbG9naWMgZG9lcywgYW5kIGlzIGJyb2tlbi7CoCBUaGUgQ1BVSUQKPiBkZXJpdmF0
aW9uIGxvZ2ljIHdpbGwgZW5zdXJlIHRoYXQgcG9saWN5IG1heF9zdWJsZWFmIDw9IGhhcmR3YXJl
Cj4gbWF4X3N1YmxlYWYuCgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpcnRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
