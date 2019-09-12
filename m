Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC9B116B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:48:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QKx-0005Sx-1G; Thu, 12 Sep 2019 14:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8QKv-0005Ss-3Z
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:44:41 +0000
X-Inumbo-ID: d990866a-d56b-11e9-959b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d990866a-d56b-11e9-959b-12813bfff9fa;
 Thu, 12 Sep 2019 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568299480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ebDFC+B+gPYb0pnDssUd5EHIB/mif8QJ1+8ZqZpDLGo=;
 b=JIvRPTCB49PNtgEnwuU3orYNH8xNIQ+4CK4U/LCo7B9LHkPPDJclurEd
 YOtW+Nq5197y2wDXpCxjQ06PnpCC43PeYqWpY0z/1thj/lqC0ug5VFq9p
 52XTz0VDULjYVelTf1CJx8hU4qAAJGX4ACCPaBGp42zIPgCQFkBqpL3Ri o=;
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
IronPort-SDR: DCfQoWph2KdWGx5dw1K+4mjzf4cDNC3asXUGolISYBj33RcBcr4fTL3ruR7n5aMXsgM6JTJ7Ga
 H0DGI2k9DCOOqMj3CJSEJnluaL5WqO/O0khwR+2HItCkmsS4dPtTGV1TSK70rwTlkS6SIZ/Hlk
 YZSjUeWKC6eYQHCX17GILg2N8BbsvQaKioEJDit5qtOskOmCyLwmzjoantB/013u6vaHGYWFzE
 xgZaeqEBNXQ1+0rMEo/jBCQyqk2CHc+OBWTpcWmpsZUsvwMbCpuoRAJNtTIijY9u7vK2Kwc3vj
 w38=
X-SBRS: 2.7
X-MesageID: 5684940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5684940"
Date: Thu, 12 Sep 2019 16:44:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912144434.e7wnmdumfpnp2z3m@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
 <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
 <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDE6NTI6MTJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDkuMjAxOSAxMzozNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIFNlcCAxMSwgMjAxOSBhdCAwNToyMzoyMFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBUaGUgYml0IGlzIG1lYW5pbmdmdWwgb25seSBmb3IgTU9WLXRvLUNSMyBpbnNucywg
bm90IGFueXdoZXJlIGVsc2UsIGluCj4gPj4gcGFydGljdWxhciBub3Qgd2hlbiBsb2FkaW5nIG5l
c3RlZCBndWVzdCBzdGF0ZS4KPiA+IAo+ID4gQ2FuJ3QgeW91IHVzZSB0aGUgY3VycmVudCB2Y3B1
IHRvIGNoZWNrIGlmIHRoZSBndWVzdCBpcyBpbiBuZXN0ZWQKPiA+IG1vZGUsIGFuZCBhdm9pZCBo
YXZpbmcgdG8gZXhwbGljaXRseSBwYXNzIHRoZSBub2ZsdXNoIHBhcmFtZXRlcj8KPiAKPiBFdmVu
IGlmIHRoaXMgaW1wbGljYXRpb24gaGVsZCB0b2RheSAoaXQgZG9lc24ndCBhY2NvcmRpbmcgdG8K
PiB0aGUgdXNlcyBpbiBodm1lbXVsX3dyaXRlX2NyKCkgYW5kIGh2bV9tb3ZfdG9fY3IoKSksIEkg
ZG9uJ3QKPiB0aGluayBpbnRyb2R1Y2luZyBzdWNoIGEgZGVwZW5kZW5jeSB3b3VsZCBiZSBhIGdv
b2QgaWRlYS4KCk9oLCBJIHNlZS4gRXZlbiB3aGVuIHJ1bm5pbmcgYSBuZXN0ZWQgZ3Vlc3QgaHZt
X21vdl90b19jciBjb3VsZCBzdGlsbApjYXVzZSBhIG5vIGZsdXNoIGxvYWQuCgo+ID4+IEBAIC0y
MjgyLDEyICsyMjg3LDExIEBAIGludCBodm1fc2V0X2NyMCh1bnNpZ25lZCBsb25nIHZhbHVlLCBi
b28KPiA+PiAgICAgIHJldHVybiBYODZFTVVMX09LQVk7Cj4gPj4gIH0KPiA+PiAgCj4gPj4gLWlu
dCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG1heV9kZWZlcikKPiA+PiAr
aW50IGh2bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBt
YXlfZGVmZXIpCj4gPiAKPiA+IEkgd291bGQgcmF0aGVyIGludHJvZHVjZSBhIGZsdXNoIHBhcmFt
ZXRlciBpbnN0ZWFkLCBJIHRoaW5rIG5lZ2F0ZWQKPiA+IGJvb2xlYW5zIGFyZSBoYXJkZXIgdG8g
cGFyc2UgbWVudGFsbHksIGFuZCBlYXNpZXIgdG8gZ2V0IHdyb25nLgo+IAo+IEkgZGlkIGFjdHVh
bGx5IGNvbnNpZGVyIHRoaXMsIGJ1dCBkZWNpZGVkIGFnYWluc3QgZm9yIHRoZQo+IHJlYXNvbiBv
ZiB0aGlzICJubyBmbHVzaCIgYmVoYXZpb3IgYmVpbmcgYSBsYXRlciBhZGRpdGlvbiB0bwo+IHRo
ZSBlZmZlY3RzIENSMyB3cml0ZXMgaGF2ZSwgaS5lLiBJJ2QgaW50ZW50aW9uYWxseSBsaWtlIGl0
Cj4gdG8gYmUgaW4gbGluZSB3aXRoIFg4Nl9DUjNfTk9GTFVTSC4KCklNTyB0aGUgaGFyZHdhcmUg
YWRkaXRpb24gaXMgYSBub2ZsdXNoIGZsYWcgaW4gb3JkZXIgdG8ga2VlcCB0aGUKcHJldmlvdXMg
YmVoYXZpb3VyIG9mIGEgY3IzIHdyaXRlIChpZTogbm8gZmx1c2ggaGFzIHRvIGJlIGFuCm9wdC1p
bikuIEhlcmUgaXQncyBhIHNvZnR3YXJlIGludGVyZmFjZSB0aGF0IGFscmVhZHkgcmVxdWlyZXMg
eW91IHRvCmNoYW5nZSB0aGUgY2FsbCBzaXRlcyBhbnl3YXksIGFuZCBoZW5jZSBJIHdvdWxkIGhh
dmUgcHJlZmVycmVkIGEgZmx1c2gKcGFyYW1ldGVyLiBJIHNlZSBob3dldmVyIHRoZXJlJ3MgYWxy
ZWFkeSBxdWl0ZSBzb21lIGZ1bmN0aW9ucyB1c2luZwpzdWNoIGEgbm9mbHVzaCBwYXJhbWV0ZXIs
IHNvIEknbSBub3QgZ29pbmcgdG8gb3Bwb3NlLgoKT24gYSBkaWZmZXJlbnQgcXVlc3Rpb24sIEFG
QUlDVCBodm1fc2V0X2NyMyBzaG91bGQgbmV2ZXIgYmUgY2FsbGVkCndpdGggWDg2X0NSM19OT0ZM
VVNIIHNldD8gSWYgc28sIGRvIHlvdSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvCmFkZCBh
biBhc3NlcnQgdG8gdGhhdCByZWdhcmQ/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
