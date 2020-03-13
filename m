Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69330184191
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 08:37:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCeqX-0007JV-8h; Fri, 13 Mar 2020 07:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCeqV-0007Iy-Iq
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 07:35:03 +0000
X-Inumbo-ID: 26968808-64fd-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26968808-64fd-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 07:35:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41449AD45;
 Fri, 13 Mar 2020 07:35:02 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Message-ID: <e2734a4d-fb92-55e7-c08b-423f38049776@suse.com>
Date: Fri, 13 Mar 2020 08:35:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] libfdt: Fix undefined behaviour in
 fdt_offset_ptr()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+CgpVc2luZyBw
b2ludGVyIGFyaXRobWV0aWMgdG8gZ2VuZXJhdGUgYSBwb2ludGVyIG91dHNpZGUgYSBrbm93biBv
YmplY3QgaXMsCnRlY2huaWNhbGx5LCB1bmRlZmluZWQgYmVoYXZpb3VyIGluIEMuICBVbmZvcnR1
bmF0ZWx5LCB3ZSB3ZXJlIHVzaW5nIHRoYXQKaW4gZmR0X29mZnNldF9wdHIoKSB0byBkZXRlY3Qg
b3ZlcmZsb3dzLgoKVG8gZml4IHRoaXMgd2UgbmVlZCB0byBkbyBvdXIgYm91bmRzIC8gb3ZlcmZs
b3cgY2hlY2tpbmcgb24gdGhlIG9mZnNldHMKYmVmb3JlIGNvbnN0cnVjdGluZyBwb2ludGVycyBm
cm9tIHRoZW0uCgpSZXBvcnRlZC1ieTogRGF2aWQgQmluZGVybWFuIDxkY2IzMTRAaG90bWFpbC5j
b20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEdpYnNvbiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlk
LmF1PgpbdXBzdHJlYW0gY29tbWl0IGQwYjNhYjBhMGY0NmFjOTI5YjQ3MTNkYTQ2ZjdmZGNkODkz
ZGQzYmRdClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9jb21tb24vbGliZmR0L2ZkdC5jCisrKyBiL3hlbi9jb21tb24vbGliZmR0L2ZkdC5j
CkBAIC03NCwxOCArNzQsMTkgQEAgaW50IGZkdF9jaGVja19oZWFkZXIoY29uc3Qgdm9pZCAqZmR0
KQogCiBjb25zdCB2b2lkICpmZHRfb2Zmc2V0X3B0cihjb25zdCB2b2lkICpmZHQsIGludCBvZmZz
ZXQsIHVuc2lnbmVkIGludCBsZW4pCiB7Ci0JY29uc3QgY2hhciAqcDsKKwl1bnNpZ25lZCBhYnNv
ZmZzZXQgPSBvZmZzZXQgKyBmZHRfb2ZmX2R0X3N0cnVjdChmZHQpOworCisJaWYgKChhYnNvZmZz
ZXQgPCBvZmZzZXQpCisJICAgIHx8ICgoYWJzb2Zmc2V0ICsgbGVuKSA8IGFic29mZnNldCkKKwkg
ICAgfHwgKGFic29mZnNldCArIGxlbikgPiBmZHRfdG90YWxzaXplKGZkdCkpCisJCXJldHVybiBO
VUxMOwogCiAJaWYgKGZkdF92ZXJzaW9uKGZkdCkgPj0gMHgxMSkKIAkJaWYgKCgob2Zmc2V0ICsg
bGVuKSA8IG9mZnNldCkKIAkJICAgIHx8ICgob2Zmc2V0ICsgbGVuKSA+IGZkdF9zaXplX2R0X3N0
cnVjdChmZHQpKSkKIAkJCXJldHVybiBOVUxMOwogCi0JcCA9IF9mZHRfb2Zmc2V0X3B0cihmZHQs
IG9mZnNldCk7Ci0KLQlpZiAocCArIGxlbiA8IHApCi0JCXJldHVybiBOVUxMOwotCXJldHVybiBw
OworCXJldHVybiBfZmR0X29mZnNldF9wdHIoZmR0LCBvZmZzZXQpOwogfQogCiB1aW50MzJfdCBm
ZHRfbmV4dF90YWcoY29uc3Qgdm9pZCAqZmR0LCBpbnQgc3RhcnRvZmZzZXQsIGludCAqbmV4dG9m
ZnNldCkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
