Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5AC177B93
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:08:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9A3X-0000EU-Ju; Tue, 03 Mar 2020 16:06:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9A3W-0000EK-EF
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:06:02 +0000
X-Inumbo-ID: ddc195ad-5d68-11ea-a1ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddc195ad-5d68-11ea-a1ac-12813bfff9fa;
 Tue, 03 Mar 2020 16:05:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8AB1EAE1C;
 Tue,  3 Mar 2020 16:05:57 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200303123058.27210-1-jgross@suse.com>
 <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c8946349-ae40-fe58-26a8-c1bc918ddc82@suse.com>
Date: Tue, 3 Mar 2020 17:05:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjAzLjIwMjAgMTM6
MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0yNTM4LDcgKzI1NTIsMTAgQEAgc3RhdGlj
IHZvaWQgc2NoZWRfc2xhdmUodm9pZCkKPj4gICAKPj4gICAgICAgbmV4dCA9IHNjaGVkX3dhaXRf
cmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgY3B1LCBub3cpOwo+PiAgICAgICBpZiAoICFuZXh0
ICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxv
Y2spOwo+PiAgICAgICAgICAgcmV0dXJuOwo+PiArICAgIH0KPiAKPiBUaGlzIGFuZCAuLi4KPiAK
Pj4gQEAgLTI1OTksNyArMjYxNiwxMCBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lkKQo+PiAg
ICAgICAgICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKG1hc2ssIFNDSEVEX1NMQVZFX1NPRlRJUlEp
Owo+PiAgICAgICAgICAgbmV4dCA9IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9j
aywgY3B1LCBub3cpOwo+PiAgICAgICAgICAgaWYgKCAhbmV4dCApCj4+ICsgICAgICAgIHsKPj4g
KyAgICAgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwo+PiAgICAg
ICAgICAgICAgIHJldHVybjsKPj4gKyAgICAgICAgfQo+IAo+IC4uLiB0aGlzIGxvb2sgbGlrZSBp
bmRlcGVuZGVudCBmaXhlcywgYXMgb24gQXJtLAo+IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbigp
IGNhbiBhbHJlYWR5IHJldHVybiBOVUxMLiBJZiB0aGV5IGdldAo+IGZvbGRlZCBpbnRvIGhlcmUs
IEkgdGhpbmsgdGhlIGRlc2NyaXB0aW9uIHNob3VsZCBjbGFyaWZ5IHRoYXQKPiB0aGVzZSBhcmUg
b3J0aG9nb25hbCB0byB0aGUgcmVzdC4KClllYWgsIHByb2JhYmx5IGJldHRlciB0byBzcGxpdCB0
aGUgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
