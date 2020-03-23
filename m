Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3F18F217
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:44:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJay-0004MV-Fw; Mon, 23 Mar 2020 09:42:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJaw-0004Lz-V8
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:42:06 +0000
X-Inumbo-ID: 8b825d42-6cea-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b825d42-6cea-11ea-92cf-bc764e2007e4;
 Mon, 23 Mar 2020 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=35Ho2Vf8lc3EW5Mfp7Rg/7Pi6yyhMW4WAgUBIdCtNyM=; b=Kg4EvGxMQsxpbEtnYZAa9B+Tb8
 8t7TIv2/K840BLxDDTI/7tPzXtOAzCCssiWDO6a7EcY0rV7+vx+aUAAfR2dGCka799xhXveBPA21c
 XnMFKyQ/ERqnQFN1Kp90BTL/Drr5SQrlBSj/YzubMVKnXHzSOx7lpt7aFWt/rVDEfcWI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJaq-00006l-CR; Mon, 23 Mar 2020 09:42:00 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJaq-00041e-2G; Mon, 23 Mar 2020 09:42:00 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:41 +0000
Message-Id: <67b6f30fb36b44f26aba8a5039d5b551addf206d.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Subject: [Xen-devel] [PATCH 4/5] x86_64/mm: map and unmap page tables in
 destroy_compat_m2p_mapping
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
aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgfCA5ICsrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJjaC94ODYveDg2XzY0L21t
LmMKaW5kZXggMjY4MDE3M2ZhYi4uNzFjODRhYzU5MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAtMjM1LDExICsy
MzUsMTMgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9jb21wYXRfbTJwX21hcHBpbmcoc3RydWN0IG1l
bV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICBpZiAoIGVtYXAgPiAoKFJEV1JfQ09NUEFUX01QVF9W
SVJUX0VORCAtIFJEV1JfQ09NUEFUX01QVF9WSVJUX1NUQVJUKSA+PiAyKSApCiAgICAgICAgIGVt
YXAgPSAoUkRXUl9DT01QQVRfTVBUX1ZJUlRfRU5EIC0gUkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RB
UlQpID4+IDI7CiAKLSAgICBsM19yb19tcHQgPSBsNGVfdG9fbDNlKGlkbGVfcGdfdGFibGVbbDRf
dGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0pOworICAgIGwzX3JvX21w
dCA9IG1hcF9sM3RfZnJvbV9sNGUoaWRsZV9wZ190YWJsZVsKKyAgICAgICAgICAgICAgICAgICAg
bDRfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0pOwogCiAgICAgQVNT
RVJUKGwzZV9nZXRfZmxhZ3MobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldChISVJPX0NPTVBBVF9N
UFRfVklSVF9TVEFSVCldKSAmIF9QQUdFX1BSRVNFTlQpOwogCi0gICAgbDJfcm9fbXB0ID0gbDNl
X3RvX2wyZShsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NU
QVJUKV0pOworICAgIGwyX3JvX21wdCA9IG1hcF9sMnRfZnJvbV9sM2UoCisgICAgICAgICAgICAg
ICAgICAgIGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQoSElST19DT01QQVRfTVBUX1ZJUlRfU1RB
UlQpXSk7CiAKICAgICBmb3IgKCBpID0gc21hcDsgaSA8IGVtYXA7ICkKICAgICB7CkBAIC0yNjEs
NiArMjYzLDkgQEAgc3RhdGljIHZvaWQgZGVzdHJveV9jb21wYXRfbTJwX21hcHBpbmcoc3RydWN0
IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICAgICAgaSArPSAxVUwgPDwgKEwyX1BBR0VUQUJM
RV9TSElGVCAtIDIpOwogICAgIH0KIAorICAgIFVOTUFQX0RPTUFJTl9QQUdFKGwyX3JvX21wdCk7
CisgICAgVU5NQVBfRE9NQUlOX1BBR0UobDNfcm9fbXB0KTsKKwogICAgIHJldHVybjsKIH0KIAot
LSAKMi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
