Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530A68847
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 13:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmzIk-00073b-1w; Mon, 15 Jul 2019 11:37:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hmzIi-00073N-Gt
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 11:37:48 +0000
X-Inumbo-ID: f6dc27ba-a6f4-11e9-8305-37d5649e60b9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6dc27ba-a6f4-11e9-8305-37d5649e60b9;
 Mon, 15 Jul 2019 11:37:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 996C8ADBF;
 Mon, 15 Jul 2019 11:37:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Mon, 15 Jul 2019 13:37:37 +0200
Message-Id: <20190715113739.17694-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Alok Kataria <akataria@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvbmcgdGVybSBwbGFuIGhhcyBiZWVuIHRvIHJlcGxhY2UgWGVuIFBWIGd1ZXN0cyBieSBQ
VkguIFRoZSBmaXJzdAp2aWN0aW0gb2YgdGhhdCBwbGFuIGFyZSBub3cgMzItYml0IFBWIGd1ZXN0
cywgYXMgdGhvc2UgYXJlIHVzZWQgb25seQpyYXRoZXIgc2VsZG9tIHRoZXNlIGRheXMuIFhlbiBv
biB4ODYgcmVxdWlyZXMgNjQtYml0IHN1cHBvcnQgYW5kIHdpdGgKR3J1YjIgbm93IHN1cHBvcnRp
bmcgUFZIIG9mZmljaWFsbHkgc2luY2UgdmVyc2lvbiAyLjA0IHRoZXJlIGlzIG5vCm5lZWQgdG8g
a2VlcCAzMi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBhbGl2ZSBpbiB0aGUgTGludXgga2VybmVsLgpB
ZGRpdGlvbmFsbHkgTWVsdGRvd24gbWl0aWdhdGlvbiBpcyBub3QgYXZhaWxhYmxlIGluIHRoZSBr
ZXJuZWwgcnVubmluZwphcyAzMi1iaXQgUFYgZ3Vlc3QsIHNvIGRyb3BwaW5nIHRoaXMgbW9kZSBt
YWtlcyBzZW5zZSBmcm9tIHNlY3VyaXR5CnBvaW50IG9mIHZpZXcsIHRvby4KCkp1ZXJnZW4gR3Jv
c3MgKDIpOgogIHg4Ni94ZW46IHJlbW92ZSAzMi1iaXQgWGVuIFBWIGd1ZXN0IHN1cHBvcnQKICB4
ODYvcGFyYXZpcnQ6IHJlbW92ZSAzMi1iaXQgc3VwcG9ydCBmcm9tIFBBUkFWSVJUX1hYTAoKIGFy
Y2gveDg2L2VudHJ5L2VudHJ5XzMyLlMgICAgICAgICAgICAgICAgICAgfCAgOTMgLS0tLS0tLS0K
IGFyY2gveDg2L2VudHJ5L3Zkc28vdmRzbzMyL3ZjbG9ja19nZXR0aW1lLmMgfCAgIDEgKwogYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCAgICAgICAgICAgICB8IDEwNSArLS0tLS0tLS0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggICAgICAgfCAgMjAgLS0KIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUtM2xldmVsX3R5cGVzLmggfCAgIDUgLQogYXJjaC94
ODYvaW5jbHVkZS9hc20vcHJvdG8uaCAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC94ODYv
aW5jbHVkZS9hc20vc2VnbWVudC5oICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC94ODYvaW5j
bHVkZS9hc20vdHJhcHMuaCAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC94ODYva2VybmVs
L2NwdS9jb21tb24uYyAgICAgICAgICAgICAgICB8ICAgOCAtCiBhcmNoL3g4Ni9rZXJuZWwvcGFy
YXZpcnQuYyAgICAgICAgICAgICAgICAgIHwgIDE3IC0tCiBhcmNoL3g4Ni9rZXJuZWwvcGFyYXZp
cnRfcGF0Y2hfMzIuYyAgICAgICAgIHwgIDM2ICstLQogYXJjaC94ODYveGVuL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogYXJjaC94ODYveGVuL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQogYXJjaC94ODYveGVuL2FwaWMuYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNyAtLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jICAgICAg
ICAgICAgICAgICB8ICA0NSArLS0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgMzI2ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gveDg2L3hl
bi9wMm0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgLQogYXJjaC94ODYveGVuL3Nl
dHVwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0NCArLS0tCiBhcmNoL3g4Ni94ZW4vc21w
X3B2LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICstCiBhcmNoL3g4Ni94ZW4veGVuLWFz
bS5TICAgICAgICAgICAgICAgICAgICAgIHwgIDE0IC0tCiBhcmNoL3g4Ni94ZW4veGVuLWFzbV8z
Mi5TICAgICAgICAgICAgICAgICAgIHwgMjA3IC0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC94ODYv
eGVuL3hlbi1oZWFkLlMgICAgICAgICAgICAgICAgICAgICB8ICAgNiAtCiBhcmNoL3g4Ni94ZW4v
eGVuLW9wcy5oICAgICAgICAgICAgICAgICAgICAgIHwgICA1IC0KIGRyaXZlcnMveGVuL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIDI0IGZpbGVzIGNoYW5nZWQsIDU3
IGluc2VydGlvbnMoKyksIDkzMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L3g4Ni94ZW4veGVuLWFzbV8zMi5TCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
