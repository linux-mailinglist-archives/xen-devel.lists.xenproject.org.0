Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36517FE631
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:12:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhvm-0006un-8T; Fri, 15 Nov 2019 20:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhvl-0006uQ-0S
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:10:57 +0000
X-Inumbo-ID: 035e0738-07e4-11ea-b678-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 035e0738-07e4-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 20:10:48 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:10:33 -0500
Message-ID: <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery of
 PPIs to guests
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsb3cgdmdpY19nZXRfaHdfaXJxX2Rlc2MgdG8gYmUgY2FsbGVkIHdpdGggYSB2Y3B1IGFyZ3Vt
ZW50LgoKVXNlIHZjcHUgYXJndW1lbnQgaW4gdmdpY19jb25uZWN0X2h3X2lycS4KCnZnaWNfY29u
bmVjdF9od19pcnEgaXMgY2FsbGVkIGZvciBQUElzIGFuZCBTUElzLCBub3QgU0dJcy4gRW5mb3Jj
ZSB3aXRoCkFTU0VSVHMuCgpTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdh
cnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+CgotLS0KdjM6IG5ldyBwYXRjaAoKLS0tCk5v
dGU6IEkgaGF2ZSBvbmx5IG1vZGlmaWVkIHRoZSBvbGQgdmdpYyB0byBhbGxvdyBkZWxpdmVyeSBv
ZiBQUElzLgotLS0KIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jIHwgMjQgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy5jICAgICB8ICA2ICsrKy0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCmluZGV4IDk4
YzAyMWYxYTguLjJjNjZhOGZhOTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMtdmdpYy5j
CisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC00MTgsNyArNDE4LDcgQEAgc3RydWN0
IGlycV9kZXNjICp2Z2ljX2dldF9od19pcnFfZGVzYyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qg
dmNwdSAqdiwKIHsKICAgICBzdHJ1Y3QgcGVuZGluZ19pcnEgKnA7CiAKLSAgICBBU1NFUlQoIXYg
JiYgdmlycSA+PSAzMik7CisgICAgQVNTRVJUKCghdiAmJiAodmlycSA+PSAzMikpIHx8ICghZCAm
JiB2ICYmICh2aXJxID49IDE2KSAmJiAodmlycSA8IDMyKSkpOwogCiAgICAgaWYgKCAhdiApCiAg
ICAgICAgIHYgPSBkLT52Y3B1WzBdOwpAQCAtNDM0LDE1ICs0MzQsMjMgQEAgaW50IHZnaWNfY29u
bmVjdF9od19pcnEoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGlu
dCB2aXJxLAogICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjLCBi
b29sIGNvbm5lY3QpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKLSAgICAvKgotICAgICAq
IFVzZSB2Y3B1MCB0byByZXRyaWV2ZSB0aGUgcGVuZGluZ19pcnEgc3RydWN0LiBHaXZlbiB0aGF0
IHdlIG9ubHkKLSAgICAgKiByb3V0ZSBTUElzIHRvIGd1ZXN0cywgaXQgZG9lc24ndCBtYWtlIGFu
eSBkaWZmZXJlbmNlLgotICAgICAqLwotICAgIHN0cnVjdCB2Y3B1ICp2X3RhcmdldCA9IHZnaWNf
Z2V0X3RhcmdldF92Y3B1KGQtPnZjcHVbMF0sIHZpcnEpOwotICAgIHN0cnVjdCB2Z2ljX2lycV9y
YW5rICpyYW5rID0gdmdpY19yYW5rX2lycSh2X3RhcmdldCwgdmlycSk7Ci0gICAgc3RydWN0IHBl
bmRpbmdfaXJxICpwID0gaXJxX3RvX3BlbmRpbmcodl90YXJnZXQsIHZpcnEpOworICAgIHN0cnVj
dCB2Y3B1ICp2X3RhcmdldDsKKyAgICBzdHJ1Y3QgdmdpY19pcnFfcmFuayAqcmFuazsKKyAgICBz
dHJ1Y3QgcGVuZGluZ19pcnEgKnA7CiAgICAgaW50IHJldCA9IDA7CiAKKyAgICBpZiAodikKKyAg
ICAgICAgdl90YXJnZXQgPSB2OworICAgIGVsc2UKKyAgICAgICAgLyogVXNlIHZjcHUwIHRvIHJl
dHJpZXZlIHRoZSBwZW5kaW5nX2lycSBzdHJ1Y3QuICovCisgICAgICAgIHZfdGFyZ2V0ID0gdmdp
Y19nZXRfdGFyZ2V0X3ZjcHUoZC0+dmNwdVswXSwgdmlycSk7CisKKyAgICByYW5rID0gdmdpY19y
YW5rX2lycSh2X3RhcmdldCwgdmlycSk7CisgICAgcCA9IGlycV90b19wZW5kaW5nKHZfdGFyZ2V0
LCB2aXJxKTsKKworICAgIEFTU0VSVCh2aXJxID49IE5SX1NHSVMpOworICAgIEFTU0VSVChwLT5p
cnEgPj0gTlJfU0dJUyk7CisKICAgICAvKiAiZGVzYyIgaXMgb3B0aW9uYWwgd2hlbiB3ZSBkaXNj
b25uZWN0IGFuIElSUS4gKi8KICAgICBBU1NFUlQoIWNvbm5lY3QgfHwgZGVzYyk7CiAKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy5jCmluZGV4IDgy
ZjUyNGEzNWMuLmMzOTMzYzI2ODcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKKysr
IGIveGVuL2FyY2gvYXJtL3ZnaWMuYwpAQCAtNDEwLDEwICs0MTAsMTAgQEAgdm9pZCB2Z2ljX2Vu
YWJsZV9pcnFzKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCByLCBpbnQgbikKICAgICAgICAgICAg
IGlycV9zZXRfYWZmaW5pdHkocC0+ZGVzYywgY3B1bWFza19vZih2X3RhcmdldC0+cHJvY2Vzc29y
KSk7CiAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmcC0+ZGVzYy0+bG9jaywgZmxhZ3Mp
OwogICAgICAgICAgICAgLyoKLSAgICAgICAgICAgICAqIFRoZSBpcnEgY2Fubm90IGJlIGEgUFBJ
LCB3ZSBvbmx5IHN1cHBvcnQgZGVsaXZlcnkgb2YgU1BJcwotICAgICAgICAgICAgICogdG8gZ3Vl
c3RzLgorICAgICAgICAgICAgICogVGhlIGlycSBjYW5ub3QgYmUgYSBTR0ksIHdlIG9ubHkgc3Vw
cG9ydCBkZWxpdmVyeSBvZiBTUElzCisgICAgICAgICAgICAgKiBhbmQgUFBJcyB0byBndWVzdHMu
CiAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIEFTU0VSVChpcnEgPj0gMzIpOworICAgICAg
ICAgICAgQVNTRVJUKGlycSA+PSBOUl9TR0lTKTsKICAgICAgICAgICAgIGlmICggaXJxX3R5cGVf
c2V0X2J5X2RvbWFpbihkKSApCiAgICAgICAgICAgICAgICAgZ2ljX3NldF9pcnFfdHlwZShwLT5k
ZXNjLCB2Z2ljX2dldF92aXJxX3R5cGUodiwgbiwgaSkpOwogICAgICAgICAgICAgcC0+ZGVzYy0+
aGFuZGxlci0+ZW5hYmxlKHAtPmRlc2MpOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
