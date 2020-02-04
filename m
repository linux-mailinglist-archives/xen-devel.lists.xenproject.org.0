Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8E151D8B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:43:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0Je-00038j-4W; Tue, 04 Feb 2020 15:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz0Jd-00038a-Bu
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:40:41 +0000
X-Inumbo-ID: acf66245-4764-11ea-8f8e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acf66245-4764-11ea-8f8e-12813bfff9fa;
 Tue, 04 Feb 2020 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580830832;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=c4cv5GektQEHKx1O/K6qXujebbYgPr3HEjRyGi5wMuY=;
 b=gMcH7X4amavSbMjMyIIF4uhgRouaIWfchz8T62cT8Qv+vFi4a/ez0vuQ
 CKCdU9AFCZA19haw8gn5LpzLtgL/8r1ARfe2CAwjc9gBYntUblrytVEGT
 a9TqCJfuBkXwK5pAaYmz0bqGTVVQn+hxEWHDm+fMW24kENe+ZO4YMzGR/ 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iVwMFPCNQZNnbmdYpG38MyNPYu7L54CHUKL/5fPfJbjkmrnFUTkV18Niy6Xb0hiW8S/Z2626ho
 hDW2nYf8ERgbjRxxfOH0FBrdYE/PdNoZ4gR9g/z7wvAJYKcJ0rYCfp+AvafMtcps7lUpZPGMq1
 Fb6rHVBt/+s1l/o0Jxb4JiKMptATHQ/U1G6LEl/rsba7Rn8piMSqHRcgckAlu8NFAifTSEeYt7
 LXmElFhIN3Zdi8b50749qDtrOT0f/ioKglv5AJmiu665jeAdW+AvkBpXK6ZGP0+1y3DW5jhEvZ
 7XM=
X-SBRS: 2.7
X-MesageID: 12295794
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12295794"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 15:40:23 +0000
Message-ID: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] PV shim timekeeping fixes
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWdvciBEcnV6aGluaW4gKDIpOgogIHg4Ni9zaGltOiBzdXNwZW5kIGFuZCByZXN1bWUgcGxhdGZv
cm0gdGltZSBjb3JyZWN0bHkKICB4ODYvdGltZTogcmVwb3J0IGNvcnJlY3QgZnJlcXVlbmN5IG9m
IFhlbiBQViBjbG9ja3NvdXJjZQoKIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgfCAgNyArKysrKyst
CiB4ZW4vYXJjaC94ODYvdGltZS5jICAgIHwgMjkgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
