Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C998E5E78
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQQT-0005ym-Dr; Sat, 26 Oct 2019 18:04:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQQS-0005yI-3H
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:04:32 +0000
X-Inumbo-ID: 0af710bc-f81b-11e9-beca-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0af710bc-f81b-11e9-beca-bc764e2007e4;
 Sat, 26 Oct 2019 18:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/Dx+PbxKqebN9kqK3yoqBeSkpzxICQMpRExQnwgy+Q=;
 b=esoYuUUuzl4aS6rhaNwso9hAqAtgmvEW0OUYglGImXZsG7jqORua197YVvHd20GEsyJD0S
 6pwz/qFd1odNTeamZUXyakcPK322ufDrksnffkkKSH/eILhAHQd7+AWzHG10TeGOXsvgX0
 FKcdFVeOWoBeV5FhJKV5864lotA5Itk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-Tkh2DuxaOcK2hmL4G70YLw-1; Sat, 26 Oct 2019 14:04:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAEAB5E6;
 Sat, 26 Oct 2019 18:04:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3DF60C80;
 Sat, 26 Oct 2019 18:04:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:36 +0200
Message-Id: <20191026180143.7369-14-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Tkh2DuxaOcK2hmL4G70YLw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 13/20] hw/pci-host/piix: Extract
 piix3_create()
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
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

