Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9C763B4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxbg-0006Xn-Ic; Fri, 26 Jul 2019 10:37:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqxbe-0006Xb-Bg
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:37:46 +0000
X-Inumbo-ID: 66ca4a4e-af91-11e9-8980-bc764e045a96
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 66ca4a4e-af91-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:37:45 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id k18so50991116ljc.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2Y7uepLcrO+C0MZ/uOVGDbGteSAo8Cp1hAfmCMuspB0=;
 b=CTeMMh+5+2f3/W96UP76n8EFlpY2HVx8W57hgK2z/VlMCux5soHj7NpuAV+XEZG7Mu
 1AfDAvM5DOi8kXQjzQULpGNZl0AjECo+h+fEk3/TOwiWYT5Bgs8Y/OCy50bHSJ9ZhYwL
 0cQvaWgBNGpv9s4DHCiruaUZe3+2h+cZQ7yHEjOHl4gcq9eIRdS5OoMyDHZHjYYU0oTk
 hbt/S3H+s094Ti45Kb+Qaxv94KD7f5uEIyvvedPg1gNM09FFmsfkx1VDULWZ3YaLiOgr
 gjQhKp90QWO4Xkf8m7QZiZPeIt9JIXQA+cufoU9WUAp8q5S5njZ4uxS5pUPC8NG8YSYh
 +tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2Y7uepLcrO+C0MZ/uOVGDbGteSAo8Cp1hAfmCMuspB0=;
 b=dJiBsRo2dk0xZIIWu4Rh59zLMicXeTSLEz9oyTrYsKXAHipbQwnpMXuuLVFvbvGWjD
 rR84sa4BI9Np26Wygv1Fmgwmpk+1ppxBjYXqGLy6aoTJVFZBmqhmiqX/ItwkujAbiIaT
 1Yu67JWqQHHNp3lPuQPWvSOnNbnAefDYuBxFvG5sAIkJlfAGbQcTzMkWo5ggOHVrXPm2
 V/dcO9jldhdlO+6Vy+frmmh+LOpxxQ+2uCePBRHxRCvAbXDQQxYCP3pFWrPM7NhEnUcm
 bkdZthnS3r1BLsXkMSjBiyqz53df55egdbNBUoGtE26tSmB/g1OfPvRwzbWJ1JKI5lHx
 LV3w==
X-Gm-Message-State: APjAAAXEC8jyc285Iufaqhx8ZVogDOZ39Yv8PCpoNIoAxtzUU7GcqCS0
 eUKpvz0hibgmvbvbfAClMgfxxEM9
X-Google-Smtp-Source: APXvYqwEhkIAoXg9XYOMLJnhCBTqqlunGjZoY4XoDA2ps1F0hsa3YUIHSeFbzfLID3T7MaBpYchWfw==
X-Received: by 2002:a05:651c:87:: with SMTP id
 7mr40516917ljq.184.1564137463132; 
 Fri, 26 Jul 2019 03:37:43 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m4sm9938274ljc.56.2019.07.26.03.37.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 03:37:42 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 13:37:33 +0300
