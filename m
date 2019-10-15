Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B237D7BAC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:32:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPhl-0003pZ-QQ; Tue, 15 Oct 2019 16:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPhl-0003p2-2S
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:49 +0000
X-Inumbo-ID: 012eb1f8-ef69-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 012eb1f8-ef69-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 16:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E85F880167A;
 Tue, 15 Oct 2019 16:29:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C046B19C58;
 Tue, 15 Oct 2019 16:29:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:46 +0200
Message-Id: <20191015162705.28087-14-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 15 Oct 2019 16:29:48 +0000 (UTC)
Subject: [Xen-devel] [PATCH 13/32] piix4: convert reset function to QOM
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKQWNrZWQtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBIZXJ2w6kgUG91c3NpbmVh
dSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDE4MDEwNjE1MzczMC4zMDMx
My0xNS1ocG91c3NpbkByZWFjdG9zLm9yZz4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2lzYS9waWl4NC5jIHwgOCArKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9ody9pc2EvcGlpeDQuYyBiL2h3L2lzYS9waWl4NC5jCmluZGV4IGMzYTJiZDBk
NzAuLjg5OThiMGNhNDcgMTAwNjQ0Ci0tLSBhL2h3L2lzYS9waWl4NC5jCisrKyBiL2h3L2lzYS9w
aWl4NC5jCkBAIC00OCwxMCArNDgsMTAgQEAgdHlwZWRlZiBzdHJ1Y3QgUElJWDRTdGF0ZSB7CiAj
ZGVmaW5lIFBJSVg0X1BDSV9ERVZJQ0Uob2JqKSBcCiAgICAgT0JKRUNUX0NIRUNLKFBJSVg0U3Rh
dGUsIChvYmopLCBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UpCiAKLXN0YXRpYyB2b2lkIHBpaXg0X3Jl
c2V0KHZvaWQgKm9wYXF1ZSkKK3N0YXRpYyB2b2lkIHBpaXg0X3Jlc2V0KERldmljZVN0YXRlICpk
ZXYpCiB7Ci0gICAgUElJWDRTdGF0ZSAqZCA9IG9wYXF1ZTsKLSAgICB1aW50OF90ICpwY2lfY29u
ZiA9IGQtPmRldi5jb25maWc7CisgICAgUElJWDRTdGF0ZSAqcyA9IFBJSVg0X1BDSV9ERVZJQ0Uo
ZGV2KTsKKyAgICB1aW50OF90ICpwY2lfY29uZiA9IHMtPmRldi5jb25maWc7CiAKICAgICBwY2lf
Y29uZlsweDA0XSA9IDB4MDc7IC8vIG1hc3RlciwgbWVtb3J5IGFuZCBJL08KICAgICBwY2lfY29u
ZlsweDA1XSA9IDB4MDA7CkBAIC0xNjUsNyArMTY1LDYgQEAgc3RhdGljIHZvaWQgcGlpeDRfcmVh
bGl6ZShQQ0lEZXZpY2UgKnBjaV9kZXYsIEVycm9yICoqZXJycCkKICAgICBpc2FfYnVzX2lycXMo
aXNhX2J1cywgcy0+aXNhKTsKIAogICAgIHBpaXg0X2RldiA9IHBjaV9kZXY7Ci0gICAgcWVtdV9y
ZWdpc3Rlcl9yZXNldChwaWl4NF9yZXNldCwgcyk7CiB9CiAKIHN0YXRpYyB2b2lkIHBpaXg0X2Ns
YXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQpAQCAtMTc3LDYgKzE3Niw3
IEBAIHN0YXRpYyB2b2lkIHBpaXg0X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lk
ICpkYXRhKQogICAgIGstPnZlbmRvcl9pZCA9IFBDSV9WRU5ET1JfSURfSU5URUw7CiAgICAgay0+
ZGV2aWNlX2lkID0gUENJX0RFVklDRV9JRF9JTlRFTF84MjM3MUFCXzA7CiAgICAgay0+Y2xhc3Nf
aWQgPSBQQ0lfQ0xBU1NfQlJJREdFX0lTQTsKKyAgICBkYy0+cmVzZXQgPSBwaWl4NF9yZXNldDsK
ICAgICBkYy0+ZGVzYyA9ICJJU0EgYnJpZGdlIjsKICAgICBkYy0+dm1zZCA9ICZ2bXN0YXRlX3Bp
aXg0OwogICAgIC8qCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
