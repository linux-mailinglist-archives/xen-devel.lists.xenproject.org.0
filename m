Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60368150EC7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:40:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyff6-0007Oh-9Y; Mon, 03 Feb 2020 17:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=maG7=3X=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iyff4-0007Oc-JB
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:37:26 +0000
X-Inumbo-ID: d7362332-46ab-11ea-8e7c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7362332-46ab-11ea-8e7c-12813bfff9fa;
 Mon, 03 Feb 2020 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580751446;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7QSEfGhWCKXZmrPa5d+KFBbBqJAEhelPAI9CdA2mdtA=;
 b=dgRWTJmxIShYdvTivUo+1F85aGOrwlSjO7dPa6oouo505Ljzq52IHkxR
 jwfELNF5pMRZROEF5p41gx5ShjoUiC+5dQg8uHBcp8fWL+eNXMVuSqKyw
 cJ5nW6z9Tq57Rnh3UVJXQwTnP9eyO0zb0WyIJs1AWLRruanhwYztGXY6z 8=;
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
IronPort-SDR: Eh2yN46dHbtMw3Tu+VITJkpt2r6vmx3d8xhSSQcinJgUyfSQ54zUbGGMb5HYoxUW94SxLvtz3w
 ucPww3XvgiTGOJBhAKkBUCMw4QqyKwY/y5gEyhL1p+fKIDoe10OpnyhPO3Z6B9gsfKTDIuHex+
 9HhlwBt2PzCkh7Hmb5/yvJ5zOkJKOtqf0gelAgqFo5iYmwP/rWisiYye9BQILvFT41YXTTiWp5
 K1BjA4+FFRuLAGrZhLbUtFdpqpdKyMjlfHKEb0PT85Xvll1woIAz5VISg8ZNwxjs4RsmSqTRKB
 X2k=
X-SBRS: 2.7
X-MesageID: 11874293
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="11874293"
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200203165812.21089-1-julien@xen.org>
 <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
 <53769c85-cc65-55ad-3538-339f51243079@xen.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <52e15a69-3882-695a-2153-3ec1da6869b1@citrix.com>
Date: Mon, 3 Feb 2020 17:37:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <53769c85-cc65-55ad-3538-339f51243079@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
 Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8zLzIwIDU6MjIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAwMy8w
