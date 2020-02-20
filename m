Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2B1660D8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:23:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4naD-0008J4-8r; Thu, 20 Feb 2020 15:17:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4naB-0008Iz-GX
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:17:43 +0000
X-Inumbo-ID: 2358785a-53f4-11ea-854a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2358785a-53f4-11ea-854a-12813bfff9fa;
 Thu, 20 Feb 2020 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582211862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JUppiVQYE1qjVptSe/Es5UbnBcDq7S5ScQY0bgEgBVo=;
 b=WThzOltl/Wzk7/JLCFeBxXqQ/RNYBpuZkfTBA/NznyHEtdvsq6otyR4V
 YqRNYcs5hNtePgZ36diWDVy9OhyIAns4sfZcYVW8qE+z8uTNh94ZP/THj
 f2kdGF2xEb7uI2jx4TBRipju2s6Ksktpo957xbyz1qkJOJuIPX3ZOrvOv E=;
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
IronPort-SDR: 9yRWce/1RymCx/XglvfoAkBB6pLyNlWfEoML/TaVu2FEX99R1VqbVWLsRskW47r1UCXozHPO1G
 llULjqwUR2Fa/hjr3BACGXH20+YF3YVF0ld+QMajaQrhFjWuKb2GvjIiXYYl7I4AoJsoG7/C0A
 38qFTeDVWasRjboYO3B5HUfIjCaYbYzEnOQiBeYTUjppIZ/Yk76kxagkn7jA6FgArO6DyZ33DE
 rYUEURAoxJSXOdchvQXRa6CDr6jPEGPtpdQEqqgmWuBM49pr70vub9pI+L/9sZrQOPRgYRX34A
 e98=
X-SBRS: 2.7
X-MesageID: 13382712
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="13382712"
Date: Thu, 20 Feb 2020 16:17:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220151734.GM4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDQ6MDI6NTVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDIuMjAyMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IEFub3RoZXIgb3B0aW9uIGlzIHRvIHVzZSB0aGUgcmVjdXJzZV9jcHUgZmllbGQgb2Yg
dGhlCj4gPj4gYXNzb2NpYXRlZCBzcGluIGxvY2s6IFRoZSBmaWVsZCBpcyB1c2VkIGZvciByZWN1
cnNpdmUgbG9ja3MKPiA+PiBvbmx5LCBhbmQgaGVuY2UgdGhlIG9ubHkgY29uZmxpY3Qgd291bGQg
YmUgd2l0aAo+ID4+IF9zcGluX2lzX2xvY2tlZCgpLCB3aGljaCB3ZSBkb24ndCAoYW5kIGluIHRo
ZSBmdXR1cmUgdGhlbgo+ID4+IGFsc28gc2hvdWxkbid0KSB1c2Ugb24gdGhpcyBsb2NrLgo+ID4g
Cj4gPiBJIGxvb2tlZCBpbnRvIHRoYXQgYWxzbywgYnV0IHRoaW5ncyBnZXQgbW9yZSBjb21wbGlj
YXRlZCBBRkFJQ1QsIGFzIGl0J3MKPiA+IG5vdCBwb3NzaWJsZSB0byBhdG9taWNhbGx5IGZldGNo
IHRoZSBzdGF0ZSBvZiB0aGUgbG9jayBhbmQgdGhlIG93bmVyCj4gPiBDUFUgYXQgdGhlIHNhbWUg
dGltZS4gTmVpdGhlciB5b3UgY291bGQgc2V0IHRoZSBMT0NLRUQgYml0IGFuZCB0aGUgQ1BVCj4g
PiBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBhdG9taWNhbGx5IGZl
dGNoIGJvdGggYWZhaWNzOiBUaGUgZmllbGQgaXMKPiB2YWxpZCBvbmx5IGlmIHRoZSBMT0NLRUQg
Yml0IGlzIHNldC4gQW5kIHdoZW4gcmVhZGluZyB0aGUKPiBmaWVsZCB5b3Ugb25seSBjYXJlIGFi
b3V0IHRoZSB2YWx1ZSBiZWluZyBlcXVhbCB0bwo+IHNtcF9wcm9jZXNzb3JfaWQoKSwgaS5lLiBp
dCBpcyBmaW5lIHRvIHNldCBMT0NLRUQgYmVmb3JlCj4gdXBkYXRpbmcgdGhlIENQVSBmaWVsZCBv
biBsb2NrLCBhbmQgdG8gcmVzZXQgdGhlIENQVSBmaWVsZCB0bwo+IFNQSU5MT0NLX05PX0NQVSAo
b3Igd2hhdGV2ZXIgaXQncyBjYWxsZWQpIGJlZm9yZSBjbGVhcmluZwo+IExPQ0tFRC4KClllcyB0
aGF0IHdvdWxkIHJlcXVpcmUgdGhlIHVzYWdlIG9mIGEgc2VudGluZWwgdmFsdWUgYXMgMCB3b3Vs
ZCBiZSBhCnZhbGlkIHByb2Nlc3NvciBJRC4KCkkgd291bGQgdHJ5IHRvIHJlZnJhaW4gZnJvbSAo
YWJ1KXNpbmcgaW50ZXJuYWwgc3BpbmxvY2sgZmllbGRzLCBhcyBJCnRoaW5rIHdlIGNhbiBzb2x2
ZSB0aGlzIGp1c3QgYnkgdXNpbmcgdGhlIGNudHMgZmllbGQgb24gdGhlIGN1cnJlbnQKcndsb2Nr
IGltcGxlbWVudGF0aW9uLgoKV2hhdCBpc3N1ZSBkbyB5b3UgaGF2ZSBpbiBtaW5kIHRoYXQgd291
bGQgcHJldmVudCBzdG9yaW5nIHRoZSBDUFUKd3JpdGUgbG9ja2VkIGluIHRoZSBjbnRzIGZpZWxk
PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
