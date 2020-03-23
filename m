Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352118F71D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 15:41:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGOE3-0006ZN-U2; Mon, 23 Mar 2020 14:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGOE1-0006ZI-Ue
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 14:38:46 +0000
X-Inumbo-ID: fee8d121-6d13-11ea-82e5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fee8d121-6d13-11ea-82e5-12813bfff9fa;
 Mon, 23 Mar 2020 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584974324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OHliRiXsyIaq5DUzuGyS/5sq16j9Ihv1K0KqdHtb+ew=;
 b=LWmkEFnG4j5EWn17vd3Au7eO+O6UmMvZsd3wzGNZcrsMxFYpfwr0FVPh
 ngnh+Ee3zADZhVvmTVtXGvbgL/BrOVs05r/saEo/zQheliwQH3WR1k4dS
 QGb8svOLxYldk05NUgbGkDHBusPdn+BmvkLZugvqNowmYF5AIS/KvH2o1 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UYxMafzAnhd1up8/x/9ssN+m0OVGKrep5m3JzsXEI1mWoT+vYFdBbQB/l6wTGVz4OMpQ0urB9C
 IZaL+x/2LlPk/YdE6CA+eJYSC+f2YDMV8q28F78RenpPpOOr0qOApb0JRjLKvEN+wvsNZxMLtD
 XOCYn9RAz4a6P2xvzCb6shAAginW349o+TRZVagvm+pIgz1WQU197jU3IyFPZsCgEhmyAHyS0t
 6Pg5oQPs/XcAXCcMNJJt8EjxIsoDk2ia0e98qmO+9KSwYm9luqNE2X/btbJ/8w7TUeFIVIvycn
 d1g=
X-SBRS: 2.7
X-MesageID: 14805250
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14805250"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 15:38:35 +0100
Message-ID: <20200323143835.46117-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST] kernel-build: enable
 XEN_BALLOON_MEMORY_HOTPLUG
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbGxvd3MgYSBQVkgvSFZNIGRvbWFpbiB0byB1c2UgdW5wb3B1bGF0ZWQgbWVtb3J5IHJh
bmdlcyB0byBtYXAKZm9yZWlnbiBtZW1vcnkgb3IgZ3JhbnRzLCBhbmQgaXMgcmVxdWlyZWQgZm9y
IGEgUFZIIGRvbTAgdG8gZnVuY3Rpb24KcHJvcGVybHkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB0cy1rZXJuZWwtYnVpbGQgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3RzLWtlcm5l
bC1idWlsZCBiL3RzLWtlcm5lbC1idWlsZAppbmRleCBjOTc2Mjg5ZS4uODljZGFmY2IgMTAwNzU1
Ci0tLSBhL3RzLWtlcm5lbC1idWlsZAorKysgYi90cy1rZXJuZWwtYnVpbGQKQEAgLTUxMSw2ICs1
MTEsNyBAQCBzZXRvcHQgQ09ORklHX1hFTl9LQkRERVZfRlJPTlRFTkQgeQogc2V0b3B0IENPTkZJ
R19YRU5fRkJERVZfRlJPTlRFTkQgeQogc2V0b3B0IENPTkZJR19YRU5fUENJREVWX0ZST05URU5E
IHkKIHNldG9wdCBDT05GSUdfWEVOX0JBTExPT04geQorc2V0b3B0IENPTkZJR19YRU5fQkFMTE9P
Tl9NRU1PUllfSE9UUExVRyB5CiBzZXRvcHQgQ09ORklHX1hFTl9TQ1JVQl9QQUdFUyB5CiBzZXRv
cHQgQ09ORklHX1hFTl9ERVZfRVZUQ0hOIHkKIHNldG9wdCBDT05GSUdfWEVOX0JBQ0tFTkQgeQot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
