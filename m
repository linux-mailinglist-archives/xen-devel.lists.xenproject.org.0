Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EBBEF14
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQS5-0003kY-Pa; Thu, 26 Sep 2019 09:52:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQS3-0003jd-Sy
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:52:43 +0000
X-Inumbo-ID: 620e9839-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 620e9839-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491563; x=1601027563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rYvzmeotaaJgW6qlOTM/rr72px2cLcmGMqr3gdxHDvU=;
 b=uycXVr/QfYo1UOG2ruuinl3Xr3UAUuktbEzYHZPu+4mYe+C7s+3s54gx
 Eq7SIiWAqBU1guKumgzS5gr96j2YarbK4Pm74BokYgam9KqSKHU7pISsH
 OFaGc0/lLg2H9QT7v1KZOQg/ZvoKaHFg6hzBYtwefadngnyWthjKA/ydE Q=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989337"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:50:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id D3A90A26C9; Thu, 26 Sep 2019 09:50:26 +0000 (UTC)
Received: from EX13D28EUC001.ant.amazon.com (10.43.164.4) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:02 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC001.ant.amazon.com (10.43.164.4) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:01 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:57 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:42 +0100
Message-ID: <96f10f9693fdc795152a7f24c6df65f7f345b0f4.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 79/84] Don't assume bootmem_region_list is
 mapped. Also fix a double unmap bug.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyax@amazon.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBf
YnVpbGQuYyB8ICAyICstCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgIHwgMTIgKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4
Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggMjAyZWRjYWExNy4uMTU1NWE2MWI4NCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9t
MF9idWlsZC5jCkBAIC0yMzYsNyArMjM2LDcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHNldHVwX3B2
X3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBwZ3RibF9wZm4sCiAgICAg
aWYgKCBwbDNlICkKICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UocGwzZSk7CiAKLSAgICB1bm1h
cF9kb21haW5fcGFnZShsNHN0YXJ0KTsKKyAgICAvL3VubWFwX2RvbWFpbl9wYWdlKGw0c3RhcnQp
OwogfQogCiBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqIF9faW5pdCBhbGxvY19jaHVuayhzdHJ1
Y3QgZG9tYWluICpkLApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCBkZWVlYWMwNjVjLi42YWNjMWM3OGE0IDEwMDY0NAot
LS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
YwpAQCAtMjQ3LDYgKzI0Nyw3IEBAIG1mbl90IGZpcnN0X3ZhbGlkX21mbiA9IElOVkFMSURfTUZO
X0lOSVRJQUxJWkVSOwogc3RhdGljIHN0cnVjdCBib290bWVtX3JlZ2lvbiB7CiAgICAgdW5zaWdu
ZWQgbG9uZyBzLCBlOyAvKiBNRk5zIEBzIHRocm91Z2ggQGUtMSBpbmNsdXNpdmUgYXJlIGZyZWUg
Ki8KIH0gKl9faW5pdGRhdGEgYm9vdG1lbV9yZWdpb25fbGlzdDsKK3N0cnVjdCBwYWdlX2luZm8g
KmJvb3RtZW1fcmVnaW9uX2xpc3RfcGc7CiBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEg
bnJfYm9vdG1lbV9yZWdpb25zOwogCiBzdHJ1Y3Qgc2NydWJfcmVnaW9uIHsKQEAgLTI2NCw3ICsy
NjUsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGJvb3RtZW1fcmVnaW9uX2FkZCh1bnNpZ25lZCBs
b25nIHMsIHVuc2lnbmVkIGxvbmcgZSkKICAgICB1bnNpZ25lZCBpbnQgaTsKIAogICAgIGlmICgg
KGJvb3RtZW1fcmVnaW9uX2xpc3QgPT0gTlVMTCkgJiYgKHMgPCBlKSApCi0gICAgICAgIGJvb3Rt
ZW1fcmVnaW9uX2xpc3QgPSBtZm5fdG9fdmlydChzKyspOworICAgIHsKKyAgICAgICAgYm9vdG1l
bV9yZWdpb25fbGlzdF9wZyA9IG1mbl90b19wYWdlKF9tZm4ocykpOworICAgICAgICBib290bWVt
X3JlZ2lvbl9saXN0ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4ocykpOworICAgICAgICBzKys7Cisg
ICAgfQogCiAgICAgaWYgKCBzID49IGUgKQogICAgICAgICByZXR1cm47CkBAIC0xODY5LDcgKzE4
NzQsMTAgQEAgdm9pZCBfX2luaXQgZW5kX2Jvb3RfYWxsb2NhdG9yKHZvaWQpCiAgICAgICAgICAg
ICBpbml0X2hlYXBfcGFnZXMobWZuX3RvX3BhZ2UoX21mbihyLT5zKSksIHItPmUgLSByLT5zKTsK
ICAgICB9CiAgICAgbnJfYm9vdG1lbV9yZWdpb25zID0gMDsKLSAgICBpbml0X2hlYXBfcGFnZXMo
dmlydF90b19wYWdlKGJvb3RtZW1fcmVnaW9uX2xpc3QpLCAxKTsKKyAgICBpbml0X2hlYXBfcGFn
ZXMoYm9vdG1lbV9yZWdpb25fbGlzdF9wZywgMSk7CisgICAgLyogUmVtZW1iZXIgdG8gZGlzY2Fy
ZCB0aGUgbWFwcGluZyBmb3IgYm9vdG1lbV9yZWdpb25fbGlzdC4gKi8KKyAgICB1bm1hcF9kb21h
aW5fcGFnZShib290bWVtX3JlZ2lvbl9saXN0KTsKKyAgICBmbHVzaF90bGJfb25lX2xvY2FsKGJv
b3RtZW1fcmVnaW9uX2xpc3QpOwogCiAgICAgaWYgKCAhZG1hX2JpdHNpemUgJiYgKG51bV9vbmxp
bmVfbm9kZXMoKSA+IDEpICkKICAgICAgICAgZG1hX2JpdHNpemUgPSBhcmNoX2dldF9kbWFfYml0
c2l6ZSgpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