Mi8yMDIwIDE3OjEwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAyLzMvMjAgNDo1OCBQTSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4KPj4+Cj4+PiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2h5IHRoZSBzbG90IDAgb2Yg
ZWFjaCBwMm0gc2hvdWxkIGJlIHBvcHVsYXRlZAo+Pj4gd2l0aCBlbXB0eSBwYWdlLXRhYmxlcy4g
VGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBpdCA3NTlhZjhlMzgwMCAiW0hWTV0KPj4+IEZpeCA2NC1i
aXQgSFZNIGRvbWFpbiBjcmVhdGlvbi4iIGRvZXMgbm90IGNvbnRhaW4gbWVhbmluZ2Z1bAo+Pj4g
ZXhwbGFuYXRpb24gZXhjZXB0IHRoYXQgaXQgd2FzIG5lY2Vzc2FyeSBmb3Igc2hhZG93Lgo+Pgo+
PiBUaW0sIGFueSBpZGVhcyBoZXJlPwo+Pgo+Pj4gQXMgd2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGEg
Z29vZCBleHBsYW5hdGlvbiB3aHkgdGhpcyBpcyB0aGVyZSwgZHJvcCB0aGUKPj4+IGNvZGUgY29t
cGxldGVseS4KPj4+Cj4+PiBUaGlzIHdhcyB0ZXN0ZWQgYnkgc3VjY2Vzc2Z1bGx5IGJvb3Rpbmcg
YSBIVk0gd2l0aCBzaGFkb3cgZW5hYmxlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4KPj4+IC0tLQo+Pj4KPj4+IEkgZG9uJ3Qga25v
dyBmb3Igc3VyZSBpZiB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGEgc2V0dXAuIEkgaGF2ZSB0cmll
ZAo+Pj4gSFZNIGd1ZXN0IHdpdGggaGFwPXswLCAxfSB3aXRob3V0IGFueSB0cm91YmxlLiBJIGFt
IGhhcHB5IHRvIHRyeSBtb3JlCj4+PiBzZXR1cCBpZiB5b3UgaGF2ZSBhbnkgaW4gbWluZC4KPj4+
Cj4+PiBJZiB0aGlzIGJyZWFrIGEgc2V0dXAsIHRoZW4gcGxlYXNlIGRlc2NyaWJlIHRoZSBzZXR1
cCBhbmQgSSB3aWxsIHNlbmQgYQo+Pj4gZG9jdW1lbnRhdGlvbiBwYXRjaCBpbnN0ZWFkLgo+Pgo+
PiBUaGlzIGlzIGEgc29tZXdoYXQgcmlza3kgc3RyYXRlZ3kuwqAgT3RoZXIgdGhhbiBjb2RlIGNs
ZWFuLXVwLCBpcyB0aGVyZQo+PiBhbnkgYWR2YW50YWdlIHRvIHJlbW92aW5nIHRoaXMgY29kZSBh
dCB0aGUgbW9tZW50Pwo+IAo+IElmIFRpbSBkb2Vzbid0IGhhdmUgYW4gZXhwbGFuYXRpb24sIHRo
ZW4gd2UgaGF2ZSB0d28gc29sdXRpb25zOgo+IMKgwqAgMSkgQ2hlY2tpbiB0aGUgY29kZSBhbmQg
c2VlIGlmIHRoYXQgYnJlYWtzCj4gwqDCoCAyKSBLZWVwIGNvZGUgd2UgaGF2ZSBubyBjbHVlIHdo
eSBpdCBpcyB0aGVyZQoKSXQgaXMgcHJvYmFibHkgZWFybHkgZW5vdWdoIGluIHRoZSBkZXYgY3lj
bGUgdG8gZG8gdGhpcy4KCkFsc28sIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoYXQga2luZCBvZiBi
dWcgdGhlIGNvZGUgeW91J3JlIGRlbGV0aW5nCndvdWxkIGZpeC4gIElmIHlvdSByZWFkIGEgbm90
LXByZXNlbnQgZW50cnksIHlvdSBzaG91bGQgZ2V0IElOVkFMSURfTUZOCmFueXdheS4gIFVubGVz
cyB5b3Ugd2VyZSBjYWxsaW5nIHAybV9nZXRfZW50cnlfcXVlcnkoKSwgd2hpY2ggSSdtIHByZXR0
eQpzdXJlIGhhZG4ndCBiZWVuIGludHJvZHVjZWQgYXQgdGhpcyBwb2ludC4KCj4gSSB1bmRlcnN0
YW5kIHRoYXQgdGhlIGZvcm1lciBpcyByaXNreSwgYnV0IHRoZSBsYXR0ZXIgaXMgbm90IHZlcnkg
aWRlYWwKPiBlaXRoZXIgYmVjYXVzZSBpZiB3ZSBjYW4ndCBleHBsYWluIHRoZSByZWFzb24gbm93
LCB0aGVuIGl0IGlzIHVubGlrZWx5Cj4gdGhhdCB3ZSB3b3VsZCBpbiB0aGUgZnV0dXJlLgo+IAo+
IFJlZ2FyZGluZyB0aGUgYWR2YW50YWdlIG9mIHJlbW92aW5nIGl0LCBJIGFtIGxvb2tpbmcgYXQg
bGl2ZXVwZGF0ZSBhbmQKPiBob3cgdG8ga2VlcCB0aGUgUDJNIGFyb3VuZC4gSSBhbSB0cnlpbmcg
dG8gbGltaXQgdGhlIG51bWJlciBvZiAiaWYKPiAobGl2ZXVwZGF0ZSkiIHdpdGhpbiB0aGUgY29k
ZS4gU28gYW55IGNsZWFudXAgd291bGQgYmUgYmVuZWZpY2lhbC4KCk9LLCB0aGFua3MuCgogLUdl
b3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
