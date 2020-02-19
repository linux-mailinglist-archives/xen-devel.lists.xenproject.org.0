Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F7164FFB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 21:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4W1K-0001oy-EF; Wed, 19 Feb 2020 20:32:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OPzw=4H=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j4W1I-0001om-7W
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 20:32:32 +0000
X-Inumbo-ID: f26bed3c-5356-11ea-8452-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f26bed3c-5356-11ea-8452-12813bfff9fa;
 Wed, 19 Feb 2020 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ghxYQxMUHANtAVscJ5818pADD/qrOSUvx8dogWcVNIA=; b=Obx0lpnCadaFeIm4IIoNKKpsq6
 7fNMei+zVQ6SrR2Pa83m8HKm7WA+c8C3AcYi2LEOsz18WERKBPKU4QPkqyH84NDGhAQ2RLlaQbZcX
 XS0BOTIiIbO4fMb16kko7/27Lxhv1dSfGonabv2hy8x287e6dFPfrSSImA/tTVVZEbk0=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:60560
 helo=localhost.localdomain) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j4W2k-0005p1-5d; Wed, 19 Feb 2020 21:34:02 +0100
From: Sander Eikelenboom <linux@eikelenboom.it>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 21:31:30 +0100
Message-Id: <416169fe34ec346a5edde2c66c4b017871c2a891.1582143896.git.linux@eikelenboom.it>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582143896.git.linux@eikelenboom.it>
References: <cover.1582143896.git.linux@eikelenboom.it>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] tools/xentop: Fix calculation of used
 memory.
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4K
LS0tCiB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0
YXQveGVudG9wL3hlbnRvcC5jIGIvdG9vbHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMKaW5kZXgg
YWYxMWViZmJmNy4uMTNiNjEyZjI2ZCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RhdC94ZW50b3Av
eGVudG9wLmMKKysrIGIvdG9vbHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMKQEAgLTk2OSw3ICs5
NjksNyBAQCB2b2lkIGRvX3N1bW1hcnkodm9pZCkKIAkgICAgICAiJXUgY3Jhc2hlZCwgJXUgZHlp
bmcsICV1IHNodXRkb3duIFxuIiwKIAkgICAgICBudW1fZG9tYWlucywgcnVuLCBibG9jaywgcGF1
c2UsIGNyYXNoLCBkeWluZywgc2h1dGRvd24pOwogCi0JdXNlZCA9IHhlbnN0YXRfbm9kZV90b3Rf
bWVtKGN1cl9ub2RlKTsKKwl1c2VkID0geGVuc3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpLXhl
bnN0YXRfbm9kZV9mcmVlX21lbShjdXJfbm9kZSk7CiAJZnJlZWFibGVfbWIgPSAwOwogCiAJLyog
RHVtcCBub2RlIG1lbW9yeSBhbmQgY3B1IGluZm9ybWF0aW9uICovCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
