Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05010D7A0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahon-0006Mi-Mb; Fri, 29 Nov 2019 15:04:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahom-0006ME-Mu
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:24 +0000
X-Inumbo-ID: 859588c2-12b9-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 859588c2-12b9-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=QO0n959M/0vi8GxakepwU+9j9+cS6rvZvRylMqyf/hs=;
 b=cbC0yUnQnsPRKpJN9RTrmU8eenxDhjUZLAQgedh7+/AgYsbG02afYlo9
 /P+8tV0/YhPasqUUYhyOUrmRuP71KdxvyybFbabKxlcQzGcsm/UVR7S31
 bGEym7iLpHDyokadAYkSx2jHEqVS8p05J+lseNCh4LgalvCERLuiAITV4 o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jqj9+ZjTy48w0VBsVFwczTGkC9eeAT6PRKYdJJ3m7C6tHcP7OchnQZulot0RQ/AzkGmPBJpIa4
 JzuHulE9Fi3VzTXzIMx/YWEtbeAM/73foq0SgdQ7RRqEsfMqgKYbTHHBYoYJJOTFI6bUdMbF5j
 u4Nb6ekIoGgtIKTXc7Ig2Gh3s4wiaqoTh/3jp+NUpKh/4xUYW5c1ko/UvrkvEFkyfFSvI/7cuT
 zq4CoLv5bCL+hHQoF9QIMK0TtaKY/UCtUX4CnK6wJcCRervxMTzCOkYHdnuD/NqllBA0vEV4cb
 S2o=
X-SBRS: 2.7
X-MesageID: 8994770
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8994770"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:08 +0000
Message-ID: <20191129150416.4944-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/9] branching checklist: drop some hg tag runes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugbm8gbG9uZ2VyIHVzZSBoZwoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQogZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1jaGVja2xpc3Qu
dHh0IHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQgYi9kb2NzL3Byb2Nlc3MvYnJh
bmNoaW5nLWNoZWNrbGlzdC50eHQKaW5kZXggNWEwMmQyMTk2OC4uNGNkYTMzNjU2ZCAxMDA2NDQK
LS0tIGEvZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1jaGVja2xpc3QudHh0CisrKyBiL2RvY3MvcHJv
Y2Vzcy9icmFuY2hpbmctY2hlY2tsaXN0LnR4dApAQCAtMSwxMCArMSw2IEBACiB2PTQuMQogb3Y9
NC4wCiAKLSMjKiB0YWcgYnJhbmNocG9pbnQKLSMjICAgICAgICBoZyB0YWcgJHYuMC1icmFuY2hl
ZAotIyMgICAgICAgIGhnIHNpZ24gLWsgJ1hlbiB0cmVlJyA0LjEuMC1icmFuY2hlZAotCiAqIG1h
a2UgYnJhbmNoIGluIHFlbXUtaXdqLmdpdAogICAgICAgICBnaXQtYnJhbmNoICR2LXRlc3Rpbmcg
bWFzdGVyCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
