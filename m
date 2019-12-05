Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F7113944
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 02:25:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icfob-0002Kt-HR; Thu, 05 Dec 2019 01:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nb4M=Z3=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1icfoZ-0002Ko-Hm
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 01:20:19 +0000
X-Inumbo-ID: 66416156-16fd-11ea-a0d2-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66416156-16fd-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 01:20:18 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i11so1761226iol.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 17:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qjUmHPdM4j2PD0HjewDVT0nTEnl7hmHhtj2SttwPsp8=;
 b=hpK3ZzxGvzAA6Yc/t9rRixctiwGrooabPqj8pcxOfRvfiSEVMz4f75EWOYGn4l4MKa
 S3KPPzdUnAN6zUlq5sYqFlp2IBKVGCm57mdXzRhJYNDD4wV36FE19AdVXTLTm5Ww6XPm
 dnHt1OiHJZ201NsNy6Ju1wzQvhIaUesXbBcbWO63OPzjgvuPSvzuNuLuARNyn2nKrJk5
 GCD3Yo8jg2qnHUSVS1eqMm6uX7tIxHPepZVf51GSK/lCfJVAgArzT8PtWtc69zSCPxk3
 BD+/gi2TLVaoOIuvrd7qjTbytVyTGvCrW9lYjMQq3fGeXeJC9OxFMxadb8kXbxDapoGv
 D5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qjUmHPdM4j2PD0HjewDVT0nTEnl7hmHhtj2SttwPsp8=;
 b=GHOmWljeSQ8JRPn+Eob9pqDhm2DCZi02bEnyeLsQQN0vB5wm6ieWeD2PKCoiabWVIL
 B2d5a+0bLzkFUoHY0hTcZoBnwYYj79CsewcKgZHeV+pRTbFLPEniRIu5N95uqhR7Li0m
 nAvGpMKaeRjLOE6VmW5DrUDBJSk3faNv9ghabfEY7wtqyGbCstMoZE6qessyOruLDUci
 zP3S0WD+pw5es9u2i8dqWZQFhkWrKkS2YZXZw8eP17I3s6q9IxBYkA8DuYhwW5SM5DVN
 +9Lc3P606a6mok9uNRPqkQfmdgp2vEN4lLdh2BMw9EfQ9bKyevEM+84Tmtq2f91QNceh
 4quQ==
X-Gm-Message-State: APjAAAV8GsvM7kwGPS8d2Z6DCB0WwjYsq+J32TDGHOrsC9yisP0LBLJk
 tNwvHpfi1zHsPBCciIez8TvQAcM4bv+rFXDrkB0=
X-Google-Smtp-Source: APXvYqzygQiO5zGzdtMKUD6BMSqGfx7OS57IYoWoOQLF0UZ2oYZYg5KW4IyX9wgTgTiUxkq7HWubg+qgHHmCRXxNKgQ=
X-Received: by 2002:a02:c787:: with SMTP id n7mr5956795jao.85.1575508818267;
 Wed, 04 Dec 2019 17:20:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:41d:0:0:0:0 with HTTP; Wed, 4 Dec 2019 17:20:17
 -0800 (PST)
In-Reply-To: <65509778-2d73-6ed4-1537-95c5ae54e36e@suse.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
 <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
 <20191204071433.GA5806@gentoo-tp.home>
 <65509778-2d73-6ed4-1537-95c5ae54e36e@suse.com>
From: Pry Mar <pryorm09@gmail.com>
Date: Wed, 4 Dec 2019 17:20:17 -0800
Message-ID: <CAHnBbQ_3J9azmqO9PEK8QywZ3HZVtYgpi1KrP7=KyjvkZNveXw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: jgross@suse.com, xen-devel <xen-devel@lists.xenproject.org>,
 Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNC8xOSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NC4xMi4yMDE5IDA4OjE0LCBKZXJlbWkgUGlvdHJvd3NraSB3cm90ZToKPj4gQW55IHN1Z2dlc3Rp
