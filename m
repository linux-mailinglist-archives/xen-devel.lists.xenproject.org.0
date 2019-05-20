Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4623090
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSejr-0003sW-4L; Mon, 20 May 2019 09:37:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSejq-0003sR-0E
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:37:46 +0000
X-Inumbo-ID: eb6095b3-7ae2-11e9-8980-bc764e045a96
Received: from mail-it1-x131.google.com (unknown [2607:f8b0:4864:20::131])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb6095b3-7ae2-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:37:44 +0000 (UTC)
Received: by mail-it1-x131.google.com with SMTP id g23so4541645iti.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMy1j75cB9jx72rucQ21eDzpGBTHvmBunMMjmvrNi/U=;
 b=eT7MN0ZUGDV7vpQCP4ZJghHgZPwC1X/6DvSFdD4ZpztkV2E4d8zghXxFNmu+onlKfC
 +BDQSV6dEoUDLMs8wnvWSWcZ0oMz0W0oJ1OHHlJqSLqdJGK6wZFgrZGF3z2KzRV8RvFK
 ZGGKbbxtxLDDi3ea5fCX6mi+GRmri8taoT7JVcNeShBybNfTQVeZF4jxLuRe/fRor0BC
 aVP2kEBl+oBDfTHY+vXGJ+nXfX33B1CVQdWy3FJm2BST1j+lh43oLpaJKff5t067jljg
 COQtIxL/J0s3CbTYjzB/01GOd29RgGuyJYDulo8yhE1uY3Rg9Zx6sfpfKDiypsS2kSL1
 L0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMy1j75cB9jx72rucQ21eDzpGBTHvmBunMMjmvrNi/U=;
 b=ho6ctCDNDmvR2v+m3KZ9x3ltE5i1FOAWnfJdM77OeT8zz0tEeTkoLI7vboMZjb0LnE
 QuLDf0LXK3pUBnzA0br7Rpt9dg6NpfgbWJm0KdTLHxFTXzU4+y4/bFQwxEGOUJLn+TD4
 Xfsz9O0aaBIEjz1r5Y25pywgiB0VP9gO2PW8WwMXFIyo1SZus2CTNQtj8OVh+MuJCLyW
 a23i2RHD0miuJEVZVBAnI9cPrAYLfbV1IjgJtTO7TthPveTwiJP98gutTkQ8mUZzKCIO
 IJBaLkVxjd5PZpkrZ5ww0C8FtfA6x4gF+yY1ufSaZ3nSbeYlTtTjs+RJfSm1W5f+xDrs
 n4FQ==
X-Gm-Message-State: APjAAAU+bqtw6y7Gxj7sAxs1Rn/FTlPABkK1/omYvr5Kvmls+kx7P0pT
 6rLiCNGx4iSM9yrZDOcKQPwvvoKcKvZbGs07EJs=
X-Google-Smtp-Source: APXvYqyBElgcIvF+QwF34epcIfrnaSHzJ78i1XBs5rcJ4mC5rCqQvAXLhxGNFrcAyzDCy0+wvqNYXWlFDo1wMW6MZGg=
X-Received: by 2002:a24:440c:: with SMTP id o12mr13307213ita.145.1558345063748; 
 Mon, 20 May 2019 02:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
