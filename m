Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F86EACAC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 10:41:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ6t3-0001lI-Hy; Thu, 31 Oct 2019 09:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqky=YY=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iQ6t1-0001lD-JG
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 09:36:59 +0000
X-Inumbo-ID: fb2989da-fbc1-11e9-beca-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb2989da-fbc1-11e9-beca-bc764e2007e4;
 Thu, 31 Oct 2019 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V8vC3ADn1mMulGlRQ3caZu3kxlFQTiJut2d3e5xizRk=; b=ELF3Z4+Gwo0ZCHWsy8shgmppwF
 3Icnfh4agF+cthBUImNu7/rwEtRSUMJW6sfT4Lo5ITG4ZwxBGChNzO0c03NBLm6v6NTMXMeR3GbQW
 To1+NhAY4pEY0PvGXFVnvL3RM5LuQAkYhw9/fy16yPhnebGYHBeEid2pHYoAPJev6Ys0=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:19453
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iQ6tm-0004LZ-82; Thu, 31 Oct 2019 10:37:46 +0100
To: Jan Beulich <jbeulich@suse.com>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <bd51711f-ab49-3638-dbb2-1806e6ef3632@suse.com>
 <52be608a-24f9-0c67-e5e7-41029ec5a071@eikelenboom.it>
 <6496a36e-f6be-c4e6-e6a4-f21d8eda2dc2@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <33b964b2-294d-a687-6d13-48ced7a40fbf@eikelenboom.it>
