Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1511343E0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 14:33:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBQV-00016e-1S; Wed, 08 Jan 2020 13:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipBQT-00016U-96
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:31:09 +0000
X-Inumbo-ID: 206221b4-321b-11ea-b7f5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 206221b4-321b-11ea-b7f5-12813bfff9fa;
 Wed, 08 Jan 2020 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578490268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+ZagUcqki+78yma7h/06RiOzIvCO73WjBudt2a5vNv8=;
 b=UllJI5pszLAm1EwLZPfoLqcoFz7ZjmEPrwvoHbsO6+v8F2bcEWfroin2
 nTnyOfFxBC2UqNJXrfPejnz1yDeql3Z0nP0j73NQxTUoqrmT2nWZOh01D
 /lCROLopXGQ0tlrX52rvicUPK6g+MYTor6CLaO7b2Bi2l5PptI7/OF0xH U=;
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
IronPort-SDR: zKcUHQviZYxV1gA86x5qtzpFsWd4H+rE9u7GZX4MJhpV0E601KmqA/XMd+JGBfkVyBfeNlO7T9
 Ys8DQSurAD4+il7o03inApYOiZLxoy63NKoulri78hcbFtM7nFNAUPyYi7X42NMRkMlqFRH8zZ
 DXajrPxKs9buzuhOQCp/c1YFhndp0SgQkshPYmjxOnDmgSXS1AVn2/9Hv2R+lbAPSmI9CJMsTv
 tqkrLwFkkchLbyRYQS+SUDI6w1932t21kJptu0i04eKcnw5ZyuGw2Uf0kNyxuKxCNOPWra0A6U
 S3I=
