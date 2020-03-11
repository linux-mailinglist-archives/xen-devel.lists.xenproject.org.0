Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B571F18204B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 19:02:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC5e2-0006OG-Hf; Wed, 11 Mar 2020 17:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC5e1-0006Nw-56
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:59:49 +0000
X-Inumbo-ID: 1894c0c6-63c2-11ea-b033-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1894c0c6-63c2-11ea-b033-12813bfff9fa;
 Wed, 11 Mar 2020 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583949588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t6R2nss5ZLUNpMi0AXFABe76V0zKFlMSSkhI0Zvxtfk=;
 b=XWyj2bsnJ+3FekTPdtWdWGVepE0/t1d3pPfkWp6wSM/YmyTZdGn0eFK6
 asNK+PgP9WCpa5k9qAi55q+s9XVAeYWWIPTH8Z+RKilJN6vYL7kZRHGPI
 uQCQko+tb4/n+l6wMYrzYcAc3XwU0avHOrDOHOc7dx8dEXW7/xjPqBuu+ g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1ASL0vVIy1P8Rh9RSOmUSsVWOi7O840Xbhe1Q2NkB+OlbA/3EK6d9n17VXKQp3Y//B59T6Wcef
 bzCdxDglHvjS4ZWIt7S0L1sv/Jgh7bNDwJ6FvufoXipNLSkDMzRD+74CGPadxZbX2oDuhj026F
 e2GtjhdMxCDUf8jYjZ7B52sMLw4kMG74L5LTLFz2h+Hw9OqQysHcTrlz9UEZntwIRz2gQjJckS
 i/wNDGyIljK7cBC7ddwsKcE8nFiBfN7IdEOFD5EHBik7Iw56SnNmdvKbohG4Ikal6J4JOuvRJr
 RcQ=
X-SBRS: 2.7
X-MesageID: 13977291
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13977291"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:59:31 +0000
Message-ID: <20200311175933.1362235-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 0/2] Fix installation of python scripts
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4
LXB5dGhvbi1pbnN0YWxsLXYxCgpIaSwKCkEgcGF0Y2ggdG8gbWFrZSBwYWNrYWdpbmcgb2YgeGVu
IG9uIGNlbnRvczggZWFzaWVyLiBycG1idWlsZApwcmV2ZW50cyB1bnZlcnNpb25zIHB5dGhvbiBz
aGViYW5nIGZyb20gYmVlbiBwYWNrYWdlZC4KQW5kIHRoZSBmaXJzdCBwYXRjaCBmaXggYSBidWcg
ZGlzY292ZXJlZCB3aXRoIHRoZSBzZWNvbmQuCgpDaGVlcnMsCgpBbnRob255IFBFUkFSRCAoMik6
CiAgdG9vbHMvcHl0aG9uOiBGaXggaW5zdGFsbC13cmFwCiAgdG9vbHM6IFVzZSBJTlNUQUxMX1BZ
VEhPTl9QUk9HCgogdG9vbHMvbWlzYy94ZW5jb3Zfc3BsaXQgICB8IDIgKy0KIHRvb2xzL3B5dGhv
bi9NYWtlZmlsZSAgICAgfCA0ICsrLS0KIHRvb2xzL3B5dGhvbi9pbnN0YWxsLXdyYXAgfCAyICst
CiB0b29scy94ZW5tb24vTWFrZWZpbGUgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
