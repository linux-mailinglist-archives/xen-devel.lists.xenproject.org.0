Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81D153520
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:18:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNKS-00058L-IC; Wed, 05 Feb 2020 16:15:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izNKQ-00057o-Lw
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:15:02 +0000
X-Inumbo-ID: a92e26e6-4832-11ea-914b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a92e26e6-4832-11ea-914b-12813bfff9fa;
 Wed, 05 Feb 2020 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580919301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Z/wDnWyZK5QYply7ZvBFSeywNwSw38Hce+GW8M1Two=;
 b=SIeq9JCFkptfv7jWERnhHPAd7redUdjw4ACbN71CABBB37mJJ6EChZuw
 dhGZosuGkaENKmzQX+6lDHnhiCT+5+5ZJViGN3hMhVX711MPwcwuoExlN
 tD29yRGCYtFpeJ7+7+ad8BFujY/GUfYxc3id15LPhUJnjXUAH0/p8CZtR s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xlX5QHI5dtnNrEK8Q2avlgoP+3g98Z2vSHK1ncCjBm3quzoD2JrWSgQ+Wuxtla5k8TT3aATzPs
 LwUqPLEYnvMqG4KFICLkxhyWXjUFNfAbvt84AMHT9PsT7W/GVZaEqEiEgHJeeF7I8YL9Njoc68
 SC3qcoRR7AAqZ1LGcAO8p+6Li1RmvuQnbtRKUbGpTPThtz8tFst2o/sZDGWD+Kwh0mMoEPkubv
 ISEJpsXza5ofTbUF7dvLswaIY2jBGFXIDVyI6CLKba1o+FkBDRJwctRuDvcep54Ix3oVkMG+8H
 g4U=
X-SBRS: 2.7
X-MesageID: 12609376
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12609376"
Date: Wed, 5 Feb 2020 17:14:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20200205161432.GU4679@Air-de-Roger>
References: <20200127181115.82709-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-1-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 0/7] x86: improve assisted tlb flush and
 use it in guest mode
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCkp1c3Qgd2FudCB0byBtYWtlIHN1cmUgdGhpcyBkb2Vzbid0IGdvIHVuZGVyIHRoZSBy
YWRhci4KClRoYW5rcywgUm9nZXIuCgpPbiBNb24sIEphbiAyNywgMjAyMCBhdCAwNzoxMTowOFBN
ICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gVGhlIGZvbGxvd2lu
ZyBzZXJpZXMgYWltcyB0byBpbXByb3ZlIHRoZSBUTEIgZmx1c2ggdGltZXMgd2hlbiBydW5uaW5n
Cj4gbmVzdGVkIFhlbiwgYW5kIGl0J3Mgc3BlY2lhbGx5IGJlbmVmaWNpYWwgd2hlbiBydW5uaW5n
IGluIHNoaW0gbW9kZS4KPiAKPiBPbmx5IHRoZSBIQVAgZ3Vlc3QgVExCIGZsdXNoIGlzIGltcHJv
dmVkLCB0aGUgc2hhZG93IHBhZ2luZyBUTEIgZmx1c2ggaXMKPiBsZWZ0IGFzLWlzLCBhbmQgY2Fu
IGJlIGltcHJvdmVkIGxhdGVyIGlmIHRoZXJlJ3MgaW50ZXJlc3QuCj4gCj4gRm9yIGEgcmVmZXJl
bmNlIG9uIHRoZSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBzZWUgcGF0Y2ggIzcsIGFzIGl0J3Mg
YQo+IGh1Z2UgaW5jcmVhc2Ugd2hpY2ggY2FuIGJlbmVmaXQgb3RoZXIgZ3Vlc3RzIHVzaW5nIGFz
c2lzdGVkIFRMQiBmbHVzaGVzLAo+IGFuZCBhbHNvIHRoZSBvbmVzIHVzaW5nIHRoZSB2aXJpZGlh
biBUTEIgZmx1c2ggYXNzaXN0IChpZTogV2luZG93cykuCj4gCj4gVGhhbmtzLCBSb2dlci4KPiAK
PiBSb2dlciBQYXUgTW9ubmUgKDcpOgo+ICAgeDg2L3RsYjogZml4IE5FRURfRkxVU0ggcmV0dXJu
IHR5cGUKPiAgIHg4Ni9odm06IGFsbG93IEFTSUQgZmx1c2ggd2hlbiB2ICE9IGN1cnJlbnQKPiAg
IHg4Ni9wYWdpbmc6IGFkZCBUTEIgZmx1c2ggaG9va3MKPiAgIHg4Ni9oYXA6IGltcHJvdmUgaHlw
ZXJ2aXNvciBhc3Npc3RlZCBndWVzdCBUTEIgZmx1c2gKPiAgIHg4Ni90bGI6IGludHJvZHVjZSBh
IGZsdXNoIGd1ZXN0cyBUTEIgZmxhZwo+ICAgeDg2L3RsYjogYWxsb3cgZGlzYWJsaW5nIHRoZSBU
TEIgY2xvY2sKPiAgIHg4Ni90bGI6IHVzZSBYZW4gTDAgYXNzaXN0ZWQgVExCIGZsdXNoIHdoZW4g
YXZhaWxhYmxlCj4gCj4gIHhlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jICAgICAgICAgICAgICAgIHwg
MjQgKysrKysrLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwg
MTAgKysrKwo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8ICA2ICsr
Kwo+ICB4ZW4vYXJjaC94ODYvaHZtL2FzaWQuYyAgICAgICAgICAgICAgICB8ICA2ICstLQo+ICB4
ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICB8IDUxICsrLS0tLS0tLS0tLS0t
LS0tLQo+ICB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAgICAgICAgICB8IDQ4ICsrKysr
KysrKysrKysrKysrCj4gIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgICAgICAgIHwg
NzEgKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9o
dm0uYyAgICAgICAgICAgfCAgMiArLQo+ICB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMg
ICAgICAgICB8IDE3ICsrKy0tLQo+ICB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgICAgICAgICAg
ICAgICB8IDExICsrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oICAgICAgICAg
fCAyMSArKysrKysrLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8
IDE3ICsrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2hhcC5oICAgICAgICAgICAgICB8ICAz
ICsrCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAgICAgICAgIHwgMTIgKysrKysK
PiAgMTQgZmlsZXMgY2hhbmdlZCwgMjIwIGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9ucygtKQo+
IAo+IC0tIAo+IDIuMjUuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
