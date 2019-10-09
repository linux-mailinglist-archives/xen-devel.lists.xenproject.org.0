Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE4D1158
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 16:33:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICzs-0000MC-P1; Wed, 09 Oct 2019 14:31:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ly3=YC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iICzr-0000M6-AV
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:31:23 +0000
X-Inumbo-ID: 76f941d6-eaa1-11e9-97f1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76f941d6-eaa1-11e9-97f1-12813bfff9fa;
 Wed, 09 Oct 2019 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570631483;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Mq845KwvWO1BDczrm98dnCTNArp4GZS0aBCJjc5wUVA=;
 b=cahAbONXKneDvQBAd5ctiX3CNpIF7g/C4Fi21wUoGYMT8rJw+yZe5oPt
 6puq/5wXLKvZmjFYDLVnuOHYsA/vGvIBGk2oI7VFO9SfQbDcRrEHWYrrj
 OvXY51b81QgCazm78xOXC4SaBh9S4r/yoIU4nJXjmNmlZ8IAuxlH/YzYn 0=;
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
IronPort-SDR: SlRO92QONA2e38eDBOu4sNSOLjrgh4d8ApBO2KVaqllPIwh3gBK6VUkbY9hjzzL5zJ5jreJvKX
 zrAonvuXc9sXkx/3c4hkhgEOONcAjpmDOpMTYHn4olK93RTJwZIW0AIUybCwxjqlilM4pp0bA+
 t5HSLtUb8PGU0s9yCUPbJpg/ZruvBFDIkpw+ic/7qzRtgnSaWLpjpgBIZ31BOoJ4ihq12Sdkkn
 otfLXTAa9GL8CcurDuO9cfSJmeW4QoNmPhjGqlcHK6Ty+W4NPMGKrelSzVrL4b8xCL4GxjcQ1J
 qPE=
X-SBRS: 2.7
X-MesageID: 6661423
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,276,1566878400"; 
   d="scan'208";a="6661423"
To: Jan Beulich <jbeulich@suse.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
 <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
 <921fcf16-66bc-c053-e4e4-823a38b7a4da@citrix.com>
 <28975fef-3bff-9ef0-3043-f3cb7a639219@suse.com>
 <e402eb7f-715c-7e9e-b17b-88e35eede99d@citrix.com>
 <e74b0f4d-c3cf-d2a9-35a6-88773d0c2401@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <54259125-2bca-d006-2f73-22d9c4c0f92f@citrix.com>
