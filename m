Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619988530D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:39:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQnp-0007nc-1c; Wed, 07 Aug 2019 18:36:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lq+z=WD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvQnn-0007nX-Cz
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:36:47 +0000
X-Inumbo-ID: 4f07d5cd-b942-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4f07d5cd-b942-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 18:36:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m23so86343362lje.12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hNSPgHEaMKbClqYCnulzAQy12vPp0f9ipS2B4601PQY=;
 b=X5YSyboS3k+HmWtpj+ShmMgQDLD6dLLMnbM6ByLzr/CfOyrBDxrj1xQo3q9TyErPYS
 2cRx8lzGakY2wCTD5i6dPbLSVpwfs/eRYbqA+ezZ+w/NjNP7nHcw2HXxBGoG9tvctKvU
 bagfv+l+wh3Al88j71JTYxvb4D9Y1KCzLDAk4RrwKzF+AJiWuehO1Dcb80PDVtt8aBir
 VT8rJZbOhDsk2FMxtMbIv9YSn7bphrSwpjAYsLpr2OO+KIDQx+BSWc9lDUmu7CRgM6R0
 WZO7ur8V3qzOt0Zzwr+eRQFzLNAvcIEcYK0qnRp4tQG7wMV30Y1t8hz2MqMkMHS7H3UW
 Oa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hNSPgHEaMKbClqYCnulzAQy12vPp0f9ipS2B4601PQY=;
 b=ceAYPk3qDONuL5mZCZo3pXf91S77zO8smI4O+zRsBAnv3FWh56KJN7p4+47ONixA0P
 bHapYhfQlK3Z9+pIGyqhhYwh8xpeN0sRyiNjTxQFUfvkl3rIn63MhgDpFrcEyZhYmum5
 pxhs4fcBd7WYGLO7FAOMtXEnDjMvlJiQoX0+L7VtrDh591p1VQ9Jsi4ugCMwxg/f3xyZ
 J3rwDRfSD3EkNx3+aHymmwROdFC8OCC5ITTHKi3UsC/XmctzPQRFyClutWglYzBcus3l
 j0hQQoQb2Fkfp/W/o9cgmqlMUgOahrozedIJ63NgFcrgy/kKPyBb4fAaiPQEsbgPBsaw
 BPxw==
X-Gm-Message-State: APjAAAXvBT/3mXa8+P0YRSlRbxn8PkM7v44sI+6Hjb8/0Q2oEa0Yfphg
 2iqBjvu1frezdU0td6KgIMc=
X-Google-Smtp-Source: APXvYqzV0J/iN+Z3ZjQp//wFbcFoq16R/7jo5IDEJQ1qJZQ2yEyqmRyaYWXhAELsvcNTpOz04G35TA==
X-Received: by 2002:a2e:7013:: with SMTP id l19mr5665121ljc.141.1565203005035; 
 Wed, 07 Aug 2019 11:36:45 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id 189sm18400749lfa.0.2019.08.07.11.36.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:36:44 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com> <87sgqegji0.fsf@epam.com>
 <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
