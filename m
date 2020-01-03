Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E973512F84F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:37:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inM9v-0001Hm-Em; Fri, 03 Jan 2020 12:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tb7v=2Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1inM9t-0001Hh-N7
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:34:29 +0000
X-Inumbo-ID: 5d338352-2e25-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d338352-2e25-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578054861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QABP+zpNZwvNO0LScg9nmVpRqY50uhaZKP9UTUVxrWY=;
 b=ht+IpyspDNGU0DbVjcwGpahZrW/KJuncgiWfX0hoB7pNWMfbTipgdY3s
 ud/ZxJXlelNLiRvF+/uPl/UAjcrmRUBP6RW+TfRsEG2QzFzNb80Ia5Zre
 t4g71s6ghwGKtVQ+AgzaE+GhNsv1LoWiI29eOpBCMtV8dIznjjVnX7aj7 8=;
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
IronPort-SDR: xwl6nRZo2x/gxTcO/aL5yNSBdVamV22zW0QvTImsbC20CN9x4aSCOIDrzgM5B2eLzCTjDxn50/
 obI7MjRi8udhUMU07sZTeGqh4UzkSr3Yno8FCc0VAnQ5uUEpBfMPwlOlr5keIrkD4y/8TsLGjU
 LeOL5OdDFiweaSfEkYr4Vc6XQU83eMWOBI5q4q0roNJLseC7G2s1NkgkDfTx338G9bhYgmjY5A
 hB7ndYrLSsCk9EsnZsGpwFvTBARCSEIIkM13LaHqS7IRc8jMgjzUiyZyTLJCXr8C/RWZiDCWhb
 9PM=
