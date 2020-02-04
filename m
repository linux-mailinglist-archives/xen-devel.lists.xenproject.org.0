Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D635E1519DA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:30:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywNM-0003iz-AM; Tue, 04 Feb 2020 11:28:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iywNL-0003is-Cc
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:28:15 +0000
X-Inumbo-ID: 6e97f2a6-4741-11ea-8f11-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e97f2a6-4741-11ea-8f11-12813bfff9fa;
 Tue, 04 Feb 2020 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580815694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y8+sWK44RawqfiqLY9wd63sNA1GwQI++YoNecfkaC7o=;
 b=HYGHnBLHNn785ExLTnttHoC5nqmH+CAVWbfEpABXZ017kCK1XqBgcv8W
 +bttoPlV5OP8mWLx0e1TcGr67A35E8UxnKBx2MJebYrYuxUlvfZZFPftn
 i1WmujsQ4/wvM1mrdWPkM01+D0tWnFFOgG//mKEOGtf83N0Ziz4JA8rgh I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CikMQNzsQzh4CTiAx3e9ThnrqWWydr02ZjzKyecD05v9kvCt2wNnwxhcHWtSK2s5IPlwgzUjF5
 01Ing065WuZW80kPxxrCHh9ZLA/DKGUHylkEJRgkp+5sNnhAVrhrmd5RlXWp+dFYE0sUdVc/Yj
 gThb65kHkeBYCpOgnxfxkyD71wBMm/XxgiGIRKXQcOmn3QlU597uRWzkLNqk5DOGRjA6pmH9Hh
 +IKj9th/0TX7Sr8MgfUQLT1p521cLD1y4A8o2sNMy6C6i7DeGHIuXQ4VS/A66V0ge6D02pG7kJ
 AGQ=
X-SBRS: 2.7
X-MesageID: 12341960
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12341960"
Date: Tue, 4 Feb 2020 12:28:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200204112807.GK4679@Air-de-Roger>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org>
 <20200204105156.GH4679@Air-de-Roger>
 <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMTE6MTE6MTFBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDA0LzAyLzIwMjAgMTA6NTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAwOTozNDoxMUFNICswMDAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gPiA+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4g
PiA+IAo+ID4gPiBVbmxpa2Ugc2hhZG93X2VuYWJsZSgpLCBoYXBfZW5hYmxlKCkgY2FuIG9ubHkg
YmUgY2FsbGVkIG9uY2UgZHVyaW5nCj4gPiA+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUg
bW9kZSBlcXVhbCB0byBtb2RlIGVxdWFsIHRvCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXiBlcXVhbHMgdG8KPiAKPiBXaWxsIGZpeCBpdC4KPiAKPiA+ID4gUEdfZXh0
ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMuCj4gPiA+IAo+ID4gPiBJZiBpdCB3
ZXJlIGNhbGxlZCB0d2ljZSwgdGhlbiB3ZSBtaWdodCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGlu
Zwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGEg
cHJvYmxlbQo+ID4gPiBwcm9ibGVtIGFzIHRoZSBwMm0gdGFibGVzIHdvdWxkIGJlIHJlLWFsbG9j
YXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwgdGhlCj4gPiA+IG1hcHBpbmdzIHdvdWxkIGJlIGxvc3Qp
Lgo+ID4gPiAKPiA+ID4gQWRkIGNvZGUgdG8gc2FuaXR5IGNoZWNrIHRoZSBtb2RlIGFuZCB0aGF0
IHRoZSBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZAo+ID4gPiBvbmNlLiBUYWtlIHRoZSBvcHBvcnR1
bml0eSB0byBhbiBpZiBjaGVja2luZyB0aGF0IFBHX3RyYW5zbGF0ZSBpcyBzZXQuCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGFkZCBhbiBpZgo+IAo+IFdpbGwgZml4IGl0
Lgo+IAo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gSXQgaXMgbm90IGVudGlyZWx5
IGNsZWFyIHdoZW4gUEdfdHJhbnNsYXRlIHdhcyBlbmZvcmNlZC4KPiA+ID4gLS0tCj4gPiA+ICAg
eGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+ID4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgYi94ZW4vYXJjaC94
ODYvbW0vaGFwL2hhcC5jCj4gPiA+IGluZGV4IDMxMzYyYTMxYjYuLmI3MzRlMmU2ZDMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKPiA+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L21tL2hhcC9oYXAuYwo+ID4gPiBAQCAtNDQ1LDYgKzQ0NSwxMyBAQCBpbnQgaGFwX2Vu
YWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKPiA+ID4gICAgICAgdW5zaWduZWQgaW50
IGk7Cj4gPiA+ICAgICAgIGludCBydiA9IDA7Cj4gPiA+ICsgICAgaWYgKCBtb2RlICE9IChQR19l
eHRlcm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cykgKQo+ID4gPiArICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ID4gKwo+ID4gPiArICAgIC8qIFRoZSBmdW5jdGlvbiBjYW4gb25s
eSBiZSBjYWxsZWQgb25jZSAqLwo+ID4gPiArICAgIGlmICggZC0+YXJjaC5wYWdpbmcubW9kZSAh
PSAwICkKPiA+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAKPiA+IElmIHlvdSB3YW50
IHRvIHJldHVybiBFSU5WQUwgZm9yIGJvdGggdGhleSBjYW4gYmUgbWVyZ2VkIGludG8gYSBzaW5n
bGUKPiA+IGlmLiBBbHNvIG5vdGUgdGhhdCB0aGlzIHdvdWxkIHVzdWFsbHkgYmUgd3JpdHRlbiBh
cwo+ID4gaWYgKCBkLT5hcmNoLnBhZ2luZy5tb2RlICkgdG8ga2VlcCBpdCBzaG9ydGVyLgo+IAo+
IFRvIGJlIGhvbmVzdCwgdGhpcyBpcyBhIG1hdHRlciBvZiB0YXN0ZS4gVGhlcmUgaXMgYWxzbyBh
biBhcmd1bWVudCB0aGF0IGZvcgo+IE1JU1JBLCB5b3VyIHN1Z2dlc3Rpb24gaXMgbm90IGNvbXBs
aWFudCAoc2VlIFJ1bGUgMTQuNCkuCgpPaCwgdGhlbiB3ZSBzaG91bGQgYWRkIHRob3NlIHJ1bGVz
IHRvIENPRElOR19TVFlMRSBpZiB0aGV5IGFyZSB0byBiZQplbmZvcmNlZC4KClNvIGZhciB0aGUg
c3R5bGUgb2YgbW9zdCBvZiB0aGUgaHlwZXJ2aXNvciBjb2RlIGlzIHRvIG9taXQgdGhlIHZhbHVl
CndoZW4gY29tcGFyaW5nIGFnYWluc3QgMCBvciBOVUxMIEFGQUlLLgoKSSBkb24ndCBoYXZlIGFu
IGlzc3VlIHdpdGggcmVxdWlyaW5nIGV4cGxpY2l0IGNvbXBhcmlzb25zLCBidXQgaXQKbmVlZHMg
dG8gYmUgZG9jdW1lbnRlZCBzbyB3ZSBjYW4gYWltIHRvIGhhdmUgYW4gaG9tb2dlbmVvdXMgc3R5
bGUsCmJlY2F1c2Ugc28gZmFyIEkndmUgYmVlbiByZWNvbW1lbmRpbmcgdGhlIG90aGVyIHdheSBh
cm91bmQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
