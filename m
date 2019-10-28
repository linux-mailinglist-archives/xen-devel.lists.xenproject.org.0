Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8AE6FCC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 11:41:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP2QT-0000El-4j; Mon, 28 Oct 2019 10:39:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP2QR-0000Ee-Gv
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 10:39:03 +0000
X-Inumbo-ID: 2751e674-f96f-11e9-94f2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2751e674-f96f-11e9-94f2-12813bfff9fa;
 Mon, 28 Oct 2019 10:39:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50137B362;
 Mon, 28 Oct 2019 10:39:00 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34360e24-ce6b-73d1-87b5-5105643236f0@suse.com>
Date: Mon, 28 Oct 2019 11:38:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxMTozMiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IEhpIEphbiAv
IEFuZHJldywKPiAKPiBXaGlsZSB0ZXN0aW5nIHRoZSBsYXRlc3QgeGVuLXVuc3RhYmxlIGFuZCBz
dGFydGluZyBhbiBIVk0gZ3Vlc3Qgd2l0aCBwY2ktcGFzc3Ryb3VnaCBvbiBteSBBTUQgbWFjaGlu
ZSwKPiBteSBleWUgY2F0Y2hlZCB0aGUgZm9sbG93aW5nIG1lc3NhZ2VzIGluIHhsIGRtZXNnIEkg
aGF2ZW4ndCBzZWVuIGJlZm9yZToKPiAKPiAoWEVOKSBbMjAxOS0xMC0yOCAxMDoyMzoxNi4zNzJd
IEFNRC1WaTogdXBkYXRlX3BhZ2luZ19tb2RlIFRyeSB0byBhY2Nlc3MgcGRldl9saXN0IHdpdGhv
dXQgYXF1aXJpbmcgcGNpZGV2c19sb2NrLgo+IChYRU4pIFsyMDE5LTEwLTI4IDEwOjI0OjA4LjEz
Nl0gQU1ELVZpOiBJTlZBTElEX0RFVl9SRVFVRVNUIDAwMDAwODAwIDhhMDAwMDAwIGY4MDAwMjQw
IDAwMDAwMGZkCj4gCj4gUHJvYmFibHkgc29tZXRoaW5nIGZyb20gdGhlIEFNRCBpb21tdSByZXdv
cmsgdGhhdCBnb3QgY29tbWl0dGVkIGxhdGVseSA/CgpOb3QgdmVyeSBsaWtlbHkgYXQgbGVhc3Qg
Zm9yIHRoZSBmb3JtZXI7IEknbGwgaGF2ZSB0byBsb29rIGF0IHRoZQpsYXR0ZXIgaW4gc29tZSBt
b3JlIGRldGFpbCAoYW5kIGF0IGJvdGggdG8gc2VlIHdoZXRoZXIgSSBjYW4gc3BvdAphIHNlbnNp
YmxlIHNvbHV0aW9uKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
