Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38711E81D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:22:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnfl-00019s-Iq; Fri, 13 Dec 2019 16:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifnfk-00018j-4d
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:20:08 +0000
X-Inumbo-ID: 6d4fd5f5-1dc4-11ea-8f78-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6d4fd5f5-1dc4-11ea-8f78-12813bfff9fa;
 Fri, 13 Dec 2019 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576254007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8wBTE5cUDwAyuXnH+hRuodn6C9SR01WXRNOHU/iiao=;
 b=AFuwLkT0ZNJDIhprUk3hV1TfkoUmjtCFcuEeoNp0dCdcdFi1gvqgsh8LyCr2YXSCG/PywM
 06/0i01doxDKuOTBgPLZePM6I4oAOcU6B7rwyWVtVJM4u1Is44Mc9spgGTpGoIPLSY4rpN
 KKfW3bFc6WA2YjDcYhFp778ptkgvna4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-HUXIkw6eNy6QdyW3JyJ81A-1; Fri, 13 Dec 2019 11:20:05 -0500
X-MC-Unique: HUXIkw6eNy6QdyW3JyJ81A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13E62593A1;
 Fri, 13 Dec 2019 16:20:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E2A19C4F;
 Fri, 13 Dec 2019 16:19:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:50 +0100
Message-Id: <20191213161753.8051-10-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 09/12] hw/intc/ioapic: Make
 ioapic_print_redtbl() static
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

U2luY2UgY29tbWl0IDBjODQ2NTQ0MCB0aGUgaW9hcGljX3ByaW50X3JlZHRibCgpIGZ1bmN0aW9u
IGlzIG5vdAp1c2VkIG91dHNpZGUgb2YgaW9hcGljX2NvbW1vbi5jLCBtYWtlIGl0IHN0YXRpYywg
YW5kIHJlbW92ZSBpdHMKcHJvdG90eXBlIGRlY2xhcmF0aW9uIGluICJpb2FwaWNfaW50ZXJuYWwu
aCIuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhh
dC5jb20+Ci0tLQogaW5jbHVkZS9ody9pMzg2L2lvYXBpY19pbnRlcm5hbC5oIHwgMSAtCiBody9p
bnRjL2lvYXBpY19jb21tb24uYyAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4
Ni9pb2FwaWNfaW50ZXJuYWwuaCBiL2luY2x1ZGUvaHcvaTM4Ni9pb2FwaWNfaW50ZXJuYWwuaApp
bmRleCBkNDZjODdjNTEwLi44Yjc0M2FlZWQwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L2kzODYv
aW9hcGljX2ludGVybmFsLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L2lvYXBpY19pbnRlcm5hbC5o
CkBAIC0xMTgsNyArMTE4LDYgQEAgc3RydWN0IElPQVBJQ0NvbW1vblN0YXRlIHsKIAogdm9pZCBp
b2FwaWNfcmVzZXRfY29tbW9uKERldmljZVN0YXRlICpkZXYpOwogCi12b2lkIGlvYXBpY19wcmlu
dF9yZWR0YmwoTW9uaXRvciAqbW9uLCBJT0FQSUNDb21tb25TdGF0ZSAqcyk7CiB2b2lkIGlvYXBp
Y19zdGF0X3VwZGF0ZV9pcnEoSU9BUElDQ29tbW9uU3RhdGUgKnMsIGludCBpcnEsIGludCBsZXZl
bCk7CiAKICNlbmRpZiAvKiBRRU1VX0lPQVBJQ19JTlRFUk5BTF9IICovCmRpZmYgLS1naXQgYS9o
dy9pbnRjL2lvYXBpY19jb21tb24uYyBiL2h3L2ludGMvaW9hcGljX2NvbW1vbi5jCmluZGV4IDU1
MzhiNWI4NmUuLjcyZWE5NDUzNzcgMTAwNjQ0Ci0tLSBhL2h3L2ludGMvaW9hcGljX2NvbW1vbi5j
CisrKyBiL2h3L2ludGMvaW9hcGljX2NvbW1vbi5jCkBAIC03Niw3ICs3Niw3IEBAIHN0YXRpYyB2
b2lkIGlvYXBpY19pcnJfZHVtcChNb25pdG9yICptb24sIGNvbnN0IGNoYXIgKm5hbWUsIHVpbnQz
Ml90IGJpdG1hcCkKICAgICBtb25pdG9yX3ByaW50Zihtb24sICJcbiIpOwogfQogCi12b2lkIGlv
YXBpY19wcmludF9yZWR0YmwoTW9uaXRvciAqbW9uLCBJT0FQSUNDb21tb25TdGF0ZSAqcykKK3N0
YXRpYyB2b2lkIGlvYXBpY19wcmludF9yZWR0YmwoTW9uaXRvciAqbW9uLCBJT0FQSUNDb21tb25T
dGF0ZSAqcykKIHsKICAgICBzdGF0aWMgY29uc3QgY2hhciAqZGVsbV9zdHJbXSA9IHsKICAgICAg
ICAgImZpeGVkIiwgImxvd2VzdCIsICJTTUkiLCAiLi4uIiwgIk5NSSIsICJJTklUIiwgIi4uLiIs
ICJleHRJTlQifTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
