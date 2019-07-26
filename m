Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCE76F2D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 18:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr399-0007dR-FK; Fri, 26 Jul 2019 16:32:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wloi=VX=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hr397-0007dL-Lq
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 16:32:41 +0000
X-Inumbo-ID: fbcccc48-afc2-11e9-8980-bc764e045a96
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbcccc48-afc2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 16:32:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 09:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198421323"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 09:32:37 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Date: Sat, 27 Jul 2019 00:27:23 +0800
Message-Id: <20190726162723.7443-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
Subject: [Xen-devel] [PATCH V4] tools/libxl: Add iothread support for COLO
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+CgpYZW4gQ09MTyBhbmQgS1ZN
IENPTE8gc2hhcmVkIGxvdHMgb2YgY29kZSBpbiBRZW11LgpUaGUgY29sby1jb21wYXJlIG9iamVj
dCBpbiBRZW11IG5vdyByZXF1aXJlcyBhbiAnaW90aHJlYWQnIHByb3BlcnR5IHNpbmNlIFFFTVUg
Mi4xMS4KCkRldGFpbDoKaHR0cHM6Ly93aWtpLnFlbXUub3JnL0ZlYXR1cmVzL0NPTE8KClNpZ25l
ZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGli
eGwvbGlieGxfZG0uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGY0ZmM5NjQxNWQuLjgzOWM1YWMyY2QgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwpA
QCAtMTYzNCw4ICsxNjM0LDEwIEBAIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RldmljZV9tb2Rl
bF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgbmljc1tp
XS5jb2xvX2NvbXBhcmVfb3V0ICYmCiAgICAgICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNv
bG9fY29tcGFyZV9ub3RpZnlfZGV2KSB7CiAgICAgICAgICAgICAgICAgICAgICAgICBmbGV4YXJy
YXlfYXBwZW5kKGRtX2FyZ3MsICItb2JqZWN0Iik7CisgICAgICAgICAgICAgICAgICAgICAgICBm
bGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICJpb3RocmVhZCxpZD1jb2xvLWNvbXBhcmUtaW90aHJl
YWQtMSIpOworICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdz
LCAiLW9iamVjdCIpOwogICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChk
bV9hcmdzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCJjb2xvLWNvbXBh
cmUsaWQ9YzEscHJpbWFyeV9pbj0lcyxzZWNvbmRhcnlfaW49JXMsb3V0ZGV2PSVzLG5vdGlmeV9k
ZXY9JXMiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCJjb2xvLWNvbXBh
cmUsaWQ9YzEscHJpbWFyeV9pbj0lcyxzZWNvbmRhcnlfaW49JXMsb3V0ZGV2PSVzLG5vdGlmeV9k
ZXY9JXMsaW90aHJlYWQ9Y29sby1jb21wYXJlLWlvdGhyZWFkLTEiLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX3ByaV9pbiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fY29tcGFyZV9zZWNf
aW4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmljc1tpXS5jb2xvX2Nv
bXBhcmVfb3V0LAotLSAKMi4xNy5HSVQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
