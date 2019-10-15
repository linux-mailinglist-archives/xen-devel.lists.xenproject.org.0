Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CAD7FDE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 21:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKSIv-0003k7-8G; Tue, 15 Oct 2019 19:16:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKSIt-0003k2-5K
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 19:16:19 +0000
X-Inumbo-ID: 41ddcc86-ef80-11e9-a531-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 41ddcc86-ef80-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 19:16:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD29E28;
 Tue, 15 Oct 2019 12:16:14 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D289B3F718;
 Tue, 15 Oct 2019 12:16:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 15 Oct 2019 20:16:10 +0100
Message-Id: <20191015191610.28680-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 v3] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: jgross@suse.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb25zIG9mIHhlbl97bWFwLCB1bm1hcH1fdGFibGUoKSBl
eHBlY3QKe21hcCwgdW5tYXB9X2RvbWFpbl9wYWdlKCkgdG8gYmUgdXNhYmxlLiBUaG9zZSBoZWxw
ZXJzIGFyZSB1c2VkIHRvCm1hcC91bm1hcCBwYWdlIHRhYmxlcyB3aGlsZSB1cGRhdGUgWGVuIHBh
Z2UtdGFibGVzLgoKU2luY2UgY29tbWl0IDAyMjM4N2VlMWEgInhlbi9hcm06IG1tOiBEb24ndCBv
cGVuLWNvZGUgWGVuIFBUIHVwZGF0ZSBpbgp7c2V0LCBjbGVhcn1fZml4bWFwKCkiLCBzZXR1cF9m
aXhtYXAoKSB3aWxsIG1ha2UgdXNlIG9mIHRoZSBoZWxwZXJzCm1lbnRpb25lZCBhYm92ZS4gV2hl
biBib290aW5nIFhlbiB1c2luZyBHUlVCLCBzZXR1cF9maXhtYXAoKSBtYXkgYmUgdXNlZApiZWZv
cmUgbWFwX2RvbWFpbl9wYWdlKCkgY2FuIGJlIGNhbGxlZC4gVGhpcyB3aWxsIHJlc3VsdCB0byBk
YXRhIGFib3J0OgoKKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDUKKFhFTikgQ1BV
MDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0CgpbLi4uXQoKKFhFTikgWGVuIGNhbGwgdHJh
Y2U6CihYRU4pICAgIFs8MDAwMDAwMDAwMDI1YWI2Yz5dIG1tLmMjeGVuX3B0X3VwZGF0ZSsweDJi
NC8weDU5YyAoUEMpCihYRU4pICAgIFs8MDAwMDAwMDAwMDI1YWIyMD5dIG1tLmMjeGVuX3B0X3Vw
ZGF0ZSsweDI2OC8weDU5YyAoTFIpCihYRU4pICAgIFs8MDAwMDAwMDAwMDI1YWU3MD5dIHNldF9m
aXhtYXArMHgxYy8weDJjCihYRU4pICAgIFs8MDAwMDAwMDAwMDJhOWM5OD5dIGNvcHlfZnJvbV9w
YWRkcisweDdjLzB4ZGMKKFhFTikgICAgWzwwMDAwMDAwMDAwMmE0YWUwPl0gaGFzX3hzbV9tYWdp
YysweDE4LzB4MzQKKFhFTikgICAgWzwwMDAwMDAwMDAwMmE1YjVjPl0gYm9vdGZkdC5jI2Vhcmx5
X3NjYW5fbm9kZSsweDM5OC8weDU2MAooWEVOKSAgICBbPDAwMDAwMDAwMDAyYTVkZTA+XSBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKzB4YmMvMHgxNDQKKFhFTikgICAgWzwwMDAwMDAwMDAwMmE1
ZWQ0Pl0gYm9vdF9mZHRfaW5mbysweDZjLzB4MjYwCihYRU4pICAgIFs8MDAwMDAwMDAwMDJhYzBk
MD5dIHN0YXJ0X3hlbisweDEwOC8weGM3NAooWEVOKSAgICBbPDAwMDAwMDAwMDAyMDA0NGM+XSBh
cm02NC9oZWFkLm8jcGFnaW5nKzB4NjAvMHg4OAoKRHVyaW5nIGVhcmx5IGJvb3QsIHRoZSBwYWdl
IHRhYmxlcyBhcmUgZWl0aGVyIHN0YXRpY2FsbHkgYWxsb2NhdGVkIGluClhlbiBiaW5hcnkgb3Ig
YWxsb2NhdGVkIHZpYSBhbGxvY19ib290X3BhZ2VzKCkuCgpGb3Igc3RhdGljYWxseSBhbGxvY2F0
ZWQgcGFnZS10YWJsZXMsIHRoZXkgd2lsbCBhbHJlYWR5IGJlIG1hcHBlZCBhcwpwYXJ0IG9mIFhl
biBiaW5hcnkuIFNvIHdlIGNhbiBlYXNpbHkgZmluZCB0aGUgdmlydHVhbCBhZGRyZXNzLgoKRm9y
IGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwYWdlLXRhYmxlcywgd2UgbmVlZCB0byByZWx5Cm1hcF9k
b21haW5fcGFnZSgpIHRvIGJlIGZ1bmN0aW9uYWxseSB3b3JraW5nLgoKRm9yIGFybTMyLCB0aGUg
Y2FsbCB3aWxsIGJlIHVzYWJsZSBtdWNoIGJlZm9yZSBwYWdlIGNhbiBiZSBkeW5hbWljYWxseQph
bGxvY2F0ZWQgKHNlZSBzZXR1cF9wYWdldGFibGVzKCkpLiBGb3IgYXJtNjQsIHRoZSBjYWxsIHdp
bGwgYmUgdXNhYmxlCmFmdGVyIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKS4KCkluIGJvdGggY2Fz
ZXMsIG1lbW9yeSBhcmUgZ2l2ZW4gdG8gdGhlIGJvb3QgYWxsb2NhdG9yIGFmdGVyd2FyZHMuIFNv
IHdlCmNhbiByZWx5IG9uIG1hcF9kb21haW5fcGFnZSgpIGZvciBtYXBwaW5nIHBhZ2UgdGFibGVz
IGFsbG9jYXRlZApkeW5hbWljYWxseS4KClRoZSBoZWxwZXJzIHhlbl97bWFwLCB1bm1hcH1fdGFi
bGUoKSBhcmUgbm93IHVwZGF0ZWQgdG8gdGFrZSBpbnRvCmFjY291bnQgdGhlIGNhc2Ugd2hlcmUg
cGFnZS10YWJsZXMgYXJlIHBhcnQgb2YgWGVuIGJpbmFyeS4KCkZpeGVzOiAwMjIzODdlZTFhICgn
eGVuL2FybTogbW06IERvbid0IG9wZW4tY29kZSBYZW4gUFQgdXBkYXRlIGluIHtzZXQsIGNsZWFy
fV9maXhtYXAoKScpClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+ClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
Ci0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIFVzZSBpc194ZW5fZml4ZWRfbWZuCiAg
ICAgICAgLSBBZGQgYSBjb21tZW50IGFib3V0IGRlbW90aW5nIHRoZSB0eXBlLgoKICAgIENoYW5n
ZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgUmFCIEp1ZXJnZW4KICAgICAgICAtIFJld29yayB0aGUg
Y2hlY2sgdG8gYXZvaWQgdHJ1bmNhdGlvbgoKICAgIE5vdGUgdGhpcyBwYXRjaCByZWxpZXMgb24g
aXNfeGVuX2ZpeGVkX21mbiB0byBiZSBjb3JyZWN0IChzZWUgWzFdKS4KCiAgICBbMV0gaHR0cHM6
Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDExMzgu
aHRtbAotLS0KIHhlbi9hcmNoL2FybS9tbS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggYmUyM2FjZmUyNi4uNDUx
NGJjNmJiMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJt
L21tLmMKQEAgLTk2NCwxMSArOTY0LDQxIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShs
cGFlX3QgKmVudHJ5KQogCiBzdGF0aWMgbHBhZV90ICp4ZW5fbWFwX3RhYmxlKG1mbl90IG1mbikK
IHsKKyAgICAvKgorICAgICAqIFdlIG1heSByZXF1aXJlIHRvIG1hcCB0aGUgcGFnZSB0YWJsZSBi
ZWZvcmUgbWFwX2RvbWFpbl9wYWdlKCkgaXMKKyAgICAgKiB1c2VhYmxlLiBUaGUgcmVxdWlyZW1l
bnRzIGhlcmUgaXMgaXQgbXVzdCBiZSB1c2VhYmxlIGFzIHNvb24gYXMKKyAgICAgKiBwYWdlLXRh
YmxlcyBhcmUgYWxsb2NhdGVkIGR5bmFtaWNhbGx5IHZpYSBhbGxvY19ib290X3BhZ2VzKCkuCisg
ICAgICoKKyAgICAgKiBXZSBuZWVkIHRvIGRvIHRoZSBjaGVjayBvbiBwaHlzaWNhbCBhZGRyZXNz
IHJhdGhlciB0aGFuIHZpcnR1YWwKKyAgICAgKiBhZGRyZXNzIHRvIGF2b2lkIHRydW5jYXRpb24g
b24gQXJtMzIuIFRoZXJlZm9yZSBpc19rZXJuZWwoKSBjYW5ub3QKKyAgICAgKiBiZSB1c2VkLgor
ICAgICAqLworICAgIGlmICggc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290ICkK
KyAgICB7CisgICAgICAgIGlmICggaXNfeGVuX2ZpeGVkX21mbihtZm4pICkKKyAgICAgICAgewor
ICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIEl0IGlzIGZpbmUgdG8gZGVtb3RlIHRoZSB0
eXBlIGJlY2F1c2UgdGhlIHNpemUgb2YgWGVuCisgICAgICAgICAgICAgKiB3aWxsIGFsd2F5cyBm
aXQgaW4gdmFkZHJfdC4KKyAgICAgICAgICAgICAqLworICAgICAgICAgICAgdmFkZHJfdCBvZmZz
ZXQgPSBtZm5fdG9fbWFkZHIobWZuKSAtIHZpcnRfdG9fbWFkZHIoJl9zdGFydCk7CisKKyAgICAg
ICAgICAgIHJldHVybiAobHBhZV90ICopKFhFTl9WSVJUX1NUQVJUICsgb2Zmc2V0KTsKKyAgICAg
ICAgfQorICAgIH0KKwogICAgIHJldHVybiBtYXBfZG9tYWluX3BhZ2UobWZuKTsKIH0KIAogc3Rh
dGljIHZvaWQgeGVuX3VubWFwX3RhYmxlKGNvbnN0IGxwYWVfdCAqdGFibGUpCiB7CisgICAgLyoK
KyAgICAgKiBEdXJpbmcgZWFybHkgYm9vdCwgeGVuX21hcF90YWJsZSgpIHdpbGwgbm90IHVzZSBt
YXBfZG9tYWluX3BhZ2UoKQorICAgICAqIGZvciBwYWdlLXRhYmxlcyByZXNpZGluZyBpbiBYZW4g
YmluYXJ5LiBTbyBza2lwIHRoZSB1bm1hcCBwYXJ0LgorICAgICAqLworICAgIGlmICggc3lzdGVt
X3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290ICYmIGlzX2tlcm5lbCh0YWJsZSkgKQorICAg
ICAgICByZXR1cm47CisKICAgICB1bm1hcF9kb21haW5fcGFnZSh0YWJsZSk7CiB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
