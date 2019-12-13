Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914811E80E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:20:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnej-0008Vw-1y; Fri, 13 Dec 2019 16:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifneh-0008VK-Fv
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:19:03 +0000
X-Inumbo-ID: 4628d3e2-1dc4-11ea-8f6f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4628d3e2-1dc4-11ea-8f6f-12813bfff9fa;
 Fri, 13 Dec 2019 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGwuqBufIRpm7r+bogG1ik6zWSyuu3LLE1OLY6amY0k=;
 b=P7MyBPgKAUZjxvHJQE396s4OjOb6JuXXiy/zJ2zlASw+Z2BKN/ulVA7Xp5utDnzAcBLuAz
 4B7GdkYi//xEf9DqTl7SmAwKt38abOYosyzmirVeV3x1rN0TnyPtw+QjSJUuvWovk6m6hY
 HwEauLQsWrJW2lFmjP9Rn21ZELGB4v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-tC9omY2INnyb3aoLSRkHSQ-1; Fri, 13 Dec 2019 11:18:59 -0500
X-MC-Unique: tC9omY2INnyb3aoLSRkHSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF5A48024CF;
 Fri, 13 Dec 2019 16:18:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62BEC19C4F;
 Fri, 13 Dec 2019 16:18:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:45 +0100
Message-Id: <20191213161753.8051-5-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 04/12] hw/i386/pc: Remove obsolete cpu_set_smm_t
 typedef
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

SW4gY29tbWl0IGY4MDljNjA1MSB3ZSByZXBsYWNlZCB0aGUgdXNlIG9mIGNwdV9zZXRfc21tX3Qg
Y2FsbGJhY2tzCmJ5IHVzaW5nIGEgTm90aWZpZXIgdG8gbW9kaWZ5IHRoZSBNZW1vcnlSZWdpb24u
IFRoaXMgcHJvdG90eXBlIGlzCm5vdyBub3QgdXNlZCBhbnltb3JlLCB3ZSBjYW4gc2FmZWx5IHJl
bW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
cmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2h3L2kzODYvcGMuaCB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oIGIv
aW5jbHVkZS9ody9pMzg2L3BjLmgKaW5kZXggYmM3ZDg1NWFhYS4uNzQzMTQxZTEwNyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9ody9pMzg2L3BjLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKQEAg
LTIxMiw4ICsyMTIsNiBAQCB2b2lkIHBjX2Ntb3NfaW5pdChQQ01hY2hpbmVTdGF0ZSAqcGNtcywK
ICAgICAgICAgICAgICAgICAgIElTQURldmljZSAqcyk7CiB2b2lkIHBjX25pY19pbml0KFBDTWFj
aGluZUNsYXNzICpwY21jLCBJU0FCdXMgKmlzYV9idXMsIFBDSUJ1cyAqcGNpX2J1cyk7CiAKLXR5
cGVkZWYgdm9pZCAoKmNwdV9zZXRfc21tX3QpKGludCBzbW0sIHZvaWQgKmFyZyk7Ci0KIHZvaWQg
cGNfaTgyNTlfY3JlYXRlKElTQUJ1cyAqaXNhX2J1cywgcWVtdV9pcnEgKmk4MjU5X2lycXMpOwog
dm9pZCBpb2FwaWNfaW5pdF9nc2koR1NJU3RhdGUgKmdzaV9zdGF0ZSwgY29uc3QgY2hhciAqcGFy
ZW50X25hbWUpOwogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
