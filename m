Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532FDF120
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:19:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZQ4-0003vd-MX; Mon, 21 Oct 2019 15:16:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=25w6=YO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMZQ3-0003vQ-9x
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:16:27 +0000
X-Inumbo-ID: bcf6403a-f415-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcf6403a-f415-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571670982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7mqME22IRaVsFXxkFHxb35moB83/z4I+et+xnWwOyaw=;
 b=S7J+QKzqzAIaEvK/V+2aCfkvaC6SptJLbft9IXWtih3ohn5nr7PY6xRg
 2M+FYnEQYMEPhrfAcgsjhPfenIJZh0+iE6cBR/2xWlABWCFk2XN94V5sV
 Y0ILkrBG0J4VVzRmL+Epx/gpgeM7RQg3W7KeWijG4gmmxYIImKmbmoc8L E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ho0HDNtR/wQZ0Hq5YFgByr0fPgLoR/cjnuKBr3Yu4qb2NxTlSGk7bCf90FXDIfWRDPNzSj1/aB
 ZBt661aDuqKcYXjUUvmiOJ8g8Zj6lagPearJF2xGUrYbAzh6nkQp5ncb/lAhKyOtE9PHYNym9Z
 VAYvOFqdVZ56SUihIpuYCjfyDLpNLCCMTqP6CDrlPgIhOJMxL3E6Z1smdTibL6aZvGn3nwF+N6
 kWR2ve5pgkDyYDOaWjJmCHcQHygujAPQRakb/LX71fjcLuUDfSfGIvunDz5gNEojKAFvdfs3hH
 1NI=
X-SBRS: 2.7
X-MesageID: 7298347
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,324,1566878400"; 
   d="scan'208";a="7298347"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:16:15 +0100
Message-ID: <20191021151615.30367-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021151615.30367-1-ian.jackson@eu.citrix.com>
References: <20191021151615.30367-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/3] Toolstack/xl: Wrap a long command
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rvb2xzdGFjay94bC5wbSB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvT3NzdGVzdC9Ub29sc3RhY2sveGwucG0gYi9Pc3N0ZXN0L1Rvb2xzdGFjay94bC5wbQpp
bmRleCBkMzFhZjhjMC4uODU5NzI3NTMgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVG9vbHN0YWNrL3hs
LnBtCisrKyBiL09zc3Rlc3QvVG9vbHN0YWNrL3hsLnBtCkBAIC03OCw3ICs3OCw4IEBAIHN1YiBz
aHV0ZG93bl93YWl0ICgkJCQpIHsKICAgICBteSAkZ24gPSAkZ2hvLT57TmFtZX07CiAgICAgbXkg
JGFjcGlfZmFsbGJhY2sgPSBndWVzdF92YXIoJGdobywnYWNwaV9zaHV0ZG93bicsJ2ZhbHNlJykg
ZXEgJ3RydWUnCiAJJiYgJHNlbGYtPntOYW1lfSBlcSAneGwnID8gIkYiIDogIiI7Ci0gICAgdGFy
Z2V0X2NtZF9yb290KCRobywiJHNlbGYtPntfQ29tbWFuZH0gc2h1dGRvd24gLXcke2FjcGlfZmFs
bGJhY2t9ICRnbiIsICR0aW1lb3V0KTsKKyAgICB0YXJnZXRfY21kX3Jvb3QoJGhvLCIkc2VsZi0+
e19Db21tYW5kfSBzaHV0ZG93biAtdyR7YWNwaV9mYWxsYmFja30gJGduIiwKKwkJICAgICR0aW1l
b3V0KTsKIH0KIAogc3ViIF9jaGVja19mb3JfY29tbWFuZCgkJCkgewotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
