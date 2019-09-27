Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1EEBFFB4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkGl-0004ny-2S; Fri, 27 Sep 2019 07:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkGi-0004jN-6z
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:02:20 +0000
X-Inumbo-ID: 93fa860c-e0f4-11e9-966c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 93fa860c-e0f4-11e9-966c-12813bfff9fa;
 Fri, 27 Sep 2019 07:01:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60F05B17F;
 Fri, 27 Sep 2019 07:01:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:37 +0200
Message-Id: <20190927070050.12405-34-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 33/46] xen/sched: add a percpu resource index
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

QWRkIGEgcGVyY3B1IHZhcmlhYmxlIGhvbGRpbmcgdGhlIGluZGV4IG9mIHRoZSBjcHUgaW4gdGhl
IGN1cnJlbnQKc2NoZWRfcmVzb3VyY2Ugc3RydWN0dXJlLiBUaGlzIGluZGV4IGlzIHVzZWQgdG8g
Z2V0IHRoZSBjb3JyZWN0IHZjcHUKb2YgYSBzY2hlZF91bml0IG9uIGEgc3BlY2lmaWMgY3B1LgoK
Rm9yIG5vdyB0aGlzIGluZGV4IHdpbGwgYmUgemVybyBmb3IgYWxsIGNwdXMsIGJ1dCB3aXRoIGNv
cmUgc2NoZWR1bGluZwppdCB3aWxsIGJlIHBvc3NpYmxlIHRvIGhhdmUgaGlnaGVyIHZhbHVlcywg
dG9vLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
UkZDIFYyOiBuZXcgcGF0Y2ggKGNhcnZlZCBvdXQgZnJvbSBSRkMgVjEgcGF0Y2ggNDkpClY0Ogot
IG1ha2UgZnVuY3Rpb24gcGFyYW1ldGVyIGNvbnN0IChKYW4gQmV1bGljaCkKLS0tCiB4ZW4vY29t
bW9uL3NjaGVkdWxlLmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggYjExYTFjMjUzOC4uZjc5Y2QyYTVhNiAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1
bGUuYwpAQCAtNzUsNiArNzUsNyBAQCBzdGF0aWMgdm9pZCBwb2xsX3RpbWVyX2ZuKHZvaWQgKmRh
dGEpOwogLyogVGhpcyBpcyBnbG9iYWwgZm9yIG5vdyBzbyB0aGF0IHByaXZhdGUgaW1wbGVtZW50
YXRpb25zIGNhbiByZWFjaCBpdCAqLwogREVGSU5FX1BFUl9DUFUoc3RydWN0IHNjaGVkdWxlciAq
LCBzY2hlZHVsZXIpOwogREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IHNjaGVkX3Jl
c291cmNlICosIHNjaGVkX3Jlcyk7CitzdGF0aWMgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFko
dW5zaWduZWQgaW50LCBzY2hlZF9yZXNfaWR4KTsKIAogLyogU2NyYXRjaCBzcGFjZSBmb3IgY3B1
bWFza3MuICovCiBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3QsIGNwdW1hc2tfc2NyYXRjaCk7CkBA
IC0xNDIsNiArMTQzLDEyIEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWR1bGVyIHNjaGVkX2lkbGVfb3Bz
ID0gewogICAgIC5zd2l0Y2hfc2NoZWQgICA9IHNjaGVkX2lkbGVfc3dpdGNoX3NjaGVkLAogfTsK
IAorc3RhdGljIGlubGluZSBzdHJ1Y3QgdmNwdSAqc2NoZWRfdW5pdDJ2Y3B1X2NwdShjb25zdCBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdSkKK3sKKyAgICByZXR1cm4gdW5pdC0+ZG9t
YWluLT52Y3B1W3VuaXQtPnVuaXRfaWQgKyBwZXJfY3B1KHNjaGVkX3Jlc19pZHgsIGNwdSldOwor
fQorCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBzY2hlZHVsZXIgKmRvbV9zY2hlZHVsZXIoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBpZiAoIGxpa2VseShkLT5jcHVwb29sICE9IE5VTEwp
ICkKQEAgLTIwMjgsNyArMjAzNSw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCiAK
ICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsKIAotICAgIHNjaGVkX2Nv
bnRleHRfc3dpdGNoKHZwcmV2LCBuZXh0LT52Y3B1X2xpc3QsIG5vdyk7CisgICAgc2NoZWRfY29u
dGV4dF9zd2l0Y2godnByZXYsIHNjaGVkX3VuaXQydmNwdV9jcHUobmV4dCwgY3B1KSwgbm93KTsK
IH0KIAogLyoKQEAgLTIwODksNyArMjA5Niw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQp
CiAKICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsKIAotICAgIHZuZXh0
ID0gbmV4dC0+dmNwdV9saXN0OworICAgIHZuZXh0ID0gc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0
LCBjcHUpOwogICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCB2bmV4dCwgbm93KTsKIH0K
IAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
