Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE88337D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 16:03:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv01j-0000dT-VA; Tue, 06 Aug 2019 14:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv01i-0000dO-JH
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 14:01:22 +0000
X-Inumbo-ID: aa604aa0-b852-11e9-85a1-5f5d6e5d1251
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa604aa0-b852-11e9-85a1-5f5d6e5d1251;
 Tue, 06 Aug 2019 14:01:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A9FAAD43;
 Tue,  6 Aug 2019 14:01:19 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190806131346.50881-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83081c57-1979-b531-d0e6-651621fb46d6@suse.com>
Date: Tue, 6 Aug 2019 16:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806131346.50881-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/apic: enable x2APIC mode before doing
 any setup
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxNToxMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgY29k
ZSBjYWxscyBhcGljX3gyYXBpY19wcm9iZSB3aGljaCBkb2VzIHNvbWUgaW5pdGlhbGl6YXRpb24K
PiBhbmQgc2V0dXAgYmVmb3JlIGhhdmluZyBlbmFibGVkIHgyQVBJQyBtb2RlIChpZiBpdCdzIG5v
dCBhbHJlYWR5Cj4gZW5hYmxlZCBieSB0aGUgZmlybXdhcmUpLgo+IAo+IFRoaXMgY2FuIGxlYWQg
dG8gaXNzdWVzIGlmIHRoZSBBUElDIElEIGRvZXNuJ3QgbWF0Y2ggdGhlIHgyQVBJQyBJRCwgYXMK
PiBhcGljX3gyYXBpY19wcm9iZSBjYWxscyBpbml0X2FwaWNfbGRyX3gyYXBpY19jbHVzdGVyIHdo
aWNoIGRlcGVuZGluZwo+IG9uIHRoZSBBUElDIG1vZGUgbWlnaHQgc2V0IGNwdV8yX2xvZ2ljYWxf
YXBpY2lkIHVzaW5nIHRoZSBBUElDIElECj4gaW5zdGVhZCBvZiB0aGUgeDJBUElDIElEIChiZWNh
dXNlIHgyQVBJQyBtaWdodCBub3QgYmUgZW5hYmxlZCB5ZXQpLgo+IAo+IEZpeCB0aGlzIGJ5IGVu
YWJsaW5nIHgyQVBJQyBiZWZvcmUgY2FsbGluZyBhcGljX3gyYXBpY19wcm9iZS4KPiAKPiBBcyBh
IHJlbWFyaywgdGhpcyB3YXMgZGlzY292ZXJlZCB3aGlsZSBJIHdhcyB0cnlpbmcgdG8gZmlndXJl
IG91dCB3aHkKPiBvbmUgb2YgbXkgdGVzdCBib3hlcyBkaWRuJ3QgcmVwb3J0IGFueSBpb21tdSBm
YXVsdHMuIFRoZSByb290IGNhdXNlCj4gd2FzIHRoYXQgdGhlIGlvbW11IE1TSSBhZGRyZXNzIGZp
ZWxkIHdhcyBzZXQgdXNpbmcgdGhlIHN0YWxlIHZhbHVlIGluCj4gY3B1XzJfbG9naWNhbF9hcGlj
aWQsIGFuZCB0aHVzIHRoZSBpb21tdSBmYXVsdCBpbnRlcnJ1cHQgd291bGQgZ2V0Cj4gbG9zdC4g
RXZlbiBpZiB0aGUgTVNJIGFkZHJlc3MgZmllbGQgZ2V0cyBzZXRzIHRvIGEgY29ycmVjdCB2YWx1
ZQo+IGFmdGVyd2FyZHMgYXMgc29vbiBhcyBhIHNpbmdsZSBpb21tdSBmYXVsdCBpcyBwZW5kaW5n
IG5vIGZ1cnRoZXIKPiBpbnRlcnJ1cHRzIHdvdWxkIGdldCBpbmplY3RlZCwgc28gbG9zaW5nIGEg
c2luZ2xlIGlvbW11IGZhdWx0Cj4gaW50ZXJydXB0IGlzIGZhdGFsLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkknbSBzdXJwcmlzZWQgd2UgZ290IGF3
YXkgd2l0aCB0aGlzIGZvciBzbyBsb25nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
