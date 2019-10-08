Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75445CFD98
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 17:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHrMX-0004Xq-IJ; Tue, 08 Oct 2019 15:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iHrMW-0004Xl-FS
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 15:25:20 +0000
X-Inumbo-ID: d5db8ab4-e9df-11e9-80e3-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5db8ab4-e9df-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 15:25:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so18012041ljg.8
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EgoNg0rDOVixSSUIvs0Qc5Y5gj5bOjJ9IcQIEZ8RSH8=;
 b=n9ppuvVY66KrySNNu4z/SzcCGiPTwE68rOY6dVseTYQ8dxZBD+Sf3LZOrZ52c5VT9C
 b8trwmQ3DuN3pR2jGT2u4x5M4OKgjjGBiuU2yw5bvVxpbpn/iuyLiUcysO7lsFfkVhws
 t2yTRTWh/6XSDeXbc4fHYan5p8y6EDHNwvUQkZX1QcAbYlHv4YPNo4NpkHa9kJ5jFk7d
 JvGX6q5tK7472RK7HVnDj2EKM0aD03r/bzfabRQh8N7L/Sh68hPNfzqgupQduZRlSfDx
 kVUtnPnWmn+4IM7MBhsy8LU1WkADzVAMPckkTsRqPqM6J7j4tgM2WHw6deed8V4/fx9o
 gwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EgoNg0rDOVixSSUIvs0Qc5Y5gj5bOjJ9IcQIEZ8RSH8=;
 b=VGstADtnVfkSRJLEIXcPGt/X9IsEt8CUkQelYDAonUCUlaeoB3p4aLAtQaONEh+X21
 FcpWJwKzQexhb/5FVtyBOhDz64DT5oImQmHnWY9Mv3wpQlbl5KXBoZldY1feO6KSEPkb
 bKMm06o3FCwj6JUyzLNesuUJyFHojiWN4aP4FiNj97NXBDgba1oljwcuaSRKOJpSX2zb
 zJm8XR473vOdgPmBx8Vvd64d1EGWtAxMkLysMZyGb1tOfcXYbkNVjR1l7aMh4yPN9glf
 nG4wbqem2NQooDLScBN7M/MORoQjNtA5N9RasGn4zrnZzG71YGFeMl1411+PqPduxAUy
 S7NA==
X-Gm-Message-State: APjAAAWGqyinZ+BtukU5FQV4r7jNJLxENJGDW13N2exn0M5HBzOEplDD
 ezERDvmA4/qDm1ZR2w8vbr7SskYI/uM=
X-Google-Smtp-Source: APXvYqxyVHXj3s5+PiKOIzrsYZDM3xI5TztxGfLhNlj0LJd9Co9B/cCOGDYhRfKNb4R+YJPGzjy0wQ==
X-Received: by 2002:a2e:3808:: with SMTP id f8mr22500837lja.7.1570548317959;
 Tue, 08 Oct 2019 08:25:17 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h12sm3984783ljg.24.2019.10.08.08.25.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Oct 2019 08:25:17 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  8 Oct 2019 18:25:04 +0300
