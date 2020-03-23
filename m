Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D237E18F1F0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:38:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJTx-0003QV-9g; Mon, 23 Mar 2020 09:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPxt=5I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGJTw-0003QQ-L1
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:34:52 +0000
X-Inumbo-ID: 8b28d53e-6ce9-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b28d53e-6ce9-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 09:34:51 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id i24so15464679eds.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 02:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gA+U/OvYIMmxlZFnAzUklcqW8F91+fSp+WMInzkQS8=;
 b=I+03kkufj4X0lDSy+z+XZYprw75JJrfRSay7Z6gWTpckkKPZPA8j7kv6dj8gP21Rhp
 G6WoHtHHd9e6kht/N8UcgMBgv8yjFgHN40Bg6+mwg2Qox4oi4s+9TI5JQ4Gm0rlY7aBM
 o0UoedlS7oijWqfVS6z1E8eqw+e4DZrXj44rHG8qhDNzTm6ukB9mlDTbDXJ6WiBR0X7N
 /Yx4ChrqWIO5f+3oSq3bZhqzJrD6R/nvfT5Qc3YKo3EgYUuyhVKeXxFgkE+DucTxVjJ0
 I2i1sO9KJ30+GPzgEh8ZiytPwcFTg7XiejWpysvls0kCfQmULXnLqNAaWIDoSmhB6ib9
 CEWg==
X-Gm-Message-State: ANhLgQ1FFYAIBXMBy99DwhlAMs1figTPlfG/YxnuduAqmG8FASM2lufm
 OsJGVNv7qiWUbCrZmXaQA7I=
X-Google-Smtp-Source: ADFU+vsLgqN/rINoXefPMoGyVViZ0GSR7SBsibwIRYZRgwj6nticelAMfIl28kJh3OLflZuPgiPJiQ==
X-Received: by 2002:aa7:c950:: with SMTP id h16mr20564236edt.216.1584956090287; 
 Mon, 23 Mar 2020 02:34:50 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id h9sm1016133edn.39.2020.03.23.02.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 02:34:49 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
 <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3018bb93-b79c-9182-30cc-364fb59ec2fd@xen.org>
