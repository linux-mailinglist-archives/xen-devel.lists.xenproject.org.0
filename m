Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F360216A39D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:13:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6AhJ-0001p1-8z; Mon, 24 Feb 2020 10:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6AhH-0001ol-Oi
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:10:43 +0000
X-Inumbo-ID: ea38ee86-56ed-11ea-bc8e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea38ee86-56ed-11ea-bc8e-bc764e2007e4;
 Mon, 24 Feb 2020 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582539042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yrcKzkTInNgZ3G5A71ZpXv9StajmsjXp2keJoze1Sew=;
 b=TQItNNgpILZzSt60sl4QDfFsUmGASUJNmq2LCVPMwOUrS+pXtz2SQvn/
 igMEfNP4WCCli1T8TinsIf2BZgjNOKtl2EchdNC7dW6h3NatBGWwHpB9/
 7Yqk3AbXr1/JqvXgxgfoNd/yrEApCUwk213zc+OMcU5zpsVFXKgyUZJ54 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5U80ME/Lajk0jdfngTegy6isQ/ZDEY77qm2Cd0lTu1KYL8PaL9PMdWMOtN3YoaNq0XzeTe3nQx
 JSZx+QDZYkXiwSkBW16PDeamjF//5CVG1Q7LeMxwEaqxLZuQsFi2mLuBI0gGqaoFhPI41oFB8U
 XR9nuF2/qCOjw6IjPgRYVbpITarqT0Cesp3oI1MCdQA+Dv3fTY15akru8vF+fhu2ocgWG2kUah
 pkzsKwLG/3YNt82Yq6EnNcT7cK/yoxLwxnDYGYcrWFf74W9lf+6FRZZdA431OQOX0vM1oAT35k
 Fbk=
X-SBRS: 2.7
X-MesageID: 13328874
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13328874"
Date: Mon, 24 Feb 2020 11:10:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200224101035.GI4679@Air-de-Roger>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-3-roger.pau@citrix.com>
 <8c0dcb31-cbbd-4910-b4a5-8bb11a1158cf@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c0dcb31-cbbd-4910-b4a5-8bb11a1158cf@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6MDU6MzlBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDI0LzAyLzIwMjAgMDg6NDQsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPiA+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0
ZSBtb2RlIHRvIGFsc28gbG9jayBpdCBpbgo+ID4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0g
aW4gYWxsb3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+ID4gYWxyZWFkeSBvd25l
ZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4g
PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNl
Lgo+ID4gCj4gPiBJbiBvcmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTJiaXRzIG9mIHRoZSBsb2Nr
LCB0aGlzIGFsbG93cyB0byBzdXBwb3J0Cj4gPiB1cCB0byA0MDk2IENQVXMuIEFsc28gcmVkdWNl
IHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8gMiBiaXRzOiBvbmUgdG8KPiA+IHNpZ25hbCB0aGVyZSBh
cmUgcGVuZGluZyB3cml0ZXJzIHdhaXRpbmcgb24gdGhlIGxvY2sgYW5kIHRoZSBvdGhlciB0bwo+
ID4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuCj4gPiAKPiA+IFRoaXMg
cmVkdWNlcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgY29uY3VycmVudCByZWFkZXJzIGZyb20gMTY3
NzcyMTYgdG8KPiA+IDI2MjE0NCwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gs
IG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPiA+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0
Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0IGF0b21pYwo+ID4gb3BlcmF0aW9ucyBv
biA2NGJpdCBpbnRlZ2Vycy4KPiA+IAo+ID4gRml4ZXM6IDU4NzJjODNiNDJjNjA4ICgnc21wOiBj
b252ZXJ0IHRoZSBjcHUgbWFwcyBsb2NrIGludG8gYSBydyBsb2NrJykKPiA+IFJlcG9ydGVkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBSZXBvcnRlZC1ieTogSsO8cmdl
biBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgc2luY2UgdjI6
Cj4gPiAgIC0gVXNlIGF0b21pY19hbmQgdG8gY2xlYXIgdGhlIHdyaXRlcnMgcGFydCBvZiB0aGUg
bG9jayB3aGVuCj4gPiAgICAgd3JpdGUtdW5sb2NraW5nLgo+ID4gICAtIFJlZHVjZSB3cml0ZXIt
cmVsYXRlZCBhcmVhIHRvIDE0Yml0cy4KPiA+ICAgLSBJbmNsdWRlIHhlbi9zbXAuaCBmb3IgQXJt
NjQuCj4gCj4gT09JLCBpcyBpdCB0byB1c2Ugc21wX3Byb2Nlc3Nvcl9pZCgpPwoKWWVzLCBvciBl
bHNlIEkgd291bGQgZ2V0IGVycm9ycyB3aGVuIGJ1aWxkaW5nIGFzbS1vZmZzZXRzIG9uIEFybTY0
CklJUkMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
