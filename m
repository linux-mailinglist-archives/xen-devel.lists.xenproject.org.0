Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF711582C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 21:24:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idK6u-0005sc-5Q; Fri, 06 Dec 2019 20:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fkk7=Z4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idK6s-0005sX-10
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 20:21:54 +0000
X-Inumbo-ID: 0a650a80-1866-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a650a80-1866-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575663713;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+U+b63g9ZrWDgxWsqOHQg+EQaZKgEbKs+xZBcT2lpoY=;
 b=L2WFmcmidhVcWGfwDWafwmJ67ZcCiRqirwGa/QMnGCVOyXvLOUmzBvSv
 Vb1luOKyZNxxIiPlFrdnNfafH2a+XYmzLuIVLcq+BkAYcHozesXcVBEMC
 4mer/28oGBegXQA0v7Hxwo5lzHmqzY7dlpEb5UxDoaTcKYfDw87jzGl0T c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2T/BmDF0RlB1fMzzRYSRiGzBY9WExTfHzqFy3bdgFJY7FPHUDvLO+yFmELIbl112PixckaJxpJ
 Q8lpEkws5j3mGsHwE/aRv4aNALbq0be3g2CaD6T+XtgKNjEVaoQhu/sJVcDr38bAm3eIqqQOC3
 iet3nORkvd87G465vKSm4z51gtIwsdU2wPqKppXHwfrYNnKQWbIXSSseAKcaNfuhurpsHV8mVK
 C/Zx7CawSFi+98GsX5Dc0XBEExu7XbYNFi9PbwX/CX+8in+M7eRNDHl2wJmBk3GARtUI/VrWML
 fyA=
X-SBRS: 2.7
X-MesageID: 9685444
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,286,1571716800"; 
   d="scan'208";a="9685444"
To: George Dunlap <George.Dunlap@citrix.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
 <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
 <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
 <20191202155332.GA17893@char.us.oracle.com>
 <db8386cf-1309-b24a-59a8-e0bd96f3749d@citrix.com>
 <20191202170119.GA18997@char.us.oracle.com>
 <FD2CFC15-D051-4D3D-A878-66D31E6A1F9C@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1ed9f7e0-4523-215f-b40e-70ff8b28f811@citrix.com>
