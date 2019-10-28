Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8FE6D38
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 08:27:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOzOT-000129-TN; Mon, 28 Oct 2019 07:24:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PCv5=YV=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1iOzOS-000124-Q2
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 07:24:48 +0000
X-Inumbo-ID: 053f54b0-f954-11e9-bbab-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 053f54b0-f954-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 07:24:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m9so438381ljh.8
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oioiKtn1foj3BQPhSmm9F2kA6ekUkw+E5dyqI6i3bD8=;
 b=AQQno/UgPNpUcsZYCEFzY3DjwtPfLY+MO+BUJHAUwILPb/IRkstISeGQFv/rwXaIka
 Y66rqWxczu1b8eBAasORzbKng/Vu7M0gIXZeTIiZaaY0PwpLp7UthczVSORhgFb261tB
 40zd4Ydi2U2tRf1Qurmg0hdORyu60jY7MW0j1OcUI/JZxWOqPMcqchDI/5LqHCNVhFSD
 eVmS449iIjue9OgY4s2IUxlUPSwKr3TTCLKz8XOEvaQpN8hIwVm/xiElGii82bKUTxht
 zrWu4+yOiCeGG8BU0HOJc2IMCpbYnF+bSeRKS+PwEwcf5R4yutW4TjsdNAnH7hQmU9R+
 d+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oioiKtn1foj3BQPhSmm9F2kA6ekUkw+E5dyqI6i3bD8=;
 b=VN408lfLY7ce0BtIWjkal/kNDi+ixvuF9HtuHv4bQZRmxXd9Feg3qtow0slNAZiD1z
 /W0FbChnNMdMwnbLz7RkoHEuh7bQffYm1WSVMndF++GOhNqzkGbx7YGsuN6fAECzVVkT
 cUL/gkWc2i9P5hvPCgHimYOxiFHhMWzWVEq8WXYIaZ2wt05QJN8k6a8YYqtLs3kVzzna
 QaKqP8aU/UztiTSb1KEBCXsLyqgnt5mBM1hTUEnxPHK9JHN1oYu3mhRaFPNOSzA/BWlb
 O5e6dRkmsACBQnrhFb8LqdZcKRTzB3RPR9KqLMfeLUos0sMiSMAAFWIFMpnMe+x6DOZG
 JyNg==
X-Gm-Message-State: APjAAAXY/bUsWOOWE38pz4KCkZvOXPofec5l59ILO7jw3tsn6EOlPYpF
 VylqMuD34j1DGePIJlG+VCQ=
X-Google-Smtp-Source: APXvYqyeujrwUhVWs+d+Gis7H1huHBHG9ua8pdIqCe+0dPEBJUZcue1Oa+P4NxbKETo+dz/1M+4vrg==
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr10867518ljk.204.1572247486168; 
 Mon, 28 Oct 2019 00:24:46 -0700 (PDT)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y189sm5911000lfc.9.2019.10.28.00.24.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:24:45 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, julien.grall@arm.com, andrew.cooper3@citrix.com,
 wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 konrad.wilk@oracle.com, Jan Beulich <jbeulich@suse.com>
References: <20190930085659.708-1-andr2000@gmail.com>
 <9df7bc3c-8019-ee76-983c-c43befc3662a@citrix.com>
 <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
 <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
 <1547ccdf-b696-9054-7148-8a03773a13a8@citrix.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <1922332d-e014-3e98-3c66-fd39a1106059@gmail.com>
Date: Mon, 28 Oct 2019 09:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1547ccdf-b696-9054-7148-8a03773a13a8@citrix.com>
Content-Language: en-US
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

Ck9uIDkvMzAvMTkgMjoyNiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA5LzMwLzE5IDEx
OjUzIEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAzMC4wOS4xOSAxMjozMywgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDkvMzAvMTkgMTE6MjkgQU0sIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4+Pj4gT24gOS8zMC8xOSA5OjU2IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbwo+Pj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4+
IC0tLQo+Pj4+PiAgwqAgU1VQUE9SVC5tZCB8IDE1ICsrKysrKysrKysrKysrLQo+Pj4+PiAgwqAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+
Pj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCj4+Pj4+IGluZGV4IDM3NTQ3
M2E0NTY0MC4uYjUzNmNmMDgxNGYzIDEwMDY0NAo+Pj4+PiAtLS0gYS9TVVBQT1JULm1kCj4+Pj4+
ICsrKyBiL1NVUFBPUlQubWQKPj4+Pj4gQEAgLTM3Miw2ICszNzIsMTIgQEAgR3Vlc3Qtc2lkZSBk
cml2ZXIgY2FwYWJsZSBvZiBzcGVha2luZyB0aGUgWGVuCj4+Pj4+IFBWIEZyYW1lYnVmZmVyIHBy
b3RvY29sCj4+Pj4+ICDCoCDCoMKgwqDCoMKgIFN0YXR1cywgTGludXggKHhlbi1mYmZyb250KTog
U3VwcG9ydGVkCj4+Pj4+ICDCoCArIyMjIFBWIGRpc3BsYXkgKGZyb250ZW5kKQo+Pj4+PiArCj4+
Pj4+ICtHdWVzdC1zaWRlIGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgZGlz
cGxheSBwcm90b2NvbAo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgU3RhdHVzLCBMaW51eDogU3VwcG9y
dGVkCj4+Pj4gIlN1cHBvcnRlZCIgaGFzIGltcGxpY2F0aW9ucyBmb3IgdGhlIHNlY3VyaXR5IHRl
YW06IG5hbWVseSwgaWYgYQo+Pj4+IHNlY3VyaXR5IGlzc3VlIGlzIGRpc2NvdmVyZWQsIHdlIHdp
bGwgaXNzdWUgYW4gWFNBLsKgIEp1ZXJnZW4sIGFyZSB5b3UKPj4+PiBzYXRpc2ZpZWQgdGhhdCB0
aGUgUFYgZGlzcGxheSAvIHNvdW5kIGRyaXZlcnMgYXJlIG9mIHN1ZmZpY2llbnQgcXVhbGl0eQo+
Pj4+IHRoYXQgd2UgY2FuIHJlY29tbWVuZCBwZW9wbGUgdXNlIHRoZW0/Cj4+PiBTb3JyeSwgSSBt
ZWFudCB0byBhZGQ6ICJJbiB0aGUgZmFjZSBvZiBhbiBhY3RpdmUgYWR2ZXJzYXJ5Ii4KPj4gWWVz
LCBJIHRoaW5rICJzdXBwb3J0ZWQiIGlzIGZpbmUuCj4gSW4gdGhhdCBjYXNlOgo+Cj4gQWNrZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2FuIHdlIHBsZWFz
ZSBoYXZlIHRoaXMgaW4/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
