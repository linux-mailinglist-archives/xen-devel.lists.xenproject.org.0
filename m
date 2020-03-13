Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7B18423B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:09:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfJr-0002Nf-5D; Fri, 13 Mar 2020 08:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCfJq-0002NU-29
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:05:22 +0000
X-Inumbo-ID: 621a35d8-6501-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 621a35d8-6501-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 08:05:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C702AAC24;
 Fri, 13 Mar 2020 08:05:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 09:05:15 +0100
Message-Id: <20200313080517.28728-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/2] xen/locks: fix preempt disabling in lock
 handling
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuJ3Mgcndsb2NrcyBkb24ndCBkaXNhYmxlIHByZWVtcHRpb24gYXQgYWxsLCB3aGlsZSBzcGlu
bG9ja3MgYXJlCmRvaW5nIGl0IG9ubHkgYWZ0ZXIgb2J0YWluaW5nIHRoZSBsb2NrLgoKV2hpbGUg
bm90IHJlYWxseSBjcml0aWNhbCwgaXQgaXMgd3JvbmcuCgpUaGlzIHNlcmllcyBmaXhlcyB0aGF0
LgoKSnVlcmdlbiBHcm9zcyAoMik6CiAgeGVuL3J3bG9ja3M6IGNhbGwgcHJlZW1wdF9kaXNhYmxl
KCkgd2hlbiB0YWtpbmcgYSByd2xvY2sKICB4ZW4vc3BpbmxvY2tzOiBmaXggcGxhY2VtZW50IG9m
IHByZWVtcHRfW2Rpc3xlbl1hYmxlKCkKCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgICAgfCAgOSAr
KysrKystLS0KIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDE4ICsrKysrKysrKysrKysrKysr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
