Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B17BEF06
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQA-0000vk-P1; Thu, 26 Sep 2019 09:50:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQ4-0000oS-T7
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:40 +0000
X-Inumbo-ID: 125132ce-e043-11e9-964c-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 125132ce-e043-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491429; x=1601027429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EQfXGAiYAwwkWDZDwPbXdH4ATyLi8r4fPivSmtdu1wY=;
 b=kFbCHezOU+E9LWbAVyIkhb/jcQgGodPKsRs1PcGdp3gm0r+Vqoz74XXJ
 m92y2VtSEyiz5BivMowVzePaqfGzt8/H8tunF7HlDdJNCzcoygRn8LCfz
 m9/dxE9SsSQAtwbrBGgGVxzjOCeq7FFqDxHC1NvokUv1B7/9azBp9kU1L 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989102"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 58834A1F10; Thu, 26 Sep 2019 09:49:27 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:06 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:03 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:28 +0100
Message-ID: <0aa271bfe3670f7058128c728d392faa69418a49.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 65/84] x86: fix some wrong assumptions on
 direct map. Increase PMAP slots to 8.
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbl9w
YWdlLmMgfCA4IC0tLS0tLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgICB8IDMgKystCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaCB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9k
b21haW5fcGFnZS5jIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKaW5kZXggNGEzOTk1Y2Nl
Zi4uZjRmNTNhMmEzMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKQEAgLTMyOCwxMSArMzI4LDYgQEAgdm9pZCAq
bWFwX2RvbWFpbl9wYWdlX2dsb2JhbChtZm5fdCBtZm4pCiAgICAgICAgICAgICAgc3lzdGVtX3N0
YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSkgfHwKICAgICAgICAgICAgIGxvY2FsX2lycV9pc19lbmFi
bGVkKCkpKTsKIAotI2lmZGVmIE5ERUJVRwotICAgIGlmICggbWZuX3gobWZuKSA8PSBQRk5fRE9X
TihfX3BhKEhZUEVSVklTT1JfVklSVF9FTkQgLSAxKSkgKQotICAgICAgICByZXR1cm4gbWZuX3Rv
X3ZpcnQobWZuX3gobWZuKSk7Ci0jZW5kaWYKLQogICAgIHJldHVybiB2bWFwKCZtZm4sIDEpOwog
fQogCkBAIC0zNDAsOSArMzM1LDYgQEAgdm9pZCB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoY29u
c3Qgdm9pZCAqcHRyKQogewogICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZylw
dHI7CiAKLSAgICBpZiAoIHZhID49IERJUkVDVE1BUF9WSVJUX1NUQVJUICkKLSAgICAgICAgcmV0
dXJuOwotCiAgICAgQVNTRVJUKHZhID49IFZNQVBfVklSVF9TVEFSVCAmJiB2YSA8IFZNQVBfVklS
VF9FTkQpOwogCiAgICAgdnVubWFwKHB0cik7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2
XzY0L21tLmMgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggMzdlOGQ1OWU1ZC4uNDBm
MjlmOGRkYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAtNzEyLDcgKzcxMiw4IEBAIHZvaWQgX19pbml0IHBhZ2lu
Z19pbml0KHZvaWQpCiAgICAgaWYgKCBtZm5fZXEobDJfcm9fbXB0X21mbiwgSU5WQUxJRF9NRk4p
ICkKICAgICAgICAgZ290byBub21lbTsKICAgICBsMl9yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJs
ZShsMl9yb19tcHRfbWZuKTsKLSAgICBjb21wYXRfaWRsZV9wZ190YWJsZV9sMiA9IGwyX3JvX21w
dDsKKyAgICAvKiBjb21wYXRfaWRsZV9wZ190YWJsZV9sMiBpcyB1c2VkIGdsb2JhbGx5LiAqLwor
ICAgIGNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyID0gbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChsMl9y
b19tcHRfbWZuKTsKICAgICBjbGVhcl9wYWdlKGwyX3JvX21wdCk7CiAgICAgbDNlX3dyaXRlKCZs
M19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0sCiAg
ICAgICAgICAgICAgIGwzZV9mcm9tX21mbihsMl9yb19tcHRfbWZuLCBfX1BBR0VfSFlQRVJWSVNP
Ul9STykpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L3BtYXAuaAppbmRleCBmZWFiMWU5MTcwLi4zNGQ0ZjJiYjM4IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L3BtYXAuaApAQCAtMSw4ICsxLDggQEAKICNpZm5kZWYgX19YODZfUE1BUF9IX18KICNkZWZpbmUg
X19YODZfUE1BUF9IX18KIAotLyogTGFyZ2UgZW5vdWdoIGZvciBtYXBwaW5nIDUgbGV2ZWxzIG9m
IHBhZ2UgdGFibGVzICovCi0jZGVmaW5lIE5VTV9GSVhfUE1BUCA1CisvKiBMYXJnZSBlbm91Z2gg
Zm9yIG1hcHBpbmcgNSBsZXZlbHMgb2YgcGFnZSB0YWJsZXMgd2l0aCBzb21lIGhlYWRyb29tICov
CisjZGVmaW5lIE5VTV9GSVhfUE1BUCA4CiAKIHZvaWQgcG1hcF9sb2NrKHZvaWQpOwogdm9pZCBw
bWFwX3VubG9jayh2b2lkKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
