Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55176D297
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho9wV-0004M4-RJ; Thu, 18 Jul 2019 17:11:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho9wU-0004Lz-Mx
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:11:42 +0000
X-Inumbo-ID: 1bf7a6dc-a97f-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bf7a6dc-a97f-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 17:11:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y17so3525205ljk.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ql/Xcu6Ni39j5uAzQSZir2tzV0ZlLopsgeXbWcD3Fu4=;
 b=KdD0GW3VVGEh6dVPbSBVLapw6F+PCOStkgCh2ltGaczq+Zjbd13awXhSFWCizU0whx
 b8O+Ycm91+px6mQEdEiHVNYLhWcWHNhyubssXe0XmoiGvvcykej4ugX1ysFGd6DhfFzB
 0e6c/EHjGR5CU9Q6IG8SVhHpSVN6a1P/1aeAq5q8qleWFmfCHAtEmbGY8wxmI8XQpxNg
 QDx7AGZXPu7WqarZ74etQlWIhpurBE5EtFMkex3o06a4ribl6LEoAyOg3sx5zTDOK8th
 Dpd6tXaUJJ7XnsAmYlQpyg6XH8y+OOZAIHnWHH1pTtD3+J6vyF0GRN8quhFKFjF8OnU3
 uR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ql/Xcu6Ni39j5uAzQSZir2tzV0ZlLopsgeXbWcD3Fu4=;
 b=EqMuEmj8wtLaCOIHP+o/H8Ei2OxeNNsBeNr1CtGklHBFCFHYoqPrGKE+ikHCI8ulB0
 veY9EJwDOC4M5P+NgXbRpviVMAKDbOeBciPkMwZotKdILMaI+lXaYYwq12wXn2mlNDf2
 tFpWeIe3NjpdTZuS3lW/q9tBQrO1Bm3hLWTwWqDAbsnuW0/Ljn++TJUY3lclYRwfHGWz
 IAhve5qRGFxDUtaISWoU+6D/98dwzHRL3EKvMiOO4xFixcOeVf3/4TXJaKd0fL1/JPuE
 dsVl0VuRXbLNmPrBku9VixE97PFfDjE3WdJnziLegN7feXI5uVX67AvtaygWsN7IMPLC
 YWFQ==
X-Gm-Message-State: APjAAAUbVkqEASBwu7ei+1nLxauqh5bBsn0pZ1amkSAC7GkzvGQo/ZpG
 i0IAmKAAa+4jkZE41wOo4puJhuJG
X-Google-Smtp-Source: APXvYqzwwaMoq9yzGYiuQo1ZxVmC4faH5VdKWIqtG6FngNF8rW9EoFAybjcOZwrFx99qBF6YFa69zA==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr25369833ljj.170.1563469899675; 
 Thu, 18 Jul 2019 10:11:39 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id e13sm5234612ljg.102.2019.07.18.10.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 18 Jul 2019 10:11:38 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 18 Jul 2019 20:11:37 +0300
