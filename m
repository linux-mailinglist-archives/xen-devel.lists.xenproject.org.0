Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90228E291C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 05:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNU3t-0003fe-Mx; Thu, 24 Oct 2019 03:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNU3s-0003fP-Jm
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 03:45:20 +0000
X-Inumbo-ID: afb7c4a0-f610-11e9-9494-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afb7c4a0-f610-11e9-9494-12813bfff9fa;
 Thu, 24 Oct 2019 03:45:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AD6A92134B;
 Wed, 23 Oct 2019 23:45:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 23:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=lgZCu5yV+InqhKNSR1+N8kS9ueRzlky1xKj+fUwK+
 R0=; b=EO5V3vVC/OaMQtIMjtYIomfQkQf8Y0mpYKjPkaYkL7//wIzZqG0/MeRxI
 JhNgFTJCwupA0PXEp2+S1lt2pu3bLhl2ArCwFMoGYbmoiGEtKYFiuJIzl1v/51VM
 azOdtX52aaff9F6a3MBHip5Gj0tRfLiDNR/DklzxW63/CeXoHpnwl1wF5UAf2jLz
 FMKfbAnA5+CXY2TSEljI+s8s/ZH7kgUk3FOfKkhnFgxtJNw4ZMCydUsgtuNGsMzv
 uZtVoeXQJcZvmzOmKESPZF+sLkYTAJZw0VYx/09rT4YNukqEE+riSOLiUb+Ra3Ru
 CbZ0bvQBP+eQrWg4w+Z03u3to4Lkg==
X-ME-Sender: <xms:SR6xXX0G2aD_1WDssYIDfoSZrBfLZfIiXZc0N3RweQgmWZwyMgBvmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledtgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:SR6xXfaAZb3VNhwx4jxNRu1l5vGrp2OvRzPmclgYQcFIZ9E8DumdFQ>
 <xmx:SR6xXfK7UnON7FX4viYwo6G7UT3KgExTyDsDEO-IOnVJkjr9jj-R5Q>
 <xmx:SR6xXeGQXR2rwX4Y9mRaL32SdBilLKcLAq3gVBjS_63RLqha9A9dcQ>
 <xmx:SR6xXfUAvy2ImE4MnxMUKODi_LhG9AWk26lykVGIDFZALPDH6yh1Ow>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7B5F80065;
 Wed, 23 Oct 2019 23:45:12 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 24 Oct 2019 05:45:03 +0200
