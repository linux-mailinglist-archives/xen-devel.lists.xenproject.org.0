Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8314046E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 08:22:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isLvg-0002PI-2i; Fri, 17 Jan 2020 07:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fsd1=3G=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1isLve-0002PB-AU
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 07:20:26 +0000
X-Inumbo-ID: d46bbb04-38f9-11ea-b89f-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d46bbb04-38f9-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 07:20:25 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1isLvZ-000NNL-UC; Fri, 17 Jan 2020 07:20:21 +0000
Date: Fri, 17 Jan 2020 07:20:21 +0000
From: Tim Deegan <tim@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200117072021.GA89813@deinos.phlegethon.org>
References: <20200116202926.23230-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116202926.23230-1-jandryuk@gmail.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH] x86/shadow: use single (atomic) MOV for
 emulated writes
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTU6MjkgLTA1MDAgb24gMTYgSmFuICgxNTc5MTg4NTY2KSwgSmFzb24gQW5kcnl1ayB3cm90
ZToKPiBUaGlzIGlzIHRoZSBjb3JyZXNwb25kaW5nIGNoYW5nZSB0byB0aGUgc2hhZG93IGNvZGUg
YXMgbWFkZSBieQo+IGJmMDhhOGEwOGEyZSAieDg2L0hWTTogdXNlIHNpbmdsZSAoYXRvbWljKSBN
T1YgZm9yIGFsaWduZWQgZW11bGF0ZWQKPiB3cml0ZXMiIHRvIHRoZSBub24tc2hhZG93IEhWTSBj
b2RlLgo+IAo+IFRoZSBiZjA4YThhMDhhMmUgY29tbWl0IG1lc3NhZ2U6Cj4gVXNpbmcgbWVtY3B5
KCkgbWF5IHJlc3VsdCBpbiBtdWx0aXBsZSBpbmRpdmlkdWFsIGJ5dGUgYWNjZXNzZXMKPiAoZGVw
ZW5kaW5nIGhvdyBtZW1jcHkoKSBpcyBpbXBsZW1lbnRlZCBhbmQgaG93IHRoZSByZXN1bHRpbmcg
aW5zbnMsCj4gZS5nLiBSRVAgTU9WU0IsIGdldCBjYXJyaWVkIG91dCBpbiBoYXJkd2FyZSksIHdo
aWNoIGlzbid0IHdoYXQgd2UKPiB3YW50L25lZWQgZm9yIGNhcnJ5aW5nIG91dCBndWVzdCBpbnNu
cyBhcyBjb3JyZWN0bHkgYXMgcG9zc2libGUuIEZhbGwKPiBiYWNrIHRvIG1lbWNweSgpIG9ubHkg
Zm9yIGFjY2Vzc2VzIG5vdCAyLCA0LCBvciA4IGJ5dGVzIGluIHNpemUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgoKQWNrZWQtYnk6IFRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
