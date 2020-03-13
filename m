Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E218499B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 15:40:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jClRv-0000bV-V6; Fri, 13 Mar 2020 14:38:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jClRt-0000bE-Ut
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 14:38:05 +0000
X-Inumbo-ID: 3c16e427-6538-11ea-b31a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c16e427-6538-11ea-b31a-12813bfff9fa;
 Fri, 13 Mar 2020 14:37:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B653AAC8F;
 Fri, 13 Mar 2020 14:37:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 15:37:53 +0100
Message-Id: <20200313143755.31870-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/2] xen/locks: fix preempt disabling in lock
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
LgoKQ2hhbmdlcyBpbiBWMjoKLSBtb3ZlIHRoZSBwcmVlbXB0X1tkaXN8ZW5dYWJsZSgpIGNhbGxz
CgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ZW4vcndsb2NrczogY2FsbCBwcmVlbXB0X2Rpc2FibGUo
KSB3aGVuIHRha2luZyBhIHJ3bG9jawogIHhlbi9zcGlubG9ja3M6IGZpeCBwbGFjZW1lbnQgb2Yg
cHJlZW1wdF9bZGlzfGVuXWFibGUoKQoKIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICB8ICA5ICsr
KysrKy0tLQogeGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIHwgMTggKysrKysrKysrKysrKysrKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLSAK
Mi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
