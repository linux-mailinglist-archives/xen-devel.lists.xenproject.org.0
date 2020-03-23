Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834C18F216
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:44:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJan-0004HW-50; Mon, 23 Mar 2020 09:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJal-0004HQ-VK
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:41:56 +0000
X-Inumbo-ID: 8864564c-6cea-11ea-8292-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8864564c-6cea-11ea-8292-12813bfff9fa;
 Mon, 23 Mar 2020 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eNPAD9bwDFA/WuGsox5WWplPnFSCSsMBJyuqm4iRelU=; b=2+GYfYgzpqh+fpYpVBoS7lmtWU
 X22zVLXGps/++7BUvOKHRKxDTHZWukVAScgw53UTKpNjeG1dEnDfhZZJT9IVuFrXpo99Ddy9Bfr3t
 6Q4tDK3TvQLT6EBx+aDtiQKQgn2K2PlAzMSn0Yco2N3UJd346CRJ1ucIpOjTEmev4umo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJak-00006M-QU; Mon, 23 Mar 2020 09:41:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJak-00041e-GF; Mon, 23 Mar 2020 09:41:54 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:37 +0000
Message-Id: <cover.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH 0/5] use new API for Xen page tables
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+CgpUaGlzIHNtYWxsIHNlcmll
cyBpcyBiYXNpY2FsbHkganVzdCByZXdyaXRpbmcgZnVuY3Rpb25zIHVzaW5nIHRoZSBuZXcKQVBJ
IHRvIG1hcCBhbmQgdW5tYXAgUFRFcy4gRWFjaCBwYXRjaCBpcyBpbmRlcGVuZGVudC4KCkFwYXJ0
IGZyb20gbWFwcGluZyBhbmQgdW5tYXBwaW5nIHBhZ2UgdGFibGVzLCBubyBvdGhlciBmdW5jdGlv
bmFsIGNoYW5nZQppbnRlbmRlZC4KCldlaSBMaXUgKDUpOgogIHg4Ni9zaGltOiBtYXAgYW5kIHVu
bWFwIHBhZ2UgdGFibGVzIGluIHJlcGxhY2VfdmFfbWFwcGluZwogIHg4Nl82NC9tbTogbWFwIGFu
ZCB1bm1hcCBwYWdlIHRhYmxlcyBpbiBtMnBfbWFwcGVkCiAgeDg2XzY0L21tOiBtYXAgYW5kIHVu
bWFwIHBhZ2UgdGFibGVzIGluIHNoYXJlX2hvdGFkZF9tMnBfdGFibGUKICB4ODZfNjQvbW06IG1h
cCBhbmQgdW5tYXAgcGFnZSB0YWJsZXMgaW4gZGVzdHJveV9jb21wYXRfbTJwX21hcHBpbmcKICB4
ODZfNjQvbW06IG1hcCBhbmQgdW5tYXAgcGFnZSB0YWJsZXMgaW4gZGVzdHJveV9tMnBfbWFwcGlu
ZwoKIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgIHwgMTAgKysrKy0tLQogeGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggfCAxOCArKysrKysrKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMS5B
TVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
