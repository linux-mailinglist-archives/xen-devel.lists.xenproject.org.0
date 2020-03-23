Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674E18F219
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:45:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJb3-0004PC-Ox; Mon, 23 Mar 2020 09:42:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJb1-0004OY-VM
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:42:11 +0000
X-Inumbo-ID: 8c5993c0-6cea-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c5993c0-6cea-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5a3Tm+ua02C0EofKaTjbktPdNp8eHnU8nJjXQ4v8gnw=; b=48yBhW0hI9Cb1PQyDijNdVNZPU
 iLrdjl3qV5fRdHOMiUMHbXRhE+MYKrPtg6IWkTMs7RR44jMKbZRTkucM9r5hbBW6TO2Hq3J+8O+hd
 KKDT5s/iNLuEgcwYg1rLFTNgpSwPLzrR9OHIbk4QQAvJSs8a6Dbj0MJkHDCTQ4Vfy68c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJar-000074-P4; Mon, 23 Mar 2020 09:42:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJar-00041e-FH; Mon, 23 Mar 2020 09:42:01 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:42 +0000
Message-Id: <7143c2a1e0c7ca46b3ace329d7dcab85e0b5c87c.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Subject: [Xen-devel] [PATCH 5/5] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4
aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgfCAxNiArKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJjaC94ODYv
eDg2XzY0L21tLmMKaW5kZXggNzFjODRhYzU5My4uNmEwZmZlMDg4YiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAt
Mjc1LDcgKzI3NSw4IEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfbTJwX21hcHBpbmcoc3RydWN0IG1l
bV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICB1bnNpZ25lZCBsb25nIGksIHZhLCByd3ZhOwogICAg
IHVuc2lnbmVkIGxvbmcgc21hcCA9IGluZm8tPnNwZm4sIGVtYXAgPSBpbmZvLT5lcGZuOwogCi0g
ICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChS
T19NUFRfVklSVF9TVEFSVCldKTsKKyAgICBsM19yb19tcHQgPSBtYXBfbDN0X2Zyb21fbDRlKAor
ICAgICAgICAgICAgICAgICAgICBpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChST19NUFRf
VklSVF9TVEFSVCldKTsKIAogICAgIC8qCiAgICAgICogTm8gbmVlZCB0byBjbGVhbiBtMnAgc3Ry
dWN0dXJlIGV4aXN0aW5nIGJlZm9yZSB0aGUgaG90cGx1ZwpAQCAtMjk3LDI2ICsyOTgsMzMgQEAg
c3RhdGljIHZvaWQgZGVzdHJveV9tMnBfbWFwcGluZyhzdHJ1Y3QgbWVtX2hvdGFkZF9pbmZvICpp
bmZvKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0KIAotICAgICAgICBsMl9yb19t
cHQgPSBsM2VfdG9fbDJlKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSk7CisgICAgICAg
IGwyX3JvX21wdCA9IG1hcF9sMnRfZnJvbV9sM2UobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldCh2
YSldKTsKICAgICAgICAgaWYgKCEobDJlX2dldF9mbGFncyhsMl9yb19tcHRbbDJfdGFibGVfb2Zm
c2V0KHZhKV0pICYgX1BBR0VfUFJFU0VOVCkpCiAgICAgICAgIHsKICAgICAgICAgICAgIGkgPSAo
IGkgJiB+KCgxVUwgPDwgKEwyX1BBR0VUQUJMRV9TSElGVCAtIDMpKSAtIDEpKSArCiAgICAgICAg
ICAgICAgICAgICAgICgxVUwgPDwgKEwyX1BBR0VUQUJMRV9TSElGVCAtIDMpKSA7CisgICAgICAg
ICAgICBVTk1BUF9ET01BSU5fUEFHRShsMl9yb19tcHQpOwogICAgICAgICAgICAgY29udGludWU7
CiAgICAgICAgIH0KIAogICAgICAgICBwdF9wZm4gPSBsMmVfZ2V0X3BmbihsMl9yb19tcHRbbDJf
dGFibGVfb2Zmc2V0KHZhKV0pOwogICAgICAgICBpZiAoIGhvdGFkZF9tZW1fdmFsaWQocHRfcGZu
LCBpbmZvKSApCiAgICAgICAgIHsKKyAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0OworCiAg
ICAgICAgICAgICBkZXN0cm95X3hlbl9tYXBwaW5ncyhyd3ZhLCByd3ZhICsgKDFVTCA8PCBMMl9Q
QUdFVEFCTEVfU0hJRlQpKTsKIAotICAgICAgICAgICAgbDJfcm9fbXB0ID0gbDNlX3RvX2wyZShs
M19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0pOwotICAgICAgICAgICAgbDJlX3dyaXRlKCZs
Ml9yb19tcHRbbDJfdGFibGVfb2Zmc2V0KHZhKV0sIGwyZV9lbXB0eSgpKTsKKyAgICAgICAgICAg
IGwydCA9IG1hcF9sMnRfZnJvbV9sM2UobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldCh2YSldKTsK
KyAgICAgICAgICAgIGwyZV93cml0ZSgmbDJ0W2wyX3RhYmxlX29mZnNldCh2YSldLCBsMmVfZW1w
dHkoKSk7CisgICAgICAgICAgICBVTk1BUF9ET01BSU5fUEFHRShsMnQpOwogICAgICAgICB9CiAg
ICAgICAgIGkgPSAoIGkgJiB+KCgxVUwgPDwgKEwyX1BBR0VUQUJMRV9TSElGVCAtIDMpKSAtIDEp
KSArCiAgICAgICAgICAgICAgICgxVUwgPDwgKEwyX1BBR0VUQUJMRV9TSElGVCAtIDMpKTsKKyAg
ICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDJfcm9fbXB0KTsKICAgICB9CiAKKyAgICBVTk1BUF9E
T01BSU5fUEFHRShsM19yb19tcHQpOworCiAgICAgZGVzdHJveV9jb21wYXRfbTJwX21hcHBpbmco
aW5mbyk7CiAKICAgICAvKiBCcnV0ZS1Gb3JjZSBmbHVzaCBhbGwgVExCICovCi0tIAoyLjI0LjEu
QU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