Date: Fri, 6 Dec 2019 20:21:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <FD2CFC15-D051-4D3D-A878-66D31E6A1F9C@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAwOToxNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPgo+PiBPbiBEZWMgMiwg
MjAxOSwgYXQgNTowMSBQTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPiB3cm90ZToKPj4KPj4gT24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDM6NTU6MDRQTSAr
MDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDAyLzEyLzIwMTkgMTU6NTMsIEtvbnJh
ZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPj4+Pj4+IEkgcGxhbiB0byByZWxlYXNlIGFjayB0aGUg
cGF0Y2ggaW4gY2FzZSB0aGUgbWlzc2luZyBtYWludGFpbmVyJ3MgYWNrcwo+Pj4+Pj4gYXJlIG5v
dCBjb21pbmcgaW4gdG9vIGxhdGUuCj4+Pj4+IEkgdGhpbmsgQW5keSdzIG9iamVjdGlvbiB3YXMg
dGhhdCB0aGVyZSBoYXMgYmVlbiB6ZXJvIHRlc3Rpbmcgb2YKPj4+Pj4gbGl2ZXBhdGNoaW5nIG9u
IGdjYy4gIE1heWJlIHdlIGNhbiBmaW5kIHNvbWVvbmUgdG8gZG8gYSBzbW9rZS10ZXN0Lgo+Pj4+
IEFzIGluIGludGVncmF0ZSBsaXZlcGF0Y2gtYnVpbGQgdG9vbHMgaW4gb3NzdGVzdCBzbW9rZS10
ZXN0cz8KPj4+PiBCZWNhdXNlIHRoZSBsaXZlcGF0Y2ggdGVzdCBjYXNlcyBhcmUgaW4gb3NzdGVz
dCwgdW5sZXNzIHNvbWV0aGluZyB3ZW50IGF3cnk/Cj4+PiBUaGUgc3VtIHRvdGFsIG9mIGxpdmVw
YXRjaCB0ZXN0aW5nIGluIE9TU1Rlc3QgaXMgdXNpbmcgdGhlIGhhbmQtY29kZWQKPj4+IEVMRiBv
YmplY3RzIGZyb20gdGhlIHRlc3RzLyBkaXJlY3RvcnkuCj4+Pgo+Pj4gVGhpcyBpcyBwZXJoYXBz
IG9rIGZvciB0aGUgYmFzaWMgbWVjaGFuaXNtLCBidXQgaXRzIG5vdCByZXByZXNlbnRhdGl2ZQo+
Pj4gb2YgYWN0dWFsbHkgYnVpbGRpbmcgcmVhbCBsaXZlcGF0Y2hlcyB1c2luZyBsaXZlcGF0Y2gg
YnVpbGQgdG9vbHMuCj4+IFRydWUuIEJ1dCBpdCB0ZXN0cyB0aGUgX2h5cGVydmlzb3JfIGxpdmVw
YXRjaCBjb2RlLgo+Pgo+PiBJIGFtIHRoaW5raW5nIHRoYXQgdGhpcyBkaXNjdXNzaW9uIGFib3V0
ICJvaCwgYnV0IGxpdmVwYXRjaC1idWlsZCB0b29scyBkb24ndCB3b3JrIGIvYyIKPj4gaXMgd2Vs
bCA8c2hydWc+IHN1Y2tzIGJ1dCBzaG91bGQgbmV2ZXIgYmxvY2sgYW4gcmVsZWFzZSBhcyB0aGUg
Y29yZQo+PiBsaXZlcGF0Y2ggZnVuY3Rpb25hbGl0eSBpcyBPSy4KPiBJIHRoaW5rIGEgcGFyYWxs
ZWwgaXMgaWYgWGVuIGRvZXNu4oCZdCBidWlsZCB3aXRoIGEgcGFydGljdWxhciB2ZXJzaW9uIG9m
IHRoZSBjb21waWxlciwgb3IgY2Fu4oCZdCBidWlsZCBvbiBhIHBhcnRpY3VsYXIgZGlzdHJvIGZv
ciBzb21lIHJlYXNvbi4gIFdlIHNob3VsZCBjZXJ0YWlubHkgKnRyeSogdG8gbWFrZSB0aGluZ3Mg
d29yayB3aXRoIG90aGVyIHByb2plY3RzLCBidXQgaWYgdGhlIGlzc3VlIGlzIGNsZWFybHkgd2l0
aCB0aGUgb3RoZXIgcHJvamVjdCwgd2Ugc2hvdWxkbuKAmXQgaGF2ZSB0byBibG9jayB0byB3YWl0
IGZvciB0aGF0IG90aGVyIHByb2plY3QgdG8gZ2V0IHRoaW5ncyBzb3J0ZWQgb3V0LgoKVGhpcyBp
c24ndCBhIHZhbGlkIGNvbXBhcmlzb24uCgpsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgaXMgYSBjb25j
cmV0ZSB0aGluZywgYnVpbHQgYW5kIG1haW50YWluZWQgYnkgdXMKKHRoZSBYZW4gY29tbXVuaXR5
KSwgZXhwbGljaXRseSBmb3IgdGhlIHB1cnBvc2UgZ2VuZXJhdGluZyBsaXZlcGF0Y2hlcwpiZXR3
ZWVuIHR3byB2ZXJzaW9ucyBvZiBYZW4uwqAgSXQgbGl2ZXMgYXQKaHR0cHM6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPWxpdmVwYXRjaC1idWlsZC10b29scy5naXQ7YT1zdW1tYXJ5IG9uCnhl
bmJpdHMsIGp1c3QgbGlrZSB4ZW4uZ2l0LgoKSXQgKnNob3VsZCogYmUgdXNlZCBpbiBPU1NUZXN0
LCBoYXZlIGEgcHVzaCBnYXRlLCBhbmQgYmxvY2sgYnJlYWtpbmcKY2hhbmdlcyBlaXRoZXIgdG8g
WGVuIG9yIHRvIHRoZSB0b29scyB0aGVtc2VsdmVzLCBiZWZvcmUgdGhlIGJyZWFraW5nCmNoYW5n
ZXMgZ2V0IGFjY2VwdGVkIGludG8gbWFzdGVyIG9mIGVpdGhlciByZXBvLgoKT3RoZXJ3aXNlLCB0
aGUgc3VwcG9ydCBzdGF0ZW1lbnQgZm9yIGxpdmVwYXRjaGluZyBuZWVkcyB0byBjaGFuZ2UgdG8g
YmUKIndlIGRvbid0IGJvdGhlciB0ZXN0aW5nIHRoZSB0d28gcGFydHMgb2YgdGhpcyBzdXBwb3J0
ZWQgZmVhdHVyZSB0b2dldGhlciIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
