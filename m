Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C722FD76
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 16:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWLt3-0003AT-8N; Thu, 30 May 2019 14:18:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fq1a=T6=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hWLt1-00037m-1E
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 14:18:31 +0000
X-Inumbo-ID: cb0d51e6-82e5-11e9-9385-ebffe58d023f
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb0d51e6-82e5-11e9-9385-ebffe58d023f;
 Thu, 30 May 2019 14:18:28 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A16B5305FFA6; Thu, 30 May 2019 17:18:25 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8FA193086D01;
 Thu, 30 May 2019 17:18:25 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 May 2019 17:18:20 +0300
Message-Id: <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559224640.git.ppircalabu@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1559224640.git.ppircalabu@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
Subject: [Xen-devel] [PATCH 6/9] vm_event: Move struct vm_event_domain to
 vm_event.c
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZtX2V2ZW50X2RvbWFpbiBtZW1iZXJzIGFyZSBub3QgYWNjZXNzZWQgb3V0c2lkZSB2bV9l
dmVudC5jIHNvIGl0J3MKYmV0dGVyIHRvIGhpZGUgZGUgaW1wbGVtZW50YXRpb24gZGV0YWlscy4K
ClNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+Ci0tLQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAgfCAyNyArKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMjcgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vdm1fZXZlbnQuYyBiL3hlbi9jb21tb24vdm1f
ZXZlbnQuYwppbmRleCAzZTg3YmJjLi4wMmM1ODUzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Zt
X2V2ZW50LmMKKysrIGIveGVuL2NvbW1vbi92bV9ldmVudC5jCkBAIC0zOSw2ICszOSwzMyBAQAog
I2RlZmluZSB2bV9ldmVudF9yaW5nX2xvY2soX3ZlZCkgICAgICAgc3Bpbl9sb2NrKCYoX3ZlZCkt
PnJpbmdfbG9jaykKICNkZWZpbmUgdm1fZXZlbnRfcmluZ191bmxvY2soX3ZlZCkgICAgIHNwaW5f
dW5sb2NrKCYoX3ZlZCktPnJpbmdfbG9jaykKIAorLyogVk0gZXZlbnQgKi8KK3N0cnVjdCB2bV9l
dmVudF9kb21haW4KK3sKKyAgICAvKiBEb21haW4gcmVmZXJlbmNlICovCisgICAgc3RydWN0IGRv
bWFpbiAqZDsKKyAgICAvKiByaW5nIGxvY2sgKi8KKyAgICBzcGlubG9ja190IHJpbmdfbG9jazsK
KyAgICAvKiBUaGUgcmluZyBoYXMgNjQgZW50cmllcyAqLworICAgIHVuc2lnbmVkIGNoYXIgZm9y
ZWlnbl9wcm9kdWNlcnM7CisgICAgdW5zaWduZWQgY2hhciB0YXJnZXRfcHJvZHVjZXJzOworICAg
IC8qIHNoYXJlZCByaW5nIHBhZ2UgKi8KKyAgICB2b2lkICpyaW5nX3BhZ2U7CisgICAgc3RydWN0
IHBhZ2VfaW5mbyAqcmluZ19wZ19zdHJ1Y3Q7CisgICAgLyogZnJvbnQtZW5kIHJpbmcgKi8KKyAg
ICB2bV9ldmVudF9mcm9udF9yaW5nX3QgZnJvbnRfcmluZzsKKyAgICAvKiBldmVudCBjaGFubmVs
IHBvcnQgKHZjcHUwIG9ubHkpICovCisgICAgaW50IHhlbl9wb3J0OworICAgIC8qIHZtX2V2ZW50
IGJpdCBmb3IgdmNwdS0+cGF1c2VfZmxhZ3MgKi8KKyAgICBpbnQgcGF1c2VfZmxhZzsKKyAgICAv
KiBsaXN0IG9mIHZjcHVzIHdhaXRpbmcgZm9yIHJvb20gaW4gdGhlIHJpbmcgKi8KKyAgICBzdHJ1
Y3Qgd2FpdHF1ZXVlX2hlYWQgd3E7CisgICAgLyogdGhlIG51bWJlciBvZiB2Q1BVcyBibG9ja2Vk
ICovCisgICAgdW5zaWduZWQgaW50IGJsb2NrZWQ7CisgICAgLyogVGhlIGxhc3QgdmNwdSB3b2tl
biB1cCAqLworICAgIHVuc2lnbmVkIGludCBsYXN0X3ZjcHVfd2FrZV91cDsKK307CisKIHN0YXRp
YyBpbnQgdm1fZXZlbnRfZW5hYmxlKAogICAgIHN0cnVjdCBkb21haW4gKmQsCiAgICAgc3RydWN0
IHhlbl9kb21jdGxfdm1fZXZlbnRfb3AgKnZlYywKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggN2RlZTAyMi4uMjA3ZmJj
NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmgKQEAgLTI3OSwzMiArMjc5LDcgQEAgc3RydWN0IHZjcHUKICNkZWZpbmUgZG9t
YWluX2xvY2soZCkgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmKGQpLT5kb21haW5fbG9jaykKICNkZWZp
bmUgZG9tYWluX3VubG9jayhkKSBzcGluX3VubG9ja19yZWN1cnNpdmUoJihkKS0+ZG9tYWluX2xv
Y2spCiAKLS8qIFZNIGV2ZW50ICovCi1zdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluCi17Ci0gICAgLyog
RG9tYWluIHJlZmVyZW5jZSAqLwotICAgIHN0cnVjdCBkb21haW4gKmQ7Ci0gICAgLyogcmluZyBs
b2NrICovCi0gICAgc3BpbmxvY2tfdCByaW5nX2xvY2s7Ci0gICAgLyogVGhlIHJpbmcgaGFzIDY0
IGVudHJpZXMgKi8KLSAgICB1bnNpZ25lZCBjaGFyIGZvcmVpZ25fcHJvZHVjZXJzOwotICAgIHVu
c2lnbmVkIGNoYXIgdGFyZ2V0X3Byb2R1Y2VyczsKLSAgICAvKiBzaGFyZWQgcmluZyBwYWdlICov
Ci0gICAgdm9pZCAqcmluZ19wYWdlOwotICAgIHN0cnVjdCBwYWdlX2luZm8gKnJpbmdfcGdfc3Ry
dWN0OwotICAgIC8qIGZyb250LWVuZCByaW5nICovCi0gICAgdm1fZXZlbnRfZnJvbnRfcmluZ190
IGZyb250X3Jpbmc7Ci0gICAgLyogZXZlbnQgY2hhbm5lbCBwb3J0ICh2Y3B1MCBvbmx5KSAqLwot
ICAgIGludCB4ZW5fcG9ydDsKLSAgICAvKiB2bV9ldmVudCBiaXQgZm9yIHZjcHUtPnBhdXNlX2Zs
YWdzICovCi0gICAgaW50IHBhdXNlX2ZsYWc7Ci0gICAgLyogbGlzdCBvZiB2Y3B1cyB3YWl0aW5n
IGZvciByb29tIGluIHRoZSByaW5nICovCi0gICAgc3RydWN0IHdhaXRxdWV1ZV9oZWFkIHdxOwot
ICAgIC8qIHRoZSBudW1iZXIgb2YgdkNQVXMgYmxvY2tlZCAqLwotICAgIHVuc2lnbmVkIGludCBi
bG9ja2VkOwotICAgIC8qIFRoZSBsYXN0IHZjcHUgd29rZW4gdXAgKi8KLSAgICB1bnNpZ25lZCBp
bnQgbGFzdF92Y3B1X3dha2VfdXA7Ci19Oworc3RydWN0IHZtX2V2ZW50X2RvbWFpbjsKIAogc3Ry
dWN0IGV2dGNobl9wb3J0X29wczsKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
