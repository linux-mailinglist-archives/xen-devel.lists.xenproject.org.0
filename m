Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE973187139
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 18:34:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDtaD-0006MV-Le; Mon, 16 Mar 2020 17:31:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tn4C=5B=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jDtaC-0006MQ-Fi
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 17:31:20 +0000
X-Inumbo-ID: f2598855-67ab-11ea-b872-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2598855-67ab-11ea-b872-12813bfff9fa;
 Mon, 16 Mar 2020 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfjUrOmiGlVJcvI2Aj5tCPI4UsPo1GD3QaDUZHh0lZQ=; b=etTnbTHkRPuOWxDsIH73/GDT6m
 op0iMitgjnkNRRU2+hz8QIfaDiOebvwlf0SFsKxFiF16v0qPtBYH8qIGJWLS5G2Jv1lcXFWJfju0M
 Ri4RJu+5U35nxb068e0is9I7KsHAIOffyant57Re7uFDvEaOWq87NZcfqzZZc5dE+2/A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jDtaA-00041Q-Pk; Mon, 16 Mar 2020 17:31:18 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jDtaA-00089b-Cm; Mon, 16 Mar 2020 17:31:18 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 16 Mar 2020 17:30:49 +0000
Message-Id: <bd60c61a1e7eb0bafa1ed60f87ab144ae4d34c1f.1584379843.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] x86/tboot: check return value of dmar_table
 allocation
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
Cc: hx242@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+CgpUaGUgYWxsb2NhdGlvbiBj
YW4ganVzdCByZXR1cm4gTlVMTC4gUmV0dXJuIGFuIGVycm9yIHZhbHVlIGVhcmx5IGluc3RlYWQK
b2YgY3Jhc2hpbmcgbGF0ZXIgb24uCgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4
aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGJvb3Qu
YyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCmluZGV4IDhjMjMyMjcwYjQuLmNlODVhNzEwZGQgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5j
CkBAIC00ODAsNiArNDgwLDggQEAgaW50IF9faW5pdCB0Ym9vdF9wYXJzZV9kbWFyX3RhYmxlKGFj
cGlfdGFibGVfaGFuZGxlciBkbWFyX2hhbmRsZXIpCiAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKGRtYXJfdGFibGVfbGVuZ3RoKSwKICAgICAgICAgICAgICAgICAgICAgICBwYSArIHNpemVv
ZihjaGFyKSAqIEFDUElfTkFNRV9TSVpFKTsKICAgICBkbWFyX3RhYmxlID0geG1hbGxvY19ieXRl
cyhkbWFyX3RhYmxlX2xlbmd0aCk7CisgICAgaWYgKCAhZG1hcl90YWJsZSApCisgICAgICAgIHJl
dHVybiAtRU5PTUVNOwogICAgIHRib290X2NvcHlfbWVtb3J5KGRtYXJfdGFibGUsIGRtYXJfdGFi
bGVfbGVuZ3RoLCBwYSk7CiAgICAgY2xlYXJfZml4bWFwKEZJWF9UQk9PVF9NQVBfQUREUkVTUyk7
CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
