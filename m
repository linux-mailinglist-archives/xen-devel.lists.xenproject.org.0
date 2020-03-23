Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBEB18F21A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:45:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJao-0004Hv-Dr; Mon, 23 Mar 2020 09:41:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJam-0004HV-UF
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:41:56 +0000
X-Inumbo-ID: 88fb948a-6cea-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88fb948a-6cea-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LO9Ux1uCue1Zi020/RhpT9BHvEBosZNq+XbjQWDoGr8=; b=P1mNf3sWCRHjMgsAfwmnm3kvoY
 au+rvCHyf4QUKNm8AnHZRZwk4El7h8/xcr1x/Ti3OLbpiNx8cCSwDmcapFDRj9wEFstzJ+iEme3hG
 NLp74R0bvYUC2pAKvKlAYKyrccw7DNRSM9rV+vbKDHIQqr6WLyRafRbcQK/Ja9kM2UU0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJam-00006T-6i; Mon, 23 Mar 2020 09:41:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJal-00041e-Sr; Mon, 23 Mar 2020 09:41:56 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:38 +0000
Message-Id: <1acfafbd8ebada1538c9e06323ef0b3bf3f6897c.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Subject: [Xen-devel] [PATCH 1/5] x86/shim: map and unmap page tables in
 replace_va_mapping
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
aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHYvc2hpbS5jIHwgMTAgKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwpp
bmRleCBlZDJlY2U4YThhLi4xMjI5ZDVmZmIzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYv
c2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKQEAgLTE2OSwxNSArMTY5LDE5IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCByZXBsYWNlX3ZhX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwg
bDRfcGdlbnRyeV90ICpsNHN0YXJ0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHZhLCBtZm5fdCBtZm4pCiB7CiAgICAgbDRfcGdlbnRyeV90ICpw
bDRlID0gbDRzdGFydCArIGw0X3RhYmxlX29mZnNldCh2YSk7Ci0gICAgbDNfcGdlbnRyeV90ICpw
bDNlID0gbDRlX3RvX2wzZSgqcGw0ZSkgKyBsM190YWJsZV9vZmZzZXQodmEpOwotICAgIGwyX3Bn
ZW50cnlfdCAqcGwyZSA9IGwzZV90b19sMmUoKnBsM2UpICsgbDJfdGFibGVfb2Zmc2V0KHZhKTsK
LSAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSBsMmVfdG9fbDFlKCpwbDJlKSArIGwxX3RhYmxlX29m
ZnNldCh2YSk7CisgICAgbDNfcGdlbnRyeV90ICpwbDNlID0gbWFwX2wzdF9mcm9tX2w0ZSgqcGw0
ZSkgKyBsM190YWJsZV9vZmZzZXQodmEpOworICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IG1hcF9s
MnRfZnJvbV9sM2UoKnBsM2UpICsgbDJfdGFibGVfb2Zmc2V0KHZhKTsKKyAgICBsMV9wZ2VudHJ5
X3QgKnBsMWUgPSBtYXBfbDF0X2Zyb21fbDJlKCpwbDJlKSArIGwxX3RhYmxlX29mZnNldCh2YSk7
CiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9IG1mbl90b19wYWdlKGwxZV9nZXRfbWZuKCpw
bDFlKSk7CiAKICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKIAogICAgICpwbDFlID0gbDFl
X2Zyb21fbWZuKG1mbiwgKCFpc19wdl8zMmJpdF9kb21haW4oZCkgPyBMMV9QUk9UCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IENPTVBBVF9M
MV9QUk9UKSk7CisKKyAgICBVTk1BUF9ET01BSU5fUEFHRShwbDFlKTsKKyAgICBVTk1BUF9ET01B
SU5fUEFHRShwbDJlKTsKKyAgICBVTk1BUF9ET01BSU5fUEFHRShwbDNlKTsKIH0KIAogc3RhdGlj
IHZvaWQgZXZ0Y2huX3Jlc2VydmUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHBvcnQp
Ci0tIAoyLjI0LjEuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
