Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F781E74BE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:16:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6hJ-00081Q-GS; Mon, 28 Oct 2019 15:12:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rwY=YV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iP6gR-00080I-Rr
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:11:51 +0000
X-Inumbo-ID: 44952dce-f995-11e9-bbab-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44952dce-f995-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 15:11:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w18so10310240wrt.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 08:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQ5jgW4l39hYi/fQcE8hZsdNZP1iF9ZgEQOp8k6SSPQ=;
 b=Gs55ZUHw5UbrGpGclkousA4FM5prsh6qsiz9rZ1C1z2/fy9QhGFdKBGj7hn+Yzswno
 439YmeysFX6nxHu7UvLlpHDy2DOOkf2ezEoofGQHQYAS7XGAe2ePmlqJJ8DhtRrLppaW
 3XJquGRaNZA1aa1rGuII2NTyH5+C1QGl3eCuitiXa0Sq2Vc1YBmxZ5qXaUS2Muou5Wzy
 LChBhgqVujZREjT6VAymu2Did3k50anj3YuXERMLpmzh2cvR5BriWJ9eN6St74HbDb31
 7pT4OTIKCb3AIB01kp4WY3GCRC0xNysiB8BxxGtYsy93FSWkIl814EEnrSY8UtgCRDCz
 a2ow==
X-Gm-Message-State: APjAAAXsXibhkF8rxaqxClAFlQC5OSID4Fc2EwFU4gPT4M8WbeF2IdJL
 MH+4DM/Qs6d70HawzB0m9p0=
X-Google-Smtp-Source: APXvYqzRKSPNJQ4dd6FNUdguPDhK5q7Qzn8VhwZucox33HN5qV9I24VcBwyS7jEeHGSHsEOpkEcqIA==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr10882455wrv.347.1572275510374; 
 Mon, 28 Oct 2019 08:11:50 -0700 (PDT)
Received: from ?IPv6:::1? ([206.189.23.0])
 by smtp.gmail.com with ESMTPSA id o70sm12463444wme.29.2019.10.28.08.11.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 08:11:49 -0700 (PDT)
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, julien.grall@arm.com, andrew.cooper3@citrix.com,
 wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 konrad.wilk@oracle.com, Jan Beulich <jbeulich@suse.com>
References: <20190930085659.708-1-andr2000@gmail.com>
 <9df7bc3c-8019-ee76-983c-c43befc3662a@citrix.com>
 <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
 <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
 <1547ccdf-b696-9054-7148-8a03773a13a8@citrix.com>
 <1922332d-e014-3e98-3c66-fd39a1106059@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f8e0399-5b52-5c67-868b-5ff624d9b351@xen.org>
Date: Mon, 28 Oct 2019 15:11:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1922332d-e014-3e98-3c66-fd39a1106059@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Oct 2019 15:12:44 +0000
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Add PV display/sound,
 update keyboard
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOC8xMC8yMDE5IDA3OjI0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
PiAKPiBPbiA5LzMwLzE5IDI6MjYgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDkvMzAv
MTkgMTE6NTMgQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAzMC4wOS4xOSAxMjozMywg
R2VvcmdlIER1bmxhcCB3cm90ZToKPj4+PiBPbiA5LzMwLzE5IDExOjI5IEFNLCBHZW9yZ2UgRHVu
bGFwIHdyb3RlOgo+Pj4+PiBPbiA5LzMwLzE5IDk6NTYgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOgo+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvCj4+Pj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqAgU1VQUE9SVC5tZCB8IDE1ICsrKysrKysrKysr
KysrLQo+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5t
ZAo+Pj4+Pj4gaW5kZXggMzc1NDczYTQ1NjQwLi5iNTM2Y2YwODE0ZjMgMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS9TVVBQT1JULm1kCj4+Pj4+PiArKysgYi9TVVBQT1JULm1kCj4+Pj4+PiBAQCAtMzcyLDYg
KzM3MiwxMiBAQCBHdWVzdC1zaWRlIGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRoZSBYZW4K
Pj4+Pj4+IFBWIEZyYW1lYnVmZmVyIHByb3RvY29sCj4+Pj4+PiDCoMKgIMKgwqDCoMKgwqAgU3Rh
dHVzLCBMaW51eCAoeGVuLWZiZnJvbnQpOiBTdXBwb3J0ZWQKPj4+Pj4+IMKgwqAgKyMjIyBQViBk
aXNwbGF5IChmcm9udGVuZCkKPj4+Pj4+ICsKPj4+Pj4+ICtHdWVzdC1zaWRlIGRyaXZlciBjYXBh
YmxlIG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgZGlzcGxheSBwcm90b2NvbAo+Pj4+Pj4gKwo+Pj4+
Pj4gK8KgwqDCoCBTdGF0dXMsIExpbnV4OiBTdXBwb3J0ZWQKPj4+Pj4gIlN1cHBvcnRlZCIgaGFz
IGltcGxpY2F0aW9ucyBmb3IgdGhlIHNlY3VyaXR5IHRlYW06IG5hbWVseSwgaWYgYQo+Pj4+PiBz
ZWN1cml0eSBpc3N1ZSBpcyBkaXNjb3ZlcmVkLCB3ZSB3aWxsIGlzc3VlIGFuIFhTQS7CoCBKdWVy
Z2VuLCBhcmUgeW91Cj4+Pj4+IHNhdGlzZmllZCB0aGF0IHRoZSBQViBkaXNwbGF5IC8gc291bmQg
ZHJpdmVycyBhcmUgb2Ygc3VmZmljaWVudCBxdWFsaXR5Cj4+Pj4+IHRoYXQgd2UgY2FuIHJlY29t
bWVuZCBwZW9wbGUgdXNlIHRoZW0/Cj4+Pj4gU29ycnksIEkgbWVhbnQgdG8gYWRkOiAiSW4gdGhl
IGZhY2Ugb2YgYW4gYWN0aXZlIGFkdmVyc2FyeSIuCj4+PiBZZXMsIEkgdGhpbmsgInN1cHBvcnRl
ZCIgaXMgZmluZS4KPj4gSW4gdGhhdCBjYXNlOgo+Pgo+PiBBY2tlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IENhbiB3ZSBwbGVhc2UgaGF2ZSB0aGlzIGlu
PwoKQEp1ZXJnZW46IEFyZSB5b3UgaGFwcHkgdG8gc2VlIFBWIGRpc3BsYXkvc291bmQgbWFya2Vk
IGFzIHN1cHBvcnRlZCBmb3IgWGVuIDQuMTM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
