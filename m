Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2A18439A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:26:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgXn-0002Mv-Rl; Fri, 13 Mar 2020 09:23:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgXm-0002Lz-By
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:23:50 +0000
X-Inumbo-ID: 58ee01d2-650c-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58ee01d2-650c-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 09:23:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C91C0B0BA;
 Fri, 13 Mar 2020 09:23:48 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Date: Fri, 13 Mar 2020 10:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/4] x86: reduce errors in frequency
 calculations / unrelated cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgbG9va2luZyBpbnRvIHdheXMgdG8gaW5jcmVhc2UgdGhlIGFjY3VyYWN5IG9mIHRoZSBj
bG9jayBzcGVlZHMKd2Ugd29yayB3aXRoIChpbiBwYXJ0aWN1bGFyIGJ5IHBvc3NpYmx5IG9idGFp
bmluZyBpbmZvcm1hdGlvbiBmcm9tCmhhcmR3YXJlIHJhdGhlciB0aGFuIG1lYXN1cmluZyksIEkg
Zmlyc3Qgb2YgYWxsIG5vdGljZWQgc29tZQphdm9pZGFibGUgcm91bmRpbmcgZXJyb3JzIGluIHNv
bWUgb2Ygb3VyIGNhbGN1bGF0aW9ucy4gVGhhdCdzIHdoYXQKcGF0Y2hlcyAyIGFuZCAzIGFyZSBp
bnRlbmRlZCB0byBkZWFsIHdpdGguIFBhdGNoIDEgaXMgcHJlcGFyYXRvcnkKY2xlYW51cCwgd2hp
bGUgcGF0Y2ggNCBzaW1wbHkgYWRkcmVzc2VzIHNvbWV0aGluZyBJIGdvdCBhbm5veWVkIGJ5Cnll
dCBhbm90aGVyIHRpbWUgd2hpbGUgZG9pbmcgdGhpcyBpbnZlc3RpZ2F0aW9uLgoKMTogQVBJQzog
YWRqdXN0IHR5cGVzIGFuZCBjb21tZW50cyBpbiBjYWxpYnJhdGVfQVBJQ19jbG9jaygpCjI6IHRp
bWU6IHJlZHVjZSByb3VuZGluZyBlcnJvcnMgaW4gY2FsY3VsYXRpb25zCjM6IEFQSUM6IHJlZHVj
ZSByb3VuZGluZyBlcnJvcnMgaW4gY2FsY3VsYXRpb25zCjQ6IEFQSUM6IHJlc3RyaWN0IGNlcnRh
aW4gbWVzc2FnZXMgdG8gQlNQCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
