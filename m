Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5777CE5E67
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQOp-0005Ds-4F; Sat, 26 Oct 2019 18:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQOo-0005Df-CX
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:02:50 +0000
X-Inumbo-ID: d290e5cd-f81a-11e9-94d7-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d290e5cd-f81a-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYMnPZ5D9VTwMvNBI3kAdcKgWePOg0WTs5W1q22l8A8=;
 b=SyWJ3CJ5548fJFh7yhTJ0ano7XSWyfqMyTuqSK9W1xlpE31Wj+eTMPY4rR/WkfP3lHH/eQ
 Z1LPbYKM8YsaUksftGHyHHBEnkaB/jT0agRryalxxXAdFNxuUQZJS8Y0DO8r2nkAxvfOek
 /CvlIq3C+eruc4XAM30h2LAp7bMixVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-lY_riGLcNZ29LAoQqNPbHA-1; Sat, 26 Oct 2019 14:02:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D12DD100550E;
 Sat, 26 Oct 2019 18:02:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5606D60C57;
 Sat, 26 Oct 2019 18:02:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:27 +0200
Message-Id: <20191026180143.7369-5-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: lY_riGLcNZ29LAoQqNPbHA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 04/20] Revert "irq: introduce
 qemu_irq_proxy()"
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
Cc: Esteban Bosse <estebanbosse@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoaXMgZnVu
Y3Rpb24gaXNuJ3QgdXNlZCBhbnltb3JlLgoKVGhpcyByZXZlcnRzIGNvbW1pdCAyMmVjMzI4M2Vm
YmE5YmEwNzkyNzkwZGE3ODZkNjc3NmQ4M2YyYTkyLgoKUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogTGkgUWlhbmcgPGxpcTNlYUBnbWFpbC5j
b20+ClJldmlld2VkLWJ5OiBFc3RlYmFuIEJvc3NlIDxlc3RlYmFuYm9zc2VAZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgot
LS0KIGh3L2NvcmUvaXJxLmMgICAgfCAxNCAtLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9ody9pcnEu
aCB8ICA1IC0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2h3L2NvcmUvaXJxLmMgYi9ody9jb3JlL2lycS5jCmluZGV4IDdjYzAyOTVkMGUuLmZiMzA0
NWI5MTIgMTAwNjQ0Ci0tLSBhL2h3L2NvcmUvaXJxLmMKKysrIGIvaHcvY29yZS9pcnEuYwpAQCAt
MTIwLDIwICsxMjAsNiBAQCBxZW11X2lycSBxZW11X2lycV9zcGxpdChxZW11X2lycSBpcnExLCBx
ZW11X2lycSBpcnEyKQogICAgIHJldHVybiBxZW11X2FsbG9jYXRlX2lycShxZW11X3NwbGl0aXJx
LCBzLCAwKTsKIH0KIAotc3RhdGljIHZvaWQgcHJveHlfaXJxX2hhbmRsZXIodm9pZCAqb3BhcXVl
LCBpbnQgbiwgaW50IGxldmVsKQotewotICAgIHFlbXVfaXJxICoqdGFyZ2V0ID0gb3BhcXVlOwot
Ci0gICAgaWYgKCp0YXJnZXQpIHsKLSAgICAgICAgcWVtdV9zZXRfaXJxKCgqdGFyZ2V0KVtuXSwg
bGV2ZWwpOwotICAgIH0KLX0KLQotcWVtdV9pcnEgKnFlbXVfaXJxX3Byb3h5KHFlbXVfaXJxICoq
dGFyZ2V0LCBpbnQgbikKLXsKLSAgICByZXR1cm4gcWVtdV9hbGxvY2F0ZV9pcnFzKHByb3h5X2ly
cV9oYW5kbGVyLCB0YXJnZXQsIG4pOwotfQotCiB2b2lkIHFlbXVfaXJxX2ludGVyY2VwdF9pbihx
ZW11X2lycSAqZ3Bpb19pbiwgcWVtdV9pcnFfaGFuZGxlciBoYW5kbGVyLCBpbnQgbikKIHsKICAg
ICBpbnQgaTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaXJxLmggYi9pbmNsdWRlL2h3L2lycS5o
CmluZGV4IGZlNTI3ZjZmNTEuLjI0YmEwZWNlMTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaXJx
LmgKKysrIGIvaW5jbHVkZS9ody9pcnEuaApAQCAtNTEsMTEgKzUxLDYgQEAgcWVtdV9pcnEgcWVt
dV9pcnFfaW52ZXJ0KHFlbXVfaXJxIGlycSk7CiAgKi8KIHFlbXVfaXJxIHFlbXVfaXJxX3NwbGl0
KHFlbXVfaXJxIGlycTEsIHFlbXVfaXJxIGlycTIpOwogCi0vKiBSZXR1cm5zIGEgbmV3IElSUSBz
ZXQgd2hpY2ggY29ubmVjdHMgMToxIHRvIGFub3RoZXIgSVJRIHNldCwgd2hpY2gKLSAqIG1heSBi
ZSBzZXQgbGF0ZXIuCi0gKi8KLXFlbXVfaXJxICpxZW11X2lycV9wcm94eShxZW11X2lycSAqKnRh
cmdldCwgaW50IG4pOwotCiAvKiBGb3IgaW50ZXJuYWwgdXNlIGluIHF0ZXN0LiAgU2ltaWxhciB0
byBxZW11X2lycV9zcGxpdCwgYnV0IG9wZXJhdGluZwogICAgb24gYW4gZXhpc3RpbmcgdmVjdG9y
IG9mIHFlbXVfaXJxLiAgKi8KIHZvaWQgcWVtdV9pcnFfaW50ZXJjZXB0X2luKHFlbXVfaXJxICpn
cGlvX2luLCBxZW11X2lycV9oYW5kbGVyIGhhbmRsZXIsIGludCBuKTsKLS0gCjIuMjEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
