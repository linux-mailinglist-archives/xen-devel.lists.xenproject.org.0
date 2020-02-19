Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A11643FA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:10:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4O9P-0006lt-TV; Wed, 19 Feb 2020 12:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4O9N-0006ln-Fg
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:08:21 +0000
X-Inumbo-ID: 851774d6-5310-11ea-ade5-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 851774d6-5310-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 12:08:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so253226wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 04:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDFsVpNS+V1inLvB4M04wqfCfj1Wekctgd3IvdGKGPI=;
 b=TMNwdn6ZAU3FEG2XrZy1bnjTA1yCpXgvzyu63VqE8sjkXCpvWBaFfwxApvJo1kVz8I
 CRkvYPQi6UTwsFRXQx1T4HrAnW3dPT2boLpj/bOlKYw1yr4kS6HgMbmLEdQ/N1z2krVq
 P0FSW7kGJOekJOt19w8HJbg03AxmM6JCBaAx6KgOtfFPYZcZsZgIgAx39UcyRP69ZAgY
 R+rW8zEmFq8yRXX+81ww23rhae1eDSZBQU6tw58tWemijl0AJmRySXhMcTwri0q6+D0j
 224zn8sjnffCizEXIQBX+i+iIyMdBAj34N900W37DdYt9eh9OibSs4jCWIL/KRRDHoi4
 wj8w==
X-Gm-Message-State: APjAAAVUnqKDYbc9ZuESBne9MwQYXgimD4pqj35t8vsYpiAo1CaUJrwG
 1p+PgGlS0OnRGdJC3C7jebrKU1MSqEV3dA==
X-Google-Smtp-Source: APXvYqzZIcLWJYNnHP0yDitgCuCgQBubpU6ayj8h080NolHqUCKqpXf8H91xIdDi3KWY0wXZUdaFYw==
X-Received: by 2002:adf:e692:: with SMTP id r18mr35856448wrm.413.1582114100259; 
 Wed, 19 Feb 2020 04:08:20 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id v131sm2812119wme.23.2020.02.19.04.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 04:08:19 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5d955e09-0efe-f051-d1f0-11bd5bc34250@xen.org>
Date: Wed, 19 Feb 2020 12:08:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213113237.58795-2-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAxMy8wMi8yMDIwIDExOjMyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
TW9zdCB1c2VycyBvZiB0aGUgY3B1IG1hcHMganVzdCBjYXJlIGFib3V0IHRoZSBtYXBzIG5vdCBj
aGFuZ2luZyB3aGlsZQo+IHRoZSBsb2NrIGlzIGJlaW5nIGhlbGQsIGJ1dCBkb24ndCBhY3R1YWxs
eSBtb2RpZnkgdGhlIG1hcHMuCj4gCj4gQ29udmVydCB0aGUgbG9jayBpbnRvIGEgcncgbG9jaywg
YW5kIHRha2UgdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGluCj4gZ2V0X2NwdV9tYXBzIGFuZCBpbiB3
cml0ZSBtb2RlIGluIGNwdV9ob3RwbHVnX2JlZ2luLiBUaGlzIHdpbGwgbG93ZXIKPiB0aGUgY29u
dGVudGlvbiBhcm91bmQgdGhlIGxvY2ssIHNpbmNlIHBsdWcgYW5kIHVucGx1ZyBvcGVyYXRpb25z
IHRoYXQKPiB0YWtlIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgYXJlIG5vdCB0aGF0IGNvbW1vbi4K
PiAKPiBOb3RlIHRoYXQgdGhlIHJlYWQgbG9jayBjYW4gYmUgdGFrZW4gcmVjdXJzaXZlbHkgKGFz
IGl0J3MgYSBzaGFyZWQKPiBsb2NrKSwgYW5kIGhlbmNlIHdpbGwga2VlcCB0aGUgc2FtZSBiZWhh
dmlvciBhcyB0aGUgcHJldmlvdXNseSB1c2VkCj4gcmVjdXJzaXZlIGxvY2suIEFzIGZvciB0aGUg
d3JpdGUgbG9jaywgaXQncyBvbmx5IHVzZWQgYnkgQ1BVCj4gcGx1Zy91bnBsdWcgb3BlcmF0aW9u
cywgYW5kIHRoZSBsb2NrIGlzIG5ldmVyIHRha2VuIHJlY3Vyc2l2ZWx5IGluCj4gdGhhdCBjYXNl
Lgo+IAo+IFdoaWxlIHRoZXJlIGFsc28gY2hhbmdlIGdldF9jcHVfbWFwcyByZXR1cm4gdHlwZSB0
byBib29sLgo+IAo+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+
IFN1Z2dlc3RlZC1hbHNvLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
