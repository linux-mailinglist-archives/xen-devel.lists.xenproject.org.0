Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E54AE76F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 11:59:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7csO-0004oU-MO; Tue, 10 Sep 2019 09:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7csO-0004oP-1B
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:55:56 +0000
X-Inumbo-ID: 2e08647d-d3b1-11e9-ac1a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e08647d-d3b1-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 09:55:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F047AF80;
 Tue, 10 Sep 2019 09:55:54 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64d52960-28d5-fb23-8892-35c9d4ed9d90@suse.com>
Date: Tue, 10 Sep 2019 11:55:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMjAxOSAxMTo0NiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTAvMDkvMjAx
OSAwMjo0NywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiA5LzkvMTkgNTo0OCBQTSwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBBY3R1YWxseSwgcGNpX21tY2ZnX2xhdGVfaW5pdCgpIHRo
YXQncyBjYWxsZWQgb3V0IG9mIGFjcGlfaW5pdCgpIC0KPj4+IHRoYXQncyB3aGVyZSBNQ0ZHIGFy
ZWFzIGFyZSBwcm9wZXJseSBzaXplZC4gCj4+Cj4+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSByZWFk
cyB0aGUgKHN0YXRpYykgTUNGRywgd2hpY2ggZG9lc24ndCBuZWVkIERTRFQgcGFyc2luZywgZG9l
cyBpdD8gc2V0dXBfbWNmZ19tYXAoKSBPVE9IIGRvZXMgbmVlZCBpdCBhcyBpdCB1c2VzIGRhdGEg
ZnJvbSBfQ0JBIChvciBpcyBpdCBfQ1JTPyksIGFuZCBJIHRoaW5rIHRoYXQncyB3aHkgd2UgY2Fu
J3QgcGFyc2UgTUNGRyBwcmlvciB0byBhY3BpX2luaXQoKS4gU28gd2hhdCBJIHNhaWQgYWJvdmUg
aW5kZWVkIHdvbid0IHdvcmsuCj4+Cj4gCj4gTm8sIGl0IHVzZXMgaXNfYWNwaV9yZXNlcnZlZCgp
IChpdCdzIGNhbGxlZCBpbmRpcmVjdGx5IHNvIG1pZ2h0IGJlIHdlbGwKPiBoaWRkZW4pIHRvIHBh
cnNlIERTRFQgdG8gZmluZCBhIHJlc2VydmVkIHJlc291cmNlIGluIGl0IGFuZCBzaXplIE1DRkcK
PiBhcmVhIGFjY29yZGluZ2x5LiBzZXR1cF9tY2ZnX21hcCgpIGlzIGNhbGxlZCBmb3IgZXZlcnkg
cm9vdCBidXMKPiBkaXNjb3ZlcmVkIGFuZCBpbmRlZWQgdHJpZXMgdG8gZXZhbHVhdGUgX0NCQSBi
dXQgYXQgdGhpcyBwb2ludAo+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSBoYXMgYWxyZWFkeSBmaW5p
c2hlZCBNQ0ZHIHJlZ2lzdHJhdGlvbiBmb3IgZXZlcnkKPiBjb2xkLXBsdWdnZWQgYnVzICh3aGlj
aCBpbmZvcm1hdGlvbiBpcyBkZXNjcmliZWQgaW4gTUNGRyB0YWJsZSkgc28gdGhvc2UKPiBjYWxs
cyBhcmUgZHVtbXkuCgpJIGRvbid0IHRoaW5rIHRoZXkncmUgc3RyaWN0bHkgZHVtbXkuIEV2ZW4g
Zm9yIGJvb3QgdGltZSBhdmFpbGFibGUgZGV2aWNlcwppaXJjIHRoZXJlJ3Mgbm8gc3RyaWN0IHJl
cXVpcmVtZW50IGZvciB0aGVyZSB0byBiZSByZXNwZWN0aXZlIGRhdGEgaW4gTUNGRy4KU3VjaCBh
IHJlcXVpcmVtZW50IGV4aXN0cyBvbmx5IGZvciBkZXZpY2VzIHdoaWNoIGFyZSBhY3R1YWxseSBu
ZWVkZWQgdG8Kc3RhcnQgdGhlIE9TIChkaXNrIG9yIG5ldHdvcmssIHBlcmhhcHMgdmlkZW8gb3Ig
YWxpa2UpLCBvciBtYXliZSBldmVuIGp1c3QKaXRzIGxvYWRlci4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
