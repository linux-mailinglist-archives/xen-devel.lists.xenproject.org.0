Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1581479C1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 09:54:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuuh1-0005n7-LO; Fri, 24 Jan 2020 08:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuuh0-0005n2-4P
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 08:51:54 +0000
X-Inumbo-ID: bfb1d3b4-3e86-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb1d3b4-3e86-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 08:51:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80FB3ACD9;
 Fri, 24 Jan 2020 08:51:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0b0c6db-7215-bb31-a1eb-722d13c72cdc@suse.com>
Date: Fri, 24 Jan 2020 09:51:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] Arm/p2m: fix build after ea22bcd030da and
 2aa977eb6baa
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBvZiB0aGVzZSBjb21taXRzIGludHJvZHVjZWQgYSBmdW5jdGlvbiBwcm90b3R5cGUgcmVm
ZXJlbmNpbmcgYQpzdHJ1Y3R1cmUgd2hpY2ggaGFkbid0IGF0IGxlYXN0IGJlZW4gZm9yd2FyZCBk
ZWNsYXJlZC4gQWRkIHN1Y2gKZGVjbGFyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3Mu
aAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oCkBAIC01OCw2ICs1OCw3IEBAIHR5
cGVkZWYgZW51bSB7CiAgICAgLyogTk9URTogQXNzdW1lZCB0byBiZSBvbmx5IDQgYml0cyByaWdo
dCBub3cgb24geDg2LiAqLwogfSBwMm1fYWNjZXNzX3Q7CiAKK3N0cnVjdCBwMm1fZG9tYWluOwog
Ym9vbCB4ZW5tZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3MoY29uc3Qgc3RydWN0IHAybV9kb21haW4g
KnAybSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbm1lbV9hY2Nlc3NfdCB4
YWNjZXNzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vzc190ICpw
YWNjZXNzKTsKQEAgLTc5LDYgKzgwLDcgQEAgbG9uZyBwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGko
c3RydWN0IGRvbQogaW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2Zu
X3QgZ2ZuLCBib29sIHN1cHByZXNzX3ZlLAogICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGFsdHAybV9pZHgpOwogCitzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVf
bXVsdGk7CiBpbnQgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHBy
ZXNzX3ZlX211bHRpICpzdXBwcmVzc192ZSk7CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
