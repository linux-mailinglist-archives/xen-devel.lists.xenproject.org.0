Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A570A174008
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 20:00:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7kpi-0004IR-PJ; Fri, 28 Feb 2020 18:57:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7kph-0004IB-6k
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 18:57:57 +0000
X-Inumbo-ID: 3aea4138-5a5c-11ea-9a04-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aea4138-5a5c-11ea-9a04-12813bfff9fa;
 Fri, 28 Feb 2020 18:57:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m13so4545871edb.6
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 10:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tuZlSR/xp1IKKHCxO2Uqj49/7b5x5uidvyyDYi5ECyc=;
 b=cbDXYlE7EZui0ovhuWia8wt1sjxBdw77SGA0Y8k9rybBPjAnZW5Nk1lMsdgAiAPqqj
 Z2MgUaVNG4wCjroJ4bZ1znPz5R8S2MpLoeSSRHW2AP1s8mlXxtJarIWYOOeT3oIMNEcB
 MPlwYpKCpAtoX36moGs1pe1Q1aRiPZRC+PIsAyrHHoErh4tLC1DAZnb+GVeJ9Syg2juL
 b3DXLZap17llAGwcOwVctFw7iNFyxwEXMmEMGI9XrWKDBMxag+9owPzaSGyPzQMPldBl
 3SnaV4XTCXZSTmKHKyL1ho0p4fcZeYTt4KBcH6S4Y3DZQZQOA6iJheEg4xZsTm4bAEXs
 /d0w==
X-Gm-Message-State: APjAAAVqHLGV+8HWprGITZ2YQEJJZbIrMQzYIs4gHcMMHnLJP+pPSOrc
 3hi9eM7FhN3EIABhP1JjvFXw4RSroBsu6Q==
X-Google-Smtp-Source: APXvYqxu3W54QJNy27ObEWBNu0h+5a1G1sj+b6Tq73yt8o6o98MrtoxxG6XUcJ6f2iB8frF8mvgqlQ==
X-Received: by 2002:a05:6402:311b:: with SMTP id
 dc27mr5772119edb.36.1582916275455; 
 Fri, 28 Feb 2020 10:57:55 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id u13sm442135ejz.69.2020.02.28.10.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 10:57:54 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Feb 2020 18:57:51 +0000
Message-Id: <20200228185751.7112-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
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
