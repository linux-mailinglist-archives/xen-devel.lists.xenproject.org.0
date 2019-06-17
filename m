Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75CD47F76
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:17:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcoeb-0005vR-UY; Mon, 17 Jun 2019 10:14:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hcoeZ-0005vH-Qs
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 10:14:19 +0000
X-Inumbo-ID: a9a245be-90e8-11e9-bd50-9bacdd4da907
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9a245be-90e8-11e9-bd50-9bacdd4da907;
 Mon, 17 Jun 2019 10:14:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4217AE1C;
 Mon, 17 Jun 2019 10:14:15 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-15-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1a4e2fe7-ed2d-05f1-9f2f-f0a940b30151@suse.com>
Date: Mon, 17 Jun 2019 12:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-15-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 14/16] xen/blk: gnttab, evtchn,
 xenbus API changes
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IEZvciB0aGUgbW9zdCBwYXJ0
LCB3ZSBub3cgcGFzcyB4ZW5ob3N0X3QgKiBhcyBhIHBhcmFtZXRlci4KPiAKPiBDby1kZXZlbG9w
ZWQtYnk6IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmt1ciBBcm9yYSA8YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPgoKSSBkb24ndCBz
ZWUgaG93IHRoaXMgY2FuIGJlIGEgcGF0Y2ggb24gaXRzIG93bi4KClRoZSBvbmx5IHdheSB0byBi
ZSBhYmxlIHRvIHVzZSBhIHBhdGNoIGZvciBlYWNoIGRyaXZlciB3b3VsZCBiZSB0bwprZWVwIHRo
ZSBvcmlnaW5hbCBncmFudC0sIGV2ZW50LSBhbmQgeGVuYnVzLWludGVyZmFjZXMgYW5kIGFkZCB0
aGUKbmV3IG9uZXMgdGFraW5nIHhlbmhvc3QgKiB3aXRoIGEgbmV3IG5hbWUuIFRoZSBvcmlnaW5h
bCBpbnRlcmZhY2VzCmNvdWxkIHRoZW4gdXNlIHhlbmhvc3RfZGVmYXVsdCBhbmQgeW91IGNhbiBz
d2l0Y2ggdGhlbSB0byB0aGUgbmV3CmludGVyZmFjZXMgb25lIGJ5IG9uZS4gVGhlIGxhc3QgcGF0
Y2ggY291bGQgdGhlbiByZW1vdmUgdGhlIG9sZAppbnRlcmZhY2VzIHdoZW4gdGhlcmUgaXMgbm8g
dXNlciBsZWZ0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