b25zIGhvdyB0byBwcm9jZWVkPwo+Cj4gQWN0dWFsbHkgaGVyZSdzIGEgYmV0dGVyIHZlcnNpb24g
KEkgdGhpbmspLgo+Cj4gSmFuCj4KPiBsejQ6IHJlZmluZSBjb21taXQgOTE0M2E2YzU1ZWY3IGZv
ciB0aGUgNjQtYml0IGNhc2UKPgo+IEkgY2xlYXJseSB3ZW50IHRvbyBmYXIgdGhlcmU6IFdoaWxl
IHRoZSBMWjRfV0lMRENPUFkoKSBpbnN0YW5jZXMgaW5kZWVkCj4gbmVlZCBwcmlvciBndWFyZGlu
ZywgTFo0X1NFQ1VSRUNPUFkoKSBuZWVkcyB0aGlzIG9ubHkgaW4gdGhlIDMyLWJpdCBjYXNlCj4g
KHdoZXJlIGl0IHNpbXBseSBhbGlhc2VzIExaNF9XSUxEQ09QWSgpKS4gImNweSIgY2FuIHZhbGlk
bHkgcG9pbnQKPiAoc2xpZ2h0bHkpIGJlbG93ICJvcCIgaW4gdGhlc2UgY2FzZXMsIGR1ZSB0bwo+
Cj4gCQljcHkgPSBvcCArIGxlbmd0aCAtIChTVEVQU0laRSAtIDQpOwo+Cj4gd2hlcmUgbGVuZ3Ro
IGNhbiBiZSBhcyBsb3cgYXMgMCBhbmQgU1RFUFNJWkUgaXMgOC4gSG93ZXZlciwgaW5zdGVhZCBv
Zgo+IHJlbW92aW5nIHRoZSBjaGVjayB2aWEgIiNpZiAhTFo0X0FSQ0g2NCIsIHJlZmluZSBpdCBz
dWNoIHRoYXQgaXQgd291bGQKPiBhbHNvIHByb3Blcmx5IHdvcmsgaW4gdGhlIDY0LWJpdCBjYXNl
LCBhYm9ydGluZyBkZWNvbXByZXNzaW9uIGluc3RlYWQKPiBvZiBjb250aW51aW5nIG9uIGJvZ3Vz
IGlucHV0Lgo+Cj4gUmVwb3J0ZWQtYnk6IE1hcmsgUHJ5b3IgPHByeW9ybTA5QGdtYWlsLmNvbT4K
PiBSZXBvcnRlZC1ieTogSmVyZW1pIFBpb3Ryb3dza2kgPGplcmVtaS5waW90cm93c2tpQGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4K
PiAtLS0gdW5zdGFibGUub3JpZy94ZW4vY29tbW9uL2x6NC9kZWNvbXByZXNzLmMKPiArKysgdW5z
dGFibGUveGVuL2NvbW1vbi9sejQvZGVjb21wcmVzcy5jCj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBz
dGF0aWMgaW50IElOSVQgbHo0X3VuY29tcHJlc3MoY29uc3QgdW5zCj4gIAkJCQlnb3RvIF9vdXRw
dXRfZXJyb3I7Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAtCQlpZiAodW5saWtlbHkoKHVuc2ln
bmVkIGxvbmcpY3B5IDwgKHVuc2lnbmVkIGxvbmcpb3ApKQo+ICsJCWlmICh1bmxpa2VseSgodW5z
aWduZWQgbG9uZyljcHkgPCAodW5zaWduZWQgbG9uZylvcCAtIChTVEVQU0laRSAtIDQpKSkKPiAg
CQkJZ290byBfb3V0cHV0X2Vycm9yOwo+ICAJCUxaNF9TRUNVUkVDT1BZKHJlZiwgb3AsIGNweSk7
Cj4gIAkJb3AgPSBjcHk7IC8qIGNvcnJlY3Rpb24gKi8KPiBAQCAtMjc5LDcgKzI3OSw3IEBAIHN0
YXRpYyBpbnQgbHo0X3VuY29tcHJlc3NfdW5rbm93bm91dHB1dHMKPiAgCQkJCWdvdG8gX291dHB1
dF9lcnJvcjsKPiAgCQkJY29udGludWU7Cj4gIAkJfQo+IC0JCWlmICh1bmxpa2VseSgodW5zaWdu
ZWQgbG9uZyljcHkgPCAodW5zaWduZWQgbG9uZylvcCkpCj4gKwkJaWYgKHVubGlrZWx5KCh1bnNp
Z25lZCBsb25nKWNweSA8ICh1bnNpZ25lZCBsb25nKW9wIC0gKFNURVBTSVpFIC0gNCkpKQo+ICAJ
CQlnb3RvIF9vdXRwdXRfZXJyb3I7Cj4gIAkJTFo0X1NFQ1VSRUNPUFkocmVmLCBvcCwgY3B5KTsK
PiAgCQlvcCA9IGNweTsgLyogY29ycmVjdGlvbiAqLwo+Cj4KVGhpcyBwYXRjaCB3b3JrZWQgYnVp
bGRpbmcgeGVuLTQuMTIuMSBpbiBCdXN0ZXIgd2l0aCBweXRob24zLgoKSSBjYW4gbm93IGJvb3Qg
Rm9jYWwga2VybmVsLTUuMyB3aGljaCBpcyBMWjQgY29tcHJlc3NlZC4gVGhlIGRvbVUgY2FuCmJv
b3QgYXMgcHYsIHB2aCwgdXNpbmcgZGlyZWN0IGtlcm5lbCAoa2VybmVsL3JhbWRpc2spLCBvciBw
eWdydWIuCgpJIGxvb2tlZCBpbnRvIGJvb3RpbmcgYXMgcHZncnViMiwgdGhpbmtpbmcgdGhlIGNv
ZGUgaXMgdW5pdmVyc2FsLCBidXQKbm8uIFRoYXRzIHdoeSBJIENDJ2QgSnVlcmdlbi4gSSB3YW50
ZWQgdG8gZG8gYSBrZXJuZWwgZGlyZWN0IGJvb3Qgd2l0aApzY3JpcHRlZCBwdmdydWIyIGtlcm5l
bC4KCkkgZXhwZWN0IHRoYXQgb25jZSBJIGJ1aWxkIHN0dWJkb20gaW5jbHVkaW5nIHRoaXMgcGF0
Y2gsIHRoZW4gcHZncnViCndpbGwgd29yayB0b28uCgpUaGFua3MgZm9yIHRoZSBhdHRlbnRpb24g
dG8gdGhpcyBidWcsIG5vdyBzb2x2ZWQuClByeU1hcjU2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