Date: Mon, 23 Mar 2020 09:34:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAyMC8wMy8yMDIwIDE1OjE3LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
T24gRnJpLCAyMDIwLTAzLTIwIGF0IDEzOjMzICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2
ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIERhdmlkIFdvb2Ro
b3VzZQo+Pj4gU2VudDogMTkgTWFyY2ggMjAyMCAyMToyMgo+Pj4gVG86IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsKPj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPj4+
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBob25neXhpYUBhbWF6b24uY29tOyBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBWb2xvZHlteXIgQmFiY2h1awo+Pj4gPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4+PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggMi8yXSB4ZW4vbW06IEludHJvZHVj
ZSBQR0Nfc3RhdGVfdW5pbml0aWFsaXNlZAo+Pj4KPj4+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8
ZHdtd0BhbWF6b24uY28udWs+Cj4+Pgo+Pj4gSXQgaXMgcG9zc2libGUgZm9yIHBhZ2VzIHRvIGVu
dGVyIGdlbmVyYWwgY2lyY3VsYXRpb24gd2l0aG91dCBldmVyCj4+PiBiZWluZyBwcm9jZXNzIGJ5
IGluaXRfaGVhcF9wYWdlcygpLgo+Pj4KPj4+IEZvciBleGFtcGxlLCBwYWdlcyBvZiB0aGUgbXVs
dGlib290IG1vZHVsZSBjb250YWluaW5nIHRoZSBpbml0cmFtZnMgbWF5Cj4+PiBiZSBhc3NpZ25l
ZCB2aWEgYXNzaWduX3BhZ2VzKCkgdG8gZG9tMCBhcyBpdCBpcyBjcmVhdGVkLiBBbmQgc29tZSBj
b2RlCj4+PiBpbmNsdWRpbmcgbWFwX3BhZ2VzX3RvX3hlbigpIGhhcyBjaGVja3Mgb24gJ3N5c3Rl
bV9zdGF0ZScgdG8gZGV0ZXJtaW5lCj4+PiB3aGV0aGVyIHRvIHVzZSB0aGUgYm9vdCBvciB0aGUg
aGVhcCBhbGxvY2F0b3IsIGJ1dCBpdCBzZWVtcyBpbXBvc3NpYmxlCj4+PiB0byBwcm92ZSB0aGF0
IHBhZ2VzIGFsbG9jYXRlZCBieSB0aGUgYm9vdCBhbGxvY2F0b3IgYXJlIG5vdCBzdWJzZXF1ZW50
bHkKPj4+IGZyZWVkIHdpdGggZnJlZV9oZWFwX3BhZ2VzKCkuCj4+Pgo+Pj4gVGhpcyBhY3R1YWxs
eSB3b3JrcyBmaW5lIGluIHRoZSBtYWpvcml0eSBvZiBjYXNlczsgdGhlcmUgYXJlIG9ubHkgYSBm
ZXcKPj4+IGVzb3RlcmljIGNvcm5lciBjYXNlcyB3aGljaCBpbml0X2hlYXBfcGFnZXMoKSBoYW5k
bGVzIGJlZm9yZSBoYW5kaW5nIHRoZQo+Pj4gcGFnZSByYW5nZSBvZmYgdG8gZnJlZV9oZWFwX3Bh
Z2VzKCk6Cj4+PiAgIOKAoiBFeGNsdWRpbmcgTUZOICMwIHRvIGF2b2lkIGluYXBwcm9wcmlhdGUg
Y3Jvc3Mtem9uZSBtZXJnaW5nLgo+Pj4gICDigKIgRW5zdXJpbmcgdGhhdCB0aGUgbm9kZSBpbmZv
cm1hdGlvbiBzdHJ1Y3R1cmVzIGV4aXN0LCB3aGVuIHRoZSBmaXJzdAo+Pj4gICAgIHBhZ2Uocykg
b2YgYSBnaXZlbiBub2RlIGFyZSBoYW5kbGVkLgo+Pj4gICDigKIgSGlnaCBvcmRlciBhbGxvY2F0
aW9ucyBjcm9zc2luZyBmcm9tIG9uZSBub2RlIHRvIGFub3RoZXIuCj4+Pgo+Pj4gVG8gaGFuZGxl
IHRoaXMgY2FzZSwgc2hpZnQgUEdfc3RhdGVfaW51c2UgZnJvbSBpdHMgY3VycmVudCB2YWx1ZSBv
Zgo+Pj4gemVybywgdG8gYW5vdGhlciB2YWx1ZS4gVXNlIHplcm8sIHdoaWNoIGlzIHRoZSBpbml0
aWFsIHN0YXRlIG9mIHRoZQo+Pj4gZW50aXJlIGZyYW1lIHRhYmxlLCBhcyBQR19zdGF0ZV91bmlu
aXRpYWxpc2VkLgo+Pj4KPj4+IEZpeCBhIGNvdXBsZSBvZiBhc3NlcnRpb25zIHdoaWNoIHdlcmUg
YXNzdW1pbmcgdGhhdCBQR19zdGF0ZV9pbnVzZSBpcwo+Pj4gemVybywgYW5kIG1ha2UgdGhlbSBj
b3BlIHdpdGggdGhlIFBHX3N0YXRlX3VuaW5pdGlhbGlzZWQgY2FzZSB0b28gd2hlcmUKPj4+IGFw
cG9wcmlhdGUuCj4+Pgo+Pj4gRmluYWxseSwgbWFrZSBmcmVlX2hlYXBfcGFnZXMoKSBjYWxsIHRo
cm91Z2ggdG8gaW5pdF9oZWFwX3BhZ2VzKCkgd2hlbgo+Pj4gZ2l2ZW4gYSBwYWdlIHJhbmdlIHdo
aWNoIGhhcyBub3QgYmVlbiBpbml0aWFsaXNlZC4gVGhpcyBjYW5ub3Qga2VlcAo+Pj4gcmVjdXJz
aW5nIGJlY2F1c2UgaW5pdF9oZWFwX3BhZ2VzKCkgd2lsbCBzZXQgZWFjaCBwYWdlIHN0YXRlIHRv
Cj4+PiBQR0Nfc3RhdGVfaW51c2UgYmVmb3JlIHBhc3NpbmcgaXQgYmFjayB0byBmcmVlX2hlYXBf
cGFnZXMoKSBmb3IgdGhlCj4+PiBzZWNvbmQgdGltZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+Pj4gLS0tCj4+PiAgIHhlbi9hcmNo
L3g4Ni9tbS5jICAgICAgICB8ICAzICsrLQo+Pj4gICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAg
fCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4+PiAgIHhlbi9p
bmNsdWRlL2FzbS1hcm0vbW0uaCB8ICAzICsrLQo+Pj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L21t
LmggfCAgMyArKy0KPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4v
YXJjaC94ODYvbW0uYwo+Pj4gaW5kZXggNjI1MDdjYTY1MS4uNWYwNTgxYzA3MiAxMDA2NDQKPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+Pj4g
QEAgLTQ5MSw3ICs0OTEsOCBAQCB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qoc3RydWN0
IHBhZ2VfaW5mbyAqcGFnZSwgc3RydWN0IGRvbWFpbiAqZCwKPj4+Cj4+PiAgICAgICBwYWdlX3Nl
dF9vd25lcihwYWdlLCBkKTsKPj4+ICAgICAgIHNtcF93bWIoKTsgLyogaW5zdGFsbCB2YWxpZCBk
b21haW4gcHRyIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICovCj4+PiAtICAgIEFTU0VSVCgocGFn
ZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXApID09IDApOwo+Pj4gKyAgICBBU1NFUlQoKHBh
Z2UtPmNvdW50X2luZm8gJiB+UEdDX3hlbl9oZWFwKSA9PSBQR0Nfc3RhdGVfaW51c2UgfHwKPj4+
ICsgICAgICAgICAgIChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194ZW5faGVhcCkgPT0gUEdDX3N0
YXRlX3VuaW5pdGlhbGlzZWQpOwo+Pgo+PiBDb3VsZCB0aGUgcGFnZSBzdGF0ZSBwZXJoYXBzIGJl
IGJ1bXBlZCB0byBpbnVzZSBpbiB0aGlzIGNhc2U/IEl0Cj4+IHNlZW1zIG9kZCB0byBsZWF2ZSBz
dGF0ZSB1bmluaXRpYWxpemVkIHlldCBzdWNjZWVkIGluIHNoYXJpbmcgd2l0aCBhCj4+IGd1ZXN0
Lgo+IAo+IE5vLCB0aGF0IGRvZXNuJ3QgcmVhbGx5IHdvcmsuCj4gCj4gWW91IGNhbid0IGp1c3Qg
KmRlY2xhcmUqIHRoYXQgdGhlIHBhZ2Ugd2FzIHByb3Blcmx5IGluaXRpYWxpc2VkLAo+IGJlY2F1
c2UgaXQgaXNuJ3QgdHJ1ZS4gVGhlcmUncyBhIHBhdGhvbG9naWNhbCBjYXNlIHdoZXJlIHRoZSB6
b25lCj4gaGFzbid0IGJlZW4gaW5pdGlhbGlzZWQgYXQgYWxsLCBiZWNhdXNlICphbGwqIHRoZSBw
YWdlcyBpbiB0aGF0IHpvbmUKPiBnb3QgaGFuZGVkIG91dCBieSB0aGUgYm9vdCBhbGxvY2F0b3Ig
b3IgdXNlZCBmb3IgaW5pdHJkIGV0Yy4KPiAKPiBUaGUgZmlyc3QgcGFnZXMgJ2ZyZWVkJyBpbiB0
aGF0IHpvbmUgZW5kIHVwIGJlaW5nIHVzZWQgKGluCj4gaW5pdF9oZWFwX3BhZ2VzKSB0byBjcmVh
dGUgdGhlIHpvbmUgc3RydWN0dXJlcy4KPiAKPiBMaWtld2lzZSwgaXQgY291bGQgaW5jbHVkZSBh
IHBhZ2Ugd2hpY2ggaW5pdF9oZWFwX3BhZ2VzKCkgZG9lc24ndAo+IGFjdHVhbGx5ICpwdXQqIGlu
dG8gdGhlIGJ1ZGR5IGFsbG9jYXRvciwgdG8gd29yayBhcm91bmQgdGhlIGNyb3NzLXpvbmUKPiBt
ZXJnZSBwcm9ibGVtLiBJdCdzIGZpbmUgdG8gdXNlIHRoYXQgcGFnZSBhbmQgc2hhcmUgaXQgd2l0
aCBhIGd1ZXN0LAo+IGJ1dCBpdCBjYW4ndCBldmVyIGJlIGZyZWVkIGludG8gdGhlIGJ1ZGR5IGFs
bG9jYXRvci4KCkZvciBsaXZldXBkYXRlLCB3ZSB3aWxsIG5lZWQgYSB3YXkgdG8gaW5pdGlhbGl6
ZSBhIHBhZ2UgYnV0IG1hcmsgaXQgYXMgCmFscmVhZHkgaW51c2UgKGkuZSBpbiB0aGUgc2FtZSBz
dGF0ZSBhcyB0aGV5IHdvdWxkIGJlIGlmIGFsbG9jYXRlZCAKbm9ybWFsbHkpLgoKSXQgZmVlbHMg
dG8gbWUsIHRoaXMgaXMgYWxzbyB3aGF0IHdlIHdhbnQgaW4gdGhpcyBjYXNlLiBUaGUgcGFnZSB3
b3VsZCAKYmUgZmlyc3QgaW5pdGlhbGl6ZSBhbmQgdGhlbiB3ZSBjYW4gdXNlIGl0IG5vcm1hbGx5
IGluY2x1ZGluZyBmcmVlaW5nIApsYXRlciBvbi4KCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaW50
cm9kdWNlIGFuIGhlbHBlciBmb3IgdGhpcyBwdXJwb3NlPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