Date: Wed, 9 Oct 2019 15:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e74b0f4d-c3cf-d2a9-35a6-88773d0c2401@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvOS8xOSAzOjI4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwOS4xMC4yMDE5IDE2
OjE0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC85LzE5IDExOjIzIEFNLCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4+IFJlZ2FyZGxlc3Mgb2YgdGhlIG1lcml0cyBvZiB0aGUgY2hhbmdl
IEFuZHkgd2FudHMgdG8gc2VlLCBpdCdzIG5vdCBhIG9uZQo+Pj4+IHRoYXQgc2hvdWxkIGJlIG1h
ZGUgZHVyaW5nIGEgZmVhdHVyZSBmcmVlemUuCj4+Pgo+Pj4gSW5kZWVkLiBTbyBlaXRoZXIgd2Ug
dGFrZSB0aGlzIHBhdGNoIG9yIHdlIGhhdmUgdG8gcmV2ZXJ0IHRoZSBwYXRjaChlcykKPj4+IGlu
dHJvZHVjaW5nIHRoZSByZWdyZXNzaW9uLgo+Pgo+PiBBY3R1YWxseSwganVzdCBjaGF0dGluZyB3
aXRoIElhbiAtLSB0aGUgd29yc2UgaXNzdWUgQVRNLCBBRkFJQ1QsIGlzIHRoYXQKPj4gdGhlIElP
TU1VIGlzIGVuYWJsZWQgZm9yIGEgZ3Vlc3Qgd2hpY2ggaGFzIG5laXRoZXIgYXNrZWQgZm9yIFBD
SQo+PiBkZXZpY2VzLCBub3IgZXhwbGljaXRseSBlbmFibGVkIGl0OyBhbmQgaGUncyBjdXJyZW50
bHkgd29ya2luZyBvbiBhIGZpeAo+PiBmb3IgdGhhdC4gIE9uY2UgdGhhdCBpc3N1ZSBpcyBmaXhl
ZCwgdGhlbiBvc3N0ZXN0IHNob3VsZCBiZWNvbWUKPj4gdW5ibG9ja2VkIGFnYWluLgo+Pgo+PiBJ
dCBpcywgYXJndWFibHksIG5vdCBpZGVhbCB0byByZWZ1c2UgdG8gbWlncmF0ZSBhIFZNIHdpdGgg
SU9NTVUgZW5hYmxlZAo+PiBidXQgbm8gZGV2aWNlcyBhdHRhY2hlZDsgYnV0IGlmIGl0IG9ubHkg
YWZmZWN0ZWQgZ3Vlc3RzIHdobyBoYWQKPj4gc3BlY2lmaWNhbGx5IHJlcXVlc3RlZCB0aGUgSU9N
TVUgYmUgZW5hYmxlZCwgdGhhdCB3b3VsZG4ndCBiZSBzbwo+PiB0ZXJyaWJsZS4gIChBbmQgaW4g
ZmFjdCBpdCBoYXMgaGlnaGxpZ2h0ZWQgdGhlIG90aGVyLCBtb3JlIGltcG9ydGFudCBpc3N1ZS4p
Cj4+Cj4+IEluIHN1bW1hcnksIHRoaXMgcGF0Y2ggaXMgbm90IHN0cmljdGx5IG5lZWRlZCB0byBn
ZXQgYSBwdXNoIHRvIG9zc3Rlc3QuCj4+Cj4+IFRoYXQgc2FpZCwgdGhlIGJlaGF2aW9yIGluIDQu
MTIgd2FzLCBhcyBmYXIgYXMgSSBjYW4gdGVsbDoKPj4KPj4gMS4gSWYgYSBndWVzdCBoYWQgbmV2
ZXIgaGFkIGEgUENJIGRldmljZSBhc3NpZ25lZCwgWGVuIHdpbGwgYWxsb3cKPj4gbG9nZGlydHkg
dG8gYmUgZW5hYmxlZC4KPj4KPj4gMi4gSWYgYSBndWVzdCBoYXMgYSBQQ0kgZGV2aWNlIGFzc2ln
bmVkLCBYZW4gd2lsbCBub3QgYWxsb3cgbG9nZGlydHkgdG8KPj4gYmUgZW5hYmxlZCAoYmxvY2tp
bmcgbWlncmF0aW9uKS4KPj4KPj4gMy4gSWYgYSBndWVzdCBoYWQgYSBQQ0kgZGV2aWNlIGFzc2ln
bmVkIGluIHRoZSBwYXN0IGJ1dCBkb2VzIG5vdCBoYXZlCj4+IG9uZSBub3csIFhlbiB3aWxsIGFs
c28gbm90IGFsbG93IGxvZ2RpcnR5IHRvIGJlIGVuYWJsZWQgKGJsb2NraW5nCj4+IG1pZ3JhdGlv
bikuCj4gCj4gTm8gLSB0aGUgY29ubmVjdGlvbiBwcmV2aW91c2x5IHdhcyB0byB3aGV0aGVyIElP
TU1VIHBhZ2UgdGFibGVzCj4gaGFkIGJlZW4gc2V0IHVwOyB0aGVzZSBwYWdlIHRhYmxlcyB3b3Vs
ZCBoYXZlIGJlZW4gdG9ybiBkb3duCj4gdXBvbiBkZS1hc3NpZ25tZW50IG9mIHRoZSBsYXN0IGRl
dmljZSwgYWxsb3dpbmcgbWlncmF0aW9uIGFnYWluLgo+IFBlb3BsZSBhY3R1YWxseSB1c2UgdGhp
cyBiZWhhdmlvciBhZmFpaywgdXNpbmcgYSBib25kIG9mIGEKPiBwYXNzZWQgdGhyb3VnaCBTUi1J
T1YgTklDIGFuZCBuZXRmcm9udCBwcm92aWRlZCBkZXZpY2UuIFRvCj4gbWlncmF0ZSB0aGUgVk0s
IHRoZSBTUi1JT1YgTklDIGlzIHRha2VuIGF3YXkgd2l0aG91dCB0aGUgZG9tYWluCj4gbG9zaW5n
IG5ldHdvcmsgYWNjZXNzLCBhbmQgYSBuZXcgb25lIG1pZ2h0IHRoZW4gYmUgYXNzaWduZWQKPiBh
Z2FpbiBhZnRlciBtaWdyYXRpb24uCj4gCj4gVGhlICJJT01NVSBwYWdlIHRhYmxlcyBzZXQgdXAi
IHByb3BlcnR5IHdhcyBwcmV2aW91c2x5IGlkZW50aWNhbAo+IHRvICJoYXMgZGV2aWNlcyBhc3Np
Z25lZCIsIGkuZS4gZXZlbiBiZWZvcmUgd2UgY291bGQgaGF2ZSB1c2VkCj4gaGFzX2FyY2hfcGRl
dnMoKSBpbnN0ZWFkIG9mIGlzX2lvbW11X2VuYWJsZWQoKS4KCkkgZGlkbid0IHJlYWxpemUgdGhh
dC4gIFNvIHllcywgdGhpcyBwYXRjaCBmaXhlcyBhIHJlZ3Jlc3Npb24gb3ZlciBhbmQKYWJvdmUg
dGhlIHRvb2xzdGFjayBmaXggSWFuIGlzIHdvcmtpbmcgb24uCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
