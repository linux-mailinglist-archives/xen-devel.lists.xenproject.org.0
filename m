Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7AD2BD0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 15:54:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIYq6-0006Sc-9Z; Thu, 10 Oct 2019 13:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9C6H=YD=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iIYq4-0006SX-VJ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 13:50:45 +0000
X-Inumbo-ID: f41ea8ea-eb64-11e9-8aca-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f41ea8ea-eb64-11e9-8aca-bc764e2007e4;
 Thu, 10 Oct 2019 13:50:44 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u3so4441935lfl.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2019 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fhlldiEDv5prmCvD2dbgYgOko690vJc1+ajiMYBQnMQ=;
 b=awxd2k2/0rQZ4ivCWpZoa5liZGezT8qw3xODU9HZu6juFf9Cct76Dr4B8OUcb8G3DA
 GLsN83UyOL/V5rKTun0DOlC8x1UbhCmCSX66o64Qnr8bb8We/R4qb8bI3lqWT5yIgdOo
 0jW2NgRQjHmL+aySfo9owt/6o/SMFpoRFPKPPnsFDbZbRLb290nd/Rzw1ZiPBQr5Hxaw
 /Fnx2ftojsdZEjKaOj5QHjM4Y7iGEIHqJ3gL1gM99RgvJ+aDaBCGFJWIrSNMi/YJNojI
 2mm7ZvRGsH2Eno5snRp5vmowMXQCvMmfmfx/MaOh+E8Q4DHYgNO1+E21xdR1bOd2btrA
 Q06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fhlldiEDv5prmCvD2dbgYgOko690vJc1+ajiMYBQnMQ=;
 b=bZLxdyg94ZwIQ57gjDEaGPMtNY9cTse+/yYTAbCsKBLtD+2I1i8DxQLbMTKZbNtdAt
 mzXzMHKo1VbkR1tWjBpjBcWLp3xBy8ApnZz5gCnnb9fpYwPDc9M3CGfiAPsYBYwixL61
 7lcaHL7Y3aIEBurLA4HdaTzm+eluqd9hwkzFn2yv7RFY5O7o5P89eg4Km9Sfa/aO6XCQ
 FN/LCannnkAWrKUvzCK89VBElAtCggkX+bxVkJeRCJMBfZwrLUkZnDfY6/VyXcQlheVz
 GXJAyLdeTOaU5ZBBSx5T9TczI14PrVpMHmumGitxaKfwZrXAd8IFjWSrcQrPi1/5dp9j
 kSRw==
X-Gm-Message-State: APjAAAXZ3NM0LQaqeZ0grQmUel5wDzdwA4bBDb6sDWpbAhJ55s6RvkMW
 DZWrosteiwntYVt9cEjOCLK/QzyT04Y=
X-Google-Smtp-Source: APXvYqz6fUU/psEhzxVk4PbE5ZKCIj8pxv2h9k3BE84IKDd/yqiqUTV4p784K4R/+Atx9IEz/t8uqQ==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr6477624lff.32.1570715442828;
 Thu, 10 Oct 2019 06:50:42 -0700 (PDT)
Received: from al1-pc.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m18sm1265294lfb.73.2019.10.10.06.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:50:42 -0700 (PDT)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 10 Oct 2019 16:50:04 +0300
Message-Id: <20191010135004.24226-1-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v1] Reset iomem's gfn to LIBXL_INVALID_GFN on
 reboot
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
Cc: ian.jackson@eu.citrix.com, wl@xen.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKRHVyaW5nIGRvbWFpbiByZWJvb3QgaXRzIGNvbmZpZ3VyYXRpb24gaXMgcGFydGlh
bGx5IHJldXNlZAp0byByZS1jcmVhdGUgYSBuZXcgZG9tYWluLCBidXQgaW9tZW0ncyBHRk4gZmll
bGQgZm9yIHRoZQppb21lbSBpcyBvbmx5IHJlc3RvcmVkIGZvciB0aG9zZSBtZW1vcnkgcmFuZ2Vz
LCB3aGljaCBhcmUKY29uZmlndXJlZCBpbiBmb3JtIG9mIFtJT01FTV9TVEFSVCxOVU1fUEFHRVNb
QEdGTl0sIGJ1dCBub3QgZm9yCnRob3NlIGluIGZvcm0gb2YgW0lPTUVNX1NUQVJULE5VTV9QQUdF
U10sIGUuZy4gd2l0aG91dCBHRk4uCkZvciB0aGUgbGF0dGVyIEdGTiBpcyByZXNldCB0byAwLCBi
dXQgd2hpbGUgbWFwcGluZyByYW5nZXMKdG8gYSBkb21haW4gZHVyaW5nIHJlYm9vdCB0aGVyZSBp
cyBhIGNoZWNrIHRoYXQgR0ZOIHRyZWF0ZWQKYXMgdmFsaWQgaWYgaXQgaXMgbm90IGVxdWFsIHRv
IExJQlhMX0lOVkFMSURfR0ZOLCB0aHVzIG1ha2luZwpYZW4gdG8gbWFwIElPTUVNX1NUQVJUIHRv
IGFkZHJlc3MgMCBpbiB0aGUgZ3Vlc3QncyBhZGRyZXNzIHNwYWNlLgoKV29ya2Fyb3VuZCBpdCBi
eSByZXNzZXRpbmcgR0ZOIHRvIExJQlhMX0lOVkFMSURfR0ZOLCBzbyB4bApjYW4gc2V0IHByb3Bl
ciB2YWx1ZXMgZm9yIG1hcHBpbmcgb24gcmVib290LgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4IDlkMGViNWFlZDEuLjBhZTE2YTViMTIg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2RvbWFpbi5jCkBAIC0yMTIwLDYgKzIxMjAsMTUgQEAgc3RhdGljIHZvaWQgcmV0cmll
dmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fZW5kKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgfQog
ICAgIH0KIAorICAgIC8qIHJlc2V0IElPTUVNJ3MgR0ZOIHRvIGluaXRpYWwgdmFsdWUgKi8KKyAg
ICB7CisgICAgICAgIGludCBpOworCisgICAgICAgIGZvciAoaSA9IDA7IGkgPCBkX2NvbmZpZy0+
Yl9pbmZvLm51bV9pb21lbTsgaSsrKQorICAgICAgICAgICAgaWYgKGRfY29uZmlnLT5iX2luZm8u
aW9tZW1baV0uZ2ZuID09IDApCisgICAgICAgICAgICAgICAgZF9jb25maWctPmJfaW5mby5pb21l
bVtpXS5nZm4gPSBMSUJYTF9JTlZBTElEX0dGTjsKKyAgICB9CisKICAgICAvKiBEZXZpY2VzOiBk
aXNrLCBuaWMsIHZ0cG0sIHBjaWRldiBldGMuICovCiAKICAgICAvKiBUaGUgTUVSR0UgbWFjcm8g
aW1wbGVtZW50cyBmb2xsb3dpbmcgbG9naWM6Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
