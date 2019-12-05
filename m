Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E450113C72
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 08:36:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iclaW-0006Vj-FQ; Thu, 05 Dec 2019 07:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iclaV-0006Vd-30
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 07:30:11 +0000
X-Inumbo-ID: 1125e7b2-1731-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1125e7b2-1731-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 07:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EC69B247;
 Thu,  5 Dec 2019 07:30:09 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Message-ID: <4d783acc-35be-1b6d-00c7-f1ce88abdbcc@suse.com>
Date: Thu, 5 Dec 2019 08:30:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/3] lz4: refine commit 9143a6c55ef7 for the
 64-bit case
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jeremi Piotrowski <jeremi.piotrowski@gmail.com>,
 Mark Pryor <pryorm09@gmail.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBjbGVhcmx5IHdlbnQgdG9vIGZhciB0aGVyZTogV2hpbGUgdGhlIExaNF9XSUxEQ09QWSgpIGlu
c3RhbmNlcyBpbmRlZWQKbmVlZCBwcmlvciBndWFyZGluZywgTFo0X1NFQ1VSRUNPUFkoKSBuZWVk
cyB0aGlzIG9ubHkgaW4gdGhlIDMyLWJpdCBjYXNlCih3aGVyZSBpdCBzaW1wbHkgYWxpYXNlcyBM
WjRfV0lMRENPUFkoKSkuICJjcHkiIGNhbiB2YWxpZGx5IHBvaW50CihzbGlnaHRseSkgYmVsb3cg
Im9wIiBpbiB0aGVzZSBjYXNlcywgZHVlIHRvCgoJCWNweSA9IG9wICsgbGVuZ3RoIC0gKFNURVBT
SVpFIC0gNCk7Cgp3aGVyZSBsZW5ndGggY2FuIGJlIGFzIGxvdyBhcyAwIGFuZCBTVEVQU0laRSBp
cyA4LiBIb3dldmVyLCBpbnN0ZWFkIG9mCnJlbW92aW5nIHRoZSBjaGVjayB2aWEgIiNpZiAhTFo0
X0FSQ0g2NCIsIHJlZmluZSBpdCBzdWNoIHRoYXQgaXQgd291bGQKYWxzbyBwcm9wZXJseSB3b3Jr
IGluIHRoZSA2NC1iaXQgY2FzZSwgYWJvcnRpbmcgZGVjb21wcmVzc2lvbiBpbnN0ZWFkCm9mIGNv
bnRpbnVpbmcgb24gYm9ndXMgaW5wdXQuCgpSZXBvcnRlZC1ieTogTWFyayBQcnlvciA8cHJ5b3Jt
MDlAZ21haWwuY29tPgpSZXBvcnRlZC1ieTogSmVyZW1pIFBpb3Ryb3dza2kgPGplcmVtaS5waW90
cm93c2tpQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpUZXN0ZWQtYnk6IE1hcmsgUHJ5b3IgPHByeW9ybTA5QGdtYWlsLmNvbT4KCi0tLSBh
L3hlbi9jb21tb24vbHo0L2RlY29tcHJlc3MuYworKysgYi94ZW4vY29tbW9uL2x6NC9kZWNvbXBy
ZXNzLmMKQEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0aWMgaW50IElOSVQgbHo0X3VuY29tcHJlc3Mo
Y29uc3QgdW5zCiAJCQkJZ290byBfb3V0cHV0X2Vycm9yOwogCQkJY29udGludWU7CiAJCX0KLQkJ
aWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNweSA8ICh1bnNpZ25lZCBsb25nKW9wKSkKKwkJ
aWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNweSA8ICh1bnNpZ25lZCBsb25nKW9wIC0gKFNU
RVBTSVpFIC0gNCkpKQogCQkJZ290byBfb3V0cHV0X2Vycm9yOwogCQlMWjRfU0VDVVJFQ09QWShy
ZWYsIG9wLCBjcHkpOwogCQlvcCA9IGNweTsgLyogY29ycmVjdGlvbiAqLwpAQCAtMjc5LDcgKzI3
OSw3IEBAIHN0YXRpYyBpbnQgbHo0X3VuY29tcHJlc3NfdW5rbm93bm91dHB1dHMKIAkJCQlnb3Rv
IF9vdXRwdXRfZXJyb3I7CiAJCQljb250aW51ZTsKIAkJfQotCQlpZiAodW5saWtlbHkoKHVuc2ln
bmVkIGxvbmcpY3B5IDwgKHVuc2lnbmVkIGxvbmcpb3ApKQorCQlpZiAodW5saWtlbHkoKHVuc2ln
bmVkIGxvbmcpY3B5IDwgKHVuc2lnbmVkIGxvbmcpb3AgLSAoU1RFUFNJWkUgLSA0KSkpCiAJCQln
b3RvIF9vdXRwdXRfZXJyb3I7CiAJCUxaNF9TRUNVUkVDT1BZKHJlZiwgb3AsIGNweSk7CiAJCW9w
ID0gY3B5OyAvKiBjb3JyZWN0aW9uICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
