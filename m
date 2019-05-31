Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082C30C7E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:24:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeg0-0000ad-MU; Fri, 31 May 2019 10:22:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWefz-0000aY-47
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:22:19 +0000
X-Inumbo-ID: f7b317c8-838d-11e9-9531-3bdd93d4e5df
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f7b317c8-838d-11e9-9531-3bdd93d4e5df;
 Fri, 31 May 2019 10:22:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6AFC341;
 Fri, 31 May 2019 03:22:17 -0700 (PDT)
Received: from [10.37.12.213] (unknown [10.37.12.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67E353F59C;
 Fri, 31 May 2019 03:22:15 -0700 (PDT)
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <1559270128-28496-1-git-send-email-chenbaodong@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6db51cab-7372-d55d-c0a5-481afc21e5c8@arm.com>
Date: Fri, 31 May 2019 11:22:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559270128-28496-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: notifier: refine 'notifier_head',
 use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpNaXNzaW5nIGNvbW1pdCBtZXNzYWdlIGhlcmUuCgpPbiA1LzMxLzE5IDM6MzUgQU0sIEJh
b2RvbmcgQ2hlbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9k
b25nQG14bmF2aS5jb20+Cj4gLS0tCj4gICB4ZW4vY29tbW9uL25vdGlmaWVyLmMgICAgICB8IDI1
ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL3hlbi9ub3RpZmllci5o
IHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL25v
dGlmaWVyLmMgYi94ZW4vY29tbW9uL25vdGlmaWVyLmMKPiBpbmRleCAzNDQ4OGE4Li5mOTU5YTc5
IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vbm90aWZpZXIuYwo+ICsrKyBiL3hlbi9jb21tb24v
bm90aWZpZXIuYwo+IEBAIC0yMSwxMCArMjEsMTAgQEAKPiAgIHZvaWQgX19pbml0IG5vdGlmaWVy
X2NoYWluX3JlZ2lzdGVyKAo+ICAgICAgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwgc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuKQo+ICAgewo+IC0gICAgc3RydWN0IGxpc3RfaGVhZCAqY2hhaW4g
PSAmbmgtPmhlYWQuY2hhaW47Cj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkICpjaGFpbiA9ICZuaC0+
aGVhZDsKPiAgICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iOwo+ICAgCj4gLSAgICB3aGls
ZSAoIGNoYWluLT5uZXh0ICE9ICZuaC0+aGVhZC5jaGFpbiApCj4gKyAgICB3aGlsZSAoIGNoYWlu
LT5uZXh0ICE9ICZuaC0+aGVhZCApCj4gICAgICAgewo+ICAgICAgICAgICBuYiA9IGxpc3RfZW50
cnkoY2hhaW4tPm5leHQsIHN0cnVjdCBub3RpZmllcl9ibG9jaywgY2hhaW4pOwo+ICAgICAgICAg
ICBpZiAoIG4tPnByaW9yaXR5ID4gbmItPnByaW9yaXR5ICkKPiBAQCAtMzUsMTkgKzM1LDYgQEAg
dm9pZCBfX2luaXQgbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIoCj4gICAgICAgbGlzdF9hZGQoJm4t
PmNoYWluLCBjaGFpbik7Cj4gICB9Cj4gICAKPiAtLyoqCj4gLSAqIG5vdGlmaWVyX2NoYWluX3Vu
cmVnaXN0ZXIgLSBSZW1vdmUgbm90aWZpZXIgZnJvbSBhIHJhdyBub3RpZmllciBjaGFpbgo+IC0g
KiBAbmg6IFBvaW50ZXIgdG8gaGVhZCBvZiB0aGUgcmF3IG5vdGlmaWVyIGNoYWluCj4gLSAqIEBu
OiBFbnRyeSB0byByZW1vdmUgZnJvbSBub3RpZmllciBjaGFpbgo+IC0gKgo+IC0gKiBSZW1vdmVz
IGEgbm90aWZpZXIgZnJvbSBhIHJhdyBub3RpZmllciBjaGFpbi4KPiAtICogQWxsIGxvY2tpbmcg
bXVzdCBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyLgo+IC0gKi8KPiAtdm9pZCBfX2luaXQgbm90
aWZpZXJfY2hhaW5fdW5yZWdpc3RlcigKPiAtICAgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwg
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuKQo+IC17Cj4gLSAgICBsaXN0X2RlbCgmbi0+Y2hhaW4p
Owo+IC19CgpXaHkgZGlkIHlvdSBtb3ZlIHRoZSBmdW5jdGlvbj8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
