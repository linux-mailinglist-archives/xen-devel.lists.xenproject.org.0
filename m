Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E918116A2E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:52:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFgN-0004NI-KJ; Mon, 09 Dec 2019 09:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFgL-0004NC-ES
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:50:21 +0000
X-Inumbo-ID: 5021bf78-1a69-11ea-b6f1-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5021bf78-1a69-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0kZGDM6Dv+xPJxfZvPzJi9z3blegCflTkzGW0b89qeI=;
 b=V9UgRcDyhp05XXKVK/GETpURZR2gY3oAVT+DTRYHanGLI1S27kWeFSlTuQFkhOm28jIz2q
 ut84J8rbYDZJ3bAVfv2XLkLQhVTxJOs+KhXY+KJlsA1O+KbpVUUW17oGgBAiHMbK7kVddh
 KR1bC4UpOgP490IUP5UXSxrMorTy2ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-P2eqbdoEPUqFaRectyj5cw-1; Mon, 09 Dec 2019 04:50:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 522401005512;
 Mon,  9 Dec 2019 09:50:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF9B52FD;
 Mon,  9 Dec 2019 09:50:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:49:56 +0100
Message-Id: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: P2eqbdoEPUqFaRectyj5cw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 0/6] hw/pci-host: Add Kconfig
 selector for IGD PCIe pass-through
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEga2NvbmZpZyBzZWxlY3RvciB0byBhbGxvdyBidWlsZHMgd2l0aG91dCBJbnRl
bApJbnRlZ3JhdGVkIEdyYXBoaWNzIERldmljZSBHUFUgUENJZSBwYXNzdGhyb3VnaC4KClRoaXMg
ZGV2aWNlIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiB0aGUgWGVuIGJ1aWxkLgoKdjM6Ci0gTWFr
ZSBpdCBYZW4gc3BlY2lmaWMKCnYyOgotIGRvIG5vdCBtaXggd2l0aCB2ZmlvIGNvZGUgKEFsZXgp
Ci0gZXh0cmFjdCB0byBkaWZmZXJlbnQgZmlsZSB0byBhdm9pZCAjaWZkZWYgKFRob21hcykKClBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpICg2KToKICBody9wY2ktaG9zdC9pNDQwZng6IENvcnJlY3Qg
dGhlIGhlYWRlciBkZXNjcmlwdGlvbgogIGh3L3BjaS1ob3N0L2k0NDBmeDogRXh0cmFjdCBQQ0lJ
NDQwRlhTdGF0ZSB0byAiaHcvcGNpLWhvc3QvaTQ0MGZ4LmgiCiAgaHcvcGNpLWhvc3QvaTQ0MGZ4
OiBVc2Ugc2l6ZV90IHRvIGl0ZXJhdGUgb3ZlciBBUlJBWV9TSVpFKCkKICBody9wY2ktaG9zdC9p
NDQwZng6IFVzZSBkZWZpbml0aW9ucyBpbnN0ZWFkIG9mIG1hZ2ljIHZhbHVlcwogIGh3L3BjaS1o
b3N0L2k0NDBmeDogRXh0cmFjdCB0aGUgSUdEIHBhc3N0aHJvdWdoIGhvc3QgYnJpZGdlIGRldmlj
ZQogIGh3L3BjaS1ob3N0OiBBZGQgS2NvbmZpZyBlbnRyeSB0byBzZWxlY3QgdGhlIElHRCBQYXNz
dGhyb3VnaCBIb3N0CiAgICBCcmlkZ2UKCiBpbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oIHwg
IDE5ICsrKysrLQogaHcvcGNpLWhvc3QvaTQ0MGZ4LmMgICAgICAgICB8IDEwNSArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIGh3L3BjaS1ob3N0L3hlbl9pZ2RfcHQuYyAgICAgfCAxMjAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgfCAgIDEgKwogaHcvcGNpLWhvc3QvS2NvbmZpZyAgICAgICAgICB8ICAgNSArKwog
aHcvcGNpLWhvc3QvTWFrZWZpbGUub2JqcyAgICB8ICAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDE0
NSBpbnNlcnRpb25zKCspLCAxMDYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcv
cGNpLWhvc3QveGVuX2lnZF9wdC5jCgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
