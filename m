Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96F132576
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 12:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionTN-0003Rb-7T; Tue, 07 Jan 2020 11:56:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ionTL-0003RW-PD
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 11:56:31 +0000
X-Inumbo-ID: b92f5f74-3144-11ea-b56d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b92f5f74-3144-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 11:56:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBB63AC88;
 Tue,  7 Jan 2020 11:56:21 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa05dd9d-fc17-ac6f-4b39-5816af10dabf@suse.com>
Date: Tue, 7 Jan 2020 12:56:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] VT-d: dma_pte_clear_one() can't fail anymore
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVuY2UgaXQncyBwb2ludGxlc3MgZm9yIGl0IHRvIHJldHVybiBhbiBlcnJvciBpbmRpY2F0b3Is
IGFuZCBpdCdzIGV2ZW4KbGVzcyB1c2VmdWwgZm9yIGl0IHRvIGJlIF9fbXVzdF9jaGVjay4gVGhp
cyBpcyBhIHJlc3VsdCBvZiBjb21taXQKZThhZmUxMTI0Y2MxICgiaW9tbXU6IGVsaWRlIGZsdXNo
aW5nIGZvciBoaWdoZXIgb3JkZXIgbWFwL3VubWFwCm9wZXJhdGlvbnMiKSBtb3ZpbmcgdGhlIFRM
QiBmbHVzaGluZyBvdXQgb2YgdGhlIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTYw
OCwxMyArNjA4LDEyIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlvbW11X2ZsdXNoX2lvdGwK
IH0KIAogLyogY2xlYXIgb25lIHBhZ2UncyBwYWdlIHRhYmxlICovCi1zdGF0aWMgaW50IF9fbXVz
dF9jaGVjayBkbWFfcHRlX2NsZWFyX29uZShzdHJ1Y3QgZG9tYWluICpkb21haW4sIHU2NCBhZGRy
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
ICpmbHVzaF9mbGFncykKK3N0YXRpYyB2b2lkIGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21h
aW4gKmRvbWFpbiwgdWludDY0X3QgYWRkciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpCiB7CiAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAq
aGQgPSBkb21faW9tbXUoZG9tYWluKTsKICAgICBzdHJ1Y3QgZG1hX3B0ZSAqcGFnZSA9IE5VTEws
ICpwdGUgPSBOVUxMOwogICAgIHU2NCBwZ19tYWRkcjsKLSAgICBpbnQgcmMgPSAwOwogCiAgICAg
c3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwogICAgIC8qIGdldCBsYXN0IGxldmVs
IHB0ZSAqLwpAQCAtNjIyLDcgKzYyMSw3IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGRtYV9w
dGVfY2xlYXJfb24KICAgICBpZiAoIHBnX21hZGRyID09IDAgKQogICAgIHsKICAgICAgICAgc3Bp
bl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7Ci0gICAgICAgIHJldHVybiAwOworICAg
ICAgICByZXR1cm47CiAgICAgfQogCiAgICAgcGFnZSA9IChzdHJ1Y3QgZG1hX3B0ZSAqKW1hcF92
dGRfZG9tYWluX3BhZ2UocGdfbWFkZHIpOwpAQCAtNjMyLDcgKzYzMSw3IEBAIHN0YXRpYyBpbnQg
X19tdXN0X2NoZWNrIGRtYV9wdGVfY2xlYXJfb24KICAgICB7CiAgICAgICAgIHNwaW5fdW5sb2Nr
KCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwogICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2Uo
cGFnZSk7Ci0gICAgICAgIHJldHVybiAwOworICAgICAgICByZXR1cm47CiAgICAgfQogCiAgICAg
ZG1hX2NsZWFyX3B0ZSgqcHRlKTsKQEAgLTY0Miw4ICs2NDEsNiBAQCBzdGF0aWMgaW50IF9fbXVz
dF9jaGVjayBkbWFfcHRlX2NsZWFyX29uCiAgICAgaW9tbXVfZmx1c2hfY2FjaGVfZW50cnkocHRl
LCBzaXplb2Yoc3RydWN0IGRtYV9wdGUpKTsKIAogICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShw
YWdlKTsKLQotICAgIHJldHVybiByYzsKIH0KIAogc3RhdGljIHZvaWQgaW9tbXVfZnJlZV9wYWdl
dGFibGUodTY0IHB0X21hZGRyLCBpbnQgbGV2ZWwpCkBAIC0xODAyLDcgKzE3OTksOSBAQCBzdGF0
aWMgaW50IF9fbXVzdF9jaGVjayBpbnRlbF9pb21tdV91bm1hCiAgICAgaWYgKCBpb21tdV9od2Rv
bV9wYXNzdGhyb3VnaCAmJiBpc19oYXJkd2FyZV9kb21haW4oZCkgKQogICAgICAgICByZXR1cm4g
MDsKIAotICAgIHJldHVybiBkbWFfcHRlX2NsZWFyX29uZShkLCBkZm5fdG9fZGFkZHIoZGZuKSwg
Zmx1c2hfZmxhZ3MpOworICAgIGRtYV9wdGVfY2xlYXJfb25lKGQsIGRmbl90b19kYWRkcihkZm4p
LCBmbHVzaF9mbGFncyk7CisKKyAgICByZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBpbnRlbF9p
b21tdV9sb29rdXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIG1mbl90ICptZm4s
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
