Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1D78E60
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6vz-0003WJ-Q5; Mon, 29 Jul 2019 14:47:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61H9=V2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hs6vy-0003WE-3F
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:47:30 +0000
X-Inumbo-ID: c9575e9b-b20f-11e9-8980-bc764e045a96
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9575e9b-b20f-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:47:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d24so58857800ljg.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/0w+hvxiGYPxPU0mtGqlG2o5L2iO31NV9clnjZND+wk=;
 b=BbS0Kwvu/Hwx1Ot5i4QHbmNVe8gmCFtV94R5H4WF7i9IQwBLUGh8kW73OPno0AGkVw
 CZyaDviPj4ptD/5jtD772SsKB/AJhgiW7aBMAWcFhyUQHDjYrGvX0tDgiBW8cx0zaowW
 PrD/kNKYMnleE3kP+v17C/70LWE4awzyMc7IBdcUeSMW6m+ja//B8Hqhm1A56Y3hP0At
 xSfpYn/l/0CMeZ7rofrBsREdGSEwN5eCVCiseEXQyAro9RjvNYwNem3eCdKxqfbotEOK
 WsMDlk0hoJ6wHQNUFCbxa+E1s7od73StVWYnqRP3JXctUPaSPoiYoOMRucVPbMhjbqPs
 txYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/0w+hvxiGYPxPU0mtGqlG2o5L2iO31NV9clnjZND+wk=;
 b=llk3SERlSt/8qJeX7wivQLsrHZ0lV+NAvxyK6uEsSzlW0XRCw7C+fAbz1H0fCPgGjc
 4B0eJ94D47GcrEb3KG2y7ytWBu4+VPH/0zA8ijrjop8UgHYoaWA2fe66m0ExtTCy+1WQ
 vB7b4RQAYXW74rgsuahPnTlQP7lT7JBXhn2eN+IL+1Ebo4ul5cxu3ARn3/64mGk5pDWb
 wCiOtSt26+qnN9fw5MaK6x+FA/X7VRnH3OyUcHWdxmSOIz8Ijci7FJ8h9ySGvENnkfhW
 c6O8YkbiP7f7l6arEJN6ETBmWpJusO9hwjtPh5+LSnfF1njuJNjT34h87tld/bc9x29C
 pSnw==
X-Gm-Message-State: APjAAAW7bcV0obeZdynUvv4QJ3oPiRm3NbmErPbii/lVVMRY6aDniq6K
 cyRz90rxhSMcKbP8Ycq9J3c=
X-Google-Smtp-Source: APXvYqzTPAJCp6C/opB332JaBNn7Kyr/hiNjd/k+m92SIXd4N/U+EhM+ReGT15LgGOWmuKyEPR2U3w==
X-Received: by 2002:a2e:7c14:: with SMTP id x20mr33330830ljc.56.1564411647790; 
 Mon, 29 Jul 2019 07:47:27 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t21sm12736553ljg.60.2019.07.29.07.47.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 07:47:27 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
 <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <30bb656e-fe48-e92e-403c-efc8fb7e8cb7@gmail.com>
Date: Mon, 29 Jul 2019 17:47:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
 Andrii Anisov <andrii_anisov@epam.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVlcmdlbiwKCk9uIDI2LjA3LjE5IDE1OjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4gwqAgLSBIb3cgdG8gYXZvaWQgdGhlIGFic29sdXRlIHRvcCBwcmlvcml0eSBvZiB0YXNrbGV0
