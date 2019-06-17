Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A8483FF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 15:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcrhw-0004uv-KZ; Mon, 17 Jun 2019 13:30:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PBjo=UQ=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1hcrhu-0004ul-Nh
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:29:58 +0000
X-Inumbo-ID: fd83f180-9103-11e9-84ae-c7f5df6ae246
Received: from mout.kundenserver.de (unknown [212.227.126.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd83f180-9103-11e9-84ae-c7f5df6ae246;
 Mon, 17 Jun 2019 13:29:54 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mnq8Y-1iQnn21uzS-00pKbB; Mon, 17 Jun 2019 15:29:50 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Date: Mon, 17 Jun 2019 15:28:43 +0200
Message-Id: <20190617132946.2817440-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:WxAlzhRk05Boo+/YM4l5i3GHyI9GeBc8OiWCfJusR6LAoI1zMkq
 mI5T09W/WmD7J75VlpcbwtZqQ0SrDUbM08mliK9OyOpw5VGdZN1zx6lKdkmnejKI2IWefXV
 gD87Cuo+tKgxk+8DVFi5MULUIVmtKYjNbQ/mH9PLbLfMO/vz0NadJP8Sg5EQz6l4Rygh/yT
 LeEipTLCyl1mG60QYU9LA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pjHS7vU6GCo=:oYrDoKB2+KgIcpoaYs8GlG
 uTtBiYh+a9NRCMSK/VAmJBtr3OyY50oWkyFrAONPZtPHVNpiF2a8CHfvo5FAn9V1TMPmHj5jF
 NHxQxqMxS1V9M23uTBejYpfbDSjtIH/c0sAcPnkGEJkybimAEup6/oze7uWb2eQBnfEFQoWUQ
 aJy4HSSAKT+4gw0ktzsx3iM6TPn57cocJrG/3j5ZCD/oAdErbgrysiAhEeIY9GWvEVkvjDLUI
 ONy9C26roR2C6uw20//9hHKteelpqgKuxODx/J/UPtPgIMywqCsDLHqOreyPZIamuMa1y+w5G
 VfTKrnXuklvNm0PX7w7uJIDUmjaHUOra43Y5OxASS35FYFrpJFZvxfUiVc8eRpYhueBJoiqeA
 aAO7vgmS0K7aJcv4XsT7yAuXgRNjzO7c8G4uCtniGqhvkCj6f0V3UlfvkLvAEw1olB/EoBZGI
 3UqpKNY5rjoEdLlVgcSXpS2IAI4cwApvlzIwjAAoBu4rrtqwv/aK0yvzchZRHvCzAFXGe8bRe
 +bm04PWiu6yyPZ/yOlveC8euUHfYhoJOdzudhIanL205wpbYyqs+QeylkyGFUUOg3X6Qs5qsa
 RMJUfD0XDSpuNei092sg7J/xfBCHQmIWZmyPvHOtDnOWOGKcu2l7SMGW+i1PFzF9/LL4Vrn18
 3KHw4A+YxFrMfGY9xxypp+kyL9UCU3Vi3s/DYWqc7KuDLjYVMLmoUjW3hGoYprONHKuxNyhn/
 ltfrC74ikaZMsbUQaH/Ka2jk6kCcG4leKkdP+w==
Subject: [Xen-devel] [PATCH] swiotlb: fix phys_addr_t overflow warning
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgYSBsYXJnZXIgZG1hX2FkZHJfdCB0aGFuIHBoeXNf
YWRkcl90LAp0aGUgc3dpb3RsYl90YmxfbWFwX3NpbmdsZSgpIGZ1bmN0aW9uIHRydW5jYXRlcyBp
dHMgcmV0dXJuIGNvZGUKaW4gdGhlIGZhaWx1cmUgcGF0aCwgbWFraW5nIGl0IGltcG9zc2libGUg
dG8gaWRlbnRpZnkgdGhlIGVycm9yCmxhdGVyLCBhcyB3ZSBjb21wYXJlIHRvIHRoZSBvcmlnaW5h
bCB2YWx1ZToKCmtlcm5lbC9kbWEvc3dpb3RsYi5jOjU1MTo5OiBlcnJvcjogaW1wbGljaXQgY29u
dmVyc2lvbiBmcm9tICdkbWFfYWRkcl90JyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcnKSB0byAn
cGh5c19hZGRyX3QnIChha2EgJ3Vuc2lnbmVkIGludCcpIGNoYW5nZXMgdmFsdWUgZnJvbSAxODQ0
Njc0NDA3MzcwOTU1MTYxNSB0byA0Mjk0OTY3Mjk1IFstV2Vycm9yLC1XY29uc3RhbnQtY29udmVy
c2lvbl0KICAgICAgICByZXR1cm4gRE1BX01BUFBJTkdfRVJST1I7CgpVc2UgYW4gZXhwbGljaXQg
dHlwZWNhc3QgaGVyZSB0byBjb252ZXJ0IGl0IHRvIHRoZSBuYXJyb3dlciB0eXBlLAphbmQgdXNl
IHRoZSBzYW1lIGV4cHJlc3Npb24gaW4gdGhlIGVycm9yIGhhbmRsaW5nIGxhdGVyLgoKRml4ZXM6
IGI5MDdlMjA1MDhkMCAoInN3aW90bGI6IHJlbW92ZSBTV0lPVExCX01BUF9FUlJPUiIpClNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQpJIHN0aWxsIHRoaW5r
IHRoYXQgcmV2ZXJ0aW5nIHRoZSBvcmlnaW5hbCBjb21taXQgd291bGQgaGF2ZQpwcm92aWRlZCBj
bGVhcmVyIHNlbWFudGljcyBmb3IgdGhpcyBjb3JuZXIgY2FzZSwgYnV0IGF0IGxlYXN0CnRoaXMg
cGF0Y2ggcmVzdG9yZXMgdGhlIGNvcnJlY3QgYmVoYXZpb3IuCi0tLQogZHJpdmVycy94ZW4vc3dp
b3RsYi14ZW4uYyB8IDIgKy0KIGtlcm5lbC9kbWEvc3dpb3RsYi5jICAgICAgfCA0ICsrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5j
CmluZGV4IGQ1M2YzNDkzYTZiOS4uY2ZiZTQ2Nzg1YTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKQEAgLTQwMiw3
ICs0MDIsNyBAQCBzdGF0aWMgZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFnZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAogCiAJbWFwID0gc3dpb3RsYl90YmxfbWFw
X3NpbmdsZShkZXYsIHN0YXJ0X2RtYV9hZGRyLCBwaHlzLCBzaXplLCBkaXIsCiAJCQkJICAgICBh
dHRycyk7Ci0JaWYgKG1hcCA9PSBETUFfTUFQUElOR19FUlJPUikKKwlpZiAobWFwID09IChwaHlz
X2FkZHJfdClETUFfTUFQUElOR19FUlJPUikKIAkJcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwog
CiAJZGV2X2FkZHIgPSB4ZW5fcGh5c190b19idXMobWFwKTsKZGlmZiAtLWdpdCBhL2tlcm5lbC9k
bWEvc3dpb3RsYi5jIGIva2VybmVsL2RtYS9zd2lvdGxiLmMKaW5kZXggZTkwNmVmMmU2MzE1Li5h
M2JlNjUxOTczYWQgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9kbWEvc3dpb3RsYi5jCisrKyBiL2tlcm5l
bC9kbWEvc3dpb3RsYi5jCkBAIC01NDgsNyArNTQ4LDcgQEAgcGh5c19hZGRyX3Qgc3dpb3RsYl90
YmxfbWFwX3NpbmdsZShzdHJ1Y3QgZGV2aWNlICpod2RldiwKIAlpZiAoIShhdHRycyAmIERNQV9B
VFRSX05PX1dBUk4pICYmIHByaW50a19yYXRlbGltaXQoKSkKIAkJZGV2X3dhcm4oaHdkZXYsICJz
d2lvdGxiIGJ1ZmZlciBpcyBmdWxsIChzejogJXpkIGJ5dGVzKSwgdG90YWwgJWx1IChzbG90cyks
IHVzZWQgJWx1IChzbG90cylcbiIsCiAJCQkgc2l6ZSwgaW9fdGxiX25zbGFicywgdG1wX2lvX3Rs
Yl91c2VkKTsKLQlyZXR1cm4gRE1BX01BUFBJTkdfRVJST1I7CisJcmV0dXJuIChwaHlzX2FkZHJf
dClETUFfTUFQUElOR19FUlJPUjsKIGZvdW5kOgogCWlvX3RsYl91c2VkICs9IG5zbG90czsKIAlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZpb190bGJfbG9jaywgZmxhZ3MpOwpAQCAtNjY2LDcgKzY2
Niw3IEBAIGJvb2wgc3dpb3RsYl9tYXAoc3RydWN0IGRldmljZSAqZGV2LCBwaHlzX2FkZHJfdCAq
cGh5cywgZG1hX2FkZHJfdCAqZG1hX2FkZHIsCiAJLyogT2ggd2VsbCwgaGF2ZSB0byBhbGxvY2F0
ZSBhbmQgbWFwIGEgYm91bmNlIGJ1ZmZlci4gKi8KIAkqcGh5cyA9IHN3aW90bGJfdGJsX21hcF9z
aW5nbGUoZGV2LCBfX3BoeXNfdG9fZG1hKGRldiwgaW9fdGxiX3N0YXJ0KSwKIAkJCSpwaHlzLCBz
aXplLCBkaXIsIGF0dHJzKTsKLQlpZiAoKnBoeXMgPT0gRE1BX01BUFBJTkdfRVJST1IpCisJaWYg
KCpwaHlzID09IChwaHlzX2FkZHJfdClETUFfTUFQUElOR19FUlJPUikKIAkJcmV0dXJuIGZhbHNl
OwogCiAJLyogRW5zdXJlIHRoYXQgdGhlIGFkZHJlc3MgcmV0dXJuZWQgaXMgRE1BJ2JsZSAqLwot
LSAKMi4yMC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
