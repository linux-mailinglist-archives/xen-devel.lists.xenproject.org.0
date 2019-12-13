Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F68411E812
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:21:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifneD-0008MX-0A; Fri, 13 Dec 2019 16:18:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifneB-0008Ld-BI
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:18:31 +0000
X-Inumbo-ID: 335c7294-1dc4-11ea-8f6f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 335c7294-1dc4-11ea-8f6f-12813bfff9fa;
 Fri, 13 Dec 2019 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eictPqqvfDWdLCnWulB6nvsiJMgILd7otDTiwQaZME4=;
 b=Ka4nz00/+o+dBv3m/syJ2nygfFc9PPzGKkjtkWxYvvq/ULKBpBCyU1VATG5AqonLN9fU+h
 FJUzlNPHa9yn9YE6N2AaH92+EyLb87+0+vZeJDE+g1g6uCoV8gFo2888iWT3AkhuVq2xWn
 djFXgWTIP+L64VquZoT2uvM0pICGTJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-termAq3FMgGFGnyF0OlLXA-1; Fri, 13 Dec 2019 11:18:14 -0500
X-MC-Unique: termAq3FMgGFGnyF0OlLXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E942800D41;
 Fri, 13 Dec 2019 16:18:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F91219C4F;
 Fri, 13 Dec 2019 16:17:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:41 +0100
Message-Id: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 00/12] hw/i386/pc: Move PC-machine specific
 declarations to 'pc_internal.h'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGFvbG8sCgpTaW5jZSB5b3UgcG9zdGVkIHlvdXIgIng4NjogYWxsb3cgYnVpbGRpbmcgd2l0