Message-Id: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
Cc: Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgaXMgdGhl
IHZlcnkgUkZDIHNlcmllcywgd2hpY2ggaXMgYWltZWQgdG8gYWRkcmVzcyBzb21lIG9mIFZDUFUg
dGltZQphY2NvdW50aW5nIHByb2JsZW1zIHdoaWNoIGFmZmVjdCBzY2hlZHVsaW5nIGZhaXJuZXNz
IGFuZCBhY2N1cmFjeS4gUGxlYXNlCm5vdGUgdGhhdCB0aGlzIGlzIGRvbmUgZm9yIEFSTTY0IHll
dC4KCk9uZSBvZiB0aGUgc2NoZWR1bGluZyBwcm9ibGVtcyBpcyBhIG1pc2xlYWRpbmcgQ1BVIGlk
bGUgdGltZSBjb25jZXB0LiBOb3cKZm9yIHRoZSBDUFUgaWRsZSB0aW1lLCBpdCBpcyB0YWtlbiBh
biBpZGxlIHZjcHUgcnVuIHRpbWUuIEJ1dCBpZGxlIHZjcHUgcnVuCnRpbWUgaW5jbHVkZXMgSVJR
IHByb2Nlc3NpbmcsIHNvZnRpcnFzIHByb2Nlc3NpbmcsIHRhc2tsZXRzIHByb2Nlc3NpbmcsIGV0
Yy4KVGhvc2UgdGFza3MgYXJlIG5vdCBhY3R1YWwgaWRsZSBhbmQgdGhleSBhY2NvdW50aW5nIG1h
eSBtaXNsZWFkIENQVSBmcmVxCmdvdmVybm9ycyB3aG8gcmVseSBvbiB0aGUgQ1BVIGlkbGUgdGlt
ZS4gSW4gdGhpcyBzZXJpZXMsIGl0IGlzIHN1Z2dlc3RlZCB0bwp0YWtlIHRoZSB0aW1lIG9mIHRo
ZSBhY3R1YWwgQ1BVIGxvdyBwb3dlciBtb2RlIGFzIHRoZSBpZGxlIHRpbWUuIAoKVGhlIG90aGVy
IHByb2JsZW0gaXMgdGhhdCBwdXJlIGh5cGVydmlzb3IgdGFza3MgZXhlY3V0aW9uIHRpbWUgaXMg
Y2hhcmdlZCBmcm9tCnRoZSBndWVzdCB2Y3B1IGJ1ZGdldC4gRm9yIGV4YW1wbGUsIElSUSBhbmQg
c29mdGlycSBwcm9jZXNzaW5nIHRpbWUgYXJlIGNoYXJnZWQKZnJvbSB0aGUgY3VycmVudCB2Y3B1
IGJ1ZGdldCwgd2hpY2ggaXMgbGlrZWx5IHRoZSBndWVzdCB2Y3B1LiBUaGlzIGlzIHF1aXRlCnVu
ZmFpciBhbmQgbWF5IGJyZWFrIHNjaGVkdWxpbmcgcmVsaWFiaWxpdHkuIEl0IGlzIHByb3Bvc2Vk
IHRvIGNoYXJnZSBndWVzdAp2Y3B1cyBmb3IgdGhlIGd1ZXN0IGFjdHVhbCBydW4gdGltZSBhbmQg
dGltZSB0byBzZXJ2ZSBndWVzdCdzIGh5cGVyY2FsbHMgYW5kCmFjY2VzcyB0byBlbXVsYXRlZCBp
b21lbS4gQWxsIHRoZSByZXN0IGlzIGNhbGN1bGF0ZWQgYXMgdGhlIGh5cGVydmlzb3IgcnVuIHRp
bWUKKElSUSBhbmQgc29mdGlycSBwcm9jZXNzaW5nLCBicmFuY2ggcHJlZGljdGlvbiBoYXJkZW5p
bmcsIGV0Yy4pCgpXaGlsZSB0aGUgc2VyaWVzIGlzIHRoZSBlYXJseSBSRkMsIHNldmVyYWwgcG9p
bnRzIGFyZSBzdGlsbCB1bnRvdWNoZWQ6CiAtIE5vdyB0aGUgdGltZSBlbGFwc2VkIGZyb20gdGhl
IGxhc3QgcmVzY2hlZHVsaW5nIGlzIG5vdCBmdWxseSBjaGFyZ2VkIGZyb20KICAgdGhlIGN1cnJl
bnQgdmNwdSBidWRnZXQuIEFyZSB0aGVyZSBhbnkgY2hhbmdlcyBuZWVkZWQgaW4gdGhlIGV4aXN0
aW5nCiAgIHNjaGVkdWxpbmcgYWxnb3JpdGhtcz8KIC0gSG93IHRvIGF2b2lkIHRoZSBhYnNvbHV0
ZSB0b3AgcHJpb3JpdHkgb2YgdGFza2xldHMgKHdoYXQgaXMgb2JleWVkIGJ5IGFsbAogICBzY2hl
ZHVsZXJzIHNvIGZhcikuIFNob3VsZCBpZGxlIHZjcHUgYmUgc2NoZWR1bGVkIGFzIHRoZSBub3Jt
YWwgZ3Vlc3QgdmNwdXMKICAgKHRocm91Z2ggcXVldWVzLCBwcmlvcml0aWVzLCBldGMpPwogLSBJ
ZGxlIHZjcHUgbmFtaW5nIGlzIHF1aXRlIG1pc2xlYWRpbmcuIEl0IGlzIGEga2luZCBvZiBzeXN0
ZW0gKGh5cGVydmlzb3IpCiAgIHRhc2sgd2hpY2ggaXMgcmVzcG9uc2libGUgZm9yIHNvbWUgaHlw
ZXJ2aXNvciB3b3JrLiBTaG91bGQgaXQgYmUKICAgcmVuYW1lZC9yZWNvbnNpZGVyZWQ/CgpBbmRy
aWkgQW5pc292ICg1KToKICBzY2hlZHVsZTogYWNjb3VudCB0cnVlIHN5c3RlbSBpZGxlIHRpbWUK
ICBzeXNjdGw6IGV4dGVuZCBYRU5fU1lTQ1RMX2dldGNwdWluZm8gaW50ZXJmYWNlCiAgeGVudG9w
OiBzaG93IENQVSBsb2FkIGluZm9ybWF0aW9uCiAgYXJtNjQ6IGNhbGwgZW50ZXJfaHlwZXJ2aXNv
cl9oZWFkIG9ubHkgd2hlbiBpdCBpcyBuZWVkZWQKICBzY2hlZHVsZTogYWNjb3VudCBhbGwgdGhl
IGh5cGVydmlzb3IgdGltZSB0byB0aGUgaWRsZSB2Y3B1CgpKdWxpZW4gR3JhbGwgKDEpOgogIHhl
bi9hcm06IFJlLWVuYWJsZSBpbnRlcnJ1cHQgbGF0ZXIgaW4gdGhlIHRyYXAgcGF0aAoKIHRvb2xz
L3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jICAgICAgfCAgMzggKysrKysrKysrCiB0
b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvc3JjL3hlbnN0YXQuaCAgICAgIHwgICA5ICsrCiB0b29s
cy94ZW5zdGF0L2xpYnhlbnN0YXQvc3JjL3hlbnN0YXRfcHJpdi5oIHwgICAzICsKIHRvb2xzL3hl
bnN0YXQveGVudG9wL3hlbnRvcC5jICAgICAgICAgICAgICAgfCAgMzAgKysrKysrKwogeGVuL2Fy
Y2gvYXJtL2FybTY0L2VudHJ5LlMgICAgICAgICAgICAgICAgICB8ICAxNyArKy0tCiB4ZW4vYXJj
aC9hcm0vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrKysrKwogeGVuL2Fy
Y2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEyOCArKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICAgICAgICAgICAgICAg
ICAgIHwgICAyICstCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyAgICAgICAgICAgICAgICAg
IHwgICA0ICstCiB4ZW4vY29tbW9uL3NjaGVkX3J0LmMgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDk4
ICsrKysrKysrKysrKysrKysrKy0tLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICAg
ICAgICAgIHwgICAyICsKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgICAg
ICAgfCAgIDcgKysKIDE0IGZpbGVzIGNoYW5nZWQsIDMwMyBpbnNlcnRpb25zKCspLCA2MyBkZWxl
dGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
