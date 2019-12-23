Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06C1298DE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:46:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQnu-0006HT-Ue; Mon, 23 Dec 2019 16:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5yK=2N=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijQnt-0006HO-Un
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:43:33 +0000
X-Inumbo-ID: 5ac53911-25a3-11ea-96fe-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ac53911-25a3-11ea-96fe-12813bfff9fa;
 Mon, 23 Dec 2019 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577119413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gCLQDvh907qsvyt8royqQPmp9aNWJXIzgVTll6Vvu8A=;
 b=KhBusuqY1ZUENS7ay0LVJ0v7xqWpTy5YPqAvwZABa/LKQ49X/2jvxeRg
 hoTK+RtpuLMcuCsdYZqexHhzmYUQ8eUKUal+P/cekBJe1oxSqRyk/YMs9
 f546fAWrVfHK3OKFhZxuMDIS7EwUaZH5Pt7jij30UXbABR+mL8FQd3n0s Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rtT38IwSNVro8rQ7Oj2kHQ0ftH/IHpdEbKGacbZpbGBv02wx0EnYL5iI6gPMLvlII9uETsRU8B
 V9KYMZOpNe8NqV0eZdvc4GKZCUat4y9eewYXxPlYtYACNyTCA22QrMdMmzcNPlAF7xc4Ab6yub
 506s9qXyMctmfJZ5xLbD1Zq+mLeZ+c1o6sxRiB+ePYkCs+UDstZGZYIaplP0Lnw9SoanRpZjV6
 7Y2Kb55HcVn1hkJNvmW33XHRR8F/zel9GiNjAPNvnBjYxM7wlAEc35rOTRa2sD2lt9IBj7Qohh
 P8Q=
X-SBRS: 2.7
X-MesageID: 10229657
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,348,1571716800"; d="scan'208";a="10229657"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 16:43:25 +0000
Message-ID: <20191223164329.3113378-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86: Remove force-invalidate loop from
 relinqusish_memory
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCAoNCk6CiAgeGVuOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZSBmcm9t
IHRpbWUuYwogIHhlbjogQWRkICdzeW50aGV0aWMnIHByZWVtcHRpb24gY2hlY2sgcGFyYW1ldGVy
CiAgbW06IFVzZSBwdXRfb2xkX2d1ZXN0X3RhYmxlIGZvciByZWxpbnF1aXNoX3BhZ2VzCiAgeDg2
L21tOiBSZW1vdmUgZm9yY2UtaW52YWxpZGF0ZSBsb29wCgogZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jIHwgIDIwICsrKystCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAg
ICAgfCAxMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvdGlt
ZS5jICAgICAgICAgICAgICAgfCAgNDEgKysrKysrLS0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVk
LmggICAgICAgICAgIHwgIDEwICsrLQogNCBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCsp
LCAxMTcgZGVsZXRpb25zKC0pCgpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tCjIuMjQuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
