Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9299C15ADE4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:58:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vGk-0008F9-BC; Wed, 12 Feb 2020 16:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B5jc=4A=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j1vGj-0008F3-Lb
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:53:45 +0000
X-Inumbo-ID: 3aecd408-4db8-11ea-b79d-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aecd408-4db8-11ea-b79d-12813bfff9fa;
 Wed, 12 Feb 2020 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6U3A8SXHKgkEatRQJ8DW+zxe/bq2fkjC+rKM+d5kyY=; b=AZZyyO/6xzZhW69pBpitGAtnyn
 SlAdRhWZ4Lzw9gCJ3Bi5TkSHCu2i7NL56gjjN7Wz0lhDFufdghRfx9xQMjHrKB0mTIBJaT7ERFlqE
 G/icEM/HDQrMege3roFejnOG74ZRdNLNJz1JU0zjSv8FD/DCd6PYSOfcCEX9cY2W0gkQ=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:40180
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j1vIM-0001ZE-DS; Wed, 12 Feb 2020 17:55:26 +0100
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200212164949.56434-1-roger.pau@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <1d26308a-cbe9-8a6c-a4a9-9211c0b165c5@eikelenboom.it>
Date: Wed, 12 Feb 2020 17:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212164949.56434-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
 cpumask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDIvMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IENvbW1pdDoKPiAKPiA1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1Cj4g
eDg2L3NtcDogdXNlIEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3Np
YmxlCj4gCj4gSW50cm9kdWNlZCBhIGJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIGNwdW1hc2s6
IGl0IHdhcyB1c2VkIGluIGEKPiBmdW5jdGlvbiB0aGF0IGNvdWxkIGJlIGNhbGxlZCBmcm9tIGlu
dGVycnVwdCBjb250ZXh0LCBhbmQgaGVuY2UgdXNpbmcKPiB0aGUgc2NyYXRjaCBjcHVtYXNrIHRo
ZXJlIGlzIG5vdCBzYWZlLiBQYXRjaCAjMiBpcyBhIGZpeCBmb3IgdGhhdCB1c2FnZS4KPiAKPiBQ
YXRjaCAjMyBhZGRzIHNvbWUgZGVidWcgaW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSBzdXJlIHRoZSBz
Y3JhdGNoIGNwdW1hc2sKPiBpcyB1c2VkIGluIHRoZSByaWdodCBjb250ZXh0LCBhbmQgaGVuY2Ug
c2hvdWxkIHByZXZlbnQgZnVydGhlciBtaXNzdXNlcy4KPiAKPiBUaGFua3MsIFJvZ2VyLgoKSGkg
Um9nZXIsCgpEbyB5b3Ugc3RpbGwgd2FudCBtZSB0byB0ZXN0IHRoZSAicGFuaWMiIHBhdGNoID8K
T3IgdGVzdCB0aGlzIHNlcmllcyBpbnN0ZWFkID8KCi0tClNhbmRlcgoKCj4gUm9nZXIgUGF1IE1v
bm5lICgzKToKPiAgIHg4Ni9zbXA6IHVuaWZ5IGhlYWRlciBpbmNsdWRlcyBpbiBzbXAuaAo+ICAg
eDg2L3NtcDogdXNlIGEgZGVkaWNhdGVkIHNjcmF0Y2ggY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNr
Cj4gICB4ODY6IGFkZCBhY2Nlc3NvcnMgZm9yIHNjcmF0Y2ggY3B1IG1hc2sKPiAKPiAgeGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYyAgICB8ICA2ICsrKystLQo+ICB4ZW4vYXJjaC94ODYvaXJxLmMgICAg
ICAgIHwgMTMgKysrKysrKysrKy0tLQo+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAg
ICAgfCAgNCArKystCj4gIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgfCAxNCArKysrKysrKysr
KysrLQo+ICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgIHwgMzMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvc21wLmggfCAxNSArKysrKysr
KysrKy0tLS0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
