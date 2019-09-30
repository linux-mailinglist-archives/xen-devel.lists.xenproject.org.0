Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5AC2B10
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 01:45:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF5Iv-0003qz-Nq; Mon, 30 Sep 2019 23:42:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iF5It-0003qt-LJ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 23:42:07 +0000
X-Inumbo-ID: e8333307-e3db-11e9-96ea-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id e8333307-e3db-11e9-96ea-12813bfff9fa;
 Mon, 30 Sep 2019 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569886926;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=H0BFUIx+PfTBHhVFdai6ShqjNDhjU8XS/ExoJv1lCYQ=;
 b=NCoXh+cy4UBQb43uMwF8tqqCliNqlKGbGPRPHa6shsBES0KGeFdLQaYo
 CcuzXXIXdCKtWb7WThXEz2ZiIz/fbMtwKCqZhSmrxtXRXfDH76iCDCwj4
 mH5ImYuXjRpPaqxepaS8XAjzd8ShWfNytuVROzWi/hBeWgh7l9bc9t7PR c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hQZu68Kb8W8pUSufvtiKh1p2ipwDARAsXVrx/JdW0tDhIgpX2RBY/PCuLY1vUai8irzERW+2QA
 A5IPDZi9gE8zfRQFOVXuqoZuEI5CwCvZZ4Y4OTdo0F1nVAQmV5VsAonPgiMkB6E8oCSLFKRiYZ
 URSslnk8PFdsGf1vYLuvWxPNIR4S16MiEOk+xi9qCDVGr0kTikBfGQEwL1NHEg1j6LkOHdrbta
 d+Xnaajm+k+etN2DpRbeaLrMw1wg5s+OYF9Xal6MzK8GXv2dR7cT7HR332ltGFG2ZRZk10yKa7
 /Wg=
X-SBRS: 2.7
X-MesageID: 6569972
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6569972"
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <11de67f5-076c-0839-0e52-c5e62322c734@citrix.com>
 <CAMmSBy8ZAf5pWvOG3yQ=S2S5UgYcFo8tYji-MKmAS7DfQWZs0g@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cc4452ba-4805-8d99-00a4-92d2c481f7fb@citrix.com>
