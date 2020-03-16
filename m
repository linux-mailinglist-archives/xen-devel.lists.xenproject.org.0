Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C0187553
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 23:05:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDxos-0003NQ-Cq; Mon, 16 Mar 2020 22:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGMv=5B=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jDxoq-0003NL-Rf
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 22:02:44 +0000
X-Inumbo-ID: dc4cd5fe-67d1-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc4cd5fe-67d1-11ea-bec1-bc764e2007e4;
 Mon, 16 Mar 2020 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584396164;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jKTki/G31UgKCX3Ft68R9/5dtTW8zSw+vNR/w36mdgU=;
 b=Biji4/TEvlg2fCcI7mRY5Xe+y4zgHW+hFg9RBcPznuLQkc7fMelZ0pOr
 X1AsWo4HUrUZFZMwwtXp/JVlMNIrytlxQS/c+Dw7bfafg2q0gvYiYwq0r
 aHw/pYFHAjxlGmnh8XNKS3KIJAg/UvSSb/ycXxGoKa4IkDzTGVxM4Nxsh 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BlFOV5vJ8qEcsLaYJOuj9ixCzxEf226coyAHx3FRCQQJ8zlqWHdiTROqBZIWgBLtA38uChzpXk
 lQmCa87TtMTNYVpdn3sBsU1miThd6SR1ZuuZ9wLAAg6bix+q6xSFuvTZxbiXQHaxwy3+AB04op
 oIyZkxafzyi/i0HCvxcszNe8LACRapVSjwmA4kRYgrwccaDAqOQSkaGwmFSditcLbzjuVEJ+nC
 xbfQkfRy4qCrETqJ5eXY5ZMbMLyxFfuQRjWGdnOpo5+Vd9AKbOT2Cu2Zv1suf9rZWOzDabRMHo
 vjw=
X-SBRS: 2.7
X-MesageID: 14069301
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,561,1574139600"; d="scan'208";a="14069301"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 16 Mar 2020 21:47:44 +0000
Message-ID: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/shim: fix ballooning up the guest
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YXJncy5wcmVlbXB0ZWQgYXMgbWVhbmluZ2xlc3MgaGVyZSBhbmQgZG9lc24ndCBzaG93IGlmIHRo
ZSBoeXBlcmNhbGwKd2FzIHByZWVtcHRlZCBiZWZvcmUuIFVzZSBzdGFydF9leHRlbnQgaW5zdGVh
ZCB3aGljaCBpcyBjb3JyZWN0LgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3Iu
ZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQpUaGlzIGZpeGVzIGJhbGxvb25pbmcgZm9yIDY0LWJp
dCBQViBndWVzdHMgaW5zaWRlIHNoaW0uIDMyLWJpdCBQViBndWVzdHMKcmVxdWlyZSBhIGxpdHRs
ZSBiaXQgbW9yZSB3b3JrIGR1ZSB0byBjb21wYXQgbGF5ZXIgYmVpbmcgaW52b2x2ZWQuCi0tLQog
eGVuL2NvbW1vbi9tZW1vcnkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbWVtb3J5LmMgYi94ZW4v
Y29tbW9uL21lbW9yeS5jCmluZGV4IDQ0NGMwODEuLjVmZGQyYTIgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYwpAQCAtMTE5MSw3ICsxMTkx
LDcgQEAgbG9uZyBkb19tZW1vcnlfb3AodW5zaWduZWQgbG9uZyBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnKQogICAgICAgICB9CiAKICNpZmRlZiBDT05GSUdfWDg2Ci0gICAg
ICAgIGlmICggcHZfc2hpbSAmJiBvcCAhPSBYRU5NRU1fZGVjcmVhc2VfcmVzZXJ2YXRpb24gJiYg
IWFyZ3MucHJlZW1wdGVkICkKKyAgICAgICAgaWYgKCBwdl9zaGltICYmIG9wICE9IFhFTk1FTV9k
ZWNyZWFzZV9yZXNlcnZhdGlvbiAmJiAhc3RhcnRfZXh0ZW50ICkKICAgICAgICAgICAgIC8qIEF2
b2lkIGNhbGxpbmcgcHZfc2hpbV9vbmxpbmVfbWVtb3J5IHdoZW4gcHJlZW1wdGVkLiAqLwogICAg
ICAgICAgICAgcHZfc2hpbV9vbmxpbmVfbWVtb3J5KGFyZ3MubnJfZXh0ZW50cywgYXJncy5leHRl
bnRfb3JkZXIpOwogI2VuZGlmCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
