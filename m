Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B115786F82
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 04:05:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvuEA-0006up-BW; Fri, 09 Aug 2019 02:01:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvuE9-0006ug-0C
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 02:01:57 +0000
X-Inumbo-ID: a8e01734-ba49-11e9-8d8d-235235505607
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e01734-ba49-11e9-8d8d-235235505607;
 Fri, 09 Aug 2019 02:01:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 489743A5;
 Thu,  8 Aug 2019 22:01:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 08 Aug 2019 22:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=2ztVlV+ibL28L5ZFNhBKoRrx061LCercbgzAyeJ66
 Go=; b=j6l3maJjSfnAwosMm1sxYLYEYpfmEjcDy0P58gkNhq5GEEm+LRxqzKoOw
 3zH7PbJzQZraQWoVAoyKLrO5THpZgKbDUos17N5lBFLxfSVhE1FHUBDIcx6UnnCp
 h+Su9CqMpVOBj3rxtytk2Sq7fGP3TNnwyrANJcQMMLGkJ7MP5wYbPW0pd5+ewUcM
 qOlR8jx3rMEd91u5t7FHVpItK2QN0J0qaBtTmEZabYkKiSP45jhlvAixmRrhJM+t
 DlHlVcDmYL+3WYpn9TISwHcF4D/ly+QY4X6gDpoOs93vs9b/uxGtaJNvVl98FB5g
 E1mL04ilttKXdtT3hMDpHi5W8eYeA==
X-ME-Sender: <xms:ENRMXVfyMShX7YoDplLnTzt_eBBbc7qOD-6gtagVvpnpLaK8xTx27A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduiedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtohfgsehtkeertdertdejnecuhfhrohhmpeforghr
 vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeeg
 rdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
 gslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ENRMXaOAIv4ApzdK958p16IclECUee1e4EuuVKX69t4UlrkDBj3dKA>
 <xmx:ENRMXa1080HsebEBi1ZUyb1Hg2EHB7XwwA8bfSmqBOEb0IxoHO_s1Q>
 <xmx:ENRMXV2ydUOweTqThZFojBY8pHkNNtHka4-1grSJjCiwVcCo-H6aZA>
 <xmx:ENRMXRuwiYJ32nB3XONxk_Ul3wA7G4VGDJQeJmB0y7oeToS7Tc5Lzg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8323080061;
 Thu,  8 Aug 2019 22:01:51 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 04:01:37 +0200
Message-Id: <20190809020137.27334-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R0NDOSBjb21wbGFpbnMgYWJvdXQgIiUuMTJzIiBmb3JtYXQgd2l0aCBhbiBhcmd1bWVudCBoYXZp
bmcgZXhhY3RseSAxMgpieXRlcyBhbmQgbm8gdGVybWluYXRpbmcgbnVsbCBjaGFyYWN0ZXIuIFRo
aXMgaXMgaW50ZW50aW9uYWwKY29uc3RydWN0LCBzbyBkaXNhYmxlIHRoZSB3YXJuaW5nLgoKU2ln
bmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPgotLS0KIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy90ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxlIGIvdG9vbHMvdGVzdHMvY3B1
LXBvbGljeS9NYWtlZmlsZQppbmRleCAwN2RkNThmNWMyLi43ZDE3YTQwNzRkIDEwMDY0NAotLS0g
YS90b29scy90ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3RzL2NwdS1w
b2xpY3kvTWFrZWZpbGUKQEAgLTMwLDcgKzMwLDcgQEAgaW5zdGFsbDogYWxsCiAKIC5QSE9OWTog
dW5pbnN0YWxsCiAKLUNGTEFHUyArPSAtV2Vycm9yICQoQ0ZMQUdTX3hlbmluY2x1ZGUpIC1EX19Y
RU5fVE9PTFNfXyAtTzMKK0NGTEFHUyArPSAtV2Vycm9yIC1Xbm8tZm9ybWF0LW92ZXJmbG93ICQo
Q0ZMQUdTX3hlbmluY2x1ZGUpIC1EX19YRU5fVE9PTFNfXyAtTzMKIENGTEFHUyArPSAkKEFQUEVO
RF9DRkxBR1MpCiAKIHZwYXRoICUuYyAuLi8uLi8uLi94ZW4vbGliL3g4NgotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
