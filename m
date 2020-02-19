Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A01641FE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 11:25:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4MVZ-0004k9-JQ; Wed, 19 Feb 2020 10:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4MVY-0004jy-3n
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 10:23:08 +0000
X-Inumbo-ID: d140cb5a-5301-11ea-ade5-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d140cb5a-5301-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582107786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DUs9dwyOuj3TrdqXI6kIXeKYv9INbyYweQ19th6kZXI=;
 b=VfZm21NmSceRGIwRmVkaweZUdCyhtVAMUl1ZSR3vNQADGiFH2cXxajFi
 GufRLqEUQ2uXPSeK35Rcw/6FELC8S9EJj/JMlPJ+GLYUw5xSbpZorQJ7R
 vS35R1MKomSp1FH3UevA8fbkUa3CpxWN1IsTCKr+6ndt291V/K4n92pzh M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lRP5XLbDDqV27ECnKQ8fpD4zsxto7i7iRmUM3ROcYQQUgnCAiZViK6A4T9rHOLqObvLpMtTsim
 3jGWxG6o4BxQ1p4QLeiuQ8w+aE2I5Qfv7vFz8GSP3KibNSZtyfWYYxSn/QygHqyEQx7ITApAFk
 szxp64nCzckkJQj4OYpf+G18dAqhk9zqDn5Hg6EqFNjKWdomtb2rgzjhTqj7LIs5KlFPl9bz56
 whu8oN2OjegxTqwRgiNa3ozXwqZbEg3+YvSq5LuVGO761k50ASrZc2GotTyN1qx6yrcKh4tQV2
 asM=
X-SBRS: 2.7
X-MesageID: 13297839
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13297839"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 11:22:53 +0100
Message-ID: <20200219102256.81594-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/3] nvmx: implement support for MSR bitmaps
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpQYXRjaCAjMyBtYWtlcyBzdXJlIHRoZSB4MkFQSUMgTVNSIHJhbmdlIGlzIGFsd2F5
cyB0cmFwcGVkLCBvciBlbHNlIGEKZ3Vlc3Qgd2l0aCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gZW5h
YmxlZCBjb3VsZCBtYW5hZ2UgdG8gYWNjZXNzIHNvbWUgb2YKdGhlIHgyQVBJQyBNU1IgcmVnaXN0
ZXJzIGZyb20gdGhlIGhvc3QuIFByZXZpb3VzIHBhdGNoZXMgYXJlIHByZXBhcmF0b3J5CnBhdGNo
ZXMgaW4gb3JkZXIgdG8gaW1wb3J0IGJpdG1hcF97c2V0L2NsZWFyfS4KClRoYW5rcywgUm9nZXIu
CgpSb2dlciBQYXUgTW9ubmUgKDMpOgogIGFybTogcmVuYW1lIEJJVF97V09SRC9NQVNLL1BFUl9X
T1JEKSB0byBCSVRPUF8qCiAgYml0bWFwOiBpbXBvcnQgYml0bWFwX3tzZXQvY2xlYXJ9IGZyb20g
TGludXggNS41CiAgbnZteDogYWx3YXlzIHRyYXAgYWNjZXNzZXMgdG8geDJBUElDIE1TUnMKCiB4
ZW4vYXJjaC9hcm0vYXJtMzIvbGliL2JpdG9wcy5jICAgICAgICB8IDEwICsrKy0tLS0KIHhlbi9h
cmNoL2FybS9hcm02NC9saWIvYml0b3BzLmMgICAgICAgIHwgMTAgKysrLS0tLQogeGVuL2FyY2gv
YXJtL2FybTY0L2xpYi9maW5kX25leHRfYml0LmMgfCAxMCArKystLS0tCiB4ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMgICAgICAgICAgICB8ICA3ICsrKysrCiB4ZW4vY29tbW9uL2JpdG1hcC5j
ICAgICAgICAgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9p
bmNsdWRlL2FzbS1hcm0vYml0b3BzLmggICAgICAgICAgIHwgMjAgKysrKysrLS0tLS0tLQogeGVu
L2luY2x1ZGUveGVuL2JpdG1hcC5oICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKysrKwogeGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oICAgICAgICAgICAgICAgfCAgMiAr
KwogOCBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
