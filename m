Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76755174000
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 19:59:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7kpM-0004FI-EK; Fri, 28 Feb 2020 18:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7kpK-0004FB-4n
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 18:57:34 +0000
X-Inumbo-ID: 2d3d8ae0-5a5c-11ea-ad76-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d3d8ae0-5a5c-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 18:57:33 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t7so4565938edr.4
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 10:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tuZlSR/xp1IKKHCxO2Uqj49/7b5x5uidvyyDYi5ECyc=;
 b=BLfhGGdMhYWDNsKnuC4Lp9Uz6kuOMMrFi9DSe9/J5a2+sXn7kJkXpE7GAt8svk/Giu
 O+hUGqbzwczENS/qZ1DEtvoW7GeIXl71zCQMK2WAGwfqxtEVQub6jYHX5grgdzBliZ5O
 PWGj4+inoLkQNrj3Vdrieb0/PLcIYnGMMzWewFEBu7P4nb5a3jr8j7kdEj9LlejcYgzq
 ox4ON2jLHxbbRYSmeihNNV4wGtNJZUbtks+Lvcgrtx/iJnN373Jrjbo5l4RhezLAlU8K
 qXGoZ9pBtiOno9T+lsVNQRMga+/XwCW+NURkPYCyQHC/fYmNi8JVzCFr+81nqnZmmzNf
 psfA==
X-Gm-Message-State: APjAAAVxUqLkr04WHZRNka2j8Zeo9n07HYI6L7zxGvq+qcB+Nxj3UJnB
 SYmruFPtQ7cIdetq7NER/ZAimru8+J4=
X-Google-Smtp-Source: APXvYqzRQrRw254A0BqXAmJSivUM4DnNhsZfemcgkEETKAjfx99eQ0BHLc4ihG+NpuQqUR8kxZ8Q7A==
X-Received: by 2002:a17:906:f0d6:: with SMTP id
 dk22mr5335991ejb.307.1582916252373; 
 Fri, 28 Feb 2020 10:57:32 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id m5sm590475ede.10.2020.02.28.10.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 10:57:31 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Feb 2020 18:57:26 +0000
Message-Id: <20200228185726.7004-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/grant-table: Remove 'led' variable in
 map_grant_ref
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
Cc: Julien Grall <jgrall@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClRoZSBuYW1lIG9mIHRoZSB2
YXJpYWJsZSAnbGVkJyBpcyBjb25mdXNpbmcgYW5kIG9ubHkgdXNlZCBpbiBvbmUgcGxhY2UgYQps
aW5lIGFmdGVyLiBTbyByZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyB8IDQgKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpp
bmRleCAwNTdjNzhmNjIwLi45ZmQ2ZTYwNDE2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC05NDQsNyArOTQ0LDYg
QEAgbWFwX2dyYW50X3JlZigKICAgICBzdHJ1Y3QgZG9tYWluICpsZCwgKnJkLCAqb3duZXIgPSBO
VUxMOwogICAgIHN0cnVjdCBncmFudF90YWJsZSAqbGd0LCAqcmd0OwogICAgIGdyYW50X3JlZl90
IHJlZjsKLSAgICBzdHJ1Y3QgdmNwdSAgICpsZWQ7CiAgICAgZ3JhbnRfaGFuZGxlX3QgaGFuZGxl
OwogICAgIG1mbl90IG1mbjsKICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZyA9IE5VTEw7CkBAIC05
NTcsOCArOTU2LDcgQEAgbWFwX2dyYW50X3JlZigKICAgICB1aW50MTZfdCAqc3RhdHVzOwogICAg
IGJvb2xfdCBuZWVkX2lvbW11OwogCi0gICAgbGVkID0gY3VycmVudDsKLSAgICBsZCA9IGxlZC0+
ZG9tYWluOworICAgIGxkID0gY3VycmVudC0+ZG9tYWluOwogCiAgICAgaWYgKCB1bmxpa2VseSgo
b3AtPmZsYWdzICYgKEdOVE1BUF9kZXZpY2VfbWFwfEdOVE1BUF9ob3N0X21hcCkpID09IDApICkK
ICAgICB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
