Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D8182E8E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:04:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLc9-0004KE-3G; Thu, 12 Mar 2020 11:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCLc7-0004K9-6R
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 11:02:55 +0000
X-Inumbo-ID: 05cf5da4-6451-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05cf5da4-6451-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584010974;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=V9Vju6fMt5d4DoT93RxkeoK56mDIsfr7hXrZvwHlZqc=;
 b=AyKMBg7vqyfu1grpknlOOhi6xDp6vnNj9XScbqOfiTQQ3WG15nku6b/V
 4pOirShP8dQ9yZXIOq/OnGHdtUfZE5YW+GO+S9JmUfK4zhzcMMBQCLUFt
 AT3eAoM18m1lza+gTi29kiq0wCv+N9lsAZ9K3amGZWIto49C90M+UuwHQ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: msYtKny0ewwu0E6vV6onL43//FpDW5TlGUrB+mUfsKp1ykHcKCzvKhluecN8l6oZXZ5QZiiDpO
 9N2AbReR2mX1Lt6Ydj3ChZ/1hklMWMlKaW7sNuXXz6m8UxdkYKOrtH8lWGcw0IZ0ZKVyoF8I8/
 u2VwisVg76hKEE/2EZg5/KbhLal8B6oVNQXUZK6Q4LRrI9lgkSRud5USzTRfjzGtU6L9M6V+Lu
 BnHgjo7Uecw46Pe0wkAkoS3rLja1yZY3TMmWwGC47zxb4Vrmys4Isun7kRy8q/p1/7zadVdAYZ
 C4A=
X-SBRS: 2.7
X-MesageID: 14460961
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14460961"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.5849.475017.29624@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 11:02:49 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311172010.7777-4-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
 <20200311172010.7777-4-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v5 4/5] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY1IDQvNV0gZXhhbWluZTog
ZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWciKToKPiBJ
bnRyb2R1Y2UgYSBuZXcgdGVzdCB0byBjaGVjayBmb3IgaW9tbXUgYXZhaWxhYmlsaXR5IGFuZCBh
ZGQgaXQgYXMgYQo+IGhvc3RmbGFnIGlmIGZvdW5kLgouLi4KPiArb3VyICRoYXNfaW9tbXUgPSAk
aW5mbyA9fiAvZGlyZWN0aW8vOwoKSSB0aGluayB0aGlzIHJlZ2V4cCBpcyB0b28gbGF4LiAgRm9y
IGV4YW1wbGUsIGlmIHRoZSBYZW4gY29tbWFuZCBsaW5lCmhhZCBzb21ldGhpbmcgbWVudGlvbmlu
ZyBgZGlyZWN0aW8nIGl0IHdvdWxkIGFsd2F5cyBzYXkgYHllcycuLi4KClRoaXMgYXBwZWFycyBp
biB2aXJ0X2NhcHMsIHJpZ2h0ID8gIFNvIEkgdGhpbmsgeW91IHdhbnQKCiAgK291ciAkaGFzX2lv
bW11ID0gJGluZm8gPX4gL152aXJ0X2NhcHNccyo6Lipcc2RpcmVjdGlvXHMvbTsKCm9yIHNvbWUg
c3VjaC4gIChVbnRlc3RlZC4pCgpTb3JyeSBmb3Igb25seSBzcG90dGluZyB0aGlzIG5vdy4gIE90
aGVyd2lzZSB0aGlzIExHVE0uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
