Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C911E81A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:22:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifng2-0001IK-3u; Fri, 13 Dec 2019 16:20:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifng0-0001Hp-OP
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:20:24 +0000
X-Inumbo-ID: 7270d36c-1dc4-11ea-a1e1-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7270d36c-1dc4-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576254015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KN6AckxlKUpsLzxakKRr0um+iuOesJrJu7GlUIEw6bQ=;
 b=MmZQ1LiHb7yd5M4X7q+qCp2C3t93mtfXDF/x8cB6eIBT8rCHDnU0/DVfK0fcYvpRW182ag
 v1quLewpJc9Ssm5HWeXXxkoa9wFe+ywXBZMj5MH2UbEHAPF7YXeWgeIlxsL4TXXTMbRa8P
 I7VEcUTf2nHYAYxMUePHNie0Ke0Gc1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-rlsJfBc9OvaPIStuNENCNA-1; Fri, 13 Dec 2019 11:20:14 -0500
X-MC-Unique: rlsJfBc9OvaPIStuNENCNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A050800EC0;
 Fri, 13 Dec 2019 16:20:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B180319C4F;
 Fri, 13 Dec 2019 16:20:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:51 +0100
Message-Id: <20191213161753.8051-11-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 10/12] hw/i386/pc: Rename allocate_cpu_irq from
 'pc' to 'x86_machine'
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

QWxsIHRoZSBYODYgbWFjaGluZXMgdXNlIGFuIGludGVycnVwdCBjb250cm9sbGVyLgpSZW5hbWUg
dGhlIGZ1bmN0aW9uIHRvIHNvbWV0aGluZyBtb3JlIGdlbmVyaWMuCgpTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9o
dy9pMzg2L3BjLmggfCAyICstCiBody9pMzg2L21pY3Jvdm0uYyAgICB8IDIgKy0KIGh3L2kzODYv
cGMuYyAgICAgICAgIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1
ZGUvaHcvaTM4Ni9wYy5oCmluZGV4IDc0MzE0MWUxMDcuLjI0NGRiZjJlYzAgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0xOTgs
NyArMTk4LDcgQEAgdm9pZCBwY19tZW1vcnlfaW5pdChQQ01hY2hpbmVTdGF0ZSAqcGNtcywKICAg
ICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICpyb21fbWVtb3J5LAogICAgICAgICAgICAg
ICAgICAgICBNZW1vcnlSZWdpb24gKipyYW1fbWVtb3J5KTsKIHVpbnQ2NF90IHBjX3BjaV9ob2xl
NjRfc3RhcnQodm9pZCk7Ci1xZW11X2lycSBwY19hbGxvY2F0ZV9jcHVfaXJxKHZvaWQpOworcWVt
dV9pcnEgeDg2X21hY2hpbmVfYWxsb2NhdGVfY3B1X2lycSh2b2lkKTsKIERldmljZVN0YXRlICpw
Y192Z2FfaW5pdChJU0FCdXMgKmlzYV9idXMsIFBDSUJ1cyAqcGNpX2J1cyk7CiB2b2lkIHBjX2Jh
c2ljX2RldmljZV9pbml0KElTQUJ1cyAqaXNhX2J1cywgcWVtdV9pcnEgKmdzaSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSVNBRGV2aWNlICoqcnRjX3N0YXRlLApkaWZmIC0tZ2l0IGEvaHcv
aTM4Ni9taWNyb3ZtLmMgYi9ody9pMzg2L21pY3Jvdm0uYwppbmRleCBkZWYzN2U2MGY3Li43YWMw
MDg0NjBhIDEwMDY0NAotLS0gYS9ody9pMzg2L21pY3Jvdm0uYworKysgYi9ody9pMzg2L21pY3Jv
dm0uYwpAQCAtMTMyLDcgKzEzMiw3IEBAIHN0YXRpYyB2b2lkIG1pY3Jvdm1fZGV2aWNlc19pbml0
KE1pY3Jvdm1NYWNoaW5lU3RhdGUgKm1tcykKICAgICBpZiAobW1zLT5waWMgPT0gT05fT0ZGX0FV
VE9fT04gfHwgbW1zLT5waWMgPT0gT05fT0ZGX0FVVE9fQVVUTykgewogICAgICAgICBxZW11X2ly
cSAqaTgyNTk7CiAKLSAgICAgICAgaTgyNTkgPSBpODI1OV9pbml0KGlzYV9idXMsIHBjX2FsbG9j
YXRlX2NwdV9pcnEoKSk7CisgICAgICAgIGk4MjU5ID0gaTgyNTlfaW5pdChpc2FfYnVzLCB4ODZf
bWFjaGluZV9hbGxvY2F0ZV9jcHVfaXJxKCkpOwogICAgICAgICBmb3IgKGkgPSAwOyBpIDwgSVNB
X05VTV9JUlFTOyBpKyspIHsKICAgICAgICAgICAgIGdzaV9zdGF0ZS0+aTgyNTlfaXJxW2ldID0g
aTgyNTlbaV07CiAgICAgICAgIH0KZGlmZiAtLWdpdCBhL2h3L2kzODYvcGMuYyBiL2h3L2kzODYv
cGMuYwppbmRleCA1ZjhlMzljMDI1Li40ZGVmZWUyNzRmIDEwMDY0NAotLS0gYS9ody9pMzg2L3Bj
LmMKKysrIGIvaHcvaTM4Ni9wYy5jCkBAIC0xMjgyLDcgKzEyODIsNyBAQCB1aW50NjRfdCBwY19w
Y2lfaG9sZTY0X3N0YXJ0KHZvaWQpCiAgICAgcmV0dXJuIFJPVU5EX1VQKGhvbGU2NF9zdGFydCwg
MSAqIEdpQik7CiB9CiAKLXFlbXVfaXJxIHBjX2FsbG9jYXRlX2NwdV9pcnEodm9pZCkKK3FlbXVf
aXJxIHg4Nl9tYWNoaW5lX2FsbG9jYXRlX2NwdV9pcnEodm9pZCkKIHsKICAgICByZXR1cm4gcWVt
dV9hbGxvY2F0ZV9pcnEocGljX2lycV9yZXF1ZXN0LCBOVUxMLCAwKTsKIH0KQEAgLTE0NjMsNyAr
MTQ2Myw3IEBAIHZvaWQgcGNfaTgyNTlfY3JlYXRlKElTQUJ1cyAqaXNhX2J1cywgcWVtdV9pcnEg
Kmk4MjU5X2lycXMpCiAgICAgfSBlbHNlIGlmICh4ZW5fZW5hYmxlZCgpKSB7CiAgICAgICAgIGk4
MjU5ID0geGVuX2ludGVycnVwdF9jb250cm9sbGVyX2luaXQoKTsKICAgICB9IGVsc2UgewotICAg
ICAgICBpODI1OSA9IGk4MjU5X2luaXQoaXNhX2J1cywgcGNfYWxsb2NhdGVfY3B1X2lycSgpKTsK
KyAgICAgICAgaTgyNTkgPSBpODI1OV9pbml0KGlzYV9idXMsIHg4Nl9tYWNoaW5lX2FsbG9jYXRl
X2NwdV9pcnEoKSk7CiAgICAgfQogCiAgICAgZm9yIChzaXplX3QgaSA9IDA7IGkgPCBJU0FfTlVN
X0lSUVM7IGkrKykgewotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
