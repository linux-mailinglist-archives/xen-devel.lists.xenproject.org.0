Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1785D33
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hve0u-00017w-J8; Thu, 08 Aug 2019 08:43:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hve0s-00017n-Ki
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:43:10 +0000
X-Inumbo-ID: 8a9e4b74-b9b8-11e9-9e72-a3f468d9864a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9e4b74-b9b8-11e9-9e72-a3f468d9864a;
 Thu, 08 Aug 2019 08:43:06 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Wc7bZneNCtG0jwgJsnjN/IE4821QsyJe78R+N9MTdnVeW8QdPVlm3KFFvTMBO63fJkCbYv2+/s
 fKt1vf6zhwcmazALMKrlKAzzuiViPYqrmFIUckA2THHQ+VZY5KfQRdUu3YKnReSW+Qf61fqXw2
 Cvm/gLQsZcPekRpM5OkZ/anqoOfNJaonkmlAkXAqHB7ByeIp0PJctYq1wT9ih0J+2X1UxCKi8q
 eEPHmaHkjz62+fMsIqm5j92AWqsZKrXRws2CQ+pdG43/6Uh/jLu1CFubeMcLcAWXrd33htakw3
 QOU=
X-SBRS: 2.7
X-MesageID: 4013746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4013746"
To: Jan Beulich <jbeulich@suse.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
Date: Thu, 8 Aug 2019 09:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAwNzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDguMjAxOSAy
MTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kb2Nz
L2dsb3NzYXJ5LnJzdAo+PiBAQCAtMCwwICsxLDM3IEBACj4+ICtHbG9zc2FyeQo+PiArPT09PT09
PT0KPj4gKwo+PiArLi4gVGVybXMgc2hvdWxkIGFwcGVhciBpbiBhbHBoYWJldGljYWwgb3JkZXIK
Pj4gKwo+PiArLi4gZ2xvc3Nhcnk6Ogo+PiArCj4+ICvCoMKgIGNvbnRyb2wgZG9tYWluCj4+ICvC
oMKgwqDCoCBBIDp0ZXJtOmBkb21haW5gLCBjb21tb25seSBkb20wLCB3aXRoIHRoZSBwZXJtaXNz
aW9uIGFuZAo+PiByZXNwb25zaWJpbGl0eQo+PiArwqDCoMKgwqAgdG8gY3JlYXRlIGFuZCBtYW5h
Z2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLgo+PiArCj4+ICvCoMKgIGRvbWFpbgo+PiAr
wqDCoMKgwqAgQSBkb21haW4gaXMgWGVuJ3MgdW5pdCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFu
ZCBnZW5lcmFsbHkgaGFzCj4+IGF0IHRoZQo+PiArwqDCoMKgwqAgbWluaW11bSBzb21lIFJBTSBh
bmQgdmlydHVhbCBDUFVzLgo+PiArCj4+ICvCoMKgwqDCoCBUaGUgdGVybXMgOnRlcm06YGRvbWFp
bmAgYW5kIDp0ZXJtOmBndWVzdGAgYXJlIGNvbW1vbmx5IHVzZWQKPj4gK8KgwqDCoMKgIGludGVy
Y2hhbmdlYWJseSwgYnV0IHRoZXkgbWVhbiBzdWJ0bHkgZGlmZmVyZW50IHRoaW5ncy4KPj4gKwo+
PiArwqDCoMKgwqAgQSBndWVzdCBpcyBhIHNpbmdsZSB2aXJ0dWFsIG1hY2hpbmUuCj4+ICsKPj4g
K8KgwqDCoMKgIENvbnNpZGVyIHRoZSBjYXNlIG9mIGxpdmUgbWlncmF0aW9uIHdoZXJlLCBmb3Ig
YSBwZXJpb2Qgb2YKPj4gdGltZSwgb25lCj4+ICvCoMKgwqDCoCBndWVzdCB3aWxsIGJlIGNvbXBy
aXNlZCBvZiB0d28gZG9tYWlucywgd2hpbGUgaXQgaXMgaW4gdHJhbnNpdC4KPj4gKwo+PiArwqDC
oCBkb21pZAo+PiArwqDCoMKgwqAgVGhlIG51bWVyaWMgaWRlbnRpZmllciBvZiBhIHJ1bm5pbmcg
OnRlcm06YGRvbWFpbmAuwqAgSXQgaXMKPj4gdW5pcXVlIHRvIGEKPj4gK8KgwqDCoMKgIHNpbmds
ZSBpbnN0YW5jZSBvZiBYZW4sIHVzZWQgYXMgdGhlIGlkZW50aWZpZXIgaW4gdmFyaW91cyBBUElz
LAo+PiBhbmQgaXMKPj4gK8KgwqDCoMKgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2VxdWVudGlhbGx5
IGZyb20gMC4KPj4gKwo+PiArwqDCoCBndWVzdAo+PiArwqDCoMKgwqAgU2VlIDp0ZXJtOmBkb21h
aW5gCj4KPiBJIHRoaW5rIHlvdSB3YW50IHRvIG1lbnRpb24gdGhlIHVzdWFsIGRpc3RpbmN0aW9u
IGhlcmU6IERvbTAgaXMsCj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVk
IGEgZ3Vlc3QuCgpUbyBiZSBob25lc3QsIEkgaGFkIHRvdGFsbHkgZm9yZ290dGVuIGFib3V0IHRo
YXQuwqAgSSBndWVzcyBub3cgaXMgdGhlCnByb3BlciB0aW1lIHRvIHJlaGFzaCBpdCBpbiBwdWJs
aWMuCgpJIGRvbid0IHRoaW5rIHRoZSB3YXkgaXQgY3VycmVudGx5IGdldHMgdXNlZCBoYXMgYSBj
bGVhciBvciBjb2hlcmVudCBzZXQKb2YgcnVsZXMsIGJlY2F1c2UgSSBjYW4ndCB0aGluayBvZiBh
bnkgdG8gZGVzY3JpYmUgaG93IGl0IGRvZXMgZ2V0IHVzZWQuCgpFaXRoZXIgdGhlcmUgYXJlIGEg
Y2xlYXIgYW5kIGNvaGVyZW50IChhbmQgc2ltcGxlISkgc2V0IG9mIHJ1bGVzIGZvcgp3aGF0IHdl
IG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hpY2ggcG9pbnQgdGhleSBjYW4gbGl2ZSBoZXJlIGluIHRo
ZQpnbG9zc2FyeSwgb3IgdGhlIGZ1enp5IHdheSBpdCBpcyBjdXJyZW50IHVzZWQgc2hvdWxkIGNl
YXNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
