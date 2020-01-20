Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B306F1429E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:53:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVaG-0006EI-EV; Mon, 20 Jan 2020 11:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHbP=3J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itVaF-0006Dp-90
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:51:07 +0000
X-Inumbo-ID: 1dc32d9a-3b7b-11ea-b955-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dc32d9a-3b7b-11ea-b955-12813bfff9fa;
 Mon, 20 Jan 2020 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579521055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xX82dM54RT0exEIXPhTGisRpE8iQsLMn53n2N9Z61sg=;
 b=C/Kv6k4ph21V+jmVGKyJAfTCVagPfKMiyeBhnBbYpskunqKpnHY7ymBB
 hYwYCiu3JZxByXyLkjXAYTBNcaOOHRPdHu5Pd30Uq9HlWRIjmBIelhK8b
 JHWMArESA16r2nHzFPziwNvOyS/IBJVXAZk5vdQtGhSRNkRluVFxHXhyU Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YDQWgiWIBK4HvIB/1IfMAtNXEyHr/jDCbYJt3ARR3FsqmUuqrsAjAHkOLCICDN8GXyFAqmhCTa
 I+WHTj312PnkY9EFzqxuKKrBt/kSCRdS52OzczCZ4c6LJyhH68UQdC2gvt6puG5gFYM/4Z7yAb
 LIFq/3ivMQMbNLTbWrHmxUd728bSqrzC0WRiv7Y5AKLocwjg414a6t0lormTcKNdaD52ld/Nzb
 fNGi6AOvNNeu/u0ZLSwUeBBVwT+317kOYmZlIC5Rn/aEOrMN+CHkrP6/87hZ70o0nKxYImhOmr
 FUA=
X-SBRS: 2.7
X-MesageID: 11749491
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11749491"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 Jan 2020 11:50:50 +0000
Message-ID: <20200120115053.1010739-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIucHl0
aG9uMy1kZWZhdWx0LXYxCgpIaSwKCkkgdGhpbmsgaXQncyB0aW1lIGZvciBYZW4gdG8gYnVpbGQg
d2l0aCBweXRob24zIGJ5IGRlZmF1bHQuCgpUaGUgbWFpbiByZWFzb24gZm9yIHRoYXQgaXMgdGhh
dCBRRU1VIHVwc3RyZWFtIGRvbid0IGJ1aWxkIHdpdGggcHl0aG9uIDIueAphbnltb3JlLCBhbmQg
dGhlIHB5dGhvbiBiaW5hcnkgc2VsZWN0ZWQgYnkgWGVuIGJ1aWxkIHN5c3RlbSBpcyB0aGUgb25l
IHVzZWQKd2hlbiBidWlsZGluZyBxZW11LXhlbi4gU28gbm93IG9zc3Rlc3QgZmFpbGVkIHRvIGJ1
aWxkIFFFTVUgdXBzdHJlYW0uCgpBbHNvLCBweXRob24yIGlzIEVPTC4KCkZZSSwgdGhlIGh5cGVy
dmlzb3IgYnVpbGQgc3lzdGVtIGFscmVhZHkgc2VsZWN0IHB5dGhvbjMgYnkgZGVmYXVsdCwgdGhp
cyBjaGFuZ2UKdGhlIHRvb2xzIHNpZGUuCgpDaGVlcnMsCgpBbnRob255IFBFUkFSRCAoMyk6CiAg
YXV0b21hdGlvbjogT25seSBidWlsZCBRRU1VIGlmIFB5dGhvbiA+PSAzLjUKICBhdXRvbWF0aW9u
OiB1cGRhdGluZyBjb250YWluZXIgdG8gaGF2ZSBweXRob24zLWNvbmZpZyBiaW5hcnkKICB0b29s
czogRGVmYXVsdCB0byBweXRob24zCgogYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC1p
Mzg2LmRvY2tlcmZpbGUgIHwgMSArCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRv
Y2tlcmZpbGUgICAgICAgfCAxICsKIGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL3Vuc3RhYmxlLWkz
ODYuZG9ja2VyZmlsZSB8IDEgKwogYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vdW5zdGFibGUuZG9j
a2VyZmlsZSAgICAgIHwgMSArCiBhdXRvbWF0aW9uL2J1aWxkL2ZlZG9yYS8yOS5kb2NrZXJmaWxl
ICAgICAgICAgICAgfCAxICsKIGF1dG9tYXRpb24vYnVpbGQvc3VzZS9vcGVuc3VzZS1sZWFwLmRv
Y2tlcmZpbGUgICB8IDEgKwogYXV0b21hdGlvbi9idWlsZC91YnVudHUvYmlvbmljLmRvY2tlcmZp
bGUgICAgICAgIHwgMSArCiBhdXRvbWF0aW9uL2J1aWxkL3VidW50dS90cnVzdHkuZG9ja2VyZmls
ZSAgICAgICAgfCAxICsKIGF1dG9tYXRpb24vYnVpbGQvdWJ1bnR1L3hlbmlhbC5kb2NrZXJmaWxl
ICAgICAgICB8IDEgKwogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArKy0tCiB0b29scy9jb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
