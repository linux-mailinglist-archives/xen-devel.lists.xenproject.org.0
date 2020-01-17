Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03314126A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:44:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYRH-0004rO-M1; Fri, 17 Jan 2020 20:41:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bkkV=3G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isYRG-0004rJ-9C
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:41:54 +0000
X-Inumbo-ID: c63a8860-3969-11ea-b833-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c63a8860-3969-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 20:41:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so8922342wmf.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 12:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/WE2Ywy9p9aah+WW642LhBMT6wM2nydQFs79AN6uSI=;
 b=o0NlUuyUIcFRwADKRzQdEMpmTLZw4MaHm6cBIKKuwpjmt9AF+U9i5b2z9TqkFVMlUk
 oVwd2QiVaToF0BSeqER0n8sCXa5RvfRbp6seCI0no+yzwcNOsUBHpNJd8+Khugdf21Lo
 CIimbZy3h5i6g601aQwKP2TMB2HdfF18h2P4bsAH3FaQr/6CS+5md5b3vtFE5HDFC23f
 T3VqpeTTP0qPe8BKfSmMl5ZmAnNZqI9+NWNV46peJZ52azASHJksHYIvlHBNg6y6B8rU
 2ZV673AR8tv8zwIzQERMlePwZvgnVdk/Wx7soo83kQLhZ4UC8p1yT6HBoZN4u1MTQg7A
 NBww==
X-Gm-Message-State: APjAAAWQ+WQ+rY1C8JBKgO0eCRo6wPwc7YAuMxMlB8c8mYLeBaUdS4VK
 vS9t3PVP7Tz9EHUoN+VtbZE=
X-Google-Smtp-Source: APXvYqxq2On0sbc27GQtMBRapA10P2jQC74xeOBpITYhJd3+WvJV/rSBaSrDo1LMVTGEv1cwqmhteA==
X-Received: by 2002:a05:600c:30a:: with SMTP id
 q10mr6481626wmd.84.1579293704502; 
 Fri, 17 Jan 2020 12:41:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id x17sm34648609wrt.74.2020.01.17.12.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 12:41:43 -0800 (PST)
To: Wei Xu <xuwei5@hisilicon.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org> <5E1453F5.50704@hisilicon.com>
 <94aa0896-b6cf-01b4-7bde-2a4870fa37ff@xen.org>
 <5E147FA8.1000401@hisilicon.com>
 <79e63299-ce00-b417-5002-aff6d4f6bb2e@xen.org>
 <5E21792C.9020602@hisilicon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2469482d-c8b1-6505-b143-511da015c426@xen.org>
