Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A8108B44
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 10:59:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZB62-0000y2-It; Mon, 25 Nov 2019 09:55:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZB60-0000xw-HU
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 09:55:52 +0000
X-Inumbo-ID: c2bfabc2-0f69-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2bfabc2-0f69-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 09:55:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77A48AC2C;
 Mon, 25 Nov 2019 09:55:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
Date: Mon, 25 Nov 2019 10:55:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dXBkYXRlX3BhZ2luZ19tb2RlKCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUg
aW52b2tlZCB3aXRoCnRoZSBQQ0kgZGV2aWNlcyBsb2NrIGhlbGQuIFRoZSBjaGVjayBvY2N1cnJp
bmcgb25seSB3aGVuIHRoZSBtb2RlCmFjdHVhbGx5IG5lZWRzIHVwZGF0aW5nLCB0aGUgdmlvbGF0
aW9uIG9mIHRoaXMgcnVsZSBieSB0aGUgbWFqb3JpdHkKb2YgY2FsbGVycyBkaWQgZ28gdW5ub3Rp
Y2VkIHVudGlsIHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKdG8gZG8gYXdheSB3
aXRoIG9uLWRlbWFuZCBjcmVhdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcy4KClVuZm9ydHVuYXRl
bHkgdGhlIG9ubHkgaGFsZiB3YXkgcmVhc29uYWJsZSBmaXggdG8gdGhpcyB0aGF0IEkgY291bGQK
Y29tZSB1cCB3aXRoIHJlcXVpcmVzIG1vcmUgcmUtd29yayB0aGFuIHdvdWxkIHNlZW0gZGVzaXJh
YmxlIGF0IHRoaXMKdGltZSBvZiB0aGUgcmVsZWFzZSBwcm9jZXNzLCBidXQgYWRkcmVzc2luZyB0
aGUgaXNzdWUgc2VlbXMKdW5hdm9pZGFibGUgdG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24gaXMg
YSByZWdyZXNzaW9uIGZyb20gdGhlCklPTU1VIHBhZ2UgdGFibGUgc2V0dXAgcmUtd29yay4gVGhl
IGNoYW5nZSBhbHNvIGlzbid0IHdpdGhvdXQgcmlzawpvZiBmdXJ0aGVyIHJlZ3Jlc3Npb25zIC0g
aWYgaW4gcGF0Y2ggMiBJJ3ZlIG1pc3NlZCBhIGNvZGUgcGF0aCB0aGF0CndvdWxkIGFsc28gbmVl
ZCB0byBpbnZva2UgdGhlIG5ldyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBub24tCndvcmtp
bmcgZ3Vlc3RzICh3aXRoIHBhc3NlZC10aHJvdWdoIGRldmljZXMgb24gQU1EIGhhcmR3YXJlKS4K
CjE6IGludHJvZHVjZSBHRk4gbm90aWZpY2F0aW9uIGZvciB0cmFuc2xhdGVkIGRvbWFpbnMKMjog
QU1EL0lPTU1VOiB1c2Ugbm90aWZ5X2RmbigpIGhvb2sgdG8gdXBkYXRlIHBhZ2luZyBtb2RlCjM6
IGdudHRhYjogZG9uJ3QgZXhwb3NlIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyB3aXRob3V0IG5lZWQK
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
