Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86299BF659
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWAh-0003Cf-0f; Thu, 26 Sep 2019 15:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDWAe-0003Ca-St
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:59:08 +0000
X-Inumbo-ID: 920a7c9a-e076-11e9-97fb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 920a7c9a-e076-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569513547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UZAabvwY+yGUjY/QBSJbKPvlEtxNkey7b5uA2IOun6w=;
 b=h85w8ca5rg03t0CTH7iDChTsdz9OY0VYOJ3BVr772vnw2VkdRuOo0hwG
 MYnY3ghxAdakQSUK02TzKnDjPinBEzPs45CQgk1q4dsl6c1OB+uBZZ9Pr
 enpWJuVJ12TNvOunkmLP06QUl2BqOydYcUrEjYf4qoCQDqFluXJ1Wmm8G E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dL54b55oNR7ekaklqBkGxgCovLsrSU8Y+KgQl6O90afeOSqWl+pxJp8UJcTCObgmVoOpqyLh2S
 AMkMiRda1hAVfefonZSqDgxhf+6r+CyCU++t1KkyI40tm4eZFwSrIuwIWojT8FLXAwDJxH9bIa
 FbgOlGikfZcDoRrxjHovofR0KuWqISiWCKqfVonReloDKVuixy2kDyGX4RvEGRH3NFy8IgWKtc
 R7CQAObNzLcWYJKbji6bZPB2BrPxoOULWFh+7QBPBXLWkjEtwU1ZCxhvus+08FDLwEM4JeMkJ4
 rhw=
X-SBRS: 2.7
X-MesageID: 6404886
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6404886"
Date: Thu, 26 Sep 2019 17:59:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190926155900.zdenod5qqhjrksff@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
 <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
 <20190926134644.tcp7pyalzk42hesg@Air-de-Roger>
 <765f32ca-e5f2-fddd-9570-d043596d8948@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <765f32ca-e5f2-fddd-9570-d043596d8948@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDU6MTM6MjNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDkuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIFNlcCAyNiwgMjAxOSBhdCAwMzoxNzoxNVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyNi4wOS4yMDE5IDEzOjE0LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDE6MzU6MTNQTSArMDIwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBIYXZpbmcgc2FpZCB0aGlzLCBhcyBhIHJlc3VsdCBvZiBoYXZpbmcgbG9v
