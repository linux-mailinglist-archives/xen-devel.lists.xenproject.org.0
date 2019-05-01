Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC6F10772
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:20:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFC-0001iE-0L; Wed, 01 May 2019 11:17:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnF9-0001gW-O6
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:43 +0000
X-Inumbo-ID: bbe137b5-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbe137b5-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOt1olUDZdf7hWx/DiulXgFT8LWqf1zrNDHAr9+WgxY=; b=tJaHzSAMF5cTUxGyOSw91eB93
 dVm+fFnaMNrc6FyX2Xj8jpQAOIni6fWQp36pYag3ICTeKG4+DputRrRpUHqPpsVTA1rC1zK0l/Fpf
 DB0WiDfeJ7nI88E0UXXQ9B62gwabUrkrpNfx4PlhPavGBv+Th774sAq2LQfiapEW8nXYBgLUbIheL
 r613X/7XLHVGGqc8Nq3mVB7TsHtnoD282xp9r086TdpxmzFk3hZal9en4lt917/72Fanbtal2+oUu
 k6WuozpMYerExT7GZBSeoPMxR011peaIGrL2HIQlMTDXLUS8NFb3liENa8OtkeWJFqkFY2rQSrWEM
 F9FLgBX2Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Rq-4O
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030Nk-8F
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:32 +0100
Message-Id: <cover.1556708225.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 0/7] Clean up x86_64 boot code
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBjbGVhbnVwcyBmb3IgdGhlIGJvb3QgcGF0aCwgb3JpZ2luYWxseSBpbnNwaXJlZCBieSBh
biBhdHRlbXB0IHRvCmF2b2lkIHNjcmliYmxpbmcgb24gYXJiaXRyYXJpbHktY2hvc2VuIGxvdyBt
ZW1vcnkuCgpJbiB0aGUgbm8tcmVhbC1tb2RlIGNhc2Ugd2UgZG9uJ3QgbmVlZCB0byBib3VuY2Ug
dGhyb3VnaCBsb3cgbWVtb3J5IGF0CmFsbDsgd2UgY2FuIHJ1biB0aGUgMzItYml0IHRyYW1wb2xp
bmUgaW4tcGxhY2UgaW4gdGhlIFhlbiBpbWFnZS4KClRoZSB2YXJpYWJsZXMgY29udGFpbmluZyBp
bmZvcm1hdGlvbiB3aGljaCBpcyBvcHRpb25hbGx5IGRpc2NvdmVyZWQgYnkKdGhlIHJlYWwtbW9k
ZSBib290IGNvZGUgY2FuIGJlIHB1dCBiYWNrIGluIHBsYWNlIGluIHRoZSBYZW4gaW1hZ2UgYW5k
IHdlCmNhbiBkaXNwZW5zZSB3aXRoIHRoZSBib290c3ltKCkgcG9pbnRlciBneW1uYXN0aWNzIGlu
IEMgY29kZSB3aGljaAphY2Nlc3MgdGhlbSBpbiBsb3cgbWVtb3J5LgoKSSBoYXZlbid0IHlldCBn
b3QgdG8gcmVsb2MoKSwgd2hpY2ggSSB0aGluayBleGlzdHMgb25seSB0byBlbnN1cmUgdGhhdAp0
aGUgdmFyaW91cyBicmVhZGNydW1icyBsZWZ0IGFsbCBvdmVyIHRoZSBwbGFjZSBieSB0aGUgTXVs
dGlib290CmJvb3Rsb2FkZXIgYXJlbid0IHNjcmliYmxlZCBvbiB3aGVuIHdlIGNvcHkgdGhlIDE2
LWJpdCBib290IHRyYW1wb2xpbmUKaW50byBsb3cgbWVtb3J5LiBJJ2QgcXVpdGUgbGlrZSB0byBr
aWxsIHJlbG9jKCkgYW5kIHBhc3MgdGhlIG9yaWdpbmFsCnBvaW50ZXIgdXAgdG8gNjQtYml0IGNv
ZGUgdG8gYmUgaGFuZGxlZCBpbiBDLgoKVGhhdCB3b3VsZCByZXF1aXJlIGZpbmRpbmcgYSAqc2Fm
ZSogbG9jYXRpb24gdG8gcHV0IHRoZSAxNi1iaXQgYm9vdAp0cmFtcG9saW5lIHRob3VnaCwgd2hp
Y2ggZG9lc24ndCBhbHJlYWR5IGNvbnRhaW4gYW55dGhpbmcgdGhhdCB0aGUKYm9vdGxvYWRlciBj
cmVhdGVkIGZvciB1cy4KCkluIGZhY3QsIGlzbid0IHRoZXJlIGFscmVhZHkgYSBjaGFuY2UgdGhh
dCBoZWFkLlMgd2lsbCBjaG9vc2UgYSBsb2NhdGlvbgpmb3IgdGhlIHRyYW1wb2xpbmUgd2hpY2gg
aXMgYWxyZWFkeSBwYXJ0IG9mIGEgbW9kdWxlIG9yIGNvbnRhaW5zIG9uZSBvZgp0aGUgTXVsdGli
b290IGJyZWFkY3J1bWJzPwoKRGF2aWQgV29vZGhvdXNlICg3KToKICB4ODYvd2FrZXVwOiBTdG9w
IHVzaW5nICVmcyBmb3IgbGlkdC9sZ2R0CiAgeDg2L2Jvb3Q6IFJlbW92ZSBncmF0dWl0b3VzIGNh
bGwgYmFjayBpbnRvIGxvdy1tZW1vcnkgY29kZQogIHg4Ni9ib290OiBPbmx5IGp1bXAgaW50byBs
b3cgdHJhbXBvbGluZSBjb2RlIGZvciByZWFsLW1vZGUgYm9vdAogIHg4Ni9ib290OiBTcGxpdCBi
b290c3ltKCkgaW50byBmb3VyIHR5cGVzIG9mIHJlbG9jYXRpb25zCiAgeDg2L2Jvb3Q6IFJlbmFt
ZSB0cmFtcG9saW5lX3tzdGFydCxlbmR9IHRvIGJvb3RfdHJhbXBvbGluZV97c3RhcnQsZW5kfQog
IHg4Ni9ib290OiBDb3B5IDE2LWJpdCBib290IHZhcmlhYmxlcyBiYWNrIHVwIHRvIFhlbiBpbWFn
ZQogIHg4Ni9ib290OiBEbyBub3QgdXNlIHRyYW1wb2xpbmUgZm9yIG5vLXJlYWwtbW9kZSBib290
IHBhdGhzCgogeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICAgIHwgICA2ICstCiB4ZW4v
YXJjaC94ODYvYm9vdC9lZGQuUyAgICAgICAgICAgfCAgMTggKystLQogeGVuL2FyY2gveDg2L2Jv
b3QvaGVhZC5TICAgICAgICAgIHwgIDg5ICsrKysrKysrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2
L2Jvb3QvbWVtLlMgICAgICAgICAgIHwgIDM1ICsrKy0tLS0tCiB4ZW4vYXJjaC94ODYvYm9vdC90
cmFtcG9saW5lLlMgICAgfCAxNDUgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB4ZW4v
YXJjaC94ODYvYm9vdC92aWRlby5TICAgICAgICAgfCAgMzYgKysrKy0tLS0KIHhlbi9hcmNoL3g4
Ni9ib290L3dha2V1cC5TICAgICAgICB8ICAyMyArKy0tLQogeGVuL2FyY2gveDg2L2NwdS9jb21t
b24uYyAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMgICAgICAgICAg
fCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCAgICAgICB8ICAzMSArLS0tLS0t
CiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4
Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYyB8ICAxOCArKy0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAg
ICAgICAgICAgICAgfCAgNzIgKysrKysrKysrKysrLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5j
ICAgICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICAgICB8
ICAgNiArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAgIHwgICAyICstCiB4ZW4v
YXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgICAgfCAgMjcgKysrKy0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2FjcGkuaCAgICAgICAgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvY29uZmln
LmggICAgICB8ICAxMCArLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZTgyMC5oICAgICAgICB8ICAg
NSArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9lZGQuaCAgICAgICAgIHwgICAxIC0KIDIxIGZpbGVz
IGNoYW5nZWQsIDMzOSBpbnNlcnRpb25zKCspLCAxOTkgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
