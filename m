Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF012F830
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:27:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inM0a-0000L0-AX; Fri, 03 Jan 2020 12:24:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inM0Z-0000Ks-GR
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:24:51 +0000
X-Inumbo-ID: 08cf1a84-2e24-11ea-a46c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08cf1a84-2e24-11ea-a46c-12813bfff9fa;
 Fri, 03 Jan 2020 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578054289;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KqT4E1reGXdnHqUyH3qkcHX6F034ofG6XkrN+57ihq8=;
 b=buGE3Qs9x0zc0HEzIqRmDmCvpmC75620J0XP0efwEhG2R2qV2f3//TJl
 qPoN6h9aeW9ys/qPUVHz310goKocdGp5QLvvWhWznDubGTrEkRGYB7iGp
 bgjZQ6AgNIVDnOE4X0oQXssiG8HPkPmfNq8uDYXlGWd8xUCrR3C+scp4w Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KXfpGmd+2SVoTx3I6S/npCEagte7VGbX3wkHc4wG2otb/W6goHomb7e2oRtreaCJ34sW5PiTPL
 i4UxWZZo8UTkFeVt/Z5OVwCjcbm/a5D0DoiUDw0DDcCCDS0e8wRJvDFDdfkyLIuvGpMok/PX+i
 z4C6MYZkG8iXEJ8gWeoAaqwDFja6PAZsLoODG7ANqHl/C3nLs59eE4v5n5e3RyH5SFMfa0nNTh
 E4oUHn/xqySe7avogLY5EFwJMQdyUOZdSnnCGTybhNJzW7+tcQFz0/90EpH9aDw82Rma/b8Nxm
 jgU=
X-SBRS: 2.7
X-MesageID: 11006951
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="11006951"
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <901251c1-eb1e-b32c-6c3e-d09e3a3e4810@citrix.com>
Date: Fri, 3 Jan 2020 12:24:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxMjowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjQuMTIuMjAxOSAx
Mzo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBAQCAtMjI3LDE0ICsyMzMsNDcgQEAgdm9p
ZCBmbHVzaF9hcmVhX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwg
dW5zaWduZWQgaW50IGZsYWdzKQo+PiAgICAgIGlmICggKGZsYWdzICYgfkZMVVNIX09SREVSX01B
U0spICYmCj4+ICAgICAgICAgICAhY3B1bWFza19zdWJzZXQobWFzaywgY3B1bWFza19vZihjcHUp
KSApCj4+ICAgICAgewo+PiArICAgICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4+ICsK
Pj4gICAgICAgICAgc3Bpbl9sb2NrKCZmbHVzaF9sb2NrKTsKPj4gICAgICAgICAgY3B1bWFza19h
bmQoJmZsdXNoX2NwdW1hc2ssIG1hc2ssICZjcHVfb25saW5lX21hcCk7Cj4+ICAgICAgICAgIGNw
dW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZsdXNoX2NwdW1hc2spOwo+PiAgICAgICAgICBmbHVzaF92
YSAgICAgID0gdmE7Cj4+ICAgICAgICAgIGZsdXNoX2ZsYWdzICAgPSBmbGFnczsKPj4gLSAgICAg
ICAgc2VuZF9JUElfbWFzaygmZmx1c2hfY3B1bWFzaywgSU5WQUxJREFURV9UTEJfVkVDVE9SKTsK
Pj4gKwo+PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBQcmV2ZW50IGFueSBDUFUgaG90e3Vu
fXBsdWcgd2hpbGUgc2VuZGluZyB0aGUgSVBJcyBpZiB3ZSBhcmUgdG8gdXNlCj4+ICsgICAgICAg
ICAqIGEgc2hvcnRoYW5kLCBhbHNvIHJlZnVzZSB0byB1c2UgYSBzaG9ydGhhbmQgaWYgbm90IGFs
bCBDUFVzIGFyZQo+PiArICAgICAgICAgKiBvbmxpbmUgb3IgaGF2ZSBiZWVuIHBhcmtlZC4KPj4g
KyAgICAgICAgICovCj4+ICsgICAgICAgIGlmICggc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX3Nt
cF9ib290ICYmICFjcHVfb3ZlcmZsb3cgJiYKPj4gKyAgICAgICAgICAgICAoY3B1c19sb2NrZWQg
PSBnZXRfY3B1X21hcHMoKSkgJiYKPj4gKyAgICAgICAgICAgICAocGFya19vZmZsaW5lX2NwdXMg
fHwKPiBXaHkgaXMgaXQgcmVsZXZhbnQgd2hldGhlciB3ZSBwYXJrIG9mZmxpbmUgQ1BVcywgb3Ig
d2hldGhlciB3ZSd2ZQo+IGV2ZW4gYnJvdWdodCB1cCBhbGwgb2YgdGhlIG9uZXMgYSBzeXN0ZW0g
aGFzPyBBbiBJUEksIGluIHBhcnRpY3VsYXIKPiBhIGJyb2FkY2FzdCBvbmUsIHNob3VsZG4ndCBo
YXZlIGFueSBpc3N1ZSBnZXR0aW5nIGRlbGl2ZXJlZCBpZiBzb21lCj4gb2YgdGhlIG5vbWluYWwg
cmVjaXBpZW50cyBkb24ndCBsaXN0ZW4sIHNob3VsZCBpdD8KClRHTFggaGFkIGEgaGFyZCB0aW1l
IHRpbWUgbWFraW5nIHNob3J0aGFuZHMgd29yayBjb3JyZWN0bHkgb24gTGludXguwqAKSVNUUiB0
YXJnZXQgQ1BVcyBpbiB3YWl0LWZvci1TSVBJIG1heSBjYXVzZSB0aGUgc291cmNlIHNpZGUgb2Yg
dGhlIElQSQp0byBoYW5nIGluZGVmaW5pdGVseSwgb3IgeWllbGQgYW4gQVBJQyBTZW5kIGVycm9y
LgoKTGludXggbWFpbnRhaW5zIGEgYml0bWFwIG9mICJDUFVzIHdoaWNoIGhhdmUgYm9vdGVkIG9u
Y2UgYW5kIHdlIGtub3cgY2FuCnNhZmVseSBoYW5kbGUgSVBJcyIsIGFuZCBkb2Vzbid0IHBlcm1p
dCBhbnkgYnJvYWRjYXN0IHNob3J0aGFuZHMgdW50aWwKdGhpcyBtYXRjaGVzIHRoZSBjcHVzX2F2
YWlsYWJsZSBtYXNrLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