Date: Fri, 17 Jan 2020 20:41:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5E21792C.9020602@hisilicon.com>
Content-Language: en-GB
Subject: [Xen-devel] Interaction between ACPI and dt_unreserved_regions()
 (WAS: Re: [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ active status
 range)
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KFJlbmFtaW5nIHRoZSB0aXRsZSB0byBhdm9pZCBjb25mdXNpb24pCgpPbiAxNy8wMS8yMDIwIDA5
OjA2LCBXZWkgWHUgd3JvdGU6Cj4gSGkgSnVsaWVuLAoKSGkgV2VpLAoKPiBPbiAyMDIwLzEvNyAy
MzoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSEKCkRv
bid0IHdvcnJ5LCB0aGFuayB5b3UgZm9yIGxvb2tpbmcgaW50byB0aGUgYnVnIQoKPiBUaGUgUEMg
cmVmZXJzIHRvIGZkdF9udW1fbWVtX3JzdiBkdXJpbmcgaW5pdF9kb25lLgo+IEJ1dCB0aGUgZGV2
aWNlX3RyZWVfZmxhdHRlbmVkIGlzIE5VTEwgdGhhdCB0aGUgZGF0YSBhYm9ydCBoYXBwZW5lZC4K
CkFoLCBJIGRpZG4ndCByZWFsaXplIHRoYXQgZGV2aWNlX3RyZWVfZmxhdHRlbmVkIHdoZXJlIHN0
aWxsIHVzZWQgCmFmdGVyd2FyZHMuIFNvcnJ5IGZvciB0aGUgYnJlYWthZ2UuIEkgcmVhbGx5IG5l
ZWQgdG8gc2V0dXAgYSBkZXZib3ggd2l0aCAKQUNQSSBzbyBJIGNhbiB0ZXN0IGNoYW5nZXMgcHJv
cGVybHkuCgo+IFNvIEkgYWRkZWQgYmVsb3cgY2hhbmdlcyBhbmQgdGhlIFhFTiBkb20wIGNhbiBi
ZSBib290ZWQuCj4gCj4gIMKgwqDCoCBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMg
Yi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICDCoMKgwqAgaW5kZXggMWU4MzM1MS4uMWFiODBhMSAx
MDA2NDQKPiAgwqDCoMKgIC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gIMKgwqDCoCArKysg
Yi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICDCoMKgwqAgQEAgLTM5Miw3ICszOTIsOCBAQCB2b2lk
IF9faW5pdCBkaXNjYXJkX2luaXRpYWxfbW9kdWxlcyh2b2lkKQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKGUpKSApCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+IAo+ICDCoMKgwqAgLcKgwqDC
oMKgwqDCoMKgIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhzLCBlLCBpbml0X2RvbWhlYXBfcGFnZXMs
IDApOwo+ICDCoMKgwqAgK8KgwqDCoMKgwqDCoCBpZiggYWNwaV9kaXNhYmxlZCApCj4gIMKgwqDC
oCArwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHMsIGUsIGluaXRf
ZG9taGVhcF9wYWdlcywgMCk7CgpXaGlsZSBJIHVuZGVyc3RhbmQgaG93IHRoaXMgaXMgZml4aW5n
IHlvdXIgcHJvYmxlbSwgdGhpcyB1bmZvcnR1bmF0ZWx5IAptZWFucyB0aGUgbWVtb3J5IHJhbmdl
cyB1c2VkIGJ5IHRoZSBpbml0YWwgbW9kdWxlcyAoZS5nIEtlcm5lbCwgSW5pdHJkKSAKd2lsbCBu
b3QgYmUgcmUtdXNlZCBieSBYZW4uIFNvIHRoaXMgaXMgYSAic2xpZ2h0IiB3YXN0ZSBvZiBtZW1v
cnkuCgpUaGVyZSBhcmUgYSBmZXcgb3RoZXIgcGxhY2VzIHdoZXJlIGR0X3VucmVzZXJ2ZWRfcmVn
aW9ucygpIGlzIGNhbGxlZCAKKHNlZSBzZXR1cF9tbSgpKS4gSG93ZXZlciwgaW4gdGhlIGNhc2Ug
b2Ygc2V0dXBfbW0oKSB3ZSBoYXZlIGEgcG9pbnRlciAKdG8gRFQgYXMgd2UgZG9uJ3Qga25vdyB5
ZXQgd2UgYXJlIHJ1bm5pbmcgb24gQUNQSSBzeXN0ZW1zLgoKQnV0IGl0IGZlZWxzIHdyb25nIHRv
IHRyeSB0byBmaW5kIG91dCB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJhbmdlIHRocm91Z2ggCnRoZSBE
VCB3aGVuIEFDUEkgd2lsbCBiZSB1c2VkLiBUaGUgRFQgaXMgZWl0aGVyIGdvaW5nIHRvIGJlIG5l
YXJseSAKZW1wdHksIG9yIGNvbnRhaW4gdGhlIGZ1bGwgZGVzY3JpcHRpb24gb2YgdGhlIHBsYXRm
b3JtLiBJIGRvbid0IGtub3cgCmVub3VnaCB0byBiZSBhYmxlIHRvIHNheSBpZiBzb21ldGhpbmcg
aXMgZ29pbmcgdG8gZ28gd3JvbmcuCgpJIGFtIHRoaW5raW5nIHRvIHN1Z2dlc3QgdG8gY3JlYXRl
IGFuIGhlbHBlciB0aGF0IHdpbGwgZG8gdGhlIGpvYiBmb3IgCnlvdS4gU29tZXRoaW5nIGxpa2U6
Cgp2b2lkIGZ3dGFibGVfdW5yZXNlcnZlZF9yZWdpb25zKHBhZGRyX3QgcywgcGFkZHJfdCBlLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgqY2IpKHBhZGRyX3QsIHBhZGRy
X3QpLCBpbnQgZmlyc3QpCnsKICAgIGlmICggYWNwaV9kaXNhYmxlZCApCiAgICAgIGR0X3VucmVz
ZXJ2ZWRfcmVnaW9ucyhzLCBlLCBjYiwgZmlyc3QpOwogICAgZWxzZQogICAgICBjYihzLCBlKTsK
fQoKUmVnYXJkaW5nIHRoZSBlbHNlIHBhcnQsIHRoaXMgbWF5IG5lZWQgc29tZSBhZGp1c3RtZW50
IGlmIHdlIG5lZWQgdG8gCnNraXAgc29tZSByZXNlcnZlZCByZWdpb24gZm9yIEFDUEkuIE9uIFhl
biA0LjEzLCB3ZSBzaG91bGQgb25seSBoYXZlIAp1c3VhYmxlIFJBTSBpbiBoYW5kICh0aGUgRUZJ
IHN0dWIgaXMgZG9pbmcgdG8gc29ydGluZyBmb3IgdXMpLiBEbyB5b3UgCmtub3cgd2hldGhlciBB
Q1BJIGRlc2NyaWJlcyBzb21ldGhpbmcgc2ltaWxhciB0byByZXNlcnZlZC1tZW1vcnkgaW4gRFQg
CihpLmUgUkFNIHJlZ2lvbnMgcmVzZXJ2ZWQgZm9yIGNtYS4uLik/CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
