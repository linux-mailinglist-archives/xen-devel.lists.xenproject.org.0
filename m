Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633F84A59
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:07:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJkV-0008El-Om; Wed, 07 Aug 2019 11:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvJkU-0008Eg-DE
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 11:04:54 +0000
X-Inumbo-ID: 2e66f988-b903-11e9-84bf-1f595918deac
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e66f988-b903-11e9-84bf-1f595918deac;
 Wed, 07 Aug 2019 11:04:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F465AD3A;
 Wed,  7 Aug 2019 11:04:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 13:04:49 +0200
Message-Id: <20190807110449.2947-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix memory leak in credit2
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

Y3NjaGVkMl9kZWluaXQoKSBpcyBsZWFraW5nIHRoZSBydW4tcXVldWUgbWVtb3J5LgoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24v
c2NoZWRfY3JlZGl0Mi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIGIveGVuL2NvbW1vbi9zY2hl
ZF9jcmVkaXQyLmMKaW5kZXggNmZmZjIxMGNhNi4uNmI3N2RhNzQ3NiAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMK
QEAgLTQwNzAsNiArNDA3MCw4IEBAIGNzY2hlZDJfZGVpbml0KHN0cnVjdCBzY2hlZHVsZXIgKm9w
cykKIAogICAgIHBydiA9IGNzY2hlZDJfcHJpdihvcHMpOwogICAgIG9wcy0+c2NoZWRfZGF0YSA9
IE5VTEw7CisgICAgaWYgKCBwcnYgKQorICAgICAgICB4ZnJlZShwcnYtPnJxZCk7CiAgICAgeGZy
ZWUocHJ2KTsKIH0KIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
