Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F41517F7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:36:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyubF-0001G2-H1; Tue, 04 Feb 2020 09:34:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyubD-0001FT-Ew
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:27 +0000
X-Inumbo-ID: 84294602-4731-11ea-b211-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84294602-4731-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 09:34:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so2621436wmi.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 01:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1W1vGXWZttL4CQFkiARWP8FetNVIdUlgyXT4wYgM7O4=;
 b=h3MtVWX8eyjPMEyDggxtaS+5Vbjb7+kIXBCIJ7twyroAKmIeLepTQbFMR3KFADTpxQ
 uKw3DnWzoc6/yv126WAyc4oKwmO2VoeyUnN3SsuoiGwE3u5hsMMqW9sZPXryVyHXQrVO
 bdSg6vLZS2u+9Zht2AoF11PUrt0I2kBgec+MseLJlNWZKmFbe0g6X16Zprk4bvEQBbsK
 7agjub9N77Si4bm1TRD1ZwvtTA48njIQsAQo+50KVkCmJTEf9K1EKggIAjs+w1i01Cqi
 a7R5uAZ5YBTGVRzLACudJzboDSpOBAKHQYHnN2iUob1wua4c58jCr0krummstZEhFIa6
 +Z9w==
X-Gm-Message-State: APjAAAXkqrYpuPG1hpMxpk+dR5DYGFeLavfuoy+Z6m/I9PaF97wcjaT7
 sI6LU6dH739WTa5s7jikuQb9XKFDuPw=
X-Google-Smtp-Source: APXvYqyJy0IZHkWqP239Oy9X2QYGVsa0oLlEzLPgYqQwqsC71RyLKRn4Uyig9J0/B2njsw3SFLhB9w==
X-Received: by 2002:a1c:16:: with SMTP id 22mr4723202wma.8.1580808857966;
 Tue, 04 Feb 2020 01:34:17 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p11sm16923031wrn.40.2020.02.04.01.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 01:34:17 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  4 Feb 2020 09:34:11 +0000
Message-Id: <20200204093411.15887-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204093411.15887-1-julien@xen.org>
References: <20200204093411.15887-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClVubGlrZSBzaGFkb3dfZW5h
YmxlKCksIGhhcF9lbmFibGUoKSBjYW4gb25seSBiZSBjYWxsZWQgb25jZSBkdXJpbmcKZG9tYWlu
IGNyZWF0aW9uIGFuZCB3aXRoIHRoZSBtb2RlIGVxdWFsIHRvIG1vZGUgZXF1YWwgdG8KUEdfZXh0
ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMuCgpJZiBpdCB3ZXJlIGNhbGxlZCB0
d2ljZSwgdGhlbiB3ZSBtaWdodCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGluZwpwcm9ibGVtIGFz
IHRoZSBwMm0gdGFibGVzIHdvdWxkIGJlIHJlLWFsbG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwg
dGhlCm1hcHBpbmdzIHdvdWxkIGJlIGxvc3QpLgoKQWRkIGNvZGUgdG8gc2FuaXR5IGNoZWNrIHRo
ZSBtb2RlIGFuZCB0aGF0IHRoZSBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZApvbmNlLiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSB0byBhbiBpZiBjaGVja2luZyB0aGF0IFBHX3RyYW5zbGF0ZSBpcyBzZXQu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tCgpJ
dCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2hlbiBQR190cmFuc2xhdGUgd2FzIGVuZm9yY2VkLgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5j
CmluZGV4IDMxMzYyYTMxYjYuLmI3MzRlMmU2ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9oYXAvaGFwLmMKKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwpAQCAtNDQ1LDYgKzQ0
NSwxMyBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKICAgICB1
bnNpZ25lZCBpbnQgaTsKICAgICBpbnQgcnYgPSAwOwogCisgICAgaWYgKCBtb2RlICE9IChQR19l
eHRlcm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cykgKQorICAgICAgICByZXR1cm4g
LUVJTlZBTDsKKworICAgIC8qIFRoZSBmdW5jdGlvbiBjYW4gb25seSBiZSBjYWxsZWQgb25jZSAq
LworICAgIGlmICggZC0+YXJjaC5wYWdpbmcubW9kZSAhPSAwICkKKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CisKICAgICBkb21haW5fcGF1c2UoZCk7CiAKICAgICBvbGRfcGFnZXMgPSBkLT5hcmNo
LnBhZ2luZy5oYXAudG90YWxfcGFnZXM7CkBAIC00NjUsMTMgKzQ3MiwxMCBAQCBpbnQgaGFwX2Vu
YWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKICAgICBkLT5hcmNoLnBhZ2luZy5hbGxv
Y19wYWdlID0gaGFwX2FsbG9jX3AybV9wYWdlOwogICAgIGQtPmFyY2gucGFnaW5nLmZyZWVfcGFn
ZSA9IGhhcF9mcmVlX3AybV9wYWdlOwogCi0gICAgLyogYWxsb2NhdGUgUDJtIHRhYmxlICovCi0g
ICAgaWYgKCBtb2RlICYgUEdfdHJhbnNsYXRlICkKLSAgICB7Ci0gICAgICAgIHJ2ID0gcDJtX2Fs
bG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7Ci0gICAgICAgIGlmICggcnYgIT0gMCApCi0g
ICAgICAgICAgICBnb3RvIG91dDsKLSAgICB9CisgICAgLyogYWxsb2NhdGUgUDJNIHRhYmxlICov
CisgICAgcnYgPSBwMm1fYWxsb2NfdGFibGUocDJtX2dldF9ob3N0cDJtKGQpKTsKKyAgICBpZiAo
IHJ2ICE9IDAgKQorICAgICAgICBnb3RvIG91dDsKIAogICAgIGZvciAoIGkgPSAwOyBpIDwgTUFY
X05FU1RFRFAyTTsgaSsrICkKICAgICB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
