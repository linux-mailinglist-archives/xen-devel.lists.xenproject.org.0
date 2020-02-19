Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6B164987
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:10:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Rtr-0007ry-Nk; Wed, 19 Feb 2020 16:08:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4Rtq-0007rr-Qm
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:08:34 +0000
X-Inumbo-ID: 136933d6-5332-11ea-83c0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 136933d6-5332-11ea-83c0-12813bfff9fa;
 Wed, 19 Feb 2020 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582128514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eY3lrCvRKGkIbd872v2mApwEKdYIvItj444Vco2mxOc=;
 b=KsBdYhWMoFAkLxiEMou38FkBTAvMqOBGKMCy/kz6HLRusHD6mtqIGN26
 GEmrYNvjwxZaB/cHTFXTOdleTrQL+HlkGHvrg8MY8MVfKou9saOW/C3Q8
 O6wqeytcxS/p/zSQ3fT/GKJ03Kyoq/MLj0fZFYBH4WCx2aBmX/wYZGpL2 I=;
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
IronPort-SDR: urBQz8jb2iBIgg8nNtM7nilMnpGDoby6hAB72/bn+4qN3NsAcTgwQ62pN2/rldFw3w4KPF0B7f
 g3V36VxaLhWL/oBmPY1ZslqDvcvS4NoVzZ1sCJhPdr80A+qrNP8nCVfb2o+PSfugOd1ni+XAs6
 q6ADkrVpczTiDQNkjVTTnpDEKDl/KlVlwlENBUUCyCug79fItvM7lifI98CzKGORH0hICZu9Dj
 FOdp1QNnYMUv5QFs86IaLqmtwk1rJrLn5ze9TYkE4OqXdMG/Ap3YNQBkzgIuoavMcJR1V2820X
 GRQ=
X-SBRS: 2.7
X-MesageID: 12702724
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12702724"
Date: Wed, 19 Feb 2020 17:08:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200219160825.GF4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
 <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
 <20200219144549.GD4679@Air-de-Roger>
 <3ae51529-1cfe-9872-68a4-ab57d634a1cd@suse.com>
 <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63d07524-3e72-06e4-cc16-a0a1561a5c68@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDM6MDc6MTRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wMi8yMDIwIDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDE5
