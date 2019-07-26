Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA776E47
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr2Sl-0003J5-I0; Fri, 26 Jul 2019 15:48:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wloi=VX=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hr2Sk-0003Iw-Ap
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:48:54 +0000
X-Inumbo-ID: de5be5c8-afbc-11e9-8980-bc764e045a96
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de5be5c8-afbc-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 15:48:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="369567589"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2019 08:48:51 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 23:43:40 +0800
Message-Id: <20190726154340.2950-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.GIT
Subject: [Xen-devel] [PATCH V3] tools/libxl: Add iothread support for COLO
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
ZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPgotLS0KIHRvb2xzL2xp
YnhsL2xpYnhsX2RtLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggZjRmYzk2NDE1ZC4uNGIwMjlkNmM4ZSAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5j
CkBAIC0xNjM1LDcgKzE2MzUsMTAgQEAgc3RhdGljIGludCBsaWJ4bF9fYnVpbGRfZGV2aWNlX21v
ZGVsX2FyZ3NfbmV3KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICBuaWNz
W2ldLmNvbG9fY29tcGFyZV9ub3RpZnlfZGV2KSB7CiAgICAgICAgICAgICAgICAgICAgICAgICBm
bGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICItb2JqZWN0Iik7CiAgICAgICAgICAgICAgICAgICAg
ICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBHQ1NQUklOVEYoImNvbG8tY29tcGFyZSxpZD1jMSxwcmltYXJ5X2luPSVzLHNlY29uZGFyeV9p
bj0lcyxvdXRkZXY9JXMsbm90aWZ5X2Rldj0lcyIsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICBHQ1NQUklOVEYoImlvdGhyZWFkLGlkPWNvbG8tY29tcGFyZS1pb3RocmVhZC0xIikpOworICAg
ICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW9iamVjdCIp
OworICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCJjb2xvLWNvbXBhcmUsaWQ9YzEscHJp
bWFyeV9pbj0lcyxzZWNvbmRhcnlfaW49JXMsb3V0ZGV2PSVzLG5vdGlmeV9kZXY9JXMsaW90aHJl
YWQ9Y29sby1jb21wYXJlLWlvdGhyZWFkLTEiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX3ByaV9pbiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fY29tcGFyZV9zZWNfaW4sCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmljc1tpXS5jb2xvX2NvbXBhcmVfb3V0LAot
LSAKMi4xNy5HSVQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