Message-Id: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH for-4.13 v2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to hwdom
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKV2UgZG9uJ3QgcGFzc3Rocm91Z2ggSU9NTVUgZGV2aWNlIHRvIGh3ZG9tIGV2ZW4gaWYgaXQg
aXMgbm90IHVzZWQgYnkgWGVuLgpUaGVyZWZvcmUgZXhwb3NpbmcgdGhlIHByb3BlcnRpZXMgdGhh
dCBkZXNjcmliZSByZWxhdGlvbnNoaXAgYmV0d2VlbgptYXN0ZXIgZGV2aWNlcyBhbmQgSU9NTVVz
IGRvZXMgbm90IG1ha2UgYW55IHNlbnNlLgoKQWNjb3JkaW5nIHRvIHRoZToKMS4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2lvbW11LnR4dAoyLiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3BjaS1pb21tdS50eHQKClNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KCi0tLQpD
aGFuZ2VzIFYxIFsxXSAtPiBWMjoKICAgLSBPbmx5IHNraXAgSU9NTVUgc3BlY2lmaWMgcHJvcGVy
dGllcyBvZiB0aGUgbWFzdGVyIGRldmljZSBpZiB3ZQogICAgIHNraXAgdGhlIGNvcnJlc3BvbmRp
bmcgSU9NTVUgZGV2aWNlCiAgIC0gVXNlICJod2RvbSIgb3ZlciAiRG9tMCIKClsxXSBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNn
MDAxMDQuaHRtbAotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwppbmRleCA2ZDZkZDUyLi5hNzMyMWI4IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBA
IC00ODAsMTAgKzQ4MCwyNiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCiAgICAgY29uc3Qgc3Ry
dWN0IGR0X3Byb3BlcnR5ICpwcm9wLCAqc3RhdHVzID0gTlVMTDsKICAgICBpbnQgcmVzID0gMDsK
ICAgICBpbnQgaGFkX2RvbTBfYm9vdGFyZ3MgPSAwOworICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqaW9tbXVfbm9kZTsKIAogICAgIGlmICgga2luZm8tPmNtZGxpbmUgJiYga2luZm8tPmNtZGxp
bmVbMF0gKQogICAgICAgICBib290YXJncyA9ICZraW5mby0+Y21kbGluZVswXTsKIAorICAgIC8q
CisgICAgICogSWYgd2Ugc2tpcCB0aGUgSU9NTVUgZGV2aWNlIHdoZW4gY3JlYXRpbmcgRFQgZm9y
IGh3ZG9tIChldmVuIGlmCisgICAgICogdGhlIElPTU1VIGRldmljZSBpcyBub3QgdXNlZCBieSBY
ZW4pLCB3ZSBzaG91bGQgYWxzbyBza2lwIHRoZSBJT01NVQorICAgICAqIHNwZWNpZmljIHByb3Bl
cnRpZXMgb2YgdGhlIG1hc3RlciBkZXZpY2UgYmVoaW5kIGl0IGluIG9yZGVyIHRvIGF2b2lkCisg
ICAgICogZXhwb3NpbmcgYW4gaGFsZiBjb21wbGV0ZSBJT01NVSBiaW5kaW5ncyB0byBod2RvbS4K
KyAgICAgKiBVc2UgImlvbW11X25vZGUiIGFzIGFuIGluZGljYXRvciBvZiB0aGUgbWFzdGVyIGRl
dmljZSB3aGljaCBwcm9wZXJ0aWVzCisgICAgICogc2hvdWxkIGJlIHNraXBwZWQuCisgICAgICov
CisgICAgaW9tbXVfbm9kZSA9IGR0X3BhcnNlX3BoYW5kbGUobm9kZSwgImlvbW11cyIsIDApOwor
ICAgIGlmICggaW9tbXVfbm9kZSApCisgICAgeworICAgICAgICBpZiAoIGRldmljZV9nZXRfY2xh
c3MoaW9tbXVfbm9kZSkgIT0gREVWSUNFX0lPTU1VICkKKyAgICAgICAgICAgIGlvbW11X25vZGUg
PSBOVUxMOworICAgIH0KKwogICAgIGR0X2Zvcl9lYWNoX3Byb3BlcnR5X25vZGUgKG5vZGUsIHBy
b3ApCiAgICAgewogICAgICAgICBjb25zdCB2b2lkICpwcm9wX2RhdGEgPSBwcm9wLT52YWx1ZTsK
QEAgLTU0MCw2ICs1NTYsMTkgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAogICAgICAgICAgICAg
Y29udGludWU7CiAgICAgICAgIH0KIAorICAgICAgICBpZiAoIGlvbW11X25vZGUgKQorICAgICAg
ICB7CisgICAgICAgICAgICAvKiBEb24ndCBleHBvc2UgSU9NTVUgc3BlY2lmaWMgcHJvcGVydGll
cyB0byBod2RvbSAqLworICAgICAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFs
KHByb3AsICJpb21tdXMiKSApCisgICAgICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAg
ICAgIGlmICggZHRfcHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwIikgKQor
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOworCisgICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5
X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1hcC1tYXNrIikgKQorICAgICAgICAgICAgICAg
IGNvbnRpbnVlOworICAgICAgICB9CisKICAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZv
LT5mZHQsIHByb3AtPm5hbWUsIHByb3BfZGF0YSwgcHJvcF9sZW4pOwogCiAgICAgICAgIGlmICgg
cmVzICkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
