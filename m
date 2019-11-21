Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD8104FA4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXj4D-00010k-Q4; Thu, 21 Nov 2019 09:48:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WwqD=ZN=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iXj4B-00010f-Vc
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:47:59 +0000
X-Inumbo-ID: 00009100-0c44-11ea-b678-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00009100-0c44-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 09:47:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y5so2889849wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 01:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9V8Yopxt8kdLBM6jBtHpez3efLar2si3mrpo1MwgNNY=;
 b=mr6+9khBeENOkZ3K7b4sRFZaq5kHJN+msV+0IlH8LqN9cICK9ZPxqghEh1/hk0egEd
 oqrN/bxBS0yspmsZNi0pPu8qfEGw1QiOqbni6zp2NnBcD49GE2gc8F7AHqXpgZCSXfun
 Pv89gLYHHJSIr84EncvORJoy5LIsqv/S8JNCWQEVsjgiVpCc/WGqMMxObW/EmBG6byta
 6Y857jOxIu1jfA8R4Y9CQ72AhYiTclBckZLY4PylKrJVK5JxSVONga3RkSHKjeICBpQi
 X0UqZTm00nQCNS2XrvxsyL0i5n0m3Gkr7sG+ZXnp6Ogili13AIQxkSiZIn94osV9/ood
 YQtQ==
X-Gm-Message-State: APjAAAVJFgEprglA9VoF99L6KwTQscmFsOLPMVu6tNjJ+AZkW+kFhRDl
 I715MbzZM3tuLinO/nAtWnY=
X-Google-Smtp-Source: APXvYqx8L8Uv/3uW/YF+Qo0kMo+BA+fSIUKV+5AmXVPrVXMshfaJdAqZSKkkrVn//R7CgltKooeLpw==
X-Received: by 2002:a05:600c:2389:: with SMTP id
 m9mr8932342wma.65.1574329678102; 
 Thu, 21 Nov 2019 01:47:58 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id l4sm2267677wme.4.2019.11.21.01.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 01:47:57 -0800 (PST)
To: Chao Gao <chao.gao@intel.com>, xen-devel@lists.xenproject.org
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0b848790-fcdd-1267-b621-62be6098369d@xen.org>
Date: Thu, 21 Nov 2019 09:47:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v1 1/2] x86/cpu: maintain a parked CPU bitmap
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8xMS8yMDE5IDIzOjA1LCBDaGFvIEdhbyB3cm90ZToKPiBJdCBoZWxwcyB0byBk
aXN0aW5ndWlzaCBwYXJrZWQgQ1BVcyBmcm9tIHRob3NlIGFyZSByZWFsbHkgb2ZmbGluZWQgb3IK
PiBob3QtYWRkZWQuIFdlIG5lZWQgdG8ga25vdyB0aGUgcGFya2VkIENQVXMgaW4gb3JkZXIgdG8g
ZG8gYSBzcGVjaWFsCj4gY2hlY2sgYWdhaW5zdCB0aGVtIHRvIGVuc3VyZSB0aGF0IGFsbCBDUFVz
LCBleGNlcHQgdGhvc2UgYXJlIHJlYWxseQo+IG9mZmxpbmVkIG9yIGhvdC1hZGRlZCwgaGF2ZSB0
aGUgc2FtZSB1Y29kZSB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFv
Lmdhb0BpbnRlbC5jb20+Cj4gLS0tCj4gTm90ZSB0aGF0IGNoYW5nZXMgb24gQVJNIHNpZGUgYXJl
IHVudGVzdGVkLgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyAgICB8IDEgKwo+ICAg
eGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyB8IDQgKysrKwo+ICAgeGVuL2FyY2gveDg2L3NtcGJv
b3QuYyAgICB8IDEgKwo+ICAgeGVuL2NvbW1vbi9jcHUuYyAgICAgICAgICB8IDQgKysrKwo+ICAg
eGVuL2luY2x1ZGUvYXNtLWFybS9zbXAuaCB8IDEgKwo+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9z
bXAuaCB8IDEgKwo+ICAgeGVuL2luY2x1ZGUveGVuL2NwdW1hc2suaCB8IDEgKwo+ICAgNyBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4gaW5kZXggMDBiNjRjMy4uMWI1
N2JhNCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3NtcGJvb3QuYwo+IEBAIC0zOSw2ICszOSw3IEBACj4gICBjcHVtYXNrX3QgY3B1X29u
bGluZV9tYXA7Cj4gICBjcHVtYXNrX3QgY3B1X3ByZXNlbnRfbWFwOwo+ICAgY3B1bWFza190IGNw
dV9wb3NzaWJsZV9tYXA7Cj4gK2NwdW1hc2tfdmFyX3QgY3B1X3BhcmtlZF9tYXA7CgpZb3UgZGVm
aW5lIGNwdV9wYXJrZWRfbWFwIGJ1dCBBRkFJSyBpdCB3aWxsIG5ldmVyIGdldCBhbGxvY2F0ZWQu
IFRoZSAKcmlzayBoZXJlIGlzIGFueSBhY2Nlc3MgdG8gdGhhdCB2YXJpYWJsZSB3aWxsIHJlc3Vs
dCB0byBhIGZhdWx0LgoKTG9va2luZyBhdCB0aGUgY2hhbmdlcyBiZWxvdywgaXQgbG9va3MgbGlr
ZSBhY2Nlc3MgaW4gY29tbW9uIGNvZGUgd2lsbCAKYmUgcHJvdGVjdGVkIGJ5IHBhcmtfb2ZmbGlu
ZV9jcHVzLiBUaGlzIGlzIGFsd2F5cyBmYWxzZSBvbiBBcm0sIHNvIHRoZSAKY29tcGlsZXIgc2hv
dWxkIHJlbW92ZSBhbnkgYWNjZXNzIHRvIGNwdV9wYXJrZWRfbWFwLgoKV2l0aCB0aGF0IGluIG1p
bmQsIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBvbmx5IHByb3ZpZGUgYSBwcm90b3R5cGUg
CmZvciBjcHVfcGFya2VkX21hcCBhbmQgc28gdGhlIGxpbmtlciBjYW4gd2FybiBpZiBzb21lb25l
IHVzZWQgaXQuCgoKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9zbXAuaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vc21wLmgKPiBpbmRleCBmZGJjZWZhLi40YjM5MmZhIDEwMDY0NAo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21wLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL3NtcC5oCj4gQEAgLTE5LDYgKzE5LDcgQEAgREVDTEFSRV9QRVJfQ1BVKGNwdW1hc2tfdmFy
X3QsIGNwdV9jb3JlX21hc2spOwo+ICAgICogd291bGQgb3RoZXJ3aXNlIHByZWZlciB0aGVtIHRv
IGJlIG9mZj8KPiAgICAqLwo+ICAgI2RlZmluZSBwYXJrX29mZmxpbmVfY3B1cyBmYWxzZQo+ICtl
eHRlcm4gY3B1bWFza192YXJfdCBjcHVfcGFya2VkX21hcDsKClRoZSBwcm90b3R5cGUgc2hvdWxk
IGJlIHRoZSBzYW1lIGZvciBhbGwgYXJjaGl0ZWN0dXJlcy4gU28gaXMgdGhlcmUgYW55IApyZWFz
b24gdG8gZHVwbGljYXRlIGl0PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
