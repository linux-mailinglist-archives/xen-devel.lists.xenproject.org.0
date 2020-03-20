Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2618D162
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:46:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIsB-0001kb-Nh; Fri, 20 Mar 2020 14:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFIs9-0001kW-UK
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:43:41 +0000
X-Inumbo-ID: 30c1c506-6ab9-11ea-bec1-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c1c506-6ab9-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 14:43:41 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a20so7405304edj.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 07:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tc/yfDa44zovgV2PDDLvGMgok8bC+dM+Prglu9OQToA=;
 b=shcbxRWsbnmTeOuzejOfVkzBwtTfyvPkD52QE6SFljh0KrIFiWxmCgphJhahrXyPqD
 wsbrvaXxeY/Wp9lyL3FaDMNCt1ZFKmxDhPyTXPM6HNY7g8sJvmj6ZHk2K7/A4KS93pxA
 gnVgUdOLN1rJyTW2OCOcEjvHdZLWLU18F4446L04V5IfiE96ah5FxoeAziDUTGuWEytc
 MAkOnJnB44Rxgn7tKwjP+b5G7s4oUhNdL8bP8aGilWvxI8iFdR0NAkNQD7UKLQXDrH4O
 7j09dx2o6Y9fQgrnqjKjMUNlAFmCGKofP+FdN2R0pRPocCMlSnkUYB46/ms8xR+hgcye
 CRNg==
X-Gm-Message-State: ANhLgQ0Yk1fDQXJs4MJSfYT+vxdkj8R/ltACGFxm/1BAbX1blGnzjH0I
 Ly/mWP9T+yNuJ9fFR+beN9Q=
X-Google-Smtp-Source: ADFU+vtGD8cvYAtqAK1UDixgdfS1ue969QdFNH7hCArE1FBNAt/gjrH8yKHwuxmTyUI1Ihrm09AsQA==
X-Received: by 2002:a17:906:9495:: with SMTP id
 t21mr8531361ejx.201.1584715420442; 
 Fri, 20 Mar 2020 07:43:40 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id g19sm386445ejr.65.2020.03.20.07.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 07:43:39 -0700 (PDT)
From: Julien Grall <julien@xen.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
 <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
Message-ID: <53ee969a-5d24-f6e6-2dd5-5f03118326c5@xen.org>
Date: Fri, 20 Mar 2020 14:43:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMy8yMDIwIDE0OjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24g
MjAvMDMvMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gc3RhdGljIGlubGlu
ZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrKHVpbnQzMl90IHRsYmZsdXNoX3RpbWVzdGFt
cCkKPj4gewo+PiDCoMKgwqDCoCBjcHVtYXNrX3QgbWFzazsKPj4KPj4gwqDCoMKgwqAgY3B1bWFz
a19jb3B5KCZtYXNrLCAmY3B1X29ubGluZV9tYXApOwo+PiDCoMKgwqDCoCB0bGJmbHVzaF9maWx0
ZXIoJm1hc2ssIHRsYmZsdXNoX3RpbWVzdGFtcCk7Cj4+IMKgwqDCoMKgIGlmICggIWNwdW1hc2tf
ZW1wdHkoJm1hc2spICkKPj4gwqDCoMKgwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKgIHBlcmZjX2lu
Y3IobmVlZF9mbHVzaF90bGJfZmx1c2gpOwo+PiAjaWYgQ09ORklHX1g4Ngo+PiDCoMKgwqDCoMKg
wqDCoMKgIC8qCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNr
IGlzIHVzZWQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBwMm0gaW4KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
ICogcG9wdWxhdGVfcGh5c21hcCwgWGVuIG5lZWRzIHRvIHRyaWdnZXIgYW4gQVNJRCB0aWNrbGUg
YXMgCj4+IHRoaXMgaXMgYQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKiByZXF1aXJlbWVudCBvbiBB
TUQgaGFyZHdhcmUuCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IAo+IEkgZG9uJ3QgdGhpbmsg
dGhpcyBjb21tZW50IGlzIGNvcnJlY3QuIHBvcHVsYXRlX3BoeXNtYXAoKSBpcyBvbmx5IGdvaW5n
IAo+IHRvIGFkZCBlbnRyeSBpbiB0aGUgUDJNIGFuZCB0aGVyZWZvcmUgZmx1c2ggc2hvdWxkIG5v
dCBiZSBuZWVkZWQuCgpJIHNob3VsZCBoYXZlIHByb2JhYmx5IHNhaWQgImluIG1vc3Qgb2YgdGhl
IGNhc2VzLi4uIiBhbmQgLi4uCgo+IAo+IFRoZSBvbmx5IHJlYXNvbiB0aGUgZmx1c2ggd291bGQg
aGFwcGVuIGluIHBvcHVsYXRlX3BoeXNtYXAoKSBpcyBiZWNhdXNlIAo+IHdlIGFsbG9jYXRlZCBh
IHBhZ2UgdGhhdCB3YXMgcmVxdWlyZWQgdG8gYmUgZmx1c2ggKHNlZSBmcmVlLm5lZWRfdGJmbHVz
aCkuCgouLi4gZXh0ZW5kIHRoaXMgY29tbWVudCBhIGJpdCBtb3JlLiBUaGUgZmx1c2ggd2lsbCBo
YXBwZW4gd2hlbiB0aGUgcGFnZSAKdXNlZCB0byBoYXZlIGFuIG93bmVyLiBTbyBpZiB0aGVyZSBp
cyBubyBvd25lciwgdGhlcmUgaXMgbm8gZmx1c2guCgpUaGVyZWZvcmUgd2UgY2FuJ3QgcmVseSBv
biBpdCBpZiB3ZSByZWFsbHkgd2FudGVkIHRvIHRyaWdnZXIgYW4gQVNJRCAKdGlja2xlIGFmdGVy
IGEgUDJNIHVwZGF0ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