cyAod2hhdCBpcyBvYmV5ZWQKPj4+IGJ5IGFsbAo+Pj4gwqDCoMKgIHNjaGVkdWxlcnMgc28gZmFy
KS4gU2hvdWxkIGlkbGUgdmNwdSBiZSBzY2hlZHVsZWQgYXMgdGhlIG5vcm1hbAo+Pj4gZ3Vlc3Qg
dmNwdXMKPj4+IMKgwqDCoCAodGhyb3VnaCBxdWV1ZXMsIHByaW9yaXRpZXMsIGV0Yyk/Cj4+Pgo+
PiBOb3csIHRoaXMgaXMgc29tZXRoaW5nIHRvIHRoaW5rIGFib3V0LCBhbmQgdHJ5IHRvIHVuZGVy
c3RhbmQgaWYKPj4gYW55dGhpbmcgd291bGQgYnJlYWsgaWYgd2UgZ28gZm9yIGl0LiBJIG1lYW4s
IEkgc2VlIHdoeSB5b3UnZCB3YW50IHRvCj4+IGRvIHRoYXQsIGJ1dCB0YXNrbGV0cyBhbmQgc29m
dGlycXMgd29ya3MgdGhlIHdheSB0aGV5IGRvLCBpbiBYZW4sIHNpbmNlCj4+IHdoZW4gdGhleSB3
ZXJlIGludHJvZHVjZWQsIEkgYmVsaWV2ZS4KPj4KPj4gVGhlcmVmb3JlLCBldmVuIGlmIHRoZXJl
IHdvdWxkbid0IGJlIGFueSBzdWJzeXN0ZW0gZXhwbGljaXRseSByZWx5aW5nCj4+IG9uIHRoZSBj
dXJyZW50IGJlaGF2aW9yICh3aGljaCBzaG91bGQgYmUgdmVyaWZpZWQpLCBJIHRoaW5rIHdlIGFy
ZSBhdAo+PiBoaWdoIHJpc2sgb2YgYnJlYWtpbmcgdGhpbmdzLCBpZiB3ZSBjaGFuZ2UuCj4gCj4g
V2UnZCBicmVhayB0aGluZ3MgSU1PLgo+IAo+IFRhc2tsZXRzIGFyZSBzb21ldGltZXMgdXNlZCB0
byBwZXJmb3JtIGFzeW5jIGFjdGlvbnMgd2hpY2ggY2FuJ3QgYmUgZG9uZQo+IGluIGd1ZXN0IHZj
cHUgY29udGV4dC4KCk9LLCB0aGF0IHN0dWZmIGNhbiBub3QgYmUgZG9uZSBpbiB0aGUgZ3Vlc3Qg
dmNwdSBjb250ZXh0LiBCdXQgd2h5IGNhbid0IGl0IGJlIGRvbmUgd2l0aCB0aGUgZ3Vlc3QncyBw
cmlvcml0eT8KCj4gTGlrZSBzd2l0Y2hpbmcgYSBkb21haW4gdG8gc2hhZG93IG1vZGUgZm9yIEwx
VEYKPiBtaXRpZ2F0aW9uLAoKU29ycnkgSSdtIG5vdCByZWFsbHkgYXdhcmUgd2hhdCBMMVRGIG1p
dGlnYXRpb24gaXMuCkJ1dAoKPiBvciBtYXJzaGFsbGluZyBhbGwgY3B1cyBmb3Igc3RvcF9tYWNo
aW5lKCkuCgpJIHRoaW5rIEkgZmFjZWQgc29tZSB0aW1lIGFnby4gV2hlbiBmaXhlZCBhIG5vdGlj
ZWFibGUgbGFnIGluIHZpZGVvIHBsYXliYWNrIGF0IHRoZSBtb21lbnQgb2YgdGhlIG90aGVyIGRv
bWFpbiByZWJvb3QuCgo+IFlvdSBkb24ndCB3YW50Cj4gdG8gYmUgYWJsZSB0byBibG9jayB0YXNr
bGV0cywgeW91IHdhbnQgdGhlbSB0byBydW4gYXMgc29vbiBhcyBwb3NzaWJsZS4KClNob3VsZCBp
dCByZWFsbHkgYmUgZG9uZSBpbiB0aGUgd2F5IG9mIGJyZWFraW5nIHNjaGVkdWxpbmc/IFdoYXQg
aWYgdGhlIHN5c3RlbSBoYXMgUlQgcmVxdWlyZW1lbnRzPwoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
