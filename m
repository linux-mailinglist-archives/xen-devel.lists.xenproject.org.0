Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F212484
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMJy8-0006bB-Ig; Thu, 02 May 2019 22:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+so=TC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hMJy7-0006aq-5C
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:14:19 +0000
X-Inumbo-ID: 9a880882-6d27-11e9-a10b-17eec5634051
Received: from mail-it1-f193.google.com (unknown [209.85.166.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a880882-6d27-11e9-a10b-17eec5634051;
 Thu, 02 May 2019 22:14:07 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id t200so6181006itf.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 15:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnK3bfb23G+zfgp3PTJMob09a//AstE7eoVe83bF1oM=;
 b=su2+c0uPGeeuxLUn8AR3BDdJzmFuc5Obc/BTyEBm0Sdk9lqbKhNz55jfB8p5Enm6nC
 iCJ11nG5M73rHHb/P2oRft46PuhaNZHUetpQtvV3HQUkNA7xhCTyAYf+ShSB66Yq3U8+
 usvsqeCU6uQrdwksO7QhVV0ix1Wbv6JdONgTufkOtHQ15z0s1KQQZag8hjU+O8CbScbv
 72y/Hg//sfCPXpryqTEBXFCijKldbXTQE7QJidI3IZh8g4pI0PWXi2+LLuqb3cU4iixZ
 5Cu+H+y5dTmPu3LhwJhwlqDFBGfPbyYzAsmJ+nfQig6F7w5qcFuUIONtVo8MkRTcA5kz
 JWtQ==
X-Gm-Message-State: APjAAAXc3be0fDqqFV2lp82dkj+TpGQbhIODEzZdHmyk433h3xuUvUHw
 iJN+ZwCDO9mBas5svcQ78sRcWBMe
X-Google-Smtp-Source: APXvYqw/FCHV4QDT848lup/62Ty1YV56IeKQqxfkEL8o+eefWfiAUsKRr/GCGgzjh7nJAXu9D1ZmWw==
X-Received: by 2002:a24:ba02:: with SMTP id p2mr4409463itf.94.1556835246852;
 Thu, 02 May 2019 15:14:06 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id n199sm239715itn.34.2019.05.02.15.14.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:14:06 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 16:13:45 -0600
Message-Id: <20190502221345.18459-4-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502221345.18459-1-tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGlzYWJsZSBpdCBieSBkZWZhdWx0IGFzIGl0IGlzIG9ubHkgYW4gZXhwZXJpbWVudGFsIHN1YnN5
c3RlbS4KClNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgpDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRp
bSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBl
dS5jaXRyaXguY29tPgotLS0tCnY0OiBhZGQgQVNTRVJUX1VOUkVBQ0hBQkxFIHRvIGlubGluZWQg
ZnVuY3Rpb25zIHdoZXJlIGFwcGxpY2FibGUgJiBvdGhlciBmaXh1cHMKLS0tCiB4ZW4vYXJjaC94
ODYvS2NvbmZpZyAgICAgICAgICAgICAgfCAgNiArKysrKy0KIHhlbi9hcmNoL3g4Ni9kb21haW4u
YyAgICAgICAgICAgICB8ICAyICsrCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgICAg
fCAgMiArKwogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICAgIHwgIDIgKysKIHhlbi9h
cmNoL3g4Ni9tbS9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYveDg2XzY0
L2NvbXBhdC9tbS5jICAgfCAgMiArKwogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAg
IHwgIDIgKysKIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAzIC0tLQogeGVu
L2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vZ3JhbnRf
dGFibGUuYyAgICAgICAgICB8ICAyICstCiB4ZW4vY29tbW9uL21lbW9yeS5jICAgICAgICAgICAg
ICAgfCAgMiArLQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAgICAgICAgIHwgIDYgKysrLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCAyOCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggICAgICAgICAgfCAgMyArKysK
IHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS94
c20vZHVtbXkuaCAgICAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUveHNtL3hzbS5oICAgICAg
ICAgICAgIHwgIDQgKystLQogeGVuL3hzbS9kdW1teS5jICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICB8ICA0ICsrLS0KIDE5IGZpbGVz
IGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggNGI4YjA3
YjU0OS4uNjAwY2E1YzEyZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKKysrIGIv
eGVuL2FyY2gveDg2L0tjb25maWcKQEAgLTE3LDcgKzE3LDYgQEAgY29uZmlnIFg4NgogCXNlbGVj
dCBIQVNfS0VYRUMKIAlzZWxlY3QgTUVNX0FDQ0VTU19BTFdBWVNfT04KIAlzZWxlY3QgSEFTX01F
TV9QQUdJTkcKLQlzZWxlY3QgSEFTX01FTV9TSEFSSU5HCiAJc2VsZWN0IEhBU19OUzE2NTUwCiAJ
c2VsZWN0IEhBU19QQVNTVEhST1VHSAogCXNlbGVjdCBIQVNfUENJCkBAIC0xOTgsNiArMTk3LDEx
IEBAIGNvbmZpZyBQVl9TSElNX0VYQ0xVU0lWRQogCSAgZmlybXdhcmUsIGFuZCB3aWxsIG5vdCBm
dW5jdGlvbiBjb3JyZWN0bHkgaW4gb3RoZXIgc2NlbmFyaW9zLgogCiAJICBJZiB1bnN1cmUsIHNh
eSBOLgorCitjb25maWcgTUVNX1NIQVJJTkcKKwlib29sICJYZW4gbWVtb3J5IHNoYXJpbmcgc3Vw
cG9ydCIgaWYgRVhQRVJUID0gInkiCisJZGVwZW5kcyBvbiBIVk0KKwogZW5kbWVudQogCiBzb3Vy
Y2UgImNvbW1vbi9LY29uZmlnIgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIv
eGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGQyZDlmMmZjM2MuLjQ3NGRmODQzM2IgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
QEAgLTIwNDYsNiArMjA0Niw3IEBAIGludCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3Ry
dWN0IGRvbWFpbiAqZCkKICAgICAgICAgICAgIGQtPmFyY2guYXV0b191bm1hc2sgPSAwOwogICAg
ICAgICB9CiAKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKICAgICBQUk9HUkVTUyhzaGFyZWQp
OgogCiAgICAgICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCkBAIC0yMDU2LDYgKzIwNTcsNyBA
QCBpbnQgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAg
ICAgICAgICBpZiAoIHJldCApCiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgICAg
fQorI2VuZGlmCiAKICAgICAgICAgc3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOwogICAg
ICAgICBwYWdlX2xpc3Rfc3BsaWNlKCZkLT5hcmNoLnJlbG1lbV9saXN0LCAmZC0+cGFnZV9saXN0
KTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21j
dGwuYwppbmRleCA5YmYyZDA4MjBmLi5iYzllMDI0Y2NjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvZG9tY3RsLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCkBAIC0xMjMxLDkgKzEyMzEs
MTEgQEAgbG9uZyBhcmNoX2RvX2RvbWN0bCgKICAgICAgICAgYnJlYWs7CiAgICAgfQogCisjaWZk
ZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgY2FzZSBYRU5fRE9NQ1RMX21lbV9zaGFyaW5nX29w
OgogICAgICAgICByZXQgPSBtZW1fc2hhcmluZ19kb21jdGwoZCwgJmRvbWN0bC0+dS5tZW1fc2hh
cmluZ19vcCk7CiAgICAgICAgIGJyZWFrOworI2VuZGlmCiAKICNpZiBQMk1fQVVESVQgJiYgZGVm
aW5lZChDT05GSUdfSFZNKQogICAgIGNhc2UgWEVOX0RPTUNUTF9hdWRpdF9wMm06CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDQ1ZmFkYmFi
NjEuLmY5ZjYwN2ZiNGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC0zNjgsNyArMzY4LDkgQEAgdm9pZCBfX2luaXQgYXJjaF9pbml0X21l
bW9yeSh2b2lkKQogCiAgICAgZWZpX2luaXRfbWVtb3J5KCk7CiAKKyNpZmRlZiBDT05GSUdfTUVN
X1NIQVJJTkcKICAgICBtZW1fc2hhcmluZ19pbml0KCk7CisjZW5kaWYKIAogI2lmbmRlZiBOREVC
VUcKICAgICBpZiAoIGhpZ2htZW1fc3RhcnQgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21t
L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L21tL01ha2VmaWxlCmluZGV4IDVhMTc2NDZmOTguLjUw
MTBhMjlkNmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQorKysgYi94ZW4v
YXJjaC94ODYvbW0vTWFrZWZpbGUKQEAgLTYsNyArNiw3IEBAIG9iai0kKENPTkZJR19IVk0pICs9
IGd1ZXN0X3dhbGtfMi5vIGd1ZXN0X3dhbGtfMy5vIGd1ZXN0X3dhbGtfNC5vCiBvYmotJChDT05G
SUdfU0hBRE9XX1BBR0lORykgKz0gZ3Vlc3Rfd2Fsa18yLm8gZ3Vlc3Rfd2Fsa18zLm8gZ3Vlc3Rf
d2Fsa180Lm8KIG9iai0kKENPTkZJR19NRU1fQUNDRVNTKSArPSBtZW1fYWNjZXNzLm8KIG9iai15
ICs9IG1lbV9wYWdpbmcubwotb2JqLXkgKz0gbWVtX3NoYXJpbmcubworb2JqLSQoQ09ORklHX01F
TV9TSEFSSU5HKSArPSBtZW1fc2hhcmluZy5vCiBvYmoteSArPSBwMm0ubyBwMm0tcHQubwogb2Jq
LSQoQ09ORklHX0hWTSkgKz0gcDJtLWVwdC5vIHAybS1wb2Qubwogb2JqLXkgKz0gcGFnaW5nLm8K
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L21tLmMgYi94ZW4vYXJjaC94
ODYveDg2XzY0L2NvbXBhdC9tbS5jCmluZGV4IDMyNDEwZWQyNzMuLmQ0YzZiZTMwMzIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L21tLmMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9jb21wYXQvbW0uYwpAQCAtMTUyLDggKzE1MiwxMCBAQCBpbnQgY29tcGF0X2FyY2hf
bWVtb3J5X29wKHVuc2lnbmVkIGxvbmcgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQp
IGFyZykKICAgICBjYXNlIFhFTk1FTV9wYWdpbmdfb3A6CiAgICAgICAgIHJldHVybiBtZW1fcGFn
aW5nX21lbW9wKGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywgeGVuX21lbV9wYWdpbmdfb3BfdCkpOwog
CisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgY2FzZSBYRU5NRU1fc2hhcmluZ19vcDoK
ICAgICAgICAgcmV0dXJuIG1lbV9zaGFyaW5nX21lbW9wKGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywg
eGVuX21lbV9zaGFyaW5nX29wX3QpKTsKKyNlbmRpZgogCiAgICAgZGVmYXVsdDoKICAgICAgICAg
cmMgPSAtRU5PU1lTOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVu
L2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGQ4ZjU1OGJjM2EuLjUxZDFkNTExZjIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0
L21tLmMKQEAgLTk5Myw4ICs5OTMsMTAgQEAgbG9uZyBzdWJhcmNoX21lbW9yeV9vcCh1bnNpZ25l
ZCBsb25nIGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgY2FzZSBY
RU5NRU1fcGFnaW5nX29wOgogICAgICAgICByZXR1cm4gbWVtX3BhZ2luZ19tZW1vcChndWVzdF9o
YW5kbGVfY2FzdChhcmcsIHhlbl9tZW1fcGFnaW5nX29wX3QpKTsKIAorI2lmZGVmIENPTkZJR19N
RU1fU0hBUklORwogICAgIGNhc2UgWEVOTUVNX3NoYXJpbmdfb3A6CiAgICAgICAgIHJldHVybiBt
ZW1fc2hhcmluZ19tZW1vcChndWVzdF9oYW5kbGVfY2FzdChhcmcsIHhlbl9tZW1fc2hhcmluZ19v
cF90KSk7CisjZW5kaWYKIAogICAgIGRlZmF1bHQ6CiAgICAgICAgIHJjID0gLUVOT1NZUzsKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCBj
ODM4NTA2MjQxLi44MDU3NWNhYzEwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcKKysr
IGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC00NSw5ICs0NSw2IEBAIGNvbmZpZyBNRU1fQUNDRVNT
CiBjb25maWcgSEFTX01FTV9QQUdJTkcKIAlib29sCiAKLWNvbmZpZyBIQVNfTUVNX1NIQVJJTkcK
LQlib29sCi0KIGNvbmZpZyBIQVNfUERYCiAJYm9vbAogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA4OGJiZTk4NGJjLi5iYjA3MmNm
OTNmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9t
YWluLmMKQEAgLTkyNiw3ICs5MjYsNyBAQCBzdGF0aWMgdm9pZCBjb21wbGV0ZV9kb21haW5fZGVz
dHJveShzdHJ1Y3QgcmN1X2hlYWQgKmhlYWQpCiAgICAgeGZyZWUoZC0+dm1fZXZlbnRfcGFnaW5n
KTsKICNlbmRpZgogICAgIHhmcmVlKGQtPnZtX2V2ZW50X21vbml0b3IpOwotI2lmZGVmIENPTkZJ
R19IQVNfTUVNX1NIQVJJTkcKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKICAgICB4ZnJlZShk
LT52bV9ldmVudF9zaGFyZSk7CiAjZW5kaWYKIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFu
dF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCmluZGV4IDgwNzI4ZWE1N2QuLjZj
NDBkY2NhZTkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4v
Y29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTM3NjAsNyArMzc2MCw3IEBAIHZvaWQgZ3JhbnRfdGFi
bGVfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQogICAgIHYtPm1hcHRyYWNrX3RhaWwgPSBNQVBU
UkFDS19UQUlMOwogfQogCi0jaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORworI2lmZGVmIENP
TkZJR19NRU1fU0hBUklORwogaW50IG1lbV9zaGFyaW5nX2dyZWZfdG9fZ2ZuKHN0cnVjdCBncmFu
dF90YWJsZSAqZ3QsIGdyYW50X3JlZl90IHJlZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnZm5fdCAqZ2ZuLCB1aW50MTZfdCAqc3RhdHVzKQogewpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9tZW1vcnkuYyBiL3hlbi9jb21tb24vbWVtb3J5LmMKaW5kZXggODY1NjdlNjExNy4uOTE1ZjJj
ZWUxYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYworKysgYi94ZW4vY29tbW9uL21l
bW9yeS5jCkBAIC0xNjc2LDcgKzE2NzYsNyBAQCBpbnQgY2hlY2tfZ2V0X3BhZ2VfZnJvbV9nZm4o
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sIHJlYWRvbmx5LAogICAgICAgICByZXR1
cm4gLUVBR0FJTjsKICAgICB9CiAjZW5kaWYKLSNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5H
CisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgaWYgKCAocSAmIFAyTV9VTlNIQVJFKSAm
JiBwMm1faXNfc2hhcmVkKHAybXQpICkKICAgICB7CiAgICAgICAgIGlmICggcGFnZSApCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5k
ZXggNmU2OGJlNDdiYy4uMTYzYTY3MWNlYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVu
dC5jCisrKyBiL3hlbi9jb21tb24vdm1fZXZlbnQuYwpAQCAtNTQ0LDcgKzU0NCw3IEBAIHN0YXRp
YyB2b2lkIG1vbml0b3Jfbm90aWZpY2F0aW9uKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQg
cG9ydCkKICAgICB2bV9ldmVudF9yZXN1bWUodi0+ZG9tYWluLCB2LT5kb21haW4tPnZtX2V2ZW50
X21vbml0b3IpOwogfQogCi0jaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORworI2lmZGVmIENP
TkZJR19NRU1fU0hBUklORwogLyogUmVnaXN0ZXJlZCB3aXRoIFhlbi1ib3VuZCBldmVudCBjaGFu
bmVsIGZvciBpbmNvbWluZyBub3RpZmljYXRpb25zLiAqLwogc3RhdGljIHZvaWQgbWVtX3NoYXJp
bmdfbm90aWZpY2F0aW9uKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcG9ydCkKIHsKQEAg
LTU3NCw3ICs1NzQsNyBAQCB2b2lkIHZtX2V2ZW50X2NsZWFudXAoc3RydWN0IGRvbWFpbiAqZCkK
ICAgICAgICAgZGVzdHJveV93YWl0cXVldWVfaGVhZCgmZC0+dm1fZXZlbnRfbW9uaXRvci0+d3Ep
OwogICAgICAgICAodm9pZCl2bV9ldmVudF9kaXNhYmxlKGQsICZkLT52bV9ldmVudF9tb25pdG9y
KTsKICAgICB9Ci0jaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORworI2lmZGVmIENPTkZJR19N
RU1fU0hBUklORwogICAgIGlmICggdm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9zaGFy
ZSkgKQogICAgIHsKICAgICAgICAgZGVzdHJveV93YWl0cXVldWVfaGVhZCgmZC0+dm1fZXZlbnRf
c2hhcmUtPndxKTsKQEAgLTcyMCw3ICs3MjAsNyBAQCBpbnQgdm1fZXZlbnRfZG9tY3RsKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX3ZtX2V2ZW50X29wICp2ZWMsCiAgICAgfQog
ICAgIGJyZWFrOwogCi0jaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORworI2lmZGVmIENPTkZJ
R19NRU1fU0hBUklORwogICAgIGNhc2UgWEVOX0RPTUNUTF9WTV9FVkVOVF9PUF9TSEFSSU5HOgog
ICAgIHsKICAgICAgICAgcmMgPSAtRUlOVkFMOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tZW1fc2hhcmluZy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCmlu
ZGV4IGJiMTliNzUzNGYuLjhlZGI4ZTRjYzAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvbWVtX3NoYXJpbmcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgK
QEAgLTI0LDYgKzI0LDggQEAKICNpbmNsdWRlIDxwdWJsaWMvZG9tY3RsLmg+CiAjaW5jbHVkZSA8
cHVibGljL21lbW9yeS5oPgogCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCisKIC8qIEF1ZGl0
aW5nIG9mIG1lbW9yeSBzaGFyaW5nIGNvZGU/ICovCiAjaWZuZGVmIE5ERUJVRwogI2RlZmluZSBN
RU1fU0hBUklOR19BVURJVCAxCkBAIC0xMDAsNCArMTAyLDMwIEBAIHZvaWQgbWVtX3NoYXJpbmdf
aW5pdCh2b2lkKTsKICAqLwogaW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21h
aW4gKmQpOwogCisjZWxzZQorCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBtZW1fc2hhcmlu
Z19nZXRfbnJfc2F2ZWRfbWZucyh2b2lkKQoreworICAgIHJldHVybiAwOworfQorc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZvaWQpCit7
CisgICAgcmV0dXJuIDA7Cit9CitzdGF0aWMgaW5saW5lIGludCBtZW1fc2hhcmluZ191bnNoYXJl
X3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGdmbiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MTZfdCBmbGFncykKK3sKKyAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsKKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cit9CitzdGF0aWMgaW5saW5lIGludCBtZW1f
c2hhcmluZ19ub3RpZnlfZW5vbWVtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2Zu
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBhbGxvd19zbGVlcCkKK3sKKyAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKKyNl
bmRpZgorCiAjZW5kaWYgLyogX19NRU1fU0hBUklOR19IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAppbmRleCA3ZGM3
ZTMzZjczLi45YzA3N2FmOGVhIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCkBAIC0xMjcsNiArMTI3LDggQEAgc3RydWN0
IHBhZ2VfaW5mbwogICAgICAgICAvKiBGb3Igbm9uLXBpbm5hYmxlIHNpbmdsZS1wYWdlIHNoYWRv
d3MsIGEgaGlnaGVyIGVudHJ5IHRoYXQgcG9pbnRzCiAgICAgICAgICAqIGF0IHVzLiAqLwogICAg
ICAgICBwYWRkcl90IHVwOworCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgICAgIC8q
IEZvciBzaGFyZWQvc2hhcmFibGUgcGFnZXMsIHdlIHVzZSBhIGRvdWJseS1saW5rZWQgbGlzdAog
ICAgICAgICAgKiBvZiBhbGwgdGhlIHtwZm4sZG9tYWlufSBwYWlycyB0aGF0IG1hcCB0aGlzIHBh
Z2UuIFdlIGFsc28gaW5jbHVkZQogICAgICAgICAgKiBhbiBvcGFxdWUgaGFuZGxlLCB3aGljaCBp
cyBlZmZlY3RpdmVseSBhIHZlcnNpb24sIHNvIHRoYXQgY2xpZW50cwpAQCAtMTM0LDYgKzEzNiw3
IEBAIHN0cnVjdCBwYWdlX2luZm8KICAgICAgICAgICogVGhpcyBsaXN0IGlzIGFsbG9jYXRlZCBh
bmQgZnJlZWQgd2hlbiBhIHBhZ2UgaXMgc2hhcmVkL3Vuc2hhcmVkLgogICAgICAgICAgKi8KICAg
ICAgICAgc3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvICpzaGFyaW5nOworI2VuZGlmCiAgICAgfTsK
IAogICAgIC8qIFJlZmVyZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQR0NfeHh4IGZsYWdzIGFuZCBm
aWVsZHMuICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCmluZGV4IDc0OGJiMGYyZjkuLjE3Y2Y4Nzg1ZmIgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBA
IC00NjIsNyArNDYyLDcgQEAgc3RydWN0IGRvbWFpbgogICAgIC8qIFZhcmlvdXMgdm1fZXZlbnRz
ICovCiAKICAgICAvKiBNZW1vcnkgc2hhcmluZyBzdXBwb3J0ICovCi0jaWZkZWYgQ09ORklHX0hB
U19NRU1fU0hBUklORworI2lmZGVmIENPTkZJR19NRU1fU0hBUklORwogICAgIHN0cnVjdCB2bV9l
dmVudF9kb21haW4gKnZtX2V2ZW50X3NoYXJlOwogI2VuZGlmCiAgICAgLyogTWVtb3J5IHBhZ2lu
ZyBzdXBwb3J0ICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94c20vZHVtbXkuaCBiL3hlbi9p
bmNsdWRlL3hzbS9kdW1teS5oCmluZGV4IGU2MjhiMWM2YWYuLjhhZmRlYzlmZTggMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oCisrKyBiL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5o
CkBAIC02MDMsNyArNjAzLDcgQEAgc3RhdGljIFhTTV9JTkxJTkUgaW50IHhzbV9tZW1fcGFnaW5n
KFhTTV9ERUZBVUxUX0FSRyBzdHJ1Y3QgZG9tYWluICpkKQogfQogI2VuZGlmCiAKLSNpZmRlZiBD
T05GSUdfSEFTX01FTV9TSEFSSU5HCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiBzdGF0aWMg
WFNNX0lOTElORSBpbnQgeHNtX21lbV9zaGFyaW5nKFhTTV9ERUZBVUxUX0FSRyBzdHJ1Y3QgZG9t
YWluICpkKQogewogICAgIFhTTV9BU1NFUlRfQUNUSU9OKFhTTV9ETV9QUklWKTsKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hzbS94c20uaCBiL3hlbi9pbmNsdWRlL3hzbS94c20uaAppbmRleCA4
YTc4ZDhhYmQzLi44ZWM2YjFhNmU4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94c20veHNtLmgK
KysrIGIveGVuL2luY2x1ZGUveHNtL3hzbS5oCkBAIC0xNTEsNyArMTUxLDcgQEAgc3RydWN0IHhz
bV9vcGVyYXRpb25zIHsKICAgICBpbnQgKCptZW1fcGFnaW5nKSAoc3RydWN0IGRvbWFpbiAqZCk7
CiAjZW5kaWYKIAotI2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcKKyNpZmRlZiBDT05GSUdf
TUVNX1NIQVJJTkcKICAgICBpbnQgKCptZW1fc2hhcmluZykgKHN0cnVjdCBkb21haW4gKmQpOwog
I2VuZGlmCiAKQEAgLTYwMyw3ICs2MDMsNyBAQCBzdGF0aWMgaW5saW5lIGludCB4c21fbWVtX3Bh
Z2luZyAoeHNtX2RlZmF1bHRfdCBkZWYsIHN0cnVjdCBkb21haW4gKmQpCiB9CiAjZW5kaWYKIAot
I2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcKKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcK
IHN0YXRpYyBpbmxpbmUgaW50IHhzbV9tZW1fc2hhcmluZyAoeHNtX2RlZmF1bHRfdCBkZWYsIHN0
cnVjdCBkb21haW4gKmQpCiB7CiAgICAgcmV0dXJuIHhzbV9vcHMtPm1lbV9zaGFyaW5nKGQpOwpk
aWZmIC0tZ2l0IGEveGVuL3hzbS9kdW1teS5jIGIveGVuL3hzbS9kdW1teS5jCmluZGV4IDFmZTBl
NzQ2ZmEuLjYxNThkY2U4MTQgMTAwNjQ0Ci0tLSBhL3hlbi94c20vZHVtbXkuYworKysgYi94ZW4v
eHNtL2R1bW15LmMKQEAgLTEyOSw3ICsxMjksNyBAQCB2b2lkIF9faW5pdCB4c21fZml4dXBfb3Bz
IChzdHJ1Y3QgeHNtX29wZXJhdGlvbnMgKm9wcykKICAgICBzZXRfdG9fZHVtbXlfaWZfbnVsbChv
cHMsIG1lbV9wYWdpbmcpOwogI2VuZGlmCiAKLSNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5H
CisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgc2V0X3RvX2R1bW15X2lmX251bGwob3Bz
LCBtZW1fc2hhcmluZyk7CiAjZW5kaWYKIApkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9ob29r
cy5jIGIveGVuL3hzbS9mbGFzay9ob29rcy5jCmluZGV4IDNkMDBjNzQ3ZjYuLmY1ZjNiNDJlNmUg
MTAwNjQ0Ci0tLSBhL3hlbi94c20vZmxhc2svaG9va3MuYworKysgYi94ZW4veHNtL2ZsYXNrL2hv
b2tzLmMKQEAgLTEyNzAsNyArMTI3MCw3IEBAIHN0YXRpYyBpbnQgZmxhc2tfbWVtX3BhZ2luZyhz
dHJ1Y3QgZG9tYWluICpkKQogfQogI2VuZGlmCiAKLSNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFS
SU5HCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiBzdGF0aWMgaW50IGZsYXNrX21lbV9zaGFy
aW5nKHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgcmV0dXJuIGN1cnJlbnRfaGFzX3Blcm0oZCwg
U0VDQ0xBU1NfRE9NQUlOMiwgRE9NQUlOMl9fTUVNX1NIQVJJTkcpOwpAQCAtMTgzOCw3ICsxODM4
LDcgQEAgc3RhdGljIHN0cnVjdCB4c21fb3BlcmF0aW9ucyBmbGFza19vcHMgPSB7CiAgICAgLm1l
bV9wYWdpbmcgPSBmbGFza19tZW1fcGFnaW5nLAogI2VuZGlmCiAKLSNpZmRlZiBDT05GSUdfSEFT
X01FTV9TSEFSSU5HCisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCiAgICAgLm1lbV9zaGFyaW5n
ID0gZmxhc2tfbWVtX3NoYXJpbmcsCiAjZW5kaWYKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
