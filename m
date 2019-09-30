Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1146C2619
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:47:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF0ex-0002Qa-7G; Mon, 30 Sep 2019 18:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/AJ=XZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iF0ev-0002QV-Ke
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:44:33 +0000
X-Inumbo-ID: 568c7f6c-e3b2-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 568c7f6c-e3b2-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 18:44:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733971597;
 Mon, 30 Sep 2019 11:44:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B7EF3F534;
 Mon, 30 Sep 2019 11:44:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 19:44:25 +0100
Message-Id: <20190930184425.13756-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm32: head: Fix build when using
 GAS 2.25.0
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R0FTIDIuMjUuMCB0aHJvd3MgbXVsdGlwbGUgZXJyb3JzIHdoZW4gYnVpbGRpbmcgYXJtMzIvaGVh
ZC5TOgoKYXJtMzIvaGVhZC5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6CmFybTMyL2hlYWQuUzo0NTI6
IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCmFybTMyL2hlYWQuUzo0
NTM6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCmFybTMyL2hlYWQu
Uzo0OTU6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCmFybTMyL2hl
YWQuUzo1MTA6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCmFybTMy
L2hlYWQuUzo1MTQ6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCmFy
bTMyL2hlYWQuUzo1MTY6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVw
CmFybTMyL2hlYWQuUzo2MzM6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZp
eHVwCgpUaGlzIG1ha2VzIHNlbnNlIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIG1vdiBpcyBvbmx5
IGFibGUgdG8gZGVhbCB3aXRoIGEKc3BlY2lmaWMgc2V0IG9mIGltbWVkaWF0ZSAoc2VlICJtb2Rp
ZmllZCBpbW1lZGlhdGUgY29uc3RhbnRzIGluIEFSTQppbnN0cnVjdGlvbnMiKS4gRm9yIGFueSAx
Ni1iaXQgaW1tZWRpYXRlLCB0aGUgaW5zdHJ1Y3Rpb24gbW92dyBzaG91bGQgYmUKdXNlZC4KCkl0
IGxvb2tzIGxpa2UgbmV3ZXIgdmVyc2lvbiBvZiBHQVMgd2lsbCBzZWVtbHkgc3dpdGNoIHRvIG1v
dncgaWYgdGhlCmltbWVkaWF0ZSBkb2VzIG5vdCBmaXQgaW4gdGhlIGltbWVkaWF0ZSBlbmNvZGlu
ZyBmb3IgbW92LiBCdXQgd2Ugc2hvdWxkCm5vdCByZWx5IG9uIHRoaXMuIFNvIHN3aXRjaCB0byBt
b3Z3LgoKRml4ZXM6IDIzZGZlNDhkMTAgKCJ4ZW4vYXJtMzI6IGhlYWQ6IEludHJvZHVjZSBtYWNy
b3MgdG8gY3JlYXRlIHRhYmxlIGFuZCBtYXBwaW5nIGVudHJ5IikKUmVwb3J0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gv
YXJtL2FybTMyL2hlYWQuUwppbmRleCAyZmMzMTJmOWUwLi5lOWQzNTZmMDVjIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKQEAgLTM4Myw3ICszODMsNyBAQCBFTkRQUk9DKGNwdV9pbml0KQogICAgICAgICBsZHIgICBy
NCwgPVx0YmwKICAgICAgICAgYWRkICAgcjQsIHI0LCByMTAgICAgICAgICAgICAvKiByNCA6PSBw
YWRkcihcdGxiKSAqLwogCi0gICAgICAgIG1vdiAgIHIyLCAjUFRfUFQgICAgICAgICAgICAgLyog
cjI6cjMgOj0gcmlnaHQgZm9yIGxpbmVhciBQVCAqLworICAgICAgICBtb3Z3ICByMiwgI1BUX1BU
ICAgICAgICAgICAgIC8qIHIyOnIzIDo9IHJpZ2h0IGZvciBsaW5lYXIgUFQgKi8KICAgICAgICAg
b3JyICAgcjIsIHIyLCByNCAgICAgICAgICAgICAvKiAgICAgICAgICAgKyBcdGxiIHBhZGRyICov
CiAgICAgICAgIG1vdiAgIHIzLCAjMAogCkBAIC00MTksNyArNDE5LDcgQEAgRU5EUFJPQyhjcHVf
aW5pdCkKICAgICAgICAgbHNyICAgcjQsIFxwaHlzLCAjVEhJUkRfU0hJRlQKICAgICAgICAgbHNs
ICAgcjQsIHI0LCAjVEhJUkRfU0hJRlQgICAvKiByNCA6PSBQQUdFX0FMSUdORUQocGh5cykgKi8K
IAotICAgICAgICBtb3YgICByMiwgI1x0eXBlICAgICAgICAgICAgIC8qIHIyOnIzIDo9IHJpZ2h0
IGZvciBzZWN0aW9uIFBUICovCisgICAgICAgIG1vdncgIHIyLCAjXHR5cGUgICAgICAgICAgICAg
LyogcjI6cjMgOj0gcmlnaHQgZm9yIHNlY3Rpb24gUFQgKi8KICAgICAgICAgb3JyICAgcjIsIHIy
LCByNCAgICAgICAgICAgICAvKiAgICAgICAgICArIFBBR0VfQUxJR05FRChwaHlzKSAqLwogICAg
ICAgICBtb3YgICByMywgIzAKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
