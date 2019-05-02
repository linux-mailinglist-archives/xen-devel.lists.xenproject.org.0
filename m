Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D551222E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 20:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMGm5-0004EE-7h; Thu, 02 May 2019 18:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6X+8=TC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMGm4-0004E9-82
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 18:49:40 +0000
X-Inumbo-ID: 0624e0f0-6d0b-11e9-8097-0f9b63e980e7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0624e0f0-6d0b-11e9-8097-0f9b63e980e7;
 Thu, 02 May 2019 18:49:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 000D6204FD;
 Thu,  2 May 2019 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556822972;
 bh=/IhOAvKdEmBtWckBxViGBHf2HKLAVy1nS7mCwX2EWkY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Q4EU/0XtBtNilZYixOOewN/ju6ZLeGHbMVnG4Wvr/9dWA21yDVkHlxBRD/zqayQHq
 JoMvi2gwCPOHKReSDy2NPSjK6plN6UUlx5q7pL7wj4nPXLrCUURYj35RbLyn3Df8UM
 iKO4nGScWbNyhiObiDSCYfcSSIEviVgB1oDJ8+Bo=
Date: Thu, 2 May 2019 11:49:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCB05C6020000780022B567@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1905021147240.1347@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
 <5CCB05C6020000780022B567@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/10] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMzAuMDQuMTkg
YXQgMjM6MDIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBf
YnVpbGQuYwo+ID4gQEAgLTc5LDggKzc5LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IG1vZGlmeV9p
ZGVudGl0eV9tbWlvKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgcGZuLAo+ID4gIAo+
ID4gICAgICBmb3IgKCA7IDsgKQo+ID4gICAgICB7Cj4gPiAtICAgICAgICByYyA9IG1hcCA/ICAg
bWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKHBmbiksIG5yX3BhZ2VzLCBfbWZuKHBmbikpCj4gPiAt
ICAgICAgICAgICAgICAgICA6IHVubWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKHBmbiksIG5yX3Bh
Z2VzLCBfbWZuKHBmbikpOwo+ID4gKyAgICAgICAgaWYgKCBtYXAgKQo+ID4gKyAgICAgICAgICAg
IHJjID0gbWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKHBmbiksIG5yX3BhZ2VzLCBfbWZuKHBmbiks
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9tbWlvX2RpcmVjdCk7
Cj4gPiArICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgcmMgPSB1bm1hcF9tbWlvX3JlZ2lv
bnMoZCwgX2dmbihwZm4pLCBucl9wYWdlcywgX21mbihwZm4pKTsKPiAKPiBNYXkgSSBhc2sgdGhh
dCB5b3UgbGVhdmUgYWxvbmUgdGhlIHVzZSBvZiB0aGUgY29uZGl0aW9uYWwKPiBvcGVyYXRvciBo
ZXJlLCBhbmQgX2p1c3RfIGFkZCB0aGUgbmV3IGFyZ3VtZW50PwoKWWVzLCBJIGNhbiBkbyB0aGF0
LiBUaGlzIGNoYW5nZSBpcyBkdWUgdG8gdGhlIHdheSBpdCB3YXMgZG9uZSBpbiB0aGUKcHJldmlv
dXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgYW55bW9yZS4K
Cgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKPiA+IEBAIC0yMjY0LDEyICsyMjY0LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
bW1pb19vcmRlcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ID4gIGludCBtYXBfbW1pb19yZWdp
b25zKHN0cnVjdCBkb21haW4gKmQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3Qgc3Rh
cnRfZ2ZuLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IG1mbl90IG1mbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQpCj4g
PiAgewo+ID4gICAgICBpbnQgcmV0ID0gMDsKPiA+ICAgICAgdW5zaWduZWQgbG9uZyBpOwo+ID4g
ICAgICB1bnNpZ25lZCBpbnQgaXRlciwgb3JkZXI7Cj4gPiAgCj4gPiArICAgIGlmICggcDJtdCAh
PSBwMm1fbW1pb19kaXJlY3QgKQo+ID4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+IAo+
IENvbnNpZGVyaW5nIHRoaXMgYW5kIC4uLgo+IAo+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21jdGwu
Ywo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+ID4gQEAgLTkyNyw2ICs5MjcsNyBAQCBs
b25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21j
dGwpCj4gPiAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMgPSBvcC0+dS5tZW1vcnlfbWFw
cGluZy5ucl9tZm5zOwo+ID4gICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm5fZW5kID0gbWZuICsg
bnJfbWZucyAtIDE7Cj4gPiAgICAgICAgICBpbnQgYWRkID0gb3AtPnUubWVtb3J5X21hcHBpbmcu
YWRkX21hcHBpbmc7Cj4gPiArICAgICAgICBwMm1fdHlwZV90IHAybXQ7Cj4gPiAgCj4gPiAgICAg
ICAgICByZXQgPSAtRUlOVkFMOwo+ID4gICAgICAgICAgaWYgKCBtZm5fZW5kIDwgbWZuIHx8IC8q
IHdyYXA/ICovCj4gPiBAQCAtOTM5LDYgKzk0MCwxMCBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpCj4gPiAgICAgICAgICAvKiBN
dXN0IGJyZWFrIGh5cGVyY2FsbCB1cCBhcyB0aGlzIGNvdWxkIHRha2UgYSB3aGlsZS4gKi8KPiA+
ICAgICAgICAgIGlmICggbnJfbWZucyA+IDY0ICkKPiA+ICAgICAgICAgICAgICBicmVhazsKPiA+
ICsKPiA+ICsgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3RfZGV2Owo+ID4gKyNlbHNlCj4g
PiArICAgICAgICBwMm10ID0gcDJtX21taW9fZGlyZWN0Owo+ID4gICNlbmRpZgo+IAo+IC4uLiB0
aGlzLCBpcyB0aGVyZSByZWFsbHkgdmFsdWUgaW4gYWRkaW5nIHRoZSBuZXcgcGFyYW1ldGVyIGZv
cgo+IHg4Nj8gQSB3cmFwcGVyIG1hY3JvIG9mIHRoZSBzYW1lIG5hbWUgY291bGQgYmUgdXNlZCB0
bwo+IHN0cmlwIHRoZSBuZXcgbGFzdCBhcmd1bWVudCBhdCBhbGwgY2FsbCBzaXRlcyAoY3VycmVu
dCBhbmQgZnV0dXJlCj4gb25lcykuCiAKU3VyZSwgbm8gcHJvYmxlbS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
