Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E8399E8
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 02:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZP3W-0001Ac-Vs; Sat, 08 Jun 2019 00:17:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hZP3U-0001AX-KQ
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 00:17:56 +0000
X-Inumbo-ID: dc566b06-8982-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc566b06-8982-11e9-8980-bc764e045a96;
 Sat, 08 Jun 2019 00:17:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42AD020868;
 Sat,  8 Jun 2019 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559953074;
 bh=JGEIWluCcSsCivGqDH2yO1CJH6N2/jN8VOm9yD1c4bU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bJjNmATEUT1+DtvZfV+6NqkHl9eXqPkuxOkGzVHd/vP7JieGFSU3zh065yx0pd8cL
 MaHSrShcq/oUCrNpxBpK4zwr6S7JarZksyRxAI03qER2MBMNB4SCgE0/6stTzFf1GH
 bomhz3/fvyIiRE4U9T7BWWfEK3Ikd4+DLHjz2/xM=
Date: Fri, 7 Jun 2019 17:17:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <97d5c58d-b198-a094-4f54-78d94d1c8d42@arm.com>
Message-ID: <alpine.DEB.2.21.1906071715330.15554@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041048490.14041@sstabellini-ThinkPad-T480s>
 <97d5c58d-b198-a094-4f54-78d94d1c8d42@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm:
 Protect Xen page-table update with a spinlock
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA1IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNS8wNi8yMDE5IDAwOjExLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
dWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9yCj4gPiA+
IGluc3RhbmNlLCB3aGlsZSB0aGUgdm1hcCBhbGxvY2F0aW9uIGlzIHByb3RlY3RlZCBieSBhIHNw
aW5sb2NrLCB0aGUKPiA+ID4gbWFwcGluZyBpcyBub3QuCj4gPiAKPiA+IERvIHlvdSBoYXZlIGFu
IGV4YW1wbGUgb2YgcG90ZW50aWFsIGNvbmN1cnJlbnQgY2FsbHMgb2YKPiA+IGNyZWF0ZV94ZW5f
ZW50cmllcygpIHdoaWNoIGRvZXNuJ3QgaW52b2x2ZSBjb25jdXJyZW50IHZtYXBzIChiZWNhdXNl
Cj4gPiB2bWFwcyBhcmUgYWxyZWFkeSBwcm90ZWN0ZWQgYnkgdGhlaXIgc3BpbmxvY2spPyB2bWFw
ICsgc29tZXRoaW5nX2Vsc2UKPiA+IGZvciBpbnN0YW5jZT8KPiBXZWxsLCBJIGdhdmUgYW4gZXhh
bXBsZSBoZXJlLiBUaGUgdm1hcCBhbGxvY2F0aW9uIChpLmUgdm1fYWxsb2MpIGlzIHByb3RlY3Rl
ZAo+IGJ5IGEgc3BpbmxvY2suIEhvd2V2ZXIsIHdoZW4gdGhlIG1hcHBpbmcgaXMgZG9uZSB0aGVy
ZSBhcmUgbm8gc3BpbmxvY2sgdG8KPiBwcm90ZWN0ZWQgYWdhaW5zdCBjb25jdXJyZW50IG9uZS4K
PiAKPiBTbyB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIGNvdWxkIGhhcHBlbjoKPiAKPiBDUFUwCQkJ
CSAgICAgIHwJQ1BVMQo+IAkJCQkgICAgICB8Cj4gdm1hcCgpCQkJCSAgICAgIHwJdm1hcCgpCj4g
ICB2bV9hbGxvYygpCQkJICAgICAgfCAgIHZtX2FsbG9jKCkKPiAgICAgc3Bpbl9sb2NrKCkJCQkg
ICAgICB8Cj4gICAgIC4uLgkJCSAgCSAgICAgIHwKPiAgICAgc3Bpbl91bmxvY2soKQkJICAgICAg
fAo+IAkJCQkgICAgICB8CSAgICBzcGluX2xvY2soKQo+ICAgICAqIGludGVycnVwdCAqCQkgICAg
ICB8CSAgICAuLi4KPiAJCQkJICAgICAgfAkgICAgc3Bpbl91bmxvY2soKQo+IAkJCQkgICAgICB8
Cj4gICAgIG1hcF9wYWdlc190b194ZW4oKQkJICAgICAgfAkgICAgbWFwX3BhZ2VzX3RvX3hlbigp
Cj4gCWVudHJ5ID0gJnhlbl9zZWNvbmRbWF0JICAgICAgfAkgCWVudHJ5ID0gJnhlbl9zZWNvbmRb
WV0KPiAJKiBlbnRyeSBpbnZhbGlkICogICAgICAgICAgICAgfCAgICAgICAgICogZW50cnkgaW52
YWxpZCAqCj4gCWNyZWF0ZV94ZW5fdGFibGUoKQkgICAgICB8CQljcmVhdGVfeGVuX3RhYmxlKCkK
PiAJCj4gCj4gQXNzdW1pbmcgWCA9PSBZIChpLmUgd2UgdGhlIHhlbiBzZWNvbmQgZW50cnkgaXMg
dGhlIHNhbWUpLCB0aGVuIG9uZSB3aWxsIHdpbgo+IHRoZSByYWNlIGFuZCB0aGVyZWZvcmUgb25l
IG1hcHBpbmcgd2lsbCBiZSBpbmV4aXN0ZW50Lgo+IAo+IEJ1dCBhcyBJIHdyb3RlLCB0aGUgY2hh
bmNlIGl0IGlzIGhhcHBlbmluZyBpcyB2ZXJ5IGxpbWl0ZWQuCj4gCj4gSSBjYW4gYWRkIHRoYXQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRp
b24sIEkgYW0ganVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBhbmQKZG91YmxlLWNoZWNrIHRoZSBy
YWNlLiBXb3VsZG4ndCB2bV9hbGxvYyBndWFyYW50ZWUgdG8gcmV0dXJuIGEgZGlmZmVyZW50CnZh
IGluIHRoZSB0d28gY2FzZXMgKENQVTAgYW5kIENQVTEgYWJvdmUpLCBnaXZlbiB0aGF0IHRoZSBz
ZWxlY3Rpb24gb2YKdGhlIHZhIGlzIGRvbmUgdW5kZXIgc3Bpbl9sb2NrPyBCdXQgaXQgd291bGQg
YmUgc3RpbGwgcG9zc2libGUgdG8gaGF2ZSBYCmFuZCBZIHNvIHRoYXQgdGhleSBzZWxlY3QgdGhl
IHNhbWUgJnhlbl9zZWNvbmQgZW50cnksIGhlbmNlLCB0aGUgcmFjZQp3aXRoIGNyZWF0ZV94ZW5f
dGFibGUoKS4gSXQgbG9va3MgbGlrZSB0aGUgcmFjZSBpcyB0aGVyZS4KClJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