LjAyLjIwMjAgMTU6NDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4gT24gV2VkLCBGZWIg
MTksIDIwMjAgYXQgMDI6NDQ6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9u
IDE5LjAyLjIwMjAgMTQ6MjIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+PiBPbiBXZWQs
IEZlYiAxOSwgMjAyMCBhdCAwMTo1OTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
Pj4+PiBPbiAxMy4wMi4yMDIwIDEyOjMyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+Pj4+
IERvbid0IGFsbG93IGNwdV9ob3RwbHVnX2JlZ2luIHRvIGZhaWwgYnkgY29udmVydGluZyB0aGUg
dHJ5bG9jayBpbnRvIGEKPiA+Pj4+Pj4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUg
dXNlcnMgb2YgdGhlIGNwdV9hZGRfcmVtb3ZlX2xvY2sgYXJlCj4gPj4+Pj4+IGxpbWl0ZWQgdG8g
Q1BVIHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMsIGFuZCBjYW5ub3QgZGVhZGxvY2sgYmV0d2Vlbgo+
ID4+Pj4+PiB0aGVtc2VsdmVzIG9yIG90aGVyIHVzZXJzIHRha2luZyB0aGUgbG9jayBpbiByZWFk
IG1vZGUgYXMKPiA+Pj4+Pj4gY3B1X2FkZF9yZW1vdmVfbG9jayBpcyBhbHdheXMgbG9ja2VkIHdp
dGggaW50ZXJydXB0cyBlbmFibGVkLiBUaGVyZQo+ID4+Pj4+PiBhcmUgYWxzbyBubyBvdGhlciBs
b2NrcyB0YWtlbiBkdXJpbmcgdGhlIHBsdWcvdW5wbHVnIG9wZXJhdGlvbnMuCj4gPj4+Pj4gSSBk
b24ndCB0aGluayB0aGUgZ29hbCB3YXMgZGVhZGxvY2sgYXZvaWRhbmNlLCBidXQgcmF0aGVyIGxp
bWl0aW5nCj4gPj4+Pj4gb2YgdGhlIHRpbWUgc3BlbnQgc3Bpbm5pbmcgd2hpbGUgdHJ5aW5nIHRv
IGFjcXVpcmUgdGhlIGxvY2ssIGluCj4gPj4+Pj4gZmF2b3Igb2YgaGF2aW5nIHRoZSBjYWxsZXIg
cmV0cnkuCj4gPj4+PiBOb3cgdGhhdCB0aGUgY29udGVudGlvbiBiZXR3ZWVuIHJlYWQtb25seSB1
c2VycyBpcyByZWR1Y2VkIGFzIHRob3NlCj4gPj4+PiBjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJh
bGxlbCBJIHRoaW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+ID4+Pj4gYmxvY2tp
bmcgbW9kZS4KPiA+Pj4gSSdkIGFncmVlIGlmIHdyaXRlcnMgY291bGRuJ3QgYmUgc3RhcnZlZCBi
eSAobWFueSkgcmVhZGVycy4KPiA+PiBBRkFJQ1QgZnJvbSB0aGUgcncgbG9jayBpbXBsZW1lbnRh
dGlvbiByZWFkZXJzIHdvbid0IGJlIGFibGUgdG8gcGljawo+ID4+IHRoZSBsb2NrIGFzIHNvb24g
YXMgdGhlcmUncyBhIHdyaXRlciB3YWl0aW5nLCB3aGljaCBzaG91bGQgYXZvaWQgdGhpcwo+ID4+
IHN0YXJ2YXRpb24/Cj4gPj4KPiA+PiBZb3Ugc3RpbGwgbmVlZCB0byB3YWl0IGZvciBjdXJyZW50
IHJlYWRlcnMgdG8gZHJvcCB0aGUgbG9jaywgYnV0IG5vCj4gPj4gbmV3IHJlYWRlcnMgd291bGQg
YmUgYWJsZSB0byBsb2NrIGl0LCB3aGljaCBJIHRoaW5rIHNob3VsZCBnaXZiZSB1cwo+ID4+IGVu
b3VnaCBmYWlybmVzcy4KPiA+IEFoLCByaWdodCwgaXQgd2FzIHJhdGhlciB0aGUgb3RoZXIgd2F5
IGFyb3VuZCAtIGJhY2stdG8tYmFjawo+ID4gd3JpdGVycyBjYW4gc3RhcnZlIHJlYWRlcnMgd2l0
aCBvdXIgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4KPiA+Cj4gPj4gT1RPSCB3aGVuIHVzaW5nIF90
cnlsb2NrIG5ldyByZWFkZXJzIGNhbiBzdGlsbCBwaWNrCj4gPj4gdGhlIGxvY2sgaW4gcmVhZCBt
b2RlLCBhbmQgaGVuY2UgSSB0aGluayB1c2luZyBibG9ja2luZyBtb2RlIGZvcgo+ID4+IHdyaXRl
cnMgaXMgYWN0dWFsbHkgYmV0dGVyLCBhcyB5b3UgY2FuIGFzc3VyZSB0aGF0IHJlYWRlcnMgd29u
J3QgYmUKPiA+PiBhYmxlIHRvIHN0YXJ2ZSB3cml0ZXJzLgo+ID4gVGhpcyBpcyBhIGdvb2QgcG9p
bnQuIE5ldmVydGhlbGVzcyBJIHJlbWFpbiB1bmNvbnZpbmNlZCB0aGF0Cj4gPiB0aGUgY2hhbmdl
IGlzIHdhcnJhbnRlZCBnaXZlbiB0aGUgb3JpZ2luYWwgaW50ZW50aW9ucyAoYXMgZmFyCj4gPiBh
cyB3ZSdyZSBhYmxlIHRvIHJlY29uc3RydWN0IHRoZW0pLiBJZiB0aGUgY3VycmVudCBiZWhhdmlv
cgo+ID4gZ2V0cyBpbiB0aGUgd2F5IG9mIHNlbnNpYmxlIHNoaW0gb3BlcmF0aW9uLCBwZXJoYXBz
IHRoZQo+ID4gYmVoYXZpb3Igc2hvdWxkIGJlIG1hZGUgZGVwZW5kZW50IHVwb24gcnVubmluZyBp
biBzaGltIG1vZGU/Cj4gCj4gSG90cGx1ZyBpc24ndCBnZW5lcmFsbHkgdXNlZCBhdCBhbGwsIHNv
IHRoZXJlIGlzIDAgd3JpdGUgcHJlc3N1cmUgb24gdGhlCj4gbG9jay4KPiAKPiBXaGVuIGl0IGlz
IHVzZWQsIGl0IGlzIGFsbCBhdCBleHBsaWNpdCByZXF1ZXN0IGZyb20gdGhlIGNvbnRyb2xsaW5n
Cj4gZW50aXR5IGluIHRoZSBzeXN0ZW0gKGhhcmR3YXJlIGRvbWFpbiwgb3Igc2luZ2xldG9uIHNo
aW0gZG9tYWluKS4KPiAKPiBJZiB0aGF0IGVudGl0eSBpcyB0cnlpbmcgdG8gRG9TIHlvdSwgeW91
J3ZlIGFscmVhZHkgbG9zdC4KPiAKPiBUaGVyZSBtaWdodCBiZSBhdHRlbXB0cyB0byBqdXN0aWZ5
IHdoeSB0aGUgbG9ja2luZyB3YXMgZG9uZSBsaWtlIHRoYXQgaW4KPiB0aGUgZmlyc3QgcGxhY2Us
IGJ1dCBpdCBkb2Vzbid0IG1lYW4gdGhleSB3ZXJlIG5lY2Vzc2FyaWx5IGNvcnJlY3QgdG8KPiBi
ZWluZyB3aXRoLCBhbmQgdGhleSBkb24ndCBtYXRjaCB1cCB3aXRoIHRoZSByZWFsaXN0aWMgdXNh
Z2Ugb2YgdGhlIGxvY2suCgpJJ20gaGFwcHkgdG8gcmV3cml0ZSB0aGUgY29tbWl0IG1lc3NhZ2Ug
aW4gb3JkZXIgdG8gaW5jbHVkZSB0aGUKZGlzY3Vzc2lvbiBoZXJlLiBXaGF0IGFib3V0IGFkZGlu
ZzoKCk5vdGUgdGhhdCB3aGVuIHVzaW5nIHJ3IGxvY2tzIGEgd3JpdGVyIHdhbnRpbmcgdG8gdGFr
ZSB0aGUgbG9jayB3aWxsCnByZXZlbnQgZnVydGhlciByZWFkcyBmcm9tIGxvY2tpbmcgaXQsIGhl
bmNlIHByZXZlbnRpbmcgcmVhZGVycyBmcm9tCnN0YXJ2aW5nIHdyaXRlcnMuIFdyaXRlcnMgT1RP
SCBjb3VsZCBzdGFydmUgcmVhZGVycywgYnV0IHNpbmNlIHRoZQpsb2NrIGlzIG9ubHkgcGlja2Vk
IGluIHdyaXRlIG1vZGUgYnkgYWN0aW9ucyByZXF1ZXN0ZWQgYnkgcHJpdmlsZWdlZApkb21haW5z
IHN1Y2ggZW50aXRpZXMgYWxyZWFkeSBoYXZlIHRoZSBhYmlsaXR5IHRvIERvUyB0aGUgaHlwZXJ2
aXNvcgppbiBtYW55IG90aGVyIHdheXMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
