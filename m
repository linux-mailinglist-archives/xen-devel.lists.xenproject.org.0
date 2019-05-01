Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D110D58
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 21:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLv4k-0005Ku-8H; Wed, 01 May 2019 19:39:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UR0A=TB=bombadil.srs.infradead.org=batv+d28726b38c8108e46d85+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLv4i-0005KP-Va
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 19:39:29 +0000
X-Inumbo-ID: d4743e4d-6c48-11e9-843c-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4743e4d-6c48-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTqppJJO44ZaH1CSK2rL7bt+4t8f2e1EOdJEDaQceok=; b=iVWb12xvWz423AX0U3+7WSZNh
 a4mKDJNLV9uzNiZZdcud5THc1o3WrrEz3upx3AiBMPH+JQ7cdFwKwd7HEwgbgKnECa0BB3Lwr1ZwG
 KW8Cfu51EEWNeoCYrE22Z5HKIAKixKFsSQtEdOx9IRTgVouZnN9r3PrVZ8tOs2F1ey7wcvYkhtdEb
 iMwQVJaVC8/L7XTim8HdQU7Lqf/5eX1PdgPR4zwpRBxxwlsz5EanW01ydPvk1rTpfgTR5aJf8XboH
 0OA+M3EwWzmRwEAowbT8+fMxRoTmu/9nDEna2hN5dUZ5Mj7ISnc4x0aVfwxyvZw5d+9CQWoNKFFUC
 pfMleliJg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLv4g-0007rl-K3
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 19:39:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLv4f-0032TQ-7b
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 20:39:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 20:39:18 +0100
Message-Id: <cover.1556739159.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v2 0/7] Clean up x86_64 boot code
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
IEMgY29kZSB3aGljaAphY2Nlc3MgdGhlbSBpbiBsb3cgbWVtb3J5LgoKTmV4dCB1cCBpcyBraWxs
aW5nIHJlbG9jKCksIHdoaWNoIEFGQUlDVCBvbmx5IGV4aXN0cyB0byBlbnN1cmUgdGhhdAp0aGUg
dmFyaW91cyBicmVhZGNydW1icyBsZWZ0IGFsbCBvdmVyIHRoZSBwbGFjZSBieSB0aGUgTXVsdGli
b290CmJvb3Rsb2FkZXIgYXJlbid0IHNjcmliYmxlZCBvbiB3aGVuIHdlIGNvcHkgdGhlIDE2LWJp
dCBib290IHRyYW1wb2xpbmUKaW50byBsb3cgbWVtb3J5LiBFeGNlcHQgdGhhdCBpdCdzIGNvcHlp
bmcgaXQgb3V0IG9mIHRoZSB3YXkuLi4gaW50bwp0aGUgdG9wIG9mIGxvdyBtZW1vcnkuIFN1c3Bl
Y3QgaWYgSSB0ZWxsIGtleGVjIHRvIHB1dCBhIHNlZ21lbnQgdGhlcmUsCml0J3MgZ29pbmcgdG8g
ZmFpbCBxdWl0ZSBob3JyaWJseS4KCldoaWNoIGxlYXZlcyBtZSB3aXRoIG5vIHZhbGlkIHJlYXNv
biBmb3IgcmVsb2MoKSB0byBiZSBydW5uaW5nIHRoaXMKZWFybHksIHNvIEkgbWF5IHdlbGwga2ls
bCBpdCB3aXRoIGZpcmUgdG9vLiBJIGp1c3QgbmVlZCB0byBmaW5kIGEKc2FmZSBsb2NhdGlvbiBm
b3IgdGhlIDE2LWJpdCBib290IGNvZGUuCgp2MjogRml4IHdha2UgY29kZS4gVGhhbmtzIEFuZHkg
Zm9yIHRlc3RpbmcuCgpEYXZpZCBXb29kaG91c2UgKDcpOgogIHg4Ni93YWtldXA6IFN0b3AgdXNp
bmcgJWZzIGZvciBsaWR0L2xnZHQKICB4ODYvYm9vdDogUmVtb3ZlIGdyYXR1aXRvdXMgY2FsbCBi
YWNrIGludG8gbG93LW1lbW9yeSBjb2RlCiAgeDg2L2Jvb3Q6IE9ubHkganVtcCBpbnRvIGxvdyB0
cmFtcG9saW5lIGNvZGUgZm9yIHJlYWwtbW9kZSBib290CiAgeDg2L2Jvb3Q6IFNwbGl0IGJvb3Rz
eW0oKSBpbnRvIGZvdXIgdHlwZXMgb2YgcmVsb2NhdGlvbnMKICB4ODYvYm9vdDogUmVuYW1lIHRy
YW1wb2xpbmVfe3N0YXJ0LGVuZH0gdG8gYm9vdF90cmFtcG9saW5lX3tzdGFydCxlbmR9CiAgeDg2
L2Jvb3Q6IENvcHkgMTYtYml0IGJvb3QgdmFyaWFibGVzIGJhY2sgdXAgdG8gWGVuIGltYWdlCiAg
eDg2L2Jvb3Q6IERvIG5vdCB1c2UgdHJhbXBvbGluZSBmb3Igbm8tcmVhbC1tb2RlIGJvb3QgcGF0
aHMKCiB4ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNo
L3g4Ni9ib290L2VkZC5TICAgICAgICAgICB8ICAxOCArKy0tCiB4ZW4vYXJjaC94ODYvYm9vdC9o
ZWFkLlMgICAgICAgICAgfCAgODkgKysrKysrKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvYm9v
dC9tZW0uUyAgICAgICAgICAgfCAgMzUgKysrLS0tLS0KIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1w
b2xpbmUuUyAgICB8IDE0NSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni9ib290L3ZpZGVvLlMgICAgICAgICB8ICAzNiArKysrLS0tLQogeGVuL2FyY2gveDg2L2Jv
b3Qvd2FrZXVwLlMgICAgICAgIHwgIDIzICsrLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
ICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYyAgICAgICAgICB8ICAg
MiArLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oICAgICAgIHwgIDMxICstLS0tLS0KIHhl
bi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L3Bs
YXRmb3JtX2h5cGVyY2FsbC5jIHwgIDE4ICsrLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAg
ICAgICAgICB8ICA3MiArKysrKysrKysrKystLS0KIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgICAg
ICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L3Rib290LmMgICAgICAgICAgICAgIHwgICA2
ICstCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMgICAgICAgICAgICB8ICAyNyArKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvYWNwaS5oICAgICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCAg
ICAgIHwgIDEwICstLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9lODIwLmggICAgICAgIHwgICA1ICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2VkZC5oICAgICAgICAgfCAgIDEgLQogMjEgZmlsZXMgY2hh
bmdlZCwgMzM5IGluc2VydGlvbnMoKyksIDE5OSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
