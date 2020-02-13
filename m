Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8E15BC4A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:02:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BHP-0005Zg-BC; Thu, 13 Feb 2020 09:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BHN-0005Zb-Vi
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:59:30 +0000
X-Inumbo-ID: 85ba4396-4e47-11ea-b86e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85ba4396-4e47-11ea-b86e-12813bfff9fa;
 Thu, 13 Feb 2020 09:59:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44B5BAAFD;
 Thu, 13 Feb 2020 09:59:27 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
Date: Thu, 13 Feb 2020 10:59:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212164949.56434-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzaW5nIHNjcmF0
Y2hfY3B1bWFzayBpbiBzZW5kX0lQSV9tYWsgaXMgbm90IHNhZmUgYmVjYXVzZSBpdCBjYW4gYmUK
PiBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIFhlbiB3b3VsZCBoYXZl
IHRvIG1ha2Ugc3VyZQo+IGFsbCB0aGUgdXNlcnMgb2YgdGhlIHNjcmF0Y2ggY3B1bWFzayBkaXNh
YmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcKPiBpdC4KPiAKPiBJbnN0ZWFkIGludHJvZHVjZSBh
IG5ldyBjcHVtYXNrIHRvIGJlIHVzZWQgYnkgc2VuZF9JUElfbWFzaywgYW5kCj4gZGlzYWJsZSBp
bnRlcnJ1cHRzIHdoaWxlIHVzaW5nLgoKTXkgZmlyc3QgdGhvdWdodCBoZXJlIHdhczogV2hhdCBh
Ym91dCBOTUkgb3IgI01DIGNvbnRleHQ/IEV2ZW4gaWYKbm90IHVzaW5nIHRoZSBmdW5jdGlvbiB0
b2RheSAod2hpY2ggSSBkaWRuJ3QgY2hlY2spLCB0aGVyZSBzaG91bGRuJ3QKYmUgYSBsYXRlbnQg
aXNzdWUgaW50cm9kdWNlZCBoZXJlIHByZXZlbnRpbmcgdGhlbSBmcm9tIGRvaW5nIHNvIGluCnRo
ZSBmdXR1cmUuIEluc3RlYWQgSSB0aGluayB5b3Ugd2FudCB0byBhbGxvY2F0ZSB0aGUgc2NyYXRj
aCBtYXNrCmR5bmFtaWNhbGx5IChhdCBsZWFzdCBpZiBjYWxsZXIgY29udGV4dCBkb2Vzbid0IGFs
bG93IHVzZSBvZiB0aGUKZ2VuZXJpYyBvbmUpLCBhbmQgc2ltcGx5IHJlZnJhaW4gZnJvbSBjb2Fs
ZXNjaW5nIElQSXMgaWYgdGhpcwphbGxvY2F0aW9ucyBmYWlscy4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
