Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E0116A38
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFgn-0004Ua-Qf; Mon, 09 Dec 2019 09:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFgm-0004UC-Io
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:50:48 +0000
X-Inumbo-ID: 608c5210-1a69-11ea-87af-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 608c5210-1a69-11ea-87af-12813bfff9fa;
 Mon, 09 Dec 2019 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iD6T3th+ueTgWBqM5ey4lwC4HSji2/frVsA2WgJMg0=;
 b=I4s9Kfy6GrSZBIcNR4Q8VwQZEEu34DLpthVAIRd+AY1kDahU8PHTo2m/I5py/Ew6GwIRON
 oYw+72zq6C9OJzPy9iseMrJ9rF/3mg4Z9vHgkS76VB46cJo1Sr2Mm5sSLbnwMkYAxvjUmt
 M+RHyGZ004uc528auRXPWA59xIAm1iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-Z6Cj3bucPzC0clLYFX03TA-1; Mon, 09 Dec 2019 04:50:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 515A01005512;
 Mon,  9 Dec 2019 09:50:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBBF719C5B;
 Mon,  9 Dec 2019 09:50:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:50:00 +0100
Message-Id: <20191209095002.32194-5-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
References: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Z6Cj3bucPzC0clLYFX03TA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 4/6] hw/pci-host/i440fx: Use
 definitions instead of magic values
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

VXNlIGRlZmluaXRpb25zIGZyb20gImh3L3BjaS9wY2lfcmVncy5oIi4KVGhpcyBhbHNvIGhlbHBz
IHdoZW4gdXNpbmcgZ2l0LWdyZXAuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvcGNpLWhvc3QvaTQ0MGZ4LmMgfCAxNCAr
KysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQwZnguYyBiL2h3L3BjaS1ob3N0L2k0
NDBmeC5jCmluZGV4IDBjYzgwYjI3NmQuLjQxNDEzODU5NWIgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1o
b3N0L2k0NDBmeC5jCisrKyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCkBAIC0zNzYsMTMgKzM3Niwx
MyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAKIC8qIEhlcmUgd2UganVzdCBleHBvc2UgbWluaW1hbCBo
b3N0IGJyaWRnZSBvZmZzZXQgc3Vic2V0LiAqLwogc3RhdGljIGNvbnN0IElHREhvc3RJbmZvIGln
ZF9ob3N0X2JyaWRnZV9pbmZvc1tdID0gewotICAgIHsweDA4LCAyfSwgIC8qIHJldmlzaW9uIGlk
ICovCi0gICAgezB4MmMsIDJ9LCAgLyogc3lic3lzdGVtIHZlbmRvciBpZCAqLwotICAgIHsweDJl
LCAyfSwgIC8qIHN5YnN5c3RlbSBpZCAqLwotICAgIHsweDUwLCAyfSwgIC8qIFNOQjogcHJvY2Vz
c29yIGdyYXBoaWNzIGNvbnRyb2wgcmVnaXN0ZXIgKi8KLSAgICB7MHg1MiwgMn0sICAvKiBwcm9j
ZXNzb3IgZ3JhcGhpY3MgY29udHJvbCByZWdpc3RlciAqLwotICAgIHsweGE0LCA0fSwgIC8qIFNO
QjogZ3JhcGhpY3MgYmFzZSBvZiBzdG9sZW4gbWVtb3J5ICovCi0gICAgezB4YTgsIDR9LCAgLyog
U05COiBiYXNlIG9mIEdUVCBzdG9sZW4gbWVtb3J5ICovCisgICAge1BDSV9SRVZJU0lPTl9JRCwg
ICAgICAgICAyfSwKKyAgICB7UENJX1NVQlNZU1RFTV9WRU5ET1JfSUQsIDJ9LAorICAgIHtQQ0lf
U1VCU1lTVEVNX0lELCAgICAgICAgMn0sCisgICAgezB4NTAsICAgICAgICAgICAgICAgICAgICAy
fSwgLyogU05COiBwcm9jZXNzb3IgZ3JhcGhpY3MgY29udHJvbCByZWdpc3RlciAqLworICAgIHsw
eDUyLCAgICAgICAgICAgICAgICAgICAgMn0sIC8qIHByb2Nlc3NvciBncmFwaGljcyBjb250cm9s
IHJlZ2lzdGVyICovCisgICAgezB4YTQsICAgICAgICAgICAgICAgICAgICA0fSwgLyogU05COiBn
cmFwaGljcyBiYXNlIG9mIHN0b2xlbiBtZW1vcnkgKi8KKyAgICB7MHhhOCwgICAgICAgICAgICAg
ICAgICAgIDR9LCAvKiBTTkI6IGJhc2Ugb2YgR1RUIHN0b2xlbiBtZW1vcnkgKi8KIH07CiAKIHN0
YXRpYyB2b2lkIGhvc3RfcGNpX2NvbmZpZ19yZWFkKGludCBwb3MsIGludCBsZW4sIHVpbnQzMl90
ICp2YWwsIEVycm9yICoqZXJycCkKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