a2VkIGF0IHNvbWUgb2YgdGhlCj4gPj4+PiBpbnZvbHZlZCBjb2RlLCBhbmQgd2l0aCB0aGUgY292
ZXIgbGV0dGVyIG5vdCBjbGFyaWZ5aW5nIHRoaXMsCj4gPj4+PiB3aGF0J3MgdGhlIHJlYXNvbiBm
b3IgZ29pbmcgdGhpcyBzZWVtaW5nbHkgbW9yZSBjb21wbGljYXRlZAo+ID4+Pj4gcm91dGUsIHJh
dGhlciB0aGFuIHB1dHRpbmcgdlBDSSBiZWhpbmQgdGhlIGh2bV9pb19pbnRlcmNlcHQoKQo+ID4+
Pj4gbWFjaGluZXJ5LCBqdXN0IGxpa2UgaXMgdGhlIGNhc2UgZm9yIG90aGVyIGludGVybmFsIGhh
bmRsaW5nPwo+ID4+Pgo+ID4+PiBJZiB2UENJIGlzIGhhbmRsZWQgYXQgdGhlIGh2bV9pb19pbnRl
cmNlcHQgbGV2ZWwgKGxpa2UgaXRzIGRvbmUgQVRNKQo+ID4+PiB0aGVuIGl0J3Mgbm90IHBvc3Np
YmxlIHRvIGhhdmUgYm90aCAoZXh0ZXJuYWwpIGlvcmVxIHNlcnZlcnMgYW5kIHZQQ0kKPiA+Pj4g
aGFuZGxpbmcgYWNjZXNzZXMgdG8gZGlmZmVyZW50IGRldmljZXMgaW4gdGhlIFBDSSBjb25maWcg
c3BhY2UsIHNpbmNlCj4gPj4+IHZQQ0kgd291bGQgdHJhcCBhbGwgYWNjZXNzZXMgdG8gdGhlIFBD
SSBJTyBwb3J0cyBhbmQgdGhlIE1DRkcgcmVnaW9ucwo+ID4+PiBhbmQgdGhvc2Ugd291bGQgbmV2
ZXIgcmVhY2ggdGhlIGlvcmVxIHByb2Nlc3NpbmcuCj4gPj4KPiA+PiBXaHkgd291bGQgdlBDSSAo
d2FudCB0bykgZG8gdGhhdD8gVGhlIGFjY2VwdCgpIGhhbmRsZXIgc2hvdWxkCj4gPj4gc3ViLWNs
YXNzIHRoZSBDRjgtQ0ZGIHBvcnQgcmFuZ2U7IHRoZXJlIHdvdWxkIGxpa2VseSB3YW50IHRvCj4g
Pj4gYmUgYW5vdGhlciBzdHJ1Y3QgaHZtX2lvX29wcyBpbnN0YW5jZSBkZWFsaW5nIHdpdGggY29u
ZmlnCj4gPj4gc3BhY2UgYWNjZXNzZXMgKGFuZCBwZXJoYXBzIHdpdGggb25lcyB0aHJvdWdoIHBv
cnQgSS9PIGFuZAo+ID4+IHRocm91Z2ggTUNGRyBhdCB0aGUgc2FtZSB0aW1lKS4KPiA+IAo+ID4g
RG8geW91IG1lYW4gdG8gZXhwYW5kIGh2bV9pb19oYW5kbGVyIHRvIGFkZCBzb21ldGhpbmcgbGlr
ZSBhIHBjaWNvbmYKPiA+IHN1Yi1zdHJ1Y3R1cmUgdG8gdGhlIGV4aXN0aW5nIHVuaW9uIG9mIHBv
cnRpbyBhbmQgbW1pbz8KPiAKPiBZZXMsIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcy4KPiAK
PiA+IFRoYXQncyBpbmRlZWQgZmVhc2libGUsIGJ1dCBJJ20gbm90IHN1cmUgd2h5IGl0J3MgYmV0
dGVyIHRoYXQgdGhlCj4gPiBhcHByb2FjaCBwcm9wb3NlZCBvbiB0aGlzIHNlcmllcy4gTG9uZyB0
ZXJtIEkgdGhpbmsgd2Ugd291bGQgbGlrZSBhbGwKPiA+IGludGVyY2VwdCBoYW5kbGVycyB0byB1
c2UgdGhlIGlvcmVxIGluZnJhc3RydWN0dXJlIGFuZCByZW1vdmUgdGhlCj4gPiB1c2FnZSBvZiBo
dm1faW9faW50ZXJjZXB0Lgo+ID4gCj4gPj4gSW4gdGhlIGVuZCB0aGlzIHdvdWxkIGxpa2VseQo+
ID4+IG1vcmUgc2ltaWxhciB0byBob3cgY2hpcHNldHMgaGFuZGxlIHRoaXMgb24gcmVhbCBoYXJk
d2FyZQo+ID4+IHRoYW4geW91ciAiaW50ZXJuYWwgc2VydmVyIiBzb2x1dGlvbiAoYWxiZWl0IEkg
YWdyZWUgdG8gYQo+ID4+IGRlZ3JlZSBpdCdzIGluIGltcGxlbWVudGF0aW9uIGRldGFpbCBhbnl3
YXkpLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBlbmQgZ29hbCBzaG91bGQgYmUgdG8gdW5pZnkgdGhl
IGludGVybmFsIGFuZCBleHRlcm5hbAo+ID4gaW50ZXJjZXB0cyBpbnRvIGEgc2luZ2xlIHBvaW50
LCBhbmQgdGhlIG9ubHkgZmVhc2libGUgd2F5IHRvIGRvIHRoaXMKPiA+IGlzIHRvIHN3aXRjaCB0
aGUgaW50ZXJuYWwgaW50ZXJjZXB0cyB0byB1c2UgdGhlIGlvcmVxIGluZnJhc3RydWN0dXJlLgo+
IAo+IFdlbGwsIEkgcmVjYWxsIHRoaXMgaGF2aW5nIGJlZW4gbWVudGlvbmVkIGFzIGFuIG9wdGlv
bjsgSSBkb24ndAo+IHJlY2FsbCB0aGlzIGJlaW5nIGEgZmlybSBwbGFuLiBUaGVyZSBhcmUgY2Vy
dGFpbmx5IGJlbmVmaXRzIHRvCj4gc3VjaCBhIG1vZGVsLCBidXQgdGhlcmUncyBhbHNvIHBvdGVu
dGlhbGx5IG1vcmUgb3ZlcmhlYWQgKGF0IHRoZQo+IHZlcnkgbGVhc3QgdGhlIGlvcmVxX3Qgd2ls
bCB0aGVuIG5lZWQgc2V0dGluZyB1cCAvIG1haW50YWluaW5nCj4gZXZlcnl3aGVyZSwgd2hlbiBy
aWdodCBub3cgdGhlIGludGVyZmFjZXMgYXJlIHVzaW5nIG1vcmUKPiBpbW1lZGlhdGUgcGFyYW1l
dGVycykuCgpBRkFJQ1QgZnJvbSBjb2RlIGluIGh2bWVtdWxfZG9faW8gd2hpY2ggZGlzcGF0Y2hl
cyB0byBib3RoCmh2bV9pb19pbnRlcmNlcHQgYW5kIGlvcmVxIHNlcnZlcnMgdGhlIGlvcmVxIGlz
IGFscmVhZHkgdGhlcmUsIHNvIEknbQpub3Qgc3VyZSB3aHkgbW9yZSBzZXR1cCB3b3VsZCBiZSBy
ZXF1aXJlZCBpbiBvcmRlciB0byBoYW5kbGUgaW50ZXJuYWwKaW50ZXJjZXB0cyBhcyBpb3JlcSBz
ZXJ2ZXJzLiBGb3IgdlBDSSBhdCBsZWFzdCBJJ3ZlIGJlZW4gYWJsZSB0byBnZXQKYXdheSB3aXRo
b3V0IGhhdmluZyB0byBtb2RpZnkgaHZtZW11bF9kb19pbyBJSVJDLgoKPiBCdXQgeWVzLCBpZiB0
aGlzIF9pc18gdGhlIHBsYW4sIHRoZW4gZ29pbmcgdGhhdCByb3V0ZSByaWdodCBhd2F5Cj4gZm9y
IHZQQ0kgaXMgZGVzaXJhYmxlLgoKSSB0aGluayBpdCB3b3VsZCBiZSBkZXNpcmFibGUgdG8gaGF2
ZSBhIHNpbmdsZSBwb2ludCB3aGVyZSBpbnRlcmNlcHRzCmFyZSBoYW5kbGVkIGluc3RlYWQgb2Yg
aGF2aW5nIHN1Y2ggZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBmb3IKaW50ZXJuYWwgdnMgZXh0
ZXJuYWwsIGFuZCB0aGUgb25seSB3YXkgSSBjYW4gZGV2aXNlIHRvIGFjaGlldmUgdGhpcyBpcwpi
eSBtb3ZpbmcgaW50ZXJjZXB0cyB0byB0aGUgaW9yZXEgbW9kZWwuCgpJJ20gbm90IGNlcnRhaW5s
eSBwbGFubmluZyB0byBtb3ZlIGFsbCBpbnRlcmNlcHRzIHJpZ2h0IG5vdywgYnV0IEkKdGhpbmsg
aXQncyBhIGdvb2QgZmlyc3Qgc3RlcCBoYXZpbmcgdGhlIGNvZGUgaW4gcGxhY2UgdG8gYWxsb3cg
dGhpcywKYW5kIGF0IGxlYXN0IHZQQ0kgdXNpbmcgaXQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