X-SBRS: 2.7
X-MesageID: 10434379
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10434379"
Date: Fri, 3 Jan 2020 13:34:09 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200103123409.GM11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
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

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDE6MDg6MjBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMTIuMjAxOSAxMzo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTIyNywxNCArMjMzLDQ3IEBAIHZvaWQgZmx1c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAq
bWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKPiA+ICAgICAgaWYgKCAo
ZmxhZ3MgJiB+RkxVU0hfT1JERVJfTUFTSykgJiYKPiA+ICAgICAgICAgICAhY3B1bWFza19zdWJz
ZXQobWFzaywgY3B1bWFza19vZihjcHUpKSApCj4gPiAgICAgIHsKPiA+ICsgICAgICAgIGJvb2wg
Y3B1c19sb2NrZWQgPSBmYWxzZTsKPiA+ICsKPiA+ICAgICAgICAgIHNwaW5fbG9jaygmZmx1c2hf
bG9jayk7Cj4gPiAgICAgICAgICBjcHVtYXNrX2FuZCgmZmx1c2hfY3B1bWFzaywgbWFzaywgJmNw
dV9vbmxpbmVfbWFwKTsKPiA+ICAgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZsdXNo
X2NwdW1hc2spOwo+ID4gICAgICAgICAgZmx1c2hfdmEgICAgICA9IHZhOwo+ID4gICAgICAgICAg
Zmx1c2hfZmxhZ3MgICA9IGZsYWdzOwo+ID4gLSAgICAgICAgc2VuZF9JUElfbWFzaygmZmx1c2hf
Y3B1bWFzaywgSU5WQUxJREFURV9UTEJfVkVDVE9SKTsKPiA+ICsKPiA+ICsgICAgICAgIC8qCj4g
PiArICAgICAgICAgKiBQcmV2ZW50IGFueSBDUFUgaG90e3VufXBsdWcgd2hpbGUgc2VuZGluZyB0
aGUgSVBJcyBpZiB3ZSBhcmUgdG8gdXNlCj4gPiArICAgICAgICAgKiBhIHNob3J0aGFuZCwgYWxz
byByZWZ1c2UgdG8gdXNlIGEgc2hvcnRoYW5kIGlmIG5vdCBhbGwgQ1BVcyBhcmUKPiA+ICsgICAg
ICAgICAqIG9ubGluZSBvciBoYXZlIGJlZW4gcGFya2VkLgo+ID4gKyAgICAgICAgICovCj4gPiAr
ICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9zbXBfYm9vdCAmJiAhY3B1X292
ZXJmbG93ICYmCj4gPiArICAgICAgICAgICAgIChjcHVzX2xvY2tlZCA9IGdldF9jcHVfbWFwcygp
KSAmJgo+ID4gKyAgICAgICAgICAgICAocGFya19vZmZsaW5lX2NwdXMgfHwKPiAKPiBXaHkgaXMg
aXQgcmVsZXZhbnQgd2hldGhlciB3ZSBwYXJrIG9mZmxpbmUgQ1BVcywgb3Igd2hldGhlciB3ZSd2
ZQo+IGV2ZW4gYnJvdWdodCB1cCBhbGwgb2YgdGhlIG9uZXMgYSBzeXN0ZW0gaGFzPyBBbiBJUEks
IGluIHBhcnRpY3VsYXIKPiBhIGJyb2FkY2FzdCBvbmUsIHNob3VsZG4ndCBoYXZlIGFueSBpc3N1
ZSBnZXR0aW5nIGRlbGl2ZXJlZCBpZiBzb21lCj4gb2YgdGhlIG5vbWluYWwgcmVjaXBpZW50cyBk
b24ndCBsaXN0ZW4sIHNob3VsZCBpdD8gKFRoZSB1c2Ugb2YKPiBjcHVfb25saW5lX21hcCB0aGF0
IHdhcyBhbHJlYWR5IHRoZXJlIGFib3ZlIGlzIGEgc2lnbiAtIGJ1dCBub3QgYQo+IHByb29mLCBh
cyBpdCBtYXkgaXRzZWxmIGJlIGJ1Z2d5IC0gdGhhdCB0aGUgc2V0IG9mIG9ubGluZSBDUFVzCj4g
Zmx1Y3R1YXRpbmcgYmVoaW5kIHRoaXMgZnVuY3Rpb24ncyBiYWNrIG91Z2h0IHRvIG5vdCBiZSBh
IHByb2JsZW0uKQoKSSd2ZSB0cmllZCBpdCBteXNlbGYsIGFuZCBpZiBub3QgYWxsIENQVXMgYXJl
IG9ubGluZWQgd2hlbiB0aGUKc2hvcnRoYW5kIGlzIHVzZWQgdGhlIGJveCB3b3VsZCBqdXN0IHJl
Ym9vdC4gVGhpcyBtYXRjaGVzIHRoZQpkZXNjcmlwdGlvbiBhdDoKCmh0dHBzOi8vbHduLm5ldC9B
cnRpY2xlcy83OTMwNjUvCgpPZiB0aGUgTGludXggc2hvcnRoYW5kIGltcGxlbWVudGF0aW9uLgoK
PiBGdXJ0aGVyIGEgcXVlc3Rpb24gb24gbG9jayBuZXN0aW5nOiBTaW5jZSB0aGUgY29tbWl0IG1l
c3NhZ2UKPiBkb2Vzbid0IHNheSBhbnl0aGluZyBpbiB0aGlzIHJlZ2FyZCwgZGlkIHlvdSBjaGVj
ayB0aGVyZSBhcmUgbm8KPiBUTEIgZmx1c2ggaW52b2NhdGlvbnMgd2l0aCB0aGUgZ2V0X2NwdV9t
YXBzKCkgbG9jayBoZWxkPwoKVGhlIENQVSBtYXBzIGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBz
byBpdCBzaG91bGQgYmUgZmluZSB0byBhdHRlbXB0CmEgVExCIGZsdXNoIHdpdGggdGhlIGxvY2sg
YWxyZWFkeSBoZWxkLgoKPiBFdmVuIGlmCj4geW91IGRpZCBhbmQgZXZlbiBpZiB0aGVyZSBhcmUg
bm9uZSwgSSB0aGluayB0aGUgZnVuY3Rpb24gc2hvdWxkCj4gdGhlbiBnZXQgYSBjb21tZW50IGF0
dGFjaGVkIHRvIHRoZSBlZmZlY3Qgb2YgdGhpcyBsb2NrIG9yZGVyCj4gaW52ZXJzaW9uIHJpc2su
IChGb3IgZXhhbXBsZSwgaXQgaXNuJ3Qgb2J2aW91cyB0byBtZSB0aGF0IG5vIHVzZXIKPiBvZiBz
dG9wX21hY2hpbmUoKSB3b3VsZCBldmVyIHdhbnQgdG8gZG8gYW55IGtpbmQgb2YgVExCIGZsdXNo
aW5nLikKPiAKPiBPdmVyYWxsIEkgd29uZGVyIHdoZXRoZXIgeW91ciBnb2FsIGNvdWxkbid0IGJl
IGFjaGlldmVkIHdpdGhvdXQKPiB0aGUgZXh0cmEgbG9ja2luZyBhbmQgd2l0aG91dCB0aGUgc3Bl
Y2lhbCBjb25kaXRpb25zLgoKSG0sIHRoaXMgc28gZmFyIGhhcyB3b3JrZWQgZmluZSBvbiBhbGwg
dGhlIGJveGVzIHRoYXQgSSd2ZSB0cmllZC4KSSdtIGhhcHB5IHRvIGNoYW5nZSBpdCB0byBhIHNp
bXBsZXIgYXBwcm9hY2gsIGJ1dCBJIHRoaW5rIHRoZQpjb25kaXRpb25zIGFuZCBsb2NraW5nIGFy
ZSByZXF1aXJlZCBmb3IgdGhpcyB0byB3b3JrIGNvcnJlY3RseS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
