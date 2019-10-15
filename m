Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77CD7BBE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPjB-0005Ig-PI; Tue, 15 Oct 2019 16:31:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPjA-0005Ht-G2
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:31:16 +0000
X-Inumbo-ID: 327ff461-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 327ff461-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:31:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7C6780166F;
 Tue, 15 Oct 2019 16:31:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0599E19C58;
 Tue, 15 Oct 2019 16:31:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:54 +0200
Message-Id: <20191015162705.28087-22-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 15 Oct 2019 16:31:10 +0000 (UTC)
Subject: [Xen-devel] [PATCH 21/32] hw/i386/pc: Reduce gsi_handler scope
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGNfZ3NpX2NyZWF0ZSgpIGlzIHRoZSBzaW5nbGUgZnVuY3Rpb24gdGhhdCB1c2VzIGdzaV9oYW5k
bGVyLgpNYWtlIGl0IGEgc3RhdGljIHZhcmlhYmxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2kzODYvcGMuYyAgICAg
ICAgIHwgMiArLQogaW5jbHVkZS9ody9pMzg2L3BjLmggfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2kzODYvcGMu
YyBiL2h3L2kzODYvcGMuYwppbmRleCBhNzU5N2M2YzQ0Li41OWRlMGM4YTFmIDEwMDY0NAotLS0g
YS9ody9pMzg2L3BjLmMKKysrIGIvaHcvaTM4Ni9wYy5jCkBAIC0zNDYsNyArMzQ2LDcgQEAgR2xv
YmFsUHJvcGVydHkgcGNfY29tcGF0XzFfNFtdID0gewogfTsKIGNvbnN0IHNpemVfdCBwY19jb21w
YXRfMV80X2xlbiA9IEdfTl9FTEVNRU5UUyhwY19jb21wYXRfMV80KTsKIAotdm9pZCBnc2lfaGFu
ZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpCitzdGF0aWMgdm9pZCBnc2lfaGFu
ZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpCiB7CiAgICAgR1NJU3RhdGUgKnMg
PSBvcGFxdWU7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oIGIvaW5jbHVkZS9o
dy9pMzg2L3BjLmgKaW5kZXggZDBjNmI5ZDQ2OS4uNzViNDRlMTU2YyAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9ody9pMzg2L3BjLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKQEAgLTE3Miw4ICsx
NzIsNiBAQCB0eXBlZGVmIHN0cnVjdCBHU0lTdGF0ZSB7CiAgICAgcWVtdV9pcnEgaW9hcGljX2ly
cVtJT0FQSUNfTlVNX1BJTlNdOwogfSBHU0lTdGF0ZTsKIAotdm9pZCBnc2lfaGFuZGxlcih2b2lk
ICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpOwotCiBHU0lTdGF0ZSAqcGNfZ3NpX2NyZWF0ZShx
ZW11X2lycSAqKmlycXMsIGJvb2wgcGNpX2VuYWJsZWQpOwogCiAvKiB2bXBvcnQuYyAqLwotLSAK
Mi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