Date: Thu, 31 Oct 2019 10:36:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6496a36e-f6be-c4e6-e6a4-f21d8eda2dc2@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMTAvMjAxOSAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzEuMTAuMjAxOSAw
OTozNSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBQbGF0Zm9ybSBpcyBwZXJoYXBzIHdo
YXQgc3BlY2lmaWMgKG9sZGVyIEFNRCA4OTBGWCBjaGlwc2V0KSBhbmQgSSBuZWVkIHRoZSBiaW9z
IHdvcmthcm91bmQ6Cj4+IGl2cnNfaW9hcGljWzZdPTAwOjE0LjAgaW9tbXU9b24uCj4gCj4gU2hv
dWxkbid0IG1hdHRlciBoZXJlLgo+IAo+PiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhpcyBoYXMgcmFu
IGxpa2UgdGhpcyBmb3IgcXVpdGUgc29tZSB0aW1lLgo+Pgo+PiBJIGhhdmUgMyBndWVzdHMgKEhW
TSkgZm9yIHdoaWNoIGkgdXNlIFBDSSBwYXNzdGhyb3VnaCBhbmQgCj4+IGZvciBlYWNoIG9mIHRo
b3NlIDMgZ3Vlc3RzIEkgZ2V0IHRoaXMgbWVzc2FnZSAqb25jZSogb24gc3RhcnQgb2YgdGhlIGd1
ZXN0Lgo+PiAJT25lIGd1ZXN0IGhhcyBhIHNvdW5kY2FyZCBwYXNzZWQgdGhyb3VnaCwKPj4gCU9u
ZSBndWVzdCBoYXMgYSBVU0IyIGNhcmQgcGFzc2VkIHRocm91Z2gsCj4+IAlPbmUgZ3Vlc3QgaGFz
IGEgVVNCMyBjYXJkIHBhc3NlZCB0aHJvdWdoLgo+Pgo+PiBBbm90aGVyIG9ic2VydmF0aW9uIGlz
IHRoYXQgYm90aCB0aGUgc291bmRjYXJkIGFuZCBVU0IyIGNhcmQKPj4gc3RpbGwgc2VlbSB0byBm
dW5jdGlvbiBkZXNwaXRlIHRoZSBtZXNzYWdlLgo+IAo+IFJlYWxpdHkgaXMgLSB0aGlzIG1lc3Nh
Z2UgaXMgYmVuaWduIGFzIGxvbmcgYXMgeW91IGRvbid0IGRvIFBDSQo+IGhvdCAodW4pcGx1Zy4K
CkkgZG9uJ3QgdXNlIGFueSBvZjoKIHBjaS1hdHRhY2gKIHBjaS1kZXRhY2gKIHBjaS1saXN0CiBw
Y2ktYXNzaWduYWJsZS1hZGQKIHBjaS1hc3NpZ25hYmxlLXJlbW92ZQogcGNpLWFzc2lnbmFibGUt
bGlzdAoKT25seSBzaHV0dGluZyBkb3duIGFuZCAocmUpc3RhcnRpbmcgVk1zIHdpdGggdGhlIGRl
dmljZXMgc3BlY2lmaWVkIGluCnRoZSB2bSBjZmcgZmlsZS4KCj4+IFRoZSBVU0IzIGNvbnRyb2xs
ZXIgZ29lcyBoYXl3aXJlIHRob3VnaCAoYSBsb3Qgb2YgZHJpdmVyIG1lc3NhZ2VzIGluIHRoZSBn
dWVzdCBkdXJpbmcgaW5pdCkuCj4gCj4gQXMgYSBjb25zZXF1ZW5jZSBJIGRvbid0IHRoaW5rIHRo
ZXJlJ3MgYSBjb25uZWN0aW9uIGJldHdlZW4gdGhpcwo+IGFuZCB0aGUgb2JzZXJ2ZWQgbWVzc2Fn
ZS4KCk9rLCBhbHRob3VnaCBpdCBmdW5jdGlvbnMgZmluZSB3aGVuICh3aXRoIHNhbWUga2VybmVs
IGV0Yy4gcmV2ZXJ0aW5nIHRvCnRoZSBjb21taXQgSSByZWZlcmVuY2VkIHRvIGJlbG93KSwgaWYg
c28sIHRoYXQgd291bGQgYmUgYW5vdGhlciBpc3N1ZSB0aGVuLgoKQ0MnZWQgSnVlcmdlbiBhcyBy
ZWxlYXNlIG1hbmFnZXIgc28gaGUgaXMgYXdhcmUuCgo+PiBJIGNvdWxkIHRyeSB0byBiaXNlY3Qs
IGJ1dCB0aGF0IHdvdWxkIGJlIHNvbWV3aGVyZSBuZXh0IHdlZWsgYmVmb3JlIEkgY2FuIGdldCB0
byB0aGF0Lgo+Pgo+PiBBdCBwcmVzZW50IEkgcnVuIHdpdGggYSB0cmVlIHdpdGggYXMgbGF0ZXN0
IGNvbW1pdCBlZTcxNzA4MjJmMWZjMjA5ZjMzZmViNDdiMjY4YmFiMzU1NDEzNTFkLAo+PiB3aGlj
aCBpcyBzdGFibGUgZm9yIG1lLiBUaGlzIHByZWRhdGVzIHNvbWUgb2YgdGhlIElPTU1VIGNoYW5n
ZXMgYW5kIEFudGhvbnkncyBRTVAgd29yayB0aGF0IGhhZAo+PiBzb21lIGlzc3VlcywgYnV0IHRo
YXQgd291bGQgYmUgdGhlIGxhc3Qga25vd24gcmVhbCBnb29kIHBvaW50IGZvciBtZSB0byBzdGFy
dCBhIGJpc2VjdCBmcm9tLgo+IAo+IEkuZS4gYXQgdGhhdCBwb2ludCB5b3UgZGlkbid0IG9ic2Vy
dmUgdGhpcyBtZXNzYWdlLCB5ZXQ/CgpXaXRoIGVlNzE3MDgyMmYxZmMyMDlmMzNmZWI0N2IyNjhi
YWIzNTU0MTM1MWQsIG5vciB0aGlzIG1lc3NhZ2UsIG5vciB0aGUKIklOVkFMSURfREVWX1JFUVVF
U1QiLCBldmVuIHdpdGggbG9uZ2VyIHVwdGltZXMuCgotLQpTYW5kZXIKCj4gSmFuCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
