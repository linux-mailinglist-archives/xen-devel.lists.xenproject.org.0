Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6311E80D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:20:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifneL-0008O5-AG; Fri, 13 Dec 2019 16:18:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifneJ-0008Nl-At
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:18:39 +0000
X-Inumbo-ID: 38645108-1dc4-11ea-8f6f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38645108-1dc4-11ea-8f6f-12813bfff9fa;
 Fri, 13 Dec 2019 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz+kj9bS7gdLelr2F1XTImk+uhNKHdBToR+OTBW2CLw=;
 b=QtHBVa5gKx6TCajlX7qh5tkOnML/buIUQFyWTpiu012plxGR9T5unyFIIBboZzsVQ1jdW/
 J+daNsNB5E0XjP/E1tWWLQrMwais7YB9TBosCezz8dq3STzBm3M+a9XGXpN+DrWxaftgk2
 KCiC+dyODg8A6NkTHGhmQpNb5yWIu2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-LJRbsRb5OhS3yg3bYkLDHQ-1; Fri, 13 Dec 2019 11:18:36 -0500
X-MC-Unique: LJRbsRb5OhS3yg3bYkLDHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7D391005512;
 Fri, 13 Dec 2019 16:18:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D383D19C4F;
 Fri, 13 Dec 2019 16:18:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:43 +0100
Message-Id: <20191213161753.8051-3-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 02/12] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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

TW92ZSB0aGUgS1ZNLXJlbGF0ZWQgY2FsbCB0byAic3lzZW11L2t2bS5oIi4KClNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL2h3L2kzODYvcGMuaCB8IDEgLQogaW5jbHVkZS9zeXNlbXUva3ZtLmggfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCmluZGV4IDFmODZlYmEz
ZjkuLjk4NjZkZmJkNjAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2lu
Y2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0xMzgsNyArMTM4LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgUENN
YWNoaW5lQ2xhc3MgewogCiBleHRlcm4gRGV2aWNlU3RhdGUgKmlzYV9waWM7CiBxZW11X2lycSAq
aTgyNTlfaW5pdChJU0FCdXMgKmJ1cywgcWVtdV9pcnEgcGFyZW50X2lycSk7Ci1xZW11X2lycSAq
a3ZtX2k4MjU5X2luaXQoSVNBQnVzICpidXMpOwogaW50IHBpY19yZWFkX2lycShEZXZpY2VTdGF0
ZSAqZCk7CiBpbnQgcGljX2dldF9vdXRwdXQoRGV2aWNlU3RhdGUgKmQpOwogCmRpZmYgLS1naXQg
YS9pbmNsdWRlL3N5c2VtdS9rdm0uaCBiL2luY2x1ZGUvc3lzZW11L2t2bS5oCmluZGV4IDlmZTIz
M2I5YmYuLjBmNTc2NjdmNzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc3lzZW11L2t2bS5oCisrKyBi
L2luY2x1ZGUvc3lzZW11L2t2bS5oCkBAIC01MTgsNiArNTE4LDcgQEAgdm9pZCBrdm1faXJxY2hp
cF9zZXRfcWVtdWlycV9nc2koS1ZNU3RhdGUgKnMsIHFlbXVfaXJxIGlycSwgaW50IGdzaSk7CiB2
b2lkIGt2bV9wY19nc2lfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpOwog
dm9pZCBrdm1fcGNfc2V0dXBfaXJxX3JvdXRpbmcoYm9vbCBwY2lfZW5hYmxlZCk7CiB2b2lkIGt2
bV9pbml0X2lycV9yb3V0aW5nKEtWTVN0YXRlICpzKTsKK3FlbXVfaXJxICprdm1faTgyNTlfaW5p
dChJU0FCdXMgKmJ1cyk7CiAKIC8qKgogICoga3ZtX2FyY2hfaXJxY2hpcF9jcmVhdGU6Ci0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
