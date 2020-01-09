Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8D1355C4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 10:29:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipU2q-0003DH-2Z; Thu, 09 Jan 2020 09:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipU2o-0003DC-N7
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 09:23:58 +0000
X-Inumbo-ID: c2b6284c-32c1-11ea-b982-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2b6284c-32c1-11ea-b982-12813bfff9fa;
 Thu, 09 Jan 2020 09:23:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1938ABC8D;
 Thu,  9 Jan 2020 09:22:51 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-3-sergey.dyasli@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0c968669-2b21-b772-dba8-f674057bd6e7@suse.com>
Date: Thu, 9 Jan 2020 10:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108152100.7630-3-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/xen: add basic KASAN support for
 PV kernel
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTY6MjAsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gVGhpcyBlbmFibGVzIHRv
IHVzZSBPdXRsaW5lIGluc3RydW1lbnRhdGlvbiBmb3IgWGVuIFBWIGtlcm5lbHMuCj4gCj4gS0FT
QU5fSU5MSU5FIGFuZCBLQVNBTl9WTUFMTE9DIG9wdGlvbnMgY3VycmVudGx5IGxlYWQgdG8gYm9v
dCBjcmFzaGVzCj4gYW5kIGhlbmNlIGRpc2FibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdl
eSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAtLS0KPiBSRkMgLS0+IHYxOgo+
IC0gTmV3IGZ1bmN0aW9ucyB3aXRoIGRlY2xhcmF0aW9ucyBpbiB4ZW4veGVuLW9wcy5oCj4gLSBG
aXhlZCB0aGUgaXNzdWUgd2l0aCBmcmVlX2tlcm5lbF9pbWFnZV9wYWdlcygpIHdpdGggdGhlIGhl
bHAgb2YKPiAgICB4ZW5fcHZfa2FzYW5fdW5waW5fcGdkKCkKPiAtLS0KPiAgIGFyY2gveDg2L21t
L2thc2FuX2luaXRfNjQuYyB8IDEyICsrKysrKysrKysrKwo+ICAgYXJjaC94ODYveGVuL01ha2Vm
aWxlICAgICAgIHwgIDcgKysrKysrKwo+ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwg
IDMgKysrCj4gICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3hlbi9NYWtlZmlsZSAgICAgICAg
fCAgMiArKwo+ICAgaW5jbHVkZS94ZW4veGVuLW9wcy5oICAgICAgIHwgIDQgKysrKwo+ICAga2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIgKysKPiAgIGxpYi9LY29uZmlnLmthc2FuICAg
ICAgICAgICB8ICAzICsrLQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQu
YyBiL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+IGluZGV4IGNmNWJjMzdjOTBhYy4uOTAy
YTZhMTUyZDMzIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+ICsr
KyBiL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+IEBAIC0xMyw2ICsxMyw5IEBACj4gICAj
aW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2Mu
aD4KPiAgIAo+ICsjaW5jbHVkZSA8eGVuL3hlbi5oPgo+ICsjaW5jbHVkZSA8eGVuL3hlbi1vcHMu
aD4KPiArCj4gICAjaW5jbHVkZSA8YXNtL2U4MjAvdHlwZXMuaD4KPiAgICNpbmNsdWRlIDxhc20v
cGdhbGxvYy5oPgo+ICAgI2luY2x1ZGUgPGFzbS90bGJmbHVzaC5oPgo+IEBAIC0zMzIsNiArMzM1
LDExIEBAIHZvaWQgX19pbml0IGthc2FuX2Vhcmx5X2luaXQodm9pZCkKPiAgIAlmb3IgKGkgPSAw
OyBwZ3RhYmxlX2w1X2VuYWJsZWQoKSAmJiBpIDwgUFRSU19QRVJfUDREOyBpKyspCj4gICAJCWth
c2FuX2Vhcmx5X3NoYWRvd19wNGRbaV0gPSBfX3A0ZChwNGRfdmFsKTsKPiAgIAo+ICsJaWYgKHhl
bl9wdl9kb21haW4oKSkgewo+ICsJCXBnZF90ICpwdl90b3BfcGd0ID0geGVuX3B2X2thc2FuX2Vh
cmx5X2luaXQoKTsKCllvdSBhcmUgYnJlYWtpbmcgdGhlIGJ1aWxkIHdpdGggQ09ORklHX1hFTl9Q
ViB1bmRlZmluZWQgaGVyZS4KCj4gKwkJa2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhwdl90b3BfcGd0
KTsKPiArCX0KPiArCj4gICAJa2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhlYXJseV90b3BfcGd0KTsK
PiAgIAlrYXNhbl9tYXBfZWFybHlfc2hhZG93KGluaXRfdG9wX3BndCk7Cj4gICB9Cj4gQEAgLTM2
OSw2ICszNzcsOCBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpCj4gICAJCQkJX19wZ2Qo
X19wYSh0bXBfcDRkX3RhYmxlKSB8IF9LRVJOUEdfVEFCTEUpKTsKPiAgIAl9Cj4gICAKPiArCXhl
bl9wdl9rYXNhbl9waW5fcGdkKGVhcmx5X3RvcF9wZ3QpOwoKU2FtZSBoZXJlIChhbmQgYmVsb3cp
LiBGb3IgdGhlIHBpbi91bnBpbiB2YXJpYW50cyBJJ2QgcmF0aGVyIGhhdmUKYW4gaW5saW5lIHdy
YXBwZXIgY29udGFpbmluZyB0aGUgImlmICh4ZW5fcHZfZG9tYWluKCkpIiBpbiB4ZW4tb3BzLmgK
d2hpY2ggY2FuIGVhc2lseSBjb250YWluIHRoZSBuZWVkZWQgI2lmZGVmIENPTkZJR19YRU5fUFYu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