RXh0cmFjdCB0aGUgUElJWDMgY3JlYXRpb24gY29kZSBmcm9tIHRoZSBpNDQwZnhfaW5pdCgpIGZ1
bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZl
Y29tcC5jb20+ClJldmlld2VkLWJ5OiBFc3RlYmFuIEJvc3NlIDxlc3RlYmFuYm9zc2VAZ21haWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhh
dC5jb20+Ci0tLQogaHcvcGNpLWhvc3QvcGlpeC5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3
L3BjaS1ob3N0L3BpaXguYwppbmRleCAyZjRjYmNiZmU5Li4zMjkyNzAzZGU3IDEwMDY0NAotLS0g
YS9ody9wY2ktaG9zdC9waWl4LmMKKysrIGIvaHcvcGNpLWhvc3QvcGlpeC5jCkBAIC0zMzEsNiAr
MzMxLDM2IEBAIHN0YXRpYyB2b2lkIGk0NDBmeF9yZWFsaXplKFBDSURldmljZSAqZGV2LCBFcnJv
ciAqKmVycnApCiAgICAgfQogfQogCitzdGF0aWMgUElJWDNTdGF0ZSAqcGlpeDNfY3JlYXRlKFBD
SUJ1cyAqcGNpX2J1cywgSVNBQnVzICoqaXNhX2J1cykKK3sKKyAgICBQSUlYM1N0YXRlICpwaWl4
MzsKKyAgICBQQ0lEZXZpY2UgKnBjaV9kZXY7CisKKyAgICAvKgorICAgICAqIFhlbiBzdXBwb3J0
cyBhZGRpdGlvbmFsIGludGVycnVwdCByb3V0ZXMgZnJvbSB0aGUgUENJIGRldmljZXMgdG8KKyAg
ICAgKiB0aGUgSU9BUElDOiB0aGUgZm91ciBwaW5zIG9mIGVhY2ggUENJIGRldmljZSBvbiB0aGUg
YnVzIGFyZSBhbHNvCisgICAgICogY29ubmVjdGVkIHRvIHRoZSBJT0FQSUMgZGlyZWN0bHkuCisg
ICAgICogVGhlc2UgYWRkaXRpb25hbCByb3V0ZXMgY2FuIGJlIGRpc2NvdmVyZWQgdGhyb3VnaCBB
Q1BJLgorICAgICAqLworICAgIGlmICh4ZW5fZW5hYmxlZCgpKSB7CisgICAgICAgIHBjaV9kZXYg
PSBwY2lfY3JlYXRlX3NpbXBsZV9tdWx0aWZ1bmN0aW9uKHBjaV9idXMsIC0xLCB0cnVlLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBFX1BJSVgz
X1hFTl9ERVZJQ0UpOworICAgICAgICBwaWl4MyA9IFBJSVgzX1BDSV9ERVZJQ0UocGNpX2Rldik7
CisgICAgICAgIHBjaV9idXNfaXJxcyhwY2lfYnVzLCB4ZW5fcGlpeDNfc2V0X2lycSwgeGVuX3Bj
aV9zbG90X2dldF9waXJxLAorICAgICAgICAgICAgICAgICAgICAgcGlpeDMsIFhFTl9QSUlYX05V
TV9QSVJRUyk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgcGNpX2RldiA9IHBjaV9jcmVhdGVfc2lt
cGxlX211bHRpZnVuY3Rpb24ocGNpX2J1cywgLTEsIHRydWUsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVfUElJWDNfREVWSUNFKTsKKyAgICAg
ICAgcGlpeDMgPSBQSUlYM19QQ0lfREVWSUNFKHBjaV9kZXYpOworICAgICAgICBwY2lfYnVzX2ly
cXMocGNpX2J1cywgcGlpeDNfc2V0X2lycSwgcGNpX3Nsb3RfZ2V0X3BpcnEsCisgICAgICAgICAg
ICAgICAgICAgICBwaWl4MywgUElJWF9OVU1fUElSUVMpOworICAgICAgICBwY2lfYnVzX3NldF9y
b3V0ZV9pcnFfZm4ocGNpX2J1cywgcGlpeDNfcm91dGVfaW50eF9waW5fdG9faXJxKTsKKyAgICB9
CisgICAgKmlzYV9idXMgPSBJU0FfQlVTKHFkZXZfZ2V0X2NoaWxkX2J1cyhERVZJQ0UocGlpeDMp
LCAiaXNhLjAiKSk7CisKKyAgICByZXR1cm4gcGlpeDM7Cit9CisKIFBDSUJ1cyAqaTQ0MGZ4X2lu
aXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpwY2lfdHlwZSwKICAgICAgICAg
ICAgICAgICAgICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0MGZ4X3N0YXRlLAogICAgICAgICAgICAg
ICAgICAgICBpbnQgKnBpaXgzX2RldmZuLApAQCAtNDAwLDI3ICs0MzAsOCBAQCBQQ0lCdXMgKmk0
NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAqcGNpX3R5cGUsCiAg
ICAgICAgICAgICAgICAgIFBBTV9FWFBBTl9TSVpFKTsKICAgICB9CiAKLSAgICAvKiBYZW4gc3Vw
cG9ydHMgYWRkaXRpb25hbCBpbnRlcnJ1cHQgcm91dGVzIGZyb20gdGhlIFBDSSBkZXZpY2VzIHRv
Ci0gICAgICogdGhlIElPQVBJQzogdGhlIGZvdXIgcGlucyBvZiBlYWNoIFBDSSBkZXZpY2Ugb24g
dGhlIGJ1cyBhcmUgYWxzbwotICAgICAqIGNvbm5lY3RlZCB0byB0aGUgSU9BUElDIGRpcmVjdGx5
LgotICAgICAqIFRoZXNlIGFkZGl0aW9uYWwgcm91dGVzIGNhbiBiZSBkaXNjb3ZlcmVkIHRocm91
Z2ggQUNQSS4gKi8KLSAgICBpZiAoeGVuX2VuYWJsZWQoKSkgewotICAgICAgICBQQ0lEZXZpY2Ug
KnBjaV9kZXYgPSBwY2lfY3JlYXRlX3NpbXBsZV9tdWx0aWZ1bmN0aW9uKGIsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0xLCB0cnVlLCBUWVBFX1BJSVgzX1hFTl9ERVZJQ0UpOwotICAg
ICAgICBwaWl4MyA9IFBJSVgzX1BDSV9ERVZJQ0UocGNpX2Rldik7Ci0gICAgICAgIHBjaV9idXNf
aXJxcyhiLCB4ZW5fcGlpeDNfc2V0X2lycSwgeGVuX3BjaV9zbG90X2dldF9waXJxLAotICAgICAg
ICAgICAgICAgIHBpaXgzLCBYRU5fUElJWF9OVU1fUElSUVMpOwotICAgIH0gZWxzZSB7Ci0gICAg
ICAgIFBDSURldmljZSAqcGNpX2RldiA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24o
YiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLTEsIHRydWUsIFRZUEVfUElJWDNfREVW
SUNFKTsKLSAgICAgICAgcGlpeDMgPSBQSUlYM19QQ0lfREVWSUNFKHBjaV9kZXYpOwotICAgICAg
ICBwY2lfYnVzX2lycXMoYiwgcGlpeDNfc2V0X2lycSwgcGNpX3Nsb3RfZ2V0X3BpcnEsIHBpaXgz
LAotICAgICAgICAgICAgICAgIFBJSVhfTlVNX1BJUlFTKTsKLSAgICAgICAgcGNpX2J1c19zZXRf
cm91dGVfaXJxX2ZuKGIsIHBpaXgzX3JvdXRlX2ludHhfcGluX3RvX2lycSk7Ci0gICAgfQorICAg
IHBpaXgzID0gcGlpeDNfY3JlYXRlKGIsIGlzYV9idXMpOwogICAgIHBpaXgzLT5waWMgPSBwaWM7
Ci0gICAgKmlzYV9idXMgPSBJU0FfQlVTKHFkZXZfZ2V0X2NoaWxkX2J1cyhERVZJQ0UocGlpeDMp
LCAiaXNhLjAiKSk7Ci0KICAgICAqcGlpeDNfZGV2Zm4gPSBwaWl4My0+ZGV2LmRldmZuOwogCiAg
ICAgcmFtX3NpemUgPSByYW1fc2l6ZSAvIDggLyAxMDI0IC8gMTAyNDsKLS0gCjIuMjEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