In-Reply-To: <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 20 May 2019 12:37:31 +0300
Message-ID: <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTI6MjIgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8wNS8yMDE5IDEwOjE3LCBWaWt0b3Ig
TWl0aW4gd3JvdGU6Cj4gPj4+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihpbnQ2NF90KXZhZGRyID4+
IDYzIiBjYW4gYmUgMCBvciAxLgo+ID4+PiBTbyB0aGUgbmV4dCBjb2RlIG1heSBub3Qgd29yayBw
cm9wZXJseSBpbiBjYXNlIG9mIGFub3RoZXIgJ2ltcGxlbWVudGF0aW9ucycuCj4gPj4+IFdpdGgg
YW5vdGhlciBjb21waWxlciAoaS5lLiBjbGFuZywgZXRjKSB0aGlzIGNvZGUgbWF5IGludHJvZHVj
ZSBidWdzCj4gPj4+IHdoaWNoIGFyZSBoYXJkIHRvIGZpbmQuCj4gPj4+Cj4gPj4+ICgoaW50NjRf
dCl2YWRkciA+PiA0NykgPT0gKChpbnQ2NF90KXZhZGRyID4+IDYzKQo+ID4+Pgo+ID4+PiBGb3Ig
dGhpcyByZWFzb24gaXQgaXMgYmV0dGVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRlZmluZWQg
Y29kZS4KPiA+PiBXZWxsLCBpZGVhbGx5IHdlJ2QgbGlrZSB0byBnZXQgYXdheSB3aXRob3V0IHVz
aW5nIGltcGxlbWVudGF0aW9uCj4gPj4gZGVmaW5lZCBiZWhhdmlvci4gQnV0IEknbSBhZnJhaWQg
d2UncmUgcXVpdGUgZmFyIGZyb20gdGhhdCwgYW5kCj4gPj4gd2UnZCBub3QgYWx3YXlzIGJlIHdp
bGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5kL29yCj4gPj4gYmluYXJ5IGNvZGUg
dGhhdCB3b3VsZCBiZSBuZWVkZWQgdG8gYXZvaWQgaXQuCj4gPiBIb3cgYWJvdXQgdXNpbmcgdGhl
IG5leHQgb25lLWxpbmVyIHRvIGF2b2lkIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSA6Cj4g
Pgo+ID4gLy9SZXR1cm5zIHRydWUgaW4gY2FzZSB3aGVuIHRoZSB0b3AgbGVmdCAxNyBiaXRzIGFy
ZSBhbGwgemVybyBvciBhcmUgYWxsIG9uZQo+ID4gcmV0dXJuICgoISh2YWRkciA+PiA0NykpIHx8
ICgoKHZhZGRyID4+IDQ3KSYweDFGRkZGKSA9PSAweDFGRkZGKSkKPgo+IEhhdmUgeW91IHRyaWVk
IGNvbXBpbGluZyB0aGVzZSB0d28gZXhhbXBsZXMgYW5kIHNlZWluZyBob3cgdGhleSBkaWZmZXI/
Cj4KClllcywgSSd2ZSB0cmllZCBpdCB3aXRoIHRoZSBuZXh0IGRyYWZ0IHRlc3QgY29kZS4KVGhl
IHJlc3VsdCBsb29rcyBvaywgaG93ZXZlciBpdCB0YWtlcyB0aW1lIHRvIGNoZWNrIGFsbCA2NGJp
dHMgdmFsdWVzCm9uZSBieSBvbmUuLi4KRG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggbmV3IG9u
ZS1saW5lcj8KCi8vY29tcGlsZSBsaW5lOiBjbGFuZyAtZm9wZW5tcCAtZyAgYi5jICAmJiB0aW1l
IC4vYS5vdXQKI2luY2x1ZGUgPG9tcC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0
ZGxpYi5oPgoKaW50IG1haW4odm9pZCkgewogICAgdW5zaWduZWQgbG9uZyAgdmFkZHJfbWF4ID0g
MHhmZmZmZmZmZmZmZmZmZmZmOwogICAgdHlwZWRlZiBzaWduZWQgbG9uZyBpbnQ2NF90OwoKICAg
IHVuc2lnbmVkIGxvbmcgaTsKI3ByYWdtYSBvbXAgcGFyYWxsZWwgZm9yIHByaXZhdGUoaSkKICAg
IGZvciAoaSA9IDAgOyBpICE9IHZhZGRyX21heDsgaT1pKzB4ZmZmZmZmZmYpCiAgICB7Ci8vICAg
ICAgcHJpbnRmKCJpID0gMHglbHggXG4iLCBpICk7CiAgICAgICAgaW50IHJlc19vcmlnID0gKChp
bnQ2NF90KWkgPj4gNDcpID09ICgoaW50NjRfdClpID4+IDYzKSA7CgogICAgICAgIHVuc2lnbmVk
IGxvbmcgIHYgPSBpID4+IDQ3OwogICAgICAgIGludCByZXNfbmV3ID0gKCghdikgfHwgKCh2JjB4
MUZGRkYpID09IDB4MUZGRkYpKTsKCiAgICAgICAgaWYgKCByZXNfb3JpZyAhPSByZXNfbmV3ICkK
ICAgICAgICB7CiAgICAgICAgICAgIHByaW50ZigicmVzX29yaWcgPSAlZCBcbiIsIHJlc19vcmln
KTsKICAgICAgICAgICAgcHJpbnRmKCJyZXNfbmV3ICA9ICVkIFxuIiwgcmVzX25ldyk7CiAgICAg
ICAgICAgIHByaW50ZigiaSA9ICVseCBcbiIsIGkpOwogICAgICAgICAgICBwcmludGYoInYgPSAl
bHggXG4iLCB2KTsKICAgICAgICAgICAgcHJpbnRmKCIodiYweDFGRkZGKSA9ICVseCBcbiIsICh2
JjB4MUZGRkYpICk7CiAgICAgICAgICAgIHByaW50ZigiKHYmMHgxRkZGRikgID09IHYgPSAlZCBc
biIsICh2JjB4MUZGRkYpID09IHYgKTsKICAgICAgICAgICAgcHJpbnRmKCJpID4+IDQ3ID0gJWx4
IFxuIiwgaSA+PiA0Nyk7CiAgICAgICAgICAgIHByaW50ZigiKGludDY0X3QpaSA+PiA0NyA9ICVs
eCBcbiIsIChpbnQ2NF90KWkgPj4gNDcpOwogICAgICAgICAgICBwcmludGYoIndyb25nIGkgPSAw
eCVseCBcbiIsIGkpOwogICAgICAgICAgICBleGl0KDEpOwogICAgICAgIH0KICAgIH0KCiAgICBy
ZXR1cm4gMDsKfQoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
