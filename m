Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE16E5E7D
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQRO-0006Yl-NK; Sat, 26 Oct 2019 18:05:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQRN-0006Y6-Gf
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:05:29 +0000
X-Inumbo-ID: 2e3c41aa-f81b-11e9-94d7-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2e3c41aa-f81b-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8Ov6K9gjAmVTeZvfxxVP3jRwrZORnzk/ILSZphq89g=;
 b=PwJmEDctsDpdJtc4GRteVT9CvV6qcyzmdsS2QNA2ZVpt/Uj8h8kMpQsZHXXWWuTTTV38N4
 e6oTrXnhscL4eyftUdLzebrDZukiwg9RIDnr+zrUquwx13q2uGYb/RUgiagnp7ZvqHlKhL
 ITWCyekeJ9ceGA/dgsCxGPTH0cu78WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-3CIxaGxPOjetHYqQ8eIT6A-1; Sat, 26 Oct 2019 14:05:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE5E1800E00;
 Sat, 26 Oct 2019 18:05:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C12AD60F8A;
 Sat, 26 Oct 2019 18:05:03 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:42 +0200
Message-Id: <20191026180143.7369-20-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3CIxaGxPOjetHYqQ8eIT6A-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 19/20] hw/pci-host: Rename incorrectly named
 'piix' as 'i440fx'
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
 "Michael S. Tsirkin" <mst@redhat.com>,
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCldlIG1vdmVk
IGFsbCB0aGUgUElJWDMgc291dGhicmlkZ2UgY29kZSBvdXQgb2YgaHcvcGNpLWhvc3QvcGlpeC5j
LAppdCBub3cgb25seSBjb250YWlucyBpNDQwRlggbm9ydGhicmlkZ2UgY29kZS4KUmVuYW1lIGl0
IHRvIG1hdGNoIHRoZSBjaGlwc2V0IG1vZGVsbGVkLgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIg
TWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIGh3L2kzODYvS2NvbmZpZyAgICAgICAgICAgICAgICAg
IHwgMiArLQogaHcvcGNpLWhvc3QvS2NvbmZpZyAgICAgICAgICAgICAgfCAyICstCiBody9wY2kt
aG9zdC9NYWtlZmlsZS5vYmpzICAgICAgICB8IDIgKy0KIGh3L3BjaS1ob3N0L3twaWl4LmMgPT4g
aTQ0MGZ4LmN9IHwgMAogNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCiByZW5hbWUgaHcvcGNpLWhvc3Qve3BpaXguYyA9PiBpNDQwZnguY30gKDEwMCUpCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBlN2U3YmZjODkwLi44
N2U3ZmIxYTY1IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAt
MTIyNSw3ICsxMjI1LDcgQEAgTTogTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBn
bWFpbC5jb20+CiBTOiBTdXBwb3J0ZWQKIEY6IGluY2x1ZGUvaHcvaTM4Ni8KIEY6IGh3L2kzODYv
Ci1GOiBody9wY2ktaG9zdC9waWl4LmMKK0Y6IGh3L3BjaS1ob3N0L2k0NDBmeC5jCiBGOiBody9w
Y2ktaG9zdC9xMzUuYwogRjogaHcvcGNpLWhvc3QvcGFtLmMKIEY6IGluY2x1ZGUvaHcvcGNpLWhv
c3QvaTQ0MGZ4LmgKZGlmZiAtLWdpdCBhL2h3L2kzODYvS2NvbmZpZyBiL2h3L2kzODYvS2NvbmZp
ZwppbmRleCBkNDIwYjM1NTQ4Li41YTQ5NDM0MmVhIDEwMDY0NAotLS0gYS9ody9pMzg2L0tjb25m
aWcKKysrIGIvaHcvaTM4Ni9LY29uZmlnCkBAIC02MCw3ICs2MCw3IEBAIGNvbmZpZyBJNDQwRlgK
ICAgICBzZWxlY3QgUENfUENJCiAgICAgc2VsZWN0IFBDX0FDUEkKICAgICBzZWxlY3QgQUNQSV9T
TUJVUwotICAgIHNlbGVjdCBQQ0lfUElJWAorICAgIHNlbGVjdCBQQ0lfSTQ0MEZYCiAgICAgc2Vs
ZWN0IFBJSVgzCiAgICAgc2VsZWN0IElERV9QSUlYCiAgICAgc2VsZWN0IERJTU0KZGlmZiAtLWdp
dCBhL2h3L3BjaS1ob3N0L0tjb25maWcgYi9ody9wY2ktaG9zdC9LY29uZmlnCmluZGV4IDM5NzA0
M2IyODkuLmIwYWE4MzUxYzQgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L0tjb25maWcKKysrIGIv
aHcvcGNpLWhvc3QvS2NvbmZpZwpAQCAtMjgsNyArMjgsNyBAQCBjb25maWcgUENJX1NBQlJFCiAg
ICAgc2VsZWN0IFBDSQogICAgIGJvb2wKIAotY29uZmlnIFBDSV9QSUlYCitjb25maWcgUENJX0k0
NDBGWAogICAgIGJvb2wKICAgICBzZWxlY3QgUENJCiAgICAgc2VsZWN0IFBBTQpkaWZmIC0tZ2l0
IGEvaHcvcGNpLWhvc3QvTWFrZWZpbGUub2JqcyBiL2h3L3BjaS1ob3N0L01ha2VmaWxlLm9ianMK
aW5kZXggYTljZDNlMDIyZC4uZWZkNzUyYjc2NiAxMDA2NDQKLS0tIGEvaHcvcGNpLWhvc3QvTWFr
ZWZpbGUub2JqcworKysgYi9ody9wY2ktaG9zdC9NYWtlZmlsZS5vYmpzCkBAIC0xMyw3ICsxMyw3
IEBAIGNvbW1vbi1vYmotJChDT05GSUdfVkVSU0FUSUxFX1BDSSkgKz0gdmVyc2F0aWxlLm8KIAog
Y29tbW9uLW9iai0kKENPTkZJR19QQ0lfU0FCUkUpICs9IHNhYnJlLm8KIGNvbW1vbi1vYmotJChD
T05GSUdfRlVMT05HKSArPSBib25pdG8ubwotY29tbW9uLW9iai0kKENPTkZJR19QQ0lfUElJWCkg
Kz0gcGlpeC5vCitjb21tb24tb2JqLSQoQ09ORklHX1BDSV9JNDQwRlgpICs9IGk0NDBmeC5vCiBj
b21tb24tb2JqLSQoQ09ORklHX1BDSV9FWFBSRVNTX1EzNSkgKz0gcTM1Lm8KIGNvbW1vbi1vYmot
JChDT05GSUdfUENJX0VYUFJFU1NfR0VORVJJQ19CUklER0UpICs9IGdwZXgubwogY29tbW9uLW9i
ai0kKENPTkZJR19QQ0lfRVhQUkVTU19YSUxJTlgpICs9IHhpbGlueC1wY2llLm8KZGlmZiAtLWdp
dCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBody9wY2ktaG9zdC9waWl4LmMKcmVuYW1lIHRvIGh3L3Bj
aS1ob3N0L2k0NDBmeC5jCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
