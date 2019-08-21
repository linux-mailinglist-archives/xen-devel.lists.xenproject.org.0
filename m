Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B25974B3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Ls4-00018w-BP; Wed, 21 Aug 2019 08:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Ls2-000160-8x
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:30 +0000
X-Inumbo-ID: aaa54254-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa54254-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375685; x=1597911685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=M5rYvOQZXykHxCP4uOSw/7RKcONu+wXq+4nVaEqW9/E=;
 b=Pf9dIns4SAz8dq+GZQyFSDMM8XOtNyE/DX748ECdyp1XzbYmsrrDt3XK
 RjoTKmd8suz9ydr5LvCtNPrltxcfq35jj3WIkZGkqFhHcP5jscnTvoGM6
 2kPtAudd5kIGXwpTa6BXCBslTT8GKrFe3E19hBtrbSfsKX1wum+FqYvIg w=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968508"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id C77B1A1CFF; Wed, 21 Aug 2019 08:21:24 +0000 (UTC)
Received: from EX13D03EUA004.ant.amazon.com (10.43.165.93) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:08 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA004.ant.amazon.com (10.43.165.93) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:07 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:06 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:38 +0000
Message-ID: <20190821082056.91090-3-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 02/20] livepatch-gcc: Ignore built_in.o and
 prelink.o object files
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG8gbm90IGNvcHkgb3ZlciB0aGUgYnVpbHRfaW4ubyBhbmQgcHJlbGluay5vIG9iamVjdCBmaWxl
cyB3aGVuIHRoZXkKZ2V0IHJlYnVpbHQgYXMgdGhleSBhcmUgdXNlZCBmb3IgdHJhbnNpZW50IGxp
bmtpbmcgYnkgWGVuJ3MgYnVpbGQKc3lzdGVtLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pv
cmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIFBvaGxhY2sg
PG1wb2hsYWNrQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFBldHJlIEVmdGltZSA8ZXBldHJlQGFt
YXpvbi5jb20+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0
cml4LmNvbT4KLS0tCiBsaXZlcGF0Y2gtZ2NjIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1nY2MgYi9saXZlcGF0Y2gtZ2NjCmlu
ZGV4IDYxN2Y4NjUuLjAxZTRiOGMgMTAwNzU1Ci0tLSBhL2xpdmVwYXRjaC1nY2MKKysrIGIvbGl2
ZXBhdGNoLWdjYwpAQCAtMzUsNiArMzUsOCBAQCBpZiBbWyAiJFRPT0xDSEFJTkNNRCIgPX4gJEdD
Q19SRSBdXSA7IHRoZW4KICAgICAgICAgICAgIHZlcnNpb24ub3xcCiAgICAgICAgICAgICBkZWJ1
Zy5vfFwKICAgICAgICAgICAgICoueGVuLXN5bXMuKi5vfFwKKyAgICAgICAgICAgIGJ1aWx0X2lu
Lm98XAorICAgICAgICAgICAgcHJlbGluay5vfFwKICAgICAgICAgICAgIC4qLm8pCiAgICAgICAg
ICAgICAgICAgYnJlYWsKICAgICAgICAgICAgICAgICA7OwotLSAKMi4xNi41CgoKCgpBbWF6b24g
RGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJs
aW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNo
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkx
NzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
