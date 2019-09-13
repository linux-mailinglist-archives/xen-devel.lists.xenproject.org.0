Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBDB17E7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 07:49:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8eOG-0006NX-If; Fri, 13 Sep 2019 05:45:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8eOE-0006NS-V6
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 05:45:02 +0000
X-Inumbo-ID: a02d977c-d5e9-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a02d977c-d5e9-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 05:45:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3797AEE3;
 Fri, 13 Sep 2019 05:44:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2019 07:44:35 +0200
Message-Id: <20190913054435.3662-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: fix arm build with debugtrace configured
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIG1pc3NpbmcgI2luY2x1ZGVzLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vZGVidWd0cmFjZS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGVidWd0
cmFjZS5jIGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKaW5kZXggNWQyMmQ0MzFhZC4uNzMxM2U4
OTM4OSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKKysrIGIveGVuL2NvbW1v
bi9kZWJ1Z3RyYWNlLmMKQEAgLTExLDcgKzExLDkgQEAKICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxl
ci5oPgogI2luY2x1ZGUgPHhlbi9saWIuaD4KICNpbmNsdWRlIDx4ZW4vbW0uaD4KKyNpbmNsdWRl
IDx4ZW4vcGVyY3B1Lmg+CiAjaW5jbHVkZSA8eGVuL3NlcmlhbC5oPgorI2luY2x1ZGUgPHhlbi9z
bXAuaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KICNpbmNsdWRlIDx4ZW4vd2F0Y2hkb2cu
aD4KIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