aG91dCBQQyBtYWNoaW5lCnR5cGVzIiBzZXJpZXMgWzFdLCBJIGxvb2tlZCBhdCBteSBwYXN0IHdv
cmsgb24gdGhpcyB0b3BpYwoocmVzdHJpY3QgImh3L2kzODYvcGMuaCIgdG8gdGhlIFg4NiBhcmNo
aXRlY3R1cmUpLgpJJ20gZ2xhZCB0byBzZWUgaW4gWzJdIHlvdSByZW1vdmUgbW9zdCAoYWxsKSBv
ZiB0aGUgbGFzdCB1c2VzLgpTaW5jZSBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoaXMgZm9yIHNvbWUg
dGltZSwgbXkgV2lQIGJyYW5jaCB3YXMKcXVpdGUgZGl2ZXJnZWQgZnJvbSBRRU1VIG1hc3Rlci4g
SSBndWVzcyBJIGNvdWxkIHNhbHZhZ2UgbW9zdCBvZgp0aGUgZWFzeSBwYXRjaGVzLiBUaGUgcmVz
dCBpcyBRT01pZmljYXRpb24gb2YgR1NJL0lPQVBJQyB3aGljaApyZXF1aXJlIHZhcmlvdXMgY2hh
bmdlcyB3aXRoIHRoZSBpODI1OSwgc28gSSdsbCBrZWVwIHRoYXQgZm9yCmxhdGVyLgoKWzFdIGh0
dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3JnL21zZzY2NDc2
MC5odG1sClsyXSBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251
Lm9yZy9tc2c2NjQ3NjUuaHRtbAoKUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgKDEyKToKICBody9p
Mzg2L3BjOiBDb252ZXJ0IERQUklOVEYoKSB0byB0cmFjZSBldmVudHMKICBody9pMzg2L3BjOiBN
b3ZlIGt2bV9pODI1OV9pbml0KCkgZGVjbGFyYXRpb24gdG8gc3lzZW11L2t2bS5oCiAgaHcvaTM4
Ni9wYzogUmVtb3ZlIG9ic29sZXRlIHBjX3BjaV9kZXZpY2VfaW5pdCgpIGRlY2xhcmF0aW9uCiAg
aHcvaTM4Ni9wYzogUmVtb3ZlIG9ic29sZXRlIGNwdV9zZXRfc21tX3QgdHlwZWRlZgogIGh3L2kz
ODYvaWNoOTogUmVtb3ZlIHVudXNlZCBpbmNsdWRlCiAgaHcvaTM4Ni9pY2g5OiBNb3ZlIHVubmVj
ZXNzYXJ5ICJwY2lfYnJpZGdlLmgiIGluY2x1ZGUKICBody9pZGUvcGlpeDogUmVtb3ZlIHN1cGVy
Zmx1b3VzIERFVklDRSgpIGNhc3QKICBody9pZGUvcGlpeDogVXNlIEFSUkFZX1NJWkUoKSBpbnN0
ZWFkIG9mIG1hZ2ljIG51bWJlcnMKICBody9pbnRjL2lvYXBpYzogTWFrZSBpb2FwaWNfcHJpbnRf
cmVkdGJsKCkgc3RhdGljCiAgaHcvaTM4Ni9wYzogUmVuYW1lIGFsbG9jYXRlX2NwdV9pcnEgZnJv
bSAncGMnIHRvICd4ODZfbWFjaGluZScKICBody9pMzg2L3BjOiBNb3ZlIHg4Nl9tYWNoaW5lX2Fs
bG9jYXRlX2NwdV9pcnEoKSB0byAnaHcvaTM4Ni94ODYuYycKICBody9pMzg2L3BjOiBNb3ZlIFBD
LW1hY2hpbmUgc3BlY2lmaWMgZGVjbGFyYXRpb25zIHRvICdwY19pbnRlcm5hbC5oJwoKIGh3L2kz
ODYvcGNfaW50ZXJuYWwuaCAgICAgICAgICAgICB8IDE0NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIGluY2x1ZGUvaHcvaTM4Ni9pY2g5LmggICAgICAgICAgICB8ICAgMiAtCiBpbmNs
dWRlL2h3L2kzODYvaW9hcGljX2ludGVybmFsLmggfCAgIDEgLQogaW5jbHVkZS9ody9pMzg2L3Bj
LmggICAgICAgICAgICAgIHwgMTMzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVk
ZS9ody9pMzg2L3g4Ni5oICAgICAgICAgICAgIHwgICAyICsKIGluY2x1ZGUvc3lzZW11L2t2bS5o
ICAgICAgICAgICAgICB8ICAgMSArCiBody9pMzg2L2FjcGktYnVpbGQuYyAgICAgICAgICAgICAg
fCAgIDIgKwogaHcvaTM4Ni9taWNyb3ZtLmMgICAgICAgICAgICAgICAgIHwgICAyICstCiBody9p
Mzg2L3BjLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNDcgKystLS0tLS0tLQogaHcvaTM4Ni9w
Y19waWl4LmMgICAgICAgICAgICAgICAgIHwgICAxICsKIGh3L2kzODYvcGNfcTM1LmMgICAgICAg
ICAgICAgICAgICB8ICAgMSArCiBody9pMzg2L3BjX3N5c2Z3LmMgICAgICAgICAgICAgICAgfCAg
IDEgKwogaHcvaTM4Ni94ODYuYyAgICAgICAgICAgICAgICAgICAgIHwgIDMwICsrKysrKysKIGh3
L2kzODYveGVuL3hlbi1odm0uYyAgICAgICAgICAgICB8ICAgMSArCiBody9pZGUvcGlpeC5jICAg
ICAgICAgICAgICAgICAgICAgfCAgMjkgKysrLS0tCiBody9pbnRjL2lvYXBpY19jb21tb24uYyAg
ICAgICAgICAgfCAgIDIgKy0KIGh3L3BjaS1icmlkZ2UvaTgyODAxYjExLmMgICAgICAgICB8ICAg
MSArCiBody9pMzg2L3RyYWNlLWV2ZW50cyAgICAgICAgICAgICAgfCAgIDYgKysKIDE4IGZpbGVz
IGNoYW5nZWQsIDIxMSBpbnNlcnRpb25zKCspLCAxOTUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaHcvaTM4Ni9wY19pbnRlcm5hbC5oCgotLSAKMi4yMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