Date: Tue, 1 Oct 2019 00:42:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8ZAf5pWvOG3yQ=S2S5UgYcFo8tYji-MKmAS7DfQWZs0g@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDkvMjAxOSAyMzowMSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBNb24sIFNl
cCAzMCwgMjAxOSBhdCAzOjE5IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOgo+PiBPbiAyOC8wOS8yMDE5IDA0OjA3LCBSb21hbiBTaGFwb3NobmlrIHdy
b3RlOgo+Pj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NDQgQU0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyNi4wOS4yMDE5IDAwOjMxLCBSb21hbiBT
aGFwb3NobmlrIHdyb3RlOgo+Pj4+PiBKYW4sIFJvZ2VyLCB0aGFuayB5b3Ugc28gbXVjaCBmb3Ig
dGhlIGluaXRpYWwgaWRlYXMuIEkgdHJpZWQgYSBmZXcgb2YKPj4+Pj4gdGhvc2UgYW5kIGhlcmUn
cyB3aGVyZSBJIGFtLgo+Pj4+Pgo+Pj4+PiBGaXJzdCBvZiBhbGwsIGl0IGlzIGRlZmluaXRlbHkg
cmVsYXRlZCB0byBDUFUgYnJpbmcgdXAuIEFkZGluZwo+Pj4+PiBjcHVpZGxlPTAgdG8geGVuIGNv
bW1hbmQgbGluZSBtYWRlIFhlbiBib290Lgo+Pj4+Pgo+Pj4+PiBUaGVuLCBhIGdvb2QgZnJpZW5k
IG9mIG1pbmUgKHdobyB5b3UgbWF5IGtub3cgZnJvbSBhbmNpZW50IFhlbiBkYXlzCj4+Pj4+IDst
KSkgc3VnZ2VzdGVkIHRoYXQgdGhpcyBjb3VsZCBiZSByZWxhdGVkIHRvIHRoaXM6Cj4+Pj4+ICAg
ICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX3Bvd2VyX21hbmFnZW1lbnQK
Pj4+Pj4gc28gSSB3ZW50IHRvIHRoZSBCSU9TIHNldHRpbmdzIGFuZCBxdWl0ZSB0byBteSBzdXJw
cmlzZSBhbGwgb2YgdGhlbQo+Pj4+PiB3ZXJlIGdyYXllZCBvdXQgKG5vdCB0d2Vha2FibGUpLgo+
Pj4+Pgo+Pj4+PiBUaGUgb25seSBvbmUgdGhhdCB3YXNuJ3Qgd2FzIDJ4QVBJQyBzdXBwb3J0LiBT
byBqdXN0IGZvciBraWNrcyAtLSBJCj4+Pj4+IGRpc2FibGVkIHRoYXQuCj4+Pj4+Cj4+Pj4+IFRo
YXQsIGluIHR1cm4sIG1hZGUgWGVuIGJvb3QgZXZlbiB3aXRob3V0IGNwdWlkbGU9MC4gSSdtIGF0
dGFjaGluZyB0aGF0IGxvZy4KPj4+PiBJbnRlcmVzdGluZywgYnV0IHVuZm9ydHVuYXRlbHkgdGhp
cyBwYXJ0aWN1bGFyIGxvZyBpcyBvZiBubyByZWFsIHVzZQo+Pj4+IGZvciBpbnZlc3RpZ2F0aW9u
IG9mIHRoZSBpc3N1ZSAob3RoZXIgdGhhbiBrbm93aW5nIHRoZSBDUFUgbW9kZWwpLiBJCj4+Pj4g
YWxzbyBub3RpY2UgaXQncyBhIDQuMTIuMCBsb2csIHdoZW4geW91ciBvcmlnaW5hbCByZXBvcnQg
d2FzIGFnYWluc3QKPj4+PiBsYXRlc3QgbWFzdGVyLgo+Pj4+Cj4+Pj4+IFNvIEkgZ3Vlc3MgYXQg
dGhpcyBwb2ludCwgeW91IGNvdWxkIHNheSB0aGF0IEkgaGF2ZSBhIGZ1bmN0aW9uYWwKPj4+Pj4g
c3lzdGVtLCBidXQgSSdtIGN1cmlvdXMgd2hldGhlciB5b3UgZ3V5cyB3b3VsZCBiZSBpbnRlcmVz
dGVkIHRvIGxvb2sKPj4+Pj4gaW50byAyeEFQSUMgc2l0dWF0aW9uLgo+Pj4+IE9mIGNvdXJzZSB3
ZSBkby4gQXMgYSBuZXh0IHN0ZXAgSSdkIHN1Z2dlc3QgcmV2ZXJ0aW5nIHRoZSBCSU9TIHNldHRp
bmdzCj4+Pj4gY2hhbmdlIHlvdSBkaWQsIGFuZCBpbnN0ZWFkIHVzaW5nIHRoZSAieDJhcGljPTAi
IFhlbiBjb21tYW5kIGxpbmUgb3B0aW9uLgo+Pj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIHRoaXMg
ZG9lc24ndCByZWFsbHkgc29sdmUgdGhlIHByb2JsZW0gY29tcGxldGVseS4KPj4+IFNwZWNpZnlp
bmcgeDJhcGljPTAgY2VydGFpbmx5IG1ha2VzIFhlbiBnbyBtdWNoIGZ1cnRoZXIgdG8gYSBwb2lu
dAo+Pj4gd2hlcmUgaXQgdHJpZXMgdG8gbG9hZCBEb20wIGFuZCB0aGVuIHRoZSBjb25zb2xlIFZH
QSBzY3JlZW4gZ29lcwo+Pj4gYmxhbmsgKHRoaXMgaXMgd2hlcmUgdGhhdCBzZXJpYWwgZGVidWcg
b3V0cHV0IHdvdWxkIGJlIHZlcnkgdXNlZnVsIDotKCkuCj4+IERvIHlvdSBub3QgZXZlbiBoYXZl
IElQTUkgU29MPyAgSXRzIGJhc2ljYWxseSBpbXBvc3NpYmxlIHRvIGJ1eSBzZXJ2ZXJzCj4+IHdp
dGhvdXQgdGhpcyBiYXNlIGxldmVsIG9mIGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IEl0IHdpbGwgYmUg
c29tZXdoZXJlIGluIHRoZSBpTE8gY29uZmlndXJhdGlvbiBvbiBhbiBIUCBzZXJ2ZXIuCj4gVGhp
cyBpcyBhIHN1cGVyIGF3ZXNvbWUgc3VnZ2VzdGlvbiEKPgo+IEF0dGFjaGVkIGFyZSB0d28gbG9n
cy4gUGxlYXNlIHRha2UgYSBsb29rIC0tIGJvdGggcmVzdWx0IGluIFhlbiBoYW5naW5nLgoKVGhh
dCdzIGdvb2QgdG8gaGVhci7CoCBIb3BlZnVsbHkgd2UgY2FuIG1ha2Ugc29tZSBwcm9ncmVzcy4K
ClRvIGJlZ2luIHdpdGgsIHRyeSBkcm9wcGluZyAiZG9tMF92Y3B1c19waW4gc210PWZhbHNlIiBm
cm9tIHRoZSBjb21tYW5kCmxpbmUuwqAgQm90aCBtYXkgaGl0IHNvbWUgY29ybmVyIGNhc2VzLgoK
QmVjYXVzZSBvZiAiKFhFTikgeDJBUElDIG1vZGUgaXMgYWxyZWFkeSBlbmFibGVkIGJ5IEJJT1Mu
IiwgdGhlIHgyYXBpYz0wCnBhcnQgaXMgdXNlbGVzcyBhbmQgd2lsbCBiZSBpZ25vcmVkLsKgIEl0
IGNhbiBiZSBkcm9wcGVkIHRvby4KCgpDYW4geW91IHJlYmFzZSB0byB1c2luZyBYZW4gNC4xMi4x
P8KgIEl0IGhhcyBhIHN1YnN0YW50aWFsIG51bWJlciBvZgpidWdmaXhlcyBvdmVyIDQuMTIuMCwg
YW5kIHNob3VsZCBzdHJpY3RseSBiZSB1c2VkIGluIHByZWZlcmVuY2UuCgpBbHRlcm5hdGl2ZWx5
LCBzdGFnaW5nLTQuMTIgaGFzIGEgZmV3IGZpeGVzIG1vcmUgdGhhbiA0LjEyLjEsIG5vdGFibHkK
Ing4Ni9hcGljOiBlbmFibGUgeDJBUElDIG1vZGUgYmVmb3JlIGRvaW5nIGFueSBzZXR1cCIgd2hp
Y2ggZml4ZXMgYW4KaXNzdWUgd2l0aCB4MkFQSUMgaW5pdGlhbGlzYXRpb24uCgpJZiBwb3NzaWJs
ZSwgY2FuIHlvdSB1c2UgYSBkZWJ1ZyBidWlsZCBvZiBYZW4/Cgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
