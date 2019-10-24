Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF3E37A8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 18:15:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNfic-0002C9-8x; Thu, 24 Oct 2019 16:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/iVV=YR=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1iNfia-0002C4-2i
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 16:12:08 +0000
X-Inumbo-ID: 06780daa-f679-11e9-94a9-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06780daa-f679-11e9-94a9-12813bfff9fa;
 Thu, 24 Oct 2019 16:12:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 929D92166E
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571933526;
 bh=BLLHDwROAf93/5MRoMht9A1lnkPiEcUf5wYfxbtqWxA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UjxlRqauqd1oPrLF6wvfCI5vlf/DbwgbzgAYwey/swEIg/Rfr34fBH2cSP+PmeuIf
 z6iEn1sirtCTIQESDvvm2jLkaitv4Ve6PXu2PtCzugch8oVQumox5H6z1aPgaku1aF
 Yz8Kopr2w9TnVbZTqYbnLd0ajio/aI2mxHDFKwWA=
Received: by mail-wr1-f49.google.com with SMTP id q13so21771293wrs.12
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 09:12:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVN6khA5u+lvUkzCcIWn77CKdUS27aimj6nAr3kXmSZifciMyFV
 /rzFzQz9V9KPRsVpw4LfokrD0zHWwmwjlfBM1RsxgQ==
X-Google-Smtp-Source: APXvYqwWZ1XyZeseylBIXNV03ODFkP+QjhC4uOR0zXgYX/4Z31HQ+LXWD4NhDb2q68L752kFVGb0TQYpK1h9egr5uLk=
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr4378059wrt.195.1571933525027; 
 Thu, 24 Oct 2019 09:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
