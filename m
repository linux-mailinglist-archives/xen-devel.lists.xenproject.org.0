Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66718F215
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:44:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJas-0004JM-Mo; Mon, 23 Mar 2020 09:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJaq-0004IZ-VH
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:42:00 +0000
X-Inumbo-ID: 89d5fe5e-6cea-11ea-8292-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89d5fe5e-6cea-11ea-8292-12813bfff9fa;
 Mon, 23 Mar 2020 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Op5RGEgTJYxinE1ReyG8HNPBZtOGMQ5zAHn/J1yOVxw=; b=Hcr9YcN2vHhvzpFR1m6ije9uQN
 8M6D2Q36j7iUm6F3tnFM34Uzoz3bR1aVPmz8kGg9giBjLU1RFcKYtWTWxdrBOnQoNcBYdn6suxDQ8
 qy5sODnVBS4n01z0ZegvG08CADEO+RBllFeKjKhZUBFXqnh1fANZdpDgsxeFjHvDsY+0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJan-00006Z-JH; Mon, 23 Mar 2020 09:41:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJan-00041e-9M; Mon, 23 Mar 2020 09:41:57 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:39 +0000
Message-Id: <9b46a0bae03107fcb192e6590234b9e882965f11.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Subject: [Xen-devel] [PATCH 2/5] x86_64/mm: map and unmap page tables in
 m2p_mapped
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
aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgfCAxOCArKysrKysr
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyBiL3hlbi9hcmNoL3g4
Ni94ODZfNjQvbW0uYwppbmRleCBiN2NlODMzZmZjLi5hNDQwZGFjMjVlIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCkBA
IC0xMzEsMjcgKzEzMSwzMyBAQCBzdGF0aWMgaW50IG0ycF9tYXBwZWQodW5zaWduZWQgbG9uZyBz
cGZuKQogICAgIHVuc2lnbmVkIGxvbmcgdmE7CiAgICAgbDNfcGdlbnRyeV90ICpsM19yb19tcHQ7
CiAgICAgbDJfcGdlbnRyeV90ICpsMl9yb19tcHQ7CisgICAgaW50IHJjID0gTTJQX05PX01BUFBF
RDsKIAogICAgIHZhID0gUk9fTVBUX1ZJUlRfU1RBUlQgKyBzcGZuICogc2l6ZW9mKCptYWNoaW5l
X3RvX3BoeXNfbWFwcGluZyk7Ci0gICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3BnX3Rh
YmxlW2w0X3RhYmxlX29mZnNldCh2YSldKTsKKyAgICBsM19yb19tcHQgPSBtYXBfbDN0X2Zyb21f
bDRlKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHZhKV0pOwogCiAgICAgc3dpdGNoICgg
bDNlX2dldF9mbGFncyhsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0pICYKICAgICAgICAg
ICAgICAoX1BBR0VfUFJFU0VOVCB8X1BBR0VfUFNFKSkKICAgICB7CiAgICAgICAgIGNhc2UgX1BB
R0VfUFNFfF9QQUdFX1BSRVNFTlQ6Ci0gICAgICAgICAgICByZXR1cm4gTTJQXzFHX01BUFBFRDsK
KyAgICAgICAgICAgIHJjID0gTTJQXzFHX01BUFBFRDsKKyAgICAgICAgICAgIGdvdG8gb3V0Owog
ICAgICAgICAvKiBDaGVjayBmb3IgbmV4dCBsZXZlbCAqLwogICAgICAgICBjYXNlIF9QQUdFX1BS
RVNFTlQ6CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgZGVmYXVsdDoKLSAgICAgICAgICAg
IHJldHVybiBNMlBfTk9fTUFQUEVEOworICAgICAgICAgICAgcmMgPSBNMlBfTk9fTUFQUEVEOwor
ICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgfQotICAgIGwyX3JvX21wdCA9IGwzZV90b19sMmUo
bDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldCh2YSldKTsKKyAgICBsMl9yb19tcHQgPSBtYXBfbDJ0
X2Zyb21fbDNlKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSk7CiAKICAgICBpZiAobDJl
X2dldF9mbGFncyhsMl9yb19tcHRbbDJfdGFibGVfb2Zmc2V0KHZhKV0pICYgX1BBR0VfUFJFU0VO
VCkKLSAgICAgICAgcmV0dXJuIE0yUF8yTV9NQVBQRUQ7CisgICAgICAgIHJjID0gTTJQXzJNX01B
UFBFRDsKKyAgICBVTk1BUF9ET01BSU5fUEFHRShsMl9yb19tcHQpOwogCi0gICAgcmV0dXJuIE0y
UF9OT19NQVBQRUQ7Cisgb3V0OgorICAgIFVOTUFQX0RPTUFJTl9QQUdFKGwzX3JvX21wdCk7Cisg
ICAgcmV0dXJuIHJjOwogfQogCiBzdGF0aWMgaW50IHNoYXJlX2hvdGFkZF9tMnBfdGFibGUoc3Ry
dWN0IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKLS0gCjIuMjQuMS5BTVpOCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