Message-Id: <b7a419a3ae5f1bcb4d954e3609a5d1a982f48ebc.1571888583.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/3] efi: remove old SetVirtualAddressMap()
 arrangement
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVtb3ZlIHVudXNlZCAoI2lmZGVmLWVkIG91dCkgY29kZS4gUmV2aXZpbmcgaXQgaW4gaXRzIGN1
cnJlbnQgc2hhcGUKd29uJ3QgZmx5IGJlY2F1c2U6CiAtIFNldFZpcnR1YWxBZGRyZXNzTWFwKCkg
bmVlZHMgdG8gYmUgY2FsbGVkIHdpdGggMToxIG1hcHBpbmcsIHdoaWNoCiAgIGlzbid0IHRoZSBj
YXNlIGF0IHRoaXMgdGltZQogLSBpdCB1c2VzIGRpcmVjdG1hcCwgd2hpY2ggbWF5IGdvIGF3YXkg
c29vbgogLSBpdCB1c2VzIGRpcmVjdG1hcCwgd2hpY2ggaXMgbWFwcGVkIHdpdGggTlgsIGJyZWFr
aW5nIEVmaVJ1bnRpbWVTZXJ2aWNlc0NvZGUKCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVk
LW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0
aGluZ3NsYWIuY29tPgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vY29tbW9uL2VmaS9ib290LmMgfCAyMCAtLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwppbmRleCA3OTE5Mzc4Li5j
ZGRmM2RlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1v
bi9lZmkvYm9vdC5jCkBAIC0yOSw5ICsyOSw2IEBACiAjdW5kZWYgX19BU1NFTUJMWV9fCiAjZW5k
aWYKIAotLyogVXNpbmcgU2V0VmlydHVhbEFkZHJlc3NNYXAoKSBpcyBpbmNvbXBhdGlibGUgd2l0
aCBrZXhlYzogKi8KLSN1bmRlZiBVU0VfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAKLQogI2RlZmlu
ZSBFRklfUkVWSVNJT04obWFqb3IsIG1pbm9yKSAoKChtYWpvcikgPDwgMTYpIHwgKG1pbm9yKSkK
IAogI2RlZmluZSBTTUJJT1MzX1RBQkxFX0dVSUQgXApAQCAtMTA5OSw5ICsxMDk2LDYgQEAgc3Rh
dGljIHZvaWQgX19pbml0IGVmaV9leGl0X2Jvb3QoRUZJX0hBTkRMRSBJbWFnZUhhbmRsZSwgRUZJ
X1NZU1RFTV9UQUJMRSAqU3lzdGUKIAogICAgIC8qIEFkanVzdCBwb2ludGVycyBpbnRvIEVGSS4g
Ki8KICAgICBlZmlfY3QgPSAodm9pZCAqKWVmaV9jdCArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwot
I2lmZGVmIFVTRV9TRVRfVklSVFVBTF9BRERSRVNTX01BUAotICAgIGVmaV9ycyA9ICh2b2lkICop
ZWZpX3JzICsgRElSRUNUTUFQX1ZJUlRfU1RBUlQ7Ci0jZW5kaWYKICAgICBlZmlfbWVtbWFwID0g
KHZvaWQgKillZmlfbWVtbWFwICsgRElSRUNUTUFQX1ZJUlRfU1RBUlQ7CiAgICAgZWZpX2Z3X3Zl
bmRvciA9ICh2b2lkICopZWZpX2Z3X3ZlbmRvciArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwogfQpA
QCAtMTQyMiw3ICsxNDE2LDYgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfZWZpX3BhcmFtKGNv
bnN0IGNoYXIgKnMpCiB9CiBjdXN0b21fcGFyYW0oImVmaSIsIHBhcnNlX2VmaV9wYXJhbSk7CiAK
LSNpZm5kZWYgVVNFX1NFVF9WSVJUVUFMX0FERFJFU1NfTUFQCiBzdGF0aWMgX19pbml0IHZvaWQg
Y29weV9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIGVuZCwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCAoKmlzX3ZhbGlkKSh1bnNpZ25lZCBsb25n
IHNtZm4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBlbWZuKSkKQEAgLTE0NjYsNyArMTQ1OSw2IEBAIHN0YXRpYyBib29sIF9f
aW5pdCBydF9yYW5nZV92YWxpZCh1bnNpZ25lZCBsb25nIHNtZm4sIHVuc2lnbmVkIGxvbmcgZW1m
bikKIHsKICAgICByZXR1cm4gdHJ1ZTsKIH0KLSNlbmRpZgogCiAjZGVmaW5lIElOVkFMSURfVklS
VFVBTF9BRERSRVNTICgweEJBQUFEVUwgPDwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKEVGSV9QQUdFX1NISUZUICsgQklUU19QRVJfTE9ORyAtIDMyKSkKQEAgLTE0NzQsMTMg
KzE0NjYsMTEgQEAgc3RhdGljIGJvb2wgX19pbml0IHJ0X3JhbmdlX3ZhbGlkKHVuc2lnbmVkIGxv
bmcgc21mbiwgdW5zaWduZWQgbG9uZyBlbWZuKQogdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5
KHZvaWQpCiB7CiAgICAgdW5zaWduZWQgaW50IGk7Ci0jaWZuZGVmIFVTRV9TRVRfVklSVFVBTF9B
RERSRVNTX01BUAogICAgIHN0cnVjdCBydF9leHRyYSB7CiAgICAgICAgIHN0cnVjdCBydF9leHRy
YSAqbmV4dDsKICAgICAgICAgdW5zaWduZWQgbG9uZyBzbWZuLCBlbWZuOwogICAgICAgICB1bnNp
Z25lZCBpbnQgcHJvdDsKICAgICB9ICpleHRyYSwgKmV4dHJhX2hlYWQgPSBOVUxMOwotI2VuZGlm
CiAKICAgICBmcmVlX2VibWFsbG9jX3VudXNlZF9tZW0oKTsKIApAQCAtMTU2Myw3ICsxNTUzLDYg
QEAgdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpCiAgICAgICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19FUlIgIkNvdWxkIG5vdCBtYXAgTUZOcyAlI2x4LSUjbHhcbiIsCiAgICAgICAg
ICAgICAgICAgICAgICAgIHNtZm4sIGVtZm4gLSAxKTsKICAgICAgICAgfQotI2lmbmRlZiBVU0Vf
U0VUX1ZJUlRVQUxfQUREUkVTU19NQVAKICAgICAgICAgZWxzZSBpZiAoICEoKGRlc2MtPlBoeXNp
Y2FsU3RhcnQgKyBsZW4gLSAxKSA+PiAoVkFERFJfQklUUyAtIDEpKSAmJgogICAgICAgICAgICAg
ICAgICAgKGV4dHJhID0geG1hbGxvYyhzdHJ1Y3QgcnRfZXh0cmEpKSAhPSBOVUxMICkKICAgICAg
ICAgewpAQCAtMTU3NCwxMiArMTU2Myw4IEBAIHZvaWQgX19pbml0IGVmaV9pbml0X21lbW9yeSh2
b2lkKQogICAgICAgICAgICAgZXh0cmFfaGVhZCA9IGV4dHJhOwogICAgICAgICAgICAgZGVzYy0+
VmlydHVhbFN0YXJ0ID0gZGVzYy0+UGh5c2ljYWxTdGFydDsKICAgICAgICAgfQotI2VuZGlmCiAg
ICAgICAgIGVsc2UKICAgICAgICAgewotI2lmZGVmIFVTRV9TRVRfVklSVFVBTF9BRERSRVNTX01B
UAotICAgICAgICAgICAgLyogWFhYIGFsbG9jYXRlIGUuZy4gZG93biBmcm9tIEZJWEFERFJfU1RB
UlQgKi8KLSNlbmRpZgogICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIk5vIG1hcHBpbmcg
Zm9yIE1GTnMgJSNseC0lI2x4XG4iLAogICAgICAgICAgICAgICAgICAgIHNtZm4sIGVtZm4gLSAx
KTsKICAgICAgICAgfQpAQCAtMTU5MSwxMCArMTU3Niw2IEBAIHZvaWQgX19pbml0IGVmaV9pbml0
X21lbW9yeSh2b2lkKQogICAgICAgICByZXR1cm47CiAgICAgfQogCi0jaWZkZWYgVVNFX1NFVF9W
SVJUVUFMX0FERFJFU1NfTUFQCi0gICAgZWZpX3JzLT5TZXRWaXJ0dWFsQWRkcmVzc01hcChlZmlf
bWVtbWFwX3NpemUsIGVmaV9tZGVzY19zaXplLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWRlc2NfdmVyLCBlZmlfbWVtbWFwKTsKLSNlbHNlCiAgICAgLyogU2V0IHVwIDE6MSBw
YWdlIHRhYmxlcyB0byBkbyBydW50aW1lIGNhbGxzIGluICJwaHlzaWNhbCIgbW9kZS4gKi8KICAg
ICBlZmlfbDRfcGd0YWJsZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKICAgICBCVUdfT04oIWVm
aV9sNF9wZ3RhYmxlKTsKQEAgLTE2ODAsNiArMTY2MSw1IEBAIHZvaWQgX19pbml0IGVmaV9pbml0
X21lbW9yeSh2b2lkKQogICAgIGZvciAoIGkgPSBsNF90YWJsZV9vZmZzZXQoSFlQRVJWSVNPUl9W
SVJUX1NUQVJUKTsKICAgICAgICAgICBpIDwgbDRfdGFibGVfb2Zmc2V0KERJUkVDVE1BUF9WSVJU
X0VORCk7ICsraSApCiAgICAgICAgIGVmaV9sNF9wZ3RhYmxlW2ldID0gaWRsZV9wZ190YWJsZVtp
XTsKLSNlbmRpZgogfQogI2VuZGlmCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
