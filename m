Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6FB435D7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOjq-0003qm-KQ; Thu, 13 Jun 2019 12:21:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbOjo-0003qh-K8
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:21:52 +0000
X-Inumbo-ID: d168006c-8dd5-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d168006c-8dd5-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:21:50 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p24so14907014lfo.6
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVcrjs2b/9MpuP7aW3rc5Lo94kCyI8g+QplYM6nYrwo=;
 b=gQJNTDANwCJH7hkOPDWAmZ+rflcIcWr787uO+JPOfAmwCf08yaBY2U3D7POruwh24e
 q5V5XXXd9uzN/5lRTuyQ5mOiYrTIC6Gbb9djByDwvdyeVlnqLbdk608oT2M84gPXXgi1
 eBSN389lry+kViW4wIYCFqDmKUSg2NlOoNA7xx4aKZRSAQ3+WXpffoV295bENHps8dM9
 SBdUzFSHPyD+mR4x69D2nW4tn5FZ+nOkIkfYmGf4oLwReI7dvx8KeJt4PYMRy2PjL3Ds
 QpLofOcgy1a7X46nbeVFrQQTBFUSvZbnMgao6GZIWRjLU6t71vcLlOiCwc/eoAU0FC2q
 9PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVcrjs2b/9MpuP7aW3rc5Lo94kCyI8g+QplYM6nYrwo=;
 b=m43gdpkm9gabxfuywcePVkFwHZGLJ7FHiMMAOW5XXDSpsRm2V115aUvFmzEBNGZzos
 E/haBdC/re7UkCVKsEPiCBma9Ux2JD99ychcvjE3hjRqKxih0uOMfBSVoTANPET8Sduv
 CU9ZKFHe0Ip/9ki+n9o1R+t2U5FBkG9KZS88iipy0AWrNSmNzURwPpnYC/mX7i2vH3wN
 7Z4d1RCgHUF6F4BYN1Ct/ha3p/YyoHy4NhmR2MXXjn/wbImdzIkZJTUVPZc2SxtB5h29
 VJYv6xwrC99NBZMiwmdHwPgyn0oVd9ScOlbp00O1zykgCy9YI5FsY44pn8Iig7w6IMW8
 W/Og==
X-Gm-Message-State: APjAAAW2jKgNYK63ju5yXI9UYZgJp+ljAt4Zo5+xulfIMSManuv8GitL
 STfYoxcee+OY30ulTEbU6Zg=
X-Google-Smtp-Source: APXvYqyPaY3/Reco0HeGceLYEQRUvjMV7Qcw5KOLkX1kJh8m9xYiEsSO8Gm1KluJ8lE14ipaZ7Yh3Q==
X-Received: by 2002:a19:7607:: with SMTP id c7mr7211627lff.28.1560428508691;
 Thu, 13 Jun 2019 05:21:48 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y12sm638289lfy.36.2019.06.13.05.21.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:21:47 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
Message-ID: <f8f8ea51-46dd-7e0a-9b5b-4da439eee4c0@gmail.com>
Date: Thu, 13 Jun 2019 15:21:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuLAoKT24gMTEuMDYuMTkgMTM6MjIsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gSGVsbG8gSmFu
LAo+IAo+IE9uIDExLjA2LjE5IDEyOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBFeGNlcHQg
d2hlbiB0aGVyZSdzIG5vIG5lZWQgZm9yIEtQVEkgaW4gdGhlIGd1ZXN0IGluIHRoZSBmaXJzdCBw
bGFjZSwKPj4+PiBhcyBpcyB0aGUgY2FzZSBmb3IgeDg2LTY0IFBWIGd1ZXN0cy4gSSB0aGluayB0
aGlzIGlzIHdvcnRod2hpbGUgY2xhcmlmeWluZy4KPj4+Cj4+PiBJIGFtIG5vdCBzdXJlIHdoYXQg
aXMgeW91ciBwb2ludCBoZXJlLiBBdCBsZWFzdCBvbiBBcm0sIHVzaW5nIHZpcnR1YWwgYWRkcmVz
cyBpcwo+Pj4gbm90IHNhZmUgYXQgYWxsICh3aGV0aGVyIEtQVEkgaXMgdXNlZCBvciBub3QpLiBB
IGd1ZXN0IGNhbiBnZW51aW5lbHkgZGVjaWRlcyB0bwo+Pj4gc2hhdHRlciB0aGUgbWFwcGluZyB3
aGVyZSB0aGUgdmlydHVhbCBhZGRyZXNzIGlzLiBPbiBBcm0sIHRoaXMgcmVxdWlyZSB0byB1c2UK
Pj4+IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gSXQgbWVhbnMgdGhlIHRyYW5zbGF0
aW9uIFZBIC0+IFBBIG1heSBmYWlsIGlzCj4+PiB5b3UgaGFwcGVuIHRvIGRvIGl0IHdoaWxlIHRo
ZSBndWVzdCBpcyB1c2luZyB0aGUgc2VxdWVuY2UuCj4+Pgo+Pj4gU29tZSBvZiB0aGUgaW50ZXJt
aXR0ZW50IGlzc3VlcyBJIGhhdmUgc2VlbiBvbiB0aGUgQXJuZGFsZSBpbiB0aGUgcGFzdCBbMV0g
bWlnaHQKPj4+IGJlIHJlbGF0ZWQgdG8gdXNpbmcgdmlydHVhbCBhZGRyZXNzLiBJIGFtIG5vdCAx
MDAlIHN1cmUgYmVjYXVzZSBldmVuIGlmIHRoZQo+Pj4gZGVidWcsIHRoZSBlcnJvciBkb2VzIG5v
dCBtYWtlIHNlbnNlLiBCdXQgdGhpcyBpcyB0aGUgbW9zdCBwbGF1c2libGUgcmVhc29uIGZvcgo+
Pj4gdGhlIGZhaWx1cmUuCj4+Cj4+IEFsbCBmaW5lLCBidXQgQXJtLXNwZWNpZmljLiBUaGUgcG9p
bnQgb2YgbXkgY29tbWVudCB3YXMgdG8gYXNrIHRvIGNhbGwKPj4gb3V0IHRoYXQgdGhlcmUgaXMg
b25lIGVudmlyb25tZW50ICh4ODYtNjQgUFYpIHdoZXJlIHRoaXMgS1BUSQo+PiBkaXNjdXNzaW9u
IGlzIGVudGlyZWx5IGluYXBwbGljYWJsZS4KPiAKPiBJIGFkbWl0IHRoYXQgeDg2IHNwZWNpZmlj
cyBhcmUgcXVpdGUgdW5jbGVhciB0byBtZSBzbyBjbGFyaWZpY2F0aW9ucyBhbmQgY29ycmVjdGlv
bnMgaW4gdGhhdCBkb21haW4gYXJlIGRlc2lyYWJsZS4KCkNvdWxkIHlvdSBwbGVhc2UgZWxhYm9y
YXRlIG1vcmUgYWJvdXQgdGhpcz8KRG8geW91IG1lYW4gdGhhdCBtb3JlIHdvcmRzIHNob3VsZCBi
ZSBhZGRlZCB0byB0aGUgY29tbWl0IG1lc3NhZ2UgYWJvdXQgeDg2PwpJZiBzbywgcGxlYXNlIHBy
b3ZpZGUgd2hhdCBpcyBwcm9wZXIgZnJvbSB5b3VyIHBvaW50IG9mIHZpZXcuCgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
