Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345C115514
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:24:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGLe-0002eC-B5; Fri, 06 Dec 2019 16:20:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y5Gr=Z4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idGLc-0002e7-VZ
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:20:52 +0000
X-Inumbo-ID: 5eebc3a4-1844-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eebc3a4-1844-11ea-a1e1-bc764e2007e4;
 Fri, 06 Dec 2019 16:20:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so7906198wmi.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2019 08:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXQo3Uad7DoPwnXzWz0PheBF8EwESnQlzHynmMGRgzQ=;
 b=c+fRnkiUw606zkaRv4g7JmxoNl249uOSQotNIL/HTxjJ8kYwlBxAxMxzgO1o6zA4Za
 YkgGfOE5q420qRMKohynlN4XywQYFDX2VrT0GPaQF0DEB1cOFI4tqevqG+MIuysmR+ze
 Fa3jej1NOuYxQDbNn6lMI/mPdnCFxHgVkgX529p89U/X5XPbF+63+le+wszoPagvKkrR
 K/mbFOoTWmNcI3wNP6h++ELMFuAgU7uGiGPvhXBemL0X210GxHWyJ3BvpTpC+0MOcw6N
 uhG2ig2x8ABDVZ1rpCTBtH6JdoH/mHt25t9unMmbWqHY/URb+QAC2MbGsUltf9lZbU8I
 fZww==
X-Gm-Message-State: APjAAAXoo8b5xYqmHxdvcALmiqvYPVPMbP7lO85v75fU/kw62bZLvqvY
 35e9nxKAdS2OQFVea9RK04c=
X-Google-Smtp-Source: APXvYqw1LyksGP5jTYcs1qviud0D23Ag5DwmCqxWizD5qML5M8SrXnX2xcm4GK3VzDrsnXDY0jqAmg==
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr10583125wmp.109.1575649251371; 
 Fri, 06 Dec 2019 08:20:51 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id m8sm3999319wmf.8.2019.12.06.08.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 08:20:50 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
 <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
Date: Fri, 6 Dec 2019 16:20:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8xMi8yMDE5IDE2OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNi4xMi4y
MDE5IDE1OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDA1LzEyLzIwMTkgMTY6NTAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDUuMTIuMjAxOSAxNzoyNywgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4+IE9uIDA1LzEyLzIwMTkgMTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAr
LyoKPj4+Pj4gKyAqIFN0cmluZyBjb21wYXJpc29uIGZ1bmN0aW9ucyBtb3N0bHkgbWF0Y2hpbmcg
c3RyY21wKCkgLyBzdHJuY21wKCksCj4+Pj4+ICsgKiBleGNlcHQgdGhhdCB0aGV5IHRyZWF0ICct
JyBhbmQgJ18nIGFzIG1hdGNoaW5nIG9uZSBhbm90aGVyLgo+Pj4+PiArICovCj4+Pj4+ICtzdGF0
aWMgaW50IF9zdHJjbXAoY29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQo+Pj4+Cj4+Pj4g
SSB0aG91Z2h0IHdlIHdlcmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBmdW5jdGlvbiBuYW1lIHdpdGgg
bGVhZGluZyBfPwo+Pj4KPj4+IFdlJ3JlIHRyeWluZyB0byBhdm9pZCBuZXcgbmFtZSBzcGFjZSB2
aW9sYXRpb25zLiBTdWNoIGFyZQo+Pj4gLSBpZGVudGlmaWVycyBzdGFydGluZyB3aXRoIHR3byB1
bmRlcnNjb3JlcywKPj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNjb3Jl
IGFuZCBhbiB1cHBlciBjYXNlIGxldHRlciwKPj4+IC0gaWRlbnRpZmllcnMgb2Ygbm9uLXN0YXRp
YyBzeW1ib2xzIHN0YXJ0aW5nIHdpdGggYW4gdW5kZXJzY29yZS4KPj4KPj4gSSBhbSBub3Qgc3Vy
ZSB0byB1bmRlcnN0YW5kIHdoeSBub24tc3RhdGljIHN5bWJvbHMgb25seS4gVGhpcyB3b3VsZAo+
PiBwcmV2ZW50IHlvdSB0byB1c2UgdGhlIHRoZSBub24tc3RhdGljIHN5bWJvbCBpZiB5b3UgaGFw
cGVuIHRvIHJlLXVzZSB0aGUKPj4gc2FtZSBuYW1lLgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCB1
bmRlcnN0YW5kLiBBbnl3YXkgLSB3aGF0IEkndmUgbGlzdGVkIGFib3ZlIGlzCj4gd2hhdCB0aGUg
bGFuZ3VhZ2Ugc3RhbmRhcmQgbWFuZGF0ZXMuCkFGQUlVLCBmb3IgYSBnaXZlbiB1bml0LCB0aGVy
ZSBpcyBvbmx5IG9uZSBwb29sIG9mIGlkZW50aWZpZXJzLiBTbyB5b3UgCmNvdWxkIG5vdCBoYXZl
IGFuIGlkZW50aWZpZXIgdXNlZCBhdCB0aGUgc2FtZSB0aW1lIGJ5IGEgbm9uLXN0YXRpYyBhbmQg
YSAKc3RhdGljIHN5bWJvbCAodGhhdCdzIGV4Y2x1c2luZyB0aGUgd2VhayBhdHRyaWJ1dGUpLiBT
byBpdCBmZWVscyAKc2xpZ2h0bHkgc3RyYW5nZSB0byBvbmx5IGNvdmVyIHRoZSBub24tc3RhdGlj
IHN5bWJvbHMuCgo+PiBBbnl3YXksIGhvdyBhYm91dCBjYWxsaW5nIGl0IGNtZGxpbmVfc3RybmNt
cCgpPyBUaGlzIHdvdWxkIGJlIGVhc2llciB0bwo+PiBzcG90IG1pc3VzZSBvbiByZXZpZXcgKGku
ZSB1c2luZyBzdHJuY21wKCkgcmF0aGVyIHRoYW4gX3N0cm5jbXAoKSkuCj4gCj4gV2UgYWxyZWFk
eSBoYXZlIGNtZGxpbmVfc3RyY21wKCksIG9yIGVsc2UgSSB3b3VsZCBpbmRlZWQgaGF2ZSB1c2Vk
Cj4gdGhpcyBwcmVmaXguIE5vIHByZWZpeCAob3RoZXIgdGhhbiB0aGUgbG9uZSB1bmRlcnNjb3Jl
KSBzZWVtZWQgdGhlCj4gbmV4dCBiZXN0IG9wdGlvbi4KCkFzIHdlIHBhcnNlIGFuIG9wdGlvbiwg
aG93IGFib3V0IG9wdF9zdHJuY21wKCk/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
