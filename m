Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B420413A79D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:41:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJbe-0004fI-94; Tue, 14 Jan 2020 10:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irJbc-0004fD-3q
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:39:28 +0000
X-Inumbo-ID: 2214b00a-36ba-11ea-8369-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2214b00a-36ba-11ea-8369-12813bfff9fa;
 Tue, 14 Jan 2020 10:39:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d73so13134815wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 02:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1ou7Q1Tt39EVlujJbnUPqaft7WmP7y4wqduf7r48tQ=;
 b=MVIKIY0JQJ9mI8/DBSLEphEWPl+Eq3YR0Nr0KNMzXlXD86VoOKCmaDP+UXbD9d9P9W
 MhEazZI7y5rV+Ss4mtlKL17oLgEcgyUc8omPdRsQW3+Wq9bMd8ATQWMUmUM1kZ/eDLxo
 H8X4uaizWKowkmW+RuVZusn6ZPIzQVcRQ+3SBSRZERWDuelJ1Rf24eDDytanMu8XuZiT
 QWfLTWBjfq+GPvPniAPEnSYP2gro5lbZz0wJ+MrMnYwa/39rFZ4Ti52/41WC49/CkYhB
 TMXdacmn86L1kUc/yt7+GiiKGcTrP66s5bX1WYv06m2BNDFFy0/LEWcY7/xKDjYZIx+f
 J69g==
X-Gm-Message-State: APjAAAVL8UB6JqgUhL6fkHHXQMzNNEHB8ypuNgYrFJcSbDEnzfIRUUpf
 DO/z5j3KbBTZzK5+KsSE6ug=
X-Google-Smtp-Source: APXvYqwkIB1MpoBm66jRRIwZvHvSiojL+Fk8AXSTwbxS2JtTHhzMYSwRrJrPAFcXTm8nTQGn025APQ==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr27233499wmo.147.1578998364792; 
 Tue, 14 Jan 2020 02:39:24 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id r68sm18005132wmr.43.2020.01.14.02.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 02:39:24 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <cb84362c-d175-7a71-89cc-17ce0c523b09@suse.com>
 <09fa90a8-b58a-04e9-ccae-702b3b092c4a@xen.org>
 <0349a697-a413-2aa8-3ab2-c66539b382e0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3775744f-8a54-6427-418e-158bb7daf097@xen.org>
Date: Tue, 14 Jan 2020 10:39:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <0349a697-a413-2aa8-3ab2-c66539b382e0@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] IRQ: u16 is too narrow for an event channel
 number
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTQvMDEvMjAyMCAxMDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQu
MDEuMjAyMCAxMToxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKYW4sCj4+Cj4+IE9uIDE0
LzAxLzIwMjAgMTA6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gRklGTyBldmVudCBjaGFubmVs
cyBhbGxvdyBwb3J0cyB1cCB0byAyXjE3LCBzbyB3ZSBuZWVkIHRvIHVzZSBhIHdpZGVyCj4+PiBm
aWVsZCBpbiBzdHJ1Y3QgcGlycS4gTW92ZSAibWFza2VkIiBzdWNoIHRoYXQgaXQgbWF5IHNoYXJl
IHRoZSA4LWJ5dGUKPj4+IHNsb3Qgd2l0aCBzdHJ1Y3QgYXJjaF9waXJxIG9uIDY0LWJpdCBhcmNo
ZXMsIHJhdGhlciB0aGFuIGxlYXZpbmcgYQo+Pj4gNy1ieXRlIGhvbGUgaW4gYWxsIGNhc2VzLgo+
Pj4KPj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGFkZCBhIGNvbW1lbnQgcmVnYXJk
aW5nICJhcmNoIiBwbGFjZW1lbnQKPj4+IHdpdGhpbiB0aGUgc3RydWN0dXJlLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Cj4+PiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vaXJxLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaAo+
Pj4gQEAgLTEyNyw5ICsxMjcsMTAgQEAgc3RydWN0IHZjcHU7Cj4+PiAgICAKPj4+ICAgIHN0cnVj
dCBwaXJxIHsKPj4+ICAgICAgICBpbnQgcGlycTsKPj4+IC0gICAgdTE2IGV2dGNobjsKPj4+IC0g
ICAgYm9vbF90IG1hc2tlZDsKPj4+ICsgICAgZXZ0Y2huX3BvcnRfdCBldnRjaG47Cj4+PiAgICAg
ICAgc3RydWN0IHJjdV9oZWFkIHJjdV9oZWFkOwo+Pj4gKyAgICBib29sIG1hc2tlZDsKPj4+ICsg
ICAgLyogQXJjaGl0ZWN0dXJlcyBtYXkgcmVxdWlyZSB0aGlzIGZpZWxkIHRvIGJlIGxhc3QuICov
Cj4+Cj4+IEkgb3JnaW5hbGx5IHBsYW5uZWQgdG8gYWRkIGEgY29tbWVudCBpbiBzdHJ1Y3QgcGly
cSwgYnV0IEkgYW0gbm90IGluCj4+IGZhdm9yIHRvIGNvbnRpbnVlIHRvIGVuY291cmFnZSBxdWly
a2luZXNzIGluIHRoZSBjb2RlLiBJIHNlbnQgYSBzZXJpZXMKPj4gKHNlZSBbMV0pIHRoYXQgZHJv
cCB0aGlzIHJlcXVpcmVtZW50cyBmcm9tIHg4NiBhbmQgdGhlcmVmb3JlIHJlbW92ZSB0aGUKPj4g
bmVlZCBvZiB0aGlzIGNvbW1lbnQuCj4gCj4gV2VsbCwgSSd2ZSBmb3VuZCB0aGUgaXNzdWUgZml4
ZWQgaGVyZSB3aGlsZSBkb2luZyBhIGZpcnN0IHJldmlldyBwYXNzCj4gb3ZlciBzYWlkIHBhdGNo
IG9mIHlvdXJzIChJJ20geWV0IHRvIG1ha2UgdXAgbXkgbWluZCB3aGV0aGVyIEkgaGF2ZQo+IHJl
c2VydmF0aW9ucywgaGVuY2UgSSBkaWRuJ3QgcmVwbHkgeWV0KS4gVGhlIGNoYW5nZSBoZXJlIHdp
bGwgd2FudAo+IGJhY2twb3J0aW5nLCBzbyBpdCdsbCBiZSBlYXNpZXIgaW4gYW55IGV2ZW50IHRv
IHJlYmFzZSB5b3VyIHBhdGNoIG92ZXIKPiB0aGlzIG9uZS4gVGhpcyByZWJhc2luZyBjYW4gdGhl
biBpbmNsdWRlIGRyb3BwaW5nIHRoZSBjb21tZW50IGFnYWluLgoKRmFpciBlbm91Z2guCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
