Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF511E817
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:21:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnfL-0000Hv-LK; Fri, 13 Dec 2019 16:19:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifnfJ-0000HU-LB
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:19:41 +0000
X-Inumbo-ID: 58d393c2-1dc4-11ea-b6f1-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 58d393c2-1dc4-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 16:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udh4eRVcqNXqy8xw20XMMLF1nsNWpiytALbnJZM2cT8=;
 b=i0VrH76EFbp7A8+eEe2p1qN3w04JOzZ1tr3Zd1lpzaS5Q9WEsqrct6ITEHJXGGp3vIOyiu
 WZILvRsrvwTsNNxYoj449jsYlVkBeXDaG/4kfJM+MmRol+NBcQw76elq39b72qc1+wdXIY
 QJyWd54JMpWW5/Jn54GquLtuPBPFGCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-E1z2I1SDMG2jpXGeAYNRRQ-1; Fri, 13 Dec 2019 11:19:28 -0500
X-MC-Unique: E1z2I1SDMG2jpXGeAYNRRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8601854323;
 Fri, 13 Dec 2019 16:19:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F12719C4F;
 Fri, 13 Dec 2019 16:19:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:47 +0100
Message-Id: <20191213161753.8051-7-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 06/12] hw/i386/ich9: Move unnecessary
 "pci_bridge.h" include
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

V2hpbGUgdGhlIElDSDkgY2hpcHNldCBpcyBhICdTb3V0aCBCcmlkZ2UnLCBpdCBpcyBub3QgYSBQ
Q0kgYnJpZGdlLgpOb3RoaW5nIGluICJody9pMzg2L2ljaDkuaCIgcmVxdWlyZXMgZGVmaW5pdGlv
bnMgZnJvbSAicGNpX2JyaWRnZS5oIgpzbyBtb3ZlIGl0cyBpbmNsdXNpb24gd2hlcmUgaXQgaXMg
cmVxdWlyZWQuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9ody9pMzg2L2ljaDkuaCAgICB8IDEgLQogaHcvaTM4
Ni9hY3BpLWJ1aWxkLmMgICAgICB8IDEgKwogaHcvcGNpLWJyaWRnZS9pODI4MDFiMTEuYyB8IDEg
KwogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2h3L2kzODYvaWNoOS5oIGIvaW5jbHVkZS9ody9pMzg2L2ljaDkuaApp
bmRleCBlZWI3OWFjMWZlLi4zNjliYzY0NjcxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L2kzODYv
aWNoOS5oCisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9pY2g5LmgKQEAgLTcsNyArNyw2IEBACiAjaW5j
bHVkZSAiaHcvaXNhL2FwbS5oIgogI2luY2x1ZGUgImh3L2kzODYvaW9hcGljLmgiCiAjaW5jbHVk
ZSAiaHcvcGNpL3BjaS5oIgotI2luY2x1ZGUgImh3L3BjaS9wY2lfYnJpZGdlLmgiCiAjaW5jbHVk
ZSAiaHcvYWNwaS9hY3BpLmgiCiAjaW5jbHVkZSAiaHcvYWNwaS9pY2g5LmgiCiAjaW5jbHVkZSAi
aHcvcGNpL3BjaV9idXMuaCIKZGlmZiAtLWdpdCBhL2h3L2kzODYvYWNwaS1idWlsZC5jIGIvaHcv
aTM4Ni9hY3BpLWJ1aWxkLmMKaW5kZXggMTJmZjU1ZmNmYi4uMjkxOTA5ZmEwNSAxMDA2NDQKLS0t
IGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMKKysrIGIvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMKQEAgLTI3
LDYgKzI3LDcgQEAKICNpbmNsdWRlICJxZW11L2JpdG1hcC5oIgogI2luY2x1ZGUgInFlbXUvZXJy
b3ItcmVwb3J0LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgorI2luY2x1ZGUgImh3L3BjaS9w
Y2lfYnJpZGdlLmgiCiAjaW5jbHVkZSAiaHcvY29yZS9jcHUuaCIKICNpbmNsdWRlICJ0YXJnZXQv
aTM4Ni9jcHUuaCIKICNpbmNsdWRlICJody9taXNjL3B2cGFuaWMuaCIKZGlmZiAtLWdpdCBhL2h3
L3BjaS1icmlkZ2UvaTgyODAxYjExLmMgYi9ody9wY2ktYnJpZGdlL2k4MjgwMWIxMS5jCmluZGV4
IDJiMzkwNzY1NWIuLjAzM2IzYzQzYzQgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1icmlkZ2UvaTgyODAx
YjExLmMKKysrIGIvaHcvcGNpLWJyaWRnZS9pODI4MDFiMTEuYwpAQCAtNDMsNiArNDMsNyBAQAog
CiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKKyNpbmNs
dWRlICJody9wY2kvcGNpX2JyaWRnZS5oIgogI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRlLmgi
CiAjaW5jbHVkZSAicWVtdS9tb2R1bGUuaCIKICNpbmNsdWRlICJody9pMzg2L2ljaDkuaCIKLS0g
CjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
