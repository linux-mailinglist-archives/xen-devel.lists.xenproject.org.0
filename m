Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD516E955
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 16:05:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6bjO-00016E-Gi; Tue, 25 Feb 2020 15:02:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3lsx=4N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6bjN-000169-7g
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:02:41 +0000
X-Inumbo-ID: ddd24e06-57df-11ea-aba8-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddd24e06-57df-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 15:02:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so16579668eds.8
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 07:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yC3ES5J/2XN2w8MFSgSYO8leL9zQ8QQv+7aw2xjSeWE=;
 b=OgB006ORxZyZXK/m1S2PDeEWim5hsjZHVjtadA0kMFnhhAJgcT9UNRyZ6FDDzuwlYo
 RKamqZ7V4herJzsbOGVQ5BLK9LS9lvTZI27rcNt2qSXeKyEXpcl2AynH9DmxQKoqsJBD
 2WcKGxHwG4KbI19a4WBFASHhv3yOrqpwF1WYS9kofpWztvrsmKSxkmnFoiI7UZZE/sA5
 M5gGwrCBOoWpd0R7L8TGAb+kSl3X+K6QsEWI17dpIaQ9e3NcL05JB/4nLukf6GEJCXgM
 0TQnaEPj0zCYCLso5atuU+PcdfRcFIIZmC5Vk00oQNihu67wYdTsOJy92t2aIQSsYJE/
 5zWA==
X-Gm-Message-State: APjAAAUd7MxfCuJle7TIofR3zHKYhWd/IWLB1CXaeEHGcQLKZt0hP7O8
 gP5J7YmbOkwglVtPiKqOLmJAh57rRjWIUA==
X-Google-Smtp-Source: APXvYqzxVpMlwyHJuqlZ7MYK3K5ixJw1nN9gvl28AMgfdQdtuwSQAokPQwztvoZ+Jvh+UCooSow9fw==
X-Received: by 2002:a17:906:27cb:: with SMTP id
 k11mr53504123ejc.301.1582642959265; 
 Tue, 25 Feb 2020 07:02:39 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o88sm1159507eda.41.2020.02.25.07.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 07:02:38 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 25 Feb 2020 15:02:37 +0000
Message-Id: <20200225150237.9124-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] xen/grant-table: Remove outdated warning in
 gnttab_grow_table()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIG9mIHRoZSB3YXJuaW5nIG1lc3NhZ2UgaW4gZ250dGFiX2dyb3dfdGFibGUoKSByZWZlcnMg
dG8gYSBmdW5jdGlvbgp3YXMgcmVtb3ZlZCBpbiBjb21taXQgNjQyNWY5MWM3MiAieGVuL2dudHRh
YjogRm9sZCBncmFudF90YWJsZV97Y3JlYXRlLApzZXRfbGltaXRzfSgpIGludG8gZ3JhbnRfdGFi
bGVfaW5pdCgpIi4KClNpbmNlIHRoZSBjb21taXQsIGd0LT5hY3RpdmUgd2lsbCBiZSBhbGxvY2F0
ZWQgd2hpbGUgaW5pdGlhbGl6aW5nIHRoZQpncmFudCB0YWJsZSBhdCBkb21haW4gY3JlYXRpb24u
IFRoZXJlZm9yZSBndC1hY3RpdmUgd2lsbCBhbHdheXMgYmUKdmFsaWQuCgpSYXRoZXIgdGhhbiBy
ZXBsYWNpbmcgdGhlIHdhcm5pbmcgYnkgYW5vdGhlciBvbmUsIGRyb3AgdGhlIGNoZWNrCmNvbXBs
ZXRlbHkgYXMgd2Ugd2lsbCBsaWtlbHkgbm90IGNvbWUgYmFjayB0byBhIHNlbWktaW5pdGlhbGl6
ZWQgd29ybGQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
PgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0t
LQogICAgQ2hhbmdlcyB2MjoKICAgICAgICAtIFJlbW92ZSB0aGUgY2hlY2sgY29tcGxldGVseQog
ICAgICAgIC0gQWRkIEFuZHJldydzIGFja2VkLWJ5Ci0tLQogeGVuL2NvbW1vbi9ncmFudF90YWJs
ZS5jIHwgNiAtLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpp
bmRleCBiYzM3YWNhZTBlLi4wNTdjNzhmNjIwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC0xNzkzLDEyICsxNzkz
LDYgQEAgZ250dGFiX2dyb3dfdGFibGUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHJl
cV9ucl9mcmFtZXMpCiAgICAgc3RydWN0IGdyYW50X3RhYmxlICpndCA9IGQtPmdyYW50X3RhYmxl
OwogICAgIHVuc2lnbmVkIGludCBpLCBqOwogCi0gICAgaWYgKCB1bmxpa2VseSghZ3QtPmFjdGl2
ZSkgKQotICAgIHsKLSAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywgImdyYW50X3RhYmxl
X3NldF9saW1pdHMoKSBjYWxsIG1pc3NpbmdcbiIpOwotICAgICAgICByZXR1cm4gLUVOT0RFVjsK
LSAgICB9Ci0KICAgICBpZiAoIHJlcV9ucl9mcmFtZXMgPCBJTklUSUFMX05SX0dSQU5UX0ZSQU1F
UyApCiAgICAgICAgIHJlcV9ucl9mcmFtZXMgPSBJTklUSUFMX05SX0dSQU5UX0ZSQU1FUzsKICAg
ICBBU1NFUlQocmVxX25yX2ZyYW1lcyA8PSBndC0+bWF4X2dyYW50X2ZyYW1lcyk7Ci0tIAoyLjE3
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
