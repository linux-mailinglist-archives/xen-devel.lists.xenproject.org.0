Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D37151C41
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 15:33:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyzDX-0003tB-Dc; Tue, 04 Feb 2020 14:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H7xx=3Y=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iyzDW-0003t5-HX
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:30:18 +0000
X-Inumbo-ID: dc607ede-475a-11ea-b211-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dc607ede-475a-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 14:30:17 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 09:30:10 -0500
Message-ID: <20200204143010.5117-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Originating-IP: [172.27.13.130]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH] Check zone before merging adjacent blocks
 in heap
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+CgpUaGUg
WGVuIGhlYXAgaXMgc3BsaXQgdXAgaW50byBub2RlcyBhbmQgem9uZXMuIEVhY2ggbm9kZSArIHpv
bmUgaXMKbWFuYWdlZCBhcyBhIHNlcGFyYXRlIHBvb2wgb2YgbWVtb3J5LgoKV2hlbiByZXR1cm5p
bmcgcGFnZXMgdG8gdGhlIGhlYXAsIGZyZWVfaGVhcF9wYWdlcyB3aWxsIGNoZWNrIGFkamFjZW50
CmJsb2NrcyB0byBzZWUgaWYgdGhleSBjYW4gYmUgY29tYmluZWQgaW50byBhIGxhcmdlciBibG9j
ay4gSG93ZXZlciwgdGhlCnpvbmUgb2YgdGhlIGFkamFjZW50IGJsb2NrIGlzIG5vdCBjaGVja2Vk
LiBUaGlzIHJlc3VsdHMgaW4gYmxvY2tzIHRoYXQKbWlncmF0ZSBmcm9tIG9uZSB6b25lIHRvIGFu
b3RoZXIuCgpXaGVuIGEgYmxvY2sgbWlncmF0ZXMgdG8gdGhlIGFkamFjZW50IHpvbmUsIHRoZSBh
dmFpbCBjb3VudGVycyBmb3IgdGhlCm9sZCBhbmQgbmV3IG5vZGUgKyB6b25lIGlzIG5vdCB1cGRh
dGVkIGFjY29yZGluZ2x5LiBUaGUgYXZhaWwgY291bnRlcgppcyB1c2VkIHdoZW4gYWxsb2NhdGlu
ZyBwYWdlcyB0byBkZXRlcm1pbmUgd2hldGhlciB0byBza2lwIG92ZXIgYSB6b25lLgpXaXRoIHRo
aXMgYmVoYXZpb3IsIGl0IGlzIHBvc3NpYmxlIGZvciBmcmVlIHBhZ2VzIHRvIGNvbGxlY3QgaW4g
YSB6b25lCndpdGggdGhlIGF2YWlsIGNvdW50ZXIgc21hbGxlciB0aGFuIHRoZSBhY3R1YWwgcGFn
ZSBjb3VudCwgcmVzdWx0aW5nCmluIGZyZWUgcGFnZXMgdGhhdCBhcmUgbm90IGFsbG9jYWJsZS4K
ClRoaXMgY29tbWl0IGFkZHMgYSBjaGVjayB0byBjb21wYXJlIHRoZSBhZGphY2VudCBibG9jaydz
IHpvbmUgd2l0aCB0aGUKY3VycmVudCB6b25lIGJlZm9yZSBtZXJnaW5nIHRoZW0uCgpTaWduZWQt
b2ZmLWJ5OiBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5lcndvcmtzLmNvbT4KLS0t
CgpTaW5jZSB0aGlzIHRvcGljIGNhbWUgdXAgYWdhaW4sIEkgZmlndXJlIGl0IG1ha2VzIHNlbnNl
IHRvIHJlc2VuZCBpdCBhcwphIHJlYWwgcGF0Y2ggdXNpbmcgZ2l0IHNlbmQtZW1haWwgcmF0aGVy
IHRoYW4gaW4gcmVwbHkgdG8gYW4gZXhpc3RpbmcKZW1haWwuCgotLS0KIHhlbi9jb21tb24vcGFn
ZV9hbGxvYy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
aW5kZXggOTc5MDJkNDJjMS4uN2QzOWRkNWJlMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTE0NjIsNiArMTQ2Miw3
IEBAIHN0YXRpYyB2b2lkIGZyZWVfaGVhcF9wYWdlcygKICAgICAgICAgICAgIGlmICggIW1mbl92
YWxpZChwYWdlX3RvX21mbihwcmVkZWNlc3NvcikpIHx8CiAgICAgICAgICAgICAgICAgICFwYWdl
X3N0YXRlX2lzKHByZWRlY2Vzc29yLCBmcmVlKSB8fAogICAgICAgICAgICAgICAgICAoUEZOX09S
REVSKHByZWRlY2Vzc29yKSAhPSBvcmRlcikgfHwKKyAgICAgICAgICAgICAgICAgKHBhZ2VfdG9f
em9uZShwZy1tYXNrKSAhPSB6b25lKSB8fAogICAgICAgICAgICAgICAgICAocGh5c190b19uaWQo
cGFnZV90b19tYWRkcihwcmVkZWNlc3NvcikpICE9IG5vZGUpICkKICAgICAgICAgICAgICAgICBi
cmVhazsKIApAQCAtMTQ4NSw2ICsxNDg2LDcgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2Vz
KAogICAgICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKHBhZ2VfdG9fbWZuKHN1Y2Nlc3NvcikpIHx8
CiAgICAgICAgICAgICAgICAgICFwYWdlX3N0YXRlX2lzKHN1Y2Nlc3NvciwgZnJlZSkgfHwKICAg
ICAgICAgICAgICAgICAgKFBGTl9PUkRFUihzdWNjZXNzb3IpICE9IG9yZGVyKSB8fAorICAgICAg
ICAgICAgICAgICAocGFnZV90b196b25lKHBnK21hc2spICE9IHpvbmUpIHx8CiAgICAgICAgICAg
ICAgICAgIChwaHlzX3RvX25pZChwYWdlX3RvX21hZGRyKHN1Y2Nlc3NvcikpICE9IG5vZGUpICkK
ICAgICAgICAgICAgICAgICBicmVhazsKIAotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