Date: Wed, 7 Aug 2019 21:36:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKYW4sIFZvbG9keW15ci4KCgo+PiDCoCBjLiByZS1hbGxvY2F0ZSBzdHJ1Y3Qgd2l0aCBm
bGV4aWJsZSBidWZmZXIuCj4+Cj4+IG9wdGlvbiBjLiBpcyBhYm91dCBzdHJ1Y3R1cmVzIGxpa2Ug
dGhpczoKPj4KPj4gc3RydWN0IGFycmxlbgo+PiB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90
IGxlbjsKPj4gwqDCoMKgwqDCoMKgwqDCoCBpbnQgZGF0YVsxXTsKPj4gfTsKPj4KPj4gVGhpcyBp
cyBPbGVrc2FuZHIncyBjYXNlLgo+Pgo+PiBTbyBmb3Igb3B0aW9uIGEuIHdlIGNhbiB1c2UgX3hy
ZWFsbG9jYXRlKHB0ciwgc2l6ZSwgYWxpZ24pCj4+IEZvciBvcHRpb24gYi4gd2UgY2FuIHVzZSB4
cmVhbGxvY19hcnJheShfcHRyLCBfdHlwZSwgX251bSkKPj4gQW5kIGZvciBvcHRpb24gYy4gSSBw
cm9wb3NlIHRvIGltcGxlbWVudCB0aGUgZm9sbG93aW5nIG1hY3JvOgo+Pgo+PiAjZGVmaW5lIHJl
YWxsb2NfZmxleF9zdHJ1Y3QoX3B0ciwgX3R5cGUsIF9maWVsZCwgCj4+IF9sZW4pwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgICgoX3R5cGUgKilf
eHJlYWxsb2MoX3B0ciwgb2Zmc2V0b2YoX3R5cGUsIF9maWVsZFtfbGVuXSkgLCAKPj4gX19hbGln
bm9mX18oX3R5cGUpKSkKPj4KPj4gSXQgY2FuIGJlIHVzZWQgaW4gdGhlIGZvbGxvd2luZyB3YXk6
Cj4+Cj4+IG5ld3B0ciA9IHJlYWxsb2NfZmxleF9zdHJ1Y3QocHRyLCBzdHJ1Y3QgYXJybGVuLCBu
ZXdzaXplKTsKPj4KPj4gQXMgeW91IGNhbiBzZWUsIHRoaXMgYXBwcm9hY2ggaXMgdHlwZS1zYWZl
IGFuZCBjb3ZlcnMgT2xla3NhbnJkJ3MgY2FzZS4KPgo+IFRoaXMgbG9va3MgZmluZSB0byBtZSwg
YnV0IHRoZW4gd2FudHMgdG8gYmUgYWNjb21wYW5pZWQgYnkgYQo+IHNpbWlsYXIgeG1hbGxvY19m
bGV4X3N0cnVjdCgpLCB3aGljaCBjb3VsZCBiZSB1c2VkIHJpZ2h0IGF3YXkKPiB0byByZXBsYWNl
IGEgbnVtYmVyIG9mIG9wZW4tY29kZWQgaW5zdGFuY2VzIG9mIHRoZSBhYm92ZS4KClRoYW5rIHlv
dSBWb2xvZHlteXIgZm9yIHRoZSBpZGVhLiBMb29rcyBsaWtlIHdlIGNhbiBnZXQgYSB0eXBlLXNh
ZmUgCmFwcHJvYWNoIHdoaWNoIGxvb2tzIHN1aXRhYmxlIGZvciBteSBwYXJ0aWN1bGFyIGNhc2Uu
CgpTbywgSSBuZWVkIHRvIGZvY3VzIG9uIHRoZSBwcm9wZXIgaW1wbGVtZW50YXRpb24gb2Ygbm9u
IHR5cGUtc2FmZSAKKF94cmVhbGxvYykgdmFyaWFudCBpbiB0aGUgZmlyc3QgcGxhY2UgdGFraW5n
IGludG8gdGhlIGFjY291bnQgSmFuJ3MgCmNvbW1lbnRzLiBUaGVuIEkgd2lsbCBiZSBiYWNrIHRv
IHRoZSBzdWdnZXN0ZWQgdHlwZS1zYWZlIG1hcmNvIAoocmVhbGxvY19mbGV4X3N0cnVjdCkuCgoK
Pgo+IFRoZXJlJ3Mgb25lIG1vcmUgdGhpbmcgZm9yIHRoZSByZS1hbGxvYyBjYXNlIHRob3VnaCAo
YmVzaWRlcwo+IGNvc21ldGljIGFzcGVjdHMpOiBUaGUgaW5jb21pbmcgcG9pbnRlciBzaG91bGQg
YWxzbyBiZSB2ZXJpZmllZAo+IHRvIGJlIG9mIGNvcnJlY3QgdHlwZS4KCkphbiwgaG93IHRoaXMg
Y291bGQgYmUgdGVjaG5pY2FsbHkgaW1wbGVtZW50ZWQsIG9yIGFyZSB0aGVzZSBhbnkgCmV4aXN0
aW5nIGV4YW1wbGVzIGluIFhlbj8KCgo+Cj4gSmFuCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBU
eXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
