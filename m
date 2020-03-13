Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8F1849A2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 15:41:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jClRq-0000b0-MU; Fri, 13 Mar 2020 14:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jClRo-0000am-WF
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 14:38:01 +0000
X-Inumbo-ID: 3c5dfbcc-6538-11ea-b31a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5dfbcc-6538-11ea-b31a-12813bfff9fa;
 Fri, 13 Mar 2020 14:37:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6794ACD0;
 Fri, 13 Mar 2020 14:37:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 15:37:54 +0100
Message-Id: <20200313143755.31870-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200313143755.31870-1-jgross@suse.com>
References: <20200313143755.31870-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/2] xen/rwlocks: call preempt_disable() when
 taking a rwlock
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhciB0byBzcGlubG9ja3MgcHJlZW1wdGlvbiBzaG91bGQgYmUgZGlzYWJsZWQgd2hpbGUg
aG9sZGluZyBhCnJ3bG9jay4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tClYyOgotIG1vdmUgcHJlZW1wdF9kaXNhYmxlKCkvZW5hYmxlKCkgY2FsbHMg
KEphbiBCZXVsaWNoLCBKdWxpZW4gR3JhbGwpCi0tLQogeGVuL2luY2x1ZGUveGVuL3J3bG9jay5o
IHwgMTggKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKaW5kZXggMWMyMjFkZDBkOS4uNGQxYjQ4YzcyMiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCisrKyBiL3hlbi9pbmNsdWRlL3hl
bi9yd2xvY2suaApAQCAtMiw2ICsyLDcgQEAKICNkZWZpbmUgX19SV0xPQ0tfSF9fCiAKICNpbmNs
dWRlIDx4ZW4vcGVyY3B1Lmg+CisjaW5jbHVkZSA8eGVuL3ByZWVtcHQuaD4KICNpbmNsdWRlIDx4
ZW4vc21wLmg+CiAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+CiAKQEAgLTU0LDYgKzU1LDcgQEAg
c3RhdGljIGlubGluZSBpbnQgX3JlYWRfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykKIHsKICAgICB1
MzIgY250czsKIAorICAgIHByZWVtcHRfZGlzYWJsZSgpOwogICAgIGNudHMgPSBhdG9taWNfcmVh
ZCgmbG9jay0+Y250cyk7CiAgICAgaWYgKCBsaWtlbHkoX2Nhbl9yZWFkX2xvY2soY250cykpICkK
ICAgICB7CkBAIC02Miw2ICs2NCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9yZWFkX3RyeWxvY2so
cndsb2NrX3QgKmxvY2spCiAgICAgICAgICAgICByZXR1cm4gMTsKICAgICAgICAgYXRvbWljX3N1
YihfUVJfQklBUywgJmxvY2stPmNudHMpOwogICAgIH0KKyAgICBwcmVlbXB0X2VuYWJsZSgpOwog
ICAgIHJldHVybiAwOwogfQogCkBAIC03Myw2ICs3Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
cmVhZF9sb2NrKHJ3bG9ja190ICpsb2NrKQogewogICAgIHUzMiBjbnRzOwogCisgICAgcHJlZW1w
dF9kaXNhYmxlKCk7CiAgICAgY250cyA9IGF0b21pY19hZGRfcmV0dXJuKF9RUl9CSUFTLCAmbG9j
ay0+Y250cyk7CiAgICAgaWYgKCBsaWtlbHkoX2Nhbl9yZWFkX2xvY2soY250cykpICkKICAgICAg
ICAgcmV0dXJuOwpAQCAtMTA2LDYgKzExMCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfcmVhZF91
bmxvY2socndsb2NrX3QgKmxvY2spCiAgICAgICogQXRvbWljYWxseSBkZWNyZW1lbnQgdGhlIHJl
YWRlciBjb3VudAogICAgICAqLwogICAgIGF0b21pY19zdWIoX1FSX0JJQVMsICZsb2NrLT5jbnRz
KTsKKyAgICBwcmVlbXB0X2VuYWJsZSgpOwogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQgX3JlYWRf
dW5sb2NrX2lycShyd2xvY2tfdCAqbG9jaykKQEAgLTEzNyw2ICsxNDIsNyBAQCBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGludCBfd3JpdGVfbG9ja192YWwodm9pZCkKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfd3JpdGVfbG9jayhyd2xvY2tfdCAqbG9jaykKIHsKICAgICAvKiBPcHRpbWl6ZSBmb3IgdGhl
IHVuZmFpciBsb2NrIGNhc2Ugd2hlcmUgdGhlIGZhaXIgZmxhZyBpcyAwLiAqLworICAgIHByZWVt
cHRfZGlzYWJsZSgpOwogICAgIGlmICggYXRvbWljX2NtcHhjaGcoJmxvY2stPmNudHMsIDAsIF93
cml0ZV9sb2NrX3ZhbCgpKSA9PSAwICkKICAgICAgICAgcmV0dXJuOwogCkBAIC0xNjgsMTcgKzE3
NCwyMyBAQCBzdGF0aWMgaW5saW5lIGludCBfd3JpdGVfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykK
IHsKICAgICB1MzIgY250czsKIAorICAgIHByZWVtcHRfZGlzYWJsZSgpOwogICAgIGNudHMgPSBh
dG9taWNfcmVhZCgmbG9jay0+Y250cyk7Ci0gICAgaWYgKCB1bmxpa2VseShjbnRzKSApCisgICAg
aWYgKCB1bmxpa2VseShjbnRzKSB8fAorICAgICAgICAgdW5saWtlbHkoYXRvbWljX2NtcHhjaGco
JmxvY2stPmNudHMsIDAsIF93cml0ZV9sb2NrX3ZhbCgpKSAhPSAwKSApCisgICAgeworICAgICAg
ICBwcmVlbXB0X2VuYWJsZSgpOwogICAgICAgICByZXR1cm4gMDsKKyAgICB9CiAKLSAgICByZXR1
cm4gbGlrZWx5KGF0b21pY19jbXB4Y2hnKCZsb2NrLT5jbnRzLCAwLCBfd3JpdGVfbG9ja192YWwo
KSkgPT0gMCk7CisgICAgcmV0dXJuIDE7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVf
dW5sb2NrKHJ3bG9ja190ICpsb2NrKQogewogICAgIEFTU0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5
X21lKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwogICAgIGF0b21pY19hbmQofihfUVdfQ1BV
TUFTSyB8IF9RV19XTUFTSyksICZsb2NrLT5jbnRzKTsKKyAgICBwcmVlbXB0X2VuYWJsZSgpOwog
fQogCiBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9ja19pcnEocndsb2NrX3QgKmxvY2sp
CkBAIC0yNzQsNiArMjg2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9wZXJjcHVfcmVhZF9sb2Nr
KHBlcmNwdV9yd2xvY2tfdCAqKnBlcl9jcHVkYXRhLAogICAgIH0KIAogICAgIC8qIEluZGljYXRl
IHRoaXMgY3B1IGlzIHJlYWRpbmcuICovCisgICAgcHJlZW1wdF9kaXNhYmxlKCk7CiAgICAgdGhp
c19jcHVfcHRyKHBlcl9jcHVkYXRhKSA9IHBlcmNwdV9yd2xvY2s7CiAgICAgc21wX21iKCk7CiAg
ICAgLyogQ2hlY2sgaWYgYSB3cml0ZXIgaXMgd2FpdGluZy4gKi8KQEAgLTMwOSw2ICszMjIsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX3BlcmNwdV9yZWFkX3VubG9jayhwZXJjcHVfcndsb2NrX3Qg
KipwZXJfY3B1ZGF0YSwKICAgICB9CiAgICAgdGhpc19jcHVfcHRyKHBlcl9jcHVkYXRhKSA9IE5V
TEw7CiAgICAgc21wX3dtYigpOworICAgIHByZWVtcHRfZW5hYmxlKCk7CiB9CiAKIC8qIERvbid0
IGlubGluZSBwZXJjcHUgd3JpdGUgbG9jayBhcyBpdCdzIGEgY29tcGxleCBmdW5jdGlvbi4gKi8K
LS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
