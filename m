Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600621041DA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 18:16:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXTXg-00064l-7w; Wed, 20 Nov 2019 17:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zo+T=ZM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXTXe-00064g-W2
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 17:13:23 +0000
X-Inumbo-ID: 0dc3cca2-0bb9-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dc3cca2-0bb9-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574270002;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5rJBJRuIFCx43aFWPSFTA9rsqhkV8ZnFPECkEfW6kcw=;
 b=PdAQ55GJSkP7kkYJcWmuSE8J5gu5Ic1MB1JVtpK3DsPFhTR732qIAVCm
 +Tw/TiGlN/sHAqjYC2/wuFQXyB7VIVufNeK+WrmaI/j+pqRQZv5bwg3KG
 WXPApNI/5HIcjPwzYFJ3JWnVe7Frzh4/S55pSVx/gAhnd5ehIQgB6wVqP Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MKgiM+G/jvfPUdnXPDYSWoLrOppjXf3YX2LeT1vJxwOF8X/UpLMyzELgVX0OAseCLnHYJgi1HA
 bfy6CnDzhUjoL1yXk56gp0nL6KhZ/cW2kbHTDJR5W+1BUa7ACOPSURs/e+TZRkdumOJ7KEv+WJ
 UlpY5CCIZVBZx8GBLknmvs4w/JUnN6WfM2wuHqENo4+KbewVWzmg6EKBlKE4gQnSUjUxIW+A6u
 iGkPu4n0UilZ7QStYqR72I5++4BZneQCb6eyR61DU7mcAkmeUxoppz2bpY+cc79PGnm//+cJBq
 WKk=
X-SBRS: 2.7
X-MesageID: 8606891
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="8606891"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
Date: Wed, 20 Nov 2019 17:13:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTEvMjAxOSAxNjo0MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMC4xMS4xOSAx
NzozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA4LjExLjIwMTkgMTI6MTgsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gVGhlIC5maWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBi
eSB0aGUgY29tcGlsZXIgZG8gbm90IGluY2x1ZGUKPj4+IGFueSBwYXRoIGNvbXBvbmVudHMgKGdj
Yykgb3IganVzdCB0aGUgb25lcyBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQKPj4+IGxpbmUKPj4+
IChjbGFuZywgYXQgbGVhc3QgdmVyc2lvbiA1KSwgYW5kIGhlbmNlIG11bHRpcGxlIGlkZW50aWNh
bGx5IG5hbWVkCj4+PiBzb3VyY2UKPj4+IGZpbGVzIChpbiBkaWZmZXJlbnQgZGlyZWN0b3JpZXMp
IG1heSBwcm9kdWNlIGlkZW50aWNhbGx5IG5hbWVkIHN0YXRpYwo+Pj4gc3ltYm9scyAoaW4gdGhl
aXIga2FsbHN5bXMgcmVwcmVzZW50YXRpb24pLiBUaGUgYmluYXJ5IGRpZmZpbmcKPj4+IGFsZ29y
aXRobQo+Pj4gdXNlZCBieSB4ZW4tbGl2ZXBhdGNoLCBob3dldmVyLCBkZXBlbmRzIG9uIGhhdmlu
ZyB1bmlxdWUgc3ltYm9scy4KPj4+Cj4+PiBNYWtlIHRoZSBFTkZPUkNFX1VOSVFVRV9TWU1CT0xT
IEtjb25maWcgb3B0aW9uIGNvbnRyb2wgdGhlIChidWlsZCkKPj4+IGJlaGF2aW9yLCBhbmQgaWYg
ZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAocmVsYXRpdmUgdG8gdGhlCj4+PiB4
ZW4vIHN1YmRpcmVjdG9yeSkgcGF0aCB0byB0aGUgY29tcGlsZXIgaW52b2tlZCBTVFRfRklMRSBz
eW1ib2xzLiBOb3RlCj4+PiB0aGF0IHRoaXMgYnVpbGQgb3B0aW9uIGlzIG1hZGUgbm8gbG9uZ2Vy
IGRlcGVuZCBvbiBMSVZFUEFUQ0gsIGJ1dAo+Pj4gbWVyZWx5Cj4+PiBkZWZhdWx0cyB0byBpdHMg
c2V0dGluZyBub3cuCj4+Pgo+Pj4gQ29uZGl0aW9uYWxpemUgZXhwbGljaXQgLmZpbGUgZGlyZWN0
aXZlIGluc2VydGlvbiBpbiBDIGZpbGVzIHdoZXJlIGl0Cj4+PiBleGlzdHMganVzdCB0byBkaXNh
bWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQKPj4+IGF0
IHRoZSBzYW1lIHRpbWUgdGhlIHJlZHVuZGFudCBlbWlzc2lvbiBvZiBTVFRfRklMRSBzeW1ib2xz
IGdldHMKPj4+IHN1cHByZXNzZWQgZm9yIGNsYW5nLiBBc3NlbWJsZXIgZmlsZXMgYXMgd2VsbCBh
cyBtdWx0aXBseSBjb21waWxlZCBDCj4+PiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUg
bGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4+Pgo+Pj4gU2luY2Ugd2Ugbm93IGV4cGVj
dCB0aGVyZSBub3QgdG8gYmUgYW55IGR1cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+Pj4g
Zm9yY2UgdGhlIHNlbGVjdGlvbiBvZiB0aGUgb3B0aW9uIHRvICduJyBhbnltb3JlIGluIGFsbHJh
bmRvbS5jb25maWcuCj4+PiBTaW1pbGFybHkgQ09WRVJBR0Ugbm8gbG9uZ2VyIHN1cHByZXNzZXMg
ZHVwbGljYXRlIHN5bWJvbCB3YXJuaW5ncyBpZgo+Pj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0
LCB3aGljaCBpbiB0dXJuIGFsbG93cwo+Pj4gU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJO
SU5HUyB0byBzaW1wbHkgZGVwZW5kIG9uCj4+PiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+
IEkndmUgZ290IGFja3MgZnJvbSBLb25yYWQgYW5kIFdlaSwgYnV0IHN0aWxsIG5lZWQgYW4geDg2
IGFuZCBhIHJlbGVhc2UKPj4gb25lIGhlcmUuIEFuZHJldz8gT3IgYWx0ZXJuYXRpdmVseSAtIErD
vHJnZW4sIHdvdWxkIHlvdSByYXRoZXIgbm90IHNlZQo+PiB0aGlzIGdvIGluIGFueW1vcmU/Cj4K
PiBJbiBjYXNlIHRoZSBuZWVkZWQgeDg2IEFjayBpcyBjb21pbmcgaW4gYmVmb3JlIFJDMyBJJ20g
ZmluZSB0byBnaXZlIG15Cj4gUmVsZWFzZS1hY2ssIGJ1dCBJJ20gaGVzaXRhbnQgdG8gdGFrZSBp
dCBsYXRlci4KCkhhcyBhbnlvbmUgYWN0dWFsbHkgdHJpZWQgYnVpbGRpbmcgYSBsaXZlcGF0Y2gg
d2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZT8KCkkgYXNrLCBiZWNhdXNlIHRoZXJlIGlzIDAgdGVz
dGluZyBvZiBsaXZlcGF0Y2hlcywgYW5kIGFscmVhZHkgb25lIG1ham9yCnJlZ3Jlc3Npb24gaW4g
NC4xMyB3aGljaCBmb3JjZXMgWGVuU2VydmVyIHRvIHJldmVydCBiYWNrIHRvIG9sZGVyIGJ1aWxk
CnRvb2xzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
