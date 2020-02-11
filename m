Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75111158C09
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:46:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1S5e-0000xV-Qc; Tue, 11 Feb 2020 09:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1S5d-0000xQ-8B
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:44:21 +0000
X-Inumbo-ID: 13bf5aaa-4cb3-11ea-b53d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13bf5aaa-4cb3-11ea-b53d-12813bfff9fa;
 Tue, 11 Feb 2020 09:44:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D58E0AC77;
 Tue, 11 Feb 2020 09:44:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 10:44:18 +0100
Message-Id: <20200211094418.7500-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/sched: remove pointless BUG_ON() in
 credit2
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEJVR19PTigpIGF0IHRoZSB0b3Agb2YgY3NjaGVkMl9jb250ZXh0X3NhdmVkKCkgaXMgY29t
cGxldGVseQpwb2ludGxlc3MsIGFzIHRoZSBBU1NFUlQoKSBqdXN0IGZvbGxvd2luZyBpdCBjYXRj
aGVzIHRoZSBzYW1lIHByb2JsZW0KYWxyZWFkeS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYyB8IDIg
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWQvY3JlZGl0Mi5jIGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMKaW5kZXggYjk2
NWNkMWM3Yi4uN2QxMDRmMTVkMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQy
LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMKQEAgLTIxNjcsOCArMjE2Nyw2IEBA
IGNzY2hlZDJfY29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVj
dCBzY2hlZF91bml0ICp1bml0KQogICAgIHNfdGltZV90IG5vdyA9IE5PVygpOwogICAgIExJU1Rf
SEVBRCh3ZXJlX3BhcmtlZCk7CiAKLSAgICBCVUdfT04oICFpc19pZGxlX3VuaXQodW5pdCkgJiYK
LSAgICAgICAgICAgIHN2Yy0+cnFkICE9IGMycnFkKG9wcywgc2NoZWRfdW5pdF9tYXN0ZXIodW5p
dCkpKTsKICAgICBBU1NFUlQoaXNfaWRsZV91bml0KHVuaXQpIHx8CiAgICAgICAgICAgIHN2Yy0+
cnFkID09IGMycnFkKG9wcywgc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCkpKTsKIAotLSAKMi4xNi40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