In-Reply-To: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 24 Oct 2019 09:11:53 -0700
X-Gmail-Original-Message-ID: <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
Message-ID: <CALCETrWAALF7EgxHGs-rtZwk1Fxttr56QKXeB6QssXbyXDs+kA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 X86 ML <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [Xen-devel] [PATCH] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCAzOjQxIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbmNlIGFnYWluIFJQTCBjaGVja3MgaGF2ZSBiZWVuIGludHJvZHVj
ZWQgd2hpY2ggZG9uJ3QgYWNjb3VudCBmb3IgYQo+IDMyLWJpdCBrZXJuZWwgbGl2aW5nIGluIHJp
bmcgMSB3aGVuIHJ1bm5pbmcgaW4gYSBQViBYZW4gZG9tYWluLiBUaGUKPiBjYXNlIGluIEZJWFVQ
X0ZSQU1FIGhhcyBiZWVuIHByZXZlbnRpbmcgYm9vdDsgYWRqdXN0IEJVR19JRl9XUk9OR19DUjMK
PiBhcyB3ZWxsIGp1c3QgaW4gY2FzZS4KCkknbSBva2F5IHdpdGggdGhlIGdlbmVyYXRlZCBjb2Rl
LCBidXQgSU1PIHRoZSBtYWNybyBpcyB0b28gaW5kaXJlY3QKZm9yIHNvbWV0aGluZyB0aGF0J3Mg
dHJpdmlhbC4KCj4KPiBGaXhlczogM2M4OGM2OTJjMjg3ICgieDg2L3N0YWNrZnJhbWUvMzI6IFBy
b3ZpZGUgY29uc2lzdGVudCBwdF9yZWdzIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TCj4g
KysrIGIvYXJjaC94ODYvZW50cnkvZW50cnlfMzIuUwo+IEBAIC00OCw2ICs0OCwxNyBAQAo+Cj4g
ICNpbmNsdWRlICJjYWxsaW5nLmgiCj4KPiArI2lmbmRlZiBDT05GSUdfWEVOX1BWCj4gKyMgZGVm
aW5lIFVTRVJfU0VHTUVOVF9SUExfTUFTSyBTRUdNRU5UX1JQTF9NQVNLCj4gKyNlbHNlCj4gKy8q
Cj4gKyAqIFdoZW4gcnVubmluZyBwYXJhdmlydHVhbGl6ZWQgb24gWGVuIHRoZSBrZXJuZWwgcnVu
cyBpbiByaW5nIDEsIGFuZCBoZW5jZQo+ICsgKiBzaW1wbGUgbWFzayBiYXNlZCB0ZXN0cyAoaS5l
LiBvbmVzIG5vdCBjb21wYXJpbmcgYWdhaW5zdCBVU0VSX1JQTCkgaGF2ZSB0bwo+ICsgKiBpZ25v
cmUgYml0IDAuIFNlZSBhbHNvIHRoZSBDLWxldmVsIGdldF9rZXJuZWxfcnBsKCkuCj4gKyAqLwoK
SG93IGFib3V0OgoKLyoKICogV2hlbiBydW5uaW5nIG9uIFhlbiBQViwgdGhlIGFjdHVhbCAlY3Mg
cmVnaXN0ZXIgaW4gdGhlIGtlcm5lbCBpcyAxLCBub3QgMC4KICogSWYgd2UgbmVlZCB0byBkaXN0
aW5ndWlzaCBiZXR3ZWVuIGEgJWNzIGZyb20ga2VybmVsIG1vZGUgYW5kIGEgJWNzIGZyb20KICog
dXNlciBtb2RlLCB3ZSBjYW4gZG8gdGVzdCAkMiBpbnN0ZWFkIG9mIHRlc3QgJDMuCiAqLwojZGVm
aW5lIFVTRVJfU0VHTUVOVF9SUExfTUFTSyAyCgpidXQuLi4KCj4gKyMgZGVmaW5lIFVTRVJfU0VH
TUVOVF9SUExfTUFTSyAoU0VHTUVOVF9SUExfTUFTSyAmIH4xKQo+ICsjZW5kaWYKPiArCj4gICAg
ICAgICAuc2VjdGlvbiAuZW50cnkudGV4dCwgImF4Igo+Cj4gIC8qCj4gQEAgLTE3Miw3ICsxODMs
NyBAQAo+ICAgICAgICAgQUxURVJOQVRJVkUgImptcCAuTGVuZF9cQCIsICIiLCBYODZfRkVBVFVS
RV9QVEkKPiAgICAgICAgIC5pZiBcbm9fdXNlcl9jaGVjayA9PSAwCj4gICAgICAgICAvKiBjb21p
bmcgZnJvbSB1c2VybW9kZT8gKi8KPiAtICAgICAgIHRlc3RsICAgJFNFR01FTlRfUlBMX01BU0ss
IFBUX0NTKCVlc3ApCj4gKyAgICAgICB0ZXN0bCAgICRVU0VSX1NFR01FTlRfUlBMX01BU0ssIFBU
X0NTKCVlc3ApCgpTaG91bGRuJ3QgUFRfQ1MoJWVzcCkgYmUgMCBpZiB3ZSBjYW1lIGZyb20gdGhl
IGtlcm5lbD8gIEknbSBndWVzc2luZwp0aGUgYWN0dWFsIGJ1ZyBpcyBpbiB3aGF0ZXZlciBjb2Rl
IHB1dCAxIGluIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSW4gb3RoZXIgd29yZHMsIEknbSBo
YXZpbmcgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIHdoeSB0aGVyZSBpcyBhbnkKY29udGV4dCBpbiB3
aGljaCBzb21lIHZhbHVlIHdvdWxkIGJlIDMgZm9yIHVzZXIgbW9kZSBhbmQgMSBmb3Iga2VybmVs
Cm1vZGUuICBPYnZpb3VzbHkgaWYgd2UncmUgbWFudWFsbHkgSVJFVGluZyB0byBrZXJuZWwgbW9k
ZSwgd2UgbmVlZCB0bwpzZXQgQ1MgdG8gMSwgYnV0IGlmIHdlJ3JlIGZpbGxpbmcgaW4gb3VyIG93
biBQVF9DUywgd2Ugc2hvdWxkIGp1c3QKd3JpdGUgMC4KClRoZSBzdXBwb3NlZGx5IG9mZmVuZGlu
ZyBjb21taXQgKCIieDg2L3N0YWNrZnJhbWUvMzI6IFByb3ZpZGUKY29uc2lzdGVudCBwdF9yZWdz
IikgbG9va3MgY29ycmVjdCB0byBtZSwgc28gSSBzdXNwZWN0IHRoYXQgdGhlCnByb2JsZW0gaXMg
ZWxzZXdoZXJlLiAgT3IgaXMgaXQgaW50ZW50aW9uYWwgdGhhdCBYZW4gUFYncyBhc20KKGFyY2gv
eDg2L3hlbi93aGF0ZXZlcikgc3RpY2tzIDEgaW50byB0aGUgQ1MgZmllbGQgb24gdGhlIHN0YWNr
PwoKQWxzbywgd2h5IGFyZSB3ZSBzdXBwb3J0aW5nIDMyLWJpdCBMaW51eCBQViBndWVzdHMgYXQg
YWxsPyAgQ2FuIHdlCmp1c3QgZGVsZXRlIHRoaXMgY29kZSBpbnN0ZWFkPwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
