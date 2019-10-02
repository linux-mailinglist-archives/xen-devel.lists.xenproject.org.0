Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA23C4B68
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:28:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbpE-0004MM-RZ; Wed, 02 Oct 2019 10:25:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFbpD-0004MH-Le
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:25:39 +0000
X-Inumbo-ID: fa4e69e2-e4fe-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id fa4e69e2-e4fe-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 10:25:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0EB5AEC2;
 Wed,  2 Oct 2019 10:25:37 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad5d3685-f2f8-28d4-d8e6-a985988061cd@suse.com>
Date: Wed, 2 Oct 2019 12:25:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/crash: force unlock console
 before printing on kexec crash
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAyMToxNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhlcmUgaXMgYSBz
bWFsbCB3aW5kb3cgd2hlcmUgc2hvb3Rkb3duIE5NSSBtaWdodCBjb21lIHRvIGEgQ1BVCj4gKGUu
Zy4gaW4gc2VyaWFsIGludGVycnVwdCBoYW5kbGVyKSB3aGVyZSBjb25zb2xlIGxvY2sgaXMgdGFr
ZW4uIEluIG9yZGVyCj4gbm90IHRvIGxlYXZlIGZvbGxvd2luZyBjb25zb2xlIHByaW50cyB3YWl0
aW5nIGluZmluaXRlbHkgZm9yIHNob3QgZG93bgo+IENQVXMgdG8gZnJlZSB0aGUgbG9jayAtIGZv
cmNlIHVubG9jayB0aGUgY29uc29sZS4KPiAKPiBUaGUgcmFjZSBoYXMgYmVlbiBmcmVxdWVudGx5
IG9ic2VydmVkIHdoaWxlIGNyYXNoaW5nIG5lc3RlZCBYZW4gaW4KPiBhbiBIVk0gZG9tYWluLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXgu
Y29tPgoKVGhpcyBzaG91bGQgaGF2ZSBiZWVuIENjLWVkIHRvIErDvHJnZW4gKG5vdyBkb25lKSwg
Zm9yIGhpbSB0byByZWxlYXNlLWFjawppdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
