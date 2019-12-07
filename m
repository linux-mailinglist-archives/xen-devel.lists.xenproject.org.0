Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8A115B49
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 07:03:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idT75-0000TD-Du; Sat, 07 Dec 2019 05:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1idT73-0000T8-Mf
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 05:58:41 +0000
X-Inumbo-ID: 9c8cd9a6-18b6-11ea-84d3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c8cd9a6-18b6-11ea-84d3-12813bfff9fa;
 Sat, 07 Dec 2019 05:58:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33847B1FB;
 Sat,  7 Dec 2019 05:58:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <525316a4-6600-6daa-62d2-4a115b5143af@suse.com>
Date: Sat, 7 Dec 2019 06:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] lz4: misc fixes / adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMDg6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IDE6IHJlZmluZSBjb21taXQg
OTE0M2E2YzU1ZWY3IGZvciB0aGUgNjQtYml0IGNhc2UKPiAyOiBwdWxsIG91dCBjb25zdGFudCB0
YWJsZXMKPiAzOiBmaXggc3lzdGVtIGhhbHQgYXQgYm9vdCBrZXJuZWwgb24geDg2XzY0Cj4gCj4g
T25seSBwYXRjaCAxIGlzIHN0cmljdGx5IG1lYW50IHRvIGJlIGNvbnNpZGVyZWQgZm9yIDQuMTMs
IGFsYmVpdAo+IHBhdGNoIDMgZml4ZXMgYSBzaW1pbGFyIHByb2JsZW0gKGJ1dCBub25lIHdoaWNo
IHdvdWxkIGhhdmUgYmVlbgo+IHJlcG9ydGVkIHNvIGZhcikuIFBhdGNoZXMgMiBhbmQgMyBhcmUg
cG9ydHMgb2YgKGEgY291cGxlIG9mCj4geWVhcnMgb2xkKSBMaW51eCBjb21taXRzLgo+IAo+IEph
bgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
