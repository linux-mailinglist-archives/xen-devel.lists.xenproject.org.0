Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6B18432C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgB1-0000Me-GC; Fri, 13 Mar 2020 09:00:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCgB0-0000MZ-1k
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:00:18 +0000
X-Inumbo-ID: 0f2e4686-6509-11ea-b2a5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2e4686-6509-11ea-b2a5-12813bfff9fa;
 Fri, 13 Mar 2020 09:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9B9FAAC2;
 Fri, 13 Mar 2020 09:00:16 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-3-jgross@suse.com>
 <0e56d8d5-a66f-1990-faf2-488f1f07ae93@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6f10339b-7746-ebde-fc11-787b6032f259@suse.com>
Date: Fri, 13 Mar 2020 10:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0e56d8d5-a66f-1990-faf2-488f1f07ae93@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/spinlocks: fix placement of
 preempt_[dis|en]able()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjAzLjIwMjAgMDk6
MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0xOTksMTAgKzE5OSwxMCBAQCB1bnNpZ25l
ZCBsb25nIF9zcGluX2xvY2tfaXJxc2F2ZShzcGlubG9ja190ICpsb2NrKQo+PiAgIHZvaWQgX3Nw
aW5fdW5sb2NrKHNwaW5sb2NrX3QgKmxvY2spCj4+ICAgewo+PiAgICAgICBhcmNoX2xvY2tfcmVs
ZWFzZV9iYXJyaWVyKCk7Cj4+IC0gICAgcHJlZW1wdF9lbmFibGUoKTsKPj4gICAgICAgTE9DS19Q
Uk9GSUxFX1JFTDsKPj4gICAgICAgcmVsX2xvY2soJmxvY2stPmRlYnVnKTsKPj4gICAgICAgYWRk
X3NpemVkKCZsb2NrLT50aWNrZXRzLmhlYWQsIDEpOwo+PiArICAgIHByZWVtcHRfZW5hYmxlKCk7
Cj4+ICAgICAgIGFyY2hfbG9ja19zaWduYWwoKTsKPj4gICB9Cj4gCj4gYXJjaF9sb2NrX3NpZ25h
bCgpIGlzIGEgYmFycmllciBvbiBBcm0sIGhlbmNlIGp1c3QgbGlrZSBmb3IgcGF0Y2ggMQo+IEkg
d29uZGVyIHdoZXRoZXIgdGhlIGluc2VydGlvbiB3b3VsZG4ndCBiZXR0ZXIgY29tZSBhZnRlciBp
dC4KCkVpdGhlciB3YXkgaXMgZmluZSBmb3IgbWUuIEl0IHNob3VsZCBiZSBub3RlZCB0aGF0IHBy
ZWVtcHRpb24gaXMgb25seQpyZWxldmFudCBvbiB0aGUgbG9jYWwgY3B1LiBTbyB0aGlzIGlzIGFi
b3V0IHRyYWRpbmcgbG9jayBzdGF0ZQp2aXNpYmlsaXR5IGFnYWluc3QgcHJlZW1wdGlvbiBkaXNh
YmxlZCB0aW1lLCBhbmQgSSBhZ3JlZSB0aGUgdmlzaWJsZQp0aW1lIG9mIHRoZSBsb2NrIGhlbGQg
c2hvdWxkIGJlIG1pbmltaXplZCBhdCBoaWdoZXIgcHJpb3JpdHkgdGhhbiB0aGUKcHJlZW1wdGlv
biBkaXNhYmxlZCB0aW1lLgoKSSdsbCBtb2RpZnkgbXkgcGF0Y2hlcyBhY2NvcmRpbmdseSwgYWRk
aW5nIGEgbm90ZSBpbiB0aGlzIHJlZ2FyZCB0bwp0aGUgY29tbWl0IG1lc3NhZ2UuCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
