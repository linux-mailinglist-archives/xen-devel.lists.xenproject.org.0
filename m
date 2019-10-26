Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E578FE5E6F
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQPl-0005aT-R7; Sat, 26 Oct 2019 18:03:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQPk-0005ZO-7c
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:48 +0000
X-Inumbo-ID: f2f54809-f81a-11e9-94d7-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f2f54809-f81a-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt5h0tf7aQi9H+UHQOfKlnMmiCztk0u8qFBuajQLpTc=;
 b=cmYmMxTn2sbqERY5JQgmI8OtOSdvId0X5vPppErWxs36QA5mCPy8E2jv6D7RUUsH7Mv5aS
 6wYUb0hJMSd/gOOc0KmLrHwO9QNDTlnJYTVUjMXqyzkPz5MT4g3pAWB4t4UlKIGvx64oLX
 oDbUSY1EzVnArTfh9Z3t1r79+s/hocw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-FIb2hg0IP66tzJR3pTmWow-1; Sat, 26 Oct 2019 14:03:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39BF5E6;
 Sat, 26 Oct 2019 18:03:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2451B60F82;
 Sat, 26 Oct 2019 18:03:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:32 +0200
Message-Id: <20191026180143.7369-10-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FIb2hg0IP66tzJR3pTmWow-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 09/20] hw/mips/mips_malta: Create IDE hard
 drive array dynamically
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
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

SW4gdGhlIG5leHQgY29tbWl0IHdlJ2xsIHJlZmFjdG9yIHRoZSBQSUlYNCBjb2RlIG91dCBvZgpt
aXBzX21hbHRhX2luaXQoKS4gQXMgYSBwcmVsaW1pbmFyeSBzdGVwLCBhZGQgdGhlICdpZGVfZHJp
dmVzJwp2YXJpYWJsZSBhbmQgY3JlYXRlIHRoZSBkcml2ZSBhcnJheSBkeW5hbWljYWxseS4KClJl
dmlld2VkLWJ5OiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpS
ZXZpZXdlZC1ieTogTGkgUWlhbmcgPGxpcTNlYUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9taXBzL21p
cHNfbWFsdGEuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9taXBzL21pcHNfbWFsdGEuYyBiL2h3L21p
cHMvbWlwc19tYWx0YS5jCmluZGV4IDY0NWMyMjNlZGIuLjIzOWVhOThlZjggMTAwNjQ0Ci0tLSBh
L2h3L21pcHMvbWlwc19tYWx0YS5jCisrKyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCkBAIC0xMjM1
LDcgKzEyMzUsOCBAQCB2b2lkIG1pcHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUp
CiAgICAgaW50IHBpaXg0X2RldmZuOwogICAgIEkyQ0J1cyAqc21idXM7CiAgICAgRHJpdmVJbmZv
ICpkaW5mbzsKLSAgICBEcml2ZUluZm8gKmhkW01BWF9JREVfQlVTICogTUFYX0lERV9ERVZTXTsK
KyAgICBjb25zdCBzaXplX3QgaWRlX2RyaXZlcyA9IE1BWF9JREVfQlVTICogTUFYX0lERV9ERVZT
OworICAgIERyaXZlSW5mbyAqKmhkOwogICAgIGludCBmbF9pZHggPSAwOwogICAgIGludCBiZTsK
IApAQCAtMTQwNiw3ICsxNDA3LDggQEAgdm9pZCBtaXBzX21hbHRhX2luaXQoTWFjaGluZVN0YXRl
ICptYWNoaW5lKQogICAgIHBjaV9idXMgPSBndDY0MTIwX3JlZ2lzdGVyKHMtPmk4MjU5KTsKIAog
ICAgIC8qIFNvdXRoYnJpZGdlICovCi0gICAgaWRlX2RyaXZlX2dldChoZCwgQVJSQVlfU0laRSho
ZCkpOworICAgIGhkID0gZ19uZXcoRHJpdmVJbmZvICosIGlkZV9kcml2ZXMpOworICAgIGlkZV9k
cml2ZV9nZXQoaGQsIGlkZV9kcml2ZXMpOwogCiAgICAgcGNpID0gcGNpX2NyZWF0ZV9zaW1wbGVf
bXVsdGlmdW5jdGlvbihwY2lfYnVzLCBQQ0lfREVWRk4oMTAsIDApLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgVFlQRV9QSUlYNF9QQ0lfREVWSUNFKTsK
QEAgLTE0MjEsNiArMTQyMyw3IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAq
bWFjaGluZSkKICAgICB9CiAKICAgICBwY2lfcGlpeDRfaWRlX2luaXQocGNpX2J1cywgaGQsIHBp
aXg0X2RldmZuICsgMSk7CisgICAgZ19mcmVlKGhkKTsKICAgICBwY2lfY3JlYXRlX3NpbXBsZShw
Y2lfYnVzLCBwaWl4NF9kZXZmbiArIDIsICJwaWl4NC11c2ItdWhjaSIpOwogICAgIHNtYnVzID0g
cGlpeDRfcG1faW5pdChwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDMsIDB4MTEwMCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaXNhX2dldF9pcnEoTlVMTCwgOSksIE5VTEwsIDAsIE5VTEwpOwot
LSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