X-SBRS: 2.7
X-MesageID: 10995727
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10995727"
Date: Wed, 8 Jan 2020 14:30:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108132819.GO11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDE6NTU6NTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDEuMjAyMCAxMzozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgSmFuIDAzLCAyMDIwIGF0IDAxOjA4OjIwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI0LjEyLjIwMTkgMTM6NDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+PiBG
dXJ0aGVyIGEgcXVlc3Rpb24gb24gbG9jayBuZXN0aW5nOiBTaW5jZSB0aGUgY29tbWl0IG1lc3Nh
Z2UKPiA+PiBkb2Vzbid0IHNheSBhbnl0aGluZyBpbiB0aGlzIHJlZ2FyZCwgZGlkIHlvdSBjaGVj
ayB0aGVyZSBhcmUgbm8KPiA+PiBUTEIgZmx1c2ggaW52b2NhdGlvbnMgd2l0aCB0aGUgZ2V0X2Nw
dV9tYXBzKCkgbG9jayBoZWxkPwo+ID4gCj4gPiBUaGUgQ1BVIG1hcHMgbG9jayBpcyBhIHJlY3Vy
c2l2ZSBvbmUsIHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGF0dGVtcHQKPiA+IGEgVExCIGZsdXNo
IHdpdGggdGhlIGxvY2sgYWxyZWFkeSBoZWxkLgo+IAo+IFdoZW4gYWxyZWFkeSBoZWxkIGJ5IHRo
ZSBzYW1lIENQVSAtIHN1cmUuIEl0IGJlaW5nIGEgcmVjdXJzaXZlCj4gb25lICh3aGljaCBJIHBh
aWQgYXR0ZW50aW9uIHRvIHdoZW4gd3JpdGluZyBteSBlYXJsaWVyIHJlcGx5KQo+IGRvZXNuJ3Qg
bWFrZSBpdCAodG9nZXRoZXIgd2l0aCBhbnkgb3RoZXIgb25lKSBpbW11bmUgYWdhaW5zdAo+IEFC
QkEgZGVhZGxvY2tzLCB0aG91Z2guCgpUaGVyZSdzIG5vIHBvc3NpYmlsaXR5IG9mIGEgZGVhZGxv
Y2sgaGVyZSBiZWNhdXNlIGdldF9jcHVfbWFwcyBkb2VzIGEKdHJ5bG9jaywgc28gaWYgYW5vdGhl
ciBjcHUgaXMgaG9sZGluZyB0aGUgbG9jayB0aGUgZmx1c2ggd2lsbCBqdXN0CmZhbGxiYWNrIHRv
IG5vdCB1c2luZyB0aGUgc2hvcnRoYW5kLgoKPiA+PiBFdmVuIGlmCj4gPj4geW91IGRpZCBhbmQg
ZXZlbiBpZiB0aGVyZSBhcmUgbm9uZSwgSSB0aGluayB0aGUgZnVuY3Rpb24gc2hvdWxkCj4gPj4g
dGhlbiBnZXQgYSBjb21tZW50IGF0dGFjaGVkIHRvIHRoZSBlZmZlY3Qgb2YgdGhpcyBsb2NrIG9y
ZGVyCj4gPj4gaW52ZXJzaW9uIHJpc2suIChGb3IgZXhhbXBsZSwgaXQgaXNuJ3Qgb2J2aW91cyB0
byBtZSB0aGF0IG5vIHVzZXIKPiA+PiBvZiBzdG9wX21hY2hpbmUoKSB3b3VsZCBldmVyIHdhbnQg
dG8gZG8gYW55IGtpbmQgb2YgVExCIGZsdXNoaW5nLikKPiA+Pgo+ID4+IE92ZXJhbGwgSSB3b25k
ZXIgd2hldGhlciB5b3VyIGdvYWwgY291bGRuJ3QgYmUgYWNoaWV2ZWQgd2l0aG91dAo+ID4+IHRo
ZSBleHRyYSBsb2NraW5nIGFuZCB3aXRob3V0IHRoZSBzcGVjaWFsIGNvbmRpdGlvbnMuCj4gPiAK
PiA+IEhtLCB0aGlzIHNvIGZhciBoYXMgd29ya2VkIGZpbmUgb24gYWxsIHRoZSBib3hlcyB0aGF0
IEkndmUgdHJpZWQuCj4gPiBJJ20gaGFwcHkgdG8gY2hhbmdlIGl0IHRvIGEgc2ltcGxlciBhcHBy
b2FjaCwgYnV0IEkgdGhpbmsgdGhlCj4gPiBjb25kaXRpb25zIGFuZCBsb2NraW5nIGFyZSByZXF1
aXJlZCBmb3IgdGhpcyB0byB3b3JrIGNvcnJlY3RseS4KPiAKPiBXaGljaCBtaWdodCB0aGVuIGlu
ZGljYXRlIHNhaWQgcHJlLWV4aXN0aW5nIHVzZSBvZiBjcHVfb25saW5lX21hcAo+IHRvIGJlIGEg
KGxhdGVudD8pIHByb2JsZW0uCgpIbSwgbWF5YmUgaXQgY291bGQgYmUgYSBwcm9ibGVtIHdoZW4g
b2ZmbGluaW5nIGEgQ1BVLiBJIGFzc3VtZSB0aGlzIGlzCm5vdCBhbiBpc3N1ZSBzbyBmYXIgYmVj
YXVzZSB0aGVyZSBhcmUgbm8gZ2xvYmFsIFRMQiBmbHVzaGVzIHdpdGggYQptYXNrIGNvbnRhbmlu
ZyBhIENQVSB0aGF0IGlzIGJlaW5nIG9mZmxpbmVkLgoKUmVnYXJkaW5nIHRoZSBwYXRjaCBpdHNl
bGYsIGRvIHlvdSB0aGluayB0aGUgc2hvcnRoYW5kIGxvZ2ljIHNob3VsZCBiZQphZGRlZCB0byBz
ZW5kX0lQSV9tYXNrLCBvciB3b3VsZCB5b3UgcmF0aGVyIG9ubHkgdXNlIHRoZSBzaG9ydGhhbmQg
Zm9yCnRoZSBUTEIgZmx1c2hlcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
