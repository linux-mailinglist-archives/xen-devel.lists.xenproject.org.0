Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FACEE1ED0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNI9Z-0004Xb-Lt; Wed, 23 Oct 2019 15:02:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNI9Y-0004XS-8X
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:02:24 +0000
X-Inumbo-ID: 1de7e7f4-f5a6-11e9-9482-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1de7e7f4-f5a6-11e9-9482-12813bfff9fa;
 Wed, 23 Oct 2019 15:02:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 393D7B6E6;
 Wed, 23 Oct 2019 15:02:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49496057-afc0-f407-5a3b-7aeccedc1de1@suse.com>
Date: Wed, 23 Oct 2019 17:02:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: fix off-by-one in is_xen_fixed_mfn()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

X18yTV9yd2RhdGFfZW5kIG1hcmtzIHRoZSBmaXJzdCBieXRlIGFmdGVyIHRoZSBYZW4gaW1hZ2Us
IG5vdCBpdHMgbGFzdApieXRlLiBTdWJ0cmFjdCAxIHRvIG9idGFpbiB0aGUgdXBwZXIgYm91bmQg
dG8gY29tcGFyZSBhZ2FpbnN0LiAoTm90ZQp0aGF0IGluc3RlYWQgc3dpdGNoaW5nIGZyb20gPD0g
dG8gPCBpcyBsZXNzIGRlc2lyYWJsZSwgYXMgaW4gcHJpbmNpcGxlCl9fcGEoKSBtaWdodCByZXR1
cm4gcnViYmlzaCBmb3IgYWRkcmVzc2VzIG91dHNpZGUgb2YgdGhlIFhlbiBpbWFnZS4pCgpTaW5j
ZSB0aGUgJiBuZWVkcyB0byBiZSBkcm9wcGVkIGZyb20gdGhlIGxpbmUgaW4gcXVlc3Rpb24sIGFs
c28gZHJvcCBpdApmcm9tIHRoZSBhZGphY2VudCBvbmUuCgpSZXBvcnRlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KU2luY2UgdGhlIEFybSBzaWRlIGVxdWl2YWxlbnQgd2FzIHRh
a2VuIGZvciA0LjEzLCB0aGlzIG9uZSBzaG91bGQgYXQKbGVhc3QgYmUgY29uc2lkZXJlZCBhcyB3
ZWxsLgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbW0uaApAQCAtMjg1LDggKzI4NSw4IEBAIHN0cnVjdCBwYWdlX2luZm8KICNkZWZpbmUg
aXNfeGVuX2hlYXBfbWZuKG1mbikgXAogICAgIChtZm5fdmFsaWQobWZuKSAmJiBpc194ZW5faGVh
cF9wYWdlKG1mbl90b19wYWdlKG1mbikpKQogI2RlZmluZSBpc194ZW5fZml4ZWRfbWZuKG1mbikg
ICAgICAgICAgICAgICAgICAgICBcCi0gICAgKCgobWZuX3RvX21hZGRyKG1mbikpID49IF9fcGEo
Jl9zdGV4dCkpICYmICAgIFwKLSAgICAgKChtZm5fdG9fbWFkZHIobWZuKSkgPD0gX19wYSgmX18y
TV9yd2RhdGFfZW5kKSkpCisgICAgKCgobWZuX3RvX21hZGRyKG1mbikpID49IF9fcGEoX3N0ZXh0
KSkgJiYgICAgIFwKKyAgICAgKChtZm5fdG9fbWFkZHIobWZuKSkgPD0gX19wYShfXzJNX3J3ZGF0
YV9lbmQgLSAxKSkpCiAKICNkZWZpbmUgUFJ0eXBlX2luZm8gIjAxNmx4Ii8qIHNob3VsZCBvbmx5
IGJlIHVzZWQgZm9yIHByaW50aydzICovCiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