Message-Id: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkxldCB2dW5tYXAg
YWxpZ24gcGFzc2VkIHZpcnR1YWwgYWRkcmVzcyBieSBQQUdFX1NJWkUuClRoaXMgYWxzbyBtYWtl
cyBpdCBjb25zaXN0ZW50IHdpdGggaG93IHssdW59bWFwX2RvbWFpbl9wYWdlKCkKY3VycmVudGx5
IHdvcmtzLgoKV2l0aCB0aGUgbWFpbiBjaGFuZ2UsIGFsc286CiAtIHN0cmlwIGFsbCBleGlzdGlu
ZyB2dW5tYXAoKSBjYWxscyBmcm9tIHByaW9yIG1hc2tpbmcKIC0gcmVwbGFjZSBvcGVuY29kZWQg
UEFHRV9NQVNLIG1hY3JvIGluIHZtX2luZGV4KCkKClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlz
b3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9o
dm0uYyB8IDIgKy0KIHhlbi9jb21tb24vdm1hcC5jICAgICAgICAgICAgfCA0ICsrLS0KIHhlbi9k
cml2ZXJzL2FjcGkvb3NsLmMgICAgICAgfCAyICstCiB4ZW4vaW5jbHVkZS94ZW4vdm1hcC5oICAg
ICAgIHwgNCArLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2h2bS5jIGIveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9odm0uYwppbmRleCBjNjQ2OWM4Li44NTYxYTExIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvaHZtLmMKQEAgLTU5Nyw3ICs1OTcsNyBAQCBzdGF0aWMgdm9pZCBzaF9lbXVsYXRlX3VubWFw
X2Rlc3Qoc3RydWN0IHZjcHUgKnYsIHZvaWQgKmFkZHIsCiAgICAgewogICAgICAgICBwYWdpbmdf
bWFya19kaXJ0eSh2LT5kb21haW4sIHNoX2N0eHQtPm1mblsxXSk7CiAgICAgICAgIHB1dF9wYWdl
KG1mbl90b19wYWdlKHNoX2N0eHQtPm1mblsxXSkpOwotICAgICAgICB2dW5tYXAoKHZvaWQgKiko
KHVuc2lnbmVkIGxvbmcpYWRkciAmIFBBR0VfTUFTSykpOworICAgICAgICB2dW5tYXAoYWRkcik7
CiAgICAgfQogICAgIGVsc2UKICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UoYWRkcik7CmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3ZtYXAuYyBiL3hlbi9jb21tb24vdm1hcC5jCmluZGV4IGZhZWJj
MWQuLmU3YmQ2YmYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vdm1hcC5jCisrKyBiL3hlbi9jb21t
b24vdm1hcC5jCkBAIC0xNDEsNyArMTQxLDcgQEAgc3RhdGljIHZvaWQgKnZtX2FsbG9jKHVuc2ln
bmVkIGludCBuciwgdW5zaWduZWQgaW50IGFsaWduLAogCiBzdGF0aWMgdW5zaWduZWQgaW50IHZt
X2luZGV4KGNvbnN0IHZvaWQgKnZhLCBlbnVtIHZtYXBfcmVnaW9uIHR5cGUpCiB7Ci0gICAgdW5z
aWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpdmEgJiB+KFBBR0VfU0laRSAtIDEpOwor
ICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXZhICYgUEFHRV9NQVNLOwog
ICAgIHVuc2lnbmVkIGludCBpZHg7CiAgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9ICh1bnNpZ25l
ZCBsb25nKXZtX2Jhc2VbdHlwZV07CiAKQEAgLTIyNSw3ICsyMjUsNyBAQCB2b2lkICp2bWFwKGNv
bnN0IG1mbl90ICptZm4sIHVuc2lnbmVkIGludCBucikKIAogdm9pZCB2dW5tYXAoY29uc3Qgdm9p
ZCAqdmEpCiB7Ci0gICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpdmE7Cisg
ICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpdmEgJiBQQUdFX01BU0s7CiAg
ICAgdW5zaWduZWQgaW50IHBhZ2VzID0gdm1fc2l6ZSh2YSwgVk1BUF9ERUZBVUxUKTsKIAogICAg
IGlmICggIXBhZ2VzICkKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2FjcGkvb3NsLmMgYi94ZW4v
ZHJpdmVycy9hY3BpL29zbC5jCmluZGV4IDRjOGJiNzguLjFhOTE0NTMgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL2FjcGkvb3NsLmMKKysrIGIveGVuL2RyaXZlcnMvYWNwaS9vc2wuYwpAQCAtMTE1
LDcgKzExNSw3IEBAIHZvaWQgYWNwaV9vc191bm1hcF9tZW1vcnkodm9pZCBfX2lvbWVtICogdmly
dCwgYWNwaV9zaXplIHNpemUpCiAJfQogCiAJaWYgKHN5c3RlbV9zdGF0ZSA+PSBTWVNfU1RBVEVf
Ym9vdCkKLQkJdnVubWFwKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKXZpcnQgJiBQQUdFX01BU0sp
KTsKKwkJdnVubWFwKHZpcnQpOwogfQogCiBhY3BpX3N0YXR1cyBhY3BpX29zX3JlYWRfcG9ydChh
Y3BpX2lvX2FkZHJlc3MgcG9ydCwgdTMyICogdmFsdWUsIHUzMiB3aWR0aCkKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi92bWFwLmggYi94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oCmluZGV4IDM2
OTU2MGUuLmE1NTZkMTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi92bWFwLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3ZtYXAuaApAQCAtMjcsOSArMjcsNyBAQCB2b2lkIF9faW9tZW0gKmlv
cmVtYXAocGFkZHJfdCwgc2l6ZV90KTsKIAogc3RhdGljIGlubGluZSB2b2lkIGlvdW5tYXAodm9p
ZCBfX2lvbWVtICp2YSkKIHsKLSAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9u
Zykodm9pZCBfX2ZvcmNlICopdmE7Ci0KLSAgICB2dW5tYXAoKHZvaWQgKikoYWRkciAmIFBBR0Vf
TUFTSykpOworICAgIHZ1bm1hcCgodm9pZCAqKXZhKTsKIH0KIAogdm9pZCAqYXJjaF92bWFwX3Zp
cnRfZW5kKHZvaWQpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
