Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB528BEEEF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPl-0008K5-OJ; Thu, 26 Sep 2019 09:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPi-00087i-RO
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:18 +0000
X-Inumbo-ID: 07ae05f4-e043-11e9-8628-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 07ae05f4-e043-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491411; x=1601027411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=8z0oYlQF1Bg6k3+OWJ/LtkFIqff1rqs7pLf37Fuu1Ss=;
 b=vASdipThD4YWNSFvq4Ra9zVfSFI8d9kXB/Fl/E/ZFYn9nUJbXDKDTPmw
 Kp9RftGRIlx8PdEpwk6DIqE8XvJ5OxuyZCasFNwfaD+YjV59WhoqY/9Dn
 xwX2wJn2eKF2FoJx2O27GLLO3bHGmztjrAjh/qTc91OpnuDxgTxEoWtB3 s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637411"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:49:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9E60EA2616; Thu, 26 Sep 2019 09:48:48 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:48 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:46 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:44 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:22 +0100
Message-ID: <3dba7fe6e3a9be5f41d02d41bc4ec6dbb1ba734c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 59/84] x86/pmap: break the loop in pmap APIs.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCk1vZGlmeSB0aGUgcG1hcCBQ
VEVzIGRpcmVjdGx5LiBVc2luZyBzZXQvY2xlYXJfZml4bWFwKCkgbWF5IHJlc3VsdCBpbgppbnZv
Y2F0aW9uIGxvb3BzLgoKU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9u
LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcG1hcC5jICAgICAgICB8IDExICsrKysrKysrLS0tCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaCB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcG1h
cC5jIGIveGVuL2FyY2gveDg2L3BtYXAuYwppbmRleCA0YWUxNmIwMjEyLi45MzEwNGQwYjg2IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcG1hcC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wbWFwLmMK
QEAgLTI5LDExICsyOSwxMiBAQCB2b2lkIHBtYXBfdW5sb2NrKHZvaWQpCiAgICAgc3Bpbl91bmxv
Y2soJmxvY2spOwogfQogCi12b2lkICpwbWFwX21hcChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQor
dm9pZCAqcG1hcF9tYXAobWZuX3QgbWZuKQogewogICAgIHVuc2lnbmVkIGludCBpZHg7CiAgICAg
dm9pZCAqbGluZWFyID0gTlVMTDsKICAgICBlbnVtIGZpeGVkX2FkZHJlc3NlcyBzbG90OworICAg
IGwxX3BnZW50cnlfdCAqcGwxZTsKIAogICAgIEFTU0VSVCghaW5faXJxKCkpOwogICAgIEFTU0VS
VChzcGluX2lzX2xvY2tlZCgmbG9jaykpOwpAQCAtNDcsNyArNDgsOCBAQCB2b2lkICpwbWFwX21h
cChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogICAgIHNsb3QgPSBpZHggKyBGSVhfUE1BUF9CRUdJ
TjsKICAgICBBU1NFUlQoc2xvdCA+PSBGSVhfUE1BUF9CRUdJTiAmJiBzbG90IDw9IEZJWF9QTUFQ
X0VORCk7CiAKLSAgICBzZXRfZml4bWFwKHNsb3QsIG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKSk7
CisgICAgcGwxZSA9ICZsMV9maXhtYXBbTDFfUEFHRVRBQkxFX0VOVFJJRVMgLSAxIC0gc2xvdF07
CisgICAgbDFlX3dyaXRlX2F0b21pYyhwbDFlLCBsMWVfZnJvbV9tZm4obWZuLCBQQUdFX0hZUEVS
VklTT1IpKTsKICAgICBsaW5lYXIgPSAodm9pZCAqKV9fZml4X3RvX3ZpcnQoc2xvdCk7CiAKICAg
ICByZXR1cm4gbGluZWFyOwpAQCAtNTYsNiArNTgsNyBAQCB2b2lkICpwbWFwX21hcChzdHJ1Y3Qg
cGFnZV9pbmZvICpwYWdlKQogdm9pZCBwbWFwX3VubWFwKHZvaWQgKnApCiB7CiAgICAgdW5zaWdu
ZWQgaW50IGlkeDsKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWU7CiAgICAgZW51bSBmaXhlZF9hZGRy
ZXNzZXMgc2xvdCA9IF9fdmlydF90b19maXgoKHVuc2lnbmVkIGxvbmcpcCk7CiAKICAgICBBU1NF
UlQoIWluX2lycSgpKTsKQEAgLTY0LDcgKzY3LDkgQEAgdm9pZCBwbWFwX3VubWFwKHZvaWQgKnAp
CiAKICAgICBpZHggPSBzbG90IC0gRklYX1BNQVBfQkVHSU47CiAgICAgX19jbGVhcl9iaXQoaWR4
LCAmaW51c2UpOwotICAgIGNsZWFyX2ZpeG1hcChzbG90KTsKKworICAgIHBsMWUgPSAmbDFfZml4
bWFwW0wxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSAtIHNsb3RdOworICAgIGwxZV93cml0ZV9hdG9t
aWMocGwxZSwgbDFlX2Zyb21fbWZuKF9tZm4oMCksIDApKTsKIH0KIAogc3RhdGljIHZvaWQgX19t
YXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wbWFwLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAppbmRleCA0MmNk
NGM3NzkzLi5mZWFiMWU5MTcwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaApAQCAtNiw3ICs2LDcgQEAKIAogdm9p
ZCBwbWFwX2xvY2sodm9pZCk7CiB2b2lkIHBtYXBfdW5sb2NrKHZvaWQpOwotdm9pZCAqcG1hcF9t
YXAoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSk7Cit2b2lkICpwbWFwX21hcChtZm5fdCBtZm4pOwog
dm9pZCBwbWFwX3VubWFwKHZvaWQgKnApOwogCiAjZW5kaWYJLyogX19YODZfUE1BUF9IX18gKi8K
LS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
